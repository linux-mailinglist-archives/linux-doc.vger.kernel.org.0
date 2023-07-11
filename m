Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3BBB74F0FC
	for <lists+linux-doc@lfdr.de>; Tue, 11 Jul 2023 16:02:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233099AbjGKOCM (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 11 Jul 2023 10:02:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232798AbjGKOCM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 11 Jul 2023 10:02:12 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41441B0
        for <linux-doc@vger.kernel.org>; Tue, 11 Jul 2023 07:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689084130; x=1720620130;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v2Y9tc1bjtnPJu6bwZnH5SIex5dOJ+HoNwYwEk3hIBY=;
  b=LwgDwC0dz/txE7N+4MC4SQl3gBuRmU+IrASfDeGiTuVi1jWRvdm7mSBn
   TR6DoN5ioc1/k+e/foB1f4AJKNAX3JwP1kDusnDTFxlTvBmvhovJWxxfX
   X0xmsAA52DmRS5/rmRBOm3VPvJZPiJaAxAQ8OJWSv6hpXY0Zl/eqlmv15
   6VK2GTTwVQFa02116ZXO050ic7GaH7atkUhCsnYqU+DQjPhdWrLCAYJxH
   A5bjqqKJn9e/Ed+wte2lYLR933jUfh0v/dL3klnpBfs7zMk3klnDFlj3z
   dOfsqohGyQs+I8kH7flbOSXyK1zUAoA6Ge+bSDpYUH7l+9poLjGgUmUcD
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="344940839"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; 
   d="scan'208";a="344940839"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2023 07:02:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="724447058"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; 
   d="scan'208";a="724447058"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 11 Jul 2023 07:02:04 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qJDwJ-0004qU-1G;
        Tue, 11 Jul 2023 14:02:03 +0000
Date:   Tue, 11 Jul 2023 22:01:27 +0800
From:   kernel test robot <lkp@intel.com>
To:     Steve Jeong <how2soft@gmail.com>
Cc:     oe-kbuild-all@lists.linux.dev, Dongjin Kim <tobetter@gmail.com>,
        linux-doc@vger.kernel.org
Subject: [tobetter:odroid-6.1.y 1/28] drivers/char/rk3568-gpiomem.c:2:
 warning: This comment starts with '/**', but isn't a kernel-doc comment.
 Refer Documentation/doc-guide/kernel-doc.rst
Message-ID: <202307112153.HxNLkhCL-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   https://github.com/tobetter/linux odroid-6.1.y
head:   75d4aa9f650a9465ed7109062e98625502745688
commit: 161dee9509736facbf1906dd1005e70e240389fa [1/28] ODROID-M1: Add /dev/gpiomem device
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20230711/202307112153.HxNLkhCL-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230711/202307112153.HxNLkhCL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307112153.HxNLkhCL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/char/rk3568-gpiomem.c:2: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * GPIO memory device driver


vim +2 drivers/char/rk3568-gpiomem.c

   > 2	 * GPIO memory device driver
     3	 *
     4	 * Creates a chardev /dev/gpiomem which will provide user access to
     5	 * the rk3568's GPIO registers when it is mmap()'d.
     6	 * No longer need root for user GPIO access, but without relaxing permissions
     7	 * on /dev/mem.
     8	 *
     9	 * Written by Luke Wren <luke@raspberrypi.org>
    10	 * Copyright (c) 2015, Raspberry Pi (Trading) Ltd.
    11	 *
    12	 * Redistribution and use in source and binary forms, with or without
    13	 * modification, are permitted provided that the following conditions
    14	 * are met:
    15	 * 1. Redistributions of source code must retain the above copyright
    16	 *    notice, this list of conditions, and the following disclaimer,
    17	 *    without modification.
    18	 * 2. Redistributions in binary form must reproduce the above copyright
    19	 *    notice, this list of conditions and the following disclaimer in the
    20	 *    documentation and/or other materials provided with the distribution.
    21	 * 3. The names of the above-listed copyright holders may not be used
    22	 *    to endorse or promote products derived from this software without
    23	 *    specific prior written permission.
    24	 *
    25	 * ALTERNATIVELY, this software may be distributed under the terms of the
    26	 * GNU General Public License ("GPL") version 2, as published by the Free
    27	 * Software Foundation.
    28	 *
    29	 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
    30	 * IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
    31	 * THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
    32	 * PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
    33	 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
    34	 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
    35	 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
    36	 * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
    37	 * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
    38	 * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
    39	 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
    40	 */
    41	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
