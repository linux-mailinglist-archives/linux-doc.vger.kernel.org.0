Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F6F436B0A8
	for <lists+linux-doc@lfdr.de>; Mon, 26 Apr 2021 11:33:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232911AbhDZJdU (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 26 Apr 2021 05:33:20 -0400
Received: from inva020.nxp.com ([92.121.34.13]:42576 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232666AbhDZJc7 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 26 Apr 2021 05:32:59 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 2C37B1A34FB;
        Mon, 26 Apr 2021 11:32:11 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id DEF561A34EA;
        Mon, 26 Apr 2021 11:32:04 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 62C7F4029B;
        Mon, 26 Apr 2021 11:31:57 +0200 (CEST)
From:   Yangbo Lu <yangbo.lu@nxp.com>
To:     netdev@vger.kernel.org
Cc:     Yangbo Lu <yangbo.lu@nxp.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Vladimir Oltean <vladimir.oltean@nxp.com>,
        "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Kurt Kanzenbach <kurt@linutronix.de>,
        Andrew Lunn <andrew@lunn.ch>,
        Vivien Didelot <vivien.didelot@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Claudiu Manoil <claudiu.manoil@nxp.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        UNGLinuxDriver@microchip.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [net-next, v2, 4/7] net: dsa: no longer clone skb in core driver
Date:   Mon, 26 Apr 2021 17:37:59 +0800
Message-Id: <20210426093802.38652-5-yangbo.lu@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210426093802.38652-1-yangbo.lu@nxp.com>
References: <20210426093802.38652-1-yangbo.lu@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

It was a waste to clone skb directly in dsa_skb_tx_timestamp().
For one-step timestamping, a clone was not needed. For any failure of
port_txtstamp (this may usually happen), the skb clone had to be freed.

So this patch moves skb cloning for tx timestamp out of dsa core, and
let drivers clone skb in port_txtstamp if they really need.

Signed-off-by: Yangbo Lu <yangbo.lu@nxp.com>
Tested-by: Kurt Kanzenbach <kurt@linutronix.de>
---
Changes for v2:
	- Split from tx timestamp optimization big patch.
	- Returned void type for port_txtstamp.
---
 .../net/dsa/hirschmann/hellcreek_hwtstamp.c   | 25 +++++++++++--------
 .../net/dsa/hirschmann/hellcreek_hwtstamp.h   |  4 +--
 drivers/net/dsa/mv88e6xxx/hwtstamp.c          | 24 +++++++++++-------
 drivers/net/dsa/mv88e6xxx/hwtstamp.h          |  9 +++----
 drivers/net/dsa/ocelot/felix.c                | 12 +++++----
 drivers/net/dsa/sja1105/sja1105_ptp.c         | 13 ++++++----
 drivers/net/dsa/sja1105/sja1105_ptp.h         |  2 +-
 include/net/dsa.h                             |  4 +--
 net/dsa/slave.c                               | 11 +-------
 9 files changed, 55 insertions(+), 49 deletions(-)

diff --git a/drivers/net/dsa/hirschmann/hellcreek_hwtstamp.c b/drivers/net/dsa/hirschmann/hellcreek_hwtstamp.c
index 5b2e023468fe..40b41c794dfa 100644
--- a/drivers/net/dsa/hirschmann/hellcreek_hwtstamp.c
+++ b/drivers/net/dsa/hirschmann/hellcreek_hwtstamp.c
@@ -373,31 +373,38 @@ long hellcreek_hwtstamp_work(struct ptp_clock_info *ptp)
 	return restart ? 1 : -1;
 }
 
-bool hellcreek_port_txtstamp(struct dsa_switch *ds, int port,
-			     struct sk_buff *clone)
+void hellcreek_port_txtstamp(struct dsa_switch *ds, int port,
+			     struct sk_buff *skb)
 {
 	struct hellcreek *hellcreek = ds->priv;
 	struct hellcreek_port_hwtstamp *ps;
 	struct ptp_header *hdr;
+	struct sk_buff *clone;
 	unsigned int type;
 
 	ps = &hellcreek->ports[port].port_hwtstamp;
 
-	type = ptp_classify_raw(clone);
+	type = ptp_classify_raw(skb);
 	if (type == PTP_CLASS_NONE)
-		return false;
+		return;
 
 	/* Make sure the message is a PTP message that needs to be timestamped
 	 * and the interaction with the HW timestamping is enabled. If not, stop
 	 * here
 	 */
-	hdr = hellcreek_should_tstamp(hellcreek, port, clone, type);
+	hdr = hellcreek_should_tstamp(hellcreek, port, skb, type);
 	if (!hdr)
-		return false;
+		return;
+
+	clone = skb_clone_sk(skb);
+	if (!clone)
+		return;
 
 	if (test_and_set_bit_lock(HELLCREEK_HWTSTAMP_TX_IN_PROGRESS,
-				  &ps->state))
-		return false;
+				  &ps->state)) {
+		kfree_skb(clone);
+		return;
+	}
 
 	ps->tx_skb = clone;
 
@@ -407,8 +414,6 @@ bool hellcreek_port_txtstamp(struct dsa_switch *ds, int port,
 	ps->tx_tstamp_start = jiffies;
 
 	ptp_schedule_worker(hellcreek->ptp_clock, 0);
-
-	return true;
 }
 
 bool hellcreek_port_rxtstamp(struct dsa_switch *ds, int port,
diff --git a/drivers/net/dsa/hirschmann/hellcreek_hwtstamp.h b/drivers/net/dsa/hirschmann/hellcreek_hwtstamp.h
index 728cd5dc650f..71af77efb28b 100644
--- a/drivers/net/dsa/hirschmann/hellcreek_hwtstamp.h
+++ b/drivers/net/dsa/hirschmann/hellcreek_hwtstamp.h
@@ -44,8 +44,8 @@ int hellcreek_port_hwtstamp_get(struct dsa_switch *ds, int port,
 
 bool hellcreek_port_rxtstamp(struct dsa_switch *ds, int port,
 			     struct sk_buff *clone, unsigned int type);
-bool hellcreek_port_txtstamp(struct dsa_switch *ds, int port,
-			     struct sk_buff *clone);
+void hellcreek_port_txtstamp(struct dsa_switch *ds, int port,
+			     struct sk_buff *skb);
 
 int hellcreek_get_ts_info(struct dsa_switch *ds, int port,
 			  struct ethtool_ts_info *info);
diff --git a/drivers/net/dsa/mv88e6xxx/hwtstamp.c b/drivers/net/dsa/mv88e6xxx/hwtstamp.c
index 79514a54d903..8f74ffc7a279 100644
--- a/drivers/net/dsa/mv88e6xxx/hwtstamp.c
+++ b/drivers/net/dsa/mv88e6xxx/hwtstamp.c
@@ -468,32 +468,38 @@ long mv88e6xxx_hwtstamp_work(struct ptp_clock_info *ptp)
 	return restart ? 1 : -1;
 }
 
-bool mv88e6xxx_port_txtstamp(struct dsa_switch *ds, int port,
-			     struct sk_buff *clone)
+void mv88e6xxx_port_txtstamp(struct dsa_switch *ds, int port,
+			     struct sk_buff *skb)
 {
 	struct mv88e6xxx_chip *chip = ds->priv;
 	struct mv88e6xxx_port_hwtstamp *ps = &chip->port_hwtstamp[port];
 	struct ptp_header *hdr;
+	struct sk_buff *clone;
 	unsigned int type;
 
-	type = ptp_classify_raw(clone);
+	type = ptp_classify_raw(skb);
 	if (type == PTP_CLASS_NONE)
-		return false;
+		return;
 
-	hdr = mv88e6xxx_should_tstamp(chip, port, clone, type);
+	hdr = mv88e6xxx_should_tstamp(chip, port, skb, type);
 	if (!hdr)
-		return false;
+		return;
+
+	clone = skb_clone_sk(skb);
+	if (!clone)
+		return;
 
 	if (test_and_set_bit_lock(MV88E6XXX_HWTSTAMP_TX_IN_PROGRESS,
-				  &ps->state))
-		return false;
+				  &ps->state)) {
+		kfree_skb(clone);
+		return;
+	}
 
 	ps->tx_skb = clone;
 	ps->tx_tstamp_start = jiffies;
 	ps->tx_seq_id = be16_to_cpu(hdr->sequence_id);
 
 	ptp_schedule_worker(chip->ptp_clock, 0);
-	return true;
 }
 
 int mv88e6165_global_disable(struct mv88e6xxx_chip *chip)
diff --git a/drivers/net/dsa/mv88e6xxx/hwtstamp.h b/drivers/net/dsa/mv88e6xxx/hwtstamp.h
index 91fbc7838fc8..cf7fb6d660b1 100644
--- a/drivers/net/dsa/mv88e6xxx/hwtstamp.h
+++ b/drivers/net/dsa/mv88e6xxx/hwtstamp.h
@@ -117,8 +117,8 @@ int mv88e6xxx_port_hwtstamp_get(struct dsa_switch *ds, int port,
 
 bool mv88e6xxx_port_rxtstamp(struct dsa_switch *ds, int port,
 			     struct sk_buff *clone, unsigned int type);
-bool mv88e6xxx_port_txtstamp(struct dsa_switch *ds, int port,
-			     struct sk_buff *clone);
+void mv88e6xxx_port_txtstamp(struct dsa_switch *ds, int port,
+			     struct sk_buff *skb);
 
 int mv88e6xxx_get_ts_info(struct dsa_switch *ds, int port,
 			  struct ethtool_ts_info *info);
@@ -151,10 +151,9 @@ static inline bool mv88e6xxx_port_rxtstamp(struct dsa_switch *ds, int port,
 	return false;
 }
 
-static inline bool mv88e6xxx_port_txtstamp(struct dsa_switch *ds, int port,
-					   struct sk_buff *clone)
+static inline void mv88e6xxx_port_txtstamp(struct dsa_switch *ds, int port,
+					   struct sk_buff *skb)
 {
-	return false;
 }
 
 static inline int mv88e6xxx_get_ts_info(struct dsa_switch *ds, int port,
diff --git a/drivers/net/dsa/ocelot/felix.c b/drivers/net/dsa/ocelot/felix.c
index 8980d56ee793..b28280b6e91a 100644
--- a/drivers/net/dsa/ocelot/felix.c
+++ b/drivers/net/dsa/ocelot/felix.c
@@ -1395,19 +1395,21 @@ static bool felix_rxtstamp(struct dsa_switch *ds, int port,
 	return false;
 }
 
-static bool felix_txtstamp(struct dsa_switch *ds, int port,
-			   struct sk_buff *clone)
+static void felix_txtstamp(struct dsa_switch *ds, int port,
+			   struct sk_buff *skb)
 {
 	struct ocelot *ocelot = ds->priv;
 	struct ocelot_port *ocelot_port = ocelot->ports[port];
+	struct sk_buff *clone;
 
 	if (ocelot->ptp && ocelot_port->ptp_cmd == IFH_REW_OP_TWO_STEP_PTP) {
+		clone = skb_clone_sk(skb);
+		if (!clone)
+			return;
+
 		ocelot_port_add_txtstamp_skb(ocelot, port, clone);
 		OCELOT_SKB_CB(skb)->clone = clone;
-		return true;
 	}
-
-	return false;
 }
 
 static int felix_change_mtu(struct dsa_switch *ds, int port, int new_mtu)
diff --git a/drivers/net/dsa/sja1105/sja1105_ptp.c b/drivers/net/dsa/sja1105/sja1105_ptp.c
index 0832368aaa96..0bc566b9e958 100644
--- a/drivers/net/dsa/sja1105/sja1105_ptp.c
+++ b/drivers/net/dsa/sja1105/sja1105_ptp.c
@@ -431,21 +431,24 @@ bool sja1105_port_rxtstamp(struct dsa_switch *ds, int port,
 	return true;
 }
 
-/* Called from dsa_skb_tx_timestamp. This callback is just to make DSA clone
+/* Called from dsa_skb_tx_timestamp. This callback is just to clone
  * the skb and have it available in SJA1105_SKB_CB in the .port_deferred_xmit
  * callback, where we will timestamp it synchronously.
  */
-bool sja1105_port_txtstamp(struct dsa_switch *ds, int port, struct sk_buff *skb)
+void sja1105_port_txtstamp(struct dsa_switch *ds, int port, struct sk_buff *skb)
 {
 	struct sja1105_private *priv = ds->priv;
 	struct sja1105_port *sp = &priv->ports[port];
+	struct sk_buff *clone;
 
 	if (!sp->hwts_tx_en)
-		return false;
+		return;
 
-	SJA1105_SKB_CB(skb)->clone = clone;
+	clone = skb_clone_sk(skb);
+	if (!clone)
+		return;
 
-	return true;
+	SJA1105_SKB_CB(skb)->clone = clone;
 }
 
 static int sja1105_ptp_reset(struct dsa_switch *ds)
diff --git a/drivers/net/dsa/sja1105/sja1105_ptp.h b/drivers/net/dsa/sja1105/sja1105_ptp.h
index c70c4729a06d..34f97f58a355 100644
--- a/drivers/net/dsa/sja1105/sja1105_ptp.h
+++ b/drivers/net/dsa/sja1105/sja1105_ptp.h
@@ -104,7 +104,7 @@ void sja1105_ptp_txtstamp_skb(struct dsa_switch *ds, int slot,
 bool sja1105_port_rxtstamp(struct dsa_switch *ds, int port,
 			   struct sk_buff *skb, unsigned int type);
 
-bool sja1105_port_txtstamp(struct dsa_switch *ds, int port,
+void sja1105_port_txtstamp(struct dsa_switch *ds, int port,
 			   struct sk_buff *skb);
 
 int sja1105_hwtstamp_get(struct dsa_switch *ds, int port, struct ifreq *ifr);
diff --git a/include/net/dsa.h b/include/net/dsa.h
index 5685e60cb082..e1a2610a0e06 100644
--- a/include/net/dsa.h
+++ b/include/net/dsa.h
@@ -726,8 +726,8 @@ struct dsa_switch_ops {
 				     struct ifreq *ifr);
 	int	(*port_hwtstamp_set)(struct dsa_switch *ds, int port,
 				     struct ifreq *ifr);
-	bool	(*port_txtstamp)(struct dsa_switch *ds, int port,
-				 struct sk_buff *clone);
+	void	(*port_txtstamp)(struct dsa_switch *ds, int port,
+				 struct sk_buff *skb);
 	bool	(*port_rxtstamp)(struct dsa_switch *ds, int port,
 				 struct sk_buff *skb, unsigned int type);
 
diff --git a/net/dsa/slave.c b/net/dsa/slave.c
index 2211894c2381..2033d8bac23d 100644
--- a/net/dsa/slave.c
+++ b/net/dsa/slave.c
@@ -555,7 +555,6 @@ static void dsa_skb_tx_timestamp(struct dsa_slave_priv *p,
 				 struct sk_buff *skb)
 {
 	struct dsa_switch *ds = p->dp->ds;
-	struct sk_buff *clone;
 
 	if (!(skb_shinfo(skb)->tx_flags & SKBTX_HW_TSTAMP))
 		return;
@@ -563,15 +562,7 @@ static void dsa_skb_tx_timestamp(struct dsa_slave_priv *p,
 	if (!ds->ops->port_txtstamp)
 		return;
 
-	clone = skb_clone_sk(skb);
-	if (!clone)
-		return;
-
-	if (ds->ops->port_txtstamp(ds, p->dp->index, clone)) {
-		return;
-	}
-
-	kfree_skb(clone);
+	ds->ops->port_txtstamp(ds, p->dp->index, skb);
 }
 
 netdev_tx_t dsa_enqueue_skb(struct sk_buff *skb, struct net_device *dev)
-- 
2.25.1

