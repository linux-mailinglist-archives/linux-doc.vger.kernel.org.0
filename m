Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85F4F2C225E
	for <lists+linux-doc@lfdr.de>; Tue, 24 Nov 2020 11:00:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731777AbgKXJ67 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 24 Nov 2020 04:58:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731775AbgKXJ66 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 24 Nov 2020 04:58:58 -0500
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B116FC061A4D
        for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2020 01:58:58 -0800 (PST)
Received: by mail-pl1-x641.google.com with SMTP id u2so10425851pls.10
        for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2020 01:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AhLUtLFhMowsX7y4QUFW0UEwoN/NQ4MXIPAKrIe+pb4=;
        b=Z5F/w/tm3Uj3uOWyx+XA5NHR0bbcoVlS2LknPto/PCroM31hRPIweQWnTy65FM0+Nd
         0DBzo7aNdGPxnpgna4W+Z/RWKX6GP/rVs4V3l+zZcXsOKkMusa6AcJ8h1c2j+OWp5Ibm
         UcisxXP4wMSLAVbbGLILP52x66590iml6M7Q8F8Q4rnH9h+QEDKv2Ka/whnqoYDBwki3
         jagqwwe7lDrSk9dze123ufHSv/p8nERtOPQ6BHE5nfAb1GQDgyhBvocIgy0hghu31ifr
         xMYofHJkBKmADKxtUfkOsuzLp7tdi3j3qSmPWBPXnCYp+EOrOcpw8ODfN3PV0w4jM/HA
         tTMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AhLUtLFhMowsX7y4QUFW0UEwoN/NQ4MXIPAKrIe+pb4=;
        b=JJCUnj4tHGqg8mTNCoRnBP3IQPnjw6KCNeH5bDynEI2eZsK2CWGwcwM0FAdxL4RFCI
         pFDLae8iwi4dm3hC8F8vbdngq/gpDXHXqq98CG1i78uJ2zc/CiBBnrmshnf1fVbJKGBZ
         e6WjA8DYNNFjA5+ZakIMVeTk0s9+BDuzjPdYshVwmWvyS9CqwPc76yXwOJEojNyXiO5L
         QOEJEPpA3ff1LIgrs8xK9/NXF2VWl4Q9jOzCNdB1o/9EKyhsnDG1xtukeUv+WScTfaFi
         9QgfcEjM72Xf88ikPpVIKAflW14VCr1Ez91zG1nGBJWnCAeU3O/H8Na6Rm527JdiGpdQ
         q/zw==
X-Gm-Message-State: AOAM531sF1yUxx6dvheqKcXxBBRT37/LLvu/fHtBw4GRPXBkoVIJ/3KL
        ZooPTHp4MLs0OSUz2XQ4Rrxp6Q==
X-Google-Smtp-Source: ABdhPJxOhASAWI7bhf2EZ3rDH1q81mI7X3+WN0iuPQlauueb9EcbgaGjAccpG4m6xdjfy0iZs2IWQQ==
X-Received: by 2002:a17:902:bc46:b029:d6:d98a:1a68 with SMTP id t6-20020a170902bc46b02900d6d98a1a68mr3310014plz.63.1606211938283;
        Tue, 24 Nov 2020 01:58:58 -0800 (PST)
Received: from localhost.localdomain ([103.136.220.120])
        by smtp.gmail.com with ESMTPSA id t20sm2424562pjg.25.2020.11.24.01.58.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Nov 2020 01:58:57 -0800 (PST)
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
Subject: [PATCH v6 13/16] mm/hugetlb: Flush work when dissolving hugetlb page
Date:   Tue, 24 Nov 2020 17:52:56 +0800
Message-Id: <20201124095259.58755-14-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
In-Reply-To: <20201124095259.58755-1-songmuchun@bytedance.com>
References: <20201124095259.58755-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

We should flush work when dissolving a hugetlb page to make sure that
the hugetlb page is freed to the buddy.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 mm/hugetlb.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index ade20954eb81..15e2c1dd32ea 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -1328,6 +1328,12 @@ static void update_hpage_vmemmap_workfn(struct work_struct *work)
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
@@ -1914,6 +1920,7 @@ static int free_pool_huge_page(struct hstate *h, nodemask_t *nodes_allowed,
 int dissolve_free_huge_page(struct page *page)
 {
 	int rc = -EBUSY;
+	struct hstate *h = NULL;
 
 	/* Not to disrupt normal path by vainly holding hugetlb_lock */
 	if (!PageHuge(page))
@@ -1927,8 +1934,9 @@ int dissolve_free_huge_page(struct page *page)
 
 	if (!page_count(page)) {
 		struct page *head = compound_head(page);
-		struct hstate *h = page_hstate(head);
 		int nid = page_to_nid(head);
+
+		h = page_hstate(head);
 		if (h->free_huge_pages - h->resv_huge_pages == 0)
 			goto out;
 
@@ -1942,6 +1950,14 @@ int dissolve_free_huge_page(struct page *page)
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

