Return-Path: <linux-doc+bounces-27742-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2CF9A0A6A
	for <lists+linux-doc@lfdr.de>; Wed, 16 Oct 2024 14:44:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E4560280EBD
	for <lists+linux-doc@lfdr.de>; Wed, 16 Oct 2024 12:44:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61804212635;
	Wed, 16 Oct 2024 12:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cNevUTJU"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FBCD2101A1
	for <linux-doc@vger.kernel.org>; Wed, 16 Oct 2024 12:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729082523; cv=none; b=HGFLmvZNE5UbarlEc2TpE1ZqeDfpsBkpyvSzx7sJv3lw2qLnPRwHKlgZbsXXX8B1xI5jKipunN8PYwpX7yK12khTbBftVHoq78wOTjYaBLqLbRts7kAulK/Gq+FS+0v26aYlWVDfax9WB5VuEHJt+9ipsOexGfaVpirTmToXsBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729082523; c=relaxed/simple;
	bh=RRyy0x2PiBX++bfjCGlA/9AZOm7xwGM5wtpW6IKXyVc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rrVPKuolhnvzHqKoBFHY+StogHsVOFEOjFrlYGgT9OUNWRHMA/Nkjh+zrrKeipe+Qirrfnks1ehvd0Sebaitx/SzKQsqChgaP5FlvF0mxXWolC574XBfS7NVclmmYdCTwg4yJk2N92+CMLnapL3gORpLHjX2RRBsWYVQdEaeBPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cNevUTJU; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729082520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WxQ5Vib/1yt2THpDXWI2rA9CY+VRhy0DxtAlfuLaLe4=;
	b=cNevUTJUKr8iMqsBFUukQlXA3o/oX6Sk0COTfe51LO54XqsoB0pLirUm9593bngFdS0ZmQ
	INbwfehcCLO/1uCYs9gVJIXqovNbY+HSRyZygZ+aUXHkFBxp/FvOpDPCGvDelWIc4dvzjH
	Ej5+/uIufGwRWHNrXuksKLJPqSjT5OY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-202-kdD4Kh50P2aQU-PE2vO4NA-1; Wed, 16 Oct 2024 08:41:59 -0400
X-MC-Unique: kdD4Kh50P2aQU-PE2vO4NA-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43124676f8aso29624895e9.0
        for <linux-doc@vger.kernel.org>; Wed, 16 Oct 2024 05:41:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729082518; x=1729687318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WxQ5Vib/1yt2THpDXWI2rA9CY+VRhy0DxtAlfuLaLe4=;
        b=M/D0JyuHN2TqoW11NsQTt46j0HDfwRqPR+OE+gMK3kJdOfMhukrMj0hWNGf9cpZ6uI
         88zoA95+7IqwpcgdaysZXNRuLWZg6q05TNVVa9BaEkPAA+SGm1YsEIMXXg5umYd7uL0R
         tfl1Xs6LOzqOmSUrT4KjrseOeoSwOkmIjdNcQz/SRULNiBC+SyJX/a+OmWUtVXUwgEBJ
         Y+Yb7vMyfLlxWWvVabiO0oIp5YmgY6lFMFA58CdD+GldoicB46xx8q6enlK8QTaqE3o2
         +OxOExcwGunDtrIsCxLslJ9kX25UmE/d9iq43N4ZsxgcYTTLKG4qK3x3TgDbbYiKCANv
         8wlg==
X-Gm-Message-State: AOJu0YwXQ+0glPMfgT59iIghmyWMU6sQt2SW9MB9SS88MAvuOQDfGlxv
	WsaIceGQnj/uNVlPtWx3MJsKFVVzPQcWPdyTEJ3/u5FMb4qIeYfvlsvXbUkMEWJP3hFfkQPjoRs
	gnzlN+0C6vgy3FdcB8E2XPtmwP1usk6FWoXHjXW35GXupI5pBF041DWzRiQ==
X-Received: by 2002:a05:600c:3b99:b0:426:647b:1bfc with SMTP id 5b1f17b1804b1-4314a3abe93mr36586825e9.30.1729082517801;
        Wed, 16 Oct 2024 05:41:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHw2sV/ClbQfdvwspcTkrZNz/VyaEPQ2ipBhPy5Ayv8A5HEwXPUtYjfukoE6IW5o2vvgmQFRg==
X-Received: by 2002:a05:600c:3b99:b0:426:647b:1bfc with SMTP id 5b1f17b1804b1-4314a3abe93mr36586155e9.30.1729082517278;
        Wed, 16 Oct 2024 05:41:57 -0700 (PDT)
Received: from eisenberg.muc.redhat.com (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fa8ffd6sm4246879f8f.50.2024.10.16.05.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 05:41:56 -0700 (PDT)
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
Subject: [PATCH v4 08/10] serial: rp2: Replace deprecated PCI functions
Date: Wed, 16 Oct 2024 14:41:30 +0200
Message-ID: <20241016124136.41540-9-pstanner@redhat.com>
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
Reviewed-by: Jiri Slaby <jirislaby@kernel.org>
---
 drivers/tty/serial/rp2.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/tty/serial/rp2.c b/drivers/tty/serial/rp2.c
index 8bab2aedc499..6d99a02dd439 100644
--- a/drivers/tty/serial/rp2.c
+++ b/drivers/tty/serial/rp2.c
@@ -698,7 +698,6 @@ static int rp2_probe(struct pci_dev *pdev,
 	const struct firmware *fw;
 	struct rp2_card *card;
 	struct rp2_uart_port *ports;
-	void __iomem * const *bars;
 	int rc;
 
 	card = devm_kzalloc(&pdev->dev, sizeof(*card), GFP_KERNEL);
@@ -711,13 +710,16 @@ static int rp2_probe(struct pci_dev *pdev,
 	if (rc)
 		return rc;
 
-	rc = pcim_iomap_regions_request_all(pdev, 0x03, DRV_NAME);
+	rc = pcim_request_all_regions(pdev, DRV_NAME);
 	if (rc)
 		return rc;
 
-	bars = pcim_iomap_table(pdev);
-	card->bar0 = bars[0];
-	card->bar1 = bars[1];
+	card->bar0 = pcim_iomap(pdev, 0, 0);
+	if (!card->bar0)
+		return -ENOMEM;
+	card->bar1 = pcim_iomap(pdev, 1, 0);
+	if (!card->bar1)
+		return -ENOMEM;
 	card->pdev = pdev;
 
 	rp2_decode_cap(id, &card->n_ports, &card->smpte);
-- 
2.47.0


