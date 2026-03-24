Return-Path: <linux-doc+bounces-80994-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SC0QG8epwmkyggQAu9opvQ
	(envelope-from <linux-doc+bounces-80994-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 24 Mar 2026 16:12:07 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DE145317C02
	for <lists+linux-doc@lfdr.de>; Tue, 24 Mar 2026 16:12:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 545CA3053841
	for <lists+linux-doc@lfdr.de>; Tue, 24 Mar 2026 15:11:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19D2D4035AB;
	Tue, 24 Mar 2026 15:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qmh70d18"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FEFF4035AC
	for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2026 15:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774365085; cv=none; b=keS9RO24zMBkkdyfkiNCBinH1xkiLStKT7iJWfQTZfZwXbXafCnQo0lbKUzQiwfG4JJ0pCDyzqCeIvFhLkorV664DHzLcSyD1AQ9OtLLzTMse/MzhCu5hjiNqKntzfdXQR1EowHbKsMnvIsTJgCPwf2d2vygkSS5s0HfsThp47w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774365085; c=relaxed/simple;
	bh=zf2PN4plkjkIbpjVAdvFioZnInp330jVysUmpalQZ/M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=H7F+jNy2/eXewNVBE3mvMsBjncbH1hWD+rAmo+a0AW4RTLdH/umNXL3r0x5O06Hv7P/G3dXAH3oZOgEUg+mypqPxqOD3zxxJu3YrIsfeqQlAzg3R4ki+eQF0Fgt6lbdIkrytBPfSK71R8UzCwRxAxa39pjB409onwdfoEs9OUW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qmh70d18; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774365083; x=1805901083;
  h=date:from:to:cc:subject:message-id;
  bh=zf2PN4plkjkIbpjVAdvFioZnInp330jVysUmpalQZ/M=;
  b=Qmh70d1888S42ENRbiFqbIlQC+9Xci1az3vCSW1yTADnc31N91B33BQZ
   O8Khm879FU7lxa/LqpSlYEoxQJ0cUtj8vd/tbTq4/uK/Er7haWmwtR1wB
   QmbBN1KyMXhrfPCdHseSaina3T9bdXhDuDf5iZoiJc7YSsf8v5Qqc/+ym
   zlfIhynWr1JwZM9mQQJJQ4vTX7d4VKZ+8xDsO2UYHsRDBGoMxX8nrMIBo
   aP6flJkJoERhpig4NN/7DyYlShQShO7zor8jhRKmSTCXTibkfFSdlm01o
   oVvygRwymufNTBQjfCZ1Kb39FqU6xmUm5BhlMcxYXmk8Ffy5PUL57XsIG
   A==;
X-CSE-ConnectionGUID: QAUkVYZuRc+270wz0mFNNQ==
X-CSE-MsgGUID: t7N4U3UbQCy4+R2aRP6AtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="86757651"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="86757651"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 08:11:23 -0700
X-CSE-ConnectionGUID: 8U4FfkgvS5+P0YfsxmlwFA==
X-CSE-MsgGUID: ouuOLXPzQleG9ZOHAmP9KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="228856326"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 24 Mar 2026 08:11:22 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w53Pa-000000006uf-3Jsn;
	Tue, 24 Mar 2026 15:11:18 +0000
Date: Tue, 24 Mar 2026 16:11:01 +0100
From: kernel test robot <lkp@intel.com>
To: Justin Stitt <justinstitt@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Kees Cook <kees@kernel.org>,
 linux-doc@vger.kernel.org
Subject: [kees:dev/v7.0-rc2/obt 2/4] htmldocs:
 Documentation/process/arithmetic-overflow.rst: WARNING: document isn't
 included in any toctree [toc.not_included]
Message-ID: <202603241633.kh2zxFVG-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-80994-lists,linux-doc=lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,intel.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,01.org:url]
X-Rspamd-Queue-Id: DE145317C02
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git dev/v7.0-rc2/obt
head:   537858cd27d509ec0dedfa4b96bc1d0e461367b1
commit: 9e0190e84f2ecf5ff7314441655d71913095654e [2/4] compiler_attributes: Add overflow_behavior macros __wrap and __trap
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260324/202603241633.kh2zxFVG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603241633.kh2zxFVG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/userspace-api/landlock:526: ./include/uapi/linux/landlock.h:45: ERROR: Unknown target name: "network flags". [docutils]
   Documentation/userspace-api/landlock:526: ./include/uapi/linux/landlock.h:50: ERROR: Unknown target name: "scope flags". [docutils]
   Documentation/userspace-api/landlock:526: ./include/uapi/linux/landlock.h:24: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:535: ./include/uapi/linux/landlock.h:166: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:535: ./include/uapi/linux/landlock.h:189: ERROR: Unknown target name: "network flags". [docutils]
>> Documentation/process/arithmetic-overflow.rst: WARNING: document isn't included in any toctree [toc.not_included]
   Documentation/networking/skbuff:36: ./include/linux/skbuff.h:181: WARNING: Failed to create a cross reference. A title or caption not found: 'crc' [ref.ref]
>> Documentation/process/arithmetic-overflow.rst:25: WARNING: undefined label: '_open_coded_wrap_around' [ref.ref]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

