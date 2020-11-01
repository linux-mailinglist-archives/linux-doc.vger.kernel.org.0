Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F2D62A1FD5
	for <lists+linux-doc@lfdr.de>; Sun,  1 Nov 2020 18:05:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727078AbgKARFM (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 1 Nov 2020 12:05:12 -0500
Received: from mail.kernel.org ([198.145.29.99]:38722 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726790AbgKARFM (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sun, 1 Nov 2020 12:05:12 -0500
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7AA9F2222F;
        Sun,  1 Nov 2020 17:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604250311;
        bh=961zp8YP3Ph/5e1cBGv3GfPpdUC5CFeOssQ/7iZPL6c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=J3LzlJElvw0Fa8OWGGAqYAf5r/tGpYL6JJKsk76GUxBLzkPSsnkBGmRo88fj0JQ7h
         WqipSTWJpulb4B7oJWChWcrrF3PMKqQr1vx0VRQ7hR7Run92Ysl+OkhWogdTkb0WSK
         3D2Jdazu5rkSgWzeq7e7XLOoO0GlXsJ02Ss+Yq88=
From:   Mike Rapoport <rppt@kernel.org>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Alexey Dobriyan <adobriyan@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Matt Turner <mattst88@gmail.com>, Meelis Roos <mroos@linux.ee>,
        Michael Schmitz <schmitzmic@gmail.com>,
        Mike Rapoport <rppt@kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Russell King <linux@armlinux.org.uk>,
        Tony Luck <tony.luck@intel.com>,
        Vineet Gupta <vgupta@synopsys.com>,
        Will Deacon <will@kernel.org>, linux-alpha@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-mm@kvack.org, linux-snps-arc@lists.infradead.org
Subject: [PATCH v2 01/13] alpha: switch from DISCONTIGMEM to SPARSEMEM
Date:   Sun,  1 Nov 2020 19:04:42 +0200
Message-Id: <20201101170454.9567-2-rppt@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201101170454.9567-1-rppt@kernel.org>
References: <20201101170454.9567-1-rppt@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Mike Rapoport <rppt@linux.ibm.com>

Enable SPARSEMEM support on alpha and deprecate DISCONTIGMEM.

The required changes are mostly around moving duplicated definitions of
page access and address conversion macros to a common place and making sure
they are available for all memory models.

The DISCONTINGMEM support is marked as BROKEN an will be removed in a
couple of releases.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/alpha/Kconfig                 |  8 ++++++++
 arch/alpha/include/asm/mmzone.h    | 14 ++------------
 arch/alpha/include/asm/page.h      |  7 ++++---
 arch/alpha/include/asm/pgtable.h   | 12 +++++-------
 arch/alpha/include/asm/sparsemem.h | 18 ++++++++++++++++++
 arch/alpha/kernel/setup.c          |  1 +
 6 files changed, 38 insertions(+), 22 deletions(-)
 create mode 100644 arch/alpha/include/asm/sparsemem.h

diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index d6e9fc7a7b19..aedf5c296f13 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -40,6 +40,7 @@ config ALPHA
 	select CPU_NO_EFFICIENT_FFS if !ALPHA_EV67
 	select MMU_GATHER_NO_RANGE
 	select SET_FS
+	select SPARSEMEM_EXTREME if SPARSEMEM
 	help
 	  The Alpha is a 64-bit general-purpose processor designed and
 	  marketed by the Digital Equipment Corporation of blessed memory,
@@ -551,12 +552,19 @@ config NR_CPUS
 
 config ARCH_DISCONTIGMEM_ENABLE
 	bool "Discontiguous Memory Support"
+	depends on BROKEN
 	help
 	  Say Y to support efficient handling of discontiguous physical memory,
 	  for architectures which are either NUMA (Non-Uniform Memory Access)
 	  or have huge holes in the physical address space for other reasons.
 	  See <file:Documentation/vm/numa.rst> for more.
 
+config ARCH_SPARSEMEM_ENABLE
+	bool "Sparse Memory Support"
+	help
+	  Say Y to support efficient handling of discontiguous physical memory,
+	  for systems that have huge holes in the physical address space.
+
 config NUMA
 	bool "NUMA Support (EXPERIMENTAL)"
 	depends on DISCONTIGMEM && BROKEN
diff --git a/arch/alpha/include/asm/mmzone.h b/arch/alpha/include/asm/mmzone.h
index 9b521c857436..86644604d977 100644
--- a/arch/alpha/include/asm/mmzone.h
+++ b/arch/alpha/include/asm/mmzone.h
@@ -6,6 +6,8 @@
 #ifndef _ASM_MMZONE_H_
 #define _ASM_MMZONE_H_
 
+#ifdef CONFIG_DISCONTIGMEM
+
 #include <asm/smp.h>
 
 /*
@@ -45,8 +47,6 @@ PLAT_NODE_DATA_LOCALNR(unsigned long p, int n)
 }
 #endif
 
-#ifdef CONFIG_DISCONTIGMEM
-
 /*
  * Following are macros that each numa implementation must define.
  */
@@ -68,11 +68,6 @@ PLAT_NODE_DATA_LOCALNR(unsigned long p, int n)
 /* XXX: FIXME -- nyc */
 #define kern_addr_valid(kaddr)	(0)
 
-#define virt_to_page(kaddr)	pfn_to_page(__pa(kaddr) >> PAGE_SHIFT)
-
-#define pmd_page(pmd)		(pfn_to_page(pmd_val(pmd) >> 32))
-#define pte_pfn(pte)		(pte_val(pte) >> 32)
-
 #define mk_pte(page, pgprot)						     \
 ({								 	     \
 	pte_t pte;                                                           \
@@ -95,16 +90,11 @@ PLAT_NODE_DATA_LOCALNR(unsigned long p, int n)
 	__xx;                                                           \
 })
 
-#define page_to_pa(page)						\
-	(page_to_pfn(page) << PAGE_SHIFT)
-
 #define pfn_to_nid(pfn)		pa_to_nid(((u64)(pfn) << PAGE_SHIFT))
 #define pfn_valid(pfn)							\
 	(((pfn) - node_start_pfn(pfn_to_nid(pfn))) <			\
 	 node_spanned_pages(pfn_to_nid(pfn)))					\
 
-#define virt_addr_valid(kaddr)	pfn_valid((__pa(kaddr) >> PAGE_SHIFT))
-
 #endif /* CONFIG_DISCONTIGMEM */
 
 #endif /* _ASM_MMZONE_H_ */
diff --git a/arch/alpha/include/asm/page.h b/arch/alpha/include/asm/page.h
index e241bd88880f..268f99b4602b 100644
--- a/arch/alpha/include/asm/page.h
+++ b/arch/alpha/include/asm/page.h
@@ -83,12 +83,13 @@ typedef struct page *pgtable_t;
 
 #define __pa(x)			((unsigned long) (x) - PAGE_OFFSET)
 #define __va(x)			((void *)((unsigned long) (x) + PAGE_OFFSET))
-#ifndef CONFIG_DISCONTIGMEM
+
 #define virt_to_page(kaddr)	pfn_to_page(__pa(kaddr) >> PAGE_SHIFT)
+#define virt_addr_valid(kaddr)	pfn_valid((__pa(kaddr) >> PAGE_SHIFT))
 
+#ifdef CONFIG_FLATMEM
 #define pfn_valid(pfn)		((pfn) < max_mapnr)
-#define virt_addr_valid(kaddr)	pfn_valid(__pa(kaddr) >> PAGE_SHIFT)
-#endif /* CONFIG_DISCONTIGMEM */
+#endif /* CONFIG_FLATMEM */
 
 #include <asm-generic/memory_model.h>
 #include <asm-generic/getorder.h>
diff --git a/arch/alpha/include/asm/pgtable.h b/arch/alpha/include/asm/pgtable.h
index 660b14ce1317..8d856c62e22a 100644
--- a/arch/alpha/include/asm/pgtable.h
+++ b/arch/alpha/include/asm/pgtable.h
@@ -203,10 +203,10 @@ extern unsigned long __zero_page(void);
  * Conversion functions:  convert a page and protection to a page entry,
  * and a page entry and page directory to the page they refer to.
  */
-#ifndef CONFIG_DISCONTIGMEM
-#define page_to_pa(page)	(((page) - mem_map) << PAGE_SHIFT)
-
+#define page_to_pa(page)	(page_to_pfn(page) << PAGE_SHIFT)
 #define pte_pfn(pte)	(pte_val(pte) >> 32)
+
+#ifndef CONFIG_DISCONTIGMEM
 #define pte_page(pte)	pfn_to_page(pte_pfn(pte))
 #define mk_pte(page, pgprot)						\
 ({									\
@@ -236,10 +236,8 @@ pmd_page_vaddr(pmd_t pmd)
 	return ((pmd_val(pmd) & _PFN_MASK) >> (32-PAGE_SHIFT)) + PAGE_OFFSET;
 }
 
-#ifndef CONFIG_DISCONTIGMEM
-#define pmd_page(pmd)	(mem_map + ((pmd_val(pmd) & _PFN_MASK) >> 32))
-#define pud_page(pud)	(mem_map + ((pud_val(pud) & _PFN_MASK) >> 32))
-#endif
+#define pmd_page(pmd)	(pfn_to_page(pmd_val(pmd) >> 32))
+#define pud_page(pud)	(pfn_to_page(pud_val(pud) >> 32))
 
 extern inline unsigned long pud_page_vaddr(pud_t pgd)
 { return PAGE_OFFSET + ((pud_val(pgd) & _PFN_MASK) >> (32-PAGE_SHIFT)); }
diff --git a/arch/alpha/include/asm/sparsemem.h b/arch/alpha/include/asm/sparsemem.h
new file mode 100644
index 000000000000..a0820fd2d4b1
--- /dev/null
+++ b/arch/alpha/include/asm/sparsemem.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_ALPHA_SPARSEMEM_H
+#define _ASM_ALPHA_SPARSEMEM_H
+
+#ifdef CONFIG_SPARSEMEM
+
+#define SECTION_SIZE_BITS	27
+
+/*
+ * According to "Alpha Architecture Reference Manual" physical
+ * addresses are at most 48 bits.
+ * https://download.majix.org/dec/alpha_arch_ref.pdf
+ */
+#define MAX_PHYSMEM_BITS	48
+
+#endif /* CONFIG_SPARSEMEM */
+
+#endif /* _ASM_ALPHA_SPARSEMEM_H */
diff --git a/arch/alpha/kernel/setup.c b/arch/alpha/kernel/setup.c
index 916e42d74a86..03dda3beb3bd 100644
--- a/arch/alpha/kernel/setup.c
+++ b/arch/alpha/kernel/setup.c
@@ -648,6 +648,7 @@ setup_arch(char **cmdline_p)
 	/* Find our memory.  */
 	setup_memory(kernel_end);
 	memblock_set_bottom_up(true);
+	sparse_init();
 
 	/* First guess at cpu cache sizes.  Do this before init_arch.  */
 	determine_cpu_caches(cpu->type);
-- 
2.28.0

