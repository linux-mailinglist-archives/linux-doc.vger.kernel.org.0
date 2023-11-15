Return-Path: <linux-doc+bounces-2171-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 197B67E8B0C
	for <lists+linux-doc@lfdr.de>; Sat, 11 Nov 2023 14:33:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 440741C20506
	for <lists+linux-doc@lfdr.de>; Sat, 11 Nov 2023 13:33:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6916314AA9;
	Sat, 11 Nov 2023 13:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sp3/6JzE"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A90E14AB0
	for <linux-doc@vger.kernel.org>; Sat, 11 Nov 2023 13:33:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05E9F3868
	for <linux-doc@vger.kernel.org>; Sat, 11 Nov 2023 05:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699709590; x=1731245590;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6D1Q7j+Nf7iqC0LnVVnrA9iEwQ+/WRP+cKlLfcQbai4=;
  b=Sp3/6JzEd1wpvHUQG8lB+TddSJ8Mqa/MIO+BbywAXNVb0epo9BC+i3/8
   p+GI6MD8297ixJeAQb6irdsqXbUSQMZvdcqsqk67OdW8TS/M2r3ABrnNh
   tK305TsSTL/bTtqgKFZouQen2ELEUubK3K0LvlP6T73P/XCrYOHFQyaev
   KpC4iqeHkvJf07EG2anLwQ8hAjdZRK5elhwziL0YwaOXySPkhteUOymCC
   Wtcln2OFEAWlFMu6zhG+ewWu339/BwoKGsZCoI2eiO8lcgKYI9nhFXZyB
   OgSXr8bUQZSunK2zicGH/UCTAlaLrwDDZSzGBGOGcNQO1CHIMXC8hl8E2
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="456771930"
X-IronPort-AV: E=Sophos;i="6.03,295,1694761200"; 
   d="scan'208";a="456771930"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2023 05:33:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="887550877"
X-IronPort-AV: E=Sophos;i="6.03,295,1694761200"; 
   d="scan'208";a="887550877"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 11 Nov 2023 05:33:06 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1o6h-000ATk-33;
	Sat, 11 Nov 2023 13:33:03 +0000
Date: Sat, 11 Nov 2023 21:32:44 +0800
From: kernel test robot <lkp@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, intel-xe@lists.freedesktop.org,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Riana Tauro <riana.tauro@intel.com>,
	Andi Shyti <andi.shyti@linux.intel.com>, linux-doc@vger.kernel.org
Subject: [drm-xe:drm-xe-next 1709/1927] htmldocs: Warning:
 /sys/devices/.../hwmon/hwmon<i>/curr1_crit is defined 2 times:
  ./Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon:35
  ./Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon:52
Message-ID: <202311112157.QOcNbbvO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
head:   b3890fb4386dcef68a96888141c4cc773f6241ce
commit: 052cd881aa7a198a510bbbd94fd1859c497c75f8 [1709/1927] drm/xe/hwmon: Expose card reactive critical power
reproduce: (https://download.01.org/0day-ci/archive/20231111/202311112157.QOcNbbvO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311112157.QOcNbbvO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: /sys/devices/.../hwmon/hwmon<i>/curr1_crit is defined 2 times:  ./Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon:35  ./Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon:52
>> Warning: /sys/devices/.../hwmon/hwmon<i>/power1_crit is defined 2 times:  ./Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon:22  ./Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon:39

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

