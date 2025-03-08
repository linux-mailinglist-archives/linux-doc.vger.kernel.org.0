Return-Path: <linux-doc+bounces-40283-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0D5A57EDF
	for <lists+linux-doc@lfdr.de>; Sat,  8 Mar 2025 22:43:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F401A166849
	for <lists+linux-doc@lfdr.de>; Sat,  8 Mar 2025 21:43:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77E03216E3E;
	Sat,  8 Mar 2025 21:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yfozbKL7"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oo1-f73.google.com (mail-oo1-f73.google.com [209.85.161.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120522163A1
	for <linux-doc@vger.kernel.org>; Sat,  8 Mar 2025 21:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741470062; cv=none; b=lmWuUcmhkt+8eNWMJDXUhKI32erlUqwnm8nffuzJiPB2THinE+hfFiIOf3tfy4wcVYltKn6dDcTaPmxIs7WhXrdtIdFBc5QaSzApo7JXPO1OSAtkQAY82hMXoD4z8aqmTnLzGJPb6AjPUWSM+D3/mLNrzZ+OIIVtMwH2vxSLTR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741470062; c=relaxed/simple;
	bh=gHHNZtQlI1ho4RJZpoBeZXSIeWU2nyDxuNd9wfJYYzs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=R2+ebpmU8xbyNlY9pWYiZB+eWf8x7pl8/yGg7jebQaaVplSJTwcvrf5vrAfXyVgy7GymeKAUJkgDqGNGAymwJ1MleawDHr3UK+SEW0nsO/K78yzafSvn6MEMYTezSFB+/+CE04qdz00chSbxDtZV73WUWg1ySfKAsRms88e/KBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yfozbKL7; arc=none smtp.client-ip=209.85.161.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Received: by mail-oo1-f73.google.com with SMTP id 006d021491bc7-6005d54615dso540465eaf.2
        for <linux-doc@vger.kernel.org>; Sat, 08 Mar 2025 13:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741470059; x=1742074859; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8MBZgO9/mMLxEqMacEbQemluc92d4gH7fDKPm4qz0ro=;
        b=yfozbKL7eN1ZxKNLGVCZ0T8OnLZQnN5qpz0YtFGm6BBF4limlekcg8TdoWS+IYQJmJ
         XhNaGhCeaj40GcgIktp9kdpoc4UwghS5Bqk0CznleyFcn28dTHtLg63cd24IdPyV/8Kg
         v/YuBQa2Ng6tPyIcj9kPjoMujaDPWQM28Y4zXGRcmMgZC5oLgvgG12ZgdxRh7kXK/XUk
         BXCXJV+tf5KztXhcv6ieDzodhZ606wMcqzCHcocOXvWogRbh6NTIDXDIyrJawvHYouiV
         vIDMA5FNeC7mHEizaClb5moqFYQ81vDcHE5BQi+Nv17hAcm1XYNrgrSt8wvXNzd/otjh
         gVWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741470059; x=1742074859;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8MBZgO9/mMLxEqMacEbQemluc92d4gH7fDKPm4qz0ro=;
        b=O1ujm3p+Yx7uMFBZW5L3YB+dcldJX+H/mMVJok05Sh9iGWGfA+gcoVR6mjzb0cdPSI
         zwbPn3+P7wCPy43tKaSmEJ6b9yMWTlRSuLrjIOYc1X0WDGjH9muZoXnUQD8WeF0iFO3v
         +iPwufTTJCeeE96jbJitbUemBNqRapWtvzk6L/iJXq7ed8NxkIkUMb76wJrBJF+ajUBV
         cOWr+mQou392EFRsKw6iAAE+p3RqPP9T3MeQm/LTRWW7z5v/4Y0/OaKJHt9LHC9bpIiZ
         Mh43+KiQD0vBqZ2Z8cKI6EFJcEvwjmWsOz5J/gdU/tAmWpB8/XvVxKQNcnPoG46T/rAY
         XMCA==
X-Forwarded-Encrypted: i=1; AJvYcCXlvLlZBfhnZIaWGrOzMfpmRi8wF2ePhKe6CP3QFpGDyE8fR4Z6nG6baxGRXs8n8iLH6KAm/FSutEI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbmmeUTfroeZSPCww6jjSJjAm2VAnUhLFuH2DbsYpvi/qfqbaF
	1NAU47iAoNudLF/i+Drs/qsRnwQ7plHR0HJJedgrKC8k9iGjR54ggB7qir4KTlGG1VATmcF+IXS
	47LUH76koXAgwRtI0gkmqDg==
X-Google-Smtp-Source: AGHT+IGTSt/plByX/+92dhEDUet8TI73ntJDZTnO/NP8eEfo8nhvCGID+mTdHpAuMZUG8Bn86E6QbOxlIYhAKteIYA==
X-Received: from oablw17.prod.google.com ([2002:a05:6870:8e11:b0:2c1:64e4:adb9])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6870:4d12:b0:2bc:66cc:1507 with SMTP id 586e51a60fabf-2c2610714b7mr4380461fac.12.1741470058886;
 Sat, 08 Mar 2025 13:40:58 -0800 (PST)
Date: Sat,  8 Mar 2025 21:40:43 +0000
In-Reply-To: <20250308214045.1160445-1-almasrymina@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250308214045.1160445-1-almasrymina@google.com>
X-Mailer: git-send-email 2.49.0.rc0.332.g42c0ae87b1-goog
Message-ID: <20250308214045.1160445-8-almasrymina@google.com>
Subject: [PATCH net-next v7 7/9] gve: add netmem TX support to GVE DQO-RDA mode
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, kvm@vger.kernel.org, 
	virtualization@lists.linux.dev, linux-kselftest@vger.kernel.org
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
index 6dcdcaf518f4..4e95aee1bb4c 100644
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
2.49.0.rc0.332.g42c0ae87b1-goog


