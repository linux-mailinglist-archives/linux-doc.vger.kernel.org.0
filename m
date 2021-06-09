Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 172FF3A1579
	for <lists+linux-doc@lfdr.de>; Wed,  9 Jun 2021 15:23:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236302AbhFINZX (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 9 Jun 2021 09:25:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34564 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236225AbhFINZM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Jun 2021 09:25:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623244997;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hE6HSHMIRX+gAlRokY5aHJhvIk3ZJblkRJXqZXARHDc=;
        b=gJ1Hgxy4+Uccicwb7lXcelclfqVSA9Yo8YTzHg60A4JoW/GdI3svfQ/0OkVSPyNpFoEACW
        q11P7+9R1dxt89ARZCJJVC0QkRAZV+dDw+RCIg/mqwewUyZIx8l5o+7nKN0iKJtAw7fJ/z
        Z6Cs08WuRSUszqsKz1EXowmGoY0PAJU=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-353-SScq5AGKMQ2hJM0RnFMcNA-1; Wed, 09 Jun 2021 09:23:16 -0400
X-MC-Unique: SScq5AGKMQ2hJM0RnFMcNA-1
Received: by mail-ot1-f70.google.com with SMTP id f7-20020a9d5e870000b02902f479dba730so16281886otl.21
        for <linux-doc@vger.kernel.org>; Wed, 09 Jun 2021 06:23:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hE6HSHMIRX+gAlRokY5aHJhvIk3ZJblkRJXqZXARHDc=;
        b=dpDTIZi4PGWnolB2CtT3nA28DjQHpzMr+ST7SFWt6/KYMnBqjdrVIFdusMt1kAsLpT
         yO06lL2P/RNMUJOzAuAqHR2j3Ap2wJpFzFMMnpo19HNQRuR5iI9EfnLVQ/V9zdvuT4q8
         YoBWmaIZT6KfZ3uLq70G1ausLkd3ueEysiZLHnR4qsLvgBxjk2l6nDnf7SVG/1Fompe+
         QiDufsyu2EZZSlrFAiM1opiyKQCxavUKRrA+U9qkhnwSt1j9nwTMVDiG41uFg2RmIoCT
         hJ5Ojl+DdIzjtSy/qbYS8jgWyygtXU6NUsg7pp8ZdMzTLfm6PfnRbGZX5l9bRn+RCe+y
         /REg==
X-Gm-Message-State: AOAM533tP3e7VymRt3Yv02Za956MN9RP2K7vM2MB215aCcrI1AlsBmZw
        74mWKFCgdspHoMH6ptxqVRmHCN6Uj2Y5DyRDIWxFfCNlrwNSk0YSJnCrDetKzJg8O7y8n7IxbTz
        YE+A9IiEz1C02hsKDZnB2
X-Received: by 2002:a9d:1b8:: with SMTP id e53mr21498150ote.252.1623244995631;
        Wed, 09 Jun 2021 06:23:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwr4NEx7Yve3wjhF1gwVJrTOehYjV/0qEGs38SXoho/7pOmP0syhetqKATX2jZzPm+B7Rcomg==
X-Received: by 2002:a9d:1b8:: with SMTP id e53mr21498134ote.252.1623244995464;
        Wed, 09 Jun 2021 06:23:15 -0700 (PDT)
Received: from localhost.localdomain.com (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id 21sm3165654otd.21.2021.06.09.06.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jun 2021 06:23:15 -0700 (PDT)
From:   trix@redhat.com
To:     hao.wu@intel.com, mdf@kernel.org, corbet@lwn.net,
        michal.simek@xilinx.com
Cc:     linux-fpga@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Tom Rix <trix@redhat.com>
Subject: [PATCH 4/7] fpga: lattice: reorganize to subdir layout
Date:   Wed,  9 Jun 2021 06:21:48 -0700
Message-Id: <20210609132151.3081379-6-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210609132151.3081379-1-trix@redhat.com>
References: <20210609132151.3081379-1-trix@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Tom Rix <trix@redhat.com>

Create a lattice/ subdir
Move ice40* and machxo2* files to it.
Add a Kconfig and Makefile

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/fpga/Kconfig                     | 14 +-------------
 drivers/fpga/Makefile                    | 13 +++++--------
 drivers/fpga/lattice/Kconfig             | 22 ++++++++++++++++++++++
 drivers/fpga/lattice/Makefile            |  4 ++++
 drivers/fpga/{ => lattice}/ice40-spi.c   |  0
 drivers/fpga/{ => lattice}/machxo2-spi.c |  0
 6 files changed, 32 insertions(+), 21 deletions(-)
 create mode 100644 drivers/fpga/lattice/Kconfig
 create mode 100644 drivers/fpga/lattice/Makefile
 rename drivers/fpga/{ => lattice}/ice40-spi.c (100%)
 rename drivers/fpga/{ => lattice}/machxo2-spi.c (100%)

diff --git a/drivers/fpga/Kconfig b/drivers/fpga/Kconfig
index 885701b1356ad..0cce719d6af84 100644
--- a/drivers/fpga/Kconfig
+++ b/drivers/fpga/Kconfig
@@ -12,19 +12,6 @@ menuconfig FPGA
 
 if FPGA
 
-config FPGA_MGR_ICE40_SPI
-	tristate "Lattice iCE40 SPI"
-	depends on OF && SPI
-	help
-	  FPGA manager driver support for Lattice iCE40 FPGAs over SPI.
-
-config FPGA_MGR_MACHXO2_SPI
-	tristate "Lattice MachXO2 SPI"
-	depends on SPI
-	help
-	  FPGA manager driver support for Lattice MachXO2 configuration
-	  over slave SPI interface.
-
 config FPGA_BRIDGE
 	tristate "FPGA Bridge Framework"
 	help
@@ -47,6 +34,7 @@ config OF_FPGA_REGION
 	  overlay.
 
 source "drivers/fpga/altera/Kconfig"
+source "drivers/fpga/lattice/Kconfig"
 source "drivers/fpga/dfl/Kconfig"
 source "drivers/fpga/xilinx/Kconfig"
 
diff --git a/drivers/fpga/Makefile b/drivers/fpga/Makefile
index db83aeb997f24..9197698201e3a 100644
--- a/drivers/fpga/Makefile
+++ b/drivers/fpga/Makefile
@@ -4,19 +4,16 @@
 #
 
 # Core FPGA Manager Framework
-obj-$(CONFIG_FPGA)			+= fpga-mgr.o
-
-# FPGA Manager Drivers
-obj-$(CONFIG_FPGA_MGR_ICE40_SPI)	+= ice40-spi.o
-obj-$(CONFIG_FPGA_MGR_MACHXO2_SPI)	+= machxo2-spi.o
+obj-$(CONFIG_FPGA) += fpga-mgr.o
 
 # FPGA Bridge Drivers
-obj-$(CONFIG_FPGA_BRIDGE)		+= fpga-bridge.o
+obj-$(CONFIG_FPGA_BRIDGE) += fpga-bridge.o
 
 # High Level Interfaces
-obj-$(CONFIG_FPGA_REGION)		+= fpga-region.o
-obj-$(CONFIG_OF_FPGA_REGION)		+= of-fpga-region.o
+obj-$(CONFIG_FPGA_REGION) += fpga-region.o
+obj-$(CONFIG_OF_FPGA_REGION) += of-fpga-region.o
 
 obj-$(CONFIG_FPGA_ALTERA) += altera/
 obj-$(CONFIG_FPGA_DFL) += dfl/
+obj-$(CONFIG_FPGA_LATTICE) += lattice/
 obj-$(CONFIG_FPGA_XILINX) += xilinx/
diff --git a/drivers/fpga/lattice/Kconfig b/drivers/fpga/lattice/Kconfig
new file mode 100644
index 0000000000000..4619aac49ef57
--- /dev/null
+++ b/drivers/fpga/lattice/Kconfig
@@ -0,0 +1,22 @@
+config FPGA_LATTICE
+	bool "Lattice Devices"
+	default y
+	help
+	  If you have a lattic fpga, say Y.
+
+if FPGA_LATTICE
+
+config FPGA_MGR_ICE40_SPI
+	tristate "Lattice iCE40 SPI"
+	depends on OF && SPI
+	help
+	  FPGA manager driver support for Lattice iCE40 FPGAs over SPI.
+
+config FPGA_MGR_MACHXO2_SPI
+	tristate "Lattice MachXO2 SPI"
+	depends on SPI
+	help
+	  FPGA manager driver support for Lattice MachXO2 configuration
+	  over slave SPI interface.
+
+endif #FPGA_LATTICE
diff --git a/drivers/fpga/lattice/Makefile b/drivers/fpga/lattice/Makefile
new file mode 100644
index 0000000000000..42d01c1b61704
--- /dev/null
+++ b/drivers/fpga/lattice/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_FPGA_MGR_ICE40_SPI) += ice40-spi.o
+obj-$(CONFIG_FPGA_MGR_MACHXO2_SPI) += machxo2-spi.o
diff --git a/drivers/fpga/ice40-spi.c b/drivers/fpga/lattice/ice40-spi.c
similarity index 100%
rename from drivers/fpga/ice40-spi.c
rename to drivers/fpga/lattice/ice40-spi.c
diff --git a/drivers/fpga/machxo2-spi.c b/drivers/fpga/lattice/machxo2-spi.c
similarity index 100%
rename from drivers/fpga/machxo2-spi.c
rename to drivers/fpga/lattice/machxo2-spi.c
-- 
2.26.3

