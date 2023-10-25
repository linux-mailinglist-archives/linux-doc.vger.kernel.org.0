Return-Path: <linux-doc+bounces-1119-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7157D7223
	for <lists+linux-doc@lfdr.de>; Wed, 25 Oct 2023 19:14:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE434281966
	for <lists+linux-doc@lfdr.de>; Wed, 25 Oct 2023 17:14:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6F08522C;
	Wed, 25 Oct 2023 17:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bjZtRaZE"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D86728E31
	for <linux-doc@vger.kernel.org>; Wed, 25 Oct 2023 17:14:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 869A9111
	for <linux-doc@vger.kernel.org>; Wed, 25 Oct 2023 10:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698254061; x=1729790061;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Ny6xNSEH9yC0hhM4SF8A3D/84YwRjvCD7xyVPPDAIAc=;
  b=bjZtRaZEizUXvLvEm//OO+eISCI4uYFwslNBu3eBvURg/4jgEhkyiIMF
   tsjiuF3HyMtAAFKq1DF2AtNlZzLj5XIhQHqxMQQcNRpSxcCsHl9edMUgs
   vnDSMrxjBv25dXCFfVx/XaPk4W6GFPwI4bKjBWHfsclNaYdg7AHMaTpaM
   7lvi3WtXVx0jFf8mqnoZEnvKPsTJFAbOpaq9xv2EipPDwCSsPXO/Nc/Nt
   Ycsd/sUbxcdj5yjqgTgZ4dMNhHg/F+u6vDemaBlKvoAAhSVI8qn9hAnJa
   kaqZyAKDnh2BTcnc34zlvmiicFdT70rz4JiKRh54A5LBY5812Jl2mG48T
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="366703077"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="366703077"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 10:14:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="6917371"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 25 Oct 2023 10:14:11 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qvhSU-00093j-0n;
	Wed, 25 Oct 2023 17:14:18 +0000
Date: Thu, 26 Oct 2023 01:13:23 +0800
From: kernel test robot <lkp@intel.com>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [kabel:turris-omnia-mcu-for-6.7 3/7] htmldocs:
 Documentation/ABI/testing/sysfs-bus-i2c-devices-turris-omnia-mcu:2: WARNING:
 Unexpected indentation.
Message-ID: <202310260149.22peIRke-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kabel/linux.git turris-omnia-mcu-for-6.7
head:   502852dc60f48980862e74d34eade79f4f1c8c54
commit: c1285aed4f394228eaea68bdd478be3a01857afc [3/7] platform: cznic: turris-omnia-mcu: Add support for MCU connected GPIOs
reproduce: (https://download.01.org/0day-ci/archive/20231026/202310260149.22peIRke-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310260149.22peIRke-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/ABI/testing/sysfs-bus-i2c-devices-turris-omnia-mcu:2: WARNING: Unexpected indentation.
>> Documentation/ABI/testing/sysfs-bus-i2c-devices-turris-omnia-mcu:2: WARNING: Block quote ends without a blank line; unexpected unindent.

vim +2 Documentation/ABI/testing/sysfs-bus-i2c-devices-turris-omnia-mcu

   > 2	Date:		November 2023
     3	KernelVersion:	6.7
     4	Contact:	Marek Beh�n <kabel@kernel.org>
     5	Description:	(RW) The front button on the Turris Omnia router can be
     6			configured either to change the intensity of all the LEDs on the
     7			front panel, or to send the press event to the CPU as an
     8			interrupt.
     9	
    10			This file switches between these two modes:
    11			- "mcu" makes the button press event be handled by the MCU to
    12			  change the LEDs panel intensity.
    13			- "cpu" makes the button press event be handled by the CPU.
    14	
    15			Format: %s.
    16	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

