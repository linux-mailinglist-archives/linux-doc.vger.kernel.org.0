Return-Path: <linux-doc+bounces-31916-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3AA39E14C2
	for <lists+linux-doc@lfdr.de>; Tue,  3 Dec 2024 08:59:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 86EE3164470
	for <lists+linux-doc@lfdr.de>; Tue,  3 Dec 2024 07:58:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E887F1DF973;
	Tue,  3 Dec 2024 07:56:47 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB5A1DF25B
	for <linux-doc@vger.kernel.org>; Tue,  3 Dec 2024 07:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733212607; cv=none; b=RcOd37oY3xJFVKY5G9DIfSVzrOP/xPt30OI4lv7sRLrSveJS3m3aRy3/iTl+GlMq/1mfnlu19jOPatALSAGHmhjPuy03pVztsp6ypfn7BtLHwvby5s/n6h8dx8Sb009TZ0sISInqAloXHQfyli4kcKdj/rHP6b5kSvJqO3NS6o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733212607; c=relaxed/simple;
	bh=oSPdpmoBlXHFSd4Hu5Dq7Ep5kgm70t61USTk5+qm7rs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=P6JuK1yvPSxv2ytqScwYjw7GNpAwzhnL+cY1FutGnGoXaXCNA9cE6cRogloq9pyIbp6htb2jdm877XAMK0RI3EsCmrqePCAeJvQmgGQzrQzLA6AauKipghNuRd8wUwGlZXZoDuySvO9JhziVcXffiIPn+giZCk+2DDvS/0yKijI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1tINlj-000397-Kk; Tue, 03 Dec 2024 08:56:27 +0100
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tINle-001R92-0r;
	Tue, 03 Dec 2024 08:56:23 +0100
Received: from ore by dude04.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tINle-00AHwS-33;
	Tue, 03 Dec 2024 08:56:22 +0100
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
Subject: [PATCH net-next v1 5/7] ethtool: add helper to prevent invalid statistics exposure to userspace
Date: Tue,  3 Dec 2024 08:56:19 +0100
Message-Id: <20241203075622.2452169-6-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241203075622.2452169-1-o.rempel@pengutronix.de>
References: <20241203075622.2452169-1-o.rempel@pengutronix.de>
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

Introduce a new helper function, `ethtool_stat_add`, to update 64-bit
statistics with proper handling of the reserved value
`ETHTOOL_STAT_NOT_SET`. This ensures that statistics remain valid and
are always reported to userspace, even if the driver accidentally sets
`ETHTOOL_STAT_NOT_SET` during an update.

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 include/linux/ethtool.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/linux/ethtool.h b/include/linux/ethtool.h
index b0ed740ca749..657bd69ddaf7 100644
--- a/include/linux/ethtool.h
+++ b/include/linux/ethtool.h
@@ -371,6 +371,22 @@ static inline void ethtool_stats_init(u64 *stats, unsigned int n)
 		stats[n] = ETHTOOL_STAT_NOT_SET;
 }
 
+/**
+ * ethtool_stat_add - Add a value to a u64 statistic with wraparound handling
+ * @stat: Pointer to the statistic to update
+ * @value: Value to add to the statistic
+ *
+ * Adds the specified value to a u64 statistic. If the result of the addition
+ * equals the reserved value (`ETHTOOL_STAT_NOT_SET`), it increments the result
+ * by 1 to avoid the reserved value.
+ */
+static inline void ethtool_stat_add(u64 *stat, u64 value)
+{
+	*stat += value;
+	if (*stat == ETHTOOL_STAT_NOT_SET)
+		(*stat)++;
+}
+
 /* Basic IEEE 802.3 MAC statistics (30.3.1.1.*), not otherwise exposed
  * via a more targeted API.
  */
-- 
2.39.5


