Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B00BC746671
	for <lists+linux-doc@lfdr.de>; Tue,  4 Jul 2023 02:16:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231515AbjGDAQc (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 3 Jul 2023 20:16:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231235AbjGDAQb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 3 Jul 2023 20:16:31 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EB501B7
        for <linux-doc@vger.kernel.org>; Mon,  3 Jul 2023 17:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688429789; x=1719965789;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5yBwDu4X2l+Sr87XMk+hwc/OfIrhSCmSCWcl9TYR/qw=;
  b=RA5jEcjNqELHZT7gkEDvIzQEerBlqo5WZOj+i0d1/d1WOO9/0h5bA0Ss
   hT4+llDyg2AMDbAQ8WOJ+FpHyOf3y+f8I7xAQBb+pZVEAFzr4wCKuOhxl
   O1H8FUTcePgUGn0ffd8v6ceBXiHMH1xfJugo1Swyz/ZPFrmxJ8NW3RJoG
   n/EmGxk/XpUNoTusWeC4aPNLeDiQOiaJAxOpM2heWyGfms/NohHnFEjqZ
   jumCH+9FA4Me1JETn1DlhHifc+0DHhHvGHLBndjNBgZSAWUOyl1KV3xuC
   F+44aXkauhqdGuAcK6+IcOlDeESJJwIyGUGtyFwt1opODSqqfC9Ho8Oxg
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="342580095"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="342580095"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2023 17:16:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="788659875"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="788659875"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 03 Jul 2023 17:16:27 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qGTiU-000HjR-2l;
        Tue, 04 Jul 2023 00:16:26 +0000
Date:   Tue, 4 Jul 2023 08:16:21 +0800
From:   kernel test robot <lkp@intel.com>
To:     Jason Gunthorpe <jgg@nvidia.com>
Cc:     oe-kbuild-all@lists.linux.dev, Lu Baolu <baolu.lu@linux.intel.com>,
        Kevin Tian <kevin.tian@intel.com>, linux-doc@vger.kernel.org
Subject: [jgunthorpe:iommufd_hwpt 14/20] htmldocs:
 Documentation/userspace-api/iommufd:184:
 ./drivers/iommu/iommufd/device.c:614: WARNING: Definition list ends without
 a blank line; unexpected unindent.
Message-ID: <202307040833.E90zgjEU-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   https://github.com/jgunthorpe/linux iommufd_hwpt
head:   3556b57302b5cf741aafa42b1c05dbcd39e92d89
commit: e97cf3cc95c3cf471f0703f4f8af71f806ac62e5 [14/20] iommufd: Add iommufd_device_replace()
reproduce: (https://download.01.org/0day-ci/archive/20230704/202307040833.E90zgjEU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307040833.E90zgjEU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/userspace-api/iommufd:184: ./drivers/iommu/iommufd/device.c:614: WARNING: Definition list ends without a blank line; unexpected unindent.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
