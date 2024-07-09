Return-Path: <linux-doc+bounces-20291-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 82DBB92BC21
	for <lists+linux-doc@lfdr.de>; Tue,  9 Jul 2024 15:56:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 02D5D1F22217
	for <lists+linux-doc@lfdr.de>; Tue,  9 Jul 2024 13:56:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BC32190485;
	Tue,  9 Jul 2024 13:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="LjTo6IzV"
X-Original-To: linux-doc@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C09190075;
	Tue,  9 Jul 2024 13:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720533255; cv=none; b=BamZ4aXcYW0+XRhVcTYxATAD4eAEme5rHD8arTp3ZP+oHrFu74KY4m0YfAD3ZwXr/vAR0Wc05XUMFAR80l0CRol+qFy/IvQnw49GzaalT68/gVt65To8Y82rOjc/KA7ylZRSnY+IUlVBCIF9KS2SXxi+BFMUMHyPynynGiNaKm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720533255; c=relaxed/simple;
	bh=zxqgQ6Vs+86Eh3h50dtc/Unx4WJMtsjrr83itZrYaGE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JsxPNtmGaKFjS/ULpC/THHbgKLjTedmCceJp5HZM723Jlt6F//NBOgL9Go7bX4hrzxneKIZLnjgRlBrTXCGwP+kjs7yT4M6W+ynRgZZkMOFKY45PsJf1CD9Jqd4fKfSllyXlkvS5ypTMlebob3cocrQpBstpJnHyUrGBKemk6Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=LjTo6IzV; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1ACE61BF219;
	Tue,  9 Jul 2024 13:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720533248;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VLURsRiTiRR57FM31CRHAv3oVqTfnYmA42jSKgbnYok=;
	b=LjTo6IzVdxskBwRGLh2ud6ettDpCIBZle24GG0uun2/lrEKfH0beKVzA0oEywbpXnB5ans
	N3NCAd82SbIFCfaBt/2tt2oDtQZ5IjIci41aQocg6SCeIbarITgK5oNvODvQXyJxdmoBuJ
	eb274D61sIo1qZP1MhmPqk0K5zv1GIXul7ih9Iq8N6TRS5DwXWODbmO1nLadPLIl2p7txQ
	KpZSBdQrCDJN1Uc3gq8uYmEUQSnWXwEq01DXtwGckfbur3ZXXkumFSQ+vO3+Gp7NMLu832
	nIviuutlZJyRjeBHaYJmWwGUCYIPf6mWFb2N9DAOdC48hKpBJw6CUjGZvFn69w==
From: Kory Maincent <kory.maincent@bootlin.com>
Date: Tue, 09 Jul 2024 15:53:40 +0200
Subject: [PATCH net-next v17 08/14] net: Add the possibility to support a
 selected hwtstamp in netdevice
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240709-feature_ptp_netnext-v17-8-b5317f50df2a@bootlin.com>
References: <20240709-feature_ptp_netnext-v17-0-b5317f50df2a@bootlin.com>
In-Reply-To: <20240709-feature_ptp_netnext-v17-0-b5317f50df2a@bootlin.com>
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
 donald.hunter@gmail.com, danieller@nvidia.com, ecree.xilinx@gmail.com
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 linux-doc@vger.kernel.org, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Rahul Rameshbabu <rrameshbabu@nvidia.com>, 
 Willem de Bruijn <willemb@google.com>, 
 Shannon Nelson <shannon.nelson@amd.com>, 
 Alexandra Winter <wintera@linux.ibm.com>, 
 Kory Maincent <kory.maincent@bootlin.com>
X-Mailer: b4 0.13.0
X-GND-Sasl: kory.maincent@bootlin.com

Introduce the description of a hwtstamp provider, mainly defined with a
ptp_clock pointer and a qualifier value.

Add a hwtstamp provider description within the netdev structure to
allow saving the hwtstamp we want to use. This prepares for future
support of an ethtool netlink command to select the desired hwtstamp
provider. By default, the old API that does not support hwtstamp
selectability is used, meaning the hwtstamp ptp_clock pointer is unset.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---

Change in v8:
- New patch

Change in v10:
- Set hwtstamp in netdevice as a pointer for future use of rcu lock.
- Fix a nit in teh order of setting phydev pointer.
- Add a missing kdoc description.

Change in v13:
- Remove an include from netdevices.h.

Change in v16:
- Import the part of the patch 12 which belong to the hwtstamp provider
  selectability of net core.
---
 drivers/net/phy/phy_device.c     | 11 +++++++++
 drivers/ptp/ptp_clock_consumer.c | 10 ++++++++
 include/linux/net_tstamp.h       | 18 +++++++++++++++
 include/linux/netdevice.h        |  5 ++++
 include/linux/ptp_clock_kernel.h | 10 ++++++++
 include/uapi/linux/net_tstamp.h  | 11 +++++++++
 net/core/dev_ioctl.c             | 43 ++++++++++++++++++++++++++++++++--
 net/core/timestamping.c          | 50 ++++++++++++++++++++++++++++++++++++----
 8 files changed, 151 insertions(+), 7 deletions(-)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 70b07e621fb2..57a9943bb1c1 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -31,6 +31,7 @@
 #include <linux/phy_led_triggers.h>
 #include <linux/pse-pd/pse.h>
 #include <linux/property.h>
+#include <linux/ptp_clock_kernel.h>
 #include <linux/rtnetlink.h>
 #include <linux/sfp.h>
 #include <linux/skbuff.h>
@@ -1936,6 +1937,16 @@ void phy_detach(struct phy_device *phydev)
 
 	phy_suspend(phydev);
 	if (dev) {
+		struct hwtstamp_provider *hwtstamp;
+
+		hwtstamp = rtnl_dereference(dev->hwtstamp);
+		/* Disable timestamp if selected */
+		if (hwtstamp && ptp_clock_phydev(hwtstamp->ptp) == phydev) {
+			rcu_assign_pointer(dev->hwtstamp, NULL);
+			call_rcu(&hwtstamp->rcu_head,
+				 remove_hwtstamp_provider);
+		}
+
 		phydev->attached_dev->phydev = NULL;
 		phydev->attached_dev = NULL;
 	}
diff --git a/drivers/ptp/ptp_clock_consumer.c b/drivers/ptp/ptp_clock_consumer.c
index 58b0c8948fc8..f5fab1c14b47 100644
--- a/drivers/ptp/ptp_clock_consumer.c
+++ b/drivers/ptp/ptp_clock_consumer.c
@@ -98,3 +98,13 @@ void ptp_clock_put(struct device *dev, struct ptp_clock *ptp)
 	put_device(&ptp->dev);
 	module_put(ptp->info->owner);
 }
+
+void remove_hwtstamp_provider(struct rcu_head *rcu_head)
+{
+	struct hwtstamp_provider *hwtstamp;
+
+	hwtstamp = container_of(rcu_head, struct hwtstamp_provider, rcu_head);
+	ptp_clock_put(hwtstamp->dev, hwtstamp->ptp);
+	kfree(hwtstamp);
+}
+EXPORT_SYMBOL(remove_hwtstamp_provider);
diff --git a/include/linux/net_tstamp.h b/include/linux/net_tstamp.h
index 662074b08c94..077037f9ad0f 100644
--- a/include/linux/net_tstamp.h
+++ b/include/linux/net_tstamp.h
@@ -19,6 +19,22 @@ enum hwtstamp_source {
 	HWTSTAMP_SOURCE_PHYLIB,
 };
 
+/**
+ * struct hwtstamp_provider - Description of a hwtstamp provider object
+ *
+ * @rcu_head: RCU callback used to free the struct.
+ * @dev: device attached to the hwtstamp provider used to put the ptp clock.
+ * @ptp: PTP clock pointer of the hwtstamp provider.
+ * @qualifier: hwtstamp provider qualifier.
+ */
+
+struct hwtstamp_provider {
+	struct rcu_head rcu_head;
+	struct device *dev;
+	struct ptp_clock *ptp;
+	enum hwtstamp_provider_qualifier qualifier;
+};
+
 /**
  * struct kernel_hwtstamp_config - Kernel copy of struct hwtstamp_config
  *
@@ -31,6 +47,7 @@ enum hwtstamp_source {
  *	copied the ioctl request back to user space
  * @source: indication whether timestamps should come from the netdev or from
  *	an attached phylib PHY
+ * @qualifier: qualifier of the hwtstamp provider
  *
  * Prefer using this structure for in-kernel processing of hardware
  * timestamping configuration, over the inextensible struct hwtstamp_config
@@ -43,6 +60,7 @@ struct kernel_hwtstamp_config {
 	struct ifreq *ifr;
 	bool copied_to_user;
 	enum hwtstamp_source source;
+	enum hwtstamp_provider_qualifier qualifier;
 };
 
 static inline void hwtstamp_config_to_kernel(struct kernel_hwtstamp_config *kernel_cfg,
diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index 93558645c6d0..c18761c36455 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -81,6 +81,7 @@ struct xdp_frame;
 struct xdp_metadata_ops;
 struct xdp_md;
 struct ethtool_netdev_state;
+struct hwtstamp_provider;
 
 typedef u32 xdp_features_t;
 
@@ -2027,6 +2028,8 @@ enum netdev_reg_state {
  *	@dpll_pin: Pointer to the SyncE source pin of a DPLL subsystem,
  *		   where the clock is recovered.
  *
+ *	@hwtstamp: Tracks which PTP performs hardware packet time stamping.
+ *
  *	FIXME: cleanup struct net_device such that network protocol info
  *	moves out.
  */
@@ -2406,6 +2409,8 @@ struct net_device {
 
 	/** @irq_moder: dim parameters used if IS_ENABLED(CONFIG_DIMLIB). */
 	struct dim_irq_moder	*irq_moder;
+
+	struct hwtstamp_provider __rcu	*hwtstamp;
 };
 #define to_net_dev(d) container_of(d, struct net_device, dev)
 
diff --git a/include/linux/ptp_clock_kernel.h b/include/linux/ptp_clock_kernel.h
index 860c1e293a62..6d9e6cd5c832 100644
--- a/include/linux/ptp_clock_kernel.h
+++ b/include/linux/ptp_clock_kernel.h
@@ -442,6 +442,14 @@ struct ptp_clock *ptp_clock_get_by_index(struct device *dev, int index);
 
 void ptp_clock_put(struct device *dev, struct ptp_clock *ptp);
 
+/**
+ * remove_hwtstamp_provider() - Put and free the hwtstamp provider
+ *
+ * @rcu_head:  RCU callback head.
+ */
+
+void remove_hwtstamp_provider(struct rcu_head *rcu_head);
+
 /**
  * ptp_find_pin() - obtain the pin index of a given auxiliary function
  *
@@ -530,6 +538,8 @@ static inline void ptp_clock_put(struct device *dev, struct ptp_clock *ptp)
 static inline struct ptp_clock *ptp_clock_get_by_index(struct device *dev,
 						       int index)
 { return NULL; }
+static inline void remove_hwtstamp_provider(struct rcu_head *rcu_head)
+{ return; }
 static inline int ptp_find_pin(struct ptp_clock *ptp,
 			       enum ptp_pin_function func, unsigned int chan)
 { return -1; }
diff --git a/include/uapi/linux/net_tstamp.h b/include/uapi/linux/net_tstamp.h
index a2c66b3d7f0f..a9ed48ee8fc7 100644
--- a/include/uapi/linux/net_tstamp.h
+++ b/include/uapi/linux/net_tstamp.h
@@ -13,6 +13,17 @@
 #include <linux/types.h>
 #include <linux/socket.h>   /* for SO_TIMESTAMPING */
 
+/*
+ * Possible type of htstamp provider. Mainly "precise" the default one
+ * is for IEEE 1588 quality and "approx" is for NICs DMA point.
+ */
+enum hwtstamp_provider_qualifier {
+	HWTSTAMP_PROVIDER_QUALIFIER_PRECISE,
+	HWTSTAMP_PROVIDER_QUALIFIER_APPROX,
+
+	HWTSTAMP_PROVIDER_QUALIFIER_CNT,
+};
+
 /* SO_TIMESTAMPING flags */
 enum {
 	SOF_TIMESTAMPING_TX_HARDWARE = (1<<0),
diff --git a/net/core/dev_ioctl.c b/net/core/dev_ioctl.c
index 36cea843381f..350d123c09c9 100644
--- a/net/core/dev_ioctl.c
+++ b/net/core/dev_ioctl.c
@@ -6,6 +6,7 @@
 #include <linux/rtnetlink.h>
 #include <linux/net_tstamp.h>
 #include <linux/phylib_stubs.h>
+#include <linux/ptp_clock_kernel.h>
 #include <linux/wireless.h>
 #include <linux/if_bridge.h>
 #include <net/dsa_stubs.h>
@@ -269,6 +270,22 @@ static int dev_eth_ioctl(struct net_device *dev,
 int dev_get_hwtstamp_phylib(struct net_device *dev,
 			    struct kernel_hwtstamp_config *cfg)
 {
+	struct hwtstamp_provider *hwtstamp;
+
+	hwtstamp = rtnl_dereference(dev->hwtstamp);
+	if (hwtstamp) {
+		struct ptp_clock *ptp = hwtstamp->ptp;
+
+		cfg->qualifier = hwtstamp->qualifier;
+		if (ptp_clock_from_phylib(ptp))
+			return phy_hwtstamp_get(ptp_clock_phydev(ptp), cfg);
+
+		if (ptp_clock_from_netdev(ptp))
+			return dev->netdev_ops->ndo_hwtstamp_get(dev, cfg);
+
+		return -EOPNOTSUPP;
+	}
+
 	if (phy_is_default_hwtstamp(dev->phydev))
 		return phy_hwtstamp_get(dev->phydev, cfg);
 
@@ -325,11 +342,33 @@ int dev_set_hwtstamp_phylib(struct net_device *dev,
 			    struct netlink_ext_ack *extack)
 {
 	const struct net_device_ops *ops = dev->netdev_ops;
-	bool phy_ts = phy_is_default_hwtstamp(dev->phydev);
 	struct kernel_hwtstamp_config old_cfg = {};
+	struct hwtstamp_provider *hwtstamp;
+	struct phy_device *phydev;
 	bool changed = false;
+	bool phy_ts;
 	int err;
 
+	hwtstamp = rtnl_dereference(dev->hwtstamp);
+	if (hwtstamp) {
+		struct ptp_clock *ptp = hwtstamp->ptp;
+
+		if (ptp_clock_from_phylib(ptp)) {
+			phy_ts = true;
+			phydev = ptp_clock_phydev(ptp);
+		} else if (ptp_clock_from_netdev(ptp)) {
+			phy_ts = false;
+		} else {
+			return -EOPNOTSUPP;
+		}
+
+		cfg->qualifier = hwtstamp->qualifier;
+	} else {
+		phy_ts = phy_is_default_hwtstamp(dev->phydev);
+		if (phy_ts)
+			phydev = dev->phydev;
+	}
+
 	cfg->source = phy_ts ? HWTSTAMP_SOURCE_PHYLIB : HWTSTAMP_SOURCE_NETDEV;
 
 	if (phy_ts && (dev->priv_flags & IFF_SEE_ALL_HWTSTAMP_REQUESTS)) {
@@ -351,7 +390,7 @@ int dev_set_hwtstamp_phylib(struct net_device *dev,
 		changed = kernel_hwtstamp_config_changed(&old_cfg, cfg);
 
 	if (phy_ts) {
-		err = phy_hwtstamp_set(dev->phydev, cfg, extack);
+		err = phy_hwtstamp_set(phydev, cfg, extack);
 		if (err) {
 			if (changed)
 				ops->ndo_hwtstamp_set(dev, &old_cfg, NULL);
diff --git a/net/core/timestamping.c b/net/core/timestamping.c
index 3717fb152ecc..f8522fefd468 100644
--- a/net/core/timestamping.c
+++ b/net/core/timestamping.c
@@ -9,6 +9,7 @@
 #include <linux/ptp_classify.h>
 #include <linux/skbuff.h>
 #include <linux/export.h>
+#include <linux/ptp_clock_kernel.h>
 
 static unsigned int classify(const struct sk_buff *skb)
 {
@@ -21,19 +22,38 @@ static unsigned int classify(const struct sk_buff *skb)
 
 void skb_clone_tx_timestamp(struct sk_buff *skb)
 {
+	struct hwtstamp_provider *hwtstamp;
 	struct mii_timestamper *mii_ts;
+	struct phy_device *phydev;
 	struct sk_buff *clone;
 	unsigned int type;
 
-	if (!skb->sk || !skb->dev ||
-	    !phy_is_default_hwtstamp(skb->dev->phydev))
+	if (!skb->sk || !skb->dev)
 		return;
 
+	rcu_read_lock();
+	hwtstamp = rcu_dereference(skb->dev->hwtstamp);
+	if (hwtstamp) {
+		if (!ptp_clock_from_phylib(hwtstamp->ptp)) {
+			rcu_read_unlock();
+			return;
+		}
+
+		phydev = ptp_clock_phydev(hwtstamp->ptp);
+	} else {
+		phydev = skb->dev->phydev;
+		if (!phy_is_default_hwtstamp(phydev)) {
+			rcu_read_unlock();
+			return;
+		}
+	}
+	rcu_read_unlock();
+
 	type = classify(skb);
 	if (type == PTP_CLASS_NONE)
 		return;
 
-	mii_ts = skb->dev->phydev->mii_ts;
+	mii_ts = phydev->mii_ts;
 	if (likely(mii_ts->txtstamp)) {
 		clone = skb_clone_sk(skb);
 		if (!clone)
@@ -45,12 +65,32 @@ EXPORT_SYMBOL_GPL(skb_clone_tx_timestamp);
 
 bool skb_defer_rx_timestamp(struct sk_buff *skb)
 {
+	struct hwtstamp_provider *hwtstamp;
 	struct mii_timestamper *mii_ts;
+	struct phy_device *phydev;
 	unsigned int type;
 
-	if (!skb->dev || !phy_is_default_hwtstamp(skb->dev->phydev))
+	if (!skb->dev)
 		return false;
 
+	rcu_read_lock();
+	hwtstamp = rcu_dereference(skb->dev->hwtstamp);
+	if (hwtstamp) {
+		if (!ptp_clock_from_phylib(hwtstamp->ptp)) {
+			rcu_read_unlock();
+			return false;
+		}
+
+		phydev = ptp_clock_phydev(hwtstamp->ptp);
+	} else {
+		phydev = skb->dev->phydev;
+		if (!phy_is_default_hwtstamp(phydev)) {
+			rcu_read_unlock();
+			return false;
+		}
+	}
+	rcu_read_unlock();
+
 	if (skb_headroom(skb) < ETH_HLEN)
 		return false;
 
@@ -63,7 +103,7 @@ bool skb_defer_rx_timestamp(struct sk_buff *skb)
 	if (type == PTP_CLASS_NONE)
 		return false;
 
-	mii_ts = skb->dev->phydev->mii_ts;
+	mii_ts = phydev->mii_ts;
 	if (likely(mii_ts->rxtstamp))
 		return mii_ts->rxtstamp(mii_ts, skb, type);
 

-- 
2.34.1


