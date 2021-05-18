Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7C82387552
	for <lists+linux-doc@lfdr.de>; Tue, 18 May 2021 11:40:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241065AbhERJlc (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 18 May 2021 05:41:32 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:51887 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S240748AbhERJlb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 18 May 2021 05:41:31 -0400
X-UUID: da7467a847004e538062abc99583bfc3-20210518
X-UUID: da7467a847004e538062abc99583bfc3-20210518
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
        (envelope-from <miles.chen@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 880833508; Tue, 18 May 2021 17:40:10 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 18 May 2021 17:40:08 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 18 May 2021 17:40:09 +0800
From:   Miles Chen <miles.chen@mediatek.com>
To:     Dave Young <dyoung@redhat.com>, Baoquan He <bhe@redhat.com>,
        Vivek Goyal <vgoyal@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mike Rapoport <rppt@kernel.org>
CC:     <kexec@lists.infradead.org>, <linux-doc@vger.kernel.org>,
        <linuxppc-dev@lists.ozlabs.org>, <linux-mm@kvack.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        Miles Chen <miles.chen@mediatek.com>, Kazu <k-hagio-ab@nec.com>
Subject: [PATCH v2 1/2] mm: introduce prepare_node_data
Date:   Tue, 18 May 2021 17:24:45 +0800
Message-ID: <20210518092446.16382-2-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210518092446.16382-1-miles.chen@mediatek.com>
References: <20210518092446.16382-1-miles.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

When CONFIG_NEED_MULTIPLE_NODES=y (CONFIG_NUMA=y),
the pglist_data is allocated by a memblock API and stored in an array
named node_data[].
When CONFIG_NEED_MULTIPLE_NODES=n (CONFIG_NUMA=n), the pglist_data
is defined as global variable contig_page_data. The difference
causes problems when we enable CONFIG_DEBUG_VIRTUAL and use __pa()
to get the physical address of NODE_DATA.

To solve the issue, introduce prepare_node_data() to allocate
pglist_data when CONFIG_NUMA=n and stored it to node_data.
i.e., Use the same way to allocate node_data[] when CONFIG_NUMA=y
or CONFIG_NUMA=n.
prepare_node_data() is called in sparer_init() and
free_area_init().

This is the first step to replace contig_page_data with allocated
pglist_data.

Cc: Mike Rapoport <rppt@kernel.org>
Cc: Baoquan He <bhe@redhat.com>
Cc: Kazu <k-hagio-ab@nec.com>
Signed-off-by: Miles Chen <miles.chen@mediatek.com>
---
 include/linux/mm.h     |  2 ++
 include/linux/mmzone.h |  1 +
 mm/memblock.c          |  1 +
 mm/page_alloc.c        | 16 ++++++++++++++++
 mm/sparse.c            |  2 ++
 5 files changed, 22 insertions(+)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index c274f75efcf9..3052eeb87455 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2462,9 +2462,11 @@ static inline int early_pfn_to_nid(unsigned long pfn)
 {
 	return 0;
 }
+extern void prepare_node_data(void);
 #else
 /* please see mm/page_alloc.c */
 extern int __meminit early_pfn_to_nid(unsigned long pfn);
+static inline void prepare_node_data(void) {};
 #endif
 
 extern void set_dma_reserve(unsigned long new_dma_reserve);
diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 0d53eba1c383..557918dcc755 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -1045,6 +1045,7 @@ extern char numa_zonelist_order[];
 
 extern struct pglist_data contig_page_data;
 #define NODE_DATA(nid)		(&contig_page_data)
+extern struct pglist_data *node_data[];
 #define NODE_MEM_MAP(nid)	mem_map
 
 #else /* CONFIG_NEED_MULTIPLE_NODES */
diff --git a/mm/memblock.c b/mm/memblock.c
index afaefa8fc6ab..ebddb57ea62d 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -95,6 +95,7 @@
 #ifndef CONFIG_NEED_MULTIPLE_NODES
 struct pglist_data __refdata contig_page_data;
 EXPORT_SYMBOL(contig_page_data);
+struct pglist_data *node_data[MAX_NUMNODES];
 #endif
 
 unsigned long max_low_pfn;
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index aaa1655cf682..0c6d421f4cfb 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -1659,6 +1659,20 @@ int __meminit early_pfn_to_nid(unsigned long pfn)
 
 	return nid;
 }
+#else
+void __init prepare_node_data(void)
+{
+	if (node_data[0])
+		return;
+
+	node_data[0] = memblock_alloc(sizeof(struct pglist_data),
+			SMP_CACHE_BYTES);
+
+	if (!node_data[0])
+		panic("Cannot allocate node_data\n");
+
+	memset(node_data[0], 0, sizeof(struct pglist_data));
+}
 #endif /* CONFIG_NEED_MULTIPLE_NODES */
 
 void __init memblock_free_pages(struct page *page, unsigned long pfn,
@@ -7697,6 +7711,8 @@ void __init free_area_init(unsigned long *max_zone_pfn)
 	int i, nid, zone;
 	bool descending;
 
+	prepare_node_data();
+
 	/* Record where the zone boundaries are */
 	memset(arch_zone_lowest_possible_pfn, 0,
 				sizeof(arch_zone_lowest_possible_pfn));
diff --git a/mm/sparse.c b/mm/sparse.c
index b2ada9dc00cb..afcfe7463b4a 100644
--- a/mm/sparse.c
+++ b/mm/sparse.c
@@ -580,6 +580,8 @@ void __init sparse_init(void)
 
 	memblocks_present();
 
+	prepare_node_data();
+
 	pnum_begin = first_present_section_nr();
 	nid_begin = sparse_early_nid(__nr_to_section(pnum_begin));
 
-- 
2.18.0

