Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 654042FC70A
	for <lists+linux-doc@lfdr.de>; Wed, 20 Jan 2021 02:45:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731048AbhATBpT (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 19 Jan 2021 20:45:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730975AbhATBpA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Jan 2021 20:45:00 -0500
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAD3CC061793
        for <linux-doc@vger.kernel.org>; Tue, 19 Jan 2021 17:43:39 -0800 (PST)
Received: by mail-qk1-x72f.google.com with SMTP id v126so23940833qkd.11
        for <linux-doc@vger.kernel.org>; Tue, 19 Jan 2021 17:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=/BFgBC6QAZDKdqJwclIw/UFhagKoK9nwCvAO/0D2vSo=;
        b=RmC0xQylQcmkuF5yjIv80DDW0RA/xoOl0q+pK7M85n5LLKQTrhG2INIIJSg26fxSgP
         7kOH61xBi+5qAzjc7w69DfA5uqExX8xI5mO+zp2auZUWFUcy2LN1TmOwliOxS8hHzOCC
         y6VcIC1sn42Eh9UE7GmJw6iFUl65UfIUlQtNh3Um4c8otaClWyHopxsMnOY2uRBqdsGF
         04ZY8+ceSUF0OnjnmE4PqYrSRDJKoZ6xTREV9VwJxKSmDIn0dpPcpa8xYyjt8POuA6Ge
         zhReara3vG9aSRD2JPLwsE4uj6cfzQDdUBmPLTUT810l7zuUU9Z7B8NMaN/vPSBAMZHj
         yhow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/BFgBC6QAZDKdqJwclIw/UFhagKoK9nwCvAO/0D2vSo=;
        b=dkbZAnOuw7qe+ATjjU3P/tb94ZavS7wjF5I31QhmyUCbF3whJXUlkMMazfi6jZFN3g
         Aj1C9YrA/xu1zDxop01qsbRrA6JCvPQhvJ6TM6yh3cwCqDRWiAj88jikkgh996wYBL2j
         mRODQITm32+Vbw2y1kNq2H4LgWLq6yY0QkMyyeyXwjRxYck4OimSmUdPmMr3fj8jgn9r
         +2Wxpu4b8ZV2gMRGf6GKtW1rT6CHcLMAYVblo2MWwQpzaZmGWoj2CU5EFDBkR7QpOnya
         dtfQSK7Vy3sCjIvcKtBqHceCd6n59tX4Pgucr35ePipNPbRbh1VDuT99iIkRC5HQrbzk
         SzeQ==
X-Gm-Message-State: AOAM532nbHZFYNaXaQeAhMwWa/ME1pbifwRFv/eAgs+/5Bn+jB4qoX2r
        M0ki0rQ+gU9lFU9rbqP4oJQwnw==
X-Google-Smtp-Source: ABdhPJxqofjLc4ID+cJVT/cdrSIm0/gIX8GFxlbTBTnAtlB3KLAOZgKlTtLQIirWWKLqvIHpshfe2w==
X-Received: by 2002:a37:9c4a:: with SMTP id f71mr7624514qke.495.1611107019093;
        Tue, 19 Jan 2021 17:43:39 -0800 (PST)
Received: from localhost.localdomain (c-73-69-118-222.hsd1.nh.comcast.net. [73.69.118.222])
        by smtp.gmail.com with ESMTPSA id a9sm391871qkk.39.2021.01.19.17.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 17:43:38 -0800 (PST)
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
Subject: [PATCH v6 02/14] mm/gup: check every subpage of a compound page during isolation
Date:   Tue, 19 Jan 2021 20:43:21 -0500
Message-Id: <20210120014333.222547-3-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210120014333.222547-1-pasha.tatashin@soleen.com>
References: <20210120014333.222547-1-pasha.tatashin@soleen.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

When pages are isolated in check_and_migrate_movable_pages() we skip
compound number of pages at a time. However, as Jason noted, it is
not necessary correct that pages[i] corresponds to the pages that
we skipped. This is because it is possible that the addresses in
this range had split_huge_pmd()/split_huge_pud(), and these functions
do not update the compound page metadata.

The problem can be reproduced if something like this occurs:

1. User faulted huge pages.
2. split_huge_pmd() was called for some reason
3. User has unmapped some sub-pages in the range
4. User tries to longterm pin the addresses.

The resulting pages[i] might end-up having pages which are not compound
size page aligned.

Fixes: aa712399c1e8 ("mm/gup: speed up check_and_migrate_cma_pages() on huge page")
Reported-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Pavel Tatashin <pasha.tatashin@soleen.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
---
 mm/gup.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index 24f25b1e9103..16f10d5a9eb6 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -1556,26 +1556,23 @@ static long check_and_migrate_cma_pages(struct mm_struct *mm,
 					unsigned int gup_flags)
 {
 	unsigned long i;
-	unsigned long step;
 	bool drain_allow = true;
 	bool migrate_allow = true;
 	LIST_HEAD(cma_page_list);
 	long ret = nr_pages;
+	struct page *prev_head, *head;
 	struct migration_target_control mtc = {
 		.nid = NUMA_NO_NODE,
 		.gfp_mask = GFP_USER | __GFP_NOWARN,
 	};
 
 check_again:
-	for (i = 0; i < nr_pages;) {
-
-		struct page *head = compound_head(pages[i]);
-
-		/*
-		 * gup may start from a tail page. Advance step by the left
-		 * part.
-		 */
-		step = compound_nr(head) - (pages[i] - head);
+	prev_head = NULL;
+	for (i = 0; i < nr_pages; i++) {
+		head = compound_head(pages[i]);
+		if (head == prev_head)
+			continue;
+		prev_head = head;
 		/*
 		 * If we get a page from the CMA zone, since we are going to
 		 * be pinning these entries, we might as well move them out
@@ -1599,8 +1596,6 @@ static long check_and_migrate_cma_pages(struct mm_struct *mm,
 				}
 			}
 		}
-
-		i += step;
 	}
 
 	if (!list_empty(&cma_page_list)) {
-- 
2.25.1

