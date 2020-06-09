Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63B751F3476
	for <lists+linux-doc@lfdr.de>; Tue,  9 Jun 2020 08:54:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727990AbgFIGyq (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 9 Jun 2020 02:54:46 -0400
Received: from smtp-fw-4101.amazon.com ([72.21.198.25]:15856 "EHLO
        smtp-fw-4101.amazon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726886AbgFIGyq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 9 Jun 2020 02:54:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1591685686; x=1623221686;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=cH3VC0EhyjcReYcmU7E6sUXvNg8KQBJcvsbeQA1k+nE=;
  b=ng10pBAkjx/sdKuPW1gl6Gdz9zQFw4RW4rLDKgD8DbAIyiIkbRxBzzmc
   Cci5Bm6Ir/Lhx4bDlxEYYPVsyNsG+mAC9q+leYi0L6WCzEMJXqavsFmUO
   jDcsvtiksONsNIx8wfYhx8uWgHbfcfgJTnUrBssFbzUAcVjvPQ001g8W0
   I=;
IronPort-SDR: a1fsza+/jN2QJ5cO2Ojet1xyQTxgMk/Ao37d0glU4bTY8/pr/uIavJAJsK8mfzj00utW5y5fa9
 O+6bbXFh77KA==
X-IronPort-AV: E=Sophos;i="5.73,490,1583193600"; 
   d="scan'208";a="35222122"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO email-inbound-relay-1a-e34f1ddc.us-east-1.amazon.com) ([10.43.8.6])
  by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP; 09 Jun 2020 06:54:45 +0000
Received: from EX13MTAUEA002.ant.amazon.com (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
        by email-inbound-relay-1a-e34f1ddc.us-east-1.amazon.com (Postfix) with ESMTPS id C416AA235E;
        Tue,  9 Jun 2020 06:54:42 +0000 (UTC)
Received: from EX13D31EUA001.ant.amazon.com (10.43.165.15) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 9 Jun 2020 06:54:42 +0000
Received: from u886c93fd17d25d.ant.amazon.com (10.43.162.53) by
 EX13D31EUA001.ant.amazon.com (10.43.165.15) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 9 Jun 2020 06:54:26 +0000
From:   SeongJae Park <sjpark@amazon.com>
To:     <akpm@linux-foundation.org>
CC:     SeongJae Park <sjpark@amazon.de>, <Jonathan.Cameron@Huawei.com>,
        <aarcange@redhat.com>, <acme@kernel.org>,
        <alexander.shishkin@linux.intel.com>, <amit@kernel.org>,
        <benh@kernel.crashing.org>, <brendan.d.gregg@gmail.com>,
        <brendanhiggins@google.com>, <cai@lca.pw>,
        <colin.king@canonical.com>, <corbet@lwn.net>, <dwmw@amazon.com>,
        <foersleo@amazon.de>, <irogers@google.com>, <jolsa@redhat.com>,
        <kirill@shutemov.name>, <mark.rutland@arm.com>, <mgorman@suse.de>,
        <minchan@kernel.org>, <mingo@redhat.com>, <namhyung@kernel.org>,
        <peterz@infradead.org>, <rdunlap@infradead.org>,
        <riel@surriel.com>, <rientjes@google.com>, <rostedt@goodmis.org>,
        <sblbir@amazon.com>, <shakeelb@google.com>, <shuah@kernel.org>,
        <sj38.park@gmail.com>, <snu@amazon.de>, <vbabka@suse.cz>,
        <vdavydov.dev@gmail.com>, <yang.shi@linux.alibaba.com>,
        <ying.huang@intel.com>, <david@redhat.com>,
        <linux-damon@amazon.com>, <linux-mm@kvack.org>,
        <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC v11 2/8] mm/damon: Account age of target regions
Date:   Tue, 9 Jun 2020 08:53:14 +0200
Message-ID: <20200609065320.12941-3-sjpark@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200609065320.12941-1-sjpark@amazon.com>
References: <20200609065320.12941-1-sjpark@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.43.162.53]
X-ClientProxiedBy: EX13D31UWA004.ant.amazon.com (10.43.160.217) To
 EX13D31EUA001.ant.amazon.com (10.43.165.15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: SeongJae Park <sjpark@amazon.de>

DAMON can be used as a primitive for data access pattern aware memory
management optimizations.  However, users who want such optimizations
should run DAMON, read the monitoring results, analyze it, plan a new
memory management scheme, and apply the new scheme by themselves.  It
would not be too hard, but still require some level of effort.  For
complicated optimizations, this effort is inevitable.

That said, in many cases, users would simply want to apply an actions to
a memory region of a specific size having a specific access frequency
for a specific time.  For example, "page out a memory region larger than
100 MiB but having a low access frequency more than 10 minutes", or "Use
THP for a memory region larger than 2 MiB having a high access frequency
for more than 2 seconds".

For such optimizations, users will need to first account the age of each
region themselves.  To reduce such efforts, this commit implements a
simple age account of each region in DAMON.  For each aggregation step,
DAMON compares the access frequency with that from last aggregation and
reset the age of the region if the change is significant.  Else, the age
is incremented.  Also, in case of the merge of regions, the region
size-weighted average of the ages is set as the age of merged new
region.

Signed-off-by: SeongJae Park <sjpark@amazon.de>
---
 include/linux/damon.h | 10 ++++++++++
 mm/damon.c            | 29 +++++++++++++++++++++--------
 2 files changed, 31 insertions(+), 8 deletions(-)

diff --git a/include/linux/damon.h b/include/linux/damon.h
index c4796a10cb1a..6a8ff2c63c2a 100644
--- a/include/linux/damon.h
+++ b/include/linux/damon.h
@@ -24,6 +24,13 @@
  * @sampling_addr:	Address of the sample for the next access check.
  * @nr_accesses:	Access frequency of this region.
  * @list:		List head for siblings.
+ * @age:		Age of this region.
+ * @last_nr_accesses:	Internal value for age calculation.
+ *
+ * @age is initially zero, increased for each aggregation interval, and reset
+ * to zero again if the access frequency is significantly changed.  If two
+ * regions are merged into a new region, both @nr_accesses and @age of the new
+ * region are set as region size-weighted average of those of the two regions.
  */
 struct damon_region {
 	unsigned long vm_start;
@@ -31,6 +38,9 @@ struct damon_region {
 	unsigned long sampling_addr;
 	unsigned int nr_accesses;
 	struct list_head list;
+
+	unsigned int age;
+	unsigned int last_nr_accesses;
 };
 
 /**
diff --git a/mm/damon.c b/mm/damon.c
index c390a0cbc54a..17ec5fcc1b96 100644
--- a/mm/damon.c
+++ b/mm/damon.c
@@ -101,6 +101,9 @@ static struct damon_region *damon_new_region(struct damon_ctx *ctx,
 	region->nr_accesses = 0;
 	INIT_LIST_HEAD(&region->list);
 
+	region->age = 0;
+	region->last_nr_accesses = 0;
+
 	return region;
 }
 
@@ -770,6 +773,7 @@ static void kdamond_reset_aggregated(struct damon_ctx *c)
 			damon_write_rbuf(c, &r->nr_accesses,
 					sizeof(r->nr_accesses));
 			trace_damon_aggregated(t, r, nr);
+			r->last_nr_accesses = r->nr_accesses;
 			r->nr_accesses = 0;
 		}
 	}
@@ -783,9 +787,11 @@ static void kdamond_reset_aggregated(struct damon_ctx *c)
 static void damon_merge_two_regions(struct damon_region *l,
 				struct damon_region *r)
 {
-	l->nr_accesses = (l->nr_accesses * sz_damon_region(l) +
-			r->nr_accesses * sz_damon_region(r)) /
-			(sz_damon_region(l) + sz_damon_region(r));
+	unsigned long sz_l = sz_damon_region(l), sz_r = sz_damon_region(r);
+
+	l->nr_accesses = (l->nr_accesses * sz_l + r->nr_accesses * sz_r) /
+			(sz_l + sz_r);
+	l->age = (l->age * sz_l + r->age * sz_r) / (sz_l + sz_r);
 	l->vm_end = r->vm_end;
 	damon_destroy_region(r);
 }
@@ -803,12 +809,16 @@ static void damon_merge_regions_of(struct damon_task *t, unsigned int thres)
 	struct damon_region *r, *prev = NULL, *next;
 
 	damon_for_each_region_safe(r, next, t) {
-		if (!prev || prev->vm_end != r->vm_start ||
-		    diff_of(prev->nr_accesses, r->nr_accesses) > thres) {
+		if (diff_of(r->nr_accesses, r->last_nr_accesses) > thres)
+			r->age = 0;
+		else
+			r->age++;
+
+		if (prev && prev->vm_end == r->vm_start &&
+		    diff_of(prev->nr_accesses, r->nr_accesses) <= thres)
+			damon_merge_two_regions(prev, r);
+		else
 			prev = r;
-			continue;
-		}
-		damon_merge_two_regions(prev, r);
 	}
 }
 
@@ -844,6 +854,9 @@ static void damon_split_region_at(struct damon_ctx *ctx,
 	new = damon_new_region(ctx, r->vm_start + sz_r, r->vm_end);
 	r->vm_end = new->vm_start;
 
+	new->age = r->age;
+	new->last_nr_accesses = r->last_nr_accesses;
+
 	damon_insert_region(new, r, damon_next_region(r));
 }
 
-- 
2.17.1

