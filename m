Return-Path: <linux-doc+bounces-33361-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DAB9F838B
	for <lists+linux-doc@lfdr.de>; Thu, 19 Dec 2024 19:51:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 13AFF16A0D5
	for <lists+linux-doc@lfdr.de>; Thu, 19 Dec 2024 18:50:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C63219C54A;
	Thu, 19 Dec 2024 18:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b0eoG1na"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AACD19994F
	for <linux-doc@vger.kernel.org>; Thu, 19 Dec 2024 18:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734634245; cv=none; b=t2m1PebnpCcmpn5zAYK6y/VX0NdUqvffE9IR7Qu6Wowr+1uRJrVk8JqdN7mle8AW1YUdBIhiczKXPyLunhbn66ZQn+l1Zu56Bx+v8FQpviIxJ1EToZSIS8HatRy7+MnS2p4IbFAsz95SsPgsD/vSEGibFaEW4+/198IAtBS0+AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734634245; c=relaxed/simple;
	bh=4I31HWlidqWgdH+ck/BTx1grBmMgFGdOgayeGSynJ4s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MU/XS14BeVgY3WHuFwQxWM5mFR8XzTdrY/ytsVtaAiMpxJsudO+GWVfxQ3S20uj2hmmgYHk6q48LRuBWtNOqO09epiXGU4xcI+CglzrPnrfr4kp6CTXp2pI3JNT/WBYlwpYnbBKMdpfDPcSFEYQs1jPBHCExzHkgAEL43TvJ5ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b0eoG1na; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734634243; x=1766170243;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4I31HWlidqWgdH+ck/BTx1grBmMgFGdOgayeGSynJ4s=;
  b=b0eoG1naZA2IBhrxR3kKuverkG96r1GErEu2aixd3EVU1j74VnnYXOS1
   14gXOn+un44jo8Yv3L0MeSaxVuSoS85/gLp7zJvIqR5vFkDCnB38YRpgA
   VHjBagNPAVjqKWgvY4VBi21IYSJopCijeqlQhTNOo2S67lvcpdzASpo+n
   Q8fiGPzPo+rV1INc32NezcXn807bAMpvSdjnXw2KzBgTBXnWRuY+On/f8
   90lnpYdIy/gWhT9E/V7267Zp9b2Th6B3GXSNI+k/34y3TJX7uYLgl4zHk
   4rc+C/UI3FEPMkpeAvy1e9613UCum3Kdh6+D9SW8+K0rsm80TLuPJYULN
   g==;
X-CSE-ConnectionGUID: vZfIV+TWQxiGA4vXFjkLfA==
X-CSE-MsgGUID: NfGxsbTNS0eGcaAD0ewMkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="52692982"
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; 
   d="scan'208";a="52692982"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 10:50:42 -0800
X-CSE-ConnectionGUID: IxX+2GVYTKSHPqkyqwhBLA==
X-CSE-MsgGUID: EBp68YWNT8a5aXLXVKwowg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="135612540"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 19 Dec 2024 10:50:41 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOLba-0000Rn-32;
	Thu, 19 Dec 2024 18:50:38 +0000
Date: Fri, 20 Dec 2024 02:49:38 +0800
From: kernel test robot <lkp@intel.com>
To: David Lechner <dlechner@baylibre.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	linux-doc@vger.kernel.org
Subject: [jic23-iio:testing 93/93] htmldocs: Warning:
 /sys/bus/iio/devices/iio:deviceX/in_currentY_raw is defined 2 times:
  ./Documentation/ABI/testing/sysfs-bus-iio:170
  ./Documentation/ABI/testing/sysfs-bus-iio:1700
Message-ID: <202412200256.OB5Hmw5Q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi David,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
head:   09459967e775f758f42e09b2540c993061089327
commit: 09459967e775f758f42e09b2540c993061089327 [93/93] iio: ABI: use Y consistently as channel number
reproduce: (https://download.01.org/0day-ci/archive/20241220/202412200256.OB5Hmw5Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412200256.OB5Hmw5Q-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/ja_JP/SubmittingPatches references a file that doesn't exist: linux-2.6.12-vanilla/Documentation/dontdiff
   Warning: Documentation/userspace-api/netlink/index.rst references a file that doesn't exist: Documentation/networking/netlink_spec/index.rst
   Warning: Documentation/userspace-api/netlink/specs.rst references a file that doesn't exist: Documentation/networking/netlink_spec/index.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
   Warning: lib/Kconfig.debug references a file that doesn't exist: Documentation/dev-tools/fault-injection/fault-injection.rst
>> Warning: /sys/bus/iio/devices/iio:deviceX/in_currentY_raw is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio:170  ./Documentation/ABI/testing/sysfs-bus-iio:1700
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

