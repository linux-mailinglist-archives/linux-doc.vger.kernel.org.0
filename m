Return-Path: <linux-doc+bounces-30967-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D09289D06AD
	for <lists+linux-doc@lfdr.de>; Sun, 17 Nov 2024 23:33:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 349AA2822E4
	for <lists+linux-doc@lfdr.de>; Sun, 17 Nov 2024 22:33:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 326EB1D9A7E;
	Sun, 17 Nov 2024 22:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wf4LL+5O"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D14149C64
	for <linux-doc@vger.kernel.org>; Sun, 17 Nov 2024 22:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731882823; cv=none; b=WWjAeacrq2VZHiMNP7mqMexToSnd97Qvu4yLu+QOynjvRBLCFwkCm/sP+Fx3qeKphsB/944guqhvgMl1zKby8ifYIYKVZMsqp784RA8kNQ72srLogsWyg/f+EDcZ1HdPEDx4SXHlxM++liKYJZi5DhW7SSkRfcpD+7HDkAZ4aKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731882823; c=relaxed/simple;
	bh=Nj/8zmZSqVflbWca/Sj5GB0Dm2yy4qyScwz699og0y0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n+1yl0Pgrjp7VT48tzsj6+DSSrckUDvz+jaoOV5tniyj65AoTxBmfN/HpEqqOPLyyJxDUEympx/OhWtQ+Sv4WpjZnKZwelugxCvnpo1T/Y69mTHV3uOX4DflqHiUVg/RdZ8pnkRSke9X749FY8pPS7/9tjFFFra5y0N1yNODQrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wf4LL+5O; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731882822; x=1763418822;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Nj/8zmZSqVflbWca/Sj5GB0Dm2yy4qyScwz699og0y0=;
  b=Wf4LL+5OnASwrWZ+2Vwh4p3/YKAvfOhdiO+PdCo5F705YE71vjr4Tlzo
   jZ9QEAIDYpNa5OYr+eVzwwC8U57gbGsVTPIBroW3zzxfLlpdstXvdojgy
   oakaxaw7POOWGLzZYU7f0h+uuc9RPNKGlZZ5ja9qqBisbYMQWTkQRYYaN
   0kUeAfO+NY0Y8GZXxNzAbUro08k3ZHDxtUx1kwjJ/Yiv79L/Fz8LsmOq2
   VDDG2so9VZ7jJtZHnppYhAL07hP/g8gwSlLpq+nHqS8GiCTKWg38ro6e5
   2JVzsFCu1qMqQCMQoNtNhc0DRk+cNwwgxw8TM3nM1rzgi197gd7tMtdMs
   Q==;
X-CSE-ConnectionGUID: Bbx0JKg0ToKvOMkxDySM0g==
X-CSE-MsgGUID: xl4fiDr+RhKIW+EMGnMqtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="42347884"
X-IronPort-AV: E=Sophos;i="6.12,162,1728975600"; 
   d="scan'208";a="42347884"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2024 14:33:41 -0800
X-CSE-ConnectionGUID: VBiFNYhwTOyBTpJKdZ2pxw==
X-CSE-MsgGUID: Vw3sCdnWT+GYS3RujWrV8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,162,1728975600"; 
   d="scan'208";a="88632471"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 17 Nov 2024 14:33:40 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCnpp-000249-1P;
	Sun, 17 Nov 2024 22:33:37 +0000
Date: Mon, 18 Nov 2024 06:33:10 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>,
	linux-doc@vger.kernel.org
Subject: [asahilinux:bits/005-maintainers 1/2] htmldocs: Warning: MAINTAINERS
 references a file that doesn't exist:
 Documentation/devicetree/bindings/usb/apple,dwc3.yaml
Message-ID: <202411180644.rCfyf7tD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/005-maintainers
head:   b9472ab57f36e3a0b6c154e4d1374e840676cbdc
commit: 35abae5d5e650fc43d5b50cf385c22a64f0eda9d [1/2] MAINTAINERS: Add Apple dwc3 bindings to ARM/APPLE
reproduce: (https://download.01.org/0day-ci/archive/20241118/202411180644.rCfyf7tD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411180644.rCfyf7tD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/usb/apple,dwc3.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

