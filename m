Return-Path: <linux-doc+bounces-87464-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLj/JlF5BWoaXgIAu9opvQ
	(envelope-from <linux-doc+bounces-87464-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 14 May 2026 09:27:13 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0535053ED9D
	for <lists+linux-doc@lfdr.de>; Thu, 14 May 2026 09:27:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8739C300CC21
	for <lists+linux-doc@lfdr.de>; Thu, 14 May 2026 07:26:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 314203D8103;
	Thu, 14 May 2026 07:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R1pphvjv"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39283D7D7C
	for <linux-doc@vger.kernel.org>; Thu, 14 May 2026 07:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778743592; cv=none; b=VFtz8Sa3zG6//2xpHRATdje2vt0x44GzNy7LEKI7vAbY0U7twH+hm01Kq2K/2OVG1rUZtFlWnc7vUkzAyqaIuQUzFDz57N+Wh2lLp966cfwXMfc3SlJmkGI/oIdmIGL1Nas2C+uo/9rLWKvpRBivcolJSW4wD3F81OrdJ7L1PKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778743592; c=relaxed/simple;
	bh=4ryslff3M7sEG6C/nTOICEM81m4Sqfxcyh7IfMc9gnQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tmD0qFy4DxIvFpIXnb7t9yYZaiKzP/4+8K0Qd00oUU15v1xT2izPO2R02dekyljI4+q9sxZ5KOcGSYm3AvqGfoJp7RqV2nPGZXOqg+Jaraf2jm7LMT1y18I+PPo2HTNeZ9XGfKRSRAjapGVWeP/aDT7vHlnROKRImh58VoqkK7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R1pphvjv; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778743591; x=1810279591;
  h=date:from:to:cc:subject:message-id;
  bh=4ryslff3M7sEG6C/nTOICEM81m4Sqfxcyh7IfMc9gnQ=;
  b=R1pphvjvuLevc+8wetvHzGp0WNLKbDporDVJf3DD5GVMU0qsNOp6izzK
   wOlQ4NBqJ47Y2qFrr56N4BYanqLlVzvYwa1cOnH2IYykFMeLksEP8uZQt
   lwBQ1p5xnIIgiyfJAEYV//qmB1PGd2Ei+vtDp1uW2whaVOBT4DjquKo5r
   TdXOH8+OT0AcWpxmiSPOSk7bSoNXxQUVkT0hFkOpuTj+3s5h5fn0Il7yl
   eAR3rq0b4KhRa7SexpWrJKk2gvQJ8InEmKaE8cjNOba1s9WHcz5Z6AJm3
   5bYKpL7tTusw/y3dmHHs5niVJlfR1wAEBhLEpqbAGNfHI47TRaKJVyC2M
   Q==;
X-CSE-ConnectionGUID: G6ALteR7QBqhh8iWWJaITg==
X-CSE-MsgGUID: 6WHMK70/TzyCHmUNcXqYrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="79798537"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="79798537"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 00:25:56 -0700
X-CSE-ConnectionGUID: ief3MeVGTIWjVqU6aZmIyA==
X-CSE-MsgGUID: 40Jy0vRwQOm3OvxNpXOMLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="242307671"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 14 May 2026 00:25:55 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNQS8-000000008m5-3PpA;
	Thu, 14 May 2026 07:25:52 +0000
Date: Thu, 14 May 2026 09:24:55 +0200
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 linux-doc@vger.kernel.org
Subject: htmldocs: Documentation/driver-api/media/v4l2-subdev:644:
 ./include/media/v4l2-subdev.h:1815: WARNING: Inline emphasis start-string
 without end-string. [docutils]
Message-ID: <202605140920.76HXOESS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: 0535053ED9D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	URIBL_MULTI_FAIL(0.00)[intel.com:server fail,01.org:server fail,sea.lore.kernel.org:server fail];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-87464-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-doc];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,intel.com:mid,intel.com:dkim,01.org:url]
X-Rspamd-Action: no action

tree:   https://github.com/intel-lab-lkp/linux/commits/Sakari-Ailus/media-v4l2-common-Add-mipi_csi2_dt_for_mbus/20260514-071037
head:   34918de37a97a5dc1db4f52558076912af6adcea
commit: a3067ab49d683ccd82af48d0fad7349b7724537d media: v4l2-subdev: Provide a cleanup-friendly get_frame_desc
date:   8 hours ago
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260514/202605140920.76HXOESS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605140920.76HXOESS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   --------------------------------------------------------------------------------------------^
   Documentation/driver-api/basics:42: ./kernel/time/time.c:370: WARNING: Duplicate C declaration, also defined at driver-api/basics:436.
   Declaration is '.. c:function:: unsigned int jiffies_to_msecs (const unsigned long j)'. [duplicate_declaration.c]
   Documentation/driver-api/basics:42: ./kernel/time/time.c:393: WARNING: Duplicate C declaration, also defined at driver-api/basics:453.
   Declaration is '.. c:function:: unsigned int jiffies_to_usecs (const unsigned long j)'. [duplicate_declaration.c]
>> Documentation/driver-api/media/v4l2-subdev:644: ./include/media/v4l2-subdev.h:1815: WARNING: Inline emphasis start-string without end-string. [docutils]
   Documentation/driver-api/target:25: ./drivers/target/target_core_user.c:35: ERROR: Unexpected section title.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

