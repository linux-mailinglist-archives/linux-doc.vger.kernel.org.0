Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F5AC6D5A11
	for <lists+linux-doc@lfdr.de>; Tue,  4 Apr 2023 09:56:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233522AbjDDH4M (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 4 Apr 2023 03:56:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233478AbjDDH4L (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 4 Apr 2023 03:56:11 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A57CA198A;
        Tue,  4 Apr 2023 00:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680594970; x=1712130970;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wQTfdNvrX3E73csQLuETu80HBtJvoIeziZTr92sVFdQ=;
  b=dW9WZLBDSxF/9XvbCmQvq9Xg7v9lQmXxfma4ZEo56WNIEAehw1UWt8R8
   8zNcgeYwpfhzQaOR7KEcezco+1Rh2hSYGaqyfBCVEC0YrxVAnuohSQNYL
   n94lBuCUsBdEwkE2vvvVJlad80UIMP7jCvHr8GWDtte9RWCZke7UY3w76
   UDkDrr3sGLTFOulC9sosHQGO/YbLcbqddtd3U7b8xGwHqES5/34x7PZ/s
   swFNAFUfhesFmpoLx3/DVroSUYlGEyO+MFV135EzZW/S2Vt6xw9j6WccR
   yXUvtb9eZeLr+BJI6zn0G2EJG4jXzDlahgflITKxuKsEZXTXxj72GAWJ3
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="407177934"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400"; 
   d="scan'208";a="407177934"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2023 00:56:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="750836790"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400"; 
   d="scan'208";a="750836790"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 04 Apr 2023 00:56:04 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pjbWN-000POZ-23;
        Tue, 04 Apr 2023 07:56:03 +0000
Date:   Tue, 4 Apr 2023 15:55:45 +0800
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
        Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH drm-next v3 10/15] drm/nouveau: fence: separate fence
 alloc and emit
Message-ID: <202304041506.TkTUebRU-lkp@intel.com>
References: <20230404012741.116502-11-dakr@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230404012741.116502-11-dakr@redhat.com>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Danilo,

kernel test robot noticed the following build errors:

[auto build test ERROR on d36d68fd1925d33066d52468b7c7c6aca6521248]

url:    https://github.com/intel-lab-lkp/linux/commits/Danilo-Krummrich/drm-execution-context-for-GEM-buffers-v3/20230404-093042
base:   d36d68fd1925d33066d52468b7c7c6aca6521248
patch link:    https://lore.kernel.org/r/20230404012741.116502-11-dakr%40redhat.com
patch subject: [PATCH drm-next v3 10/15] drm/nouveau: fence: separate fence alloc and emit
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230404/202304041506.TkTUebRU-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/7fc592f2771fec5cc29fbbfbb9a2b524e02a0e93
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Danilo-Krummrich/drm-execution-context-for-GEM-buffers-v3/20230404-093042
        git checkout 7fc592f2771fec5cc29fbbfbb9a2b524e02a0e93
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304041506.TkTUebRU-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/nouveau/nouveau_dmem.c: In function 'nouveau_dmem_migrate_chunk':
>> drivers/gpu/drm/nouveau/nouveau_dmem.c:681:43: error: 'chunk' undeclared (first use in this function)
     681 |                 nouveau_fence_emit(fence, chunk->drm->dmem->migrate.chan);
         |                                           ^~~~~
   drivers/gpu/drm/nouveau/nouveau_dmem.c:681:43: note: each undeclared identifier is reported only once for each function it appears in


vim +/chunk +681 drivers/gpu/drm/nouveau/nouveau_dmem.c

   664	
   665	static void nouveau_dmem_migrate_chunk(struct nouveau_drm *drm,
   666			struct nouveau_svmm *svmm, struct migrate_vma *args,
   667			dma_addr_t *dma_addrs, u64 *pfns)
   668	{
   669		struct nouveau_fence *fence;
   670		unsigned long addr = args->start, nr_dma = 0, i;
   671	
   672		for (i = 0; addr < args->end; i++) {
   673			args->dst[i] = nouveau_dmem_migrate_copy_one(drm, svmm,
   674					args->src[i], dma_addrs + nr_dma, pfns + i);
   675			if (!dma_mapping_error(drm->dev->dev, dma_addrs[nr_dma]))
   676				nr_dma++;
   677			addr += PAGE_SIZE;
   678		}
   679	
   680		if (!nouveau_fence_new(&fence))
 > 681			nouveau_fence_emit(fence, chunk->drm->dmem->migrate.chan);
   682		migrate_vma_pages(args);
   683		nouveau_dmem_fence_done(&fence);
   684		nouveau_pfns_map(svmm, args->vma->vm_mm, args->start, pfns, i);
   685	
   686		while (nr_dma--) {
   687			dma_unmap_page(drm->dev->dev, dma_addrs[nr_dma], PAGE_SIZE,
   688					DMA_BIDIRECTIONAL);
   689		}
   690		migrate_vma_finalize(args);
   691	}
   692	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
