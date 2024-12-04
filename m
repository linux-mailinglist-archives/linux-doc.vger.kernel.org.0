Return-Path: <linux-doc+bounces-32010-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C10799E3D1B
	for <lists+linux-doc@lfdr.de>; Wed,  4 Dec 2024 15:45:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8260D282957
	for <lists+linux-doc@lfdr.de>; Wed,  4 Dec 2024 14:45:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7870B20C038;
	Wed,  4 Dec 2024 14:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="PKkmeevQ"
X-Original-To: linux-doc@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB23520ADE3;
	Wed,  4 Dec 2024 14:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733323512; cv=none; b=QV7Y+6qtjj1t4Wdm1SugW5di/VUi5Iw1kU+f+k5iWcU33fSLa7jQRj2x4Xp59T9OYLNDgF100urT2YX+VbX/V4MBKHLjcBMkAWErz4d8ujyBEVc9/xdLWE1wOI9xMSVW89JVK81LCMGaMZTeC5cKRuYT5rtC7s1uOxHpJ/EgI+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733323512; c=relaxed/simple;
	bh=ZjvHZkc5inY+pRASyJgpQhjoZd37S6DxzdVDTHf6W+I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PVH7jV3qgnhT8yQwdWlq03wnqpoFOp71EKUYrX3h2bW49gMBw0WdVJrwTzVN9ixXISFn2ydVHE5TBifkliMGMOfL2+uiESvYGjqDte1bhiP53zqER8+TUusvoo2FgH0O+0rNVKdhJaZrU/zBWjqPro3zbbXGqKoLXJ6yfuJjCvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=PKkmeevQ; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 31B82240008;
	Wed,  4 Dec 2024 14:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733323508;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uMy6XiHeL00a21AbpVvnbAktcJJ0pCxX4TSIpkEjL+M=;
	b=PKkmeevQYDm6OoSuXeVAgtJrFaFnPsrB0i8h2xa/KiQROdqvHfLkmtM1/zTP6qvfgE1T4M
	WlMK/kUrn3CVIBjt2R6OR6aetZcOfvVFDkFrzPDN6eO5hxEg3VEtLTNrkF00dj3+qgijoB
	1CktsGWQaTm+B2QyumOIdTFy86LD5koJApeKgsFTVDyrcAy1WBkC7cK2P0QFhP7lvRzBXJ
	Neozive5coTsdkR9A+nXe/QyDSnxoGeeQsbJjTOHSsW4DnSxbBlpQ18VCjBDGJtu8eFiOH
	ZwInT7+ixlp+dIfyGLbuEgkdMvW+GWstHRnirNofumrH8IVTAUazQP3F9V8z2Q==
From: Kory Maincent <kory.maincent@bootlin.com>
Date: Wed, 04 Dec 2024 15:44:43 +0100
Subject: [PATCH net-next v20 2/6] net: Make net_hwtstamp_validate
 accessible
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241204-feature_ptp_netnext-v20-2-9bd99dc8a867@bootlin.com>
References: <20241204-feature_ptp_netnext-v20-0-9bd99dc8a867@bootlin.com>
In-Reply-To: <20241204-feature_ptp_netnext-v20-0-9bd99dc8a867@bootlin.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Radu Pirea <radu-nicolae.pirea@oss.nxp.com>, 
 Jay Vosburgh <j.vosburgh@gmail.com>, Andy Gospodarek <andy@greyhouse.net>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, 
 Horatiu Vultur <horatiu.vultur@microchip.com>, UNGLinuxDriver@microchip.com, 
 Simon Horman <horms@kernel.org>, Vladimir Oltean <vladimir.oltean@nxp.com>, 
 donald.hunter@gmail.com, danieller@nvidia.com, ecree.xilinx@gmail.com, 
 Andrew Lunn <andrew+netdev@lunn.ch>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 linux-doc@vger.kernel.org, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Rahul Rameshbabu <rrameshbabu@nvidia.com>, 
 Willem de Bruijn <willemb@google.com>, 
 Shannon Nelson <shannon.nelson@amd.com>, 
 Alexandra Winter <wintera@linux.ibm.com>, 
 Kory Maincent <kory.maincent@bootlin.com>, 
 Jacob Keller <jacob.e.keller@intel.com>
X-Mailer: b4 0.14.1
X-GND-Sasl: kory.maincent@bootlin.com

Make the net_hwtstamp_validate function accessible in prevision to use
it from ethtool to validate the hwtstamp configuration before setting it.

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---

Change in v8:
- New patch

Change in v10:
- Remove export symbol as ethtool can't be built as a module.
- Move the declaration to net/core/dev.h instead of netdevice.h
---
 net/core/dev.h       | 1 +
 net/core/dev_ioctl.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/core/dev.h b/net/core/dev.h
index 357543cbde65..aa91eed55a40 100644
--- a/net/core/dev.h
+++ b/net/core/dev.h
@@ -312,5 +312,6 @@ int dev_set_hwtstamp_phylib(struct net_device *dev,
 			    struct netlink_ext_ack *extack);
 int dev_get_hwtstamp_phylib(struct net_device *dev,
 			    struct kernel_hwtstamp_config *cfg);
+int net_hwtstamp_validate(const struct kernel_hwtstamp_config *cfg);
 
 #endif
diff --git a/net/core/dev_ioctl.c b/net/core/dev_ioctl.c
index 67cf68817f23..1f09930fca26 100644
--- a/net/core/dev_ioctl.c
+++ b/net/core/dev_ioctl.c
@@ -184,7 +184,7 @@ static int dev_ifsioc_locked(struct net *net, struct ifreq *ifr, unsigned int cm
 	return err;
 }
 
-static int net_hwtstamp_validate(const struct kernel_hwtstamp_config *cfg)
+int net_hwtstamp_validate(const struct kernel_hwtstamp_config *cfg)
 {
 	enum hwtstamp_tx_types tx_type;
 	enum hwtstamp_rx_filters rx_filter;

-- 
2.34.1


