Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 810117361D3
	for <lists+linux-doc@lfdr.de>; Tue, 20 Jun 2023 05:01:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230132AbjFTDB3 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 19 Jun 2023 23:01:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229944AbjFTDBZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Jun 2023 23:01:25 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 753FA1991;
        Mon, 19 Jun 2023 20:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687230055; x=1718766055;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=z5eEsOZD4FR2rx478Lw4DduE9LHSpVA+uLN2qXeFF7o=;
  b=D8dxj+R6FfjrmhohMF/q/QdXFGsd+9TKcl1F0B1zBQR+TyAr+N6B9AED
   TTfKcnUc97BScTGiUB7c0kAL6B80Hcbey54mFRp2QDnP5vlh6MBxrI3JP
   Jyi+/F9B4XnwPP4gmYkRaWtOkpOuQm9s5FhDLwBPnw51w+QkQGIJ6uj6H
   Y68gSenS3MJVeK++YV5zUUVnUeo6RxAA9sFTD1rrqTRnbWgo3kOVSSutM
   2tXH/HzAOOmEAX+LQB5ZgSqvk5H1CvSiX/7r/NKnfdJzuB5rYlssNxA4E
   yYiI1T4Mmo5uZGzlVBZPzTXMIQigQCw/AfHuhhtmWZUGOVQM5qVCbEVUu
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="362291849"
X-IronPort-AV: E=Sophos;i="6.00,256,1681196400"; 
   d="scan'208";a="362291849"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2023 20:00:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="960604952"
X-IronPort-AV: E=Sophos;i="6.00,256,1681196400"; 
   d="scan'208";a="960604952"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 19 Jun 2023 20:00:48 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qBRbr-0005PI-0C;
        Tue, 20 Jun 2023 03:00:47 +0000
Date:   Tue, 20 Jun 2023 11:00:10 +0800
From:   kernel test robot <lkp@intel.com>
To:     Danilo Krummrich <dakr@redhat.com>, airlied@gmail.com,
        daniel@ffwll.ch, tzimmermann@suse.de, mripard@kernel.org,
        corbet@lwn.net, christian.koenig@amd.com, bskeggs@redhat.com,
        Liam.Howlett@oracle.com, matthew.brost@intel.com,
        boris.brezillon@collabora.com, alexdeucher@gmail.com,
        ogabbay@kernel.org, bagasdotme@gmail.com, willy@infradead.org,
        jason@jlekstrand.net
Cc:     oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
        nouveau@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Danilo Krummrich <dakr@redhat.com>,
        Donald Robson <donald.robson@imgtec.com>,
        Dave Airlie <airlied@redhat.com>
Subject: Re: [PATCH drm-next v5 03/14] drm: manager to keep track of GPUs VA
 mappings
Message-ID: <202306201034.GucldV3r-lkp@intel.com>
References: <20230620004217.4700-4-dakr@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230620004217.4700-4-dakr@redhat.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Danilo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 2222dcb0775d36de28992f56455ab3967b30d380]

url:    https://github.com/intel-lab-lkp/linux/commits/Danilo-Krummrich/drm-execution-context-for-GEM-buffers-v4/20230620-084448
base:   2222dcb0775d36de28992f56455ab3967b30d380
patch link:    https://lore.kernel.org/r/20230620004217.4700-4-dakr%40redhat.com
patch subject: [PATCH drm-next v5 03/14] drm: manager to keep track of GPUs VA mappings
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230620/202306201034.GucldV3r-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230620/202306201034.GucldV3r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306201034.GucldV3r-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/m68k/include/asm/bug.h:32,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/m68k/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:56,
                    from include/linux/kref.h:16,
                    from include/drm/drm_gem.h:37,
                    from drivers/gpu/drm/drm_gpuva_mgr.c:28:
   drivers/gpu/drm/drm_gpuva_mgr.c: In function 'drm_gpuva_check_overflow':
>> drivers/gpu/drm/drm_gpuva_mgr.c:675:21: warning: format '%lu' expects argument of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wformat=]
     675 |                     "GPUVA address limited to %lu bytes, see Documentation.\n",
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:97:62: note: in definition of macro '__WARN_printf'
      97 |                 warn_slowpath_fmt(__FILE__, __LINE__, taint, arg);      \
         |                                                              ^~~
   drivers/gpu/drm/drm_gpuva_mgr.c:674:16: note: in expansion of macro 'WARN'
     674 |         return WARN(check_add_overflow(addr, range, &end),
         |                ^~~~
   drivers/gpu/drm/drm_gpuva_mgr.c:675:49: note: format string is defined here
     675 |                     "GPUVA address limited to %lu bytes, see Documentation.\n",
         |                                               ~~^
         |                                                 |
         |                                                 long unsigned int
         |                                               %u
   drivers/gpu/drm/drm_gpuva_mgr.c: In function '__drm_gpuva_sm_map':
   drivers/gpu/drm/drm_gpuva_mgr.c:1314:32: warning: variable 'prev' set but not used [-Wunused-but-set-variable]
    1314 |         struct drm_gpuva *va, *prev = NULL;
         |                                ^~~~


vim +675 drivers/gpu/drm/drm_gpuva_mgr.c

   668	
   669	static inline bool
   670	drm_gpuva_check_overflow(u64 addr, u64 range)
   671	{
   672		MTREE_INDEX_TYPE end;
   673	
   674		return WARN(check_add_overflow(addr, range, &end),
 > 675			    "GPUVA address limited to %lu bytes, see Documentation.\n",
   676			    MTREE_INDEX_SIZE);
   677	}
   678	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
