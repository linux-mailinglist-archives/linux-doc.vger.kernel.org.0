Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A819687C24
	for <lists+linux-doc@lfdr.de>; Thu,  2 Feb 2023 12:25:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229616AbjBBLZa (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 2 Feb 2023 06:25:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229988AbjBBLZ3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 2 Feb 2023 06:25:29 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A19DA89FAE
        for <linux-doc@vger.kernel.org>; Thu,  2 Feb 2023 03:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675337128; x=1706873128;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zzd0OIl1HJ9HK3jFZp8jfcJOuNpH1CHnQ5eANp05oxo=;
  b=jHMB95IKyFruhJJ+L3DUSfdZWfY+CBkUTC7lRHueFYyhdIx2rnHr41E0
   J6Lur2XOgc2kTtvWbGIeUvm1RJ4J2kmVoCDnriCfNgYPodcodtxjqXSyd
   vxEBwtugqA93aYdYzot4I4G7BFuP8FwXdjHcsVnthvqQ1JPdxx3adsn4n
   I+zVM0+dw6qkZuqYkW2iJQGaMOgCfMWqzMBL0zAftLyZbIQ9dxSVIus3n
   P3AUhSwW0q1/OfV18a0py5rultexws0c+7KS8aA9Z1w4CETXVGh+OV/r0
   j8goNR9nAmP1MeEtNcWk46yJfty9hGGPuRj5uvL0uwCHL5s/7LFubAr97
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="308071901"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; 
   d="scan'208";a="308071901"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2023 03:25:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="754029003"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; 
   d="scan'208";a="754029003"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 02 Feb 2023 03:25:27 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pNXiY-0006Sa-1T;
        Thu, 02 Feb 2023 11:25:26 +0000
Date:   Thu, 2 Feb 2023 19:25:15 +0800
From:   kernel test robot <lkp@intel.com>
To:     Johan Jonker <jbx6244@gmail.com>
Cc:     oe-kbuild-all@lists.linux.dev,
        Linux Memory Management List <linux-mm@kvack.org>,
        Heiko Stuebner <heiko@sntech.de>, linux-doc@vger.kernel.org
Subject: [linux-next:master 9850/10104] htmldocs: Warning:
 Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml references a file
 that doesn't exist:
 Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.yaml
Message-ID: <202302021922.2jYZjgaX-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ea4dabbb4ad7eb52632a2ca0b8f89f0ea7c55dcf
commit: 0f48b0ed356d8868f62f7c6814fc2edcd70d1816 [9850/10104] dt-bindings: phy: rename phy-rockchip-inno-usb2.yaml
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=0f48b0ed356d8868f62f7c6814fc2edcd70d1816
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 0f48b0ed356d8868f62f7c6814fc2edcd70d1816
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> Warning: Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml references a file that doesn't exist: Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
