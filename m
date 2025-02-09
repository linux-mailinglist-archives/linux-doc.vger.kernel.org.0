Return-Path: <linux-doc+bounces-37493-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8159FA2E015
	for <lists+linux-doc@lfdr.de>; Sun,  9 Feb 2025 19:58:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63F843A4B4D
	for <lists+linux-doc@lfdr.de>; Sun,  9 Feb 2025 18:58:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B99611DFD86;
	Sun,  9 Feb 2025 18:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fk2HJwXo"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 203D8EAC6
	for <linux-doc@vger.kernel.org>; Sun,  9 Feb 2025 18:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739127509; cv=none; b=oHQj+oI8Y48mp6dKtSL5q50e73cNKYEvuTT7vZNLZlK2AbJjJgtSELi8V0reBAdp+g56q75bNlztOtSf4110ogspgEisbZ/UOtTz7qRQ8fW+RzWtKrj6dEv84HFyYXoIO2fBDZJuUHuqi4rPXp8mtNPqCWsux1WTYUYJVqtss0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739127509; c=relaxed/simple;
	bh=RZmM7eYV396qWp240MU9r88bofw4xfEI/5NK32Mt8kU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qkPvyQzsqrS1VXV7pT9pw77SDZ/5hPCehWiAA9W8QGopD3Mss2AVBgJo01BWPiTeV6eVn5J4VaEaknyZM5OVPJUfLD/sX6EoAqofjhmnRG4yzLRwd2gs0iuYTYKczTbit/tCe47K5AQmJ1Lx7zSKHWr+HGMeSdQl2FE4boMiQlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fk2HJwXo; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739127506; x=1770663506;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RZmM7eYV396qWp240MU9r88bofw4xfEI/5NK32Mt8kU=;
  b=Fk2HJwXovjyZMbqZBpTTunOLZKMezsJj4gtnyg4iU57pFfTGe2yuI/kl
   aGXgyLSg5R14r+Q1OJqQA3Iwp1aVt/aPIhzT02PEqrMMKxKxiYyl+6eeV
   YBQ7Q2/THOnb5EuOKKJjoNJpNbzDBag19b77YFiWfpRNoSRIAxz0EDV4S
   iIb/8fD3PpRyf7QuOw1LqvSsGO9776NRZA5gd6xWJ2DW6ymr7zMggzwKc
   hL7Gfc6EXulxYL0KpKi7A3bJn9G/wrP9+h6vkBdQdPl0eoPV5c4KfrVm0
   GhB3dJYLfzVAaitvuMY7qcotfMMMRXnGFkkaXLPM4Z6FKNvXHj/uNHLxT
   A==;
X-CSE-ConnectionGUID: N7q7p2xCSuiQqyDp4aZQ2Q==
X-CSE-MsgGUID: woYWjZHMRd2+lUqb9m+WgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="50691706"
X-IronPort-AV: E=Sophos;i="6.13,272,1732608000"; 
   d="scan'208";a="50691706"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2025 10:58:25 -0800
X-CSE-ConnectionGUID: E1u+Wmx6S0mxVaOHv6uO5A==
X-CSE-MsgGUID: hVLL1YDYR46aOR92dGHDnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,272,1732608000"; 
   d="scan'208";a="142859330"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 09 Feb 2025 10:58:25 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thCVa-0011nv-01;
	Sun, 09 Feb 2025 18:58:22 +0000
Date: Mon, 10 Feb 2025 02:58:17 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>,
	linux-doc@vger.kernel.org
Subject: [asahilinux:bits/005-maintainers 2/3] htmldocs: Warning: MAINTAINERS
 references a file that doesn't exist:
 Documentation/devicetree/bindings/usb/apple,dwc3.yaml
Message-ID: <202502100213.fe1ZJ3UM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/005-maintainers
head:   7f9a856246c828f7d5063b4eb21232e1a3b62564
commit: f248eb87c474bff7b3936ed7cecc107a64c8cef4 [2/3] MAINTAINERS: Add Apple dwc3 bindings to ARM/APPLE
reproduce: (https://download.01.org/0day-ci/archive/20250210/202502100213.fe1ZJ3UM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502100213.fe1ZJ3UM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
   Warning: Documentation/hwmon/isl28022.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/isl,isl28022.yaml
   Warning: Documentation/translations/ja_JP/SubmittingPatches references a file that doesn't exist: linux-2.6.12-vanilla/Documentation/dontdiff
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/usb/apple,dwc3.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
   Warning: lib/Kconfig.debug references a file that doesn't exist: Documentation/dev-tools/fault-injection/fault-injection.rst
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

