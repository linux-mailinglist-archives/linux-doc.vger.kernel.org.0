Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7168E302CFD
	for <lists+linux-doc@lfdr.de>; Mon, 25 Jan 2021 21:54:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731555AbhAYUnr (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 25 Jan 2021 15:43:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732084AbhAYTtg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 25 Jan 2021 14:49:36 -0500
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAA54C0617A7
        for <linux-doc@vger.kernel.org>; Mon, 25 Jan 2021 11:48:00 -0800 (PST)
Received: by mail-qk1-x72c.google.com with SMTP id q9so13389469qkn.2
        for <linux-doc@vger.kernel.org>; Mon, 25 Jan 2021 11:48:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=g2firNhV/7kB7YU7cH9BNSgXaQWIxvW5HlS98FNnYEs=;
        b=AMPWTTnTQtQrH0f812HX8J/XenqFD0LhTJ4uvra0Yc82gbHE9JUqY698LNtS80BE7R
         HR+xMh6u82Ttl2HRET2KJJgXpfY0HAW1XAkqnXoYkorW9DdsIXlDDaKOJsRmrtQ2/nEG
         Dmb4GCZxUK9zEwlcH3WDx/URO0SVMy0zcD9v2FKoTwgARO1MZ/OlQM2BSz/juCLIjm3+
         Ea0mQylNJ+kUPUNcC5yvUomLFphaeUQkqGKv5Qe3PZZaI9d8ehH1Z1VgrSynAksIDQ8Q
         1KdzNIxtcFbSYYmlQkrBgCfYAOIWMyB8X7sV+6aCuasMoW4NW0MbgSIrAIc2CBltCiiY
         S4Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g2firNhV/7kB7YU7cH9BNSgXaQWIxvW5HlS98FNnYEs=;
        b=IJ+6PPa4IT6aZYkEw/QSXyYRvw/f7ijot/5TRNWq8ThBhImgq8ptzngaXdpVqtEsHe
         ZZk6UwTqCxAMtzl0fX3xwztm7PveHbo2tQHyauF+shGUZ6czlP8Ip/isiF3qNZGgcZVo
         Z+qRDebIZRcHNeaB5766hnIedrpfTNAG8pqnGU6vV3eddGk2vyuTGoj8pET/p48ALg3F
         7H2/IyfZpM0cKQQh1q+e/UQHOK2xpuYj20CuDMD55BDn70zQZCLVH/BSWLrChzeW+LUZ
         ztNEbQonE9JRgbdDLkbzv4zZwWyBh+nugsWEVuAtnEuyKPiidpdZDxjXR3iL66MVbtAz
         a6zQ==
X-Gm-Message-State: AOAM532SHNvWBZzkirLYdPkZKxuOCp9JXZ7TmyAeYDqHmoslC2fpnbNw
        MTMJmxzQTK7DUQcvs4UigKsetg==
X-Google-Smtp-Source: ABdhPJwYEL3DoI+pABS4RBJJVNs455EMYUvP8bvQI2v1Jkb8103rBVGefY9aunaJRQVj9v3yEHgwng==
X-Received: by 2002:a37:4554:: with SMTP id s81mr2369392qka.323.1611604080206;
        Mon, 25 Jan 2021 11:48:00 -0800 (PST)
Received: from localhost.localdomain (c-73-69-118-222.hsd1.nh.comcast.net. [73.69.118.222])
        by smtp.gmail.com with ESMTPSA id c12sm12121569qtq.76.2021.01.25.11.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 11:47:59 -0800 (PST)
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
        linux-kselftest@vger.kernel.org, jmorris@namei.org
Subject: [PATCH v8 04/14] mm/gup: check for isolation errors
Date:   Mon, 25 Jan 2021 14:47:41 -0500
Message-Id: <20210125194751.1275316-5-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210125194751.1275316-1-pasha.tatashin@soleen.com>
References: <20210125194751.1275316-1-pasha.tatashin@soleen.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

It is still possible that we pin movable CMA pages if there are isolation
errors and cma_page_list stays empty when we check again.

Check for isolation errors, and return success only when there are no
isolation errors, and cma_page_list is empty after checking.

Because isolation errors are transient, we retry indefinitely.

Fixes: 9a4e9f3b2d73 ("mm: update get_user_pages_longterm to migrate pages allocated from CMA region")
Signed-off-by: Pavel Tatashin <pasha.tatashin@soleen.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
---
 mm/gup.c | 60 ++++++++++++++++++++++++++++++++------------------------
 1 file changed, 34 insertions(+), 26 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index 88ce41f41543..7ecca2d66dff 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -1555,8 +1555,8 @@ static long check_and_migrate_cma_pages(struct mm_struct *mm,
 					struct vm_area_struct **vmas,
 					unsigned int gup_flags)
 {
-	unsigned long i;
-	bool drain_allow = true;
+	unsigned long i, isolation_error_count;
+	bool drain_allow;
 	LIST_HEAD(cma_page_list);
 	long ret = nr_pages;
 	struct page *prev_head, *head;
@@ -1567,6 +1567,8 @@ static long check_and_migrate_cma_pages(struct mm_struct *mm,
 
 check_again:
 	prev_head = NULL;
+	isolation_error_count = 0;
+	drain_allow = true;
 	for (i = 0; i < nr_pages; i++) {
 		head = compound_head(pages[i]);
 		if (head == prev_head)
@@ -1578,25 +1580,35 @@ static long check_and_migrate_cma_pages(struct mm_struct *mm,
 		 * of the CMA zone if possible.
 		 */
 		if (is_migrate_cma_page(head)) {
-			if (PageHuge(head))
-				isolate_huge_page(head, &cma_page_list);
-			else {
+			if (PageHuge(head)) {
+				if (!isolate_huge_page(head, &cma_page_list))
+					isolation_error_count++;
+			} else {
 				if (!PageLRU(head) && drain_allow) {
 					lru_add_drain_all();
 					drain_allow = false;
 				}
 
-				if (!isolate_lru_page(head)) {
-					list_add_tail(&head->lru, &cma_page_list);
-					mod_node_page_state(page_pgdat(head),
-							    NR_ISOLATED_ANON +
-							    page_is_file_lru(head),
-							    thp_nr_pages(head));
+				if (isolate_lru_page(head)) {
+					isolation_error_count++;
+					continue;
 				}
+				list_add_tail(&head->lru, &cma_page_list);
+				mod_node_page_state(page_pgdat(head),
+						    NR_ISOLATED_ANON +
+						    page_is_file_lru(head),
+						    thp_nr_pages(head));
 			}
 		}
 	}
 
+	/*
+	 * If list is empty, and no isolation errors, means that all pages are
+	 * in the correct zone.
+	 */
+	if (list_empty(&cma_page_list) && !isolation_error_count)
+		return ret;
+
 	if (!list_empty(&cma_page_list)) {
 		/*
 		 * drop the above get_user_pages reference.
@@ -1616,23 +1628,19 @@ static long check_and_migrate_cma_pages(struct mm_struct *mm,
 			return ret > 0 ? -ENOMEM : ret;
 		}
 
-		/*
-		 * We did migrate all the pages, Try to get the page references
-		 * again migrating any new CMA pages which we failed to isolate
-		 * earlier.
-		 */
-		ret = __get_user_pages_locked(mm, start, nr_pages,
-						   pages, vmas, NULL,
-						   gup_flags);
-
-		if (ret > 0) {
-			nr_pages = ret;
-			drain_allow = true;
-			goto check_again;
-		}
+		/* We unpinned pages before migration, pin them again */
+		ret = __get_user_pages_locked(mm, start, nr_pages, pages, vmas,
+					      NULL, gup_flags);
+		if (ret <= 0)
+			return ret;
+		nr_pages = ret;
 	}
 
-	return ret;
+	/*
+	 * check again because pages were unpinned, and we also might have
+	 * had isolation errors and need more pages to migrate.
+	 */
+	goto check_again;
 }
 #else
 static long check_and_migrate_cma_pages(struct mm_struct *mm,
-- 
2.25.1

