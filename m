Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 251AE31A395
	for <lists+linux-doc@lfdr.de>; Fri, 12 Feb 2021 18:29:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231320AbhBLR3T (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 12 Feb 2021 12:29:19 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:42474 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230405AbhBLR3Q (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 12 Feb 2021 12:29:16 -0500
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com [10.225.0.210])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 0737C40C6B;
        Fri, 12 Feb 2021 17:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1613150896; bh=cWk/9t1KJ3pkWZTaXhcE9sqS1Abl0NkmKoOW7uAzFRQ=;
        h=From:To:Subject:Date:In-Reply-To:References:In-Reply-To:
         References:From;
        b=OY0Fo/L8uWdChJDGzWbKVuADzYlOeYZjYjnDV4JkjB6rgXmmB3/3bghuYhTrlWpmu
         15h2c9NXBERGUjt5Ph525s9+gyBPKIz2SeK/xco48LAx2m559y4fbZT8KlaAeAEqHf
         lVWaCFeil0E3ZuiI1pjhTgjLA/edfhRTeJt6hme8sSd4DJF7enxN6AbEo6dk2laDEy
         YBrPQi5QG+YWocfha3ddXByrLolrJhTjoPBBt8qv4fBrgNBXTOwLoJnzhRr6Fr1V7T
         kkHiEv02aFXE6BHeJ5zv67g0o0T3xOssIsA83qwl8oqHrCOMQBsmZ7jDs+1zE3Orw+
         qOo0iEpyCMGtQ==
Received: from de02dwia024.internal.synopsys.com (de02dwia024.internal.synopsys.com [10.225.19.81])
        by mailhost.synopsys.com (Postfix) with ESMTP id C4688A005D;
        Fri, 12 Feb 2021 17:28:14 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From:   Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>
To:     linux-doc@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Derek Kiernan <derek.kiernan@xilinx.com>,
        Dragan Cvetic <dragan.cvetic@xilinx.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>
Subject: [PATCH v6 3/5] Documentation: misc-devices: Add Documentation for dw-xdata-pcie driver
Date:   Fri, 12 Feb 2021 18:28:05 +0100
Message-Id: <3ac165649570ce353e644f2b4c3f7473d72c7e23.1613150798.git.gustavo.pimentel@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1613150798.git.gustavo.pimentel@synopsys.com>
References: <cover.1613150798.git.gustavo.pimentel@synopsys.com>
In-Reply-To: <cover.1613150798.git.gustavo.pimentel@synopsys.com>
References: <cover.1613150798.git.gustavo.pimentel@synopsys.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add Documentation for dw-xdata-pcie driver.

Signed-off-by: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
---
 Documentation/misc-devices/dw-xdata-pcie.rst | 40 ++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 Documentation/misc-devices/dw-xdata-pcie.rst

diff --git a/Documentation/misc-devices/dw-xdata-pcie.rst b/Documentation/misc-devices/dw-xdata-pcie.rst
new file mode 100644
index 00000000..3d241ae
--- /dev/null
+++ b/Documentation/misc-devices/dw-xdata-pcie.rst
@@ -0,0 +1,40 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+===========================================================================
+Driver for Synopsys DesignWare PCIe traffic generator (also known as xData)
+===========================================================================
+
+This driver should be used as a host-side (Root Complex) driver and Synopsys
+DesignWare prototype that includes this IP.
+
+The "dw-xdata-pcie" driver can be used to enable/disable PCIe traffic
+generator in either direction (mutual exclusion) besides allowing the
+PCIe link performance analysis.
+
+The interaction with this driver is done through the module parameter and
+can be changed in runtime. The driver outputs the requested command state
+information to /var/log/kern.log or dmesg.
+
+Request write TLPs traffic generation - Root Complex to Endpoint direction
+- Command:
+	echo 1 > /sys/bus/pci/drivers/dw-xdata-pcie/.../write
+
+Get write TLPs traffic link throughput in MB/s
+- Command:
+        cat /sys/bus/pci/drivers/dw-xdata-pcie/.../write
+- Output example:
+	204
+
+Request read TLPs traffic generation - Endpoint to Root Complex direction:
+- Command:
+	echo 1 > /sys/bus/pci/drivers/dw-xdata-pcie/.../read
+
+Get read TLPs traffic link throughput in MB/s
+- Command:
+        cat /sys/bus/pci/drivers/dw-xdata-pcie/.../read
+- Output example:
+	199
+
+Request to stop any current TLP transfer:
+- Command:
+	echo 1 > /sys/bus/pci/drivers/dw-xdata-pcie/.../stop
-- 
2.7.4

