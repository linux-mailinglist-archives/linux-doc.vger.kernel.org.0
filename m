Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0BC32DD8D2
	for <lists+linux-doc@lfdr.de>; Thu, 17 Dec 2020 19:56:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730841AbgLQSyQ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 17 Dec 2020 13:54:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730839AbgLQSyP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 17 Dec 2020 13:54:15 -0500
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57A1EC0611CC
        for <linux-doc@vger.kernel.org>; Thu, 17 Dec 2020 10:52:53 -0800 (PST)
Received: by mail-qt1-x82d.google.com with SMTP id z3so20818448qtw.9
        for <linux-doc@vger.kernel.org>; Thu, 17 Dec 2020 10:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=7fMarcPKbF8eZ1EkRUpeh/DuV7Asm97DUovse3OVSm8=;
        b=KAR7G1r8yuIWa8PDp7CdQKfOdfBpq07/k6cAWElzxpy4lPAVDkyKNpz9GBsAjB+Mpz
         lxfemf+m/mTOfXRnI35Ee7KfkGcGIfv8CsVkvE0jAIdadt6l+8UbKkhv4etz+g6LOVaE
         YkFRyvV3s4qovarOY2EKXMvRRCDjZQ9rphgdpf/4va2tXF7c1EpmTIp7c9SH3O9qckhc
         k8Q9ggvp7Iel3UqSuov4qqKqB0FRAf47mOMPiV7GcjAUIh2KC99oq7l4e7U+VCZ1CRcm
         +cfFMPGkm300n/RM66V7Tst7/0nWpLsrja6P/8KdZrEeLdVvP/swKvoLNUQf+sZI9fON
         2O9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7fMarcPKbF8eZ1EkRUpeh/DuV7Asm97DUovse3OVSm8=;
        b=hUL+mWMMSZVp51uE2If2IRuPmWT/LBTwuVZchn8jwuDOU1Hm/00NhDBFN2FU6Fc9UY
         poP77mbyY48KnciCh2SSkRAM4sn3Oc3nVUjMi4UTsbExZZdcRztkEW9RRfcjlIOibPPB
         pI8x2v0QO2p8Aoyqpb95UrBDSQF1UUb1JReMpAbq0iyci1ShazvUqG3OYpbqT1ICiv/o
         OzinpjrdzMqyUAuflNZAWtLrDid5aDop1Gr7gdcYk3ATFaqUq/Orc6wB5QSs7MIrpAGF
         OwVX/IuayhW774X2JK9lWaHi5hLX7fqVj447/naOZ92CRIxABpwgovCNE90kmmUOJlN8
         rkwQ==
X-Gm-Message-State: AOAM5325ub3SQLNgFG5YOiqaiPx4mRvGMSKTLogVAt4ddeOppo2X236V
        rXoguuzvAfOWEp9GV26TZSf8RF1+J8F0UG7g
X-Google-Smtp-Source: ABdhPJwomTS5oDvqiBJxZsojUgHU+ie/Ke3GQwZKAqNbibl4PlQ0cRKesaMM2s5bPJsC4PUdrNrPig==
X-Received: by 2002:ac8:4f13:: with SMTP id b19mr184478qte.150.1608231172508;
        Thu, 17 Dec 2020 10:52:52 -0800 (PST)
Received: from localhost.localdomain (c-73-69-118-222.hsd1.nh.comcast.net. [73.69.118.222])
        by smtp.gmail.com with ESMTPSA id m8sm4127434qkn.41.2020.12.17.10.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Dec 2020 10:52:51 -0800 (PST)
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
Subject: [PATCH v4 03/10] mm: apply per-task gfp constraints in fast path
Date:   Thu, 17 Dec 2020 13:52:36 -0500
Message-Id: <20201217185243.3288048-4-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201217185243.3288048-1-pasha.tatashin@soleen.com>
References: <20201217185243.3288048-1-pasha.tatashin@soleen.com>
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
 mm/vmscan.c     | 10 ++++++----
 2 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index ec05396a597b..c2dea9ad0e98 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -4976,6 +4976,13 @@ __alloc_pages_nodemask(gfp_t gfp_mask, unsigned int order, int preferred_nid,
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
@@ -4991,13 +4998,7 @@ __alloc_pages_nodemask(gfp_t gfp_mask, unsigned int order, int preferred_nid,
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
diff --git a/mm/vmscan.c b/mm/vmscan.c
index 469016222cdb..d9546f5897f4 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -3234,11 +3234,12 @@ static bool throttle_direct_reclaim(gfp_t gfp_mask, struct zonelist *zonelist,
 unsigned long try_to_free_pages(struct zonelist *zonelist, int order,
 				gfp_t gfp_mask, nodemask_t *nodemask)
 {
+	gfp_t current_gfp_mask = current_gfp_context(gfp_mask);
 	unsigned long nr_reclaimed;
 	struct scan_control sc = {
 		.nr_to_reclaim = SWAP_CLUSTER_MAX,
-		.gfp_mask = current_gfp_context(gfp_mask),
-		.reclaim_idx = gfp_zone(gfp_mask),
+		.gfp_mask = current_gfp_mask,
+		.reclaim_idx = gfp_zone(current_gfp_mask),
 		.order = order,
 		.nodemask = nodemask,
 		.priority = DEF_PRIORITY,
@@ -4158,17 +4159,18 @@ static int __node_reclaim(struct pglist_data *pgdat, gfp_t gfp_mask, unsigned in
 {
 	/* Minimum pages needed in order to stay on node */
 	const unsigned long nr_pages = 1 << order;
+	gfp_t current_gfp_mask = current_gfp_context(gfp_mask);
 	struct task_struct *p = current;
 	unsigned int noreclaim_flag;
 	struct scan_control sc = {
 		.nr_to_reclaim = max(nr_pages, SWAP_CLUSTER_MAX),
-		.gfp_mask = current_gfp_context(gfp_mask),
+		.gfp_mask = current_gfp_mask,
 		.order = order,
 		.priority = NODE_RECLAIM_PRIORITY,
 		.may_writepage = !!(node_reclaim_mode & RECLAIM_WRITE),
 		.may_unmap = !!(node_reclaim_mode & RECLAIM_UNMAP),
 		.may_swap = 1,
-		.reclaim_idx = gfp_zone(gfp_mask),
+		.reclaim_idx = gfp_zone(current_gfp_mask),
 	};
 
 	trace_mm_vmscan_node_reclaim_begin(pgdat->node_id, order,
-- 
2.25.1

