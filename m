Return-Path: <linux-doc+bounces-93198-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DDZoFr89OmpS4gcAu9opvQ
	(envelope-from <linux-doc+bounces-93198-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 23 Jun 2026 10:03:11 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0A26B50FB
	for <lists+linux-doc@lfdr.de>; Tue, 23 Jun 2026 10:03:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=mhiD9OPj;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93198-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-93198-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 074C8306445A
	for <lists+linux-doc@lfdr.de>; Tue, 23 Jun 2026 08:01:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75F172C032C;
	Tue, 23 Jun 2026 08:01:04 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BCA13C769D
	for <linux-doc@vger.kernel.org>; Tue, 23 Jun 2026 08:01:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782201664; cv=none; b=sN/UuPwMK1A9n9nR9d1aUgXnGKQcLhkigE2gsBegHQfiNeTXAbspCagp2PqXYqIVQ69kLbIddMg+EWochHIz4eQ1eUh/B0jOjZxOGY2hZGqEVsgRtvi/QwRD/XSS8vFJcq0BlJkGoJH4RLykp+9etzrTP0Oikzjtn57lsV/R7VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782201664; c=relaxed/simple;
	bh=IGOYgdBerpLZrd40i6ZE7Laj3OtY4bLDKAzUR99Sqtk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RQsR6s/RSLC/Rh8TyrMWGhYprgx7CBe6EfivIR+IVfaGHWql32OhmAsum5LwjtET+mFG4KqorRcli/lwV19hIxbOMYjMp8OMoHq1TfjeFxwnOEN1bJVTUSoe834klhADZA4GNwwVGc7DNtYWbGSLr4rSrh4QsWjaC8ioRre3F5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mhiD9OPj; arc=none smtp.client-ip=192.198.163.7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782201661; x=1813737661;
  h=date:from:to:cc:subject:message-id;
  bh=IGOYgdBerpLZrd40i6ZE7Laj3OtY4bLDKAzUR99Sqtk=;
  b=mhiD9OPj7ng8JQpZmV5fMLfZrgjG3iOcTJpyZ5/wEcSTrzauB2tqYOIU
   SKXWxw43GYhnGylAtaMBYYMFArSjKMhMQTVkEiHgKBoC/AjVaIzrYbjpQ
   fFv00O4kpLyCFcL9yDjAH8yk3nrlYeb1i++uEyrf8P8yxfvL6KvutZOIv
   Ax9XmvMA8HeA3cPpm1GiWrNp02vYF6+S3n1clEBMAMlFYvQo86NQ1BeNH
   l++XTHZb8ivuyca8UHWu78NDNoQlA3qTc9oWN8A95Bg23Cshyo99/nQNZ
   nN/PwS9imKdy8J1KiBbPCFXGyKr/IZiC/TEMKtEyvTH4iDeLI0LtYrxqN
   A==;
X-CSE-ConnectionGUID: 6f60Nl9bRNaaewjOB8GRbA==
X-CSE-MsgGUID: L60/whZsROy2qQEDZkDO4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="108481445"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="108481445"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 01:01:00 -0700
X-CSE-ConnectionGUID: I0VFhHeVRLiLFGs63iMEnw==
X-CSE-MsgGUID: A19/2LpZSDSLW6tbQrwleA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="247107937"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 23 Jun 2026 01:00:59 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbw41-000000006Av-0zl1;
	Tue, 23 Jun 2026 08:00:57 +0000
Date: Tue, 23 Jun 2026 10:00:13 +0200
From: kernel test robot <lkp@intel.com>
To: Kaitao Cheng <chengkaitao@kylinos.cn>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 linux-doc@vger.kernel.org
Subject: htmldocs: Documentation/core-api/list:775:
 ./include/linux/list.h:793: WARNING: Definition list ends without a blank
 line; unexpected unindent. [docutils]
Message-ID: <202606230940.yeWFIO56-lkp@intel.com>
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
	TAGGED_FROM(0.00)[bounces-93198-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[lkp@intel.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:chengkaitao@kylinos.cn,m:oe-kbuild-all@lists.linux.dev,m:lkp@intel.com,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,intel.com:dkim,intel.com:email,intel.com:mid,intel.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,01.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5E0A26B50FB

tree:   https://github.com/intel-lab-lkp/linux/commits/Kaitao-Cheng/list-Add-mutable-iterator-variants/20260622-193620
head:   72faf2855f60a21ac98d3e63d13a20dc1db9d8a1
commit: 7858c2cc567eace0010e1727aabb1967f14c98f8 list: Add mutable iterator variants
date:   20 hours ago
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260623/202606230940.yeWFIO56-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606230940.yeWFIO56-lkp@intel.com/

All warnings (new ones prefixed by >>):

   1             automatic adjustment of input current limit
   0             no adjustment of input current limit. This
   helps for more unusual power sources like
   solar modules. [docutils]
   WARNING: ./block/blk-map.c:366 Excess function parameter 'op' description in 'bio_copy_kern'
>> Documentation/core-api/list:775: ./include/linux/list.h:793: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
   Documentation/core-api/list:775: ./include/linux/list.h:826: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
   Documentation/core-api/list:775: ./include/linux/list.h:971: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
   Documentation/core-api/list:775: ./include/linux/list.h:1009: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
   Documentation/core-api/list:775: ./include/linux/list.h:1048: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
   Documentation/core-api/list:775: ./include/linux/list.h:1089: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

