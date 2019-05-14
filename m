Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57E091CAC3
	for <lists+linux-doc@lfdr.de>; Tue, 14 May 2019 16:48:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726855AbfENOs3 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 14 May 2019 10:48:29 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:40714 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726764AbfENOs2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 14 May 2019 10:48:28 -0400
Received: by mail-pl1-f196.google.com with SMTP id g69so995510plb.7;
        Tue, 14 May 2019 07:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KPJyTDsfdBAYb4kysJw7JhftNxA9CSPFTGsSIHtwfqc=;
        b=rOO4eMP6bP0ZbCBCWBxaWr3kileZ/U/I6PRg8YIZNKxxcWr7Zv+dvPfOUBwYrNmyK7
         7g3F1xIKA4bBdX6nKK0wxc1NIsbf0+3aidO3bYu4n/gSl3AEv18WHtN5VMmyBHocoq18
         Vpev+t7CMgbNxTIEcrJYEecAGeDCsKm8GPAR4yZZeQnJRg/dva6Zoqwt29SuTcan0FtX
         ibnGB/MPaSQE+xVHDTSzbeb7bMRPIfOWi0z6xpkS6gAk2KeGXf+g7ylptMrJ4zvfVoDE
         hFyQkcgiwupmylbqDDyIKPqfaYK09LUe7X1yOaNcYzMqrB1mB9Px6SPZLtGPYT/5vxjz
         cqsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KPJyTDsfdBAYb4kysJw7JhftNxA9CSPFTGsSIHtwfqc=;
        b=FK0aqg5rvqUrPCiDak6lOcIHBWpRZaIzl4MtwTwHFghjvnWOLKPC4lbkG/IP1LRoUH
         r8mvkBFf+Ypq+a35SO62nIvaxAKMjD972gua7xju43mciNc16x2pyfJAJwR+Dq/5+aXs
         OJFCze/4dU923MUrQ8cCVCC1UxXCho+B6JmOPHNskIDDgBO6PUyDQu3dObCMuzbs2LSu
         7Tfq6kqTikKRRp4wrVq1PS0Kk80IkaH/36jmvAUyxd1nQuIStCQxOVemQqsyecDAeaja
         KSqEYRPF7SsJQZyXJJUoileKlgwLRrwTMQRiGhZX5VQOtyZ84pBgwyrqJtvVmi6I7udI
         V0Mw==
X-Gm-Message-State: APjAAAU2y9j2vae4SN50MP615E5smnRrboGpAyQ2f20RwFKV2lbVvz6k
        b0XmDsOWqfdjBLWWfM3c/2A=
X-Google-Smtp-Source: APXvYqwX5TN+tqAbQnc6BvQKXFne+HWaJ9EpPUCur0+tbIDeE5ZEZj2xJWCsmgPcLkv0r1no4pkMGw==
X-Received: by 2002:a17:902:b410:: with SMTP id x16mr36605336plr.174.1557845307459;
        Tue, 14 May 2019 07:48:27 -0700 (PDT)
Received: from localhost.localdomain ([104.238.181.70])
        by smtp.gmail.com with ESMTPSA id j12sm20461415pff.148.2019.05.14.07.48.24
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 14 May 2019 07:48:26 -0700 (PDT)
From:   Changbin Du <changbin.du@gmail.com>
To:     bhelgaas@google.com, corbet@lwn.net
Cc:     linux-pci@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, mchehab+samsung@kernel.org,
        Changbin Du <changbin.du@gmail.com>
Subject: [PATCH v6 12/12] Documentation: PCI: convert endpoint/pci-test-howto.txt to reST
Date:   Tue, 14 May 2019 22:47:34 +0800
Message-Id: <20190514144734.19760-13-changbin.du@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190514144734.19760-1-changbin.du@gmail.com>
References: <20190514144734.19760-1-changbin.du@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This converts the plain text documentation to reStructuredText format and
add it to Sphinx TOC tree. No essential content change.

Signed-off-by: Changbin Du <changbin.du@gmail.com>
Acked-by: Bjorn Helgaas <bhelgaas@google.com>
Reviewed-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/PCI/endpoint/index.rst          |  1 +
 ...{pci-test-howto.txt => pci-test-howto.rst} | 81 +++++++++++++------
 2 files changed, 56 insertions(+), 26 deletions(-)
 rename Documentation/PCI/endpoint/{pci-test-howto.txt => pci-test-howto.rst} (78%)

diff --git a/Documentation/PCI/endpoint/index.rst b/Documentation/PCI/endpoint/index.rst
index b680a3fc4fec..d114ea74b444 100644
--- a/Documentation/PCI/endpoint/index.rst
+++ b/Documentation/PCI/endpoint/index.rst
@@ -10,3 +10,4 @@ PCI Endpoint Framework
    pci-endpoint
    pci-endpoint-cfs
    pci-test-function
+   pci-test-howto
diff --git a/Documentation/PCI/endpoint/pci-test-howto.txt b/Documentation/PCI/endpoint/pci-test-howto.rst
similarity index 78%
rename from Documentation/PCI/endpoint/pci-test-howto.txt
rename to Documentation/PCI/endpoint/pci-test-howto.rst
index 040479f437a5..909f770a07d6 100644
--- a/Documentation/PCI/endpoint/pci-test-howto.txt
+++ b/Documentation/PCI/endpoint/pci-test-howto.rst
@@ -1,38 +1,51 @@
-			    PCI TEST USERGUIDE
-		    Kishon Vijay Abraham I <kishon@ti.com>
+.. SPDX-License-Identifier: GPL-2.0
+
+===================
+PCI Test User Guide
+===================
+
+:Author: Kishon Vijay Abraham I <kishon@ti.com>
 
 This document is a guide to help users use pci-epf-test function driver
 and pci_endpoint_test host driver for testing PCI. The list of steps to
 be followed in the host side and EP side is given below.
 
-1. Endpoint Device
+Endpoint Device
+===============
 
-1.1 Endpoint Controller Devices
+Endpoint Controller Devices
+---------------------------
 
-To find the list of endpoint controller devices in the system:
+To find the list of endpoint controller devices in the system::
 
 	# ls /sys/class/pci_epc/
 	  51000000.pcie_ep
 
-If PCI_ENDPOINT_CONFIGFS is enabled
+If PCI_ENDPOINT_CONFIGFS is enabled::
+
 	# ls /sys/kernel/config/pci_ep/controllers
 	  51000000.pcie_ep
 
-1.2 Endpoint Function Drivers
 
-To find the list of endpoint function drivers in the system:
+Endpoint Function Drivers
+-------------------------
+
+To find the list of endpoint function drivers in the system::
 
 	# ls /sys/bus/pci-epf/drivers
 	  pci_epf_test
 
-If PCI_ENDPOINT_CONFIGFS is enabled
+If PCI_ENDPOINT_CONFIGFS is enabled::
+
 	# ls /sys/kernel/config/pci_ep/functions
 	  pci_epf_test
 
-1.3 Creating pci-epf-test Device
+
+Creating pci-epf-test Device
+----------------------------
 
 PCI endpoint function device can be created using the configfs. To create
-pci-epf-test device, the following commands can be used
+pci-epf-test device, the following commands can be used::
 
 	# mount -t configfs none /sys/kernel/config
 	# cd /sys/kernel/config/pci_ep/
@@ -42,7 +55,7 @@ The "mkdir func1" above creates the pci-epf-test function device that will
 be probed by pci_epf_test driver.
 
 The PCI endpoint framework populates the directory with the following
-configurable fields.
+configurable fields::
 
 	# ls functions/pci_epf_test/func1
 	  baseclass_code	interrupt_pin	progif_code	subsys_id
@@ -51,67 +64,83 @@ configurable fields.
 
 The PCI endpoint function driver populates these entries with default values
 when the device is bound to the driver. The pci-epf-test driver populates
-vendorid with 0xffff and interrupt_pin with 0x0001
+vendorid with 0xffff and interrupt_pin with 0x0001::
 
 	# cat functions/pci_epf_test/func1/vendorid
 	  0xffff
 	# cat functions/pci_epf_test/func1/interrupt_pin
 	  0x0001
 
-1.4 Configuring pci-epf-test Device
+
+Configuring pci-epf-test Device
+-------------------------------
 
 The user can configure the pci-epf-test device using configfs entry. In order
 to change the vendorid and the number of MSI interrupts used by the function
-device, the following commands can be used.
+device, the following commands can be used::
 
 	# echo 0x104c > functions/pci_epf_test/func1/vendorid
 	# echo 0xb500 > functions/pci_epf_test/func1/deviceid
 	# echo 16 > functions/pci_epf_test/func1/msi_interrupts
 	# echo 8 > functions/pci_epf_test/func1/msix_interrupts
 
-1.5 Binding pci-epf-test Device to EP Controller
+
+Binding pci-epf-test Device to EP Controller
+--------------------------------------------
 
 In order for the endpoint function device to be useful, it has to be bound to
 a PCI endpoint controller driver. Use the configfs to bind the function
-device to one of the controller driver present in the system.
+device to one of the controller driver present in the system::
 
 	# ln -s functions/pci_epf_test/func1 controllers/51000000.pcie_ep/
 
 Once the above step is completed, the PCI endpoint is ready to establish a link
 with the host.
 
-1.6 Start the Link
+
+Start the Link
+--------------
 
 In order for the endpoint device to establish a link with the host, the _start_
-field should be populated with '1'.
+field should be populated with '1'::
 
 	# echo 1 > controllers/51000000.pcie_ep/start
 
-2. RootComplex Device
 
-2.1 lspci Output
+RootComplex Device
+==================
+
+lspci Output
+------------
 
-Note that the devices listed here correspond to the value populated in 1.4 above
+Note that the devices listed here correspond to the value populated in 1.4
+above::
 
 	00:00.0 PCI bridge: Texas Instruments Device 8888 (rev 01)
 	01:00.0 Unassigned class [ff00]: Texas Instruments Device b500
 
-2.2 Using Endpoint Test function Device
+
+Using Endpoint Test function Device
+-----------------------------------
 
 pcitest.sh added in tools/pci/ can be used to run all the default PCI endpoint
-tests. To compile this tool the following commands should be used:
+tests. To compile this tool the following commands should be used::
 
 	# cd <kernel-dir>
 	# make -C tools/pci
 
-or if you desire to compile and install in your system:
+or if you desire to compile and install in your system::
 
 	# cd <kernel-dir>
 	# make -C tools/pci install
 
 The tool and script will be located in <rootfs>/usr/bin/
 
-2.2.1 pcitest.sh Output
+
+pcitest.sh Output
+~~~~~~~~~~~~~~~~~
+::
+
 	# pcitest.sh
 	BAR tests
 
-- 
2.20.1

