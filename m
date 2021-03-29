Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D8F234CD56
	for <lists+linux-doc@lfdr.de>; Mon, 29 Mar 2021 11:52:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232288AbhC2JwG (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 29 Mar 2021 05:52:06 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:44014 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232129AbhC2Jv5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 29 Mar 2021 05:51:57 -0400
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com [10.225.0.209])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 40F17404A3;
        Mon, 29 Mar 2021 09:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1617011517; bh=5cMTfaevxwhLCPNLc3DOzhIMBgSPdAEVTKWnQRu8vbI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
         References:From;
        b=XW2OLZ89ZGq+FmyJuCbnoXksBwZqlu9qyy8o8MJSJmv3fBun0+5e1dJCkShkTIWuJ
         gz6YZjvQ5LKuDGoyGVG6MkxBqx5BKI5H8eeK7k6CLGWdim5EG4Cf7GvrnFKeNpiWlP
         ovkSrgmQq2Dq7Bh2BtiLD7zzC9jZmqrYtS5R6acs/7oO9c4uLdiiNLkQP2tSkHSt1Y
         BsynHzNHSSF08cWy/ryTNd86WgTyA9gtmO0LN9dNqxkXHGJevtjoCmjym5Vum/LhJF
         Bjl9R0S0SitdOJnKixIRtKzHGLcqDXs+hbKPA4loQSFDUioTuclw5Z+PpMSfVxO8Z8
         nZYCYUgL8U/sg==
Received: from de02dwia024.internal.synopsys.com (de02dwia024.internal.synopsys.com [10.225.19.81])
        by mailhost.synopsys.com (Postfix) with ESMTP id F3990A022F;
        Mon, 29 Mar 2021 09:51:55 +0000 (UTC)
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
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>
Cc:     Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>
Subject: [PATCH v8 3/5] MAINTAINERS: Add Synopsys xData IP driver maintainer
Date:   Mon, 29 Mar 2021 11:51:36 +0200
Message-Id: <17d3ef11eb46bb8f3928912a496a860f348c6b2c.1617011282.git.gustavo.pimentel@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1617011282.git.gustavo.pimentel@synopsys.com>
References: <cover.1617011282.git.gustavo.pimentel@synopsys.com>
In-Reply-To: <cover.1617011282.git.gustavo.pimentel@synopsys.com>
References: <cover.1617011282.git.gustavo.pimentel@synopsys.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add Synopsys xData IP driver maintainer.

This driver aims to support Synopsys xData IP and is normally distributed
along with Synopsys PCIe EndPoint IP as a PCIe traffic generator (depends
of the use and licensing agreement).

Signed-off-by: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9e87692..36387b3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5099,6 +5099,13 @@ S:	Maintained
 F:	drivers/dma/dw-edma/
 F:	include/linux/dma/edma.h
 
+DESIGNWARE XDATA IP DRIVER
+M:	Gustavo Pimentel <gustavo.pimentel@synopsys.com>
+L:	linux-pci@vger.kernel.org
+S:	Maintained
+F:	Documentation/misc-devices/dw-xdata-pcie.rst
+F:	drivers/misc/dw-xdata-pcie.c
+
 DESIGNWARE USB2 DRD IP DRIVER
 M:	Minas Harutyunyan <hminas@synopsys.com>
 L:	linux-usb@vger.kernel.org
-- 
2.7.4

