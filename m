Return-Path: <linux-doc+bounces-22087-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ED77094642D
	for <lists+linux-doc@lfdr.de>; Fri,  2 Aug 2024 22:00:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD7D628361D
	for <lists+linux-doc@lfdr.de>; Fri,  2 Aug 2024 20:00:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96C0E1ABEBE;
	Fri,  2 Aug 2024 20:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d0FS7HZh"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C4E1ABEB1
	for <linux-doc@vger.kernel.org>; Fri,  2 Aug 2024 20:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722628818; cv=none; b=rI3+aBl4yv2zgelJcCB9MnUHfhpaJhYX7gkBvnBHl/JJkuqXENfLex+b8xY3RFmOlPYGpa1hlJtb2I8Mmem4oG8hV70UFYlsRjMY2urhlot/g8KqiGf50uGgK+XrGHmfDVHNj01bg3R53EXdIwFAU82vugI5j7QvyBeMHXgp0WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722628818; c=relaxed/simple;
	bh=n0E4qw9nmiVUA5Pe0cCPUzE0YV3LwwDJlmw0QNRwyUc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U2HzJ9Tx1aUrf2oIAKZan+CNGuZDtMeYkXviwkMOJlVgZhlYxonFkeSxAPMnlndHFhX302R3NkoPW4Cufe+mQOdXFsadVa2iyiR7B19KkVGNjHZZG7MGO/MijDWvb1W+8R/UEb0mT1qt9PV0A56xTrpoWg6+dCADzwZ8lwq4MVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d0FS7HZh; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722628816; x=1754164816;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n0E4qw9nmiVUA5Pe0cCPUzE0YV3LwwDJlmw0QNRwyUc=;
  b=d0FS7HZhydxNwCndtY5ZE+r1c+biVp1jf4NARdvvzyZ1ErGhGyTk2Yhb
   8Un31MaOSk33KNoyluNFFdbrFYQwngg5RMJhrletwUVqm+Z6XdNdhzPee
   Fht4rDPcmwnPRK68FOI1z0QHxvZAorOgmtW80QxO/kgbjQr6hZTgNhlQH
   66EtRfVGt51itBv8R4omN3b/gTvNdJVd0/JA2JmrBHTBHliFCTmhktX5k
   wr+zun8NbavgwU0iPkSOOG1Mj2zLMR3XeCqLsiTAlRsxccAzE5ZdWU62h
   BswwCOfX7JsQA1eiUhkJNkQSsaZzcN/DAM+Dz5G7CRtaWslFldIpKR0gU
   g==;
X-CSE-ConnectionGUID: TEmCbPcOTTGMGTXMxSAEdA==
X-CSE-MsgGUID: KE+kHL9wTTaiJoYZAvsTNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="24433081"
X-IronPort-AV: E=Sophos;i="6.09,258,1716274800"; 
   d="scan'208";a="24433081"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2024 13:00:15 -0700
X-CSE-ConnectionGUID: dQp1wgmiRjSUjlsRhvWnFQ==
X-CSE-MsgGUID: wzv7wKnJSJqhEr0mlSxQyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,258,1716274800"; 
   d="scan'208";a="60134364"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 02 Aug 2024 13:00:14 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZyRg-000xMa-20;
	Fri, 02 Aug 2024 20:00:12 +0000
Date: Sat, 3 Aug 2024 03:59:41 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [morse:mpam/snapshot/v6.11-rc1 47/128] htmldocs: Warning:
 MAINTAINERS references a file that doesn't exist:
 Documentation/arch/x86/resctrl*
Message-ID: <202408030317.dWPhPskC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v6.11-rc1
head:   063bc546005302904092c158fe3228dc8af798a9
commit: 1c58b89b79f03fd9013a8a2da78f87424fbcb97f [47/128] x86,fs/resctrl: Move resctrl.rst to live under Documentation/filesystems
reproduce: (https://download.01.org/0day-ci/archive/20240803/202408030317.dWPhPskC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408030317.dWPhPskC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/reserved-memory/qcom
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/exynos/
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/arch/x86/resctrl*
>> Warning: arch/x86/kernel/cpu/resctrl/monitor.c references a file that doesn't exist: Documentation/arch/x86/resctrl.rst
>> Warning: fs/resctrl/Kconfig references a file that doesn't exist: file:Documentation/arch/x86/resctrl.rst
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

