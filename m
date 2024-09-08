Return-Path: <linux-doc+bounces-24740-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F0897047C
	for <lists+linux-doc@lfdr.de>; Sun,  8 Sep 2024 01:22:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B1341F21A93
	for <lists+linux-doc@lfdr.de>; Sat,  7 Sep 2024 23:22:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B08415CD58;
	Sat,  7 Sep 2024 23:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Npqo8Q3Z"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D47166308
	for <linux-doc@vger.kernel.org>; Sat,  7 Sep 2024 23:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725751354; cv=none; b=CdNaVZvWCgt2bNAEzglIvNrmdDT3zvM2xWEmlHX2XU/epdQrnIgmVewvhjJfZ9dEr3b3BRwzwQE3nxEsYfw2nUj+8iQFaAXNE/8BJW8vy2YP1kIJ0D6EIuKzKN8PVJQvO6jN13GNRaJfZAorpRMNd7FqNqHVLKZabtxL4fLEzSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725751354; c=relaxed/simple;
	bh=iLPFVcu+ydDuDP79vRjCNUFFAnq2KBTtpyHLmMVyQY0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S8mhUlxUIibTr1/IG+COeMfJEefbRrhK25uf2vtxbmRvdjuiKMRcsTc0E2qI1fZBP9FAhpK4HdmFnKuJj8CVC1nO2S9JsxbL/D8yNR85Zce8oaNczbzM3lwbPBdYxN9Wt7fDM4uM8cibmorD0j+ROIchmftgmRc5I9zo2gbE++s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Npqo8Q3Z; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725751353; x=1757287353;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iLPFVcu+ydDuDP79vRjCNUFFAnq2KBTtpyHLmMVyQY0=;
  b=Npqo8Q3ZAH4VRqqGTj3q40PwpDQ3rDruIOeUVfUIDGVweqOV8o/9ensQ
   B/EiWo24CUHymtTgphzNfizE4SbUG3GTNVxxTPSWeJA4CNqGvoUoUoJ9Y
   vsLFkHlNh/50qcSTj7RqWdchW2yYO/eYK/X32waTxTkaYL69HtYfjxRxp
   6Lo9KTlovCS0I/VvJ6mKm8fIatMcDZwpFBRrlsXG/vUnQtufvS0PlbeI6
   2FOCXQA/Ilf3vp1ghULBJ9lTB9+Ulds65WdkalJVsqQMXbsLxnpwyDB/q
   Ta1XCAJjKGtR7UZfN+OOMefEgtFkMSC2oiORyXzxZVeb9Tn27/VwvmaIn
   A==;
X-CSE-ConnectionGUID: ojOz8GTcRFi3m04lM9QyBw==
X-CSE-MsgGUID: cPFW/mXiTX6a9VgkvUJmoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11188"; a="24341448"
X-IronPort-AV: E=Sophos;i="6.10,211,1719903600"; 
   d="scan'208";a="24341448"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2024 16:22:33 -0700
X-CSE-ConnectionGUID: eRRe9eEPRl6FK5mTGp60GQ==
X-CSE-MsgGUID: EfdfcVklQNuO8zpZ2DAyfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,211,1719903600"; 
   d="scan'208";a="71252855"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 07 Sep 2024 16:22:31 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sn4lA-000D6N-2p;
	Sat, 07 Sep 2024 23:22:28 +0000
Date: Sun, 8 Sep 2024 07:22:14 +0800
From: kernel test robot <lkp@intel.com>
To: Steve Jeong <how2soft@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Dongjin Kim <tobetter@gmail.com>,
	linux-doc@vger.kernel.org
Subject: [tobetter:odroid-6.6.y 42/82] drivers/char/rk3568-gpiomem.c:2:
 warning: This comment starts with '/**', but isn't a kernel-doc comment.
 Refer Documentation/doc-guide/kernel-doc.rst
Message-ID: <202409080704.MMudSJIX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/tobetter/linux odroid-6.6.y
head:   c970a63609188f53cf758a3dcd395e777150a29a
commit: 905d94c26ec85e35bcc9d727a5c49130603afbb9 [42/82] ODROID-M1: Add /dev/gpiomem device
config: arm64-randconfig-001-20240907 (https://download.01.org/0day-ci/archive/20240908/202409080704.MMudSJIX-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240908/202409080704.MMudSJIX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409080704.MMudSJIX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/char/rk3568-gpiomem.c:2: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * GPIO memory device driver

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts:106.17-110.4: Warning (unit_address_vs_reg): /rk3568-gpiomem: node has a reg or ranges property, but no unit name

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

