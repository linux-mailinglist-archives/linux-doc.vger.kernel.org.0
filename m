Return-Path: <linux-doc+bounces-55311-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B38B1D549
	for <lists+linux-doc@lfdr.de>; Thu,  7 Aug 2025 11:53:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0AED73B57DD
	for <lists+linux-doc@lfdr.de>; Thu,  7 Aug 2025 09:53:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBD3F2248BA;
	Thu,  7 Aug 2025 09:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jj+6cmTZ"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A03218AAD
	for <linux-doc@vger.kernel.org>; Thu,  7 Aug 2025 09:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754560395; cv=none; b=TuGtzn97geis8ICvNl9jTm4usp1CAaJKyuB8KNxzurlUduLpnKlmOkJFSTDr6AUCz701SHLCDwtxgA4BsEDooSIVYIGCR7SrgLTL/3ApFsYVaoCnVeObTAgWc5XZcRgKXY+g5wmcXbZPQc7ivHT08K0WAorjepKSStCyyuODFPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754560395; c=relaxed/simple;
	bh=vcxOcJqFXBk8VGl9JLZorPOdeKCsR1ONSpxuUXmGAAo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IHi3m3/YaKJtyyGFHcM6cdw/MbGKTavVP1nVa8C6u20/SAd5w5L9SdQihgf2Tsdby1o25YsV9lVXFt2+JmgIs1onsD6NIMmtByW17HInpcEfhuJ3VYNngNxcVxnXVty2CPH8SJYGav8FIAvga5e8YTAZVVe5XEud3aNZvVe8icw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jj+6cmTZ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754560394; x=1786096394;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vcxOcJqFXBk8VGl9JLZorPOdeKCsR1ONSpxuUXmGAAo=;
  b=Jj+6cmTZZcREqdZ7R4nGEzowAphdO0UwFsc/6VnLqhIxJlJOE4Fn/w0x
   vmRJ9R35kMHkLyBIE6ygu+7FhcwO4RJNIRxzya8rt73XK4K5OhXSQupfl
   m3RJBT/M7nOTlpNFkyJrcEaWeY2TJeTdkDam/vxdrWEyWeaKzRqQUX6S/
   YPrdCSffdQ4b0ZjtRqj4JMMem6sKe8R5LSK7yZ8iAcE/1U9PnGKqUvYhx
   /8tYNeouqTLiJhkzkMudM0NFHq4U4VxljXKbxMLNNvlU/W+DPkTg1lPPm
   2DHNt/zz/8RXovupCiPRsOK7b4nU53YYENeWMT3cnU7+29lbXHKMB41ZR
   w==;
X-CSE-ConnectionGUID: ZOunSqO5R0Gbxc3BJigNjA==
X-CSE-MsgGUID: tiUrO42PRGuM9ZojOl0NuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="67158353"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="67158353"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 02:53:14 -0700
X-CSE-ConnectionGUID: kNXl3KZlSRC4yG0qKfKXLQ==
X-CSE-MsgGUID: AWOplBKRS6q+nTLFlCMGOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="169224534"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa003.jf.intel.com with ESMTP; 07 Aug 2025 02:53:13 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujxJ8-0002Pr-2H;
	Thu, 07 Aug 2025 09:53:10 +0000
Date: Thu, 7 Aug 2025 11:53:05 +0200
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [robh:dt-convert 50/801] htmldocs: Warning: arch/arm/xen/enlighten.c
 references a file that doesn't exist:
 Documentation/devicetree/bindings/arm/xen.txt
Message-ID: <202508071144.5KGZAh66-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Rob,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt-convert
head:   6752ef54777b7f91fb5cae7cfac46af194c15d1b
commit: 26bdb3b4e2aa8623c3fc18e109edc3d49e3bb7a7 [50/801] dt-bindings: arm: Convert xen,xen to DT schema
reproduce: (https://download.01.org/0day-ci/archive/20250807/202508071144.5KGZAh66-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508071144.5KGZAh66-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
   Warning: Documentation/translations/zh_TW/filesystems/sysfs.txt references a file that doesn't exist: Documentation/filesystems/fuse.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/arm/ste-*
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/arm/firmware/sdei.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/arc/axs10*
>> Warning: arch/arm/xen/enlighten.c references a file that doesn't exist: Documentation/devicetree/bindings/arm/xen.txt
   Warning: arch/riscv/kernel/kexec_image.c references a file that doesn't exist: Documentation/riscv/boot-image-header.rst
   Warning: drivers/clocksource/timer-armada-370-xp.c references a file that doesn't exist: Documentation/devicetree/bindings/timer/marvell,armada-370-xp-timer.txt
   Warning: fs/fuse/Kconfig references a file that doesn't exist: file:Documentation/filesystems/fuse.rst
   Warning: fs/fuse/dev.c references a file that doesn't exist: Documentation/filesystems/fuse.rst
   Warning: include/rv/da_monitor.h references a file that doesn't exist: Documentation/trace/rv/da_monitor_synthesis.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

