Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B2E07BE566
	for <lists+linux-doc@lfdr.de>; Mon,  9 Oct 2023 17:51:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377072AbjJIPvz (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 9 Oct 2023 11:51:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377077AbjJIPvw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 9 Oct 2023 11:51:52 -0400
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE738E9;
        Mon,  9 Oct 2023 08:51:49 -0700 (PDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2C27D1C0002;
        Mon,  9 Oct 2023 15:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1696866708;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vpY52aoAJ1rGO5AYwVlLY3pMqzhMipg00/2biw96jaA=;
        b=Q8NQgsiqpQSAfgkbjfquayNL3gjI7h+THkLcvVxGB6LKFVOyMByAeV9E1DTan4N6lPgTS4
        g5/5jAidCYwh8kgkbaffuJ5wxMNbsIYlacAoC1m+SF7WVPwd/VRIGbPgFqIGU5aWECxN4w
        MGKc7q3CS4nZIY3vHvpqsCrx0k5uZKPiVxn4ntY59nADy9p9OfnYkNBZ8QnA1RBeyhWOZx
        MB58BtN+zvpjH1w02GuEWD9vOcWXqgqHhfMUKEvBzllXNa027onZtuM0Rmg9uxJxRqbqLE
        HSciAsx2xJYCW/v4+ehMHlYtcCiVFAtzsH6uWx7UKzz932uACPVaiwEyEAXsCw==
From:   =?UTF-8?q?K=C3=B6ry=20Maincent?= <kory.maincent@bootlin.com>
To:     netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
Cc:     Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Jay Vosburgh <j.vosburgh@gmail.com>,
        Andy Gospodarek <andy@greyhouse.net>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Horatiu Vultur <horatiu.vultur@microchip.com>,
        UNGLinuxDriver@microchip.com,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Radu Pirea <radu-nicolae.pirea@oss.nxp.com>,
        Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
        Vladimir Oltean <vladimir.oltean@nxp.com>,
        Michael Walle <michael@walle.cc>,
        Jacob Keller <jacob.e.keller@intel.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Kory Maincent <kory.maincent@bootlin.com>
Subject: [PATCH net-next v5 01/16] net: Convert PHYs hwtstamp callback to use kernel_hwtstamp_config
Date:   Mon,  9 Oct 2023 17:51:23 +0200
Message-Id: <20231009155138.86458-2-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231009155138.86458-1-kory.maincent@bootlin.com>
References: <20231009155138.86458-1-kory.maincent@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: kory.maincent@bootlin.com
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Kory Maincent <kory.maincent@bootlin.com>

The PHYs hwtstamp callback are still getting the timestamp config from
ifreq and using copy_from/to_user.
Get rid of these functions by using timestamp configuration in parameter.
This also allow to move on to kernel_hwtstamp_config and be similar to
net devices using the new ndo_hwstamp_get/set.

This adds the possibility to manipulate the timestamp configuration
from the kernel which was not possible with the copy_from/to_user.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 drivers/net/phy/bcm-phy-ptp.c     | 15 +++++-------
 drivers/net/phy/dp83640.c         | 24 +++++++++----------
 drivers/net/phy/micrel.c          | 38 ++++++++++++++-----------------
 drivers/net/phy/mscc/mscc_ptp.c   | 18 +++++++--------
 drivers/net/phy/nxp-c45-tja11xx.c | 17 ++++++--------
 drivers/net/phy/phy.c             | 21 +++++++++++++++--
 drivers/ptp/ptp_ines.c            | 16 ++++++-------
 include/linux/mii_timestamper.h   |  4 +++-
 include/linux/phy.h               |  6 +++--
 9 files changed, 82 insertions(+), 77 deletions(-)

diff --git a/drivers/net/phy/bcm-phy-ptp.c b/drivers/net/phy/bcm-phy-ptp.c
index ef00d6163061..0beae8f81ffa 100644
--- a/drivers/net/phy/bcm-phy-ptp.c
+++ b/drivers/net/phy/bcm-phy-ptp.c
@@ -782,16 +782,13 @@ static void bcm_ptp_txtstamp(struct mii_timestamper *mii_ts,
 }
 
 static int bcm_ptp_hwtstamp(struct mii_timestamper *mii_ts,
-			    struct ifreq *ifr)
+			    struct kernel_hwtstamp_config *cfg,
+			    struct netlink_ext_ack *extack)
 {
 	struct bcm_ptp_private *priv = mii2priv(mii_ts);
-	struct hwtstamp_config cfg;
 	u16 mode, ctrl;
 
-	if (copy_from_user(&cfg, ifr->ifr_data, sizeof(cfg)))
-		return -EFAULT;
-
-	switch (cfg.rx_filter) {
+	switch (cfg->rx_filter) {
 	case HWTSTAMP_FILTER_NONE:
 		priv->hwts_rx = false;
 		break;
@@ -804,14 +801,14 @@ static int bcm_ptp_hwtstamp(struct mii_timestamper *mii_ts,
 	case HWTSTAMP_FILTER_PTP_V2_EVENT:
 	case HWTSTAMP_FILTER_PTP_V2_SYNC:
 	case HWTSTAMP_FILTER_PTP_V2_DELAY_REQ:
-		cfg.rx_filter = HWTSTAMP_FILTER_PTP_V2_EVENT;
+		cfg->rx_filter = HWTSTAMP_FILTER_PTP_V2_EVENT;
 		priv->hwts_rx = true;
 		break;
 	default:
 		return -ERANGE;
 	}
 
-	priv->tx_type = cfg.tx_type;
+	priv->tx_type = cfg->tx_type;
 
 	ctrl  = priv->hwts_rx ? SLICE_RX_EN : 0;
 	ctrl |= priv->tx_type != HWTSTAMP_TX_OFF ? SLICE_TX_EN : 0;
@@ -840,7 +837,7 @@ static int bcm_ptp_hwtstamp(struct mii_timestamper *mii_ts,
 	/* purge existing data */
 	skb_queue_purge(&priv->tx_queue);
 
-	return copy_to_user(ifr->ifr_data, &cfg, sizeof(cfg)) ? -EFAULT : 0;
+	return 0;
 }
 
 static int bcm_ptp_ts_info(struct mii_timestamper *mii_ts,
diff --git a/drivers/net/phy/dp83640.c b/drivers/net/phy/dp83640.c
index 2657be7cc049..5c42c47dc564 100644
--- a/drivers/net/phy/dp83640.c
+++ b/drivers/net/phy/dp83640.c
@@ -1207,22 +1207,20 @@ static irqreturn_t dp83640_handle_interrupt(struct phy_device *phydev)
 	return IRQ_HANDLED;
 }
 
-static int dp83640_hwtstamp(struct mii_timestamper *mii_ts, struct ifreq *ifr)
+static int dp83640_hwtstamp(struct mii_timestamper *mii_ts,
+			    struct kernel_hwtstamp_config *cfg,
+			    struct netlink_ext_ack *extack)
 {
 	struct dp83640_private *dp83640 =
 		container_of(mii_ts, struct dp83640_private, mii_ts);
-	struct hwtstamp_config cfg;
 	u16 txcfg0, rxcfg0;
 
-	if (copy_from_user(&cfg, ifr->ifr_data, sizeof(cfg)))
-		return -EFAULT;
-
-	if (cfg.tx_type < 0 || cfg.tx_type > HWTSTAMP_TX_ONESTEP_SYNC)
+	if (cfg->tx_type < 0 || cfg->tx_type > HWTSTAMP_TX_ONESTEP_SYNC)
 		return -ERANGE;
 
-	dp83640->hwts_tx_en = cfg.tx_type;
+	dp83640->hwts_tx_en = cfg->tx_type;
 
-	switch (cfg.rx_filter) {
+	switch (cfg->rx_filter) {
 	case HWTSTAMP_FILTER_NONE:
 		dp83640->hwts_rx_en = 0;
 		dp83640->layer = 0;
@@ -1234,7 +1232,7 @@ static int dp83640_hwtstamp(struct mii_timestamper *mii_ts, struct ifreq *ifr)
 		dp83640->hwts_rx_en = 1;
 		dp83640->layer = PTP_CLASS_L4;
 		dp83640->version = PTP_CLASS_V1;
-		cfg.rx_filter = HWTSTAMP_FILTER_PTP_V1_L4_EVENT;
+		cfg->rx_filter = HWTSTAMP_FILTER_PTP_V1_L4_EVENT;
 		break;
 	case HWTSTAMP_FILTER_PTP_V2_L4_EVENT:
 	case HWTSTAMP_FILTER_PTP_V2_L4_SYNC:
@@ -1242,7 +1240,7 @@ static int dp83640_hwtstamp(struct mii_timestamper *mii_ts, struct ifreq *ifr)
 		dp83640->hwts_rx_en = 1;
 		dp83640->layer = PTP_CLASS_L4;
 		dp83640->version = PTP_CLASS_V2;
-		cfg.rx_filter = HWTSTAMP_FILTER_PTP_V2_L4_EVENT;
+		cfg->rx_filter = HWTSTAMP_FILTER_PTP_V2_L4_EVENT;
 		break;
 	case HWTSTAMP_FILTER_PTP_V2_L2_EVENT:
 	case HWTSTAMP_FILTER_PTP_V2_L2_SYNC:
@@ -1250,7 +1248,7 @@ static int dp83640_hwtstamp(struct mii_timestamper *mii_ts, struct ifreq *ifr)
 		dp83640->hwts_rx_en = 1;
 		dp83640->layer = PTP_CLASS_L2;
 		dp83640->version = PTP_CLASS_V2;
-		cfg.rx_filter = HWTSTAMP_FILTER_PTP_V2_L2_EVENT;
+		cfg->rx_filter = HWTSTAMP_FILTER_PTP_V2_L2_EVENT;
 		break;
 	case HWTSTAMP_FILTER_PTP_V2_EVENT:
 	case HWTSTAMP_FILTER_PTP_V2_SYNC:
@@ -1258,7 +1256,7 @@ static int dp83640_hwtstamp(struct mii_timestamper *mii_ts, struct ifreq *ifr)
 		dp83640->hwts_rx_en = 1;
 		dp83640->layer = PTP_CLASS_L4 | PTP_CLASS_L2;
 		dp83640->version = PTP_CLASS_V2;
-		cfg.rx_filter = HWTSTAMP_FILTER_PTP_V2_EVENT;
+		cfg->rx_filter = HWTSTAMP_FILTER_PTP_V2_EVENT;
 		break;
 	default:
 		return -ERANGE;
@@ -1292,7 +1290,7 @@ static int dp83640_hwtstamp(struct mii_timestamper *mii_ts, struct ifreq *ifr)
 
 	mutex_unlock(&dp83640->clock->extreg_lock);
 
-	return copy_to_user(ifr->ifr_data, &cfg, sizeof(cfg)) ? -EFAULT : 0;
+	return 0;
 }
 
 static void rx_timestamp_work(struct work_struct *work)
diff --git a/drivers/net/phy/micrel.c b/drivers/net/phy/micrel.c
index 927d3d54658e..43d072b53839 100644
--- a/drivers/net/phy/micrel.c
+++ b/drivers/net/phy/micrel.c
@@ -2373,24 +2373,22 @@ static void lan8814_flush_fifo(struct phy_device *phydev, bool egress)
 	lanphy_read_page_reg(phydev, 5, PTP_TSU_INT_STS);
 }
 
-static int lan8814_hwtstamp(struct mii_timestamper *mii_ts, struct ifreq *ifr)
+static int lan8814_hwtstamp(struct mii_timestamper *mii_ts,
+			    struct kernel_hwtstamp_config *config,
+			    struct netlink_ext_ack *extack)
 {
 	struct kszphy_ptp_priv *ptp_priv =
 			  container_of(mii_ts, struct kszphy_ptp_priv, mii_ts);
 	struct phy_device *phydev = ptp_priv->phydev;
 	struct lan8814_shared_priv *shared = phydev->shared->priv;
 	struct lan8814_ptp_rx_ts *rx_ts, *tmp;
-	struct hwtstamp_config config;
 	int txcfg = 0, rxcfg = 0;
 	int pkt_ts_enable;
 
-	if (copy_from_user(&config, ifr->ifr_data, sizeof(config)))
-		return -EFAULT;
+	ptp_priv->hwts_tx_type = config->tx_type;
+	ptp_priv->rx_filter = config->rx_filter;
 
-	ptp_priv->hwts_tx_type = config.tx_type;
-	ptp_priv->rx_filter = config.rx_filter;
-
-	switch (config.rx_filter) {
+	switch (config->rx_filter) {
 	case HWTSTAMP_FILTER_NONE:
 		ptp_priv->layer = 0;
 		ptp_priv->version = 0;
@@ -2436,13 +2434,13 @@ static int lan8814_hwtstamp(struct mii_timestamper *mii_ts, struct ifreq *ifr)
 		lanphy_write_page_reg(ptp_priv->phydev, 5, PTP_TX_MOD,
 				      PTP_TX_MOD_TX_PTP_SYNC_TS_INSERT_);
 
-	if (config.rx_filter != HWTSTAMP_FILTER_NONE)
+	if (config->rx_filter != HWTSTAMP_FILTER_NONE)
 		lan8814_config_ts_intr(ptp_priv->phydev, true);
 	else
 		lan8814_config_ts_intr(ptp_priv->phydev, false);
 
 	mutex_lock(&shared->shared_lock);
-	if (config.rx_filter != HWTSTAMP_FILTER_NONE)
+	if (config->rx_filter != HWTSTAMP_FILTER_NONE)
 		shared->ref++;
 	else
 		shared->ref--;
@@ -2466,7 +2464,7 @@ static int lan8814_hwtstamp(struct mii_timestamper *mii_ts, struct ifreq *ifr)
 	lan8814_flush_fifo(ptp_priv->phydev, false);
 	lan8814_flush_fifo(ptp_priv->phydev, true);
 
-	return copy_to_user(ifr->ifr_data, &config, sizeof(config)) ? -EFAULT : 0;
+	return 0;
 }
 
 static void lan8814_txtstamp(struct mii_timestamper *mii_ts,
@@ -3681,21 +3679,19 @@ static void lan8841_ptp_enable_processing(struct kszphy_ptp_priv *ptp_priv,
 #define LAN8841_PTP_TX_TIMESTAMP_EN		443
 #define LAN8841_PTP_TX_MOD			445
 
-static int lan8841_hwtstamp(struct mii_timestamper *mii_ts, struct ifreq *ifr)
+static int lan8841_hwtstamp(struct mii_timestamper *mii_ts,
+			    struct kernel_hwtstamp_config *config,
+			    struct netlink_ext_ack *extack)
 {
 	struct kszphy_ptp_priv *ptp_priv = container_of(mii_ts, struct kszphy_ptp_priv, mii_ts);
 	struct phy_device *phydev = ptp_priv->phydev;
-	struct hwtstamp_config config;
 	int txcfg = 0, rxcfg = 0;
 	int pkt_ts_enable;
 
-	if (copy_from_user(&config, ifr->ifr_data, sizeof(config)))
-		return -EFAULT;
+	ptp_priv->hwts_tx_type = config->tx_type;
+	ptp_priv->rx_filter = config->rx_filter;
 
-	ptp_priv->hwts_tx_type = config.tx_type;
-	ptp_priv->rx_filter = config.rx_filter;
-
-	switch (config.rx_filter) {
+	switch (config->rx_filter) {
 	case HWTSTAMP_FILTER_NONE:
 		ptp_priv->layer = 0;
 		ptp_priv->version = 0;
@@ -3749,13 +3745,13 @@ static int lan8841_hwtstamp(struct mii_timestamper *mii_ts, struct ifreq *ifr)
 
 	/* Now enable/disable the timestamping */
 	lan8841_ptp_enable_processing(ptp_priv,
-				      config.rx_filter != HWTSTAMP_FILTER_NONE);
+				      config->rx_filter != HWTSTAMP_FILTER_NONE);
 
 	skb_queue_purge(&ptp_priv->tx_queue);
 
 	lan8841_ptp_flush_fifo(ptp_priv);
 
-	return copy_to_user(ifr->ifr_data, &config, sizeof(config)) ? -EFAULT : 0;
+	return 0;
 }
 
 static bool lan8841_rxtstamp(struct mii_timestamper *mii_ts,
diff --git a/drivers/net/phy/mscc/mscc_ptp.c b/drivers/net/phy/mscc/mscc_ptp.c
index cf728bfd83e2..eb0b032cb613 100644
--- a/drivers/net/phy/mscc/mscc_ptp.c
+++ b/drivers/net/phy/mscc/mscc_ptp.c
@@ -1045,19 +1045,17 @@ static void vsc85xx_ts_reset_fifo(struct phy_device *phydev)
 			     val);
 }
 
-static int vsc85xx_hwtstamp(struct mii_timestamper *mii_ts, struct ifreq *ifr)
+static int vsc85xx_hwtstamp(struct mii_timestamper *mii_ts,
+			    struct kernel_hwtstamp_config *cfg,
+			    struct netlink_ext_ack *extack)
 {
 	struct vsc8531_private *vsc8531 =
 		container_of(mii_ts, struct vsc8531_private, mii_ts);
 	struct phy_device *phydev = vsc8531->ptp->phydev;
-	struct hwtstamp_config cfg;
 	bool one_step = false;
 	u32 val;
 
-	if (copy_from_user(&cfg, ifr->ifr_data, sizeof(cfg)))
-		return -EFAULT;
-
-	switch (cfg.tx_type) {
+	switch (cfg->tx_type) {
 	case HWTSTAMP_TX_ONESTEP_SYNC:
 		one_step = true;
 		break;
@@ -1069,9 +1067,9 @@ static int vsc85xx_hwtstamp(struct mii_timestamper *mii_ts, struct ifreq *ifr)
 		return -ERANGE;
 	}
 
-	vsc8531->ptp->tx_type = cfg.tx_type;
+	vsc8531->ptp->tx_type = cfg->tx_type;
 
-	switch (cfg.rx_filter) {
+	switch (cfg->rx_filter) {
 	case HWTSTAMP_FILTER_NONE:
 		break;
 	case HWTSTAMP_FILTER_PTP_V2_L4_EVENT:
@@ -1084,7 +1082,7 @@ static int vsc85xx_hwtstamp(struct mii_timestamper *mii_ts, struct ifreq *ifr)
 		return -ERANGE;
 	}
 
-	vsc8531->ptp->rx_filter = cfg.rx_filter;
+	vsc8531->ptp->rx_filter = cfg->rx_filter;
 
 	mutex_lock(&vsc8531->ts_lock);
 
@@ -1132,7 +1130,7 @@ static int vsc85xx_hwtstamp(struct mii_timestamper *mii_ts, struct ifreq *ifr)
 	vsc8531->ptp->configured = 1;
 	mutex_unlock(&vsc8531->ts_lock);
 
-	return copy_to_user(ifr->ifr_data, &cfg, sizeof(cfg)) ? -EFAULT : 0;
+	return 0;
 }
 
 static int vsc85xx_ts_info(struct mii_timestamper *mii_ts,
diff --git a/drivers/net/phy/nxp-c45-tja11xx.c b/drivers/net/phy/nxp-c45-tja11xx.c
index 7ab080ff02df..416484ea6eb3 100644
--- a/drivers/net/phy/nxp-c45-tja11xx.c
+++ b/drivers/net/phy/nxp-c45-tja11xx.c
@@ -1022,24 +1022,21 @@ static bool nxp_c45_rxtstamp(struct mii_timestamper *mii_ts,
 }
 
 static int nxp_c45_hwtstamp(struct mii_timestamper *mii_ts,
-			    struct ifreq *ifreq)
+			    struct kernel_hwtstamp_config *config,
+			    struct netlink_ext_ack *extack)
 {
 	struct nxp_c45_phy *priv = container_of(mii_ts, struct nxp_c45_phy,
 						mii_ts);
 	struct phy_device *phydev = priv->phydev;
 	const struct nxp_c45_phy_data *data;
-	struct hwtstamp_config cfg;
 
-	if (copy_from_user(&cfg, ifreq->ifr_data, sizeof(cfg)))
-		return -EFAULT;
-
-	if (cfg.tx_type < 0 || cfg.tx_type > HWTSTAMP_TX_ON)
+	if (cfg->tx_type < 0 || cfg->tx_type > HWTSTAMP_TX_ON)
 		return -ERANGE;
 
 	data = nxp_c45_get_data(phydev);
-	priv->hwts_tx = cfg.tx_type;
+	priv->hwts_tx = cfg->tx_type;
 
-	switch (cfg.rx_filter) {
+	switch (cfg->rx_filter) {
 	case HWTSTAMP_FILTER_NONE:
 		priv->hwts_rx = 0;
 		break;
@@ -1047,7 +1044,7 @@ static int nxp_c45_hwtstamp(struct mii_timestamper *mii_ts,
 	case HWTSTAMP_FILTER_PTP_V2_L2_SYNC:
 	case HWTSTAMP_FILTER_PTP_V2_L2_DELAY_REQ:
 		priv->hwts_rx = 1;
-		cfg.rx_filter = HWTSTAMP_FILTER_PTP_V2_L2_EVENT;
+		cfg->rx_filter = HWTSTAMP_FILTER_PTP_V2_L2_EVENT;
 		break;
 	default:
 		return -ERANGE;
@@ -1074,7 +1071,7 @@ static int nxp_c45_hwtstamp(struct mii_timestamper *mii_ts,
 		nxp_c45_clear_reg_field(phydev, &data->regmap->irq_egr_ts_en);
 
 nxp_c45_no_ptp_irq:
-	return copy_to_user(ifreq->ifr_data, &cfg, sizeof(cfg)) ? -EFAULT : 0;
+	return 0;
 }
 
 static int nxp_c45_ts_info(struct mii_timestamper *mii_ts,
diff --git a/drivers/net/phy/phy.c b/drivers/net/phy/phy.c
index a5fa077650e8..d058316666ba 100644
--- a/drivers/net/phy/phy.c
+++ b/drivers/net/phy/phy.c
@@ -325,9 +325,13 @@ EXPORT_SYMBOL(phy_ethtool_ksettings_get);
 int phy_mii_ioctl(struct phy_device *phydev, struct ifreq *ifr, int cmd)
 {
 	struct mii_ioctl_data *mii_data = if_mii(ifr);
+	struct kernel_hwtstamp_config kernel_cfg;
+	struct netlink_ext_ack extack = {};
 	u16 val = mii_data->val_in;
 	bool change_autoneg = false;
+	struct hwtstamp_config cfg;
 	int prtad, devad;
+	int ret;
 
 	switch (cmd) {
 	case SIOCGMIIPHY:
@@ -411,8 +415,21 @@ int phy_mii_ioctl(struct phy_device *phydev, struct ifreq *ifr, int cmd)
 		return 0;
 
 	case SIOCSHWTSTAMP:
-		if (phydev->mii_ts && phydev->mii_ts->hwtstamp)
-			return phydev->mii_ts->hwtstamp(phydev->mii_ts, ifr);
+		if (phydev->mii_ts && phydev->mii_ts->hwtstamp) {
+			if (copy_from_user(&cfg, ifr->ifr_data, sizeof(cfg)))
+				return -EFAULT;
+
+			hwtstamp_config_to_kernel(&kernel_cfg, &cfg);
+			ret = phydev->mii_ts->hwtstamp(phydev->mii_ts, &kernel_cfg, &extack);
+			if (ret)
+				return ret;
+
+			hwtstamp_config_from_kernel(&cfg, &kernel_cfg);
+			if (copy_to_user(ifr->ifr_data, &cfg, sizeof(cfg)))
+				return -EFAULT;
+
+			return 0;
+		}
 		fallthrough;
 
 	default:
diff --git a/drivers/ptp/ptp_ines.c b/drivers/ptp/ptp_ines.c
index ed215b458183..1d2940a78455 100644
--- a/drivers/ptp/ptp_ines.c
+++ b/drivers/ptp/ptp_ines.c
@@ -328,17 +328,15 @@ static u64 ines_find_txts(struct ines_port *port, struct sk_buff *skb)
 	return ns;
 }
 
-static int ines_hwtstamp(struct mii_timestamper *mii_ts, struct ifreq *ifr)
+static int ines_hwtstamp(struct mii_timestamper *mii_ts,
+			 struct kernel_hwtstamp_config *cfg,
+			 struct netlink_ext_ack *extack)
 {
 	struct ines_port *port = container_of(mii_ts, struct ines_port, mii_ts);
 	u32 cm_one_step = 0, port_conf, ts_stat_rx, ts_stat_tx;
-	struct hwtstamp_config cfg;
 	unsigned long flags;
 
-	if (copy_from_user(&cfg, ifr->ifr_data, sizeof(cfg)))
-		return -EFAULT;
-
-	switch (cfg.tx_type) {
+	switch (cfg->tx_type) {
 	case HWTSTAMP_TX_OFF:
 		ts_stat_tx = 0;
 		break;
@@ -353,7 +351,7 @@ static int ines_hwtstamp(struct mii_timestamper *mii_ts, struct ifreq *ifr)
 		return -ERANGE;
 	}
 
-	switch (cfg.rx_filter) {
+	switch (cfg->rx_filter) {
 	case HWTSTAMP_FILTER_NONE:
 		ts_stat_rx = 0;
 		break;
@@ -372,7 +370,7 @@ static int ines_hwtstamp(struct mii_timestamper *mii_ts, struct ifreq *ifr)
 	case HWTSTAMP_FILTER_PTP_V2_SYNC:
 	case HWTSTAMP_FILTER_PTP_V2_DELAY_REQ:
 		ts_stat_rx = TS_ENABLE;
-		cfg.rx_filter = HWTSTAMP_FILTER_PTP_V2_EVENT;
+		cfg->rx_filter = HWTSTAMP_FILTER_PTP_V2_EVENT;
 		break;
 	default:
 		return -ERANGE;
@@ -393,7 +391,7 @@ static int ines_hwtstamp(struct mii_timestamper *mii_ts, struct ifreq *ifr)
 
 	spin_unlock_irqrestore(&port->lock, flags);
 
-	return copy_to_user(ifr->ifr_data, &cfg, sizeof(cfg)) ? -EFAULT : 0;
+	return 0;
 }
 
 static void ines_link_state(struct mii_timestamper *mii_ts,
diff --git a/include/linux/mii_timestamper.h b/include/linux/mii_timestamper.h
index fa940bbaf8ae..26b04f73f214 100644
--- a/include/linux/mii_timestamper.h
+++ b/include/linux/mii_timestamper.h
@@ -9,6 +9,7 @@
 #include <linux/device.h>
 #include <linux/ethtool.h>
 #include <linux/skbuff.h>
+#include <linux/net_tstamp.h>
 
 struct phy_device;
 
@@ -51,7 +52,8 @@ struct mii_timestamper {
 			 struct sk_buff *skb, int type);
 
 	int  (*hwtstamp)(struct mii_timestamper *mii_ts,
-			 struct ifreq *ifreq);
+			 struct kernel_hwtstamp_config *kernel_config,
+			 struct netlink_ext_ack *extack);
 
 	void (*link_state)(struct mii_timestamper *mii_ts,
 			   struct phy_device *phydev);
diff --git a/include/linux/phy.h b/include/linux/phy.h
index 3cc52826f18e..e5f1f41e399c 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -1560,9 +1560,11 @@ static inline bool phy_has_txtstamp(struct phy_device *phydev)
 	return phydev && phydev->mii_ts && phydev->mii_ts->txtstamp;
 }
 
-static inline int phy_hwtstamp(struct phy_device *phydev, struct ifreq *ifr)
+static inline int phy_hwtstamp(struct phy_device *phydev,
+			       struct kernel_hwtstamp_config *cfg,
+			       struct netlink_ext_ack *extack)
 {
-	return phydev->mii_ts->hwtstamp(phydev->mii_ts, ifr);
+	return phydev->mii_ts->hwtstamp(phydev->mii_ts, cfg, extack);
 }
 
 static inline bool phy_rxtstamp(struct phy_device *phydev, struct sk_buff *skb,
-- 
2.25.1

