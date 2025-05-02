Return-Path: <linux-doc+bounces-45089-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 95DF4AA6B55
	for <lists+linux-doc@lfdr.de>; Fri,  2 May 2025 09:08:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22CFF9A3A72
	for <lists+linux-doc@lfdr.de>; Fri,  2 May 2025 07:08:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E57C267387;
	Fri,  2 May 2025 07:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mAl+szvq"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584E42045B5
	for <linux-doc@vger.kernel.org>; Fri,  2 May 2025 07:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746169709; cv=none; b=kebShchuu89p2wJJAxiQr/c6noVDeQXrPcH9RVDr/AkhtkFTUp/ZwILxqAnKrL9pYnyaA/v3pga0sDFrTJvkAllHi9VvXkcNO6QHUX8t8si6zuja2zMm6korEp+X5kRKJwhB87TECvhEeBiBPwCcBjmZvewFapdaqBch8Ko7+jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746169709; c=relaxed/simple;
	bh=9S2WjA6k7mOWQgmcdNgM8oS1sRzr6cHPt3EHGiYEcRk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZMk2SAfcvi32yGAMSyzBrm5fHoEk9T/NhKlD2TU/B7rAluDBd4N6lpVIAwziG5y+2qNH1Ec+15c4MF2KpTrcyrQOLeW5Z9QcNNvM+ygy8J+m4XN9M5GrFcACcgvfcs0t6EGT3ce99YeBXifxhicdOXTmPcRdAcidD89xzo24abM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mAl+szvq; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746169707; x=1777705707;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9S2WjA6k7mOWQgmcdNgM8oS1sRzr6cHPt3EHGiYEcRk=;
  b=mAl+szvqIFiv/KmFCX43C7gGvd7ke1rGwL0Wo53J/UMpNNLkkGGhGeK8
   s8zwlsTtbwAqUufplUTe5gbub/ji5CJsOmUyvN6lYTzqfvbZ26qlzAeQE
   YjwQO+tkTD6tEva10UJL0RPv/QS+17Bm18eS7o15RYRjl7tGSOvnkHdOk
   uMEgHcfRft6rEIK866J84DLZl2FJYcQe4jHmbyLAZ9BFpgeHw3ir74K8i
   JfF3VTnzZvSGeLiFWMPfSrFi87MH74xYNBWBAHLztHXGVrricg+Z/LSn8
   tBEDwRWSNkawoKE8sTpJRPuO98+7SdQTNPPmvEpiQ4ZhxVIGLnWpqNRDI
   w==;
X-CSE-ConnectionGUID: oCiuk3CaRWaYt24DdWY4yQ==
X-CSE-MsgGUID: 4V5jqOniRVmvEc6oKaaRuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="58057518"
X-IronPort-AV: E=Sophos;i="6.15,255,1739865600"; 
   d="scan'208";a="58057518"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 00:08:27 -0700
X-CSE-ConnectionGUID: t92nldQLTi+LG6lBzY8TWA==
X-CSE-MsgGUID: IYwONpQwSaC7LL7p9MFSGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,255,1739865600"; 
   d="scan'208";a="134325699"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 02 May 2025 00:08:26 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAkVT-0004b5-1G;
	Fri, 02 May 2025 07:08:23 +0000
Date: Fri, 2 May 2025 15:07:38 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [robh:dt-convert-irq 8/44] htmldocs: Warning:
 Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml references a
 file that doesn't exist:
 Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2xxx-scu-ic.txt
Message-ID: <202505021551.YtefY5bm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt-convert-irq
head:   271e22adde83e0cc6fce40f70c5f660bf1a8e2e3
commit: 357dfc0976c9d5cd147b50d1d44d98ea75e3ff38 [8/44] dt-bindings: interrupt-controller: Convert aspeed,ast2xxx-scu-ic to DT schema
reproduce: (https://download.01.org/0day-ci/archive/20250502/202505021551.YtefY5bm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505021551.YtefY5bm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml references a file that doesn't exist: Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2xxx-scu-ic.txt
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
   Warning: Documentation/translations/ja_JP/SubmittingPatches references a file that doesn't exist: linux-2.6.12-vanilla/Documentation/dontdiff
   Warning: Documentation/translations/ja_JP/process/submit-checklist.rst references a file that doesn't exist: Documentation/translations/ja_JP/SubmitChecklist
   Warning: Documentation/translations/zh_CN/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

