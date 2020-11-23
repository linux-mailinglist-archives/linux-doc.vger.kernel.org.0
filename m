Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98FE02BFF31
	for <lists+linux-doc@lfdr.de>; Mon, 23 Nov 2020 05:55:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726921AbgKWEzW (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 22 Nov 2020 23:55:22 -0500
Received: from conuserg-08.nifty.com ([210.131.2.75]:27323 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726932AbgKWEzW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 22 Nov 2020 23:55:22 -0500
Received: from grover.flets-west.jp (softbank126090211135.bbtec.net [126.90.211.135]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id 0AN4sGHe016676;
        Mon, 23 Nov 2020 13:54:17 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 0AN4sGHe016676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1606107258;
        bh=gmymTY8KhGb9eBSOX2oCnJvdA/j6bzHY2nSbUJ/4dvg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UL3I2wxdEkRRKrCrQ7vO4TljoOMiqb3xqC0VBAXnMNNDhAL05nTQCf6xiIbNc5bwo
         nZMn5ZsLBPnWeDUWxQ7MXqm+iD3RP3g4xN9pa+9wwGVgeu7Sc5wPlYlUNq3T1yXdgI
         iWsKByqb3BnGQkyxDWo5kKiKbp1oCrh7CISP0idhTCn58CNuVSiDGuR/6Jc6WOOPhz
         m0nh1RK3Rk6XRxwo7GkpMPG8Y2BEa2gBU8sJ1Lr4RSKG8gmL7nu2KW35POkpT0sPZV
         wBpAE6CHgkp9L3xxGOHeTq+9SLsjn9C2GGLAKE2+Qst9O0aV4NqVyZMWKqRJ+7aIL+
         aQ357dRQBKk/Q==
X-Nifty-SrcIP: [126.90.211.135]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/7] kbuild: doc: replace arch/$(ARCH)/ with arch/$(SRCARCH)/
Date:   Mon, 23 Nov 2020 13:53:58 +0900
Message-Id: <20201123045403.63402-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201123045403.63402-1-masahiroy@kernel.org>
References: <20201123045403.63402-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Precisely speaking, the arch directory is specified by $(SRCARCH),
not $(ARCH).

In old days, $(ARCH) actually matched to the arch directory because
32-bit and 64-bit were supported as separate architectures.

Most architectures (except arm/arm64) were unified like follows:

    arch/i386, arch/x86_64    ->  arch/x86
    arch/sh, arch/sh64        ->  arch/sh
    arch/sparc, arch/sparc64  ->  arch/sparc

To not break the user interface, commit 6752ed90da03 ("Kbuild: allow
arch/xxx to use a different source path") introduced SRCARCH to point
to the arch directory, still allowing to pass in the former ARCH=i386
or ARCH=x86_64.

Update the documents for preciseness, and add the explanation of SRCARCH.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Documentation/kbuild/makefiles.rst | 61 +++++++++++++++++-------------
 Documentation/kbuild/modules.rst   |  2 +-
 2 files changed, 35 insertions(+), 28 deletions(-)

diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
index a7b874097a91..2a5232b321af 100644
--- a/Documentation/kbuild/makefiles.rst
+++ b/Documentation/kbuild/makefiles.rst
@@ -67,11 +67,11 @@ This document describes the Linux kernel Makefiles.
 
 The Makefiles have five parts::
 
-	Makefile		the top Makefile.
-	.config			the kernel configuration file.
-	arch/$(ARCH)/Makefile	the arch Makefile.
-	scripts/Makefile.*	common rules etc. for all kbuild Makefiles.
-	kbuild Makefiles	exist in every subdirectory
+	Makefile                    the top Makefile.
+	.config                     the kernel configuration file.
+	arch/$(SRCARCH)/Makefile    the arch Makefile.
+	scripts/Makefile.*          common rules etc. for all kbuild Makefiles.
+	kbuild Makefiles            exist in every subdirectory
 
 The top Makefile reads the .config file, which comes from the kernel
 configuration process.
@@ -82,7 +82,7 @@ It builds these goals by recursively descending into the subdirectories of
 the kernel source tree.
 The list of subdirectories which are visited depends upon the kernel
 configuration. The top Makefile textually includes an arch Makefile
-with the name arch/$(ARCH)/Makefile. The arch Makefile supplies
+with the name arch/$(SRCARCH)/Makefile. The arch Makefile supplies
 architecture-specific information to the top Makefile.
 
 Each subdirectory has a kbuild Makefile which carries out the commands
@@ -933,7 +933,7 @@ When "make clean" is executed, make will descend down in arch/x86/boot,
 and clean as usual. The Makefile located in arch/x86/boot/ may use
 the subdir- trick to descend further down.
 
-Note 1: arch/$(ARCH)/Makefile cannot use "subdir-", because that file is
+Note 1: arch/$(SRCARCH)/Makefile cannot use "subdir-", because that file is
 included in the top level makefile, and the kbuild infrastructure
 is not operational at that point.
 
@@ -946,9 +946,9 @@ be visited during "make clean".
 The top level Makefile sets up the environment and does the preparation,
 before starting to descend down in the individual directories.
 The top level makefile contains the generic part, whereas
-arch/$(ARCH)/Makefile contains what is required to set up kbuild
+arch/$(SRCARCH)/Makefile contains what is required to set up kbuild
 for said architecture.
-To do so, arch/$(ARCH)/Makefile sets up a number of variables and defines
+To do so, arch/$(SRCARCH)/Makefile sets up a number of variables and defines
 a few targets.
 
 When kbuild executes, the following steps are followed (roughly):
@@ -956,14 +956,14 @@ When kbuild executes, the following steps are followed (roughly):
 1) Configuration of the kernel => produce .config
 2) Store kernel version in include/linux/version.h
 3) Updating all other prerequisites to the target prepare:
-   - Additional prerequisites are specified in arch/$(ARCH)/Makefile
+   - Additional prerequisites are specified in arch/$(SRCARCH)/Makefile
 4) Recursively descend down in all directories listed in
    init-* core* drivers-* net-* libs-* and build all targets.
-   - The values of the above variables are expanded in arch/$(ARCH)/Makefile.
+   - The values of the above variables are expanded in arch/$(SRCARCH)/Makefile.
 5) All object files are then linked and the resulting file vmlinux is
    located at the root of the obj tree.
    The very first objects linked are listed in head-y, assigned by
-   arch/$(ARCH)/Makefile.
+   arch/$(SRCARCH)/Makefile.
 6) Finally, the architecture-specific part does any required post processing
    and builds the final bootimage.
    - This includes building boot records
@@ -1169,7 +1169,7 @@ When kbuild executes, the following steps are followed (roughly):
 		$(core-y), $(libs-y), $(drivers-y) and $(net-y).
 
 	    The top level Makefile defines values for all generic directories,
-	    and arch/$(ARCH)/Makefile only adds architecture-specific
+	    and arch/$(SRCARCH)/Makefile only adds architecture-specific
 	    directories.
 
 	    Example::
@@ -1189,15 +1189,15 @@ When kbuild executes, the following steps are followed (roughly):
 	The actual goals are not standardized across architectures.
 
 	It is common to locate any additional processing in a boot/
-	directory below arch/$(ARCH)/.
+	directory below arch/$(SRCARCH)/.
 
 	Kbuild does not provide any smart way to support building a
-	target specified in boot/. Therefore arch/$(ARCH)/Makefile shall
+	target specified in boot/. Therefore arch/$(SRCARCH)/Makefile shall
 	call make manually to build a target in boot/.
 
 	The recommended approach is to include shortcuts in
-	arch/$(ARCH)/Makefile, and use the full path when calling down
-	into the arch/$(ARCH)/boot/Makefile.
+	arch/$(SRCARCH)/Makefile, and use the full path when calling down
+	into the arch/$(SRCARCH)/boot/Makefile.
 
 	Example::
 
@@ -1217,7 +1217,7 @@ When kbuild executes, the following steps are followed (roughly):
 
 		#arch/x86/Makefile
 		define archhelp
-		  echo  '* bzImage      - Image (arch/$(ARCH)/boot/bzImage)'
+		  echo  '* bzImage      - Compressed kernel image (arch/x86/boot/bzImage)'
 		endif
 
 	When make is executed without arguments, the first goal encountered
@@ -1332,7 +1332,7 @@ When kbuild executes, the following steps are followed (roughly):
 
     objcopy
 	Copy binary. Uses OBJCOPYFLAGS usually specified in
-	arch/$(ARCH)/Makefile.
+	arch/$(SRCARCH)/Makefile.
 	OBJCOPYFLAGS_$@ may be used to set additional options.
 
     gzip
@@ -1395,7 +1395,7 @@ When kbuild executes, the following steps are followed (roughly):
 --------------------------------
 
 	When the vmlinux image is built, the linker script
-	arch/$(ARCH)/kernel/vmlinux.lds is used.
+	arch/$(SRCARCH)/kernel/vmlinux.lds is used.
 	The script is a preprocessed variant of the file vmlinux.lds.S
 	located in the same directory.
 	kbuild knows .lds files and includes a rule `*lds.S` -> `*lds`.
@@ -1405,9 +1405,6 @@ When kbuild executes, the following steps are followed (roughly):
 		#arch/x86/kernel/Makefile
 		extra-y := vmlinux.lds
 
-		#Makefile
-		export CPPFLAGS_vmlinux.lds += -P -C -U$(ARCH)
-
 	The assignment to extra-y is used to tell kbuild to build the
 	target vmlinux.lds.
 	The assignment to $(CPPFLAGS_vmlinux.lds) tells kbuild to use the
@@ -1481,7 +1478,7 @@ See subsequent chapter for the syntax of the Kbuild file.
 
 	If an architecture uses a verbatim copy of a header from
 	include/asm-generic then this is listed in the file
-	arch/$(ARCH)/include/asm/Kbuild like this:
+	arch/$(SRCARCH)/include/asm/Kbuild like this:
 
 		Example::
 
@@ -1492,7 +1489,7 @@ See subsequent chapter for the syntax of the Kbuild file.
 	During the prepare phase of the build a wrapper include
 	file is generated in the directory::
 
-		arch/$(ARCH)/include/generated/asm
+		arch/$(SRCARCH)/include/generated/asm
 
 	When a header is exported where the architecture uses
 	the generic header a similar wrapper is generated as part
@@ -1527,8 +1524,8 @@ See subsequent chapter for the syntax of the Kbuild file.
 	to define the minimum set of ASM headers that all architectures must have.
 
 	This works like optional generic-y. If a mandatory header is missing
-	in arch/$(ARCH)/include/(uapi/)/asm, Kbuild will automatically generate
-	a wrapper of the asm-generic one.
+	in arch/$(SRCARCH)/include/(uapi/)/asm, Kbuild will automatically
+	generate a wrapper of the asm-generic one.
 
 9 Kbuild Variables
 ==================
@@ -1564,6 +1561,16 @@ The top Makefile exports the following variables:
 
 	    make ARCH=m68k ...
 
+    SRCARCH
+	This variable speficifies the directory in arch/ to build.
+
+	ARCH and SRCARCH may not necessarily match. A couple of arch
+	directories are biarch, that is, a single arch/*/ directory supports
+	both 32-bit and 64-bit.
+
+	For example, you can pass in ARCH=i386, ARCH=x86_64, or ARCH=x86.
+	For all of them, SRCARCH=x86 because arch/x86/ supports	both i386 and
+	x86_64.
 
     INSTALL_PATH
 	This variable defines a place for the arch Makefiles to install
diff --git a/Documentation/kbuild/modules.rst b/Documentation/kbuild/modules.rst
index 85ccc878895e..a1f3eb7a43e2 100644
--- a/Documentation/kbuild/modules.rst
+++ b/Documentation/kbuild/modules.rst
@@ -332,7 +332,7 @@ according to the following rule:
 	      There are two notable exceptions to this rule: larger
 	      subsystems have their own directory under include/, such as
 	      include/scsi; and architecture specific headers are located
-	      under arch/$(ARCH)/include/.
+	      under arch/$(SRCARCH)/include/.
 
 4.1 Kernel Includes
 -------------------
-- 
2.25.1

