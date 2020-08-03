Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D8D323A8CE
	for <lists+linux-doc@lfdr.de>; Mon,  3 Aug 2020 16:50:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728024AbgHCOuV (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 3 Aug 2020 10:50:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727995AbgHCOrt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 3 Aug 2020 10:47:49 -0400
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com [IPv6:2607:f8b0:4864:20::74a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E60B5C061756
        for <linux-doc@vger.kernel.org>; Mon,  3 Aug 2020 07:47:48 -0700 (PDT)
Received: by mail-qk1-x74a.google.com with SMTP id x20so26319797qki.20
        for <linux-doc@vger.kernel.org>; Mon, 03 Aug 2020 07:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=yEtE51ZkZ89myWk79FRCGMzR6DiPPNgcqkWBItHzQ6s=;
        b=t1rTR3609fZavoZD6hGkSsSWDr9nI1/YkdhLNf0ojphXhpqrjYtn2QmhC+W/gkvimg
         AMTj6PP4Rr26vC5qnxMVLP8ZXj2mvSyHcLtN7NTD3GvFDmmeReFr0s4F/UMZqW82I1g+
         Dr2Z/WzdPu1RdbA1YmGLFdz8BghYnww1NBBlSY+6I9r3aq9SpAN2yEXku55avULjgjeR
         wbdd0+d7Js097V3esnE9Zp3yRqLvLrD/D5lAoObteLNHtFqv+wIpvThQwIPjxSfSQHJA
         7Nvv9QfJik4hcZHlF/286VGx9pliyj8hQuAw0OzqKiZAgbFEPs15yA8D9Br8GJTj/mTJ
         PaOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=yEtE51ZkZ89myWk79FRCGMzR6DiPPNgcqkWBItHzQ6s=;
        b=ulEb9d3cn+oAPYt6dMjoJf8iRvae/PQEbLVmGyVtUj0nhbbK4Wh6HGO67ZZvEoBsRi
         EAJfQv0NVASWtKF8RVtwkAy6mh9gF0RUWS302/mwmLiVzk2dNt/ZxkA8ia8vC7sWKaUN
         urzMd9pxSMCuTW7pzwGXz0miUnp75f4mSuef56ymMpZ8qVeOB19gMi4N44e3+f9SIHkf
         vNvOWchCijl5wqrD8otCp3WsKmOcx4MLAVvUo9uDKXP92+v5Dh6JvkxFiCwV99JyfjJU
         2L+7Nn9jCv6AM/F4b9BEn0Isk1f8373jLws7ByetHSABJ5zybL+a1n+q6c+VVdt5okQB
         m6EQ==
X-Gm-Message-State: AOAM532B0bsle3ZKEsajulp5nZhP5lF7tD3Mm96DJNmZXJ6TvlhMmGsJ
        h5YEvgvWqvpZERegKRpTSO/9H1oBCeE+uW7cCA==
X-Google-Smtp-Source: ABdhPJw9FuulIu0ymOE9kGuQtwFH4SdlEeYnPFzJ+4tzAm9Tdqz+V6p7Q/zMMMduM+pHUwYFb/16WTJ/nRJFAJbl1A==
X-Received: by 2002:a0c:c3d0:: with SMTP id p16mr17210039qvi.54.1596466068074;
 Mon, 03 Aug 2020 07:47:48 -0700 (PDT)
Date:   Mon,  3 Aug 2020 14:47:19 +0000
In-Reply-To: <20200803144719.3184138-1-kaleshsingh@google.com>
Message-Id: <20200803144719.3184138-3-kaleshsingh@google.com>
Mime-Version: 1.0
References: <20200803144719.3184138-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.28.0.163.g6104cc2f0b6-goog
Subject: [PATCH 2/2] dmabuf/tracing: Add dma-buf trace events
From:   Kalesh Singh <kaleshsingh@google.com>
To:     Jonathan Corbet <corbet@lwn.net>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-fsdevel@vger.kernel.org,
        Suren Baghdasaryan <surenb@google.com>,
        Hridya Valsaraju <hridya@google.com>,
        Ioannis Ilkos <ilkos@google.com>,
        John Stultz <john.stultz@linaro.org>, kernel-team@android.com,
        Kalesh Singh <kaleshsingh@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Being able to analyze the per process usage of shared
dma buffers prodives useful insights in situations where
the system is experiencing high memory pressure. This would
allow us to see exactly which processes are holding references
to the shared buffer.

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---
 drivers/dma-buf/dma-buf.c      | 29 +++++++++++++
 include/trace/events/dma_buf.h | 77 ++++++++++++++++++++++++++++++++++
 2 files changed, 106 insertions(+)
 create mode 100644 include/trace/events/dma_buf.h

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 1ca609f66fdf..1729191ac9ca 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -29,6 +29,9 @@
 #include <uapi/linux/dma-buf.h>
 #include <uapi/linux/magic.h>
 
+#define CREATE_TRACE_POINTS
+#include <trace/events/dma_buf.h>
+
 static inline int is_dma_buf_file(struct file *);
 
 struct dma_buf_list {
@@ -110,6 +113,15 @@ static struct file_system_type dma_buf_fs_type = {
 	.kill_sb = kill_anon_super,
 };
 
+static void dma_buf_vma_close(struct vm_area_struct *area)
+{
+	trace_dma_buf_map_ref_dec(current, area->vm_file);
+}
+
+static const struct vm_operations_struct dma_buf_vm_ops = {
+	.close = dma_buf_vma_close,
+};
+
 static int dma_buf_mmap_internal(struct file *file, struct vm_area_struct *vma)
 {
 	struct dma_buf *dmabuf;
@@ -128,6 +140,9 @@ static int dma_buf_mmap_internal(struct file *file, struct vm_area_struct *vma)
 	    dmabuf->size >> PAGE_SHIFT)
 		return -EINVAL;
 
+	trace_dma_buf_map_ref_inc(current, file);
+	vma->vm_ops = &dma_buf_vm_ops;
+
 	return dmabuf->ops->mmap(dmabuf, vma);
 }
 
@@ -410,6 +425,17 @@ static void dma_buf_show_fdinfo(struct seq_file *m, struct file *file)
 	spin_unlock(&dmabuf->name_lock);
 }
 
+static int dma_buf_flush(struct file *filp, fl_owner_t id)
+{
+	trace_dma_buf_fd_ref_dec(current, filp);
+	return 0;
+}
+
+static void dma_buf_fd_install(int fd, struct file *filp)
+{
+	trace_dma_buf_fd_ref_inc(current, filp);
+}
+
 static const struct file_operations dma_buf_fops = {
 	.mmap		= dma_buf_mmap_internal,
 	.llseek		= dma_buf_llseek,
@@ -417,6 +443,8 @@ static const struct file_operations dma_buf_fops = {
 	.unlocked_ioctl	= dma_buf_ioctl,
 	.compat_ioctl	= compat_ptr_ioctl,
 	.show_fdinfo	= dma_buf_show_fdinfo,
+	.fd_install	= dma_buf_fd_install,
+	.flush		= dma_buf_flush,
 };
 
 /*
@@ -1177,6 +1205,7 @@ int dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma,
 		if (oldfile)
 			fput(oldfile);
 	}
+
 	return ret;
 
 }
diff --git a/include/trace/events/dma_buf.h b/include/trace/events/dma_buf.h
new file mode 100644
index 000000000000..05af336cd849
--- /dev/null
+++ b/include/trace/events/dma_buf.h
@@ -0,0 +1,77 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM dma_buf
+
+#if !defined(_TRACE_DMA_BUF_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_DMA_BUF_H
+
+#include <linux/dma-buf.h>
+#include <linux/tracepoint.h>
+#include <linux/types.h>
+
+#define UNKNOWN "<unknown>"
+
+#ifdef CREATE_TRACE_POINTS
+static inline struct dma_buf *dma_buffer(struct file *filp)
+{
+	return filp->private_data;
+}
+#endif
+
+DECLARE_EVENT_CLASS(dma_buf_ref_template,
+
+	TP_PROTO(struct task_struct *task, struct file *filp),
+
+	TP_ARGS(task,  filp),
+
+	TP_STRUCT__entry(
+		__field(u32, tgid)
+		__field(u32, pid)
+		__field(u64, size)
+		__field(s64, count)
+		__string(exp_name, dma_buffer(filp)->exp_name)
+		__string(name, dma_buffer(filp)->name ? dma_buffer(filp)->name : UNKNOWN)
+		__field(u64, i_ino)
+	),
+
+	TP_fast_assign(
+		__entry->tgid = task->tgid;
+		__entry->pid = task->pid;
+		__entry->size = dma_buffer(filp)->size;
+		__entry->count = file_count(filp);
+		__assign_str(exp_name, dma_buffer(filp)->exp_name);
+		__assign_str(name, dma_buffer(filp)->name ? dma_buffer(filp)->name : UNKNOWN);
+		__entry->i_ino = filp->f_inode->i_ino;
+	),
+
+	TP_printk("tgid=%u pid=%u size=%llu count=%lld exp_name=%s name=%s i_ino=%llu",
+		__entry->tgid,
+		__entry->pid,
+		__entry->size,
+		__entry->count,
+		__get_str(exp_name),
+		__get_str(name),
+		__entry->i_ino
+	)
+);
+
+DEFINE_EVENT(dma_buf_ref_template, dma_buf_fd_ref_inc,
+	TP_PROTO(struct task_struct *task, struct file *filp),
+	TP_ARGS(task,  filp));
+
+DEFINE_EVENT(dma_buf_ref_template, dma_buf_fd_ref_dec,
+	TP_PROTO(struct task_struct *task, struct file *filp),
+	TP_ARGS(task,  filp));
+
+DEFINE_EVENT(dma_buf_ref_template, dma_buf_map_ref_inc,
+	TP_PROTO(struct task_struct *task, struct file *filp),
+	TP_ARGS(task,  filp));
+
+DEFINE_EVENT(dma_buf_ref_template, dma_buf_map_ref_dec,
+	TP_PROTO(struct task_struct *task, struct file *filp),
+	TP_ARGS(task,  filp));
+
+#endif /* _TRACE_DMA_BUF_H */
+
+/* This part must be outside protection */
+#include <trace/define_trace.h>
-- 
2.28.0.163.g6104cc2f0b6-goog

