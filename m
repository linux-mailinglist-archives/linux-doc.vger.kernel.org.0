Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E3BA2C87A0
	for <lists+linux-doc@lfdr.de>; Mon, 30 Nov 2020 16:23:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727949AbgK3PUc (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 30 Nov 2020 10:20:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727946AbgK3PUc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 30 Nov 2020 10:20:32 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFB80C0617A7
        for <linux-doc@vger.kernel.org>; Mon, 30 Nov 2020 07:19:32 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id h7so70454pjk.1
        for <linux-doc@vger.kernel.org>; Mon, 30 Nov 2020 07:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hzHzl1rDIG1L4/7pxtdZyRgejB0ITG4LFee3gSLEBGI=;
        b=Mr6jK16x1bNEml9VX5un9WVzaocMeTMktRaKuM7vFayGFLW6fG/R0NPjYptoaLf96f
         MP19BIS+N1o44aarMarf7zU/pcn3OjZ6zpeAOm1IkEh1levk6KbxAtnTYQKTQUuke1to
         1lXrBYOXGUlEXsWe5SnRtU8z7SK5yaHtVYFj9PUXS/vM+Cv7B7PcwRMUPixvmZjb5zLn
         XVcMdE2MkqPH8j5htBNhlyw5c2rvo/W31iuTIoj65WMVlHNmwau5hdYbWNbR69Y2Hni+
         Kt1FPRcK7dyIJUvO5SaLZiwTEvmrMYct08yv8mgdZOORQiKSvTPRi9dDqfQDU3sa5Ua1
         kYCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hzHzl1rDIG1L4/7pxtdZyRgejB0ITG4LFee3gSLEBGI=;
        b=ip/aHEGcxLsyoa3ojhQXtyZfVhQFdUez7CXBsHDQlfRnrqH6s7IgnXO21GtQiwRJAQ
         yFsRIRp2cWR45K0xcqvopktsSUyNoZZbYenEtFxkXPEt24Pxjm9jJQVMP0SubanJ4NPW
         c5XC8MfLvCnD6eJ+kv07lKYfHnWO2NlJjBLRqHnfZF1TXo89F/ebUX+DFaVa0+RF7gUz
         w8FfdAF76WJckr5cR49R9pvo8UBk9SS3VPE+5RgS41i/7h7Cs0SNPnFzgfOk9Zn5Z0Md
         J70EdYJ4jqvM3ZeItclKuCuxZ5uKJvWHuqi03EeNCE5x7XxkaGM+SXFKTep/6sSfPEP+
         yHxg==
X-Gm-Message-State: AOAM532ccRrmwTbpELhaPOjS9+Gmp5mPdG/6mxkTu4RSGx678sa//1hq
        TnLWEu0oIfcebzjQ5L1+RYAnRA==
X-Google-Smtp-Source: ABdhPJwjVgDQqpZHx2D/1mVHKtFBaXSfjJYPrzbiHOf3KYPASqpDEwSm6zvXM+2i1t6lTotIU6AIAw==
X-Received: by 2002:a17:90a:7b86:: with SMTP id z6mr12982763pjc.34.1606749572383;
        Mon, 30 Nov 2020 07:19:32 -0800 (PST)
Received: from localhost.bytedance.net ([103.136.221.68])
        by smtp.gmail.com with ESMTPSA id q12sm16201660pgv.91.2020.11.30.07.19.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Nov 2020 07:19:31 -0800 (PST)
From:   Muchun Song <songmuchun@bytedance.com>
To:     corbet@lwn.net, mike.kravetz@oracle.com, tglx@linutronix.de,
        mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
        dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
        viro@zeniv.linux.org.uk, akpm@linux-foundation.org,
        paulmck@kernel.org, mchehab+huawei@kernel.org,
        pawan.kumar.gupta@linux.intel.com, rdunlap@infradead.org,
        oneukum@suse.com, anshuman.khandual@arm.com, jroedel@suse.de,
        almasrymina@google.com, rientjes@google.com, willy@infradead.org,
        osalvador@suse.de, mhocko@suse.com, song.bao.hua@hisilicon.com
Cc:     duanxiongchun@bytedance.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-fsdevel@vger.kernel.org,
        Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v7 01/15] mm/memory_hotplug: Move bootmem info registration API to bootmem_info.c
Date:   Mon, 30 Nov 2020 23:18:24 +0800
Message-Id: <20201130151838.11208-2-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
In-Reply-To: <20201130151838.11208-1-songmuchun@bytedance.com>
References: <20201130151838.11208-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Move bootmem info registration common API to individual bootmem_info.c
for later patch use. This is just code movement without any functional
change.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Acked-by: Mike Kravetz <mike.kravetz@oracle.com>
Reviewed-by: Oscar Salvador <osalvador@suse.de>
---
 arch/x86/mm/init_64.c          |  1 +
 include/linux/bootmem_info.h   | 27 ++++++++++++
 include/linux/memory_hotplug.h | 23 ----------
 mm/Makefile                    |  1 +
 mm/bootmem_info.c              | 99 ++++++++++++++++++++++++++++++++++++++++++
 mm/memory_hotplug.c            | 91 +-------------------------------------
 6 files changed, 129 insertions(+), 113 deletions(-)
 create mode 100644 include/linux/bootmem_info.h
 create mode 100644 mm/bootmem_info.c

diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
index b5a3fa4033d3..c7f7ad55b625 100644
--- a/arch/x86/mm/init_64.c
+++ b/arch/x86/mm/init_64.c
@@ -33,6 +33,7 @@
 #include <linux/nmi.h>
 #include <linux/gfp.h>
 #include <linux/kcore.h>
+#include <linux/bootmem_info.h>
 
 #include <asm/processor.h>
 #include <asm/bios_ebda.h>
diff --git a/include/linux/bootmem_info.h b/include/linux/bootmem_info.h
new file mode 100644
index 000000000000..65bb9b23140f
--- /dev/null
+++ b/include/linux/bootmem_info.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __LINUX_BOOTMEM_INFO_H
+#define __LINUX_BOOTMEM_INFO_H
+
+#include <linux/mmzone.h>
+
+/*
+ * Types for free bootmem stored in page->lru.next. These have to be in
+ * some random range in unsigned long space for debugging purposes.
+ */
+enum {
+	MEMORY_HOTPLUG_MIN_BOOTMEM_TYPE = 12,
+	SECTION_INFO = MEMORY_HOTPLUG_MIN_BOOTMEM_TYPE,
+	MIX_SECTION_INFO,
+	NODE_INFO,
+	MEMORY_HOTPLUG_MAX_BOOTMEM_TYPE = NODE_INFO,
+};
+
+#ifdef CONFIG_HAVE_BOOTMEM_INFO_NODE
+void __init register_page_bootmem_info_node(struct pglist_data *pgdat);
+#else
+static inline void register_page_bootmem_info_node(struct pglist_data *pgdat)
+{
+}
+#endif
+
+#endif /* __LINUX_BOOTMEM_INFO_H */
diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplug.h
index 15acce5ab106..aec3c3158d6b 100644
--- a/include/linux/memory_hotplug.h
+++ b/include/linux/memory_hotplug.h
@@ -33,18 +33,6 @@ struct vmem_altmap;
 	___page;						   \
 })
 
-/*
- * Types for free bootmem stored in page->lru.next. These have to be in
- * some random range in unsigned long space for debugging purposes.
- */
-enum {
-	MEMORY_HOTPLUG_MIN_BOOTMEM_TYPE = 12,
-	SECTION_INFO = MEMORY_HOTPLUG_MIN_BOOTMEM_TYPE,
-	MIX_SECTION_INFO,
-	NODE_INFO,
-	MEMORY_HOTPLUG_MAX_BOOTMEM_TYPE = NODE_INFO,
-};
-
 /* Types for control the zone type of onlined and offlined memory */
 enum {
 	/* Offline the memory. */
@@ -222,13 +210,6 @@ static inline void arch_refresh_nodedata(int nid, pg_data_t *pgdat)
 #endif /* CONFIG_NUMA */
 #endif /* CONFIG_HAVE_ARCH_NODEDATA_EXTENSION */
 
-#ifdef CONFIG_HAVE_BOOTMEM_INFO_NODE
-extern void __init register_page_bootmem_info_node(struct pglist_data *pgdat);
-#else
-static inline void register_page_bootmem_info_node(struct pglist_data *pgdat)
-{
-}
-#endif
 extern void put_page_bootmem(struct page *page);
 extern void get_page_bootmem(unsigned long ingo, struct page *page,
 			     unsigned long type);
@@ -260,10 +241,6 @@ static inline void zone_span_writelock(struct zone *zone) {}
 static inline void zone_span_writeunlock(struct zone *zone) {}
 static inline void zone_seqlock_init(struct zone *zone) {}
 
-static inline void register_page_bootmem_info_node(struct pglist_data *pgdat)
-{
-}
-
 static inline int try_online_node(int nid)
 {
 	return 0;
diff --git a/mm/Makefile b/mm/Makefile
index a1af02ba8f3f..ed4b88fa0f5e 100644
--- a/mm/Makefile
+++ b/mm/Makefile
@@ -83,6 +83,7 @@ obj-$(CONFIG_SLUB) += slub.o
 obj-$(CONFIG_KASAN)	+= kasan/
 obj-$(CONFIG_KFENCE) += kfence/
 obj-$(CONFIG_FAILSLAB) += failslab.o
+obj-$(CONFIG_HAVE_BOOTMEM_INFO_NODE) += bootmem_info.o
 obj-$(CONFIG_MEMORY_HOTPLUG) += memory_hotplug.o
 obj-$(CONFIG_MEMTEST)		+= memtest.o
 obj-$(CONFIG_MIGRATION) += migrate.o
diff --git a/mm/bootmem_info.c b/mm/bootmem_info.c
new file mode 100644
index 000000000000..39fa8fc120bc
--- /dev/null
+++ b/mm/bootmem_info.c
@@ -0,0 +1,99 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ *  linux/mm/bootmem_info.c
+ *
+ *  Copyright (C)
+ */
+#include <linux/mm.h>
+#include <linux/compiler.h>
+#include <linux/memblock.h>
+#include <linux/bootmem_info.h>
+#include <linux/memory_hotplug.h>
+
+#ifndef CONFIG_SPARSEMEM_VMEMMAP
+static void register_page_bootmem_info_section(unsigned long start_pfn)
+{
+	unsigned long mapsize, section_nr, i;
+	struct mem_section *ms;
+	struct page *page, *memmap;
+	struct mem_section_usage *usage;
+
+	section_nr = pfn_to_section_nr(start_pfn);
+	ms = __nr_to_section(section_nr);
+
+	/* Get section's memmap address */
+	memmap = sparse_decode_mem_map(ms->section_mem_map, section_nr);
+
+	/*
+	 * Get page for the memmap's phys address
+	 * XXX: need more consideration for sparse_vmemmap...
+	 */
+	page = virt_to_page(memmap);
+	mapsize = sizeof(struct page) * PAGES_PER_SECTION;
+	mapsize = PAGE_ALIGN(mapsize) >> PAGE_SHIFT;
+
+	/* remember memmap's page */
+	for (i = 0; i < mapsize; i++, page++)
+		get_page_bootmem(section_nr, page, SECTION_INFO);
+
+	usage = ms->usage;
+	page = virt_to_page(usage);
+
+	mapsize = PAGE_ALIGN(mem_section_usage_size()) >> PAGE_SHIFT;
+
+	for (i = 0; i < mapsize; i++, page++)
+		get_page_bootmem(section_nr, page, MIX_SECTION_INFO);
+
+}
+#else /* CONFIG_SPARSEMEM_VMEMMAP */
+static void register_page_bootmem_info_section(unsigned long start_pfn)
+{
+	unsigned long mapsize, section_nr, i;
+	struct mem_section *ms;
+	struct page *page, *memmap;
+	struct mem_section_usage *usage;
+
+	section_nr = pfn_to_section_nr(start_pfn);
+	ms = __nr_to_section(section_nr);
+
+	memmap = sparse_decode_mem_map(ms->section_mem_map, section_nr);
+
+	register_page_bootmem_memmap(section_nr, memmap, PAGES_PER_SECTION);
+
+	usage = ms->usage;
+	page = virt_to_page(usage);
+
+	mapsize = PAGE_ALIGN(mem_section_usage_size()) >> PAGE_SHIFT;
+
+	for (i = 0; i < mapsize; i++, page++)
+		get_page_bootmem(section_nr, page, MIX_SECTION_INFO);
+}
+#endif /* !CONFIG_SPARSEMEM_VMEMMAP */
+
+void __init register_page_bootmem_info_node(struct pglist_data *pgdat)
+{
+	unsigned long i, pfn, end_pfn, nr_pages;
+	int node = pgdat->node_id;
+	struct page *page;
+
+	nr_pages = PAGE_ALIGN(sizeof(struct pglist_data)) >> PAGE_SHIFT;
+	page = virt_to_page(pgdat);
+
+	for (i = 0; i < nr_pages; i++, page++)
+		get_page_bootmem(node, page, NODE_INFO);
+
+	pfn = pgdat->node_start_pfn;
+	end_pfn = pgdat_end_pfn(pgdat);
+
+	/* register section info */
+	for (; pfn < end_pfn; pfn += PAGES_PER_SECTION) {
+		/*
+		 * Some platforms can assign the same pfn to multiple nodes - on
+		 * node0 as well as nodeN.  To avoid registering a pfn against
+		 * multiple nodes we check that this pfn does not already
+		 * reside in some other nodes.
+		 */
+		if (pfn_valid(pfn) && (early_pfn_to_nid(pfn) == node))
+			register_page_bootmem_info_section(pfn);
+	}
+}
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index a8cef4955907..66fb1daf2252 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -21,6 +21,7 @@
 #include <linux/memory.h>
 #include <linux/memremap.h>
 #include <linux/memory_hotplug.h>
+#include <linux/bootmem_info.h>
 #include <linux/highmem.h>
 #include <linux/vmalloc.h>
 #include <linux/ioport.h>
@@ -167,96 +168,6 @@ void put_page_bootmem(struct page *page)
 	}
 }
 
-#ifdef CONFIG_HAVE_BOOTMEM_INFO_NODE
-#ifndef CONFIG_SPARSEMEM_VMEMMAP
-static void register_page_bootmem_info_section(unsigned long start_pfn)
-{
-	unsigned long mapsize, section_nr, i;
-	struct mem_section *ms;
-	struct page *page, *memmap;
-	struct mem_section_usage *usage;
-
-	section_nr = pfn_to_section_nr(start_pfn);
-	ms = __nr_to_section(section_nr);
-
-	/* Get section's memmap address */
-	memmap = sparse_decode_mem_map(ms->section_mem_map, section_nr);
-
-	/*
-	 * Get page for the memmap's phys address
-	 * XXX: need more consideration for sparse_vmemmap...
-	 */
-	page = virt_to_page(memmap);
-	mapsize = sizeof(struct page) * PAGES_PER_SECTION;
-	mapsize = PAGE_ALIGN(mapsize) >> PAGE_SHIFT;
-
-	/* remember memmap's page */
-	for (i = 0; i < mapsize; i++, page++)
-		get_page_bootmem(section_nr, page, SECTION_INFO);
-
-	usage = ms->usage;
-	page = virt_to_page(usage);
-
-	mapsize = PAGE_ALIGN(mem_section_usage_size()) >> PAGE_SHIFT;
-
-	for (i = 0; i < mapsize; i++, page++)
-		get_page_bootmem(section_nr, page, MIX_SECTION_INFO);
-
-}
-#else /* CONFIG_SPARSEMEM_VMEMMAP */
-static void register_page_bootmem_info_section(unsigned long start_pfn)
-{
-	unsigned long mapsize, section_nr, i;
-	struct mem_section *ms;
-	struct page *page, *memmap;
-	struct mem_section_usage *usage;
-
-	section_nr = pfn_to_section_nr(start_pfn);
-	ms = __nr_to_section(section_nr);
-
-	memmap = sparse_decode_mem_map(ms->section_mem_map, section_nr);
-
-	register_page_bootmem_memmap(section_nr, memmap, PAGES_PER_SECTION);
-
-	usage = ms->usage;
-	page = virt_to_page(usage);
-
-	mapsize = PAGE_ALIGN(mem_section_usage_size()) >> PAGE_SHIFT;
-
-	for (i = 0; i < mapsize; i++, page++)
-		get_page_bootmem(section_nr, page, MIX_SECTION_INFO);
-}
-#endif /* !CONFIG_SPARSEMEM_VMEMMAP */
-
-void __init register_page_bootmem_info_node(struct pglist_data *pgdat)
-{
-	unsigned long i, pfn, end_pfn, nr_pages;
-	int node = pgdat->node_id;
-	struct page *page;
-
-	nr_pages = PAGE_ALIGN(sizeof(struct pglist_data)) >> PAGE_SHIFT;
-	page = virt_to_page(pgdat);
-
-	for (i = 0; i < nr_pages; i++, page++)
-		get_page_bootmem(node, page, NODE_INFO);
-
-	pfn = pgdat->node_start_pfn;
-	end_pfn = pgdat_end_pfn(pgdat);
-
-	/* register section info */
-	for (; pfn < end_pfn; pfn += PAGES_PER_SECTION) {
-		/*
-		 * Some platforms can assign the same pfn to multiple nodes - on
-		 * node0 as well as nodeN.  To avoid registering a pfn against
-		 * multiple nodes we check that this pfn does not already
-		 * reside in some other nodes.
-		 */
-		if (pfn_valid(pfn) && (early_pfn_to_nid(pfn) == node))
-			register_page_bootmem_info_section(pfn);
-	}
-}
-#endif /* CONFIG_HAVE_BOOTMEM_INFO_NODE */
-
 static int check_pfn_span(unsigned long pfn, unsigned long nr_pages,
 		const char *reason)
 {
-- 
2.11.0

