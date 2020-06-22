Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50873203465
	for <lists+linux-doc@lfdr.de>; Mon, 22 Jun 2020 12:03:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728094AbgFVKC7 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 22 Jun 2020 06:02:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727063AbgFVKBI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 22 Jun 2020 06:01:08 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 330CAC061798
        for <linux-doc@vger.kernel.org>; Mon, 22 Jun 2020 03:01:08 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id y20so15094433wmi.2
        for <linux-doc@vger.kernel.org>; Mon, 22 Jun 2020 03:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5QarOMVR645D9ubKovjzVLDL1uXK7z1gDINN/6iJvAs=;
        b=LpewbTVAIvBpnXi99/xVv5fbqz2WujW0FcFIKxrOtFsxX8fD+Q/1J+ukHVtzm2tM0u
         nrSNkek+MnZpGtu/cb3IES/Oe0XCrkBfBJI7bMVzqbKrpKpiN6tkeNUJijkQQ2taMHgV
         F2/kkG8pj76PGjfgqO9kVPMj+M50223gvL2bEDlGEZm57XR+OYc7hJ2fylF1Euolc3X2
         Sv/NLPTj62fMq3VPOxv/PcWtMYNVFJgKmLsSKRZG3V9OJmDfKzvarPK3gG08+dN+VRLN
         hib1dKtxy+nGusP97umOk8eJL3G8NZUA6W5f4/aFKPSPpMx8D1c5kMmHmm6jkKV4D31K
         rYAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5QarOMVR645D9ubKovjzVLDL1uXK7z1gDINN/6iJvAs=;
        b=Zd826Voyumbm9szMqsEr/XdSRmEoyaBF/ULXdqD0Ihwvxf6lR5CkPeWohY73UAUu2d
         htVuLcUjRsXUsACNa7Wev6Jkl5k49iBNZHbrJNADIHK14mrbp92jCchx01o67EFAp4l9
         Jci2a5rXB+aKubp9ecHSKxmEOivwrcmWnkEPRBx5PWTbwNTIDcOoGtkOBVEMQp0sxAQv
         tm5zuhHxFibXdB9VxNpvX6JNjvtNwi76vEobzMwTCRNFytsylKQfMsAXqaN7jl82p2hl
         VaBovhdFDsFQv78jKWaU/IyQeB2By73Bnv8mqwdKcRwYkTDSB3ydQqExMOoFDnUVl+Nf
         TEOA==
X-Gm-Message-State: AOAM530s0kZT+ZR2Lh8IkGSqi9nqBpmzNk24hXLjUB6n60TWz2ZwEos3
        0Cx+bM5/6g3qNDZ7Dg3qNa6I3Q==
X-Google-Smtp-Source: ABdhPJyQJrKCdVTA5/4h6jLuGo2TntfNLAXOnjZEpfXKXnJs07i++H3XlKxtAUGNs97IxT5JDpCRCw==
X-Received: by 2002:a1c:bc55:: with SMTP id m82mr10040285wmf.92.1592820066976;
        Mon, 22 Jun 2020 03:01:06 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id x205sm16822187wmx.21.2020.06.22.03.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 03:01:06 -0700 (PDT)
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
Subject: [PATCH 01/11] net: ethernet: ixgbe: check the return value of ixgbe_mii_bus_init()
Date:   Mon, 22 Jun 2020 12:00:46 +0200
Message-Id: <20200622100056.10151-2-brgl@bgdev.pl>
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

This function may fail. Check its return value and propagate the error
code.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/intel/ixgbe/ixgbe_main.c b/drivers/net/ethernet/intel/ixgbe/ixgbe_main.c
index f162b8b8f345..4ec4eeb9736b 100644
--- a/drivers/net/ethernet/intel/ixgbe/ixgbe_main.c
+++ b/drivers/net/ethernet/intel/ixgbe/ixgbe_main.c
@@ -11167,10 +11167,14 @@ static int ixgbe_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 			IXGBE_LINK_SPEED_10GB_FULL | IXGBE_LINK_SPEED_1GB_FULL,
 			true);
 
-	ixgbe_mii_bus_init(hw);
+	err = ixgbe_mii_bus_init(hw);
+	if (err)
+		goto err_netdev;
 
 	return 0;
 
+err_netdev:
+	unregister_netdev(netdev);
 err_register:
 	ixgbe_release_hw_control(adapter);
 	ixgbe_clear_interrupt_scheme(adapter);
-- 
2.26.1

