Return-Path: <linux-doc+bounces-92261-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ASQWOkoZLWoGbgQAu9opvQ
	(envelope-from <linux-doc+bounces-92261-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 13 Jun 2026 10:48:10 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 376A567E2AB
	for <lists+linux-doc@lfdr.de>; Sat, 13 Jun 2026 10:48:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=eA85ulGo;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92261-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-92261-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5D6A03022AAD
	for <lists+linux-doc@lfdr.de>; Sat, 13 Jun 2026 08:47:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19287377EDD;
	Sat, 13 Jun 2026 08:47:26 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D0733DEE6
	for <linux-doc@vger.kernel.org>; Sat, 13 Jun 2026 08:47:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781340445; cv=none; b=IlbCR1wVXjVtOV6QZkAm9GKKoYmcLKKKt8HE31Ux+jo/0jtIMueRqMicPi5U4TB3pEJ5UgjsQop/VJ20vGMS+R9moeWtfnoCBfA1O0DF0j4FXQhFu14ohND9sr5QutyMYREYmspnF8EHVulpzKv5IPVM3bWBBPt/WMH8ZHXdleU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781340445; c=relaxed/simple;
	bh=Kgzsl0tncuHZeTuBwNzv6yFl+GswrXYwmaXTRoqwsag=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZPcnVKc8+Kn0nZQLw9mpppORBmCtwgdyceU9jome150XU57T6ci0NsjL5AbnkkhSrFfCQEmWvLE8dWIs6F0tR7BeGqr8SVFe2lRv9NNkluam8uGn1m1gHpmpspIK70ZGGOEwiRSoEnNx4nJz2sCfbwwdllnzIw39ozrp5y75xlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eA85ulGo; arc=none smtp.client-ip=192.198.163.13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781340441; x=1812876441;
  h=date:from:to:cc:subject:message-id;
  bh=Kgzsl0tncuHZeTuBwNzv6yFl+GswrXYwmaXTRoqwsag=;
  b=eA85ulGov1kIGaZCkvVUWXOMnU0na7FNfQZckCmjxwceJkhcBVtq4CUd
   AibJef1npLvKywOyRGdfw0QzYSZ+fgjgJpSKIF5OrFdJBxWB2K/CPIIsn
   vW3a37hjzmGJEBIz45x+1UBdNasA5677nTdeghlZQsTE/YUQkCsy3j6JK
   MX73pCdoS8BMfJfnJEXSYiko2CPmrIt1sfO/TozHUWRI0x6NnrC+9hNxN
   74gZ9wT0H0tF0ZfyRqyh/yUOp8Ssoem9prp4E/kvLnR9A7Itv9ZF+L8mO
   /WlDFWf+etk7ufkNpWg1dmg2HsVXLeD4k0hsLQrxziAVoDhBh1bhoUDNq
   w==;
X-CSE-ConnectionGUID: PERxIc/uQ3u4Ql9NVX/exQ==
X-CSE-MsgGUID: OFCDeDVnQPGnzxWEyg3lFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="84731366"
X-IronPort-AV: E=Sophos;i="6.24,202,1774335600"; 
   d="scan'208";a="84731366"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2026 01:47:20 -0700
X-CSE-ConnectionGUID: imk3Wj0iTzeRjOpt91OhAg==
X-CSE-MsgGUID: MD902VapTHyW2Hg3j5ozjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,202,1774335600"; 
   d="scan'208";a="247088685"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 13 Jun 2026 01:47:19 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYK1M-000000004T1-2gmb;
	Sat, 13 Jun 2026 08:47:16 +0000
Date: Sat, 13 Jun 2026 10:46:51 +0200
From: kernel test robot <lkp@intel.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [cris:scmi_telemetry_unified_fs_V4 23/34] htmldocs:
 Documentation/filesystems/stlmfs.rst: WARNING: document isn't included in any
 toctree [toc.not_included]
Message-ID: <202606131001.iJbU6AyB-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92261-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[lkp@intel.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:cristian.marussi@arm.com,m:oe-kbuild-all@lists.linux.dev,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:dkim,intel.com:email,intel.com:mid,intel.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 376A567E2AB

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cris/linux.git scmi_telemetry_unified_fs_V4
head:   ed28087005811783e972fe7a788446936878932f
commit: a4696bbff34cf8e311ab878fc616567844b576ee [23/34] fs/stlmfs: Document ARM SCMI Telemetry filesystem
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260613/202606131001.iJbU6AyB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606131001.iJbU6AyB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/userspace-api/landlock:550: ./include/uapi/linux/landlock.h:45: ERROR: Unknown target name: "network flags". [docutils]
   Documentation/userspace-api/landlock:550: ./include/uapi/linux/landlock.h:50: ERROR: Unknown target name: "scope flags". [docutils]
   Documentation/userspace-api/landlock:550: ./include/uapi/linux/landlock.h:24: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:559: ./include/uapi/linux/landlock.h:168: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:559: ./include/uapi/linux/landlock.h:191: ERROR: Unknown target name: "network flags". [docutils]
>> Documentation/filesystems/stlmfs.rst: WARNING: document isn't included in any toctree [toc.not_included]
   WARNING: Documentation/ABI/testing/stlmfs not found
   Documentation/networking/skbuff:36: ./include/linux/skbuff.h:181: WARNING: Failed to create a cross reference. A title or caption not found: 'crc' [ref.ref]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

