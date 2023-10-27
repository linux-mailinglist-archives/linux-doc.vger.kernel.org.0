Return-Path: <linux-doc+bounces-1293-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1829B7D9408
	for <lists+linux-doc@lfdr.de>; Fri, 27 Oct 2023 11:43:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD1EB282286
	for <lists+linux-doc@lfdr.de>; Fri, 27 Oct 2023 09:43:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FB06168B3;
	Fri, 27 Oct 2023 09:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LGn99Rrl"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6C5156FE
	for <linux-doc@vger.kernel.org>; Fri, 27 Oct 2023 09:43:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 604959C;
	Fri, 27 Oct 2023 02:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698399804; x=1729935804;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sZSvMj+sMmnuJAD1wIn0COel3298HD5DQCZGy+m8TEk=;
  b=LGn99RrlM4cFlsxyjEpLjNWsP/0Vadx0VcoEwtn9mP6eMI05nr4Gla4F
   B4aIUkUi0m3wsNFKvfMihhOjxgmCkRMNueb+X1n0+UlvPd/sUSXMWGKOZ
   ApVrPUi8rBoeGp2uyw5NX6MUgN2X7kzC3wS4KFPjL/mGNepLKiLQtfWDM
   gA5ngQCnlZSeGQFDE+Dx/WEOnZ52tWn8RgVchiczqacgF5CB2AdXFLEFk
   5qUrGq3itPR6iyJEHpokEEh7htUEfKTbNH5bh8jurxs/dFTjUpDjNXSwv
   TEU9g1ohTeaKMRTxCOiI8LphPRaySOIHpx40od4KL1dy/wYqLBc1SbSQ1
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="473983677"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="473983677"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2023 02:43:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="736032673"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="736032673"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 27 Oct 2023 02:43:21 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwJN9-000Ahd-29;
	Fri, 27 Oct 2023 09:43:19 +0000
Date: Fri, 27 Oct 2023 17:42:44 +0800
From: kernel test robot <lkp@intel.com>
To: Aleksa Savic <savicaleksa83@gmail.com>, linux-hwmon@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Aleksa Savic <savicaleksa83@gmail.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: Add driver for Gigabyte AORUS Waterforce AIO
 coolers
Message-ID: <202310271721.sxzJ5Xir-lkp@intel.com>
References: <20231020130212.8919-1-savicaleksa83@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231020130212.8919-1-savicaleksa83@gmail.com>

Hi Aleksa,

kernel test robot noticed the following build warnings:

[auto build test WARNING on groeck-staging/hwmon-next]
[also build test WARNING on linus/master v6.6-rc7 next-20231026]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Aleksa-Savic/hwmon-Add-driver-for-Gigabyte-AORUS-Waterforce-AIO-coolers/20231020-210452
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20231020130212.8919-1-savicaleksa83%40gmail.com
patch subject: [PATCH] hwmon: Add driver for Gigabyte AORUS Waterforce AIO coolers
reproduce: (https://download.01.org/0day-ci/archive/20231027/202310271721.sxzJ5Xir-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310271721.sxzJ5Xir-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/hwmon/gigabyte_waterforce.rst: WARNING: document isn't included in any toctree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

