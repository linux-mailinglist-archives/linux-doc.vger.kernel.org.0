Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FDCC2FC70D
	for <lists+linux-doc@lfdr.de>; Wed, 20 Jan 2021 02:47:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730975AbhATBp1 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 19 Jan 2021 20:45:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731057AbhATBpV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Jan 2021 20:45:21 -0500
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD0E6C0617A6
        for <linux-doc@vger.kernel.org>; Tue, 19 Jan 2021 17:43:49 -0800 (PST)
Received: by mail-qt1-x82b.google.com with SMTP id c1so15280859qtc.1
        for <linux-doc@vger.kernel.org>; Tue, 19 Jan 2021 17:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=NSfKwM0qZ2SADZukUCxIq1sGdroZk/z1DcleDkvNzS0=;
        b=nwZcOBpa84trfXrteKEqUE6inVj0YqjUk38WoHG1YWmiX9GB48+raOTDXRxgSMrRrD
         3+hcbwAWzpg1kIz9WU4lnCdM5yLF6ws1uwZpEUeIXvKuiSyOXqMTjpta674XbkCB2PPG
         EtVp0+dIuQ9LBqPgRvEDVLOTXLqzO+WGPA7Bju+8Ipd81EMc9gF11nMnjbnTEBSOo2zd
         RNvje6PkQSJZYYjJgh+d63zAybUugTeZkPKQaeJ8hUzEOwSOSfHrzVyqoJEg4qdFCOGT
         cNjDXU9/8xmlcUdyJ56NeM4WLAixkJcHfaQi/mXBLJ2Xiwqg4JugrmRqtQCZ688ivXBP
         UWhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NSfKwM0qZ2SADZukUCxIq1sGdroZk/z1DcleDkvNzS0=;
        b=aax++8R8sNWxTL7Omwmekw7vg3vooAL2qtaALRtf1HbOERgzYWvU4fn999bmpwb1i5
         JCe3vqgQ6yQECRZ57DpTNakKSbhuXtyTE0nojtmGmBTH7N1wCBMjOXDzFTe743EWeHIZ
         n4uC2SWVaOk1Pp0N6nkaS54zf/cIop03+sHl0BVbls4iemWM8EAU1ZVpZ9Pr4gmu5GSY
         aD6MRduB8w7YLixAC+VHVstVTB4NsJS5WFWDRZmZbOAc63DJO6FdWnUUs4wpkrM8PI8g
         DLg/y94xjddVPr/QR0m931psLpEVVOKj5On1QwSV3FO1ixfmUIg9aGnAT4T+0Kpf5pWG
         J/FQ==
X-Gm-Message-State: AOAM530NAgcQQWUco3Rwyh+gT4tAPPeo2Y1mCdQfzLIeap19dFkh5ZTW
        1OoIfnRIKMqcnb1lFuSjqA9QSw==
X-Google-Smtp-Source: ABdhPJxidf4yCDT6pOUeqmLOYnk4lX7EIE4O9btB7l4S+m+19nz9VZz6qrWMiOlPdTgzPfbD+pQrYw==
X-Received: by 2002:ac8:4d93:: with SMTP id a19mr6930840qtw.356.1611107028992;
        Tue, 19 Jan 2021 17:43:48 -0800 (PST)
Received: from localhost.localdomain (c-73-69-118-222.hsd1.nh.comcast.net. [73.69.118.222])
        by smtp.gmail.com with ESMTPSA id a9sm391871qkk.39.2021.01.19.17.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 17:43:48 -0800 (PST)
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
Subject: [PATCH v6 08/14] mm/gup: do not migrate zero page
Date:   Tue, 19 Jan 2021 20:43:27 -0500
Message-Id: <20210120014333.222547-9-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210120014333.222547-1-pasha.tatashin@soleen.com>
References: <20210120014333.222547-1-pasha.tatashin@soleen.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On some platforms ZERO_PAGE(0) might end-up in a movable zone. Do not
migrate zero page in gup during longterm pinning as migration of zero page
is not allowed.

For example, in x86 QEMU with 16G of memory and kernelcore=5G parameter, I
see the following:

Boot#1: zero_pfn  0x48a8d zero_pfn zone: ZONE_DMA32
Boot#2: zero_pfn 0x20168d zero_pfn zone: ZONE_MOVABLE

On x86, empty_zero_page is declared in .bss and depending on the loader
may end up in different physical locations during boots.

Signed-off-by: Pavel Tatashin <pasha.tatashin@soleen.com>
---
 include/linux/mmzone.h | 4 ++++
 mm/gup.c               | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index fc99e9241846..f67427a8f22b 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -427,6 +427,10 @@ enum zone_type {
 	 *    techniques might use alloc_contig_range() to hide previously
 	 *    exposed pages from the buddy again (e.g., to implement some sort
 	 *    of memory unplug in virtio-mem).
+	 * 6. ZERO_PAGE(0), kernelcore/movablecore setups might create
+	 *    situations where ZERO_PAGE(0) which is allocated differently
+	 *    on different platforms may end up in a movable zone. ZERO_PAGE(0)
+	 *    cannot be migrated.
 	 *
 	 * In general, no unmovable allocations that degrade memory offlining
 	 * should end up in ZONE_MOVABLE. Allocators (like alloc_contig_range())
diff --git a/mm/gup.c b/mm/gup.c
index 857b273e32ac..fdd5cda30a07 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -1580,6 +1580,8 @@ static long check_and_migrate_cma_pages(struct mm_struct *mm,
 		 * of the CMA zone if possible.
 		 */
 		if (is_migrate_cma_page(head)) {
+			if (is_zero_pfn(page_to_pfn(head)))
+				continue;
 			if (PageHuge(head)) {
 				if (!isolate_huge_page(head, &cma_page_list))
 					isolation_error_count++;
-- 
2.25.1

