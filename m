Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D1F920345B
	for <lists+linux-doc@lfdr.de>; Mon, 22 Jun 2020 12:02:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727094AbgFVKCk (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 22 Jun 2020 06:02:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727093AbgFVKBM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 22 Jun 2020 06:01:12 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49217C0617BA
        for <linux-doc@vger.kernel.org>; Mon, 22 Jun 2020 03:01:11 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id t194so15084049wmt.4
        for <linux-doc@vger.kernel.org>; Mon, 22 Jun 2020 03:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=okWA8PmH0C2v2F1PxoaaMH4dinGpC6QBNEa7DW2Zh+g=;
        b=0NIB4N040OCOlLgg1O0x3F3JvByO2McpYkbxqJlqEN6Uq58x4AMdQ+vmj+3LegiabQ
         Qi5h6Dcv3VNEw+1qhAS9iL+Ip15A313D+S5s7uJcHHRwosRSi7RgslmsGIt0O228NVDo
         PoTwoUyuwGRep31ekyLWFFUPoZ/TiBca0eNIeHgmWQ1XaehWYL72IoRRCRAZdx1cSaJ3
         OlWtHwtJz9u+WM0ep6ON0EkIZ8Sve2lyWWwlIAcWWWiut3v+6NKMu8uaSloirjUY3JBr
         9Z8QSzo7FQnOxk4qsBB/iDIcaICDzSEM/QDfagcUetqaFwncNnOOvWoj+ek6OenujuR7
         /TRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=okWA8PmH0C2v2F1PxoaaMH4dinGpC6QBNEa7DW2Zh+g=;
        b=XuDk5KVYpijlT8UIgeE3chNB4A8XIfqVe8n05icPCa+TQyEnjYq+ZtlMiNrFN3GvKa
         g+39Gv/s5NncDeYw6PYdd6hGMshUl6clZj6oZrs2mRJC+6W7ysalFcCa7uaO8vMJCaOE
         O5904MdDG7UabkwsHizNYn2viWwFxAPF9vuyxTjeE4OYNRtCHNi5E1IfmoMCNrDb2diE
         itaeC8iTdHN8ODzsLhpIMm/2gtbAD1YWswuTg45m7llIlRU9bemx84oOm5aOqAtL1noU
         FRktOR3c/uBNThY64x7vPXCnSCFeokiBDUfaVV6YFFCof1TM+8NRJL31knZ01N2SFvfO
         gmEw==
X-Gm-Message-State: AOAM531PagWXGQQttU/bzgezX9uEWxIc5rxFu5qqfvSPtZ7j1+N0PaNU
        qeBfRZh4AOK+Z2UgpUdYSBYiNA==
X-Google-Smtp-Source: ABdhPJwS5xS9WKkHvow7dKsFvCMdQtYLfCBeItKxhFKFlwRPqAUaAjn5C3o1Oi23Aq0D8zU5tG1vjg==
X-Received: by 2002:a1c:804c:: with SMTP id b73mr698464wmd.59.1592820070021;
        Mon, 22 Jun 2020 03:01:10 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id x205sm16822187wmx.21.2020.06.22.03.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 03:01:09 -0700 (PDT)
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
Subject: [PATCH 03/11] net: devres: relax devm_register_netdev()
Date:   Mon, 22 Jun 2020 12:00:48 +0200
Message-Id: <20200622100056.10151-4-brgl@bgdev.pl>
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

This devres helper registers a release callback that only unregisters
the net_device. It works perfectly fine with netdev structs that are
not managed on their own. There's no reason to check this - drop the
warning.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 net/devres.c | 19 +------------------
 1 file changed, 1 insertion(+), 18 deletions(-)

diff --git a/net/devres.c b/net/devres.c
index 57a6a88d11f6..1583ccb207c0 100644
--- a/net/devres.c
+++ b/net/devres.c
@@ -46,14 +46,6 @@ static void devm_netdev_release(struct device *dev, void *this)
 	unregister_netdev(res->ndev);
 }
 
-static int netdev_devres_match(struct device *dev, void *this, void *match_data)
-{
-	struct net_device_devres *res = this;
-	struct net_device *ndev = match_data;
-
-	return ndev == res->ndev;
-}
-
 /**
  *	devm_register_netdev - resource managed variant of register_netdev()
  *	@dev: managing device for this netdev - usually the parent device
@@ -61,22 +53,13 @@ static int netdev_devres_match(struct device *dev, void *this, void *match_data)
  *
  *	This is a devres variant of register_netdev() for which the unregister
  *	function will be call automatically when the managing device is
- *	detached. Note: the net_device used must also be resource managed by
- *	the same struct device.
+ *	detached.
  */
 int devm_register_netdev(struct device *dev, struct net_device *ndev)
 {
 	struct net_device_devres *dr;
 	int ret;
 
-	/* struct net_device must itself be managed. For now a managed netdev
-	 * can only be allocated by devm_alloc_etherdev_mqs() so the check is
-	 * straightforward.
-	 */
-	if (WARN_ON(!devres_find(dev, devm_free_netdev,
-				 netdev_devres_match, ndev)))
-		return -EINVAL;
-
 	dr = devres_alloc(devm_netdev_release, sizeof(*dr), GFP_KERNEL);
 	if (!dr)
 		return -ENOMEM;
-- 
2.26.1

