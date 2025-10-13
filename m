Return-Path: <linux-doc+bounces-63109-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 852E3BD3FD3
	for <lists+linux-doc@lfdr.de>; Mon, 13 Oct 2025 17:17:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3CA07501F9E
	for <lists+linux-doc@lfdr.de>; Mon, 13 Oct 2025 15:09:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C27E53148AD;
	Mon, 13 Oct 2025 14:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OFMBv60X"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854CE313553
	for <linux-doc@vger.kernel.org>; Mon, 13 Oct 2025 14:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760367245; cv=none; b=uFTQD1HGyrddsWdTc488y9Ei6vnFg8wM5CwGvgemheq1smW8CP8KLUgpsrH9vwp1v5FkJKSEFd+JFlJy/Nzg7Cj8Owk88OMKH82OnP1Oygs7vwh5AN5Eg5MiHKykBrqKLmLGiufsrSpb9ecuDi9+su1zNn8j2nYXxW6uizZvfwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760367245; c=relaxed/simple;
	bh=aZBe05rc0MGsCYK4sT5VGwUDz1yniV4yDrd7Hn1NTo8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gp+4sIHGw6TeoWR1yhmZnZfa2Qydk68D0aW+4byC/sYvsL8w3d6e8wNKeCNemg7bJTpGzg7l8yzF2qIE0cuEc5PZXzmubPYDaKQmZ+CEzmFxkvJ1MvBEVGvlCWT/vf/f8DHsBmRHe4Iyqw0zhL6SgiO23A7vMV7Ad7yDKePUuY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OFMBv60X; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-46e6674caa5so22200825e9.0
        for <linux-doc@vger.kernel.org>; Mon, 13 Oct 2025 07:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760367240; x=1760972040; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f2Xy6qVdWrPTN0DdBWw84p2SpFLtW6dghcLsQY6aOfc=;
        b=OFMBv60XD65Qy2+hYXaxL8f+Uhtx0UiACS4GdPHuUsWAGYIB86MgkjIO4QbQBIzHrX
         CkqVhwRQhRWso0+bkuccGLbfSta0AS6eNtngPplp8Et4VczJvUJz1IHN33hCigKJ7pPC
         imeywDtmncHJ54byyPFgtUS3wCJhQkTnC76lr3NT1E/l8dnlkX4wV+CcpJ7fKR0+UJPt
         V2MdH/y324jiAgTDpCGvrfhSHdBiKLDVL/KEfxdqV3OuMnpYaty/spEjSF9VFkx4qVXZ
         tv7LQQv4sby9h0dIdMmr6QJq0umVlqLxmi5b362M88fpfu2deSsEtvfih10YK1B/D4NK
         0FZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760367240; x=1760972040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f2Xy6qVdWrPTN0DdBWw84p2SpFLtW6dghcLsQY6aOfc=;
        b=BYFTCpgf3muFOyqn0JgflfWXnz5ZjyJWCTXqhSpfTusCOFqhJxgnx7v5ipWTfdwnHX
         p9wsIthy/05elqMBRNJpgMedgeFeU7leS+2g7gVUGCnJrHURLM+l/JueuagEYrgOfuKH
         v82zhD3vVW0uSHp+/UaAYZefbUgF0eBQz1tv3wFzekHuW4wC6al/tc4OCcmmoWthL2Xe
         JZOeQRjuRdrhDiPIYwxYPb+iSAqU8p+m8zTTp+muwgj2m8pywa3fAU/YFSx9MHtmjEi4
         yIF9SQWIDAsm3/u/qXdttDV11ISCMUydXtwsU/o9Gujj+yt1r92drozru7jviKAvghBD
         P63Q==
X-Forwarded-Encrypted: i=1; AJvYcCUMZtuJ0GmwF29M0yD/qe7sB+pw9HK4G5EyUT4D1O+FoUmaQY9p55Wa3lgRO19BJOfHUUSrtY7kWd8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwctD5wZjqOpl4w1ka3UALz9NNERp/R03b66A76DKdq1s9vk5xT
	4kTHdUqe7LTXVVUxaKG+XejZV5ZR+vdaC6RR4/hiU9CjO/u5MpbiQgVz
X-Gm-Gg: ASbGncseY5lI3gZPehZ5KugsrMiF9e4hv13YcbQUVR5pvmOzxBJiOp+L63Y92pqDjta
	6p/BeBIbXCN330SMPHbozQiJkifB6dOJvQFJWQxtmXn3eLG3hjqIJZR+AmVdI0TZsCk+9LmwGJq
	50mXKzHKCYOxBwtVkZ1wYgcGyuVuSOPWWT2dx414UCzS0mtw3AIlFI96n2CRGJgm3KoyIDognlP
	RWBWdK2uyr7IERRWzEgqpUurzNv8yapvPs3e/NMTojZRfQc3WxV572lncIdU4SdkirV3IIGCYml
	zduIBGQ2+Gx/7hCxWEz70rli4MPnMeT8nlvIYwj31VaP4yvi52cem6xVfSvLk/be5NFLsEzxIYL
	V5PkIxJHO7x+7Kks/buYwx/oY
X-Google-Smtp-Source: AGHT+IF25ZjCO04KHHq0TYmhTMidbVuQW1ShdxxUvQA1Yprokjlc765D+WOyBbnJX1oGt9SxrNvhcA==
X-Received: by 2002:a05:600c:a411:b0:46e:1b9d:ac6c with SMTP id 5b1f17b1804b1-46fb1f77c2bmr85952605e9.17.1760367239377;
        Mon, 13 Oct 2025 07:53:59 -0700 (PDT)
Received: from 127.com ([2620:10d:c092:600::1:eb09])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5e0e70sm18641085f8f.40.2025.10.13.07.53.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:53:58 -0700 (PDT)
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
Subject: [PATCH net-next v4 20/24] net: wipe the setting of deactived queues
Date: Mon, 13 Oct 2025 15:54:22 +0100
Message-ID: <65dc8bd105e2573b3bd41bd35c73913392590a87.1760364551.git.asml.silence@gmail.com>
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

From: Jakub Kicinski <kuba@kernel.org>

Clear out all settings of deactived queues when user changes
the number of channels. We already perform similar cleanup
for shapers.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Reviewed-by: Mina Almasry <almasrymina@google.com>
Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 net/core/dev.c           |  5 +++++
 net/core/dev.h           |  2 ++
 net/core/netdev_config.c | 13 +++++++++++++
 3 files changed, 20 insertions(+)

diff --git a/net/core/dev.c b/net/core/dev.c
index 5f92425dfdbd..b253e7e29ffa 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -3188,6 +3188,8 @@ int netif_set_real_num_tx_queues(struct net_device *dev, unsigned int txq)
 		if (dev->num_tc)
 			netif_setup_tc(dev, txq);
 
+		netdev_queue_config_update_cnt(dev, txq,
+					       dev->real_num_rx_queues);
 		net_shaper_set_real_num_tx_queues(dev, txq);
 
 		dev_qdisc_change_real_num_tx(dev, txq);
@@ -3233,6 +3235,9 @@ int netif_set_real_num_rx_queues(struct net_device *dev, unsigned int rxq)
 						  rxq);
 		if (rc)
 			return rc;
+
+		netdev_queue_config_update_cnt(dev, dev->real_num_tx_queues,
+					       rxq);
 	}
 
 	dev->real_num_rx_queues = rxq;
diff --git a/net/core/dev.h b/net/core/dev.h
index a203b63198e7..63192dbb1895 100644
--- a/net/core/dev.h
+++ b/net/core/dev.h
@@ -101,6 +101,8 @@ void __netdev_queue_config(struct net_device *dev, int rxq,
 			   struct netdev_queue_config *qcfg, bool pending);
 int netdev_queue_config_revalidate(struct net_device *dev,
 				   struct netlink_ext_ack *extack);
+void netdev_queue_config_update_cnt(struct net_device *dev, unsigned int txq,
+				    unsigned int rxq);
 
 /* netdev management, shared between various uAPI entry points */
 struct netdev_name_node {
diff --git a/net/core/netdev_config.c b/net/core/netdev_config.c
index ede02b77470e..c5ae39e76f40 100644
--- a/net/core/netdev_config.c
+++ b/net/core/netdev_config.c
@@ -64,6 +64,19 @@ int netdev_reconfig_start(struct net_device *dev)
 	return -ENOMEM;
 }
 
+void netdev_queue_config_update_cnt(struct net_device *dev, unsigned int txq,
+				    unsigned int rxq)
+{
+	size_t len;
+
+	if (rxq < dev->real_num_rx_queues) {
+		len = (dev->real_num_rx_queues - rxq) * sizeof(*dev->cfg->qcfg);
+
+		memset(&dev->cfg->qcfg[rxq], 0, len);
+		memset(&dev->cfg_pending->qcfg[rxq], 0, len);
+	}
+}
+
 void __netdev_queue_config(struct net_device *dev, int rxq,
 			   struct netdev_queue_config *qcfg, bool pending)
 {
-- 
2.49.0


