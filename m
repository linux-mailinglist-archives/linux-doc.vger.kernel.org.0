Return-Path: <linux-doc+bounces-33300-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BC39F7C4F
	for <lists+linux-doc@lfdr.de>; Thu, 19 Dec 2024 14:29:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 01AF61895456
	for <lists+linux-doc@lfdr.de>; Thu, 19 Dec 2024 13:28:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C95F0224B07;
	Thu, 19 Dec 2024 13:26:03 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A58227BA3
	for <linux-doc@vger.kernel.org>; Thu, 19 Dec 2024 13:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734614763; cv=none; b=PM1IO2EUxGoVl3LFimszzFKPyrMN7F2rur6QzVz9luOnBj+nOQr1DCgsSZ+h9BzMAU+hzq0EURRXDSbsNrPUNHyYRvQeR2JNqqtmdmeZdVjNhIDb49ZO9GqhQqE6vdc7CwqayET3V/Jt6BPCvFxUkJVsPlKccyJGUHitrBHTrRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734614763; c=relaxed/simple;
	bh=k3V98r/vJQ0Wyyfzmk6h/V/TUndKCH2qVQvXPRsF1kM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dODHYnIXcbs4UM78ZuSXU640xGBhwrmgH7NzyVPuwUbpmCBIPVIoM8t/rBvJGrDrY/pKe70h5HTIIz0G6OzuaDy5JwVWor5NLaYh62+zhq7W2SDQrGoXdGUIAyVuU+aO71MMByUaZeGQeUizIrgHbK/C9RPdrUTEA0zi1ZsBAMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1tOGX5-0001b6-Oe; Thu, 19 Dec 2024 14:25:39 +0100
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tOGX0-004DDA-1i;
	Thu, 19 Dec 2024 14:25:35 +0100
Received: from ore by dude04.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tOGX1-0032h6-0k;
	Thu, 19 Dec 2024 14:25:35 +0100
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
Subject: [PATCH net-next v2 1/8] ethtool: linkstate: migrate linkstate functions to support multi-PHY setups
Date: Thu, 19 Dec 2024 14:25:27 +0100
Message-Id: <20241219132534.725051-2-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241219132534.725051-1-o.rempel@pengutronix.de>
References: <20241219132534.725051-1-o.rempel@pengutronix.de>
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

Adapt linkstate_get_sqi() and linkstate_get_sqi_max() to take a
phy_device argument directly, enabling support for setups with
multiple PHYs. The previous assumption of a single PHY attached to
a net_device no longer holds.

Use ethnl_req_get_phydev() to identify the appropriate PHY device
for the operation. Update linkstate_prepare_data() and related
logic to accommodate this change, ensuring compatibility with
multi-PHY configurations.

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 net/ethtool/linkstate.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/net/ethtool/linkstate.c b/net/ethtool/linkstate.c
index 34d76e87847d..83c2ff29a856 100644
--- a/net/ethtool/linkstate.c
+++ b/net/ethtool/linkstate.c
@@ -26,9 +26,8 @@ const struct nla_policy ethnl_linkstate_get_policy[] = {
 		NLA_POLICY_NESTED(ethnl_header_policy_stats),
 };
 
-static int linkstate_get_sqi(struct net_device *dev)
+static int linkstate_get_sqi(struct phy_device *phydev)
 {
-	struct phy_device *phydev = dev->phydev;
 	int ret;
 
 	if (!phydev)
@@ -46,9 +45,8 @@ static int linkstate_get_sqi(struct net_device *dev)
 	return ret;
 }
 
-static int linkstate_get_sqi_max(struct net_device *dev)
+static int linkstate_get_sqi_max(struct phy_device *phydev)
 {
-	struct phy_device *phydev = dev->phydev;
 	int ret;
 
 	if (!phydev)
@@ -100,19 +98,28 @@ static int linkstate_prepare_data(const struct ethnl_req_info *req_base,
 {
 	struct linkstate_reply_data *data = LINKSTATE_REPDATA(reply_base);
 	struct net_device *dev = reply_base->dev;
+	struct nlattr **tb = info->attrs;
+	struct phy_device *phydev;
 	int ret;
 
+	phydev = ethnl_req_get_phydev(req_base, tb[ETHTOOL_A_PLCA_HEADER],
+				      info->extack);
+	if (IS_ERR(phydev)) {
+		ret = PTR_ERR(phydev);
+		goto out;
+	}
+
 	ret = ethnl_ops_begin(dev);
 	if (ret < 0)
 		return ret;
 	data->link = __ethtool_get_link(dev);
 
-	ret = linkstate_get_sqi(dev);
+	ret = linkstate_get_sqi(phydev);
 	if (linkstate_sqi_critical_error(ret))
 		goto out;
 	data->sqi = ret;
 
-	ret = linkstate_get_sqi_max(dev);
+	ret = linkstate_get_sqi_max(phydev);
 	if (linkstate_sqi_critical_error(ret))
 		goto out;
 	data->sqi_max = ret;
@@ -127,9 +134,9 @@ static int linkstate_prepare_data(const struct ethnl_req_info *req_base,
 			   sizeof(data->link_stats) / 8);
 
 	if (req_base->flags & ETHTOOL_FLAG_STATS) {
-		if (dev->phydev)
+		if (phydev)
 			data->link_stats.link_down_events =
-				READ_ONCE(dev->phydev->link_down_events);
+				READ_ONCE(phydev->link_down_events);
 
 		if (dev->ethtool_ops->get_link_ext_stats)
 			dev->ethtool_ops->get_link_ext_stats(dev,
-- 
2.39.5


