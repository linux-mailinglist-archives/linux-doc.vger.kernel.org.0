Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C390E203452
	for <lists+linux-doc@lfdr.de>; Mon, 22 Jun 2020 12:02:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727118AbgFVKBO (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 22 Jun 2020 06:01:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727106AbgFVKBN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 22 Jun 2020 06:01:13 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0ED34C061795
        for <linux-doc@vger.kernel.org>; Mon, 22 Jun 2020 03:01:13 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id g10so14254284wmh.4
        for <linux-doc@vger.kernel.org>; Mon, 22 Jun 2020 03:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=A+lImr9HJg7an5aR2kWVhsrz0bguXORdrvazpSsfAy4=;
        b=Tsq60zSlQyklW6ikiOvVha9m8MSQkGcpaji1GbS6xFPATyiJUUq3JKJyfCAyoxgehy
         6CzmzBfAhfYC+JJ7E2jJttBs8SlhgR8oo9tMY8qH0H5uA72QFI9xKDo+9n217Y4MWcDI
         iIpqF19hJetEL+xliD5MhEvVcUjPcnrYARK0a04t2IuYk/3fmnQix3PKNa1StSQ2Ywir
         OsASWBCKRjtVl/oQTuUFv5MYvUju1kmBOyveg54l6ZkSpLRCgEJ7CT/LJK7QfCebpVVu
         Mj4niG7n9b0pf3hzpGxkqMvGlvJ+MWwIDdWWPh8rjVNo3Yy750rQCUi4Ar9S11Dn+wof
         slIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A+lImr9HJg7an5aR2kWVhsrz0bguXORdrvazpSsfAy4=;
        b=PjO/NzRranLFhEMbhb/CsYcIxwwgD5IepZ5ZHwjWpLMIPu2d8jFaCwwQQbrpPJJkOh
         bttCAeeiAFLMUG2VeDB9Uu1A/y2FmJwISpzPCq/ayo9P7mf/U2MD6VdXpUPRgxCiIgU7
         mzzCJTa4apCsRVj9sJIRsr4x4l4I7RFQ2m0xXNcdB/sWbSBkEyoYdiGnkq2dkZtXgAgk
         wUKNMSOjPjfqVm9I5m+4pGwhn3x9iiW+MF8WEhXoX1O9E+MOaudJBurphG0m5eW9A/bc
         AA7F2dmQinE579NTnte2rXF6JYPzZXcJ6LckdfiurdA0VdT+RPZR8IWsb0n3XxLwKoYE
         jAHA==
X-Gm-Message-State: AOAM533i3MAvpHG2ThPREF0sOouMXKwrsUEe1ekwANlvVquTVPFR6DZz
        3qQmK/5z0BBfAGG7M1wu0L81MQ==
X-Google-Smtp-Source: ABdhPJz+xi3uc649226XqSHmo+O8gA+/80J/5T5A137PMAF2MXQi5PymwGW6I5MXBKX7A322evi/xw==
X-Received: by 2002:a1c:3bc2:: with SMTP id i185mr17995739wma.33.1592820071777;
        Mon, 22 Jun 2020 03:01:11 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id x205sm16822187wmx.21.2020.06.22.03.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 03:01:11 -0700 (PDT)
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
Subject: [PATCH 04/11] net: devres: rename the release callback of devm_register_netdev()
Date:   Mon, 22 Jun 2020 12:00:49 +0200
Message-Id: <20200622100056.10151-5-brgl@bgdev.pl>
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

Make it an explicit counterpart to devm_register_netdev() just like we
do with devm_free_netdev() for better clarity.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 net/devres.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/devres.c b/net/devres.c
index 1583ccb207c0..d7aa92243844 100644
--- a/net/devres.c
+++ b/net/devres.c
@@ -39,7 +39,7 @@ struct net_device *devm_alloc_etherdev_mqs(struct device *dev, int sizeof_priv,
 }
 EXPORT_SYMBOL(devm_alloc_etherdev_mqs);
 
-static void devm_netdev_release(struct device *dev, void *this)
+static void devm_unregister_netdev(struct device *dev, void *this)
 {
 	struct net_device_devres *res = this;
 
@@ -60,7 +60,7 @@ int devm_register_netdev(struct device *dev, struct net_device *ndev)
 	struct net_device_devres *dr;
 	int ret;
 
-	dr = devres_alloc(devm_netdev_release, sizeof(*dr), GFP_KERNEL);
+	dr = devres_alloc(devm_unregister_netdev, sizeof(*dr), GFP_KERNEL);
 	if (!dr)
 		return -ENOMEM;
 
-- 
2.26.1

