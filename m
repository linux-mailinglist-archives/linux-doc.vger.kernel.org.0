Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A173E6D5D50
	for <lists+linux-doc@lfdr.de>; Tue,  4 Apr 2023 12:22:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234368AbjDDKWq (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 4 Apr 2023 06:22:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234548AbjDDKWW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 4 Apr 2023 06:22:22 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 780978F
        for <linux-doc@vger.kernel.org>; Tue,  4 Apr 2023 03:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680603734; x=1712139734;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rmvps4X8PtV4tuCaHYj8S588EyFGn+ixjmbDGYbTB34=;
  b=Py4FKPwf73RkZvCZxSkdrT2lrnam98x8WtncvPDsbh5zs+YrbDER6kWi
   CdTB//NlU8lTl15b4fVbm5xaf+jJsCYmYhgr8tUnGjPBvmXxM2vHGa7Bx
   dzbGPN+ltqjz+L69wYCURD+WEMRvwGuUwSQbgPPtSBiXcxdgLWAYMw3mV
   AKOYlkvglV4hoY1TeeWfknqV/aLK4T0vuTmNSkavNNwe/iHXIWZiHycpe
   5Ga7VEt+2LBpWuxKCpS1mBsIuT2kkHaMC7fv/ny3VdI/OP0xx/UIsLXGq
   /PFqqFV3gdMCb1/YnLo6PLpVsQ4WUOULDQCptZcSb7rzwQotsAplyY5j4
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="343842694"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400"; 
   d="scan'208";a="343842694"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2023 03:20:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="636472556"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400"; 
   d="scan'208";a="636472556"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 04 Apr 2023 03:20:12 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pjdlr-000PXC-2i;
        Tue, 04 Apr 2023 10:20:11 +0000
Date:   Tue, 4 Apr 2023 18:19:41 +0800
From:   kernel test robot <lkp@intel.com>
To:     Hector Martin <marcan@marcan.st>
Cc:     oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [asahilinux:bits/005-maintainers 1/3] htmldocs: Warning: MAINTAINERS
 references a file that doesn't exist:
 Documentation/devicetree/bindings/usb/apple,dwc3.yaml
Message-ID: <202304041845.UHk97fZI-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   https://github.com/AsahiLinux/linux bits/005-maintainers
head:   332d1bd2c6f629438bc0e1e9a2c657a98159831a
commit: ff9818cdb92f40b4a2f78f76b1c5155befdb2cdd [1/3] MAINTAINERS: Add Apple dwc3 bindings to ARM/APPLE
reproduce:
        # https://github.com/AsahiLinux/linux/commit/ff9818cdb92f40b4a2f78f76b1c5155befdb2cdd
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux bits/005-maintainers
        git checkout ff9818cdb92f40b4a2f78f76b1c5155befdb2cdd
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304041845.UHk97fZI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/usb/apple,dwc3.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
