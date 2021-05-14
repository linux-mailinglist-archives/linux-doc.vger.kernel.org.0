Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBDD8381212
	for <lists+linux-doc@lfdr.de>; Fri, 14 May 2021 22:52:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232297AbhENUxU (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 14 May 2021 16:53:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45877 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231614AbhENUxS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 14 May 2021 16:53:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1621025526;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=sF8dRlNIQCEusEjjgo7vMe+xZ31mX4hk0pzL4HeXzns=;
        b=bkpth4/VGIhjjs4COw0Rryg5DyHKYLCelsfYSPOuls/FL9zpgU4aD1DKtuJZfDu32yhr63
        5ZFbVOde1CfKskaqE2AyezgqZ99T0XsSuP8GUfzdCuKEMDkSh135KDM+9/VEWBewjV0bVm
        GVg/wBMuo0iOL7yKD+Bqa3vK5GR3gvU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-AgsDE_ayMWWkQ7GgdjxHOQ-1; Fri, 14 May 2021 16:52:04 -0400
X-MC-Unique: AgsDE_ayMWWkQ7GgdjxHOQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E3A81007476;
        Fri, 14 May 2021 20:52:03 +0000 (UTC)
Received: from x1.bristot.me.homenet.telecomitalia.it (ovpn-113-210.rdu2.redhat.com [10.10.113.210])
        by smtp.corp.redhat.com (Postfix) with ESMTP id A54A217A63;
        Fri, 14 May 2021 20:51:59 +0000 (UTC)
From:   Daniel Bristot de Oliveira <bristot@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     Phil Auld <pauld@redhat.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Kate Carcia <kcarcia@redhat.com>,
        Daniel Bristot de Oliveira <bristot@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Alexandre Chartre <alexandre.chartre@oracle.com>,
        Clark Willaims <williams@redhat.com>,
        John Kacur <jkacur@redhat.com>,
        Juri Lelli <juri.lelli@redhat.com>, linux-doc@vger.kernel.org
Subject: [PATCH V3 5/9] tracing/trace: Add a generic function to read/write u64 values from tracefs
Date:   Fri, 14 May 2021 22:51:14 +0200
Message-Id: <c585e3316f49c9e33acc79452588fc26ce11dfa4.1621024265.git.bristot@redhat.com>
In-Reply-To: <cover.1621024265.git.bristot@redhat.com>
References: <cover.1621024265.git.bristot@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Provides a generic read and write implementation to save/read u64 values
from a file on tracefs. The trace_ull_config structure defines where to
read/write the value, the min and the max acceptable values, and a lock
to protect the write.

Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Alexandre Chartre <alexandre.chartre@oracle.com>
Cc: Clark Willaims <williams@redhat.com>
Cc: John Kacur <jkacur@redhat.com>
Cc: Juri Lelli <juri.lelli@redhat.com>
Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Daniel Bristot de Oliveira <bristot@redhat.com>
---
 kernel/trace/trace.c | 87 ++++++++++++++++++++++++++++++++++++++++++++
 kernel/trace/trace.h | 19 ++++++++++
 2 files changed, 106 insertions(+)

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index 560e4c8d3825..b4cd89010813 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -7516,6 +7516,93 @@ static const struct file_operations snapshot_raw_fops = {
 
 #endif /* CONFIG_TRACER_SNAPSHOT */
 
+/*
+ * trace_ull_config_write - Generic write function to save u64 value
+ * @filp: The active open file structure
+ * @ubuf: The userspace provided buffer to read value into
+ * @cnt: The maximum number of bytes to read
+ * @ppos: The current "file" position
+ *
+ * This function provides a generic write implementation to save u64 values
+ * from a file on tracefs. The filp->private_data must point to a
+ * trace_ull_config structure that defines where to write the value, the
+ * min and the max acceptable values, and a lock to protect the write.
+ */
+static ssize_t
+trace_ull_config_write(struct file *filp, const char __user *ubuf, size_t cnt,
+		       loff_t *ppos)
+{
+	struct trace_ull_config *config = filp->private_data;
+	u64 val;
+	int err;
+
+	if (!config)
+		return -EFAULT;
+
+	err = kstrtoull_from_user(ubuf, cnt, 10, &val);
+	if (err)
+		return err;
+
+	if (config->lock)
+		mutex_lock(config->lock);
+
+	if (config->min && val < *config->min)
+		err = -EINVAL;
+
+	if (config->max && val > *config->max)
+		err = -EINVAL;
+
+	if (!err)
+		*config->val = val;
+
+	if (config->lock)
+		mutex_unlock(config->lock);
+
+	if (err)
+		return err;
+
+	return cnt;
+}
+
+/*
+ * trace_ull_config_read - Generic write function to read u64 value via tracefs
+ * @filp: The active open file structure
+ * @ubuf: The userspace provided buffer to read value into
+ * @cnt: The maximum number of bytes to read
+ * @ppos: The current "file" position
+ *
+ * This function provides a generic read implementation to read a u64 value
+ * from a file on tracefs. The filp->private_data must point to a
+ * trace_ull_config structure with valid data.
+ */
+static ssize_t
+trace_ull_config_read(struct file *filp, char __user *ubuf, size_t cnt,
+		      loff_t *ppos)
+{
+	struct trace_ull_config *config = filp->private_data;
+	char buf[ULL_STR_SIZE];
+	u64 val;
+        int len;
+
+        if (!config)
+                return -EFAULT;
+
+	val = *config->val;
+
+        if (cnt > sizeof(buf))
+                cnt = sizeof(buf);
+
+        len = snprintf(buf, sizeof(buf), "%llu\n", val);
+
+        return simple_read_from_buffer(ubuf, cnt, ppos, buf, len);
+}
+
+const struct file_operations trace_ull_config_fops = {
+	.open		= tracing_open_generic,
+	.read		= trace_ull_config_read,
+	.write		= trace_ull_config_write,
+};
+
 #define TRACING_LOG_ERRS_MAX	8
 #define TRACING_LOG_LOC_MAX	128
 
diff --git a/kernel/trace/trace.h b/kernel/trace/trace.h
index cd80d046c7a5..44fa25c1264a 100644
--- a/kernel/trace/trace.h
+++ b/kernel/trace/trace.h
@@ -1952,4 +1952,23 @@ static inline bool is_good_name(const char *name)
 	return true;
 }
 
+/*
+ * This is a generic way to read and write a u64 config value from a file
+ * in tracefs.
+ *
+ * The value is stored on the variable pointed by *val. The value needs
+ * to be at least *min and at most *max. The write is protected by an
+ * existing *lock.
+ */
+struct trace_ull_config {
+	struct mutex *lock;
+	u64 *val;
+	u64 *min;
+	u64 *max;
+};
+
+#define ULL_STR_SIZE		22	/* 20 digits max */
+
+extern const struct file_operations trace_ull_config_fops;
+
 #endif /* _LINUX_KERNEL_TRACE_H */
-- 
2.26.3

