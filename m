Return-Path: <linux-doc+bounces-90085-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YLqEFXz9GWr80QgAu9opvQ
	(envelope-from <linux-doc+bounces-90085-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 29 May 2026 22:56:28 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FEF9608B43
	for <lists+linux-doc@lfdr.de>; Fri, 29 May 2026 22:56:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B4CF63036ECD
	for <lists+linux-doc@lfdr.de>; Fri, 29 May 2026 20:53:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D6F63B47CC;
	Fri, 29 May 2026 20:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bu7TauIQ"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174703AD539
	for <linux-doc@vger.kernel.org>; Fri, 29 May 2026 20:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780088023; cv=none; b=hi4SVAQBIZwDbtKeSKLcuvRUhc7gClIsIsWM+fPbPteu+W9X9OLIBv5YdwUI1eDJ2mOIhWDCR/ml6UXprcbTzP5gyyhi2IfLSETTO+dH3/pWdrxwgSrfcApItinidYKEwVpIlnqYfSGo5loS1f23I0tN5gYbsPnaFLkFCUtZQWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780088023; c=relaxed/simple;
	bh=alrpKLdV48Pp4sTZ1wT9OMUMdJJUOKy4Lb5RXMiQQhI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=S4AWXU/IweGPSt09VQjCTKnT2qpjv6wUBGkprH+RBlwXaoYLjufuCLaBlC7vhxriEZzUifpwB+oG1WtHM/0DCJeOCFSWhh+L1daGiOKqWlv69HOEzkmfxeFPtrjniy8HRPeaammbcgEPpsgNwERhdef+AjL1HZ2RQLntcR/XBs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bu7TauIQ; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780088021; x=1811624021;
  h=date:from:to:cc:subject:message-id;
  bh=alrpKLdV48Pp4sTZ1wT9OMUMdJJUOKy4Lb5RXMiQQhI=;
  b=bu7TauIQRAkAfQPI1+8afSTNMSzsV06U9TeVA1e/dOCCgS+EGZvcaNTV
   vX5q6189+05oK5VKdw1kCYEyrKN+WkkrVKOhX97kdLxXDdnh8Xz0vyaDC
   8Aq78MSermrRpsTtce4Z2LarqZ3scWWKnfVWgVyQvZDoqJoM/geiiMWPo
   7BdRbcYUqnRretOCD1KPVB1HVKd2rhG1FdE14BIstvg/12eh4QSIqSq9a
   2K1n/AALBnm/Yi7v8egqdg+i8GXQ8Cx++NxADctGNewURr2OH5skP/KtB
   9PEwrr8cXQxZ8XLzdzaVOWkKf32/F/Z7vws99qMwii8TcvXxsiLLcW/D+
   g==;
X-CSE-ConnectionGUID: OOBQhu7gRv2mZJJPUhYKAA==
X-CSE-MsgGUID: KV6BK8cuTo2omoUwQTRpmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="81060489"
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; 
   d="scan'208";a="81060489"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2026 13:53:41 -0700
X-CSE-ConnectionGUID: TsJbHAgJQ++pagbkSLbS1A==
X-CSE-MsgGUID: lNzHTciLSQKhVpxuK19mOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; 
   d="scan'208";a="242818409"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 29 May 2026 13:53:39 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wT4D2-000000000wL-43rm;
	Fri, 29 May 2026 20:53:36 +0000
Date: Fri, 29 May 2026 22:52:43 +0200
From: kernel test robot <lkp@intel.com>
To: Jinseob Kim <kimjinseob88@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 linux-doc@vger.kernel.org
Subject: htmldocs:
 Documentation/iio/open-sensor-fusion-protocol-v0.rst: WARNING: document isn't
 included in any toctree [toc.not_included]
Message-ID: <202605292226.LXfXcakp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-90085-lists,linux-doc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[01.org:url]
X-Rspamd-Queue-Id: 5FEF9608B43
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree:   https://github.com/intel-lab-lkp/linux/commits/Jinseob-Kim/dt-bindings-iio-add-OSF-GREEN-sensor-aggregation-device/20260529-203704
head:   1c52cc7956cbaab8331a893adeeae87be8eecbc0
commit: 6d2e81590d4f043dfe0119681118fff3d7d3da4f Documentation: iio: add Open Sensor Fusion protocol v0 reference
date:   8 hours ago
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260529/202605292226.LXfXcakp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605292226.LXfXcakp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/userspace-api/landlock:550: ./include/uapi/linux/landlock.h:45: ERROR: Unknown target name: "network flags". [docutils]
   Documentation/userspace-api/landlock:550: ./include/uapi/linux/landlock.h:50: ERROR: Unknown target name: "scope flags". [docutils]
   Documentation/userspace-api/landlock:550: ./include/uapi/linux/landlock.h:24: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:559: ./include/uapi/linux/landlock.h:168: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:559: ./include/uapi/linux/landlock.h:191: ERROR: Unknown target name: "network flags". [docutils]
>> Documentation/iio/open-sensor-fusion-protocol-v0.rst: WARNING: document isn't included in any toctree [toc.not_included]
   Documentation/networking/skbuff:36: ./include/linux/skbuff.h:181: WARNING: Failed to create a cross reference. A title or caption not found: 'crc' [ref.ref]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

