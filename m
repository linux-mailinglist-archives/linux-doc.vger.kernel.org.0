Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B82B5A3C25
	for <lists+linux-doc@lfdr.de>; Sun, 28 Aug 2022 08:34:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232235AbiH1Gbk (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 28 Aug 2022 02:31:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232245AbiH1Gar (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 28 Aug 2022 02:30:47 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA57D32B83
        for <linux-doc@vger.kernel.org>; Sat, 27 Aug 2022 23:30:44 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1oSBoQ-0003bk-1n; Sun, 28 Aug 2022 08:30:26 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ore@pengutronix.de>)
        id 1oSBoP-002QZo-25; Sun, 28 Aug 2022 08:30:25 +0200
Received: from ore by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ore@pengutronix.de>)
        id 1oSBoN-00GdBP-6w; Sun, 28 Aug 2022 08:30:23 +0200
From:   Oleksij Rempel <o.rempel@pengutronix.de>
To:     Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Russell King <linux@armlinux.org.uk>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Oleksij Rempel <o.rempel@pengutronix.de>, kernel@pengutronix.de,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
        David Jander <david@protonic.nl>,
        Luka Perkov <luka.perkov@sartura.hr>,
        Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH net-next v4 4/7] net: mdiobus: search for PSE nodes by parsing PHY nodes.
Date:   Sun, 28 Aug 2022 08:30:18 +0200
Message-Id: <20220828063021.3963761-5-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220828063021.3963761-1-o.rempel@pengutronix.de>
References: <20220828063021.3963761-1-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-doc@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Some PHYs can be linked with PSE (Power Sourcing Equipment), so search
for related nodes and attach it to the phydev.

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
changes v4:
- add Reviewed-by: Andrew Lunn
- put pse_control_put() after unregister_mii_timestamper()
changes v3
- remove is_acpi_node() check
- rework fwnode_find_pse_control() error handling
---
 drivers/net/mdio/fwnode_mdio.c | 34 ++++++++++++++++++++++++++++++++--
 drivers/net/phy/phy_device.c   |  2 ++
 include/linux/phy.h            |  2 ++
 3 files changed, 36 insertions(+), 2 deletions(-)

diff --git a/drivers/net/mdio/fwnode_mdio.c b/drivers/net/mdio/fwnode_mdio.c
index e78ad55c0e091..8e8296964c4e6 100644
--- a/drivers/net/mdio/fwnode_mdio.c
+++ b/drivers/net/mdio/fwnode_mdio.c
@@ -10,10 +10,28 @@
 #include <linux/fwnode_mdio.h>
 #include <linux/of.h>
 #include <linux/phy.h>
+#include <linux/pse-pd/pse.h>
 
 MODULE_AUTHOR("Calvin Johnson <calvin.johnson@oss.nxp.com>");
 MODULE_LICENSE("GPL");
 
+static struct pse_control *
+fwnode_find_pse_control(struct fwnode_handle *fwnode)
+{
+	struct pse_control *psec;
+	struct device_node *np;
+
+	np = to_of_node(fwnode);
+	if (!np)
+		return NULL;
+
+	psec = of_pse_control_get(np);
+	if (PTR_ERR(psec) == -ENOENT)
+		return NULL;
+
+	return psec;
+}
+
 static struct mii_timestamper *
 fwnode_find_mii_timestamper(struct fwnode_handle *fwnode)
 {
@@ -89,14 +107,21 @@ int fwnode_mdiobus_register_phy(struct mii_bus *bus,
 				struct fwnode_handle *child, u32 addr)
 {
 	struct mii_timestamper *mii_ts = NULL;
+	struct pse_control *psec = NULL;
 	struct phy_device *phy;
 	bool is_c45 = false;
 	u32 phy_id;
 	int rc;
 
+	psec = fwnode_find_pse_control(child);
+	if (IS_ERR(psec))
+		return PTR_ERR(psec);
+
 	mii_ts = fwnode_find_mii_timestamper(child);
-	if (IS_ERR(mii_ts))
-		return PTR_ERR(mii_ts);
+	if (IS_ERR(mii_ts)) {
+		rc = PTR_ERR(mii_ts);
+		goto clean_pse;
+	}
 
 	rc = fwnode_property_match_string(child, "compatible",
 					  "ethernet-phy-ieee802.3-c45");
@@ -132,18 +157,23 @@ int fwnode_mdiobus_register_phy(struct mii_bus *bus,
 			goto clean_phy;
 	}
 
+	phy->psec = psec;
+
 	/* phy->mii_ts may already be defined by the PHY driver. A
 	 * mii_timestamper probed via the device tree will still have
 	 * precedence.
 	 */
 	if (mii_ts)
 		phy->mii_ts = mii_ts;
+
 	return 0;
 
 clean_phy:
 	phy_device_free(phy);
 clean_mii_ts:
 	unregister_mii_timestamper(mii_ts);
+clean_pse:
+	pse_control_put(psec);
 
 	return rc;
 }
diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 12ff276b80aed..e54b7200ad211 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -26,6 +26,7 @@
 #include <linux/netdevice.h>
 #include <linux/phy.h>
 #include <linux/phy_led_triggers.h>
+#include <linux/pse-pd/pse.h>
 #include <linux/property.h>
 #include <linux/sfp.h>
 #include <linux/skbuff.h>
@@ -989,6 +990,7 @@ EXPORT_SYMBOL(phy_device_register);
 void phy_device_remove(struct phy_device *phydev)
 {
 	unregister_mii_timestamper(phydev->mii_ts);
+	pse_control_put(phydev->psec);
 
 	device_del(&phydev->mdio.dev);
 
diff --git a/include/linux/phy.h b/include/linux/phy.h
index 7c49ab95441b1..472df77935ec6 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -592,6 +592,7 @@ struct macsec_ops;
  * @master_slave_get: Current master/slave advertisement
  * @master_slave_state: Current master/slave configuration
  * @mii_ts: Pointer to time stamper callbacks
+ * @psec: Pointer to Power Sourcing Equipment control struct
  * @lock:  Mutex for serialization access to PHY
  * @state_queue: Work queue for state machine
  * @shared: Pointer to private data shared by phys in one package
@@ -705,6 +706,7 @@ struct phy_device {
 	struct phylink *phylink;
 	struct net_device *attached_dev;
 	struct mii_timestamper *mii_ts;
+	struct pse_control *psec;
 
 	u8 mdix;
 	u8 mdix_ctrl;
-- 
2.30.2

