Return-Path: <linux-doc+bounces-63107-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD0BBD3E4F
	for <lists+linux-doc@lfdr.de>; Mon, 13 Oct 2025 17:08:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E9BE234DF56
	for <lists+linux-doc@lfdr.de>; Mon, 13 Oct 2025 15:08:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01E2E313547;
	Mon, 13 Oct 2025 14:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZMPj6k4J"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898C4313271
	for <linux-doc@vger.kernel.org>; Mon, 13 Oct 2025 14:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760367240; cv=none; b=JXVho9b/VxC5TIq3lZQLx0/Kwt8BwhixudkgVUC0/wMbvxQE9ZkWE/tB6vSLUtuibhEL1QgmyJ4WASl7JvMgLcWhTk2CRmuSbQPvpLjy3Lo+MrAWcHlrVIr9avcD3P9+MxSfMQJ7n2Cgv7JFUaC0wb11et0adbmD8WUPUOiAkU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760367240; c=relaxed/simple;
	bh=b8FGPOYez3J824Dr7qxiyxcRaNo5kRct9HxQwv0g5HI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tbvFFnURpoJz7IVrtSKaf5XWr/CCixlOP4GhEVhp3bJiAs0PeDXHVkYk5rPI6yJOaxK1NNDGr8m3Iyk11OwrZreIeWp4rjEZyAbEU5XTr/6AcWIVyifWuPXW6pI1IBjK85f/RUe9zwSEZlmqwAerkzaeozQBxoOtdhDgRGIehA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZMPj6k4J; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3fc36b99e92so3810341f8f.0
        for <linux-doc@vger.kernel.org>; Mon, 13 Oct 2025 07:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760367236; x=1760972036; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pxHRXya3lXGBnReUxXIEEoBgDfJjb/lzzOFKtNAVoFE=;
        b=ZMPj6k4J7AH41Cm38BsKO3Hkad0NDoCGKeEHI1MakyrzvfEQmya8BdeCJSTKEr1SjZ
         /2ts1XC9SUG89Id0fxjQ8f18w3FMAWA8wRXS3GZtAo64sot9AaP1R+uMsklLLQqA0eca
         7Tq+jSV67uc1ujmy9K70ozYUXppTPVCw9QzWvzJhXAlGjgXBkRfsTVFcyqB+eyjn9fhT
         kx0WLzd0Z5FZjHXZ2kggYZ10G1aYjeuumIpCAUG3cVnmsmp1r2o8VnIGkM3rMjbE6ZYO
         KXdmX78lZGBAyVluvum3LM6xcqZK7xSbfLcmdXnG48/99TPFv+u4/hbPCtLf6hQVOMcc
         NlXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760367236; x=1760972036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pxHRXya3lXGBnReUxXIEEoBgDfJjb/lzzOFKtNAVoFE=;
        b=DiIp3jgBKjkaRi7WQnAqx7+4s5B+DFBBoB8LvtCWBQhhyvLnvlQES+9vKDy01pVZ7j
         AAjJO5uxqffikugpNr3ReUzsLaPfQJ6vw/OL7u9rzIVXlVx3iHPzb10gZc6rZLtvDazx
         +ukCOOE0o1jGa9/YOAu6hJRSkfUPD8v4u4SpRf40bwyuSBucHTzGXtgNoUDLfB6fTbae
         RNCo2AK5Gvhqwjoqmk5Sf9kCX0rIT64uTKIKa24vaqCDlPsZ1m1m7HTXuy/vpilJOHRV
         IxY+p/hxWVwPHDjuYM32VWQmb2kBrHbzGvZIZYJeH3R9OFUXUolJYCBkGqElJtP43N7u
         junA==
X-Forwarded-Encrypted: i=1; AJvYcCVonzSvkEO15Eijms9Teu+y4esssOHgNNPHzLRDJ6hbG8fHBKBoZzXRON+IF8XGs8pN72w4ij5vzrk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzguahJLuXv2Cw/oF0byzuXATQsjIIG8JlCV6snv+NmUXQJfKCP
	MtXf++zYCi64jB2Q11/W3yrIOXSvsBGrtSGHSI4QTYitdGNzI478peh8
X-Gm-Gg: ASbGncvolZBPUD2nK/JR34nE9zAMXUgpRdsYtS4Ie82qx0lZzQJ9/Cvdp0TrPKLHTx9
	gqtEyFPne2GB5X0ngWQGpjqBnnE8jLLogoApp3SJgdo7X5XC1Wi/5yzZpkVywZAnrKQm3eiNun0
	cYaqBnymtp29satpVvzeh7rdQqpTg+OCuJXW5wRB0asjIMcgIDo1AAqSehF8IzFnSkwDIpaet4n
	lPJ+3JgHprfAhUt1Dqn8ixy1fF7ZofEhlp7lxy2QUkG3p7IpObXeyWKLooE+5SAOeR5jwIBECED
	7lKV+ML/2ePo1um4YHpm01WJLY20BoasyLnC0XvQ07L/Pq9XDvBzit39S7CokAlBprSdtCnp6xs
	sudl8TGnBjjUypKDYCDsJhJe5
X-Google-Smtp-Source: AGHT+IG0JaMqrygloaBo/Hgni68I4c0N36CFgBnj1m1GOH+xECQ5fun7HUBRPJc+Mht1oZD+K4qurw==
X-Received: by 2002:a05:6000:2502:b0:425:86da:325f with SMTP id ffacd0b85a97d-4266e7cf047mr15243982f8f.27.1760367235639;
        Mon, 13 Oct 2025 07:53:55 -0700 (PDT)
Received: from 127.com ([2620:10d:c092:600::1:eb09])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5e0e70sm18641085f8f.40.2025.10.13.07.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:53:54 -0700 (PDT)
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
Subject: [PATCH net-next v4 18/24] eth: bnxt: adjust the fill level of agg queues with larger buffers
Date: Mon, 13 Oct 2025 15:54:20 +0100
Message-ID: <6c14fdceadaf7fb8e81584aec551c9a9fddc6625.1760364551.git.asml.silence@gmail.com>
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

The driver tries to provision more agg buffers than header buffers
since multiple agg segments can reuse the same header. The calculation
/ heuristic tries to provide enough pages for 65k of data for each header
(or 4 frags per header if the result is too big). This calculation is
currently global to the adapter. If we increase the buffer sizes 8x
we don't want 8x the amount of memory sitting on the rings.
Luckily we don't have to fill the rings completely, adjust
the fill level dynamically in case particular queue has buffers
larger than the global size.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
[pavel: rebase on top of agg_size_fac, assert agg_size_fac]
Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 drivers/net/ethernet/broadcom/bnxt/bnxt.c | 28 +++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
index e4dba91332ae..1741aeffee55 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -3816,16 +3816,34 @@ static void bnxt_free_rx_rings(struct bnxt *bp)
 	}
 }
 
+static int bnxt_rx_agg_ring_fill_level(struct bnxt *bp,
+				       struct bnxt_rx_ring_info *rxr)
+{
+	/* User may have chosen larger than default rx_page_size,
+	 * we keep the ring sizes uniform and also want uniform amount
+	 * of bytes consumed per ring, so cap how much of the rings we fill.
+	 */
+	int fill_level = bp->rx_agg_ring_size;
+
+	if (rxr->rx_page_size > bp->rx_page_size)
+		fill_level /= rxr->rx_page_size / bp->rx_page_size;
+
+	return fill_level;
+}
+
 static int bnxt_alloc_rx_page_pool(struct bnxt *bp,
 				   struct bnxt_rx_ring_info *rxr,
 				   int numa_node)
 {
-	const unsigned int agg_size_fac = PAGE_SIZE / BNXT_RX_PAGE_SIZE;
+	unsigned int agg_size_fac = rxr->rx_page_size / BNXT_RX_PAGE_SIZE;
 	const unsigned int rx_size_fac = PAGE_SIZE / SZ_4K;
 	struct page_pool_params pp = { 0 };
 	struct page_pool *pool;
 
-	pp.pool_size = bp->rx_agg_ring_size / agg_size_fac;
+	if (WARN_ON_ONCE(agg_size_fac == 0))
+		agg_size_fac = 1;
+
+	pp.pool_size = bnxt_rx_agg_ring_fill_level(bp, rxr) / agg_size_fac;
 	if (BNXT_RX_PAGE_MODE(bp))
 		pp.pool_size += bp->rx_ring_size / rx_size_fac;
 
@@ -4403,11 +4421,13 @@ static void bnxt_alloc_one_rx_ring_netmem(struct bnxt *bp,
 					  struct bnxt_rx_ring_info *rxr,
 					  int ring_nr)
 {
+	int fill_level, i;
 	u32 prod;
-	int i;
+
+	fill_level = bnxt_rx_agg_ring_fill_level(bp, rxr);
 
 	prod = rxr->rx_agg_prod;
-	for (i = 0; i < bp->rx_agg_ring_size; i++) {
+	for (i = 0; i < fill_level; i++) {
 		if (bnxt_alloc_rx_netmem(bp, rxr, prod, GFP_KERNEL)) {
 			netdev_warn(bp->dev, "init'ed rx ring %d with %d/%d pages only\n",
 				    ring_nr, i, bp->rx_agg_ring_size);
-- 
2.49.0


