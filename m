Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C32C43CFA49
	for <lists+linux-doc@lfdr.de>; Tue, 20 Jul 2021 15:14:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238591AbhGTMdl (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 20 Jul 2021 08:33:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238521AbhGTMdZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 20 Jul 2021 08:33:25 -0400
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36B68C0613E0;
        Tue, 20 Jul 2021 06:13:57 -0700 (PDT)
Received: by mail-qt1-x835.google.com with SMTP id j7so2381748qtj.6;
        Tue, 20 Jul 2021 06:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=eLmnd6iZieuSdj2C5koxMI8ybXWCYl9uIJX/s9kWwgk=;
        b=SPESqdfw1g2LlbIqfwQWGMNAqLDDUpO9U/iALe+hhuZKKmYbrK6PoXtSbYzvoBto8j
         Mqb6PVx2ytiFguZeAmDxUzvhmXWsnlm7KrW9/4IqDcE2dgaY/pXXka1KKl8fH5vJUDmd
         Qw/1lE+4gM2ENKmc1/Ns0LJn6Jlj8zV/05wJGydGwpGCrdeYp0tMVz1hPKpnVqwtChoh
         PQU7fa8e/2oYPO38SRIpBypj903wQkE3FAxl2aa17AOFAjiH09gs3GwY8COqJ260Pu5T
         2yJQmp1k1fxahEVxy1BGsS281WSgU415q42LAUe76lhlJhIV+V5TgrzXZpDLq6b+n6IH
         Pi/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=eLmnd6iZieuSdj2C5koxMI8ybXWCYl9uIJX/s9kWwgk=;
        b=Z+Z1ZWVmId+lPjrdvc3TbBI6rZSqJfMRYUMdGijC1hhPLRLtlzMgu51gfRmO392UTk
         Bd4rhWdmoG4K9DJq9OL+v76fjKlV32dEH2h5ewnNZla+2bewWpF/IlaWNw9Uf0JDJwls
         IJRAAYYsV3M8tmcgGWu895EYxmfizKyizXkwx4ZCzTi3qG960jFXaj9+pjoVEbxGJRKZ
         QW0/KW0Qk88WIZBLxCVmKydmRTG5SN8XYqfDHFYp9qKcDRJNF0EqdzfddCad8GvHOyhG
         yANI+vFAPSh0EV6badHKsucYyuaDPZh0Ghie8+00Hth0uWR7Ob6FlMwv82txW8z64D2i
         s4aQ==
X-Gm-Message-State: AOAM532WxISeAhDWeLNimw7UC1IJVbVTUMuwbrCHLIDvi8fJLvMPlrun
        7mz/eUc7SJeXRbgfr5sg+u8=
X-Google-Smtp-Source: ABdhPJyElUl/ZW/jTKmwGkPtCxiExGimBuugukAYvyfYBT3iFiQT3lMQSoR5kNXpchEQELOw+NNtrw==
X-Received: by 2002:ac8:7f07:: with SMTP id f7mr25960026qtk.120.1626786836336;
        Tue, 20 Jul 2021 06:13:56 -0700 (PDT)
Received: from localhost.localdomain (ec2-35-169-212-159.compute-1.amazonaws.com. [35.169.212.159])
        by smtp.gmail.com with ESMTPSA id g17sm9701225qkm.34.2021.07.20.06.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jul 2021 06:13:55 -0700 (PDT)
From:   SeongJae Park <sj38.park@gmail.com>
To:     akpm@linux-foundation.org
Cc:     SeongJae Park <sjpark@amazon.de>, Jonathan.Cameron@Huawei.com,
        acme@kernel.org, alexander.shishkin@linux.intel.com,
        amit@kernel.org, benh@kernel.crashing.org,
        brendanhiggins@google.com, corbet@lwn.net, david@redhat.com,
        dwmw@amazon.com, elver@google.com, fan.du@intel.com,
        foersleo@amazon.de, greg@kroah.com, gthelen@google.com,
        guoju.fgj@alibaba-inc.com, jgowans@amazon.com, joe@perches.com,
        mgorman@suse.de, mheyne@amazon.de, minchan@kernel.org,
        mingo@redhat.com, namhyung@kernel.org, peterz@infradead.org,
        riel@surriel.com, rientjes@google.com, rostedt@goodmis.org,
        rppt@kernel.org, shakeelb@google.com, shuah@kernel.org,
        sieberf@amazon.com, sj38.park@gmail.com, snu@zelle79.org,
        vbabka@suse.cz, vdavydov.dev@gmail.com, zgf574564920@gmail.com,
        linux-damon@amazon.com, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RFC v3 02/15] mm/damon/damos: Make schemes aggressiveness controllable
Date:   Tue, 20 Jul 2021 13:12:56 +0000
Message-Id: <20210720131309.22073-3-sj38.park@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210720131309.22073-1-sj38.park@gmail.com>
References: <20210720131309.22073-1-sj38.park@gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: SeongJae Park <sjpark@amazon.de>

If there are too large memory regions fulfilling the target data access
pattern of a DAMON-based operation scheme, applying the action of the
scheme could consume too much CPU.  To avoid that, this commit
implements a limit for the action application speed.  Using the feature,
the client can set up to how much amount of memory regions the action
could applied within specific time duration.

Signed-off-by: SeongJae Park <sjpark@amazon.de>
---
 include/linux/damon.h | 36 +++++++++++++++++++++++---
 mm/damon/core.c       | 60 +++++++++++++++++++++++++++++++++++++------
 mm/damon/dbgfs.c      |  4 ++-
 3 files changed, 87 insertions(+), 13 deletions(-)

diff --git a/include/linux/damon.h b/include/linux/damon.h
index 6eb265717fd4..9c996adb02b8 100644
--- a/include/linux/damon.h
+++ b/include/linux/damon.h
@@ -89,6 +89,26 @@ enum damos_action {
 	DAMOS_STAT,		/* Do nothing but only record the stat */
 };
 
+/**
+ * struct damos_quota - Controls the aggressiveness of the given scheme.
+ * @sz:			Maximum bytes of memory that the action can be applied.
+ * @reset_interval:	Charge reset interval in milliseconds.
+ *
+ * To avoid consuming too much CPU time or IO resources for applying the
+ * &struct damos->action to large memory, DAMON allows users to set a size
+ * quota.  The quota can be set by writing non-zero values to &sz.  If the size
+ * quota is set, DAMON tries to apply the action only up to &sz bytes within
+ * &reset_interval.
+ */
+struct damos_quota {
+	unsigned long sz;
+	unsigned long reset_interval;
+
+/* private: For charging the quota */
+	unsigned long charged_sz;
+	unsigned long charged_from;
+};
+
 /**
  * struct damos - Represents a Data Access Monitoring-based Operation Scheme.
  * @min_sz_region:	Minimum size of target regions.
@@ -98,13 +118,20 @@ enum damos_action {
  * @min_age_region:	Minimum age of target regions.
  * @max_age_region:	Maximum age of target regions.
  * @action:		&damo_action to be applied to the target regions.
+ * @quota:		Control the aggressiveness of this scheme.
  * @stat_count:		Total number of regions that this scheme is applied.
  * @stat_sz:		Total size of regions that this scheme is applied.
  * @list:		List head for siblings.
  *
- * For each aggregation interval, DAMON applies @action to monitoring target
- * regions fit in the condition and updates the statistics.  Note that both
- * the minimums and the maximums are inclusive.
+ * For each aggregation interval, DAMON finds regions which fit in the
+ * condition (&min_sz_region, &max_sz_region, &min_nr_accesses,
+ * &max_nr_accesses, &min_age_region, &max_age_region) and applies &action to
+ * those.  To avoid consuming too much CPU time or IO resources for the
+ * &action, &quota is used.
+ *
+ * After applying the &action to each region, &stat_count and &stat_sz is
+ * updated to reflect the number of regions and total size of regions that the
+ * &action is applied.
  */
 struct damos {
 	unsigned long min_sz_region;
@@ -114,6 +141,7 @@ struct damos {
 	unsigned int min_age_region;
 	unsigned int max_age_region;
 	enum damos_action action;
+	struct damos_quota quota;
 	unsigned long stat_count;
 	unsigned long stat_sz;
 	struct list_head list;
@@ -338,7 +366,7 @@ struct damos *damon_new_scheme(
 		unsigned long min_sz_region, unsigned long max_sz_region,
 		unsigned int min_nr_accesses, unsigned int max_nr_accesses,
 		unsigned int min_age_region, unsigned int max_age_region,
-		enum damos_action action);
+		enum damos_action action, struct damos_quota *quota);
 void damon_add_scheme(struct damon_ctx *ctx, struct damos *s);
 void damon_destroy_scheme(struct damos *s);
 
diff --git a/mm/damon/core.c b/mm/damon/core.c
index c45827e853cf..00804a1e5e2a 100644
--- a/mm/damon/core.c
+++ b/mm/damon/core.c
@@ -89,7 +89,7 @@ struct damos *damon_new_scheme(
 		unsigned long min_sz_region, unsigned long max_sz_region,
 		unsigned int min_nr_accesses, unsigned int max_nr_accesses,
 		unsigned int min_age_region, unsigned int max_age_region,
-		enum damos_action action)
+		enum damos_action action, struct damos_quota *quota)
 {
 	struct damos *scheme;
 
@@ -107,6 +107,11 @@ struct damos *damon_new_scheme(
 	scheme->stat_sz = 0;
 	INIT_LIST_HEAD(&scheme->list);
 
+	scheme->quota.sz = quota->sz;
+	scheme->quota.reset_interval = quota->reset_interval;
+	scheme->quota.charged_sz = 0;
+	scheme->quota.charged_from = 0;
+
 	return scheme;
 }
 
@@ -535,15 +540,25 @@ static void kdamond_reset_aggregated(struct damon_ctx *c)
 	}
 }
 
+static void damon_split_region_at(struct damon_ctx *ctx,
+		struct damon_target *t, struct damon_region *r,
+		unsigned long sz_r);
+
 static void damon_do_apply_schemes(struct damon_ctx *c,
 				   struct damon_target *t,
 				   struct damon_region *r)
 {
 	struct damos *s;
-	unsigned long sz;
 
 	damon_for_each_scheme(s, c) {
-		sz = r->ar.end - r->ar.start;
+		struct damos_quota *quota = &s->quota;
+		unsigned long sz = r->ar.end - r->ar.start;
+
+		/* Check the quota */
+		if (quota->sz && quota->charged_sz >= quota->sz)
+			continue;
+
+		/* Check the target regions condition */
 		if (sz < s->min_sz_region || s->max_sz_region < sz)
 			continue;
 		if (r->nr_accesses < s->min_nr_accesses ||
@@ -551,22 +566,51 @@ static void damon_do_apply_schemes(struct damon_ctx *c,
 			continue;
 		if (r->age < s->min_age_region || s->max_age_region < r->age)
 			continue;
-		s->stat_count++;
-		s->stat_sz += sz;
-		if (c->primitive.apply_scheme)
+
+		/* Apply the scheme */
+		if (c->primitive.apply_scheme) {
+			if (quota->sz && quota->charged_sz + sz > quota->sz) {
+				sz = ALIGN_DOWN(quota->sz - quota->charged_sz,
+						DAMON_MIN_REGION);
+				if (!sz)
+					goto update_stat;
+				damon_split_region_at(c, t, r, sz);
+			}
 			c->primitive.apply_scheme(c, t, r, s);
+			quota->charged_sz += sz;
+		}
 		if (s->action != DAMOS_STAT)
 			r->age = 0;
+
+update_stat:
+		s->stat_count++;
+		s->stat_sz += sz;
 	}
 }
 
 static void kdamond_apply_schemes(struct damon_ctx *c)
 {
 	struct damon_target *t;
-	struct damon_region *r;
+	struct damon_region *r, *next_r;
+	struct damos *s;
+
+	damon_for_each_scheme(s, c) {
+		struct damos_quota *quota = &s->quota;
+
+		if (!quota->sz)
+			continue;
+
+		/* New charge window starts */
+		if (time_after_eq(jiffies, quota->charged_from +
+					msecs_to_jiffies(
+						quota->reset_interval))) {
+			quota->charged_from = jiffies;
+			quota->charged_sz = 0;
+		}
+	}
 
 	damon_for_each_target(t, c) {
-		damon_for_each_region(r, t)
+		damon_for_each_region_safe(r, next_r, t)
 			damon_do_apply_schemes(c, t, r);
 	}
 }
diff --git a/mm/damon/dbgfs.c b/mm/damon/dbgfs.c
index c244e7689c70..ac0de2de1987 100644
--- a/mm/damon/dbgfs.c
+++ b/mm/damon/dbgfs.c
@@ -310,6 +310,8 @@ static struct damos **str_to_schemes(const char *str, ssize_t len,
 
 	*nr_schemes = 0;
 	while (pos < len && *nr_schemes < max_nr_schemes) {
+		struct damos_quota quota = {};
+
 		ret = sscanf(&str[pos], "%lu %lu %u %u %u %u %u%n",
 				&min_sz, &max_sz, &min_nr_a, &max_nr_a,
 				&min_age, &max_age, &action, &parsed);
@@ -322,7 +324,7 @@ static struct damos **str_to_schemes(const char *str, ssize_t len,
 
 		pos += parsed;
 		scheme = damon_new_scheme(min_sz, max_sz, min_nr_a, max_nr_a,
-				min_age, max_age, action);
+				min_age, max_age, action, &quota);
 		if (!scheme)
 			goto fail;
 
-- 
2.17.1

