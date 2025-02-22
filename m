Return-Path: <linux-doc+bounces-39085-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C97BCA40B97
	for <lists+linux-doc@lfdr.de>; Sat, 22 Feb 2025 21:48:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4DFBE3B80DE
	for <lists+linux-doc@lfdr.de>; Sat, 22 Feb 2025 20:48:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7EF4200B98;
	Sat, 22 Feb 2025 20:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jcxU2hDH"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2105C14A095
	for <linux-doc@vger.kernel.org>; Sat, 22 Feb 2025 20:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740257314; cv=none; b=U167VWEHWTe9747Glbw9Ur0U3qJoSuyDybfhnIfilknyv+IYW5sqA+tYM5C4DlCFAY4bo918kdfre/frM+nGG62AswDXJlfJ1EwBN7YoebMvwcT2Pyr9gcvg8515O05Ne2Tm6zdqNzYn0x9NxYo5q2BxMnPiaXD97mLPvG/STLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740257314; c=relaxed/simple;
	bh=ehtXDBx/vImVTA6q8WwVpRGBvW6F79wISa0A0C4C4mY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uBwz6+Z8EYm+P09Kp6RCObNM6rabltA50mYoqJfYiZjFCX4o4+uJEn9y9C0orxeYZu3SrggMBLRect355HbjzzExHat4ov6kPLBH3hgkOqkOB4DqTjjQkSsT8jH4XXoYCCadQvJCWV6nnqEPIxJ0tTc8dkVarciZdaVRVsdKgFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jcxU2hDH; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740257313; x=1771793313;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ehtXDBx/vImVTA6q8WwVpRGBvW6F79wISa0A0C4C4mY=;
  b=jcxU2hDHIRsdIjmQfnvTzOtIVWD4S9THuer3+HhdahFtw/ddhhhx9nwC
   BwYZUgsLiR0aSt947KNNCeyc25iCD4baqmUkPAF6oRYfjZQQA0C5zkZVk
   9rhE9dqjnldx4VIN0wtNZlL/sPHFBmXXr152v63MxK9QNR+hcfyuxcfYM
   2km7BuNjqbF/+3FZm43OrV8hP2VmyRT3cjrZX5GxISF1Fy0Bn0A7tilvG
   iFi30yhpDz43WLzM4+CdpYGcDq7rva2J2jFrBg5+eaL4o0in0xSrIrBdE
   fb2Pggo6LIIXo+UxzZKYtKKqAB3BemXomVlY69k+C5jq0V3VO6fPErngv
   w==;
X-CSE-ConnectionGUID: BS/eb+q8QOCcV84ITL6hIA==
X-CSE-MsgGUID: XPvLPF6ySMauHXbqTjjhlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11353"; a="51692678"
X-IronPort-AV: E=Sophos;i="6.13,308,1732608000"; 
   d="scan'208";a="51692678"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2025 12:48:33 -0800
X-CSE-ConnectionGUID: f6whQmsnT1yInTg+lNZ1XA==
X-CSE-MsgGUID: n6M7EmzRSeK3wQbIdltRog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,308,1732608000"; 
   d="scan'208";a="120778785"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 22 Feb 2025 12:48:31 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlwQH-0006u9-08;
	Sat, 22 Feb 2025 20:48:29 +0000
Date: Sun, 23 Feb 2025 04:47:32 +0800
From: kernel test robot <lkp@intel.com>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Tsugikazu Shibata <shibata@linuxfoundation.org>
Subject: [lwn:docs-next 66/70] htmldocs: Warning:
 Documentation/translations/ja_JP/process/submit-checklist.rst references a
 file that doesn't exist: Documentation/translations/ja_JP/SubmitChecklist
Message-ID: <202502230433.CqluCtW0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.lwn.net/linux.git docs-next
head:   76a6782284dff53a08b688fdead3e46f22236e71
commit: 991dabb24232d94c04053955af8e85df72a1e2b9 [66/70] docs/ja_JP: Convert SubmitChecklist into reST with belated updates
reproduce: (https://download.01.org/0day-ci/archive/20250223/202502230433.CqluCtW0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502230433.CqluCtW0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/arch/powerpc/cxl.rst references a file that doesn't exist: Documentation/ABI/testing/sysfs-class-cxl
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
   Warning: Documentation/translations/ja_JP/SubmittingPatches references a file that doesn't exist: linux-2.6.12-vanilla/Documentation/dontdiff
>> Warning: Documentation/translations/ja_JP/process/submit-checklist.rst references a file that doesn't exist: Documentation/translations/ja_JP/SubmitChecklist
   Warning: Documentation/translations/zh_CN/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_CN/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
   Warning: Documentation/translations/zh_TW/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

