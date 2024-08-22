Return-Path: <linux-doc+bounces-23569-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 084E095B75D
	for <lists+linux-doc@lfdr.de>; Thu, 22 Aug 2024 15:50:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5B74AB273F2
	for <lists+linux-doc@lfdr.de>; Thu, 22 Aug 2024 13:50:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60B941CDA1A;
	Thu, 22 Aug 2024 13:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YwDAl0+W"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD781CCED6
	for <linux-doc@vger.kernel.org>; Thu, 22 Aug 2024 13:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724334495; cv=none; b=S20fUB7mYqJ2wi2I8UUMu7FYMeACtvOccIyqMPBVf4pnffnxk1AGJ2QgKHvp/TvhvYwA7/FwGa5yI7KOaoLiOglyPiKFwRCTtKEutJ0w04vtI22KOlMjYjKeQR7u7ffUruTZ2cNllx/j2cTmoEDEtUGK7/HK+j90nPiS/d+fRWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724334495; c=relaxed/simple;
	bh=kigVrUGzwAc3Gfl0QApPC++gUgBQlYDwvJKklnpQh/U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UEZHacb+aKXrBZvp6URv0+CpErrgjdV/yxHwwl6SuTB885D4PYJapH7dUHWR2VCkeN6mkx1E/x42I0aCqsRdpV9DhGJm1207uOrCCuUzPThrLcr2z5BUa629qlZj+aU1f7hSiI1MIEBEh05p9X5x7oWtQEyqjENSHoVT4cHavQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YwDAl0+W; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724334491;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FEnCsYi4V2PnChy33tc28SWivSiMlK/Z32Tet3XvGFE=;
	b=YwDAl0+WdzZgTTBH7GZQHayynLUP1G2MA77EwzE9+2bH3zJd9aEVxAQXmwpgN2KNNpmXYz
	Rtx1EKrpWQsRyqTg+8E2z9FJpHyY3qCUUwgsOjdLJD7tIxFxZ8pKrIoc/Tkpy+iHbzgN1t
	y+/717jt2pKjEj1v1jSQuTGAAZLsJU4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-400-Lmw6cox0PXSzw9ZG6wbk8g-1; Thu, 22 Aug 2024 09:48:09 -0400
X-MC-Unique: Lmw6cox0PXSzw9ZG6wbk8g-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-428fc34f41bso7042685e9.3
        for <linux-doc@vger.kernel.org>; Thu, 22 Aug 2024 06:48:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724334488; x=1724939288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FEnCsYi4V2PnChy33tc28SWivSiMlK/Z32Tet3XvGFE=;
        b=pdgLWZS+wghomrKWkBiA4SXwk6svb/t6AiPAAMZy2J2vp5Iuc3KBE/7En6ItH+RQMp
         kWOiwCiZcV1OdL1OkWDn5cgL1klX1KrR50b2d4Rewpx20uyF+GdEs/OhknJchxyxgzHv
         9V5inVM4fozgvRoUHWZCSt+AZrbgfpRPQu1r90FUOHG4t94nYSzslsJ3rHy1ExhQZyrm
         e1OFfv7/7l+uB/ge8LALbNtNZdtOnlLrFLUry+g5IFNlY9qd2Yq+dwLaUxwjclrf2HxC
         EJDIlnDMgwFdPoh2XafbAM+Oq3DsUKF6ylc41hdyj9SM4mnCPd/yzbynP3uj+ixfFbOQ
         yE1g==
X-Gm-Message-State: AOJu0YxMOgYJx/zD62cFjpTjJx7p8TBz3E0vYL/cLJpDUjIEBUQMWR7/
	xzSa5rHN4G7oTV2iJki1TMxBrJ3hZixMXJzYonDd7IeW8lQJEc1uV3B6zILUDja72K5NYs7YGo5
	epSOVXkS+gqP7H7Gvj4iMuPlEaMc7SAXBOubR+mz6MSnMThqQCPO98AQGXQ==
X-Received: by 2002:adf:e410:0:b0:367:8ff0:e022 with SMTP id ffacd0b85a97d-372fd82c514mr3475185f8f.63.1724334487683;
        Thu, 22 Aug 2024 06:48:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEfm5IVXln66BGNZF5JJpxCZS0SFv4UM3BbHCVYBs8QYQ2NHD/YJAIrke5UaPWYY0eCv/EJGA==
X-Received: by 2002:adf:e410:0:b0:367:8ff0:e022 with SMTP id ffacd0b85a97d-372fd82c514mr3475148f8f.63.1724334487230;
        Thu, 22 Aug 2024 06:48:07 -0700 (PDT)
Received: from eisenberg.muc.redhat.com (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ac5162322sm25057215e9.24.2024.08.22.06.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 06:48:06 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Jens Axboe <axboe@kernel.dk>,
	Wu Hao <hao.wu@intel.com>,
	Tom Rix <trix@redhat.com>,
	Moritz Fischer <mdf@kernel.org>,
	Xu Yilun <yilun.xu@intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Alvaro Karsz <alvaro.karsz@solid-run.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Philipp Stanner <pstanner@redhat.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Hannes Reinecke <hare@suse.de>,
	Chaitanya Kulkarni <kch@nvidia.com>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-fpga@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	virtualization@lists.linux.dev
Subject: [PATCH v3 6/9] ethernet: stmicro: Simplify PCI devres usage
Date: Thu, 22 Aug 2024 15:47:38 +0200
Message-ID: <20240822134744.44919-7-pstanner@redhat.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240822134744.44919-1-pstanner@redhat.com>
References: <20240822134744.44919-1-pstanner@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

stmicro uses PCI devres in the wrong way. Resources requested
through pcim_* functions don't need to be cleaned up manually in the
remove() callback or in the error unwind path of a probe() function.

Moreover, there is an unnecessary loop which only requests and ioremaps
BAR 0, but iterates over all BARs nevertheless.

Furthermore, pcim_iomap_regions() and pcim_iomap_table() have been
deprecated by the PCI subsystem in commit e354bb84a4c1 ("PCI: Deprecate
pcim_iomap_table(), pcim_iomap_regions_request_all()").

Replace these functions with pcim_iomap_region().

Remove the unnecessary manual pcim_* cleanup calls.

Remove the unnecessary loop over all BARs.

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 .../ethernet/stmicro/stmmac/dwmac-loongson.c  | 25 +++++--------------
 .../net/ethernet/stmicro/stmmac/stmmac_pci.c  | 18 +++++--------
 2 files changed, 12 insertions(+), 31 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
index 9e40c28d453a..5d42a9fad672 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
@@ -50,7 +50,7 @@ static int loongson_dwmac_probe(struct pci_dev *pdev, const struct pci_device_id
 	struct plat_stmmacenet_data *plat;
 	struct stmmac_resources res;
 	struct device_node *np;
-	int ret, i, phy_mode;
+	int ret, phy_mode;
 
 	np = dev_of_node(&pdev->dev);
 
@@ -88,14 +88,11 @@ static int loongson_dwmac_probe(struct pci_dev *pdev, const struct pci_device_id
 		goto err_put_node;
 	}
 
-	/* Get the base address of device */
-	for (i = 0; i < PCI_STD_NUM_BARS; i++) {
-		if (pci_resource_len(pdev, i) == 0)
-			continue;
-		ret = pcim_iomap_regions(pdev, BIT(0), pci_name(pdev));
-		if (ret)
-			goto err_disable_device;
-		break;
+	memset(&res, 0, sizeof(res));
+	res.addr = pcim_iomap_region(pdev, 0, pci_name(pdev));
+	if (IS_ERR(res.addr)) {
+		ret = PTR_ERR(res.addr);
+		goto err_disable_device;
 	}
 
 	plat->bus_id = of_alias_get_id(np, "ethernet");
@@ -116,8 +113,6 @@ static int loongson_dwmac_probe(struct pci_dev *pdev, const struct pci_device_id
 
 	loongson_default_data(plat);
 	pci_enable_msi(pdev);
-	memset(&res, 0, sizeof(res));
-	res.addr = pcim_iomap_table(pdev)[0];
 
 	res.irq = of_irq_get_byname(np, "macirq");
 	if (res.irq < 0) {
@@ -158,18 +153,10 @@ static void loongson_dwmac_remove(struct pci_dev *pdev)
 {
 	struct net_device *ndev = dev_get_drvdata(&pdev->dev);
 	struct stmmac_priv *priv = netdev_priv(ndev);
-	int i;
 
 	of_node_put(priv->plat->mdio_node);
 	stmmac_dvr_remove(&pdev->dev);
 
-	for (i = 0; i < PCI_STD_NUM_BARS; i++) {
-		if (pci_resource_len(pdev, i) == 0)
-			continue;
-		pcim_iounmap_regions(pdev, BIT(i));
-		break;
-	}
-
 	pci_disable_msi(pdev);
 	pci_disable_device(pdev);
 }
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
index 352b01678c22..f89a8a54c4e8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
@@ -188,11 +188,11 @@ static int stmmac_pci_probe(struct pci_dev *pdev,
 		return ret;
 	}
 
-	/* Get the base address of device */
+	/* Request the base address BAR of device */
 	for (i = 0; i < PCI_STD_NUM_BARS; i++) {
 		if (pci_resource_len(pdev, i) == 0)
 			continue;
-		ret = pcim_iomap_regions(pdev, BIT(i), pci_name(pdev));
+		ret = pcim_request_region(pdev, i, pci_name(pdev));
 		if (ret)
 			return ret;
 		break;
@@ -205,7 +205,10 @@ static int stmmac_pci_probe(struct pci_dev *pdev,
 		return ret;
 
 	memset(&res, 0, sizeof(res));
-	res.addr = pcim_iomap_table(pdev)[i];
+	/* Get the base address of device */
+	res.addr = pcim_iomap(pdev, i, 0);
+	if (!res.addr)
+		return -ENOMEM;
 	res.wol_irq = pdev->irq;
 	res.irq = pdev->irq;
 
@@ -231,16 +234,7 @@ static int stmmac_pci_probe(struct pci_dev *pdev,
  */
 static void stmmac_pci_remove(struct pci_dev *pdev)
 {
-	int i;
-
 	stmmac_dvr_remove(&pdev->dev);
-
-	for (i = 0; i < PCI_STD_NUM_BARS; i++) {
-		if (pci_resource_len(pdev, i) == 0)
-			continue;
-		pcim_iounmap_regions(pdev, BIT(i));
-		break;
-	}
 }
 
 static int __maybe_unused stmmac_pci_suspend(struct device *dev)
-- 
2.46.0


