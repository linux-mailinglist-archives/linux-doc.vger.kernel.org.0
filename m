Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 475CE3A9401
	for <lists+linux-doc@lfdr.de>; Wed, 16 Jun 2021 09:32:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232038AbhFPHeA (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 16 Jun 2021 03:34:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231811AbhFPHdz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 16 Jun 2021 03:33:55 -0400
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76B55C0617A8;
        Wed, 16 Jun 2021 00:31:47 -0700 (PDT)
Received: by mail-qk1-x736.google.com with SMTP id g19so1668207qkk.2;
        Wed, 16 Jun 2021 00:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=r44pafoMp2CGCJH2yVLzig/GjPR/XnA4/rGQdx9dTPI=;
        b=KnNtll9694uO0swXqW3cC3eLfugpNTYSdyzVrkP6+/G/KLdnaOKZPgzWa50xRV06k4
         HLFko043pCLckQOVKV8ZwJqXx5QAJ1STh3RXqZBFshebdj7PC+teYDr5NIJtRn+VF66R
         sFNoOU/XoO1WVD7M9/6EJvI6ZOWB9nJ1nGU2BOibadNn4cGrT+QpF2z9LSoueSnVN0oI
         lU2QbqmTimE7GHgokIs9A6oWQj0MbMp0n/Y48+xNoOpK1yNfK8PzqsxjvCr6TK8X1lsm
         BNfxaZfxazLzgNRhCcQD7b4iBGM34SbNtCW/YdTdIbpzax+3L9z1yYNwI2qAeq8tRdjy
         FYBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=r44pafoMp2CGCJH2yVLzig/GjPR/XnA4/rGQdx9dTPI=;
        b=EtsCwFoyor32uGYQ6KCHSwesfXW2N3GGzbBbp3l4drk9EMg4i2L3ArztC2M4pmYCj2
         tKgS/SInIyGvScNnWuXTBbcm9UqnJQVKfaka1wCeHPo4x/4rbff5lzRdH0LDEw5Jnu41
         b/hgYPnEaL4ZyFqK4BAkfubMs9SO3a4CsARB3szzb57jea/ZLR9aYPqjo3Fubd4slSgh
         Y3ge54dD/OjCPDhHxks711YGT0k1FQwoozBPJ03LztXH8p8W6MwQHYwGJxhOpby9ZXjM
         RZJw14yJ2JFwfWA4KwVk+U07Pwqb39A5QnWZLl7G6MXnvEwaYCW321n2j18wwPqdGTey
         IvzQ==
X-Gm-Message-State: AOAM532KFbw5lU6vQaPuC87DPtPMfCSBCZ3er1UuOcTDDz0Zqs2+IEeI
        fm9k3kSg5YHk1yRMK+sJnZ8=
X-Google-Smtp-Source: ABdhPJzEsAIuRiwyzechz9TGJtOwNlTh9b42YeYQwKRcEp4H207rictSaLlo2BUsCma3MNv+g/biwQ==
X-Received: by 2002:a05:620a:ecf:: with SMTP id x15mr3765643qkm.275.1623828706595;
        Wed, 16 Jun 2021 00:31:46 -0700 (PDT)
Received: from localhost.localdomain (ec2-35-169-212-159.compute-1.amazonaws.com. [35.169.212.159])
        by smtp.gmail.com with ESMTPSA id h5sm1080697qkg.122.2021.06.16.00.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 00:31:46 -0700 (PDT)
From:   SeongJae Park <sj38.park@gmail.com>
To:     akpm@linux-foundation.org
Cc:     SeongJae Park <sjpark@amazon.de>, Jonathan.Cameron@Huawei.com,
        acme@kernel.org, alexander.shishkin@linux.intel.com,
        amit@kernel.org, benh@kernel.crashing.org,
        brendanhiggins@google.com, corbet@lwn.net, david@redhat.com,
        dwmw@amazon.com, elver@google.com, fan.du@intel.com,
        foersleo@amazon.de, greg@kroah.com, gthelen@google.com,
        guoju.fgj@alibaba-inc.com, jgowans@amazon.com, mgorman@suse.de,
        mheyne@amazon.de, minchan@kernel.org, mingo@redhat.com,
        namhyung@kernel.org, peterz@infradead.org, riel@surriel.com,
        rientjes@google.com, rostedt@goodmis.org, rppt@kernel.org,
        shakeelb@google.com, shuah@kernel.org, sieberf@amazon.com,
        sj38.park@gmail.com, snu@zelle79.org, vbabka@suse.cz,
        vdavydov.dev@gmail.com, zgf574564920@gmail.com,
        linux-damon@amazon.com, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v30 07/13] mm/damon: Implement a debugfs-based user space interface
Date:   Wed, 16 Jun 2021 07:31:13 +0000
Message-Id: <20210616073119.16758-8-sj38.park@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210616073119.16758-1-sj38.park@gmail.com>
References: <20210616073119.16758-1-sj38.park@gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: SeongJae Park <sjpark@amazon.de>

DAMON is designed to be used by kernel space code such as the memory
management subsystems, and therefore it provides only kernel space API.
That said, letting the user space control DAMON could provide some
benefits to them.  For example, it will allow user space to analyze
their specific workloads and make their own special optimizations.

For such cases, this commit implements a simple DAMON application kernel
module, namely 'damon-dbgfs', which merely wraps the DAMON api and
exports those to the user space via the debugfs.

'damon-dbgfs' exports three files, ``attrs``, ``target_ids``, and
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

Target IDs
----------

Some types of address spaces supports multiple monitoring target.  For
example, the virtual memory address spaces monitoring can have multiple
processes as the monitoring targets.  Users can set the targets by
writing relevant id values of the targets to, and get the ids of the
current targets by reading from the ``target_ids`` file.  In case of the
virtual address spaces monitoring, the values should be pids of the
monitoring target processes.  For example, below commands set processes
having pids 42 and 4242 as the monitoring targets and check it again::

    # cd <debugfs>/damon
    # echo 42 4242 > target_ids
    # cat target_ids
    42 4242

Note that setting the target ids doesn't start the monitoring.

Turning On/Off
--------------

Setting the files as described above doesn't incur effect unless you
explicitly start the monitoring.  You can start, stop, and check the
current status of the monitoring by writing to and reading from the
``monitor_on`` file.  Writing ``on`` to the file starts the monitoring
of the targets with the attributes.  Writing ``off`` to the file stops
those.  DAMON also stops if every targets are invalidated (in case of
the virtual memory monitoring, target processes are invalidated when
terminated).  Below example commands turn on, off, and check the status
of DAMON::

    # cd <debugfs>/damon
    # echo on > monitor_on
    # echo off > monitor_on
    # cat monitor_on
    off

Please note that you cannot write to the above-mentioned debugfs files
while the monitoring is turned on.  If you write to the files while
DAMON is running, an error code such as ``-EBUSY`` will be returned.

Signed-off-by: SeongJae Park <sjpark@amazon.de>
Reviewed-by: Leonard Foerster <foersleo@amazon.de>
Reviewed-by: Fernand Sieber <sieberf@amazon.com>
---
 include/linux/damon.h |   3 +
 mm/damon/Kconfig      |   9 +
 mm/damon/Makefile     |   1 +
 mm/damon/core.c       |  47 +++++
 mm/damon/dbgfs.c      | 386 ++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 446 insertions(+)
 create mode 100644 mm/damon/dbgfs.c

diff --git a/include/linux/damon.h b/include/linux/damon.h
index 72cf5ebd35fe..b17e808a9cae 100644
--- a/include/linux/damon.h
+++ b/include/linux/damon.h
@@ -237,9 +237,12 @@ unsigned int damon_nr_regions(struct damon_target *t);
 
 struct damon_ctx *damon_new_ctx(void);
 void damon_destroy_ctx(struct damon_ctx *ctx);
+int damon_set_targets(struct damon_ctx *ctx,
+		unsigned long *ids, ssize_t nr_ids);
 int damon_set_attrs(struct damon_ctx *ctx, unsigned long sample_int,
 		unsigned long aggr_int, unsigned long primitive_upd_int,
 		unsigned long min_nr_reg, unsigned long max_nr_reg);
+int damon_nr_running_ctxs(void);
 
 int damon_start(struct damon_ctx **ctxs, int nr_ctxs);
 int damon_stop(struct damon_ctx **ctxs, int nr_ctxs);
diff --git a/mm/damon/Kconfig b/mm/damon/Kconfig
index 8ae080c52950..72f1683ba0ee 100644
--- a/mm/damon/Kconfig
+++ b/mm/damon/Kconfig
@@ -21,4 +21,13 @@ config DAMON_VADDR
 	  This builds the default data access monitoring primitives for DAMON
 	  that works for virtual address spaces.
 
+config DAMON_DBGFS
+	bool "DAMON debugfs interface"
+	depends on DAMON_VADDR && DEBUG_FS
+	help
+	  This builds the debugfs interface for DAMON.  The user space admins
+	  can use the interface for arbitrary data access monitoring.
+
+	  If unsure, say N.
+
 endmenu
diff --git a/mm/damon/Makefile b/mm/damon/Makefile
index 6ebbd08aed67..fed4be3bace3 100644
--- a/mm/damon/Makefile
+++ b/mm/damon/Makefile
@@ -2,3 +2,4 @@
 
 obj-$(CONFIG_DAMON)		:= core.o
 obj-$(CONFIG_DAMON_VADDR)	+= vaddr.o
+obj-$(CONFIG_DAMON_DBGFS)	+= dbgfs.o
diff --git a/mm/damon/core.c b/mm/damon/core.c
index 912112662d0c..cad2b4cee39d 100644
--- a/mm/damon/core.c
+++ b/mm/damon/core.c
@@ -172,6 +172,39 @@ void damon_destroy_ctx(struct damon_ctx *ctx)
 	kfree(ctx);
 }
 
+/**
+ * damon_set_targets() - Set monitoring targets.
+ * @ctx:	monitoring context
+ * @ids:	array of target ids
+ * @nr_ids:	number of entries in @ids
+ *
+ * This function should not be called while the kdamond is running.
+ *
+ * Return: 0 on success, negative error code otherwise.
+ */
+int damon_set_targets(struct damon_ctx *ctx,
+		      unsigned long *ids, ssize_t nr_ids)
+{
+	ssize_t i;
+	struct damon_target *t, *next;
+
+	damon_destroy_targets(ctx);
+
+	for (i = 0; i < nr_ids; i++) {
+		t = damon_new_target(ids[i]);
+		if (!t) {
+			pr_err("Failed to alloc damon_target\n");
+			/* The caller should do cleanup of the ids itself */
+			damon_for_each_target_safe(t, next, ctx)
+				damon_destroy_target(t);
+			return -ENOMEM;
+		}
+		damon_add_target(ctx, t);
+	}
+
+	return 0;
+}
+
 /**
  * damon_set_attrs() - Set attributes for the monitoring.
  * @ctx:		monitoring context
@@ -210,6 +243,20 @@ int damon_set_attrs(struct damon_ctx *ctx, unsigned long sample_int,
 	return 0;
 }
 
+/**
+ * damon_nr_running_ctxs() - Return number of currently running contexts.
+ */
+int damon_nr_running_ctxs(void)
+{
+	int nr_ctxs;
+
+	mutex_lock(&damon_lock);
+	nr_ctxs = nr_running_ctxs;
+	mutex_unlock(&damon_lock);
+
+	return nr_ctxs;
+}
+
 /* Returns the size upper limit for each monitoring region */
 static unsigned long damon_region_sz_limit(struct damon_ctx *ctx)
 {
diff --git a/mm/damon/dbgfs.c b/mm/damon/dbgfs.c
new file mode 100644
index 000000000000..c4a4a6f1dc79
--- /dev/null
+++ b/mm/damon/dbgfs.c
@@ -0,0 +1,386 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * DAMON Debugfs Interface
+ *
+ * Author: SeongJae Park <sjpark@amazon.de>
+ */
+
+#define pr_fmt(fmt) "damon-dbgfs: " fmt
+
+#include <linux/damon.h>
+#include <linux/debugfs.h>
+#include <linux/file.h>
+#include <linux/mm.h>
+#include <linux/module.h>
+#include <linux/page_idle.h>
+#include <linux/slab.h>
+
+static struct damon_ctx **dbgfs_ctxs;
+static int dbgfs_nr_ctxs;
+static struct dentry **dbgfs_dirs;
+
+/*
+ * Returns non-empty string on success, negative error code otherwise.
+ */
+static char *user_input_str(const char __user *buf, size_t count, loff_t *ppos)
+{
+	char *kbuf;
+	ssize_t ret;
+
+	/* We do not accept continuous write */
+	if (*ppos)
+		return ERR_PTR(-EINVAL);
+
+	kbuf = kmalloc(count + 1, GFP_KERNEL);
+	if (!kbuf)
+		return ERR_PTR(-ENOMEM);
+
+	ret = simple_write_to_buffer(kbuf, count + 1, ppos, buf, count);
+	if (ret != count) {
+		kfree(kbuf);
+		return ERR_PTR(-EIO);
+	}
+	kbuf[ret] = '\0';
+
+	return kbuf;
+}
+
+static ssize_t dbgfs_attrs_read(struct file *file,
+		char __user *buf, size_t count, loff_t *ppos)
+{
+	struct damon_ctx *ctx = file->private_data;
+	char kbuf[128];
+	int ret;
+
+	mutex_lock(&ctx->kdamond_lock);
+	ret = scnprintf(kbuf, ARRAY_SIZE(kbuf), "%lu %lu %lu %lu %lu\n",
+			ctx->sample_interval, ctx->aggr_interval,
+			ctx->primitive_update_interval, ctx->min_nr_regions,
+			ctx->max_nr_regions);
+	mutex_unlock(&ctx->kdamond_lock);
+
+	return simple_read_from_buffer(buf, count, ppos, kbuf, ret);
+}
+
+static ssize_t dbgfs_attrs_write(struct file *file,
+		const char __user *buf, size_t count, loff_t *ppos)
+{
+	struct damon_ctx *ctx = file->private_data;
+	unsigned long s, a, r, minr, maxr;
+	char *kbuf;
+	ssize_t ret = count;
+	int err;
+
+	kbuf = user_input_str(buf, count, ppos);
+	if (IS_ERR(kbuf))
+		return PTR_ERR(kbuf);
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
+#define targetid_is_pid(ctx)	\
+	(ctx->primitive.target_valid == damon_va_target_valid)
+
+static ssize_t sprint_target_ids(struct damon_ctx *ctx, char *buf, ssize_t len)
+{
+	struct damon_target *t;
+	unsigned long id;
+	int written = 0;
+	int rc;
+
+	damon_for_each_target(t, ctx) {
+		id = t->id;
+		if (targetid_is_pid(ctx))
+			/* Show pid numbers to debugfs users */
+			id = (unsigned long)pid_vnr((struct pid *)id);
+
+		rc = scnprintf(&buf[written], len - written, "%lu ", id);
+		if (!rc)
+			return -ENOMEM;
+		written += rc;
+	}
+	if (written)
+		written -= 1;
+	written += scnprintf(&buf[written], len - written, "\n");
+	return written;
+}
+
+static ssize_t dbgfs_target_ids_read(struct file *file,
+		char __user *buf, size_t count, loff_t *ppos)
+{
+	struct damon_ctx *ctx = file->private_data;
+	ssize_t len;
+	char ids_buf[320];
+
+	mutex_lock(&ctx->kdamond_lock);
+	len = sprint_target_ids(ctx, ids_buf, 320);
+	mutex_unlock(&ctx->kdamond_lock);
+	if (len < 0)
+		return len;
+
+	return simple_read_from_buffer(buf, count, ppos, ids_buf, len);
+}
+
+/*
+ * Converts a string into an array of unsigned long integers
+ *
+ * Returns an array of unsigned long integers if the conversion success, or
+ * NULL otherwise.
+ */
+static unsigned long *str_to_target_ids(const char *str, ssize_t len,
+					ssize_t *nr_ids)
+{
+	unsigned long *ids;
+	const int max_nr_ids = 32;
+	unsigned long id;
+	int pos = 0, parsed, ret;
+
+	*nr_ids = 0;
+	ids = kmalloc_array(max_nr_ids, sizeof(id), GFP_KERNEL);
+	if (!ids)
+		return NULL;
+	while (*nr_ids < max_nr_ids && pos < len) {
+		ret = sscanf(&str[pos], "%lu%n", &id, &parsed);
+		pos += parsed;
+		if (ret != 1)
+			break;
+		ids[*nr_ids] = id;
+		*nr_ids += 1;
+	}
+
+	return ids;
+}
+
+static void dbgfs_put_pids(unsigned long *ids, int nr_ids)
+{
+	int i;
+
+	for (i = 0; i < nr_ids; i++)
+		put_pid((struct pid *)ids[i]);
+}
+
+static ssize_t dbgfs_target_ids_write(struct file *file,
+		const char __user *buf, size_t count, loff_t *ppos)
+{
+	struct damon_ctx *ctx = file->private_data;
+	char *kbuf, *nrs;
+	unsigned long *targets;
+	ssize_t nr_targets;
+	ssize_t ret = count;
+	int i;
+	int err;
+
+	kbuf = user_input_str(buf, count, ppos);
+	if (IS_ERR(kbuf))
+		return PTR_ERR(kbuf);
+
+	nrs = kbuf;
+
+	targets = str_to_target_ids(nrs, ret, &nr_targets);
+	if (!targets) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	if (targetid_is_pid(ctx)) {
+		for (i = 0; i < nr_targets; i++) {
+			targets[i] = (unsigned long)find_get_pid(
+					(int)targets[i]);
+			if (!targets[i]) {
+				dbgfs_put_pids(targets, i);
+				ret = -EINVAL;
+				goto free_targets_out;
+			}
+		}
+	}
+
+	mutex_lock(&ctx->kdamond_lock);
+	if (ctx->kdamond) {
+		if (targetid_is_pid(ctx))
+			dbgfs_put_pids(targets, nr_targets);
+		ret = -EBUSY;
+		goto unlock_out;
+	}
+
+	err = damon_set_targets(ctx, targets, nr_targets);
+	if (err) {
+		if (targetid_is_pid(ctx))
+			dbgfs_put_pids(targets, nr_targets);
+		ret = err;
+	}
+
+unlock_out:
+	mutex_unlock(&ctx->kdamond_lock);
+free_targets_out:
+	kfree(targets);
+out:
+	kfree(kbuf);
+	return ret;
+}
+
+static int damon_dbgfs_open(struct inode *inode, struct file *file)
+{
+	file->private_data = inode->i_private;
+
+	return nonseekable_open(inode, file);
+}
+
+static const struct file_operations attrs_fops = {
+	.owner = THIS_MODULE,
+	.open = damon_dbgfs_open,
+	.read = dbgfs_attrs_read,
+	.write = dbgfs_attrs_write,
+};
+
+static const struct file_operations target_ids_fops = {
+	.owner = THIS_MODULE,
+	.open = damon_dbgfs_open,
+	.read = dbgfs_target_ids_read,
+	.write = dbgfs_target_ids_write,
+};
+
+static void dbgfs_fill_ctx_dir(struct dentry *dir, struct damon_ctx *ctx)
+{
+	const char * const file_names[] = {"attrs", "target_ids"};
+	const struct file_operations *fops[] = {&attrs_fops, &target_ids_fops};
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(file_names); i++)
+		debugfs_create_file(file_names[i], 0600, dir, ctx, fops[i]);
+}
+
+static struct damon_ctx *dbgfs_new_ctx(void)
+{
+	struct damon_ctx *ctx;
+
+	ctx = damon_new_ctx();
+	if (!ctx)
+		return NULL;
+
+	damon_va_set_primitives(ctx);
+	return ctx;
+}
+
+static ssize_t dbgfs_monitor_on_read(struct file *file,
+		char __user *buf, size_t count, loff_t *ppos)
+{
+	char monitor_on_buf[5];
+	bool monitor_on = damon_nr_running_ctxs() != 0;
+	int len;
+
+	len = scnprintf(monitor_on_buf, 5, monitor_on ? "on\n" : "off\n");
+
+	return simple_read_from_buffer(buf, count, ppos, monitor_on_buf, len);
+}
+
+static ssize_t dbgfs_monitor_on_write(struct file *file,
+		const char __user *buf, size_t count, loff_t *ppos)
+{
+	ssize_t ret = count;
+	char *kbuf;
+	int err;
+
+	kbuf = user_input_str(buf, count, ppos);
+	if (IS_ERR(kbuf))
+		return PTR_ERR(kbuf);
+
+	/* Remove white space */
+	if (sscanf(kbuf, "%s", kbuf) != 1) {
+		kfree(kbuf);
+		return -EINVAL;
+	}
+
+	if (!strncmp(kbuf, "on", count))
+		err = damon_start(dbgfs_ctxs, dbgfs_nr_ctxs);
+	else if (!strncmp(kbuf, "off", count))
+		err = damon_stop(dbgfs_ctxs, dbgfs_nr_ctxs);
+	else
+		err = -EINVAL;
+
+	if (err)
+		ret = err;
+	kfree(kbuf);
+	return ret;
+}
+
+static const struct file_operations monitor_on_fops = {
+	.owner = THIS_MODULE,
+	.read = dbgfs_monitor_on_read,
+	.write = dbgfs_monitor_on_write,
+};
+
+static int __init __damon_dbgfs_init(void)
+{
+	struct dentry *dbgfs_root;
+	const char * const file_names[] = {"monitor_on"};
+	const struct file_operations *fops[] = {&monitor_on_fops};
+	int i;
+
+	dbgfs_root = debugfs_create_dir("damon", NULL);
+
+	for (i = 0; i < ARRAY_SIZE(file_names); i++)
+		debugfs_create_file(file_names[i], 0600, dbgfs_root, NULL,
+				fops[i]);
+	dbgfs_fill_ctx_dir(dbgfs_root, dbgfs_ctxs[0]);
+
+	dbgfs_dirs = kmalloc_array(1, sizeof(dbgfs_root), GFP_KERNEL);
+	if (!dbgfs_dirs) {
+		debugfs_remove(dbgfs_root);
+		return -ENOMEM;
+	}
+	dbgfs_dirs[0] = dbgfs_root;
+
+	return 0;
+}
+
+/*
+ * Functions for the initialization
+ */
+
+static int __init damon_dbgfs_init(void)
+{
+	int rc;
+
+	dbgfs_ctxs = kmalloc(sizeof(*dbgfs_ctxs), GFP_KERNEL);
+	if (!dbgfs_ctxs) {
+		pr_err("%s: dbgfs ctxs alloc failed\n", __func__);
+		return -ENOMEM;
+	}
+	dbgfs_ctxs[0] = dbgfs_new_ctx();
+	if (!dbgfs_ctxs[0]) {
+		kfree(dbgfs_ctxs);
+		pr_err("%s: dbgfs ctx alloc failed\n", __func__);
+		return -ENOMEM;
+	}
+	dbgfs_nr_ctxs = 1;
+
+	rc = __damon_dbgfs_init();
+	if (rc) {
+		kfree(dbgfs_ctxs[0]);
+		kfree(dbgfs_ctxs);
+		pr_err("%s: dbgfs init failed\n", __func__);
+	}
+
+	return rc;
+}
+
+module_init(damon_dbgfs_init);
-- 
2.17.1

