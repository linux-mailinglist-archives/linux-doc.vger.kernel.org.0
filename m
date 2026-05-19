Return-Path: <linux-doc+bounces-88363-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YHMcEN8DDGojTwUAu9opvQ
	(envelope-from <linux-doc+bounces-88363-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 19 May 2026 08:31:59 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3B6578230
	for <lists+linux-doc@lfdr.de>; Tue, 19 May 2026 08:31:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D10A530298F1
	for <lists+linux-doc@lfdr.de>; Tue, 19 May 2026 06:29:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 185BF388368;
	Tue, 19 May 2026 06:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RFa9B29C"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C20A3164B4
	for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 06:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779172156; cv=none; b=fxA1He6VwCBjVF1rWAPpm4KHA6nG397NQCzCzycizg8W8fz/xrzo1OQkK/0YCSRgBeApVlWCYCidlEPU6RZxsLKfm75L2orLz/fkJWjsrobRXB0qnHdTfBmR7tknJavKZyro/4eRbpqzDCTrkipi/O+14eYZdmv2JOgiCdxmHwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779172156; c=relaxed/simple;
	bh=cAdSMAiT0vq3CRylRYsNX7wN26CtymDogFCBpjbtyWY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=E5ffulJW0oi/dHXX2B+8CLrigHRVaUDWv+zvUgF3EQlnCHZg3KhkOk7LybnUc2R2v2myN+UliUY2DlwgloAuP42ETOZHtPRC4pqNQ7Z5XiDw0vEkLcLIVG4CMfvsXSbLy3rrbawWVNQSTKuxKpF9TGeI+EBZAseonJMnJe0Zx9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RFa9B29C; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779172154; x=1810708154;
  h=date:from:to:cc:subject:message-id;
  bh=cAdSMAiT0vq3CRylRYsNX7wN26CtymDogFCBpjbtyWY=;
  b=RFa9B29CPu0OrzO2zTVKPlMfgilGRwAbkucVIcse6mM1bzmqHPEdEdYf
   I8oFst1Ab5C/je1oAQfifIz+bq/8VaigBNEX7y3f12+RhpnDObzvesTHu
   ps2o+AVs3RkfG5oSBRZeWqKxpg0d4eYsclDbpZB9cJBk1SrnCyU/F3wsO
   I+GbF1LjuOI0WVGMkUZjtHq7IvfQ72m8eDsukTzGp/n3WaN2Ioqepb4x0
   L14ok7doGlKsdIYtq086Ck89qgXcPVeIbBcQMQKkO+1QmFpEszcSwKQG3
   R+QUkeJ1kjLAgJ5NTcaGfB+zlq96KeLi2l3ypr4yzupr9DoBHrz44f7+g
   g==;
X-CSE-ConnectionGUID: MqsRM+fqQuKyovqebJJ4OQ==
X-CSE-MsgGUID: eTrNcp3tQzKowLc3aobQ8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="91434366"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="91434366"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 23:29:13 -0700
X-CSE-ConnectionGUID: ujYmqk63TxiT2f3G135c6g==
X-CSE-MsgGUID: DbA2ljC3T2yNhCOqT3JetA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="236664579"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 18 May 2026 23:29:11 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPDwz-00000000A6n-3XBb;
	Tue, 19 May 2026 06:29:09 +0000
Date: Tue, 19 May 2026 08:28:21 +0200
From: kernel test robot <lkp@intel.com>
To: Louis Sautier <sautier.louis@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 linux-doc@vger.kernel.org
Subject: htmldocs: Warning: drivers/scsi/mpt3sas/Kconfig references a
 file that doesn't exist: Documentation/hwmon/mpt3sas.rst
Message-ID: <202605190857.DUejkpQ7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-88363-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCVD_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,intel.com:email,intel.com:mid,intel.com:dkim,01.org:url]
X-Rspamd-Queue-Id: DF3B6578230
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree:   https://github.com/intel-lab-lkp/linux/commits/Louis-Sautier/scsi-mpt3sas-add-IO-Unit-Page-7-config-accessor/20260519-030206
head:   82f70fb1a3a62df368d90847eec6afb9adbf9d2e
commit: 82f70fb1a3a62df368d90847eec6afb9adbf9d2e scsi: mpt3sas: add hwmon support
date:   11 hours ago
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260519/202605190857.DUejkpQ7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605190857.DUejkpQ7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst references a file that doesn't exist: Documentation/Configure.help
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/ABI/testing/sysfs-platform-ayaneo
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt
   Warning: arch/powerpc/sysdev/mpic.c references a file that doesn't exist: Documentation/devicetree/bindings/powerpc/fsl/mpic.txt
   Warning: drivers/net/ethernet/smsc/Kconfig references a file that doesn't exist: file:Documentation/networking/device_drivers/ethernet/smsc/smc9.rst
>> Warning: drivers/scsi/mpt3sas/Kconfig references a file that doesn't exist: Documentation/hwmon/mpt3sas.rst
   Warning: rust/kernel/sync/atomic/ordering.rs references a file that doesn't exist: srctree/tools/memory-model/Documentation/explanation.txt
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: Documentation/virtual/lguest/lguest.c
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: m,\b(\S*)(Documentation/[A-Za-z0-9
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: Documentation/devicetree/dt-object-internal.txt
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: m,^Documentation/scheduler/sched-pelt

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

