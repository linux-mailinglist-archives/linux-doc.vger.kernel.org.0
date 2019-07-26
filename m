Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 166A37664B
	for <lists+linux-doc@lfdr.de>; Fri, 26 Jul 2019 14:51:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726751AbfGZMvq (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 26 Jul 2019 08:51:46 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:40086 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726617AbfGZMvq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 26 Jul 2019 08:51:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=bs3enu59UfvCehHYmSCxQhpe4RGM8ERe0lg1xzZ/LqI=; b=ieTWib0CK1Ju61WCoQmt/bBxc1
        0dP7UHLysBU8IX91rS8fYyebV2tMB1JMCNRUyOZS8ysAEtMDgSgDAjsjgCXI/6CDey2tcdGnks86K
        jUsvJGrkcuuuQnwkvLMS2XIuNAPptvI6g7SKmMzGWBcV6vQi0VfCtlpoxlZ8emigUhkx/yt+BU43V
        zfMhD7B+lBG6x1dQBV/Cdqq/SEkqNdB7+WHb4+aD7FfuHMtfeWUrnFh1sOOUGOBFco8sumvAPqjiD
        EO2KpXZryw4m6TT3uShqbm7LrKS4sR7fJ46vwz/OTzbIuxz8QnSnJnL/SlMx679dFgg3sBtMFR825
        5faenEzA==;
Received: from [179.95.31.157] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hqzhE-0006Af-L1; Fri, 26 Jul 2019 12:51:40 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hqzhC-0005bc-FN; Fri, 26 Jul 2019 09:51:38 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>, linux-doc@vger.kernel.org,
        linux-mips@vger.kernel.org
Subject: [PATCH v2 21/26] docs: mips: add to the documentation body as ReST
Date:   Fri, 26 Jul 2019 09:51:31 -0300
Message-Id: <6829abccfc656e736893348cecfedace06eef228.1564145354.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1564145354.git.mchehab+samsung@kernel.org>
References: <cover.1564145354.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Manually convert the AU1xxx_IDE.README file to ReST and add
to a MIPS book as part of the main documentation body.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Acked-by: Paul Burton <paul.burton@mips.com>
---
 Documentation/index.rst                       |  1 +
 .../{AU1xxx_IDE.README => au1xxx_ide.rst}     | 89 +++++++++++--------
 Documentation/mips/index.rst                  | 17 ++++
 3 files changed, 70 insertions(+), 37 deletions(-)
 rename Documentation/mips/{AU1xxx_IDE.README => au1xxx_ide.rst} (67%)
 create mode 100644 Documentation/mips/index.rst

diff --git a/Documentation/index.rst b/Documentation/index.rst
index de7be1c31450..1ff03833276a 100644
--- a/Documentation/index.rst
+++ b/Documentation/index.rst
@@ -149,6 +149,7 @@ implementation.
    ia64/index
    m68k/index
    powerpc/index
+   mips/index
    openrisc/index
    parisc/index
    riscv/index
diff --git a/Documentation/mips/AU1xxx_IDE.README b/Documentation/mips/au1xxx_ide.rst
similarity index 67%
rename from Documentation/mips/AU1xxx_IDE.README
rename to Documentation/mips/au1xxx_ide.rst
index ff675a1b1422..2f9c2cff6738 100644
--- a/Documentation/mips/AU1xxx_IDE.README
+++ b/Documentation/mips/au1xxx_ide.rst
@@ -1,7 +1,14 @@
-README for MIPS AU1XXX IDE driver - Released 2005-07-15
+.. include:: <isonum.txt>
+
+======================
+MIPS AU1XXX IDE driver
+======================
+
+Released 2005-07-15
+
+About
+=====
 
-ABOUT
------
 This file describes the 'drivers/ide/au1xxx-ide.c', related files and the
 services they provide.
 
@@ -10,17 +17,17 @@ the white or black list, go to the 'ADD NEW HARD DISC TO WHITE OR BLACK LIST'
 section.
 
 
-LICENSE
--------
+License
+=======
 
-Copyright (c) 2003-2005 AMD, Personal Connectivity Solutions
+:Copyright: |copy| 2003-2005 AMD, Personal Connectivity Solutions
 
 This program is free software; you can redistribute it and/or modify it under
 the terms of the GNU General Public License as published by the Free Software
 Foundation; either version 2 of the License, or (at your option) any later
 version.
 
-THIS SOFTWARE IS PROVIDED ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES,
+THIS SOFTWARE IS PROVIDED ``AS IS`` AND ANY EXPRESS OR IMPLIED WARRANTIES,
 INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
 FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR
 BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
@@ -35,31 +42,35 @@ You should have received a copy of the GNU General Public License along with
 this program; if not, write to the Free Software Foundation, Inc.,
 675 Mass Ave, Cambridge, MA 02139, USA.
 
-Note: for more information, please refer "AMD Alchemy Au1200/Au1550 IDE
+Note:
+      for more information, please refer "AMD Alchemy Au1200/Au1550 IDE
       Interface and Linux Device Driver" Application Note.
 
 
-FILES, CONFIGS AND COMPATIBILITY
---------------------------------
+Files, Configs and Compatibility
+================================
 
 Two files are introduced:
 
   a) 'arch/mips/include/asm/mach-au1x00/au1xxx_ide.h'
      contains : struct _auide_hwif
-                 timing parameters for PIO mode 0/1/2/3/4
-                 timing parameters for MWDMA 0/1/2
+
+                - timing parameters for PIO mode 0/1/2/3/4
+                - timing parameters for MWDMA 0/1/2
 
   b) 'drivers/ide/mips/au1xxx-ide.c'
      contains the functionality of the AU1XXX IDE driver
 
 Following extra configs variables are introduced:
 
-  CONFIG_BLK_DEV_IDE_AU1XXX_PIO_DBDMA    - enable the PIO+DBDMA mode
-  CONFIG_BLK_DEV_IDE_AU1XXX_MDMA2_DBDMA  - enable the MWDMA mode
+  CONFIG_BLK_DEV_IDE_AU1XXX_PIO_DBDMA
+	- enable the PIO+DBDMA mode
+  CONFIG_BLK_DEV_IDE_AU1XXX_MDMA2_DBDMA
+	- enable the MWDMA mode
 
 
-SUPPORTED IDE MODES
--------------------
+Supported IDE Modes
+===================
 
 The AU1XXX IDE driver supported all PIO modes - PIO mode 0/1/2/3/4 - and all
 MWDMA modes - MWDMA 0/1/2 -. There is no support for SWDMA and UDMA mode.
@@ -69,20 +80,21 @@ To change the PIO mode use the program hdparm with option -p, e.g.
 -X, e.g. 'hdparm -X32 [device]' for MWDMA mode 0.
 
 
-PERFORMANCE CONFIGURATIONS
---------------------------
+Performance Configurations
+==========================
 
-If the used system doesn't need USB support enable the following kernel configs:
+If the used system doesn't need USB support enable the following kernel
+configs::
 
-CONFIG_IDE=y
-CONFIG_BLK_DEV_IDE=y
-CONFIG_IDE_GENERIC=y
-CONFIG_BLK_DEV_IDEPCI=y
-CONFIG_BLK_DEV_GENERIC=y
-CONFIG_BLK_DEV_IDEDMA_PCI=y
-CONFIG_BLK_DEV_IDE_AU1XXX=y
-CONFIG_BLK_DEV_IDE_AU1XXX_MDMA2_DBDMA=y
-CONFIG_BLK_DEV_IDEDMA=y
+    CONFIG_IDE=y
+    CONFIG_BLK_DEV_IDE=y
+    CONFIG_IDE_GENERIC=y
+    CONFIG_BLK_DEV_IDEPCI=y
+    CONFIG_BLK_DEV_GENERIC=y
+    CONFIG_BLK_DEV_IDEDMA_PCI=y
+    CONFIG_BLK_DEV_IDE_AU1XXX=y
+    CONFIG_BLK_DEV_IDE_AU1XXX_MDMA2_DBDMA=y
+    CONFIG_BLK_DEV_IDEDMA=y
 
 Also define 'IDE_AU1XXX_BURSTMODE' in 'drivers/ide/mips/au1xxx-ide.c' to enable
 the burst support on DBDMA controller.
@@ -90,20 +102,22 @@ the burst support on DBDMA controller.
 If the used system need the USB support enable the following kernel configs for
 high IDE to USB throughput.
 
-CONFIG_IDE_GENERIC=y
-CONFIG_BLK_DEV_IDEPCI=y
-CONFIG_BLK_DEV_GENERIC=y
-CONFIG_BLK_DEV_IDEDMA_PCI=y
-CONFIG_BLK_DEV_IDE_AU1XXX=y
-CONFIG_BLK_DEV_IDE_AU1XXX_MDMA2_DBDMA=y
-CONFIG_BLK_DEV_IDEDMA=y
+::
+
+    CONFIG_IDE_GENERIC=y
+    CONFIG_BLK_DEV_IDEPCI=y
+    CONFIG_BLK_DEV_GENERIC=y
+    CONFIG_BLK_DEV_IDEDMA_PCI=y
+    CONFIG_BLK_DEV_IDE_AU1XXX=y
+    CONFIG_BLK_DEV_IDE_AU1XXX_MDMA2_DBDMA=y
+    CONFIG_BLK_DEV_IDEDMA=y
 
 Also undefine 'IDE_AU1XXX_BURSTMODE' in 'drivers/ide/mips/au1xxx-ide.c' to
 disable the burst support on DBDMA controller.
 
 
-ACKNOWLEDGMENTS
----------------
+Acknowledgments
+===============
 
 These drivers wouldn't have been done without the base of kernel 2.4.x AU1XXX
 IDE driver from AMD.
@@ -112,4 +126,5 @@ Additional input also from:
 Matthias Lenk <matthias.lenk@amd.com>
 
 Happy hacking!
+
 Enrico Walther <enrico.walther@amd.com>
diff --git a/Documentation/mips/index.rst b/Documentation/mips/index.rst
new file mode 100644
index 000000000000..fd9023c8a89f
--- /dev/null
+++ b/Documentation/mips/index.rst
@@ -0,0 +1,17 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=================
+MIPS architecture
+=================
+
+.. toctree::
+   :maxdepth: 2
+
+   au1xxx_ide
+
+.. only::  subproject and html
+
+   Indices
+   =======
+
+   * :ref:`genindex`
-- 
2.21.0

