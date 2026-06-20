Return-Path: <linux-doc+bounces-92988-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YpBBFU7VNmqPFQcAu9opvQ
	(envelope-from <linux-doc+bounces-92988-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 20 Jun 2026 20:00:46 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D42B16A9711
	for <lists+linux-doc@lfdr.de>; Sat, 20 Jun 2026 20:00:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=BD5t3mqb;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92988-lists+linux-doc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-doc+bounces-92988-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 109163003BC8
	for <lists+linux-doc@lfdr.de>; Sat, 20 Jun 2026 18:00:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F7622EC571;
	Sat, 20 Jun 2026 18:00:41 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09CDC23392B
	for <linux-doc@vger.kernel.org>; Sat, 20 Jun 2026 18:00:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781978441; cv=none; b=k1EONnvecRIiEpjkUDIg/aXALnQqYsOQZdN87tDb1JUnTSeCQX/sLmUJBT9VCD/BPEzjjPgjW4d7ae+ub1wjY6TucyaM4ieP30sQMmfQkYqjiRs5klviXN9pDTuOFwfBQy2yw7I9MVqM37LWmzc2wQvxtOiNlc2007ec168ttmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781978441; c=relaxed/simple;
	bh=vufYTHg5KbZsl2Z1Y7JLC29LOL/oWg0GcpcgNuxRnuI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=r7bHijz3i1EzpYWmiVl1KeiEAW/wq+gsFj2bkytV9dqZkh5NKalO0RNMiPLeze/wtA5E7p0VkAjIyvwLb+4JnWdr57jiWunVLygsb1bFWbyxhi7ULjmCTuLUyIrZDmFmZ238HBPGZ3jXyrJarzxuuFv1+j+oc5I9ojx04Cqzc0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BD5t3mqb; arc=none smtp.client-ip=192.198.163.19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781978437; x=1813514437;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vufYTHg5KbZsl2Z1Y7JLC29LOL/oWg0GcpcgNuxRnuI=;
  b=BD5t3mqbejQh6z/LpbLsT/z2nd/LTA0kKlM8m07DZq078iG4TGJHrWgX
   YRPVrwMfywx5PdO616Lc4T9WEZ2F6vx9fXxqgy8ziEONXO4bs6xO95i4K
   FwIXlMjR0dvuQkgMy+7pOYEXE8rR78K+h2ycj9VyKRdJiUGBsyBU+5hJz
   8TVjB+h3WoK2waSGvr29yIiBb1z8MU1xRYGrv432aqz8wwpd8/gIAWK0V
   +uCVi+4mdG6+qAOW18vnZP/sL8oFf5DabLUshuZZy651A9BVLP01cI7g3
   cVl2aqpbCPTHa4nXIRj+vFLGsdZs1VjcLcGXqUEJY9WHtObCK347xU5B0
   w==;
X-CSE-ConnectionGUID: uTTfn1YsSeuB8wd94rlX2A==
X-CSE-MsgGUID: b0WBmIsKTF+3z2bGol7yNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11823"; a="81751914"
X-IronPort-AV: E=Sophos;i="6.24,215,1774335600"; 
   d="scan'208";a="81751914"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2026 11:00:37 -0700
X-CSE-ConnectionGUID: nzFAam2GTR6D61ouAbIsJw==
X-CSE-MsgGUID: zqHMjKGzSayrrHBJ/TCD4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,215,1774335600"; 
   d="scan'208";a="248899306"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 20 Jun 2026 11:00:35 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wazzc-000000005k1-2xLg;
	Sat, 20 Jun 2026 18:00:32 +0000
Date: Sat, 20 Jun 2026 19:59:39 +0200
From: kernel test robot <lkp@intel.com>
To: "Stefan =?utf-8?Q?D=C3=B6singer"?= <stefandoesinger@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [stefandoesinger-zx297520:mfd 2/124] htmldocs: Warning:
 MAINTAINERS references a file that doesn't exist:
 Documentation/devicetree/zte,zx297520v3-*
Message-ID: <202606201944.Xa050xUX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92988-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[lkp@intel.com,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:stefandoesinger@gmail.com,m:oe-kbuild-all@lists.linux.dev,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-doc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,gitlab.com:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D42B16A9711

tree:   https://gitlab.com/stefandoesinger/zx297520-kernel mfd
head:   c94d760b3ed42a18ecbae9e63d7010c770a8c042
commit: 1e6a3951315be7aa7acb8380b0bb39dde1507e4b [2/124] dt-bindings: clk: zte: Add zx297520v3 top clock and reset bindings
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260620/202606201944.Xa050xUX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606201944.Xa050xUX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/zh_CN/filesystems/gfs2-uevents.rst references a file that doesn't exist: Documentation/filesystems/gfs2-uevents.rst
   Warning: Documentation/translations/zh_CN/filesystems/gfs2.rst references a file that doesn't exist: Documentation/filesystems/gfs2.rst
   Warning: Documentation/translations/zh_CN/how-to.rst references a file that doesn't exist: Documentation/xxx/xxx.rst
   Warning: Documentation/translations/zh_CN/networking/xfrm_proc.rst references a file that doesn't exist: Documentation/networking/xfrm_proc.rst
   Warning: Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst references a file that doesn't exist: Documentation/Configure.help
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/zte,zx297520v3-*
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/ABI/testing/sysfs-platform-ayaneo
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
   Warning: arch/powerpc/sysdev/mpic.c references a file that doesn't exist: Documentation/devicetree/bindings/powerpc/fsl/mpic.txt
   Warning: drivers/net/ethernet/smsc/Kconfig references a file that doesn't exist: file:Documentation/networking/device_drivers/ethernet/smsc/smc9.rst

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

