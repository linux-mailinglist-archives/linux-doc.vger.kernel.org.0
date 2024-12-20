Return-Path: <linux-doc+bounces-33453-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2669F92DA
	for <lists+linux-doc@lfdr.de>; Fri, 20 Dec 2024 14:12:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B1D8416F5A4
	for <lists+linux-doc@lfdr.de>; Fri, 20 Dec 2024 13:11:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 601E421883C;
	Fri, 20 Dec 2024 13:09:11 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C35F217642
	for <linux-doc@vger.kernel.org>; Fri, 20 Dec 2024 13:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734700151; cv=none; b=XdDUpM5CEVkEhFDxNZCHQDkyCpL4fCkpy3jiZTaw8W5d1Wk4C165vgueUH9MucPtK15eYQUhhBvmCtBfyHM1UYEz5Q7H1o+hAUSzMBqG1RhDwcv4ck0GrsKLVAKPfDqtiAuVtkfm2AaS/i4X6tLz2I1VZID9llEHbPNQcccYjeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734700151; c=relaxed/simple;
	bh=qaLzlGANDH55YmLvoE7Nw9qdDxTSduTRfGiIkmT2hyk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nrc68YrX0qBxy0Ht790k4W/c9du/qSwK1LWMNofV8vr6u2JwOQLwUzZ0GXglmDCWj0ISzpy+Sa/P/YZEudq773VdpZM6tALE/wkQkeI3r+TBr/NVMhiZ0tGpYqN5nDdyBp6f2yVUMG5xhuBo0ioaSSK4b3mwt/UW/uOEaabDnJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1tOckA-0004E5-4G; Fri, 20 Dec 2024 14:08:38 +0100
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tOck8-004NZn-0N;
	Fri, 20 Dec 2024 14:08:36 +0100
Received: from ore by dude04.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tOck8-008MkC-2b;
	Fri, 20 Dec 2024 14:08:36 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
	kernel@pengutronix.de,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Simon Horman <horms@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	linux-doc@vger.kernel.org
Subject: [PATCH net-next v3 5/8] net: phy: introduce optional polling interface for PHY statistics
Date: Fri, 20 Dec 2024 14:08:32 +0100
Message-Id: <20241220130836.1993966-6-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241220130836.1993966-1-o.rempel@pengutronix.de>
References: <20241220130836.1993966-1-o.rempel@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-doc@vger.kernel.org

Add an optional polling interface for PHY statistics to simplify driver
implementation.

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
changes v3:
- update commit message
changes v2:
- drop PHY_POLL_STATS
- add function comments
---
 drivers/net/phy/phy.c | 20 ++++++++++++++++++++
 include/linux/phy.h   | 21 +++++++++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/drivers/net/phy/phy.c b/drivers/net/phy/phy.c
index e4b04cdaa995..c8812a115114 100644
--- a/drivers/net/phy/phy.c
+++ b/drivers/net/phy/phy.c
@@ -1398,6 +1398,23 @@ static int phy_enable_interrupts(struct phy_device *phydev)
 	return phy_config_interrupt(phydev, PHY_INTERRUPT_ENABLED);
 }
 
+/**
+ * phy_update_stats - Update PHY device statistics if supported.
+ * @phydev: Pointer to the PHY device structure.
+ *
+ * If the PHY driver provides an update_stats callback, this function
+ * invokes it to update the PHY statistics. If not, it returns 0.
+ *
+ * Return: 0 on success, or a negative error code if the callback fails.
+ */
+static int phy_update_stats(struct phy_device *phydev)
+{
+	if (!phydev->drv->update_stats)
+		return 0;
+
+	return phydev->drv->update_stats(phydev);
+}
+
 /**
  * phy_request_interrupt - request and enable interrupt for a PHY device
  * @phydev: target phy_device struct
@@ -1467,6 +1484,9 @@ static enum phy_state_work _phy_state_machine(struct phy_device *phydev)
 	case PHY_RUNNING:
 		err = phy_check_link_status(phydev);
 		func = &phy_check_link_status;
+
+		if (!err)
+			err = phy_update_stats(phydev);
 		break;
 	case PHY_CABLETEST:
 		err = phydev->drv->cable_test_get_status(phydev, &finished);
diff --git a/include/linux/phy.h b/include/linux/phy.h
index 9abc85b3e51b..47acc45661e9 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -1180,6 +1180,24 @@ struct phy_driver {
 	 */
 	void (*get_link_stats)(struct phy_device *dev,
 			       struct ethtool_link_ext_stats *link_stats);
+
+	/**
+	 * @update_stats: Trigger periodic statistics updates.
+	 * @dev: The PHY device for which statistics updates are triggered.
+	 *
+	 * Periodically gathers statistics from the PHY device to update locally
+	 * maintained 64-bit counters. This is necessary for PHYs that implement
+	 * reduced-width counters (e.g., 16-bit or 32-bit) which can overflow
+	 * more frequently compared to 64-bit counters. By invoking this
+	 * callback, drivers can fetch the current counter values, handle
+	 * overflow detection, and accumulate the results into local 64-bit
+	 * counters for accurate reporting through the `get_phy_stats` and
+	 * `get_link_stats` interfaces.
+	 *
+	 * Return: 0 on success or a negative error code on failure.
+	 */
+	int (*update_stats)(struct phy_device *dev);
+
 	/** @get_sset_count: Number of statistic counters */
 	int (*get_sset_count)(struct phy_device *dev);
 	/** @get_strings: Names of the statistic counters */
@@ -1670,6 +1688,9 @@ static inline bool phy_polling_mode(struct phy_device *phydev)
 		if (phydev->drv->flags & PHY_POLL_CABLE_TEST)
 			return true;
 
+	if (phydev->drv->update_stats)
+		return true;
+
 	return phydev->irq == PHY_POLL;
 }
 
-- 
2.39.5


