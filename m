Return-Path: <linux-doc+bounces-34030-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 441F4A020D2
	for <lists+linux-doc@lfdr.de>; Mon,  6 Jan 2025 09:36:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 34996163F6A
	for <lists+linux-doc@lfdr.de>; Mon,  6 Jan 2025 08:36:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13DCE1DC99C;
	Mon,  6 Jan 2025 08:33:28 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A901DB377
	for <linux-doc@vger.kernel.org>; Mon,  6 Jan 2025 08:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736152408; cv=none; b=KyQsvn0LUPTDSrQIglAtYNFXBpkP1Fx3L1muoFkKodx8bPRGw1Fd7jTzboVF5ROZ3v1MnIY8MKi+clIEuXCc3QDVOiBfQmo2AqerXaCIKMWtqG4APGQXHQkY+ed4PLcWJGjn9Kt8gk2OcFt40EBqMeMvmWY0JYefc1QJJ+YkaN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736152408; c=relaxed/simple;
	bh=2wXbYqaWGW9mOPTkLt5y4RaTyBb9rPot160rt9mK8bo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=f7ZArNXasOR9de7cC538H0mrF5u+BTDi2WdTJxVNt+8jkcWVlVhXOI/SNfGWCRJdZOe+oaWaEHgpZPqZj6NWnO6EKkrfbAzoU4KyoVB1jrdAmShpyTvMYyQMdkguRS4GDgo2IyQDrT24xeAi78vdPZLFN+nNoWhSp9SWSpsUPFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1tUiXq-0003U0-WF; Mon, 06 Jan 2025 09:33:07 +0100
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tUiXm-0078Kl-0c;
	Mon, 06 Jan 2025 09:33:02 +0100
Received: from ore by dude04.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tUiXm-004MWz-2s;
	Mon, 06 Jan 2025 09:33:02 +0100
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
Subject: [PATCH net-next v5 4/8] Documentation: networking: update PHY error counter diagnostics in twisted pair guide
Date: Mon,  6 Jan 2025 09:32:57 +0100
Message-Id: <20250106083301.1039850-5-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250106083301.1039850-1-o.rempel@pengutronix.de>
References: <20250106083301.1039850-1-o.rempel@pengutronix.de>
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

Replace generic instructions for monitoring error counters with a
procedure using the unified PHY statistics interface (`--all-groups`).

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 .../twisted_pair_layer1_diagnostics.rst       | 39 +++++++++++++------
 1 file changed, 28 insertions(+), 11 deletions(-)

diff --git a/Documentation/networking/diagnostic/twisted_pair_layer1_diagnostics.rst b/Documentation/networking/diagnostic/twisted_pair_layer1_diagnostics.rst
index c9be5cc7e113..079e17effadf 100644
--- a/Documentation/networking/diagnostic/twisted_pair_layer1_diagnostics.rst
+++ b/Documentation/networking/diagnostic/twisted_pair_layer1_diagnostics.rst
@@ -713,17 +713,23 @@ driver supports reporting such events.
 
 - **Monitor Error Counters**:
 
-  - While some NIC drivers and PHYs provide error counters, there is no unified
-    set of PHY-specific counters across all hardware. Additionally, not all
-    PHYs provide useful information related to errors like CRC errors, frame
-    drops, or link flaps. Therefore, this step is dependent on the specific
-    hardware and driver support.
-
-  - **Next Steps**: Use `ethtool -S <interface>` to check if your driver
-    provides useful error counters. In some cases, counters may provide
-    information about errors like link flaps or physical layer problems (e.g.,
-    excessive CRC errors), but results can vary significantly depending on the
-    PHY.
+  - Use `ethtool -S <interface> --all-groups` to retrieve standardized interface
+    statistics if the driver supports the unified interface:
+
+  - **Command:** `ethtool -S <interface> --all-groups`
+
+  - **Example Output (if supported)**:
+
+    .. code-block:: bash
+
+      phydev-RxFrames: 100391
+      phydev-RxErrors: 0
+      phydev-TxFrames: 9
+      phydev-TxErrors: 0
+
+  - If the unified interface is not supported, use `ethtool -S <interface>` to
+    retrieve MAC and PHY counters. Note that non-standardized PHY counter names
+    vary by driver and must be interpreted accordingly:
 
   - **Command:** `ethtool -S <interface>`
 
@@ -740,6 +746,17 @@ driver supports reporting such events.
     condition) or kernel log messages (e.g., link up/down events) to further
     diagnose the issue.
 
+  - **Compare Counters**:
+
+    - Compare the egress and ingress frame counts reported by the PHY and MAC.
+
+    - A small difference may occur due to sampling rate differences between the
+      MAC and PHY drivers, or if the PHY and MAC are not always fully
+      synchronized in their UP or DOWN states.
+
+    - Significant discrepancies indicate potential issues in the data path
+      between the MAC and PHY.
+
 When All Else Fails...
 ~~~~~~~~~~~~~~~~~~~~~~
 
-- 
2.39.5


