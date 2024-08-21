Return-Path: <linux-doc+bounces-23416-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E350959593
	for <lists+linux-doc@lfdr.de>; Wed, 21 Aug 2024 09:19:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A2E141F245F6
	for <lists+linux-doc@lfdr.de>; Wed, 21 Aug 2024 07:19:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C134F16A95A;
	Wed, 21 Aug 2024 07:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DvtPzbLt"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4F4158D72
	for <linux-doc@vger.kernel.org>; Wed, 21 Aug 2024 07:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724224744; cv=none; b=sl7zcHuTQM34ZIiU+DxuKuZ17aPKe0W2MqDdXConC0gyNdJz/eNifJ4dPOONjXEKx5xpPnzbd7rTTBrRDnGQwQrFysGv4/4DJ/anC8Bs68Sn30MlzvOj5qPXLDALgeYGAhCzx0s3bNbPNdSKxIMtlee2hBmYbCIw+0iVIq2ATUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724224744; c=relaxed/simple;
	bh=o84DFjXdopf1GEHjki3SjwRSP/8hSIcIsUWtHhz+AAA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CByxjBzSH7lYbky/V/5LPqjN6c41aXhl6Hmtf1B2RzxDIANDJXRHPHeh7E5BlXHaDD4aj9WtKs4XvPYlsX6ItvtohfrP+ghN//dDZV+VPZZ83O+9gFcn0YJI3fUNADELwA6xV3BYwhV27n5+F1MuULcZuYEskKiDRuzcUC0FT7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DvtPzbLt; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724224741;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=knoOMJx067NkrODyMR3q3Y02Ir50QCnNCyZ9+YE+nPg=;
	b=DvtPzbLtoNl6SYOJgxHz4XAAIsfEz2/7cssLoY2nykM2IjZp80TtQMCHBPNb4fgDDJcq8Z
	KHxjj/fv3RYoMgflZ4JaRHm8J/b6m/sOnk6Gc1aU1envkx+pj1LYT8JIE2IyYxo9p+dnLV
	CKr4/JOrg8+Yy2wnfsfbOZaV5lQEpGk=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-684-_2LZbbZ8OWOX8Tmk-WoWKQ-1; Wed, 21 Aug 2024 03:19:00 -0400
X-MC-Unique: _2LZbbZ8OWOX8Tmk-WoWKQ-1
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7a1df704ef8so661403185a.2
        for <linux-doc@vger.kernel.org>; Wed, 21 Aug 2024 00:19:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724224740; x=1724829540;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=knoOMJx067NkrODyMR3q3Y02Ir50QCnNCyZ9+YE+nPg=;
        b=BUxaTagKnSzD63DGau6Hbir/BrM8q049L1VC2Ob+5UFasAnAlU+VTaaTlmS43EIQ4V
         8GBqqIHdACeZpmJvxw38A2/CZ+CFb0sHilu6eIrDwwzmsfCif8Z8XWkNz4uUdmD6lpJc
         fUyc0lTiQZxOujwL3MHcFa1+xQObZU6/ASNn4S80lFYVJwSW+Tu9HxKrTxcy/uSjZ+D9
         VFA7FrGuoM+um7rHHyZ653Bla1erWxuMA1WiOB3Z9v79U4kv+H1k2NrrPsJ8/4bKEuaF
         hYmxoBG1bvGHa7PSLXx8i8KrnHo+aWBEwrIEe7nmaODsoJHmvRs38+xG8+BsfU+dDR6R
         +6BQ==
X-Gm-Message-State: AOJu0YzsN1Ybij0aTnCFNKEnCG3m2iqB65sRBPo0xKM9JQavpKmQ1+wf
	rUSyr9sWIbK2TeS9n/BZSyqIfUnX6GprsPEF6iCdTX0p+qnMfp4e8lEoQ7exWhDlnt/DRpbYBQU
	faFXEhqvSQPWOPjgs27tNyaKl/IW5vBDM/GP92+GERU07IP+eUFsP4kQn7g==
X-Received: by 2002:a05:620a:462c:b0:79d:759d:4016 with SMTP id af79cd13be357-7a673ffb26bmr218727085a.11.1724224739702;
        Wed, 21 Aug 2024 00:18:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFw1qO6+vz/sJKGh5yA34l/Px9L622Vwet6ke86rxp1KDhRugQHSlyN6hevOfH4OkiWcMWOug==
X-Received: by 2002:a05:620a:462c:b0:79d:759d:4016 with SMTP id af79cd13be357-7a673ffb26bmr218721785a.11.1724224739226;
        Wed, 21 Aug 2024 00:18:59 -0700 (PDT)
Received: from eisenberg.redhat.com (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a4ff013ef2sm596207885a.11.2024.08.21.00.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 00:18:58 -0700 (PDT)
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
Subject: [PATCH v2 0/9] PCI: Remove pcim_iounmap_regions()
Date: Wed, 21 Aug 2024 09:18:33 +0200
Message-ID: <20240821071842.8591-2-pstanner@redhat.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Changes in v2:
  - Add a fix for the UB stack usage bug in vdap/solidrun. Separate
    patch, put stable kernel on CC. (Christophe, Andy).
  - Drop unnecessary pcim_release_region() in mtip32xx (Andy)
  - Consequently, drop patch "PCI: Make pcim_release_region() a public
    function", since there's no user anymore. (obsoletes the squash
    requested by Damien).
  - Fix bug in patch "block: mtip32xx ..." where accidentally BAR 1
    instead of MTIP_ABAR was requested.
  - vdap/solidrun:
    • make 'i' an 'unsigned short' (Andy, me)
    • Use 'continue' to simplify loop (Andy)
    • Remove leftover blank line
  - Apply given Reviewed- / acked-bys (Andy, Damien, Bartosz)


Important things first:
This series is based on [1] and [2] which Bjorn Helgaas has currently
queued for v6.12 in the PCI tree.

This series shall remove pcim_iounmap_regions() in order to make way to
remove its brother, pcim_iomap_regions().

@Bjorn: Feel free to squash the PCI commits.

Regards,
P.

[1] https://lore.kernel.org/all/20240729093625.17561-4-pstanner@redhat.com/
[2] https://lore.kernel.org/all/20240807083018.8734-2-pstanner@redhat.com/

Philipp Stanner (9):
  PCI: Make pcim_iounmap_region() a public function
  fpga/dfl-pci.c: Replace deprecated PCI functions
  block: mtip32xx: Replace deprecated PCI functions
  gpio: Replace deprecated PCI functions
  ethernet: cavium: Replace deprecated PCI functions
  ethernet: stmicro: Simplify PCI devres usage
  vdpa: solidrun: Fix potential UB bug with devres
  vdap: solidrun: Replace deprecated PCI functions
  PCI: Remove pcim_iounmap_regions()

 .../driver-api/driver-model/devres.rst        |  1 -
 drivers/block/mtip32xx/mtip32xx.c             | 11 ++--
 drivers/fpga/dfl-pci.c                        |  9 ++--
 drivers/gpio/gpio-merrifield.c                | 14 ++---
 .../net/ethernet/cavium/common/cavium_ptp.c   | 10 ++--
 .../ethernet/stmicro/stmmac/dwmac-loongson.c  | 25 +++------
 .../net/ethernet/stmicro/stmmac/stmmac_pci.c  | 18 +++----
 drivers/pci/devres.c                          | 24 +--------
 drivers/vdpa/solidrun/snet_main.c             | 52 +++++++------------
 include/linux/pci.h                           |  2 +-
 10 files changed, 57 insertions(+), 109 deletions(-)

-- 
2.46.0


