Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7223839F5AB
	for <lists+linux-doc@lfdr.de>; Tue,  8 Jun 2021 13:53:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232374AbhFHLzf (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 8 Jun 2021 07:55:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232134AbhFHLze (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Jun 2021 07:55:34 -0400
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF15EC061789;
        Tue,  8 Jun 2021 04:53:25 -0700 (PDT)
Received: by mail-qv1-xf32.google.com with SMTP id w4so3137414qvr.11;
        Tue, 08 Jun 2021 04:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=USupWkjstKLzS9GL1eZ+AKXClsG/TjR98Rj/j8aN4z0=;
        b=Z/Knr8Fgp9bWjg1dd0BIpTKDEBXVpsMpZ3+elPatEnn5m801o33WnyZYHWQifpPT7H
         qc3aLzdcU3Ixq28wk30Reufga9vdRaLhMmwJr9S/5hNxWiW7iGy1KAjSA79sIjLqrtAX
         B1tkfsqUNz51ADga1t7fk9SvFgXMEcX8Wkr5LTDu/FO1xhh49lt3/OG/SyARRO+M2Csx
         QnkbGAPXhi/8QlDRjM0YjD161hlsCuIGipgB9jLv3mUnG+pd8rMjwWm2B/Fq7bf2EQFT
         kjkNLRD1IcJNIdWbJ8IO5SCc73zy0UWM9g8tx5d8wVDJuW3YboYrWHjGyd+PgybgvzE4
         yf4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=USupWkjstKLzS9GL1eZ+AKXClsG/TjR98Rj/j8aN4z0=;
        b=oymglGS794bmeFw/Vmrql5URifRWSWsjA8dw5NoykdEU7jGlIySxDudL9AZKq9bydL
         b/VkKussWFlp8sjXn+M9b3aUCORieOlYpdWt3gCxMPdM88MrrdewmmpB7OBXwMXaWP/E
         nJnVsoWI8iW9Zy481c57g6Jzh/y+VPKsnKOCx7XtqUIzXpeXp+Wm4ZouLPuXB/Pr5nn/
         Z6AMfESis2xUuLF9PkJK4jsFfEE7Pav381wSK2Z5ojmlJMpvZ07kAk7kaaAXl0h2ILaH
         4BszIAk95val+7gKtCujf9YBK0eKgwpvhvoHEe+mW3+X4keQrR9h8TXTjJslo35iKA3u
         0fZA==
X-Gm-Message-State: AOAM530ACLSSCYOfIbg4zY293ShO+ku9n0uPZp7mmnXjm19G3V+ky6Bg
        G4AGF6BmOqj+krSY+g3R+o4=
X-Google-Smtp-Source: ABdhPJziaxjKD2gnNPTzevzkb3cN3YS/ADUNou87xRED4m+fbEP2mh4YVLkGZXxtdWHNNE0qodFlTQ==
X-Received: by 2002:a0c:e185:: with SMTP id p5mr22740331qvl.17.1623153205024;
        Tue, 08 Jun 2021 04:53:25 -0700 (PDT)
Received: from localhost.localdomain (ec2-35-169-212-159.compute-1.amazonaws.com. [35.169.212.159])
        by smtp.gmail.com with ESMTPSA id h4sm2133927qth.66.2021.06.08.04.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 04:53:24 -0700 (PDT)
From:   SeongJae Park <sj38.park@gmail.com>
To:     akpm@linux-foundation.org
Cc:     SeongJae Park <sjpark@amazon.de>, Jonathan.Cameron@Huawei.com,
        acme@kernel.org, alexander.shishkin@linux.intel.com,
        amit@kernel.org, benh@kernel.crashing.org,
        brendanhiggins@google.com, corbet@lwn.net, david@redhat.com,
        dwmw@amazon.com, elver@google.com, fan.du@intel.com,
        foersleo@amazon.de, greg@kroah.com, gthelen@google.com,
        guoju.fgj@alibaba-inc.com, jgowans@amazon.com, mgorman@suse.de,
        minchan@kernel.org, mingo@redhat.com, namhyung@kernel.org,
        peterz@infradead.org, riel@surriel.com, rientjes@google.com,
        rostedt@goodmis.org, rppt@kernel.org, shakeelb@google.com,
        shuah@kernel.org, sj38.park@gmail.com, snu@zelle79.org,
        vbabka@suse.cz, vdavydov.dev@gmail.com, zgf574564920@gmail.com,
        linux-damon@amazon.com, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RFC v2 06/14] mm/damon/schemes: Prioritize regions within speed limit
Date:   Tue,  8 Jun 2021 11:52:46 +0000
Message-Id: <20210608115254.11930-7-sj38.park@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210608115254.11930-1-sj38.park@gmail.com>
References: <20210608115254.11930-1-sj38.park@gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: SeongJae Park <sjpark@amazon.de>

This commit makes DAMON to apply schemes to regions having higher
priority first, if it cannot apply schemes to all regions due to the
speed limit.

The prioritization function should be implemented in each monitoring
primitive.  Those would commonly calculate the priority of the region
using attributes of regions, namely 'size', 'nr_accesses', and 'age'.
For example, some primitive would calculate the priority of each region
using a weighted sum of 'nr_accesses' and 'age' of the region.

The optimal weights would depend on give environments, so this commit
allows it to be customizable.  Nevertheless, the score calculation
functions are only encouraged to respect the weights, not mandated.  So,
the customization might not work for some primitives.

Signed-off-by: SeongJae Park <sjpark@amazon.de>
---
 include/linux/damon.h | 27 ++++++++++++++++-
 mm/damon/core.c       | 69 ++++++++++++++++++++++++++++++++++++-------
 2 files changed, 84 insertions(+), 12 deletions(-)

diff --git a/include/linux/damon.h b/include/linux/damon.h
index 0df81dd2d560..8f35bd94fc2b 100644
--- a/include/linux/damon.h
+++ b/include/linux/damon.h
@@ -14,6 +14,8 @@
 
 /* Minimal region size.  Every damon_region is aligned by this. */
 #define DAMON_MIN_REGION	PAGE_SIZE
+/* Max priority score for DAMON-based operation schemes */
+#define DAMOS_MAX_SCORE		(99)
 
 /**
  * struct damon_addr_range - Represents an address region of [@start, @end).
@@ -92,8 +94,18 @@ enum damos_action {
  * @sz:			Scheme action amount limit in bytes.
  * @ms:			Scheme action amount charge duration.
  *
+ * @weight_sz:		Weight of the region's size for prioritization.
+ * @weight_nr_accesses:	Weight of the region's nr_accesses for prioritization.
+ * @weight_age:		Weight of the region's age for prioritization.
+ *
  * To avoid consuming too much CPU time for applying the &struct damos->action
- * to large memory, DAMON applies it to only up to &sz bytes within &ms.
+ * to large memory, DAMON applies it to only up to &sz bytes within &ms.  For
+ * selecting regions within the limit, DAMON prioritizes current scheme's
+ * target memory regions using the given &struct
+ * damon_primitive->get_scheme_score.  You could customize the prioritization
+ * logic for your environment by setting &weight_sz, &weight_nr_accesses, and
+ * &weight_age, because primitives are encouraged to respect those, though it's
+ * not mandatory.
  *
  * If &sz is 0, the limit is disabled.
  */
@@ -101,11 +113,18 @@ struct damos_speed_limit {
 	unsigned long sz;
 	unsigned long ms;
 
+	unsigned int weight_sz;
+	unsigned int weight_nr_accesses;
+	unsigned int weight_age;
+
 /* private: for limit accounting */
 	unsigned long charged_sz;
 	unsigned long charged_from;
 	struct damon_target *charge_target_from;
 	unsigned long charge_addr_from;
+
+	unsigned long histogram[DAMOS_MAX_SCORE + 1];
+	unsigned int min_score;
 };
 
 /**
@@ -155,6 +174,7 @@ struct damon_ctx;
  * @prepare_access_checks:	Prepare next access check of target regions.
  * @check_accesses:		Check the accesses to target regions.
  * @reset_aggregated:		Reset aggregated accesses monitoring results.
+ * @get_scheme_score:		Get the score of a region for a scheme.
  * @apply_scheme:		Apply a DAMON-based operation scheme.
  * @target_valid:		Determine if the target is valid.
  * @cleanup:			Clean up the context.
@@ -182,6 +202,8 @@ struct damon_ctx;
  * of its update.  The value will be used for regions adjustment threshold.
  * @reset_aggregated should reset the access monitoring results that aggregated
  * by @check_accesses.
+ * @get_scheme_score should return the priority score of a region for a scheme
+ * as an integer in [0, &DAMOS_MAX_SCORE].
  * @apply_scheme is called from @kdamond when a region for user provided
  * DAMON-based operation scheme is found.  It should apply the scheme's action
  * to the region.  This is not used for &DAMON_ARBITRARY_TARGET case.
@@ -196,6 +218,9 @@ struct damon_primitive {
 	void (*prepare_access_checks)(struct damon_ctx *context);
 	unsigned int (*check_accesses)(struct damon_ctx *context);
 	void (*reset_aggregated)(struct damon_ctx *context);
+	int (*get_scheme_score)(struct damon_ctx *context,
+			struct damon_target *t, struct damon_region *r,
+			struct damos *scheme);
 	int (*apply_scheme)(struct damon_ctx *context, struct damon_target *t,
 			struct damon_region *r, struct damos *scheme);
 	bool (*target_valid)(void *target);
diff --git a/mm/damon/core.c b/mm/damon/core.c
index 5864b63c18f9..15bcd05670d1 100644
--- a/mm/damon/core.c
+++ b/mm/damon/core.c
@@ -12,6 +12,7 @@
 #include <linux/kthread.h>
 #include <linux/random.h>
 #include <linux/slab.h>
+#include <linux/string.h>
 
 #define CREATE_TRACE_POINTS
 #include <trace/events/damon.h>
@@ -105,11 +106,13 @@ struct damos *damon_new_scheme(
 
 	scheme->limit.sz = limit->sz;
 	scheme->limit.ms = limit->ms;
+	scheme->limit.weight_sz = limit->weight_sz;
+	scheme->limit.weight_nr_accesses = limit->weight_nr_accesses;
+	scheme->limit.weight_age = limit->weight_age;
 	scheme->limit.charged_sz = 0;
 	scheme->limit.charged_from = 0;
 	scheme->limit.charge_target_from = NULL;
 	scheme->limit.charge_addr_from = 0;
-
 	return scheme;
 }
 
@@ -546,6 +549,28 @@ static void kdamond_reset_aggregated(struct damon_ctx *c)
 static void damon_split_region_at(struct damon_ctx *ctx,
 				  struct damon_region *r, unsigned long sz_r);
 
+static bool __damos_valid_target(struct damon_region *r, struct damos *s)
+{
+	unsigned long sz;
+
+	sz = r->ar.end - r->ar.start;
+	return s->min_sz_region <= sz && sz <= s->max_sz_region &&
+		s->min_nr_accesses <= r->nr_accesses &&
+		r->nr_accesses <= s->max_nr_accesses &&
+		s->min_age_region <= r->age && r->age <= s->max_age_region;
+}
+
+static bool damos_valid_target(struct damon_ctx *c, struct damon_target *t,
+		struct damon_region *r, struct damos *s)
+{
+	bool ret = __damos_valid_target(r, s);
+
+	if (!ret || !s->limit.sz || !c->primitive.get_scheme_score)
+		return ret;
+
+	return c->primitive.get_scheme_score(c, t, r, s) >= s->limit.min_score;
+}
+
 static void damon_do_apply_schemes(struct damon_ctx *c,
 				   struct damon_target *t,
 				   struct damon_region *r)
@@ -575,17 +600,11 @@ static void damon_do_apply_schemes(struct damon_ctx *c,
 			limit->charge_addr_from = 0;
 		}
 
-		sz = r->ar.end - r->ar.start;
-		/* Check the target regions condition */
-		if (sz < s->min_sz_region || s->max_sz_region < sz)
-			continue;
-		if (r->nr_accesses < s->min_nr_accesses ||
-				s->max_nr_accesses < r->nr_accesses)
-			continue;
-		if (r->age < s->min_age_region || s->max_age_region < r->age)
+		if (!damos_valid_target(c, t, r, s))
 			continue;
 
 		/* Apply the scheme */
+		sz = r->ar.end - r->ar.start;
 		if (c->primitive.apply_scheme) {
 			if (limit->sz && limit->charged_sz + sz > limit->sz) {
 				sz = limit->sz - limit->charged_sz;
@@ -615,16 +634,44 @@ static void kdamond_apply_schemes(struct damon_ctx *c)
 
 	damon_for_each_scheme(s, c) {
 		struct damos_speed_limit *limit = &s->limit;
+		unsigned long cumulated_sz;
+		unsigned int score, max_score = 0;
 
 		if (!limit->sz)
 			continue;
 
 		/* Reset charge window if the duration passed */
-		if (time_after_eq(jiffies, limit->charged_from +
-					msecs_to_jiffies(limit->ms))) {
+		if (time_after_eq(jiffies, s->limit.charged_from +
+					msecs_to_jiffies(s->limit.ms))) {
 			limit->charged_from = jiffies;
 			limit->charged_sz = 0;
 		}
+
+		if (!c->primitive.get_scheme_score)
+			continue;
+
+		/* Fill up the score histogram */
+		memset(limit->histogram, 0, sizeof(limit->histogram));
+		damon_for_each_target(t, c) {
+			damon_for_each_region(r, t) {
+				if (!__damos_valid_target(r, s))
+					continue;
+				score = c->primitive.get_scheme_score(
+						c, t, r, s);
+				limit->histogram[score] +=
+					r->ar.end - r->ar.start;
+				if (score > max_score)
+					max_score = score;
+			}
+		}
+
+		/* Set the min score limit */
+		for (cumulated_sz = 0, score = max_score; ; score--) {
+			cumulated_sz += limit->histogram[score];
+			if (cumulated_sz >= limit->sz || !score)
+				break;
+		}
+		limit->min_score = score;
 	}
 
 	damon_for_each_target(t, c) {
-- 
2.17.1

