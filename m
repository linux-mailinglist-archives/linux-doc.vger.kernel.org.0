Return-Path: <linux-doc+bounces-82142-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GDmBDyR9zWnGeAYAu9opvQ
	(envelope-from <linux-doc+bounces-82142-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 01 Apr 2026 22:16:36 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE09380064
	for <lists+linux-doc@lfdr.de>; Wed, 01 Apr 2026 22:16:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 123A33022689
	for <lists+linux-doc@lfdr.de>; Wed,  1 Apr 2026 20:15:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7416922257E;
	Wed,  1 Apr 2026 20:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U1cnzhmJ"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40503345753
	for <linux-doc@vger.kernel.org>; Wed,  1 Apr 2026 20:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775074513; cv=none; b=AG6xZSN2zAobedtKpt02BiUiPZqp8YrfdmjQNiHR3My84oHs83E3WfBhM0U0UbJEuz7uJ7e60XXwu4GlfaPqKqVe41wYkbWWQnPsrLtohbI7SDlOwOiVVTU4QckidUwt0eDVSy+x2N5gHXSDBc8PqiHM6dfXAYPz+TEPMkn30Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775074513; c=relaxed/simple;
	bh=7J2fHD4IDzBB/gyefNGNqUmzJAS8tkIOKlzKxCGk8ZY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=S/ayIMo6NI8V2Z+/5Vgx81qlWugZfswBMAqHXKBxtl7o08rx+CzxEFR6xsrecD2ZBS5UK4q24Ekmq7shtv2BQXL0040cQ0ucxjsneLvypNQY77AWfcJEfrGJHSULzTb+p7eq3yRsYuOZys948rmOmsADc1I2qMd+ooAQt8xq2Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U1cnzhmJ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775074511; x=1806610511;
  h=date:from:to:cc:subject:message-id;
  bh=7J2fHD4IDzBB/gyefNGNqUmzJAS8tkIOKlzKxCGk8ZY=;
  b=U1cnzhmJteD2+k8gZ10Zu6frt3Fw7cszv147kwolRJPE0rpGUmRdsl1t
   Pgkdv8mggR32tXjkfshDHcZ/sViJGej5rLVBpfOuEO9e4aBx4e+rkM3hg
   Lz7mzafEXrfWD9ceqz1xbDW8c7RN40Lz+lwaLkJeMoGi5w91Yn3Lkn9fv
   D+1YB/0JcZUTgEg1IbP5WMe9UMRvFFTfhuKJ0YjDJb4h04JRxuCCQch9R
   qDJnvekBJV48mGfS56uPxHoT415+h3DQrotiETS/YbwuLKaXytQHq6Qe8
   CfJAYU4/lOjWf1wHPzeNj/+grZdzuIqGYMYdeAjBm9y4W7PDGvqY74Ewd
   A==;
X-CSE-ConnectionGUID: ppxM7IOcQECSO3kBIslqRg==
X-CSE-MsgGUID: VbHInBUPRTuyChRNCRUN5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="79982605"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="79982605"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 13:15:10 -0700
X-CSE-ConnectionGUID: MC3hq+UwQBuAE3vusJwHXA==
X-CSE-MsgGUID: 58Ay2vbZS8SLO2rp52YHbw==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 01 Apr 2026 13:15:09 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w81xz-000000008px-0Tgi;
	Wed, 01 Apr 2026 20:15:07 +0000
Date: Wed, 01 Apr 2026 22:14:51 +0200
From: kernel test robot <lkp@intel.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
 "Rob Herring (Arm)" <robh@kernel.org>, linux-doc@vger.kernel.org
Subject: [linux-next:master 1471/11049] htmldocs: Warning:
 Documentation/devicetree/bindings/mfd/motorola-cpcap.txt references a file
 that doesn't exist:
 Documentation/devicetree/bindings/regulator/cpcap-regulator.txt
Message-ID: <202604012234.rkuyW7h8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [0.90 / 15.00];
	LONG_SUBJ(1.56)[208];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-82142-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-doc];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,intel.com:email,intel.com:mid,01.org:url]
X-Rspamd-Queue-Id: 9AE09380064
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Svyatoslav,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bd0f139e5fc11182777b81cefc3893ea508544ec
commit: 5a8ffc5dca9c096fe9c8879fa3a2faff723fbb8a [1471/11049] regulator: dt-bindings: cpcap-regulator: convert to DT schema
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260401/202604012234.rkuyW7h8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604012234.rkuyW7h8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Documentation/devicetree/bindings/mfd/motorola-cpcap.txt references a file that doesn't exist: Documentation/devicetree/bindings/regulator/cpcap-regulator.txt
   Warning: Documentation/devicetree/bindings/mfd/motorola-cpcap.txt references a file that doesn't exist: Documentation/devicetree/bindings/rtc/cpcap-rtc.txt
>> Warning: Documentation/devicetree/bindings/regulator/motorola,cpcap-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/devicetree/bindings/rtc/motorola,cpcap-rtc.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
   Warning: Documentation/doc-guide/parse-headers.rst references a file that doesn't exist: Documentation/userspace-api/media/Makefile
   Warning: Documentation/leds/leds-lp5812.rst references a file that doesn't exist: Documentation/ABI/testing/sysfs-class-led-multicolor.rst
   Warning: Documentation/translations/it_IT/doc-guide/parse-headers.rst references a file that doesn't exist: Documentation/userspace-api/media/Makefile

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

