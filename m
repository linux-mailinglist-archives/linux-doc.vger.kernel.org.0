Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B220398732
	for <lists+linux-doc@lfdr.de>; Wed,  2 Jun 2021 12:55:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232496AbhFBK4r (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 2 Jun 2021 06:56:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:38842 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231524AbhFBK4P (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 2 Jun 2021 06:56:15 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8DC4E613DD;
        Wed,  2 Jun 2021 10:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622631272;
        bh=jRQLkpHVz/iMV5ADUND9kgIZltTm9P6Hoc5VQUTEzHw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Ezo6lJJnkqDE0zhn9oI8ZPCQzzmmDS3pbuuxNQt4h8ieauW2gcB6l+CI+8F5lb/PJ
         YAtbXfYXZQcuURxa6b8/zfIU0FURcRmdi6PvN9qFhzKpyoONdQ8cPutFsxH0yp4scY
         FKL8xJKubqAValNIvImPCvCK9SY5SXfkeoojDF4NaKSO1lI9Gl+DJGHUurGw9x5ZlD
         T+PhA6nZOYMM+iXGcuzp4WNHI6WsEzOIZ6AogZ9fyyFPNxh0wjGTwU6sS7+U9E8u8v
         vfjWTMERIyxdYLjctBOMc8dshco/m8dZ7q2ekQ05Ss707pTbUwu6C+ifcAB+gInaN+
         syrJ7J4gJ8xbA==
From:   Mike Rapoport <rppt@kernel.org>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Jonathan Corbet <corbet@lwn.net>,
        Matt Turner <mattst88@gmail.com>,
        Mike Rapoport <rppt@kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Richard Henderson <rth@twiddle.net>,
        Vineet Gupta <vgupta@synopsys.com>, kexec@lists.infradead.org,
        linux-alpha@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-mm@kvack.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
        linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org
Subject: [PATCH 5/9] mm: remove CONFIG_DISCONTIGMEM
Date:   Wed,  2 Jun 2021 13:53:44 +0300
Message-Id: <20210602105348.13387-6-rppt@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210602105348.13387-1-rppt@kernel.org>
References: <20210602105348.13387-1-rppt@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Mike Rapoport <rppt@linux.ibm.com>

There are no architectures that support DISCONTIGMEM left.

Remove the configuration option and the dead code it was guarding in the
generic memory management code.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 include/asm-generic/memory_model.h | 37 ++++--------------------------
 include/linux/mmzone.h             |  4 ++--
 mm/Kconfig                         | 25 +++-----------------
 mm/memory.c                        |  3 +--
 mm/page_alloc.c                    | 13 -----------
 5 files changed, 10 insertions(+), 72 deletions(-)

diff --git a/include/asm-generic/memory_model.h b/include/asm-generic/memory_model.h
index 7637fb46ba4f..a2c8ed60233a 100644
--- a/include/asm-generic/memory_model.h
+++ b/include/asm-generic/memory_model.h
@@ -6,47 +6,18 @@
 
 #ifndef __ASSEMBLY__
 
+/*
+ * supports 3 memory models.
+ */
 #if defined(CONFIG_FLATMEM)
 
 #ifndef ARCH_PFN_OFFSET
 #define ARCH_PFN_OFFSET		(0UL)
 #endif
 
-#elif defined(CONFIG_DISCONTIGMEM)
-
-#ifndef arch_pfn_to_nid
-#define arch_pfn_to_nid(pfn)	pfn_to_nid(pfn)
-#endif
-
-#ifndef arch_local_page_offset
-#define arch_local_page_offset(pfn, nid)	\
-	((pfn) - NODE_DATA(nid)->node_start_pfn)
-#endif
-
-#endif /* CONFIG_DISCONTIGMEM */
-
-/*
- * supports 3 memory models.
- */
-#if defined(CONFIG_FLATMEM)
-
 #define __pfn_to_page(pfn)	(mem_map + ((pfn) - ARCH_PFN_OFFSET))
 #define __page_to_pfn(page)	((unsigned long)((page) - mem_map) + \
 				 ARCH_PFN_OFFSET)
-#elif defined(CONFIG_DISCONTIGMEM)
-
-#define __pfn_to_page(pfn)			\
-({	unsigned long __pfn = (pfn);		\
-	unsigned long __nid = arch_pfn_to_nid(__pfn);  \
-	NODE_DATA(__nid)->node_mem_map + arch_local_page_offset(__pfn, __nid);\
-})
-
-#define __page_to_pfn(pg)						\
-({	const struct page *__pg = (pg);					\
-	struct pglist_data *__pgdat = NODE_DATA(page_to_nid(__pg));	\
-	(unsigned long)(__pg - __pgdat->node_mem_map) +			\
-	 __pgdat->node_start_pfn;					\
-})
 
 #elif defined(CONFIG_SPARSEMEM_VMEMMAP)
 
@@ -70,7 +41,7 @@
 	struct mem_section *__sec = __pfn_to_section(__pfn);	\
 	__section_mem_map_addr(__sec) + __pfn;		\
 })
-#endif /* CONFIG_FLATMEM/DISCONTIGMEM/SPARSEMEM */
+#endif /* CONFIG_FLATMEM/SPARSEMEM */
 
 /*
  * Convert a physical address to a Page Frame Number and back
diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 0d53eba1c383..2b41e252a995 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -738,8 +738,8 @@ struct zonelist {
 	struct zoneref _zonerefs[MAX_ZONES_PER_ZONELIST + 1];
 };
 
-#ifndef CONFIG_DISCONTIGMEM
-/* The array of struct pages - for discontigmem use pgdat->lmem_map */
+#ifdef CONFIG_FLATMEM
+/* The array of struct pages for flatmem */
 extern struct page *mem_map;
 #endif
 
diff --git a/mm/Kconfig b/mm/Kconfig
index 02d44e3420f5..218b96ccc84a 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -19,7 +19,7 @@ choice
 
 config FLATMEM_MANUAL
 	bool "Flat Memory"
-	depends on !(ARCH_DISCONTIGMEM_ENABLE || ARCH_SPARSEMEM_ENABLE) || ARCH_FLATMEM_ENABLE
+	depends on !ARCH_SPARSEMEM_ENABLE || ARCH_FLATMEM_ENABLE
 	help
 	  This option is best suited for non-NUMA systems with
 	  flat address space. The FLATMEM is the most efficient
@@ -32,21 +32,6 @@ config FLATMEM_MANUAL
 
 	  If unsure, choose this option (Flat Memory) over any other.
 
-config DISCONTIGMEM_MANUAL
-	bool "Discontiguous Memory"
-	depends on ARCH_DISCONTIGMEM_ENABLE
-	help
-	  This option provides enhanced support for discontiguous
-	  memory systems, over FLATMEM.  These systems have holes
-	  in their physical address spaces, and this option provides
-	  more efficient handling of these holes.
-
-	  Although "Discontiguous Memory" is still used by several
-	  architectures, it is considered deprecated in favor of
-	  "Sparse Memory".
-
-	  If unsure, choose "Sparse Memory" over this option.
-
 config SPARSEMEM_MANUAL
 	bool "Sparse Memory"
 	depends on ARCH_SPARSEMEM_ENABLE
@@ -62,17 +47,13 @@ config SPARSEMEM_MANUAL
 
 endchoice
 
-config DISCONTIGMEM
-	def_bool y
-	depends on (!SELECT_MEMORY_MODEL && ARCH_DISCONTIGMEM_ENABLE) || DISCONTIGMEM_MANUAL
-
 config SPARSEMEM
 	def_bool y
 	depends on (!SELECT_MEMORY_MODEL && ARCH_SPARSEMEM_ENABLE) || SPARSEMEM_MANUAL
 
 config FLATMEM
 	def_bool y
-	depends on (!DISCONTIGMEM && !SPARSEMEM) || FLATMEM_MANUAL
+	depends on !SPARSEMEM || FLATMEM_MANUAL
 
 config FLAT_NODE_MEM_MAP
 	def_bool y
@@ -85,7 +66,7 @@ config FLAT_NODE_MEM_MAP
 #
 config NEED_MULTIPLE_NODES
 	def_bool y
-	depends on DISCONTIGMEM || NUMA
+	depends on NUMA
 
 #
 # SPARSEMEM_EXTREME (which is the default) does some bootmem
diff --git a/mm/memory.c b/mm/memory.c
index 730daa00952b..7c7b6ea02504 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -90,8 +90,7 @@
 #warning Unfortunate NUMA and NUMA Balancing config, growing page-frame for last_cpupid.
 #endif
 
-#ifndef CONFIG_NEED_MULTIPLE_NODES
-/* use the per-pgdat data instead for discontigmem - mbligh */
+#ifdef CONFIG_FLATMEM
 unsigned long max_mapnr;
 EXPORT_SYMBOL(max_mapnr);
 
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index aaa1655cf682..6fc22482eaa8 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -331,20 +331,7 @@ compound_page_dtor * const compound_page_dtors[NR_COMPOUND_DTORS] = {
 
 int min_free_kbytes = 1024;
 int user_min_free_kbytes = -1;
-#ifdef CONFIG_DISCONTIGMEM
-/*
- * DiscontigMem defines memory ranges as separate pg_data_t even if the ranges
- * are not on separate NUMA nodes. Functionally this works but with
- * watermark_boost_factor, it can reclaim prematurely as the ranges can be
- * quite small. By default, do not boost watermarks on discontigmem as in
- * many cases very high-order allocations like THP are likely to be
- * unsupported and the premature reclaim offsets the advantage of long-term
- * fragmentation avoidance.
- */
-int watermark_boost_factor __read_mostly;
-#else
 int watermark_boost_factor __read_mostly = 15000;
-#endif
 int watermark_scale_factor = 10;
 
 static unsigned long nr_kernel_pages __initdata;
-- 
2.28.0

