Return-Path: <linux-doc+bounces-23219-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C9350957134
	for <lists+linux-doc@lfdr.de>; Mon, 19 Aug 2024 18:56:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 562D71F23543
	for <lists+linux-doc@lfdr.de>; Mon, 19 Aug 2024 16:56:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A25B918B467;
	Mon, 19 Aug 2024 16:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VP/7Anc2"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F8118A94A
	for <linux-doc@vger.kernel.org>; Mon, 19 Aug 2024 16:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724086397; cv=none; b=OmzaDWXL+vfODeMR6H38oDQ3hwyxLTSgYxKgUdEdSOX4FmeVYRJZgsGQlbJaJgpvsLML6se0SSlNzs7SlSzM09Kk20MWihNnq/LRNsokK8VwXlvUFolOIiRWNcPQQMGuMsDoUqYmz0bZFvq/iAmbm+Umd4T0HUCeq720U/UHPus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724086397; c=relaxed/simple;
	bh=1bt3tMc09G6s9xV0I/qYPefc2X8n9siL1P6ZGlLhoAc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EwodvUFZNiOSB5yOSU6lPrLvy39hFMyK2MghHDi2m0E5gZNLvAnd63i8z9tL0ftWI22WfBzNISL579U2eWed9uGdexn4hSgjObXw8ieI0EnCFKwp1YvwmLPhAl6zCLcIxOpvwU9BlN6tU47H4gtKgPrySYNV5AKNzieUR0yxARA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VP/7Anc2; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724086395;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=abZiwvPf4gC19vxFT17Sz8slSRtUXISkEhAwbNUMlrw=;
	b=VP/7Anc2bq/h9vR6/f840dNfWM5vZotkNcwdP1Bwp/2Z//uzmCJie6hh1qI7jClmw1Io3T
	H/39e9ZG9vly8fU75r+CzhR6/ibbc3Wqn9VBANyoqIXzOf0dF9q3YP985Lrvk3Sr4owpcC
	FRERWTJyWEyAt/VWBJ4RYQrEOhGfyt8=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-372-iWJvNWFpO2mcoLeg_Zz4kg-1; Mon, 19 Aug 2024 12:53:13 -0400
X-MC-Unique: iWJvNWFpO2mcoLeg_Zz4kg-1
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-8430e0fcda8so49432241.1
        for <linux-doc@vger.kernel.org>; Mon, 19 Aug 2024 09:53:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724086392; x=1724691192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=abZiwvPf4gC19vxFT17Sz8slSRtUXISkEhAwbNUMlrw=;
        b=t1zy/yN7Vq69Lr8viD6Ej4jyytBhd4UNXoOy+N10dXs4UgBJLynxdkN3Gt5I9Kxsz5
         DqX4SE1cEY5ByE18CW1xQy3kL1J8TBuArfpBRbaQLXB2DwM41davNaY7VCS3uTPSYNXv
         fC1hzVPZDhoMSr3S/71m/NsO9tb162f1/Rz0x8+pp5vqsgLnfotbzb4qK8dAXTUd7FaN
         jep+QCU+csCYylWVwY6jm1IKzOvrsKXMfV+SyxQUyrA8nCnvlc62TY/v3UmJd9/jmySV
         zprCEFD/pr6xtSXFQulVKtGgiOdmOf1+RqDFyrhyuzYq33wU1o2Mi7q4Z9X2DiKJPJUo
         ivoA==
X-Gm-Message-State: AOJu0YxeYbWp4evYTsoMmcu/sgRIq82Muzm5QLkgvtWpsaXmn3C3A98n
	bhD7k8/YpGonG/7m1cvNM7IvBFXrs16oztBR2xNfov+jb/RFv+YgPGJ+mShwd3Td8764iIjQDTI
	/uFgoHGvxiMnYSAdaX2Bo+k83MDq4JF8IQ9kIT7lDwBdvOG3SdB161GReAQ==
X-Received: by 2002:a05:6102:5127:b0:493:bb70:940 with SMTP id ada2fe7eead31-4977992674fmr7984184137.2.1724086392213;
        Mon, 19 Aug 2024 09:53:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSFSVYmUjqgNVHiq1+h9E7HGJis8qQ3DMxEZS8Skowa7KMQsueVdBGNDdQuxxSfXwtk0QtBA==
X-Received: by 2002:a05:6102:5127:b0:493:bb70:940 with SMTP id ada2fe7eead31-4977992674fmr7984139137.2.1724086391863;
        Mon, 19 Aug 2024 09:53:11 -0700 (PDT)
Received: from eisenberg.muc.redhat.com (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a4ff01e293sm446579885a.26.2024.08.19.09.53.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 09:53:11 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: onathan Corbet <corbet@lwn.net>,
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
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Philipp Stanner <pstanner@redhat.com>,
	Hannes Reinecke <hare@suse.de>,
	Damien Le Moal <dlemoal@kernel.org>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>
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
Subject: [PATCH 8/9] vdap: solidrun: Replace deprecated PCI functions
Date: Mon, 19 Aug 2024 18:51:48 +0200
Message-ID: <20240819165148.58201-10-pstanner@redhat.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819165148.58201-2-pstanner@redhat.com>
References: <20240819165148.58201-2-pstanner@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

solidrun utilizes pcim_iomap_regions(), which has been deprecated by the
PCI subsystem in commit e354bb84a4c1 ("PCI: Deprecate
pcim_iomap_table(), pcim_iomap_regions_request_all()"), among other
things because it forces usage of quite a complicated bitmask mechanism.
The bitmask handling code can entirely be removed by replacing
pcim_iomap_regions() and pcim_iomap_table().

Replace pcim_iomap_regions() and pcim_iomap_table() with
pci_iomap_region().

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/vdpa/solidrun/snet_main.c | 47 +++++++++++--------------------
 1 file changed, 16 insertions(+), 31 deletions(-)

diff --git a/drivers/vdpa/solidrun/snet_main.c b/drivers/vdpa/solidrun/snet_main.c
index 99428a04068d..abf027ca35e1 100644
--- a/drivers/vdpa/solidrun/snet_main.c
+++ b/drivers/vdpa/solidrun/snet_main.c
@@ -556,33 +556,24 @@ static const struct vdpa_config_ops snet_config_ops = {
 static int psnet_open_pf_bar(struct pci_dev *pdev, struct psnet *psnet)
 {
 	char name[50];
-	int ret, i, mask = 0;
+	int i;
+
+	snprintf(name, sizeof(name), "psnet[%s]-bars", pci_name(pdev));
+
 	/* We don't know which BAR will be used to communicate..
 	 * We will map every bar with len > 0.
 	 *
 	 * Later, we will discover the BAR and unmap all other BARs.
 	 */
 	for (i = 0; i < PCI_STD_NUM_BARS; i++) {
-		if (pci_resource_len(pdev, i))
-			mask |= (1 << i);
-	}
-
-	/* No BAR can be used.. */
-	if (!mask) {
-		SNET_ERR(pdev, "Failed to find a PCI BAR\n");
-		return -ENODEV;
-	}
-
-	snprintf(name, sizeof(name), "psnet[%s]-bars", pci_name(pdev));
-	ret = pcim_iomap_regions(pdev, mask, name);
-	if (ret) {
-		SNET_ERR(pdev, "Failed to request and map PCI BARs\n");
-		return ret;
-	}
+		if (pci_resource_len(pdev, i)) {
+			psnet->bars[i] = pcim_iomap_region(pdev, i, name);
+			if (IS_ERR(psnet->bars[i])) {
+				SNET_ERR(pdev, "Failed to request and map PCI BARs\n");
+				return PTR_ERR(psnet->bars[i]);
+			}
+		}
 
-	for (i = 0; i < PCI_STD_NUM_BARS; i++) {
-		if (mask & (1 << i))
-			psnet->bars[i] = pcim_iomap_table(pdev)[i];
 	}
 
 	return 0;
@@ -591,18 +582,15 @@ static int psnet_open_pf_bar(struct pci_dev *pdev, struct psnet *psnet)
 static int snet_open_vf_bar(struct pci_dev *pdev, struct snet *snet)
 {
 	char name[50];
-	int ret;
 
 	snprintf(name, sizeof(name), "snet[%s]-bar", pci_name(pdev));
 	/* Request and map BAR */
-	ret = pcim_iomap_regions(pdev, BIT(snet->psnet->cfg.vf_bar), name);
-	if (ret) {
+	snet->bar = pcim_iomap_region(pdev, snet->psnet->cfg.vf_bar, name);
+	if (IS_ERR(snet->bar)) {
 		SNET_ERR(pdev, "Failed to request and map PCI BAR for a VF\n");
-		return ret;
+		return PTR_ERR(snet->bar);
 	}
 
-	snet->bar = pcim_iomap_table(pdev)[snet->psnet->cfg.vf_bar];
-
 	return 0;
 }
 
@@ -650,15 +638,12 @@ static int psnet_detect_bar(struct psnet *psnet, u32 off)
 
 static void psnet_unmap_unused_bars(struct pci_dev *pdev, struct psnet *psnet)
 {
-	int i, mask = 0;
+	int i;
 
 	for (i = 0; i < PCI_STD_NUM_BARS; i++) {
 		if (psnet->bars[i] && i != psnet->barno)
-			mask |= (1 << i);
+			pcim_iounmap_region(pdev, i);
 	}
-
-	if (mask)
-		pcim_iounmap_regions(pdev, mask);
 }
 
 /* Read SNET config from PCI BAR */
-- 
2.46.0


