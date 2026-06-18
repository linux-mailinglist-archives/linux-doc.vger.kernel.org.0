Return-Path: <linux-doc+bounces-92701-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id l3L9KaJOM2pY/QUAu9opvQ
	(envelope-from <linux-doc+bounces-92701-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 18 Jun 2026 03:49:22 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0762069D0DB
	for <lists+linux-doc@lfdr.de>; Thu, 18 Jun 2026 03:49:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=UGdWFT4Y;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92701-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-92701-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AF470301BC0A
	for <lists+linux-doc@lfdr.de>; Thu, 18 Jun 2026 01:49:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A86123BD05;
	Thu, 18 Jun 2026 01:49:20 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB59D40D57D
	for <linux-doc@vger.kernel.org>; Thu, 18 Jun 2026 01:49:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781747360; cv=none; b=m5uDNXO/mqfc9+9zFqcCr+6zsQ1Evtv5eW11s/tsOWYhN7EKMCmP9i7U1jdEsCfd0YCRvHk42/SSVyU8M56oDVEOkLW62HIIATKhz3d8XHLeQVekrpO52KIdW02ybueuzAN+G0uI4MGzf8RADY1mwgBflNML2Mchff3zmwntqCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781747360; c=relaxed/simple;
	bh=IzURAdgLFYKVjSafGKsywtJZwsYGejxd8gsdiTBI34U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=I380kLn1lj86m6UISzXxFDHuWkfhd0i2UpiV154sv0kl48g5tExDXzKZbbdRnq17ubM1aB2H++WYu7u65FfkmGmew74BAh0YVHYQ759i6gZNNHrx74b/ZlyXFtofkHJJz54t39IQg5+k9R0EtHxNnGj5n8r/bMynrfNs9oQvnUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UGdWFT4Y; arc=none smtp.client-ip=198.175.65.13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781747358; x=1813283358;
  h=date:from:to:cc:subject:message-id;
  bh=IzURAdgLFYKVjSafGKsywtJZwsYGejxd8gsdiTBI34U=;
  b=UGdWFT4YKkNRJrcVwzLUSvKgNqUdypz+qfy8LhGen65Alvmms+61dxU2
   dEal0Fp0Li0B/IJ/qVoRpNUFdDuo/PBTzmfD/h9bs46fco/lwxKHACBWL
   U9ntjvpUATo/2kLn0Qs9XvF4Jwcq0MPVtdtMuUOcJnAtkaa5AoY+eBTht
   ZbSZnH9UAcp9k9EIbDWuaq/wB/OGa6cBaA87tjnbWcZVZmouqfkw6ny/y
   kUq838vuTnxhjI9My+95ADBPDmcTEIYCfu3r1jzfJq3uyqsVPhgC8xu0Y
   W5xyX5JSJiasRf2dX+MrCp0pUuzt1ECSQDlLGi2/n1+YXRSG8Bvmp+tqp
   Q==;
X-CSE-ConnectionGUID: 6CFg68xzTkiOZ0C+yuD7Hg==
X-CSE-MsgGUID: YW1W8pGqRlW/Ou/NPj227Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="93684062"
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; 
   d="scan'208";a="93684062"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 18:49:17 -0700
X-CSE-ConnectionGUID: ySxXOuICSaKltSvVS3H8ZQ==
X-CSE-MsgGUID: FCYLOLxdQj2e56YgJB5VVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; 
   d="scan'208";a="253333544"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 17 Jun 2026 18:49:16 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wa1sX-000000005QX-3X7w;
	Thu, 18 Jun 2026 01:49:13 +0000
Date: Thu, 18 Jun 2026 03:48:36 +0200
From: kernel test robot <lkp@intel.com>
To: Honglei Huang <honghuan@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 linux-doc@vger.kernel.org
Subject: htmldocs: Documentation/gpu/rfc/gpusvm:70:
 ./drivers/gpu/drm/drm_gpusvm.c:74: WARNING: Inline emphasis start-string
 without end-string. [docutils]
Message-ID: <202606180351.xwWq86H2-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92701-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[lkp@intel.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:honghuan@amd.com,m:oe-kbuild-all@lists.linux.dev,m:lkp@intel.com,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,intel.com:dkim,intel.com:email,intel.com:mid,intel.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0762069D0DB

tree:   https://github.com/intel-lab-lkp/linux/commits/Honglei-Huang/drm-gpusvm-split-MM-state-flags-out-of-drm_gpusvm_pages_flags/20260617-202753
head:   19bcdccae716ca08c529566e2093edc5c2a81ce2
commit: c2a70a0070054be7a4f5097e2d7c835d765eae35 drm/gpusvm: move struct drm_gpusvm_pages out of struct drm_gpusvm_range
date:   13 hours ago
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260618/202606180351.xwWq86H2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606180351.xwWq86H2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Examples
   ~~~~~~~~ [docutils]
   Documentation/gpu/rfc/gpusvm:70: ./drivers/gpu/drm/drm_gpusvm.c:74: ERROR: Unexpected indentation. [docutils]
>> Documentation/gpu/rfc/gpusvm:70: ./drivers/gpu/drm/drm_gpusvm.c:74: WARNING: Inline emphasis start-string without end-string. [docutils]
>> Documentation/gpu/rfc/gpusvm:70: ./drivers/gpu/drm/drm_gpusvm.c:76: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
>> Documentation/gpu/rfc/gpusvm:70: ./drivers/gpu/drm/drm_gpusvm.c:77: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
   WARNING: ./include/linux/host1x.h:159 struct member 'get' not described in 'host1x_bo_ops'
   WARNING: ./include/linux/host1x.h:159 struct member 'put' not described in 'host1x_bo_ops'
   WARNING: ./include/linux/host1x.h:159 struct member 'mmap' not described in 'host1x_bo_ops'
   WARNING: ./include/linux/host1x.h:159 struct member 'munmap' not described in 'host1x_bo_ops'
   WARNING: ./include/linux/host1x.h:159 struct member 'get' not described in 'host1x_bo_ops'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

