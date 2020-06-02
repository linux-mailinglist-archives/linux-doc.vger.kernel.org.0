Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7A181EB838
	for <lists+linux-doc@lfdr.de>; Tue,  2 Jun 2020 11:17:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726759AbgFBJRR (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 2 Jun 2020 05:17:17 -0400
Received: from mga02.intel.com ([134.134.136.20]:17163 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726139AbgFBJRQ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 2 Jun 2020 05:17:16 -0400
IronPort-SDR: y10qyPQ+yyy1A71s3iT5TWDFJQJx0MC4ezuo0pPjR7NHntRlRvfGj6+lXQ6TgAUSgnUp++70/v
 4k+N1t9fp0Bw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2020 02:17:15 -0700
IronPort-SDR: KKZe4t3cbVojfN+PQV5IDd3VodaGTI9ZDhXjji04PHXW6mNOiyas5HUzrSILTZyhBZONJI6tOH
 IQEI9v4I1qoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,463,1583222400"; 
   d="scan'208";a="268638695"
Received: from gklab-125-110.igk.intel.com ([10.91.125.110])
  by orsmga003.jf.intel.com with ESMTP; 02 Jun 2020 02:17:13 -0700
From:   Piotr Stankiewicz <piotr.stankiewicz@intel.com>
To:     Bjorn Helgaas <bhelgaas@google.com>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     linux-pci@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Piotr Stankiewicz <piotr.stankiewicz@intel.com>
Subject: [PATCH 01/15] PCI: add shorthand define for message signalled interrupt types
Date:   Tue,  2 Jun 2020 11:17:06 +0200
Message-Id: <20200602091706.31443-1-piotr.stankiewicz@intel.com>
X-Mailer: git-send-email 2.17.2
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

There are several places in the kernel which check/ask for MSI or MSI-X
interrupts. It would make sense to have a shorthand constant, similar to
PCI_IRQ_ALL_TYPES, to use in these situations. So add PCI_IRQ_MSI_TYPES,
for this purpose.

Signed-off-by: Piotr Stankiewicz <piotr.stankiewicz@intel.com>
Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 Documentation/PCI/msi-howto.rst | 5 +++--
 include/linux/pci.h             | 4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/Documentation/PCI/msi-howto.rst b/Documentation/PCI/msi-howto.rst
index aa2046af69f7..2800ff5aa395 100644
--- a/Documentation/PCI/msi-howto.rst
+++ b/Documentation/PCI/msi-howto.rst
@@ -105,7 +105,8 @@ if it can't meet the minimum number of vectors.
 The flags argument is used to specify which type of interrupt can be used
 by the device and the driver (PCI_IRQ_LEGACY, PCI_IRQ_MSI, PCI_IRQ_MSIX).
 A convenient short-hand (PCI_IRQ_ALL_TYPES) is also available to ask for
-any possible kind of interrupt.  If the PCI_IRQ_AFFINITY flag is set,
+any possible kind of interrupt, and (PCI_IRQ_MSI_TYPES) to ask for message
+signalled interrupts (MSI or MSI-X).  If the PCI_IRQ_AFFINITY flag is set,
 pci_alloc_irq_vectors() will spread the interrupts around the available CPUs.
 
 To get the Linux IRQ numbers passed to request_irq() and free_irq() and the
@@ -160,7 +161,7 @@ the single MSI mode for a device.  It could be done by passing two 1s as
 Some devices might not support using legacy line interrupts, in which case
 the driver can specify that only MSI or MSI-X is acceptable::
 
-	nvec = pci_alloc_irq_vectors(pdev, 1, nvec, PCI_IRQ_MSI | PCI_IRQ_MSIX);
+	nvec = pci_alloc_irq_vectors(pdev, 1, nvec, PCI_IRQ_MSI_TYPES);
 	if (nvec < 0)
 		goto out_err;
 
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 83ce1cdf5676..b6c9bf70363e 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1422,8 +1422,8 @@ int pci_set_vga_state(struct pci_dev *pdev, bool decode,
  */
 #define PCI_IRQ_VIRTUAL		(1 << 4)
 
-#define PCI_IRQ_ALL_TYPES \
-	(PCI_IRQ_LEGACY | PCI_IRQ_MSI | PCI_IRQ_MSIX)
+#define PCI_IRQ_MSI_TYPES	(PCI_IRQ_MSI | PCI_IRQ_MSIX)
+#define PCI_IRQ_ALL_TYPES	(PCI_IRQ_LEGACY | PCI_IRQ_MSI_TYPES)
 
 /* kmem_cache style wrapper around pci_alloc_consistent() */
 
-- 
2.17.2

