Return-Path: <linux-doc+bounces-34833-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0BAA09BCF
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jan 2025 20:25:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A866916B1B5
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jan 2025 19:25:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E8A0212FB9;
	Fri, 10 Jan 2025 19:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NUUkqard"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73CF324B240;
	Fri, 10 Jan 2025 19:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736537100; cv=none; b=X0E1qH8yCk798YPl9hhtNPgrWKydfZFmliN6vVXJ8muYVTKtHJcY9OJyPO9DfToL044RzqsMH/+gVvTZgEJmD9ZZPAOOrwTG67mgHGRDSyNh5p4Tb8zWz5hTE0noq5Reou2+mlhP8f7a/tEf8JZwpMyjhzcS4Hs38rN8wb67Jj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736537100; c=relaxed/simple;
	bh=504AMZ+Vo4ZnssU/VHuo6RZPX5vtoGJsLAXuYnSARtk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O+EvmwbGkP85DsrCxA7vtvno5tUSWefU1D6mmbyLWRt1wqAWMb/Dd8/RVzgqQ24eOFb+GJ70q8k4ZaLW0Bq3eu8D6xwsSAmbDmWfI9zMhjZzkz71OMVMEjXOn9I/+FYtkHDZvr953BXIikv0y0+ZGDBbRUFj0Zif3gjrxS5a0fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NUUkqard; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736537098; x=1768073098;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=504AMZ+Vo4ZnssU/VHuo6RZPX5vtoGJsLAXuYnSARtk=;
  b=NUUkqarddR45vq20DcekRLfd4dpQwpn9RsHCYqsvRkQg/KiU3sBvjK4z
   XzhVn40PZSlTeoaTjufVz9RFK+HM/E+ZIentQ8LDAioxTTzgPMBIawYZZ
   a+mD9X32WucVZRGDfzhz9R6uHk0kA5AlaJ7Lf95zF4JMNC9l/0PZv1oqS
   cLlRKTo1V9vdBmazCIVPpnaHLbTGzommdHM9j1El8iZed5N/XqC9eIPFc
   Hnu7spfS5RxDYrFgo1iFlRcZmN0sJozzAyFNDaMEVCdo1S61QVapj/crI
   HFoZKQoEA97KpnNSNJwR0aOdHVrDvU+/oMPQ0xuw/OrXdeQxj1Vq5++7X
   g==;
X-CSE-ConnectionGUID: DDgtne8pTGao/35sg208fA==
X-CSE-MsgGUID: cM280+FmTuCa5gJfHEJ1yA==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="47501768"
X-IronPort-AV: E=Sophos;i="6.12,305,1728975600"; 
   d="scan'208";a="47501768"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 11:24:57 -0800
X-CSE-ConnectionGUID: s1enOwdRQpCIui1IfmmQ5w==
X-CSE-MsgGUID: U7642DnUT1OswzWesCWv2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,305,1728975600"; 
   d="scan'208";a="108730413"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 10 Jan 2025 11:24:53 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWKck-000JfX-1Z;
	Fri, 10 Jan 2025 19:24:50 +0000
Date: Sat, 11 Jan 2025 03:24:34 +0800
From: kernel test robot <lkp@intel.com>
To: Yoshihiro Furudera <fj5100bi@fujitsu.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Bjorn Andersson <andersson@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 2/2] perf: Fujitsu: Add the Uncore PCI PMU driver
Message-ID: <202501110253.sgjIluLA-lkp@intel.com>
References: <20250109054544.2342442-3-fj5100bi@fujitsu.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109054544.2342442-3-fj5100bi@fujitsu.com>

Hi Yoshihiro,

kernel test robot noticed the following build errors:

[auto build test ERROR on arm-perf/for-next/perf]
[also build test ERROR on linus/master v6.13-rc6 next-20250110]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yoshihiro-Furudera/perf-Fujitsu-Add-the-Uncore-MAC-PMU-driver/20250109-135249
base:   https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git for-next/perf
patch link:    https://lore.kernel.org/r/20250109054544.2342442-3-fj5100bi%40fujitsu.com
patch subject: [PATCH v3 2/2] perf: Fujitsu: Add the Uncore PCI PMU driver
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20250111/202501110253.sgjIluLA-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501110253.sgjIluLA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501110253.sgjIluLA-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/perf/fujitsu_pci_pmu.c: In function 'fujitsu_pci_counter_start':
>> drivers/perf/fujitsu_pci_pmu.c:41:31: error: implicit declaration of function 'FIELD_GET' [-Wimplicit-function-declaration]
      41 | #define EVSEL(__val)          FIELD_GET(PCI_EVTYPE_MASK, __val)
         |                               ^~~~~~~~~
   drivers/perf/fujitsu_pci_pmu.c:100:24: note: in expansion of macro 'EVSEL'
     100 |         writeq_relaxed(EVSEL(event->attr.config), pcipmu->regs + PCI_PM_EVTYPE(idx));
         |                        ^~~~~


vim +/FIELD_GET +41 drivers/perf/fujitsu_pci_pmu.c

    39	
    40	/* PCI_PM_EVTYPEx */
  > 41	#define EVSEL(__val)          FIELD_GET(PCI_EVTYPE_MASK, __val)
    42	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

