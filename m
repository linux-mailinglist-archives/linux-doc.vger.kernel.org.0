Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22D5742670E
	for <lists+linux-doc@lfdr.de>; Fri,  8 Oct 2021 11:45:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229869AbhJHJrK (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 8 Oct 2021 05:47:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:46602 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229918AbhJHJrK (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 8 Oct 2021 05:47:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CFD1860F93;
        Fri,  8 Oct 2021 09:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633686315;
        bh=72IOpelzvD4VWWoJ/OdoEENNH7zEZGX25e8klEHpHkA=;
        h=From:To:Cc:Subject:Date:From;
        b=PGdPJSdFhWF4+uM7u00Kigj0dmwFw5JK0CtteTgn/eYvKghVdKPoFQTOX1xotjpIf
         tF1GfON0pDaY/frS/rtEGBZJV1z5KUaGN76MGY7bvYMnB6FDjqYnrPR/KfiDpIqnWw
         aZEXOJT0UpDMz7hHSB7Oy9HBEiCKgDxiCWxfGKCqZ6p+YLSuPGjQNCSWkW5f/ECvMA
         ArFlgGe3DFXH573ABRQzzoBxo8hmiL0o/3+jehA45nAYPNuWovsCxZ1dVq0z7A751Q
         wG3VioFW2C/lPIipgDHhjJwkh4C4944XTRvuCpC+y3J+BflBpdC7XnyDQrlDPR9ehq
         2mpy+Mx9YAb6g==
From:   SeongJae Park <sj@kernel.org>
To:     akpm@linux-foundation.org
Cc:     SeongJae Park <sj@kernel.org>, Jonathan.Cameron@Huawei.com,
        amit@kernel.org, benh@kernel.crashing.org, corbet@lwn.net,
        david@redhat.com, dwmw@amazon.com, elver@google.com,
        foersleo@amazon.de, gthelen@google.com, markubo@amazon.de,
        rientjes@google.com, shakeelb@google.com, shuah@kernel.org,
        linux-damon@amazon.com, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] mm/damon/dbgfs: Implement recording feature
Date:   Fri,  8 Oct 2021 09:45:06 +0000
Message-Id: <20211008094509.16179-1-sj@kernel.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The user space can get the monitoring results via the 'damon_aggregated'
tracepoint event.  For simplicity and brevity, the tracepoint events
have some duplicated information such as 'target_id' and 'nr_regions',
though.  As a result, its size is greater than really needed.  Also,
dealing with the tracepoint could be complex for some simple use cases.
To provide a way for getting more efficient and simple monitoring
results to user space, this commit implements 'recording' feature in
'damon-dbgfs'.

The feature is exported to the user space via a new debugfs file named
'record', which is located in '<debugfs>/damon/' directory.  The file
allows users to record monitored access patterns in a regular binary
file in a simple format.  The recorded results are first written in an
in-memory buffer and flushed to a file in batch.  Users can get and set
the size of the buffer and the path to the result file by reading from
and writing to the 'record' file.  For example, below commands set the
buffer to be 4 KiB and the result to be saved in '/damon.data'.

    # cd <debugfs>/damon
    # echo "4096 /damon.data" > record
    # cat record
    4096 /damon.data

The recording can be disabled by setting the buffer size zero.

Evaluation
----------

With a simple test workload[1], recording the tracepoint event using
'perf-record' results in 1.7 MiB 'perf.data' file.  When the access
pattern is recorded via this feature, the size is reduced to 264 KiB.
Also, the resulting record file is simple enough to be manipulated by a
small (100 lines of code) python script which will be introduced by a
following commit ("selftests/damon: Test recording feature").

[1] https://github.com/sjp38/masim/blob/master/configs/zigzag.cfg

Signed-off-by: SeongJae Park <sj@kernel.org>
---
 mm/damon/dbgfs.c | 267 ++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 263 insertions(+), 4 deletions(-)

diff --git a/mm/damon/dbgfs.c b/mm/damon/dbgfs.c
index 28d6abf27763..45584f54c2b5 100644
--- a/mm/damon/dbgfs.c
+++ b/mm/damon/dbgfs.c
@@ -15,6 +15,17 @@
 #include <linux/page_idle.h>
 #include <linux/slab.h>
 
+#define MIN_RECORD_BUFFER_LEN	1024
+#define MAX_RECORD_BUFFER_LEN	(4 * 1024 * 1024)
+#define MAX_RFILE_PATH_LEN	256
+
+struct dbgfs_recorder {
+	unsigned char *rbuf;
+	unsigned int rbuf_len;
+	unsigned int rbuf_offset;
+	char *rfile_path;
+};
+
 static struct damon_ctx **dbgfs_ctxs;
 static int dbgfs_nr_ctxs;
 static struct dentry **dbgfs_dirs;
@@ -98,6 +109,116 @@ static ssize_t dbgfs_attrs_write(struct file *file,
 	return ret;
 }
 
+static ssize_t dbgfs_record_read(struct file *file,
+		char __user *buf, size_t count, loff_t *ppos)
+{
+	struct damon_ctx *ctx = file->private_data;
+	struct dbgfs_recorder *rec = ctx->callback.private;
+	char record_buf[20 + MAX_RFILE_PATH_LEN];
+	int ret;
+
+	mutex_lock(&ctx->kdamond_lock);
+	ret = scnprintf(record_buf, ARRAY_SIZE(record_buf), "%u %s\n",
+			rec->rbuf_len, rec->rfile_path);
+	mutex_unlock(&ctx->kdamond_lock);
+	return simple_read_from_buffer(buf, count, ppos, record_buf, ret);
+}
+
+/*
+ * dbgfs_set_recording() - Set attributes for the recording.
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
+static int dbgfs_set_recording(struct damon_ctx *ctx,
+			unsigned int rbuf_len, char *rfile_path)
+{
+	struct dbgfs_recorder *recorder;
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
+
+	recorder = ctx->callback.private;
+	if (!recorder) {
+		recorder = kzalloc(sizeof(*recorder), GFP_KERNEL);
+		if (!recorder)
+			return -ENOMEM;
+		ctx->callback.private = recorder;
+	}
+
+	recorder->rbuf_len = rbuf_len;
+	kfree(recorder->rbuf);
+	recorder->rbuf = NULL;
+	kfree(recorder->rfile_path);
+	recorder->rfile_path = NULL;
+
+	if (rbuf_len) {
+		recorder->rbuf = kvmalloc(rbuf_len, GFP_KERNEL);
+		if (!recorder->rbuf)
+			return -ENOMEM;
+	}
+	recorder->rfile_path = kmalloc(rfile_path_len + 1, GFP_KERNEL);
+	if (!recorder->rfile_path)
+		return -ENOMEM;
+	strncpy(recorder->rfile_path, rfile_path, rfile_path_len + 1);
+
+	return 0;
+}
+
+static ssize_t dbgfs_record_write(struct file *file,
+		const char __user *buf, size_t count, loff_t *ppos)
+{
+	struct damon_ctx *ctx = file->private_data;
+	char *kbuf;
+	unsigned int rbuf_len;
+	char rfile_path[MAX_RFILE_PATH_LEN];
+	ssize_t ret = count;
+	int err;
+
+	kbuf = user_input_str(buf, count, ppos);
+	if (IS_ERR(kbuf))
+		return PTR_ERR(kbuf);
+
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
+	err = dbgfs_set_recording(ctx, rbuf_len, rfile_path);
+	if (err)
+		ret = err;
+unlock_out:
+	mutex_unlock(&ctx->kdamond_lock);
+out:
+	kfree(kbuf);
+	return ret;
+}
+
 static ssize_t sprint_schemes(struct damon_ctx *c, char *buf, ssize_t len)
 {
 	struct damos *s;
@@ -433,6 +554,12 @@ static const struct file_operations attrs_fops = {
 	.write = dbgfs_attrs_write,
 };
 
+static const struct file_operations record_fops = {
+	.open = damon_dbgfs_open,
+	.read = dbgfs_record_read,
+	.write = dbgfs_record_write,
+};
+
 static const struct file_operations schemes_fops = {
 	.open = damon_dbgfs_open,
 	.read = dbgfs_schemes_read,
@@ -452,20 +579,144 @@ static const struct file_operations kdamond_pid_fops = {
 
 static void dbgfs_fill_ctx_dir(struct dentry *dir, struct damon_ctx *ctx)
 {
-	const char * const file_names[] = {"attrs", "schemes", "target_ids",
-		"kdamond_pid"};
-	const struct file_operations *fops[] = {&attrs_fops, &schemes_fops,
-		&target_ids_fops, &kdamond_pid_fops};
+	const char * const file_names[] = {"attrs", "record", "schemes",
+		"target_ids", "kdamond_pid"};
+	const struct file_operations *fops[] = {&attrs_fops,
+		&record_fops, &schemes_fops, &target_ids_fops,
+		&kdamond_pid_fops};
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(file_names); i++)
 		debugfs_create_file(file_names[i], 0600, dir, ctx, fops[i]);
 }
 
+/*
+ * Flush the content in the result buffer to the result file
+ */
+static void dbgfs_flush_rbuffer(struct dbgfs_recorder *rec)
+{
+	ssize_t sz;
+	loff_t pos = 0;
+	struct file *rfile;
+
+	if (!rec->rbuf_offset)
+		return;
+
+	rfile = filp_open(rec->rfile_path,
+			O_CREAT | O_RDWR | O_APPEND | O_LARGEFILE, 0600);
+	if (IS_ERR(rfile)) {
+		pr_err("Cannot open the result file %s\n",
+				rec->rfile_path);
+		return;
+	}
+
+	while (rec->rbuf_offset) {
+		sz = kernel_write(rfile, rec->rbuf, rec->rbuf_offset, &pos);
+		if (sz < 0)
+			break;
+		rec->rbuf_offset -= sz;
+	}
+	filp_close(rfile, NULL);
+}
+
+/*
+ * Write a data into the result buffer
+ */
+static void dbgfs_write_rbuf(struct damon_ctx *ctx, void *data, ssize_t size)
+{
+	struct dbgfs_recorder *rec = ctx->callback.private;
+
+	if (!rec->rbuf_len || !rec->rbuf || !rec->rfile_path)
+		return;
+	if (rec->rbuf_offset + size > rec->rbuf_len)
+		dbgfs_flush_rbuffer(ctx->callback.private);
+	if (rec->rbuf_offset + size > rec->rbuf_len) {
+		pr_warn("%s: flush failed, or wrong size given(%u, %zu)\n",
+				__func__, rec->rbuf_offset, size);
+		return;
+	}
+
+	memcpy(&rec->rbuf[rec->rbuf_offset], data, size);
+	rec->rbuf_offset += size;
+}
+
+static void dbgfs_write_record_header(struct damon_ctx *ctx)
+{
+	int recfmt_ver = 2;
+
+	dbgfs_write_rbuf(ctx, "damon_recfmt_ver", 16);
+	dbgfs_write_rbuf(ctx, &recfmt_ver, sizeof(recfmt_ver));
+}
+
+static void dbgfs_free_recorder(struct dbgfs_recorder *recorder)
+{
+	kfree(recorder->rbuf);
+	kfree(recorder->rfile_path);
+	kfree(recorder);
+}
+
+static unsigned int nr_damon_targets(struct damon_ctx *ctx)
+{
+	struct damon_target *t;
+	unsigned int nr_targets = 0;
+
+	damon_for_each_target(t, ctx)
+		nr_targets++;
+
+	return nr_targets;
+}
+
+static int dbgfs_before_start(struct damon_ctx *ctx)
+{
+	dbgfs_write_record_header(ctx);
+	return 0;
+}
+
+/*
+ * Store the aggregated monitoring results to the result buffer
+ *
+ * The format for the result buffer is as below:
+ *
+ *   <time> <number of targets> <array of target infos>
+ *
+ *   target info: <id> <number of regions> <array of region infos>
+ *   region info: <start address> <end address> <nr_accesses>
+ */
+static int dbgfs_after_aggregation(struct damon_ctx *c)
+{
+	struct damon_target *t;
+	struct timespec64 now;
+	unsigned int nr;
+
+	ktime_get_coarse_ts64(&now);
+
+	dbgfs_write_rbuf(c, &now, sizeof(now));
+	nr = nr_damon_targets(c);
+	dbgfs_write_rbuf(c, &nr, sizeof(nr));
+
+	damon_for_each_target(t, c) {
+		struct damon_region *r;
+
+		dbgfs_write_rbuf(c, &t->id, sizeof(t->id));
+		nr = damon_nr_regions(t);
+		dbgfs_write_rbuf(c, &nr, sizeof(nr));
+		damon_for_each_region(r, t) {
+			dbgfs_write_rbuf(c, &r->ar.start, sizeof(r->ar.start));
+			dbgfs_write_rbuf(c, &r->ar.end, sizeof(r->ar.end));
+			dbgfs_write_rbuf(c, &r->nr_accesses,
+					sizeof(r->nr_accesses));
+		}
+	}
+
+	return 0;
+}
+
 static int dbgfs_before_terminate(struct damon_ctx *ctx)
 {
 	struct damon_target *t, *next;
 
+	dbgfs_flush_rbuffer(ctx->callback.private);
+
 	if (!targetid_is_pid(ctx))
 		return 0;
 
@@ -484,13 +735,21 @@ static struct damon_ctx *dbgfs_new_ctx(void)
 	if (!ctx)
 		return NULL;
 
+	if (dbgfs_set_recording(ctx, 0, "none")) {
+		damon_destroy_ctx(ctx);
+		return NULL;
+	}
+
 	damon_va_set_primitives(ctx);
+	ctx->callback.before_start = dbgfs_before_start;
+	ctx->callback.after_aggregation = dbgfs_after_aggregation;
 	ctx->callback.before_terminate = dbgfs_before_terminate;
 	return ctx;
 }
 
 static void dbgfs_destroy_ctx(struct damon_ctx *ctx)
 {
+	dbgfs_free_recorder(ctx->callback.private);
 	damon_destroy_ctx(ctx);
 }
 
-- 
2.17.1

