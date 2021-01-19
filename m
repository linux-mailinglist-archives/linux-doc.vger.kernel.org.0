Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECDD02FB012
	for <lists+linux-doc@lfdr.de>; Tue, 19 Jan 2021 06:25:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732221AbhASEpM (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 18 Jan 2021 23:45:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732182AbhASElP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 18 Jan 2021 23:41:15 -0500
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AEB7C061794
        for <linux-doc@vger.kernel.org>; Mon, 18 Jan 2021 20:39:28 -0800 (PST)
Received: by mail-qk1-x729.google.com with SMTP id h4so20805123qkk.4
        for <linux-doc@vger.kernel.org>; Mon, 18 Jan 2021 20:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ytfD2jv9LpK9OyoWxdpQ8h2mx1T2vBI4HkZM2c9/uoU=;
        b=WI9StvdGxJtwVct6bWEQzgVAdDtxsdP38appW1O1jD8gW37Wd7ooWvrKFtUmMMwH0w
         5u2SvSTQafWmIdEwz4t0RRQ/iIX/DTuvcvsdR8J7ddzeLt2dn14zs49pkpLqddLpMKCP
         vJei4rkonnLjn5bc0xcgML+mLHZwTPO5W64qBaTast6FpCnjl0sPa5wb+Q+zAE7h7yN/
         BdKIl57CPOE/pkLwAZpAQeNPkc7JGDjRcR063jHoNpbD2moaDFihEMcKySLZZak/1e/Q
         4SIvCIGrE0xJs6uECf+dYDfouM6EazJ4t48SllQr0kjm39TZ55z5PDHsVXmXURK7rVIc
         /nrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ytfD2jv9LpK9OyoWxdpQ8h2mx1T2vBI4HkZM2c9/uoU=;
        b=DOsdUMBDMDWXC0D99Armb734xYgpKyB6i2IHSL5tefC5w7Rqf0beKuQAPgEu3HPnXI
         1DMKfyLYO7SIp8RFLG2rQPLZ3VJZgz0bCaoga/3qcvbkFTSgf5o/VChW1KGRqn0+FxXX
         R/DvzDa05IDjRZ+qeKACvg/fLSQ71h1Qojpbou9BgY0rBmG0iMNm7c3miuTu3VLVnJKC
         cWh7kRDU3TIZZICwB2hBBV2gf1kk0SClckb1DWeXWQJalnK7MQ3UMJIoS3hmOF3NKIRb
         fkuRoWCVWc7YgkH3c+bUoID0eKHNTA8gwKI/Uk//NU19JEw6wyPdB+8Y/g0wKItYhEAr
         Wu1Q==
X-Gm-Message-State: AOAM531vLhDRaEZ5+zenC4wv3xo/2aPEA2KXrPXJLJX00OwyzXs7UdjP
        evKu2treiaVocMSskwP8cQmC0A==
X-Google-Smtp-Source: ABdhPJy0zYNFSWy0LJjDibtg2Y6RNr75+8j75MGHeKJmvP2Y6khyzQB5/ILqXdXtET6yi/4SJGrBdg==
X-Received: by 2002:a05:620a:74e:: with SMTP id i14mr2794988qki.99.1611031167446;
        Mon, 18 Jan 2021 20:39:27 -0800 (PST)
Received: from localhost.localdomain (c-73-69-118-222.hsd1.nh.comcast.net. [73.69.118.222])
        by smtp.gmail.com with ESMTPSA id z20sm11934536qkz.37.2021.01.18.20.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jan 2021 20:39:26 -0800 (PST)
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
Subject: [PATCH v5 03/14] mm/gup: return an error on migration failure
Date:   Mon, 18 Jan 2021 23:39:09 -0500
Message-Id: <20210119043920.155044-4-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210119043920.155044-1-pasha.tatashin@soleen.com>
References: <20210119043920.155044-1-pasha.tatashin@soleen.com>
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

