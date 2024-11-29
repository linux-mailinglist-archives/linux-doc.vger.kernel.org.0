Return-Path: <linux-doc+bounces-30962-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D829D02AD
	for <lists+linux-doc@lfdr.de>; Sun, 17 Nov 2024 10:57:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6DADE1F22182
	for <lists+linux-doc@lfdr.de>; Sun, 17 Nov 2024 09:57:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C8197DA81;
	Sun, 17 Nov 2024 09:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SkkSI4TZ"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651028172D
	for <linux-doc@vger.kernel.org>; Sun, 17 Nov 2024 09:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731837442; cv=none; b=PpYG7VD4UROOQLiY8ldsd2nFMVTLP9bDeE8Hu1Qd21Nd8Q9URfseFwpaXV0yXalX7sxd2JjCEiu+ao/3LBzvBrjSm1jgfBsikO/KdIoDxInPihkolLF+BewOoSR00Tc4CcXAM39yV7JMK6+2leq9OM6n4HWqDymLqG53gqLHr84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731837442; c=relaxed/simple;
	bh=hM7AY1bTRcM/SrC0LG34RoMZzjI4fI5bKLkkcZAI/sI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KWgMYS25C8FmfgQcelgvjHXYhvI0/6HLXeeqsGHSovt3Fk/OgQ8zFPjl7E5jT3MBpp3rC4B6ApfoNI2gu68Irj+Opu2f/CNiWg3k2q80bk1OtLNIqXvklNp0CvyMKoRdDk2p97nVsVIL+MvP5Z5tIKkuvDsydSLAoXr1BL0+Qsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SkkSI4TZ; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731837440; x=1763373440;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hM7AY1bTRcM/SrC0LG34RoMZzjI4fI5bKLkkcZAI/sI=;
  b=SkkSI4TZ8SvQjqGI0mTVioVtKRWjDhDszdGbiWt4i5j7Vc76rtC3THKV
   UkiJOnMtuY4MV9JzOIwWX8yNb+CxnVoZMgt6YYWGitMEOH+Yl4B4ldb73
   PLnlm0ThVDOZAJpOYrT76EJRFxvmRO0/RYtUPy+zYqCyW/POfrUokJPG/
   f7WD18kz0zcSFD0AMmOkty+L6Uh7GhtruilYn+G8sJEM+bhPgufGvu6x2
   tdGRC0QceS01XjN8qE4KM7L2cEZragF+roM3sR9Jarg521knY+H91WGBO
   ORQLGuO3MW0Bnp1VeM4d7rnKknJBgixQEMJmorAb/e6DHRZk7cAicr06U
   g==;
X-CSE-ConnectionGUID: 3iduqFl/TSOXIfnG/6Sdbg==
X-CSE-MsgGUID: KdhmmV9XT1W0WqKJUlLY4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="31934669"
X-IronPort-AV: E=Sophos;i="6.12,161,1728975600"; 
   d="scan'208";a="31934669"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2024 01:57:19 -0800
X-CSE-ConnectionGUID: IaPNRyfdRg6NREfAxiHZzg==
X-CSE-MsgGUID: XfbDTlp2SMuY1Thrf4sc/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,161,1728975600"; 
   d="scan'208";a="88532165"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 17 Nov 2024 01:57:17 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCc1r-0001ft-1u;
	Sun, 17 Nov 2024 09:57:15 +0000
Date: Sun, 17 Nov 2024 17:57:01 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-doc@vger.kernel.org
Subject: [asahilinux:bits/200-dcp 125/218]
 drivers/mux/apple-display-crossbar.c:44: warning: This comment starts with
 '/**', but isn't a kernel-doc comment. Refer
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202411171718.2y9xDY4e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/200-dcp
head:   a65bdcfc0da6b2f34db5d36d98849f3145bcf145
commit: 67d162cd659da254345747b0153aca130e6b2b68 [125/218] mux: apple dp crossbar: Support t602x DP cross bar variant
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20241117/202411171718.2y9xDY4e-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241117/202411171718.2y9xDY4e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411171718.2y9xDY4e-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mux/apple-display-crossbar.c:44: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * T8013, T600x, T8112 dp crossbar registers.


vim +44 drivers/mux/apple-display-crossbar.c

    42	
    43	/**
  > 44	 * T8013, T600x, T8112 dp crossbar registers.
    45	 */
    46	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

