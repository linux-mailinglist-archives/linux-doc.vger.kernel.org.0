Return-Path: <linux-doc+bounces-79827-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0BbDKIGduWn3LAIAu9opvQ
	(envelope-from <linux-doc+bounces-79827-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 17 Mar 2026 19:29:21 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1494D2B0F2F
	for <lists+linux-doc@lfdr.de>; Tue, 17 Mar 2026 19:29:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 94BC9305185A
	for <lists+linux-doc@lfdr.de>; Tue, 17 Mar 2026 18:18:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21FB037C0F8;
	Tue, 17 Mar 2026 18:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tt4yoTbb"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A2F37F8D3
	for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 18:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773771511; cv=none; b=pGYyrQsD8envw/uEzNxGwsps/uB1zn4Y6e7CETch3z42j0FJA3eTM1Xu3AlvKYQw1diD32RKYZHdlxZG0NcewGCos5SqQzm1cLI00LowIxHeRRsm1a1BDo+o8So+OP3i3O7o2jD9H6YJ9legycDCV3gYo3cdCLc8Qik3UOY1CKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773771511; c=relaxed/simple;
	bh=fg32yGe2mdohAI69CbTjZquxppAHQFK69oSiE+SgENw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jja+KHZZGESmM55VJekyZnQlhUPM7LtKbQj9x5g9041Slbpp+joWPlAaji9A64RHFeTTTfbEeW53bUbDUer5qkLgH7syk6NeknXMgaSFSReWlnnOMLN2Q/5DzGr7t7s/ORWOlZdoWp74pSJx4LnAZtXXtf7PT6+a97EQoSaTPO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tt4yoTbb; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773771508; x=1805307508;
  h=date:from:to:cc:subject:message-id;
  bh=fg32yGe2mdohAI69CbTjZquxppAHQFK69oSiE+SgENw=;
  b=Tt4yoTbbnL1cSAxs+7oBrklwJWFks375Tm5/GRZQfZ8jQQkpwt0wXSbO
   xVRG1ojdyTlBJ8YjzCmvMLBlx6s1tr5aKuqwa58yp0ijy1f2/zvLSSjjV
   Jz6n30lYy0t6cjrxPhrGx0BW2GzQDGULCYxwXsMBhlu0eDnNyZXtW+pll
   FjIHgApiG7GGF7lj5B4bXP/vSebbiDfyeIBj1hwCd8RZC3zLi2Nbo/PM5
   gibQQ8xHbKiXpWHP8DVznnB8HE7JTIPQfg/PEtL1OAgK/ldYgDegmDTRK
   9dX0dHCM0Lx/SOGNdSADfOoTByxEI5Zv65GLgWqDXLDTey1RAEQmtnsgo
   A==;
X-CSE-ConnectionGUID: KfNcpH+xSJqoU5I/WJtafw==
X-CSE-MsgGUID: 1AAMQABMRiCcQb2K7OeDyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="85893687"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="85893687"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 11:18:28 -0700
X-CSE-ConnectionGUID: PWMhoSJET6WLe8swr9cTwg==
X-CSE-MsgGUID: QqcAdWy/Q0mPaU7ddZ7ZvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="246977039"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 17 Mar 2026 11:18:26 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2Yzn-000000001mh-3eMI;
	Tue, 17 Mar 2026 18:18:23 +0000
Date: Wed, 18 Mar 2026 02:18:06 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Dan Williams <dan.j.williams@intel.com>, Chao Gao <chao.gao@intel.com>,
 linux-doc@vger.kernel.org
Subject: [linux-next:master 2734/6828] Warning:
 arch/x86/virt/vmx/tdx/tdx.c:141 This comment starts with '/**', but isn't a
 kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
Message-ID: <202603180202.myb6Tv5N-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-79827-lists,linux-doc=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,intel.com:email,intel.com:mid,01.org:url]
X-Rspamd-Queue-Id: 1494D2B0F2F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8e5a478b6d6a5bb0a3d52147862b15e4d826af19
commit: 165e77353831a85caa0444d16f29bd6b111dd2c5 [2734/6828] KVM: x86/tdx: Do VMXON and TDX-Module initialization during subsys init
config: x86_64-randconfig-011-20260317 (https://download.01.org/0day-ci/archive/20260318/202603180202.myb6Tv5N-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603180202.myb6Tv5N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603180202.myb6Tv5N-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: arch/x86/virt/vmx/tdx/tdx.c:141 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Enable VMXON and then do one-time TDX module per-cpu initialization SEAMCALL

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

