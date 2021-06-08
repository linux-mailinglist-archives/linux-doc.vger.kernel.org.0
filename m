Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0CDC39F5C0
	for <lists+linux-doc@lfdr.de>; Tue,  8 Jun 2021 13:55:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232271AbhFHL4r (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 8 Jun 2021 07:56:47 -0400
Received: from mail-qk1-f177.google.com ([209.85.222.177]:33697 "EHLO
        mail-qk1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231872AbhFHL4o (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Jun 2021 07:56:44 -0400
Received: by mail-qk1-f177.google.com with SMTP id k4so19875495qkd.0;
        Tue, 08 Jun 2021 04:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=nfDK/Bf/e4nvbxsoi7WegXjXDWkjyIFNxz/IfnwgRq4=;
        b=S44HjXvS2x2lWj9hdsU9WLr8ZmLz0+lYh2oBquC7n8yJ/GzJEXet10ZLvg+3L6YiBl
         yDtpC7bRtYeB0FsFOUs1+a5WfGCsnsmvazHjYqTlXKNXT+8a6Dmn4kyrKa9zkCeWbtqq
         krjoTyaA60Nxiru4lrNr/WljhplRXYVo7LyTI0/d2kquUgBxHy4C+Bsa/LoJOBfDZykZ
         hkwdmS/KPpYq6IXAyrcPajFw69paO8z0SYNwX9YBKA2vSgcsGpgZAcXj0Brlph5NjLzy
         D4z4aZRSPVR2EDXnpfNggQUhnt7jROenE8OUOJeq4a2KfZtEZQLxi73rSgDwqRN5VRKI
         uWXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=nfDK/Bf/e4nvbxsoi7WegXjXDWkjyIFNxz/IfnwgRq4=;
        b=A+CxM/r1otpH/cO1zFAueMsvzZb4jwZ/gWkKneOHHJJyCDUB7TZQAy8zSV+TQswWi2
         SQISfvkTOPUawou2hM6KWRaSI2Ta68B2oqhGcvZrp2GRcuvK7zcI8lSxZz81Cb59WEaf
         pACQMD8d2nwp15Ur0+AF2Q6V072tadIvgJWCJkRWYBut3uKozxYU7kJQkAqB3wevNxor
         Njr0wyXl6dh0mW5NReCjRTjNtTLi38uv/j8JD9NKcmK9D6nfp/SieMCgpoDqLJfLUYQY
         LhzYOEA9Zf1G9x9ZPU86KxR0zpuxCxvCFkh+TkIHspLVQss31wuGACsVmSh7e/GjMoKr
         aceQ==
X-Gm-Message-State: AOAM530dijYJX7LAmy8U0qZ8S0kK7fP+PlT6FT4bzcHuh4llDvF0XyOU
        dbUQIHSQDwUNz1t88ZtB0es=
X-Google-Smtp-Source: ABdhPJzOyu/UnvRdGVglHVJsejFgTwP8+46Uca/ivoGXirXLN/SSCSYd/i426/NRJMQcb02HTw+ddw==
X-Received: by 2002:a37:7f82:: with SMTP id a124mr20833558qkd.419.1623153215611;
        Tue, 08 Jun 2021 04:53:35 -0700 (PDT)
Received: from localhost.localdomain (ec2-35-169-212-159.compute-1.amazonaws.com. [35.169.212.159])
        by smtp.gmail.com with ESMTPSA id h4sm2133927qth.66.2021.06.08.04.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 04:53:35 -0700 (PDT)
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
Subject: [RFC v2 11/14] mm/damon/dbgfs: Support watermarks
Date:   Tue,  8 Jun 2021 11:52:51 +0000
Message-Id: <20210608115254.11930-12-sj38.park@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210608115254.11930-1-sj38.park@gmail.com>
References: <20210608115254.11930-1-sj38.park@gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: SeongJae Park <sjpark@amazon.de>

This commit updates DAMON debugfs interface to support the watermarks
based schemes activation.  For this, now 'schemes' file receives five
more values.

Signed-off-by: SeongJae Park <sjpark@amazon.de>
---
 mm/damon/dbgfs.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/mm/damon/dbgfs.c b/mm/damon/dbgfs.c
index 1680fb1be8e1..768ef3eb9550 100644
--- a/mm/damon/dbgfs.c
+++ b/mm/damon/dbgfs.c
@@ -227,7 +227,7 @@ static ssize_t sprint_schemes(struct damon_ctx *c, char *buf, ssize_t len)
 
 	damon_for_each_scheme(s, c) {
 		rc = scnprintf(&buf[written], len - written,
-				"%lu %lu %u %u %u %u %d %lu %lu %u %u %u %lu %lu\n",
+				"%lu %lu %u %u %u %u %d %lu %lu %u %u %u %d %lu %lu %lu %lu %lu %lu\n",
 				s->min_sz_region, s->max_sz_region,
 				s->min_nr_accesses, s->max_nr_accesses,
 				s->min_age_region, s->max_age_region,
@@ -235,6 +235,8 @@ static ssize_t sprint_schemes(struct damon_ctx *c, char *buf, ssize_t len)
 				s->limit.weight_sz,
 				s->limit.weight_nr_accesses,
 				s->limit.weight_age,
+				s->wmarks.metric, s->wmarks.interval,
+				s->wmarks.high, s->wmarks.mid, s->wmarks.low,
 				s->stat_count, s->stat_sz);
 		if (!rc)
 			return -ENOMEM;
@@ -315,18 +317,18 @@ static struct damos **str_to_schemes(const char *str, ssize_t len,
 	*nr_schemes = 0;
 	while (pos < len && *nr_schemes < max_nr_schemes) {
 		struct damos_speed_limit limit = {};
-		struct damos_watermarks wmarks = {
-			.metric = DAMOS_WMARK_NONE,
-		};
+		struct damos_watermarks wmarks;
 
 		ret = sscanf(&str[pos],
-				"%lu %lu %u %u %u %u %u %lu %lu %u %u %u%n",
+				"%lu %lu %u %u %u %u %u %lu %lu %u %u %u %u %lu %lu %lu %lu%n",
 				&min_sz, &max_sz, &min_nr_a, &max_nr_a,
 				&min_age, &max_age, &action, &limit.sz,
 				&limit.ms, &limit.weight_sz,
 				&limit.weight_nr_accesses, &limit.weight_age,
+				&wmarks.metric, &wmarks.interval,
+				&wmarks.high, &wmarks.mid, &wmarks.low,
 				&parsed);
-		if (ret != 12)
+		if (ret != 17)
 			break;
 		if (!damos_action_valid(action)) {
 			pr_err("wrong action %d\n", action);
-- 
2.17.1

