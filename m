Return-Path: <linux-doc+bounces-34534-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADA2A071F1
	for <lists+linux-doc@lfdr.de>; Thu,  9 Jan 2025 10:48:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 244AA3A2C2B
	for <lists+linux-doc@lfdr.de>; Thu,  9 Jan 2025 09:47:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F72121661D;
	Thu,  9 Jan 2025 09:45:29 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF5D2165E2
	for <linux-doc@vger.kernel.org>; Thu,  9 Jan 2025 09:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736415929; cv=none; b=nnlqEv92y7QuyZVDpzJy0I3Qf1zZOZObT+EUpziacP5qLR8Sa1lKeWP/4zRdvzb37AdvqnfD7F+gWE3vy824mev1b1AS2tKJL/CM2wL8wAqLm3DYCjjex4f7FBHpZclnzpv68aRX+h0ZkCae7QwHaFYaDJxae0YmDSZcICd/19k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736415929; c=relaxed/simple;
	bh=0Lf1hvxJlw8NY5me4Cd+9DkMBtiJ1x0BsZtQ8w+6NRU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=krH63Uqw79980l1gWoec75xEZKPsRMtvJ7wnc+4AP4Qtow7FuJRQ4dFeY0A8TQE3brHY256klz5fVwA9p5Trk5jvapYlKtgOdIMnowe4Mfh/5AZYzdK8F97qNYL/ei7nt+HCKfwGQ/bQphCU2BoqMe/Ny95nDzWRCtZMPFvl2Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1tVp64-00088C-Ch; Thu, 09 Jan 2025 10:45:00 +0100
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tVp62-007fa2-0F;
	Thu, 09 Jan 2025 10:44:58 +0100
Received: from ore by dude04.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tVp62-000PMj-2V;
	Thu, 09 Jan 2025 10:44:58 +0100
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
Subject: [PATCH net-next v6 0/7] Introduce unified and structured PHY
Date: Thu,  9 Jan 2025 10:44:50 +0100
Message-Id: <20250109094457.97466-1-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.39.5
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

This patch set introduces a unified and well-structured interface for
reporting PHY statistics. Instead of relying on arbitrary strings in PHY
drivers, this interface provides a consistent and structured way to
expose PHY statistics to userspace via ethtool.

The initial groundwork for this effort was laid by Jakub Kicinski, who
contributed patches to plumb PHY statistics to drivers and added support
for structured statistics in ethtool. Building on Jakub's work, I tested
the implementation with several PHYs, addressed a few issues, and added
support for statistics in two specific PHY drivers.

Most of changes are tracked in separate patches.
changes v6:
- drop ethtool_stat_add patch
changes v5:
- rebase against latest net-next

Jakub Kicinski (2):
  net: ethtool: plumb PHY stats to PHY drivers
  net: ethtool: add support for structured PHY statistics

Oleksij Rempel (5):
  ethtool: linkstate: migrate linkstate functions to support multi-PHY
    setups
  Documentation: networking: update PHY error counter diagnostics in
    twisted pair guide
  net: phy: introduce optional polling interface for PHY statistics
  net: phy: dp83td510: add statistics support
  net: phy: dp83tg720: add statistics support

 .../twisted_pair_layer1_diagnostics.rst       |  39 +++--
 Documentation/networking/ethtool-netlink.rst  |   1 +
 drivers/net/phy/dp83td510.c                   | 112 ++++++++++++
 drivers/net/phy/dp83tg720.c                   | 161 ++++++++++++++++++
 drivers/net/phy/phy.c                         |  63 +++++++
 drivers/net/phy/phy_device.c                  |   2 +
 include/linux/ethtool.h                       |  23 +++
 include/linux/phy.h                           |  57 +++++++
 include/linux/phylib_stubs.h                  |  42 +++++
 include/uapi/linux/ethtool.h                  |   2 +
 include/uapi/linux/ethtool_netlink.h          |  14 ++
 net/ethtool/linkstate.c                       |  26 ++-
 net/ethtool/netlink.h                         |   1 +
 net/ethtool/stats.c                           |  55 ++++++
 net/ethtool/strset.c                          |   5 +
 15 files changed, 583 insertions(+), 20 deletions(-)

--
2.39.5


