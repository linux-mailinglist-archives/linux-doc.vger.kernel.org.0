Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D5D4334A6B
	for <lists+linux-doc@lfdr.de>; Wed, 10 Mar 2021 23:04:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233837AbhCJWBk (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 10 Mar 2021 17:01:40 -0500
Received: from mga04.intel.com ([192.55.52.120]:4728 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233615AbhCJWBN (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 10 Mar 2021 17:01:13 -0500
IronPort-SDR: 9rU3tMrr/8zZb/g9iJSpeFPmDEww5Cw6DG5fa+K0fjeoRSmrfzlDk9yN+rIJWUD5aOyVmcVlVl
 uUYRZp15Q+/g==
X-IronPort-AV: E=McAfee;i="6000,8403,9919"; a="186193107"
X-IronPort-AV: E=Sophos;i="5.81,238,1610438400"; 
   d="scan'208";a="186193107"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2021 14:01:13 -0800
IronPort-SDR: wic0vLGBRReWyCOfcJylyJZ9tYqpZTERU9U34wyraBWe6yWaYq10WVHi644Cr1Yt082bca9los
 AFEUZde2q3Ug==
X-IronPort-AV: E=Sophos;i="5.81,238,1610438400"; 
   d="scan'208";a="403847576"
Received: from yyu32-desk.sc.intel.com ([143.183.136.146])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2021 14:01:12 -0800
From:   Yu-cheng Yu <yu-cheng.yu@intel.com>
To:     x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-mm@kvack.org,
        linux-arch@vger.kernel.org, linux-api@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>,
        Andy Lutomirski <luto@kernel.org>,
        Balbir Singh <bsingharora@gmail.com>,
        Borislav Petkov <bp@alien8.de>,
        Cyrill Gorcunov <gorcunov@gmail.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Eugene Syromiatnikov <esyr@redhat.com>,
        Florian Weimer <fweimer@redhat.com>,
        "H.J. Lu" <hjl.tools@gmail.com>, Jann Horn <jannh@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Nadav Amit <nadav.amit@gmail.com>,
        Oleg Nesterov <oleg@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        Peter Zijlstra <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
        Vedvyas Shanbhogue <vedvyas.shanbhogue@intel.com>,
        Dave Martin <Dave.Martin@arm.com>,
        Weijiang Yang <weijiang.yang@intel.com>,
        Pengfei Xu <pengfei.xu@intel.com>,
        Haitao Huang <haitao.huang@intel.com>
Cc:     Yu-cheng Yu <yu-cheng.yu@intel.com>
Subject: [PATCH v22 01/28] Documentation/x86: Add CET description
Date:   Wed, 10 Mar 2021 14:00:19 -0800
Message-Id: <20210310220046.15866-2-yu-cheng.yu@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210310220046.15866-1-yu-cheng.yu@intel.com>
References: <20210310220046.15866-1-yu-cheng.yu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Explain no_user_shstk/no_user_ibt kernel parameters, and introduce a new
document on Control-flow Enforcement Technology (CET).

Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>
Reviewed-by: Kees Cook <keescook@chromium.org>
---
 .../admin-guide/kernel-parameters.txt         |   6 +
 Documentation/x86/index.rst                   |   1 +
 Documentation/x86/intel_cet.rst               | 136 ++++++++++++++++++
 3 files changed, 143 insertions(+)
 create mode 100644 Documentation/x86/intel_cet.rst

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 04545725f187..bc79e54be91e 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3220,6 +3220,12 @@
 			noexec=on: enable non-executable mappings (default)
 			noexec=off: disable non-executable mappings
 
+	no_user_shstk	[X86-64] Disable Shadow Stack for user-mode
+			applications
+
+	no_user_ibt	[X86-64] Disable Indirect Branch Tracking for user-mode
+			applications
+
 	nosmap		[X86,PPC]
 			Disable SMAP (Supervisor Mode Access Prevention)
 			even if it is supported by processor.
diff --git a/Documentation/x86/index.rst b/Documentation/x86/index.rst
index 4693e192b447..cf5250a3cc70 100644
--- a/Documentation/x86/index.rst
+++ b/Documentation/x86/index.rst
@@ -21,6 +21,7 @@ x86-specific Documentation
    tlb
    mtrr
    pat
+   intel_cet
    intel-iommu
    intel_txt
    amd-memory-encryption
diff --git a/Documentation/x86/intel_cet.rst b/Documentation/x86/intel_cet.rst
new file mode 100644
index 000000000000..93aa289e4439
--- /dev/null
+++ b/Documentation/x86/intel_cet.rst
@@ -0,0 +1,136 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=========================================
+Control-flow Enforcement Technology (CET)
+=========================================
+
+[1] Overview
+============
+
+Control-flow Enforcement Technology (CET) is an Intel processor feature
+that provides protection against return/jump-oriented programming (ROP)
+attacks.  It can be set up to protect both applications and the kernel.
+Only user-mode protection is implemented in the 64-bit kernel, including
+support for running legacy 32-bit applications.
+
+CET introduces Shadow Stack and Indirect Branch Tracking.  Shadow stack is
+a secondary stack allocated from memory and cannot be directly modified by
+applications.  When executing a CALL instruction, the processor pushes the
+return address to both the normal stack and the shadow stack.  Upon
+function return, the processor pops the shadow stack copy and compares it
+to the normal stack copy.  If the two differ, the processor raises a
+control-protection fault.  Indirect branch tracking verifies indirect
+CALL/JMP targets are intended as marked by the compiler with 'ENDBR'
+opcodes.
+
+There is a Kconfig option:
+
+    X86_CET.
+
+To build a CET-enabled kernel, Binutils v2.31 and GCC v8.1 or LLVM v10.0.1
+or later are required.  To build a CET-enabled application, GLIBC v2.28 or
+later is also required.
+
+There are two command-line options for disabling CET features::
+
+    no_user_shstk - disables user shadow stack, and
+    no_user_ibt   - disables user indirect branch tracking.
+
+At run time, /proc/cpuinfo shows CET features if the processor supports
+CET.
+
+[2] Application Enabling
+========================
+
+An application's CET capability is marked in its ELF header and can be
+verified from readelf/llvm-readelf output:
+
+    readelf -n <application> | grep -a SHSTK
+        properties: x86 feature: IBT, SHSTK
+
+If an application supports CET and is statically linked, it will run with
+CET protection.  If the application needs any shared libraries, the loader
+checks all dependencies and enables CET when all requirements are met.
+
+[3] Backward Compatibility
+==========================
+
+GLIBC provides a few CET tunables via the GLIBC_TUNABLES environment
+variable:
+
+GLIBC_TUNABLES=glibc.tune.hwcaps=-SHSTK,-IBT
+    Turn off SHSTK/IBT.
+
+GLIBC_TUNABLES=glibc.tune.x86_shstk=<on, permissive>
+    This controls how dlopen() handles SHSTK legacy libraries::
+
+        on         - continue with SHSTK enabled;
+        permissive - continue with SHSTK off.
+
+Details can be found in the GLIBC manual pages.
+
+[4] CET arch_prctl()'s
+======================
+
+Several arch_prctl()'s have been added for CET:
+
+arch_prctl(ARCH_X86_CET_STATUS, u64 *addr)
+    Return CET feature status.
+
+    The parameter 'addr' is a pointer to a user buffer.
+    On returning to the caller, the kernel fills the following
+    information::
+
+        *addr       = shadow stack/indirect branch tracking status
+        *(addr + 1) = shadow stack base address
+        *(addr + 2) = shadow stack size
+
+arch_prctl(ARCH_X86_CET_DISABLE, unsigned int features)
+    Disable shadow stack and/or indirect branch tracking as specified in
+    'features'.  Return -EPERM if CET is locked.
+
+arch_prctl(ARCH_X86_CET_LOCK)
+    Lock in all CET features.  They cannot be turned off afterwards.
+
+Note:
+  There is no CET-enabling arch_prctl function.  By design, CET is enabled
+  automatically if the binary and the system can support it.
+
+[5] The implementation of the Shadow Stack
+==========================================
+
+Shadow Stack size
+-----------------
+
+A task's shadow stack is allocated from memory to a fixed size of
+MIN(RLIMIT_STACK, 4 GB).  In other words, the shadow stack is allocated to
+the maximum size of the normal stack, but capped to 4 GB.  However,
+a compat-mode application's address space is smaller, each of its thread's
+shadow stack size is MIN(1/4 RLIMIT_STACK, 4 GB).
+
+Signal
+------
+
+The main program and its signal handlers use the same shadow stack.
+Because the shadow stack stores only return addresses, a large shadow
+stack covers the condition that both the program stack and the signal
+alternate stack run out.
+
+The kernel creates a restore token for the shadow stack restoring address
+and verifies that token when restoring from the signal handler.
+
+Fork
+----
+
+The shadow stack's vma has VM_SHSTK flag set; its PTEs are required to be
+read-only and dirty.  When a shadow stack PTE is not RO and dirty, a
+shadow access triggers a page fault with the shadow stack access bit set
+in the page fault error code.
+
+When a task forks a child, its shadow stack PTEs are copied and both the
+parent's and the child's shadow stack PTEs are cleared of the dirty bit.
+Upon the next shadow stack access, the resulting shadow stack page fault
+is handled by page copy/re-use.
+
+When a pthread child is created, the kernel allocates a new shadow stack
+for the new thread.
-- 
2.21.0

