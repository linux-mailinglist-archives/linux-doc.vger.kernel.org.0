Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7323139FC6D
	for <lists+linux-doc@lfdr.de>; Tue,  8 Jun 2021 18:25:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233215AbhFHQ0N (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 8 Jun 2021 12:26:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53459 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233393AbhFHQ0D (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Jun 2021 12:26:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623169450;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hE6HSHMIRX+gAlRokY5aHJhvIk3ZJblkRJXqZXARHDc=;
        b=PJSbjK0B6cDfWrguubf1BfQMkSyZqc0H6KbN17eD0eoEjKVgn+VSy6HrbQ07YtoBZMYOud
        OMOas5IfG3pHgGgMxHgHVk4Fy8arxTy4wCnKnhYUS7KKVvUjJh+Kn3jbz879FsFFYL5OlD
        3A+cSR3Wyaqe2BPCfrUsDxuQqSx6EME=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-209-UNGzBu_HNyiOIjprdfxVZQ-1; Tue, 08 Jun 2021 12:24:08 -0400
X-MC-Unique: UNGzBu_HNyiOIjprdfxVZQ-1
Received: by mail-ot1-f72.google.com with SMTP id c10-20020a9d75ca0000b02903f63362f6f3so1298027otl.1
        for <linux-doc@vger.kernel.org>; Tue, 08 Jun 2021 09:24:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hE6HSHMIRX+gAlRokY5aHJhvIk3ZJblkRJXqZXARHDc=;
        b=JC0rtDAO6O5FRHv0J1Ex18fos4v0dRZO4+v2M8eVdnlApG2HFFLq58F5h2vG04upw7
         QwNylSfgDvwkKTxTt96PsodHY6rI2MEcSR+4jXa/moLHFQxfcHiMfeUg2+bRL9/5vxs+
         tN/mWNFElFscFknbIJMKDLcZJJVeKxgXERV5LSCQC/9KaDRTyWVOMPo/nzE7EpPEDYjq
         +W3NzTv2xU2AZkNVGKX9zOo1KLx7m9jOhH1Nj1/ZyrFrSXotQ3h2w1W1wSjV2e+nDjPB
         dOIanNY1A1pBII7+YEnOjuAWb9H8NOeRbcEC2rjorCSFt/9j72XlQ5zi23QZShm1NYtg
         TSbg==
X-Gm-Message-State: AOAM530FcopdA69S7mQhX9zCfVHEZZZqfY0g5Y1deFOXJ0NLNkLxyvff
        aC0vLtklMArp2a5I6uKPOVHVGe+tZWreZwOBa2fA1XWyPhVpK863PvtVyk5/Uk9kYBn2GmmpFVV
        H5lR72gKPVJ+at3UZyI3k
X-Received: by 2002:a05:6808:55c:: with SMTP id i28mr3440185oig.66.1623169446384;
        Tue, 08 Jun 2021 09:24:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz871oBeLPJEBJQHL79uFGPE47JE/Fxob6zrZrwY6gtaALlSf91P0rx0V53f1omTZuqN8Zfig==
X-Received: by 2002:a05:6808:55c:: with SMTP id i28mr3440166oig.66.1623169446230;
        Tue, 08 Jun 2021 09:24:06 -0700 (PDT)
Received: from localhost.localdomain.com (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id s4sm3225773otr.80.2021.06.08.09.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 09:24:05 -0700 (PDT)
From:   trix@redhat.com
To:     hao.wu@intel.com, mdf@kernel.org, corbet@lwn.net,
        michal.simek@xilinx.com, gregkh@linuxfoundation.org,
        dinguyen@kernel.org, krzysztof.kozlowski@canonical.com,
        nava.manne@xilinx.com, yilun.xu@intel.com, davidgow@google.com,
        fpacheco@redhat.com, richard.gong@intel.com, luca@lucaceresoli.net
Cc:     linux-fpga@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Tom Rix <trix@redhat.com>
Subject: [PATCH 4/7] fpga: lattice: reorganize to subdir layout
Date:   Tue,  8 Jun 2021 09:23:37 -0700
Message-Id: <20210608162340.3010204-6-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210608162340.3010204-1-trix@redhat.com>
References: <20210608162340.3010204-1-trix@redhat.com>
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

