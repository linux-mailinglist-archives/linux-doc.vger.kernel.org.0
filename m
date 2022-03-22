Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52C3A4E3A83
	for <lists+linux-doc@lfdr.de>; Tue, 22 Mar 2022 09:24:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231153AbiCVIZp (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 22 Mar 2022 04:25:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231147AbiCVIZo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 22 Mar 2022 04:25:44 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F68865D2;
        Tue, 22 Mar 2022 01:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647937457; x=1679473457;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wB3S8pSPevQh6/8HkfQMLomFq9C3BaSJuM4REr4EMLU=;
  b=oFgXG2G3KXy6mlahubrECrIs/eZgiFfooQbTgJYXhLaX3KeQHmzuJuxg
   vZTXRZjQZj334kXAHaC8idyuDvO0Ege6v8cvUsNybXUv5jRDhjINbBFn8
   Fj0XIdjkMj1MtW0deiUadABDdTqlwqZ0Py+O6V9DsYc0+wTuo/GuKzme9
   7/9rUtf258ViXXJMKyJu85oSKv+ohQ7vdHK6Tn+XHQA8tkp3ovI3wjVC+
   DwdpicOxEBhXUAuRxTKXgVgPkN3tePFdUM5kBGt1HDvTP87fK4ozZm4Rc
   NOey8TWBvbV/oxQRba52fIcRhqQIO8AF9/+fMZRpeOKC++asgVkrbVynd
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10293"; a="344188832"
X-IronPort-AV: E=Sophos;i="5.90,201,1643702400"; 
   d="scan'208";a="344188832"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2022 01:24:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,201,1643702400"; 
   d="scan'208";a="716836990"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 22 Mar 2022 01:24:14 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nWZoL-000IdT-Mr; Tue, 22 Mar 2022 08:24:13 +0000
Date:   Tue, 22 Mar 2022 16:23:28 +0800
From:   kernel test robot <lkp@intel.com>
To:     Atish Patra <atish.patra@wdc.com>
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
        linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
        linux-doc@vger.kernel.org
Subject: [ammarfaizi2-block:palmer/linux/riscv-pmu 13/15]
 drivers/perf/riscv_pmu_sbi.c:498: warning: This comment starts with '/**',
 but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
Message-ID: <202203221658.OweUGgeC-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   https://github.com/ammarfaizi2/linux-block palmer/linux/riscv-pmu
head:   33363c336516e4beb9dd7e8265b369ff96d07dcb
commit: 4905ec2fb7e6421c14c9fb7276f5aa92f60f2b98 [13/15] RISC-V: Add sscofpmf extension support
config: riscv-randconfig-r042-20220320 (https://download.01.org/0day-ci/archive/20220322/202203221658.OweUGgeC-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 85e9b2687a13d1908aa86d1b89c5ce398a06cd39)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/ammarfaizi2/linux-block/commit/4905ec2fb7e6421c14c9fb7276f5aa92f60f2b98
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block palmer/linux/riscv-pmu
        git checkout 4905ec2fb7e6421c14c9fb7276f5aa92f60f2b98
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/perf/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/perf/riscv_pmu_sbi.c:42: warning: cannot understand function prototype: 'union sbi_pmu_ctr_info *pmu_ctr_list; '
>> drivers/perf/riscv_pmu_sbi.c:498: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * This function starts all the used counters in two step approach.


vim +498 drivers/perf/riscv_pmu_sbi.c

   496	
   497	/**
 > 498	 * This function starts all the used counters in two step approach.
   499	 * Any counter that did not overflow can be start in a single step
   500	 * while the overflowed counters need to be started with updated initialization
   501	 * value.
   502	 */
   503	static inline void pmu_sbi_start_overflow_mask(struct riscv_pmu *pmu,
   504						       unsigned long ctr_ovf_mask)
   505	{
   506		int idx = 0;
   507		struct cpu_hw_events *cpu_hw_evt = this_cpu_ptr(pmu->hw_events);
   508		struct perf_event *event;
   509		unsigned long flag = SBI_PMU_START_FLAG_SET_INIT_VALUE;
   510		unsigned long ctr_start_mask = 0;
   511		uint64_t max_period;
   512		struct hw_perf_event *hwc;
   513		u64 init_val = 0;
   514	
   515		ctr_start_mask = cpu_hw_evt->used_hw_ctrs[0] & ~ctr_ovf_mask;
   516	
   517		/* Start all the counters that did not overflow in a single shot */
   518		sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START, 0, ctr_start_mask,
   519			  0, 0, 0, 0);
   520	
   521		/* Reinitialize and start all the counter that overflowed */
   522		while (ctr_ovf_mask) {
   523			if (ctr_ovf_mask & 0x01) {
   524				event = cpu_hw_evt->events[idx];
   525				hwc = &event->hw;
   526				max_period = riscv_pmu_ctr_get_width_mask(event);
   527				init_val = local64_read(&hwc->prev_count) & max_period;
   528				sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START, idx, 1,
   529					  flag, init_val, 0, 0);
   530			}
   531			ctr_ovf_mask = ctr_ovf_mask >> 1;
   532			idx++;
   533		}
   534	}
   535	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
