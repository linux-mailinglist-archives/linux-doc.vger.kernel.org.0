Return-Path: <linux-doc+bounces-26482-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 592D398FE12
	for <lists+linux-doc@lfdr.de>; Fri,  4 Oct 2024 09:50:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D2791B21244
	for <lists+linux-doc@lfdr.de>; Fri,  4 Oct 2024 07:50:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18CDC13B7B3;
	Fri,  4 Oct 2024 07:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N6ie785n"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B81122EF0
	for <linux-doc@vger.kernel.org>; Fri,  4 Oct 2024 07:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728028212; cv=none; b=D+IHPebYOK2atBWlK71Ted3u0YHwigCIVZfx23/7FDkrFtiImyXJQ4yjKWQ6x4E2rg8Far2CN9mOJiT1vGF3zb2PtpmMW6q/dN3Vb60JTugaVGr8LD53aOnmjM4U9zU9ZxgfPeeqV7XhVINQDbH8hsNIQ8xhseSlCFDpWXBcs+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728028212; c=relaxed/simple;
	bh=1M1kHBo8CNJKQ64WWKpuDd4iaWHjUss8ZwZ9tAGwCw8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PEW1T4Csw9fRXvsCP+yFPcAw/WQX7sb7S3zED7/6p/b91N0LSFymv9HSSgN65jmGqhAf/2aSgri6AvByvOUVgsCgBMrO9HRLphzBfFDzAtch8LoIMASyFUuHxu6jhVmtsCwyaQaZo6lBreo/75i+bbiPoeeIFtAtJtXQfbFIC9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N6ie785n; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728028211; x=1759564211;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1M1kHBo8CNJKQ64WWKpuDd4iaWHjUss8ZwZ9tAGwCw8=;
  b=N6ie785nr1ryPFHz8ne8QdVJoGX9irV8Sd+WdWNGOCnGTQ4wPpXb1eOu
   xOi6H3FRuvlJccVtimeQPtF47p8SiET2ehmOyhrpZR5Dh0tTFfKKoRgWQ
   329KyJI0gSWDQ2zYkjCKhWZ8EKDFXWla2jx84bstEaAKKqbA3jKORPOsq
   S4YH/YkP/bHV57sYp/PLfhWotu5olYAG4lF7Hex6QBwH2vrPzinQYyT/n
   lx4XjDbEraeP0zWbPRSym1gSKG6TbuP85UlnUIhvha4eLtLo3nVgD+fAB
   i4yM6nFr9V2MfRN7C87++LZraSDnweJtaF536/RWBu5smMl4mfaasLAb4
   g==;
X-CSE-ConnectionGUID: xOBQYVRvSjCU9yqb9cfbiw==
X-CSE-MsgGUID: 7VrchRLxTiWtZDSbrOizaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="27373122"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="27373122"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 00:50:10 -0700
X-CSE-ConnectionGUID: kX+GL9mhQhSZt/f27amE5g==
X-CSE-MsgGUID: tnfQ3gSdTqCw2WkcBabbBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="79594306"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 04 Oct 2024 00:50:09 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swd4g-0001LU-1e;
	Fri, 04 Oct 2024 07:50:06 +0000
Date: Fri, 4 Oct 2024 15:49:46 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-doc@vger.kernel.org
Subject: [linux-next:master 2422/2483] htmldocs: Warning:
 drivers/gpu/drm/xe/xe_pci.c references a file that doesn't exist:
 Documentation/fault-injection/fault-injection.rst
Message-ID: <202410041549.r1yXqVA1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   58ca61c1a866bfdaa5e19fb19a2416764f847d75
commit: df2218ecdf52896e9cd70687613d016f23bf4919 [2422/2483] Merge branch 'drm-xe-next' of https://gitlab.freedesktop.org/drm/xe/kernel
reproduce: (https://download.01.org/0day-ci/archive/20241004/202410041549.r1yXqVA1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410041549.r1yXqVA1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/reserved-memory/qcom
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
>> Warning: drivers/gpu/drm/xe/xe_pci.c references a file that doesn't exist: Documentation/fault-injection/fault-injection.rst
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

