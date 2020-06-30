Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC8C020FA58
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2020 19:17:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390162AbgF3RRX (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 30 Jun 2020 13:17:23 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:58153 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726642AbgF3RRW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 30 Jun 2020 13:17:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1593537441;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:in-reply-to:in-reply-to:references:references;
        bh=n3ZPjfnJ/ASkDBGa8iMOc6QkfcTimtat1V0+GirAcgg=;
        b=FKxB00K0BSdi8KOjD64w17APJrz6XhnnJvzWCAriiNB23p+I9cHhOme54E8ZQDa6fx1vJ6
        m9KVP3aoTuZcE82MWSyekmJBx/678YxyX+DPFeg6ncChT21uI/mO9jhnci/k48oLNG8/kg
        Ck+XBbccwWdHrwPTn1+n/DFThs2Aqr8=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-124-85YVe0DbN12ct7ljisimSg-1; Tue, 30 Jun 2020 13:17:19 -0400
X-MC-Unique: 85YVe0DbN12ct7ljisimSg-1
Received: by mail-qt1-f198.google.com with SMTP id r25so14926296qtj.11
        for <linux-doc@vger.kernel.org>; Tue, 30 Jun 2020 10:17:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=n3ZPjfnJ/ASkDBGa8iMOc6QkfcTimtat1V0+GirAcgg=;
        b=Jauj4muS93m7Pd+3a3qZGaHFosJLeeRgwi3Q2Za6SrJnVcoN7K83HDO0kEva3LUiNd
         ScjdlQW7R4Ua+8zHBJvsmeTc6yDLVScHl4as1cgVZdtGP3GGf0aFme+njJc9KRiNdOVB
         nnBgyd5hzh7gxUr44w3LTQYaVWVQrgUtnCHPlg6/rDk89/xTYdo/6WCdmorZbMmB96KZ
         /BUBWrUIoira0G0t0tKSO9dk3oM6zcsDzzXei3Vdjdh7iJoYK/+z569/L7xgY0pc6lUx
         qydE2nE1INVdmUHp+YGtQUHrLuu+KyzgP9ngCpuuyr8XqvnXPEeSWJEK3+buD0M0bvJk
         v3Tw==
X-Gm-Message-State: AOAM530JCRCvbzBbVUFSWFd/DVpdPdGM1NwYyqyjX21y7p0ySYoJCYG2
        XjGgDsjCP26dIxP2V/3G5GvkQps0CVPIG+LOmzYNBdnn5WvmTboiBVpt2moM5qkgDw2ANZhD+gI
        3d/MYB01JpJWYz00ppsew
X-Received: by 2002:ae9:ef83:: with SMTP id d125mr20933776qkg.287.1593537439096;
        Tue, 30 Jun 2020 10:17:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx4Rf6dlYjlg1ZOz83/bf/I+qHA2gJJyZcdyRaH7/vXLLfV7DTSG6gGjxZZf5mVUAEO1jvfJQ==
X-Received: by 2002:ae9:ef83:: with SMTP id d125mr20933758qkg.287.1593537438856;
        Tue, 30 Jun 2020 10:17:18 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id w44sm3790774qtb.22.2020.06.30.10.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 10:17:18 -0700 (PDT)
From:   trix@redhat.com
To:     hao.wu@intel.com, mdf@kernel.org, corbet@lwn.net
Cc:     linux-fpga@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tom Rix <trix@redhat.com>
Subject: [RFC 1/1] fpga: dfl: RFC PCI config
Date:   Tue, 30 Jun 2020 10:16:56 -0700
Message-Id: <20200630171656.20151-2-trix@redhat.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20200630171656.20151-1-trix@redhat.com>
References: <20200630171656.20151-1-trix@redhat.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Tom Rix <trix@redhat.com>

Create some top level configs the map to dfl pci cards.

Autoselect the parts of fpga that are needed to run these cards
as well as the other subsystem configs to the card's subdevices.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 Documentation/fpga/dfl.rst | 33 +++++++++++++++++++++++++++++++++
 drivers/fpga/Kconfig       | 28 ++++++++++++++++++++++++++++
 2 files changed, 61 insertions(+)

diff --git a/Documentation/fpga/dfl.rst b/Documentation/fpga/dfl.rst
index d7648d7c7eee..3a872bc8e3d3 100644
--- a/Documentation/fpga/dfl.rst
+++ b/Documentation/fpga/dfl.rst
@@ -500,6 +500,39 @@ Developer only needs to provide a sub feature driver with matched feature id.
 FME Partial Reconfiguration Sub Feature driver (see drivers/fpga/dfl-fme-pr.c)
 could be a reference.
 
+Kernel configuration
+====================
+
+While it is possible to manually setup a configuration to match your device,
+there are some top level configurations that collect configuations for
+some reference pci cards.  Below descibes these configuration as well as
+what other kernel configs are needed for proper configuration.
+
+FPGA_DFL_PAC10
+Intel Arria 10 GX PCI card, PCI id 0X09C4
+Depends on
+  SPI_ALTERA
+  MFD_INTEL_M10_BMC
+  MFD_INTEL_M10_BMC_SECURE
+  SENSORS_INTEL_M10_BMC_HWMON
+
+FPGA_DFL_D5005
+Intel Stratix 10, D5005 PCI card, PCI id 0X0B2B
+Depends on
+  SPI_ALTERA
+  MFD_INTEL_M10_BMC
+  MFD_INTEL_M10_BMC_SECURE
+  SENSORS_INTEL_M10_BMC_HWMON
+  INTEL_S10_PHY
+
+FPGA_DFL_N3000
+Intel Network Accelerator, N3000 PCI card, PCI id 0X0B30
+Depends on
+  SPI_ALTERA
+  MFD_INTEL_M10_BMC
+  MFD_INTEL_M10_BMC_SECURE
+  SENSORS_INTEL_M10_BMC_HWMON
+  INTEL_LL_10G_MAC
 
 Open discussion
 ===============
diff --git a/drivers/fpga/Kconfig b/drivers/fpga/Kconfig
index 9d53bd9094e2..b657de20bc98 100644
--- a/drivers/fpga/Kconfig
+++ b/drivers/fpga/Kconfig
@@ -138,6 +138,34 @@ config OF_FPGA_REGION
 	  Support for loading FPGA images by applying a Device Tree
 	  overlay.
 
+config FPGA_DFL_PAC10
+	tristate "Intel Arria 10 GX PCI card"
+	select SPI_ALTERA
+	select MFD_INTEL_M10_BMC
+	select MFD_INTEL_M10_BMC_SECURE
+	select SENSORS_INTEL_M10_BMC_HWMON
+	select FPGA_DFL
+	select FPGA_DFL_FME
+	select FPGA_DFL_FME_MGR
+	select FPGA_DFL_FME_BRIDGE
+	select FPGA_DFL_FME_REGION
+	select FPGA_DFL_AFU
+	select FPGA_DFL_SPI_ALTERA
+	select FPGA_DFL_PCI
+	select IFPGA_SEC_MGR
+
+config FPGA_DFL_D5005
+	tristate "Intel Stratix 10, D5005 PCI card"
+	select FPGA_DFL_PAC10
+	select INTEL_S10_PHY
+	select FPGA_DFl_HSSI
+
+config FPGA_DFL_N3000
+	tristate "Intel Network Accelerator, N3000 PCI card"
+	select FPGA_DFL_PAC10
+	select INTEL_LL_10G_MAC
+	select FPGA_DFL_N3000_NIOS
+
 config FPGA_DFL
 	tristate "FPGA Device Feature List (DFL) support"
 	select FPGA_BRIDGE
-- 
2.18.1

