Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07BFE23BC0C
	for <lists+linux-doc@lfdr.de>; Tue,  4 Aug 2020 16:26:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728794AbgHDO00 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 4 Aug 2020 10:26:26 -0400
Received: from smtp-fw-4101.amazon.com ([72.21.198.25]:3886 "EHLO
        smtp-fw-4101.amazon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729125AbgHDO0L (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 4 Aug 2020 10:26:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1596551169; x=1628087169;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=w/dElk34eSRGm8oboxKmrsE7ynyuF8ZsouOb6Mao4uk=;
  b=NK3YZMpG/brqy4yDFL3aDlNTxPjsM3AGtPPbAFkHqexCnXkqZf4XD8KA
   0pHECZ0FZFHQRiMYhjFiTArKqqg0NSiiwRar2y9J2ZHjyJvFeiGKLPzYb
   TydFwytlm749ZbkkBTQ+8Jf5aKsutV0WMRppeRbR38lVd/y9J9igNdpAC
   I=;
IronPort-SDR: UicNHCMVZVdWSqr5ILmo6MyYe1RtJdTJ8s6et3k26W4vUc+xkP+UDNDo/AugRRr4E4DLNSSyWQ
 h98I3eBetyjg==
X-IronPort-AV: E=Sophos;i="5.75,434,1589241600"; 
   d="scan'208";a="46072356"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO email-inbound-relay-2c-168cbb73.us-west-2.amazon.com) ([10.43.8.6])
  by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP; 04 Aug 2020 14:26:04 +0000
Received: from EX13MTAUEA002.ant.amazon.com (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
        by email-inbound-relay-2c-168cbb73.us-west-2.amazon.com (Postfix) with ESMTPS id 20ADAA2209;
        Tue,  4 Aug 2020 14:26:02 +0000 (UTC)
Received: from EX13D31EUA001.ant.amazon.com (10.43.165.15) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 4 Aug 2020 14:26:01 +0000
Received: from u886c93fd17d25d.ant.amazon.com (10.43.161.203) by
 EX13D31EUA001.ant.amazon.com (10.43.165.15) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 4 Aug 2020 14:25:45 +0000
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
        <linux-damon@amazon.com>, <linux-mm@kvack.org>,
        <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC v14 3/7] mm/damon/schemes: Implement a debugfs interface
Date:   Tue, 4 Aug 2020 16:24:26 +0200
Message-ID: <20200804142430.15384-4-sjpark@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200804142430.15384-1-sjpark@amazon.com>
References: <20200804142430.15384-1-sjpark@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.43.161.203]
X-ClientProxiedBy: EX13D17UWC004.ant.amazon.com (10.43.162.195) To
 EX13D31EUA001.ant.amazon.com (10.43.165.15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: SeongJae Park <sjpark@amazon.de>

This commit implements a debugfs interface for the data access
monitoring oriented memory management schemes.  It is supposed to be
used by administrators and/or privileged user space programs.  Users can
read and update the rules using ``<debugfs>/damon/schemes`` file.  The
format is::

    <min/max size> <min/max access frequency> <min/max age> <action>

Signed-off-by: SeongJae Park <sjpark@amazon.de>
---
 mm/damon.c | 187 ++++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 185 insertions(+), 2 deletions(-)

diff --git a/mm/damon.c b/mm/damon.c
index e402717a2c0e..d6b4181c5d70 100644
--- a/mm/damon.c
+++ b/mm/damon.c
@@ -194,6 +194,29 @@ static void damon_destroy_target(struct damon_target *t)
 	damon_free_target(t);
 }
 
+static struct damos *damon_new_scheme(
+		unsigned long min_sz_region, unsigned long max_sz_region,
+		unsigned int min_nr_accesses, unsigned int max_nr_accesses,
+		unsigned int min_age_region, unsigned int max_age_region,
+		enum damos_action action)
+{
+	struct damos *scheme;
+
+	scheme = kmalloc(sizeof(*scheme), GFP_KERNEL);
+	if (!scheme)
+		return NULL;
+	scheme->min_sz_region = min_sz_region;
+	scheme->max_sz_region = max_sz_region;
+	scheme->min_nr_accesses = min_nr_accesses;
+	scheme->max_nr_accesses = max_nr_accesses;
+	scheme->min_age_region = min_age_region;
+	scheme->max_age_region = max_age_region;
+	scheme->action = action;
+	INIT_LIST_HEAD(&scheme->list);
+
+	return scheme;
+}
+
 static void damon_add_scheme(struct damon_ctx *ctx, struct damos *s)
 {
 	list_add_tail(&s->list, &ctx->schemes_list);
@@ -1540,6 +1563,160 @@ static ssize_t debugfs_monitor_on_write(struct file *file,
 	return ret;
 }
 
+static ssize_t sprint_schemes(struct damon_ctx *c, char *buf, ssize_t len)
+{
+	struct damos *s;
+	int written = 0;
+	int rc;
+
+	damon_for_each_scheme(s, c) {
+		rc = snprintf(&buf[written], len - written,
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
+static ssize_t debugfs_schemes_read(struct file *file, char __user *buf,
+		size_t count, loff_t *ppos)
+{
+	struct damon_ctx *ctx = &damon_user_ctx;
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
+	case DAMOS_STAT:
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
+static ssize_t debugfs_schemes_write(struct file *file, const char __user *buf,
+		size_t count, loff_t *ppos)
+{
+	struct damon_ctx *ctx = &damon_user_ctx;
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
 	(ctx->target_valid == kdamond_vm_target_valid)
 
@@ -1808,6 +1985,12 @@ static const struct file_operations target_ids_fops = {
 	.write = debugfs_target_ids_write,
 };
 
+static const struct file_operations schemes_fops = {
+	.owner = THIS_MODULE,
+	.read = debugfs_schemes_read,
+	.write = debugfs_schemes_write,
+};
+
 static const struct file_operations record_fops = {
 	.owner = THIS_MODULE,
 	.read = debugfs_record_read,
@@ -1824,10 +2007,10 @@ static struct dentry *debugfs_root;
 
 static int __init damon_debugfs_init(void)
 {
-	const char * const file_names[] = {"attrs", "record",
+	const char * const file_names[] = {"attrs", "record", "schemes",
 		"target_ids", "monitor_on"};
 	const struct file_operations *fops[] = {&attrs_fops, &record_fops,
-		&target_ids_fops, &monitor_on_fops};
+		&schemes_fops, &target_ids_fops, &monitor_on_fops};
 	int i;
 
 	debugfs_root = debugfs_create_dir("damon", NULL);
-- 
2.17.1

