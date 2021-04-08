Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90651358530
	for <lists+linux-doc@lfdr.de>; Thu,  8 Apr 2021 15:49:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231802AbhDHNtt (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 8 Apr 2021 09:49:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231795AbhDHNti (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 8 Apr 2021 09:49:38 -0400
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2737C0613DA;
        Thu,  8 Apr 2021 06:49:25 -0700 (PDT)
Received: by mail-qt1-x836.google.com with SMTP id c6so1422103qtc.1;
        Thu, 08 Apr 2021 06:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=dsfUiNEtUfgASDGDNGVkgQgo9ssjMF6aUvvvoPabB6I=;
        b=pNwd5y5lu37bj5Be+5mulhAmZ1VSddSiMq2ZmCZbcb+XCLkSLM+h4FOQERy8Bl8auU
         uRF7V+W4wFtM5T8Pg7ciCa9MTW8kdgJubnoDofIEqJ2k2gF90VPgOXN8c5PvkH7rwHRc
         T7v/XT4Zi1zWcOL1R5w5/K3e+iwd7IY/1S3E/W4CuNuwfSFS1p1rLRHAdynBGIy6/nV6
         YtvfZlHKUWlSAYLYNVZMDcZQ+xkrBOfVdWtwJMaBHkMK8PtangkrTSYABkj1Cd8cykDL
         sIH1R62/257PVGtSbx809oR7KCnrPq2WLnD0X9ZmDTaq66fGkbd66vMl+yQsqWmNqh/M
         jjSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=dsfUiNEtUfgASDGDNGVkgQgo9ssjMF6aUvvvoPabB6I=;
        b=gZzf5cTtkKsDjIknn/XXx4HVPpFzjH476Vb0Y3mbgOa/9x4TeqnzIDi31sxHKxfCBm
         qC7Si+hpriXeO9SgUMRZ/+V7A+hcx6MuGnKZlo41op9rnJiY3C6TTq0DjRSqP0ftHGFk
         zcd4B9hlhmvg6KgESZHxBeGXV/qJdJeMbcmlleGLRvhjWgGUtW2vGyOH66Y9bTNUO84U
         Odys0o9HUI5cbhmrPKuikcXcR9qOJ3lofeFlQTkpx0f2dFgByWRtfM/bOJdFvTDicysL
         0PKi2EaLWE1IOecgTlnrQIdudt7SQ8BpyEklp1KYF8BcPwTgR6QxC+gqmkS3A2yDpRmy
         i4rA==
X-Gm-Message-State: AOAM531f1hf8Sz86EktuhLE5sjUwdbhC8I/ZmHZpbW2PVi9ha55zXQ8P
        QOlnZpYXmKUL4/fuSsH2ooI=
X-Google-Smtp-Source: ABdhPJzA1A5Bl8ERELYqgtsMPy9JZI3enWfd58esumlsiguBmQn88nnNz32jVrczXIBL/jgNjwMgJA==
X-Received: by 2002:ac8:6f0b:: with SMTP id g11mr7540132qtv.12.1617889764938;
        Thu, 08 Apr 2021 06:49:24 -0700 (PDT)
Received: from localhost.localdomain (ec2-35-169-212-159.compute-1.amazonaws.com. [35.169.212.159])
        by smtp.gmail.com with ESMTPSA id h16sm506094qkh.18.2021.04.08.06.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 06:49:24 -0700 (PDT)
From:   SeongJae Park <sj38.park@gmail.com>
To:     akpm@linux-foundation.org
Cc:     SeongJae Park <sjpark@amazon.de>, Jonathan.Cameron@Huawei.com,
        acme@kernel.org, alexander.shishkin@linux.intel.com,
        amit@kernel.org, benh@kernel.crashing.org,
        brendanhiggins@google.com, corbet@lwn.net, david@redhat.com,
        dwmw@amazon.com, elver@google.com, fan.du@intel.com,
        foersleo@amazon.de, greg@kroah.com, gthelen@google.com,
        guoju.fgj@alibaba-inc.com, mgorman@suse.de, minchan@kernel.org,
        mingo@redhat.com, namhyung@kernel.org, peterz@infradead.org,
        riel@surriel.com, rientjes@google.com, rostedt@goodmis.org,
        rppt@kernel.org, shakeelb@google.com, shuah@kernel.org,
        sj38.park@gmail.com, snu@amazon.de, vbabka@suse.cz,
        vdavydov.dev@gmail.com, zgf574564920@gmail.com,
        linux-damon@amazon.com, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v27 08/13] mm/damon/dbgfs: Export kdamond pid to the user space
Date:   Thu,  8 Apr 2021 13:48:49 +0000
Message-Id: <20210408134854.31625-9-sj38.park@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210408134854.31625-1-sj38.park@gmail.com>
References: <20210408134854.31625-1-sj38.park@gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: SeongJae Park <sjpark@amazon.de>

For CPU usage accounting, knowing pid of the monitoring thread could be
helpful.  For example, users could use cpuaccount cgroups with the pid.

This commit therefore exports the pid of currently running monitoring
thread to the user space via 'kdamond_pid' file in the debugfs
directory.

Signed-off-by: SeongJae Park <sjpark@amazon.de>
---
 mm/damon/dbgfs.c | 38 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/mm/damon/dbgfs.c b/mm/damon/dbgfs.c
index 9af844faffd4..b20c1e7742ce 100644
--- a/mm/damon/dbgfs.c
+++ b/mm/damon/dbgfs.c
@@ -237,6 +237,32 @@ static ssize_t dbgfs_target_ids_write(struct file *file,
 	return ret;
 }
 
+static ssize_t dbgfs_kdamond_pid_read(struct file *file,
+		char __user *buf, size_t count, loff_t *ppos)
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
+	if (ctx->kdamond)
+		len = scnprintf(kbuf, count, "%d\n", ctx->kdamond->pid);
+	else
+		len = scnprintf(kbuf, count, "none\n");
+	mutex_unlock(&ctx->kdamond_lock);
+	if (!len)
+		goto out;
+	len = simple_read_from_buffer(buf, count, ppos, kbuf, len);
+
+out:
+	kfree(kbuf);
+	return len;
+}
+
 static int damon_dbgfs_open(struct inode *inode, struct file *file)
 {
 	file->private_data = inode->i_private;
@@ -258,10 +284,18 @@ static const struct file_operations target_ids_fops = {
 	.write = dbgfs_target_ids_write,
 };
 
+static const struct file_operations kdamond_pid_fops = {
+	.owner = THIS_MODULE,
+	.open = damon_dbgfs_open,
+	.read = dbgfs_kdamond_pid_read,
+};
+
 static int dbgfs_fill_ctx_dir(struct dentry *dir, struct damon_ctx *ctx)
 {
-	const char * const file_names[] = {"attrs", "target_ids"};
-	const struct file_operations *fops[] = {&attrs_fops, &target_ids_fops};
+	const char * const file_names[] = {"attrs", "target_ids",
+		"kdamond_pid"};
+	const struct file_operations *fops[] = {&attrs_fops, &target_ids_fops,
+		&kdamond_pid_fops};
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(file_names); i++)
-- 
2.17.1

