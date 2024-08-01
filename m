Return-Path: <linux-doc+bounces-21976-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 835CB94521B
	for <lists+linux-doc@lfdr.de>; Thu,  1 Aug 2024 19:49:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35A69287B28
	for <lists+linux-doc@lfdr.de>; Thu,  1 Aug 2024 17:49:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0D9C1BF315;
	Thu,  1 Aug 2024 17:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CYslf0hU"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8FB1BE84B
	for <linux-doc@vger.kernel.org>; Thu,  1 Aug 2024 17:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722534409; cv=none; b=B/CoNBYZMTvttwcmHbj1W2hah41QYVoIo5k7ZgL4s2hfPVXSe3AX6gc89aLXSYn8GKcczvIyywp6P5ghRAVr7/YBz/dZaWFCqPUvmSFT6zp5PTYUi70HNEzce/QKEcYskbJSMb6U5kKaGtgmJgWkHj1y8gec5ULIf9/Fn7k9tvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722534409; c=relaxed/simple;
	bh=PowKNNK7ntiN8fDRwJEfgWzFgO0JzDMOq63Tm65TlRE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LJqU4ioaZ6wDZM0g9KWLjTgGA+zXdHpLI66Cu38allrJCxIfixuEF+sNoBpztpU1Kn9sxGAm9vyJc6xhoMJIFYP8ABV3wWzlEk9aZUisPuToCpIpXrCONKTjpKVXWQO62bgexG9QrofjOoTXtQ/2VS9uCc0QRGV9h5WL/m1Glr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CYslf0hU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722534407;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4T8HAVKVFIndb0epInGCIUNTvqCq3Yx0Jxliq8oDWAI=;
	b=CYslf0hU9dXjYoxPjVJ7+dghD6O/8tjkgJ8jcveixV/bdZH2VS4oj10q6WPNKZSnYnjCtP
	haO3jUaPrhhoStd2bOl66s5gmIIyp4D4CIaGMi0lJ7q2jHWbk9EoC0rht9wkn1+Ir+UpRH
	Uf6mtLC7G5zdai8Td621sN1pbNgQO18=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-499-zIG46OniN3COWOrsMr_86A-1; Thu, 01 Aug 2024 13:46:46 -0400
X-MC-Unique: zIG46OniN3COWOrsMr_86A-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5a138001115so1213465a12.1
        for <linux-doc@vger.kernel.org>; Thu, 01 Aug 2024 10:46:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722534404; x=1723139204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4T8HAVKVFIndb0epInGCIUNTvqCq3Yx0Jxliq8oDWAI=;
        b=CP9lWm9iby50NdoNuuow9f1N6GsC3tiix4NKB6/3CG2nwZTigU8IL5gnNm/HMc02Lx
         3fKeWb4SlaDHeu9x+2NLxMK4Bej5VKdAwrv5PVa9gZ/w3/obT5MHb+2vezYLZsNlbqSP
         UOo/qXo1FydGermjMOOMv/dbGFaJu1VVtq8WRCDh/FLQmMLiGXOgiKq6SO7e1TzoIqEb
         3azDSL/z8TFaigxI+isQcBohvQwdt/8nWTeUWLZlyUkgRzhtQ7Z0psB0yMgc8o0Ofl+/
         vuOLadudCa0XmpVC3c47rmZkaQmPBZBui/Gv0RjaRWe+BoT/g435enYH8dRz71MDzVRp
         3ICg==
X-Gm-Message-State: AOJu0Yxye/dSh7Kvlij9Nb89KuzCpjd0OHK5IOZ/smjSJ9YpJjc53Nqo
	j17VWclTqdPTtMdBrAesbaf6+HoVd0JQ0h4N1ud1JsAl6XJtf46ZDTcqO2PT+Rhg1Zu7ypexwaC
	nbUta9ScqrrNb0myQiZRFyZikRYn8y0dCKMMAXfu9lPbolrgO9OipaK18Vg==
X-Received: by 2002:a17:906:d551:b0:a7a:acae:341b with SMTP id a640c23a62f3a-a7dc511b140mr44578966b.9.1722534404416;
        Thu, 01 Aug 2024 10:46:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWw7p0vbE3J4abjSBrxyeauGvjPs9Iiwjk4nqGQ0MahZpjO/0TmVoD8LvCLea8dznFqsew5g==
X-Received: by 2002:a17:906:d551:b0:a7a:acae:341b with SMTP id a640c23a62f3a-a7dc511b140mr44575866b.9.1722534403935;
        Thu, 01 Aug 2024 10:46:43 -0700 (PDT)
Received: from eisenberg.fritz.box ([2001:16b8:3d4b:3000:1a1d:18ca:1d82:9859])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9e83848sm5339066b.177.2024.08.01.10.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 10:46:43 -0700 (PDT)
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
Subject: [PATCH 09/10] ALSA: korg1212: Replace deprecated PCI functions
Date: Thu,  1 Aug 2024 19:46:07 +0200
Message-ID: <20240801174608.50592-10-pstanner@redhat.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240801174608.50592-1-pstanner@redhat.com>
References: <20240801174608.50592-1-pstanner@redhat.com>
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
---
 sound/pci/korg1212/korg1212.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/pci/korg1212/korg1212.c b/sound/pci/korg1212/korg1212.c
index 5c2cac201a28..b5428ac34d3b 100644
--- a/sound/pci/korg1212/korg1212.c
+++ b/sound/pci/korg1212/korg1212.c
@@ -2106,7 +2106,7 @@ static int snd_korg1212_create(struct snd_card *card, struct pci_dev *pci)
         for (i=0; i<kAudioChannels; i++)
                 korg1212->volumePhase[i] = 0;
 
-	err = pcim_iomap_regions_request_all(pci, 1 << 0, "korg1212");
+	err = pcim_request_all_regions(pci, "korg1212");
 	if (err < 0)
 		return err;
 
@@ -2128,7 +2128,9 @@ static int snd_korg1212_create(struct snd_card *card, struct pci_dev *pci)
 		   korg1212->iomem2, iomem2_size,
 		   stateName[korg1212->cardState]);
 
-	korg1212->iobase = pcim_iomap_table(pci)[0];
+	korg1212->iobase = pcim_iomap(pci, 0, 0);
+	if (!korg1212->iobase)
+		return -ENOMEM;
 
 	err = devm_request_irq(&pci->dev, pci->irq, snd_korg1212_interrupt,
                           IRQF_SHARED,
-- 
2.45.2


