Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF359658593
	for <lists+linux-doc@lfdr.de>; Wed, 28 Dec 2022 19:16:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233720AbiL1SQL (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 28 Dec 2022 13:16:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233788AbiL1SQB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 28 Dec 2022 13:16:01 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 468E1175AD;
        Wed, 28 Dec 2022 10:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672251361; x=1703787361;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=hA93ioIwSEbDH6M0SHVKlMXgofrk4ZxxIow6o8jpcLY=;
  b=epJww3kg93WML89vrP5tF2IQtGteRqUuSnSdNLhev5i5dgQ1qW485fGf
   5MmZ8l04et9SshqCv+VdjtiAp3bcg/ChNJz6eS4e72jmgBIadEI/5vkrZ
   kqjBmtdZzxBUxPX/l7ECmIrqU7YcRTnVdvZsnektafJ5vl4q1DbAfFDtN
   W/DMRWODDUH175L7X7gxqRuZDPKzdHoyoVIhkU26fEW9UISwIUwhMN4uK
   gYA47YtkYfVUVFSG/vGlLQ+PVkms6NyEiJL1IX/zxg2Qen/7acVkUXt0m
   soK41fiCy6CN3aF2J28oHDLBub6cd2GTPzM0G+Gcurl6pAuV08ugcvONn
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10574"; a="348121077"
X-IronPort-AV: E=Sophos;i="5.96,281,1665471600"; 
   d="scan'208";a="348121077"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2022 10:16:00 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10574"; a="653393073"
X-IronPort-AV: E=Sophos;i="5.96,281,1665471600"; 
   d="scan'208";a="653393073"
Received: from rhweight-wrk1.ra.intel.com ([137.102.106.139])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2022 10:15:59 -0800
From:   matthew.gerlach@linux.intel.com
To:     hao.wu@intel.com, yilun.xu@intel.com, russell.h.weight@intel.com,
        basheer.ahmed.muddebihal@intel.com, trix@redhat.com,
        mdf@kernel.org, linux-fpga@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        tianfei.zhang@intel.com, corbet@lwn.net,
        gregkh@linuxfoundation.org, linux-serial@vger.kernel.org,
        jirislaby@kernel.org, geert+renesas@glider.be,
        andriy.shevchenko@linux.intel.com,
        niklas.soderlund+renesas@ragnatech.se, macro@orcam.me.uk,
        johan@kernel.org, lukas@wunner.de, ilpo.jarvinen@linux.intel.com,
        marpagan@redhat.com, bagasdotme@gmail.com
Cc:     Matthew Gerlach <matthew.gerlach@linux.intel.com>
Subject: [PATCH v8 0/4] Enhance definition of DFH and use enhancements for UART driver
Date:   Wed, 28 Dec 2022 10:16:20 -0800
Message-Id: <20221228181624.1793433-1-matthew.gerlach@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Matthew Gerlach <matthew.gerlach@linux.intel.com>

This patchset enhances the definition of the Device Feature Header (DFH) used by
the Device Feature List (DFL) bus and then uses the new enhancements in a UART
driver.

The enhancements to the DFH includes the introduction of parameter blocks.
Like PCI capabilities, the DFH parameter blocks further describe
the hardware to software. In the case of the UART, the parameter blocks
provide information for the interrupt, clock frequency, and register layout.

Duplication of code parsing of the parameter blocks in multiple DFL drivers
is a concern. Using swnodes was considered to help minimize parsing code 
duplication, but their use did not help the problem. Furthermore the highly
changeable nature of FPGAs employing the DFL bus makes the use of swnodes
inappropriate. 

Patch 1 updates the DFL documentation to describe the added functionality to DFH.

Patch 2 adds the definitions for DFHv1.

Patch 3 adds basic support for DFHv1. It adds functionality to parse parameter blocks
and adds the functionality to parse the explicit location of a feature's register set.

Patch 4 adds a DFL UART driver that makes use of the new features of DFHv1.

Basheer Ahmed Muddebihal (1):
  fpga: dfl: Add DFHv1 Register Definitions

Matthew Gerlach (3):
  Documentation: fpga: dfl: Add documentation for DFHv1
  fpga: dfl: add basic support for DFHv1
  tty: serial: 8250: add DFL bus driver for Altera 16550.

 Documentation/fpga/dfl.rst         | 112 ++++++++++++
 drivers/fpga/dfl.c                 | 265 +++++++++++++++++++++++------
 drivers/fpga/dfl.h                 |  41 +++++
 drivers/tty/serial/8250/8250_dfl.c | 150 ++++++++++++++++
 drivers/tty/serial/8250/Kconfig    |  12 ++
 drivers/tty/serial/8250/Makefile   |   1 +
 include/linux/dfl.h                |   6 +
 7 files changed, 536 insertions(+), 51 deletions(-)
 create mode 100644 drivers/tty/serial/8250/8250_dfl.c

-- 
2.25.1

