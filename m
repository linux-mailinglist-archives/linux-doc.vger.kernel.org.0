Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E073B355A4A
	for <lists+linux-doc@lfdr.de>; Tue,  6 Apr 2021 19:27:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346943AbhDFR1M (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 6 Apr 2021 13:27:12 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:33570 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S244754AbhDFR1L (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 6 Apr 2021 13:27:11 -0400
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com [10.225.0.209])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 3569240134;
        Tue,  6 Apr 2021 17:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1617730023; bh=bAyEykxMWczQn7uzGIiybS4PBoIvdMpiwexgJdlUBUU=;
        h=From:To:Cc:Subject:Date:From;
        b=GKx04BLXGPhFxQ2pyV/DRncPFKXpVU3ZoFYyx19XDR5lzeboS+Wis+JkUOvz8VwNG
         ytHo7WdYWM79piksT8mnVp2tvaVO2UBj/WYMim/pyYahklJaFBuIPtrZK4Q2jE4vxF
         kn4BylwbNuKUqqHtSLwyPc2b+Da3+6tIe2NcQHHgNEWGf3wo48Tht7He1WOhTNcjOg
         yULBcCjqc29I+8gRmyv3i3NnQvUzRt/iC+b5qyNPsP4aQwO6Vx9+i95RWFvyXpRfAx
         33CTGrcqN5uHNFxj/Qjsv0coTLEw+WBzy97wwwEEeEcg/CeFuKs5oORv36qIp6Kzjg
         gbaEZlhtYhjGw==
Received: from de02dwvm009.internal.synopsys.com (de02dwvm009.internal.synopsys.com [10.225.17.73])
        by mailhost.synopsys.com (Postfix) with ESMTP id 98E71A022E;
        Tue,  6 Apr 2021 17:26:58 +0000 (UTC)
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
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>
Subject: [PATCH v11 0/4] misc: Add Synopsys DesignWare xData IP driver
Date:   Tue,  6 Apr 2021 19:26:45 +0200
Message-Id: <cover.1617729785.git.gustavo.pimentel@synopsys.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch series adds a new driver called xData-pcie for the Synopsys
DesignWare PCIe prototype.

The driver configures and enables the Synopsys DesignWare PCIe traffic
generator IP inside of prototype Endpoint which will generate upstream
and downstream PCIe traffic. This allows to quickly test the PCIe link
throughput speed and check is the prototype solution has some limitation
or not.

Changes:
 V2: Rework driver according to Greg Kroah-Hartman' feedback
     - Replace module parameter by sysfs use.
     - Replace bit fields structure with macros and masks use.
     - Removed SET() and GET() macros by the writel() and readl().
     - Removed some noisy info messages.
 V3: Fixed issues detected while running on 64 bits platforms
     Rebased patches on top of v5.11-rc1 version
 V4: Rework driver according to Greg Kroah-Hartman' feedback
     - Add the ABI doc related to the sysfs implemented on this driver
 V5: Rework driver accordingly to Leon Romanovsky' feedback
     - Removed "default n" on Kconfig
     Rework driver accordingly to Krzysztof Wilczyński' feedback
     - Added some explanatory comments for some steps
     - Added some bit defines instead of magic numbers
 V6: Rework driver according to Greg Kroah-Hartman' feedback
     - Squashed patches #2 and #3
     - Removed units (MB/s) on the sys file
     - Reduced mutex scope on the functions called by sysfs
     Rework driver accordingly to Krzysztof Wilczyński' feedback
     - Fix typo "DesignWare"
 V7: Rework driver according to Greg Kroah-Hartman' feedback
     - Created a sub device (misc device) that will be associated with the PCI driver
     - sysfs group is now associated with the misc drivers instead of the PCI driver
 V8: Rework driver according to Greg Kroah-Hartman' feedback
     - Added more detail to the version changes on the cover letter
     - Squashed patches #1 and #2
     - Removed struct device from the dw_xdata_pcie structure
     - Replaced the pci_*() use by dev_*()
     - Added free call for the misc driver name allocation
     - Added reference counting
     - Removed snps_edda_data structure and their usage
     Rebased patches on top of v5.12-rc4 version
 V9: Squashed temporary development patch #5 into the driver patch #1
 V10: Reworked the write_store() and read_store() to validate the input using kstrtobool()
     Removed stop_store()
     Update ABI documentation accordingly
 V11: Fixed the documentation based on the warnings detected by Stephen Rothwell

Cc: linux-doc@vger.kernel.org
Cc: linux-pci@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Derek Kiernan <derek.kiernan@xilinx.com>
Cc: Dragan Cvetic <dragan.cvetic@xilinx.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Krzysztof Wilczyński <kw@linux.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>

Gustavo Pimentel (4):
  misc: Add Synopsys DesignWare xData IP driver
  Documentation: misc-devices: Add Documentation for dw-xdata-pcie
    driver
  MAINTAINERS: Add Synopsys xData IP driver maintainer
  docs: ABI: Add sysfs documentation interface of dw-xdata-pcie driver

 Documentation/ABI/testing/sysfs-driver-xdata |  49 ++++
 Documentation/misc-devices/dw-xdata-pcie.rst |  64 ++++
 Documentation/misc-devices/index.rst         |   1 +
 MAINTAINERS                                  |   7 +
 drivers/misc/Kconfig                         |  10 +
 drivers/misc/Makefile                        |   1 +
 drivers/misc/dw-xdata-pcie.c                 | 420 +++++++++++++++++++++++++++
 7 files changed, 552 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-xdata
 create mode 100644 Documentation/misc-devices/dw-xdata-pcie.rst
 create mode 100644 drivers/misc/dw-xdata-pcie.c

-- 
2.7.4

