Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2147D4E4EC0
	for <lists+linux-doc@lfdr.de>; Wed, 23 Mar 2022 09:54:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242921AbiCWI4U (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 23 Mar 2022 04:56:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234460AbiCWI4U (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 23 Mar 2022 04:56:20 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CD0E53B50;
        Wed, 23 Mar 2022 01:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648025691; x=1679561691;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vPVHQopIDk99EFPlUP34KMijF3yaEg3MXcNZX1ZNG40=;
  b=YDpWCM8cN9tQBWoLr5Csk8u1rHCDIEpRGmj8qFSSSfLnZU9Ra20vxBfE
   vZCH5xkWNTVt077kb+8whhNI0/FW+6+cCh6STxOEEeTM0uhun4qBfjjWC
   o0PIOt+hFZlHUAY6KoH77OStDXvAQfQMV1wWz3YXiMEsxABiXViFiesAS
   nX4GdcWYca+LTDQ3zj5bN8tY/AP/Xpdzo2b5JZJbN9YaNtY/rgTv83B3f
   S6uqlszRDXW7h7MYi6ftMdZ0claZ00NZGO7/dAvMkcCXgCow6Dgwmimhm
   3No1n+SJ8PAzMfsZoONfzNSvUuvknpduMQAEpVaPElW2oi1ThbXO1PD4Z
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10294"; a="258010484"
X-IronPort-AV: E=Sophos;i="5.90,203,1643702400"; 
   d="scan'208";a="258010484"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2022 01:54:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,203,1643702400"; 
   d="scan'208";a="717315436"
Received: from unknown (HELO localhost.localdomain.sh.intel.com) ([10.238.175.107])
  by orsmga005.jf.intel.com with ESMTP; 23 Mar 2022 01:54:24 -0700
From:   Tianfei Zhang <tianfei.zhang@intel.com>
To:     hao.wu@intel.com, trix@redhat.com, mdf@kernel.org,
        yilun.xu@intel.com, linux-fpga@vger.kernel.org,
        linux-doc@vger.kernel.org
Cc:     corbet@lwn.net, rdunlap@infradead.org,
        Tianfei Zhang <tianfei.zhang@intel.com>
Subject: [PATCH v5 0/2] check feature type for DFL irq parsing
Date:   Wed, 23 Mar 2022 04:51:00 -0400
Message-Id: <20220323085102.2297964-1-tianfei.zhang@intel.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch set adds an extended usage of Feature ID for DFL.
Previously the feature IDs defined are unique, no matter
which feature type. But currently we want to extend its
usage to have a per-type feature ID space.

Patch 1 adds feature type checking before parse the irq info.
Patch 2 adds description about the Feature ID.

v5:
  - Fix documentation from Matthew's comment. 
v4:
  - Fix the git commit from Hao's comments.
  - Split documentation into another patch.
v3:
  - Remove "Fixes" in commit log with Hao's comment, this is a
    extension not a bug fix.
v2:
  - add DFL Feature ID Registry in documentation.

Tianfei zhang (2):
  fpga: dfl: check feature type before parse irq info
  Documentation: fpga: dfl: add description of Feature ID

 Documentation/fpga/dfl.rst | 10 ++++++++++
 drivers/fpga/dfl.c         | 38 ++++++++++++++++++++++----------------
 2 files changed, 32 insertions(+), 16 deletions(-)

-- 
2.26.2

