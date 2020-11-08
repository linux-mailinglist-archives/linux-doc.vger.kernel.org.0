Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D2042AAB89
	for <lists+linux-doc@lfdr.de>; Sun,  8 Nov 2020 15:14:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728911AbgKHOO2 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 8 Nov 2020 09:14:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728887AbgKHOO1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 8 Nov 2020 09:14:27 -0500
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5126CC0613D3
        for <linux-doc@vger.kernel.org>; Sun,  8 Nov 2020 06:14:26 -0800 (PST)
Received: by mail-pf1-x444.google.com with SMTP id z3so5498931pfb.10
        for <linux-doc@vger.kernel.org>; Sun, 08 Nov 2020 06:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JQobaiL/2z+J7n7cUT8D73Vv1rVUSdnEtfcckH7xNUc=;
        b=TQI4RgR+eZKPIpHCcExujStJETh7EgtxIcThT90CaF/OshoASZBCYswpsMUlYJF1Ls
         F6QCz0qeeZ9bCkGft5YO/iHzAWqWKSn7E58avQlNL8NGabj7QhtvVnfMmHeSZBcYItci
         uFVAIgzooed5nMDoyuppTHMJal3MkK/QKMt7cMl0eJkyfkQYStJohj2dxygQ0QNtFrYj
         35vu4IPC8iVHz8kgtbsqglpHt7SLRgVdVJRmN2viK5a66qVXQWjwlUE2hlvQjm6VEVXd
         CJwsZ5n/4hPxuEO23NtFXTUu7TOa9Bik/RNq4lbVaRRTcjlNAvIgqp8KQpix9WisNBTv
         zF/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JQobaiL/2z+J7n7cUT8D73Vv1rVUSdnEtfcckH7xNUc=;
        b=jVykCwekbk1pnr9ltoDOR862+NMTnAVSTav6QQvjtcjJ53IFRATwGobSm897hxA55u
         XSpIYDWfbeEypjeoRZQgVehOJywZUmEGk1MVSOg88h3yHvUSF67OfltaHTkVXRb9vqlc
         OjoBZ4Xz2Iq8Oydqs9h8euEz8Yhe7B7UzmPVkomocxQCAzv5ER2dAAEJqeticR2oPV0o
         B1/C+DQpgrBPa0k+NKqtYLoQb2bHClrRHP7m38ABmX/PHS8UHepRA+doIdhApS/KNw3b
         QBj13pX5o3HIfRSY9tGiVBUtJxhehQp1cXvkIsle8L8QyOLXVKLijOj2qRfg/uJlH/SV
         2syw==
X-Gm-Message-State: AOAM531c7sw+/9iZDbYoOVBuM+guX4NxyyiejdfnyPRMT8ztBQxAoHyQ
        Y+iH0YtPg2s8BFPDpqygdapm/g==
X-Google-Smtp-Source: ABdhPJzfdzQqKF1Uc7p58Hp6FF6AnMq9qsLXcQVTzmZlu+VVJFRP/h/1IY5DA4v2QatxdHbEd5Y3Xw==
X-Received: by 2002:a63:4d64:: with SMTP id n36mr234404pgl.203.1604844865926;
        Sun, 08 Nov 2020 06:14:25 -0800 (PST)
Received: from localhost.localdomain ([103.136.220.94])
        by smtp.gmail.com with ESMTPSA id z11sm8754047pfk.52.2020.11.08.06.14.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 08 Nov 2020 06:14:25 -0800 (PST)
From:   Muchun Song <songmuchun@bytedance.com>
To:     corbet@lwn.net, mike.kravetz@oracle.com, tglx@linutronix.de,
        mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
        dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
        viro@zeniv.linux.org.uk, akpm@linux-foundation.org,
        paulmck@kernel.org, mchehab+huawei@kernel.org,
        pawan.kumar.gupta@linux.intel.com, rdunlap@infradead.org,
        oneukum@suse.com, anshuman.khandual@arm.com, jroedel@suse.de,
        almasrymina@google.com, rientjes@google.com, willy@infradead.org,
        osalvador@suse.de, mhocko@suse.com
Cc:     duanxiongchun@bytedance.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-fsdevel@vger.kernel.org,
        Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v3 16/21] mm/hugetlb: Set the PageHWPoison to the raw error page
Date:   Sun,  8 Nov 2020 22:11:08 +0800
Message-Id: <20201108141113.65450-17-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
In-Reply-To: <20201108141113.65450-1-songmuchun@bytedance.com>
References: <20201108141113.65450-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Because we reuse the first tail page, if we set PageHWPosion on a
tail page. It indicates that we may set PageHWPoison on a series
of pages. So we can use the head[4].mapping to record the real
error page index and set the raw error page PageHWPoison later.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 mm/hugetlb.c | 50 ++++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 42 insertions(+), 8 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 5aaa274b0684..00a6e97629aa 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -1794,6 +1794,29 @@ static inline void free_gigantic_page(struct hstate *h, struct page *page)
 {
 	__free_gigantic_page(page, huge_page_order(h));
 }
+
+static inline void subpage_hwpoison_deliver(struct page *head)
+{
+	struct page *page = head;
+
+	if (PageHWPoison(head))
+		page = head + page_private(head + 4);
+
+	/*
+	 * Move PageHWPoison flag from head page to the raw error page,
+	 * which makes any subpages rather than the error page reusable.
+	 */
+	if (page != head) {
+		SetPageHWPoison(page);
+		ClearPageHWPoison(head);
+	}
+}
+
+static inline void set_subpage_hwpoison(struct page *head, struct page *page)
+{
+	if (PageHWPoison(head))
+		set_page_private(head + 4, page - head);
+}
 #else
 static inline void hugetlb_vmemmap_init(struct hstate *h)
 {
@@ -1841,6 +1864,22 @@ static inline void free_gigantic_page(struct hstate *h, struct page *page)
 	__free_gigantic_page(page, huge_page_order(h));
 	spin_lock(&hugetlb_lock);
 }
+
+static inline void subpage_hwpoison_deliver(struct page *head)
+{
+}
+
+static inline void set_subpage_hwpoison(struct page *head, struct page *page)
+{
+	/*
+	 * Move PageHWPoison flag from head page to the raw error page,
+	 * which makes any subpages rather than the error page reusable.
+	 */
+	if (PageHWPoison(head) && page != head) {
+		SetPageHWPoison(page);
+		ClearPageHWPoison(head);
+	}
+}
 #endif
 
 static void update_and_free_page(struct hstate *h, struct page *page)
@@ -1859,6 +1898,7 @@ static void __free_hugepage(struct hstate *h, struct page *page)
 	int i;
 
 	alloc_huge_page_vmemmap(h, page);
+	subpage_hwpoison_deliver(page);
 
 	for (i = 0; i < pages_per_huge_page(h); i++) {
 		page[i].flags &= ~(1 << PG_locked | 1 << PG_error |
@@ -2416,14 +2456,8 @@ int dissolve_free_huge_page(struct page *page)
 		int nid = page_to_nid(head);
 		if (h->free_huge_pages - h->resv_huge_pages == 0)
 			goto out;
-		/*
-		 * Move PageHWPoison flag from head page to the raw error page,
-		 * which makes any subpages rather than the error page reusable.
-		 */
-		if (PageHWPoison(head) && page != head) {
-			SetPageHWPoison(page);
-			ClearPageHWPoison(head);
-		}
+
+		set_subpage_hwpoison(head, page);
 		list_del(&head->lru);
 		h->free_huge_pages--;
 		h->free_huge_pages_node[nid]--;
-- 
2.11.0

