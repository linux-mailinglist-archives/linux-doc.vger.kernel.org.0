Return-Path: <linux-doc+bounces-80284-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGKrL42ivGkI1wIAu9opvQ
	(envelope-from <linux-doc+bounces-80284-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 20 Mar 2026 02:27:41 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 833162D4B9B
	for <lists+linux-doc@lfdr.de>; Fri, 20 Mar 2026 02:27:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0805A3040FAB
	for <lists+linux-doc@lfdr.de>; Fri, 20 Mar 2026 01:26:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEE5C312819;
	Fri, 20 Mar 2026 01:25:19 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB872305057
	for <linux-doc@vger.kernel.org>; Fri, 20 Mar 2026 01:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773969919; cv=none; b=rTqdXtF7RX8C8k5TpuxAkiz9pUZtflwiA1SZtrNK1gH9MCwij+emfmVCaDHJs4QPPmNt/m83scaxxNlLoPm3fMa/U8CPuH/RRNLom3dwPnrGFDw4bVGWHpjyJxedSf4Etz+JZW4pGkZ0AyjejMGY9HqzqhpdEl1ApNI0PElQAVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773969919; c=relaxed/simple;
	bh=FkE3aEmYq3JFi5GpqJgM6OBmxi48BQXX3kwNVt8fzXo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F3H/eHIznixNEiosj1NNXmAa4P6CKbvohW4cVKhpRgrikkzaXD7eAwuiq3cGw+mnREbH1D2csSxTCZIlDIvA7S3XLppMXCjenim2szqmIVqE4oLoXLOOD7kgJ2DLgD7Z+2H/e4YNmaRjhA8YS0dUS7J0uWVam1mxJFcFrxvX+14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fomichev.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fomichev.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2c0ecaae7dfso2572912eec.1
        for <linux-doc@vger.kernel.org>; Thu, 19 Mar 2026 18:25:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773969916; x=1774574716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RnwqqwAxnRG8s2vaRYDrbUdfVznpcDcr1raRDlnvaSE=;
        b=FfA0bW06aIl6Y4NOcMPz/SmamPYWhTYmTcybFpfQJ+88QdDOcsoduIaZspaYXBevRT
         Vd5n/PeFVldhx8cPLOyprlObZj8/PDHvdxCCriOPkOmTLqdYBI67g7ltvUkJkOeMc+KR
         hU/5xbkCar1Ru5bvvf9Xg9fB7FBYUVEijitpieNQXrNNY5OK/n6NaVx9/30CJ04rWvea
         u5kEm0iLzNaKVYAmlIUaG6S5yE/vDr3Bqh5r8R3ghYbeGhPkfNg2YG2KSOvS2DlDNfFX
         tRnnopfgt/FMS4GfQRbotTxzA+zI+R78AjT17xFCEVR+F8+c1msgsTRVIPu7V3rh4Vcm
         z++Q==
X-Forwarded-Encrypted: i=1; AJvYcCW4PDPicFyT3BnPS491mXypMmnpUvZNsK/VPIhB6QdsZRF41HXXgk21HTaNcapEOu8Tdr8UcnkRSuQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbDa4oqXbRyYu3vRdA6Zlv39XkA3zmQQ08mlR337Zf1qHJqlvD
	b/4d9zWBlpEfgNXjVFBTP0wZkLNIO6Qbn0U3MiT0AGhmQjxL0nvKh+Y=
X-Gm-Gg: ATEYQzyCfKTHmNY0WSBN/DisNTNkLiO9zudgIwIJCUBcMUYbSe559dCr3q7+FjA3ipF
	cqgpG9+AhHxzJPmI2lwAj7RwWPzrVoiJEYQ5j5ZcUvrE0tbWE4w4G3dAM6L5bKZU+RWbRIpv87p
	8I7T15ObMzOdE0uYZlm2ujl9R9Px1Mn3oIwfFyNtjm6KHufNtVOXxYY5cX/S8m3PQLRYknhLfwQ
	R9/aX+0JWd3/j3hql1liVSgLGKk9YQelFHnxv9G1CeXMgdyH4O70VC4uy4CNQGo71yD2SmA3jte
	uFO/2ffFcwFC/Lt6GxJkmPilVhrbZ8QayfedwgxNqWEfNXZlewvv/UAGCBuGMJEYYNRQ6oAFVVR
	VXo8AEyp4ynQ7j/BpgOPmpH6TNNkaiSS92+jy6unXrft24TGwZbX0AQHpoJYb0Ml2V7KeHF68PA
	JsRcG53vHaM9iUmmoQacSaiwXQsNpqMzs5XGrtmTjpx8piz0U9Sva9SZnZH6zM0rBioQHWlVH5N
	Ia7U3hYYuNQeC9Rj+zqVxGejfQV
X-Received: by 2002:a05:7301:4083:b0:2c0:cc90:a71 with SMTP id 5a478bee46e88-2c1095c78d8mr746759eec.8.1773969915768;
        Thu, 19 Mar 2026 18:25:15 -0700 (PDT)
Received: from localhost (c-76-102-12-149.hsd1.ca.comcast.net. [76.102.12.149])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b1a88e5sm1421784eec.13.2026.03.19.18.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 18:25:15 -0700 (PDT)
From: Stanislav Fomichev <sdf@fomichev.me>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	andrew+netdev@lunn.ch,
	michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com,
	anthony.l.nguyen@intel.com,
	przemyslaw.kitszel@intel.com,
	saeedm@nvidia.com,
	tariqt@nvidia.com,
	mbloch@nvidia.com,
	alexanderduyck@fb.com,
	kernel-team@meta.com,
	johannes@sipsolutions.net,
	sd@queasysnail.net,
	jianbol@nvidia.com,
	dtatulea@nvidia.com,
	sdf@fomichev.me,
	mohsin.bashr@gmail.com,
	jacob.e.keller@intel.com,
	willemb@google.com,
	skhawaja@google.com,
	bestswngs@gmail.com,
	aleksandr.loktionov@intel.com,
	kees@kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org,
	linux-rdma@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	leon@kernel.org
Subject: [PATCH net-next v3 10/13] netdevsim: convert to ndo_set_rx_mode_async
Date: Thu, 19 Mar 2026 18:24:58 -0700
Message-ID: <20260320012501.2033548-11-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260320012501.2033548-1-sdf@fomichev.me>
References: <20260320012501.2033548-1-sdf@fomichev.me>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-80284-lists,linux-doc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_NA(0.00)[fomichev.me];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[davemloft.net,google.com,kernel.org,redhat.com,lwn.net,linuxfoundation.org,lunn.ch,broadcom.com,intel.com,nvidia.com,fb.com,meta.com,sipsolutions.net,queasysnail.net,fomichev.me,gmail.com,vger.kernel.org,lists.osuosl.org];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[sdf@fomichev.me,linux-doc@vger.kernel.org];
	NEURAL_SPAM(0.00)[0.058];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,netdev];
	RCPT_COUNT_TWELVE(0.00)[37];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fomichev.me:email,fomichev.me:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 833162D4B9B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Convert netdevsim from ndo_set_rx_mode to ndo_set_rx_mode_async.
The callback is a no-op stub so just update the signature and
ops struct wiring.

Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
---
 drivers/net/netdevsim/netdev.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/netdevsim/netdev.c b/drivers/net/netdevsim/netdev.c
index 5ec028a00c62..9c9217792125 100644
--- a/drivers/net/netdevsim/netdev.c
+++ b/drivers/net/netdevsim/netdev.c
@@ -182,7 +182,9 @@ static netdev_tx_t nsim_start_xmit(struct sk_buff *skb, struct net_device *dev)
 	return NETDEV_TX_OK;
 }
 
-static void nsim_set_rx_mode(struct net_device *dev)
+static void nsim_set_rx_mode(struct net_device *dev,
+			     struct netdev_hw_addr_list *uc,
+			     struct netdev_hw_addr_list *mc)
 {
 }
 
@@ -641,7 +643,7 @@ static const struct net_shaper_ops nsim_shaper_ops = {
 
 static const struct net_device_ops nsim_netdev_ops = {
 	.ndo_start_xmit		= nsim_start_xmit,
-	.ndo_set_rx_mode	= nsim_set_rx_mode,
+	.ndo_set_rx_mode_async	= nsim_set_rx_mode,
 	.ndo_set_mac_address	= eth_mac_addr,
 	.ndo_validate_addr	= eth_validate_addr,
 	.ndo_change_mtu		= nsim_change_mtu,
@@ -664,7 +666,7 @@ static const struct net_device_ops nsim_netdev_ops = {
 
 static const struct net_device_ops nsim_vf_netdev_ops = {
 	.ndo_start_xmit		= nsim_start_xmit,
-	.ndo_set_rx_mode	= nsim_set_rx_mode,
+	.ndo_set_rx_mode_async	= nsim_set_rx_mode,
 	.ndo_set_mac_address	= eth_mac_addr,
 	.ndo_validate_addr	= eth_validate_addr,
 	.ndo_change_mtu		= nsim_change_mtu,
-- 
2.53.0


