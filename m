Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42D012E0BD0
	for <lists+linux-doc@lfdr.de>; Tue, 22 Dec 2020 15:33:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727840AbgLVObl (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 22 Dec 2020 09:31:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727838AbgLVObl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 22 Dec 2020 09:31:41 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47D76C0619D9
        for <linux-doc@vger.kernel.org>; Tue, 22 Dec 2020 06:30:49 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id t6so7530972plq.1
        for <linux-doc@vger.kernel.org>; Tue, 22 Dec 2020 06:30:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9ixTyw+PWcrpOZUWRUuN38FW0Yie3cLwnmS8BqQaWcY=;
        b=syrud4TiyWkdgCobLDgE1RM+Zz8RYp2tPWdxL52aS+nWh9iSrej01f5eIpch/a40x+
         DfHQJ43CMk+f5g9Y6ANaIyUuHv8Z8/4z14qVbIeNoZkwisawbknj+4EsIn3U7DzDqgCt
         bmaFDafixH2mLSJ2K/WWVqStj/jlWpmBv8s80j1yQ+GJg69tH7846/ZqwqSQrhfhKH1t
         0d11nbKG3P1aRvFxykRWlmWabmrWEP+7XoYZAoIjAtaC9sxDsxXqAhB1h3+aNjJJ8SdR
         EnDGanvLV4gx/YUnStXjbHsGy4AS4vmul/lNl2u2ISzjhQ33L52Gb+zJps2WdVpNgX/R
         SraQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9ixTyw+PWcrpOZUWRUuN38FW0Yie3cLwnmS8BqQaWcY=;
        b=ePblYpRmfB2r7bVYZgpGqsYmdQB5GOyLahbIde2T/dL11a1jcvZC9cSUCIkkXL2v2X
         5seaUuF1XocTyvsxOPYDk/AXn5VSLTkYMhuII/xNCpvVXRBkJp6Zq69a2wbCQ3dhSwKX
         CXsnvEzFaW3k88vtSrjG3ZdeGdiNGuRX6QdmzsTk/sc0kUaqV5NIIqp5ZdlvohknEqGM
         BMCsmWOuZ6VqZhm1Mws733gf3F8cbysrJ2GrsJDvQxHHofvXq6BmRryBkDyd6DU4Fd99
         LspXRlXQsC7rOJMWC243FMNr3v1rVM8DEbElGnSFbMXD279mwCpUJPqifJzhJBbJUV3p
         2wJQ==
X-Gm-Message-State: AOAM5305e2PZ5fahd52r0wc54HXEvM9B8AeIiOpcNPe4ihIjVAJoIvI6
        kC86SbLlgxEnWl0RHXu3XmMdfQ==
X-Google-Smtp-Source: ABdhPJw8++ajzp2hb8jxN6aHOVxUVkL4c9SQOFtFwJzalAt9FUU6CNJ3NbR3i+TJhFXrgmfkb0py/g==
X-Received: by 2002:a17:902:b493:b029:dc:3e1d:4dda with SMTP id y19-20020a170902b493b02900dc3e1d4ddamr9630798plr.48.1608647448878;
        Tue, 22 Dec 2020 06:30:48 -0800 (PST)
Received: from localhost.bytedance.net ([139.177.225.247])
        by smtp.gmail.com with ESMTPSA id a31sm21182088pgb.93.2020.12.22.06.30.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 Dec 2020 06:30:48 -0800 (PST)
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
Subject: [PATCH v11 07/11] mm/hugetlb: Flush work when dissolving a HugeTLB page
Date:   Tue, 22 Dec 2020 22:24:36 +0800
Message-Id: <20201222142440.28930-8-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
In-Reply-To: <20201222142440.28930-1-songmuchun@bytedance.com>
References: <20201222142440.28930-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

We should flush work when dissolving a HugeTLB page to make sure that
the HugeTLB page is freed to the buddy allocator. Because the caller
of dissolve_free_huge_pages() relies on this guarantee.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Reviewed-by: Oscar Salvador <osalvador@suse.de>
---
 mm/hugetlb.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index dbf4e8eeeff1..3e6aa6cc1f3e 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -1329,6 +1329,12 @@ static void update_hpage_vmemmap_workfn(struct work_struct *work)
 }
 static DECLARE_WORK(hpage_update_work, update_hpage_vmemmap_workfn);
 
+static inline void flush_hpage_update_work(struct hstate *h)
+{
+	if (free_vmemmap_pages_per_hpage(h))
+		flush_work(&hpage_update_work);
+}
+
 static inline void __update_and_free_page(struct hstate *h, struct page *page)
 {
 	/* No need to allocate vmemmap pages */
@@ -1864,6 +1870,7 @@ static int free_pool_huge_page(struct hstate *h, nodemask_t *nodes_allowed,
 int dissolve_free_huge_page(struct page *page)
 {
 	int rc = -EBUSY;
+	struct hstate *h = NULL;
 
 	/* Not to disrupt normal path by vainly holding hugetlb_lock */
 	if (!PageHuge(page))
@@ -1877,8 +1884,9 @@ int dissolve_free_huge_page(struct page *page)
 
 	if (!page_count(page)) {
 		struct page *head = compound_head(page);
-		struct hstate *h = page_hstate(head);
 		int nid = page_to_nid(head);
+
+		h = page_hstate(head);
 		if (h->free_huge_pages - h->resv_huge_pages == 0)
 			goto out;
 
@@ -1892,6 +1900,14 @@ int dissolve_free_huge_page(struct page *page)
 	}
 out:
 	spin_unlock(&hugetlb_lock);
+
+	/*
+	 * We should flush work before return to make sure that
+	 * the HugeTLB page is freed to the buddy.
+	 */
+	if (!rc && h)
+		flush_hpage_update_work(h);
+
 	return rc;
 }
 
-- 
2.11.0

