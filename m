Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEB65578B2A
	for <lists+linux-doc@lfdr.de>; Mon, 18 Jul 2022 21:48:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234557AbiGRTsA (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 18 Jul 2022 15:48:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234128AbiGRTr7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 18 Jul 2022 15:47:59 -0400
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AC5730553
        for <linux-doc@vger.kernel.org>; Mon, 18 Jul 2022 12:47:58 -0700 (PDT)
Received: by mail-io1-xd33.google.com with SMTP id z132so10194797iof.0
        for <linux-doc@vger.kernel.org>; Mon, 18 Jul 2022 12:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7rhud6KiWPK9Rg3r2XKY9MM0hek8TuHbkddrs1VaWHY=;
        b=JEZBu/b8TsxmVA1IWeJ2S+YHXd+cSF2ykNNm7BcVhpEkGUDO/3jkbfMd3lEPxr7OOE
         9cgjHpr09+4LU/TsK6/tIDa3mBJA8bgyioOjGcb18dLhwSQULEkQIKzno3EIdr3bAjcb
         nheDZFoojcLOSjGCBomHrfaqsPcfXwVpZDJrNuNiEJSgvwp9u6uRZtQCGJXcCYlzuzFr
         P3Miqjz8AWqPQnxIiRt8HWMpuxOW1y1ldtYov6prUj31mPaT6WNgPskQNRtYVHOznZ+W
         fAGyVNjPOuAYWg4rv43NJAqUnAcTkKh9HRXJMjgMbupYhtgiudaS19sU8+OUIZ9739Kx
         ZVbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7rhud6KiWPK9Rg3r2XKY9MM0hek8TuHbkddrs1VaWHY=;
        b=kfvolD/4P7M1tEQYVzxKA1BnzEPDXmRT+VysB89GLjBB0lrkF4y7EgnMtWqAABR/4W
         HKd+C+lRqc+s4YAogpVAocdz47n8GGIExOtzVly69nzRr0/qzZgkpJu5YPDMRNbu66TV
         xeQCqs82MiFzrsOcjxBwx057I2y7secFadz4D/3MYuT9+4YqwnpqKui0kb16bTt5ftDM
         mOiXQzkyZhCdLQxQMuaiXnLUv/zUaw5LQrsrODH0TstWTAbbIxSUQZRAsNgoWjakgzrm
         3R5ycRtRVyxCV62eFUspkdCcXT99wuZDb1RBraQrBC4TG+X6PXcb+4s7sHHo3/ttda8l
         XucA==
X-Gm-Message-State: AJIora/XMD0IDk/r5II2QpKOTMKz2EZ+JyCmYcB3fwfBziJQJOKcR/JQ
        xFHSgZ0Us50ZN+ZkmaU23AI=
X-Google-Smtp-Source: AGRyM1t7vVH+Nd8obrHyCHa6S1S+15c8xEdGuLbBnFGgrmoydihH7+IweMGsvfCJZ8DgBtuwHuHU0Q==
X-Received: by 2002:a05:6638:144f:b0:33f:5029:280f with SMTP id l15-20020a056638144f00b0033f5029280fmr15431612jad.60.1658173677239;
        Mon, 18 Jul 2022 12:47:57 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
        by smtp.googlemail.com with ESMTPSA id c15-20020a92d3cf000000b002dce7085ad8sm1815453ilh.0.2022.07.18.12.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 12:47:56 -0700 (PDT)
From:   Jim Cromie <jim.cromie@gmail.com>
To:     lkml@kernel.org, jbaron@akamai.com
Cc:     airlied@linux.ie, daniel@ffwll.ch, rostedt@goodmis.org,
        Jim Cromie <jim.cromie@gmail.com>, linux-doc@vger.kernel.org
Subject: [PATCH v4 19/41] doc-dyndbg: edit dynamic-debug-howto for brevity, audience
Date:   Mon, 18 Jul 2022 13:46:55 -0600
Message-Id: <20220718194717.31319-20-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220718194717.31319-1-jim.cromie@gmail.com>
References: <20220718194717.31319-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Rework/modernize docs:

 - use /proc/dynamic_debug/control in examples
   its *always* there (when dyndbg is config'd), even when <debugfs> is not.
   drop <debugfs> talk, its a distraction here.

 - read before write. Viewing before Controlling.
   control file as Catalog.

 - focus on use by a system administrator
   add an alias to make examples more readable
   drop grep-101 lessons, admins know this.

 - use init/main.c as 1st example, thread it thru doc where useful.
   everybodys kernel boots, runs these.

 - add *prdbg* api section
   to the bottom of the file, its for developers more than admins.
   move list of api functions there.

 - simplify - drop extra words, phrases, sentences.

 - add "decorator" flags line to unify "prefix", trim fmlt descriptions

CC: linux-doc@vger.kernel.org
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 .../admin-guide/dynamic-debug-howto.rst       | 238 +++++++++---------
 1 file changed, 120 insertions(+), 118 deletions(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index d8954ab05c7b..cdf1da69e43c 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -5,30 +5,19 @@ Dynamic debug
 Introduction
 ============
 
-This document describes how to use the dynamic debug (dyndbg) feature.
+Dynamic debug allows you to dynamically enable/disable kernel
+debug-print code to obtain additional kernel information.
 
-Dynamic debug is designed to allow you to dynamically enable/disable
-kernel code to obtain additional kernel information.  Currently, if
-``CONFIG_DYNAMIC_DEBUG`` is set, then all ``pr_debug()``/``dev_dbg()`` and
-``print_hex_dump_debug()``/``print_hex_dump_bytes()`` calls can be dynamically
-enabled per-callsite.
+If ``/proc/dynamic_debug/control`` exists, your kernel has dynamic debug.
+You'll need root access (sudo su) to use this.
 
-If you do not want to enable dynamic debug globally (i.e. in some embedded
-system), you may set ``CONFIG_DYNAMIC_DEBUG_CORE`` as basic support of dynamic
-debug and add ``ccflags := -DDYNAMIC_DEBUG_MODULE`` into the Makefile of any
-modules which you'd like to dynamically debug later.
-
-If ``CONFIG_DYNAMIC_DEBUG`` is not set, ``print_hex_dump_debug()`` is just
-shortcut for ``print_hex_dump(KERN_DEBUG)``.
-
-For ``print_hex_dump_debug()``/``print_hex_dump_bytes()``, format string is
-its ``prefix_str`` argument, if it is constant string; or ``hexdump``
-in case ``prefix_str`` is built dynamically.
+Dynamic debug provides:
 
-Dynamic debug has even more useful features:
+ * a Catalog of all *prdbgs* in your kernel.
+   ``cat /proc/dynamic_debug/control`` to see them.
 
- * Simple query language allows turning on and off debugging
-   statements by matching any combination of 0 or 1 of:
+ * a Simple query/command language to alter *prdbgs* by selecting on
+   any combination of 0 or 1 of:
 
    - source filename
    - function name
@@ -37,107 +26,88 @@ Dynamic debug has even more useful features:
    - format string
    - class name (as known/declared by each module)
 
- * Provides a debugfs control file: ``<debugfs>/dynamic_debug/control``
-   which can be read to display the complete list of known debug
-   statements, to help guide you
-
-Controlling dynamic debug Behaviour
-===================================
-
-The behaviour of ``pr_debug()``/``dev_dbg()`` are controlled via writing to a
-control file in the 'debugfs' filesystem. Thus, you must first mount
-the debugfs filesystem, in order to make use of this feature.
-Subsequently, we refer to the control file as:
-``<debugfs>/dynamic_debug/control``. For example, if you want to enable
-printing from source file ``svcsock.c``, line 1603 you simply do::
-
-  nullarbor:~ # echo 'file svcsock.c line 1603 +p' >
-				<debugfs>/dynamic_debug/control
-
-If you make a mistake with the syntax, the write will fail thus::
-
-  nullarbor:~ # echo 'file svcsock.c wtf 1 +p' >
-				<debugfs>/dynamic_debug/control
-  -bash: echo: write error: Invalid argument
-
-Note, for systems without 'debugfs' enabled, the control file can be
-found in ``/proc/dynamic_debug/control``.
-
 Viewing Dynamic Debug Behaviour
 ===============================
 
-You can view the currently configured behaviour of all the debug
-statements via::
+You can view the currently configured behaviour in the *prdbg* catalog:
 
-  nullarbor:~ # cat <debugfs>/dynamic_debug/control
+  :#> head -n7 /proc/dynamic_debug/control
   # filename:lineno [module]function flags format
-  net/sunrpc/svc_rdma.c:323 [svcxprt_rdma]svc_rdma_cleanup =_ "SVCRDMA Module Removed, deregister RPC RDMA transport\012"
-  net/sunrpc/svc_rdma.c:341 [svcxprt_rdma]svc_rdma_init =_ "\011max_inline       : %d\012"
-  net/sunrpc/svc_rdma.c:340 [svcxprt_rdma]svc_rdma_init =_ "\011sq_depth         : %d\012"
-  net/sunrpc/svc_rdma.c:338 [svcxprt_rdma]svc_rdma_init =_ "\011max_requests     : %d\012"
-  ...
+  init/main.c:1179 [main]initcall_blacklist =_ "blacklisting initcall %s\012
+  init/main.c:1218 [main]initcall_blacklisted =_ "initcall %s blacklisted\012"
+  init/main.c:1424 [main]run_init_process =_ "  with arguments:\012"
+  init/main.c:1426 [main]run_init_process =_ "    %s\012"
+  init/main.c:1427 [main]run_init_process =_ "  with environment:\012"
+  init/main.c:1429 [main]run_init_process =_ "    %s\012"
 
+The 3rd space-delimited column shows the current flags, preceded by
+a ``=`` for easy use with grep/cut. ``=p`` shows enabled callsites.
 
-You can also apply standard Unix text manipulation filters to this
-data, e.g.::
+Controlling dynamic debug Behaviour
+===================================
 
-  nullarbor:~ # grep -i rdma <debugfs>/dynamic_debug/control  | wc -l
-  62
+The behaviour of *prdbg* sites are controlled by writing
+query/commands to the control file.  Example::
 
-  nullarbor:~ # grep -i tcp <debugfs>/dynamic_debug/control | wc -l
-  42
+  # grease the interface
+  :#> alias ddcmd='echo $* > /proc/dynamic_debug/control'
 
-The third column shows the currently enabled flags for each debug
-statement callsite (see below for definitions of the flags).  The
-default value, with no flags enabled, is ``=_``.  So you can view all
-the debug statement callsites with any non-default flags::
+  :#> ddcmd '-p; module main func run* +p'
+  :#> grep =p /proc/dynamic_debug/control
+  init/main.c:1424 [main]run_init_process =p "  with arguments:\012"
+  init/main.c:1426 [main]run_init_process =p "    %s\012"
+  init/main.c:1427 [main]run_init_process =p "  with environment:\012"
+  init/main.c:1429 [main]run_init_process =p "    %s\012"
 
-  nullarbor:~ # awk '$3 != "=_"' <debugfs>/dynamic_debug/control
-  # filename:lineno [module]function flags format
-  net/sunrpc/svcsock.c:1603 [sunrpc]svc_send p "svc_process: st_sendto returned %d\012"
+Error messages go to console/syslog:
+
+  :#> ddcmd mode foo +p
+  dyndbg: unknown keyword "mode"
+  dyndbg: query parse failed
+  bash: echo: write error: Invalid argument
+
+If debugfs is also enabled and mounted, ``dynamic_debug/control`` is
+also under the mount-dir, typically ``/sys/kernel/debug/``.
 
 Command Language Reference
 ==========================
 
-At the lexical level, a command comprises a sequence of words separated
+At the basic lexical level, a command is a sequence of words separated
 by spaces or tabs.  So these are all equivalent::
 
-  nullarbor:~ # echo -n 'file svcsock.c line 1603 +p' >
-				<debugfs>/dynamic_debug/control
-  nullarbor:~ # echo -n '  file   svcsock.c     line  1603 +p  ' >
-				<debugfs>/dynamic_debug/control
-  nullarbor:~ # echo -n 'file svcsock.c line 1603 +p' >
-				<debugfs>/dynamic_debug/control
+  :#> ddcmd file svcsock.c line 1603 +p
+  :#> ddcmd "file svcsock.c line 1603 +p"
+  :#> ddcmd '  file   svcsock.c     line  1603 +p  '
 
 Command submissions are bounded by a write() system call.
 Multiple commands can be written together, separated by ``;`` or ``\n``::
 
-  ~# echo "func pnpacpi_get_resources +p; func pnp_assign_mem +p" \
-     > <debugfs>/dynamic_debug/control
+  :#> ddcmd "func pnpacpi_get_resources +p; func pnp_assign_mem +p"
+  :#> ddcmd <<"EOC"
+  func pnpacpi_get_resources +p
+  func pnp_assign_mem +p
+  EOC
+  :#> cat query-batch-file > /proc/dynamic_debug/control
 
-If your query set is big, you can batch them too::
+You can also use wildcards in each query term. The match rule supports
+``*`` (matches zero or more characters) and ``?`` (matches exactly one
+character). For example, you can match all usb drivers::
 
-  ~# cat query-batch-file > <debugfs>/dynamic_debug/control
+  :#> ddcmd file "drivers/usb/*" +p	# "" to suppress shell expansion
 
-Another way is to use wildcards. The match rule supports ``*`` (matches
-zero or more characters) and ``?`` (matches exactly one character). For
-example, you can match all usb drivers::
-
-  ~# echo "file drivers/usb/* +p" > <debugfs>/dynamic_debug/control
-
-At the syntactical level, a command comprises a sequence of match
-specifications, followed by a flags change specification::
+Syntactically, a command is pairs of keyword values, followed by a
+flags change or setting::
 
   command ::= match-spec* flags-spec
 
-The match-spec's are used to choose a subset of the known pr_debug()
-callsites to which to apply the flags-spec.  Think of them as a query
-with implicit ANDs between each pair.  Note that an empty list of
-match-specs will select all debug statement callsites.
+The match-spec's select *prdbgs* from the catalog, upon which to apply
+the flags-spec, all constraints are ANDed together.  An absent keyword
+is the same as keyword "*".
+
 
-A match specification comprises a keyword, which controls the
-attribute of the callsite to be compared, and a value to compare
-against.  Possible keywords are:::
+A match specification is a keyword, which selects the attribute of
+the callsite to be compared, and a value to compare against.  Possible
+keywords are:::
 
   match-spec ::= 'func' string |
 		 'file' string |
@@ -213,6 +183,7 @@ class
 
 	class DRM_UT_KMS	# a DRM.debug category
 	class JUNK		# silent non-match
+	// class TLD_*		# NOTICE: no wildcard in class names
 
 line
     The given line number or range of line numbers is compared
@@ -239,17 +210,16 @@ of the characters::
 The flags are::
 
   p    enables the pr_debug() callsite.
-  f    Include the function name in the printed message
-  l    Include line number in the printed message
-  m    Include module name in the printed message
-  t    Include thread ID in messages not generated from interrupt context
-  _    No flags are set. (Or'd with others on input)
+  _    enables no flags.
 
-For ``print_hex_dump_debug()`` and ``print_hex_dump_bytes()``, only ``p`` flag
-have meaning, other flags ignored.
+  Decorator flags add to the message-prefix, in order:
+  t    Include thread ID, or <intr>
+  m    Include module name
+  f    Include the function name
+  l    Include line number
 
-For display, the flags are preceded by ``=``
-(mnemonic: what the flags are currently equal to).
+For ``print_hex_dump_debug()`` and ``print_hex_dump_bytes()``, only
+the ``p`` flag has meaning, other flags are ignored.
 
 Note the regexp ``^[-+=][flmpt_]+$`` matches a flags specification.
 To clear all flags at once, use ``=_`` or ``-flmpt``.
@@ -324,7 +294,7 @@ For ``CONFIG_DYNAMIC_DEBUG`` kernels, any settings given at boot-time (or
 enabled by ``-DDEBUG`` flag during compilation) can be disabled later via
 the debugfs interface if the debug messages are no longer needed::
 
-   echo "module module_name -p" > <debugfs>/dynamic_debug/control
+   echo "module module_name -p" > /proc/dynamic_debug/control
 
 Examples
 ========
@@ -332,37 +302,31 @@ Examples
 ::
 
   // enable the message at line 1603 of file svcsock.c
-  nullarbor:~ # echo -n 'file svcsock.c line 1603 +p' >
-				<debugfs>/dynamic_debug/control
+  :#> ddcmd 'file svcsock.c line 1603 +p'
 
   // enable all the messages in file svcsock.c
-  nullarbor:~ # echo -n 'file svcsock.c +p' >
-				<debugfs>/dynamic_debug/control
+  :#> ddcmd 'file svcsock.c +p'
 
   // enable all the messages in the NFS server module
-  nullarbor:~ # echo -n 'module nfsd +p' >
-				<debugfs>/dynamic_debug/control
+  :#> ddcmd 'module nfsd +p'
 
   // enable all 12 messages in the function svc_process()
-  nullarbor:~ # echo -n 'func svc_process +p' >
-				<debugfs>/dynamic_debug/control
+  :#> ddcmd 'func svc_process +p'
 
   // disable all 12 messages in the function svc_process()
-  nullarbor:~ # echo -n 'func svc_process -p' >
-				<debugfs>/dynamic_debug/control
+  :#> ddcmd 'func svc_process -p'
 
   // enable messages for NFS calls READ, READLINK, READDIR and READDIR+.
-  nullarbor:~ # echo -n 'format "nfsd: READ" +p' >
-				<debugfs>/dynamic_debug/control
+  :#> ddcmd 'format "nfsd: READ" +p'
 
   // enable messages in files of which the paths include string "usb"
-  nullarbor:~ # echo -n 'file *usb* +p' > <debugfs>/dynamic_debug/control
+  :#> ddcmd 'file *usb* +p' > /proc/dynamic_debug/control
 
   // enable all messages
-  nullarbor:~ # echo -n '+p' > <debugfs>/dynamic_debug/control
+  :#> ddcmd '+p' > /proc/dynamic_debug/control
 
   // add module, function to all enabled messages
-  nullarbor:~ # echo -n '+mf' > <debugfs>/dynamic_debug/control
+  :#> ddcmd '+mf' > /proc/dynamic_debug/control
 
   // boot-args example, with newlines and comments for readability
   Kernel command line: ...
@@ -375,3 +339,41 @@ Examples
     dyndbg="file init/* +p #cmt ; func parse_one +p"
     // enable pr_debugs in 2 functions in a module loaded later
     pc87360.dyndbg="func pc87360_init_device +p; func pc87360_find +p"
+
+Kernel Configuration
+====================
+
+Dynamic Debug is enabled via kernel config items:
+
+  CONFIG_DYNAMIC_DEBUG=y	# build catalog, enables CORE
+  CONFIG_DYNAMIC_DEBUG_CORE=y	# enable mechanics only, skip catalog
+
+Fedora's distro-kernel has both, and has 7250 *prdbgs*.  Each callsite
+record uses 56 bytes, so the impact on memory is non-trivial.
+
+If you do not want to enable dynamic debug globally (i.e. in some embedded
+system), you may set ``CONFIG_DYNAMIC_DEBUG_CORE`` as basic support of dynamic
+debug and add ``ccflags := -DDYNAMIC_DEBUG_MODULE`` into the Makefile of any
+modules which you'd like to dynamically debug later.
+
+
+Kernel *prdbg* API
+==================
+
+The following functions are cataloged and controllable when dynamic
+debug is enabled::
+
+  pr_debug()
+  dev_dbg()
+  print_hex_dump_debug()
+  print_hex_dump_bytes()
+
+Otherwise, they are off by default; ``ccflags += -DDEBUG`` or
+``#define DEBUG`` in a source file will enable them appropriately.
+
+If ``CONFIG_DYNAMIC_DEBUG`` is not set, ``print_hex_dump_debug()`` is
+just a shortcut for ``print_hex_dump(KERN_DEBUG)``.
+
+For ``print_hex_dump_debug()``/``print_hex_dump_bytes()``, format string is
+its ``prefix_str`` argument, if it is constant string; or ``hexdump``
+in case ``prefix_str`` is built dynamically.
-- 
2.36.1

