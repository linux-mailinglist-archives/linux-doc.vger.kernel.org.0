Return-Path: <linux-doc+bounces-22154-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 132189476BD
	for <lists+linux-doc@lfdr.de>; Mon,  5 Aug 2024 10:05:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 746FEB228A5
	for <lists+linux-doc@lfdr.de>; Mon,  5 Aug 2024 08:05:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D4B8157483;
	Mon,  5 Aug 2024 08:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TqsWeXH9"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91166156C61
	for <linux-doc@vger.kernel.org>; Mon,  5 Aug 2024 08:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722844944; cv=none; b=cPwqdwWdLpqJsGsT6K3wEYv/HbownFb0H5LKNNFDzEkCbndyir3xLR4aObW7HtMbm3fNJXHUFpXPNcCWQp1J2k0cSdxo7K7mGFS7/mxFvxlcz2oXHlAvdqV/HR3LLhl6/edKYaOyzwepLgi8WzXjqXAAFL/M/hbjX7FcX/fXadE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722844944; c=relaxed/simple;
	bh=7JtiDzH4j1fn6e/l1CbreMTpZlhxa3kkuVFDYh4FXvw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LBDrNuXqD2+tHo7j/zOgIFZStz7aE/ZaKmS7xzQ6FXRke5jJ6pEwDTZ5pHKSgBLlbJezb/igdS8ELJjSoI9FBE5pQyYrPN2iNG23Qqc5HIB3gqLdKSRNpRGipF5rLvgE6lpgCeDbRfs0iGEcvm8Q2j3AtZz5KxOOtGLbYl0kWD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TqsWeXH9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722844940;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0WfVVRPiytk6PFyUBJOpMrU1ppuGmgzu2AH1RznbocA=;
	b=TqsWeXH99ky0mF+8qzVV3B92fcc/fQoHv9z8VJG12tqqLfTeeQidG51jGq39/nsVCrCIyV
	pmUNQV7RHzKTNaXDEGXWiG1uuPFZ1ZmtNp5Z+QnnwW9DrtHSk3++VLZZK/5DWxFInRZKQb
	o4gmxALxoFRrs6gapJ0wan9t7vybbxU=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-248-wK-iSZPdN6i-VDuNfarcxg-1; Mon, 05 Aug 2024 04:02:19 -0400
X-MC-Unique: wK-iSZPdN6i-VDuNfarcxg-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a7aa22266aaso95463466b.1
        for <linux-doc@vger.kernel.org>; Mon, 05 Aug 2024 01:02:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722844938; x=1723449738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0WfVVRPiytk6PFyUBJOpMrU1ppuGmgzu2AH1RznbocA=;
        b=ap1XYPzusSwcCfiIxOfTG+OQXUQXGd48kioHN7mCSX0/VT+S5UHOvOXt6wXNwrYXsc
         oyBh3Ctpsi6+Yut6CS5ISBA16ATF8iN3Ny6i5Fel/P9n/Zp/gQ2T/cl4CYg4uks/9MVH
         Ws4Z4uOZqYjrFuOjo23sQtysoXYsMfxMpyF3tSUpFhTN9MuAhGteyPz3ricyeIM/zWo2
         QIbjDXXBOu/omM2ukRLCIDx2HaRIuRSHjGCPZQPQncZ8TRcxGCnwHkfe6ntv+l97LMRT
         vzRWlM2qZmfp9I1oeyrWMDakRHQCwFoE8jn6T6pqouAH8asaU4t5jND76irIACOWY4qR
         Ky4A==
X-Gm-Message-State: AOJu0YzLYxV4F2do4J50W2/Sv/4cTYnlQMycMALY8Fo/wVDKFQiONfGY
	D7N2RfD9tSQmFW13Wx3e9tlJ/B2NX9ed4zQ1HaCT5Qne+/UnAVQvGHFP4QqMxXfVGcs9rHdRYQ9
	na4rD5Zx1Lu1FMgKhgaiICRH5fH1Il3JXaYH4CYqfdNLiToyHb2qMqXBRfQ==
X-Received: by 2002:a17:906:794b:b0:a7a:87b3:722f with SMTP id a640c23a62f3a-a7dc4e50c8fmr559109066b.3.1722844937206;
        Mon, 05 Aug 2024 01:02:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG76bxvYb5Yaoc3VRVGn0E6yzVD6z6UB6d1yYJXJ3VBKVznVuoeO63AJt78w0QvkxaZORLkrA==
X-Received: by 2002:a17:906:794b:b0:a7a:87b3:722f with SMTP id a640c23a62f3a-a7dc4e50c8fmr559107866b.3.1722844936734;
        Mon, 05 Aug 2024 01:02:16 -0700 (PDT)
Received: from eisenberg.fritz.box (200116b82df07e000a5f4891a3b0b190.dip.versatel-1u1.de. [2001:16b8:2df0:7e00:a5f:4891:a3b0:b190])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7de8d0868bsm277958966b.143.2024.08.05.01.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 01:02:16 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Arnaud Ebalard <arno@natisbad.org>,
	Srujana Challa <schalla@marvell.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Miri Korenblit <miriam.rachel.korenblit@intel.com>,
	Kalle Valo <kvalo@kernel.org>,
	Serge Semin <fancer.lancer@gmail.com>,
	Jon Mason <jdmason@kudzu.us>,
	Dave Jiang <dave.jiang@intel.com>,
	Allen Hubbe <allenbh@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Kevin Cernekee <cernekee@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Philipp Stanner <pstanner@redhat.com>,
	Jie Wang <jie.wang@intel.com>,
	Adam Guerin <adam.guerin@intel.com>,
	Shashank Gupta <shashank.gupta@intel.com>,
	Damian Muszynski <damian.muszynski@intel.com>,
	Nithin Dabilpuram <ndabilpuram@marvell.com>,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Johannes Berg <johannes.berg@intel.com>,
	Gregory Greenman <gregory.greenman@intel.com>,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
	Yedidya Benshimol <yedidya.ben.shimol@intel.com>,
	Breno Leitao <leitao@debian.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	John Ogness <john.ogness@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-ide@vger.kernel.org,
	qat-linux@intel.com,
	linux-crypto@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ntb@lists.linux.dev,
	linux-pci@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH v2 07/10] ntb: idt: Replace deprecated PCI functions
Date: Mon,  5 Aug 2024 10:01:34 +0200
Message-ID: <20240805080150.9739-9-pstanner@redhat.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240805080150.9739-2-pstanner@redhat.com>
References: <20240805080150.9739-2-pstanner@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pcim_iomap_table() and pcim_iomap_regions_request_all() have been
deprecated by the PCI subsystem in commit e354bb84a4c1 ("PCI: Deprecate
pcim_iomap_table(), pcim_iomap_regions_request_all()").

Replace these functions with their successors, pcim_iomap() and
pcim_request_all_regions()

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
Acked-by: Serge Semin <fancer.lancer@gmail.com>
---
 drivers/ntb/hw/idt/ntb_hw_idt.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/ntb/hw/idt/ntb_hw_idt.c b/drivers/ntb/hw/idt/ntb_hw_idt.c
index 48dfb1a69a77..f1b57d51a814 100644
--- a/drivers/ntb/hw/idt/ntb_hw_idt.c
+++ b/drivers/ntb/hw/idt/ntb_hw_idt.c
@@ -2671,15 +2671,20 @@ static int idt_init_pci(struct idt_ntb_dev *ndev)
 	 */
 	pci_set_master(pdev);
 
-	/* Request all BARs resources and map BAR0 only */
-	ret = pcim_iomap_regions_request_all(pdev, 1, NTB_NAME);
+	/* Request all BARs resources */
+	ret = pcim_request_all_regions(pdev, NTB_NAME);
 	if (ret != 0) {
 		dev_err(&pdev->dev, "Failed to request resources\n");
 		goto err_clear_master;
 	}
 
-	/* Retrieve virtual address of BAR0 - PCI configuration space */
-	ndev->cfgspc = pcim_iomap_table(pdev)[0];
+	/* ioremap BAR0 - PCI configuration space */
+	ndev->cfgspc = pcim_iomap(pdev, 0, 0);
+	if (!ndev->cfgspc) {
+		dev_err(&pdev->dev, "Failed to ioremap BAR 0\n");
+		ret = -ENOMEM;
+		goto err_clear_master;
+	}
 
 	/* Put the IDT driver data pointer to the PCI-device private pointer */
 	pci_set_drvdata(pdev, ndev);
-- 
2.45.2


