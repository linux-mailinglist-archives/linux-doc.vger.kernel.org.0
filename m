Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49F2F343892
	for <lists+linux-doc@lfdr.de>; Mon, 22 Mar 2021 06:31:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229728AbhCVFao (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 22 Mar 2021 01:30:44 -0400
Received: from mga09.intel.com ([134.134.136.24]:18629 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229904AbhCVFac (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 22 Mar 2021 01:30:32 -0400
IronPort-SDR: WVNFDs9dXluhrNRc+GC/zG2DhJWEB4C1jZHFkehdP0p/VgRzSArTwaFKGJEhLhFhTOfwVaMPeZ
 kITzxvx3rnPQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9930"; a="190298141"
X-IronPort-AV: E=Sophos;i="5.81,268,1610438400"; 
   d="scan'208";a="190298141"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2021 22:30:32 -0700
IronPort-SDR: L5JJAP7dflOGzcIGhap+STJa69Dp82VrMouOOAjpxcHi3Qi2r0DhtSJu2D11B82V296Zs0ZGan
 339t3hrSqsew==
X-IronPort-AV: E=Sophos;i="5.81,268,1610438400"; 
   d="scan'208";a="607238734"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2021 22:30:31 -0700
From:   ira.weiny@intel.com
To:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Ira Weiny <ira.weiny@intel.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        linux-kernel@vger.kernel.org, Fenghua Yu <fenghua.yu@intel.com>,
        linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: [PATCH V4 02/10] x86/fpu: Refactor arch_set_user_pkey_access() for PKS support
Date:   Sun, 21 Mar 2021 22:30:12 -0700
Message-Id: <20210322053020.2287058-3-ira.weiny@intel.com>
X-Mailer: git-send-email 2.28.0.rc0.12.gb6a658bd00c9
In-Reply-To: <20210322053020.2287058-1-ira.weiny@intel.com>
References: <20210322053020.2287058-1-ira.weiny@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Ira Weiny <ira.weiny@intel.com>

Define a helper, update_pkey_val(), which will be used to support both
Protection Key User (PKU) and the new Protection Key for Supervisor
(PKS) in subsequent patches.

Reviewed-by: Dan Williams <dan.j.williams@intel.com>
Co-developed-by: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>

---
Changes from RFC V3:
	Per Dave Hansen
		Update and add comments per Dave's review
	Per Peter
		Correct attribution
---
 arch/x86/include/asm/pkeys.h |  2 ++
 arch/x86/kernel/fpu/xstate.c | 22 ++++------------------
 arch/x86/mm/pkeys.c          | 23 +++++++++++++++++++++++
 3 files changed, 29 insertions(+), 18 deletions(-)

diff --git a/arch/x86/include/asm/pkeys.h b/arch/x86/include/asm/pkeys.h
index f9feba80894b..4526245b03e5 100644
--- a/arch/x86/include/asm/pkeys.h
+++ b/arch/x86/include/asm/pkeys.h
@@ -136,4 +136,6 @@ static inline int vma_pkey(struct vm_area_struct *vma)
 	return (vma->vm_flags & vma_pkey_mask) >> VM_PKEY_SHIFT;
 }
 
+u32 update_pkey_val(u32 pk_reg, int pkey, unsigned int flags);
+
 #endif /*_ASM_X86_PKEYS_H */
diff --git a/arch/x86/kernel/fpu/xstate.c b/arch/x86/kernel/fpu/xstate.c
index face29dab0e3..00251bdf759b 100644
--- a/arch/x86/kernel/fpu/xstate.c
+++ b/arch/x86/kernel/fpu/xstate.c
@@ -994,9 +994,7 @@ const void *get_xsave_field_ptr(int xfeature_nr)
 int arch_set_user_pkey_access(struct task_struct *tsk, int pkey,
 		unsigned long init_val)
 {
-	u32 old_pkru;
-	int pkey_shift = (pkey * PKR_BITS_PER_PKEY);
-	u32 new_pkru_bits = 0;
+	u32 pkru;
 
 	/*
 	 * This check implies XSAVE support.  OSPKE only gets
@@ -1012,21 +1010,9 @@ int arch_set_user_pkey_access(struct task_struct *tsk, int pkey,
 	 */
 	WARN_ON_ONCE(pkey >= arch_max_pkey());
 
-	/* Set the bits we need in PKRU:  */
-	if (init_val & PKEY_DISABLE_ACCESS)
-		new_pkru_bits |= PKR_AD_BIT;
-	if (init_val & PKEY_DISABLE_WRITE)
-		new_pkru_bits |= PKR_WD_BIT;
-
-	/* Shift the bits in to the correct place in PKRU for pkey: */
-	new_pkru_bits <<= pkey_shift;
-
-	/* Get old PKRU and mask off any old bits in place: */
-	old_pkru = read_pkru();
-	old_pkru &= ~((PKR_AD_BIT|PKR_WD_BIT) << pkey_shift);
-
-	/* Write old part along with new part: */
-	write_pkru(old_pkru | new_pkru_bits);
+	pkru = read_pkru();
+	pkru = update_pkey_val(pkru, pkey, init_val);
+	write_pkru(pkru);
 
 	return 0;
 }
diff --git a/arch/x86/mm/pkeys.c b/arch/x86/mm/pkeys.c
index f5efb4007e74..d1dfe743e79f 100644
--- a/arch/x86/mm/pkeys.c
+++ b/arch/x86/mm/pkeys.c
@@ -208,3 +208,26 @@ static __init int setup_init_pkru(char *opt)
 	return 1;
 }
 __setup("init_pkru=", setup_init_pkru);
+
+/*
+ * Replace disable bits for @pkey with values from @flags
+ *
+ * Kernel users use the same flags as user space:
+ *     PKEY_DISABLE_ACCESS
+ *     PKEY_DISABLE_WRITE
+ */
+u32 update_pkey_val(u32 pk_reg, int pkey, unsigned int flags)
+{
+	int pkey_shift = pkey * PKR_BITS_PER_PKEY;
+
+	/*  Mask out old bit values */
+	pk_reg &= ~(((1 << PKR_BITS_PER_PKEY) - 1) << pkey_shift);
+
+	/*  Or in new values */
+	if (flags & PKEY_DISABLE_ACCESS)
+		pk_reg |= PKR_AD_BIT << pkey_shift;
+	if (flags & PKEY_DISABLE_WRITE)
+		pk_reg |= PKR_WD_BIT << pkey_shift;
+
+	return pk_reg;
+}
-- 
2.28.0.rc0.12.gb6a658bd00c9

