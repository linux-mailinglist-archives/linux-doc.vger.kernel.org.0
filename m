Return-Path: <linux-doc+bounces-26353-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0433298E5D2
	for <lists+linux-doc@lfdr.de>; Thu,  3 Oct 2024 00:10:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6DB161F23B28
	for <lists+linux-doc@lfdr.de>; Wed,  2 Oct 2024 22:10:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BC19199E94;
	Wed,  2 Oct 2024 22:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="eKvhgjTK"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pj1-f103.google.com (mail-pj1-f103.google.com [209.85.216.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77C52F22
	for <linux-doc@vger.kernel.org>; Wed,  2 Oct 2024 22:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727906996; cv=none; b=qdhLKur0h1qu9hldpq1I132WF9xLNGJPaw+79gufyJAQ1L9g8jAIuzz8LK0kxnZMMsLODomrbWgxUX4aUpYEgry13CW8Ui/LTpvuY99jApWEZml5E/WqvOOmVd+S5rvLi6R2cvcKROsi3RWQ5EAW6ky+UatwER6ZoEg4mFTIBrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727906996; c=relaxed/simple;
	bh=uP/9pWh2xAZInxVroOnIMdbzjKtEIUcfQw6+rPv1ZOY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ruF220wT2XoWN2LHwnZ7XLkiJftZaZWe7S7oXu/UcO2UbnfvdUKwvMoxs6tDZ+Vh8D9YcULqM0RF2sn5MxIraKfLk/xMcyOXQFN1s9RcjozLeisraOeTAYZmfzYpZ+NJw/xDbul5wlXulXt3CBCPzaExCfEpYOTPWajFwrUI6BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=eKvhgjTK; arc=none smtp.client-ip=209.85.216.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Received: by mail-pj1-f103.google.com with SMTP id 98e67ed59e1d1-2e18856feb4so281267a91.3
        for <linux-doc@vger.kernel.org>; Wed, 02 Oct 2024 15:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1727906992; x=1728511792; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zV2x58sI5AkJiDCsyCiFH33iwbYHihnCyGcX8meInMs=;
        b=eKvhgjTK+1BVvkq4aBQd7jDOisBchOErmsSxqTxhcZ4Q8LldgvIgNPpJwjOh7LN61l
         ThgGvcv+8wmLspBXX410+j97cosCa3sJ6HgYC+D1WAMMSP2A2HSaleurc1JwPAmBbA75
         L1XvJ8+84jKVQTZg3v3ORbLGUCulIOAig9mg5NwVBEP+IOFe06B+0PvwFiF5fZ4UIMx9
         Qx4KbfivflXugMIzNufeEdWhcUJMVSNu12DwvDrQ29X9ZGLi0auVwy0WCcgT71dsk3WR
         RMak3z98b4w+1jguWorACQUsoXpY96SoO0atYLtH7b7wE5JFEmEUxBWNUYOvqeUcCB4Y
         bJTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727906992; x=1728511792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zV2x58sI5AkJiDCsyCiFH33iwbYHihnCyGcX8meInMs=;
        b=soYHz+QquvCimF/nN+e0jXH4/gowQYYiAdspQL/FMlw8tkpseFHgM6E8+3nlCmiboX
         3kg6AmW9YdmxaC90BW0SRDhWL/bFpv7Sql0j6fQ2Lo8KAKCXX1ocZHYqzVIBIUvuOD4Z
         ipPLc/dVK1hFIDwD5LnI0gQO7pgvVCRhavOZrzdEH8aTYaAQnzAMGco7dNy1mDuDc/X5
         Rs4O30S+9NgLqzBDyC4Z6VQaue9LHyr3lnuvYfrCOShKgLZGM2hHTdOsdUnpSSrohqwB
         /GQ5ErUXoGZphoXE1WgNQb2waQ4W6YRhOwu/X4J1/XOQUbaTuyMlZyuql5o9SS/8/s/P
         LCUA==
X-Forwarded-Encrypted: i=1; AJvYcCWKYvavDtY7kaD9j45E8Wu9cl0lAnEhURygRaGxh0oNOJRdweQ+WHhfVjJhDGYC3+na0jXTkqMnmYQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUUA3Km+NcsaM8NWNCci99DU6gkH2Wdt+j1E/xInXmyec4+Wtx
	OitVh89I6os96opy5qNr7kO96ojt0AamR9pF3jF9Yn8q4WLu7/3fjDRws7hzULzPBY15Tdjhww+
	d00xbFnRyqCYr2E+EAUkKbmYak+8cnqvJt6Y4NyvjCfPllTCn
X-Google-Smtp-Source: AGHT+IFJyqtT+QTJLBllY3ft24sd+AUM/wENJYw7oZu/yiYdg92hI4ulZ/hAcvsR6KA/SbG68K/W93Jahjwh
X-Received: by 2002:a17:90a:fa01:b0:2d8:f0e2:96bc with SMTP id 98e67ed59e1d1-2e184510763mr6076706a91.4.1727906992196;
        Wed, 02 Oct 2024 15:09:52 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([2620:125:9017:12:36:3:5:0])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-2e18f78d9c2sm143711a91.9.2024.10.02.15.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 15:09:52 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-ushankar.dev.purestorage.com (dev-ushankar.dev.purestorage.com [IPv6:2620:125:9007:640:7:70:36:0])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 71F683407A8;
	Wed,  2 Oct 2024 16:09:51 -0600 (MDT)
Received: by dev-ushankar.dev.purestorage.com (Postfix, from userid 1557716368)
	id 6F009E51EFD; Wed,  2 Oct 2024 16:09:51 -0600 (MDT)
From: Uday Shankar <ushankar@purestorage.com>
To: Ming Lei <ming.lei@redhat.com>,
	Jens Axboe <axboe@kernel.dk>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Uday Shankar <ushankar@purestorage.com>,
	linux-block@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v3 4/5] ublk: support device recovery without I/O queueing
Date: Wed,  2 Oct 2024 16:09:48 -0600
Message-Id: <20241002220949.3087902-5-ushankar@purestorage.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241002220949.3087902-1-ushankar@purestorage.com>
References: <20241002220949.3087902-1-ushankar@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ublk currently supports the following behaviors on ublk server exit:

A: outstanding I/Os get errors, subsequently issued I/Os get errors
B: outstanding I/Os get errors, subsequently issued I/Os queue
C: outstanding I/Os get reissued, subsequently issued I/Os queue

and the following behaviors for recovery of preexisting block devices by
a future incarnation of the ublk server:

1: ublk devices stopped on ublk server exit (no recovery possible)
2: ublk devices are recoverable using start/end_recovery commands

The userspace interface allows selection of combinations of these
behaviors using flags specified at device creation time, namely:

default behavior: A + 1
UBLK_F_USER_RECOVERY: B + 2
UBLK_F_USER_RECOVERY|UBLK_F_USER_RECOVERY_REISSUE: C + 2

The behavior A + 2 is currently unsupported. Add support for this
behavior under the new flag combination
UBLK_F_USER_RECOVERY|UBLK_F_USER_RECOVERY_FAIL_IO.

Signed-off-by: Uday Shankar <ushankar@purestorage.com>
---
Changes since v2 (https://lore.kernel.org/linux-block/20240917002155.2044225-5-ushankar@purestorage.com/):
- Clean up logic in ublk_ctrl_end_recovery

 drivers/block/ublk_drv.c      | 78 ++++++++++++++++++++++++++++-------
 include/uapi/linux/ublk_cmd.h | 18 ++++++++
 2 files changed, 81 insertions(+), 15 deletions(-)

diff --git a/drivers/block/ublk_drv.c b/drivers/block/ublk_drv.c
index d5edef7bde43..f2a05dcbc58b 100644
--- a/drivers/block/ublk_drv.c
+++ b/drivers/block/ublk_drv.c
@@ -60,10 +60,12 @@
 		| UBLK_F_UNPRIVILEGED_DEV \
 		| UBLK_F_CMD_IOCTL_ENCODE \
 		| UBLK_F_USER_COPY \
-		| UBLK_F_ZONED)
+		| UBLK_F_ZONED \
+		| UBLK_F_USER_RECOVERY_FAIL_IO)
 
 #define UBLK_F_ALL_RECOVERY_FLAGS (UBLK_F_USER_RECOVERY \
-		| UBLK_F_USER_RECOVERY_REISSUE)
+		| UBLK_F_USER_RECOVERY_REISSUE \
+		| UBLK_F_USER_RECOVERY_FAIL_IO)
 
 /* All UBLK_PARAM_TYPE_* should be included here */
 #define UBLK_PARAM_TYPE_ALL                                \
@@ -146,6 +148,7 @@ struct ublk_queue {
 	bool force_abort;
 	bool timeout;
 	bool canceling;
+	bool fail_io; /* copy of dev->state == UBLK_S_DEV_FAIL_IO */
 	unsigned short nr_io_ready;	/* how many ios setup */
 	spinlock_t		cancel_lock;
 	struct ublk_device *dev;
@@ -690,7 +693,8 @@ static inline bool ublk_nosrv_should_reissue_outstanding(struct ublk_device *ub)
  */
 static inline bool ublk_nosrv_dev_should_queue_io(struct ublk_device *ub)
 {
-	return ub->dev_info.flags & UBLK_F_USER_RECOVERY;
+	return (ub->dev_info.flags & UBLK_F_USER_RECOVERY) &&
+	       !(ub->dev_info.flags & UBLK_F_USER_RECOVERY_FAIL_IO);
 }
 
 /*
@@ -700,7 +704,8 @@ static inline bool ublk_nosrv_dev_should_queue_io(struct ublk_device *ub)
  */
 static inline bool ublk_nosrv_should_queue_io(struct ublk_queue *ubq)
 {
-	return ubq->flags & UBLK_F_USER_RECOVERY;
+	return (ubq->flags & UBLK_F_USER_RECOVERY) &&
+	       !(ubq->flags & UBLK_F_USER_RECOVERY_FAIL_IO);
 }
 
 /*
@@ -714,6 +719,12 @@ static inline bool ublk_nosrv_should_stop_dev(struct ublk_device *ub)
 	return !(ub->dev_info.flags & UBLK_F_USER_RECOVERY);
 }
 
+static inline bool ublk_dev_in_recoverable_state(struct ublk_device *ub)
+{
+	return ub->dev_info.state == UBLK_S_DEV_QUIESCED ||
+	       ub->dev_info.state == UBLK_S_DEV_FAIL_IO;
+}
+
 static void ublk_free_disk(struct gendisk *disk)
 {
 	struct ublk_device *ub = disk->private_data;
@@ -1275,6 +1286,10 @@ static blk_status_t ublk_queue_rq(struct blk_mq_hw_ctx *hctx,
 	struct request *rq = bd->rq;
 	blk_status_t res;
 
+	if (unlikely(ubq->fail_io)) {
+		return BLK_STS_TARGET;
+	}
+
 	/* fill iod to slot in io cmd buffer */
 	res = ublk_setup_iod(ubq, rq);
 	if (unlikely(res != BLK_STS_OK))
@@ -1625,6 +1640,7 @@ static void ublk_nosrv_work(struct work_struct *work)
 {
 	struct ublk_device *ub =
 		container_of(work, struct ublk_device, nosrv_work);
+	int i;
 
 	if (ublk_nosrv_should_stop_dev(ub)) {
 		ublk_stop_dev(ub);
@@ -1634,7 +1650,18 @@ static void ublk_nosrv_work(struct work_struct *work)
 	mutex_lock(&ub->mutex);
 	if (ub->dev_info.state != UBLK_S_DEV_LIVE)
 		goto unlock;
-	__ublk_quiesce_dev(ub);
+
+	if (ublk_nosrv_dev_should_queue_io(ub)) {
+		__ublk_quiesce_dev(ub);
+	} else {
+		blk_mq_quiesce_queue(ub->ub_disk->queue);
+		for (i = 0; i < ub->dev_info.nr_hw_queues; i++) {
+			ublk_get_queue(ub, i)->fail_io = true;
+		}
+		blk_mq_unquiesce_queue(ub->ub_disk->queue);
+		ub->dev_info.state = UBLK_S_DEV_FAIL_IO;
+	}
+
  unlock:
 	mutex_unlock(&ub->mutex);
 	ublk_cancel_dev(ub);
@@ -2387,8 +2414,13 @@ static int ublk_ctrl_add_dev(struct io_uring_cmd *cmd)
 		return -EPERM;
 
 	/* forbid nonsense combinations of recovery flags */
-	if ((info.flags & UBLK_F_USER_RECOVERY_REISSUE) &&
-	    !(info.flags & UBLK_F_USER_RECOVERY)) {
+	switch (info.flags & UBLK_F_ALL_RECOVERY_FLAGS) {
+	case 0:
+	case UBLK_F_USER_RECOVERY:
+	case (UBLK_F_USER_RECOVERY | UBLK_F_USER_RECOVERY_REISSUE):
+	case (UBLK_F_USER_RECOVERY | UBLK_F_USER_RECOVERY_FAIL_IO):
+		break;
+	default:
 		pr_warn("%s: invalid recovery flags %llx\n", __func__,
 			info.flags & UBLK_F_ALL_RECOVERY_FLAGS);
 		return -EINVAL;
@@ -2720,14 +2752,18 @@ static int ublk_ctrl_start_recovery(struct ublk_device *ub,
 	 *     and related io_uring ctx is freed so file struct of /dev/ublkcX is
 	 *     released.
 	 *
+	 * and one of the following holds
+	 *
 	 * (2) UBLK_S_DEV_QUIESCED is set, which means the quiesce_work:
 	 *     (a)has quiesced request queue
 	 *     (b)has requeued every inflight rqs whose io_flags is ACTIVE
 	 *     (c)has requeued/aborted every inflight rqs whose io_flags is NOT ACTIVE
 	 *     (d)has completed/camceled all ioucmds owned by ther dying process
+	 *
+	 * (3) UBLK_S_DEV_FAIL_IO is set, which means the queue is not
+	 *     quiesced, but all I/O is being immediately errored
 	 */
-	if (test_bit(UB_STATE_OPEN, &ub->state) ||
-			ub->dev_info.state != UBLK_S_DEV_QUIESCED) {
+	if (test_bit(UB_STATE_OPEN, &ub->state) || !ublk_dev_in_recoverable_state(ub)) {
 		ret = -EBUSY;
 		goto out_unlock;
 	}
@@ -2751,6 +2787,7 @@ static int ublk_ctrl_end_recovery(struct ublk_device *ub,
 	const struct ublksrv_ctrl_cmd *header = io_uring_sqe_cmd(cmd->sqe);
 	int ublksrv_pid = (int)header->data[0];
 	int ret = -EINVAL;
+	int i;
 
 	pr_devel("%s: Waiting for new ubq_daemons(nr: %d) are ready, dev id %d...\n",
 			__func__, ub->dev_info.nr_hw_queues, header->dev_id);
@@ -2765,18 +2802,29 @@ static int ublk_ctrl_end_recovery(struct ublk_device *ub,
 	if (ublk_nosrv_should_stop_dev(ub))
 		goto out_unlock;
 
-	if (ub->dev_info.state != UBLK_S_DEV_QUIESCED) {
+	if (!ublk_dev_in_recoverable_state(ub)) {
 		ret = -EBUSY;
 		goto out_unlock;
 	}
 	ub->dev_info.ublksrv_pid = ublksrv_pid;
 	pr_devel("%s: new ublksrv_pid %d, dev id %d\n",
 			__func__, ublksrv_pid, header->dev_id);
-	blk_mq_unquiesce_queue(ub->ub_disk->queue);
-	pr_devel("%s: queue unquiesced, dev id %d.\n",
-			__func__, header->dev_id);
-	blk_mq_kick_requeue_list(ub->ub_disk->queue);
-	ub->dev_info.state = UBLK_S_DEV_LIVE;
+
+	if (ublk_nosrv_dev_should_queue_io(ub)) {
+		ub->dev_info.state = UBLK_S_DEV_LIVE;
+		blk_mq_unquiesce_queue(ub->ub_disk->queue);
+		pr_devel("%s: queue unquiesced, dev id %d.\n",
+				__func__, header->dev_id);
+		blk_mq_kick_requeue_list(ub->ub_disk->queue);
+	} else {
+		blk_mq_quiesce_queue(ub->ub_disk->queue);
+		ub->dev_info.state = UBLK_S_DEV_LIVE;
+		for (i = 0; i < ub->dev_info.nr_hw_queues; i++) {
+			ublk_get_queue(ub, i)->fail_io = false;
+		}
+		blk_mq_unquiesce_queue(ub->ub_disk->queue);
+	}
+
 	ret = 0;
  out_unlock:
 	mutex_unlock(&ub->mutex);
diff --git a/include/uapi/linux/ublk_cmd.h b/include/uapi/linux/ublk_cmd.h
index c8dc5f8ea699..a2b3ea344639 100644
--- a/include/uapi/linux/ublk_cmd.h
+++ b/include/uapi/linux/ublk_cmd.h
@@ -147,8 +147,18 @@
  */
 #define UBLK_F_NEED_GET_DATA (1UL << 2)
 
+/*
+ * - Block devices are recoverable if ublk server exits and restarts
+ * - Outstanding I/O when ublk server exits is met with errors
+ * - I/O issued while there is no ublk server queues
+ */
 #define UBLK_F_USER_RECOVERY	(1UL << 3)
 
+/*
+ * - Block devices are recoverable if ublk server exits and restarts
+ * - Outstanding I/O when ublk server exits is reissued
+ * - I/O issued while there is no ublk server queues
+ */
 #define UBLK_F_USER_RECOVERY_REISSUE	(1UL << 4)
 
 /*
@@ -184,10 +194,18 @@
  */
 #define UBLK_F_ZONED (1ULL << 8)
 
+/*
+ * - Block devices are recoverable if ublk server exits and restarts
+ * - Outstanding I/O when ublk server exits is met with errors
+ * - I/O issued while there is no ublk server is met with errors
+ */
+#define UBLK_F_USER_RECOVERY_FAIL_IO (1ULL << 9)
+
 /* device state */
 #define UBLK_S_DEV_DEAD	0
 #define UBLK_S_DEV_LIVE	1
 #define UBLK_S_DEV_QUIESCED	2
+#define UBLK_S_DEV_FAIL_IO 	3
 
 /* shipped via sqe->cmd of io_uring command */
 struct ublksrv_ctrl_cmd {
-- 
2.34.1


