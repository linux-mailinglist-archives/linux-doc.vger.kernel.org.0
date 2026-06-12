Return-Path: <linux-doc+bounces-92061-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qjD4Nvt1K2oV+AMAu9opvQ
	(envelope-from <linux-doc+bounces-92061-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 12 Jun 2026 04:59:07 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0C9676593
	for <lists+linux-doc@lfdr.de>; Fri, 12 Jun 2026 04:59:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=Duc2zsW0;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92061-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-92061-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C536730D794C
	for <lists+linux-doc@lfdr.de>; Fri, 12 Jun 2026 02:59:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EF19367296;
	Fri, 12 Jun 2026 02:59:05 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEEB4292B54
	for <linux-doc@vger.kernel.org>; Fri, 12 Jun 2026 02:59:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781233145; cv=none; b=loEeKq+AfC5BvtVwXqEfdhYx7Nrf4G2Jsa75rZjSsIyhhaflemxOIuf6We1SwKbzi8XkvWFQlrJZeXm7hjcOz12lpUpvICd6i2+KE5CvkEa3fBUzSCrUyVmX06cm4jjfwoiTcpDATfb22KU/PSY+6mHcpdD1Nxln8NOnEILNU/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781233145; c=relaxed/simple;
	bh=TkwRG0/ENlzeRTd8lWeKV4YiviHGOUjHarx4Fs6ikeg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DqvV6pTfpmwK61XlnhtzvtSodyy93EbY6in76X5I5P7yp9PTDGujJJnYGDtqn/BVYWNp8KocWJpKgUL070ebFQHc8ykx77IB5FKCV5MWUkCchRvgalNMfRgmVaW1WZGRcoaDdQjvdQs2jp1PRiBpzh6IFNx5KlIbejnhZteHw/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Duc2zsW0; arc=none smtp.client-ip=198.175.65.13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781233144; x=1812769144;
  h=date:from:to:cc:subject:message-id;
  bh=TkwRG0/ENlzeRTd8lWeKV4YiviHGOUjHarx4Fs6ikeg=;
  b=Duc2zsW0ISQLCFTVSqePxsfUmrZaNJIB0hnmH4qAOQGQIPrrZiuBYIJJ
   sfE4qVLLuQG04BoGoD+K/2SN0f1fSnBBAYOmxD3u+YGfEOK02lrdKBVNV
   iJM1/qEYuVdTvH4ld3+6TG9NHInrHna9CI4tsJwIcsU4yy8377RKKxyFD
   VBKlUletbhkOHUoJmJPBgIZB8L1JDo5vkQ0SN5bePHdtNLnMlOyvxi+/3
   7u55uBn20GBSfS2xkhjitkSzwI3BcER94NaOOA/OK186S5CVseApMna+P
   P4YP2hU8fvInAPre+gdhpALF8Rs6dkOW70GuAOQJ1j7zhQMoX7g9GjSC1
   Q==;
X-CSE-ConnectionGUID: 666kdQ1MRIW98HNLR4ueDA==
X-CSE-MsgGUID: K20lWpcQTHCAhclToeghFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="93171183"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="93171183"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 19:59:04 -0700
X-CSE-ConnectionGUID: iNdg2bMNTymKAwhQfZaRkA==
X-CSE-MsgGUID: Lo0hystFQnOoHzC9C6llaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="284800253"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 11 Jun 2026 19:59:01 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXs6k-000000004BF-3Rhs;
	Fri, 12 Jun 2026 02:58:58 +0000
Date: Fri, 12 Jun 2026 04:58:18 +0200
From: kernel test robot <lkp@intel.com>
To: Jorge Marques <jorge.marques@analog.com>
Cc: oe-kbuild-all@lists.linux.dev, Nuno Sa <noname.nuno@gmail.com>,
 Frank Li <Frank.Li@nxp.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-doc@vger.kernel.org
Subject: [nsa:xlnx/fix/buf-mmap-multibuffer 27173/27391] htmldocs:
 Warning: MAINTAINERS references a file that doesn't exist:
 Documentation/devicetree/bindings/i3c/adi,i3c-master.yaml
Message-ID: <202606120453.2rP7tq7s-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92061-lists,linux-doc=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:jorge.marques@analog.com,m:oe-kbuild-all@lists.linux.dev,m:noname.nuno@gmail.com,m:Frank.Li@nxp.com,m:alexandre.belloni@bootlin.com,m:linux-doc@vger.kernel.org,m:nonamenuno@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[lkp@intel.com,linux-doc@vger.kernel.org];
	FREEMAIL_CC(0.00)[lists.linux.dev,gmail.com,nxp.com,bootlin.com,vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,intel.com:mid,intel.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,01.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2F0C9676593

tree:   https://github.com/nunojsa/linux xlnx/fix/buf-mmap-multibuffer
head:   a26a8baba71e866951f6abf4fc6c0504770c272e
commit: c54362d581209a7421fe0d0caf70ff172289da75 [27173/27391] i3c: master: Add driver for Analog Devices I3C Controller IP
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260612/202606120453.2rP7tq7s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606120453.2rP7tq7s-lkp@intel.com/

All warnings (new ones prefixed by >>):

   from /zdci/src/kernel-tests/bisect-test-build-error.sh:102: main
   Warning: Documentation/devicetree/bindings/iio/adc/adi,ltc2308.yaml references a file that doesn't exist: Documentation/devicetree/bindings/iio/adc/adc.txt
   Warning: Documentation/devicetree/bindings/iio/adc/adi,ltc2308.yaml references a file that doesn't exist: Documentation/devicetree/bindings/iio/adc/adc.txt
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/i3c/adi,i3c-master.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
   Using alabaster theme
--
     from /zdci/src/kernel-tests/bisect-test-build-error.sh:102: main
   Warning: Documentation/devicetree/bindings/iio/adc/adi,ltc2308.yaml references a file that doesn't exist: Documentation/devicetree/bindings/iio/adc/adc.txt
   Warning: Documentation/devicetree/bindings/iio/adc/adi,ltc2308.yaml references a file that doesn't exist: Documentation/devicetree/bindings/iio/adc/adc.txt
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/i3c/adi,i3c-master.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

