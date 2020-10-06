Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA2B0284BD2
	for <lists+linux-doc@lfdr.de>; Tue,  6 Oct 2020 14:42:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726439AbgJFMmW (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 6 Oct 2020 08:42:22 -0400
Received: from smtp-fw-33001.amazon.com ([207.171.190.10]:48028 "EHLO
        smtp-fw-33001.amazon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726362AbgJFMmV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 6 Oct 2020 08:42:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1601988141; x=1633524141;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=VqB0Rh4NRB/F+lNXtwUepo2+LzPEs6Rubttvp1uUTsg=;
  b=gKphMXY3yhxX1fZ8q7XF/CX6OHXzDuzpwFzPnYdmzLZ8RmbDpj+A5eqS
   e6z/KjidtB/I4Uw0qUCTBpjiZV8D+MP2TBvku7rSnRzgXwWtLzPNhVROO
   JsMVm1gnEgpWGT9EVXKdW3f72z7MAm7fENWYeyXlM5FjQM7scEEzBXM7s
   c=;
X-IronPort-AV: E=Sophos;i="5.77,343,1596499200"; 
   d="scan'208";a="80729467"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO email-inbound-relay-2b-c7131dcf.us-west-2.amazon.com) ([10.47.23.38])
  by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP; 06 Oct 2020 12:42:20 +0000
Received: from EX13D31EUA004.ant.amazon.com (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
        by email-inbound-relay-2b-c7131dcf.us-west-2.amazon.com (Postfix) with ESMTPS id 818ADA1DC0;
        Tue,  6 Oct 2020 12:42:15 +0000 (UTC)
Received: from u3f2cd687b01c55.ant.amazon.com (10.43.161.237) by
 EX13D31EUA004.ant.amazon.com (10.43.165.161) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 6 Oct 2020 12:41:57 +0000
From:   SeongJae Park <sjpark@amazon.com>
To:     <akpm@linux-foundation.org>
CC:     SeongJae Park <sjpark@amazon.de>, <Jonathan.Cameron@Huawei.com>,
        <aarcange@redhat.com>, <acme@kernel.org>,
        <alexander.shishkin@linux.intel.com>, <amit@kernel.org>,
        <benh@kernel.crashing.org>, <brendan.d.gregg@gmail.com>,
        <brendanhiggins@google.com>, <cai@lca.pw>,
        <colin.king@canonical.com>, <corbet@lwn.net>, <david@redhat.com>,
        <dwmw@amazon.com>, <elver@google.com>, <fan.du@intel.com>,
        <foersleo@amazon.de>, <gthelen@google.com>, <irogers@google.com>,
        <jolsa@redhat.com>, <kirill@shutemov.name>, <mark.rutland@arm.com>,
        <mgorman@suse.de>, <minchan@kernel.org>, <mingo@redhat.com>,
        <namhyung@kernel.org>, <peterz@infradead.org>,
        <rdunlap@infradead.org>, <riel@surriel.com>, <rientjes@google.com>,
        <rostedt@goodmis.org>, <rppt@kernel.org>, <sblbir@amazon.com>,
        <shakeelb@google.com>, <shuah@kernel.org>, <sj38.park@gmail.com>,
        <snu@amazon.de>, <vbabka@suse.cz>, <vdavydov.dev@gmail.com>,
        <yang.shi@linux.alibaba.com>, <ying.huang@intel.com>,
        <zgf574564920@gmail.com>, <linux-damon@amazon.com>,
        <linux-mm@kvack.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [RFC v15 5/8] mm/damon/schemes: Implement statistics feature
Date:   Tue, 6 Oct 2020 14:39:28 +0200
Message-ID: <20201006123931.5847-6-sjpark@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201006123931.5847-1-sjpark@amazon.com>
References: <20201006123931.5847-1-sjpark@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.43.161.237]
X-ClientProxiedBy: EX13D18UWA002.ant.amazon.com (10.43.160.199) To
 EX13D31EUA004.ant.amazon.com (10.43.165.161)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: SeongJae Park <sjpark@amazon.de>

To tune the DAMON-based operation schemes, knowing how many and how
large regions are affected by each of the schemes will be helful.  Those
stats could be used for not only the tuning, but also monitoring of the
working set size and the number of regions, if the scheme does not
change the program behavior too much.

For the reason, this commit implements the statistics for the schemes.
The total number and size of the regions that each scheme is applied are
exported to users via '->stat_count' and '->stat_sz' of 'struct damos'.
Admins can also check the number by reading 'schemes' debugfs file.  The
last two integers now represents the stats.  To allow collecting the
stats without changing the program behavior, this commit also adds new
scheme action, 'DAMOS_STAT'.  Note that 'DAMOS_STAT' is not only making
no memory operation actions, but also does not reset the age of regions.

Signed-off-by: SeongJae Park <sjpark@amazon.de>
---
 include/linux/damon.h | 10 +++++++++-
 mm/damon/core.c       |  7 ++++++-
 mm/damon/dbgfs.c      |  5 +++--
 mm/damon/primitives.c |  2 ++
 4 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/include/linux/damon.h b/include/linux/damon.h
index 3aaea4fdde80..decd1374eaa5 100644
--- a/include/linux/damon.h
+++ b/include/linux/damon.h
@@ -73,6 +73,7 @@ struct damon_target {
  * @DAMOS_PAGEOUT:	Call ``madvise()`` for the region with MADV_PAGEOUT.
  * @DAMOS_HUGEPAGE:	Call ``madvise()`` for the region with MADV_HUGEPAGE.
  * @DAMOS_NOHUGEPAGE:	Call ``madvise()`` for the region with MADV_NOHUGEPAGE.
+ * @DAMOS_STAT:		Do nothing but count the stat.
  */
 enum damos_action {
 	DAMOS_WILLNEED,
@@ -80,6 +81,7 @@ enum damos_action {
 	DAMOS_PAGEOUT,
 	DAMOS_HUGEPAGE,
 	DAMOS_NOHUGEPAGE,
+	DAMOS_STAT,		/* Do nothing but only record the stat */
 };
 
 /**
@@ -91,9 +93,13 @@ enum damos_action {
  * @min_age_region:	Minimum age of target regions.
  * @max_age_region:	Maximum age of target regions.
  * @action:		&damo_action to be applied to the target regions.
+ * @stat_count:		Total number of regions that this scheme is applied.
+ * @stat_sz:		Total size of regions that this scheme is applied.
  * @list:		List head for siblings.
  *
- * Note that both the minimums and the maximums are inclusive.
+ * For each aggregation interval, DAMON applies @action to monitoring target
+ * regions fit in the condition and updates the statistics.  Note that both
+ * the minimums and the maximums are inclusive.
  */
 struct damos {
 	unsigned long min_sz_region;
@@ -103,6 +109,8 @@ struct damos {
 	unsigned int min_age_region;
 	unsigned int max_age_region;
 	enum damos_action action;
+	unsigned long stat_count;
+	unsigned long stat_sz;
 	struct list_head list;
 };
 
diff --git a/mm/damon/core.c b/mm/damon/core.c
index 7a2aeba3d18d..4596ac955330 100644
--- a/mm/damon/core.c
+++ b/mm/damon/core.c
@@ -105,6 +105,8 @@ struct damos *damon_new_scheme(
 	scheme->min_age_region = min_age_region;
 	scheme->max_age_region = max_age_region;
 	scheme->action = action;
+	scheme->stat_count = 0;
+	scheme->stat_sz = 0;
 	INIT_LIST_HEAD(&scheme->list);
 
 	return scheme;
@@ -541,9 +543,12 @@ static void damon_do_apply_schemes(struct damon_ctx *c,
 			continue;
 		if (r->age < s->min_age_region || s->max_age_region < r->age)
 			continue;
+		s->stat_count++;
+		s->stat_sz += sz;
 		if (c->primitive.apply_scheme)
 			c->primitive.apply_scheme(c, t, r, s);
-		r->age = 0;
+		if (s->action != DAMOS_STAT)
+			r->age = 0;
 	}
 }
 
diff --git a/mm/damon/dbgfs.c b/mm/damon/dbgfs.c
index 54bdccd0af71..9390ed9b9304 100644
--- a/mm/damon/dbgfs.c
+++ b/mm/damon/dbgfs.c
@@ -228,11 +228,11 @@ static ssize_t sprint_schemes(struct damon_ctx *c, char *buf, ssize_t len)
 
 	damon_for_each_scheme(s, c) {
 		rc = scnprintf(&buf[written], len - written,
-				"%lu %lu %u %u %u %u %d\n",
+				"%lu %lu %u %u %u %u %d %lu %lu\n",
 				s->min_sz_region, s->max_sz_region,
 				s->min_nr_accesses, s->max_nr_accesses,
 				s->min_age_region, s->max_age_region,
-				s->action);
+				s->action, s->stat_count, s->stat_sz);
 		if (!rc)
 			return -ENOMEM;
 
@@ -281,6 +281,7 @@ static bool damos_action_valid(int action)
 	case DAMOS_PAGEOUT:
 	case DAMOS_HUGEPAGE:
 	case DAMOS_NOHUGEPAGE:
+	case DAMOS_STAT:
 		return true;
 	default:
 		return false;
diff --git a/mm/damon/primitives.c b/mm/damon/primitives.c
index 2224e3e139a8..01c1ef3f7ff9 100644
--- a/mm/damon/primitives.c
+++ b/mm/damon/primitives.c
@@ -635,6 +635,8 @@ int damon_va_apply_scheme(struct damon_ctx *ctx, struct damon_target *t,
 	case DAMOS_NOHUGEPAGE:
 		madv_action = MADV_NOHUGEPAGE;
 		break;
+	case DAMOS_STAT:
+		return 0;
 	default:
 		pr_warn("Wrong action %d\n", scheme->action);
 		return -EINVAL;
-- 
2.17.1

