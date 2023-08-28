Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCB8C78B82A
	for <lists+linux-doc@lfdr.de>; Mon, 28 Aug 2023 21:23:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230360AbjH1TXJ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 28 Aug 2023 15:23:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233552AbjH1TWi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 Aug 2023 15:22:38 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 896C81A6
        for <linux-doc@vger.kernel.org>; Mon, 28 Aug 2023 12:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693250553; x=1724786553;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OBdyRGusaQ4fyPaF3YBTs7k/s+LjoQ3qnTlbcdJwzEM=;
  b=BJ/zlr5Y+4W2JHjbLmuDC746spfGlz9/kOE8jQkcyW1JyJsivYq8awgV
   wnmpK9cGF3SHbxew+HXOiU5B9x7wLf5I8N+vCObK+fB3LLZeq3pZWynaE
   X4Sd9s61UaCME486kKnrM36n7JPYfJSbiK7bEWy0xIFbaO5oX39mpIXIp
   fr+CTFBAii2Jp5HbBswj5TPd5Q4M35wAvWifFRZx3OEMiIkZ2CeYO7rq9
   0heG1A49ZECTtwAskwoRdA6mmqcUHYl00jR5M6zTgzxeRQopQl4fRsjZ4
   Ike0ciq1yFGDmgmjcgAyld5W2sDs/WnQH/V4uTZ3hVUCJAmSA59kqWM97
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="377914182"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; 
   d="scan'208";a="377914182"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2023 12:21:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="738377995"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; 
   d="scan'208";a="738377995"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 28 Aug 2023 12:21:16 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qahnX-000883-2p;
        Mon, 28 Aug 2023 19:21:15 +0000
Date:   Tue, 29 Aug 2023 03:20:49 +0800
From:   kernel test robot <lkp@intel.com>
To:     Naushir Patuck <naush@raspberrypi.com>
Cc:     oe-kbuild-all@lists.linux.dev,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Umang Jain <umang.jain@ideasonboard.com>,
        linux-doc@vger.kernel.org
Subject: [pinchartl:rpi/v6.5/isp/v2 15/23] htmldocs: Warning:
 Documentation/userspace-api/media/v4l/pixfmt-meta-bcm2835-isp-stats.rst
 references a file that doesn't exist:
 Documentation/media/uapi/fdl-appendix.rst
Message-ID: <202308290313.VZN5q3gd-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git rpi/v6.5/isp/v2
head:   f21e9808068119a1ea8f1ddb5677c982b79ac10d
commit: 40cfcbab11e6b48381a533ab69ddf8aea7a7089b [15/23] media: uapi: v4l2-core: Add ISP statistics output V4L2 fourcc type
reproduce: (https://download.01.org/0day-ci/archive/20230829/202308290313.VZN5q3gd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308290313.VZN5q3gd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Documentation/userspace-api/media/v4l/pixfmt-meta-bcm2835-isp-stats.rst references a file that doesn't exist: Documentation/media/uapi/fdl-appendix.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
