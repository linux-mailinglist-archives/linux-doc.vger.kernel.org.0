Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3EC77446D4
	for <lists+linux-doc@lfdr.de>; Sat,  1 Jul 2023 07:51:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229618AbjGAFvE (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 1 Jul 2023 01:51:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229486AbjGAFvD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 1 Jul 2023 01:51:03 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 600FF1FE8
        for <linux-doc@vger.kernel.org>; Fri, 30 Jun 2023 22:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688190661; x=1719726661;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I5c4dz/QtDGrrFERiX2xTgeTFieB+46FLcHxcYqJnu4=;
  b=Hxw4ckCMsZCfl4PeVgbHBvs9licWmi+UHPGtL5nxWnFg0iCqvijhU3om
   ur/DLnF9jO5tg4M1PvYs61asXu3X8pVxLKC9dytCP74fbB6UIE3W2uMc+
   iuqzfumxaHb9odstEw1bbdLcM7su8C0ny1MOoDSo7kpCh1fMnO6V0jFDf
   lc5Ts37RNuNE4HvXqBQ4kxyvu6zuWQOPx3+T7INxUsyvi2LZI7VyGz5Tr
   +Rn6sIuCp9V9y83+vgLpy1OBJWL/SepxmfHumdVOYZW5Q+z96EpVAm+Q1
   cM9NCYyD4fEODKW6pPAcOod2RXoApZS1N4ZslMsbqFJMh1Y0kWvmuoNMU
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="342142718"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; 
   d="scan'208";a="342142718"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 22:51:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="721189923"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; 
   d="scan'208";a="721189923"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 30 Jun 2023 22:50:59 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qFTVa-000FkT-1S;
        Sat, 01 Jul 2023 05:50:58 +0000
Date:   Sat, 1 Jul 2023 13:49:58 +0800
From:   kernel test robot <lkp@intel.com>
To:     Jani Nikula <jani.nikula@intel.com>
Cc:     oe-kbuild-all@lists.linux.dev, intel-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org,
        Luca Coelho <luciano.coelho@intel.com>,
        linux-doc@vger.kernel.org
Subject: [drm-intel:drm-intel-next 1/2] htmldocs:
 Documentation/gpu/rfc/i915_scheduler.rst:138: WARNING: Unknown directive
 type "c:namespace-push".
Message-ID: <202307011340.vny1abul-lkp@intel.com>
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

tree:   git://anongit.freedesktop.org/drm-intel drm-intel-next
head:   0c4f52bac4401dfd6f82984040bc0e163b0ccb9c
commit: f6757dfcfde722fdeaee371b66f63d7eb61dd7e4 [1/2] drm/doc: fix duplicate declaration warning
reproduce: (https://download.01.org/0day-ci/archive/20230701/202307011340.vny1abul-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307011340.vny1abul-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/gpu/rfc/i915_scheduler.rst:138: WARNING: Unknown directive type "c:namespace-push".
>> Documentation/gpu/rfc/i915_scheduler.rst:143: WARNING: Unknown directive type "c:namespace-pop".

vim +138 Documentation/gpu/rfc/i915_scheduler.rst

   137	
 > 138	.. c:namespace-push:: rfc
   139	
   140	.. kernel-doc:: include/uapi/drm/i915_drm.h
   141	        :functions: i915_context_engines_parallel_submit
   142	
 > 143	.. c:namespace-pop::
   144	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
