Return-Path: <linux-doc+bounces-95111-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1RTfMYyHS2oVUwEAu9opvQ
	(envelope-from <linux-doc+bounces-95111-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 06 Jul 2026 12:46:36 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E8070F6FA
	for <lists+linux-doc@lfdr.de>; Mon, 06 Jul 2026 12:46:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=Tsv6yQNI;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95111-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-95111-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 674EC32B475B
	for <lists+linux-doc@lfdr.de>; Mon,  6 Jul 2026 10:03:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E97F3BD643;
	Mon,  6 Jul 2026 09:45:52 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF9447ECF3
	for <linux-doc@vger.kernel.org>; Mon,  6 Jul 2026 09:45:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783331150; cv=none; b=EWU2sVFcUTPGoG201GUzDPJ92ABS1npHE4csEOd1yEYfRZVFIOFm/xdx2oW5RQYI2Obe9z1RzoNQoPoasBy4EhrzdiKfDwnbzs878f3XTGdAyaq9/h8Z2x/KZpJ2nzgBDb9fhIJGaWGGSqYVRdPF9knmAAnZEFG3IludUHO+sX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783331150; c=relaxed/simple;
	bh=q189WGn34qM2moSB3qZyY2303QsSTnuM/pRUOyObkRU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bUtdfBmUURypttheHyZT/gO/5HujOTLSHVLKfngJPXkepD/2g/Os4/zz7tdzTD/bTokPVVrCR43KQ5sg7HKXfFKS/plgL4OMWXcGACCaa0qtsF48wiETTw79SaWuG07dcoPSDVmb4nQbfkdZeHPaMcUpB/BNMYF7MFeD0O0JS6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tsv6yQNI; arc=none smtp.client-ip=198.175.65.21
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783331147; x=1814867147;
  h=date:from:to:cc:subject:message-id;
  bh=q189WGn34qM2moSB3qZyY2303QsSTnuM/pRUOyObkRU=;
  b=Tsv6yQNImGIscPKoGWGCeR5FsEfhgFrI7eZLlZhwmxvT3JKkqP5rcq3k
   KcJP09iHjARZHQNz7z9804ICTv+5obcuAMbwWxgjcjSCmx28kl51uxx4a
   1K030Ko2y30hdO7tQU5geK30bekuDwo77L2j0/PoOyDpRPzATNxUvDkQ8
   AArlZ0VZE5n481fUdFqvt/qiXIbuolTt1HLBWzmYLKWr2TxpXsFiUu4hm
   cSi4P0RbAlU8H/1X79vMBdzNn/WT8di6S8ijROvwvR/wwF0IdSI7LXC6P
   UyjQ/ephx3BN06tbiT0RBJoigpqJWdWLHtWJsSR8PoKXvFFyd869+UmNv
   g==;
X-CSE-ConnectionGUID: 6vLmx3iES/uWXFYx4xgUgA==
X-CSE-MsgGUID: qSVlJNexTMywECXdr9oKlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="83824008"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="83824008"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 02:45:41 -0700
X-CSE-ConnectionGUID: fWIsxca7SlqG0q+YMUITKA==
X-CSE-MsgGUID: up3BtbU2SRKszq4Na6yE0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="276881893"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 06 Jul 2026 02:45:38 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wgftQ-000000002A9-21Aa;
	Mon, 06 Jul 2026 09:45:36 +0000
Date: Mon, 06 Jul 2026 11:45:25 +0200
From: kernel test robot <lkp@intel.com>
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: oe-kbuild-all@lists.linux.dev, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, linux-doc@vger.kernel.org
Subject: [alexs:docs-next 3/7] htmldocs: Warning:
 Documentation/translations/zh_CN/how-to.rst references a file that doesn't
 exist: Documentation/translations/zh_CN/xxx.rst
Message-ID: <202607061141.fmjoYjew-lkp@intel.com>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95111-lists,linux-doc=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dzm91@hust.edu.cn,m:oe-kbuild-all@lists.linux.dev,m:alexs@kernel.org,m:si.yanteng@linux.dev,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[lkp@intel.com,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,intel.com:from_mime,intel.com:email,intel.com:mid,intel.com:dkim,01.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 25E8070F6FA

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/alexs/linux.git docs-next
head:   bc2e3e1124b7362f83c5fb8557274bbca3da1a74
commit: 359c3caf50481aa08b0ab761436e4b70ad027f73 [3/7] docs/zh_CN: restructure how-to.rst patch submission workflow
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260706/202607061141.fmjoYjew-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607061141.fmjoYjew-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/zh_CN/doc-guide/parse-headers.rst references a file that doesn't exist: Documentation/userspace-api/media/Makefile
   Warning: Documentation/translations/zh_CN/filesystems/gfs2-glocks.rst references a file that doesn't exist: Documentation/filesystems/gfs2-glocks.rst
   Warning: Documentation/translations/zh_CN/filesystems/gfs2-uevents.rst references a file that doesn't exist: Documentation/filesystems/gfs2-uevents.rst
   Warning: Documentation/translations/zh_CN/filesystems/gfs2.rst references a file that doesn't exist: Documentation/filesystems/gfs2.rst
   Warning: Documentation/translations/zh_CN/how-to.rst references a file that doesn't exist: Documentation/xxx/xxx.rst
>> Warning: Documentation/translations/zh_CN/how-to.rst references a file that doesn't exist: Documentation/translations/zh_CN/xxx.rst
   Warning: Documentation/translations/zh_CN/networking/xfrm_proc.rst references a file that doesn't exist: Documentation/networking/xfrm_proc.rst
   Warning: Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst references a file that doesn't exist: Documentation/Configure.help
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/ABI/testing/sysfs-platform-ayaneo
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt
   Warning: arch/powerpc/sysdev/mpic.c references a file that doesn't exist: Documentation/devicetree/bindings/powerpc/fsl/mpic.txt

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

