Return-Path: <linux-doc+bounces-649-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 604397CFCB0
	for <lists+linux-doc@lfdr.de>; Thu, 19 Oct 2023 16:30:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E3AEDB2149D
	for <lists+linux-doc@lfdr.de>; Thu, 19 Oct 2023 14:30:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73FC918C28;
	Thu, 19 Oct 2023 14:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="hFcr6wWa"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0F432197;
	Thu, 19 Oct 2023 14:30:00 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::223])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F33A0185;
	Thu, 19 Oct 2023 07:29:57 -0700 (PDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4AC2B60005;
	Thu, 19 Oct 2023 14:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697725796;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UxRIH04gHYFpivoTq2QvwMiiy7tjZUo+mRSPNYqTLJ8=;
	b=hFcr6wWa8kngQUjQfgfOV49ytC3LN0hfvlBi9cOpNH9VR84D9XpSi97NTdiiJ69ibLf0H8
	FA1cgilfUlf27UMnZa4cMkML3vLppYbDqFH5dhN6IzZ0EA2OuBCb1J9cVHoHimeYACWslA
	eGlgn4A6QqcDjOMJ+c4R4m+TnrMnq8Z+mVNqjkHY/beHrnqiLpJUmLX1iyRiW35fpG3qEJ
	BsZT6izoonm/YPHKnU2mU612/mhMtfmTzpYP9pOKj5EQlJQtbkxSa5wOfyAdp4gn6VkIpl
	UwEp+0LzkfHki3NHKmy4tkHOdIfIE3Dbob6E0lOKkPFrfdO+K3I9tXWyl7/znA==
From: Kory Maincent <kory.maincent@bootlin.com>
Date: Thu, 19 Oct 2023 16:29:27 +0200
Subject: [PATCH net-next v6 12/16] net: Replace hwtstamp_source by
 timestamping layer
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231019-feature_ptp_netnext-v6-12-71affc27b0e5@bootlin.com>
References: <20231019-feature_ptp_netnext-v6-0-71affc27b0e5@bootlin.com>
In-Reply-To: <20231019-feature_ptp_netnext-v6-0-71affc27b0e5@bootlin.com>
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
 Simon Horman <horms@kernel.org>, Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Kory Maincent <kory.maincent@bootlin.com>
X-Mailer: b4 0.12.3
X-GND-Sasl: kory.maincent@bootlin.com

Replace hwtstamp_source which is only used by the kernel_hwtstamp_config
structure by the more widely use timestamp_layer structure. This is done
to prepare the support of selectable timestamping source.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---

Change in v6:
- Follow timestamping layer naming update.
---
 drivers/net/ethernet/microchip/lan966x/lan966x_main.c |  6 +++---
 include/linux/net_tstamp.h                            | 11 +++--------
 net/core/dev_ioctl.c                                  |  2 +-
 3 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_main.c b/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
index 8e4101628fbd..b219259600e7 100644
--- a/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
+++ b/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
@@ -470,15 +470,15 @@ static int lan966x_port_hwtstamp_set(struct net_device *dev,
 	struct lan966x_port *port = netdev_priv(dev);
 	int err;
 
-	if (cfg->source != HWTSTAMP_SOURCE_NETDEV &&
-	    cfg->source != HWTSTAMP_SOURCE_PHYLIB)
+	if (cfg->source != MAC_TIMESTAMPING &&
+	    cfg->source != PHY_TIMESTAMPING)
 		return -EOPNOTSUPP;
 
 	err = lan966x_ptp_setup_traps(port, cfg);
 	if (err)
 		return err;
 
-	if (cfg->source == HWTSTAMP_SOURCE_NETDEV) {
+	if (cfg->source == MAC_TIMESTAMPING) {
 		if (!port->lan966x->ptp)
 			return -EOPNOTSUPP;
 
diff --git a/include/linux/net_tstamp.h b/include/linux/net_tstamp.h
index eb01c37e71e0..bb289c2ad376 100644
--- a/include/linux/net_tstamp.h
+++ b/include/linux/net_tstamp.h
@@ -5,11 +5,6 @@
 
 #include <uapi/linux/net_tstamp.h>
 
-enum hwtstamp_source {
-	HWTSTAMP_SOURCE_NETDEV,
-	HWTSTAMP_SOURCE_PHYLIB,
-};
-
 /**
  * struct kernel_hwtstamp_config - Kernel copy of struct hwtstamp_config
  *
@@ -20,8 +15,8 @@ enum hwtstamp_source {
  *	a legacy implementation of a lower driver
  * @copied_to_user: request was passed to a legacy implementation which already
  *	copied the ioctl request back to user space
- * @source: indication whether timestamps should come from the netdev or from
- *	an attached phylib PHY
+ * @source: indication whether timestamps should come from software, the netdev
+ *	or from an attached phylib PHY
  *
  * Prefer using this structure for in-kernel processing of hardware
  * timestamping configuration, over the inextensible struct hwtstamp_config
@@ -33,7 +28,7 @@ struct kernel_hwtstamp_config {
 	int rx_filter;
 	struct ifreq *ifr;
 	bool copied_to_user;
-	enum hwtstamp_source source;
+	enum timestamping_layer source;
 };
 
 static inline void hwtstamp_config_to_kernel(struct kernel_hwtstamp_config *kernel_cfg,
diff --git a/net/core/dev_ioctl.c b/net/core/dev_ioctl.c
index cb60b0b9c31d..57d9f25f16b8 100644
--- a/net/core/dev_ioctl.c
+++ b/net/core/dev_ioctl.c
@@ -332,7 +332,7 @@ int dev_set_hwtstamp_phylib(struct net_device *dev,
 	bool changed = false;
 	int err;
 
-	cfg->source = phy_ts ? HWTSTAMP_SOURCE_PHYLIB : HWTSTAMP_SOURCE_NETDEV;
+	cfg->source = phy_ts ? PHY_TIMESTAMPING : NET_TIMESTAMPING;
 
 	if (phy_ts && (dev->priv_flags & IFF_SEE_ALL_HWTSTAMP_REQUESTS)) {
 		err = ops->ndo_hwtstamp_get(dev, &old_cfg);

-- 
2.25.1


