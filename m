Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1BC9D768089
	for <lists+linux-doc@lfdr.de>; Sat, 29 Jul 2023 18:14:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229492AbjG2QOv (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 29 Jul 2023 12:14:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjG2QOu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 29 Jul 2023 12:14:50 -0400
Received: from mgamail.intel.com (unknown [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 147743A9B
        for <linux-doc@vger.kernel.org>; Sat, 29 Jul 2023 09:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690647290; x=1722183290;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0QQWZDndvU4c08Vtpol4fX/EygzRrbaH6YEIFRTmqOo=;
  b=GUN8SuW2tdzFTUP9qLupO1A91TXMcONnKNFMori+YvR4kJz4h6H4sp9e
   WBksPxGppC9ZhnKA4UGr/bpXSd16JaysNrizSko46PFTif1QMApEDSRra
   PRdyM0kXKEDcX0P9nAC/flkHmk3gnVprPCJ3edkuPFwzA/RW38g4KViHT
   UF7Os1Wb1YZmOTYLQ9gBW7jaJnqhg1AbPvkcUGU3AEyld8VHvBt8eOUe8
   VL9eRGIZiTuboDkGKp1pydkho17eLov1IP48STtDeZv9tPwEeDPGRdKoi
   TP2prYffgTGOH2JdTjVemnm1TEd0GrCX4rLWT4ketR5rDM9ptwQBigXCn
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10786"; a="349073210"
X-IronPort-AV: E=Sophos;i="6.01,240,1684825200"; 
   d="scan'208";a="349073210"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2023 09:14:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10786"; a="677830964"
X-IronPort-AV: E=Sophos;i="6.01,240,1684825200"; 
   d="scan'208";a="677830964"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 29 Jul 2023 09:14:48 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qPmad-00049r-0K;
        Sat, 29 Jul 2023 16:14:47 +0000
Date:   Sun, 30 Jul 2023 00:14:36 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     oe-kbuild-all@lists.linux.dev,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-doc@vger.kernel.org
Subject: [krzk-github:pending/dt-bindings-qcom-new-and-fixes-for-warnings-linux-next
 8/127] htmldocs: Warning:
 Documentation/devicetree/bindings/power/wakeup-source.txt references a file
 that doesn't exist:
 Documentation/devicetree/bindings/input/qcom,pm8xxx-keypad.txt
Message-ID: <202307300057.Nu3Bktoo-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   https://github.com/krzk/linux pending/dt-bindings-qcom-new-and-fixes-for-warnings-linux-next
head:   7179a80b8df2e202b85c6ee6956876b61464bdc9
commit: 921b2eea1a2b457c6ba01c33ee273a8f86693293 [8/127] dt-bindings: input: qcom,pm8921-keypad: convert to YAML format
reproduce: (https://download.01.org/0day-ci/archive/20230730/202307300057.Nu3Bktoo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307300057.Nu3Bktoo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Documentation/devicetree/bindings/power/wakeup-source.txt references a file that doesn't exist: Documentation/devicetree/bindings/input/qcom,pm8xxx-keypad.txt

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
