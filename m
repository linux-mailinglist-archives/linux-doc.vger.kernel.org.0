Return-Path: <linux-doc+bounces-31917-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72EB89E14C3
	for <lists+linux-doc@lfdr.de>; Tue,  3 Dec 2024 08:59:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3911428301A
	for <lists+linux-doc@lfdr.de>; Tue,  3 Dec 2024 07:59:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F032A1ABECF;
	Tue,  3 Dec 2024 07:56:47 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686601DF266
	for <linux-doc@vger.kernel.org>; Tue,  3 Dec 2024 07:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733212607; cv=none; b=IKcqkooECpJTtvpnDVCSEMRkdQWskt3ZaOMxXmNUQ7V6/+kH7SCEHgSQytqKX/Vz3F874wDCYua9ZXIW3+uZ2v4eUJPWB+G4O7zbMt/nhLcCrkLzxXMwrpNnoTS2ZeGDt2jtKUzgUjCtQ3a1dyNWW0qT1kkdSLKtdfrMfN3JXV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733212607; c=relaxed/simple;
	bh=HzTAnBGi+AtfJayr1WcgPYLIoo/Uq1BdhrGAJz4lemM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oPZCIR/34O2oZtqoZnYWkT9a0bQvQQ6xcWRWOer7rbFzowmXydVb0bd9KOWei95IIf47GMD7aMutfHxpt2LbGBBj5O1QEoXyxvLic76B0gscB5HCxhYB9rKZEllixS4qldKvDKrUBaS3ZKeS8NfvkNdM3N6Ch3oHGnwg/7L44u0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1tINlj-000392-Kj; Tue, 03 Dec 2024 08:56:27 +0100
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tINle-001R8u-0P;
	Tue, 03 Dec 2024 08:56:22 +0100
Received: from ore by dude04.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tINle-00AHve-2f;
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
Subject: [PATCH net-next v1 0/7] Introduce unified and structured PHY
Date: Tue,  3 Dec 2024 08:56:14 +0100
Message-Id: <20241203075622.2452169-1-o.rempel@pengutronix.de>
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

Jakub Kicinski (2):
  net: ethtool: plumb PHY stats to PHY drivers
  net: ethtool: add support for structured PHY statistics

Oleksij Rempel (5):
  phy: replace bitwise flag definitions with BIT() macro
  phy: introduce optional polling interface for PHY statistics
  ethtool: add helper to prevent invalid statistics exposure to
    userspace
  phy: dp83td510: add statistics support
  phy: dp83tg720: add statistics support

 Documentation/networking/ethtool-netlink.rst |   1 +
 drivers/net/phy/dp83td510.c                  |  98 ++++++++++++-
 drivers/net/phy/dp83tg720.c                  | 147 ++++++++++++++++++-
 drivers/net/phy/phy.c                        |  15 ++
 include/linux/ethtool.h                      |  39 +++++
 include/linux/phy.h                          |  27 +++-
 include/uapi/linux/ethtool.h                 |   2 +
 include/uapi/linux/ethtool_netlink.h         |  15 ++
 net/ethtool/linkstate.c                      |  25 +++-
 net/ethtool/netlink.h                        |   1 +
 net/ethtool/stats.c                          |  58 ++++++++
 net/ethtool/strset.c                         |   5 +
 12 files changed, 423 insertions(+), 10 deletions(-)

--
2.39.5


