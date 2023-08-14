Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B29D877B95E
	for <lists+linux-doc@lfdr.de>; Mon, 14 Aug 2023 15:07:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229511AbjHNNGe (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 14 Aug 2023 09:06:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229545AbjHNNGd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 14 Aug 2023 09:06:33 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE04B11D
        for <linux-doc@vger.kernel.org>; Mon, 14 Aug 2023 06:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692018392; x=1723554392;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LEIO+CEbB7/+aB/5j7jUTM+uW+eVRwrcIQY6SPRJHLc=;
  b=nkPpJLXDYHS2obJb/GqU4butz5KQ4bSgO2udOZWwkIauVKbwILBEw4Q0
   QIskNajgCGDsYWKA907HIBbeZm4mdLFR147Kn02XaqTmIEDmzLHo62Te5
   gjvwyQIaWtv/9g2i/yfj7pitH6/xDysA8TPaCj3o4ANXAVVvzdStjy96B
   SSUQU1j67jsCGpcXuyXHd6l3T1HQEbJBB5y3yLbhRBips13eaYbjNTOg2
   SQu60R7QpIFzo4kyGneXpkhDApCd2/Rn4LBMpF4yRLrYZqHttQdxCG2JC
   KsdKeQctwT1VFN7e+jV9iq6o9LDx6Fzi3eR9ATbTPFSu8ucVEnPvHu/nE
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="458394127"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; 
   d="scan'208";a="458394127"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 06:06:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="768446803"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; 
   d="scan'208";a="768446803"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 14 Aug 2023 06:06:30 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qVXH6-00009b-0h;
        Mon, 14 Aug 2023 13:06:25 +0000
Date:   Mon, 14 Aug 2023 21:06:22 +0800
From:   kernel test robot <lkp@intel.com>
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     oe-kbuild-all@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, arm@kernel.org,
        Tony Lindgren <tony@atomide.com>, linux-doc@vger.kernel.org
Subject: [soc:omap/maintainers 1/1] htmldocs: Warning: MAINTAINERS references
 a file that doesn't exist:
 Documentation/devicetree/bindings/arm/ti/omap.yaml
Message-ID: <202308142025.Bua4jLjW-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git omap/maintainers
head:   fda31904ffbc7231898198333804fa551b681387
commit: fda31904ffbc7231898198333804fa551b681387 [1/1] MAINTAINERS: add board bindings list to OMAP2+ files
reproduce: (https://download.01.org/0day-ci/archive/20230814/202308142025.Bua4jLjW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308142025.Bua4jLjW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/arm/ti/omap.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
