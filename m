Return-Path: <linux-doc+bounces-1509-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E58D7DD4E6
	for <lists+linux-doc@lfdr.de>; Tue, 31 Oct 2023 18:45:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3944A2818E8
	for <lists+linux-doc@lfdr.de>; Tue, 31 Oct 2023 17:45:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65C722231A;
	Tue, 31 Oct 2023 17:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="e3jaSlgx"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8507B22314
	for <linux-doc@vger.kernel.org>; Tue, 31 Oct 2023 17:45:07 +0000 (UTC)
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52A99103
	for <linux-doc@vger.kernel.org>; Tue, 31 Oct 2023 10:45:04 -0700 (PDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-5afa86b8d66so51742337b3.3
        for <linux-doc@vger.kernel.org>; Tue, 31 Oct 2023 10:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698774303; x=1699379103; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cQkff4wKmvdkqz0jbn2DGoF7t1ibijfeMrbSGmFfV5o=;
        b=e3jaSlgxFNQSlipcBtWT5aZWYqe196LvMCQ1l2y9E/tXVvMZj5PcZQSH9NjI5Kk7+c
         it7PieMCAlZBLOileuErxhrxATNfsIwKTlTcouNu/Xo9qkllleUHcOYBlUioi/k/3xXZ
         SXHj78qDp7aSySVx+XdoyoktTGRmUsbv7npwvWV/Rj4FGfu0YLpSjOW/3udFu02fCGQ4
         DFDPtUiTvgpFrnASQTaX8CGKvoR4hrYEVDnJKbIYvM4PEGaxqYBCXFS0UBAWdL1B7Pnl
         oRwcVi+1Orq93cTRVUmTO4r+LJcc3rZh3FdOHJ8ZFwiD7DnS9UJJkLfE3Wu9gPPAIdUH
         vafg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698774303; x=1699379103;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cQkff4wKmvdkqz0jbn2DGoF7t1ibijfeMrbSGmFfV5o=;
        b=Aoru5FqWer6QVy7liOPt3MnTT3ZJ/gDYWNH2QSl+AhVQGiAa4wbVWfXUB2pz3c88Np
         cIk1scy1FXLnKWdh3Il54M66OtLw7HanRCRNoAfenJN+a8NxmXdN9kqGr6i1d3JPtj6J
         iVZ2wRw2P0udM6/i9tk+O1dwQNarRjXiOCsHTo5Hti7J/Tris0Pz44qcucgYMS/To9Gk
         bUH17Hu5Sr6ADNrKhh4q863hfY1fZoVN2chWbqIVX2bJ4Bz2zQNxeD0laev+eM13LlOB
         5MAN8v3We3Ih/r7vUnIPEkso3vk/nnHBiK8Ee4adMRexhPqBqiy0dJcJBLNdjWWKtoLt
         vzZQ==
X-Gm-Message-State: AOJu0Yy1ERi0MU90i+grcfjanhD05FjKKGg3soN+2mTnh7Olpe+6H7MS
	tBpIZT2LYCxMZaVLL1TigXJxuiuYZZLJr4Xezg==
X-Google-Smtp-Source: AGHT+IEaKzEc6XPxB+tid0y7t2s5ea2F0qyE+xcrn5lI3u1DwjXdT2pJXY5F6GLe0m12f0145l2jPa4jrmTp4G//qg==
X-Received: from souravpanda.svl.corp.google.com ([2620:15c:2a3:200:84c2:bfa0:7c62:5d77])
 (user=souravpanda job=sendgmr) by 2002:a25:cfca:0:b0:d9a:556d:5f8a with SMTP
 id f193-20020a25cfca000000b00d9a556d5f8amr242440ybg.12.1698774303488; Tue, 31
 Oct 2023 10:45:03 -0700 (PDT)
Date: Tue, 31 Oct 2023 10:44:59 -0700
In-Reply-To: <20231031174459.459480-1-souravpanda@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20231031174459.459480-1-souravpanda@google.com>
X-Mailer: git-send-email 2.42.0.820.g83a721a137-goog
Message-ID: <20231031174459.459480-2-souravpanda@google.com>
Subject: [PATCH v3 1/1] mm: report per-page metadata information
From: Sourav Panda <souravpanda@google.com>
To: corbet@lwn.net, gregkh@linuxfoundation.org, rafael@kernel.org, 
	akpm@linux-foundation.org, mike.kravetz@oracle.com, muchun.song@linux.dev, 
	rppt@kernel.org, david@redhat.com, rdunlap@infradead.org, 
	chenlinxuan@uniontech.com, yang.yang29@zte.com.cn, souravpanda@google.com, 
	tomas.mudrunka@gmail.com, bhelgaas@google.com, ivan@cloudflare.com, 
	pasha.tatashin@soleen.com, yosryahmed@google.com, hannes@cmpxchg.org, 
	shakeelb@google.com, kirill.shutemov@linux.intel.com, 
	wangkefeng.wang@huawei.com, adobriyan@gmail.com, vbabka@suse.cz, 
	Liam.Howlett@Oracle.com, surenb@google.com, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	willy@infradead.org, weixugc@google.com
Content-Type: text/plain; charset="UTF-8"

Adds a new per-node PageMetadata field to
/sys/devices/system/node/nodeN/meminfo
and a global PageMetadata field to /proc/meminfo. This information can
be used by users to see how much memory is being used by per-page
metadata, which can vary depending on build configuration, machine
architecture, and system use.

Per-page metadata is the amount of memory that Linux needs in order to
manage memory at the page granularity. The majority of such memory is
used by "struct page" and "page_ext" data structures. In contrast to
most other memory consumption statistics, per-page metadata might not
be included in MemTotal. For example, MemTotal does not include memblock
allocations but includes buddy allocations. While on the other hand,
per-page metadata would include both memblock and buddy allocations.

This memory depends on build configurations, machine architectures, and
the way system is used:

Build configuration may include extra fields into "struct page",
and enable / disable "page_ext"
Machine architecture defines base page sizes. For example 4K x86,
8K SPARC, 64K ARM64 (optionally), etc. The per-page metadata
overhead is smaller on machines with larger page sizes.
System use can change per-page overhead by using vmemmap
optimizations with hugetlb pages, and emulated pmem devdax pages.
Also, boot parameters can determine whether page_ext is needed
to be allocated. This memory can be part of MemTotal or be outside
MemTotal depending on whether the memory was hot-plugged, booted with,
or hugetlb memory was returned back to the system.

Suggested-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Signed-off-by: Sourav Panda <souravpanda@google.com>
---
 Documentation/filesystems/proc.rst |  3 +++
 drivers/base/node.c                |  2 ++
 fs/proc/meminfo.c                  |  7 +++++++
 include/linux/mmzone.h             |  3 +++
 include/linux/vmstat.h             |  4 ++++
 mm/hugetlb.c                       |  8 +++++++-
 mm/hugetlb_vmemmap.c               |  8 +++++++-
 mm/mm_init.c                       |  3 +++
 mm/page_alloc.c                    |  1 +
 mm/page_ext.c                      | 32 +++++++++++++++++++++---------
 mm/sparse-vmemmap.c                |  3 +++
 mm/sparse.c                        |  7 ++++++-
 mm/vmstat.c                        | 24 ++++++++++++++++++++++
 13 files changed, 93 insertions(+), 12 deletions(-)

diff --git a/Documentation/filesystems/proc.rst b/Documentation/filesystems/proc.rst
index 2b59cff8be17..c121f2ef9432 100644
--- a/Documentation/filesystems/proc.rst
+++ b/Documentation/filesystems/proc.rst
@@ -987,6 +987,7 @@ Example output. You may not have all of these fields.
     AnonPages:       4654780 kB
     Mapped:           266244 kB
     Shmem:              9976 kB
+    PageMetadata:     513419 kB
     KReclaimable:     517708 kB
     Slab:             660044 kB
     SReclaimable:     517708 kB
@@ -1089,6 +1090,8 @@ Mapped
               files which have been mmapped, such as libraries
 Shmem
               Total memory used by shared memory (shmem) and tmpfs
+PageMetadata
+              Memory used for per-page metadata
 KReclaimable
               Kernel allocations that the kernel will attempt to reclaim
               under memory pressure. Includes SReclaimable (below), and other
diff --git a/drivers/base/node.c b/drivers/base/node.c
index 493d533f8375..da728542265f 100644
--- a/drivers/base/node.c
+++ b/drivers/base/node.c
@@ -428,6 +428,7 @@ static ssize_t node_read_meminfo(struct device *dev,
 			     "Node %d Mapped:         %8lu kB\n"
 			     "Node %d AnonPages:      %8lu kB\n"
 			     "Node %d Shmem:          %8lu kB\n"
+			     "Node %d PageMetadata:   %8lu kB\n"
 			     "Node %d KernelStack:    %8lu kB\n"
 #ifdef CONFIG_SHADOW_CALL_STACK
 			     "Node %d ShadowCallStack:%8lu kB\n"
@@ -458,6 +459,7 @@ static ssize_t node_read_meminfo(struct device *dev,
 			     nid, K(node_page_state(pgdat, NR_FILE_MAPPED)),
 			     nid, K(node_page_state(pgdat, NR_ANON_MAPPED)),
 			     nid, K(i.sharedram),
+			     nid, K(node_page_state(pgdat, NR_PAGE_METADATA)),
 			     nid, node_page_state(pgdat, NR_KERNEL_STACK_KB),
 #ifdef CONFIG_SHADOW_CALL_STACK
 			     nid, node_page_state(pgdat, NR_KERNEL_SCS_KB),
diff --git a/fs/proc/meminfo.c b/fs/proc/meminfo.c
index 45af9a989d40..f141bb2a550d 100644
--- a/fs/proc/meminfo.c
+++ b/fs/proc/meminfo.c
@@ -39,7 +39,9 @@ static int meminfo_proc_show(struct seq_file *m, void *v)
 	long available;
 	unsigned long pages[NR_LRU_LISTS];
 	unsigned long sreclaimable, sunreclaim;
+	unsigned long nr_page_metadata;
 	int lru;
+	int nid;
 
 	si_meminfo(&i);
 	si_swapinfo(&i);
@@ -57,6 +59,10 @@ static int meminfo_proc_show(struct seq_file *m, void *v)
 	sreclaimable = global_node_page_state_pages(NR_SLAB_RECLAIMABLE_B);
 	sunreclaim = global_node_page_state_pages(NR_SLAB_UNRECLAIMABLE_B);
 
+	nr_page_metadata = 0;
+	for_each_online_node(nid)
+		nr_page_metadata += node_page_state(NODE_DATA(nid), NR_PAGE_METADATA);
+
 	show_val_kb(m, "MemTotal:       ", i.totalram);
 	show_val_kb(m, "MemFree:        ", i.freeram);
 	show_val_kb(m, "MemAvailable:   ", available);
@@ -104,6 +110,7 @@ static int meminfo_proc_show(struct seq_file *m, void *v)
 	show_val_kb(m, "Mapped:         ",
 		    global_node_page_state(NR_FILE_MAPPED));
 	show_val_kb(m, "Shmem:          ", i.sharedram);
+	show_val_kb(m, "PageMetadata:   ", nr_page_metadata);
 	show_val_kb(m, "KReclaimable:   ", sreclaimable +
 		    global_node_page_state(NR_KERNEL_MISC_RECLAIMABLE));
 	show_val_kb(m, "Slab:           ", sreclaimable + sunreclaim);
diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 4106fbc5b4b3..dda1ad522324 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -207,6 +207,9 @@ enum node_stat_item {
 	PGPROMOTE_SUCCESS,	/* promote successfully */
 	PGPROMOTE_CANDIDATE,	/* candidate pages to promote */
 #endif
+	NR_PAGE_METADATA,	/* Page metadata size (struct page and page_ext)
+				 * in pages
+				 */
 	NR_VM_NODE_STAT_ITEMS
 };
 
diff --git a/include/linux/vmstat.h b/include/linux/vmstat.h
index fed855bae6d8..af096a881f03 100644
--- a/include/linux/vmstat.h
+++ b/include/linux/vmstat.h
@@ -656,4 +656,8 @@ static inline void lruvec_stat_sub_folio(struct folio *folio,
 {
 	lruvec_stat_mod_folio(folio, idx, -folio_nr_pages(folio));
 }
+
+void __init mod_node_early_perpage_metadata(int nid, long delta);
+void __init store_early_perpage_metadata(void);
+
 #endif /* _LINUX_VMSTAT_H */
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 1301ba7b2c9a..e453962f2b74 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -1790,6 +1790,10 @@ static void __update_and_free_hugetlb_folio(struct hstate *h,
 		destroy_compound_gigantic_folio(folio, huge_page_order(h));
 		free_gigantic_folio(folio, huge_page_order(h));
 	} else {
+#ifndef CONFIG_SPARSEMEM_VMEMMAP
+		__mod_node_page_state(NODE_DATA(page_to_nid(&folio->page)),
+				      NR_PAGE_METADATA, -huge_page_order(h));
+#endif
 		__free_pages(&folio->page, huge_page_order(h));
 	}
 }
@@ -2175,7 +2179,9 @@ static struct folio *alloc_buddy_hugetlb_folio(struct hstate *h,
 		__count_vm_event(HTLB_BUDDY_PGALLOC_FAIL);
 		return NULL;
 	}
-
+#ifndef CONFIG_SPARSEMEM_VMEMMAP
+	__mod_node_page_state(NODE_DATA(nid), NR_PAGE_METADATA, huge_page_order(h));
+#endif
 	__count_vm_event(HTLB_BUDDY_PGALLOC);
 	return page_folio(page);
 }
diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 4b9734777f69..71c44d2471d0 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -214,6 +214,8 @@ static inline void free_vmemmap_page(struct page *page)
 		free_bootmem_page(page);
 	else
 		__free_page(page);
+	__mod_node_page_state(NODE_DATA(page_to_nid(page)),
+			      NR_PAGE_METADATA, -1);
 }
 
 /* Free a list of the vmemmap pages */
@@ -336,6 +338,7 @@ static int vmemmap_remap_free(unsigned long start, unsigned long end,
 			  (void *)walk.reuse_addr);
 		list_add(&walk.reuse_page->lru, &vmemmap_pages);
 	}
+	__mod_node_page_state(NODE_DATA(nid), NR_PAGE_METADATA, 1);
 
 	/*
 	 * In order to make remapping routine most efficient for the huge pages,
@@ -384,11 +387,14 @@ static int alloc_vmemmap_page_list(unsigned long start, unsigned long end,
 	unsigned long nr_pages = (end - start) >> PAGE_SHIFT;
 	int nid = page_to_nid((struct page *)start);
 	struct page *page, *next;
+	int i;
 
-	while (nr_pages--) {
+	for (i = 0; i < nr_pages; i++) {
 		page = alloc_pages_node(nid, gfp_mask, 0);
 		if (!page)
 			goto out;
+		__mod_node_page_state(NODE_DATA(page_to_nid(page)),
+				      NR_PAGE_METADATA, 1);
 		list_add_tail(&page->lru, list);
 	}
 
diff --git a/mm/mm_init.c b/mm/mm_init.c
index 50f2f34745af..e02dce7e2e9a 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -26,6 +26,7 @@
 #include <linux/pgtable.h>
 #include <linux/swap.h>
 #include <linux/cma.h>
+#include <linux/vmstat.h>
 #include "internal.h"
 #include "slab.h"
 #include "shuffle.h"
@@ -1656,6 +1657,8 @@ static void __init alloc_node_mem_map(struct pglist_data *pgdat)
 			panic("Failed to allocate %ld bytes for node %d memory map\n",
 			      size, pgdat->node_id);
 		pgdat->node_mem_map = map + offset;
+		mod_node_early_perpage_metadata(pgdat->node_id,
+						PAGE_ALIGN(size) >> PAGE_SHIFT);
 	}
 	pr_debug("%s: node %d, pgdat %08lx, node_mem_map %08lx\n",
 				__func__, pgdat->node_id, (unsigned long)pgdat,
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 85741403948f..522dc0c52610 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -5443,6 +5443,7 @@ void __init setup_per_cpu_pageset(void)
 	for_each_online_pgdat(pgdat)
 		pgdat->per_cpu_nodestats =
 			alloc_percpu(struct per_cpu_nodestat);
+	store_early_perpage_metadata();
 }
 
 __meminit void zone_pcp_init(struct zone *zone)
diff --git a/mm/page_ext.c b/mm/page_ext.c
index 4548fcc66d74..9e8b1fcbb962 100644
--- a/mm/page_ext.c
+++ b/mm/page_ext.c
@@ -201,6 +201,8 @@ static int __init alloc_node_page_ext(int nid)
 		return -ENOMEM;
 	NODE_DATA(nid)->node_page_ext = base;
 	total_usage += table_size;
+	__mod_node_page_state(NODE_DATA(nid), NR_PAGE_METADATA,
+			      PAGE_ALIGN(table_size) >> PAGE_SHIFT);
 	return 0;
 }
 
@@ -255,12 +257,15 @@ static void *__meminit alloc_page_ext(size_t size, int nid)
 	void *addr = NULL;
 
 	addr = alloc_pages_exact_nid(nid, size, flags);
-	if (addr) {
+	if (addr)
 		kmemleak_alloc(addr, size, 1, flags);
-		return addr;
-	}
+	else
+		addr = vzalloc_node(size, nid);
 
-	addr = vzalloc_node(size, nid);
+	if (addr) {
+		mod_node_page_state(NODE_DATA(nid), NR_PAGE_METADATA,
+				    PAGE_ALIGN(size) >> PAGE_SHIFT);
+	}
 
 	return addr;
 }
@@ -303,18 +308,27 @@ static int __meminit init_section_page_ext(unsigned long pfn, int nid)
 
 static void free_page_ext(void *addr)
 {
+	size_t table_size;
+	struct page *page;
+	struct pglist_data *pgdat;
+
+	table_size = page_ext_size * PAGES_PER_SECTION;
+
 	if (is_vmalloc_addr(addr)) {
+		page = vmalloc_to_page(addr);
+		pgdat = page_pgdat(page);
 		vfree(addr);
 	} else {
-		struct page *page = virt_to_page(addr);
-		size_t table_size;
-
-		table_size = page_ext_size * PAGES_PER_SECTION;
-
+		page = virt_to_page(addr);
+		pgdat = page_pgdat(page);
 		BUG_ON(PageReserved(page));
 		kmemleak_free(addr);
 		free_pages_exact(addr, table_size);
 	}
+
+	__mod_node_page_state(pgdat, NR_PAGE_METADATA,
+			      -1L * (PAGE_ALIGN(table_size) >> PAGE_SHIFT));
+
 }
 
 static void __free_page_ext(unsigned long pfn)
diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index a2cbe44c48e1..e33f302db7c6 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -469,5 +469,8 @@ struct page * __meminit __populate_section_memmap(unsigned long pfn,
 	if (r < 0)
 		return NULL;
 
+	__mod_node_page_state(NODE_DATA(nid), NR_PAGE_METADATA,
+			      PAGE_ALIGN(end - start) >> PAGE_SHIFT);
+
 	return pfn_to_page(pfn);
 }
diff --git a/mm/sparse.c b/mm/sparse.c
index 77d91e565045..db78233a85ef 100644
--- a/mm/sparse.c
+++ b/mm/sparse.c
@@ -14,7 +14,7 @@
 #include <linux/swap.h>
 #include <linux/swapops.h>
 #include <linux/bootmem_info.h>
-
+#include <linux/vmstat.h>
 #include "internal.h"
 #include <asm/dma.h>
 
@@ -465,6 +465,9 @@ static void __init sparse_buffer_init(unsigned long size, int nid)
 	 */
 	sparsemap_buf = memmap_alloc(size, section_map_size(), addr, nid, true);
 	sparsemap_buf_end = sparsemap_buf + size;
+#ifndef CONFIG_SPARSEMEM_VMEMMAP
+	mod_node_early_perpage_metadata(nid, PAGE_ALIGN(size) >> PAGE_SHIFT);
+#endif
 }
 
 static void __init sparse_buffer_fini(void)
@@ -641,6 +644,8 @@ static void depopulate_section_memmap(unsigned long pfn, unsigned long nr_pages,
 	unsigned long start = (unsigned long) pfn_to_page(pfn);
 	unsigned long end = start + nr_pages * sizeof(struct page);
 
+	__mod_node_page_state(NODE_DATA(page_to_nid(pfn_to_page(pfn))), NR_PAGE_METADATA,
+			      (long)-1 * (PAGE_ALIGN(end - start) >> PAGE_SHIFT));
 	vmemmap_free(start, end, altmap);
 }
 static void free_map_bootmem(struct page *memmap)
diff --git a/mm/vmstat.c b/mm/vmstat.c
index 00e81e99c6ee..070d2b3d2bcc 100644
--- a/mm/vmstat.c
+++ b/mm/vmstat.c
@@ -1245,6 +1245,7 @@ const char * const vmstat_text[] = {
 	"pgpromote_success",
 	"pgpromote_candidate",
 #endif
+	"nr_page_metadata",
 
 	/* enum writeback_stat_item counters */
 	"nr_dirty_threshold",
@@ -2274,4 +2275,27 @@ static int __init extfrag_debug_init(void)
 }
 
 module_init(extfrag_debug_init);
+
 #endif
+
+/*
+ * Page metadata size (struct page and page_ext) in pages
+ */
+static unsigned long early_perpage_metadata[MAX_NUMNODES] __initdata;
+
+void __init mod_node_early_perpage_metadata(int nid, long delta)
+{
+	early_perpage_metadata[nid] += delta;
+}
+
+void __init store_early_perpage_metadata(void)
+{
+	int nid;
+	struct pglist_data *pgdat;
+
+	for_each_online_pgdat(pgdat) {
+		nid = pgdat->node_id;
+		__mod_node_page_state(NODE_DATA(nid), NR_PAGE_METADATA,
+				      early_perpage_metadata[nid]);
+	}
+}
-- 
2.42.0.820.g83a721a137-goog


