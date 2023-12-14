Return-Path: <linux-doc+bounces-5046-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 825938128A8
	for <lists+linux-doc@lfdr.de>; Thu, 14 Dec 2023 08:01:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1523281B83
	for <lists+linux-doc@lfdr.de>; Thu, 14 Dec 2023 07:01:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86285D51C;
	Thu, 14 Dec 2023 07:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f/nG4ztM"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B3D498
	for <linux-doc@vger.kernel.org>; Wed, 13 Dec 2023 23:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702537260; x=1734073260;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FffFyrDqPblMt4ksJNX5nbPAQACX40n9zSviJNipsR8=;
  b=f/nG4ztMVqOXYF3ecrbMrMqUZLIKAshhAJ8fHrb6j7j/VHovO8GdUtrv
   Z3wvw6amVO3VZG8E27EpzuIQ5sr16MeVv5jlePuynKF7f97zYE8eyuUmQ
   VW537eEsy3Fp/6fCbtNq36fuGIZV12EEF3Ml5sZ+IFDy+S00pNcVrRw1W
   vwssF3JaVIKygqGDhodsU+Yik32vwr+Qwe3Uh8I2CH8yJcTLyLbgeN/H0
   JiMq1Lx4Rdx11RFwE6rsJ7crtGZsk+MRRRxCF4vwvTvyixLpBYnMx3q++
   idDpRQMcKu5kfXzm1lz5Z5f+RRdNA/x5yGDd96JiuQKOVK5YBiGjOdNHA
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="2232191"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; 
   d="scan'208";a="2232191"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 23:00:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="892337580"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; 
   d="scan'208";a="892337580"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 13 Dec 2023 23:00:57 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDfiJ-000LiV-1t;
	Thu, 14 Dec 2023 07:00:55 +0000
Date: Thu, 14 Dec 2023 15:00:20 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [intel-tdx:kvm-upstream-next 182/273] htmldocs:
 Documentation/ABI/testing/sysfs-firmware-tdx:2: WARNING: Unexpected
 indentation.
Message-ID: <202312141455.syaL0jxl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-next
head:   90fec84219b5d2bf13e61f02777f6a44ab755bc4
commit: 08596b00bfd68b360732d0a2266c1c845a15e2aa [182/273] x86/virt/tdx: Export TD config params of TDX module via sysfs
reproduce: (https://download.01.org/0day-ci/archive/20231214/202312141455.syaL0jxl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312141455.syaL0jxl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/ABI/testing/sysfs-firmware-tdx:2: WARNING: Unexpected indentation.

vim +2 Documentation/ABI/testing/sysfs-firmware-tdx

   > 2	Date:           March 2023

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

