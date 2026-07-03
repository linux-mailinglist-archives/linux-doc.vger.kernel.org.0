Return-Path: <linux-doc+bounces-94789-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xYu+M6maR2ofcAAAu9opvQ
	(envelope-from <linux-doc+bounces-94789-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 13:19:05 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 14660701BFD
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 13:19:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=isST4IEE;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94789-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-94789-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E51D3305F723
	for <lists+linux-doc@lfdr.de>; Fri,  3 Jul 2026 11:14:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB5253BCD21;
	Fri,  3 Jul 2026 11:14:05 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21613B8D76
	for <linux-doc@vger.kernel.org>; Fri,  3 Jul 2026 11:14:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783077245; cv=none; b=dMK4eAO91SRk1k8uRWIWoj2u7/Yb4M2/jTVe3WPd5dooJZX7ttKK7XgWtyodPkyS4D6xcmbNOt89KUlynuQ19PI2c9GGkRwDGfLGXTpG5YYYH5MPxeoQRXcuwuYMSLKEFUf4LHSsj1mdytbjxHQ1Z79TF/xRcOLXmCGl7MWpZjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783077245; c=relaxed/simple;
	bh=g8NU1zEbzzOkSCXF2RNXWg0TBtRPLPN6c+2SealPD5w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lExSUfQYRaOhvkN1jGwv3DZXQi5TwWhwhMYfbznQzqIXOE5s2g4ZyLEZTNOQ98ZXG/w8CRvhmesfvpnPU94a2PCnJSAeV+wU3zaU1Kq2AGnLkvSx2AIt8gMg6KTPvwR8Kl44aWXB9/xjuc8hVHwGea0cIqJa6+8JGu+P1t0CibE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=isST4IEE; arc=none smtp.client-ip=198.175.65.15
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783077243; x=1814613243;
  h=date:from:to:cc:subject:message-id;
  bh=g8NU1zEbzzOkSCXF2RNXWg0TBtRPLPN6c+2SealPD5w=;
  b=isST4IEEmfWOZdADRSxYmiyI7D9cOAckjmWeMvW4jgcD6omKLgSgAssK
   xYphCossuX7Ugi3JkyFIDnUZuIyS+DXDDIhlZBBrD1yFezAvylZIyvz8J
   ePVmNa/RIbxRhGv28skeJ8qK5tmJ5I+9HDi1HtsfT/YuU9dbRHc9h6V5P
   YzyKURal7yr+P1s2ekWuqoWL3fV++cSswhVB8CRx2WfLjuGQIdgYIabID
   DnIjDm70rztVgY7MYWJNGf/MRBbCFLdB6MognLRLNJqlVHQN3BlMcPyQ8
   YL2dzLAPpIzKqANp9EoNe3rMrjx6gQoppR/mbkpdDXfER0r8VEWyezXM6
   A==;
X-CSE-ConnectionGUID: ZebZpMRISe+nfR9r6TOh9g==
X-CSE-MsgGUID: 2CKyGs1LQJSk/ArND/d9hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="87510713"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="87510713"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 04:14:03 -0700
X-CSE-ConnectionGUID: wW0GwMhESPiMRbMPfMEU6Q==
X-CSE-MsgGUID: AxSkOpGaQpakooncdBPm7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="246716764"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 03 Jul 2026 04:14:01 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfbqI-000000001V3-2zPX;
	Fri, 03 Jul 2026 11:13:58 +0000
Date: Fri, 03 Jul 2026 13:12:59 +0200
From: kernel test robot <lkp@intel.com>
To: Timur Tabi <ttabi@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 linux-doc@vger.kernel.org
Subject: htmldocs: Documentation/gpu/nova/core/tlv.rst: WARNING:
 document isn't included in any toctree [toc.not_included]
Message-ID: <202607031322.BZaSlip5-lkp@intel.com>
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
	TAGGED_FROM(0.00)[bounces-94789-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[lkp@intel.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:ttabi@nvidia.com,m:oe-kbuild-all@lists.linux.dev,m:lkp@intel.com,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,intel.com:from_mime,intel.com:email,intel.com:mid,intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,01.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 14660701BFD

tree:   https://github.com/intel-lab-lkp/linux/commits/Timur-Tabi/rust-firmware-add-request_into_buf/20260703-033738
head:   7fe1e13ce246645500b8ee008a265a8e1712ab16
commit: 8fbab058c7d971fd4850555b76f58bc002988f96 gpu: nova-core: add TLV parser for firmware files
date:   15 hours ago
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260703/202607031322.BZaSlip5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607031322.BZaSlip5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/userspace-api/landlock:596: ./include/uapi/linux/landlock.h:58: ERROR: Unknown target name: "network flags". [docutils]
   Documentation/userspace-api/landlock:596: ./include/uapi/linux/landlock.h:63: ERROR: Unknown target name: "scope flags". [docutils]
   Documentation/userspace-api/landlock:596: ./include/uapi/linux/landlock.h:24: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:605: ./include/uapi/linux/landlock.h:228: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:605: ./include/uapi/linux/landlock.h:251: ERROR: Unknown target name: "network flags". [docutils]
>> Documentation/gpu/nova/core/tlv.rst: WARNING: document isn't included in any toctree [toc.not_included]
   Documentation/networking/checksum-offloads:157: ./include/linux/skbuff.h:181: WARNING: Failed to create a cross reference. A title or caption not found: 'crc' [ref.ref]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

