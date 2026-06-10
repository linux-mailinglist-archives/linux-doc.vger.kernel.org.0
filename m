Return-Path: <linux-doc+bounces-91875-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9lQsJBXAKWrccgMAu9opvQ
	(envelope-from <linux-doc+bounces-91875-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 10 Jun 2026 21:50:45 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 322A866C95B
	for <lists+linux-doc@lfdr.de>; Wed, 10 Jun 2026 21:50:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=FAMt5I8W;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91875-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-91875-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 76B63300E29C
	for <lists+linux-doc@lfdr.de>; Wed, 10 Jun 2026 19:50:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C87930C629;
	Wed, 10 Jun 2026 19:50:43 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B805D31F9A5
	for <linux-doc@vger.kernel.org>; Wed, 10 Jun 2026 19:50:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781121043; cv=none; b=fua5naUHHWOoMReSVECcG7k0Vnu/HNSTDPRy2nSenwDlkf0qYEkZvkXqDA2XADRLsa2tyK0lQu+ezMONiSuUzOF1XZHocGpCVYK5Fj15AQ8dzzKMVVAGzm+t6g6WbGASFa3IipqtcA4K7/uo5+tCpHLjU2zBDbvHCuinZdNKvN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781121043; c=relaxed/simple;
	bh=+wjy6D3TwWyaJRktI7l1nYayo5eOexSl21UxkKHCaK0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Th+uKbTjZrZSe6pgOSN3zuGjNg/cj4T6vtM0TBrVyfkw7e9JAIqEKT8NkKbQjNtpK6N0haCBF8xaGlvpnl+yCC0Fg/oRwNQrB62O/n9VeqvAFNz+FwssdqZkI1OEakClHTiuNeRkQggSCNXxFrXFYuEHtc+e65ZhoARywfHOQUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FAMt5I8W; arc=none smtp.client-ip=192.198.163.7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781121041; x=1812657041;
  h=date:from:to:cc:subject:message-id;
  bh=+wjy6D3TwWyaJRktI7l1nYayo5eOexSl21UxkKHCaK0=;
  b=FAMt5I8W1M8eoYoub+cZQ+nOF2jxPetVZBXiVa63JeMHfW+UOUt1me5P
   2UBrcg5dzCvZrCSsMULKanvCvpGkmdPuiXikKg4plMWAXfQFbafeTjlZr
   43C4BDwaZHAnox9lYS41OrKoC+FQulTT30h58Vb78DWgCwNcUIfJSpvRm
   6vHUZBhVAxHH9hllgY5P1aZL5Jazq2azTnNDTCgxdyQvbSXvGqD9rhHP+
   MyhdXA8v1GjQA78vd3wBTdrx8brcHH8YY/Zpgg29HCFVAzvJ8XbeJPRtH
   Q/iea3N8ohQ508VX52E3qjTFDtYdghQRMwd2nRq1rLhGLBH6PMeODv4h8
   w==;
X-CSE-ConnectionGUID: Sk2X6ZVgTM6SpuuxvLS2HQ==
X-CSE-MsgGUID: 0RIAwBwMTmeQ42v8GomZ6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="107364026"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="107364026"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 12:50:41 -0700
X-CSE-ConnectionGUID: +LZjT86QRFOjlLSWHaFrLg==
X-CSE-MsgGUID: EYycuIIoTraJOSDIKyOiYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="248134767"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 10 Jun 2026 12:50:40 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXOwg-000000003oR-09H4;
	Wed, 10 Jun 2026 19:50:38 +0000
Date: Wed, 10 Jun 2026 21:50:05 +0200
From: kernel test robot <lkp@intel.com>
To: Jason Li <jason.lee651024@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 linux-doc@vger.kernel.org
Subject: htmldocs: Warning:
 drivers/tty/serial/serial_cortina-access.c references a file that doesn't
 exist: Documentation/serial/driver
Message-ID: <202606102102.JsRIO7Np-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-91875-lists,linux-doc=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[lkp@intel.com,linux-doc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:jason.lee651024@gmail.com,m:oe-kbuild-all@lists.linux.dev,m:lkp@intel.com,m:linux-doc@vger.kernel.org,m:jasonlee651024@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,intel.com:dkim,intel.com:email,intel.com:mid,intel.com:from_mime,01.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 322A866C95B

tree:   https://github.com/intel-lab-lkp/linux/commits/Jason-Li/dt-bindings-serial-Add-binding-for-Cortina-Access-UART/20260610-193842
head:   e97c7dd14b20885c9b9f27daf2c6e0cd9e99d82a
commit: 2b08fdba152665eca1c8194820608a3f284143b6 tty: serial: Add UART driver for Cortina-Access platform
date:   8 hours ago
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260610/202606102102.JsRIO7Np-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606102102.JsRIO7Np-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst references a file that doesn't exist: Documentation/Configure.help
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/ABI/testing/sysfs-platform-ayaneo
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt
   Warning: arch/powerpc/sysdev/mpic.c references a file that doesn't exist: Documentation/devicetree/bindings/powerpc/fsl/mpic.txt
   Warning: drivers/net/ethernet/smsc/Kconfig references a file that doesn't exist: file:Documentation/networking/device_drivers/ethernet/smsc/smc9.rst
>> Warning: drivers/tty/serial/serial_cortina-access.c references a file that doesn't exist: Documentation/serial/driver
   Warning: rust/kernel/sync/atomic/ordering.rs references a file that doesn't exist: srctree/tools/memory-model/Documentation/explanation.txt
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: Documentation/virtual/lguest/lguest.c
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: m,\b(\S*)(Documentation/[A-Za-z0-9
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: Documentation/devicetree/dt-object-internal.txt
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: m,^Documentation/scheduler/sched-pelt

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

