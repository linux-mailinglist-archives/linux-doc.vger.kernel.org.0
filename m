Return-Path: <linux-doc+bounces-79555-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPhvAFRpuGlEdgEAu9opvQ
	(envelope-from <linux-doc+bounces-79555-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 16 Mar 2026 21:34:28 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 577E32A042B
	for <lists+linux-doc@lfdr.de>; Mon, 16 Mar 2026 21:34:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 73200304522F
	for <lists+linux-doc@lfdr.de>; Mon, 16 Mar 2026 20:28:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1E053EE1FD;
	Mon, 16 Mar 2026 20:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VJOXzka8"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326E23EE1E2
	for <linux-doc@vger.kernel.org>; Mon, 16 Mar 2026 20:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773692931; cv=none; b=HPCuc0ISXtCzJb091byt/u0u0J+xApsHO1JJcZuspDbS+N1WTnxRsxXIn0gbjx7k+cSBnqrW+fLOG943FYyAv4pUSl7ebHl0wdnrZRIC1S0uo3NynfzupVHAt52tUD8XUVA7B4/IREqJzJUxG5/UMBrB67LoSibSsPNb7dkFfjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773692931; c=relaxed/simple;
	bh=gA8MET4jmBu3R8biRafB8ig/ZQs3aBBQfNcMFwcaeRw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Dcl3122grN+E+tUlIG7+ZEeFhZihMJCK1JnX+4qPlcECEhW+A3di2wMkpHkN2hOAXwAM2DK996rEflQCVcojdxLOu9Z3jO8A5lhgkPHtM4K9Ts/pXdoh+odHMJQHt2qfXeFWiCVQ29P5tzc5JGO9TSYcu7yZOA1XN+NeGqTUl4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VJOXzka8; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773692930; x=1805228930;
  h=date:from:to:cc:subject:message-id;
  bh=gA8MET4jmBu3R8biRafB8ig/ZQs3aBBQfNcMFwcaeRw=;
  b=VJOXzka8YDSUBQfzPil7WNqLQvbKT8xofsPrvVTDHRsQTPHYGZjg0SBm
   dVpfDwwFsYI92vPgqFwfDJJgVWvBaVXMw1GMi2jdc+PToZo+7f3uo6fmc
   NVkVgVsTs7wmAyeDlmGg/Kbf0mGuKUjNWHp1cGXYqfZixJdqdPSfpURjE
   vG+3VgfDDHhjKG/kdmIHGaQw8FtW2seaNRR8xtWQhKXz7BiBHsSdF6SR2
   hT/lhRmht6fPEKt9ReQ76IU7t9L9whgR2q5FZcIyaVYv0mKkdzpkhLHvX
   hyK4m9pEdEZi7qUEYETBJ4UFkyf2EvGi+2dVOhd5Vrc047637hxjx/0T2
   Q==;
X-CSE-ConnectionGUID: qC34CeCjQmCdojkA7iHzIA==
X-CSE-MsgGUID: UlE+LvqiTrOss9p1GuWunQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="78321955"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="78321955"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 13:28:50 -0700
X-CSE-ConnectionGUID: UPbAElJ6T1yFI0ZM08VqAA==
X-CSE-MsgGUID: 8URuJdrMR1GJ0kFY2M52Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="222244438"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 16 Mar 2026 13:28:49 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2EYP-000000004HR-3uUe;
	Mon, 16 Mar 2026 20:28:45 +0000
Date: Mon, 16 Mar 2026 21:28:40 +0100
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [sashal:ai-review-prompts 9/13] htmldocs: Warning:
 drivers/of/ai-review/dt-bindings.md references a file that doesn't exist:
 Documentation/devicetree/bindings/gpio/vendor,device.yaml
Message-ID: <202603162121.92l86y1G-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-79555-lists,linux-doc=lfdr.de];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,intel.com:email,intel.com:mid,01.org:url]
X-Rspamd-Queue-Id: 577E32A042B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux.git ai-review-prompts
head:   d184712fd9e150ba9bf9ab95428e342308ba9761
commit: 37b6473651afa20483dc3c46ceea263989d527ac [9/13] drivers: add AI review guides for driver subsystems
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260316/202603162121.92l86y1G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603162121.92l86y1G-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/zh_CN/networking/xfrm_proc.rst references a file that doesn't exist: Documentation/networking/xfrm_proc.rst
   Warning: Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst references a file that doesn't exist: Documentation/Configure.help
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/ABI/testing/sysfs-platform-ayaneo
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt
   Warning: arch/powerpc/sysdev/mpic.c references a file that doesn't exist: Documentation/devicetree/bindings/powerpc/fsl/mpic.txt
>> Warning: drivers/of/ai-review/dt-bindings.md references a file that doesn't exist: Documentation/devicetree/bindings/gpio/vendor,device.yaml
   Warning: rust/kernel/sync/atomic/ordering.rs references a file that doesn't exist: srctree/tools/memory-model/Documentation/explanation.txt
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: Documentation/virtual/lguest/lguest.c
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: m,\b(\S*)(Documentation/[A-Za-z0-9
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: Documentation/devicetree/dt-object-internal.txt
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: m,^Documentation/scheduler/sched-pelt

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

