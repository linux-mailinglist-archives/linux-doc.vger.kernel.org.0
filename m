Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4E541BA32F
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2020 14:09:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726504AbgD0MJX (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 27 Apr 2020 08:09:23 -0400
Received: from smtp-fw-2101.amazon.com ([72.21.196.25]:27659 "EHLO
        smtp-fw-2101.amazon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726260AbgD0MJW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 27 Apr 2020 08:09:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1587989361; x=1619525361;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=pClXhda7lpE1OA1RSHso3inzdXzhCTrM+3ubjycL3B4=;
  b=SekRKTLNERl09/BT+T5PmL4SuYFZjKWTkptVmuGHWs+WpgQZUg/RYhgv
   Evq03P5KoeTyJ5FQEqFqQLO/AP+BVshjMseRdNA2xq252Z9aN04/1yuP7
   CPv82zuFqqv/vkPdams7AlHKLOpgT5tTmco6Vg5F9P9RvAPxBB4wc6buS
   o=;
IronPort-SDR: OB38RxdTsMh9sFcRvRKaLHTFRY0cLXW48kwheHk96hU9UaQJu+wruxCnn/uBfNI5sywlx0LaiN
 ju9IgJYVGn0g==
X-IronPort-AV: E=Sophos;i="5.73,324,1583193600"; 
   d="scan'208";a="27716329"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO email-inbound-relay-2b-8cc5d68b.us-west-2.amazon.com) ([10.43.8.2])
  by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP; 27 Apr 2020 12:09:04 +0000
Received: from EX13MTAUEA002.ant.amazon.com (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
        by email-inbound-relay-2b-8cc5d68b.us-west-2.amazon.com (Postfix) with ESMTPS id 4EB81A0319;
        Mon, 27 Apr 2020 12:09:01 +0000 (UTC)
Received: from EX13D31EUA001.ant.amazon.com (10.43.165.15) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 27 Apr 2020 12:09:00 +0000
Received: from u886c93fd17d25d.ant.amazon.com (10.43.162.53) by
 EX13D31EUA001.ant.amazon.com (10.43.165.15) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 27 Apr 2020 12:08:44 +0000
From:   SeongJae Park <sjpark@amazon.com>
To:     <akpm@linux-foundation.org>
CC:     SeongJae Park <sjpark@amazon.de>, <Jonathan.Cameron@Huawei.com>,
        <aarcange@redhat.com>, <acme@kernel.org>,
        <alexander.shishkin@linux.intel.com>, <amit@kernel.org>,
        <benh@kernel.crashing.org>, <brendan.d.gregg@gmail.com>,
        <brendanhiggins@google.com>, <cai@lca.pw>,
        <colin.king@canonical.com>, <corbet@lwn.net>, <dwmw@amazon.com>,
        <irogers@google.com>, <jolsa@redhat.com>, <kirill@shutemov.name>,
        <mark.rutland@arm.com>, <mgorman@suse.de>, <minchan@kernel.org>,
        <mingo@redhat.com>, <namhyung@kernel.org>, <peterz@infradead.org>,
        <rdunlap@infradead.org>, <riel@surriel.com>, <rientjes@google.com>,
        <rostedt@goodmis.org>, <sblbir@amazon.com>, <shakeelb@google.com>,
        <shuah@kernel.org>, <sj38.park@gmail.com>, <snu@amazon.de>,
        <vbabka@suse.cz>, <vdavydov.dev@gmail.com>,
        <yang.shi@linux.alibaba.com>, <ying.huang@intel.com>,
        <linux-damon@amazon.com>, <linux-mm@kvack.org>,
        <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v9 09/15] mm/damon: Add debugfs interface
Date:   Mon, 27 Apr 2020 14:04:36 +0200
Message-ID: <20200427120442.24179-10-sjpark@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200427120442.24179-1-sjpark@amazon.com>
References: <20200427120442.24179-1-sjpark@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.43.162.53]
X-ClientProxiedBy: EX13D34UWC004.ant.amazon.com (10.43.162.155) To
 EX13D31EUA001.ant.amazon.com (10.43.165.15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: SeongJae Park <sjpark@amazon.de>

This commit adds a debugfs interface for DAMON.

DAMON exports four files, ``attrs``, ``pids``, ``record``, and
``monitor_on`` under its debugfs directory, ``<debugfs>/damon/``.

Attributes
----------

Users can read and write the ``sampling interval``, ``aggregation
interval``, ``regions update interval``, and min/max number of
monitoring target regions by reading from and writing to the ``attrs``
file.  For example, below commands set those values to 5 ms, 100 ms,
1,000 ms, 10, 1000 and check it again::

    # cd <debugfs>/damon
    # echo 5000 100000 1000000 10 1000 > attrs
    # cat attrs
    5000 100000 1000000 10 1000

Target PIDs
-----------

Users can read and write the pids of current monitoring target processes
by reading from and writing to the ``pids`` file.  For example, below
commands set processes having pids 42 and 4242 as the processes to be
monitored and check it again::

    # cd <debugfs>/damon
    # echo 42 4242 > pids
    # cat pids
    42 4242

Note that setting the pids doesn't start the monitoring.

Record
------

DAMON supports direct monitoring result record feature.  The recorded
results are first written to a buffer and flushed to a file in batch.
Users can set the size of the buffer and the path to the result file by
reading from and writing to the ``record`` file.  For example, below
commands set the buffer to be 4 KiB and the result to be saved in
'/damon.data'.

    # cd <debugfs>/damon
    # echo 4096 /damon.data > pids
    # cat record
    4096 /damon.data

Turning On/Off
--------------

You can check current status, start and stop the monitoring by reading
from and writing to the ``monitor_on`` file.  Writing ``on`` to the file
starts DAMON to monitor the target processes with the attributes.
Writing ``off`` to the file stops DAMON.  DAMON also stops if every
target processes is terminated.  Below example commands turn on, off,
and check status of DAMON::

    # cd <debugfs>/damon
    # echo on > monitor_on
    # echo off > monitor_on
    # cat monitor_on
    off

Please note that you cannot write to the ``attrs`` and ``pids`` files
while the monitoring is turned on.  If you write to the files while
DAMON is running, ``-EINVAL`` will be returned.

Signed-off-by: SeongJae Park <sjpark@amazon.de>
---
 mm/damon.c | 351 ++++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 350 insertions(+), 1 deletion(-)

diff --git a/mm/damon.c b/mm/damon.c
index 621217b58173..f810d0764840 100644
--- a/mm/damon.c
+++ b/mm/damon.c
@@ -10,6 +10,7 @@
 #define pr_fmt(fmt) "damon: " fmt
 
 #include <linux/damon.h>
+#include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/kthread.h>
 #include <linux/mm.h>
@@ -50,6 +51,15 @@
 /* Get a random number in [l, r) */
 #define damon_rand(l, r) (l + prandom_u32() % (r - l))
 
+/* A monitoring context for debugfs interface users. */
+static struct damon_ctx damon_user_ctx = {
+	.sample_interval = 5 * 1000,
+	.aggr_interval = 100 * 1000,
+	.regions_update_interval = 1000 * 1000,
+	.min_nr_regions = 10,
+	.max_nr_regions = 1000,
+};
+
 /*
  * Construct a damon_region struct
  *
@@ -1117,13 +1127,352 @@ int damon_set_attrs(struct damon_ctx *ctx, unsigned long sample_int,
 	return 0;
 }
 
-static int __init damon_init(void)
+static ssize_t debugfs_monitor_on_read(struct file *file,
+		char __user *buf, size_t count, loff_t *ppos)
+{
+	struct damon_ctx *ctx = &damon_user_ctx;
+	char monitor_on_buf[5];
+	bool monitor_on;
+	int len;
+
+	monitor_on = damon_kdamond_running(ctx);
+	len = snprintf(monitor_on_buf, 5, monitor_on ? "on\n" : "off\n");
+
+	return simple_read_from_buffer(buf, count, ppos, monitor_on_buf, len);
+}
+
+static ssize_t debugfs_monitor_on_write(struct file *file,
+		const char __user *buf, size_t count, loff_t *ppos)
+{
+	struct damon_ctx *ctx = &damon_user_ctx;
+	ssize_t ret;
+	char cmdbuf[5];
+	int err;
+
+	ret = simple_write_to_buffer(cmdbuf, 5, ppos, buf, count);
+	if (ret < 0)
+		return ret;
+
+	if (sscanf(cmdbuf, "%s", cmdbuf) != 1)
+		return -EINVAL;
+	if (!strncmp(cmdbuf, "on", 5))
+		err = damon_start(ctx);
+	else if (!strncmp(cmdbuf, "off", 5))
+		err = damon_stop(ctx);
+	else
+		return -EINVAL;
+
+	if (err)
+		ret = err;
+	return ret;
+}
+
+static ssize_t damon_sprint_pids(struct damon_ctx *ctx, char *buf, ssize_t len)
+{
+	struct damon_task *t;
+	int written = 0;
+	int rc;
+
+	damon_for_each_task(ctx, t) {
+		rc = snprintf(&buf[written], len - written, "%d ", t->pid);
+		if (!rc)
+			return -ENOMEM;
+		written += rc;
+	}
+	if (written)
+		written -= 1;
+	written += snprintf(&buf[written], len - written, "\n");
+	return written;
+}
+
+static ssize_t debugfs_pids_read(struct file *file,
+		char __user *buf, size_t count, loff_t *ppos)
+{
+	struct damon_ctx *ctx = &damon_user_ctx;
+	ssize_t len;
+	char pids_buf[320];
+
+	len = damon_sprint_pids(ctx, pids_buf, 320);
+	if (len < 0)
+		return len;
+
+	return simple_read_from_buffer(buf, count, ppos, pids_buf, len);
+}
+
+/*
+ * Converts a string into an array of unsigned long integers
+ *
+ * Returns an array of unsigned long integers if the conversion success, or
+ * NULL otherwise.
+ */
+static int *str_to_pids(const char *str, ssize_t len, ssize_t *nr_pids)
+{
+	int *pids;
+	const int max_nr_pids = 32;
+	int pid;
+	int pos = 0, parsed, ret;
+
+	*nr_pids = 0;
+	pids = kmalloc_array(max_nr_pids, sizeof(pid), GFP_KERNEL);
+	if (!pids)
+		return NULL;
+	while (*nr_pids < max_nr_pids && pos < len) {
+		ret = sscanf(&str[pos], "%d%n", &pid, &parsed);
+		pos += parsed;
+		if (ret != 1)
+			break;
+		pids[*nr_pids] = pid;
+		*nr_pids += 1;
+	}
+	if (*nr_pids == 0) {
+		kfree(pids);
+		pids = NULL;
+	}
+
+	return pids;
+}
+
+static ssize_t debugfs_pids_write(struct file *file,
+		const char __user *buf, size_t count, loff_t *ppos)
+{
+	struct damon_ctx *ctx = &damon_user_ctx;
+	char *kbuf;
+	int *targets;
+	ssize_t nr_targets;
+	ssize_t ret;
+	int err;
+
+	kbuf = kmalloc(count, GFP_KERNEL);
+	if (!kbuf)
+		return -ENOMEM;
+
+	ret = simple_write_to_buffer(kbuf, count, ppos, buf, count);
+	if (ret < 0)
+		goto out;
+
+	targets = str_to_pids(kbuf, ret, &nr_targets);
+	if (!targets) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	mutex_lock(&ctx->kdamond_lock);
+	if (ctx->kdamond) {
+		ret = -EINVAL;
+		goto unlock_out;
+	}
+
+	err = damon_set_pids(ctx, targets, nr_targets);
+	if (err)
+		ret = err;
+unlock_out:
+	mutex_unlock(&ctx->kdamond_lock);
+	kfree(targets);
+out:
+	kfree(kbuf);
+	return ret;
+}
+
+static ssize_t debugfs_record_read(struct file *file,
+		char __user *buf, size_t count, loff_t *ppos)
+{
+	struct damon_ctx *ctx = &damon_user_ctx;
+	char record_buf[20 + MAX_RFILE_PATH_LEN];
+	int ret;
+
+	ret = snprintf(record_buf, ARRAY_SIZE(record_buf), "%u %s\n",
+			ctx->rbuf_len, ctx->rfile_path);
+	return simple_read_from_buffer(buf, count, ppos, record_buf, ret);
+}
+
+static ssize_t debugfs_record_write(struct file *file,
+		const char __user *buf, size_t count, loff_t *ppos)
 {
+	struct damon_ctx *ctx = &damon_user_ctx;
+	char *kbuf;
+	unsigned int rbuf_len;
+	char rfile_path[MAX_RFILE_PATH_LEN];
+	ssize_t ret;
+	int err;
+
+	kbuf = kmalloc(count + 1, GFP_KERNEL);
+	if (!kbuf)
+		return -ENOMEM;
+	kbuf[count] = '\0';
+
+	ret = simple_write_to_buffer(kbuf, count, ppos, buf, count);
+	if (ret < 0)
+		goto out;
+	if (sscanf(kbuf, "%u %s",
+				&rbuf_len, rfile_path) != 2) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	mutex_lock(&ctx->kdamond_lock);
+	if (ctx->kdamond) {
+		ret = -EBUSY;
+		goto unlock_out;
+	}
+
+	err = damon_set_recording(ctx, rbuf_len, rfile_path);
+	if (err)
+		ret = err;
+unlock_out:
+	mutex_unlock(&ctx->kdamond_lock);
+out:
+	kfree(kbuf);
+	return ret;
+}
+
+
+static ssize_t debugfs_attrs_read(struct file *file,
+		char __user *buf, size_t count, loff_t *ppos)
+{
+	struct damon_ctx *ctx = &damon_user_ctx;
+	char kbuf[128];
+	int ret;
+
+	ret = snprintf(kbuf, ARRAY_SIZE(kbuf), "%lu %lu %lu %lu %lu\n",
+			ctx->sample_interval, ctx->aggr_interval,
+			ctx->regions_update_interval, ctx->min_nr_regions,
+			ctx->max_nr_regions);
+
+	return simple_read_from_buffer(buf, count, ppos, kbuf, ret);
+}
+
+static ssize_t debugfs_attrs_write(struct file *file,
+		const char __user *buf, size_t count, loff_t *ppos)
+{
+	struct damon_ctx *ctx = &damon_user_ctx;
+	unsigned long s, a, r, minr, maxr;
+	char *kbuf;
+	ssize_t ret;
+	int err;
+
+	kbuf = kmalloc(count, GFP_KERNEL);
+	if (!kbuf)
+		return -ENOMEM;
+
+	ret = simple_write_to_buffer(kbuf, count, ppos, buf, count);
+	if (ret < 0)
+		goto out;
+
+	if (sscanf(kbuf, "%lu %lu %lu %lu %lu",
+				&s, &a, &r, &minr, &maxr) != 5) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	mutex_lock(&ctx->kdamond_lock);
+	if (ctx->kdamond) {
+		ret = -EBUSY;
+		goto unlock_out;
+	}
+
+	err = damon_set_attrs(ctx, s, a, r, minr, maxr);
+	if (err)
+		ret = err;
+unlock_out:
+	mutex_unlock(&ctx->kdamond_lock);
+out:
+	kfree(kbuf);
+	return ret;
+}
+
+static const struct file_operations monitor_on_fops = {
+	.owner = THIS_MODULE,
+	.read = debugfs_monitor_on_read,
+	.write = debugfs_monitor_on_write,
+};
+
+static const struct file_operations pids_fops = {
+	.owner = THIS_MODULE,
+	.read = debugfs_pids_read,
+	.write = debugfs_pids_write,
+};
+
+static const struct file_operations record_fops = {
+	.owner = THIS_MODULE,
+	.read = debugfs_record_read,
+	.write = debugfs_record_write,
+};
+
+static const struct file_operations attrs_fops = {
+	.owner = THIS_MODULE,
+	.read = debugfs_attrs_read,
+	.write = debugfs_attrs_write,
+};
+
+static struct dentry *debugfs_root;
+
+static int __init damon_debugfs_init(void)
+{
+	const char * const file_names[] = {"attrs", "record",
+		"pids", "monitor_on"};
+	const struct file_operations *fops[] = {&attrs_fops, &record_fops,
+		&pids_fops, &monitor_on_fops};
+	int i;
+
+	debugfs_root = debugfs_create_dir("damon", NULL);
+	if (!debugfs_root) {
+		pr_err("failed to create the debugfs dir\n");
+		return -ENOMEM;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(file_names); i++) {
+		if (!debugfs_create_file(file_names[i], 0600, debugfs_root,
+					NULL, fops[i])) {
+			pr_err("failed to create %s file\n", file_names[i]);
+			return -ENOMEM;
+		}
+	}
+
 	return 0;
 }
 
+static int __init damon_init_user_ctx(void)
+{
+	int rc;
+
+	struct damon_ctx *ctx = &damon_user_ctx;
+
+	ktime_get_coarse_ts64(&ctx->last_aggregation);
+	ctx->last_regions_update = ctx->last_aggregation;
+
+	rc = damon_set_recording(ctx, 1024 * 1024, "/damon.data");
+	if (rc)
+		return rc;
+
+	mutex_init(&ctx->kdamond_lock);
+
+	INIT_LIST_HEAD(&ctx->tasks_list);
+
+	return 0;
+}
+
+static int __init damon_init(void)
+{
+	int rc;
+
+	rc = damon_init_user_ctx();
+	if (rc)
+		return rc;
+
+	rc = damon_debugfs_init();
+	if (rc)
+		pr_err("%s: debugfs init failed\n", __func__);
+
+	return rc;
+}
+
 static void __exit damon_exit(void)
 {
+	damon_stop(&damon_user_ctx);
+	debugfs_remove_recursive(debugfs_root);
+
+	kfree(damon_user_ctx.rbuf);
+	kfree(damon_user_ctx.rfile_path);
 }
 
 module_init(damon_init);
-- 
2.17.1

