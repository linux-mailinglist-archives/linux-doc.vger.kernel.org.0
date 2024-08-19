Return-Path: <linux-doc+bounces-23214-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC3C95710A
	for <lists+linux-doc@lfdr.de>; Mon, 19 Aug 2024 18:54:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D94CE283600
	for <lists+linux-doc@lfdr.de>; Mon, 19 Aug 2024 16:54:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C3E617BEC6;
	Mon, 19 Aug 2024 16:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CKkSMM/S"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77995189503
	for <linux-doc@vger.kernel.org>; Mon, 19 Aug 2024 16:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724086370; cv=none; b=s1l5HGBbUWN0y1+VruUAw0jpDgEWUs3umhXQvb4TbnObYmRxmgfCW9f8UQ40uleOTlI+0UHE9/T5l/dHzqZvr2j+aWnHhOoVoTFVRZHswIubUO30FwcImJQkVd481Mj4guozdive/WGIi5bO5gwqZ/3QysL5hbVgB0zDfuBlk6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724086370; c=relaxed/simple;
	bh=mXOGVudfLi+KidU2SAFK83EWun0K/ZT4Bj7/UEKpbBQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UEHYbnTHq1dkvXGDcPoFxKVp+7aNZYOMpbHyR5glnBOevrr3ccBFxIfSyPotvHfb7OQuNh9O7fN7gwVCaWGGb+V9hq2b1FxHu1qpJHOqBZ7Pct283de2vgENLdt3nzpTY9sX7kluIQbQyQjutvXHNKy9pwx5PKOsTHg1xdx0s9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CKkSMM/S; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724086367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tC041gyCjeykzm80lE0q63CM17fX2IeQcUJmRWOoBEs=;
	b=CKkSMM/SLz1MT28ayFNdIUl/LwraH4cQor1BlGgSwEuID1kf/9PiEBP2gpV3xIiDDHr0ZU
	EU4gpRpZWGnVc1YtHgk3ws/OE0mE8eE1dficddQe4tZBwpxyRHcc4CYEpcvFuo5uB7Umjb
	Ue2kf5iAw27/09vXC+OL8zALO9gRm1w=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-110-sXtf2g3qOsW9ePkPnKeYGg-1; Mon, 19 Aug 2024 12:52:46 -0400
X-MC-Unique: sXtf2g3qOsW9ePkPnKeYGg-1
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6bf7c81941aso7657326d6.0
        for <linux-doc@vger.kernel.org>; Mon, 19 Aug 2024 09:52:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724086366; x=1724691166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tC041gyCjeykzm80lE0q63CM17fX2IeQcUJmRWOoBEs=;
        b=A6UDlgl7kyfNmlbkVbPD56m+UoVqV/OX8hWB9Qwb5ywAjzQ+b9x0LSwzCBdWYdCiQm
         xHw1kMb89W8B6vGbB521U3raF4xUSyX5F0MLwXr4U4bjCv0X+81+hKRucuvnOZa9BLr7
         QOuHfu8asr3DlfnKL5EkLUuU8v3n/eX9s0pm0S2jYXAUYTGaWnts0XlK1cA3vcFvZVqD
         4x1Mb8ZxPcz7AP/4SUJCsLyjFNC1PW8morAt05L1bjJCElm7YLmQZyD4MRj6Yd8XK5Xi
         4e5YRHM6IYIvt0Gkcra0GaoNVMpTGPYx1Px9hRnbtD2pHkumf0dcvgegu64QVxrU9kZJ
         E+lg==
X-Gm-Message-State: AOJu0Yx3Nk1Pl5oUFBldSwQtd8o5DTv/Z4/6ACRUafK22Z5+hUKxGPoZ
	Bk1upABZvlLB0u0HzvBI7bqtfEgLDwmWCJ+RYjUMcae9/Z9IlmPXHfopWB1AxQG6qy08uLPsXYX
	+y9ScMGrUAWS3bXF55st16YNzgewsK4mCMdMpyfUOvumqPBaStdy2rTHG6Q==
X-Received: by 2002:a05:620a:370c:b0:79b:eca2:b807 with SMTP id af79cd13be357-7a506b5a38amr835422985a.3.1724086366028;
        Mon, 19 Aug 2024 09:52:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtuH1Vc6yAH1kELWuk66Dch7OPcqy61XGhK4KsxZEzCDqaZHzSUCLXnDGGtW4mk4ZWqmvkng==
X-Received: by 2002:a05:620a:370c:b0:79b:eca2:b807 with SMTP id af79cd13be357-7a506b5a38amr835421185a.3.1724086365518;
        Mon, 19 Aug 2024 09:52:45 -0700 (PDT)
Received: from eisenberg.muc.redhat.com (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a4ff01e293sm446579885a.26.2024.08.19.09.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 09:52:45 -0700 (PDT)
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
Subject: [PATCH 3/9] fpga/dfl-pci.c: Replace deprecated PCI functions
Date: Mon, 19 Aug 2024 18:51:43 +0200
Message-ID: <20240819165148.58201-5-pstanner@redhat.com>
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

pcim_iomap_regions() and pcim_iomap_table() have been deprecated by the
PCI subsystem in commit e354bb84a4c1 ("PCI: Deprecate
pcim_iomap_table(), pcim_iomap_regions_request_all()").

Port dfl-pci.c to the successor, pcim_iomap_region().

Consistently, replace pcim_iounmap_regions() with pcim_iounmap_region().

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/fpga/dfl-pci.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/fpga/dfl-pci.c b/drivers/fpga/dfl-pci.c
index 80cac3a5f976..2099c497feec 100644
--- a/drivers/fpga/dfl-pci.c
+++ b/drivers/fpga/dfl-pci.c
@@ -41,10 +41,13 @@ struct cci_drvdata {
 
 static void __iomem *cci_pci_ioremap_bar0(struct pci_dev *pcidev)
 {
-	if (pcim_iomap_regions(pcidev, BIT(0), DRV_NAME))
+	void __iomem *bar0;
+
+	bar0 = pcim_iomap_region(pcidev, 0, DRV_NAME);
+	if (IS_ERR(bar0))
 		return NULL;
 
-	return pcim_iomap_table(pcidev)[0];
+	return bar0;
 }
 
 static int cci_pci_alloc_irq(struct pci_dev *pcidev)
@@ -296,7 +299,7 @@ static int find_dfls_by_default(struct pci_dev *pcidev,
 	}
 
 	/* release I/O mappings for next step enumeration */
-	pcim_iounmap_regions(pcidev, BIT(0));
+	pcim_iounmap_region(pcidev, 0);
 
 	return ret;
 }
-- 
2.46.0


