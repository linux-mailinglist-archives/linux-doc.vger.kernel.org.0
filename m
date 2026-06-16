Return-Path: <linux-doc+bounces-92461-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2CzoCbnoMGpuYgUAu9opvQ
	(envelope-from <linux-doc+bounces-92461-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 16 Jun 2026 08:10:01 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EBB768C5FA
	for <lists+linux-doc@lfdr.de>; Tue, 16 Jun 2026 08:10:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=bLO6Tfss;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92461-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-92461-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8483A30547D7
	for <lists+linux-doc@lfdr.de>; Tue, 16 Jun 2026 06:07:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AEC93DA7C0;
	Tue, 16 Jun 2026 06:07:01 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB633D891B
	for <linux-doc@vger.kernel.org>; Tue, 16 Jun 2026 06:06:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781590021; cv=none; b=B3ioYMnXqicyHQmGwX4mAV0UgxKu8xwjS9Z4nUnhPNPXNLUMxQQQDg6+7CJe63GNX89s3/6yyNJqf0bcrCBuxusdWsOn+OMG4QR+7L78JGEUnL8AE0ienchxMrWayv4qjO2DwaOUZXHDtXGNT/+LRv2y1yuJV2FFclHUI31I2A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781590021; c=relaxed/simple;
	bh=Q0Fp6a86IGkguvOayYMWhGMAzYMs0Ck6GfgP+UKoo2A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Mr8oq3FqX1Y1iq651zUL5sF4KQ9s/g8u19/0K/sZCLJ9519F0jKOmleGI52DZLo7DkEkEHPOR929DucgoeleRDJqIwS82WCx7ubdxrx9g7ZvSVQTzjM24WBDoWUgPj3os9udxjS7MU08ajei4zdYcrCHI8uqbUszszmQ8L30yP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bLO6Tfss; arc=none smtp.client-ip=192.198.163.14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781590020; x=1813126020;
  h=date:from:to:cc:subject:message-id;
  bh=Q0Fp6a86IGkguvOayYMWhGMAzYMs0Ck6GfgP+UKoo2A=;
  b=bLO6Tfss2QyDbnat3NeRId+jCpYtcFCsdyFYqs3IsUXLOT0Aj7uduwy6
   aZLK85VirjCpQyiY9awzbocBFtS67iHn9/55/rjmFEZBvImq4364vOMLc
   BdZqLINha7LFx7yMvHWpUWnjJbriifuQmTMKx249xbLmCJ/6s0UCel/AX
   0rEXS03/f1uFDm0ibcTw8JqwFfsJlVaziFCqo5++3FfhyVnGtJefu99v2
   6Zn87nRhHxyJRaKZTqv6RNJ8FN4WrvQTZ14NaDFjpqDbfTaBD4A5W4PGX
   2vmKEQJDYR5gNWLee7MXEcPGv2Bs2hLgW0Cuofz6pFsMzZuRHL9f7+suO
   g==;
X-CSE-ConnectionGUID: l1/dCQ2NS5OB9+5GeUwtBA==
X-CSE-MsgGUID: k/iE52TkTPCQ9qi5mHNEmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="82387628"
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; 
   d="scan'208";a="82387628"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 23:06:59 -0700
X-CSE-ConnectionGUID: QaiTdyNoThmDBEFu8pXUgQ==
X-CSE-MsgGUID: 4BbZc6Z2TZyiA++EJGQUZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; 
   d="scan'208";a="247747156"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 15 Jun 2026 23:06:58 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZMwn-0000000053x-2On1;
	Tue, 16 Jun 2026 06:06:53 +0000
Date: Tue, 16 Jun 2026 08:06:15 +0200
From: kernel test robot <lkp@intel.com>
To: Paul Moore <paul@paul-moore.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [linuxsecuritymodule:main 1/1] htmldocs: Warning: README.md
 references a file that doesn't exist: Documentation/API/obsolete
Message-ID: <202606160846.O1FzSF0E-lkp@intel.com>
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
	TAGGED_FROM(0.00)[bounces-92461-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[lkp@intel.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:paul@paul-moore.com,m:oe-kbuild-all@lists.linux.dev,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_THREE(0.00)[3];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:dkim,intel.com:email,intel.com:mid,intel.com:from_mime,security.md:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0EBB768C5FA

tree:   https://github.com/LinuxSecurityModule/kernel main
head:   fac1e95155f2b940a514438e0b25c0fd543207d7
commit: fac1e95155f2b940a514438e0b25c0fd543207d7 [1/1] lsm: add a LSM specific README.md and SECURITY.md
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260616/202606160846.O1FzSF0E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606160846.O1FzSF0E-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/zh_CN/how-to.rst references a file that doesn't exist: Documentation/xxx/xxx.rst
   Warning: Documentation/translations/zh_CN/networking/xfrm_proc.rst references a file that doesn't exist: Documentation/networking/xfrm_proc.rst
   Warning: Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst references a file that doesn't exist: Documentation/Configure.help
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/ABI/testing/sysfs-platform-ayaneo
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt
>> Warning: README.md references a file that doesn't exist: Documentation/API/obsolete
>> Warning: README.md references a file that doesn't exist: Documentation/API/obsolete
>> Warning: README.md references a file that doesn't exist: Documentation/API/obsolete
   Warning: arch/powerpc/sysdev/mpic.c references a file that doesn't exist: Documentation/devicetree/bindings/powerpc/fsl/mpic.txt
   Warning: drivers/net/ethernet/smsc/Kconfig references a file that doesn't exist: file:Documentation/networking/device_drivers/ethernet/smsc/smc9.rst
   Warning: rust/kernel/sync/atomic/ordering.rs references a file that doesn't exist: srctree/tools/memory-model/Documentation/explanation.txt
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: Documentation/virtual/lguest/lguest.c
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: m,\b(\S*)(Documentation/[A-Za-z0-9

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

