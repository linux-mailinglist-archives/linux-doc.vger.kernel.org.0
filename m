Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A9EA2FC765
	for <lists+linux-doc@lfdr.de>; Wed, 20 Jan 2021 03:05:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731203AbhATCCy (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 19 Jan 2021 21:02:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730984AbhATBpA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Jan 2021 20:45:00 -0500
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B87F6C061573
        for <linux-doc@vger.kernel.org>; Tue, 19 Jan 2021 17:43:41 -0800 (PST)
Received: by mail-qk1-x72b.google.com with SMTP id d14so23937239qkc.13
        for <linux-doc@vger.kernel.org>; Tue, 19 Jan 2021 17:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=gHgQfTRvar1lIU9rNG4Q491ak9Bif38ih9mdt5Czeeg=;
        b=EEahLgI2IDWObWfsAD0JI1JVF8Cn8kbvHzl/a3zQRzwTOxk1mXISMzEKGL00rZFp3W
         WIKAI2WioD+6gmcTpgPZdsy/xncMBzalKS1d5RhqvKc+Db395BRV13meAT3Rk4ZULIWJ
         nYnOxew1UD+I6RR+vZ/6MvDShJLfaGHcrF4phFYQBCEQs0R9oiEZOnV8h4e78DmIqi3o
         6WuGDzGYmUjwhxzYxhO3/gNQHqqAbtLCRssN0q8ivlxPpO04RYY8dS9UvKapVgAu7LGB
         uEWOP3OxDFwDD0czAXsJoCl47IS4NrzSUzz/hcNrkL9XYLlbPdqwreNZQshuC0KSnOxX
         lpfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gHgQfTRvar1lIU9rNG4Q491ak9Bif38ih9mdt5Czeeg=;
        b=K/12ACZCwY+yVj4SeN7ZNbULd/zFLVddvkiWsaXiAWMzdGkOEhk/kQRpztmsz+YxAz
         vNgYLrCBKXikUsJnuDIbF1/3tlW8OLOHEUfIICCpxBwzn/zcgDHXZp9t0k9nwBlh9k78
         fCCT0AKb6E4TBFacK180va26yinXpGa7Lx/d7kyFifAHLHIfrnC9WYRksb7bAI45yotU
         glV7QJSDtkxi4eJCG6sidiLa8ZMgDYFiZrqxsFmnRN+WlntyaTrIk9ZzMIDsi6XtCMpC
         DWQ/pBkX/u27yVmlo/5XjiFhWP0xyO4RDyU31AboD1Xj6/RXfO0u0z/JKBtwDcVFVF3W
         QSpg==
X-Gm-Message-State: AOAM530uKL+x2Cka0DR/vhnjSw4/tX3unmKIWuExee1BInpV0vPlzjrY
        dOtvQJb5oJg2tFURk8V/nf5ADw==
X-Google-Smtp-Source: ABdhPJzHj6LQ0cBsDfz1RNSBv0bk1KWxpZzS84FijMdIS8OK4Ed3mNROA1OjtyVVSBCQUoJgercOMA==
X-Received: by 2002:a37:a64c:: with SMTP id p73mr2740731qke.439.1611107021036;
        Tue, 19 Jan 2021 17:43:41 -0800 (PST)
Received: from localhost.localdomain (c-73-69-118-222.hsd1.nh.comcast.net. [73.69.118.222])
        by smtp.gmail.com with ESMTPSA id a9sm391871qkk.39.2021.01.19.17.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 17:43:40 -0800 (PST)
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
Subject: [PATCH v6 03/14] mm/gup: return an error on migration failure
Date:   Tue, 19 Jan 2021 20:43:22 -0500
Message-Id: <20210120014333.222547-4-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210120014333.222547-1-pasha.tatashin@soleen.com>
References: <20210120014333.222547-1-pasha.tatashin@soleen.com>
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

