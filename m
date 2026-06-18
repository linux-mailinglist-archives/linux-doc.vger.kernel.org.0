Return-Path: <linux-doc+bounces-92730-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8vDJJ/x9M2rNCgYAu9opvQ
	(envelope-from <linux-doc+bounces-92730-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 18 Jun 2026 07:11:24 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AA79269DA52
	for <lists+linux-doc@lfdr.de>; Thu, 18 Jun 2026 07:11:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=HpmV7+Ti;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92730-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-92730-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 799B030115B0
	for <lists+linux-doc@lfdr.de>; Thu, 18 Jun 2026 05:11:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC61437E300;
	Thu, 18 Jun 2026 05:11:21 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81C637E2E2
	for <linux-doc@vger.kernel.org>; Thu, 18 Jun 2026 05:11:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781759481; cv=none; b=Mzfk5ctxpA7SrAPu98zozHL7/BBy7VO3LrpQX9SiJhm+wLMe7WLvL+J74G7d6pnqvQsrlJLd7RNF0sN6HSJ+nJBppe/P358m7YNJcQdUZBktSyztiwbsIrghkJn8AeuAUpvNP+hPruB/zif3F9+cGQlNScLExBTm4+QUHmhnKrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781759481; c=relaxed/simple;
	bh=YleL+2T+L75/D8Mv6H/VVFxiVyuNRqVawCM+4BSgXwM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RiBI7PSQR7DEj9Tdgwd32Zbp9HpWk9bY5HdeaxYbQi3Usa1V1DQpE9aThAp7Zd9RtMHbWtnawSjGlcnHKCgMaHSXyhdThxKFnQUIwo0+gnZ9qoEm9aefnuBnyKsjuAdB+6ejrMA24k+T7j/4SHLbksDP9cYFqjkLrUnMNm6u8TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HpmV7+Ti; arc=none smtp.client-ip=198.175.65.17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781759479; x=1813295479;
  h=date:from:to:cc:subject:message-id;
  bh=YleL+2T+L75/D8Mv6H/VVFxiVyuNRqVawCM+4BSgXwM=;
  b=HpmV7+TiXLpY5HY4BCpO6nHVbe3IxWw20M9XKp6sgDQYEmdBlffqEmq7
   QDKkM54AUf/qMn6vYtUEHWoRzFm0ecPevo32BqNRD2TDRWForPmIgf2Ji
   7Ta61syhJMDti15h6UaV1QsGg6EO9qHnFtMExKp2ql7wmEZOvtaY0CAiX
   IuGERULx8HhoA93VfpuuXoK9YVsq0yd49zOj0sSAoDoiw1kBUNdZUTvjS
   h6dKGrfvJhol1ffg5RSXne7cg/mVsi1TKM+YnPDHn23XrXFyuOCv0jPfO
   j+e5BNhujlHu27BtKzxQHNgWPeE+fwgOok2tzrLovK+nnCUOlzn5xESRR
   w==;
X-CSE-ConnectionGUID: RTj0bNGdS2u0IFF3Tk/SAQ==
X-CSE-MsgGUID: /cFM2+joSeaRSLb0/eZmGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="82588818"
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; 
   d="scan'208";a="82588818"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 22:11:19 -0700
X-CSE-ConnectionGUID: JVkGR2MdSrGwooe1SFZHDA==
X-CSE-MsgGUID: G+fbjfEdRJi3Oe9uai+5tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; 
   d="scan'208";a="252574328"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 17 Jun 2026 22:11:18 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wa524-000000005Sp-0KRr;
	Thu, 18 Jun 2026 05:11:16 +0000
Date: Thu, 18 Jun 2026 07:10:44 +0200
From: kernel test robot <lkp@intel.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 linux-doc@vger.kernel.org
Subject: htmldocs: Documentation/scheduler/sched-arch.rst:108:
 WARNING: Block quote ends without a blank line; unexpected unindent.
 [docutils]
Message-ID: <202606180717.yNM0yb41-lkp@intel.com>
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
	TAGGED_FROM(0.00)[bounces-92730-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[lkp@intel.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:sshegde@linux.ibm.com,m:oe-kbuild-all@lists.linux.dev,m:lkp@intel.com,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,intel.com:dkim,intel.com:email,intel.com:mid,intel.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AA79269DA52

tree:   https://github.com/intel-lab-lkp/linux/commits/Shrikanth-Hegde/sched-debug-Remove-unused-schedstats/20260618-031604
head:   bcb0c494e4af36dd6306a5a1839a0c03046053af
commit: 4c29e4f3ba22adc04fc456620f2c6abf539d76df sched/docs: Document cpu_preferred_mask and Preferred CPU concept
date:   10 hours ago
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260618/202606180717.yNM0yb41-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606180717.yNM0yb41-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Checksumming on output with GSO
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ [docutils]
   MAINTAINERS:40: WARNING: Inline strong start-string without end-string. [docutils]
   Documentation/scheduler/sched-arch.rst:107: ERROR: Unexpected indentation. [docutils]
>> Documentation/scheduler/sched-arch.rst:108: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/userspace-api/landlock:504: ./security/landlock/errata/abi-4.h:5: ERROR: Unexpected section title.


vim +108 Documentation/scheduler/sched-arch.rst

   102	
   103	Notes:
   104	1. This feature is available under CONFIG_PREFERRED_CPU
   105	2. This feature works for FAIR class only.
   106	3. A task pinned, which can't be moved to preferred CPUs will continue
   107	   to run based on its affinity. But no load balancing happens
 > 108	4. If needed, steal time based governors/arch dependent method
   109	   could be used to cater to different types of cpu numbers.
   110	   Arch can do so by implementing its own hooks.
   111	5. Decision to use/not use is driven by kernel. Hence it shouldn't
   112	   break user affinities. One of the main reason why CPU hotplug
   113	   or Isolated cpuset partitions was not a solution.
   114	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

