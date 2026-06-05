Return-Path: <linux-doc+bounces-91063-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id B933HL2kImqVbQEAu9opvQ
	(envelope-from <linux-doc+bounces-91063-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 05 Jun 2026 12:28:13 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD8E64751E
	for <lists+linux-doc@lfdr.de>; Fri, 05 Jun 2026 12:28:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=HofnSiFS;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91063-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-91063-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AEDD1307082B
	for <lists+linux-doc@lfdr.de>; Fri,  5 Jun 2026 10:21:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 772AA3F8235;
	Fri,  5 Jun 2026 10:21:22 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99CB63F86F9
	for <linux-doc@vger.kernel.org>; Fri,  5 Jun 2026 10:21:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780654882; cv=none; b=qjH43mhispHPZQyrnnLaL7C8JoDEHWHVfObwT+fW4AF2IqIkvEcT1wdO5SpPVn56hMeLKEmaSsHzap3YI9KCCkSQBvDKHwpIOggpEdSfNs6dgQEbJeyp7z6vRZdCWUSqMHgbdi0Bn9SvpfrcmJLUXL9ELlJ8RMU6/31ZKR7aw4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780654882; c=relaxed/simple;
	bh=ie3GRjxl0cyf+qBdzTomRfNMHREX/zp0/C+XwYA1dx8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nn6JbicTYif9drcavYPsd/0EdEPO3j78quxpwBBO86XZs37RhIoNKOf473m482nuSsu4EpuwXpLIIT0Tep9To0hEqzJHdA+jBzPWma0I28Q64JufMPnBSod/5h8ZSEWmftTnY8OM0w1ZZHIhmwmMO4YNqqO5nvZFFp8I+ox/z9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HofnSiFS; arc=none smtp.client-ip=198.175.65.15
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780654876; x=1812190876;
  h=date:from:to:cc:subject:message-id;
  bh=ie3GRjxl0cyf+qBdzTomRfNMHREX/zp0/C+XwYA1dx8=;
  b=HofnSiFS20utpWrkUyNslZh+D3BtehWyMiddfabRwKeZzcciw50O4MQs
   VyDoEjiLxvdZ9RtcIqXd86hXLLa6XlhP22uktYlGgxRfr5P6oNBOTkgwB
   mw1Sb3hZhz+yatUMosj8ILRvYXUevp0G04QPZxcr0flvonT481ZsFDkc5
   Cevpg2uwa5SfHbIysrtNUP8aGeKPeIOktV2bh6FHQSiiH3EP5O6amdrE9
   4EFePBpecv+Lils9ZGlxMilNr8Oy1guPsAtygxmNykc3YspkFc1fPTuaP
   hsBvtM3qXkEhrz2T8wGb0Th3DPRa7Ng+pCrqa1SPAaw4TCQTtEK/4NKsC
   Q==;
X-CSE-ConnectionGUID: YSUBFUAvReu+3OV7CFbnaA==
X-CSE-MsgGUID: iD0ZVETtTR+Iyrm8Ohcxdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="85108883"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="85108883"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 03:21:15 -0700
X-CSE-ConnectionGUID: +kn90ilpQ6m6wizLOBdVYg==
X-CSE-MsgGUID: OKPs+Oc+THS4/NkoNZ2eFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="240359363"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 05 Jun 2026 03:21:14 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVRfs-000000002YX-1aWr;
	Fri, 05 Jun 2026 10:21:12 +0000
Date: Fri, 05 Jun 2026 12:20:13 +0200
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [gourryinverse:scratch/gourry/managed_nodes/dax_base 4/9]
 htmldocs: Documentation/core-api/mm-api:131: ./mm/memory_hotplug.c:1657:
 WARNING: Block quote ends without a blank line; unexpected unindent.
 [docutils]
Message-ID: <202606051201.tRXGL6l7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.91 / 15.00];
	LONG_SUBJ(1.58)[210];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91063-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[lkp@intel.com,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:gourry@gourry.net,m:oe-kbuild-all@lists.linux.dev,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_THREE(0.00)[3];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:mid,intel.com:dkim,intel.com:from_mime,intel.com:email,01.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DBD8E64751E

Hi Gregory,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/gourryinverse/linux scratch/gourry/managed_nodes/dax_base
head:   6d4daeccc0cecd3b478eb62b30d4e91f501447ed
commit: 8fc7484466b6a2fe5c68ced2feb37ab4bd22ed01 [4/9] mm/memory_hotplug: add __add_memory_driver_managed() with online_type arg
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260605/202606051201.tRXGL6l7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606051201.tRXGL6l7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   ------------------------------------------------------------------------------------------------^
   Documentation/core-api/kref:328: ./include/linux/kref.h:94: WARNING: Invalid C declaration: Expected end of definition. [error at 92]
   int kref_put_lock (struct kref *kref, void (*release)(struct kref *kref), spinlock_t *lock) __cond_acquires(true# lock)
   --------------------------------------------------------------------------------------------^
   Documentation/core-api/mm-api:131: ./mm/memory_hotplug.c:1656: ERROR: Unexpected indentation. [docutils]
>> Documentation/core-api/mm-api:131: ./mm/memory_hotplug.c:1657: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/driver-api/basics:42: ./kernel/time/time.c:370: WARNING: Duplicate C declaration, also defined at driver-api/basics:436.
   Declaration is '.. c:function:: unsigned int jiffies_to_msecs (const unsigned long j)'. [duplicate_declaration.c]
   Documentation/driver-api/basics:42: ./kernel/time/time.c:393: WARNING: Duplicate C declaration, also defined at driver-api/basics:453.
   Declaration is '.. c:function:: unsigned int jiffies_to_usecs (const unsigned long j)'. [duplicate_declaration.c]
   Documentation/driver-api/target:25: ./drivers/target/target_core_user.c:35: ERROR: Unexpected section title.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

