Return-Path: <linux-doc+bounces-78784-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2EwJLNDNsGkKnQIAu9opvQ
	(envelope-from <linux-doc+bounces-78784-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 11 Mar 2026 03:05:04 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C766F25A9AB
	for <lists+linux-doc@lfdr.de>; Wed, 11 Mar 2026 03:05:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DEBEF300C3AD
	for <lists+linux-doc@lfdr.de>; Wed, 11 Mar 2026 02:04:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E78CC2E7BD6;
	Wed, 11 Mar 2026 02:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jzjbtA/n"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9948D28469A
	for <linux-doc@vger.kernel.org>; Wed, 11 Mar 2026 02:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773194689; cv=none; b=V+E5x1pqIRbqGk0OKkWHwlp2fTRhjBpr9c+Z/Em/yuzKdwD+HdrLND1k3h74Qs04rJVcVW/R6nBhCI4RkuIvQv9l7h8Jqkt/PDG33zsiSYJc3Be/dv8L1HE1nVNWxV/094BF6ccOjZ5Ob4S0U8etm5740vMtogjyasLtUh6XllY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773194689; c=relaxed/simple;
	bh=KJPClGjrGDJGI/US/RgywCmid/NQe7P3mmNQBYCDdUw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YhWZC8+8mFurV5zK3zKwZz4PAq4LIgSyEiCJ+8z87e9yf0alebHG6hKJ962UnYnU50wOo62VkHmBj+jme7eatWw0tWpdDZj23m0+xEaxcqpZ361E/zLffdV77FytBsdLKrRv6yPpIBFd1ZQ9l0adeAWkETXG226+Bhi9Hfu/4bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jzjbtA/n; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773194688; x=1804730688;
  h=date:from:to:cc:subject:message-id;
  bh=KJPClGjrGDJGI/US/RgywCmid/NQe7P3mmNQBYCDdUw=;
  b=jzjbtA/nSM8bHCxfmL75EMVyb51Z1ubm9R0qU1N342j55m09Ef7E8gcK
   WFYZzoicC6YdRxtJqxvRC4T9PbAlv9Uk4cn0FVW70J1ssfda4Hyp/2TvU
   Y1XPyG47tPPk5ayZlDXlubqCtJcj6ycEAKKD8RVOUg4M9tk/1zkTKr6xc
   i2UwR/2/YM1MFtIPFvS8zt24s2P48ZC+TemH/VrdgR27n5Cn4xjc7Dyfc
   aXRP6wiIXkzIIpEIn63eLTE8EyuLL4Gdrvx2UyJFK7d8pJ/+Jler3+0Z5
   LoABo2YZfDQtFAJrRCvlI9dw/ukPK2LPd+oT1y/Le1+2r7nUKNXojIKX+
   Q==;
X-CSE-ConnectionGUID: HiE3mBQDTP2bbKpL4y8fmQ==
X-CSE-MsgGUID: LdWwDl6sSlCXOyBsUmufJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="99721420"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="99721420"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 19:04:48 -0700
X-CSE-ConnectionGUID: wkvlfFqQR+SKRvoj4fk7LA==
X-CSE-MsgGUID: 1mT2grhESIqUgE9B3ZJs+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="243320116"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 10 Mar 2026 19:04:47 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w08wG-000000003Bx-3OoZ;
	Wed, 11 Mar 2026 02:04:44 +0000
Date: Wed, 11 Mar 2026 03:04:20 +0100
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [robh:dt-convert 1/621] htmldocs: Warning:
 Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt references
 a file that doesn't exist:
 Documentation/devicetree/bindings/reset/ti-syscon-reset.txt
Message-ID: <202603110210.9c5GGinI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: C766F25A9AB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.89 / 15.00];
	LONG_SUBJ(1.55)[207];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-78784-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	RCPT_COUNT_THREE(0.00)[3];
	TAGGED_RCPT(0.00)[linux-doc];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,intel.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,01.org:url]
X-Rspamd-Action: no action

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt-convert
head:   c8198e311a98fefcf9efff078bf3930ff94b60d2
commit: c04af4dfbfc866e054659323f79bf47a1e577e2e [1/621] dt-bindings: reset: Convert ti,syscon-reset to DT schema
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260311/202603110210.9c5GGinI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603110210.9c5GGinI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/mfd/motorola-cpcap.txt references a file that doesn't exist: Documentation/devicetree/bindings/regulator/cpcap-regulator.txt
   Warning: Documentation/devicetree/bindings/mfd/motorola-cpcap.txt references a file that doesn't exist: Documentation/devicetree/bindings/rtc/cpcap-rtc.txt
   Warning: Documentation/devicetree/bindings/regulator/motorola,cpcap-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
>> Warning: Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt references a file that doesn't exist: Documentation/devicetree/bindings/reset/ti-syscon-reset.txt
   Warning: Documentation/devicetree/bindings/rtc/motorola,cpcap-rtc.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
   Warning: Documentation/doc-guide/parse-headers.rst references a file that doesn't exist: Documentation/userspace-api/media/Makefile
   Warning: Documentation/leds/leds-lp5812.rst references a file that doesn't exist: Documentation/ABI/testing/sysfs-class-led-multicolor.rst
   Warning: Documentation/translations/it_IT/doc-guide/parse-headers.rst references a file that doesn't exist: Documentation/userspace-api/media/Makefile
   Warning: Documentation/translations/ja_JP/SubmittingPatches references a file that doesn't exist: linux-2.6.12-vanilla/Documentation/dontdiff

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

