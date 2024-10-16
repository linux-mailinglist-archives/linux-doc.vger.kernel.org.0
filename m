Return-Path: <linux-doc+bounces-27739-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F419A0A50
	for <lists+linux-doc@lfdr.de>; Wed, 16 Oct 2024 14:43:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DBAEA1C26AFC
	for <lists+linux-doc@lfdr.de>; Wed, 16 Oct 2024 12:43:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DF1420F5A2;
	Wed, 16 Oct 2024 12:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bqNZCRa1"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6595520CCF4
	for <linux-doc@vger.kernel.org>; Wed, 16 Oct 2024 12:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729082517; cv=none; b=ILA/NIxt9hHIL126/7zAyyk4OLloJyqVbxAIHX3i7VEhlO6SA631YPyIXmtCFADFHI1nOAJEiskUrJSvHurrt4NEKm6C/bmR8K1cZh3CivjVEscjzbCwOzScqeIk9xaOG0jqXdrdIUFFvXZu5kz6nK/N6YZmSQHH5tUs+AdUrlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729082517; c=relaxed/simple;
	bh=xqbcT0teETgc9gYJIx/Gpdlf6NMW2EiA0uF/aZLVnhM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cbNsx9FrGbiH56uE7LXeJkqEsJOA2Z3L3BkdgkL7yvLn3o6sFT4NDMxdTDbCOyb+uecmJujR2oIQ9qKgp0V6fEmg4BjmdlW6LjpBhiyRPeLvWg8QfpyPDbdL4FW2EAW/lPaQ8AJq1jdBo9eLglmDGR8KsNu1G9lrgpv2e+YSKIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bqNZCRa1; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729082514;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3HQZvfLDOQXSIlF97X3lGTL3T04sTNcN/H3+TBJ6Tw0=;
	b=bqNZCRa1unWuIdro9KXrZ1OjnHxkxsa/xlk3LSRNfNNkC8ze4MsviW7PF6tUwzkfIyDRVm
	F3A9zTprAGzetq6N6mbDQJXRdVKDutB5+0dFH88HFSQank4PZxmPs8C98QTbYIWXyQOqaL
	OSjk96p4MfwRYtAg/NDKtFocE+Asy8M=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-344-cqYPURIcOBip3ceka4Z30A-1; Wed, 16 Oct 2024 08:41:53 -0400
X-MC-Unique: cqYPURIcOBip3ceka4Z30A-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-37d4a211177so3305712f8f.0
        for <linux-doc@vger.kernel.org>; Wed, 16 Oct 2024 05:41:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729082512; x=1729687312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3HQZvfLDOQXSIlF97X3lGTL3T04sTNcN/H3+TBJ6Tw0=;
        b=KCx1S1Kq55LtJNmb2Fy71vgkZ+KKPXNdsD2bHgzzLEfcBsOOWKrgF5eZY4kLnAhF5o
         rUrmRJkjKhyxmXN7eHVuYQfvYKE/16HdhHkyEqyS0ipZ0YspbCq6+DhdN5CnTmPvuD9l
         jus5QAtQAj8+238Xa8OeRN1LqA4/79oGakxJFtU8lnNBvqKFOi1RsVxFNVfeKsZkqotV
         vD/e1EutOv1PF+2QSnVsBFjrvPxt5Tjf9JR5ATtQ7qDVCBG7pYZhtdKoESNwEh7p00cL
         1huvRri+hYvg0xNC/2Ag7VCKCPjtI06HW/HC9zr5I3CHYZTgIQFHxhYKAh+RB711pVEX
         J3uA==
X-Gm-Message-State: AOJu0YxyQK31hkFFgs86DCGC2ZR+g6m1Z2oB5fJIw5zkb48FcabHpYyx
	HzrAco72BjpZRmVGNifbPIt6egGKdUtN8ExlT1jhw+vSY741R2TXSaicBjA1t6kjj7rqORNvg2W
	bUZf1QX03rEX4MsSqiTDxF7o/TLBFCfUg6wlYmUd4k2EfTcoOcYDTfohOzg==
X-Received: by 2002:a5d:5259:0:b0:37c:cf0b:e9e6 with SMTP id ffacd0b85a97d-37d86d5521amr2837777f8f.42.1729082512128;
        Wed, 16 Oct 2024 05:41:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuuOf1sTYXDilZR7nD/RZHfWfnDIJXaRup8pfdRiWUJNRcHMmBtXXl2psjBzvHRiWx8thnIQ==
X-Received: by 2002:a5d:5259:0:b0:37c:cf0b:e9e6 with SMTP id ffacd0b85a97d-37d86d5521amr2837729f8f.42.1729082511712;
        Wed, 16 Oct 2024 05:41:51 -0700 (PDT)
Received: from eisenberg.muc.redhat.com (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fa8ffd6sm4246879f8f.50.2024.10.16.05.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 05:41:51 -0700 (PDT)
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
	Philipp Stanner <pstanner@redhat.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Jie Wang <jie.wang@intel.com>,
	Tero Kristo <tero.kristo@linux.intel.com>,
	Adam Guerin <adam.guerin@intel.com>,
	Shashank Gupta <shashank.gupta@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Nithin Dabilpuram <ndabilpuram@marvell.com>,
	Johannes Berg <johannes.berg@intel.com>,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
	Gregory Greenman <gregory.greenman@intel.com>,
	Benjamin Berg <benjamin.berg@intel.com>,
	Yedidya Benshimol <yedidya.ben.shimol@intel.com>,
	Breno Leitao <leitao@debian.org>,
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
Subject: [PATCH v4 05/10] intel_th: pci: Replace deprecated PCI functions
Date: Wed, 16 Oct 2024 14:41:27 +0200
Message-ID: <20241016124136.41540-6-pstanner@redhat.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241016124136.41540-1-pstanner@redhat.com>
References: <20241016124136.41540-1-pstanner@redhat.com>
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
---
 drivers/hwtracing/intel_th/pci.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/intel_th/pci.c b/drivers/hwtracing/intel_th/pci.c
index 0d7b9839e5b6..e9d8d28e055f 100644
--- a/drivers/hwtracing/intel_th/pci.c
+++ b/drivers/hwtracing/intel_th/pci.c
@@ -23,7 +23,6 @@ enum {
 	TH_PCI_RTIT_BAR		= 4,
 };
 
-#define BAR_MASK (BIT(TH_PCI_CONFIG_BAR) | BIT(TH_PCI_STH_SW_BAR))
 
 #define PCI_REG_NPKDSC	0x80
 #define NPKDSC_TSACT	BIT(5)
@@ -83,10 +82,16 @@ static int intel_th_pci_probe(struct pci_dev *pdev,
 	if (err)
 		return err;
 
-	err = pcim_iomap_regions_request_all(pdev, BAR_MASK, DRIVER_NAME);
+	err = pcim_request_all_regions(pdev, DRIVER_NAME);
 	if (err)
 		return err;
 
+	if (!pcim_iomap(pdev, TH_PCI_CONFIG_BAR, 0))
+		return -ENOMEM;
+
+	if (!pcim_iomap(pdev, TH_PCI_STH_SW_BAR, 0))
+		return -ENOMEM;
+
 	if (pdev->resource[TH_PCI_RTIT_BAR].start) {
 		resource[TH_MMIO_RTIT] = pdev->resource[TH_PCI_RTIT_BAR];
 		r++;
-- 
2.47.0


