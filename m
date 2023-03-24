Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E00D6C82B0
	for <lists+linux-doc@lfdr.de>; Fri, 24 Mar 2023 17:56:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231447AbjCXQ42 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 24 Mar 2023 12:56:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230373AbjCXQ41 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 24 Mar 2023 12:56:27 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A5E01BF8
        for <linux-doc@vger.kernel.org>; Fri, 24 Mar 2023 09:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679676986; x=1711212986;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rkY1+Ra6r6IrmzIwEr8sPSls6mfeqQ2y1LZln6kdbb0=;
  b=K4OGhSNK7IYz/T9iqoEvTUCkUi6IlC2gEB5UQ4WrbSGaOY1iJ01QviRe
   LgX68gg5sl83s12FcYyUHBREQL/XipQDsV91wvKulzAU0rnDhG3R+3rJR
   s3H0vLHFT+fl/3HgN+03DGMt15xKtY/maVahPe0TbC/8ZUrwbzXMTX1r5
   YhLIycQ8CvmtvAs6RlXMU+2snA69olNA1+uF/gMGfitL+tmrR2fSumpcu
   USdsWoNswq08N03obQo90o5+M9vH3X3KCHo5pvTzxYRj+q7/XdNKNOqNz
   zMLC4MXPqciPI45XuP33/HBH+uhEfp0czyYhNq1DTeHnY6t39xQWrK3DB
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="338551983"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; 
   d="scan'208";a="338551983"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2023 09:56:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="713131230"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; 
   d="scan'208";a="713131230"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 24 Mar 2023 09:56:24 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pfkiF-000FU4-2h;
        Fri, 24 Mar 2023 16:56:23 +0000
Date:   Sat, 25 Mar 2023 00:55:22 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     oe-kbuild-all@lists.linux.dev,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-doc@vger.kernel.org
Subject: [krzk-github:pending/dt-bindings-qcom-new-and-fixes-for-warnings-linux-next
 7/121] htmldocs: Warning:
 Documentation/devicetree/bindings/power/wakeup-source.txt references a file
 that doesn't exist:
 Documentation/devicetree/bindings/input/qcom,pm8xxx-keypad.txt
Message-ID: <202303250049.0LhZBaFN-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   https://github.com/krzk/linux pending/dt-bindings-qcom-new-and-fixes-for-warnings-linux-next
head:   f1bfefa327cc9f54e2ee6185f0e7e53e8cf233a6
commit: 54c9db528bf69f1336be6db861c0246a13717da9 [7/121] dt-bindings: input: qcom,pm8921-keypad: convert to YAML format
reproduce:
        # https://github.com/krzk/linux/commit/54c9db528bf69f1336be6db861c0246a13717da9
        git remote add krzk-github https://github.com/krzk/linux
        git fetch --no-tags krzk-github pending/dt-bindings-qcom-new-and-fixes-for-warnings-linux-next
        git checkout 54c9db528bf69f1336be6db861c0246a13717da9
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303250049.0LhZBaFN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Documentation/devicetree/bindings/power/wakeup-source.txt references a file that doesn't exist: Documentation/devicetree/bindings/input/qcom,pm8xxx-keypad.txt

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
