Return-Path: <linux-doc+bounces-94130-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id M52rM+VNQ2oUWwoAu9opvQ
	(envelope-from <linux-doc+bounces-94130-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 07:02:29 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D417F6E067F
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 07:02:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b="Xq9ZcR/G";
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94130-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-94130-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1FBB2303B71C
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 05:01:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86125331ED8;
	Tue, 30 Jun 2026 05:01:16 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847BA25B084
	for <linux-doc@vger.kernel.org>; Tue, 30 Jun 2026 05:01:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782795676; cv=none; b=MMxuUYPJnwZ7QeXvm8rtTutyMHDUIZDur64pLhUo+gMTkgp0x1jEaQ3cD/2woV3B1H5ZP2Q0WLLsaY4yzu6Wo1YTjUzhtVLezpajSwPtm+avSmg4fUe0uOPHve7NKqsnTQDPSx2Q5N54uYlOTJLvKqi/cxL6djPx79YrOaNsfVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782795676; c=relaxed/simple;
	bh=PxlqGfu9wKBk7SBXMQzy4ahw57Kh2J5Y1OMYSAaUekY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uwAliQyPW1iu8e4ap3hl354u+zsoO84XeTl29tgiEBqvUYPTV06R81VVbWEFjUsvROIfhl+i8cItXFhYcznPdoXwLcFisuxPr9ywCB046pviI+2HzszpTBCquzelXBy888BphREl0A2540GPnnZGPmUrM6fYk0BXnjQMn5fAL4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xq9ZcR/G; arc=none smtp.client-ip=198.175.65.10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782795675; x=1814331675;
  h=date:from:to:cc:subject:message-id;
  bh=PxlqGfu9wKBk7SBXMQzy4ahw57Kh2J5Y1OMYSAaUekY=;
  b=Xq9ZcR/Gc0IhSfwJkm8KFr2vEHt7aKrKGWp9gz+/31OqzveDLzE8973F
   /e4t3MmzauhK/8v4pg4FppzeMl/TrEQjLXEUUo2pD/oinFw5Yg3vg0bv7
   TAZNpzA/nqYMEFmkfp4i0iUPKg7+A3UgA0OecSuvJiJ/Pvx9irEG29L5q
   /mI4qTxFyasF47tZQSRj5JFxuXhJz+6xqgeQh8cqAAoCdbq43CMPziAnz
   7Ugjcdu+3Svoakm9kqfc7FT8+lxl9H9+kVO9ADMazu5ikGRT2f+HbADvo
   Q4RVPQWzssiyEuHSQ+/eBkwlFOBn/laWEzU6+z8DjYSYPkOdAKClidTv3
   A==;
X-CSE-ConnectionGUID: Y5fM+2KCQOW3oD/vkSLnnw==
X-CSE-MsgGUID: jFKZbkrgSHKxPfDqQB6pKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="100929077"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="100929077"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 22:01:14 -0700
X-CSE-ConnectionGUID: Tsk7h8PpQaCxTI2TCSohMA==
X-CSE-MsgGUID: N+mQC6LkTK2Utq2M+k4MTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="282224357"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 29 Jun 2026 22:01:12 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weQas-000000000Lt-1VEc;
	Tue, 30 Jun 2026 05:01:10 +0000
Date: Tue, 30 Jun 2026 07:00:35 +0200
From: kernel test robot <lkp@intel.com>
To: Waqar Hameed <waqar.hameed@axis.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 linux-doc@vger.kernel.org
Subject: htmldocs:
 Documentation/ABI/testing/sysfs-class-power-rt9471:1: WARNING: Inline
 emphasis start-string without end-string. [docutils]
Message-ID: <202606300641.u5PDL60Y-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94130-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[lkp@intel.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:waqar.hameed@axis.com,m:oe-kbuild-all@lists.linux.dev,m:lkp@intel.com,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,intel.com:dkim,intel.com:email,intel.com:mid,intel.com:from_mime,01.org:url,richtek.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D417F6E067F

tree:   https://github.com/intel-lab-lkp/linux/commits/Waqar-Hameed/power-supply-Add-sysfs-entry-for-system-load-control/20260629-235714
head:   7f627c0c3f8b6254753610a05254e70cd6a2032d
commit: fad2c985b1a8f0d628768cd211f4afe3cb39e9d2 power: supply: rt9471: Use POWER_SUPPLY_PROP_LOAD_SWITCH
date:   13 hours ago
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260630/202606300641.u5PDL60Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606300641.u5PDL60Y-lkp@intel.com/

All warnings (new ones prefixed by >>):

   ============  ===========================================
   1             automatic adjustment of input current limit
   0             no adjustment of input current limit. This
   helps for more unusual power sources like
   solar modules. [docutils]
>> Documentation/ABI/testing/sysfs-class-power-rt9471:1: WARNING: Inline emphasis start-string without end-string. [docutils]
   WARNING: ./block/blk-map.c:366 Excess function parameter 'op' description in 'bio_copy_kern'
   Documentation/devicetree/kernel-api:11: ./drivers/of/base.c:2161: WARNING: Inline emphasis start-string without end-string. [docutils]
   Documentation/devicetree/kernel-api:11: ./drivers/of/base.c:2351: WARNING: Inline emphasis start-string without end-string. [docutils]
   Documentation/driver-api/basics:42: ./kernel/time/time.c:370: WARNING: Duplicate C declaration, also defined at driver-api/basics:436.
   Declaration is '.. c:function:: unsigned int jiffies_to_msecs (const unsigned long j)'. [duplicate_declaration.c]


vim +1 Documentation/ABI/testing/sysfs-class-power-rt9471

ab8174bbc39669 ChiYuan Huang 2023-01-13  @1  What:		/sys/class/power_supply/rt9471-*/sysoff_enable
ab8174bbc39669 ChiYuan Huang 2023-01-13   2  Date:		Feb 2023
ab8174bbc39669 ChiYuan Huang 2023-01-13   3  KernelVersion:	6.3
ab8174bbc39669 ChiYuan Huang 2023-01-13   4  Contact:	ChiYuan Huang <cy_huang@richtek.com>
ab8174bbc39669 ChiYuan Huang 2023-01-13   5  Description:
ab8174bbc39669 ChiYuan Huang 2023-01-13   6  		This entry allows enabling the sysoff mode of rt9471 charger devices.
ab8174bbc39669 ChiYuan Huang 2023-01-13   7  		If enabled and the input is removed, the internal battery FET is turned
ab8174bbc39669 ChiYuan Huang 2023-01-13   8  		off to reduce the leakage from the BAT pin. See device datasheet for details.
ab8174bbc39669 ChiYuan Huang 2023-01-13   9  		It's commonly used when the product enter shipping stage. After entering
ab8174bbc39669 ChiYuan Huang 2023-01-13  10  		shipping mode, only 'VBUS' or 'Power key" pressed can make it leave this
ab8174bbc39669 ChiYuan Huang 2023-01-13  11  		mode. 'Disable' also can help to leave it, but it's more like to abort
ab8174bbc39669 ChiYuan Huang 2023-01-13  12  		the action before the device really enter shipping mode.
ab8174bbc39669 ChiYuan Huang 2023-01-13  13  
fad2c985b1a8f0 Waqar Hameed  2026-06-29  14  		Note: use /sys/class/power_supply/rt9471-*/load_switch instead.
fad2c985b1a8f0 Waqar Hameed  2026-06-29  15  
ab8174bbc39669 ChiYuan Huang 2023-01-13  16  		Access: Read, Write
ab8174bbc39669 ChiYuan Huang 2023-01-13  17  		Valid values:
ab8174bbc39669 ChiYuan Huang 2023-01-13  18  		- 1: enabled
ab8174bbc39669 ChiYuan Huang 2023-01-13  19  		- 0: disabled
ab8174bbc39669 ChiYuan Huang 2023-01-13  20  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

