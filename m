Return-Path: <linux-doc+bounces-92740-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id scmxJnTcM2qSHQYAu9opvQ
	(envelope-from <linux-doc+bounces-92740-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 18 Jun 2026 13:54:28 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3757F69FD7C
	for <lists+linux-doc@lfdr.de>; Thu, 18 Jun 2026 13:54:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b="lXhw/UGG";
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92740-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-92740-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 829E83016774
	for <lists+linux-doc@lfdr.de>; Thu, 18 Jun 2026 11:54:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 951B139AD3A;
	Thu, 18 Jun 2026 11:54:24 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328353909BF
	for <linux-doc@vger.kernel.org>; Thu, 18 Jun 2026 11:54:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781783664; cv=none; b=iM7gCDsgdAFoJR3ICp6AIX5CIsKovvghF8ViPgPjiqFQ5aOpDv5W5qIUGygCgS7lKvLqVxrj0xjooHMnth4tB4rFCD4J0PuP33unj7+h9ILWpgIQcgGVE6k6mSUehPRdg1W9rExL54Lk853GHilMlhDqTHPPpU/uPyi7W7rNSTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781783664; c=relaxed/simple;
	bh=aiTjH8qBsejlW7U3Ys21CxXC2X5umQflOQf+5N7VbuA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eTC8Ui1yGKaXBLOGbWwfl9SWUnruUUd8Is42rtkPyPINSfiU1D9Bpgq9Jx9VpAUsJw5YBq6K2fkcR3LEYgaPa8HjxCPbB1R8bvRG3qCWno1qIXR0rxxT9P6+oEwIyGH1uuWXCb8t0buMWiVtmCOJPdYf/qcQzpJsxU/M9CEjzBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lXhw/UGG; arc=none smtp.client-ip=192.198.163.19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781783663; x=1813319663;
  h=date:from:to:cc:subject:message-id;
  bh=aiTjH8qBsejlW7U3Ys21CxXC2X5umQflOQf+5N7VbuA=;
  b=lXhw/UGGsAbS8QbteuuHARIKPbCgQpyyfy/aHVYYim3ZdpHEQgaOOkR6
   lRsuozdPmhksiKGqs84TvJDhA9UiA9luS5DM/N9ehKj/9iRrerSDYxccg
   +XK5303quoHet1sxD9VT23L45mH3eJn0X6M/6/fEWbuGkbyZ5/YuegGSr
   tezq9OW7AFQXX22cBGJp+RN9g8KtHuJX6wheaX2B8sO9ksx6L4uPaprK9
   W0NC4OH1UZKJOBDI0b5OhPmGX6XeyJ2fENf1C4vrgIyiTj+JLR7BmxKpR
   VsPhqMn/dtJWnM3oE1S9lQeqReUnN9WibcsZpR8Bk2aWL/k8vHdopjX/W
   Q==;
X-CSE-ConnectionGUID: 1YPN5HauQl+S/6FfV+Xgjw==
X-CSE-MsgGUID: TBpGHyqwQzuzAnwrT29xqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="81600052"
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; 
   d="scan'208";a="81600052"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2026 04:54:22 -0700
X-CSE-ConnectionGUID: ghbNwit8T1KesZIFQGKpyQ==
X-CSE-MsgGUID: C9O7i/DMTACXfdm2jiJl4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; 
   d="scan'208";a="248413157"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 18 Jun 2026 04:54:21 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1waBK6-000000005Vp-41qi;
	Thu, 18 Jun 2026 11:54:18 +0000
Date: Thu, 18 Jun 2026 13:54:06 +0200
From: kernel test robot <lkp@intel.com>
To: Zhen Ni <zhen.ni@easystack.cn>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 linux-doc@vger.kernel.org
Subject: htmldocs: Documentation/mm/page_owner.rst:70: WARNING:
 Literal block expected; none found. [docutils]
Message-ID: <202606181325.BmDnZMdG-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92740-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[lkp@intel.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:zhen.ni@easystack.cn,m:oe-kbuild-all@lists.linux.dev,m:lkp@intel.com,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,intel.com:mid,intel.com:from_mime,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,01.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3757F69FD7C

tree:   https://github.com/intel-lab-lkp/linux/commits/Zhen-Ni/mm-page_owner-add-print_mode-filter/20260618-120023
head:   a6203d6b795b685775fd5306dd11f9f3d96de65b
commit: a6203d6b795b685775fd5306dd11f9f3d96de65b mm/page_owner: document page_owner filter
date:   8 hours ago
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260618/202606181325.BmDnZMdG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606181325.BmDnZMdG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Non-Preserved Properties
   ======================== [docutils]
>> Documentation/mm/page_owner.rst:70: WARNING: Literal block expected; none found. [docutils]
   Documentation/networking/skbuff:36: ./include/linux/skbuff.h:48: ERROR: Unexpected section title.


vim +70 Documentation/mm/page_owner.rst

    69	
  > 70	To filter page_owner output:
    71	
    72		cd tools/mm
    73		make page_owner_filter
    74	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

