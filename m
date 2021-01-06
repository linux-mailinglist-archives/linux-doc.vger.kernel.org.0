Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE5742EBF6C
	for <lists+linux-doc@lfdr.de>; Wed,  6 Jan 2021 15:22:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726789AbhAFOVm (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 6 Jan 2021 09:21:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726824AbhAFOVj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 6 Jan 2021 09:21:39 -0500
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED6C5C061368
        for <linux-doc@vger.kernel.org>; Wed,  6 Jan 2021 06:21:19 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id t22so1797862pfl.3
        for <linux-doc@vger.kernel.org>; Wed, 06 Jan 2021 06:21:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tAzAJAw7JBXGA5wVumCYbe7IIg4huGuKzHI34tpedh0=;
        b=cRqAYxHyJbX7YeU4wGKVevY+gX+UO5+n2EFM5VUKppi8e1TN50jJ0kr0OAF2eoIAQc
         RzYcLvtCy0eHMi+lUwpodnvaJIWU6N9N0o56Jw7x7upuE+LDFC8KoXxveztDty1wL1xP
         TgJOtQHLtxvlkvYgq8GEfUXCI4e6S2Fc2tm3ExXIUrvQJ2cTJFXJFMYa3UugLhmlnXAe
         44Bd+PdMNgn1IL9BfjPfkEV2sc9MrakuFPEzYGDX3oteNEbXtiPN9uP/0emYNb+lMZH0
         FTMv/JaSsJ5/lp/cX5e2u8+d/SCCguNyrpX3Tl6w9RCLmvb8AikIGzfEr563TIIzKbpu
         n+pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tAzAJAw7JBXGA5wVumCYbe7IIg4huGuKzHI34tpedh0=;
        b=lWLul6/RPxyvxp5AddSA5LiBc+UbDNLkmuAWIDIu6V4EuAMI8D/qj5ZSmrFfUYnrGg
         OOZQDBTOarq9lfp/Lud4ltc/p1bQlYDHr0f3mLb2+1p9v07QPKYYqqMbrXO2jq/Nwy2V
         SWCYpdoPoidXOAnEU8CYygncxUOLV+rs0cMBSMq83tubBAJXIi6doIoUPqdNZQv+JFIK
         d8DznXvDv58+hSB0VFhinFlwD5jge3stbkxwQcxl4isQGBchTwV9j/XG4K3S53Su+kSd
         6HxfpVEvVEvzLrWraWVGvG1J9rXSl6vZm+24VQiOhwRnDYIPe+iK3CyBtmAVw7ifbc8k
         8Uig==
X-Gm-Message-State: AOAM5300yJnVuD+wfrJqy+EIjBF+JaWVshjNTfA4AQd9fN1t9qQ6gaz4
        Rb2HjsbG3Mq55sQEDeNdjX0JuQ==
X-Google-Smtp-Source: ABdhPJw8Kq3eOp+bJUy2O7vUTNV9UY3ASg8NlBZmBdiOin6ggzgAqt5c16GMqgcMkPnZA8j8nIPraw==
X-Received: by 2002:a63:1f21:: with SMTP id f33mr4732161pgf.31.1609942879534;
        Wed, 06 Jan 2021 06:21:19 -0800 (PST)
Received: from localhost.bytedance.net ([139.177.225.232])
        by smtp.gmail.com with ESMTPSA id a29sm2831730pfr.73.2021.01.06.06.21.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 06 Jan 2021 06:21:18 -0800 (PST)
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
Subject: [PATCH v12 07/13] mm/hugetlb: Set the PageHWPoison to the raw error page
Date:   Wed,  6 Jan 2021 22:19:25 +0800
Message-Id: <20210106141931.73931-8-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
In-Reply-To: <20210106141931.73931-1-songmuchun@bytedance.com>
References: <20210106141931.73931-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Because we reuse the first tail vmemmap page frame and remap it
with read-only, we cannot set the PageHWPosion on a tail page.
So we can use the head[4].private to record the real error page
index and set the raw error page PageHWPoison later.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Reviewed-by: Oscar Salvador <osalvador@suse.de>
---
 mm/hugetlb.c | 69 +++++++++++++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 61 insertions(+), 8 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index d11c32fcdb38..6caaa7e5dd2a 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -1358,6 +1358,63 @@ static inline void __update_and_free_page(struct hstate *h, struct page *page)
 		schedule_work(&hpage_update_work);
 }
 
+#ifdef CONFIG_HUGETLB_PAGE_FREE_VMEMMAP
+static inline void hwpoison_subpage_deliver(struct hstate *h, struct page *head)
+{
+	struct page *page;
+
+	if (!PageHWPoison(head) || !free_vmemmap_pages_per_hpage(h))
+		return;
+
+	page = head + page_private(head + 4);
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
+static inline void hwpoison_subpage_set(struct hstate *h, struct page *head,
+					struct page *page)
+{
+	if (!PageHWPoison(head))
+		return;
+
+	if (free_vmemmap_pages_per_hpage(h)) {
+		set_page_private(head + 4, page - head);
+	} else if (page != head) {
+		/*
+		 * Move PageHWPoison flag from head page to the raw error page,
+		 * which makes any subpages rather than the error page reusable.
+		 */
+		SetPageHWPoison(page);
+		ClearPageHWPoison(head);
+	}
+}
+
+#else
+static inline void hwpoison_subpage_deliver(struct hstate *h, struct page *head)
+{
+}
+
+static inline void hwpoison_subpage_set(struct hstate *h, struct page *head,
+					struct page *page)
+{
+	if (PageHWPoison(head) && page != head) {
+		/*
+		 * Move PageHWPoison flag from head page to the raw error page,
+		 * which makes any subpages rather than the error page reusable.
+		 */
+		SetPageHWPoison(page);
+		ClearPageHWPoison(head);
+	}
+}
+#endif
+
 static void update_and_free_page(struct hstate *h, struct page *page)
 {
 	if (hstate_is_gigantic(h) && !gigantic_page_runtime_supported())
@@ -1373,6 +1430,8 @@ static void __free_hugepage(struct hstate *h, struct page *page)
 {
 	int i;
 
+	hwpoison_subpage_deliver(h, page);
+
 	for (i = 0; i < pages_per_huge_page(h); i++) {
 		page[i].flags &= ~(1 << PG_locked | 1 << PG_error |
 				1 << PG_referenced | 1 << PG_dirty |
@@ -1845,14 +1904,8 @@ int dissolve_free_huge_page(struct page *page)
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
+		hwpoison_subpage_set(h, head, page);
 		list_del(&head->lru);
 		h->free_huge_pages--;
 		h->free_huge_pages_node[nid]--;
-- 
2.11.0

