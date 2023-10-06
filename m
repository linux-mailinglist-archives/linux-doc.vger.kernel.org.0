Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 151737BB6CA
	for <lists+linux-doc@lfdr.de>; Fri,  6 Oct 2023 13:43:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232018AbjJFLnw (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 6 Oct 2023 07:43:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231935AbjJFLnu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 6 Oct 2023 07:43:50 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C94C4C5;
        Fri,  6 Oct 2023 04:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696592628; x=1728128628;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=8+VFG3kqWXCncCIWSoHFiD83/KcC/DPAqlO1RUiJDcE=;
  b=lNT1AJalA1oJAbvEGbd28ot1tkAgfuenAViTSeTAOzoAJ3bGdBEfwvo1
   oOuz1uwbocLbfhOjGKnbOmxpsSB6UKLTYgXrwYq4nhVFM/hIaT27QHsiC
   Jdtsh/Q8+e7LZDbUQXUw97BkIQjhU73D8D5bloXsHJVXNxO7ID/7/0zCN
   E7GsVHlzDkrMWF6wWrCSSwENcrt2Zf1CvrYb93avIHDL55bt4cdjCnr3e
   5kN4KNpj2I37yKc9M4ZZ8iVGQqdoGMvmPMpLEWoGqqbYLRUK+QSja4BVp
   fMCpOqzO7q/b67FmIWaZmapWmoLj3nzTKQrtx76mdiDVbK5IlbXoYGKCR
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="470003215"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; 
   d="scan'208";a="470003215"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2023 04:43:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="925942697"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; 
   d="scan'208";a="925942697"
Received: from amlin-018-114.igk.intel.com ([10.102.18.114])
  by orsmga005.jf.intel.com with ESMTP; 06 Oct 2023 04:43:44 -0700
From:   Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
To:     netdev@vger.kernel.org
Cc:     vadim.fedorenko@linux.dev, jiri@resnulli.us, corbet@lwn.net,
        davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
        jesse.brandeburg@intel.com, anthony.l.nguyen@intel.com,
        linux-doc@vger.kernel.org, intel-wired-lan@lists.osuosl.org,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
Subject: [PATCH net-next v3 0/5] dpll: add phase-offset and phase-adjust
Date:   Fri,  6 Oct 2023 13:40:56 +0200
Message-Id: <20231006114101.1608796-1-arkadiusz.kubalewski@intel.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Improve monitoring and control over dpll devices.
Allow user to receive measurement of phase difference between signals on
pin and dpll (phase-offset).
Allow user to receive and control adjustable value of pin's signal
phase (phase-adjust).

v2->v3:
- do not increase do version of uAPI header as it is not needed

v1->v2:
- improve handling for error case of requesting the phase adjust set
- align handling for error case of frequency set request with the
approach introduced for phase adjust

Arkadiusz Kubalewski (5):
  dpll: docs: add support for pin signal phase offset/adjust
  dpll: spec: add support for pin-dpll signal phase offset/adjust
  dpll: netlink/core: add support for pin-dpll signal phase
    offset/adjust
  ice: dpll: implement phase related callbacks
  dpll: netlink/core: change pin frequency set behavior

 Documentation/driver-api/dpll.rst         |  53 ++++-
 Documentation/netlink/specs/dpll.yaml     |  33 +++-
 drivers/dpll/dpll_netlink.c               | 180 +++++++++++++++--
 drivers/dpll/dpll_nl.c                    |   8 +-
 drivers/dpll/dpll_nl.h                    |   2 +-
 drivers/net/ethernet/intel/ice/ice_dpll.c | 224 +++++++++++++++++++++-
 drivers/net/ethernet/intel/ice/ice_dpll.h |  10 +-
 include/linux/dpll.h                      |  18 ++
 include/uapi/linux/dpll.h                 |   8 +-
 9 files changed, 514 insertions(+), 22 deletions(-)

-- 
2.38.1

