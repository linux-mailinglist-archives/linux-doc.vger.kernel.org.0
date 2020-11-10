Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE4CF2ADBCD
	for <lists+linux-doc@lfdr.de>; Tue, 10 Nov 2020 17:24:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730770AbgKJQW4 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 10 Nov 2020 11:22:56 -0500
Received: from mga11.intel.com ([192.55.52.93]:42893 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730511AbgKJQWy (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 10 Nov 2020 11:22:54 -0500
IronPort-SDR: L935UL/PowBwr9siTia/gfBgvBMH0KZIVGYl4EiB/enMKHhRKi+48lJkFia+P95sdbN/WHaZfe
 HOxmD+vVyArg==
X-IronPort-AV: E=McAfee;i="6000,8403,9801"; a="166492980"
X-IronPort-AV: E=Sophos;i="5.77,466,1596524400"; 
   d="scan'208";a="166492980"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2020 08:22:51 -0800
IronPort-SDR: P47CftBifCQMypsR9qiuGvoBMGSdElEEhyZfZr+iNHAZG6UsASk3QI6ez/kmZFTyeH6ycDKMp2
 wZ6q5kQ6Rb3A==
X-IronPort-AV: E=Sophos;i="5.77,466,1596524400"; 
   d="scan'208";a="365572842"
Received: from yyu32-desk.sc.intel.com ([143.183.136.146])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2020 08:22:51 -0800
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
        Pengfei Xu <pengfei.xu@intel.com>
Cc:     Yu-cheng Yu <yu-cheng.yu@intel.com>
Subject: [PATCH v15 10/26] x86/mm: Update pte_modify for _PAGE_COW
Date:   Tue, 10 Nov 2020 08:21:55 -0800
Message-Id: <20201110162211.9207-11-yu-cheng.yu@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20201110162211.9207-1-yu-cheng.yu@intel.com>
References: <20201110162211.9207-1-yu-cheng.yu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Pte_modify() changes a PTE to 'newprot'.  It doesn't use the pte_*()
helpers that a previous patch fixed up, so we need a new site.

Introduce fixup_dirty_pte() to set the dirty bits based on _PAGE_RW, and
apply the same changes to pmd_modify().

Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>
---
 arch/x86/include/asm/pgtable.h | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index c88c7ccf0318..07a08e763bce 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -726,6 +726,21 @@ static inline pmd_t pmd_mkinvalid(pmd_t pmd)
 
 static inline u64 flip_protnone_guard(u64 oldval, u64 val, u64 mask);
 
+static inline pteval_t fixup_dirty_pte(pteval_t pteval)
+{
+	pte_t pte = __pte(pteval);
+
+	if (cpu_feature_enabled(X86_FEATURE_SHSTK) && pte_dirty(pte)) {
+		pte = pte_mkclean(pte);
+
+		if (pte_flags(pte) & _PAGE_RW)
+			pte = pte_set_flags(pte, _PAGE_DIRTY_HW);
+		else
+			pte = pte_set_flags(pte, _PAGE_COW);
+	}
+	return pte_val(pte);
+}
+
 static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
 {
 	pteval_t val = pte_val(pte), oldval = val;
@@ -736,16 +751,34 @@ static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
 	 */
 	val &= _PAGE_CHG_MASK;
 	val |= check_pgprot(newprot) & ~_PAGE_CHG_MASK;
+	val = fixup_dirty_pte(val);
 	val = flip_protnone_guard(oldval, val, PTE_PFN_MASK);
 	return __pte(val);
 }
 
+static inline int pmd_write(pmd_t pmd);
+static inline pmdval_t fixup_dirty_pmd(pmdval_t pmdval)
+{
+	pmd_t pmd = __pmd(pmdval);
+
+	if (cpu_feature_enabled(X86_FEATURE_SHSTK) && pmd_dirty(pmd)) {
+		pmd = pmd_mkclean(pmd);
+
+		if (pmd_flags(pmd) & _PAGE_RW)
+			pmd = pmd_set_flags(pmd, _PAGE_DIRTY_HW);
+		else
+			pmd = pmd_set_flags(pmd, _PAGE_COW);
+	}
+	return pmd_val(pmd);
+}
+
 static inline pmd_t pmd_modify(pmd_t pmd, pgprot_t newprot)
 {
 	pmdval_t val = pmd_val(pmd), oldval = val;
 
 	val &= _HPAGE_CHG_MASK;
 	val |= check_pgprot(newprot) & ~_HPAGE_CHG_MASK;
+	val = fixup_dirty_pmd(val);
 	val = flip_protnone_guard(oldval, val, PHYSICAL_PMD_PAGE_MASK);
 	return __pmd(val);
 }
-- 
2.21.0

