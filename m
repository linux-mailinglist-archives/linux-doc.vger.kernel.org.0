Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 256BB31BF14
	for <lists+linux-doc@lfdr.de>; Mon, 15 Feb 2021 17:25:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230055AbhBOQYf (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 15 Feb 2021 11:24:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232283AbhBOQRQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 15 Feb 2021 11:17:16 -0500
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F75FC061224
        for <linux-doc@vger.kernel.org>; Mon, 15 Feb 2021 08:14:02 -0800 (PST)
Received: by mail-qk1-x736.google.com with SMTP id 81so6831225qkf.4
        for <linux-doc@vger.kernel.org>; Mon, 15 Feb 2021 08:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=p3LY61RMvEkOPbLRzp9wTQQd7Y9CKIynM/s58sr6Xh8=;
        b=BNcGqGP+5P/yEVtn1w00Xz2Dq3FRjNmwC/PCJblRo5T/nPxHmGtCPYHviMTXfgudEu
         IvEopPQNUYzy7y77LTOW2htxPKl3cFcDMV9sbJ4hw1wD+0tm5cs5UHu7LIktPJVYx49t
         5ovwtmG43xfEipv14T2sORMGyYsEfiP6sUSgclCiyKdttMwcByulGWoZ9yZmDE9aKPtS
         Z9WEmwLUdSzVpZDc3KFy/bN67hDjS+KCTH9cbZ4tqmEVsF3yjJVA/0DhlXMbKsfC8un7
         FFnSsvgRERv849iVWpple0i6I7NsL41pyJ0eGcfH0eAB3wLrb906ovsgMPzNBZ15bzAC
         0UBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p3LY61RMvEkOPbLRzp9wTQQd7Y9CKIynM/s58sr6Xh8=;
        b=mWQ9CHLPy/xbBXP/ioEnSN6V9P/pUzbwW7CGTkNIOanr795POOW4pnsv73kM+ST+1/
         U2ZYXYxJCLCOMCcX6LvvMKBB116Ny3vtRrVODOIA0mNrsEVrq9i0gJDJunfV0zE0IxFe
         6Re4+GxLjdaSTWyS45ldP9KS+eh5UOA++v+4l1s+DFg/sPgqfjKZXyEaUa3ZfyRmsrPB
         UuzBDZQkHNEQEXjpna9tUu17y0oKUos0duPLWpesXtrkRaZOlfV7347+IbqKmIzPskAs
         KfqROo8Bm5T6q8DKcVTChXFxpkTjjBpDKDMxTRGUgn6XlpjS3oXEhAIlnnXHhtPQKe3i
         HbNQ==
X-Gm-Message-State: AOAM5304YxwT/2JoaXEjFXKYmJcrJZXmJC+cds3/VRxGanPhvBfRixoP
        8jy8+ImP3Eq2X80ebLPuM+AwmQ==
X-Google-Smtp-Source: ABdhPJzk2DXr5/nGv//pmWIhQ1tujT4HU+iuHKQUbcp2PsdKdtw7Upgx021BNudhTqEeWym5AAV38A==
X-Received: by 2002:a05:620a:908:: with SMTP id v8mr16047359qkv.201.1613405640836;
        Mon, 15 Feb 2021 08:14:00 -0800 (PST)
Received: from localhost.localdomain (c-73-69-118-222.hsd1.nh.comcast.net. [73.69.118.222])
        by smtp.gmail.com with ESMTPSA id u7sm10909213qta.75.2021.02.15.08.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 08:14:00 -0800 (PST)
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
Subject: [PATCH v11 06/14] mm: apply per-task gfp constraints in fast path
Date:   Mon, 15 Feb 2021 11:13:41 -0500
Message-Id: <20210215161349.246722-7-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210215161349.246722-1-pasha.tatashin@soleen.com>
References: <20210215161349.246722-1-pasha.tatashin@soleen.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Function current_gfp_context() is called after fast path. However, soon we
will add more constraints which will also limit zones based on context.
Move this call into fast path, and apply the correct constraints for all
allocations.

Also update .reclaim_idx based on value returned by current_gfp_context()
because it soon will modify the allowed zones.

Note:
With this patch we will do one extra current->flags load during fast path,
but we already load current->flags in fast-path:

__alloc_pages_nodemask()
 prepare_alloc_pages()
  current_alloc_flags(gfp_mask, *alloc_flags);

Later, when we add the zone constrain logic to current_gfp_context() we
will be able to remove current->flags load from current_alloc_flags, and
therefore return fast-path to the current performance level.

Suggested-by: Michal Hocko <mhocko@kernel.org>
Signed-off-by: Pavel Tatashin <pasha.tatashin@soleen.com>
Acked-by: Michal Hocko <mhocko@suse.com>
---
 mm/page_alloc.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index e4b1eda87827..f6058e8f3105 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -4981,6 +4981,13 @@ __alloc_pages_nodemask(gfp_t gfp_mask, unsigned int order, int preferred_nid,
 	}
 
 	gfp_mask &= gfp_allowed_mask;
+	/*
+	 * Apply scoped allocation constraints. This is mainly about GFP_NOFS
+	 * resp. GFP_NOIO which has to be inherited for all allocation requests
+	 * from a particular context which has been marked by
+	 * memalloc_no{fs,io}_{save,restore}.
+	 */
+	gfp_mask = current_gfp_context(gfp_mask);
 	alloc_mask = gfp_mask;
 	if (!prepare_alloc_pages(gfp_mask, order, preferred_nid, nodemask, &ac, &alloc_mask, &alloc_flags))
 		return NULL;
@@ -4996,13 +5003,7 @@ __alloc_pages_nodemask(gfp_t gfp_mask, unsigned int order, int preferred_nid,
 	if (likely(page))
 		goto out;
 
-	/*
-	 * Apply scoped allocation constraints. This is mainly about GFP_NOFS
-	 * resp. GFP_NOIO which has to be inherited for all allocation requests
-	 * from a particular context which has been marked by
-	 * memalloc_no{fs,io}_{save,restore}.
-	 */
-	alloc_mask = current_gfp_context(gfp_mask);
+	alloc_mask = gfp_mask;
 	ac.spread_dirty_pages = false;
 
 	/*
-- 
2.25.1

