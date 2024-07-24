Return-Path: <linux-doc+bounces-21284-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA3093B73A
	for <lists+linux-doc@lfdr.de>; Wed, 24 Jul 2024 21:12:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 01F701C23849
	for <lists+linux-doc@lfdr.de>; Wed, 24 Jul 2024 19:12:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59DFA2AE6C;
	Wed, 24 Jul 2024 19:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XzEGt6eY"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9946161327
	for <linux-doc@vger.kernel.org>; Wed, 24 Jul 2024 19:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721848360; cv=none; b=cw8PJTSI87ry9y4bQ00vMqSqc4nFQqRqMnmpSr9nF6xy4GOko+4aJo4pXrGwD0YFpHPs9LmLYu0KIQHHoC7pWzhm/Me/NC6tI5c4+w7Brdh92+SJUZfP7NXWbLvpUMEbJBloJg49Sbum5Bx4rPCszVkMcE8a9V7xGs+TfTcmOwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721848360; c=relaxed/simple;
	bh=7q+lSYAzjSpXPm7u1rbeV2sRK/Cao+TBCvv9ILLotx0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YVl+xd5V8tBKw/LS30wFKBX8i2CFB8MR7uvGMD3MaMGyBPc3cZ12EORTHkfiLIwb3Syafa7jZlHI1ZUqlPsHX6zGwxqiOj+vAc3YU+95o4TzDvRSGLaJ8s+LuKDqszIwpt1KMix0nCAsmY1nX5JHHJPPBoZt3h6zY11iryTHjxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XzEGt6eY; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721848357; x=1753384357;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7q+lSYAzjSpXPm7u1rbeV2sRK/Cao+TBCvv9ILLotx0=;
  b=XzEGt6eY85otGM8mIYviXSX8M7RAaaYqA53CWGr8Qooq3lAIfpj0/vMX
   xpIJZ8f9WG14r24hltdyszTzVmoelLc0pZD7Cb4fgpvzvnmEWTxS/EdYk
   Hwkr2v6zuN2rFLmi5HdNPJXTNh0IFRNmGPVHdrJltQ63JVHDK3H1QMUKs
   gCenD6GRzq3hmU7Q3ppP+iea1T6lC2Z6HYxP2nS1QbsJmQexdaxDIEMhe
   LZsaK4w8Rk5r4FDz+kj9G7G98BJttA+6oE2SnuOhCZeCCi+DRoZ0t1VN9
   +7KNKdNWUehZXZCmCYyvz8RbrH/uzedrjuIZN4ghLuAS5xAFnWmoLhs6K
   Q==;
X-CSE-ConnectionGUID: ap5dZOyiSsWg/AArDiiJZA==
X-CSE-MsgGUID: r63TumlbQBSUqspH17BLTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="44975788"
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; 
   d="scan'208";a="44975788"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2024 12:12:36 -0700
X-CSE-ConnectionGUID: +T3stGLdR9ORAQXOZlPfig==
X-CSE-MsgGUID: fP7+wp9WSpqMXjKAVwDX7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; 
   d="scan'208";a="56990066"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 24 Jul 2024 12:12:34 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sWhPc-000nMS-1j;
	Wed, 24 Jul 2024 19:12:32 +0000
Date: Thu, 25 Jul 2024 03:11:38 +0800
From: kernel test robot <lkp@intel.com>
To: Gabriel Krisman Bertazi <krisman@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, Chuck Lever <chuck.lever@oracle.com>,
	Amir Goldstein <amir73il@gmail.com>, Jan Kara <jack@suse.cz>,
	linux-doc@vger.kernel.org
Subject: [cel:nfsd-5.10.y 1/4] htmldocs: Warning: samples/Kconfig references
 a file that doesn't exist:
 Documentation/admin-guide/filesystem-monitoring.rst
Message-ID: <202407250319.rRnWvh4J-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux nfsd-5.10.y
head:   26563b4f6da732a7f86aa9c3bf0ccaa4ec992337
commit: e6452a24505de989f8acf095531983d170576a03 [1/4] samples: Add fs error monitoring example
reproduce: (https://download.01.org/0day-ci/archive/20240725/202407250319.rRnWvh4J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407250319.rRnWvh4J-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/rohm,bd9576-pmic.yaml
   Warning: Documentation/translations/zh_CN/arm/Booting references a file that doesn't exist: Documentation/devicetree/booting-without-of.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/pinctrl/toshiba,tmpv7700-pinctrl.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.yaml
   Warning: arch/Kconfig references a file that doesn't exist: Documentation/unaligned-memory-access.txt
>> Warning: samples/Kconfig references a file that doesn't exist: Documentation/admin-guide/filesystem-monitoring.rst
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_x_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:0  ./Documentation/ABI/testing/sysfs-bus-iio:394
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_y_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:1  ./Documentation/ABI/testing/sysfs-bus-iio:395
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_z_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:2  ./Documentation/ABI/testing/sysfs-bus-iio:396
   Warning: /sys/bus/iio/devices/iio:deviceX/in_anglvel_x_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:3  ./Documentation/ABI/testing/sysfs-bus-iio:397
   Warning: /sys/bus/iio/devices/iio:deviceX/in_anglvel_y_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:4  ./Documentation/ABI/testing/sysfs-bus-iio:398

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

