Return-Path: <linux-doc+bounces-63112-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id E7018BD3E97
	for <lists+linux-doc@lfdr.de>; Mon, 13 Oct 2025 17:10:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6AF5C34DFE6
	for <lists+linux-doc@lfdr.de>; Mon, 13 Oct 2025 15:10:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C1E7314A84;
	Mon, 13 Oct 2025 14:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i23m9acz"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9875E3148BE
	for <linux-doc@vger.kernel.org>; Mon, 13 Oct 2025 14:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760367248; cv=none; b=SZAh7QYAlJrBmpT24+y9fcbVtPO5sgufO7L/bP2sm1BDvLUXszXATvmAAvlwLFCbqeXpFWN+mmY2NQIgVFirtSlA7P+ChQ/2PrHqpGzd/g4XhQ6gqXY35ZVDdd4ZoOvZH85jU+y8/RmdYagypC4X06gEL3q5da6epf2ezcF05yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760367248; c=relaxed/simple;
	bh=kvdcNejWK/mOk04H688uEbaA/cC9mhfBNv/gUTpRf6E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UT/wfI4HXsOK82g+cGUoRMdldXRMvvqVFvtxbAh+ld5ZZ5tRz+MAFb8k/i2j5sYflwma4cl5/0/Tw4bPclt58XaHGdgCxP9ZhkWjimcBbpQr8TER2+SxixGfSieVv9aHAc4WVw9dDcu+VbzFRCsfCfn2Z+Ih+C4SoMxzsFYj0tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i23m9acz; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-46f53f88e0bso24034825e9.1
        for <linux-doc@vger.kernel.org>; Mon, 13 Oct 2025 07:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760367245; x=1760972045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8P7N+yGyf3ZHVe543mLefJ6kNjA/6azjCaZxnGN+ZPM=;
        b=i23m9aczsGFjsj5EmFXcy2Kiu7yBvPMTfa31e2oyEIasFPR2iIIApYdTCW/n1QfbhO
         AOu7PRmkgXm0a684VS+381yEorNxEXqEU8KWlwdV07sO/EQkyJoWjDgKbuVTYYYdMy+k
         yqjvshGJBDn1ECfzVLMNpsfyvIXwH3KD8Am6ZxmNmSA/b3SrZOglImgXxb85ryHFMFAT
         W/V0Lk0PEizffKeSqAQpo+ym0+/Bb++HzoXP6zUl2474PZMWFADV+RrXKSDchlNvsdEa
         fQjl+cxtK5W+aHBY30TB4juZr9WfxHycaJyiVvW6ybGeNT2gAnp0hlVknmrZlmR3wWth
         CzEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760367245; x=1760972045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8P7N+yGyf3ZHVe543mLefJ6kNjA/6azjCaZxnGN+ZPM=;
        b=bhWsatijpu9r4cNQ9lJ17XwoET8N2Gw1P3RjI/Jd2zl6pX+LyvhdkNMxmsm/2wH0VM
         nubAt7sGLb8WKWJwc7O3Z9ow+YZxMII8Pvmt3b9fJ/Xt3g/n94keLVukZDrakXtx7Obc
         PiMGn/ViOV9JzjEUM4BiHz1RUbHpXMSfY9uoCZ++Bb2Rc1liO3GZ1OJKaifkITnN8L1G
         C0ZErKEEXimg4D0DJe22ExAVynluQCGtKAH7ysAEZsW6jJcEq8NaBV2Pa4vj74p9qmoi
         mjqWGpoWbCWeHUdYumeQLwu+0R4heooLykDGgfs9/e1GKWvSGW3hYIwdZPNPCGwqpw9w
         +5jw==
X-Forwarded-Encrypted: i=1; AJvYcCUsHo6t1nOQz0xPZCAbXr0jJYAUK5/GWRvvLziPuxbNuZ8fMhXXuu+NJ93O49/epaMCRkslKt0IcFQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHYYdUNbJ1OChmauix3boAfg1ePnIh2WCoA2Cgp3riqUsV+qAn
	HZMklzCRjLBlUoJGfZtOCpO34INB9SueWdnB7Y4BnnZiF/Qx3w5GG+mP
X-Gm-Gg: ASbGncsGlfJk37j1NBB+qYKKay1nBeCGHji+T8Z4s32kLnwQtlBS+x7mgx/fl7qI1B8
	z84x67Tn4R+rYKKf3cUMjQc8G2RYfaVl99/324fnuRuh5t9SrHHNPlfWGbpy93ifr/1oVI+WUzl
	0SIzyHetap8+pySRuY/X2LHvUESVwFWbWTgzNUFKlSmuCrAiOkp5wHaxq3e8U3SQttZj7PeedUk
	0RxpzrCTli07vq8X8cfkms1GXvbpdkgx67iYeyWSX4i7L+8vpysKOT90kCuo0zDw7lk8xWnw/GV
	KY96h4F6qNAkHdX51OeuFo+o2w7YJ5uZ5iOVhTGbomNKeWVnb29NzzCkYfCbnwUmaH7nM5WJu9k
	b4kQA7omVHrGnW5AiCwVs+Fd0Rr1M0BN0lSw=
X-Google-Smtp-Source: AGHT+IHmYGHVzWzb5HwhHnvUieQF0ev9QYqkEuw6T8jpQDA2962Xt1Dg9W1OR3B1kwfzA7lEzjzxEA==
X-Received: by 2002:a05:600d:8110:b0:45f:2922:2aef with SMTP id 5b1f17b1804b1-46fa9b09233mr146071455e9.28.1760367244820;
        Mon, 13 Oct 2025 07:54:04 -0700 (PDT)
Received: from 127.com ([2620:10d:c092:600::1:eb09])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5e0e70sm18641085f8f.40.2025.10.13.07.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:54:04 -0700 (PDT)
From: Pavel Begunkov <asml.silence@gmail.com>
To: netdev@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Joshua Washington <joshwash@google.com>,
	Harshitha Ramamurthy <hramamurthy@google.com>,
	Jian Shen <shenjian15@huawei.com>,
	Salil Mehta <salil.mehta@huawei.com>,
	Jijie Shao <shaojijie@huawei.com>,
	Sunil Goutham <sgoutham@marvell.com>,
	Geetha sowjanya <gakula@marvell.com>,
	Subbaraya Sundeep <sbhatta@marvell.com>,
	hariprasad <hkelam@marvell.com>,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Tariq Toukan <tariqt@nvidia.com>,
	Mark Bloch <mbloch@nvidia.com>,
	Leon Romanovsky <leon@kernel.org>,
	Alexander Duyck <alexanderduyck@fb.com>,
	kernel-team@meta.com,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Joe Damato <joe@dama.to>,
	David Wei <dw@davidwei.uk>,
	Willem de Bruijn <willemb@google.com>,
	Mina Almasry <almasrymina@google.com>,
	Pavel Begunkov <asml.silence@gmail.com>,
	Breno Leitao <leitao@debian.org>,
	Dragos Tatulea <dtatulea@nvidia.com>,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH net-next v4 23/24] net: let pp memory provider to specify rx buf len
Date: Mon, 13 Oct 2025 15:54:25 +0100
Message-ID: <00426e189e98d808efb07370c6a0fc81ded1f787.1760364551.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1760364551.git.asml.silence@gmail.com>
References: <cover.1760364551.git.asml.silence@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow memory providers to configure rx queues with a specific receive
buffer length. Pass it in sturct pp_memory_provider_params, which is
copied into the queue, and make __netdev_queue_config() to check if it's
present and apply to the configuration. This way the configured length
will persist across queue restarts, and will be automatically removed
once a memory provider is detached.

Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 include/net/page_pool/types.h |  1 +
 net/core/netdev_config.c      | 15 +++++++++++----
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/include/net/page_pool/types.h b/include/net/page_pool/types.h
index 1509a536cb85..be74e4aec7b5 100644
--- a/include/net/page_pool/types.h
+++ b/include/net/page_pool/types.h
@@ -161,6 +161,7 @@ struct memory_provider_ops;
 struct pp_memory_provider_params {
 	void *mp_priv;
 	const struct memory_provider_ops *mp_ops;
+	u32 rx_buf_len;
 };
 
 struct page_pool {
diff --git a/net/core/netdev_config.c b/net/core/netdev_config.c
index c5ae39e76f40..2c9b06f94e01 100644
--- a/net/core/netdev_config.c
+++ b/net/core/netdev_config.c
@@ -2,6 +2,7 @@
 
 #include <linux/netdevice.h>
 #include <net/netdev_queues.h>
+#include <net/netdev_rx_queue.h>
 
 #include "dev.h"
 
@@ -77,7 +78,7 @@ void netdev_queue_config_update_cnt(struct net_device *dev, unsigned int txq,
 	}
 }
 
-void __netdev_queue_config(struct net_device *dev, int rxq,
+void __netdev_queue_config(struct net_device *dev, int rxq_idx,
 			   struct netdev_queue_config *qcfg, bool pending)
 {
 	const struct netdev_config *cfg;
@@ -88,18 +89,24 @@ void __netdev_queue_config(struct net_device *dev, int rxq,
 
 	/* Get defaults from the driver, in case user config not set */
 	if (dev->queue_mgmt_ops->ndo_queue_cfg_defaults)
-		dev->queue_mgmt_ops->ndo_queue_cfg_defaults(dev, rxq, qcfg);
+		dev->queue_mgmt_ops->ndo_queue_cfg_defaults(dev, rxq_idx, qcfg);
 
 	/* Set config based on device-level settings */
 	if (cfg->rx_buf_len)
 		qcfg->rx_buf_len = cfg->rx_buf_len;
 
 	/* Set config dedicated to this queue */
-	if (rxq >= 0) {
-		const struct netdev_queue_config *user_cfg = &cfg->qcfg[rxq];
+	if (rxq_idx >= 0) {
+		const struct netdev_queue_config *user_cfg;
+		struct netdev_rx_queue *rxq;
 
+		user_cfg = &cfg->qcfg[rxq_idx];
 		if (user_cfg->rx_buf_len)
 			qcfg->rx_buf_len = user_cfg->rx_buf_len;
+
+		rxq = __netif_get_rx_queue(dev, rxq_idx);
+		if (rxq->mp_params.mp_ops && rxq->mp_params.rx_buf_len)
+			qcfg->rx_buf_len = rxq->mp_params.rx_buf_len;
 	}
 }
 
-- 
2.49.0


