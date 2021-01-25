Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 768DA302CAA
	for <lists+linux-doc@lfdr.de>; Mon, 25 Jan 2021 21:38:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726468AbhAYUhl (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 25 Jan 2021 15:37:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732203AbhAYTvK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 25 Jan 2021 14:51:10 -0500
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A041CC0611C0
        for <linux-doc@vger.kernel.org>; Mon, 25 Jan 2021 11:48:12 -0800 (PST)
Received: by mail-qt1-x831.google.com with SMTP id z9so10599920qtv.6
        for <linux-doc@vger.kernel.org>; Mon, 25 Jan 2021 11:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=mjWbyN3QlCSRxacF3EdFD9Q6Qqvve11XewDvx8+hMpo=;
        b=QyqCNtzOZjM+ofJjxKN6Zxgsv1aotNfM8QD9SAxjhV1OH52yIpl6YtH/AqGv+QUzGh
         LbI7sONzqoiweiAtLaCZJ2f3bi2JeBjwuemwTo+nxdrLnJgeJftszsKtGaaVvnvOmZq/
         Pf6Smrxlzj3DHcnp9U+v4hb5LnxPVq1o8gPuiZl8h15rkU5kyPWYd1kgA3hKdi1qxrRY
         54IAZGiME/nPd2KM6TzR8sC9B+rRdaWe0pHCxG5CVbXJN0cA0ROp3dQCrIX0pEfhTO1U
         EANQarLiJ/JrKdo+vZGT8pU5m8TS/BBpC7lOvL/B7bw2ovLArcwG8gDmZpAhNNKiAYNn
         4KCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mjWbyN3QlCSRxacF3EdFD9Q6Qqvve11XewDvx8+hMpo=;
        b=rFEdtc1yfjINBa1lQ4H5ZVdSXn76c1Ztev/dMBnkUwtrfyh89uyGe4R49Y+hTVFOuK
         /2BZgEveM63zUKiLYcXJlzJ542epFpOat4TbjmBwswdefh73C1qHECkLUUSF2IdhklSa
         GmhpUqTr/WXM0Ukpp0LbX/NnOsY0k+gX4piQSprMvPrjVjYqHLBbRY4lO4vXZgnPITf+
         DX96SFI6+EO42Sxk95Mb4RJ33jv1xOlARt8a7mm7DjYq2nf6QZVwQA2+cr2wb5zo1pwB
         CIqKbkP7JmCtE8F5pgz7l8rjieB8aD9ke9SH1SISSQJqYvxrppZCt/DtFRW71l+0DpMM
         DCvQ==
X-Gm-Message-State: AOAM533Iakqu6htf+WQqh7WyVpPZuLSqBV/9Z+f4NsL/fkDz1Y9kunE4
        J1MBG1DLsce7EaDQnpRDlsxziw==
X-Google-Smtp-Source: ABdhPJyeXbEGvlROSYzc12iqp04Fh8xESSSyL4/yMP4LQTF+v2sZ3EQkzQM1HBNIDwwwu17OzD/NHA==
X-Received: by 2002:a05:622a:102:: with SMTP id u2mr2061298qtw.37.1611604091925;
        Mon, 25 Jan 2021 11:48:11 -0800 (PST)
Received: from localhost.localdomain (c-73-69-118-222.hsd1.nh.comcast.net. [73.69.118.222])
        by smtp.gmail.com with ESMTPSA id c12sm12121569qtq.76.2021.01.25.11.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 11:48:11 -0800 (PST)
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
Subject: [PATCH v8 11/14] mm/gup: change index type to long as it counts pages
Date:   Mon, 25 Jan 2021 14:47:48 -0500
Message-Id: <20210125194751.1275316-12-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210125194751.1275316-1-pasha.tatashin@soleen.com>
References: <20210125194751.1275316-1-pasha.tatashin@soleen.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

In __get_user_pages_locked() i counts number of pages which should be
long, as long is used in all other places to contain number of pages, and
32-bit becomes increasingly small for handling page count proportional
values.

Signed-off-by: Pavel Tatashin <pasha.tatashin@soleen.com>
Acked-by: Michal Hocko <mhocko@suse.com>
---
 mm/gup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/gup.c b/mm/gup.c
index df29825305f8..f98af75dab0f 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -1479,7 +1479,7 @@ static long __get_user_pages_locked(struct mm_struct *mm, unsigned long start,
 {
 	struct vm_area_struct *vma;
 	unsigned long vm_flags;
-	int i;
+	long i;
 
 	/* calculate required read or write permissions.
 	 * If FOLL_FORCE is set, we only require the "MAY" flags.
-- 
2.25.1

