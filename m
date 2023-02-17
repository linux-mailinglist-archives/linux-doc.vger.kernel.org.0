Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAF5769A35A
	for <lists+linux-doc@lfdr.de>; Fri, 17 Feb 2023 02:20:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229934AbjBQBUC (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 16 Feb 2023 20:20:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229932AbjBQBUC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 16 Feb 2023 20:20:02 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 436155036A
        for <linux-doc@vger.kernel.org>; Thu, 16 Feb 2023 17:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676596800; x=1708132800;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M24xcVZg2BKHXLrAWaKYJFXsGDs1ufnhMunxuSAXSdA=;
  b=HOwELHkMCQU1R/NcyBeF2ETgHnNVfNEhJoE2tIYqbgGih5+/upa9BBKb
   cJvPRabgu3K0VYLEWdItpO/EigEjMrIbzVEkezzFRD660n9sx/82lTxep
   MbxJ7boLdd1V8jM9dnZxMy9/1e53w+H10JMSTcXqqpWyOYrfG8i4eNfM4
   crn9KSKfAeioxXK0i16kjaotKHAdtmes3YiudCc5S8T/70ZE4AY8dg7/3
   PUMOvkIqKTXTSeznvLjHTx1mB6yxQK2m8b7l+qMeS1n7fx2WR9zF9Etf+
   bAY0BVgk6Wybl15iU8Nx8miMU4I9me7vKkbl8hKkc7LlrInZoHAi6EVai
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="312249546"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="312249546"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2023 17:19:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="844398888"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="844398888"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 16 Feb 2023 17:19:55 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pSpPm-000B0n-0m;
        Fri, 17 Feb 2023 01:19:54 +0000
Date:   Fri, 17 Feb 2023 09:19:29 +0800
From:   kernel test robot <lkp@intel.com>
To:     Marc Zyngier <maz@kernel.org>
Cc:     oe-kbuild-all@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
Subject: [arm-platforms:kvm-arm64/timer-vm-offsets 12/17] htmldocs:
 Documentation/virt/kvm/api.rst:5963: WARNING: Block quote ends without a
 blank line; unexpected unindent.
Message-ID: <202302170953.UioMK79b-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/timer-vm-offsets
head:   c9beb39db9bf98e626b6e6abd3c313ed7967aa73
commit: f4bc12951146425e36e4b5bbc8df2c10dd377ea1 [12/17] KVM: arm64: Document KVM_ARM_SET_CNT_OFFSETS and co
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/commit/?id=f4bc12951146425e36e4b5bbc8df2c10dd377ea1
        git remote add arm-platforms https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git
        git fetch --no-tags arm-platforms kvm-arm64/timer-vm-offsets
        git checkout f4bc12951146425e36e4b5bbc8df2c10dd377ea1
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302170953.UioMK79b-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/virt/kvm/api.rst:5963: WARNING: Block quote ends without a blank line; unexpected unindent.

vim +5963 Documentation/virt/kvm/api.rst

  5948	
  5949	This capability indicates that userspace is able to apply a set of
  5950	VM-wide offsets to the virtual and physical counters as viewed by the
  5951	guest using the KVM_ARM_SET_CNT_OFFSETS ioctl and the following data
  5952	structure:
  5953	
  5954		struct kvm_arm_counter_offsets {
  5955			__u64 virtual_offset;
  5956			__u64 physical_offset;
  5957	
  5958		#define KVM_COUNTER_SET_VOFFSET_FLAG   (1UL << 0)
  5959		#define KVM_COUNTER_SET_POFFSET_FLAG   (1UL << 1)
  5960	
  5961			__u64 flags;
  5962			__u64 reserved;
> 5963		};
  5964	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
