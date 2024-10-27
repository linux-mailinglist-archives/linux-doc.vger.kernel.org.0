Return-Path: <linux-doc+bounces-28771-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 749099B2018
	for <lists+linux-doc@lfdr.de>; Sun, 27 Oct 2024 21:01:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F35E11F21567
	for <lists+linux-doc@lfdr.de>; Sun, 27 Oct 2024 20:01:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B4D017F4F6;
	Sun, 27 Oct 2024 20:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kutsevol-com.20230601.gappssmtp.com header.i=@kutsevol-com.20230601.gappssmtp.com header.b="ChCfa5hl"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7912817C9A3
	for <linux-doc@vger.kernel.org>; Sun, 27 Oct 2024 20:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730059238; cv=none; b=cDumUln6sPznnHkCH7R8PXCmKARBNK2Oi8CknRXh6fdJiojkv4XdrmEjiOwoizIOj0XmK1Fl8SPW3DfmTB0FwOkz2vl8zRpsoHXTlGXNMC4NmLFfX51FyJeZMZ0YWQ68IWLTPFweUMISe3vkYbHBHg7B1RBtmrpH6QGR8oBAJus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730059238; c=relaxed/simple;
	bh=VHhZB28IIwVBWZ2xsaRrLZwKAcbAvIs7KSme+L/DT+4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WAjv0rlC5hR6qtn704D/kZFTMYrPUzke3zlht8puREY3h7tR53Hep1NY84YrFViNOiqxIfo9481E7i+RIzJJ5J7Fwhq8C7rSDaf6sIE7a0iSWfPMRwz7TLxeXJR5mQ4X6XbqXZKfY5AcZLV5KrCOTpyz2oC8g4RNe2e5INubClQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kutsevol.com; spf=none smtp.mailfrom=kutsevol.com; dkim=pass (2048-bit key) header.d=kutsevol-com.20230601.gappssmtp.com header.i=@kutsevol-com.20230601.gappssmtp.com header.b=ChCfa5hl; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kutsevol.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kutsevol.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2e2ed2230d8so2701858a91.0
        for <linux-doc@vger.kernel.org>; Sun, 27 Oct 2024 13:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kutsevol-com.20230601.gappssmtp.com; s=20230601; t=1730059236; x=1730664036; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YENpUKbduqxVuEV/yivX0PhHhOYASce4Ahgx8awj2TE=;
        b=ChCfa5hlncWHU7rRPGYuScBtCxsjDFFGX/o9A+JgbULz70BhIedR0EN3FBKl94Gl1V
         Ixt4ItEIiE93p+njTE1GC1ANiR807WnbF1pCe9+CgXPtEvLM3lNDCBVI+94YSZHP34ad
         D4k+OA7k3HyvL2LHuPN+CGFsRBEEq9+NgFL4mDhb8DLnXsWDT0SqCCAvrVzSeSERQkMo
         DGTV/pVI1ML7w2ngYT6Io1JntxpETdTKRilSdgq8y3wPMF4znoETXvUA76YU/tJgLFn/
         i0mE3Q2pSUhDbL063KYPdk/2DBjau2GdoG3ULAsXu47AA6P8GM8j6cK/auHZAjbMBdz3
         mYXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730059236; x=1730664036;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YENpUKbduqxVuEV/yivX0PhHhOYASce4Ahgx8awj2TE=;
        b=cTR5bVVM+5+k+wJSlXfbkVPradH9D74Nxkw4+qcWtwbfvUDMiuL0JTOeEWgXZtB6o8
         98KAlouOyD9NhWKyaVdU3Sz2kIPncOjuKQnsEUAFKCL75gLSRGW4MED2u0vd+oZwDNMp
         sU0qbq0cjTkd8tWKm4xChO1hV1E2C76i1OgsPH9594yLDzGps023MV9Q1eYVOg/OhKmp
         8DyVItCU6+wUB8mAf1LjSdEsC9smKiTBENyRADP3CSY0ynwokCXtK9+GY8KS+ELSrVOb
         mqjWVyustJSNvk+x4O1ns0S9NEcKLbTXrvXlSX49ZBWe+AOctGAYJBfJhZwJkq2Qe3+Q
         3cfA==
X-Forwarded-Encrypted: i=1; AJvYcCVGU3X1dI4keCyfspbPvQnwy7AQQpYt0creaFdanKuHtxlDWjV05nZmWDnQ5xOA/IOmLYXzjC9qLF4=@vger.kernel.org
X-Gm-Message-State: AOJu0YymLbCWVcmxxiQRuWBL4tp9bpeZ6ZBSJqjLoQ0sZSolsuTAbL6n
	cK7pr0ZY9On2t+wKMUSahmX68PoP5PKWwYewyNoI7X+QvT5/DLjTPooZ0JaIZbA=
X-Google-Smtp-Source: AGHT+IHw4G2h5OhXN7y8gFSZCCL9yGR1i5dt7024b8+0E+2hUOMyvQtNo1/pO5VkO1GIACQasQpNTw==
X-Received: by 2002:a17:90a:c089:b0:2e2:b69c:2a9 with SMTP id 98e67ed59e1d1-2e8f11ac969mr7039524a91.26.1730059235675;
        Sun, 27 Oct 2024 13:00:35 -0700 (PDT)
Received: from localhost.localdomain (fwdproxy-ash-017.fbsv.net. [2a03:2880:20ff:11::face:b00c])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-461321431a1sm27946241cf.25.2024.10.27.13.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 13:00:35 -0700 (PDT)
From: Maksym Kutsevol <max@kutsevol.com>
Date: Sun, 27 Oct 2024 12:59:41 -0700
Subject: [PATCH net-next v4 1/2] netpoll: Make netpoll_send_udp return
 status instead of void
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241027-netcons-add-udp-send-fail-statistics-to-netconsole-v4-1-a8065a43c897@kutsevol.com>
References: <20241027-netcons-add-udp-send-fail-statistics-to-netconsole-v4-0-a8065a43c897@kutsevol.com>
In-Reply-To: <20241027-netcons-add-udp-send-fail-statistics-to-netconsole-v4-0-a8065a43c897@kutsevol.com>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 Breno Leitao <leitao@debian.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Maksym Kutsevol <max@kutsevol.com>
X-Mailer: b4 0.13.0

netpoll_send_udp can return if send was successful.
It will allow client code to be aware of the send status.

Possible return values are the result of __netpoll_send_skb (cast to int)
and -ENOMEM. This doesn't cover the case when TX was not successful
instantaneously and was scheduled for later, __netpoll__send_skb returns
success in that case.

Signed-off-by: Maksym Kutsevol <max@kutsevol.com>
---
 include/linux/netpoll.h | 2 +-
 net/core/netpoll.c      | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/netpoll.h b/include/linux/netpoll.h
index cd4e28db0cbd..b1ba8d6331a5 100644
--- a/include/linux/netpoll.h
+++ b/include/linux/netpoll.h
@@ -56,7 +56,7 @@ static inline void netpoll_poll_disable(struct net_device *dev) { return; }
 static inline void netpoll_poll_enable(struct net_device *dev) { return; }
 #endif
 
-void netpoll_send_udp(struct netpoll *np, const char *msg, int len);
+int netpoll_send_udp(struct netpoll *np, const char *msg, int len);
 void netpoll_print_options(struct netpoll *np);
 int netpoll_parse_options(struct netpoll *np, char *opt);
 int __netpoll_setup(struct netpoll *np, struct net_device *ndev);
diff --git a/net/core/netpoll.c b/net/core/netpoll.c
index 94b7f07a952f..1f36f351b5f9 100644
--- a/net/core/netpoll.c
+++ b/net/core/netpoll.c
@@ -390,7 +390,7 @@ netdev_tx_t netpoll_send_skb(struct netpoll *np, struct sk_buff *skb)
 }
 EXPORT_SYMBOL(netpoll_send_skb);
 
-void netpoll_send_udp(struct netpoll *np, const char *msg, int len)
+int netpoll_send_udp(struct netpoll *np, const char *msg, int len)
 {
 	int total_len, ip_len, udp_len;
 	struct sk_buff *skb;
@@ -414,7 +414,7 @@ void netpoll_send_udp(struct netpoll *np, const char *msg, int len)
 	skb = find_skb(np, total_len + np->dev->needed_tailroom,
 		       total_len - len);
 	if (!skb)
-		return;
+		return -ENOMEM;
 
 	skb_copy_to_linear_data(skb, msg, len);
 	skb_put(skb, len);
@@ -490,7 +490,7 @@ void netpoll_send_udp(struct netpoll *np, const char *msg, int len)
 
 	skb->dev = np->dev;
 
-	netpoll_send_skb(np, skb);
+	return (int)netpoll_send_skb(np, skb);
 }
 EXPORT_SYMBOL(netpoll_send_udp);
 

-- 
2.43.5


