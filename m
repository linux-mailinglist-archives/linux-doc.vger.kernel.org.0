Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05D6C6F8E8B
	for <lists+linux-doc@lfdr.de>; Sat,  6 May 2023 06:27:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229823AbjEFE1m (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 6 May 2023 00:27:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229693AbjEFE1l (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 6 May 2023 00:27:41 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 876DE7DA7
        for <linux-doc@vger.kernel.org>; Fri,  5 May 2023 21:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683347259; x=1714883259;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XFX6hRGYBhNAUAU5DgLTaL9sD9PFKHc051PSQ5XK6EE=;
  b=d8mlP2ohUzRTJDS/GO4AwTAVkbD1u4SnMfhs2iXnERCaQj+smjEyiMZn
   tZBM6rGFh6vPbKUWpcJ/bbLZhOygE2v2Rj1QvIfEOrHgGBoYrcogEA59U
   x7XGiFmRgI37kvNQLkFVX37ujvMMBjC0KErpZkZsu9Vd+U+3VHHhPF1eZ
   7jxciGixAtOaf2zzpQm4zgOz+Vmd1wS30x+NYoVXOXehrMT9okO0XeiAZ
   joVlILGLKNqIzMKf/tESUFXFytSjGAsma53T6VqwHt1sPANQzM6rO9xnp
   UKUqaD2JPTarAXK/UAuqsOp4osnnYSZPnwOL87iTM4vepVseNYnoho52p
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="377424745"
X-IronPort-AV: E=Sophos;i="5.99,254,1677571200"; 
   d="scan'208";a="377424745"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2023 21:27:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="944156863"
X-IronPort-AV: E=Sophos;i="5.99,254,1677571200"; 
   d="scan'208";a="944156863"
Received: from lkp-server01.sh.intel.com (HELO fe5d646e317d) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 05 May 2023 21:27:38 -0700
Received: from kbuild by fe5d646e317d with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pv9WD-00019G-1c;
        Sat, 06 May 2023 04:27:37 +0000
Date:   Sat, 6 May 2023 12:27:20 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     oe-kbuild-all@lists.linux.dev,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-doc@vger.kernel.org
Subject: [krzk-github:pending/dt-bindings-qcom-new-and-fixes-for-warnings-linux-next
 7/200] htmldocs: Warning:
 Documentation/devicetree/bindings/power/wakeup-source.txt references a file
 that doesn't exist:
 Documentation/devicetree/bindings/input/qcom,pm8xxx-keypad.txt
Message-ID: <202305061244.0scOmlxb-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   https://github.com/krzk/linux pending/dt-bindings-qcom-new-and-fixes-for-warnings-linux-next
head:   37cac42f7369b5677b2c378d885c6c9b342cae57
commit: d54f9ff29b4a490bd67fcfc4aa58858ccdb0b6ef [7/200] dt-bindings: input: qcom,pm8921-keypad: convert to YAML format
reproduce:
        # https://github.com/krzk/linux/commit/d54f9ff29b4a490bd67fcfc4aa58858ccdb0b6ef
        git remote add krzk-github https://github.com/krzk/linux
        git fetch --no-tags krzk-github pending/dt-bindings-qcom-new-and-fixes-for-warnings-linux-next
        git checkout d54f9ff29b4a490bd67fcfc4aa58858ccdb0b6ef
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305061244.0scOmlxb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Documentation/devicetree/bindings/power/wakeup-source.txt references a file that doesn't exist: Documentation/devicetree/bindings/input/qcom,pm8xxx-keypad.txt

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
