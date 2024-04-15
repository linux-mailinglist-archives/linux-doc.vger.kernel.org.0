Return-Path: <linux-doc+bounces-14138-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C108A4764
	for <lists+linux-doc@lfdr.de>; Mon, 15 Apr 2024 06:18:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C16D1F215B3
	for <lists+linux-doc@lfdr.de>; Mon, 15 Apr 2024 04:18:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E08517547;
	Mon, 15 Apr 2024 04:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BWOAli5B"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22B01C6BD
	for <linux-doc@vger.kernel.org>; Mon, 15 Apr 2024 04:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713154731; cv=none; b=hOJJJOFPqGpjVxeA8RqHYw9SY8+Pa51Z3U9bY+PyBl/u5FOfh7q1JaCdKOGgkqIjsS8fwml7DISBGOXF5hs8BeaHrVxYmyZQ68v3zjgsRuNbwlYLjS8kNb2ii7+M8JOnZIi+9CGJOEmR6NvmUl3h+UtSOgFmfuJ0Jn8PpBbiK7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713154731; c=relaxed/simple;
	bh=mJvE/MjQ0XBxS0+v7Ptz6dVPr7TUMzZI+MYZCOxG43k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rWKkOZhWv4ZvKbUZT9uBUhxEDud3b6Mv88uFL+H6xVPQAnCi8bcxe96t5w4QLAvar2apeqnCMSbdSAhtOgYZO9/RzI06Gcj00WZSwnFnPjCU0utHUl4z93ax3nBo5fOx49XyK+uA3l7M7K0WRUUdRdWpX/J3rkEDyexEjhJxnyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BWOAli5B; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713154729; x=1744690729;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mJvE/MjQ0XBxS0+v7Ptz6dVPr7TUMzZI+MYZCOxG43k=;
  b=BWOAli5BaqlxGu7u56s3DEU+ddBa+3drSCcJiHn6WSKfrDQMrcxlZvVv
   p5t3zSbG07iMPrvAbzdxBA9Z2lcHtvV088pcFKFjfMTK4IKRArVRoOKSK
   Uf74hcs3EUSsL/+Mt9BFX1lK3WGlDn9W9m9mEEdRVKhl/UR6hVe4sJvDD
   xrFW+45nPAr2Sl2VjxlVz+2c3CWm6r2Flqk/p1NilzYBFxSme5viIiDrD
   CWsQ+9ThYdNSf3L/O5urYk+/9V7I3hbm4PYTjXTb87ckpm9wVQzil/9nB
   06cMrawsy+8OE/0c9Lz7697puKE4z8UDDPZQiqYgGkuqZzcGmZH/0eUBA
   Q==;
X-CSE-ConnectionGUID: dHNlL1l0QhSTloalPqZTAQ==
X-CSE-MsgGUID: 3klz4fHIQH+fevW5NJeetg==
X-IronPort-AV: E=McAfee;i="6600,9927,11044"; a="11477743"
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; 
   d="scan'208";a="11477743"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2024 21:18:48 -0700
X-CSE-ConnectionGUID: Obf4e+VsTMKK6VufwVR+mw==
X-CSE-MsgGUID: qIxC5G6jTCaGtlv2LhSpKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; 
   d="scan'208";a="21884564"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 14 Apr 2024 21:18:47 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwDno-0003yG-2z;
	Mon, 15 Apr 2024 04:18:44 +0000
Date: Mon, 15 Apr 2024 12:17:47 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Bulwahn <lbulwahn@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
	linux-doc@vger.kernel.org
Subject: [broonie-ci:fileY2I0bM 27/28] htmldocs: Warning: MAINTAINERS
 references a file that doesn't exist:
 Documentation/devicetree/bindings/sound/ti,pcm1681.yaml
Message-ID: <202404151225.icWrM668-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git fileY2I0bM
head:   770e3da3fe7ee7ffca745b7ac300ce39fe40f465
commit: 82116e539ffb7ce0c317c208d53d2126cdcee687 [27/28] MAINTAINERS: adjust file entry in TEXAS INSTRUMENTS AUDIO (ASoC/HDA) DRIVERS
reproduce: (https://download.01.org/0day-ci/archive/20240415/202404151225.icWrM668-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404151225.icWrM668-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/power/wakeup-source.txt references a file that doesn't exist: Documentation/devicetree/bindings/input/qcom,pm8xxx-keypad.txt
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/devicetree/bindings/sound/fsl-asoc-card.txt references a file that doesn't exist: Documentation/devicetree/bindings/sound/fsl,asrc.txt
   Warning: Documentation/gpu/amdgpu/display/display-contributing.rst references a file that doesn't exist: Documentation/GPU/amdgpu/display/mpo-overview.rst
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/sound/ti,pcm1681.yaml
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

