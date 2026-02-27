Return-Path: <linux-doc+bounces-77391-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yKFlNc0EomkGyQQAu9opvQ
	(envelope-from <linux-doc+bounces-77391-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 27 Feb 2026 21:55:41 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E711BDFFF
	for <lists+linux-doc@lfdr.de>; Fri, 27 Feb 2026 21:55:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 79334306CDE4
	for <lists+linux-doc@lfdr.de>; Fri, 27 Feb 2026 20:55:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DEB242980A;
	Fri, 27 Feb 2026 20:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EDoyTUm+"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C3B43DA53
	for <linux-doc@vger.kernel.org>; Fri, 27 Feb 2026 20:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772225737; cv=none; b=kurgs7vDqbO4nIAXqtOpLmg3/zkOzCYImQeX8Glne7mBMT7sBe5gGMXae3k24yaFtlP0bxjZukG/5KWtHnY+rAVcLBcfzKB4GvkX0IYlM0QJXEYob3N1SaZ50E+ktzxglpeRjYYHt9zjeBG90viXQBPYKKCV5QXz1EjbhMw+MHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772225737; c=relaxed/simple;
	bh=DP9ajAgSruMYWtuMMFB8M+Q3jGOja+8ctB8ay1J+sFg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ERrNzjtBpL8nwHf0/1qVI61XgwZwSzWbHx3s6rJG4acuCbwwL91KQ5wgeXqyY1MTlufyyIt6SKDn1g+GXeeDxqb+wsJB+Fvui7bkOh+pOuGW6OwtXf2NzChyohZ5fQk2LJMezSOcfSYCvFmH4aI2I0PyPiz4xgrF6M/VoafLuV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EDoyTUm+; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772225737; x=1803761737;
  h=date:from:to:cc:subject:message-id;
  bh=DP9ajAgSruMYWtuMMFB8M+Q3jGOja+8ctB8ay1J+sFg=;
  b=EDoyTUm+OYo5Pu6FlszHZ7rwedh36VuH1xGhFWe+NJei9w9iMY2xcI2+
   LecHOP/vGrNQdiDsE9HxRhBUSaIW1vZBCON1UlJelHVQfZXBZfLFxavoF
   I16xw7mppDffRgMVSiwmUoZz3D2CE0qtjko8bDHjWlW7vVnN7APiWUCxC
   Dr2vf5vDHaXjjFkuBz0y86jpPodoRbyEKYE3bjTxnOIH1PNcignr7jEeD
   S723+Xsv/Z3U9cifUvKFRZzB7rwSJ/4RObhinzhI3Svx6Y/6EmCpSzFG8
   yTFbV5yfQptRC8YGNh3MGVdkRWrtlIdkY8volWM0fT3Q+DJQrHRAP6hP6
   w==;
X-CSE-ConnectionGUID: +fptvclXQAeFNu/VH6yFvw==
X-CSE-MsgGUID: 3uQelpa5RkqIHnNPQxujAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="73021635"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="73021635"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 12:55:36 -0800
X-CSE-ConnectionGUID: 1TZ0PMkKSpyvSXEXwHnYUw==
X-CSE-MsgGUID: MkCVZYyHQmSG4ul6r4YCJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="247505727"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 27 Feb 2026 12:55:34 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vw4rz-000000000cL-3euQ;
	Fri, 27 Feb 2026 20:55:31 +0000
Date: Fri, 27 Feb 2026 21:55:29 +0100
From: kernel test robot <lkp@intel.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
 "Rob Herring (Arm)" <robh@kernel.org>, linux-doc@vger.kernel.org
Subject: [linux-next:master 2414/2910] htmldocs: Warning:
 Documentation/devicetree/bindings/mfd/motorola-cpcap.txt references a file
 that doesn't exist:
 Documentation/devicetree/bindings/regulator/cpcap-regulator.txt
Message-ID: <202602272154.VcM04DJL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.89 / 15.00];
	LONG_SUBJ(1.55)[207];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-77391-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-doc];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[01.org:url]
X-Rspamd-Queue-Id: 77E711BDFFF
X-Rspamd-Action: no action

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3fa5e5702a82d259897bd7e209469bc06368bf31
commit: 5a8ffc5dca9c096fe9c8879fa3a2faff723fbb8a [2414/2910] regulator: dt-bindings: cpcap-regulator: convert to DT schema
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260227/202602272154.VcM04DJL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602272154.VcM04DJL-lkp@intel.com/

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

