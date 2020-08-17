Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D2BE2464E6
	for <lists+linux-doc@lfdr.de>; Mon, 17 Aug 2020 12:55:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728205AbgHQKzR (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 17 Aug 2020 06:55:17 -0400
Received: from smtp-fw-4101.amazon.com ([72.21.198.25]:49184 "EHLO
        smtp-fw-4101.amazon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727868AbgHQKzJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 17 Aug 2020 06:55:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1597661707; x=1629197707;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=k6WU8X8uUioiTj7c3Ke/KLWkbXXGCVDmB5Ldj54XnIY=;
  b=NGTENIgdquIQBTZlcgbLwhGXyKSa7UPBLvT2xVd42HZRWmj0SHtkMCQg
   a4JvkW6hNS7EnkibW4fbyREhY2OVz7laCSqDsm5MnphWpjLoa+5RoAJuR
   otefM4a9kgJKOr/ZLYRdYoQZgdJPv59MxI/lfB6zshJiYt7qcvmeVMxvt
   U=;
X-IronPort-AV: E=Sophos;i="5.76,322,1592870400"; 
   d="scan'208";a="48282142"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO email-inbound-relay-1d-2c665b5d.us-east-1.amazon.com) ([10.43.8.6])
  by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP; 17 Aug 2020 10:55:06 +0000
Received: from EX13MTAUEA002.ant.amazon.com (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
        by email-inbound-relay-1d-2c665b5d.us-east-1.amazon.com (Postfix) with ESMTPS id C9FDAA1BCE;
        Mon, 17 Aug 2020 10:54:54 +0000 (UTC)
Received: from EX13D31EUA001.ant.amazon.com (10.43.165.15) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 17 Aug 2020 10:54:53 +0000
Received: from u3f2cd687b01c55.ant.amazon.com (10.43.160.192) by
 EX13D31EUA001.ant.amazon.com (10.43.165.15) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 17 Aug 2020 10:54:37 +0000
From:   SeongJae Park <sjpark@amazon.com>
To:     <akpm@linux-foundation.org>
CC:     SeongJae Park <sjpark@amazon.de>, <Jonathan.Cameron@Huawei.com>,
        <aarcange@redhat.com>, <acme@kernel.org>,
        <alexander.shishkin@linux.intel.com>, <amit@kernel.org>,
        <benh@kernel.crashing.org>, <brendan.d.gregg@gmail.com>,
        <brendanhiggins@google.com>, <cai@lca.pw>,
        <colin.king@canonical.com>, <corbet@lwn.net>, <david@redhat.com>,
        <dwmw@amazon.com>, <fan.du@intel.com>, <foersleo@amazon.de>,
        <gthelen@google.com>, <irogers@google.com>, <jolsa@redhat.com>,
        <kirill@shutemov.name>, <mark.rutland@arm.com>, <mgorman@suse.de>,
        <minchan@kernel.org>, <mingo@redhat.com>, <namhyung@kernel.org>,
        <peterz@infradead.org>, <rdunlap@infradead.org>,
        <riel@surriel.com>, <rientjes@google.com>, <rostedt@goodmis.org>,
        <rppt@kernel.org>, <sblbir@amazon.com>, <shakeelb@google.com>,
        <shuah@kernel.org>, <sj38.park@gmail.com>, <snu@amazon.de>,
        <vbabka@suse.cz>, <vdavydov.dev@gmail.com>,
        <yang.shi@linux.alibaba.com>, <ying.huang@intel.com>,
        <zgf574564920@gmail.com>, <linux-damon@amazon.com>,
        <linux-mm@kvack.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v20 07/15] mm/damon: Implement access pattern recording
Date:   Mon, 17 Aug 2020 12:51:29 +0200
Message-ID: <20200817105137.19296-8-sjpark@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817105137.19296-1-sjpark@amazon.com>
References: <20200817105137.19296-1-sjpark@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.43.160.192]
X-ClientProxiedBy: EX13D02UWC004.ant.amazon.com (10.43.162.236) To
 EX13D31EUA001.ant.amazon.com (10.43.165.15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: SeongJae Park <sjpark@amazon.de>

This commit implements the recording feature of DAMON.  If this feature
is enabled, DAMON writes the monitored access patterns in its binary
format into a file which specified by the user.  This is already able to
be implemented by each user using the callbacks.  However, as the
recording is expected to be widely used, this commit implements the
feature in the DAMON, for more convenience.

Signed-off-by: SeongJae Park <sjpark@amazon.de>
Reviewed-by: Leonard Foerster <foersleo@amazon.de>
---
 include/linux/damon.h |  15 +++++
 mm/damon.c            | 142 +++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 154 insertions(+), 3 deletions(-)

diff --git a/include/linux/damon.h b/include/linux/damon.h
index 945eb9259acf..54cdc1366f59 100644
--- a/include/linux/damon.h
+++ b/include/linux/damon.h
@@ -75,6 +75,14 @@ struct damon_target {
  * in case of virtual memory monitoring) and applies the changes for each
  * @regions_update_interval.  All time intervals are in micro-seconds.
  *
+ * @rbuf: In-memory buffer for monitoring result recording.
+ * @rbuf_len: The length of @rbuf.
+ * @rbuf_offset: The offset for next write to @rbuf.
+ * @rfile_path: Record file path.
+ *
+ * If @rbuf, @rbuf_len, and @rfile_path are set, the monitored results are
+ * automatically stored in @rfile_path file.
+ *
  * @kdamond:		Kernel thread who does the monitoring.
  * @kdamond_stop:	Notifies whether kdamond should stop.
  * @kdamond_lock:	Mutex for the synchronizations with @kdamond.
@@ -142,6 +150,11 @@ struct damon_ctx {
 	struct timespec64 last_aggregation;
 	struct timespec64 last_regions_update;
 
+	unsigned char *rbuf;
+	unsigned int rbuf_len;
+	unsigned int rbuf_offset;
+	char *rfile_path;
+
 	struct task_struct *kdamond;
 	bool kdamond_stop;
 	struct mutex kdamond_lock;
@@ -172,6 +185,8 @@ int damon_set_targets(struct damon_ctx *ctx,
 int damon_set_attrs(struct damon_ctx *ctx, unsigned long sample_int,
 		unsigned long aggr_int, unsigned long regions_update_int,
 		unsigned long min_nr_reg, unsigned long max_nr_reg);
+int damon_set_recording(struct damon_ctx *ctx,
+				unsigned int rbuf_len, char *rfile_path);
 int damon_start(struct damon_ctx *ctxs, int nr_ctxs);
 int damon_stop(struct damon_ctx *ctxs, int nr_ctxs);
 
diff --git a/mm/damon.c b/mm/damon.c
index cec151d60755..fed35f7b3879 100644
--- a/mm/damon.c
+++ b/mm/damon.c
@@ -57,6 +57,10 @@
 #define damon_for_each_target_safe(t, next, ctx) \
 	list_for_each_entry_safe(t, next, &(ctx)->targets_list, list)
 
+#define MIN_RECORD_BUFFER_LEN	1024
+#define MAX_RECORD_BUFFER_LEN	(4 * 1024 * 1024)
+#define MAX_RFILE_PATH_LEN	256
+
 /* Get a random number in [l, r) */
 #define damon_rand(l, r) (l + prandom_u32() % (r - l))
 
@@ -785,16 +789,89 @@ static bool kdamond_aggregate_interval_passed(struct damon_ctx *ctx)
 }
 
 /*
- * Reset the aggregated monitoring results
+ * Flush the content in the result buffer to the result file
+ */
+static void damon_flush_rbuffer(struct damon_ctx *ctx)
+{
+	ssize_t sz;
+	loff_t pos = 0;
+	struct file *rfile;
+
+	if (!ctx->rbuf_offset)
+		return;
+
+	rfile = filp_open(ctx->rfile_path,
+			O_CREAT | O_RDWR | O_APPEND | O_LARGEFILE, 0644);
+	if (IS_ERR(rfile)) {
+		pr_err("Cannot open the result file %s\n",
+				ctx->rfile_path);
+		return;
+	}
+
+	while (ctx->rbuf_offset) {
+		sz = kernel_write(rfile, ctx->rbuf, ctx->rbuf_offset, &pos);
+		if (sz < 0)
+			break;
+		ctx->rbuf_offset -= sz;
+	}
+	filp_close(rfile, NULL);
+}
+
+/*
+ * Write a data into the result buffer
+ */
+static void damon_write_rbuf(struct damon_ctx *ctx, void *data, ssize_t size)
+{
+	if (!ctx->rbuf_len || !ctx->rbuf || !ctx->rfile_path)
+		return;
+	if (ctx->rbuf_offset + size > ctx->rbuf_len)
+		damon_flush_rbuffer(ctx);
+	if (ctx->rbuf_offset + size > ctx->rbuf_len) {
+		pr_warn("%s: flush failed, or wrong size given(%u, %zu)\n",
+				__func__, ctx->rbuf_offset, size);
+		return;
+	}
+
+	memcpy(&ctx->rbuf[ctx->rbuf_offset], data, size);
+	ctx->rbuf_offset += size;
+}
+
+/*
+ * Flush the aggregated monitoring results to the result buffer
+ *
+ * Stores current tracking results to the result buffer and reset 'nr_accesses'
+ * of each region.  The format for the result buffer is as below:
+ *
+ *   <time> <number of targets> <array of target infos>
+ *
+ *   target info: <id> <number of regions> <array of region infos>
+ *   region info: <start address> <end address> <nr_accesses>
  */
 static void kdamond_reset_aggregated(struct damon_ctx *c)
 {
 	struct damon_target *t;
-	struct damon_region *r;
+	struct timespec64 now;
+	unsigned int nr;
+
+	ktime_get_coarse_ts64(&now);
+
+	damon_write_rbuf(c, &now, sizeof(now));
+	nr = nr_damon_targets(c);
+	damon_write_rbuf(c, &nr, sizeof(nr));
 
 	damon_for_each_target(t, c) {
-		damon_for_each_region(r, t)
+		struct damon_region *r;
+
+		damon_write_rbuf(c, &t->id, sizeof(t->id));
+		nr = nr_damon_regions(t);
+		damon_write_rbuf(c, &nr, sizeof(nr));
+		damon_for_each_region(r, t) {
+			damon_write_rbuf(c, &r->ar.start, sizeof(r->ar.start));
+			damon_write_rbuf(c, &r->ar.end, sizeof(r->ar.end));
+			damon_write_rbuf(c, &r->nr_accesses,
+					sizeof(r->nr_accesses));
 			r->nr_accesses = 0;
+		}
 	}
 }
 
@@ -978,6 +1055,14 @@ static bool kdamond_need_stop(struct damon_ctx *ctx)
 	return true;
 }
 
+static void kdamond_write_record_header(struct damon_ctx *ctx)
+{
+	int recfmt_ver = 2;
+
+	damon_write_rbuf(ctx, "damon_recfmt_ver", 16);
+	damon_write_rbuf(ctx, &recfmt_ver, sizeof(recfmt_ver));
+}
+
 /*
  * The monitoring daemon that runs as a kernel thread
  */
@@ -994,6 +1079,8 @@ static int kdamond_fn(void *data)
 		ctx->init_target_regions(ctx);
 	sz_limit = damon_region_sz_limit(ctx);
 
+	kdamond_write_record_header(ctx);
+
 	while (!kdamond_need_stop(ctx)) {
 		if (ctx->prepare_access_checks)
 			ctx->prepare_access_checks(ctx);
@@ -1020,6 +1107,7 @@ static int kdamond_fn(void *data)
 			sz_limit = damon_region_sz_limit(ctx);
 		}
 	}
+	damon_flush_rbuffer(ctx);
 	damon_for_each_target(t, ctx) {
 		damon_for_each_region_safe(r, next, t)
 			damon_destroy_region(r);
@@ -1189,6 +1277,54 @@ int damon_set_targets(struct damon_ctx *ctx,
 	return 0;
 }
 
+/**
+ * damon_set_recording() - Set attributes for the recording.
+ * @ctx:	target kdamond context
+ * @rbuf_len:	length of the result buffer
+ * @rfile_path:	path to the monitor result files
+ *
+ * Setting 'rbuf_len' 0 disables recording.
+ *
+ * This function should not be called while the kdamond is running.
+ *
+ * Return: 0 on success, negative error code otherwise.
+ */
+int damon_set_recording(struct damon_ctx *ctx,
+			unsigned int rbuf_len, char *rfile_path)
+{
+	size_t rfile_path_len;
+
+	if (rbuf_len && (rbuf_len > MAX_RECORD_BUFFER_LEN ||
+			rbuf_len < MIN_RECORD_BUFFER_LEN)) {
+		pr_err("result buffer size (%u) is out of [%d,%d]\n",
+				rbuf_len, MIN_RECORD_BUFFER_LEN,
+				MAX_RECORD_BUFFER_LEN);
+		return -EINVAL;
+	}
+	rfile_path_len = strnlen(rfile_path, MAX_RFILE_PATH_LEN);
+	if (rfile_path_len >= MAX_RFILE_PATH_LEN) {
+		pr_err("too long (>%d) result file path %s\n",
+				MAX_RFILE_PATH_LEN, rfile_path);
+		return -EINVAL;
+	}
+	ctx->rbuf_len = rbuf_len;
+	kfree(ctx->rbuf);
+	ctx->rbuf = NULL;
+	kfree(ctx->rfile_path);
+	ctx->rfile_path = NULL;
+
+	if (rbuf_len) {
+		ctx->rbuf = kvmalloc(rbuf_len, GFP_KERNEL);
+		if (!ctx->rbuf)
+			return -ENOMEM;
+	}
+	ctx->rfile_path = kmalloc(rfile_path_len + 1, GFP_KERNEL);
+	if (!ctx->rfile_path)
+		return -ENOMEM;
+	strncpy(ctx->rfile_path, rfile_path, rfile_path_len + 1);
+	return 0;
+}
+
 /**
  * damon_set_attrs() - Set attributes for the monitoring.
  * @ctx:		monitoring context
-- 
2.17.1

