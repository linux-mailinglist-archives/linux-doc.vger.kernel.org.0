Return-Path: <linux-doc+bounces-21573-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D14EE9402EB
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jul 2024 02:59:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A1AF282201
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jul 2024 00:59:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF85823C9;
	Tue, 30 Jul 2024 00:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GvSQcIyy"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23DB429AF
	for <linux-doc@vger.kernel.org>; Tue, 30 Jul 2024 00:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722301155; cv=none; b=YBjibzhY3cd5S+DCeod1mXLZ9yU4JeCAsN654Kxgl6VB0oJCJKAsludlYxrJ4SfCTfLD19LSdDLXAfFuEuYrHEDscm+FW+S2NgkU8LjkHIU2Mg6xuAIDXF+TQ7O/ZcjQ08PYQD0dKRrFqC0P4LOqwSdi8AMKLObWNLqudhQGJTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722301155; c=relaxed/simple;
	bh=cWXZoqcQZQaKFcLc9AKrTZrScjim5f0s1tAPzPN3dyE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TPtJFcwrdo1xTvGaBcFaIwpL7ExP+LKX0FZi6Ms9kZHuhCGVyjQrxAe44do8Hisr8uQ3lkqhR06ROOGrRnREnmFP0KWfE6ebA3eEQ1U+6k+010dtfqE5ch8DO6edpy6G9J1baCNhdcDyM0v+zPBYFyCs9z341EfgoZ2H6qhVzWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GvSQcIyy; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722301154; x=1753837154;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cWXZoqcQZQaKFcLc9AKrTZrScjim5f0s1tAPzPN3dyE=;
  b=GvSQcIyyuSw/CeItNsoGmfX0E+vFC8YA7HzuuAUsStLRssm2occymLPH
   g0+c7GJ6f8C6YkUIY4MsqZkMeRkVI4p08lgpyu03/QAflFcunyLNNsAID
   kKckEaOaBtob7EIqRfbEAVjLDv5FbOVGkZNcwShr/X0QQPr001g6Ae/6d
   Ja03HSbFYToHOQJNoMa4iI2foCe0nbq+18Eb25N9wWX3uIiwGm+4Frk5G
   6TQiN4O6CLuDCbOToUtjv4f4qrtjliO/AN6QJQrv+X2XF+mHU22k9Jyad
   MYxXsgN4TazIIU2IaxaYrWvbfau2Oqj2IDbFp0tCBEzhL/pUr5lWoDZcp
   w==;
X-CSE-ConnectionGUID: Dq7VBcA+SyOLERmr0FVOnw==
X-CSE-MsgGUID: lRdh5t8/SHuNCYWnX8QgTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="19794282"
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; 
   d="scan'208";a="19794282"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 17:59:14 -0700
X-CSE-ConnectionGUID: BVsSWUDqQ+WQw8eF/EIhxg==
X-CSE-MsgGUID: myg8qjRvQNin1JZjSYyqnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; 
   d="scan'208";a="77388487"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 29 Jul 2024 17:59:12 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sYbCo-000sHQ-0N;
	Tue, 30 Jul 2024 00:59:10 +0000
Date: Tue, 30 Jul 2024 08:58:59 +0800
From: kernel test robot <lkp@intel.com>
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
	Yanteng Si <siyanteng@loongson.cn>
Subject: [lwn:docs-next 2/8] htmldocs: Warning:
 Documentation/translations/zh_CN/kbuild/index.rst references a file that
 doesn't exist: Documentation/kbuild/index
Message-ID: <202407300812.1VvDFdxD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.lwn.net/linux.git docs-next
head:   60666fbc81ac91af2cf2f511d60859288f7ea8e5
commit: e6a5af90f0a24f08445e3b8a11b727ac84a9520c [2/8] docs/zh_CN: add the translation of kbuild/headers_install.rst
reproduce: (https://download.01.org/0day-ci/archive/20240730/202407300812.1VvDFdxD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407300812.1VvDFdxD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/power/wakeup-source.txt references a file that doesn't exist: Documentation/devicetree/bindings/input/qcom,pm8xxx-keypad.txt
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
>> Warning: Documentation/translations/zh_CN/kbuild/index.rst references a file that doesn't exist: Documentation/kbuild/index
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/reserved-memory/qcom
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/exynos/
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

