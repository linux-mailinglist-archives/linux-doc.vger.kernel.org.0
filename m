Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82DB616A631
	for <lists+linux-doc@lfdr.de>; Mon, 24 Feb 2020 13:33:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727616AbgBXMd0 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 24 Feb 2020 07:33:26 -0500
Received: from smtp-fw-9101.amazon.com ([207.171.184.25]:61969 "EHLO
        smtp-fw-9101.amazon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726778AbgBXMd0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 24 Feb 2020 07:33:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1582547606; x=1614083606;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=weeHoQhUDaIKmcIzoigoC/Hxvz+bNtYyztdsYxajgwU=;
  b=ECA0thfc9tDveJzJWygM3fWRvzd2LO8g/QfLzb+2DKXhyoHWgLGLAbwK
   LiO3J7QwbjwsgXwkeM1tm4bn5f9FHZdGYLQdvdxnUjCcu6Frv5ZwyDL84
   tAKBLxRZYRw4giqCqHTAI5H96x1aCCpAWY9rdWJqVs55/Yg5jvXZwAt9M
   g=;
IronPort-SDR: T83MG9QY90gwDAPmSw8L1Ibtd/ND31zWoNbmr1OGrbuZR+nxtWs9ceJNFeWTgGWNLJVwjwGxug
 7ywEIbVUf5xA==
X-IronPort-AV: E=Sophos;i="5.70,480,1574121600"; 
   d="scan'208";a="18696393"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO email-inbound-relay-2a-22cc717f.us-west-2.amazon.com) ([10.47.23.38])
  by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP; 24 Feb 2020 12:33:25 +0000
Received: from EX13MTAUEA002.ant.amazon.com (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
        by email-inbound-relay-2a-22cc717f.us-west-2.amazon.com (Postfix) with ESMTPS id 68FE6A23F3;
        Mon, 24 Feb 2020 12:33:23 +0000 (UTC)
Received: from EX13D31EUA001.ant.amazon.com (10.43.165.15) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Mon, 24 Feb 2020 12:33:23 +0000
Received: from u886c93fd17d25d.ant.amazon.com (10.43.162.53) by
 EX13D31EUA001.ant.amazon.com (10.43.165.15) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 24 Feb 2020 12:33:11 +0000
From:   SeongJae Park <sjpark@amazon.com>
To:     <akpm@linux-foundation.org>
CC:     SeongJae Park <sjpark@amazon.de>, <aarcange@redhat.com>,
        <yang.shi@linux.alibaba.com>, <acme@kernel.org>,
        <alexander.shishkin@linux.intel.com>, <amit@kernel.org>,
        <brendan.d.gregg@gmail.com>, <brendanhiggins@google.com>,
        <cai@lca.pw>, <colin.king@canonical.com>, <corbet@lwn.net>,
        <dwmw@amazon.com>, <jolsa@redhat.com>, <kirill@shutemov.name>,
        <mark.rutland@arm.com>, <mgorman@suse.de>, <minchan@kernel.org>,
        <mingo@redhat.com>, <namhyung@kernel.org>, <peterz@infradead.org>,
        <rdunlap@infradead.org>, <rientjes@google.com>,
        <rostedt@goodmis.org>, <shuah@kernel.org>, <sj38.park@gmail.com>,
        <vbabka@suse.cz>, <vdavydov.dev@gmail.com>, <linux-mm@kvack.org>,
        <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 05/14] mm/damon: Implement callbacks
Date:   Mon, 24 Feb 2020 13:30:38 +0100
Message-ID: <20200224123047.32506-6-sjpark@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200224123047.32506-1-sjpark@amazon.com>
References: <20200224123047.32506-1-sjpark@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.43.162.53]
X-ClientProxiedBy: EX13D19UWC003.ant.amazon.com (10.43.162.184) To
 EX13D31EUA001.ant.amazon.com (10.43.165.15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: SeongJae Park <sjpark@amazon.de>

This commit implements callbacks for DAMON.  Using this, DAMON users can
install their callbacks for each step of the access monitoring so that
they can do something interesting with the monitored access pattrns
online.  For example, callbacks can report the monitored patterns to
users or do some access pattern based memory management such as
proactive reclamations or access pattern based THP promotions/demotions
decision makings.

Signed-off-by: SeongJae Park <sjpark@amazon.de>
---
 mm/damon.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/mm/damon.c b/mm/damon.c
index 6a17408e83c2..554720778e8a 100644
--- a/mm/damon.c
+++ b/mm/damon.c
@@ -83,6 +83,10 @@ struct damon_ctx {
 	struct rnd_state rndseed;
 
 	struct list_head tasks_list;	/* 'damon_task' objects */
+
+	/* callbacks */
+	void (*sample_cb)(struct damon_ctx *context);
+	void (*aggregate_cb)(struct damon_ctx *context);
 };
 
 /* Get a random number in [l, r) */
@@ -814,9 +818,13 @@ static int kdamond_fn(void *data)
 			}
 			mmput(mm);
 		}
+		if (ctx->sample_cb)
+			ctx->sample_cb(ctx);
 
 		if (kdamond_aggregate_interval_passed(ctx)) {
 			kdamond_merge_regions(ctx, max_nr_accesses / 10);
+			if (ctx->aggregate_cb)
+				ctx->aggregate_cb(ctx);
 			kdamond_flush_aggregated(ctx);
 			kdamond_split_regions(ctx);
 		}
-- 
2.17.1

