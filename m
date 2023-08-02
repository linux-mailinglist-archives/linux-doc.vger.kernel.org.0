Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FBA876D056
	for <lists+linux-doc@lfdr.de>; Wed,  2 Aug 2023 16:43:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232755AbjHBOnK (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 2 Aug 2023 10:43:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232680AbjHBOnJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 2 Aug 2023 10:43:09 -0400
Received: from mgamail.intel.com (unknown [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F569E0
        for <linux-doc@vger.kernel.org>; Wed,  2 Aug 2023 07:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690987388; x=1722523388;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ddVebp4H7ig2sstknUL4S/0AAaxx4X29jF7NCCAUnG8=;
  b=BH3V1ZWYK6nfsKNOkcTHNIAuLhM+n46uV2CsnDlwjkhIUMrvIzCAazgz
   B+VnCxzaFtb9sLdGSA0tXZ7Hil/l8UE7k0UduHXZ2k15/mjpwYggzT6DW
   1ONYQHwE29TBGBxpeo9ZPAlXALm4VPBwtDY/S4iQVqTk4HccynPl7hyvX
   SzxINi6BGWcucS5x/MGLPUpxnXDtYz83USNEoTOiso3kq8aIG0Z6ibaLU
   YNcuU+ujdMbg11rpD3JpYJIudsHDjldn9QWfE0GVl8xDyEFRA1JtdCrah
   5TlSEN/YmGeCyHOQacdu2QjXyDFm38C9clRHVCAEaHwX0X42gyQDWiBAr
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="400550065"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200"; 
   d="scan'208";a="400550065"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2023 07:43:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="852885359"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200"; 
   d="scan'208";a="852885359"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 02 Aug 2023 07:43:06 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qRD45-0001Gl-2E;
        Wed, 02 Aug 2023 14:43:05 +0000
Date:   Wed, 2 Aug 2023 22:42:22 +0800
From:   kernel test robot <lkp@intel.com>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     oe-kbuild-all@lists.linux.dev,
        Linux Memory Management List <linux-mm@kvack.org>,
        Maxime Ripard <mripard@kernel.org>, linux-doc@vger.kernel.org
Subject: [linux-next:master 5684/6443] htmldocs:
 Documentation/gpu/todo.rst:469: WARNING: Unexpected indentation.
Message-ID: <202308022221.APCRi7vk-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   626c67169f9972fffcdf3bc3864de421f162ebf5
commit: d2aacaf07395bd798373cbec6af05fff4147aff3 [5684/6443] drm/panel: Check for already prepared/enabled in drm_panel
reproduce: (https://download.01.org/0day-ci/archive/20230802/202308022221.APCRi7vk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308022221.APCRi7vk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/gpu/todo.rst:469: WARNING: Unexpected indentation.

vim +469 Documentation/gpu/todo.rst

   465	
   466	In a whole pile of panel drivers, we have code to make the
   467	prepare/unprepare/enable/disable callbacks behave as no-ops if they've already
   468	been called. To get some idea of the duplicated code, try:
 > 469	  git grep 'if.*>prepared' -- drivers/gpu/drm/panel
   470	  git grep 'if.*>enabled' -- drivers/gpu/drm/panel
   471	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
