Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9DA37B2B04
	for <lists+linux-doc@lfdr.de>; Fri, 29 Sep 2023 06:53:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229613AbjI2ExY (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 29 Sep 2023 00:53:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229541AbjI2ExX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 29 Sep 2023 00:53:23 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90688199
        for <linux-doc@vger.kernel.org>; Thu, 28 Sep 2023 21:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695963200; x=1727499200;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J+1O++xAk1uaYvFA7tjRUB6ADIeprjPVZy44DcQC4tY=;
  b=LU0i1b0gs0BaV2y93GHbClRVeXEgLY9daiWlLkaaU4Y9vI1EbWjnun5m
   1rfSZ28lyK/kUPoTikgFSwplfxlY9rfX4Cs2pLP8JTn26qUfT5TJhxvN6
   n7w+R1TCK1gddu33iiynS3Wl+uRAvwrhDx0qIBa5pCNxKiPbu9N+Wu6At
   PFavxaPQl+YH++rMKdrEA4oq11XGbzhKQWxbHDJN3oSbnA1afRsZqLIlS
   LU6B5k1a/er9zwaEKlZE3pyY6z3M8/nKmSqGtG5SOekjlc5vfqv43ve4V
   KL+HZcsj1ucseq2GuE579qGFt53h10722j2nsIQFM2RV56uq+oCM2PK/B
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="362481176"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; 
   d="scan'208";a="362481176"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2023 21:53:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="1080807014"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; 
   d="scan'208";a="1080807014"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 28 Sep 2023 21:53:18 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qm5V6-0002UD-2D;
        Fri, 29 Sep 2023 04:53:16 +0000
Date:   Fri, 29 Sep 2023 12:52:47 +0800
From:   kernel test robot <lkp@intel.com>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [arnd-playground:randconfig-6.7-next 184/306] dtbs_check:
 Documentation/devicetree/bindings/net/wireless/st,stlc45xx.yaml:48:1:
 [error] syntax error: found character '\t' that cannot start any token
 (syntax)
Message-ID: <202309291228.GUgwQ7U1-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git randconfig-6.7-next
head:   a126cc9f2f87fe0931a7bf053665560587086082
commit: c97cacea445d32a9301e2a8d4e96dc7518eb7809 [184/306] dt-bindings: net: add st,stlc45xx/p54spi binding
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230929/202309291228.GUgwQ7U1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309291228.GUgwQ7U1-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/net/wireless/st,stlc45xx.yaml:48:1: [error] syntax error: found character '\t' that cannot start any token (syntax)
--
   Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml:
   Error in referenced schema matching $id: http://devicetree.org/schemas/input/qcom,pm8921-keypad.yaml
>> Documentation/devicetree/bindings/net/wireless/st,stlc45xx.yaml:48:1: found a tab character where an indentation space is expected
--
>> Documentation/devicetree/bindings/net/wireless/st,stlc45xx.yaml: ignoring, error parsing file

vim +48 Documentation/devicetree/bindings/net/wireless/st,stlc45xx.yaml

    44	
    45	examples:
    46	  - |
    47	    spi {
  > 48		#address-cells = <1>;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
