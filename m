Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F23C620345D
	for <lists+linux-doc@lfdr.de>; Mon, 22 Jun 2020 12:02:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727054AbgFVKCm (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 22 Jun 2020 06:02:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727072AbgFVKBK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 22 Jun 2020 06:01:10 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0853C061797
        for <linux-doc@vger.kernel.org>; Mon, 22 Jun 2020 03:01:09 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id 17so522436wmo.1
        for <linux-doc@vger.kernel.org>; Mon, 22 Jun 2020 03:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nZJ9RrYkX//UjOI/5YYylQYoHuaDDR4YnVJY1VbZiK8=;
        b=W5twYeDFovUtibE54WQz/oY7xyAdsth+BrFOY/mwsKgJPsn0I8IXyw+KxwKQF1ccxI
         0Vt4K58MBHihtcBcsAbduhBD/mpp6DDwwRtQDMg4DPDarSks61h5JkloiQmN5VvS0yn1
         0MSYq3+hFxyViGeyscqGmPromya4jk9KRI0GNLYt2z3RxhbOM4E3fY3KBk6qoCm79iXc
         3Hv1vs4zZ9h7EGmVIUsjsu72HT6azkCzrdmgJHG4VQQEoPysFHsyyrj5e60fdxVZexdD
         trJKHKTrt9CadDNiF6JYZkjIDKxYSRiSUtH8aF77wU6jWNuYEqz2A6dAA/jnuyrnG/K6
         JkAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nZJ9RrYkX//UjOI/5YYylQYoHuaDDR4YnVJY1VbZiK8=;
        b=XL4TpA7/TUwYi7VLLG9JWBO497yPdYmQETnIL8/LCoRfyjhChHLEd50Bf9zGtUHsm5
         iArDA28Qq2CZQ2EJRCcDTTmw40QAjWlGkb4qwya8YsKQp/+PXfh9etl2pEnoafREuX9M
         rfYKYS6OP+/R1AI4pW5z15zPMVUuXPdb6u2Hf9ZP5VBNOn5UQQbrnRwen0DhIChiftSE
         bjKMpFweR8uNq/Hzx+smUM4MUXOEoh6whoKjMHdi7cxMCCTiBkKwvT8tnZE6+tb9uj1h
         ihZtnNJdWRssAsuDA0a7YXXLfn01EftuSrHbofyHLdxerFaoj5eyYmfS+NZkiymxdQY/
         o6Lw==
X-Gm-Message-State: AOAM532SoRhhtSvPhiG87ia3iVO1CfYWcMMd8nJDwuccZiT1D0OgK1Q6
        PGlgR9fAfvLI6mesPaIaQg6ZEw==
X-Google-Smtp-Source: ABdhPJz3Tx9rRuWOQsVP67dBEA0GfJ//6KQ3oIcn8+cDfu01dOKFVefKNNRcSbP+61lUU38AkDnLJw==
X-Received: by 2002:a05:600c:2dc1:: with SMTP id e1mr5037577wmh.108.1592820068560;
        Mon, 22 Jun 2020 03:01:08 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id x205sm16822187wmx.21.2020.06.22.03.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 03:01:08 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Jonathan Corbet <corbet@lwn.net>,
        Jeff Kirsher <jeffrey.t.kirsher@intel.com>,
        "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        John Crispin <john@phrozen.org>,
        Sean Wang <sean.wang@mediatek.com>,
        Mark Lee <Mark-MC.Lee@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Realtek linux nic maintainers <nic_swsd@realtek.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
        Fabien Parent <fparent@baylibre.com>,
        Stephane Le Provost <stephane.leprovost@mediatek.com>,
        Pedro Tsai <pedro.tsai@mediatek.com>,
        Andrew Perepech <andrew.perepech@mediatek.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 02/11] net: ethernet: ixgbe: don't call devm_mdiobus_free()
Date:   Mon, 22 Jun 2020 12:00:47 +0200
Message-Id: <20200622100056.10151-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200622100056.10151-1-brgl@bgdev.pl>
References: <20200622100056.10151-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

The idea behind devres is that the release callbacks are called if
probe fails. As we now check the return value of ixgbe_mii_bus_init(),
we can drop the call devm_mdiobus_free() in error path as the release
callback will be called automatically.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/net/ethernet/intel/ixgbe/ixgbe_phy.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/intel/ixgbe/ixgbe_phy.c b/drivers/net/ethernet/intel/ixgbe/ixgbe_phy.c
index 2fb97967961c..7980d7265e10 100644
--- a/drivers/net/ethernet/intel/ixgbe/ixgbe_phy.c
+++ b/drivers/net/ethernet/intel/ixgbe/ixgbe_phy.c
@@ -905,7 +905,6 @@ s32 ixgbe_mii_bus_init(struct ixgbe_hw *hw)
 	struct pci_dev *pdev = adapter->pdev;
 	struct device *dev = &adapter->netdev->dev;
 	struct mii_bus *bus;
-	int err = -ENODEV;
 
 	bus = devm_mdiobus_alloc(dev);
 	if (!bus)
@@ -923,7 +922,7 @@ s32 ixgbe_mii_bus_init(struct ixgbe_hw *hw)
 	case IXGBE_DEV_ID_X550EM_A_1G_T:
 	case IXGBE_DEV_ID_X550EM_A_1G_T_L:
 		if (!ixgbe_x550em_a_has_mii(hw))
-			goto ixgbe_no_mii_bus;
+			return -ENODEV;
 		bus->read = &ixgbe_x550em_a_mii_bus_read;
 		bus->write = &ixgbe_x550em_a_mii_bus_write;
 		break;
@@ -948,15 +947,8 @@ s32 ixgbe_mii_bus_init(struct ixgbe_hw *hw)
 	 */
 	hw->phy.mdio.mode_support = MDIO_SUPPORTS_C45 | MDIO_SUPPORTS_C22;
 
-	err = mdiobus_register(bus);
-	if (!err) {
-		adapter->mii_bus = bus;
-		return 0;
-	}
-
-ixgbe_no_mii_bus:
-	devm_mdiobus_free(dev, bus);
-	return err;
+	adapter->mii_bus = bus;
+	return mdiobus_register(bus);
 }
 
 /**
-- 
2.26.1

