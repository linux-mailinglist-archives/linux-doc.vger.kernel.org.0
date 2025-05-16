Return-Path: <linux-doc+bounces-46393-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1736FAB92A7
	for <lists+linux-doc@lfdr.de>; Fri, 16 May 2025 01:04:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E1E451BC4DF6
	for <lists+linux-doc@lfdr.de>; Thu, 15 May 2025 23:04:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5AD71E5B98;
	Thu, 15 May 2025 23:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RQDmVBOU"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9A41DE3CA
	for <linux-doc@vger.kernel.org>; Thu, 15 May 2025 23:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747350278; cv=none; b=MwVVTfhfEkpV+73uV3+6eFnfeYU6MUKAClavcU8Zj/2ARj36JLwTzo27408PRVnAbbO33zUjk82aDhVVTvy2nzkqxYequRjF6l/noWrI5EciWJxRz52T+nOZ/CmB/NfoBI6OfZ2CAJ68hgUOic1+SpwisizPDCjQzkv3SeVWNk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747350278; c=relaxed/simple;
	bh=Lqyl4x8tLi6SgQrSdF6IVzqjj9W/RmLj/qcgPZ386k8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cDJF+qvHyg6YnInJjUAsu9TW8O1Bs6+9dB2uxHF9WX+ANmkssIJp55MKsabOBq1TUahISEA6fNHU4a9QFdiL5viYMwJf+qcptmAcl6Rwa1TxUatZ/iWuEwo57NjcurkUOG4TDikceNZ8NEYPRV/VLzasDLT7wjedAFN16r9gN48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RQDmVBOU; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747350278; x=1778886278;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Lqyl4x8tLi6SgQrSdF6IVzqjj9W/RmLj/qcgPZ386k8=;
  b=RQDmVBOUu1fXouuw89HTs7V3eFl/lPpwdO2uAz0yAPu9Lk1ANgF9vbnf
   9gdzmUaGAcpb6aBmYu1q2h9EvIYL2lBc0Y8bCGxcOyk5YuTD3xdnItUbB
   bFtd0+modVeG2jXMlotjsk5M4QS0j2D3fDY/eG+ngnTBExPAdCpX4LYck
   b7DVTsP0Q5RQT3PnFTP5oW2RKI4ww3w4FPENSCF2qrEHXFFX6tANJdAFE
   vX2sXwdqbmzl7u98aIdPll0T10TLunp6lSH8eNi64m+q1wIdbO57Ab9Za
   AwvqghmeXaQKC0ows1sDda9wfa7nZzPpmi8iKNpQeG+B20ODKMG3OEGEY
   g==;
X-CSE-ConnectionGUID: UxK+6U7oRLm7wwjwAi+G1g==
X-CSE-MsgGUID: R9Na9qZnQ1K3LRQ4imkPMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="52984885"
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; 
   d="scan'208";a="52984885"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 16:04:37 -0700
X-CSE-ConnectionGUID: XcpUsLH9QlehV4EIRytaEg==
X-CSE-MsgGUID: /MvcTqXZQPmFIz63kyli+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; 
   d="scan'208";a="138250770"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 15 May 2025 16:04:36 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFhcv-000Ipf-01;
	Thu, 15 May 2025 23:04:33 +0000
Date: Fri, 16 May 2025 07:04:05 +0800
From: kernel test robot <lkp@intel.com>
To: Yanteng Si <si.yanteng@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org,
	Alex Shi <alexs@kernel.org>, Dongliang Mu <dzm91@hust.edu.cn>
Subject: [lwn:docs-next 37/72] htmldocs: Warning:
 Documentation/translations/zh_CN/how-to.rst references a file that doesn't
 exist: Documentation/xxx/xxx.rst
Message-ID: <202505160627.WtzIIpL6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.lwn.net/linux.git docs-next
head:   db6b8b9bafa741faaf174751e3342a64483b8039
commit: 4f0145e9ea41cc5d0f80b79a60ce39757d3b47d6 [37/72] docs/zh_CN: Add how-to of Chinese translation
reproduce: (https://download.01.org/0day-ci/archive/20250516/202505160627.WtzIIpL6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505160627.WtzIIpL6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
   Warning: Documentation/translations/ja_JP/SubmittingPatches references a file that doesn't exist: linux-2.6.12-vanilla/Documentation/dontdiff
   Warning: Documentation/translations/ja_JP/process/submit-checklist.rst references a file that doesn't exist: Documentation/translations/ja_JP/SubmitChecklist
   Warning: Documentation/translations/zh_CN/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_CN/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
>> Warning: Documentation/translations/zh_CN/how-to.rst references a file that doesn't exist: Documentation/xxx/xxx.rst
   Warning: Documentation/translations/zh_TW/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/leds/backlight/ti,lp8864.yaml
   Can't build as 1 mandatory dependency is missing at ./scripts/sphinx-pre-install line 984.
   make[2]: *** [Documentation/Makefile:121: htmldocs] Error 255

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

