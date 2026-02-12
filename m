Return-Path: <linux-doc+bounces-75952-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6D19L1hTjmmlBgEAu9opvQ
	(envelope-from <linux-doc+bounces-75952-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 12 Feb 2026 23:25:28 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 390B3131831
	for <lists+linux-doc@lfdr.de>; Thu, 12 Feb 2026 23:25:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3D6313066BEA
	for <lists+linux-doc@lfdr.de>; Thu, 12 Feb 2026 22:25:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2399D2DF131;
	Thu, 12 Feb 2026 22:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YSOCgI17"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A7327703C
	for <linux-doc@vger.kernel.org>; Thu, 12 Feb 2026 22:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770935125; cv=none; b=pZ/Qwz/Y942psfNSYnk6LdzqafMtxv4DLur3el9rMe/1jzdE/B0WRcsy+IwMAzykU9kUd9lSrz3aYru/yLRYB+v0Y/Ak+KOCA9/z8QtUQpvdVSQ1xND/ZdBbI2/DNVQnlwRNKThz4hhKgXmsH4R+76CIUIw47uuwxga33LiEXkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770935125; c=relaxed/simple;
	bh=yFmMH6NvUTMWoLKXjMA21/IvcD7jRuXg8lL8lnkC32A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KHarRIgmfAZbPNbl37Ck0sG/GopwX5WsGEFMDdI1WbCG/4AkFJw3cU+L3cs66N4U37QWuyVyik01+MrPsLcV8cL/PwNqhL96vOGB9OkokmHoejSZsjtwO5PgZUMeUvEbixu5rnQNJKvgikasqVlUfVl0DXlLr/GN83V9YWhoRys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YSOCgI17; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770935124; x=1802471124;
  h=date:from:to:cc:subject:message-id;
  bh=yFmMH6NvUTMWoLKXjMA21/IvcD7jRuXg8lL8lnkC32A=;
  b=YSOCgI17oMJH/VcnoDj0av88rV5IKxoB1o4HMJJuHbZWghxgQuBaUisQ
   S24Y9oPitgv82dGDDH7hhtE+1MNFoL2Eg4uI/PLRQyEcQBj2ZWUALU+Uu
   WGenkmMGZX5kGr545kGY8/X7TdFb/nOn/lqzo5sZsvtnhUxvoy4UCIbwi
   /touY8aBoD2r+eREMSRelFQj3Faz5rg1YMOj0ObRfVW6f7sZwF74j/k6a
   G45+jVZT0hEYWLqQNcNAeCpGglXCbNqcG0CbWMVQHdBVdsqsPyH2yerSU
   qGJfUw0iDDD8bZAb5/9dw7W8nv2FqEXGIgGD8LcZC1gTozQP/8GA7qtwt
   A==;
X-CSE-ConnectionGUID: 79zAbn7/TvaWeJg57nODZQ==
X-CSE-MsgGUID: 5AOXmINvRQ2oGuo/gwcREw==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="83216151"
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; 
   d="scan'208";a="83216151"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 14:25:23 -0800
X-CSE-ConnectionGUID: oOB0sGB+Qia9SgNwCv+SXg==
X-CSE-MsgGUID: sYE2UDa1SAaOmRhgAo2BaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; 
   d="scan'208";a="212577164"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 12 Feb 2026 14:25:23 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqf7f-00000000toN-3N0E;
	Thu, 12 Feb 2026 22:25:19 +0000
Date: Fri, 13 Feb 2026 06:24:21 +0800
From: kernel test robot <lkp@intel.com>
To: Lee Jones <lee@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
 linux-doc@vger.kernel.org
Subject: [linux-next:master 11762/11841] Warning:
 drivers/video/backlight/cgbc_bl.c:29 This comment starts with '/**', but
 isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
Message-ID: <202602130608.bwks5uv5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-75952-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCVD_COUNT_FIVE(0.00)[6];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:mid,intel.com:dkim,intel.com:email]
X-Rspamd-Queue-Id: 390B3131831
X-Rspamd-Action: no action

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   af98e93c5c39e6d0b87b42f0a32dd3066f795718
commit: ce9699c49d159103f86f2be6c37457d50f9cceda [11762/11841] Merge branch 'for-backlight-next' of https://git.kernel.org/pub/scm/linux/kernel/git/lee/backlight.git
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260213/202602130608.bwks5uv5-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260213/202602130608.bwks5uv5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602130608.bwks5uv5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/video/backlight/cgbc_bl.c:29 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * CGBC backlight driver data

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

