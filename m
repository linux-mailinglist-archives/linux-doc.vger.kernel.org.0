Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F0E0113D1
	for <lists+linux-doc@lfdr.de>; Thu,  2 May 2019 09:12:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726297AbfEBHKy (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 2 May 2019 03:10:54 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:43632 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726055AbfEBHKx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 2 May 2019 03:10:53 -0400
Received: by mail-pf1-f195.google.com with SMTP id e67so672238pfe.10;
        Thu, 02 May 2019 00:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=20I5PYxwGLsYlJSdyFGi1cZfbWK6zgDlYzj35GGoIoM=;
        b=g/imV702lIunmmQNd5wPLwl+vekJaiUpYE4GpdwqYsaGYQo3Gr/5Js1rlvKcxQ3pxL
         Z5wS53NJupM13eR+d6p0ZB/zEjlJnkK+c6d8BVQC8EFdqNP/4Q9nx+FYpd6Mj4i9kSgo
         RLWozOTILnfL2gLYXlho9HHst/TLkF/npZNrKsC2jSmNqnIZ0KNi53sRY2WybBsOUSFY
         eCN/JzCLGfCawYAqkEcqWQYBtA8SRCsmv2E7QjiHmuo5Il02s6Keuln5TCVnmfZMqZ9e
         aN99huAXrc+A4Jqu+DXwcpeQkjXvLS/yEsIZfhqalfWfUUACs+vfzYJJwFcI5GZt60qX
         OdrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=20I5PYxwGLsYlJSdyFGi1cZfbWK6zgDlYzj35GGoIoM=;
        b=p795RUBBobxpYCrmPCb1jyiPj916QBcToNdhfxal2EoAgfZlWbFQyWt2ayIDYrByRZ
         1n5eSu93pu7q6NCYv4U9T6jYHu6Lt1E6tLVZrtRHhcazRtyF3qsVDYetb9Mpa7Hf31p4
         UfrCo2Bzqj7h06YRzeL0mTZCtHmLCosOzUPkZjR5bwA1NwrXYQkUbHW3kRbMgR6Hr1M6
         jFoZ1VdNHoTcV1VbYJWYsP1PWoREEn1E2frz53jjLgstRqewWDYe/XJfBFq9q1tfCOPz
         NRB4nQuMv/KlpaWXYSAcPcw0f7rTA3kbRRu9+cI5/tCm9WJHRyov1W3Shhieo7C9MYya
         K3+A==
X-Gm-Message-State: APjAAAU91InB4LZr98yPDYhLfKmozBVmXDpHc90ZB5JhvyrEY4cQCVUI
        BK/NZDgxWNtK2BIfWmH0hns=
X-Google-Smtp-Source: APXvYqx9R9mtIIPkf1JDcqDubcs5YeV9kmtnoEXL2rY5ejwUBqd7GAl5Rv2j9xMF+jRh21MiesAkFA==
X-Received: by 2002:a62:b411:: with SMTP id h17mr2469550pfn.61.1556781052791;
        Thu, 02 May 2019 00:10:52 -0700 (PDT)
Received: from laptop.DHCP ([104.238.181.70])
        by smtp.gmail.com with ESMTPSA id u24sm4686976pfh.91.2019.05.02.00.10.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 May 2019 00:10:52 -0700 (PDT)
From:   Changbin Du <changbin.du@gmail.com>
To:     corbet@lwn.net, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de
Cc:     x86@kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Changbin Du <changbin.du@gmail.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Subject: [PATCH v2 13/27] Documentation: x86: convert intel_mpx.txt to reST
Date:   Thu,  2 May 2019 15:06:19 +0800
Message-Id: <20190502070633.9809-14-changbin.du@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190502070633.9809-1-changbin.du@gmail.com>
References: <20190502070633.9809-1-changbin.du@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This converts the plain text documentation to reStructuredText format and
add it to Sphinx TOC tree. No essential content change.

Signed-off-by: Changbin Du <changbin.du@gmail.com>
Reviewed-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/x86/index.rst                   |   1 +
 .../x86/{intel_mpx.txt => intel_mpx.rst}      | 120 ++++++++++--------
 2 files changed, 65 insertions(+), 56 deletions(-)
 rename Documentation/x86/{intel_mpx.txt => intel_mpx.rst} (75%)

diff --git a/Documentation/x86/index.rst b/Documentation/x86/index.rst
index e2c0db9fcd4e..b5cdc0d889b3 100644
--- a/Documentation/x86/index.rst
+++ b/Documentation/x86/index.rst
@@ -19,3 +19,4 @@ x86-specific Documentation
    mtrr
    pat
    protection-keys
+   intel_mpx
diff --git a/Documentation/x86/intel_mpx.txt b/Documentation/x86/intel_mpx.rst
similarity index 75%
rename from Documentation/x86/intel_mpx.txt
rename to Documentation/x86/intel_mpx.rst
index 85d0549ad846..387a640941a6 100644
--- a/Documentation/x86/intel_mpx.txt
+++ b/Documentation/x86/intel_mpx.rst
@@ -1,5 +1,11 @@
-1. Intel(R) MPX Overview
-========================
+.. SPDX-License-Identifier: GPL-2.0
+
+===========================================
+Intel(R) Memory Protection Extensions (MPX)
+===========================================
+
+Intel(R) MPX Overview
+=====================
 
 Intel(R) Memory Protection Extensions (Intel(R) MPX) is a new capability
 introduced into Intel Architecture. Intel MPX provides hardware features
@@ -7,7 +13,7 @@ that can be used in conjunction with compiler changes to check memory
 references, for those references whose compile-time normal intentions are
 usurped at runtime due to buffer overflow or underflow.
 
-You can tell if your CPU supports MPX by looking in /proc/cpuinfo:
+You can tell if your CPU supports MPX by looking in /proc/cpuinfo::
 
 	cat /proc/cpuinfo  | grep ' mpx '
 
@@ -21,8 +27,8 @@ can be downloaded from
 http://software.intel.com/en-us/articles/intel-software-development-emulator
 
 
-2. How to get the advantage of MPX
-==================================
+How to get the advantage of MPX
+===============================
 
 For MPX to work, changes are required in the kernel, binutils and compiler.
 No source changes are required for applications, just a recompile.
@@ -84,14 +90,15 @@ Kernel MPX Code:
    is unmapped.
 
 
-3. How does MPX kernel code work
-================================
+How does MPX kernel code work
+=============================
 
 Handling #BR faults caused by MPX
 ---------------------------------
 
 When MPX is enabled, there are 2 new situations that can generate
 #BR faults.
+
   * new bounds tables (BT) need to be allocated to save bounds.
   * bounds violation caused by MPX instructions.
 
@@ -124,37 +131,37 @@ the kernel. It can theoretically be done completely from userspace. Here
 are a few ways this could be done. We don't think any of them are practical
 in the real-world, but here they are.
 
-Q: Can virtual space simply be reserved for the bounds tables so that we
-   never have to allocate them?
-A: MPX-enabled application will possibly create a lot of bounds tables in
-   process address space to save bounds information. These tables can take
-   up huge swaths of memory (as much as 80% of the memory on the system)
-   even if we clean them up aggressively. In the worst-case scenario, the
-   tables can be 4x the size of the data structure being tracked. IOW, a
-   1-page structure can require 4 bounds-table pages. An X-GB virtual
-   area needs 4*X GB of virtual space, plus 2GB for the bounds directory.
-   If we were to preallocate them for the 128TB of user virtual address
-   space, we would need to reserve 512TB+2GB, which is larger than the
-   entire virtual address space today. This means they can not be reserved
-   ahead of time. Also, a single process's pre-populated bounds directory
-   consumes 2GB of virtual *AND* physical memory. IOW, it's completely
-   infeasible to prepopulate bounds directories.
-
-Q: Can we preallocate bounds table space at the same time memory is
-   allocated which might contain pointers that might eventually need
-   bounds tables?
-A: This would work if we could hook the site of each and every memory
-   allocation syscall. This can be done for small, constrained applications.
-   But, it isn't practical at a larger scale since a given app has no
-   way of controlling how all the parts of the app might allocate memory
-   (think libraries). The kernel is really the only place to intercept
-   these calls.
-
-Q: Could a bounds fault be handed to userspace and the tables allocated
-   there in a signal handler instead of in the kernel?
-A: mmap() is not on the list of safe async handler functions and even
-   if mmap() would work it still requires locking or nasty tricks to
-   keep track of the allocation state there.
+:Q: Can virtual space simply be reserved for the bounds tables so that we
+    never have to allocate them?
+:A: MPX-enabled application will possibly create a lot of bounds tables in
+    process address space to save bounds information. These tables can take
+    up huge swaths of memory (as much as 80% of the memory on the system)
+    even if we clean them up aggressively. In the worst-case scenario, the
+    tables can be 4x the size of the data structure being tracked. IOW, a
+    1-page structure can require 4 bounds-table pages. An X-GB virtual
+    area needs 4*X GB of virtual space, plus 2GB for the bounds directory.
+    If we were to preallocate them for the 128TB of user virtual address
+    space, we would need to reserve 512TB+2GB, which is larger than the
+    entire virtual address space today. This means they can not be reserved
+    ahead of time. Also, a single process's pre-populated bounds directory
+    consumes 2GB of virtual *AND* physical memory. IOW, it's completely
+    infeasible to prepopulate bounds directories.
+
+:Q: Can we preallocate bounds table space at the same time memory is
+    allocated which might contain pointers that might eventually need
+    bounds tables?
+:A: This would work if we could hook the site of each and every memory
+    allocation syscall. This can be done for small, constrained applications.
+    But, it isn't practical at a larger scale since a given app has no
+    way of controlling how all the parts of the app might allocate memory
+    (think libraries). The kernel is really the only place to intercept
+    these calls.
+
+:Q: Could a bounds fault be handed to userspace and the tables allocated
+    there in a signal handler instead of in the kernel?
+:A: mmap() is not on the list of safe async handler functions and even
+    if mmap() would work it still requires locking or nasty tricks to
+    keep track of the allocation state there.
 
 Having ruled out all of the userspace-only approaches for managing
 bounds tables that we could think of, we create them on demand in
@@ -167,20 +174,20 @@ If a #BR is generated due to a bounds violation caused by MPX.
 We need to decode MPX instructions to get violation address and
 set this address into extended struct siginfo.
 
-The _sigfault field of struct siginfo is extended as follow:
-
-87		/* SIGILL, SIGFPE, SIGSEGV, SIGBUS */
-88		struct {
-89			void __user *_addr; /* faulting insn/memory ref. */
-90 #ifdef __ARCH_SI_TRAPNO
-91			int _trapno;	/* TRAP # which caused the signal */
-92 #endif
-93			short _addr_lsb; /* LSB of the reported address */
-94			struct {
-95				void __user *_lower;
-96				void __user *_upper;
-97			} _addr_bnd;
-98		} _sigfault;
+The _sigfault field of struct siginfo is extended as follow::
+
+  87		/* SIGILL, SIGFPE, SIGSEGV, SIGBUS */
+  88		struct {
+  89			void __user *_addr; /* faulting insn/memory ref. */
+  90 #ifdef __ARCH_SI_TRAPNO
+  91			int _trapno;	/* TRAP # which caused the signal */
+  92 #endif
+  93			short _addr_lsb; /* LSB of the reported address */
+  94			struct {
+  95				void __user *_lower;
+  96				void __user *_upper;
+  97			} _addr_bnd;
+  98		} _sigfault;
 
 The '_addr' field refers to violation address, and new '_addr_and'
 field refers to the upper/lower bounds when a #BR is caused.
@@ -209,9 +216,10 @@ Adding new prctl commands
 
 Two new prctl commands are added to enable and disable MPX bounds tables
 management in kernel.
+::
 
-155	#define PR_MPX_ENABLE_MANAGEMENT	43
-156	#define PR_MPX_DISABLE_MANAGEMENT	44
+  155	#define PR_MPX_ENABLE_MANAGEMENT	43
+  156	#define PR_MPX_DISABLE_MANAGEMENT	44
 
 Runtime library in userspace is responsible for allocation of bounds
 directory. So kernel have to use XSAVE instruction to get the base
@@ -223,8 +231,8 @@ into struct mm_struct to be used in future during PR_MPX_ENABLE_MANAGEMENT
 command execution.
 
 
-4. Special rules
-================
+Special rules
+=============
 
 1) If userspace is requesting help from the kernel to do the management
 of bounds tables, it may not create or modify entries in the bounds directory.
-- 
2.20.1

