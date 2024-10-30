Return-Path: <linux-doc+bounces-29178-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 526AE9B61BE
	for <lists+linux-doc@lfdr.de>; Wed, 30 Oct 2024 12:31:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B709AB22FBE
	for <lists+linux-doc@lfdr.de>; Wed, 30 Oct 2024 11:31:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BF8F1F4720;
	Wed, 30 Oct 2024 11:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FRrJRJhs"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681CE1F1305
	for <linux-doc@vger.kernel.org>; Wed, 30 Oct 2024 11:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730287717; cv=none; b=FyEeQuMYWOKTIo+BRP8auo7MeVQ6zVgf4UqvcaIgSVkmzOxtMcNJSa6/9L4krf0UaatuRnHve19Q7wMvE9RPH+B8/5tCAJFj59h8wtPhQYJbMDsW8f3y30GDz4xKlHVFl6IWUJNZouCR2FM541e1UJFTXBC+yb84NLzqJ85WYU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730287717; c=relaxed/simple;
	bh=x2AO4woPu9H2aNxl2TylFo7TB42POmIv8HM+dl0TTWE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sak8G6XF+32d2k4ipGUwm74jXvWgZdZ55RLHRW98BTsHbs68tKYxuBR/F10qrT334rRqRDGq6c7YpG2BiKAKRJXo4eBl2xzXfjDsekH47mf6BDB+0+7d9PLcKKdJkbbLXcUs9Zt/3ZirEHG3S0Ji2/o36Pz9eDPbfLGb7nmVKOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FRrJRJhs; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730287713;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vZ55uYUf11n7K97VlTpkijb2Akz5QQrQmQxQWIeLt9U=;
	b=FRrJRJhs2XXlhUn5peCAD9N/8GMk7MbA3NcC7sP+lw5rks6fxAnc7YpDL7mak1QLpnKQf/
	DkK3dCQRoJGs3+HVDj/+BVYLwA5ojtddBP4MD3rUE7BXhKTlbvEom4eo6XJIob4EHOlDdn
	/nCQ41kfM2UkKSxMrokKqtWJzPuuUWs=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-274-ewm_NPAJN5ywU33xQWNkoA-1; Wed, 30 Oct 2024 07:28:32 -0400
X-MC-Unique: ewm_NPAJN5ywU33xQWNkoA-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a9e0eb26f08so224397866b.0
        for <linux-doc@vger.kernel.org>; Wed, 30 Oct 2024 04:28:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730287711; x=1730892511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vZ55uYUf11n7K97VlTpkijb2Akz5QQrQmQxQWIeLt9U=;
        b=LnydNarRpMPwxoW3J6thBIhL0a5tX5lyklUz0X51g6nSo8pdBjNGBKzyz72eOE0Ew1
         opP0Pm2ZAU9AkOLKzzxvTO8cq24IZ/8xWK8c0MmIyWhw7VssFkcP6vICTVGhjE5Nxdq5
         t6rj+tDxsQq97LSnmcTxBD57kL5PXFtUNsaKgT/vS93H46lgu3EXrmR3GtPE1TL9MxDp
         vF1utXrP/VbaVq3QTV/o6zyazC4vIHPGvwmDipUdt2sXMEl7jGIN5UHXwt4NZAMjZVeR
         2tenJLuHG60QPzpYL8V832dvsIntikD72xTsuZ+JoKsw92x4nQblw+P5hrwJhcIJRlPb
         +e5w==
X-Gm-Message-State: AOJu0YyiWfMr3O7vwNAwkcBTuVcUFwV8B2w9EI9sAe7JdRo9YhpRiQmP
	wLksTvmYTU6RLDcD1DlFfQCCQOJtlrpV8G4tcM5NK5SfBDWa8T7yldh9mzOMwTQIN+mQPu2R2Fx
	iKMEvwdGDp5uPIG5jHyuxE8BkA/QOdlPx+EKSE7mUBcVtzKBqopi++KujIw==
X-Received: by 2002:a17:907:74d:b0:a9a:1792:f05 with SMTP id a640c23a62f3a-a9e3a620de8mr312281066b.31.1730287710737;
        Wed, 30 Oct 2024 04:28:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEypW41JHp9s0QMpUNgIGz0rguEz+SlI+R6m1S08Xc0YathnVPUssPJwfq+JcR1+Av7QYJ0Ag==
X-Received: by 2002:a17:907:74d:b0:a9a:1792:f05 with SMTP id a640c23a62f3a-a9e3a620de8mr312277366b.31.1730287710210;
        Wed, 30 Oct 2024 04:28:30 -0700 (PDT)
Received: from eisenberg.fritz.box ([2001:16b8:3db7:f800:98bb:372a:45f9:41e4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b30f58991sm557324566b.159.2024.10.30.04.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 04:28:29 -0700 (PDT)
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
	linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v6 09/10] ALSA: korg1212: Replace deprecated PCI functions
Date: Wed, 30 Oct 2024 12:27:42 +0100
Message-ID: <20241030112743.104395-10-pstanner@redhat.com>
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
Reviewed-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/korg1212/korg1212.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/pci/korg1212/korg1212.c b/sound/pci/korg1212/korg1212.c
index e62fb1ad6d77..49b71082c485 100644
--- a/sound/pci/korg1212/korg1212.c
+++ b/sound/pci/korg1212/korg1212.c
@@ -2108,7 +2108,7 @@ static int snd_korg1212_create(struct snd_card *card, struct pci_dev *pci)
         for (i=0; i<kAudioChannels; i++)
                 korg1212->volumePhase[i] = 0;
 
-	err = pcim_iomap_regions_request_all(pci, 1 << 0, "korg1212");
+	err = pcim_request_all_regions(pci, "korg1212");
 	if (err < 0)
 		return err;
 
@@ -2130,7 +2130,9 @@ static int snd_korg1212_create(struct snd_card *card, struct pci_dev *pci)
 		   korg1212->iomem2, iomem2_size,
 		   stateName[korg1212->cardState]);
 
-	korg1212->iobase = pcim_iomap_table(pci)[0];
+	korg1212->iobase = pcim_iomap(pci, 0, 0);
+	if (!korg1212->iobase)
+		return -ENOMEM;
 
 	err = devm_request_irq(&pci->dev, pci->irq, snd_korg1212_interrupt,
                           IRQF_SHARED,
-- 
2.47.0


