Return-Path: <linux-doc+bounces-23419-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE9C9595B6
	for <lists+linux-doc@lfdr.de>; Wed, 21 Aug 2024 09:20:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 801AA1C22279
	for <lists+linux-doc@lfdr.de>; Wed, 21 Aug 2024 07:20:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D0AF1A7AD4;
	Wed, 21 Aug 2024 07:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XkSy2Bnz"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDFEC1A7AC9
	for <linux-doc@vger.kernel.org>; Wed, 21 Aug 2024 07:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724224760; cv=none; b=gcX37uNxQTs7zkTtLUlfPmpNY9sErMA28du1dNCNbB1UDe4EflRuEHHLhvWcCoug0M47i3lEY1zhHArtihbm7DD7WEXA3xvDoocIBdo6REG+0Ij7wd5dH0RwS4m86mUNaj9X09xp8RoBQ0vsBawHvpN0nKKtIosI6M9hf5QijW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724224760; c=relaxed/simple;
	bh=X1zz/TunuR2PG93iDywgu0fR0ZIioix5D5qvFJsuS9M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HfXmDZ7z6QRuY8oV/Mr7a5J7YzwkU5kInhhUOFPY7ipzi9b7im//AReS01CkD9Pqv0Vp8Zs3AHR+5Cp6OWHZYgUmIYx7Yk12eirI/mphYIDrSGK0NDl8cu7U3NKuia/PkbbL08vBa3xpspZktz2IXB7J9+KLEkabreDTgYBN4ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XkSy2Bnz; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724224757;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CLI8bZjR6OdWE6SPmBhjzuWJVjW15O9K3MBwEhWkwDY=;
	b=XkSy2BnziZJXpVkMxTN9FO94Ab7wAE3C+LYUdlXuYrcziRRk2765K1tHNy7SsK0MJFmTtT
	IRx1FGi18hPKPLmnX+kNMqVlk3BKoM49d6P6QWvRb/x0LwtVYWbCv6qB3uirzP8san+Mcf
	GUM3Qrc2wyW+XVl0CIHCKozS31SIL2U=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-1AESkTo0O96r5e5H1myycQ-1; Wed, 21 Aug 2024 03:19:16 -0400
X-MC-Unique: 1AESkTo0O96r5e5H1myycQ-1
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7a1dab8a2eeso775382785a.1
        for <linux-doc@vger.kernel.org>; Wed, 21 Aug 2024 00:19:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724224755; x=1724829555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CLI8bZjR6OdWE6SPmBhjzuWJVjW15O9K3MBwEhWkwDY=;
        b=axBwtlLlyVR49rcjKZW0y2zxdNRZugdYHHU5dyE/KabBByrncCxnbpvt38oG13HcOm
         E47QvPrYAvkoyqjyZRHUq+r0nwuvmC0k9VHUX0XlBGWwnaif0WL+laJm1I+mnjo4KMkV
         csucRVaOKeYtwZDWBTX7+TI+EnFIh8hQPvnieEDoUIAYlHmngT4WMBDPz/Q2sikPUG/t
         QEelPGW7lGXrsPYbZB/QfqMM2p7X35wBL3Tqqvch+5RprsdLxOO0BbS7mHCNECKPwxaj
         yJap1+wChl5BgmKYDXXAQwSGaSgBKSIrlpUDu60xCaXjxQ9C7zG9YNXiJ9lmDMdZWRWZ
         US1g==
X-Gm-Message-State: AOJu0YypOyY1eFszG76ABH3NxE+/M4xqonlPJ7E7lnczFjN00An1ViPV
	vu/G2klIizimaZHW8EdUEv+PfH7nvHz5ogVyVonY5loQ0SnDX+xbN96WkDksF9UFnKw6tqL+3zu
	HBhjSEBa7QcnWOBhruchiTqrvFVlCSh5shKl+7E6r5ZVhC6hOG5pISTwHTw==
X-Received: by 2002:a05:620a:1906:b0:79e:f8b7:5c73 with SMTP id af79cd13be357-7a6740c5e31mr226527885a.55.1724224755559;
        Wed, 21 Aug 2024 00:19:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtpkoHy3cS2PdzwF01k905nXUdsELS2xvQjiGeTjNuWZ60d5TFnGqma74hup77Ia1MJryw5Q==
X-Received: by 2002:a05:620a:1906:b0:79e:f8b7:5c73 with SMTP id af79cd13be357-7a6740c5e31mr226522685a.55.1724224755041;
        Wed, 21 Aug 2024 00:19:15 -0700 (PDT)
Received: from eisenberg.redhat.com (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a4ff013ef2sm596207885a.11.2024.08.21.00.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 00:19:14 -0700 (PDT)
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
	Keith Busch <kbusch@kernel.org>
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
Subject: [PATCH v2 3/9] block: mtip32xx: Replace deprecated PCI functions
Date: Wed, 21 Aug 2024 09:18:36 +0200
Message-ID: <20240821071842.8591-5-pstanner@redhat.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240821071842.8591-2-pstanner@redhat.com>
References: <20240821071842.8591-2-pstanner@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pcim_iomap_regions() and pcim_iomap_table() have been deprecated by the
PCI subsystem in commit e354bb84a4c1 ("PCI: Deprecate
pcim_iomap_table(), pcim_iomap_regions_request_all()").

In mtip32xx, these functions can easily be replaced by their respective
successors, pcim_request_region() and pcim_iomap(). Moreover, the
driver's calls to pcim_iounmap_regions() in probe()'s error path and in
remove() are not necessary. Cleanup can be performed by PCI devres
automatically.

Replace pcim_iomap_regions() and pcim_iomap_table().

Remove the calls to pcim_iounmap_regions().

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/block/mtip32xx/mtip32xx.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/block/mtip32xx/mtip32xx.c b/drivers/block/mtip32xx/mtip32xx.c
index c6ef0546ffc9..fcd5806621c7 100644
--- a/drivers/block/mtip32xx/mtip32xx.c
+++ b/drivers/block/mtip32xx/mtip32xx.c
@@ -2716,7 +2716,9 @@ static int mtip_hw_init(struct driver_data *dd)
 	int rv;
 	unsigned long timeout, timetaken;
 
-	dd->mmio = pcim_iomap_table(dd->pdev)[MTIP_ABAR];
+	dd->mmio = pcim_iomap(dd->pdev, MTIP_ABAR, 0);
+	if (!dd->mmio)
+		return -ENOMEM;
 
 	mtip_detect_product(dd);
 	if (dd->product_type == MTIP_PRODUCT_UNKNOWN) {
@@ -3726,9 +3728,9 @@ static int mtip_pci_probe(struct pci_dev *pdev,
 	}
 
 	/* Map BAR5 to memory. */
-	rv = pcim_iomap_regions(pdev, 1 << MTIP_ABAR, MTIP_DRV_NAME);
+	rv = pcim_request_region(pdev, MTIP_ABAR, MTIP_DRV_NAME);
 	if (rv < 0) {
-		dev_err(&pdev->dev, "Unable to map regions\n");
+		dev_err(&pdev->dev, "Unable to request regions\n");
 		goto iomap_err;
 	}
 
@@ -3849,8 +3851,6 @@ static int mtip_pci_probe(struct pci_dev *pdev,
 		drop_cpu(dd->work[2].cpu_binding);
 	}
 setmask_err:
-	pcim_iounmap_regions(pdev, 1 << MTIP_ABAR);
-
 iomap_err:
 	kfree(dd);
 	pci_set_drvdata(pdev, NULL);
@@ -3925,7 +3925,6 @@ static void mtip_pci_remove(struct pci_dev *pdev)
 
 	pci_disable_msi(pdev);
 
-	pcim_iounmap_regions(pdev, 1 << MTIP_ABAR);
 	pci_set_drvdata(pdev, NULL);
 
 	put_disk(dd->disk);
-- 
2.46.0


