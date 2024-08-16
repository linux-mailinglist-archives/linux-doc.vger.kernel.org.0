Return-Path: <linux-doc+bounces-22908-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB33B954418
	for <lists+linux-doc@lfdr.de>; Fri, 16 Aug 2024 10:25:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D07791C2110A
	for <lists+linux-doc@lfdr.de>; Fri, 16 Aug 2024 08:25:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A90BF144D20;
	Fri, 16 Aug 2024 08:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="K3ruAMDU"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF95A1422D6
	for <linux-doc@vger.kernel.org>; Fri, 16 Aug 2024 08:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723796606; cv=none; b=jo1SME7jPanOLjde3+s/Tql00fZwGUX3GpkueUNVERR8T+bRcN0BhZ2WvWLjWVImSrImOclTspSIpI8besm9CF3aHB74ca9+5y106Vmr95BfjUiXife8/qpk4qjKdgTl4xfri+8SVKTaBN6s7dIWQp6nKxj61U7WZKB4GieHNL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723796606; c=relaxed/simple;
	bh=Ikcj7wgv1Qy7Ju+LDfxPN1stK4YmeslVnLGGvivdxCY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DxUhvnGkYZu0+8i6bef+WaLsqZ+RDPNqpoB4JVwEYDC39MFql6S34+G7UeBWDc8qxzHbZ5QyWx2kD3sU/xSeJJloCePHKZRGY4Fs0ZeblAypCC9d94RCTdq2ibEfgAEdwq/ugXFzQl+AdIfnOkYMAnV5I0poN75qh1MSykRPw88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=K3ruAMDU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723796603;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2Ef5N9W9keJdc7289wDsRj77u8AEBs4t25pZcN+UHEE=;
	b=K3ruAMDUnMoAqeWnM5g9c45fWyt71lKScuuHnb2ijUwD0ffWGCxhBCLApdVXMITirm6b1P
	edGqFkQ2WZlNkJY3nSDdYmJsqV4xd00lER6MxDDYqo4srW0P4sDebCaWkbnEkuXC+XpIs1
	jn8gqGmteVixTpXzgEgZwfeSHw7g1DI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-107-tS5YOabGMDaOONfdgwaglg-1; Fri, 16 Aug 2024 04:23:21 -0400
X-MC-Unique: tS5YOabGMDaOONfdgwaglg-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-429e937ed37so2344625e9.3
        for <linux-doc@vger.kernel.org>; Fri, 16 Aug 2024 01:23:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723796600; x=1724401400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Ef5N9W9keJdc7289wDsRj77u8AEBs4t25pZcN+UHEE=;
        b=RRWBuhu1KDn37k75k6/7pptjsjcKYPOErzL3KNWZqXyMttQg8KaYUl4P/uZFuOoCSw
         A9jlli85ncX50+p/dzSFwWYI3laemciQdD/Dzf3JRup+HfjVowJkmK6YOj78ma+7Gzbs
         pEEjpFrdcXutfi+AkG8bA9S4y+ElE6wddaNwcQoURRy1PgvWU7UPHiHSEbH0meG5+r15
         MnTJCAcCTB3GodQVb1dNeRRdJOQL97oQh/OZqRV1g/NoJit0cxLkmU05ImF1QXYYUyac
         8/OL/UsucFjbFYy01/i/0lRpgVtvSm32N+JgFw3lev+NYH6AW+TinwAm9/eEkWAj+M1f
         3Wtw==
X-Forwarded-Encrypted: i=1; AJvYcCWifFmUWj+ismuuWRuW7V7kZZwiCc6N659CbgwVUQkB/TnEBTu/wvNL71Hz7HSO1aZ9mnasFg1TS/4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOJmtaIvtfvwy08e52e0tNvOfDq7iLKAUZYMmc56t2JVd7a+VR
	bcJMumbsa0QU2vcnU9Q9q1c5s8vtqxE8aQ91iO7svvTe+3Ehn3KbOT68IbqaTMU5dCghfvLiD4t
	2LZcS/W3FuTesMt6XHEi14UTZofVUj7zruL9nYp3zN7N6aEAUZQeqpbHpVw==
X-Received: by 2002:a05:600c:1caa:b0:428:f17:6baf with SMTP id 5b1f17b1804b1-429ed804c49mr7811195e9.5.1723796600482;
        Fri, 16 Aug 2024 01:23:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGY7UBCI1axMKugeuOlpxXQ22mIFbmo/Y4hXDeHcVX7LbB5fmB/syx5dg9fQZbtyc6sqI9maA==
X-Received: by 2002:a05:600c:1caa:b0:428:f17:6baf with SMTP id 5b1f17b1804b1-429ed804c49mr7810945e9.5.1723796599910;
        Fri, 16 Aug 2024 01:23:19 -0700 (PDT)
Received: from eisenberg.redhat.com (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded367ebsm71461355e9.25.2024.08.16.01.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 01:23:19 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jie Wang <jie.wang@intel.com>,
	Shashank Gupta <shashank.gupta@intel.com>,
	Philipp Stanner <pstanner@redhat.com>,
	Adam Guerin <adam.guerin@intel.com>,
	Tero Kristo <tero.kristo@linux.intel.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Arnaud Ebalard <arno@natisbad.org>,
	Srujana Challa <schalla@marvell.com>,
	Nithin Dabilpuram <ndabilpuram@marvell.com>,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Miri Korenblit <miriam.rachel.korenblit@intel.com>,
	Kalle Valo <kvalo@kernel.org>,
	Johannes Berg <johannes.berg@intel.com>,
	Gregory Greenman <gregory.greenman@intel.com>,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
	Yedidya Benshimol <yedidya.ben.shimol@intel.com>,
	Breno Leitao <leitao@debian.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Mark Brown <broonie@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: qat-linux@intel.com,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-pci@vger.kernel.org,
	Damien Le Moal <dlemoal@kernel.org>
Subject: [PATCH v3 02/10] ata: ahci: Replace deprecated PCI functions
Date: Fri, 16 Aug 2024 10:22:54 +0200
Message-ID: <20240816082304.14115-3-pstanner@redhat.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240816082304.14115-1-pstanner@redhat.com>
References: <20240816082304.14115-1-pstanner@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pcim_iomap_regions_request_all() and pcim_iomap_table() have been
deprecated by the PCI subsystem in commit e354bb84a4c1 ("PCI: Deprecate
pcim_iomap_table(), pcim_iomap_regions_request_all()").

Replace these functions with their successors, pcim_iomap() and
pcim_request_all_regions().

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
Acked-by: Damien Le Moal <dlemoal@kernel.org>
---
 drivers/ata/acard-ahci.c | 6 ++++--
 drivers/ata/ahci.c       | 6 ++++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/ata/acard-ahci.c b/drivers/ata/acard-ahci.c
index 547f56341705..3999305b5356 100644
--- a/drivers/ata/acard-ahci.c
+++ b/drivers/ata/acard-ahci.c
@@ -370,7 +370,7 @@ static int acard_ahci_init_one(struct pci_dev *pdev, const struct pci_device_id
 	/* AHCI controllers often implement SFF compatible interface.
 	 * Grab all PCI BARs just in case.
 	 */
-	rc = pcim_iomap_regions_request_all(pdev, 1 << AHCI_PCI_BAR, DRV_NAME);
+	rc = pcim_request_all_regions(pdev, DRV_NAME);
 	if (rc == -EBUSY)
 		pcim_pin_device(pdev);
 	if (rc)
@@ -386,7 +386,9 @@ static int acard_ahci_init_one(struct pci_dev *pdev, const struct pci_device_id
 	if (!(hpriv->flags & AHCI_HFLAG_NO_MSI))
 		pci_enable_msi(pdev);
 
-	hpriv->mmio = pcim_iomap_table(pdev)[AHCI_PCI_BAR];
+	hpriv->mmio = pcim_iomap(pdev, AHCI_PCI_BAR, 0);
+	if (!hpriv->mmio)
+		return -ENOMEM;
 
 	/* save initial config */
 	ahci_save_initial_config(&pdev->dev, hpriv);
diff --git a/drivers/ata/ahci.c b/drivers/ata/ahci.c
index a05c17249448..905af6b68d80 100644
--- a/drivers/ata/ahci.c
+++ b/drivers/ata/ahci.c
@@ -1869,7 +1869,7 @@ static int ahci_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
 	/* AHCI controllers often implement SFF compatible interface.
 	 * Grab all PCI BARs just in case.
 	 */
-	rc = pcim_iomap_regions_request_all(pdev, 1 << ahci_pci_bar, DRV_NAME);
+	rc = pcim_request_all_regions(pdev, DRV_NAME);
 	if (rc == -EBUSY)
 		pcim_pin_device(pdev);
 	if (rc)
@@ -1893,7 +1893,9 @@ static int ahci_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (ahci_sb600_enable_64bit(pdev))
 		hpriv->flags &= ~AHCI_HFLAG_32BIT_ONLY;
 
-	hpriv->mmio = pcim_iomap_table(pdev)[ahci_pci_bar];
+	hpriv->mmio = pcim_iomap(pdev, ahci_pci_bar, 0);
+	if (!hpriv->mmio)
+		return -ENOMEM;
 
 	/* detect remapped nvme devices */
 	ahci_remap_check(pdev, ahci_pci_bar, hpriv);
-- 
2.46.0


