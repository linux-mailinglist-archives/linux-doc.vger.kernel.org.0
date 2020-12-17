Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C42DA2DD151
	for <lists+linux-doc@lfdr.de>; Thu, 17 Dec 2020 13:19:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728408AbgLQMRh (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 17 Dec 2020 07:17:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728405AbgLQMRg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 17 Dec 2020 07:17:36 -0500
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6099C0617A7
        for <linux-doc@vger.kernel.org>; Thu, 17 Dec 2020 04:17:21 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id t8so18923480pfg.8
        for <linux-doc@vger.kernel.org>; Thu, 17 Dec 2020 04:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZGquxPf1EV0i/SFljU8n2h0GszYc756EJNVkGgcQ60w=;
        b=d52ODSzEuxNSk+DAPE+OZN+9tUM4kMz2GttCtNqpeVNMF3oJUU3RhkT+ds8KX8YSOR
         Ll6zqcVbnF+vm4Qx14W3Nb1GaTKX9tu/ABkYs+dc5HZMK5adMgdH36UF5987ETTzt5p7
         u0hGG512y1vP9v47j8VRSr5g+U6Jm4BluVRBaTWNiFaawIB9mHgONsZC6e83noEq/sZL
         aVr1PdyKquHO1ozUYvvuTYUCVuo3pENGI+2phVFViYJWKeDFm410O9Wd1Rmmp+ND4rPm
         hic0bncLqS+HhlqPNnDAFwYmbstrT3A5Pf/wJApwzK4t39Ac+k30glMV7kJFup1Tura9
         YZ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZGquxPf1EV0i/SFljU8n2h0GszYc756EJNVkGgcQ60w=;
        b=Jy1sZxn2ArkQH3Tt3BF4Il8ZPd1nx8pKbRWWgrqzPUUCoXW2lnAYItU6j94F5+ixFE
         1T9EdprdtwYVIxvZTqf0KAljwp7je1Cl+nP6NnJURwsqK9p0gkD47Q0wCSltlbYX3UJC
         27LiOjXglA7ZgsSklH4VLa7AIQCe2AFNUro60qDMzhRKy7vthfC3dApf8T0ErAlm07l2
         pnghyLGoOOq1JYBnLxCOV0sby83Up2V0X0hhj8qPQWfqUOIJiVskuUtrNyZqxWtGKeYe
         cbAGis36jwMCG7fQj+SGQB3IZp+jUvZLsURXMM10I3i+u6HUIFAxTQJh9r9AEfsG4R7u
         TMsA==
X-Gm-Message-State: AOAM5327UsKpfuidpbvaJRsvlLZM9JrgTGcPgrEBhN/LJZTBdKAuEFb8
        SiMUiiNxmuKMa4JdvmWQkWAhjw==
X-Google-Smtp-Source: ABdhPJx8m2RwXsULLtvEJyDlYNAOxN+ElSqljhirypTgiE27YWdoDg179GudIS25d1hZt7LC9EwM3g==
X-Received: by 2002:a62:1716:0:b029:19d:b78b:ef02 with SMTP id 22-20020a6217160000b029019db78bef02mr9035007pfx.11.1608207441163;
        Thu, 17 Dec 2020 04:17:21 -0800 (PST)
Received: from localhost.localdomain ([139.177.225.237])
        by smtp.gmail.com with ESMTPSA id n15sm2775691pgl.31.2020.12.17.04.17.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Dec 2020 04:17:20 -0800 (PST)
From:   Muchun Song <songmuchun@bytedance.com>
To:     corbet@lwn.net, mike.kravetz@oracle.com, tglx@linutronix.de,
        mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
        dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
        viro@zeniv.linux.org.uk, akpm@linux-foundation.org,
        paulmck@kernel.org, mchehab+huawei@kernel.org,
        pawan.kumar.gupta@linux.intel.com, rdunlap@infradead.org,
        oneukum@suse.com, anshuman.khandual@arm.com, jroedel@suse.de,
        almasrymina@google.com, rientjes@google.com, willy@infradead.org,
        osalvador@suse.de, mhocko@suse.com, song.bao.hua@hisilicon.com,
        david@redhat.com, naoya.horiguchi@nec.com
Cc:     duanxiongchun@bytedance.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-fsdevel@vger.kernel.org,
        Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v10 09/11] mm/hugetlb: Introduce nr_free_vmemmap_pages in the struct hstate
Date:   Thu, 17 Dec 2020 20:13:01 +0800
Message-Id: <20201217121303.13386-10-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
In-Reply-To: <20201217121303.13386-1-songmuchun@bytedance.com>
References: <20201217121303.13386-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

All the infrastructure is ready, so we introduce nr_free_vmemmap_pages
field in the hstate to indicate how many vmemmap pages associated with
a HugeTLB page that can be freed to buddy allocator. And initialize it
in the hugetlb_vmemmap_init(). This patch is actual enablement of the
feature.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Acked-by: Mike Kravetz <mike.kravetz@oracle.com>
Reviewed-by: Oscar Salvador <osalvador@suse.de>
---
 include/linux/hugetlb.h |  3 +++
 mm/hugetlb.c            |  1 +
 mm/hugetlb_vmemmap.c    | 33 +++++++++++++++++++++++++++++++++
 mm/hugetlb_vmemmap.h    | 10 ++++++----
 4 files changed, 43 insertions(+), 4 deletions(-)

diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index 7f47f0eeca3b..66d82ae7b712 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -492,6 +492,9 @@ struct hstate {
 	unsigned int nr_huge_pages_node[MAX_NUMNODES];
 	unsigned int free_huge_pages_node[MAX_NUMNODES];
 	unsigned int surplus_huge_pages_node[MAX_NUMNODES];
+#ifdef CONFIG_HUGETLB_PAGE_FREE_VMEMMAP
+	unsigned int nr_free_vmemmap_pages;
+#endif
 #ifdef CONFIG_CGROUP_HUGETLB
 	/* cgroup control files */
 	struct cftype cgroup_files_dfl[7];
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index fea8a96dd718..6c02f49959fd 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -3326,6 +3326,7 @@ void __init hugetlb_add_hstate(unsigned int order)
 	h->next_nid_to_free = first_memory_node;
 	snprintf(h->name, HSTATE_NAME_LEN, "hugepages-%lukB",
 					huge_page_size(h)/1024);
+	hugetlb_vmemmap_init(h);
 
 	parsed_hstate = h;
 }
diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 9e9bd458a3f5..3ebfe1706c77 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -166,6 +166,8 @@
  * (last) level. So this type of HugeTLB page can be optimized only when its
  * size of the struct page structs is greater than 2 pages.
  */
+#define pr_fmt(fmt)	"HugeTLB: " fmt
+
 #include "hugetlb_vmemmap.h"
 
 /*
@@ -182,6 +184,12 @@ bool hugetlb_free_vmemmap_enabled;
 
 static int __init early_hugetlb_free_vmemmap_param(char *buf)
 {
+	/* We cannot optimize if a "struct page" crosses page boundaries. */
+	if ((!is_power_of_2(sizeof(struct page)))) {
+		pr_warn("cannot free vmemmap pages because \"struct page\" crosses page boundaries\n");
+		return 0;
+	}
+
 	if (!buf)
 		return -EINVAL;
 
@@ -220,3 +228,28 @@ void free_huge_page_vmemmap(struct hstate *h, struct page *head)
 	vmemmap_remap_free(vmemmap_addr + RESERVE_VMEMMAP_SIZE,
 			   free_vmemmap_pages_size_per_hpage(h));
 }
+
+void __init hugetlb_vmemmap_init(struct hstate *h)
+{
+	unsigned int nr_pages = pages_per_huge_page(h);
+	unsigned int vmemmap_pages;
+
+	if (!hugetlb_free_vmemmap_enabled)
+		return;
+
+	vmemmap_pages = (nr_pages * sizeof(struct page)) >> PAGE_SHIFT;
+	/*
+	 * The head page and the first tail page are not to be freed to buddy
+	 * allocator, the other pages will map to the first tail page, so they
+	 * can be freed.
+	 *
+	 * Could RESERVE_VMEMMAP_NR be greater than @vmemmap_pages? It is true
+	 * on some architectures (e.g. aarch64). See Documentation/arm64/
+	 * hugetlbpage.rst for more details.
+	 */
+	if (likely(vmemmap_pages > RESERVE_VMEMMAP_NR))
+		h->nr_free_vmemmap_pages = vmemmap_pages - RESERVE_VMEMMAP_NR;
+
+	pr_info("can free %d vmemmap pages for %s\n", h->nr_free_vmemmap_pages,
+		h->name);
+}
diff --git a/mm/hugetlb_vmemmap.h b/mm/hugetlb_vmemmap.h
index b2c8d2f11d48..8fd9ae113dbd 100644
--- a/mm/hugetlb_vmemmap.h
+++ b/mm/hugetlb_vmemmap.h
@@ -13,17 +13,15 @@
 #ifdef CONFIG_HUGETLB_PAGE_FREE_VMEMMAP
 void alloc_huge_page_vmemmap(struct hstate *h, struct page *head);
 void free_huge_page_vmemmap(struct hstate *h, struct page *head);
+void hugetlb_vmemmap_init(struct hstate *h);
 
 /*
  * How many vmemmap pages associated with a HugeTLB page that can be freed
  * to the buddy allocator.
- *
- * Todo: Returns zero for now, which means the feature is disabled. We will
- * enable it once all the infrastructure is there.
  */
 static inline unsigned int free_vmemmap_pages_per_hpage(struct hstate *h)
 {
-	return 0;
+	return h->nr_free_vmemmap_pages;
 }
 #else
 static inline void alloc_huge_page_vmemmap(struct hstate *h, struct page *head)
@@ -38,5 +36,9 @@ static inline unsigned int free_vmemmap_pages_per_hpage(struct hstate *h)
 {
 	return 0;
 }
+
+static inline void hugetlb_vmemmap_init(struct hstate *h)
+{
+}
 #endif /* CONFIG_HUGETLB_PAGE_FREE_VMEMMAP */
 #endif /* _LINUX_HUGETLB_VMEMMAP_H */
-- 
2.11.0

