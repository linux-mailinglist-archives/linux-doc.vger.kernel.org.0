Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A69A38D0BF
	for <lists+linux-doc@lfdr.de>; Sat, 22 May 2021 00:13:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230084AbhEUWOt (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 21 May 2021 18:14:49 -0400
Received: from mga17.intel.com ([192.55.52.151]:65511 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229979AbhEUWOk (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 21 May 2021 18:14:40 -0400
IronPort-SDR: jjTJmu1OnJMSiXXD7+SMXsWxJeMRnYyfF3xPHQzlN4P0ZXtbntpQTzSJMstHmiEeDCy/iSvQAk
 D8wuDOFoAE3Q==
X-IronPort-AV: E=McAfee;i="6200,9189,9991"; a="181874402"
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; 
   d="scan'208";a="181874402"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2021 15:13:11 -0700
IronPort-SDR: OToTLONOxRsQaOPw7Y3KoP7fb2mvcJigHSQqykjugMgG3XCk2IsjwMGTbDz4wKJELLizKVJfiL
 auQRqLFbz0TQ==
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; 
   d="scan'208";a="441116160"
Received: from yyu32-desk.sc.intel.com ([143.183.136.146])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2021 15:13:10 -0700
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
Cc:     Yu-cheng Yu <yu-cheng.yu@intel.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Subject: [PATCH v27 11/31] x86/mm: Update pte_modify for _PAGE_COW
Date:   Fri, 21 May 2021 15:11:51 -0700
Message-Id: <20210521221211.29077-12-yu-cheng.yu@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210521221211.29077-1-yu-cheng.yu@intel.com>
References: <20210521221211.29077-1-yu-cheng.yu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The read-only and Dirty PTE has been used to indicate copy-on-write pages.
However, newer x86 processors also regard a read-only and Dirty PTE as a
shadow stack page.  In order to separate the two, the software-defined
_PAGE_COW is created to replace _PAGE_DIRTY for the copy-on-write case, and
pte_*() are updated.

Pte_modify() changes a PTE to 'newprot', but it doesn't use the pte_*().
Introduce fixup_dirty_pte(), which sets a dirty PTE, based on _PAGE_RW,
to either _PAGE_DIRTY or _PAGE_COW.

Apply the same changes to pmd_modify().

Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>
Reviewed-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
---
 arch/x86/include/asm/pgtable.h | 37 ++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index 2f1e44db42b6..f7bc20780fee 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -799,6 +799,23 @@ static inline pmd_t pmd_mkinvalid(pmd_t pmd)
 
 static inline u64 flip_protnone_guard(u64 oldval, u64 val, u64 mask);
 
+static inline pteval_t fixup_dirty_pte(pteval_t pteval)
+{
+	pte_t pte = __pte(pteval);
+
+	/*
+	 * Fix up potential shadow stack page flags because the RO, Dirty
+	 * PTE is special.
+	 */
+	if (cpu_feature_enabled(X86_FEATURE_SHSTK)) {
+		if (pte_dirty(pte)) {
+			pte = pte_mkclean(pte);
+			pte = pte_mkdirty(pte);
+		}
+	}
+	return pte_val(pte);
+}
+
 static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
 {
 	pteval_t val = pte_val(pte), oldval = val;
@@ -809,16 +826,36 @@ static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
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
+	/*
+	 * Fix up potential shadow stack page flags because the RO, Dirty
+	 * PMD is special.
+	 */
+	if (cpu_feature_enabled(X86_FEATURE_SHSTK)) {
+		if (pmd_dirty(pmd)) {
+			pmd = pmd_mkclean(pmd);
+			pmd = pmd_mkdirty(pmd);
+		}
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

