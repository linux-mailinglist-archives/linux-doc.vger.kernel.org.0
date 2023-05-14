Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC110701BE4
	for <lists+linux-doc@lfdr.de>; Sun, 14 May 2023 08:12:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229834AbjENGM0 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 14 May 2023 02:12:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbjENGM0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 14 May 2023 02:12:26 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0BD519A9
        for <linux-doc@vger.kernel.org>; Sat, 13 May 2023 23:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684044744; x=1715580744;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XTdafPwgBas16MHiS7xiJRLoevcpV6Flt0MNvtSN+GY=;
  b=mKlM55oWO7e6BiqbXSNwTOlbqzIazyilKCF0cBcxURo5PQTWgv12UMOU
   6CgpMZdlFV31Y/vbRtHW8NkhT4W0TnLK/+A/J6a+KyspIPjbOQ7AnHjJZ
   Ja/78WqXxlRHdWZFkrypuZIzxmtQIeJ+/Kt2UQiVD41RGQ2Y+nQmovHwK
   iSz/N5P1rbK3DL3sW+Jjo90qUh+iIjImpQDEWIsAodpisV+92RwRFdxQL
   Va6CeBy7K3L0/+UMtd2eB6BpbY+HOZbCQo8n1M2kn30OnVw0XjUNuZQ6g
   vYx64PQc3LKDnLLJB9wgNpRphpIY3NZKn47cXYIv1kEu4cf3oE+4gOQkq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10709"; a="331383181"
X-IronPort-AV: E=Sophos;i="5.99,273,1677571200"; 
   d="scan'208";a="331383181"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2023 23:12:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10709"; a="678090305"
X-IronPort-AV: E=Sophos;i="5.99,273,1677571200"; 
   d="scan'208";a="678090305"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 13 May 2023 23:12:22 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1py4xx-0005rQ-1R;
        Sun, 14 May 2023 06:12:21 +0000
Date:   Sun, 14 May 2023 14:12:11 +0800
From:   kernel test robot <lkp@intel.com>
To:     Andy Chiu <andy.chiu@sifive.com>
Cc:     oe-kbuild-all@lists.linux.dev,
        Palmer Dabbelt <palmer@rivosinc.com>,
        Greentime Hu <greentime.hu@sifive.com>,
        Vincent Chen <vincent.chen@sifive.com>,
        linux-doc@vger.kernel.org
Subject: [palmer:for-next 24/25] htmldocs: Documentation/riscv/vector.rst:2:
 WARNING: Explicit markup ends without a blank line; unexpected unindent.
Message-ID: <202305141409.bEBvlSY4-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git for-next
head:   aab772f330541c3876484bcff439bb39b2784cf7
commit: 412c68cfeeb178306b945c984f69030f777d7cfd [24/25] riscv: Add documentation for Vector
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git/commit/?id=412c68cfeeb178306b945c984f69030f777d7cfd
        git remote add palmer https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git
        git fetch --no-tags palmer for-next
        git checkout 412c68cfeeb178306b945c984f69030f777d7cfd
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305141409.bEBvlSY4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/riscv/vector.rst:2: WARNING: Explicit markup ends without a blank line; unexpected unindent.
>> Documentation/riscv/vector.rst:45: WARNING: Definition list ends without a blank line; unexpected unindent.

vim +2 Documentation/riscv/vector.rst

   > 2	=========================================
     3	Vector Extension Support for RISC-V Linux
     4	=========================================
     5	
     6	This document briefly outlines the interface provided to userspace by Linux in
     7	order to support the use of the RISC-V Vector Extension.
     8	
     9	1.  prctl() Interface
    10	---------------------
    11	
    12	Two new prctl() calls are added to allow programs to manage the enablement
    13	status for the use of Vector in userspace:
    14	
    15	prctl(PR_RISCV_V_SET_CONTROL, unsigned long arg)
    16	
    17	    Sets the Vector enablement status of the calling thread, where the control
    18	    argument consists of two 2-bit enablement statuses and a bit for inheritance
    19	    model. Other threads of the calling process are unaffected.
    20	
    21	    Enablement status is a tri-state value each occupying 2-bit of space in
    22	    the control argument:
    23	
    24	    * :c:macro:`PR_RISCV_V_VSTATE_CTRL_DEFAULT`: Use the system-wide default
    25	      enablement status on execve(). The system-wide default setting can be
    26	      controlled via sysctl interface (see sysctl section below).
    27	
    28	    * :c:macro:`PR_RISCV_V_VSTATE_CTRL_ON`: Allow Vector to be run for the
    29	      thread.
    30	
    31	    * :c:macro:`PR_RISCV_V_VSTATE_CTRL_OFF`: Disallow Vector. Executing Vector
    32	      instructions under such condition will trap and casuse the termination of the thread.
    33	
    34	    arg: The control argument is a 5-bit value consisting of 3 parts, which can
    35	    be interpreted as the following structure, and accessed by 3 masks
    36	    respectively.
    37	
    38	    struct control_argument {
    39	        // Located by PR_RISCV_V_VSTATE_CTRL_CUR_MASK
    40	        int current_enablement_status : 2;
    41	        // Located by PR_RISCV_V_VSTATE_CTRL_NEXT_MASK
    42	        int next_enablement_status : 2;
    43	        // Located by PR_RISCV_V_VSTATE_CTRL_INHERIT
    44	        bool inherit_mode : 1;
  > 45	    }
    46	
    47	    The 3 masks, PR_RISCV_V_VSTATE_CTRL_CUR_MASK,
    48	    PR_RISCV_V_VSTATE_CTRL_NEXT_MASK, and PR_RISCV_V_VSTATE_CTRL_INHERIT
    49	    represents bit[1:0], bit[3:2], and bit[4] respectively. bit[1:0] and
    50	    accounts for the enablement status of current thread, and bit[3:2] the
    51	    setting for when next execve() happens. bit[4] defines the inheritance model
    52	    of the setting in bit[3:2]
    53	
    54	        * :c:macro:`PR_RISCV_V_VSTATE_CTRL_CUR_MASK`: bit[1:0]: Account for the
    55	          Vector enablement status for the calling thread. The calling thread is
    56	          not able to turn off Vector once it has been enabled. The prctl() call
    57	          fails with EPERM if the value in this mask is PR_RISCV_V_VSTATE_CTRL_OFF
    58	          but the current enablement status is not off. Setting
    59	          PR_RISCV_V_VSTATE_CTRL_DEFAULT here takes no effect but to set back
    60	          the original enablement status.
    61	
    62	        * :c:macro:`PR_RISCV_V_VSTATE_CTRL_NEXT_MASK`: bit[3:2]: Account for the
    63	          Vector enablement setting for the calling thread at the next execve()
    64	          system call. If PR_RISCV_V_VSTATE_CTRL_DEFAULT is used in this mask,
    65	          then the enablement status will be decided by the system-wide
    66	          enablement status when execve() happen.
    67	
    68	        * :c:macro:`PR_RISCV_V_VSTATE_CTRL_INHERIT`: bit[4]: the inheritance
    69	          model for the setting at PR_RISCV_V_VSTATE_CTRL_NEXT_MASK. If the bit
    70	          is set then the following execve() will not clear the setting in both
    71	          PR_RISCV_V_VSTATE_CTRL_NEXT_MASK and PR_RISCV_V_VSTATE_CTRL_INHERIT.
    72	          This setting persists across changes in the system-wide default value.
    73	
    74	    Return value: return 0 on success, or a negative error value:
    75	        EINVAL: Vector not supported, invalid enablement status for current or
    76	                next mask
    77	        EPERM: Turning off Vector in PR_RISCV_V_VSTATE_CTRL_CUR_MASK if Vector
    78	                was enabled for the calling thread.
    79	
    80	    On success:
    81	        * A valid setting for PR_RISCV_V_VSTATE_CTRL_CUR_MASK takes place
    82	          immediately. The enablement status specified in
    83	          PR_RISCV_V_VSTATE_CTRL_NEXT_MASK happens at the next execve() call, or
    84	          all following execve() calls if PR_RISCV_V_VSTATE_CTRL_INHERIT bit is
    85	          set.
    86	        * Every successful call overwrites a previous setting for the calling
    87	          thread.
    88	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
