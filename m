Return-Path: <linux-doc+bounces-2182-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5888A7E8E0D
	for <lists+linux-doc@lfdr.de>; Sun, 12 Nov 2023 04:06:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D82B6B209B0
	for <lists+linux-doc@lfdr.de>; Sun, 12 Nov 2023 03:06:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51BF510F9;
	Sun, 12 Nov 2023 03:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HVIJVfyy"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F29B1842
	for <linux-doc@vger.kernel.org>; Sun, 12 Nov 2023 03:06:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2848273F
	for <linux-doc@vger.kernel.org>; Sat, 11 Nov 2023 19:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699758384; x=1731294384;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0/GZmiUQZLT7N6gdo7RPtuMbqt26CGD1zlfcqvoI/V8=;
  b=HVIJVfyy+gMtalirwcqvKWqCoUzEcH5nzU4DyxZWdVKbFGwwIlZ5B5Uo
   RnPa77Nr/bpyiyNdwRVInQU21SQFl+Aa06Hp6CvPp9p2otmQWmo3vN4Da
   pfuhNhUC0DUnX9IcHc9bDJlOb2TLI3Te4bXn0OgKsgj8zNn8WiXWGJNSW
   Pgv+Ym3tewOdrEMxY312vcgmFSy8nciOAop52qgBwkzDCgc84PM31QV4G
   nazrvTgWLRscvLQCb6ZwFblKovKYp1OfQObWym2JyqTgesD4zjV8MSAkb
   c069GkUcsQ23pv2WsZiAqhG1YlfpX/gjnzHNxKpsRNVosVIgZXuSSgvXS
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="421404216"
X-IronPort-AV: E=Sophos;i="6.03,296,1694761200"; 
   d="scan'208";a="421404216"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2023 19:06:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="793144761"
X-IronPort-AV: E=Sophos;i="6.03,296,1694761200"; 
   d="scan'208";a="793144761"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 11 Nov 2023 19:06:22 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r20nj-000AuT-1i;
	Sun, 12 Nov 2023 03:06:19 +0000
Date: Sun, 12 Nov 2023 11:06:16 +0800
From: kernel test robot <lkp@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, intel-xe@lists.freedesktop.org,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Riana Tauro <riana.tauro@intel.com>,
	Andi Shyti <andi.shyti@linux.intel.com>, linux-doc@vger.kernel.org
Subject: [drm-xe:drm-xe-next 1711/1931] htmldocs: Warning:
 /sys/devices/.../hwmon/hwmon<i>/energy1_input is defined 2 times:
  ./Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon:54
  ./Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon:65
Message-ID: <202311121142.MtDMs0cZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
head:   edeb8b8fa330a62d4a07b37d08145d86114bc151
commit: 0cad162e5ce80387307564245d60722d97d9eaa5 [1711/1931] drm/xe/hwmon: Expose hwmon energy attribute
reproduce: (https://download.01.org/0day-ci/archive/20231112/202311121142.MtDMs0cZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311121142.MtDMs0cZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: /sys/devices/.../hwmon/hwmon<i>/energy1_input is defined 2 times:  ./Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon:54  ./Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon:65

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

