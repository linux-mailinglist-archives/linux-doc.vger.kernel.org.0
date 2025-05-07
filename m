Return-Path: <linux-doc+bounces-45595-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A766AAEE1F
	for <lists+linux-doc@lfdr.de>; Wed,  7 May 2025 23:50:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 723D09E26E4
	for <lists+linux-doc@lfdr.de>; Wed,  7 May 2025 21:50:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B6CC290BDA;
	Wed,  7 May 2025 21:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="d/UGCY+O"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yw1-f226.google.com (mail-yw1-f226.google.com [209.85.128.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FBD928D84E
	for <linux-doc@vger.kernel.org>; Wed,  7 May 2025 21:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746654597; cv=none; b=MpfOTJif0l40O613zN1KL51nq0cjCrUREiDac+zlwIEVljONRRHJacsJc6ITheYF83o2BulBARX/S+mw0j/1KoXVGPsGVN6jy5PFTqkDpXdxjmT/tuxb+3989VttA9ka3oh16VN6iKhrS/d7aVhcgBXGYQqXKVBsCQ9JylqxX5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746654597; c=relaxed/simple;
	bh=sikJig1XLoDI0J5Z79ghS6sYM9GG55SpcD/yTUQSJbU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ViRX9FAl7raOm4cNJRX4SJEEEN3mpi6WaEsB373JuC5Tpghcw8efsd1Zaat3QOLrgYbj3hJJ82dFdyFGOXZ1miVh7G8w3mjVYyGc374dqt2ZD0zKSSzX6Gk21wR8LFPQakb9H9BRMcjTFa+6RKziYlbc6YLr+W7hj82xc0mpqK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=d/UGCY+O; arc=none smtp.client-ip=209.85.128.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Received: by mail-yw1-f226.google.com with SMTP id 00721157ae682-708a853c362so3380757b3.2
        for <linux-doc@vger.kernel.org>; Wed, 07 May 2025 14:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1746654590; x=1747259390; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AZ/TUepT6JRsyDL/PaYldCGnnM0P6E0fCkBes1E8ifg=;
        b=d/UGCY+Oqb09eRkcaI3GrGL0FdQbKKpDxaMynmSrmxpqhcOYV+6d1awnaGFeIb3aAb
         OIV5pZ+9zf+5FCZtMCzYt7sx0PRhQAsPVydL58yRdYjpCeXntKvxT0a74RIMFhBgUCTm
         J9TfadFsgnIFz0FTgyRT2/gXNxZCKNfwe+Z65apfSzboPo5VwB5hKHx3KC+2x1rPRyLN
         iRGoSro5H12OlP2UMhHL07OfppHQOzBQL+T+64OFgZHaTrVDf4u4GiiV0bTntmwAcwKs
         yOTQOUsQVdqAMzf8UgXpJso7b/E7lV/BWKTEtGKBqYK3z9A+QZM1DU8g69CXjyOyw9eS
         bo3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746654590; x=1747259390;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AZ/TUepT6JRsyDL/PaYldCGnnM0P6E0fCkBes1E8ifg=;
        b=lXJC9+faneobNa7cJtPIDXUAdGXfD/6k5F/ylw7FC7BhfbkKt8+DTC3ZiSabIKfuOR
         nDUavx09/jd3yMYFkFys4SnrTb7HIYwOYHfoEP7c6cZ3okO4oDRew9vW8snw3I4rCvCI
         CHvEPVD3vPQqXJHlYFhQ/yUN/sAQdevBFDr/Scps1+nXWz+VUyQxGiDh/1oGNhy9GkeE
         jMhydVzIUNllJSRHQOou6IbqNHqeSsV5r09tKWyYK0H/bCy6JSwcqyaB7A1vtYZEiIPj
         vgtnMXDczntl5+G93l5uwRzUVdXH6w9sTs81DHSbMPPeyJEQlWJK+AGp0F8TndQ8+akS
         3CGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjce8l4EDVQmTFKQ6ZfbToyVRXNslc/GxL4J0vS0SFEZ07HXky+LTDGkZq7oUc9fd9j7IHWsrkCVE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzV6Xh/glVHL4Ax3Ac9aJtEixC1WNvQH3TeH22vV2GKQ4hmVJ0h
	koWXsc1cTXgMNFpzIiDlxmOqTdDARPOAYShdtGHeyn03n/KaZ4I+zcJHA60ldUToyxYwgTLq2f5
	39PA3c52mV0g3aD/6Pvbqg+ElW3PHzF8xgUsYBavs/5gr1klZ
X-Gm-Gg: ASbGncucUhjYmxx2llkTvOSE4Fm4VFFBUTD9W7aHK80TGqnTH/vTkuYawrTwNDO67MQ
	roL9XZYBdj9NXdzH5f3RlTIQd5bHkotf109JuxDCXcSXFFdHVfS/im/SAJtKhfD90wuG3II+RyO
	suwEuer8WoG7E2HEwlm61ve6TA4q/UhAHEty60uxiYKA9/6GCRwho9bvt2YFZUEfl7BohDANZlY
	saAALlmHxEO5pqnIpC7+ohjIFjN+FJz/miefVGFy9n/EoW/8XpibmftHirLgjFmZ0RygabjbzQQ
	+3+KqBq/DdUSdRY3LK1XxiuZbflEUWw=
X-Google-Smtp-Source: AGHT+IGC9urjVO9J0EpWJd/3pB8ohLT4jCtSWcATbKoKBCgG5iI9a7wqHa1aEbUklTIeAjbzXKYutwVRFN2o
X-Received: by 2002:a05:690c:6307:b0:70a:1d5f:9dc1 with SMTP id 00721157ae682-70a1dab1e1bmr69951747b3.21.1746654590443;
        Wed, 07 May 2025 14:49:50 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([2620:125:9017:12:36:3:5:0])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-708c46fd9f1sm20744437b3.70.2025.05.07.14.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 14:49:50 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-ushankar.dev.purestorage.com (dev-ushankar.dev.purestorage.com [IPv6:2620:125:9007:640:7:70:36:0])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 542003409F5;
	Wed,  7 May 2025 15:49:49 -0600 (MDT)
Received: by dev-ushankar.dev.purestorage.com (Postfix, from userid 1557716368)
	id 4E99AE40E88; Wed,  7 May 2025 15:49:49 -0600 (MDT)
From: Uday Shankar <ushankar@purestorage.com>
Date: Wed, 07 May 2025 15:49:39 -0600
Subject: [PATCH v6 5/8] selftests: ublk: kublk: lift queue initialization
 out of thread
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250507-ublk_task_per_io-v6-5-a2a298783c01@purestorage.com>
References: <20250507-ublk_task_per_io-v6-0-a2a298783c01@purestorage.com>
In-Reply-To: <20250507-ublk_task_per_io-v6-0-a2a298783c01@purestorage.com>
To: Ming Lei <ming.lei@redhat.com>, Jens Axboe <axboe@kernel.dk>, 
 Caleb Sander Mateos <csander@purestorage.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
 Uday Shankar <ushankar@purestorage.com>
X-Mailer: b4 0.14.2

Currently, each ublk server I/O handler thread initializes its own
queue. However, as we move towards decoupled ublk_queues and ublk server
threads, this model does not make sense anymore, as there will no longer
be a concept of a thread having "its own" queue. So lift queue
initialization out of the per-thread ublk_io_handler_fn and into a loop
in ublk_start_daemon (which runs once for each device).

There is a part of ublk_queue_init (ring initialization) which does
actually need to happen on the thread that will use the ring; that is
separated into a separate ublk_thread_init which is still called by each
I/O handler thread.

Signed-off-by: Uday Shankar <ushankar@purestorage.com>
---
 tools/testing/selftests/ublk/kublk.c | 58 ++++++++++++++++++++++++++----------
 1 file changed, 43 insertions(+), 15 deletions(-)

diff --git a/tools/testing/selftests/ublk/kublk.c b/tools/testing/selftests/ublk/kublk.c
index 7b3af98546803134dd7f959c40408cefda7cd45c..3ad9e162816c3a10e9928f9d530908cda7595530 100644
--- a/tools/testing/selftests/ublk/kublk.c
+++ b/tools/testing/selftests/ublk/kublk.c
@@ -388,6 +388,17 @@ static void ublk_queue_deinit(struct ublk_queue *q)
 	int i;
 	int nr_ios = q->q_depth;
 
+	if (q->io_cmd_buf)
+		munmap(q->io_cmd_buf, ublk_queue_cmd_buf_sz(q));
+
+	for (i = 0; i < nr_ios; i++)
+		free(q->ios[i].buf_addr);
+}
+
+static void ublk_thread_deinit(struct ublk_queue *q)
+{
+	q->tid = 0;
+
 	io_uring_unregister_buffers(&q->ring);
 
 	io_uring_unregister_ring_fd(&q->ring);
@@ -397,28 +408,20 @@ static void ublk_queue_deinit(struct ublk_queue *q)
 		close(q->ring.ring_fd);
 		q->ring.ring_fd = -1;
 	}
-
-	if (q->io_cmd_buf)
-		munmap(q->io_cmd_buf, ublk_queue_cmd_buf_sz(q));
-
-	for (i = 0; i < nr_ios; i++)
-		free(q->ios[i].buf_addr);
 }
 
 static int ublk_queue_init(struct ublk_queue *q)
 {
 	struct ublk_dev *dev = q->dev;
 	int depth = dev->dev_info.queue_depth;
-	int i, ret = -1;
+	int i;
 	int cmd_buf_size, io_buf_size;
 	unsigned long off;
-	int ring_depth = dev->tgt.sq_depth, cq_depth = dev->tgt.cq_depth;
 
 	q->tgt_ops = dev->tgt.ops;
 	q->state = 0;
 	q->q_depth = depth;
 	q->cmd_inflight = 0;
-	q->tid = gettid();
 
 	if (dev->dev_info.flags & UBLK_F_SUPPORT_ZERO_COPY) {
 		q->state |= UBLKSRV_NO_BUF;
@@ -452,6 +455,22 @@ static int ublk_queue_init(struct ublk_queue *q)
 		}
 	}
 
+	return 0;
+ fail:
+	ublk_queue_deinit(q);
+	ublk_err("ublk dev %d queue %d failed\n",
+			dev->dev_info.dev_id, q->q_id);
+	return -ENOMEM;
+}
+
+static int ublk_thread_init(struct ublk_queue *q)
+{
+	struct ublk_dev *dev = q->dev;
+	int ring_depth = dev->tgt.sq_depth, cq_depth = dev->tgt.cq_depth;
+	int ret;
+
+	q->tid = gettid();
+
 	ret = ublk_setup_ring(&q->ring, ring_depth, cq_depth,
 			IORING_SETUP_COOP_TASKRUN |
 			IORING_SETUP_SINGLE_ISSUER |
@@ -481,9 +500,9 @@ static int ublk_queue_init(struct ublk_queue *q)
 	}
 
 	return 0;
- fail:
-	ublk_queue_deinit(q);
-	ublk_err("ublk dev %d queue %d failed\n",
+fail:
+	ublk_thread_deinit(q);
+	ublk_err("ublk dev %d queue %d thread init failed\n",
 			dev->dev_info.dev_id, q->q_id);
 	return -ENOMEM;
 }
@@ -740,9 +759,9 @@ static void *ublk_io_handler_fn(void *data)
 	int dev_id = q->dev->dev_info.dev_id;
 	int ret;
 
-	ret = ublk_queue_init(q);
+	ret = ublk_thread_init(q);
 	if (ret) {
-		ublk_err("ublk dev %d queue %d init queue failed\n",
+		ublk_err("ublk dev %d queue %d thread init failed\n",
 				dev_id, q->q_id);
 		return NULL;
 	}
@@ -761,7 +780,7 @@ static void *ublk_io_handler_fn(void *data)
 	} while (1);
 
 	ublk_dbg(UBLK_DBG_QUEUE, "ublk dev %d queue %d exited\n", dev_id, q->q_id);
-	ublk_queue_deinit(q);
+	ublk_thread_deinit(q);
 	return NULL;
 }
 
@@ -830,6 +849,13 @@ static int ublk_start_daemon(const struct dev_ctx *ctx, struct ublk_dev *dev)
 		dev->q[i].dev = dev;
 		dev->q[i].q_id = i;
 
+		ret = ublk_queue_init(&dev->q[i]);
+		if (ret) {
+			ublk_err("ublk dev %d queue %d init queue failed\n",
+				 dinfo->dev_id, i);
+			goto fail;
+		}
+
 		qinfo[i].q = &dev->q[i];
 		qinfo[i].queue_sem = &queue_sem;
 		qinfo[i].affinity = &affinity_buf[i];
@@ -865,6 +891,8 @@ static int ublk_start_daemon(const struct dev_ctx *ctx, struct ublk_dev *dev)
 	for (i = 0; i < dinfo->nr_hw_queues; i++)
 		pthread_join(dev->q[i].thread, &thread_ret);
  fail:
+	for (i = 0; i < dinfo->nr_hw_queues; i++)
+		ublk_queue_deinit(&dev->q[i]);
 	ublk_dev_unprep(dev);
 	ublk_dbg(UBLK_DBG_DEV, "%s exit\n", __func__);
 

-- 
2.34.1


