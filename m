Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8488D35073C
	for <lists+linux-doc@lfdr.de>; Wed, 31 Mar 2021 21:15:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235992AbhCaTOt (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 31 Mar 2021 15:14:49 -0400
Received: from mga12.intel.com ([192.55.52.136]:51691 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235610AbhCaTO0 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 31 Mar 2021 15:14:26 -0400
IronPort-SDR: SyuBINgmEs3LzG3ImMlY3dM3TTQXE3poSt3ZIg+tB/nO1ZAmDceIeWrqslTVngEtxQuH/FlQWb
 WJ+rEuwC5OFQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9940"; a="171490635"
X-IronPort-AV: E=Sophos;i="5.81,293,1610438400"; 
   d="scan'208";a="171490635"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2021 12:14:25 -0700
IronPort-SDR: pPR6sI6QNCEd7U4LFPIaRMu7/jSNYCk+iwx+Ee5Rs20sppUqI/eAyDsweNfwFJv7/1wpkTcg1O
 OHz4eOLDzSVg==
X-IronPort-AV: E=Sophos;i="5.81,293,1610438400"; 
   d="scan'208";a="418821866"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2021 12:14:25 -0700
From:   ira.weiny@intel.com
To:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Ira Weiny <ira.weiny@intel.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Fenghua Yu <fenghua.yu@intel.com>, x86@kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org
Subject: [PATCH V5 10/10] x86/pks: Add PKS test code
Date:   Wed, 31 Mar 2021 12:14:05 -0700
Message-Id: <20210331191405.341999-11-ira.weiny@intel.com>
X-Mailer: git-send-email 2.28.0.rc0.12.gb6a658bd00c9
In-Reply-To: <20210331191405.341999-1-ira.weiny@intel.com>
References: <20210331191405.341999-1-ira.weiny@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Ira Weiny <ira.weiny@intel.com>

The core PKS functionality provides an interface for kernel users to
reserve keys to their domains set up the page tables with those keys and
control access to those domains when needed.

Define test code which exercises the core functionality of PKS via a
debugfs entry.  Basic checks can be triggered on boot with a kernel
command line option while both basic and preemption checks can be
triggered with separate debugfs values.

debugfs controls are:

'0' -- Run access tests with a single pkey
'1' -- Set up the pkey register with no access for the pkey allocated to
       this fd
'2' -- Check that the pkey register updated in '1' is still the same.
       (To be used after a forced context switch.)
'3' -- Allocate all pkeys possible and run tests on each pkey allocated.
       DEFAULT when run at boot.

Closing the fd will cleanup and release the pkey, therefore to exercise
context switch testing a user space program is provided in:

	.../tools/testing/selftests/x86/test_pks.c

Reviewed-by: Dan Williams <dan.j.williams@intel.com>
Reviewed-by: Dave Hansen <dave.hansen@linux.intel.com>
Co-developed-by: Fenghua Yu <fenghua.yu@intel.com>
Signed-off-by: Fenghua Yu <fenghua.yu@intel.com>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>

---
Changes from V3
	Add test into ARCH_ENABLE_SUPERVISOR_PKEYS
	Fix allocate context error handling
	Callback must now take pt_regs instead of irq_state
	Use pipes to ensure code switches contexts
	Add more verbose output
	Add --debug opt to trigger more kernel debug output
		Reduce kernel output by default
	Use #defines for the various options
	Add ability to chose cpu for testing
	Work out how to make pkrs_cache global when CONFIG_PKS_TEST=y
	Comments from Dan Williams:
		Remove walk_table in favor of follow_pte
		Adjust for new MASK and SHIFT macros
		Remove unneeded pkey.h header
		Handle_pks_testing -> handle_pks_test
		Retain static pkrs_cache when not test
		s/PKS_TESTING/PKS_TEST/
		Put pks_test_callback declaration in pks_common.h
		Don't export pks_test_callback
		Add comment explaining context creation
		Remove module boilerplate

Changes for V2
	Fix compilation errors

Changes for V1
	Update for new pks_key_alloc()

Changes from RFC V3
	Comments from Dave Hansen
		clean up whitespace dmanage
		Clean up Kconfig help
		Clean up user test error output
		s/pks_mknoaccess/pks_mk_noaccess/
		s/pks_mkread/pks_mk_readonly/
		s/pks_mkrdwr/pks_mk_readwrite/
	Comments from Jing Han
		Remove duplicate stdio.h
---
 Documentation/core-api/protection-keys.rst |   5 +-
 arch/x86/include/asm/pks.h                 |  19 +
 arch/x86/mm/fault.c                        |  16 +
 arch/x86/mm/pkeys.c                        |   2 +-
 lib/Kconfig.debug                          |  11 +
 lib/Makefile                               |   3 +
 lib/pks/Makefile                           |   3 +
 lib/pks/pks_test.c                         | 693 +++++++++++++++++++++
 mm/Kconfig                                 |   3 +-
 tools/testing/selftests/x86/Makefile       |   3 +-
 tools/testing/selftests/x86/test_pks.c     | 150 +++++
 11 files changed, 904 insertions(+), 4 deletions(-)
 create mode 100644 lib/pks/Makefile
 create mode 100644 lib/pks/pks_test.c
 create mode 100644 tools/testing/selftests/x86/test_pks.c

diff --git a/Documentation/core-api/protection-keys.rst b/Documentation/core-api/protection-keys.rst
index 5b1b90d8bdab..f1245eb172c7 100644
--- a/Documentation/core-api/protection-keys.rst
+++ b/Documentation/core-api/protection-keys.rst
@@ -121,7 +121,8 @@ PTE adds this additional protection to the page.
 
 Kernel users intending to use PKS support should check (depend on)
 ARCH_HAS_SUPERVISOR_PKEYS and add their config to ARCH_ENABLE_SUPERVISOR_PKEYS
-to turn on this support within the core.
+to turn on this support within the core.  See the test configuration option
+'PKS_TEST' for an example.
 
         int pks_key_alloc(const char * const pkey_user);
         #define PAGE_KERNEL_PKEY(pkey)
@@ -171,3 +172,5 @@ text:
 	affected by PKRU register will not execute (even transiently)
 	until all prior executions of WRPKRU have completed execution
 	and updated the PKRU register.
+
+Example code can be found in lib/pks/pks_test.c
diff --git a/arch/x86/include/asm/pks.h b/arch/x86/include/asm/pks.h
index 2fff4ac484b9..67c3bc782c32 100644
--- a/arch/x86/include/asm/pks.h
+++ b/arch/x86/include/asm/pks.h
@@ -32,4 +32,23 @@ static inline void show_extended_regs_oops(struct pt_regs *regs,
 
 #endif /* CONFIG_ARCH_ENABLE_SUPERVISOR_PKEYS */
 
+
+#ifdef CONFIG_PKS_TEST
+
+#define __static_or_pks_test
+
+bool handle_pks_test(unsigned long hw_error_code, struct pt_regs *regs);
+bool pks_test_callback(struct pt_regs *regs);
+
+#else /* !CONFIG_PKS_TEST */
+
+#define __static_or_pks_test static
+
+static inline bool handle_pks_test(unsigned long hw_error_code, struct pt_regs *regs)
+{
+	return false;
+}
+
+#endif /* CONFIG_PKS_TEST */
+
 #endif /* _ASM_X86_PKS_H */
diff --git a/arch/x86/mm/fault.c b/arch/x86/mm/fault.c
index 3e6bea196366..1d59dc9c850e 100644
--- a/arch/x86/mm/fault.c
+++ b/arch/x86/mm/fault.c
@@ -1134,6 +1134,19 @@ bool fault_in_kernel_space(unsigned long address)
 	return address >= TASK_SIZE_MAX;
 }
 
+#ifdef CONFIG_PKS_TEST
+bool handle_pks_test(unsigned long hw_error_code, struct pt_regs *regs)
+{
+	/*
+	 * If we get a protection key exception it could be because we
+	 * are running the PKS test.  If so, pks_test_callback() will
+	 * clear the protection mechanism and return true to indicate
+	 * the fault was handled.
+	 */
+	return (hw_error_code & X86_PF_PK) && pks_test_callback(regs);
+}
+#endif
+
 /*
  * Called for all faults where 'address' is part of the kernel address
  * space.  Might get called for faults that originate from *code* that
@@ -1154,6 +1167,9 @@ do_kern_addr_fault(struct pt_regs *regs, unsigned long hw_error_code,
 	WARN_ON_ONCE(!cpu_feature_enabled(X86_FEATURE_PKS) &&
 		     (hw_error_code & X86_PF_PK));
 
+	if (handle_pks_test(hw_error_code, regs))
+		return;
+
 #ifdef CONFIG_X86_32
 	/*
 	 * We can fault-in kernel-space virtual memory on-demand. The
diff --git a/arch/x86/mm/pkeys.c b/arch/x86/mm/pkeys.c
index 47d29707ac39..2dd1feeff9f6 100644
--- a/arch/x86/mm/pkeys.c
+++ b/arch/x86/mm/pkeys.c
@@ -236,7 +236,7 @@ u32 update_pkey_val(u32 pk_reg, int pkey, unsigned int flags)
 
 #ifdef CONFIG_ARCH_ENABLE_SUPERVISOR_PKEYS
 
-static DEFINE_PER_CPU(u32, pkrs_cache);
+__static_or_pks_test DEFINE_PER_CPU(u32, pkrs_cache);
 
 /*
  * write_pkrs() optimizes MSR writes by maintaining a per cpu cache which can
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 2779c29d9981..b7728ed139f9 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2535,6 +2535,17 @@ config HYPERV_TESTING
 	help
 	  Select this option to enable Hyper-V vmbus testing.
 
+config PKS_TEST
+	bool "PKey (S)upervisor testing"
+	depends on ARCH_HAS_SUPERVISOR_PKEYS
+	help
+	  Select this option to enable testing of PKS core software and
+	  hardware.  The PKS core provides a mechanism to allocate keys as well
+	  as maintain the protection settings across context switches.
+	  Answer N if you don't know what supervisor keys are.
+
+	  If unsure, say N.
+
 endmenu # "Kernel Testing and Coverage"
 
 source "Documentation/Kconfig"
diff --git a/lib/Makefile b/lib/Makefile
index b5307d3eec1a..3606b97e12e0 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -354,3 +354,6 @@ obj-$(CONFIG_BITS_TEST) += test_bits.o
 obj-$(CONFIG_CMDLINE_KUNIT_TEST) += cmdline_kunit.o
 
 obj-$(CONFIG_GENERIC_LIB_DEVMEM_IS_ALLOWED) += devmem_is_allowed.o
+
+# PKS test
+obj-y += pks/
diff --git a/lib/pks/Makefile b/lib/pks/Makefile
new file mode 100644
index 000000000000..9daccba4f7c4
--- /dev/null
+++ b/lib/pks/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_PKS_TEST) += pks_test.o
diff --git a/lib/pks/pks_test.c b/lib/pks/pks_test.c
new file mode 100644
index 000000000000..ca308f3ff5aa
--- /dev/null
+++ b/lib/pks/pks_test.c
@@ -0,0 +1,693 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright(c) 2020 Intel Corporation. All rights reserved.
+ *
+ * Implement PKS testing
+ * Access to run this test can be with a command line parameter
+ * ("pks-test-on-boot") or more detailed tests can be triggered through:
+ *
+ *    /sys/kernel/debug/x86/run_pks
+ *
+ *  debugfs controls are:
+ *
+ *  '0' -- Run access tests with a single pkey
+ *
+ *  '1' -- Set up the pkey register with no access for the pkey allocated to
+ *         this fd
+ *  '2' -- Check that the pkey register updated in '1' is still the same.  (To
+ *         be used after a forced context switch.)
+ *
+ *  '3' -- Allocate all pkeys possible and run tests on each pkey allocated.
+ *         DEFAULT when run at boot.
+ *
+ *  Closing the fd will cleanup and release the pkey.
+ *
+ *  A companion user space program is provided in:
+ *
+ *          .../tools/testing/selftests/x86/test_pks.c
+ *
+ *  which will better test the context switching.
+ *
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/debugfs.h>
+#include <linux/delay.h>
+#include <linux/entry-common.h>
+#include <linux/fs.h>
+#include <linux/list.h>
+#include <linux/mman.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/percpu-defs.h>
+#include <linux/pgtable.h>
+#include <linux/pkeys.h>
+#include <linux/slab.h>
+#include <linux/vmalloc.h>
+
+#include <asm/ptrace.h>       /* for struct pt_regs */
+#include <asm/pkeys_common.h>
+#include <asm/processor.h>
+#include <asm/pks.h>
+
+#define PKS_TEST_MEM_SIZE (PAGE_SIZE)
+
+#define RUN_ALLOCATE            "0"
+#define ARM_CTX_SWITCH          "1"
+#define CHECK_CTX_SWITCH        "2"
+#define RUN_ALLOCATE_ALL        "3"
+#define RUN_ALLOCATE_DEBUG      "4"
+#define RUN_ALLOCATE_ALL_DEBUG  "5"
+#define RUN_CRASH_TEST          "9"
+
+DECLARE_PER_CPU(u32, pkrs_cache);
+
+/*
+ * run_on_boot default '= false' which checkpatch complains about initializing;
+ * so we don't
+ */
+static bool run_on_boot;
+static struct dentry *pks_test_dentry;
+static bool run_9;
+
+/*
+ * We must lock the following globals for brief periods while the fault handler
+ * checks/updates them.
+ */
+static DEFINE_SPINLOCK(test_lock);
+static int test_armed_key;
+static unsigned long prev_cnt;
+static unsigned long fault_cnt;
+
+struct pks_test_ctx {
+	bool pass;
+	bool pks_cpu_enabled;
+	bool debug;
+	int pkey;
+	char data[64];
+};
+static struct pks_test_ctx *test_exception_ctx;
+
+static bool check_pkey_val(u32 pk_reg, int pkey, u32 expected)
+{
+	pk_reg = (pk_reg & PKR_PKEY_MASK(pkey)) >> PKR_PKEY_SHIFT(pkey);
+	return (pk_reg == expected);
+}
+
+/*
+ * Check if the register @pkey value matches @expected value
+ *
+ * Both the cached and actual MSR must match.
+ */
+static bool check_pkrs(int pkey, u32 expected)
+{
+	bool ret = true;
+	u64 pkrs;
+	u32 *tmp_cache;
+
+	tmp_cache = get_cpu_ptr(&pkrs_cache);
+	if (!check_pkey_val(*tmp_cache, pkey, expected))
+		ret = false;
+	put_cpu_ptr(tmp_cache);
+
+	rdmsrl(MSR_IA32_PKRS, pkrs);
+	if (!check_pkey_val(pkrs, pkey, expected))
+		ret = false;
+
+	return ret;
+}
+
+static void check_exception(u32 thread_pkrs)
+{
+	/* Check the thread saved state */
+	if (!check_pkey_val(thread_pkrs, test_armed_key, PKEY_DISABLE_WRITE)) {
+		pr_err("     FAIL: checking ept_regs->thread_pkrs\n");
+		test_exception_ctx->pass = false;
+	}
+
+	/* Check the exception state */
+	if (!check_pkrs(test_armed_key, PKEY_DISABLE_ACCESS)) {
+		pr_err("     FAIL: PKRS cache and MSR\n");
+		test_exception_ctx->pass = false;
+	}
+
+	/*
+	 * Check we can update the value during exception without affecting the
+	 * calling thread.  The calling thread is checked after exception...
+	 */
+	pks_mk_readwrite(test_armed_key);
+	if (!check_pkrs(test_armed_key, 0)) {
+		pr_err("     FAIL: exception did not change register to 0\n");
+		test_exception_ctx->pass = false;
+	}
+	pks_mk_noaccess(test_armed_key);
+	if (!check_pkrs(test_armed_key, PKEY_DISABLE_ACCESS)) {
+		pr_err("     FAIL: exception did not change register to 0x%x\n",
+			PKEY_DISABLE_ACCESS);
+		test_exception_ctx->pass = false;
+	}
+}
+
+/**
+ * pks_test_callback() is exported so that the fault handler can detect
+ * and report back status of intentional faults.
+ *
+ * NOTE: It clears the protection key from the page such that the fault handler
+ * will not re-trigger.
+ */
+bool pks_test_callback(struct pt_regs *regs)
+{
+	struct extended_pt_regs *ept_regs = extended_pt_regs(regs);
+	bool armed = (test_armed_key != 0);
+
+	if (test_exception_ctx) {
+		check_exception(ept_regs->thread_pkrs);
+		/*
+		 * We stop this check within the exception because the
+		 * fault handler clean up code will call us 2x while checking
+		 * the PMD entry and we don't need to check this again
+		 */
+		test_exception_ctx = NULL;
+	}
+
+	if (armed) {
+		/* Enable read and write to stop faults */
+		ept_regs->thread_pkrs = update_pkey_val(ept_regs->thread_pkrs,
+							test_armed_key, 0);
+		fault_cnt++;
+	}
+
+	return armed;
+}
+
+static bool exception_caught(void)
+{
+	bool ret = (fault_cnt != prev_cnt);
+
+	prev_cnt = fault_cnt;
+	return ret;
+}
+
+static void report_pkey_settings(void *info)
+{
+	u8 pkey;
+	unsigned long long msr = 0;
+	unsigned int cpu = smp_processor_id();
+	struct pks_test_ctx *ctx = info;
+
+	rdmsrl(MSR_IA32_PKRS, msr);
+
+	pr_info("for CPU %d : 0x%llx\n", cpu, msr);
+
+	if (ctx->debug) {
+		for (pkey = 0; pkey < PKS_NUM_KEYS; pkey++) {
+			int ad, wd;
+
+			ad = (msr >> PKR_PKEY_SHIFT(pkey)) & PKEY_DISABLE_ACCESS;
+			wd = (msr >> PKR_PKEY_SHIFT(pkey)) & PKEY_DISABLE_WRITE;
+			pr_info("   %u: A:%d W:%d\n", pkey, ad, wd);
+		}
+	}
+}
+
+enum pks_access_mode {
+	PKS_TEST_NO_ACCESS,
+	PKS_TEST_RDWR,
+	PKS_TEST_RDONLY
+};
+
+static char *get_mode_str(enum pks_access_mode mode)
+{
+	switch (mode) {
+	case PKS_TEST_NO_ACCESS:
+		return "No Access";
+	case PKS_TEST_RDWR:
+		return "Read Write";
+	case PKS_TEST_RDONLY:
+		return "Read Only";
+	default:
+		pr_err("BUG in test invalid mode\n");
+		break;
+	}
+
+	return "";
+}
+
+struct pks_access_test {
+	enum pks_access_mode mode;
+	bool write;
+	bool exception;
+};
+
+static struct pks_access_test pkey_test_ary[] = {
+	/*  disable both */
+	{ PKS_TEST_NO_ACCESS, true,  true },
+	{ PKS_TEST_NO_ACCESS, false, true },
+
+	/*  enable both */
+	{ PKS_TEST_RDWR, true,  false },
+	{ PKS_TEST_RDWR, false, false },
+
+	/*  enable read only */
+	{ PKS_TEST_RDONLY, true,  true },
+	{ PKS_TEST_RDONLY, false, false },
+};
+
+static int test_it(struct pks_test_ctx *ctx, struct pks_access_test *test, void *ptr)
+{
+	bool exception;
+	int ret = 0;
+
+	spin_lock(&test_lock);
+	WRITE_ONCE(test_armed_key, ctx->pkey);
+
+	if (test->write)
+		memcpy(ptr, ctx->data, 8);
+	else
+		memcpy(ctx->data, ptr, 8);
+
+	exception = exception_caught();
+
+	WRITE_ONCE(test_armed_key, 0);
+	spin_unlock(&test_lock);
+
+	if (test->exception != exception) {
+		pr_err("pkey test FAILED: mode %s; write %s; exception %s != %s\n",
+			get_mode_str(test->mode),
+			test->write ? "TRUE" : "FALSE",
+			test->exception ? "TRUE" : "FALSE",
+			exception ? "TRUE" : "FALSE");
+		ret = -EFAULT;
+	}
+
+	return ret;
+}
+
+static int run_access_test(struct pks_test_ctx *ctx,
+			   struct pks_access_test *test,
+			   void *ptr)
+{
+	switch (test->mode) {
+	case PKS_TEST_NO_ACCESS:
+		pks_mk_noaccess(ctx->pkey);
+		break;
+	case PKS_TEST_RDWR:
+		pks_mk_readwrite(ctx->pkey);
+		break;
+	case PKS_TEST_RDONLY:
+		pks_mk_readonly(ctx->pkey);
+		break;
+	default:
+		pr_err("BUG in test invalid mode\n");
+		break;
+	}
+
+	return test_it(ctx, test, ptr);
+}
+
+static void *alloc_test_page(int pkey)
+{
+	return __vmalloc_node_range(PKS_TEST_MEM_SIZE, 1, VMALLOC_START, VMALLOC_END,
+				    GFP_KERNEL, PAGE_KERNEL_PKEY(pkey), 0,
+				    NUMA_NO_NODE, __builtin_return_address(0));
+}
+
+static void test_mem_access(struct pks_test_ctx *ctx)
+{
+	int i, rc;
+	u8 pkey;
+	void *ptr = NULL;
+	pte_t *ptep = NULL;
+	spinlock_t *ptl;
+
+	ptr = alloc_test_page(ctx->pkey);
+	if (!ptr) {
+		pr_err("Failed to vmalloc page???\n");
+		ctx->pass = false;
+		return;
+	}
+
+	if (follow_pte(&init_mm, (unsigned long)ptr, &ptep, &ptl)) {
+		pr_err("Failed to walk table???\n");
+		ctx->pass = false;
+		goto done;
+	}
+
+	pkey = pte_flags_pkey(ptep->pte);
+	pr_info("ptep flags 0x%lx pkey %u\n",
+		(unsigned long)ptep->pte, pkey);
+	pte_unmap_unlock(ptep, ptl);
+
+	if (pkey != ctx->pkey) {
+		pr_err("invalid pkey found: %u, test_pkey: %u\n",
+			pkey, ctx->pkey);
+		ctx->pass = false;
+		goto done;
+	}
+
+	if (!ctx->pks_cpu_enabled) {
+		pr_err("not CPU enabled; skipping access tests...\n");
+		ctx->pass = true;
+		goto done;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(pkey_test_ary); i++) {
+		rc = run_access_test(ctx, &pkey_test_ary[i], ptr);
+
+		/*  only save last error is fine */
+		if (rc)
+			ctx->pass = false;
+	}
+
+done:
+	vfree(ptr);
+}
+
+static void pks_run_test(struct pks_test_ctx *ctx)
+{
+	ctx->pass = true;
+
+	pr_info("\n");
+	pr_info("\n");
+	pr_info("     ***** BEGIN: Testing (CPU enabled : %s) *****\n",
+		ctx->pks_cpu_enabled ? "TRUE" : "FALSE");
+
+	if (ctx->pks_cpu_enabled)
+		on_each_cpu(report_pkey_settings, ctx, 1);
+
+	pr_info("           BEGIN: pkey %d Testing\n", ctx->pkey);
+	test_mem_access(ctx);
+	pr_info("           END: PAGE_KERNEL_PKEY Testing : %s\n",
+		ctx->pass ? "PASS" : "FAIL");
+
+	pr_info("     ***** END: Testing *****\n");
+	pr_info("\n");
+	pr_info("\n");
+}
+
+static ssize_t pks_read_file(struct file *file, char __user *user_buf,
+			     size_t count, loff_t *ppos)
+{
+	struct pks_test_ctx *ctx = file->private_data;
+	char buf[32];
+	unsigned int len;
+
+	if (!ctx)
+		len = sprintf(buf, "not run\n");
+	else
+		len = sprintf(buf, "%s\n", ctx->pass ? "PASS" : "FAIL");
+
+	return simple_read_from_buffer(user_buf, count, ppos, buf, len);
+}
+
+static struct pks_test_ctx *alloc_ctx(const char *name)
+{
+	struct pks_test_ctx *ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
+
+	if (!ctx) {
+		pr_err("Failed to allocate memory for test context\n");
+		return ERR_PTR(-ENOMEM);
+	}
+
+	ctx->pkey = pks_key_alloc(name);
+	if (ctx->pkey <= 0) {
+		pr_err("Failed to allocate memory for test context\n");
+		kfree(ctx);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	ctx->pks_cpu_enabled = cpu_feature_enabled(X86_FEATURE_PKS);
+	sprintf(ctx->data, "%s", "DEADBEEF");
+	return ctx;
+}
+
+static void free_ctx(struct pks_test_ctx *ctx)
+{
+	pks_key_free(ctx->pkey);
+	kfree(ctx);
+}
+
+static void run_exception_test(void)
+{
+	void *ptr = NULL;
+	bool pass = true;
+	struct pks_test_ctx *ctx;
+
+	pr_info("     ***** BEGIN: exception checking\n");
+
+	ctx = alloc_ctx("Exception test");
+	if (IS_ERR(ctx)) {
+		pr_err("     FAIL: no context\n");
+		pass = false;
+		goto result;
+	}
+	ctx->pass = true;
+
+	ptr = alloc_test_page(ctx->pkey);
+	if (!ptr) {
+		pr_err("     FAIL: no vmalloc page\n");
+		pass = false;
+		goto free_context;
+	}
+
+	pks_mk_readonly(ctx->pkey);
+
+	spin_lock(&test_lock);
+	WRITE_ONCE(test_exception_ctx, ctx);
+	WRITE_ONCE(test_armed_key, ctx->pkey);
+
+	memcpy(ptr, ctx->data, 8);
+
+	if (!exception_caught()) {
+		pr_err("     FAIL: did not get an exception\n");
+		pass = false;
+	}
+
+	/*
+	 * NOTE The exception code has to enable access (b00) to keep the
+	 * fault from looping forever.  So we don't see the write disabled
+	 * restored but rather full access restored.  Also note that as part
+	 * of this test the exception callback attempted to disable access
+	 * completely (b11) and so we ensure that we are seeing the proper
+	 * thread value restored here.
+	 */
+	if (!check_pkrs(test_armed_key, 0)) {
+		pr_err("     FAIL: PKRS not restored\n");
+		pass = false;
+	}
+
+	if (!ctx->pass)
+		pass = false;
+
+	WRITE_ONCE(test_armed_key, 0);
+	spin_unlock(&test_lock);
+
+	vfree(ptr);
+free_context:
+	free_ctx(ctx);
+result:
+	pr_info("     ***** END: exception checking : %s\n",
+		 pass ? "PASS" : "FAIL");
+}
+
+static void run_all(bool debug)
+{
+	struct pks_test_ctx *ctx[PKS_NUM_KEYS];
+	static char name[PKS_NUM_KEYS][64];
+	int i;
+
+	for (i = 1; i < PKS_NUM_KEYS; i++) {
+		sprintf(name[i], "pks ctx %d", i);
+		ctx[i] = alloc_ctx((const char *)name[i]);
+		if (!IS_ERR(ctx[i]))
+			ctx[i]->debug = debug;
+	}
+
+	for (i = 1; i < PKS_NUM_KEYS; i++) {
+		if (!IS_ERR(ctx[i]))
+			pks_run_test(ctx[i]);
+	}
+
+	for (i = 1; i < PKS_NUM_KEYS; i++) {
+		if (!IS_ERR(ctx[i]))
+			free_ctx(ctx[i]);
+	}
+
+	run_exception_test();
+}
+
+static void crash_it(void)
+{
+	struct pks_test_ctx *ctx;
+	void *ptr;
+
+	pr_warn("     ***** BEGIN: Unhandled fault test *****\n");
+
+	ctx = alloc_ctx("crashing kernel\n");
+	if (IS_ERR(ctx)) {
+		pr_err("Failed to allocate context???\n");
+		return;
+	}
+
+	ptr = alloc_test_page(ctx->pkey);
+	if (!ptr) {
+		pr_err("Failed to vmalloc page???\n");
+		ctx->pass = false;
+		return;
+	}
+
+	pks_mk_noaccess(ctx->pkey);
+
+	spin_lock(&test_lock);
+	WRITE_ONCE(test_armed_key, 0);
+	/* This purposely faults */
+	memcpy(ptr, ctx->data, 8);
+	spin_unlock(&test_lock);
+
+	vfree(ptr);
+	free_ctx(ctx);
+}
+
+static ssize_t pks_write_file(struct file *file, const char __user *user_buf,
+			      size_t count, loff_t *ppos)
+{
+	char buf[2];
+	struct pks_test_ctx *ctx = file->private_data;
+
+	if (copy_from_user(buf, user_buf, 1))
+		return -EFAULT;
+	buf[1] = '\0';
+
+	/*
+	 * WARNING: Test "9" will crash the kernel.
+	 *
+	 * So we arm the test and print a warning.  A second "9" will run the
+	 * test.
+	 */
+	if (!strcmp(buf, RUN_CRASH_TEST)) {
+		if (run_9) {
+			crash_it();
+			run_9 = false;
+		} else {
+			pr_warn("CAUTION: Test 9 will crash in the kernel.\n");
+			pr_warn("         Specify 9 a second time to run\n");
+			pr_warn("         run any other test to clear\n");
+			run_9 = true;
+		}
+	} else {
+		run_9 = false;
+	}
+
+	/*
+	 * Test "3" will test allocating all keys. Do it first without
+	 * using "ctx".
+	 */
+	if (!strcmp(buf, RUN_ALLOCATE_ALL))
+		run_all(false);
+	if (!strcmp(buf, RUN_ALLOCATE_ALL_DEBUG))
+		run_all(true);
+
+	/*
+	 * This context is only required if the file is held open for the below
+	 * tests.  Otherwise the context just get's freed in pks_release_file.
+	 */
+	if (!ctx) {
+		ctx = alloc_ctx("pks test");
+		if (IS_ERR(ctx))
+			return -ENOMEM;
+		file->private_data = ctx;
+	}
+
+	if (!strcmp(buf, RUN_ALLOCATE)) {
+		ctx->debug = false;
+		pks_run_test(ctx);
+	}
+	if (!strcmp(buf, RUN_ALLOCATE_DEBUG)) {
+		ctx->debug = true;
+		pks_run_test(ctx);
+	}
+
+	/* start of context switch test */
+	if (!strcmp(buf, ARM_CTX_SWITCH)) {
+		unsigned long reg_pkrs;
+		int access;
+
+		/* Ensure a known state to test context switch */
+		pks_mk_readwrite(ctx->pkey);
+
+		rdmsrl(MSR_IA32_PKRS, reg_pkrs);
+
+		access = (reg_pkrs >> PKR_PKEY_SHIFT(ctx->pkey)) &
+			  PKEY_ACCESS_MASK;
+		pr_info("Context switch armed : pkey %d: 0x%x reg: 0x%lx\n",
+			ctx->pkey, access, reg_pkrs);
+	}
+
+	/* After context switch msr should be restored */
+	if (!strcmp(buf, CHECK_CTX_SWITCH) && ctx->pks_cpu_enabled) {
+		unsigned long reg_pkrs;
+		int access;
+
+		rdmsrl(MSR_IA32_PKRS, reg_pkrs);
+
+		access = (reg_pkrs >> PKR_PKEY_SHIFT(ctx->pkey)) &
+			  PKEY_ACCESS_MASK;
+		if (access != 0) {
+			ctx->pass = false;
+			pr_err("Context switch check failed: pkey %d: 0x%x reg: 0x%lx\n",
+				ctx->pkey, access, reg_pkrs);
+		} else {
+			pr_err("Context switch check passed: pkey %d: 0x%x reg: 0x%lx\n",
+				ctx->pkey, access, reg_pkrs);
+		}
+	}
+
+	return count;
+}
+
+static int pks_release_file(struct inode *inode, struct file *file)
+{
+	struct pks_test_ctx *ctx = file->private_data;
+
+	if (!ctx)
+		return 0;
+
+	free_ctx(ctx);
+	return 0;
+}
+
+static const struct file_operations fops_init_pks = {
+	.read = pks_read_file,
+	.write = pks_write_file,
+	.llseek = default_llseek,
+	.release = pks_release_file,
+};
+
+static int __init parse_pks_test_options(char *str)
+{
+	run_on_boot = true;
+
+	return 0;
+}
+early_param("pks-test-on-boot", parse_pks_test_options);
+
+static int __init pks_test_init(void)
+{
+	if (cpu_feature_enabled(X86_FEATURE_PKS)) {
+		if (run_on_boot)
+			run_all(true);
+
+		pks_test_dentry = debugfs_create_file("run_pks", 0600, arch_debugfs_dir,
+						      NULL, &fops_init_pks);
+	}
+
+	return 0;
+}
+late_initcall(pks_test_init);
+
+static void __exit pks_test_exit(void)
+{
+	debugfs_remove(pks_test_dentry);
+	pr_info("test exit\n");
+}
diff --git a/mm/Kconfig b/mm/Kconfig
index c7d1fc780358..463e95ea0df1 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -811,7 +811,8 @@ config ARCH_HAS_PKEYS
 config ARCH_HAS_SUPERVISOR_PKEYS
 	bool
 config ARCH_ENABLE_SUPERVISOR_PKEYS
-	bool
+	def_bool y
+	depends on PKS_TEST
 
 config PERCPU_STATS
 	bool "Collect percpu memory statistics"
diff --git a/tools/testing/selftests/x86/Makefile b/tools/testing/selftests/x86/Makefile
index 333980375bc7..32fe0414c6af 100644
--- a/tools/testing/selftests/x86/Makefile
+++ b/tools/testing/selftests/x86/Makefile
@@ -13,7 +13,8 @@ CAN_BUILD_WITH_NOPIE := $(shell ./check_cc.sh $(CC) trivial_program.c -no-pie)
 TARGETS_C_BOTHBITS := single_step_syscall sysret_ss_attrs syscall_nt test_mremap_vdso \
 			check_initial_reg_state sigreturn iopl ioperm \
 			test_vsyscall mov_ss_trap \
-			syscall_arg_fault fsgsbase_restore
+			syscall_arg_fault fsgsbase_restore test_pks
+
 TARGETS_C_32BIT_ONLY := entry_from_vm86 test_syscall_vdso unwind_vdso \
 			test_FCMOV test_FCOMI test_FISTTP \
 			vdso_restorer
diff --git a/tools/testing/selftests/x86/test_pks.c b/tools/testing/selftests/x86/test_pks.c
new file mode 100644
index 000000000000..62146cd59eb5
--- /dev/null
+++ b/tools/testing/selftests/x86/test_pks.c
@@ -0,0 +1,150 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#define _GNU_SOURCE
+#include <sched.h>
+#include <stdlib.h>
+#include <getopt.h>
+#include <unistd.h>
+#include <assert.h>
+#include <stdio.h>
+#include <sys/types.h>
+#include <sys/stat.h>
+#include <fcntl.h>
+#include <string.h>
+#include <stdbool.h>
+
+#define PKS_TEST_FILE "/sys/kernel/debug/x86/run_pks"
+
+#define RUN_ALLOCATE            "0"
+#define SETUP_CTX_SWITCH        "1"
+#define CHECK_CTX_SWITCH        "2"
+#define RUN_ALLOCATE_ALL        "3"
+#define RUN_ALLOCATE_DEBUG      "4"
+#define RUN_ALLOCATE_ALL_DEBUG  "5"
+#define RUN_CRASH_TEST          "9"
+
+int main(int argc, char *argv[])
+{
+	cpu_set_t cpuset;
+	char result[32];
+	pid_t pid;
+	int fd;
+	int setup_done[2];
+	int switch_done[2];
+	int cpu = 0;
+	int rc = 0;
+	int c;
+	bool debug = false;
+
+	while (1) {
+		int option_index = 0;
+		static struct option long_options[] = {
+			{"debug",  no_argument,	  0,  0 },
+			{0,	   0,		  0,  0 }
+		};
+
+		c = getopt_long(argc, argv, "", long_options, &option_index);
+		if (c == -1)
+			break;
+
+		switch (c) {
+		case 0:
+			debug = true;
+			break;
+		}
+	}
+
+	if (optind < argc)
+		cpu = strtoul(argv[optind], NULL, 0);
+
+	if (cpu >= sysconf(_SC_NPROCESSORS_ONLN)) {
+		printf("CPU %d is invalid\n", cpu);
+		cpu = sysconf(_SC_NPROCESSORS_ONLN) - 1;
+		printf("   running on max CPU: %d\n", cpu);
+	}
+
+	CPU_ZERO(&cpuset);
+	CPU_SET(cpu, &cpuset);
+	/* Two processes run on CPU 0 so that they go through context switch. */
+	sched_setaffinity(getpid(), sizeof(cpu_set_t), &cpuset);
+
+	if (pipe(setup_done))
+		printf("Failed to create pipe\n");
+	if (pipe(switch_done))
+		printf("Failed to create pipe\n");
+
+	pid = fork();
+	if (pid == 0) {
+		char done = 'y';
+
+		fd = open(PKS_TEST_FILE, O_RDWR);
+		if (fd < 0) {
+			printf("cannot open %s\n", PKS_TEST_FILE);
+			return -1;
+		}
+
+		cpu = sched_getcpu();
+		printf("Child running on cpu %d...\n", cpu);
+
+		/* Allocate test_pkey1 and run test. */
+		if (debug)
+			write(fd, RUN_ALLOCATE_DEBUG, 1);
+		else
+			write(fd, RUN_ALLOCATE, 1);
+
+		/* Arm for context switch test */
+		write(fd, SETUP_CTX_SWITCH, 1);
+
+		printf("   tell parent to go\n");
+		write(setup_done[1], &done, sizeof(done));
+
+		/* Context switch out... */
+		printf("   Waiting for parent...\n");
+		read(switch_done[0], &done, sizeof(done));
+
+		/* Check msr restored */
+		printf("Checking result\n");
+		write(fd, CHECK_CTX_SWITCH, 1);
+
+		read(fd, result, 10);
+		printf("   #PF, context switch, pkey allocation and free tests: %s\n", result);
+		if (!strncmp(result, "PASS", 10)) {
+			rc = -1;
+			done = 'F';
+		}
+
+		/* Signal result */
+		write(setup_done[1], &done, sizeof(done));
+	} else {
+		char done = 'y';
+
+		read(setup_done[0], &done, sizeof(done));
+		cpu = sched_getcpu();
+		printf("Parent running on cpu %d\n", cpu);
+
+		fd = open(PKS_TEST_FILE, O_RDWR);
+		if (fd < 0) {
+			printf("cannot open %s\n", PKS_TEST_FILE);
+			return -1;
+		}
+
+		/* run test with alternate pkey */
+		if (debug)
+			write(fd, RUN_ALLOCATE_DEBUG, 1);
+		else
+			write(fd, RUN_ALLOCATE, 1);
+
+		/* Signal child we are done.  */
+		printf("   Telling child we are done.\n");
+		write(switch_done[1], &done, sizeof(done));
+
+		/* Wait for result */
+		read(setup_done[0], &done, sizeof(done));
+		if (done == 'F')
+			rc = -1;
+	}
+
+	close(fd);
+
+	return rc;
+}
-- 
2.28.0.rc0.12.gb6a658bd00c9

