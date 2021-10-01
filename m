Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 825C041EDF3
	for <lists+linux-doc@lfdr.de>; Fri,  1 Oct 2021 14:56:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231668AbhJAM6Z (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 1 Oct 2021 08:58:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:32994 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1353644AbhJAM6O (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 1 Oct 2021 08:58:14 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 36B5B61AAD;
        Fri,  1 Oct 2021 12:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633092989;
        bh=BZepMOmxnbzsYrCr+omcsm5Nr1F8FXZedhdKBsgW9qA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qgiUwbTuesDk9LEA8buYAaCKZdEpMWofBmz3eGhknn4qQ/lOC/nocrFGfOAHbMsom
         IgdrhcRAPYUfKsSGWa3q6JKf0clHz37gvnWi1BSa5DsOFynbEjwy6kbvSP/ttz/vc7
         hOlcXF4jbntXsp7kDmCPhVjRRyJoLxq1f+FK1GnHzOdb9N8qgXUZJFK9kWj99SAnBy
         bxRzvj90Qp2HAuBps1SvkVh5zayP+yWoas2jIZf2hFhG1HSwOEYfxHQPQYUnC3g3uM
         RMm0BCOj2kNYN9A7Puozak3XuOPIqsUBgAgw+cg0aVAwmcZoh4gPqi01nToBavXPxI
         L+g1IecWpxMHA==
From:   SeongJae Park <sj@kernel.org>
To:     akpm@linux-foundation.org
Cc:     SeongJae Park <sj@kernel.org>, Jonathan.Cameron@Huawei.com,
        amit@kernel.org, benh@kernel.crashing.org, corbet@lwn.net,
        david@redhat.com, dwmw@amazon.com, elver@google.com,
        foersleo@amazon.de, gthelen@google.com, markubo@amazon.de,
        rientjes@google.com, shakeelb@google.com, shuah@kernel.org,
        linux-damon@amazon.com, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 5/7] mm/damon/schemes: Implement statistics feature
Date:   Fri,  1 Oct 2021 12:56:02 +0000
Message-Id: <20211001125604.29660-6-sj@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211001125604.29660-1-sj@kernel.org>
References: <20211001125604.29660-1-sj@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

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

Signed-off-by: SeongJae Park <sj@kernel.org>
---
 include/linux/damon.h | 10 +++++++++-
 mm/damon/core.c       |  7 ++++++-
 mm/damon/dbgfs.c      |  5 +++--
 mm/damon/vaddr.c      |  2 ++
 4 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/include/linux/damon.h b/include/linux/damon.h
index be6b6e81e8ee..f301bb53381c 100644
--- a/include/linux/damon.h
+++ b/include/linux/damon.h
@@ -78,6 +78,7 @@ struct damon_target {
  * @DAMOS_PAGEOUT:	Call ``madvise()`` for the region with MADV_PAGEOUT.
  * @DAMOS_HUGEPAGE:	Call ``madvise()`` for the region with MADV_HUGEPAGE.
  * @DAMOS_NOHUGEPAGE:	Call ``madvise()`` for the region with MADV_NOHUGEPAGE.
+ * @DAMOS_STAT:		Do nothing but count the stat.
  */
 enum damos_action {
 	DAMOS_WILLNEED,
@@ -85,6 +86,7 @@ enum damos_action {
 	DAMOS_PAGEOUT,
 	DAMOS_HUGEPAGE,
 	DAMOS_NOHUGEPAGE,
+	DAMOS_STAT,		/* Do nothing but only record the stat */
 };
 
 /**
@@ -96,9 +98,13 @@ enum damos_action {
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
@@ -108,6 +114,8 @@ struct damos {
 	unsigned int min_age_region;
 	unsigned int max_age_region;
 	enum damos_action action;
+	unsigned long stat_count;
+	unsigned long stat_sz;
 	struct list_head list;
 };
 
diff --git a/mm/damon/core.c b/mm/damon/core.c
index 0ed97b21cbb6..2f6785737902 100644
--- a/mm/damon/core.c
+++ b/mm/damon/core.c
@@ -103,6 +103,8 @@ struct damos *damon_new_scheme(
 	scheme->min_age_region = min_age_region;
 	scheme->max_age_region = max_age_region;
 	scheme->action = action;
+	scheme->stat_count = 0;
+	scheme->stat_sz = 0;
 	INIT_LIST_HEAD(&scheme->list);
 
 	return scheme;
@@ -544,9 +546,12 @@ static void damon_do_apply_schemes(struct damon_ctx *c,
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
index 78b7a04490c5..28d6abf27763 100644
--- a/mm/damon/dbgfs.c
+++ b/mm/damon/dbgfs.c
@@ -106,11 +106,11 @@ static ssize_t sprint_schemes(struct damon_ctx *c, char *buf, ssize_t len)
 
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
 
@@ -159,6 +159,7 @@ static bool damos_action_valid(int action)
 	case DAMOS_PAGEOUT:
 	case DAMOS_HUGEPAGE:
 	case DAMOS_NOHUGEPAGE:
+	case DAMOS_STAT:
 		return true;
 	default:
 		return false;
diff --git a/mm/damon/vaddr.c b/mm/damon/vaddr.c
index 3e1c74d36bab..953c145b4f08 100644
--- a/mm/damon/vaddr.c
+++ b/mm/damon/vaddr.c
@@ -705,6 +705,8 @@ int damon_va_apply_scheme(struct damon_ctx *ctx, struct damon_target *t,
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

