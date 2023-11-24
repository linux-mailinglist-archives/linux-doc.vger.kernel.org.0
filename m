Return-Path: <linux-doc+bounces-3047-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B237F77FC
	for <lists+linux-doc@lfdr.de>; Fri, 24 Nov 2023 16:43:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48B85281074
	for <lists+linux-doc@lfdr.de>; Fri, 24 Nov 2023 15:43:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1C973172F;
	Fri, 24 Nov 2023 15:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a1QPtc+Z"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D31A19A2;
	Fri, 24 Nov 2023 07:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700840614; x=1732376614;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HDhPesSks06sdPaid5+HzFR21An8ZemK23RUOa3luX8=;
  b=a1QPtc+ZLsdJTOL1EWzwXds0LxTWOR/n1gbPc2rtCGY2B3XwEpXkbAt4
   2UG3mVpEkQrUF3VuOIfxlr3e7qSGZyMpZN4DJkgumc6uDd7SShhtfjUns
   CXF8UYEVwxkqQnC+PUl66CFTRnuEclqg7KZ3YuTL4JOJkCc4QHPSKfXPX
   3h6t0zunHqoeGi+sDCvRVpeNBmAffwJQhpOA/ecSpee4ir3x67LnshkOF
   c1HKAVJlV1mdskRLP17l/jdA/srhN1mGBfbUOmDjI9p7iCC86IRVBDdq1
   1D6wcRonaH2rC8K7X5PMX5KsQSf9W83osofld/aHuYhaTXXrBAjnudD/Y
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="5662520"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="5662520"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 07:43:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="16005219"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 24 Nov 2023 07:43:27 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6YKy-0002z1-34;
	Fri, 24 Nov 2023 15:43:24 +0000
Date: Fri, 24 Nov 2023 23:42:42 +0800
From: kernel test robot <lkp@intel.com>
To: Donald Robson <donald.robson@imgtec.com>,
	Sarah Walker <sarah.walker@imgtec.com>,
	dri-devel@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	frank.binns@imgtec.com, matt.coster@imgtec.com,
	boris.brezillon@collabora.com, faith.ekstrand@collabora.com,
	airlied@gmail.com, daniel@ffwll.ch,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, afd@ti.com, hns@goldelico.com,
	matthew.brost@intel.com, christian.koenig@amd.com,
	luben.tuikov@amd.com, dakr@redhat.com, linux-kernel@vger.kernel.org,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org, corbet@lwn.net,
	linux-doc@vger.kernel.org, Sarah Walker <sarah.walker@imgtec.com>
Subject: Re: [PATCH v9 11/20] drm/imagination: Add GEM and VM related code
Message-ID: <202311242159.hh8MWiAm-lkp@intel.com>
References: <3c96dd170efe759b73897e3675d7310a7c4b06d0.1700668843.git.donald.robson@imgtec.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3c96dd170efe759b73897e3675d7310a7c4b06d0.1700668843.git.donald.robson@imgtec.com>

Hi Donald Sarah,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes linus/master v6.7-rc2]
[cannot apply to drm/drm-next drm-tip/drm-tip next-20231124]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Donald-Robson/drm-gpuvm-Helper-to-get-range-of-unmap-from-a-remap-op/20231123-013514
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/3c96dd170efe759b73897e3675d7310a7c4b06d0.1700668843.git.donald.robson%40imgtec.com
patch subject: [PATCH v9 11/20] drm/imagination: Add GEM and VM related code
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20231124/202311242159.hh8MWiAm-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231124/202311242159.hh8MWiAm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311242159.hh8MWiAm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/imagination/pvr_vm.c:531:6: warning: no previous prototype for function 'pvr_gpuvm_free' [-Wmissing-prototypes]
     531 | void pvr_gpuvm_free(struct drm_gpuvm *gpuvm)
         |      ^
   drivers/gpu/drm/imagination/pvr_vm.c:531:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     531 | void pvr_gpuvm_free(struct drm_gpuvm *gpuvm)
         | ^
         | static 
   drivers/gpu/drm/imagination/pvr_vm.c:112:22: warning: unused function 'to_pvr_vm_gpuva' [-Wunused-function]
     112 | struct pvr_vm_gpuva *to_pvr_vm_gpuva(struct drm_gpuva *gpuva)
         |                      ^
   2 warnings generated.
--
>> drivers/gpu/drm/imagination/pvr_mmu.c:285: warning: Function parameter or member 'flags' not described in 'pvr_mmu_backing_page_sync'
--
>> drivers/gpu/drm/imagination/pvr_vm.c:65: warning: Function parameter or member 'gpuvm_mgr' not described in 'pvr_vm_context'


vim +/pvr_gpuvm_free +531 drivers/gpu/drm/imagination/pvr_vm.c

   530	
 > 531	void pvr_gpuvm_free(struct drm_gpuvm *gpuvm)
   532	{
   533	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

