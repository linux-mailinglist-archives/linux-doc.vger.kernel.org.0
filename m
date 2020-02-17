Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EBC461618B6
	for <lists+linux-doc@lfdr.de>; Mon, 17 Feb 2020 18:24:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729233AbgBQRYG (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 17 Feb 2020 12:24:06 -0500
Received: from pandora.armlinux.org.uk ([78.32.30.218]:39548 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728841AbgBQRYF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 17 Feb 2020 12:24:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
        In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=v/HoSDKH8XuQ+DqHoJRir0GrTg1vUAuezu/JDbxXUm0=; b=oBC7nrGNTWhqsBSisQAfWdj+P3
        zYgt+Q/CLA06thLf+JWbYu+1Il57LVCubET5Gi5mNCp3DJuQ/382FnGHA7cJZ9t43SiYYO8g0mwPf
        aSYBIqpIwdDfp5jrrOSd14vimcCcf71TnXl1+mouiwLAzOLdy9v9BNjzT6ZfUYkVAUOrT8T2M8ueX
        I/cMFLiSZh/4QlbJKvlNu932tZFpMWD+0I2qxnr3i1uwh8Cll224u9q/P1JjOLHTqtz9goESWTxWb
        zGMs1dvBa0OpIJLkUTsCRPIzsvSrQSozKxQZhoV+DrXdtG1Z+u7SvTeMwg/obQYCwO3F75Kck5vl9
        wygivHpg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([2001:4d48:ad52:3201:222:68ff:fe15:37dd]:52828 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1j3k7f-00026x-0J; Mon, 17 Feb 2020 17:23:55 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1j3k7e-00071q-3R; Mon, 17 Feb 2020 17:23:54 +0000
In-Reply-To: <20200217172242.GZ25745@shell.armlinux.org.uk>
References: <20200217172242.GZ25745@shell.armlinux.org.uk>
From:   Russell King <rmk+kernel@armlinux.org.uk>
To:     Andrew Lunn <andrew@lunn.ch>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Heiner Kallweit <hkallweit1@gmail.com>
Cc:     "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
        Jakub Kicinski <kuba@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Ioana Radulescu <ruxandra.radulescu@nxp.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Felix Fietkau <nbd@openwrt.org>,
        John Crispin <john@phrozen.org>,
        Sean Wang <sean.wang@mediatek.com>,
        Mark Lee <Mark-MC.Lee@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Vivien Didelot <vivien.didelot@gmail.com>,
        linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: [CFT 1/8] net: phylink: propagate resolved link config via
 mac_link_up()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1j3k7e-00071q-3R@rmk-PC.armlinux.org.uk>
Date:   Mon, 17 Feb 2020 17:23:54 +0000
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Propagate the resolved link parameters via the mac_link_up() call for
MACs that do not automatically track their PCS state.

Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
---
 Documentation/networking/sfp-phylink.rst      | 17 +++++-
 drivers/net/ethernet/cadence/macb_main.c      |  7 ++-
 .../net/ethernet/freescale/dpaa2/dpaa2-mac.c  |  7 ++-
 drivers/net/ethernet/marvell/mvneta.c         |  8 ++-
 .../net/ethernet/marvell/mvpp2/mvpp2_main.c   | 19 +++++--
 drivers/net/ethernet/mediatek/mtk_eth_soc.c   |  7 ++-
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |  4 +-
 .../net/ethernet/xilinx/xilinx_axienet_main.c |  7 ++-
 drivers/net/phy/phylink.c                     |  9 ++-
 include/linux/phylink.h                       | 57 ++++++++++++++-----
 net/dsa/port.c                                |  4 +-
 11 files changed, 105 insertions(+), 41 deletions(-)

diff --git a/Documentation/networking/sfp-phylink.rst b/Documentation/networking/sfp-phylink.rst
index d753a309f9d1..8d7af28cd835 100644
--- a/Documentation/networking/sfp-phylink.rst
+++ b/Documentation/networking/sfp-phylink.rst
@@ -74,10 +74,13 @@ phylib to the sfp/phylink support.  Please send patches to improve
 this documentation.
 
 1. Optionally split the network driver's phylib update function into
-   three parts dealing with link-down, link-up and reconfiguring the
-   MAC settings. This can be done as a separate preparation commit.
+   two parts dealing with link-down and link-up. This can be done as
+   a separate preparation commit.
 
-   An example of this preparation can be found in git commit fc548b991fb0.
+   An older example of this preparation can be found in git commit
+   fc548b991fb0, although this was splitting into three parts; the
+   link-up part now includes configuring the MAC for the link settings.
+   Please see :c:func:`mac_link_up` for more information on this.
 
 2. Replace::
 
@@ -207,6 +210,14 @@ this documentation.
    using. This is particularly important for in-band negotiation
    methods such as 1000base-X and SGMII.
 
+   The :c:func:`mac_link_up` method is used to inform the MAC that the
+   link has come up. The call includes the negotiation mode and interface
+   for reference only. The finalised link parameters are also supplied
+   (speed, duplex and flow control/pause enablement settings) which
+   should be used to configure the MAC when the MAC and PCS are not
+   tightly integrated, or when the settings are not coming from in-band
+   negotiation.
+
    The :c:func:`mac_config` method is used to update the MAC with the
    requested state, and must avoid unnecessarily taking the link down
    when making changes to the MAC configuration.  This means the
diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index 4508f0d150da..92e0c1035db8 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -619,8 +619,11 @@ static void macb_mac_link_down(struct phylink_config *config, unsigned int mode,
 	netif_tx_stop_all_queues(ndev);
 }
 
-static void macb_mac_link_up(struct phylink_config *config, unsigned int mode,
-			     phy_interface_t interface, struct phy_device *phy)
+static void macb_mac_link_up(struct phylink_config *config,
+			     struct phy_device *phy,
+			     unsigned int mode, phy_interface_t interface,
+			     int speed, int duplex,
+			     bool tx_pause, bool rx_pause)
 {
 	struct net_device *ndev = to_net_dev(config->dev);
 	struct macb *bp = netdev_priv(ndev);
diff --git a/drivers/net/ethernet/freescale/dpaa2/dpaa2-mac.c b/drivers/net/ethernet/freescale/dpaa2/dpaa2-mac.c
index 84233e467ed1..3a75c5b58f95 100644
--- a/drivers/net/ethernet/freescale/dpaa2/dpaa2-mac.c
+++ b/drivers/net/ethernet/freescale/dpaa2/dpaa2-mac.c
@@ -154,8 +154,11 @@ static void dpaa2_mac_config(struct phylink_config *config, unsigned int mode,
 		netdev_err(mac->net_dev, "dpmac_set_link_state() = %d\n", err);
 }
 
-static void dpaa2_mac_link_up(struct phylink_config *config, unsigned int mode,
-			      phy_interface_t interface, struct phy_device *phy)
+static void dpaa2_mac_link_up(struct phylink_config *config,
+			      struct phy_device *phy,
+			      unsigned int mode, phy_interface_t interface,
+			      int speed, int duplex,
+			      bool tx_pause, bool rx_pause)
 {
 	struct dpaa2_mac *mac = phylink_to_dpaa2_mac(config);
 	struct dpmac_link_state *dpmac_state = &mac->state;
diff --git a/drivers/net/ethernet/marvell/mvneta.c b/drivers/net/ethernet/marvell/mvneta.c
index b7045b6a15c2..8eb5f7fd3bb2 100644
--- a/drivers/net/ethernet/marvell/mvneta.c
+++ b/drivers/net/ethernet/marvell/mvneta.c
@@ -3952,9 +3952,11 @@ static void mvneta_mac_link_down(struct phylink_config *config,
 	mvneta_set_eee(pp, false);
 }
 
-static void mvneta_mac_link_up(struct phylink_config *config, unsigned int mode,
-			       phy_interface_t interface,
-			       struct phy_device *phy)
+static void mvneta_mac_link_up(struct phylink_config *config,
+			       struct phy_device *phy,
+			       unsigned int mode, phy_interface_t interface,
+			       int speed, int duplex,
+			       bool tx_pause, bool rx_pause)
 {
 	struct net_device *ndev = to_net_dev(config->dev);
 	struct mvneta_port *pp = netdev_priv(ndev);
diff --git a/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c b/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
index 72133cbe55d4..ed8042d97e29 100644
--- a/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
+++ b/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
@@ -58,8 +58,11 @@ static struct {
  */
 static void mvpp2_mac_config(struct phylink_config *config, unsigned int mode,
 			     const struct phylink_link_state *state);
-static void mvpp2_mac_link_up(struct phylink_config *config, unsigned int mode,
-			      phy_interface_t interface, struct phy_device *phy);
+static void mvpp2_mac_link_up(struct phylink_config *config,
+			      struct phy_device *phy,
+			      unsigned int mode, phy_interface_t interface,
+			      int speed, int duplex,
+			      bool tx_pause, bool rx_pause);
 
 /* Queue modes */
 #define MVPP2_QDIST_SINGLE_MODE	0
@@ -3473,8 +3476,9 @@ static void mvpp2_start_dev(struct mvpp2_port *port)
 			.interface = port->phy_interface,
 		};
 		mvpp2_mac_config(&port->phylink_config, MLO_AN_INBAND, &state);
-		mvpp2_mac_link_up(&port->phylink_config, MLO_AN_INBAND,
-				  port->phy_interface, NULL);
+		mvpp2_mac_link_up(&port->phylink_config, NULL,
+				  MLO_AN_INBAND, port->phy_interface,
+				  SPEED_UNKNOWN, DUPLEX_UNKNOWN, false, false);
 	}
 
 	netif_tx_start_all_queues(port->dev);
@@ -5141,8 +5145,11 @@ static void mvpp2_mac_config(struct phylink_config *config, unsigned int mode,
 	mvpp2_port_enable(port);
 }
 
-static void mvpp2_mac_link_up(struct phylink_config *config, unsigned int mode,
-			      phy_interface_t interface, struct phy_device *phy)
+static void mvpp2_mac_link_up(struct phylink_config *config,
+			      struct phy_device *phy,
+			      unsigned int mode, phy_interface_t interface,
+			      int speed, int duplex,
+			      bool tx_pause, bool rx_pause)
 {
 	struct net_device *dev = to_net_dev(config->dev);
 	struct mvpp2_port *port = netdev_priv(dev);
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 8c6cfd15481c..8d28f90acfe7 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -412,9 +412,10 @@ static void mtk_mac_link_down(struct phylink_config *config, unsigned int mode,
 	mtk_w32(mac->hw, mcr, MTK_MAC_MCR(mac->id));
 }
 
-static void mtk_mac_link_up(struct phylink_config *config, unsigned int mode,
-			    phy_interface_t interface,
-			    struct phy_device *phy)
+static void mtk_mac_link_up(struct phylink_config *config,
+			    struct phy_device *phy,
+			    unsigned int mode, phy_interface_t interface,
+			    int speed, int duplex, bool tx_pause, bool rx_pause)
 {
 	struct mtk_mac *mac = container_of(config, struct mtk_mac,
 					   phylink_config);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 5836b21edd7e..c1fa77ecdbe1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -950,8 +950,10 @@ static void stmmac_mac_link_down(struct phylink_config *config,
 }
 
 static void stmmac_mac_link_up(struct phylink_config *config,
+			       struct phy_device *phy,
 			       unsigned int mode, phy_interface_t interface,
-			       struct phy_device *phy)
+			       int speed, int duplex,
+			       bool tx_pause, bool rx_pause)
 {
 	struct stmmac_priv *priv = netdev_priv(to_net_dev(config->dev));
 
diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index 20746b801959..197740781157 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -1486,9 +1486,10 @@ static void axienet_mac_link_down(struct phylink_config *config,
 }
 
 static void axienet_mac_link_up(struct phylink_config *config,
-				unsigned int mode,
-				phy_interface_t interface,
-				struct phy_device *phy)
+				struct phy_device *phy,
+				unsigned int mode, phy_interface_t interface,
+				int speed, int duplex,
+				bool tx_pause, bool rx_pause)
 {
 	/* nothing meaningful to do */
 }
diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 2899fbe699ab..b4367fab7899 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -480,8 +480,11 @@ static void phylink_mac_link_up(struct phylink *pl,
 	struct net_device *ndev = pl->netdev;
 
 	pl->cur_interface = link_state.interface;
-	pl->ops->mac_link_up(pl->config, pl->cur_link_an_mode,
-			     pl->cur_interface, pl->phydev);
+	pl->ops->mac_link_up(pl->config, pl->phydev,
+			     pl->cur_link_an_mode, pl->cur_interface,
+			     link_state.speed, link_state.duplex,
+			     !!(link_state.pause & MLO_PAUSE_TX),
+			     !!(link_state.pause & MLO_PAUSE_RX));
 
 	if (ndev)
 		netif_carrier_on(ndev);
@@ -547,6 +550,8 @@ static void phylink_resolve(struct work_struct *w)
 				link_state.pause = pl->phy_state.pause;
 				phylink_apply_manual_flow(pl, &link_state);
 				phylink_mac_config(pl, &link_state);
+			} else {
+				phylink_apply_manual_flow(pl, &link_state);
 			}
 			break;
 		}
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index 812357c03df4..2180eb1aa254 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -91,9 +91,10 @@ struct phylink_mac_ops {
 	void (*mac_an_restart)(struct phylink_config *config);
 	void (*mac_link_down)(struct phylink_config *config, unsigned int mode,
 			      phy_interface_t interface);
-	void (*mac_link_up)(struct phylink_config *config, unsigned int mode,
-			    phy_interface_t interface,
-			    struct phy_device *phy);
+	void (*mac_link_up)(struct phylink_config *config,
+			    struct phy_device *phy, unsigned int mode,
+			    phy_interface_t interface, int speed, int duplex,
+			    bool tx_pause, bool rx_pause);
 };
 
 #if 0 /* For kernel-doc purposes only. */
@@ -152,6 +153,9 @@ void mac_pcs_get_state(struct phylink_config *config,
  * guaranteed to be correct, and so any mac_config() implementation must
  * never reference these fields.
  *
+ * (this requires a rewrite - please refer to mac_link_up() for situations
+ *  where the PCS and MAC are not tightly integrated.)
+ *
  * In all negotiation modes, as defined by @mode, @state->pause indicates the
  * pause settings which should be applied as follows. If %MLO_PAUSE_AN is not
  * set, %MLO_PAUSE_TX and %MLO_PAUSE_RX indicate whether the MAC should send
@@ -162,12 +166,20 @@ void mac_pcs_get_state(struct phylink_config *config,
  * The action performed depends on the currently selected mode:
  *
  * %MLO_AN_FIXED, %MLO_AN_PHY:
- *   Configure the specified @state->speed and @state->duplex over a link
- *   specified by @state->interface. @state->advertising may be used, but
- *   is not required. Pause modes as above. Other members of @state must
- *   be ignored.
+ *   Configure for non-inband negotiation mode, where the link settings
+ *   are completely communicated via mac_link_up().  The physical link
+ *   protocol from the MAC is specified by @state->interface.
+ *
+ *   @state->advertising may be used, but is not required.
+ *
+ *   Older drivers (prior to the mac_link_up() change) may use @state->speed,
+ *   @state->duplex and @state->pause to configure the MAC, but this is
+ *   deprecated; such drivers should be converted to use mac_link_up().
  *
- *   Valid state members: interface, speed, duplex, pause, advertising.
+ *   Other members of @state must be ignored.
+ *
+ *   Valid state members: interface, advertising.
+ *   Deprecated state members: speed, duplex, pause.
  *
  * %MLO_AN_INBAND:
  *   place the link in an inband negotiation mode (such as 802.3z
@@ -228,19 +240,34 @@ void mac_link_down(struct phylink_config *config, unsigned int mode,
 /**
  * mac_link_up() - allow the link to come up
  * @config: a pointer to a &struct phylink_config.
+ * @phy: any attached phy
  * @mode: link autonegotiation mode
  * @interface: link &typedef phy_interface_t mode
- * @phy: any attached phy
+ * @speed: link speed
+ * @duplex: link duplex
+ * @tx_pause: link transmit pause enablement status
+ * @rx_pause: link receive pause enablement status
  *
- * If @mode is not an in-band negotiation mode (as defined by
- * phylink_autoneg_inband()), allow the link to come up. If @phy
- * is non-%NULL, configure Energy Efficient Ethernet by calling
+ * Configure the MAC for an established link.
+ *
+ * @speed, @duplex, @tx_pause and @rx_pause indicate the finalised link
+ * settings, and should be used to configure the MAC block appropriately
+ * where these settings are not automatically conveyed from the PCS block,
+ * or if in-band negotiation (as defined by phylink_autoneg_inband(@mode))
+ * is disabled.
+ *
+ * Note that when 802.3z in-band negotiation is in use, it is possible
+ * that the user wishes to override the pause settings, and this should
+ * be allowed when considering the implementation of this method.
+ *
+ * If in-band negotiation mode is disabled, allow the link to come up. If
+ * @phy is non-%NULL, configure Energy Efficient Ethernet by calling
  * phy_init_eee() and perform appropriate MAC configuration for EEE.
  * Interface type selection must be done in mac_config().
  */
-void mac_link_up(struct phylink_config *config, unsigned int mode,
-		 phy_interface_t interface,
-		 struct phy_device *phy);
+void mac_link_up(struct phylink_config *config, struct phy_device *phy,
+		 unsigned int mode, phy_interface_t interface,
+		 int speed, int duplex, bool tx_pause, bool rx_pause);
 #endif
 
 struct phylink *phylink_create(struct phylink_config *, struct fwnode_handle *,
diff --git a/net/dsa/port.c b/net/dsa/port.c
index 774facb8d547..b2f5262b35cf 100644
--- a/net/dsa/port.c
+++ b/net/dsa/port.c
@@ -489,9 +489,11 @@ static void dsa_port_phylink_mac_link_down(struct phylink_config *config,
 }
 
 static void dsa_port_phylink_mac_link_up(struct phylink_config *config,
+					 struct phy_device *phydev,
 					 unsigned int mode,
 					 phy_interface_t interface,
-					 struct phy_device *phydev)
+					 int speed, int duplex,
+					 bool tx_pause, bool rx_pause)
 {
 	struct dsa_port *dp = container_of(config, struct dsa_port, pl_config);
 	struct dsa_switch *ds = dp->ds;
-- 
2.20.1

