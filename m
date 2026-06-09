Return-Path: <linux-doc+bounces-91712-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VZU+MYNFKGqcBQMAu9opvQ
	(envelope-from <linux-doc+bounces-91712-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 09 Jun 2026 18:55:31 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE60662A95
	for <lists+linux-doc@lfdr.de>; Tue, 09 Jun 2026 18:55:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=NuaRo4CI;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91712-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-91712-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C313F3403A43
	for <lists+linux-doc@lfdr.de>; Tue,  9 Jun 2026 16:24:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBD153B960B;
	Tue,  9 Jun 2026 16:23:24 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90BBF3B19B2
	for <linux-doc@vger.kernel.org>; Tue,  9 Jun 2026 16:23:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781022204; cv=none; b=DgtTmWklzbZzLQdHoiwcZRNzaRbLtVPLT81YDzvIDVyh0G7+rf79pbnLh4U9BHcCcBcnaEhjkb1xDbKociHf9LCDmJ+l/Po2FNxcJcffn4opbNXloJ2rh1qep8d8V+Dnfrp6Jv4DrwNMVMVSpxoFlT0u0lW206xgwIXNyf7tvSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781022204; c=relaxed/simple;
	bh=4Rh76SwmnDmAD/Q86RRDjEUdsE0kEl/n1hBiCLEO7KY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AnF5cObN4weyWBM4sG+qoTMu5elfYK68LcsaNs35AKBJ43CUOCRxXNOqRebS9CQfqeJCBhna5IMZfaH7W6ZM7Ye6q5zW9TR7pxTTUq4c76/MtcRpjXr2U9y78emwKMSkp3oX0SmzFamA/TujLCoQxkEzfw3KSyAOk+bFYPx/c7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NuaRo4CI; arc=none smtp.client-ip=192.198.163.11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781022202; x=1812558202;
  h=date:from:to:cc:subject:message-id;
  bh=4Rh76SwmnDmAD/Q86RRDjEUdsE0kEl/n1hBiCLEO7KY=;
  b=NuaRo4CIHsLN9tPQOGC6AnosUB4Hcd4mkhswk+pzlgNvbFU5cn/tsFO7
   nN6kFxFF+V3cBmwVfQ7n8jIEFqSvgF4HZYWUJKYjQZ2iWt4nnlupkgCTJ
   UyVuQjgnpYleGFzEUZhKfLWSxRo6CXgFmVDB1l+JAqHDTQJhqa7Qm0alK
   ZBSlEfKSrYyrtPMbsUkEZ5hCfFjJcKDi6D3MP2JFBriz1Rd2h4trXYmVj
   CkVkgt4D9yos37vKiUii/ZaCqm5bYG0g7VL7hVJvd6bxCulf2fmX3nbky
   ZQAK2LtzgjpM9kAVBfpGDdJXhe1MSODREgl8cUqQRFedQu22pjD0GXE0c
   w==;
X-CSE-ConnectionGUID: 6QC8bXDcSua4cBRMSRno0w==
X-CSE-MsgGUID: //ZVGIRMRCmR7D5GNm3ZbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="92355256"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="92355256"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 09:23:22 -0700
X-CSE-ConnectionGUID: /q+sjw7HQsiy+0wyO+7g5A==
X-CSE-MsgGUID: ZH7Djc5mQbqs2IZwgikEoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="250188499"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 09 Jun 2026 09:23:21 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wWzEU-000000003TZ-2fb0;
	Tue, 09 Jun 2026 16:23:18 +0000
Date: Tue, 09 Jun 2026 18:22:54 +0200
From: kernel test robot <lkp@intel.com>
To: Zhiping Zhang <zhipingz@meta.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 linux-doc@vger.kernel.org
Subject: htmldocs: Documentation/driver-api/dma-buf:145:
 ./include/linux/dma-buf.h:121: WARNING: Block quote ends without a blank
 line; unexpected unindent. [docutils]
Message-ID: <202606091818.rizEWJZ8-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91712-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[lkp@intel.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:zhipingz@meta.com,m:oe-kbuild-all@lists.linux.dev,m:lkp@intel.com,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,intel.com:dkim,intel.com:email,intel.com:mid,intel.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CEE60662A95

tree:   https://github.com/intel-lab-lkp/linux/commits/Zhiping-Zhang/net-mlx5-free-mlx5_st_idx_data-on-final-dealloc/20260609-033856
head:   17018c9e3c4f48eeb0404a61fd0cf942eaaddbb8
commit: 90816fc011a0d8855056adba3208381d2129d29f dma-buf: add optional get_tph() callback
date:   21 hours ago
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260609/202606091818.rizEWJZ8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606091818.rizEWJZ8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/driver-api/basics:42: ./kernel/time/time.c:370: WARNING: Duplicate C declaration, also defined at driver-api/basics:436.
   Declaration is '.. c:function:: unsigned int jiffies_to_msecs (const unsigned long j)'. [duplicate_declaration.c]
   Documentation/driver-api/basics:42: ./kernel/time/time.c:393: WARNING: Duplicate C declaration, also defined at driver-api/basics:453.
   Declaration is '.. c:function:: unsigned int jiffies_to_usecs (const unsigned long j)'. [duplicate_declaration.c]
   Documentation/driver-api/dma-buf:145: ./include/linux/dma-buf.h:120: ERROR: Unexpected indentation. [docutils]
>> Documentation/driver-api/dma-buf:145: ./include/linux/dma-buf.h:121: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
>> Documentation/driver-api/dma-buf:145: ./include/linux/dma-buf.h:123: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
   Documentation/driver-api/target:25: ./drivers/target/target_core_user.c:35: ERROR: Unexpected section title.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

