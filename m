Return-Path: <linux-doc+bounces-43274-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 21290A8AB8D
	for <lists+linux-doc@lfdr.de>; Wed, 16 Apr 2025 00:50:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3576917C39D
	for <lists+linux-doc@lfdr.de>; Tue, 15 Apr 2025 22:50:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7BF52C2AA2;
	Tue, 15 Apr 2025 22:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3kXIV5mn"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643142D1F46
	for <linux-doc@vger.kernel.org>; Tue, 15 Apr 2025 22:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744757291; cv=none; b=qAYCMYwwakw6ZKQ+jBco04I5S3+sVTNnnPjDo+cWjbzwgYFn08kqAVQiJfyJrQ8u70X2bpu0iPdhSetA59CCDqPT8N8icIPVT5o4e0cXLc2nSRrYF9y0kOchnvtFn0M2whAZgNycQ0FGYFct/p1kHnxhqYzTKtwawE46kzgbvaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744757291; c=relaxed/simple;
	bh=Cqzn0jIx+ICXy20erkdmco/hDp3aOf21xpNbmkO7QhI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GUhtnXDevet5MqHt/nKUoDscI2qYzvcEzVjcSQfMWrE1uAy/9u6osNm3CKYjflUoJkApx66BUJUvihPYpH32jTjM7tPKeZDH2D2GEC3rEVeb+42IeE3NeuvmAayMfW/8BVi6AppsgQFfgq1H1gJbzaO16bZcH0+asENoXP2x4X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3kXIV5mn; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-73917303082so3992061b3a.3
        for <linux-doc@vger.kernel.org>; Tue, 15 Apr 2025 15:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744757289; x=1745362089; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5Y0gt4KGR4y8gxIG8GX1gRAmwKzn/ocefSDNpr0C4Oc=;
        b=3kXIV5mnKO5VpqEaBODRszdZqoMY0FbDDCZCWlhmyJjxgvYgxfbo6uHL4/LUMWAxuD
         wEjQ5v+BSKJmp2r85VBN4BP0g1g6/xNNiZ+wrB3GFPxEXCfEc9qjvoaAcdbcPAoEWcyW
         LjsG0+2FVOybX8rmEuFEJ60Id5BYtKaNA4dG8u9+DvOwGouRe7En31p2sfnysW8bVUEx
         nTNcPSgB4u4JmOoGCihAW8cv8stL1PxexuhBNSbYHBOIoJ1oaNTyi9gS2xudQ9F3cZUU
         ZHkP+7TzpZBjHZy1P/WlGkT0m6PDzIHT4z2k4HCE2pM2Tsl3o8XsS7lxKA/XI/AQhBpp
         ZA8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744757289; x=1745362089;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5Y0gt4KGR4y8gxIG8GX1gRAmwKzn/ocefSDNpr0C4Oc=;
        b=NBwXtqjqcLH62LiAVybA4d6mKAIwI9UPwb1HPbzU0QW4p5Pakfjsk2nWRRa51TxcMq
         2TnVjXtp8nxb7qhk5hGVukzeHEEFVFVXKGr8Nqcz+DtnFFRRfIadgX/0ytnGhjuBqifz
         rJD3fqQ4mvdi/sLJ/jxwOIhYTbnPNL3GF8NK/5LAkrTblTBA17kx1yX0zsomKaH5Pue+
         cFxdCMnWvhBtaNGbvZ0gZ4n1twlnilvflBRWz76MLwGdac2tfho7lxexP2LHO1P9McA5
         2mGxY2htyFVn7Rg4xSEt3JtQPNb8qyKgjfXGETPGKeNinGTgnUGyfjEy2oJgIochs0BH
         14qg==
X-Forwarded-Encrypted: i=1; AJvYcCWYIhlbdkYQi1452SUM+rLXELWTVP79AZnCtWVQC9CocVDemCNS0vIWiFE+mp6PwF+7Seho6xgfoeI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcCvnC3D/uwV6e90vIE4uSKPUVgq+cWCxgVTZDfbZMpaIXqIb7
	c3aHpgeJFFRxWW0dfQUqROI/vMo7RkRdir/7jxAPhlSr4/SiJm2coSxN47wPHhH9XrIMl5pddgd
	8bDKIrHDHHqVoWpP9pbq1hg==
X-Google-Smtp-Source: AGHT+IG5NdGfYD5N9W8W7UHWdGCQl03DIg/olddW2S6Vpl+mwIRiJnb8xyrZV4MMvX8nbx7uCAGqaaZxX+2uVhCWMg==
X-Received: from pfbi30.prod.google.com ([2002:a05:6a00:af1e:b0:736:4313:e6bc])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:21c4:b0:730:9946:5973 with SMTP id d2e1a72fcca58-73c1f8c6c69mr1778523b3a.5.1744757288544;
 Tue, 15 Apr 2025 15:48:08 -0700 (PDT)
Date: Tue, 15 Apr 2025 22:47:54 +0000
In-Reply-To: <20250415224756.152002-1-almasrymina@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250415224756.152002-1-almasrymina@google.com>
X-Mailer: git-send-email 2.49.0.777.g153de2bbd5-goog
Message-ID: <20250415224756.152002-7-almasrymina@google.com>
Subject: [PATCH net-next v8 7/9] gve: add netmem TX support to GVE DQO-RDA mode
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, io-uring@vger.kernel.org, kvm@vger.kernel.org, 
	virtualization@lists.linux.dev, linux-kselftest@vger.kernel.org
Cc: Mina Almasry <almasrymina@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Donald Hunter <donald.hunter@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Jeroen de Borst <jeroendb@google.com>, Harshitha Ramamurthy <hramamurthy@google.com>, 
	Kuniyuki Iwashima <kuniyu@amazon.com>, Willem de Bruijn <willemb@google.com>, Jens Axboe <axboe@kernel.dk>, 
	Pavel Begunkov <asml.silence@gmail.com>, David Ahern <dsahern@kernel.org>, 
	Neal Cardwell <ncardwell@google.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
	Stefano Garzarella <sgarzare@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	"=?UTF-8?q?Eugenio=20P=C3=A9rez?=" <eperezma@redhat.com>, Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Use netmem_dma_*() helpers in gve_tx_dqo.c DQO-RDA paths to
enable netmem TX support in that mode.

Declare support for netmem TX in GVE DQO-RDA mode.

Signed-off-by: Mina Almasry <almasrymina@google.com>

---

v4:
- New patch
---
 drivers/net/ethernet/google/gve/gve_main.c   | 4 ++++
 drivers/net/ethernet/google/gve/gve_tx_dqo.c | 8 +++++---
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/google/gve/gve_main.c b/drivers/net/ethernet/google/gve/gve_main.c
index 8aaac9101377..430314225d4d 100644
--- a/drivers/net/ethernet/google/gve/gve_main.c
+++ b/drivers/net/ethernet/google/gve/gve_main.c
@@ -2665,6 +2665,10 @@ static int gve_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	dev_info(&pdev->dev, "GVE version %s\n", gve_version_str);
 	dev_info(&pdev->dev, "GVE queue format %d\n", (int)priv->queue_format);
+
+	if (!gve_is_gqi(priv) && !gve_is_qpl(priv))
+		dev->netmem_tx = true;
+
 	gve_clear_probe_in_progress(priv);
 	queue_work(priv->gve_wq, &priv->service_task);
 	return 0;
diff --git a/drivers/net/ethernet/google/gve/gve_tx_dqo.c b/drivers/net/ethernet/google/gve/gve_tx_dqo.c
index 2eba868d8037..a27f1574a733 100644
--- a/drivers/net/ethernet/google/gve/gve_tx_dqo.c
+++ b/drivers/net/ethernet/google/gve/gve_tx_dqo.c
@@ -660,7 +660,8 @@ static int gve_tx_add_skb_no_copy_dqo(struct gve_tx_ring *tx,
 			goto err;
 
 		dma_unmap_len_set(pkt, len[pkt->num_bufs], len);
-		dma_unmap_addr_set(pkt, dma[pkt->num_bufs], addr);
+		netmem_dma_unmap_addr_set(skb_frag_netmem(frag), pkt,
+					  dma[pkt->num_bufs], addr);
 		++pkt->num_bufs;
 
 		gve_tx_fill_pkt_desc_dqo(tx, desc_idx, skb, len, addr,
@@ -1038,8 +1039,9 @@ static void gve_unmap_packet(struct device *dev,
 	dma_unmap_single(dev, dma_unmap_addr(pkt, dma[0]),
 			 dma_unmap_len(pkt, len[0]), DMA_TO_DEVICE);
 	for (i = 1; i < pkt->num_bufs; i++) {
-		dma_unmap_page(dev, dma_unmap_addr(pkt, dma[i]),
-			       dma_unmap_len(pkt, len[i]), DMA_TO_DEVICE);
+		netmem_dma_unmap_page_attrs(dev, dma_unmap_addr(pkt, dma[i]),
+					    dma_unmap_len(pkt, len[i]),
+					    DMA_TO_DEVICE, 0);
 	}
 	pkt->num_bufs = 0;
 }
-- 
2.49.0.777.g153de2bbd5-goog


