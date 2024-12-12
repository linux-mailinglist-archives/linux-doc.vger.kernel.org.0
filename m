Return-Path: <linux-doc+bounces-32575-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D36D9EF620
	for <lists+linux-doc@lfdr.de>; Thu, 12 Dec 2024 18:22:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 934743602DC
	for <lists+linux-doc@lfdr.de>; Thu, 12 Dec 2024 17:09:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DF5122A80D;
	Thu, 12 Dec 2024 17:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="NS0mL0hu"
X-Original-To: linux-doc@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA61E22968B;
	Thu, 12 Dec 2024 17:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734023236; cv=none; b=jChvzJEqjEzU4WYrBDrpIPUU7uJUqvu+TSNZ42stcUaMBH0Hoz2dTfhsRVk8h1QE/6sG7XqqdukLGGWB1mU0oZywGdh+bXlQuSN0OhHPKsHYyLEeV6xfS0INehJPmVz1oH001QfYtSJHLnCW7i87GYlpFFt2/hwGONWYpJJGPlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734023236; c=relaxed/simple;
	bh=+zS7ZopVb60N/+KR1n1X1p9bxqSjBRGrYh3W3wePV8s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FpHuFURSpHCP47z0xFjvGqVzU5dl9aR6/Uo04kxTVv0iSrShQ+HZoOcLqInnRPMgd6dJRXdBaAAx+hLoGKOudLrjpjJVR9CPEJHn5j1YsXTKKeT/vybToRXrkw2nsYsU971dquoqp8xX2ZL1ZdPm4E31lx4pz/AS9tVWHdHQ/5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=NS0mL0hu; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 57B9760004;
	Thu, 12 Dec 2024 17:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734023232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dy4ERvvpz1XqYtJgbnaeC/A15WSsIHKjcL2qS8gf7hA=;
	b=NS0mL0hu1SxZlXvQgpELIcJ087KPER42FW8FyGAe2O5RW3eXAhP6tJ8pp2EjSeuO6WS5wx
	a42svIfy3UZPWA6Bg6oEYYZY+Eqn1BXizCWI2XnJnIEVIaX0iyHNMC9zpt26g9vN08EdNT
	7WRY7TQmYWGXGtqVWkj3JX2drh9RoW46zGKjlG02cSY9gJmKBbTWPXiD6ybutLwQQsg7d3
	Vses+SCJHr6QomjSuWanJnByStl03uHH223NVnZex4F3HyaRrMOqLc5aih+LVbqI7HZ1i1
	xw8wXDuVsJbF4ED6P1C5BAnXaxM/hAc4egCsKDJHZ0mrEwvTaz+kfxw99LaVEQ==
From: Kory Maincent <kory.maincent@bootlin.com>
Date: Thu, 12 Dec 2024 18:06:44 +0100
Subject: [PATCH net-next v21 4/5] net: ethtool: tsinfo: Enhance tsinfo to
 support several hwtstamp by net topology
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-feature_ptp_netnext-v21-4-2c282a941518@bootlin.com>
References: <20241212-feature_ptp_netnext-v21-0-2c282a941518@bootlin.com>
In-Reply-To: <20241212-feature_ptp_netnext-v21-0-2c282a941518@bootlin.com>
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
 Kory Maincent <kory.maincent@bootlin.com>
X-Mailer: b4 0.14.1
X-GND-Sasl: kory.maincent@bootlin.com

Either the MAC or the PHY can provide hwtstamp, so we should be able to
read the tsinfo for any hwtstamp provider.

Enhance 'get' command to retrieve tsinfo of hwtstamp providers within a
network topology.

Add support for a specific dump command to retrieve all hwtstamp
providers within the network topology, with added functionality for
filtered dump to target a single interface.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
Change in v8:
- New patch

Change in v9:
- Fix nit in done callback.

Change in v10:
- Add documentation.
- Add extack error messages.
- Add NLA_POLICY_* checks.
- Fix few nits.
- Add ETHTOOL_A_TSINFO_GHWTSTAMP netlink attributes instead of a bit in
  ETHTOOL_A_TSINFO_TIMESTAMPING bitset.
- Add tsinfo_parse_hwtstamp_provider function for more readability.
- Move netdev_support_hwtstamp_qualifier function in core ptp instead of
  core net.
- Add refcount put to release the ptp object.
- Use rcu lock to avoid memory leak.

Change in v12:
- Add missing return description in the kdoc.
- Fix possible leak due to uninitialised variable.
- Add a missing static.

Change in v13:
- Remove useless EXPORT_SYMBOL().
- Fix issues reported by sparse and smatch.
- Fix issues when building PTP as a module.
- Rename HWTSTAMP_PROVIDER_NEST to HWTSTAMP_PROVIDER.

Change in v16:
- Used call_rcu() instead of synchronize_rcu() to free the hwtstamp_provider
  struct.
- Fix documentation typo.
- Fix few nit.
- Fix possible issue regardings stats.
- Remove hwtstamp config get and set from tsinfo.

Change in v20:
- Rethink the hwtstamp provider design implementation.
- Remove the "user" pointer from the PTP structure.
---
 Documentation/netlink/specs/ethtool.yaml       |  20 ++
 Documentation/networking/ethtool-netlink.rst   |   7 +-
 include/linux/ethtool.h                        |   4 +
 include/uapi/linux/ethtool_netlink_generated.h |  10 +
 net/ethtool/common.c                           | 141 +++++++++-
 net/ethtool/common.h                           |  13 +
 net/ethtool/netlink.c                          |   6 +-
 net/ethtool/netlink.h                          |   5 +-
 net/ethtool/ts.h                               |  20 ++
 net/ethtool/tsinfo.c                           | 358 ++++++++++++++++++++++++-
 10 files changed, 563 insertions(+), 21 deletions(-)

diff --git a/Documentation/netlink/specs/ethtool.yaml b/Documentation/netlink/specs/ethtool.yaml
index c7634e957d9c..4082816e5f3d 100644
--- a/Documentation/netlink/specs/ethtool.yaml
+++ b/Documentation/netlink/specs/ethtool.yaml
@@ -836,6 +836,20 @@ attribute-sets:
       -
         name: tx-err
         type: uint
+  -
+    name: ts-hwtstamp-provider
+    attr-cnt-name: __ethtool-a-ts-hwtstamp-provider-cnt
+    attributes:
+      -
+        name: unspec
+        type: unused
+        value: 0
+      -
+        name: index
+        type: u32
+      -
+        name: qualifier
+        type: u32
   -
     name: tsinfo
     attr-cnt-name: __ethtool-a-tsinfo-cnt
@@ -867,6 +881,10 @@ attribute-sets:
         name: stats
         type: nest
         nested-attributes: ts-stat
+      -
+        name: hwtstamp-provider
+        type: nest
+        nested-attributes: ts-hwtstamp-provider
   -
     name: cable-result
     attr-cnt-name: __ethtool-a-cable-result-cnt
@@ -1912,6 +1930,7 @@ operations:
         request:
           attributes:
             - header
+            - hwtstamp-provider
         reply:
           attributes:
             - header
@@ -1920,6 +1939,7 @@ operations:
             - rx-filters
             - phc-index
             - stats
+            - hwtstamp-provider
       dump: *tsinfo-get-op
     -
       name: cable-test-act
diff --git a/Documentation/networking/ethtool-netlink.rst b/Documentation/networking/ethtool-netlink.rst
index b25926071ece..c585e2f0ddfa 100644
--- a/Documentation/networking/ethtool-netlink.rst
+++ b/Documentation/networking/ethtool-netlink.rst
@@ -1245,9 +1245,10 @@ Gets timestamping information like ``ETHTOOL_GET_TS_INFO`` ioctl request.
 
 Request contents:
 
-  =====================================  ======  ==========================
-  ``ETHTOOL_A_TSINFO_HEADER``            nested  request header
-  =====================================  ======  ==========================
+  ========================================  ======  ============================
+  ``ETHTOOL_A_TSINFO_HEADER``               nested  request header
+  ``ETHTOOL_A_TSINFO_HWTSTAMP_PROVIDER``    nested  PTP hw clock provider
+  ========================================  ======  ============================
 
 Kernel response contents:
 
diff --git a/include/linux/ethtool.h b/include/linux/ethtool.h
index e217c6321ed0..f711bfd75c4d 100644
--- a/include/linux/ethtool.h
+++ b/include/linux/ethtool.h
@@ -711,6 +711,7 @@ struct ethtool_rxfh_param {
  * @cmd: command number = %ETHTOOL_GET_TS_INFO
  * @so_timestamping: bit mask of the sum of the supported SO_TIMESTAMPING flags
  * @phc_index: device index of the associated PHC, or -1 if there is none
+ * @phc_qualifier: qualifier of the associated PHC
  * @tx_types: bit mask of the supported hwtstamp_tx_types enumeration values
  * @rx_filters: bit mask of the supported hwtstamp_rx_filters enumeration values
  */
@@ -718,6 +719,7 @@ struct kernel_ethtool_ts_info {
 	u32 cmd;
 	u32 so_timestamping;
 	int phc_index;
+	enum hwtstamp_provider_qualifier phc_qualifier;
 	enum hwtstamp_tx_types tx_types;
 	enum hwtstamp_rx_filters rx_filters;
 };
@@ -749,6 +751,7 @@ struct kernel_ethtool_ts_info {
  *	@rss_context argument to @create_rxfh_context and friends.
  * @supported_coalesce_params: supported types of interrupt coalescing.
  * @supported_ring_params: supported ring params.
+ * @supported_hwtstamp_qualifiers: bitfield of supported hwtstamp qualifier.
  * @get_drvinfo: Report driver/device information. Modern drivers no
  *	longer have to implement this callback. Most fields are
  *	correctly filled in by the core using system information, or
@@ -966,6 +969,7 @@ struct ethtool_ops {
 	u32	rxfh_max_num_contexts;
 	u32	supported_coalesce_params;
 	u32	supported_ring_params;
+	u32	supported_hwtstamp_qualifiers;
 	void	(*get_drvinfo)(struct net_device *, struct ethtool_drvinfo *);
 	int	(*get_regs_len)(struct net_device *);
 	void	(*get_regs)(struct net_device *, struct ethtool_regs *, void *);
diff --git a/include/uapi/linux/ethtool_netlink_generated.h b/include/uapi/linux/ethtool_netlink_generated.h
index b58f352fe4f2..df289dde0f61 100644
--- a/include/uapi/linux/ethtool_netlink_generated.h
+++ b/include/uapi/linux/ethtool_netlink_generated.h
@@ -385,6 +385,15 @@ enum {
 	ETHTOOL_A_TS_STAT_MAX = (__ETHTOOL_A_TS_STAT_CNT - 1)
 };
 
+enum {
+	ETHTOOL_A_TS_HWTSTAMP_PROVIDER_UNSPEC,
+	ETHTOOL_A_TS_HWTSTAMP_PROVIDER_INDEX,
+	ETHTOOL_A_TS_HWTSTAMP_PROVIDER_QUALIFIER,
+
+	__ETHTOOL_A_TS_HWTSTAMP_PROVIDER_CNT,
+	ETHTOOL_A_TS_HWTSTAMP_PROVIDER_MAX = (__ETHTOOL_A_TS_HWTSTAMP_PROVIDER_CNT - 1)
+};
+
 enum {
 	ETHTOOL_A_TSINFO_UNSPEC,
 	ETHTOOL_A_TSINFO_HEADER,
@@ -393,6 +402,7 @@ enum {
 	ETHTOOL_A_TSINFO_RX_FILTERS,
 	ETHTOOL_A_TSINFO_PHC_INDEX,
 	ETHTOOL_A_TSINFO_STATS,
+	ETHTOOL_A_TSINFO_HWTSTAMP_PROVIDER,
 
 	__ETHTOOL_A_TSINFO_CNT,
 	ETHTOOL_A_TSINFO_MAX = (__ETHTOOL_A_TSINFO_CNT - 1)
diff --git a/net/ethtool/common.c b/net/ethtool/common.c
index 05ce4f8080b3..666db40bcfda 100644
--- a/net/ethtool/common.c
+++ b/net/ethtool/common.c
@@ -5,9 +5,12 @@
 #include <linux/phy.h>
 #include <linux/rtnetlink.h>
 #include <linux/ptp_clock_kernel.h>
+#include <linux/phy_link_topology.h>
 
 #include "netlink.h"
 #include "common.h"
+#include "../core/dev.h"
+
 
 const char netdev_features_strings[NETDEV_FEATURE_COUNT][ETH_GSTRING_LEN] = {
 	[NETIF_F_SG_BIT] =               "tx-scatter-gather",
@@ -763,20 +766,91 @@ int ethtool_check_ops(const struct ethtool_ops *ops)
 	return 0;
 }
 
-int __ethtool_get_ts_info(struct net_device *dev, struct kernel_ethtool_ts_info *info)
+static void ethtool_init_tsinfo(struct kernel_ethtool_ts_info *info)
 {
-	const struct ethtool_ops *ops = dev->ethtool_ops;
-	struct phy_device *phydev = dev->phydev;
-	int err = 0;
-
 	memset(info, 0, sizeof(*info));
 	info->cmd = ETHTOOL_GET_TS_INFO;
 	info->phc_index = -1;
+}
+
+int ethtool_net_get_ts_info_by_phc(struct net_device *dev,
+				   struct kernel_ethtool_ts_info *info,
+				   struct hwtstamp_provider_desc *hwprov_desc)
+{
+	const struct ethtool_ops *ops = dev->ethtool_ops;
+	int err;
+
+	if (!ops->get_ts_info)
+		return -ENODEV;
+
+	/* Does ptp comes from netdev */
+	ethtool_init_tsinfo(info);
+	info->phc_qualifier = hwprov_desc->qualifier;
+	err = ops->get_ts_info(dev, info);
+	if (err)
+		return err;
+
+	if (info->phc_index == hwprov_desc->index &&
+	    net_support_hwtstamp_qualifier(dev, hwprov_desc->qualifier))
+		return 0;
+
+	return -ENODEV;
+}
+
+int
+ethtool_phy_get_ts_info_by_phc(struct net_device *dev,
+			       struct kernel_ethtool_ts_info *info,
+			       struct hwtstamp_provider_desc *hwprov_desc)
+{
+	int err;
+
+	/* Only precise qualifier is supported in phydev */
+	if (hwprov_desc->qualifier != HWTSTAMP_PROVIDER_QUALIFIER_PRECISE)
+		return -ENODEV;
+
+	/* Look in the phy topology */
+	if (dev->link_topo) {
+		struct phy_device_node *pdn;
+		unsigned long phy_index;
+
+		xa_for_each(&dev->link_topo->phys, phy_index, pdn) {
+			if (!phy_has_tsinfo(pdn->phy))
+				continue;
+
+			ethtool_init_tsinfo(info);
+			err = phy_ts_info(pdn->phy, info);
+			if (err)
+				return err;
+
+			if (info->phc_index == hwprov_desc->index)
+				return 0;
+		}
+		return -ENODEV;
+	}
+
+	/* Look on the dev->phydev */
+	if (phy_has_tsinfo(dev->phydev)) {
+		ethtool_init_tsinfo(info);
+		err = phy_ts_info(dev->phydev, info);
+		if (err)
+			return err;
+
+		if (info->phc_index == hwprov_desc->index)
+			return 0;
+	}
+
+	return -ENODEV;
+}
+
+int ethtool_get_ts_info_by_phc(struct net_device *dev,
+			       struct kernel_ethtool_ts_info *info,
+			       struct hwtstamp_provider_desc *hwprov_desc)
+{
+	int err;
 
-	if (phy_is_default_hwtstamp(phydev) && phy_has_tsinfo(phydev))
-		err = phy_ts_info(phydev, info);
-	else if (ops->get_ts_info)
-		err = ops->get_ts_info(dev, info);
+	err = ethtool_net_get_ts_info_by_phc(dev, info, hwprov_desc);
+	if (err == -ENODEV)
+		err = ethtool_phy_get_ts_info_by_phc(dev, info, hwprov_desc);
 
 	info->so_timestamping |= SOF_TIMESTAMPING_RX_SOFTWARE |
 				 SOF_TIMESTAMPING_SOFTWARE;
@@ -784,6 +858,55 @@ int __ethtool_get_ts_info(struct net_device *dev, struct kernel_ethtool_ts_info
 	return err;
 }
 
+int __ethtool_get_ts_info(struct net_device *dev,
+			  struct kernel_ethtool_ts_info *info)
+{
+	struct hwtstamp_provider *hwprov;
+
+	hwprov = rtnl_dereference(dev->hwprov);
+	/* No provider specified, use default behavior */
+	if (!hwprov) {
+		const struct ethtool_ops *ops = dev->ethtool_ops;
+		struct phy_device *phydev = dev->phydev;
+		int err = 0;
+
+		ethtool_init_tsinfo(info);
+		if (phy_is_default_hwtstamp(phydev) &&
+		    phy_has_tsinfo(phydev))
+			err = phy_ts_info(phydev, info);
+		else if (ops->get_ts_info)
+			err = ops->get_ts_info(dev, info);
+
+		info->so_timestamping |= SOF_TIMESTAMPING_RX_SOFTWARE |
+					 SOF_TIMESTAMPING_SOFTWARE;
+
+		return err;
+	}
+
+	return ethtool_get_ts_info_by_phc(dev, info, &hwprov->desc);
+}
+
+bool net_support_hwtstamp_qualifier(struct net_device *dev,
+				    enum hwtstamp_provider_qualifier qualifier)
+{
+	const struct ethtool_ops *ops = dev->ethtool_ops;
+
+	if (!ops)
+		return false;
+
+	/* Return true with precise qualifier and with NIC without
+	 * qualifier description to not break the old behavior.
+	 */
+	if (!ops->supported_hwtstamp_qualifiers &&
+	    qualifier == HWTSTAMP_PROVIDER_QUALIFIER_PRECISE)
+		return true;
+
+	if (ops->supported_hwtstamp_qualifiers & BIT(qualifier))
+		return true;
+
+	return false;
+}
+
 int ethtool_get_phc_vclocks(struct net_device *dev, int **vclock_index)
 {
 	struct kernel_ethtool_ts_info info = { };
diff --git a/net/ethtool/common.h b/net/ethtool/common.h
index 4a2de3ce7354..f5119204c8ff 100644
--- a/net/ethtool/common.h
+++ b/net/ethtool/common.h
@@ -21,6 +21,7 @@ struct link_mode_info {
 };
 
 struct genl_info;
+struct hwtstamp_provider_desc;
 
 extern const char
 netdev_features_strings[NETDEV_FEATURE_COUNT][ETH_GSTRING_LEN];
@@ -49,6 +50,18 @@ int ethtool_check_max_channel(struct net_device *dev,
 			      struct genl_info *info);
 int ethtool_check_rss_ctx_busy(struct net_device *dev, u32 rss_context);
 int __ethtool_get_ts_info(struct net_device *dev, struct kernel_ethtool_ts_info *info);
+int ethtool_get_ts_info_by_phc(struct net_device *dev,
+			       struct kernel_ethtool_ts_info *info,
+			       struct hwtstamp_provider_desc *hwprov_desc);
+int ethtool_net_get_ts_info_by_phc(struct net_device *dev,
+				   struct kernel_ethtool_ts_info *info,
+				   struct hwtstamp_provider_desc *hwprov_desc);
+int
+ethtool_phy_get_ts_info_by_phc(struct net_device *dev,
+			       struct kernel_ethtool_ts_info *info,
+			       struct hwtstamp_provider_desc *hwprov_desc);
+bool net_support_hwtstamp_qualifier(struct net_device *dev,
+				    enum hwtstamp_provider_qualifier qualifier);
 
 extern const struct ethtool_phy_ops *ethtool_phy_ops;
 extern const struct ethtool_pse_ops *ethtool_pse_ops;
diff --git a/net/ethtool/netlink.c b/net/ethtool/netlink.c
index e3f0ef6b851b..6ae1d91f36e7 100644
--- a/net/ethtool/netlink.c
+++ b/net/ethtool/netlink.c
@@ -1074,9 +1074,9 @@ static const struct genl_ops ethtool_genl_ops[] = {
 	{
 		.cmd	= ETHTOOL_MSG_TSINFO_GET,
 		.doit	= ethnl_default_doit,
-		.start	= ethnl_default_start,
-		.dumpit	= ethnl_default_dumpit,
-		.done	= ethnl_default_done,
+		.start	= ethnl_tsinfo_start,
+		.dumpit	= ethnl_tsinfo_dumpit,
+		.done	= ethnl_tsinfo_done,
 		.policy = ethnl_tsinfo_get_policy,
 		.maxattr = ARRAY_SIZE(ethnl_tsinfo_get_policy) - 1,
 	},
diff --git a/net/ethtool/netlink.h b/net/ethtool/netlink.h
index 203b08eb6c6f..960cda13e4fc 100644
--- a/net/ethtool/netlink.h
+++ b/net/ethtool/netlink.h
@@ -464,7 +464,7 @@ extern const struct nla_policy ethnl_pause_get_policy[ETHTOOL_A_PAUSE_STATS_SRC
 extern const struct nla_policy ethnl_pause_set_policy[ETHTOOL_A_PAUSE_TX + 1];
 extern const struct nla_policy ethnl_eee_get_policy[ETHTOOL_A_EEE_HEADER + 1];
 extern const struct nla_policy ethnl_eee_set_policy[ETHTOOL_A_EEE_TX_LPI_TIMER + 1];
-extern const struct nla_policy ethnl_tsinfo_get_policy[ETHTOOL_A_TSINFO_HEADER + 1];
+extern const struct nla_policy ethnl_tsinfo_get_policy[ETHTOOL_A_TSINFO_MAX + 1];
 extern const struct nla_policy ethnl_cable_test_act_policy[ETHTOOL_A_CABLE_TEST_HEADER + 1];
 extern const struct nla_policy ethnl_cable_test_tdr_act_policy[ETHTOOL_A_CABLE_TEST_TDR_CFG + 1];
 extern const struct nla_policy ethnl_tunnel_info_get_policy[ETHTOOL_A_TUNNEL_INFO_HEADER + 1];
@@ -499,6 +499,9 @@ int ethnl_phy_start(struct netlink_callback *cb);
 int ethnl_phy_doit(struct sk_buff *skb, struct genl_info *info);
 int ethnl_phy_dumpit(struct sk_buff *skb, struct netlink_callback *cb);
 int ethnl_phy_done(struct netlink_callback *cb);
+int ethnl_tsinfo_start(struct netlink_callback *cb);
+int ethnl_tsinfo_dumpit(struct sk_buff *skb, struct netlink_callback *cb);
+int ethnl_tsinfo_done(struct netlink_callback *cb);
 
 extern const char stats_std_names[__ETHTOOL_STATS_CNT][ETH_GSTRING_LEN];
 extern const char stats_eth_phy_names[__ETHTOOL_A_STATS_ETH_PHY_CNT][ETH_GSTRING_LEN];
diff --git a/net/ethtool/ts.h b/net/ethtool/ts.h
new file mode 100644
index 000000000000..d901a879a671
--- /dev/null
+++ b/net/ethtool/ts.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef _NET_ETHTOOL_TS_H
+#define _NET_ETHTOOL_TS_H
+
+#include "netlink.h"
+
+static const struct nla_policy
+ethnl_ts_hwtst_prov_policy[ETHTOOL_A_TS_HWTSTAMP_PROVIDER_MAX + 1] = {
+	[ETHTOOL_A_TS_HWTSTAMP_PROVIDER_INDEX] = { .type = NLA_U32 },
+	[ETHTOOL_A_TS_HWTSTAMP_PROVIDER_QUALIFIER] =
+		NLA_POLICY_MAX(NLA_U32, HWTSTAMP_PROVIDER_QUALIFIER_CNT - 1)
+};
+
+int ts_parse_hwtst_provider(const struct nlattr *nest,
+			    struct hwtstamp_provider_desc *hwprov_desc,
+			    struct netlink_ext_ack *extack,
+			    bool *mod);
+
+#endif /* _NET_ETHTOOL_TS_H */
diff --git a/net/ethtool/tsinfo.c b/net/ethtool/tsinfo.c
index 03d12d6f79ca..7e495a41aeec 100644
--- a/net/ethtool/tsinfo.c
+++ b/net/ethtool/tsinfo.c
@@ -1,13 +1,18 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
 #include <linux/net_tstamp.h>
+#include <linux/phy.h>
+#include <linux/phy_link_topology.h>
+#include <linux/ptp_clock_kernel.h>
 
 #include "netlink.h"
 #include "common.h"
 #include "bitset.h"
+#include "ts.h"
 
 struct tsinfo_req_info {
 	struct ethnl_req_info		base;
+	struct hwtstamp_provider_desc	hwprov_desc;
 };
 
 struct tsinfo_reply_data {
@@ -16,34 +21,96 @@ struct tsinfo_reply_data {
 	struct ethtool_ts_stats		stats;
 };
 
+#define TSINFO_REQINFO(__req_base) \
+	container_of(__req_base, struct tsinfo_req_info, base)
+
 #define TSINFO_REPDATA(__reply_base) \
 	container_of(__reply_base, struct tsinfo_reply_data, base)
 
 #define ETHTOOL_TS_STAT_CNT \
 	(__ETHTOOL_A_TS_STAT_CNT - (ETHTOOL_A_TS_STAT_UNSPEC + 1))
 
-const struct nla_policy ethnl_tsinfo_get_policy[] = {
+const struct nla_policy ethnl_tsinfo_get_policy[ETHTOOL_A_TSINFO_MAX + 1] = {
 	[ETHTOOL_A_TSINFO_HEADER]		=
 		NLA_POLICY_NESTED(ethnl_header_policy_stats),
+	[ETHTOOL_A_TSINFO_HWTSTAMP_PROVIDER] =
+		NLA_POLICY_NESTED(ethnl_ts_hwtst_prov_policy),
 };
 
+int ts_parse_hwtst_provider(const struct nlattr *nest,
+			    struct hwtstamp_provider_desc *hwprov_desc,
+			    struct netlink_ext_ack *extack,
+			    bool *mod)
+{
+	struct nlattr *tb[ARRAY_SIZE(ethnl_ts_hwtst_prov_policy)];
+	int ret;
+
+	ret = nla_parse_nested(tb,
+			       ARRAY_SIZE(ethnl_ts_hwtst_prov_policy) - 1,
+			       nest,
+			       ethnl_ts_hwtst_prov_policy, extack);
+	if (ret < 0)
+		return ret;
+
+	if (NL_REQ_ATTR_CHECK(extack, nest, tb,
+			      ETHTOOL_A_TS_HWTSTAMP_PROVIDER_INDEX) ||
+	    NL_REQ_ATTR_CHECK(extack, nest, tb,
+			      ETHTOOL_A_TS_HWTSTAMP_PROVIDER_QUALIFIER))
+		return -EINVAL;
+
+	ethnl_update_u32(&hwprov_desc->index,
+			 tb[ETHTOOL_A_TS_HWTSTAMP_PROVIDER_INDEX],
+			 mod);
+	ethnl_update_u32(&hwprov_desc->qualifier,
+			 tb[ETHTOOL_A_TS_HWTSTAMP_PROVIDER_QUALIFIER],
+			 mod);
+
+	return 0;
+}
+
+static int
+tsinfo_parse_request(struct ethnl_req_info *req_base, struct nlattr **tb,
+		     struct netlink_ext_ack *extack)
+{
+	struct tsinfo_req_info *req = TSINFO_REQINFO(req_base);
+	bool mod = false;
+
+	req->hwprov_desc.index = -1;
+
+	if (!tb[ETHTOOL_A_TSINFO_HWTSTAMP_PROVIDER])
+		return 0;
+
+	return ts_parse_hwtst_provider(tb[ETHTOOL_A_TSINFO_HWTSTAMP_PROVIDER],
+				       &req->hwprov_desc, extack, &mod);
+}
+
 static int tsinfo_prepare_data(const struct ethnl_req_info *req_base,
 			       struct ethnl_reply_data *reply_base,
 			       const struct genl_info *info)
 {
 	struct tsinfo_reply_data *data = TSINFO_REPDATA(reply_base);
+	struct tsinfo_req_info *req = TSINFO_REQINFO(req_base);
 	struct net_device *dev = reply_base->dev;
 	int ret;
 
 	ret = ethnl_ops_begin(dev);
 	if (ret < 0)
 		return ret;
+
+	if (req->hwprov_desc.index != -1) {
+		ret = ethtool_get_ts_info_by_phc(dev, &data->ts_info,
+						 &req->hwprov_desc);
+		ethnl_ops_complete(dev);
+		return ret;
+	}
+
 	if (req_base->flags & ETHTOOL_FLAG_STATS) {
 		ethtool_stats_init((u64 *)&data->stats,
 				   sizeof(data->stats) / sizeof(u64));
 		if (dev->ethtool_ops->get_ts_stats)
 			dev->ethtool_ops->get_ts_stats(dev, &data->stats);
 	}
+
 	ret = __ethtool_get_ts_info(dev, &data->ts_info);
 	ethnl_ops_complete(dev);
 
@@ -87,8 +154,11 @@ static int tsinfo_reply_size(const struct ethnl_req_info *req_base,
 			return ret;
 		len += ret;	/* _TSINFO_RX_FILTERS */
 	}
-	if (ts_info->phc_index >= 0)
+	if (ts_info->phc_index >= 0) {
 		len += nla_total_size(sizeof(u32));	/* _TSINFO_PHC_INDEX */
+		/* _TSINFO_HWTSTAMP_PROVIDER */
+		len += nla_total_size(0) + 2 * nla_total_size(sizeof(u32));
+	}
 	if (req_base->flags & ETHTOOL_FLAG_STATS)
 		len += nla_total_size(0) + /* _TSINFO_STATS */
 		       nla_total_size_64bit(sizeof(u64)) * ETHTOOL_TS_STAT_CNT;
@@ -163,9 +233,29 @@ static int tsinfo_fill_reply(struct sk_buff *skb,
 		if (ret < 0)
 			return ret;
 	}
-	if (ts_info->phc_index >= 0 &&
-	    nla_put_u32(skb, ETHTOOL_A_TSINFO_PHC_INDEX, ts_info->phc_index))
-		return -EMSGSIZE;
+	if (ts_info->phc_index >= 0) {
+		struct nlattr *nest;
+
+		ret = nla_put_u32(skb, ETHTOOL_A_TSINFO_PHC_INDEX,
+				  ts_info->phc_index);
+		if (ret)
+			return -EMSGSIZE;
+
+		nest = nla_nest_start(skb, ETHTOOL_A_TSINFO_HWTSTAMP_PROVIDER);
+		if (!nest)
+			return -EMSGSIZE;
+
+		if (nla_put_u32(skb, ETHTOOL_A_TS_HWTSTAMP_PROVIDER_INDEX,
+				ts_info->phc_index) ||
+		    nla_put_u32(skb,
+				ETHTOOL_A_TS_HWTSTAMP_PROVIDER_QUALIFIER,
+				ts_info->phc_qualifier)) {
+			nla_nest_cancel(skb, nest);
+			return -EMSGSIZE;
+		}
+
+		nla_nest_end(skb, nest);
+	}
 	if (req_base->flags & ETHTOOL_FLAG_STATS &&
 	    tsinfo_put_stats(skb, &data->stats))
 		return -EMSGSIZE;
@@ -173,6 +263,263 @@ static int tsinfo_fill_reply(struct sk_buff *skb,
 	return 0;
 }
 
+struct ethnl_tsinfo_dump_ctx {
+	struct tsinfo_req_info		*req_info;
+	struct tsinfo_reply_data	*reply_data;
+	unsigned long			pos_ifindex;
+	bool				netdev_dump_done;
+	unsigned long			pos_phyindex;
+	enum hwtstamp_provider_qualifier pos_phcqualifier;
+};
+
+static void *ethnl_tsinfo_prepare_dump(struct sk_buff *skb,
+				       struct net_device *dev,
+				       struct tsinfo_reply_data *reply_data,
+				       struct netlink_callback *cb)
+{
+	struct ethnl_tsinfo_dump_ctx *ctx = (void *)cb->ctx;
+	void *ehdr = NULL;
+
+	ehdr = ethnl_dump_put(skb, cb,
+			      ETHTOOL_MSG_TSINFO_GET_REPLY);
+	if (!ehdr)
+		return ERR_PTR(-EMSGSIZE);
+
+	reply_data = ctx->reply_data;
+	memset(reply_data, 0, sizeof(*reply_data));
+	reply_data->base.dev = dev;
+	memset(&reply_data->ts_info, 0, sizeof(reply_data->ts_info));
+
+	return ehdr;
+}
+
+static int ethnl_tsinfo_end_dump(struct sk_buff *skb,
+				 struct net_device *dev,
+				 struct tsinfo_req_info *req_info,
+				 struct tsinfo_reply_data *reply_data,
+				 void *ehdr)
+{
+	int ret;
+
+	reply_data->ts_info.so_timestamping |= SOF_TIMESTAMPING_RX_SOFTWARE |
+					       SOF_TIMESTAMPING_SOFTWARE;
+
+	ret = ethnl_fill_reply_header(skb, dev, ETHTOOL_A_TSINFO_HEADER);
+	if (ret < 0)
+		return ret;
+
+	ret = tsinfo_fill_reply(skb, &req_info->base, &reply_data->base);
+	if (ret < 0)
+		return ret;
+
+	reply_data->base.dev = NULL;
+	genlmsg_end(skb, ehdr);
+
+	return ret;
+}
+
+static int ethnl_tsinfo_dump_one_phydev(struct sk_buff *skb,
+					struct net_device *dev,
+					struct phy_device *phydev,
+					struct netlink_callback *cb)
+{
+	struct ethnl_tsinfo_dump_ctx *ctx = (void *)cb->ctx;
+	struct tsinfo_reply_data *reply_data;
+	struct tsinfo_req_info *req_info;
+	void *ehdr = NULL;
+	int ret = 0;
+
+	if (!phy_has_tsinfo(phydev))
+		return -EOPNOTSUPP;
+
+	reply_data = ctx->reply_data;
+	req_info = ctx->req_info;
+	ehdr = ethnl_tsinfo_prepare_dump(skb, dev, reply_data, cb);
+	if (IS_ERR(ehdr))
+		return PTR_ERR(ehdr);
+
+	ret = phy_ts_info(phydev, &reply_data->ts_info);
+	if (ret < 0)
+		goto err;
+
+	ret = ethnl_tsinfo_end_dump(skb, dev, req_info, reply_data, ehdr);
+	if (ret < 0)
+		goto err;
+
+	return ret;
+err:
+	genlmsg_cancel(skb, ehdr);
+	return ret;
+}
+
+static int ethnl_tsinfo_dump_one_netdev(struct sk_buff *skb,
+					struct net_device *dev,
+					struct netlink_callback *cb)
+{
+	struct ethnl_tsinfo_dump_ctx *ctx = (void *)cb->ctx;
+	const struct ethtool_ops *ops = dev->ethtool_ops;
+	struct tsinfo_reply_data *reply_data;
+	struct tsinfo_req_info *req_info;
+	void *ehdr = NULL;
+	int ret = 0;
+
+	if (!ops->get_ts_info)
+		return -EOPNOTSUPP;
+
+	reply_data = ctx->reply_data;
+	req_info = ctx->req_info;
+	for (; ctx->pos_phcqualifier < HWTSTAMP_PROVIDER_QUALIFIER_CNT;
+	     ctx->pos_phcqualifier++) {
+		if (!net_support_hwtstamp_qualifier(dev,
+						    ctx->pos_phcqualifier))
+			continue;
+
+		ehdr = ethnl_tsinfo_prepare_dump(skb, dev, reply_data, cb);
+		if (IS_ERR(ehdr)) {
+			ret = PTR_ERR(ehdr);
+			goto err;
+		}
+
+		reply_data->ts_info.phc_qualifier = ctx->pos_phcqualifier;
+		ret = ops->get_ts_info(dev, &reply_data->ts_info);
+		if (ret < 0)
+			goto err;
+
+		ret = ethnl_tsinfo_end_dump(skb, dev, req_info, reply_data,
+					    ehdr);
+		if (ret < 0)
+			goto err;
+	}
+
+	return ret;
+
+err:
+	genlmsg_cancel(skb, ehdr);
+	return ret;
+}
+
+static int ethnl_tsinfo_dump_one_net_topo(struct sk_buff *skb,
+					  struct net_device *dev,
+					  struct netlink_callback *cb)
+{
+	struct ethnl_tsinfo_dump_ctx *ctx = (void *)cb->ctx;
+	struct phy_device_node *pdn;
+	int ret = 0;
+
+	if (!ctx->netdev_dump_done) {
+		ret = ethnl_tsinfo_dump_one_netdev(skb, dev, cb);
+		if (ret < 0 && ret != -EOPNOTSUPP)
+			return ret;
+		ctx->netdev_dump_done = true;
+	}
+
+	if (!dev->link_topo) {
+		if (phy_has_tsinfo(dev->phydev)) {
+			ret = ethnl_tsinfo_dump_one_phydev(skb, dev,
+							   dev->phydev, cb);
+			if (ret < 0 && ret != -EOPNOTSUPP)
+				return ret;
+		}
+
+		return 0;
+	}
+
+	xa_for_each_start(&dev->link_topo->phys, ctx->pos_phyindex, pdn,
+			  ctx->pos_phyindex) {
+		if (phy_has_tsinfo(pdn->phy)) {
+			ret = ethnl_tsinfo_dump_one_phydev(skb, dev,
+							   pdn->phy, cb);
+			if (ret < 0 && ret != -EOPNOTSUPP)
+				return ret;
+		}
+	}
+
+	return ret;
+}
+
+int ethnl_tsinfo_dumpit(struct sk_buff *skb, struct netlink_callback *cb)
+{
+	struct ethnl_tsinfo_dump_ctx *ctx = (void *)cb->ctx;
+	struct net *net = sock_net(skb->sk);
+	struct net_device *dev;
+	int ret = 0;
+
+	rtnl_lock();
+	if (ctx->req_info->base.dev) {
+		ret = ethnl_tsinfo_dump_one_net_topo(skb,
+						     ctx->req_info->base.dev,
+						     cb);
+	} else {
+		for_each_netdev_dump(net, dev, ctx->pos_ifindex) {
+			ret = ethnl_tsinfo_dump_one_net_topo(skb, dev, cb);
+			if (ret < 0 && ret != -EOPNOTSUPP)
+				break;
+			ctx->pos_phyindex = 0;
+			ctx->netdev_dump_done = false;
+			ctx->pos_phcqualifier = HWTSTAMP_PROVIDER_QUALIFIER_PRECISE;
+		}
+	}
+	rtnl_unlock();
+
+	return ret;
+}
+
+int ethnl_tsinfo_start(struct netlink_callback *cb)
+{
+	const struct genl_dumpit_info *info = genl_dumpit_info(cb);
+	struct ethnl_tsinfo_dump_ctx *ctx = (void *)cb->ctx;
+	struct nlattr **tb = info->info.attrs;
+	struct tsinfo_reply_data *reply_data;
+	struct tsinfo_req_info *req_info;
+	int ret;
+
+	BUILD_BUG_ON(sizeof(*ctx) > sizeof(cb->ctx));
+
+	req_info = kzalloc(sizeof(*req_info), GFP_KERNEL);
+	if (!req_info)
+		return -ENOMEM;
+	reply_data = kzalloc(sizeof(*reply_data), GFP_KERNEL);
+	if (!reply_data) {
+		ret = -ENOMEM;
+		goto free_req_info;
+	}
+
+	ret = ethnl_parse_header_dev_get(&req_info->base,
+					 tb[ETHTOOL_A_TSINFO_HEADER],
+					 sock_net(cb->skb->sk), cb->extack,
+					 false);
+	if (ret < 0)
+		goto free_reply_data;
+
+	ctx->req_info = req_info;
+	ctx->reply_data = reply_data;
+	ctx->pos_ifindex = 0;
+	ctx->pos_phyindex = 0;
+	ctx->netdev_dump_done = false;
+	ctx->pos_phcqualifier = HWTSTAMP_PROVIDER_QUALIFIER_PRECISE;
+
+	return 0;
+
+free_reply_data:
+	kfree(reply_data);
+free_req_info:
+	kfree(req_info);
+
+	return ret;
+}
+
+int ethnl_tsinfo_done(struct netlink_callback *cb)
+{
+	struct ethnl_tsinfo_dump_ctx *ctx = (void *)cb->ctx;
+	struct tsinfo_req_info *req_info = ctx->req_info;
+
+	ethnl_parse_header_dev_put(&req_info->base);
+	kfree(ctx->reply_data);
+	kfree(ctx->req_info);
+
+	return 0;
+}
+
 const struct ethnl_request_ops ethnl_tsinfo_request_ops = {
 	.request_cmd		= ETHTOOL_MSG_TSINFO_GET,
 	.reply_cmd		= ETHTOOL_MSG_TSINFO_GET_REPLY,
@@ -180,6 +527,7 @@ const struct ethnl_request_ops ethnl_tsinfo_request_ops = {
 	.req_info_size		= sizeof(struct tsinfo_req_info),
 	.reply_data_size	= sizeof(struct tsinfo_reply_data),
 
+	.parse_request		= tsinfo_parse_request,
 	.prepare_data		= tsinfo_prepare_data,
 	.reply_size		= tsinfo_reply_size,
 	.fill_reply		= tsinfo_fill_reply,

-- 
2.34.1


