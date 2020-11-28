Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6874E2C750E
	for <lists+linux-doc@lfdr.de>; Sat, 28 Nov 2020 23:23:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388099AbgK1Vt2 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 28 Nov 2020 16:49:28 -0500
Received: from condef-05.nifty.com ([202.248.20.70]:61056 "EHLO
        condef-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731315AbgK1SEH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 28 Nov 2020 13:04:07 -0500
Received: from conuserg-07.nifty.com ([10.126.8.70])by condef-05.nifty.com with ESMTP id 0ASBqZ45018999;
        Sat, 28 Nov 2020 20:52:35 +0900
Received: from grover.flets-west.jp (softbank126090211135.bbtec.net [126.90.211.135]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 0ASBpD6F027804;
        Sat, 28 Nov 2020 20:51:18 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 0ASBpD6F027804
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1606564278;
        bh=XyszwlfQ3hvNfVNGL6RnB28DMsdpvA6WSiiDWams/Co=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bBlIUNiIm7lTudPcHNSRotKD8Aj8uAV7rzjaW8mbgWPuGWiFyTn58IbdE5yCIROcd
         Gqvvo7gpdv4GQJKzWTWLzSK/unYxCtBc+eZ05OM4fTBudZ9FiEW0BszvgD6Sj+2XiI
         T1euA+eFXHQOdOvdoovw41f3SY1qs2pgW5Fq8HU75M6+WFmEymB3E8I2moDCE0ggey
         KquEwpTdu3zqDL2ApRCaS8HTEwrhBCeWVMsXXwywJRFBJdgRD8wju6jRqKgNUhy4ab
         AuEYAN0aib8fZgnDP9GVMalL9Zo0mCkgRGruveNkGn3Lf6aMhCVlIb+7Vuy5tbxFfP
         2afeKU0+KrZNA==
X-Nifty-SrcIP: [126.90.211.135]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/7] kbuild: doc: clarify the difference between extra-y and always-y
Date:   Sat, 28 Nov 2020 20:51:07 +0900
Message-Id: <20201128115108.179256-6-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201128115108.179256-1-masahiroy@kernel.org>
References: <20201128115108.179256-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The difference between extra-y and always-y is obscure.

Basically, Kbuild builds targets listed in extra-y and always-y in
visited Makefiles without relying on any dependency.

The difference is that extra-y is used to list the targets needed for
vmlinux whereas always-y is used to list the targets that must be always
built irrespective of final targets.

Kbuild skips extra-y when it is building only modules (i.e.
'make modules'). This is the long-standing behavior since extra-y was
introduced in 2003, and it is explained in that commit log [1].

For clarification, this is the extra-y vs always-y table:

                  extra-y    always-y
  'make'             y          y
  'make vmlinux'     y          y
  'make modules'     n          y

Kbuild skips extra-y also when building external modules since obviously
it never builds vmlinux.

Unfortunately, extra-y is wrongly used in many places of upstream code,
and even in external modules.

Using extra-y in external module Makefiles is wrong. What you should
use is probably always-y or 'targets'.

The current documentation for extra-y is misleading. I rewrote it, and
moved it to the section 3.7.

always-y is not documented anywhere. I added.

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/history/history.git/commit/?id=f94e5fd7e5d09a56a60670a9bb211a791654bba8

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
---

Changes in v2:
  - Use y/n instead of o/x
  - Fix a typo

 Documentation/kbuild/makefiles.rst | 110 +++++++++++++++++++----------
 1 file changed, 71 insertions(+), 39 deletions(-)

diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
index 1dde4a096226..4fd6b327a19f 100644
--- a/Documentation/kbuild/makefiles.rst
+++ b/Documentation/kbuild/makefiles.rst
@@ -15,13 +15,15 @@ This document describes the Linux kernel Makefiles.
 	   --- 3.4 Objects which export symbols
 	   --- 3.5 Library file goals - lib-y
 	   --- 3.6 Descending down in directories
-	   --- 3.7 Compilation flags
-	   --- 3.8 Dependency tracking
-	   --- 3.9 Custom Rules
-	   --- 3.10 Command change detection
-	   --- 3.11 $(CC) support functions
-	   --- 3.12 $(LD) support functions
-	   --- 3.13 Script Invocation
+	   --- 3.7 Non-builtin vmlinux targets - extra-y
+	   --- 3.8 Always built goals - always-y
+	   --- 3.9 Compilation flags
+	   --- 3.10 Dependency tracking
+	   --- 3.11 Custom Rules
+	   --- 3.12 Command change detection
+	   --- 3.13 $(CC) support functions
+	   --- 3.14 $(LD) support functions
+	   --- 3.15 Script Invocation
 
 	=== 4 Host Program support
 	   --- 4.1 Simple Host Program
@@ -321,7 +323,60 @@ more details, with real examples.
 	names. This allows kbuild to totally skip the directory if the
 	corresponding `CONFIG_` option is neither 'y' nor 'm'.
 
-3.7 Compilation flags
+3.7 Non-builtin vmlinux targets - extra-y
+-----------------------------------------
+
+	extra-y specifies targets which are needed for building vmlinux,
+	but not combined into built-in.a.
+
+	Examples are:
+
+	1) head objects
+
+	    Some objects must be placed at the head of vmlinux. They are
+	    directly linked to vmlinux without going through built-in.a
+	    A typical use-case is an object that contains the entry point.
+
+	    arch/$(SRCARCH)/Makefile should specify such objects as head-y.
+
+	    Discussion:
+	      Given that we can control the section order in the linker script,
+	      why do we need head-y?
+
+	2) vmlinux linker script
+
+	    The linker script for vmlinux is located at
+	    arch/$(SRCARCH)/kernel/vmlinux.lds
+
+	Example::
+
+		# arch/x86/kernel/Makefile
+		extra-y	:= head_$(BITS).o
+		extra-y	+= head$(BITS).o
+		extra-y	+= ebda.o
+		extra-y	+= platform-quirks.o
+		extra-y	+= vmlinux.lds
+
+	$(extra-y) should only contain targets needed for vmlinux.
+
+	Kbuild skips extra-y when vmlinux is apparently not a final goal.
+	(e.g. 'make modules', or building external modules)
+
+	If you intend to build targets unconditionally, always-y (explained
+	in the next section) is the correct syntax to use.
+
+3.8 Always built goals - always-y
+---------------------------------
+
+	always-y specifies targets which are literally always built when
+	Kbuild visits the Makefile.
+
+	Example::
+	  # ./Kbuild
+	  offsets-file := include/generated/asm-offsets.h
+	  always-y += $(offsets-file)
+
+3.9 Compilation flags
 ---------------------
 
     ccflags-y, asflags-y and ldflags-y
@@ -410,8 +465,8 @@ more details, with real examples.
 		AFLAGS_iwmmxt.o      := -Wa,-mcpu=iwmmxt
 
 
-3.8 Dependency tracking
------------------------
+3.10 Dependency tracking
+------------------------
 
 	Kbuild tracks dependencies on the following:
 
@@ -422,8 +477,8 @@ more details, with real examples.
 	Thus, if you change an option to $(CC) all affected files will
 	be re-compiled.
 
-3.9 Custom Rules
-----------------
+3.11 Custom Rules
+-----------------
 
 	Custom rules are used when the kbuild infrastructure does
 	not provide the required support. A typical example is
@@ -499,7 +554,7 @@ more details, with real examples.
 
 	will be displayed with "make KBUILD_VERBOSE=0".
 
-3.10 Command change detection
+3.12 Command change detection
 -----------------------------
 
 	When the rule is evaluated, timestamps are compared between the target
@@ -545,7 +600,7 @@ more details, with real examples.
 		unwanted results when the target is up to date and only the
 		tests on changed commands trigger execution of commands.
 
-3.11 $(CC) support functions
+3.13 $(CC) support functions
 ----------------------------
 
 	The kernel may be built with several different versions of
@@ -660,7 +715,7 @@ more details, with real examples.
 			endif
 		endif
 
-3.12 $(LD) support functions
+3.14 $(LD) support functions
 ----------------------------
 
     ld-option
@@ -674,7 +729,7 @@ more details, with real examples.
 		#Makefile
 		LDFLAGS_vmlinux += $(call ld-option, -X)
 
-3.13 Script invocation
+3.15 Script invocation
 ----------------------
 
 	Make rules may invoke scripts to build the kernel. The rules shall
@@ -1304,29 +1359,6 @@ When kbuild executes, the following steps are followed (roughly):
 
 	When "make" is executed without arguments, bzImage will be built.
 
-7.6 Building non-kbuild targets
--------------------------------
-
-    extra-y
-	extra-y specifies additional targets created in the current
-	directory, in addition to any targets specified by `obj-*`.
-
-	Listing all targets in extra-y is required for two purposes:
-
-	1) Enable kbuild to check changes in command lines
-
-	   - When $(call if_changed,xxx) is used
-
-	2) kbuild knows what files to delete during "make clean"
-
-	Example::
-
-		#arch/x86/kernel/Makefile
-		extra-y := head.o init_task.o
-
-	In this example, extra-y is used to list object files that
-	shall be built, but shall not be linked as part of built-in.a.
-
 7.7 Commands useful for building a boot image
 ---------------------------------------------
 
-- 
2.27.0

