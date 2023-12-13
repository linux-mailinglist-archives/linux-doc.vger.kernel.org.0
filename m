Return-Path: <linux-doc+bounces-4167-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE94805E1C
	for <lists+linux-doc@lfdr.de>; Tue,  5 Dec 2023 19:51:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B0B3281FBD
	for <lists+linux-doc@lfdr.de>; Tue,  5 Dec 2023 18:51:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A019A675DB;
	Tue,  5 Dec 2023 18:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XbwWyZ8l"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DA2FC6;
	Tue,  5 Dec 2023 10:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701802283; x=1733338283;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FGHffFy0+nOUiTzc3iXUEN5m3xo0m449pUrj/6VUrqw=;
  b=XbwWyZ8lu8leAhk1FZFEIjovokO+hMRAA8Po6yJP+pPgST9fBlz+L10t
   zjvNXSZWj06AFbxgMuosgtkFfzgkn4g+0qpTEsc+SywxYFWduSiahD6Ta
   cyLUs8wjKvIcKyoo+/jeo4TikKCLRhP5bogz/mja3xyAtm40+Gkzf6/Q2
   Oyyt6HNpqwjCJ8d8mXDAUGzMrjesIVN3JPJt9i1wdx+OqwIQN7AMUmFtH
   qzhan++096qgb3vfEZNW5atJ/4QuRBQZVXJJjGJ3a42b1AGLnsM6J2pH9
   680cuUNqatoUd16OlIIcpJ7CDe/HDoelJ0Tf/juatNDg94L7oO9aP6NSP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="458261267"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="458261267"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 10:51:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="747337026"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="747337026"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 05 Dec 2023 10:51:14 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAaVk-0009Zn-0t;
	Tue, 05 Dec 2023 18:51:12 +0000
Date: Wed, 6 Dec 2023 02:50:15 +0800
From: kernel test robot <lkp@intel.com>
To: Babu Moger <babu.moger@amd.com>, corbet@lwn.net, fenghua.yu@intel.com,
	reinette.chatre@intel.com, tglx@linutronix.de, mingo@redhat.com,
	bp@alien8.de, dave.hansen@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev, x86@kernel.org, hpa@zytor.com,
	paulmck@kernel.org, rdunlap@infradead.org, tj@kernel.org,
	seanjc@google.com, kim.phillips@amd.com, babu.moger@amd.com,
	jmattson@google.com, ilpo.jarvinen@linux.intel.com,
	jithu.joseph@intel.com, kan.liang@linux.intel.com, nikunj@amd.com,
	daniel.sneddon@linux.intel.com, pbonzini@redhat.com,
	rick.p.edgecombe@intel.com, rppt@kernel.org,
	maciej.wieczor-retman@intel.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, eranian@google.com,
	peternewman@google.com
Subject: Re: [PATCH 07/15] x86/resctrl: Add support to enable/disable ABMC
 feature
Message-ID: <202312060208.zJLlUr1x-lkp@intel.com>
References: <20231201005720.235639-8-babu.moger@amd.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231201005720.235639-8-babu.moger@amd.com>

Hi Babu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20231130]
[cannot apply to tip/x86/core linus/master v6.7-rc3 v6.7-rc2 v6.7-rc1 v6.7-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Babu-Moger/x86-resctrl-Remove-hard-coded-memory-bandwidth-limit/20231201-090621
base:   next-20231130
patch link:    https://lore.kernel.org/r/20231201005720.235639-8-babu.moger%40amd.com
patch subject: [PATCH 07/15] x86/resctrl: Add support to enable/disable ABMC feature
config: i386-randconfig-141-20231202 (https://download.01.org/0day-ci/archive/20231206/202312060208.zJLlUr1x-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312060208.zJLlUr1x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312060208.zJLlUr1x-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/cpu/resctrl/rdtgroup.c:2419:5: warning: no previous prototype for function 'resctrl_arch_set_abmc_enabled' [-Wmissing-prototypes]
   int resctrl_arch_set_abmc_enabled(enum resctrl_res_level l, bool enable)
       ^
   arch/x86/kernel/cpu/resctrl/rdtgroup.c:2419:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int resctrl_arch_set_abmc_enabled(enum resctrl_res_level l, bool enable)
   ^
   static 
   1 warning generated.


vim +/resctrl_arch_set_abmc_enabled +2419 arch/x86/kernel/cpu/resctrl/rdtgroup.c

  2418	
> 2419	int resctrl_arch_set_abmc_enabled(enum resctrl_res_level l, bool enable)
  2420	{
  2421		struct rdt_hw_resource *hw_res = &rdt_resources_all[l];
  2422	
  2423		if (!hw_res->r_resctrl.abmc_capable)
  2424			return -EINVAL;
  2425	
  2426		if (enable)
  2427			return resctrl_abmc_enable(l);
  2428	
  2429		resctrl_abmc_disable(l);
  2430	
  2431		return 0;
  2432	}
  2433	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

