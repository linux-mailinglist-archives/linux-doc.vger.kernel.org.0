Return-Path: <linux-doc+bounces-34712-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D2300A0881B
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jan 2025 07:14:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 601043AB5E8
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jan 2025 06:13:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8295020B1F3;
	Fri, 10 Jan 2025 06:05:48 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B282720DD43
	for <linux-doc@vger.kernel.org>; Fri, 10 Jan 2025 06:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736489148; cv=none; b=FUeiZpUenivuu2c3o3dwPOSNT1Bj7yP9jsEfnRNUMQCOsgvBZGT3qpYLTYedHrzLxqWHAldNVY7k9VlHirJ2KRmSe/FX2VbBmrAv0Od77ZtFa1sT2T64ytyPDdNxKixqtoxnZ4t+ODbKaTVPHQMwZOtFezeffDCzE7DBRDgn92M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736489148; c=relaxed/simple;
	bh=0Lf1hvxJlw8NY5me4Cd+9DkMBtiJ1x0BsZtQ8w+6NRU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OzUrGW8hN8mno7UBC9/3mm4kAxlLSlv7klzAYlFeAiMkGs9LOs2HbgsaSXKxTAJuSgjh04bSZMeFv4rxZgpFDjEv//hwwLHf+Jc27qG9+N6X/gqbkVuG7ppLRku3t2yiIYQQ5QRO+EwN8BEHOnV3yVyyBLsQWjYJySMVMu0Sa68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1tW895-0007oC-Oj; Fri, 10 Jan 2025 07:05:23 +0100
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tW891-0006lD-31;
	Fri, 10 Jan 2025 07:05:19 +0100
Received: from ore by dude04.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tW891-002z9S-2n;
	Fri, 10 Jan 2025 07:05:19 +0100
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
Subject: [PATCH net-next v7 0/7] Introduce unified and structured PHY
Date: Fri, 10 Jan 2025 07:05:10 +0100
Message-Id: <20250110060517.711683-1-o.rempel@pengutronix.de>
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


