Return-Path: <linux-doc+bounces-4929-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D95810FBD
	for <lists+linux-doc@lfdr.de>; Wed, 13 Dec 2023 12:23:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D4C91F211F3
	for <lists+linux-doc@lfdr.de>; Wed, 13 Dec 2023 11:23:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47F4B2377E;
	Wed, 13 Dec 2023 11:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nvkSHpZu"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5638BA0;
	Wed, 13 Dec 2023 03:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702466592; x=1734002592;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EFKlP2H/rVAQxxvmv92h/YY7+JQJiLeLpwP988CiQ8I=;
  b=nvkSHpZuIvP5VIr94JZomr2SZvU1/Oa0k0gYKu3/m2xO7RM128OuSkxw
   DYHktUpNv7hToGxLBSXHq/2Y4YmEl/IkBLtvLV14Sttd+OzVyQpe+obpW
   F9xeBfi4Hs8csOwAefnD0lFdvurTRwnRhbVDwirJHFJF1XJr0zPA4Exii
   sW0PYA5EU35JDhef73nqJXZuj9UKG18mK5rX2WDp/CgzEHeAN5/OadFuM
   zDcdeaU/aX+cMrKjMhPI6jIkcDBUXz8PreZ9LGyrH5HTd6X0w78m15a99
   7CDzMxM9AFfJfqGqwEl4KxSygDzBVb0drPQmA3yog9lsLNpIfLVGTUzn6
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="394701081"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="394701081"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 03:23:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="802851000"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="802851000"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 13 Dec 2023 03:23:04 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDNKP-000KTb-1L;
	Wed, 13 Dec 2023 11:23:01 +0000
Date: Wed, 13 Dec 2023 19:22:33 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Graf <graf@amazon.com>, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-trace-kernel@vger.kernel.org, linux-mm@kvack.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kexec@lists.infradead.org, linux-doc@vger.kernel.org,
	x86@kernel.org, Eric Biederman <ebiederm@xmission.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Ashish Kalra <ashish.kalra@amd.com>,
	James Gowans <jgowans@amazon.com>,
	Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>,
	arnd@arndb.de, pbonzini@redhat.com, madvenka@linux.microsoft.com,
	Anthony Yznaga <anthony.yznaga@oracle.com>,
	Usama Arif <usama.arif@bytedance.com>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH 06/15] arm64: Add KHO support
Message-ID: <202312131958.BJ7skdaN-lkp@intel.com>
References: <20231213000452.88295-7-graf@amazon.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231213000452.88295-7-graf@amazon.com>

Hi Alexander,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/x86/core]
[also build test WARNING on arm64/for-next/core akpm-mm/mm-everything linus/master v6.7-rc5 next-20231213]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexander-Graf/mm-memblock-Add-support-for-scratch-memory/20231213-080941
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/20231213000452.88295-7-graf%40amazon.com
patch subject: [PATCH 06/15] arm64: Add KHO support
config: i386-buildonly-randconfig-001-20231213 (https://download.01.org/0day-ci/archive/20231213/202312131958.BJ7skdaN-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231213/202312131958.BJ7skdaN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312131958.BJ7skdaN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/of/fdt.c:1012:13: warning: no previous prototype for function 'early_init_dt_check_kho' [-Wmissing-prototypes]
   void __init early_init_dt_check_kho(void)
               ^
   drivers/of/fdt.c:1012:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __init early_init_dt_check_kho(void)
   ^
   static 
   1 warning generated.


vim +/early_init_dt_check_kho +1012 drivers/of/fdt.c

  1008	
  1009	/**
  1010	 * early_init_dt_check_kho - Decode info required for kexec handover from DT
  1011	 */
> 1012	void __init early_init_dt_check_kho(void)
  1013	{
  1014	#ifdef CONFIG_KEXEC_KHO
  1015		unsigned long node = chosen_node_offset;
  1016		u64 kho_start, scratch_start, scratch_size, mem_start, mem_size;
  1017		const __be32 *p;
  1018		int l;
  1019	
  1020		if ((long)node < 0)
  1021			return;
  1022	
  1023		p = of_get_flat_dt_prop(node, "linux,kho-dt", &l);
  1024		if (l != (dt_root_addr_cells + dt_root_size_cells) * sizeof(__be32))
  1025			return;
  1026	
  1027		kho_start = dt_mem_next_cell(dt_root_addr_cells, &p);
  1028	
  1029		p = of_get_flat_dt_prop(node, "linux,kho-scratch", &l);
  1030		if (l != (dt_root_addr_cells + dt_root_size_cells) * sizeof(__be32))
  1031			return;
  1032	
  1033		scratch_start = dt_mem_next_cell(dt_root_addr_cells, &p);
  1034		scratch_size = dt_mem_next_cell(dt_root_addr_cells, &p);
  1035	
  1036		p = of_get_flat_dt_prop(node, "linux,kho-mem", &l);
  1037		if (l != (dt_root_addr_cells + dt_root_size_cells) * sizeof(__be32))
  1038			return;
  1039	
  1040		mem_start = dt_mem_next_cell(dt_root_addr_cells, &p);
  1041		mem_size = dt_mem_next_cell(dt_root_addr_cells, &p);
  1042	
  1043		kho_populate(kho_start, scratch_start, scratch_size, mem_start, mem_size);
  1044	#endif
  1045	}
  1046	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

