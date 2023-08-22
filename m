Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2D3E784BF1
	for <lists+linux-doc@lfdr.de>; Tue, 22 Aug 2023 23:22:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231231AbjHVVW2 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 22 Aug 2023 17:22:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231178AbjHVVW2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 22 Aug 2023 17:22:28 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC0CCCF3
        for <linux-doc@vger.kernel.org>; Tue, 22 Aug 2023 14:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692739339; x=1724275339;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y/PX+iIZHu/Jekn+z+/zm+Vb0q6ZXF8TRNOr3t2FcOw=;
  b=FoNWPuRpm+IsW748/5gx5twj705FNfSTicR67bZhWHrOAvOVRjCP7tTg
   pbkChsjrb+ZaAtd+KUuuqlIectWGaYkff/cOTX/VZxrb2lwMSU79yHTW9
   RnUB5xRrWfh3gLvKARW4E6cAukaXagH44eIkQWfvRcCju2h6AxL0wWep1
   I2ygKPKKxccAlWGO+6NeWM3Zto/sowGrGrirHVE3Bi//iL0U0ztiwXEer
   wbKTWkanxbQnZEv2R3dw8FPbZ7Gali8plY9/ufz1vjjFJd2FoR4i61ACr
   cCpAcsTxi3FYtGSiyA0HnNBd1F6x7nxiZ/owCrDLmQvwzH9IJh9BqLjlZ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="377755791"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="377755791"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 14:22:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="806432741"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="806432741"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 22 Aug 2023 14:22:06 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qYYpC-0000XA-0D;
        Tue, 22 Aug 2023 21:22:06 +0000
Date:   Wed, 23 Aug 2023 05:21:25 +0800
From:   kernel test robot <lkp@intel.com>
To:     Fabio Estevam <festevam@denx.de>
Cc:     oe-kbuild-all@lists.linux.dev, Rob Herring <robh@kernel.org>,
        linux-doc@vger.kernel.org
Subject: [robh:for-next 22/34] htmldocs: Warning: MAINTAINERS references a
 file that doesn't exist: Documentation/devicetree/bindings/pps/pps-gpio.txt
Message-ID: <202308230517.n0rrszYH-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
head:   ef04d2801c5d239b83932f8ce97af1d4a1ec1cf7
commit: 7ceb60ece8567e58b7e04965b3a434a0ed606053 [22/34] dt-bindings: pps: pps-gpio: Convert to yaml
reproduce: (https://download.01.org/0day-ci/archive/20230823/202308230517.n0rrszYH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308230517.n0rrszYH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/pps/pps-gpio.txt

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
