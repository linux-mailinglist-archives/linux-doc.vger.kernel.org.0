Return-Path: <linux-doc+bounces-29176-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 95DFD9B61AE
	for <lists+linux-doc@lfdr.de>; Wed, 30 Oct 2024 12:31:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B5C891C218EC
	for <lists+linux-doc@lfdr.de>; Wed, 30 Oct 2024 11:31:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99DD21F12E3;
	Wed, 30 Oct 2024 11:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J7jRbX0h"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA4D1EBFFC
	for <linux-doc@vger.kernel.org>; Wed, 30 Oct 2024 11:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730287713; cv=none; b=b7soKwfSWfn/S/o7KjbB0hmoUxF8ze3SEV6B6Gu1X2e5YihNepNG5AvlqZKBZAkHMEQjR3xUbI0EfJSYDf0epc6IzmNRefxJ6VaumROh+RhPempnykOMCzvcOxNNgQt5mNpgX884SC5rAmUJ42seV1afjCN6JhIZf7WyhHyYnhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730287713; c=relaxed/simple;
	bh=KRhL2deOZRHNfuo7/CizyodCPj2p+YqlhuhaNJFSYuE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hvfgDLIl/zUjbv+sqrAvHPh29ygbBtRDlxu4jk9OEs1u47CU3mwan5tI5IP8L3y7W7SYkz/ljt9UHJy7g5R/Q81CaqXWWn3TJiiUq5sDG8B9F3M0HIThOGnWwptlLX+/a5BrVwlFvJ1RvO1y2wRaba7+JHPh4yQHmFdAONd9890=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=J7jRbX0h; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730287709;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oH83zA24aoDnwtpuZ+wclLhu+n7qeaaZUv7+D6hfs+0=;
	b=J7jRbX0hVHL2M1vCqMTT+tQCHtcF9d9Gua+sCGyn4JkzE+Tcfu1E5BAovGorWhyUdDXr8V
	EiKsvkdtdl57ggjMfOnb0AD5XdlZc1kLqWGgNavpw5EbcW6O8RyRmNgJzCK9ISXRVYNiaG
	zk2eigsA3vDssAklEjrMt8UTWhmkPc4=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-43-I0QylAH9OBSXWdK6QYWRwQ-1; Wed, 30 Oct 2024 07:28:28 -0400
X-MC-Unique: I0QylAH9OBSXWdK6QYWRwQ-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a9a2593e9e9so468151266b.0
        for <linux-doc@vger.kernel.org>; Wed, 30 Oct 2024 04:28:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730287707; x=1730892507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oH83zA24aoDnwtpuZ+wclLhu+n7qeaaZUv7+D6hfs+0=;
        b=PqMqgRFTGU8y6x7ObB4XvFi7jnhgAdknPJEzlopMwdyJfNwHvZJXAc8n4BNqrTOLc+
         CSg7/DVTsmkhYz+1P7Q+78UCldYUfhFccHlFTailt+eVoF9XeuaJM8VFF5YuMHypmVsr
         SSUtkDdisxErX4x9BOOb1xt1HtC4fAltbrBU65l/yMJt57Vst367dOE3qeWZgSMNAml/
         p6j+h2UXbWSLNYcTi6FnCn1hBguhUbHLqYJpV+wcRQSrgZoYkIDe+urCEAP+U0YI5FVv
         OirpZZZJpWu4i/zZ2/VTrmOlpou1oDGueLolZBmYXf2DM71gs1oTJBHLj2g5IJCFnuNW
         fo4g==
X-Gm-Message-State: AOJu0YycTEOr60vXeLQt1MrrT8QDrZy01/LILfsvwHRuyS5plckIjVap
	lHBKwEoHrPOkHoMmkyXDIR9PSFlUBDb1SGZVYUlW9j20s/KFKjJZa3FoTJQdq8u/wv7A/YgQwKc
	qS9DL8HyUC25llFOv7G2FMAYQbs4bc+MhvzSvSrI18Itl1pzzbw6HDWphDg==
X-Received: by 2002:a17:907:2da1:b0:a99:375f:4523 with SMTP id a640c23a62f3a-a9de615a8f3mr1351688866b.44.1730287706868;
        Wed, 30 Oct 2024 04:28:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGwg1LvHm/sBVMIGSqZqjkRb+x/AHkoEL8qETnnIUP4SEpWG85yaxrXSuFLHiSID89YoxWbOg==
X-Received: by 2002:a17:907:2da1:b0:a99:375f:4523 with SMTP id a640c23a62f3a-a9de615a8f3mr1351683166b.44.1730287706365;
        Wed, 30 Oct 2024 04:28:26 -0700 (PDT)
Received: from eisenberg.fritz.box ([2001:16b8:3db7:f800:98bb:372a:45f9:41e4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b30f58991sm557324566b.159.2024.10.30.04.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 04:28:26 -0700 (PDT)
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
	Philipp Stanner <pstanner@redhat.com>,
	Jie Wang <jie.wang@intel.com>,
	Michal Witwicki <michal.witwicki@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Adam Guerin <adam.guerin@intel.com>,
	Damian Muszynski <damian.muszynski@intel.com>,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Nithin Dabilpuram <ndabilpuram@marvell.com>,
	Johannes Berg <johannes.berg@intel.com>,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
	Benjamin Berg <benjamin.berg@intel.com>,
	Breno Leitao <leitao@debian.org>,
	Yedidya Benshimol <yedidya.ben.shimol@intel.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	zhang jiao <zhangjiao2@cmss.chinamobile.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
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
Subject: [PATCH v6 07/10] ntb: idt: Replace deprecated PCI functions
Date: Wed, 30 Oct 2024 12:27:40 +0100
Message-ID: <20241030112743.104395-8-pstanner@redhat.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241030112743.104395-1-pstanner@redhat.com>
References: <20241030112743.104395-1-pstanner@redhat.com>
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
pcim_request_all_regions().

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
Acked-by: Serge Semin <fancer.lancer@gmail.com>
---
 drivers/ntb/hw/idt/ntb_hw_idt.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/ntb/hw/idt/ntb_hw_idt.c b/drivers/ntb/hw/idt/ntb_hw_idt.c
index 6fc9dfe82474..544d8a4d2af5 100644
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
2.47.0


