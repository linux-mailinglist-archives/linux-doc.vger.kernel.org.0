Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D92236BFE1F
	for <lists+linux-doc@lfdr.de>; Sun, 19 Mar 2023 01:17:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230046AbjCSARp (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 18 Mar 2023 20:17:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230051AbjCSARI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 18 Mar 2023 20:17:08 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F8EE28E51;
        Sat, 18 Mar 2023 17:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679184979; x=1710720979;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3uhcjpuPc6iiKv5YasMIVAsUAr3DhRKyR9YoK1X/nYQ=;
  b=MRhGSha3VHuQsQ+yJ/GUD/YlLOawG3DbWKNkBXdMfZBC+p16Y20lEIY5
   wyT8Os46y1DiNRLngqzkyn9I424cdVllQz0hXHEIrl4O5mTb0thMbur3R
   m7yh9eKUtAYEmTsKUT+/BYkTOqCLJgkA3l3vYtCHos2u9WXuphgOmaABY
   1Hm9RluHumlGVlEPSlAH3a0Uq/8JCHRfroDQU04eeMYnR+OIll7OljB2Q
   WJmXBgUj+vnQHgdMHrvk6rBbUZzVBIKJ9VdiO/JDQHmEbQ0CcOYXntQ5U
   lviN7g+w9ukW0oDQFna1E19ho9JtTF8FQ/soy2WrGeJ5H7oqohbNSDoeQ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="338490959"
X-IronPort-AV: E=Sophos;i="5.98,272,1673942400"; 
   d="scan'208";a="338490959"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2023 17:16:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="749672821"
X-IronPort-AV: E=Sophos;i="5.98,272,1673942400"; 
   d="scan'208";a="749672821"
Received: from bmahatwo-mobl1.gar.corp.intel.com (HELO rpedgeco-desk.amr.corp.intel.com) ([10.135.34.5])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2023 17:16:11 -0700
From:   Rick Edgecombe <rick.p.edgecombe@intel.com>
To:     x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
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
        "H . J . Lu" <hjl.tools@gmail.com>, Jann Horn <jannh@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Nadav Amit <nadav.amit@gmail.com>,
        Oleg Nesterov <oleg@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        Peter Zijlstra <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Weijiang Yang <weijiang.yang@intel.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        John Allen <john.allen@amd.com>, kcc@google.com,
        eranian@google.com, rppt@kernel.org, jamorris@linux.microsoft.com,
        dethoma@microsoft.com, akpm@linux-foundation.org,
        Andrew.Cooper3@citrix.com, christina.schimpe@intel.com,
        david@redhat.com, debug@rivosinc.com, szabolcs.nagy@arm.com
Cc:     rick.p.edgecombe@intel.com
Subject: [PATCH v8 11/40] mm: Introduce pte_mkwrite_kernel()
Date:   Sat, 18 Mar 2023 17:15:06 -0700
Message-Id: <20230319001535.23210-12-rick.p.edgecombe@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230319001535.23210-1-rick.p.edgecombe@intel.com>
References: <20230319001535.23210-1-rick.p.edgecombe@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The x86 Control-flow Enforcement Technology (CET) feature includes a new
type of memory called shadow stack. This shadow stack memory has some
unusual properties, which requires some core mm changes to function
properly.

One of these changes is to allow for pte_mkwrite() to create different
types of writable memory (the existing conventionally writable type and
also the new shadow stack type). Future patches will convert pte_mkwrite()
to take a VMA in order to facilitate this, however there are places in the
kernel where pte_mkwrite() is called outside of the context of a VMA.
These are for kernel memory. So create a new variant called
pte_mkwrite_kernel() and switch the kernel users over to it. Have
pte_mkwrite() and pte_mkwrite_kernel() be the same for now. Future patches
will introduce changes to make pte_mkwrite() take a VMA.

Only do this for architectures that need it because they call pte_mkwrite()
in arch code without an associated VMA. Since it will only currently be
used in arch code, so do not include it in arch_pgtable_helpers.rst.

Suggested-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Reviewed-by: Kees Cook <keescook@chromium.org>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
Acked-by: David Hildenbrand <david@redhat.com>
Acked-by: Deepak Gupta <debug@rivosinc.com>
Tested-by: Pengfei Xu <pengfei.xu@intel.com>
Tested-by: John Allen <john.allen@amd.com>
Tested-by: Kees Cook <keescook@chromium.org>
Link: https://lore.kernel.org/lkml/0e29a2d0-08d8-bcd6-ff26-4bea0e4037b0@redhat.com/
---
Hi Non-x86 Arch’s,

x86 has a feature that allows for the creation of a special type of
writable memory (shadow stack) that is only writable in limited specific
ways. Previously, changes were proposed to core MM code to teach it to
decide when to create normally writable memory or the special shadow stack
writable memory, but David Hildenbrand suggested[0] to change
pXX_mkwrite() to take a VMA, so awareness of shadow stack memory can be
moved into x86 code.

Since pXX_mkwrite() is defined in every arch, it requires some tree-wide
changes. So that is why you are seeing some patches out of a big x86
series pop up in your arch mailing list. There is no functional change.
After this refactor, the shadow stack series goes on to use the arch
helpers to push shadow stack memory details inside arch/x86.

Testing was just 0-day build testing.

Hopefully that is enough context. Thanks!

[0] https://lore.kernel.org/lkml/0e29a2d0-08d8-bcd6-ff26-4bea0e4037b0@redhat.com/

v6:
 - New patch
---
 arch/arm64/include/asm/pgtable.h | 7 ++++++-
 arch/arm64/mm/trans_pgd.c        | 4 ++--
 arch/s390/include/asm/pgtable.h  | 7 ++++++-
 arch/s390/mm/pageattr.c          | 2 +-
 arch/x86/include/asm/pgtable.h   | 7 ++++++-
 arch/x86/xen/mmu_pv.c            | 2 +-
 6 files changed, 22 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index b6ba466e2e8a..cccf8885792e 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -180,13 +180,18 @@ static inline pmd_t set_pmd_bit(pmd_t pmd, pgprot_t prot)
 	return pmd;
 }
 
-static inline pte_t pte_mkwrite(pte_t pte)
+static inline pte_t pte_mkwrite_kernel(pte_t pte)
 {
 	pte = set_pte_bit(pte, __pgprot(PTE_WRITE));
 	pte = clear_pte_bit(pte, __pgprot(PTE_RDONLY));
 	return pte;
 }
 
+static inline pte_t pte_mkwrite(pte_t pte)
+{
+	return pte_mkwrite_kernel(pte);
+}
+
 static inline pte_t pte_mkclean(pte_t pte)
 {
 	pte = clear_pte_bit(pte, __pgprot(PTE_DIRTY));
diff --git a/arch/arm64/mm/trans_pgd.c b/arch/arm64/mm/trans_pgd.c
index 4ea2eefbc053..5c07e68d80ea 100644
--- a/arch/arm64/mm/trans_pgd.c
+++ b/arch/arm64/mm/trans_pgd.c
@@ -40,7 +40,7 @@ static void _copy_pte(pte_t *dst_ptep, pte_t *src_ptep, unsigned long addr)
 		 * read only (code, rodata). Clear the RDONLY bit from
 		 * the temporary mappings we use during restore.
 		 */
-		set_pte(dst_ptep, pte_mkwrite(pte));
+		set_pte(dst_ptep, pte_mkwrite_kernel(pte));
 	} else if (debug_pagealloc_enabled() && !pte_none(pte)) {
 		/*
 		 * debug_pagealloc will removed the PTE_VALID bit if
@@ -53,7 +53,7 @@ static void _copy_pte(pte_t *dst_ptep, pte_t *src_ptep, unsigned long addr)
 		 */
 		BUG_ON(!pfn_valid(pte_pfn(pte)));
 
-		set_pte(dst_ptep, pte_mkpresent(pte_mkwrite(pte)));
+		set_pte(dst_ptep, pte_mkpresent(pte_mkwrite_kernel(pte)));
 	}
 }
 
diff --git a/arch/s390/include/asm/pgtable.h b/arch/s390/include/asm/pgtable.h
index 2c70b4d1263d..d4943f2d3f00 100644
--- a/arch/s390/include/asm/pgtable.h
+++ b/arch/s390/include/asm/pgtable.h
@@ -1005,7 +1005,7 @@ static inline pte_t pte_wrprotect(pte_t pte)
 	return set_pte_bit(pte, __pgprot(_PAGE_PROTECT));
 }
 
-static inline pte_t pte_mkwrite(pte_t pte)
+static inline pte_t pte_mkwrite_kernel(pte_t pte)
 {
 	pte = set_pte_bit(pte, __pgprot(_PAGE_WRITE));
 	if (pte_val(pte) & _PAGE_DIRTY)
@@ -1013,6 +1013,11 @@ static inline pte_t pte_mkwrite(pte_t pte)
 	return pte;
 }
 
+static inline pte_t pte_mkwrite(pte_t pte)
+{
+	return pte_mkwrite_kernel(pte);
+}
+
 static inline pte_t pte_mkclean(pte_t pte)
 {
 	pte = clear_pte_bit(pte, __pgprot(_PAGE_DIRTY));
diff --git a/arch/s390/mm/pageattr.c b/arch/s390/mm/pageattr.c
index 85195c18b2e8..4ee5fe5caa23 100644
--- a/arch/s390/mm/pageattr.c
+++ b/arch/s390/mm/pageattr.c
@@ -96,7 +96,7 @@ static int walk_pte_level(pmd_t *pmdp, unsigned long addr, unsigned long end,
 		if (flags & SET_MEMORY_RO)
 			new = pte_wrprotect(new);
 		else if (flags & SET_MEMORY_RW)
-			new = pte_mkwrite(pte_mkdirty(new));
+			new = pte_mkwrite_kernel(pte_mkdirty(new));
 		if (flags & SET_MEMORY_NX)
 			new = set_pte_bit(new, __pgprot(_PAGE_NOEXEC));
 		else if (flags & SET_MEMORY_X)
diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index 56eea96502c6..3607f2572f9e 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -364,11 +364,16 @@ static inline pte_t pte_mkyoung(pte_t pte)
 	return pte_set_flags(pte, _PAGE_ACCESSED);
 }
 
-static inline pte_t pte_mkwrite(pte_t pte)
+static inline pte_t pte_mkwrite_kernel(pte_t pte)
 {
 	return pte_set_flags(pte, _PAGE_RW);
 }
 
+static inline pte_t pte_mkwrite(pte_t pte)
+{
+	return pte_mkwrite_kernel(pte);
+}
+
 static inline pte_t pte_mkhuge(pte_t pte)
 {
 	return pte_set_flags(pte, _PAGE_PSE);
diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
index ee29fb558f2e..a23f04243c19 100644
--- a/arch/x86/xen/mmu_pv.c
+++ b/arch/x86/xen/mmu_pv.c
@@ -150,7 +150,7 @@ void make_lowmem_page_readwrite(void *vaddr)
 	if (pte == NULL)
 		return;		/* vaddr missing */
 
-	ptev = pte_mkwrite(*pte);
+	ptev = pte_mkwrite_kernel(*pte);
 
 	if (HYPERVISOR_update_va_mapping(address, ptev, 0))
 		BUG();
-- 
2.17.1

