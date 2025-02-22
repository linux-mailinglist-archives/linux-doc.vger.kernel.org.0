Return-Path: <linux-doc+bounces-39082-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6AEA40B57
	for <lists+linux-doc@lfdr.de>; Sat, 22 Feb 2025 20:19:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 242977AA15E
	for <lists+linux-doc@lfdr.de>; Sat, 22 Feb 2025 19:17:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BED6E218858;
	Sat, 22 Feb 2025 19:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3vhCkRvu"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33892153EA
	for <linux-doc@vger.kernel.org>; Sat, 22 Feb 2025 19:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740251735; cv=none; b=bBZs2UQqZJN1enhU3ck1DQFnV4paH+ZvcUoNV9r7z2+x+17jUjZNpl5MOHmi7BUtWvtObn9OWpxbEAWvruBjfO87/hqIRgilZZuchoZggBYGMHX+tOrXkWiY4WfVGhLpFRT36RkR2tExDos0Bfiqo3LyvjCLDfMsUXmZ4+ro61g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740251735; c=relaxed/simple;
	bh=S4WIdcIymEnObCKW8hFtjmYPsUwr3C9vEUbedDCBePY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fr1hX8xL9/qikpX9MJPHX4aASHPOYZ82hCrXVy0Tu6E82/4eH0lAXjRXcvMJBEOGF0xaPR588NiORpkddHi0czViXH8F49GiJzOCP9lqOJSvDKjmM/Anpsv0+3w6BO4tS/SMBlN7+oXVF/Up3Qp6WtMKD7bRmZraXLEzjcR6G24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3vhCkRvu; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2f816a85facso6753748a91.3
        for <linux-doc@vger.kernel.org>; Sat, 22 Feb 2025 11:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740251732; x=1740856532; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=biWDWCpFQb1l1Z/yT0zgxnecEVUj+cBj8CVtcecqD6k=;
        b=3vhCkRvu9ODATAHeq172b5LYMXdSmSzPyrHBeonxWdVs0zR0wvYWtpdn05MjErEjrb
         U3iAxI/fqMS0Be3gPk7aMcwgRQ28JmeDnf5JcZ1Z4XhneCdTcRMpLU/JmMje/2zkS7nW
         D+nUiFYiXJcrjMNc/J/Ufda9gynSdCBMArhnTQ/WHB3+xig5pnxtfMav9t+yfZogPHpx
         vw3Y96nrkYccbLoEEN5Lr8e2w62doHQngW2LXparGfL/ETIOkQRqEanKZl8JtPyR2VUw
         1YTeASmCrCtpHzxPCZmkf+ZSoKGiLD2RtnktUqM1aZ//mFZ1TEq4q5kb9S8A+wGr/Lt+
         MwlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740251732; x=1740856532;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=biWDWCpFQb1l1Z/yT0zgxnecEVUj+cBj8CVtcecqD6k=;
        b=jNMzEVMudPugxxAKrQZjCD7tDbQjH4uZe5o+5px7anHHTU0MWwuU1F9C26theRRd/s
         wNPT6ujTk5JDsF2SG57xgiw+jQ2see6AqUwmu5LR74Ddz7ZITZ5s7rWj74sWN3PIN+o1
         cPlftJTcNdgoj3shPMWm1djT6h9DmsT0PGGHVnWIlLFsH/yDrtRs6PpVRP4yN3Zp90pz
         YNu64delS4E9LG2F6nBd3s55CdLNYnww92KmgL4eVNohLi5JAn6KaQFkyR+oI8I0B1tB
         5tYP2rWlZqEu5ACYYf2BCpWw6SQ8S0G2Txi4N7beNfEF2tZPcy6rYSBUmVMwY2/N9vLO
         NK4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUHOOh2tf1UW1YGAcSj0pfdjk51DHflVLpsUJ0oGmbn8uuEodT9ojNv+KDf8aUTvxp5x760k1zK7yQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPvLQn/vi1pxaEGFJNr0jX/QqJzkmmNz85wopJCmU2zIeRJ/jL
	4tTILhiUMr/sg0n8nP4uO2RNKkuqFZ706Ewu1KumOFNGDfDZOnD42wJECkYVJYe45o8nhFpA7/j
	EDIhk+pFLeFPzzOnzFhl3Lw==
X-Google-Smtp-Source: AGHT+IF3RH6VzHVCehHRbpJJLJjV+rVcxv8rDd/2+CtDFFrrVHzDHLPS8NaJht7KEp7lWFwHwxhOI4KSFp5QbSD+AA==
X-Received: from pjbdj7.prod.google.com ([2002:a17:90a:d2c7:b0:2fc:2b96:2d4b])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3b4a:b0:2fa:1a8a:cffc with SMTP id 98e67ed59e1d1-2fce875d403mr10219694a91.34.1740251732332;
 Sat, 22 Feb 2025 11:15:32 -0800 (PST)
Date: Sat, 22 Feb 2025 19:15:15 +0000
In-Reply-To: <20250222191517.743530-1-almasrymina@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250222191517.743530-1-almasrymina@google.com>
X-Mailer: git-send-email 2.48.1.601.g30ceb7b040-goog
Message-ID: <20250222191517.743530-8-almasrymina@google.com>
Subject: [PATCH net-next v5 7/9] gve: add netmem TX support to GVE DQO-RDA mode
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, virtualization@lists.linux.dev, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org
Cc: Mina Almasry <almasrymina@google.com>, Donald Hunter <donald.hunter@gmail.com>, 
	Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Jeroen de Borst <jeroendb@google.com>, Harshitha Ramamurthy <hramamurthy@google.com>, 
	Kuniyuki Iwashima <kuniyu@amazon.com>, Willem de Bruijn <willemb@google.com>, David Ahern <dsahern@kernel.org>, 
	Neal Cardwell <ncardwell@google.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
	Stefano Garzarella <sgarzare@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	"=?UTF-8?q?Eugenio=20P=C3=A9rez?=" <eperezma@redhat.com>, Shuah Khan <shuah@kernel.org>, sdf@fomichev.me, 
	asml.silence@gmail.com, dw@davidwei.uk, Jamal Hadi Salim <jhs@mojatatu.com>, 
	Victor Nogueira <victor@mojatatu.com>, Pedro Tammela <pctammela@mojatatu.com>, 
	Samiullah Khawaja <skhawaja@google.com>
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
index 029be8342b7b..0f11c8455149 100644
--- a/drivers/net/ethernet/google/gve/gve_main.c
+++ b/drivers/net/ethernet/google/gve/gve_main.c
@@ -2817,6 +2817,10 @@ static int gve_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
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
index 394debc62268..e74580dc7ebe 100644
--- a/drivers/net/ethernet/google/gve/gve_tx_dqo.c
+++ b/drivers/net/ethernet/google/gve/gve_tx_dqo.c
@@ -667,7 +667,8 @@ static int gve_tx_add_skb_no_copy_dqo(struct gve_tx_ring *tx,
 			goto err;
 
 		dma_unmap_len_set(pkt, len[pkt->num_bufs], len);
-		dma_unmap_addr_set(pkt, dma[pkt->num_bufs], addr);
+		netmem_dma_unmap_addr_set(skb_frag_netmem(frag), pkt,
+					  dma[pkt->num_bufs], addr);
 		++pkt->num_bufs;
 
 		gve_tx_fill_pkt_desc_dqo(tx, desc_idx, skb, len, addr,
@@ -1045,8 +1046,9 @@ static void gve_unmap_packet(struct device *dev,
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
2.48.1.601.g30ceb7b040-goog


