Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9992C2FFB37
	for <lists+linux-doc@lfdr.de>; Fri, 22 Jan 2021 04:40:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726264AbhAVDja (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 21 Jan 2021 22:39:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726769AbhAVDjS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 21 Jan 2021 22:39:18 -0500
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44AFFC061797
        for <linux-doc@vger.kernel.org>; Thu, 21 Jan 2021 19:37:56 -0800 (PST)
Received: by mail-qk1-x732.google.com with SMTP id 22so3969216qkf.9
        for <linux-doc@vger.kernel.org>; Thu, 21 Jan 2021 19:37:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=gHgQfTRvar1lIU9rNG4Q491ak9Bif38ih9mdt5Czeeg=;
        b=F4bfC0MDMq+CCQDIAOcSqv7KKq8CH/bqQW6VgOe2A1QQxti9PzdEgVD65B3j98095I
         oPz/V+deFRMtRIxLv1F5ibHdEnsr8r5iP5bp8UBgcXgOrR82Mr66i8bDPCsgz6YQfEn6
         khgK/pJ1FLvy01JSBlUPFu+QGov315qqHV1wSQY/0HDf/8n4uQEHUCs79feBH65K6HO8
         fN2oXC1XPcRf3vVTJkr8I1CxhzC0/83oF2rfyGU1IAIQaS2qF4EyULM9+yPm3A8F13hI
         aB1JVyK0lvtoRjLYVyU3LtL58A2N6hHsv2gw/mizCTuuCUDwklZXVZYrjvPT91an8LRU
         vdPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gHgQfTRvar1lIU9rNG4Q491ak9Bif38ih9mdt5Czeeg=;
        b=nGxouxvt/YIlxs6df6QB2AZyFwHlEnSh13h0nHAKA3mw/tUOhybRKgrxMo6wCvkrQz
         rPMngxOTsOf/UKZsjFnGt5WqvWgzUpKjXhapdNakE4nUW3yJBqXMVIX+Kxte1OFYHGct
         FZaPHCZdqSqvh66QYraZpw+jxjziui/iIhir51PUpdvdyHA0EVhzbz8g5VEcg3HmOcdC
         UXlNZ2jH1dDzSd37nLGQm8MCSFcIcHaeEF/dJotFRGXhyn/IxlbUI5P0NOU024K4JP/d
         ttKqCxbtisZk2pkvQ1mEf12e1+CBYxVsrbsBR/DkuXKorK5IkkuVMxZ4JUCQyih3RbFw
         TSlg==
X-Gm-Message-State: AOAM530/fzBw5jJICCCb/xbRUAlWBn6AA7s1frClZCNzPUIvpJhKRPRX
        mNYuakdrzKF9+pTuIlAOBq9yFQ==
X-Google-Smtp-Source: ABdhPJzDXNiNwJHi984oQ28Mia4RUJD40TnVzlE1Zpr6JiLwXBqhqwD00ilE28PoDM0LOZ6VzgvpaA==
X-Received: by 2002:a37:9101:: with SMTP id t1mr3047422qkd.357.1611286675518;
        Thu, 21 Jan 2021 19:37:55 -0800 (PST)
Received: from localhost.localdomain (c-73-69-118-222.hsd1.nh.comcast.net. [73.69.118.222])
        by smtp.gmail.com with ESMTPSA id m85sm5426529qke.33.2021.01.21.19.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 19:37:54 -0800 (PST)
From:   Pavel Tatashin <pasha.tatashin@soleen.com>
To:     pasha.tatashin@soleen.com, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, akpm@linux-foundation.org, vbabka@suse.cz,
        mhocko@suse.com, david@redhat.com, osalvador@suse.de,
        dan.j.williams@intel.com, sashal@kernel.org,
        tyhicks@linux.microsoft.com, iamjoonsoo.kim@lge.com,
        mike.kravetz@oracle.com, rostedt@goodmis.org, mingo@redhat.com,
        jgg@ziepe.ca, peterz@infradead.org, mgorman@suse.de,
        willy@infradead.org, rientjes@google.com, jhubbard@nvidia.com,
        linux-doc@vger.kernel.org, ira.weiny@intel.com,
        linux-kselftest@vger.kernel.org
Subject: [PATCH v7 03/14] mm/gup: return an error on migration failure
Date:   Thu, 21 Jan 2021 22:37:37 -0500
Message-Id: <20210122033748.924330-4-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210122033748.924330-1-pasha.tatashin@soleen.com>
References: <20210122033748.924330-1-pasha.tatashin@soleen.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

When migration failure occurs, we still pin pages, which means
that we may pin CMA movable pages which should never be the case.

Instead return an error without pinning pages when migration failure
happens.

No need to retry migrating, because migrate_pages() already retries
10 times.

Signed-off-by: Pavel Tatashin <pasha.tatashin@soleen.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
---
 mm/gup.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index 16f10d5a9eb6..88ce41f41543 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -1557,7 +1557,6 @@ static long check_and_migrate_cma_pages(struct mm_struct *mm,
 {
 	unsigned long i;
 	bool drain_allow = true;
-	bool migrate_allow = true;
 	LIST_HEAD(cma_page_list);
 	long ret = nr_pages;
 	struct page *prev_head, *head;
@@ -1608,17 +1607,15 @@ static long check_and_migrate_cma_pages(struct mm_struct *mm,
 			for (i = 0; i < nr_pages; i++)
 				put_page(pages[i]);
 
-		if (migrate_pages(&cma_page_list, alloc_migration_target, NULL,
-			(unsigned long)&mtc, MIGRATE_SYNC, MR_CONTIG_RANGE)) {
-			/*
-			 * some of the pages failed migration. Do get_user_pages
-			 * without migration.
-			 */
-			migrate_allow = false;
-
+		ret = migrate_pages(&cma_page_list, alloc_migration_target,
+				    NULL, (unsigned long)&mtc, MIGRATE_SYNC,
+				    MR_CONTIG_RANGE);
+		if (ret) {
 			if (!list_empty(&cma_page_list))
 				putback_movable_pages(&cma_page_list);
+			return ret > 0 ? -ENOMEM : ret;
 		}
+
 		/*
 		 * We did migrate all the pages, Try to get the page references
 		 * again migrating any new CMA pages which we failed to isolate
@@ -1628,7 +1625,7 @@ static long check_and_migrate_cma_pages(struct mm_struct *mm,
 						   pages, vmas, NULL,
 						   gup_flags);
 
-		if ((ret > 0) && migrate_allow) {
+		if (ret > 0) {
 			nr_pages = ret;
 			drain_allow = true;
 			goto check_again;
-- 
2.25.1

