Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9BCF2DBCEB
	for <lists+linux-doc@lfdr.de>; Wed, 16 Dec 2020 09:48:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726149AbgLPIqx (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 16 Dec 2020 03:46:53 -0500
Received: from smtp-fw-33001.amazon.com ([207.171.190.10]:31409 "EHLO
        smtp-fw-33001.amazon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726147AbgLPIqw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 16 Dec 2020 03:46:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1608108412; x=1639644412;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=AbHpAGQAnrRMIFfbdBebCNKso7ZqXpgX9fMoeo77wAo=;
  b=E04yCT8ljNhli2KiPoHi0MaprTrudwjLYNM9uaqQjHDkkL8RZqj6Lv58
   pXx2xhuGWlNYYogjhraSGsqEZCmVqxar6rH7b+/JRB4sGCY21g4ctMvD/
   mbYFZx8IAvz+jC24IYf3BqITq5GBl0IhacSVwenUH8d31fZ/OPqepD5+N
   M=;
X-IronPort-AV: E=Sophos;i="5.78,424,1599523200"; 
   d="scan'208";a="103481045"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO email-inbound-relay-1d-e69428c4.us-east-1.amazon.com) ([10.47.23.38])
  by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP; 16 Dec 2020 08:46:02 +0000
Received: from EX13D31EUA001.ant.amazon.com (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
        by email-inbound-relay-1d-e69428c4.us-east-1.amazon.com (Postfix) with ESMTPS id 4F3A0C1E2C;
        Wed, 16 Dec 2020 08:45:50 +0000 (UTC)
Received: from u3f2cd687b01c55.ant.amazon.com (10.43.161.102) by
 EX13D31EUA001.ant.amazon.com (10.43.165.15) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Wed, 16 Dec 2020 08:45:34 +0000
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
Subject: [RFC v15.1 4/8] mm/damon/dbgfs: Support DAMON-based Operation Schemes
Date:   Wed, 16 Dec 2020 09:44:00 +0100
Message-ID: <20201216084404.23183-5-sjpark@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201216084404.23183-1-sjpark@amazon.com>
References: <20201216084404.23183-1-sjpark@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.43.161.102]
X-ClientProxiedBy: EX13D22UWB003.ant.amazon.com (10.43.161.76) To
 EX13D31EUA001.ant.amazon.com (10.43.165.15)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: SeongJae Park <sjpark@amazon.de>

This commit makes 'damon-dbgfs' to support the data access monitoring
oriented memory management schemes.  Users can read and update the
schemes using ``<debugfs>/damon/schemes`` file.  The format is::

    <min/max size> <min/max access frequency> <min/max age> <action>

Signed-off-by: SeongJae Park <sjpark@amazon.de>
---
 mm/damon/dbgfs.c | 169 +++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 165 insertions(+), 4 deletions(-)

diff --git a/mm/damon/dbgfs.c b/mm/damon/dbgfs.c
index 7380c6502f3d..10ce8e8786cb 100644
--- a/mm/damon/dbgfs.c
+++ b/mm/damon/dbgfs.c
@@ -219,6 +219,159 @@ static ssize_t dbgfs_record_write(struct file *file,
 	return ret;
 }
 
+static ssize_t sprint_schemes(struct damon_ctx *c, char *buf, ssize_t len)
+{
+	struct damos *s;
+	int written = 0;
+	int rc;
+
+	damon_for_each_scheme(s, c) {
+		rc = scnprintf(&buf[written], len - written,
+				"%lu %lu %u %u %u %u %d\n",
+				s->min_sz_region, s->max_sz_region,
+				s->min_nr_accesses, s->max_nr_accesses,
+				s->min_age_region, s->max_age_region,
+				s->action);
+		if (!rc)
+			return -ENOMEM;
+
+		written += rc;
+	}
+	return written;
+}
+
+static ssize_t dbgfs_schemes_read(struct file *file, char __user *buf,
+		size_t count, loff_t *ppos)
+{
+	struct damon_ctx *ctx = file->private_data;
+	char *kbuf;
+	ssize_t len;
+
+	kbuf = kmalloc(count, GFP_KERNEL);
+	if (!kbuf)
+		return -ENOMEM;
+
+	mutex_lock(&ctx->kdamond_lock);
+	len = sprint_schemes(ctx, kbuf, count);
+	mutex_unlock(&ctx->kdamond_lock);
+	if (len < 0)
+		goto out;
+	len = simple_read_from_buffer(buf, count, ppos, kbuf, len);
+
+out:
+	kfree(kbuf);
+	return len;
+}
+
+static void free_schemes_arr(struct damos **schemes, ssize_t nr_schemes)
+{
+	ssize_t i;
+
+	for (i = 0; i < nr_schemes; i++)
+		kfree(schemes[i]);
+	kfree(schemes);
+}
+
+static bool damos_action_valid(int action)
+{
+	switch (action) {
+	case DAMOS_WILLNEED:
+	case DAMOS_COLD:
+	case DAMOS_PAGEOUT:
+	case DAMOS_HUGEPAGE:
+	case DAMOS_NOHUGEPAGE:
+		return true;
+	default:
+		return false;
+	}
+}
+
+/*
+ * Converts a string into an array of struct damos pointers
+ *
+ * Returns an array of struct damos pointers that converted if the conversion
+ * success, or NULL otherwise.
+ */
+static struct damos **str_to_schemes(const char *str, ssize_t len,
+				ssize_t *nr_schemes)
+{
+	struct damos *scheme, **schemes;
+	const int max_nr_schemes = 256;
+	int pos = 0, parsed, ret;
+	unsigned long min_sz, max_sz;
+	unsigned int min_nr_a, max_nr_a, min_age, max_age;
+	unsigned int action;
+
+	schemes = kmalloc_array(max_nr_schemes, sizeof(scheme),
+			GFP_KERNEL);
+	if (!schemes)
+		return NULL;
+
+	*nr_schemes = 0;
+	while (pos < len && *nr_schemes < max_nr_schemes) {
+		ret = sscanf(&str[pos], "%lu %lu %u %u %u %u %u%n",
+				&min_sz, &max_sz, &min_nr_a, &max_nr_a,
+				&min_age, &max_age, &action, &parsed);
+		if (ret != 7)
+			break;
+		if (!damos_action_valid(action)) {
+			pr_err("wrong action %d\n", action);
+			goto fail;
+		}
+
+		pos += parsed;
+		scheme = damon_new_scheme(min_sz, max_sz, min_nr_a, max_nr_a,
+				min_age, max_age, action);
+		if (!scheme)
+			goto fail;
+
+		schemes[*nr_schemes] = scheme;
+		*nr_schemes += 1;
+	}
+	return schemes;
+fail:
+	free_schemes_arr(schemes, *nr_schemes);
+	return NULL;
+}
+
+static ssize_t dbgfs_schemes_write(struct file *file, const char __user *buf,
+		size_t count, loff_t *ppos)
+{
+	struct damon_ctx *ctx = file->private_data;
+	char *kbuf;
+	struct damos **schemes;
+	ssize_t nr_schemes = 0, ret = count;
+	int err;
+
+	kbuf = user_input_str(buf, count, ppos);
+	if (IS_ERR(kbuf))
+		return PTR_ERR(kbuf);
+
+	schemes = str_to_schemes(kbuf, ret, &nr_schemes);
+	if (!schemes) {
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
+	err = damon_set_schemes(ctx, schemes, nr_schemes);
+	if (err)
+		ret = err;
+	else
+		nr_schemes = 0;
+unlock_out:
+	mutex_unlock(&ctx->kdamond_lock);
+	free_schemes_arr(schemes, nr_schemes);
+out:
+	kfree(kbuf);
+	return ret;
+}
+
 #define targetid_is_pid(ctx)	\
 	(ctx->primitive.target_valid == damon_va_target_valid)
 
@@ -385,6 +538,13 @@ static const struct file_operations record_fops = {
 	.write = dbgfs_record_write,
 };
 
+static const struct file_operations schemes_fops = {
+	.owner = THIS_MODULE,
+	.open = damon_dbgfs_open,
+	.read = dbgfs_schemes_read,
+	.write = dbgfs_schemes_write,
+};
+
 static const struct file_operations target_ids_fops = {
 	.owner = THIS_MODULE,
 	.open = damon_dbgfs_open,
@@ -400,10 +560,11 @@ static const struct file_operations kdamond_pid_fops = {
 
 static int dbgfs_fill_ctx_dir(struct dentry *dir, struct damon_ctx *ctx)
 {
-	const char * const file_names[] = {"attrs", "record", "target_ids",
-		"kdamond_pid"};
-	const struct file_operations *fops[] = {&attrs_fops, &record_fops,
-		&target_ids_fops, &kdamond_pid_fops};
+	const char * const file_names[] = {"attrs", "record", "schemes",
+		"target_ids", "kdamond_pid"};
+	const struct file_operations *fops[] = {&attrs_fops,
+		&record_fops, &schemes_fops, &target_ids_fops,
+		&kdamond_pid_fops};
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(file_names); i++) {
-- 
2.17.1

