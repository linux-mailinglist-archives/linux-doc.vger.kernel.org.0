Return-Path: <linux-doc+bounces-92427-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id b9s+BIlgMGolSQUAu9opvQ
	(envelope-from <linux-doc+bounces-92427-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 15 Jun 2026 22:28:57 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A8A689D7F
	for <lists+linux-doc@lfdr.de>; Mon, 15 Jun 2026 22:28:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=caZGQHXJ;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92427-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-doc+bounces-92427-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D6DF7300F77B
	for <lists+linux-doc@lfdr.de>; Mon, 15 Jun 2026 20:28:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E762F3B4EBB;
	Mon, 15 Jun 2026 20:28:54 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2EC3B585C
	for <linux-doc@vger.kernel.org>; Mon, 15 Jun 2026 20:28:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781555334; cv=none; b=HxSzHbqvDqMCy0G8PQiBQaZ/0r5i4w2QTx3PKoQF0KeHgONFp+M0M3Rk+WiUiUij+4i1PcbpBjRP4/ZNDN6MPN90coSbsMAWgvXqqyDG8Z9ze0jeEKHqKcm46jg4TDq6xXzjWK3bBg6IvT7FnpKIan5v1Y6YOABt3hYzoBvBneU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781555334; c=relaxed/simple;
	bh=HbiW0Wnj17orFREUmHwwkb9fgvVxVfgJMKDVrHXKIuE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ER5bP2ycD6dFZCzQ1/8zIZXFYXGH73cFEZ/Vg7B7qoDqhBZP2du49VFtUW7/SLyMq5+DB5HSzPObd/9QKfEk8Q4iIWw9DReBUG+mmorEHeniGP30ANuPp/yhjyubI+9A2BBgU1SrLwJUEvY/U81/ziXapsgqE0ErEOw7kew6sw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=caZGQHXJ; arc=none smtp.client-ip=192.198.163.8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781555332; x=1813091332;
  h=date:from:to:cc:subject:message-id;
  bh=HbiW0Wnj17orFREUmHwwkb9fgvVxVfgJMKDVrHXKIuE=;
  b=caZGQHXJjSvNnE+NEz0u1W+rbFG9C7akLf2Fug8ARuIGZ//a3vbhqZox
   ZLepCvhr++qtcjvXLRb5DfTulJeQox14yc54KrVvvmxNNTdSjC97MfcnY
   umtqss1iRCCEiYjIsFXEPGgPbNZ0zUIuxfcpuI1xhp/vH4zpiyddGIWta
   BcOjk+LZfOJat2DFvuYfMhOS7NEZHKGq8kPKoDqPX5obPZJul0uiupBgg
   wR2xBoB8bKB0bKWym4xmMf3cVIf9WACoqlYLRNoyJSqKV9cwXDb2SvZSv
   rVb9o1XeT/c62cBnWq0KJljlsXHb6+KOVBJEsJa5JjFIXGUi/taQyM8eQ
   A==;
X-CSE-ConnectionGUID: 3plqOxXRTnGmW8nVhLR3Yw==
X-CSE-MsgGUID: uJfrg3oKSMyNa7EFfcBQtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="99882453"
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; 
   d="scan'208";a="99882453"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 13:28:51 -0700
X-CSE-ConnectionGUID: JSMRO0d3Tqqy+W24F5+Aqg==
X-CSE-MsgGUID: W30az0ITQce2/qGJ34AM+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; 
   d="scan'208";a="252689954"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 15 Jun 2026 13:28:50 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZDvM-000000004xx-0BsX;
	Mon, 15 Jun 2026 20:28:48 +0000
Date: Mon, 15 Jun 2026 22:28:26 +0200
From: kernel test robot <lkp@intel.com>
To: Tejas <tejasmutalikdesai@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 linux-doc@vger.kernel.org
Subject: htmldocs: Warning: arch/arm/xen/enlighten.c references a
 file that doesn't exist: Documentation/devicetree/bindings/arm/xen.txt
Message-ID: <202606152212.PIzfdQ9f-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92427-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:tejasmutalikdesai@gmail.com,m:oe-kbuild-all@lists.linux.dev,m:lkp@intel.com,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[lkp@intel.com,linux-doc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,intel.com:dkim,intel.com:email,intel.com:mid,intel.com:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 67A8A689D7F

tree:   https://github.com/intel-lab-lkp/linux/commits/Tejas/dt-bindings-arm-xen-Convert-xen-txt-to-YAML-schema/20260615-192753
head:   bf21bdc2f6582e22a01abfd47458d687bad86743
commit: bf21bdc2f6582e22a01abfd47458d687bad86743 dt-bindings: arm: xen: Convert xen.txt to YAML schema
date:   9 hours ago
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260615/202606152212.PIzfdQ9f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606152212.PIzfdQ9f-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/zh_CN/how-to.rst references a file that doesn't exist: Documentation/xxx/xxx.rst
   Warning: Documentation/translations/zh_CN/networking/xfrm_proc.rst references a file that doesn't exist: Documentation/networking/xfrm_proc.rst
   Warning: Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst references a file that doesn't exist: Documentation/Configure.help
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/ABI/testing/sysfs-platform-ayaneo
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt
>> Warning: arch/arm/xen/enlighten.c references a file that doesn't exist: Documentation/devicetree/bindings/arm/xen.txt
   Warning: arch/powerpc/sysdev/mpic.c references a file that doesn't exist: Documentation/devicetree/bindings/powerpc/fsl/mpic.txt
   Warning: drivers/net/ethernet/smsc/Kconfig references a file that doesn't exist: file:Documentation/networking/device_drivers/ethernet/smsc/smc9.rst
   Warning: rust/kernel/sync/atomic/ordering.rs references a file that doesn't exist: srctree/tools/memory-model/Documentation/explanation.txt
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: Documentation/virtual/lguest/lguest.c
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: m,\b(\S*)(Documentation/[A-Za-z0-9

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

