Return-Path: <linux-doc+bounces-73410-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UBewH6GrcGkgZAAAu9opvQ
	(envelope-from <linux-doc+bounces-73410-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 21 Jan 2026 11:34:09 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 329A655429
	for <lists+linux-doc@lfdr.de>; Wed, 21 Jan 2026 11:34:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id BBD47389DD4
	for <lists+linux-doc@lfdr.de>; Wed, 21 Jan 2026 10:14:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8495042B741;
	Wed, 21 Jan 2026 10:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FRfAVefu"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BA6313268
	for <linux-doc@vger.kernel.org>; Wed, 21 Jan 2026 10:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768990281; cv=none; b=G5ClqJhciociEofUVcxz4d678DNjCWFLY7NdehqRPX0en04O7makaSigKCNt79o5f3u58uihRP3AabI7QEa5KrxwwUHLGjfyxF31ELtFD4FQ5kI32ZYf5t5JnDzZ5EeLUsjZ7H+/yM/oRcGnyO4JNWc+XzVqPAovMzlAwzdlEVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768990281; c=relaxed/simple;
	bh=4jADyItNCaFIN2UcG9w72iX7TkyaBnLyRWojM089bfI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TPQkI9AIHnHbkJfyCInJHkbq2W2AZ1lu2OAN19Ik9oA/fYkvCKtoehhknP7aTnondrnmtFkiwbsT0SD2puzqLouLPpwAbpvQHWXjVf6Cs8OepiFujVFuvHarz45e4VxgVIrlxlStpF61sh6gZfwYbZUsjDTXMGewVZwLHb/QViA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FRfAVefu; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768990280; x=1800526280;
  h=date:from:to:cc:subject:message-id;
  bh=4jADyItNCaFIN2UcG9w72iX7TkyaBnLyRWojM089bfI=;
  b=FRfAVefuKuUC7REoRShH6qcGPO2dgL24VjN/XlR7gs+IqwZW4zr8+r2n
   SruqP/QR/yGcdjix1giVkGREPVZKPC/+4oGRxd6MxAu6YolgSw/EUfWgh
   5jnwFFaomU02kX7iqLPvBzyEIzh6XC+xxwmGZc/J6hmhEaYwrG93+ffa6
   U27j2+J0O5SHq/+p9Up/ajr0yIBvO1loR6R/ukoVUxeglkHScG39obSfB
   a9Um1U8wyNmKJ61ikaOLqdzlVMcI6E2684RssN5080B8/dAYGNszCyp6Q
   4HKwWN7xmp/8zXxJ8ISblffOuJoiNqdP7www6WL6bKi4aJOoH9/7F2VgM
   w==;
X-CSE-ConnectionGUID: yCkbUd4KRD+R+zzS8GJSZw==
X-CSE-MsgGUID: QKWef5rnSSiwC1K20+bEiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70114477"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="70114477"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 02:11:19 -0800
X-CSE-ConnectionGUID: ULiQNoMFQViUeBg5HlWuuQ==
X-CSE-MsgGUID: x7WRd6LqRuOv3viMKAJI9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="206465805"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 21 Jan 2026 02:11:17 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viVBC-0000000003y-3JWK;
	Wed, 21 Jan 2026 10:11:14 +0000
Date: Wed, 21 Jan 2026 11:10:38 +0100
From: kernel test robot <lkp@intel.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, Jonathan Corbet <corbet@lwn.net>,
 Christian Brauner <brauner@kernel.org>, linux-doc@vger.kernel.org
Subject: [sashal-linus-next:linus-next 7126/8109] htmldocs:
 Documentation/filesystems/api-summary:59: ./fs/open.c:1157: WARNING: Inline
 emphasis start-string without end-string. [docutils]
Message-ID: <202601211140.pWd7ohTh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-73410-lists,linux-doc=lfdr.de];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[intel.com,none];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-doc@vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,intel.com:mid,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,01.org:url]
X-Rspamd-Queue-Id: 329A655429
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linus-next.git linus-next
head:   61061ddd460681a8fe44b0fa8c09800154861a8d
commit: f2d46684be2201e54c088728e741b71aa33b2aa5 [7126/8109] docs: filesystems: add fs/open.c to api-summary
reproduce: (https://download.01.org/0day-ci/archive/20260121/202601211140.pWd7ohTh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601211140.pWd7ohTh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   ERROR: Cannot find file ./include/linux/dcache.h
   WARNING: No kernel-doc for file ./include/linux/dcache.h
   WARNING: ./fs/inode.c:1607 function parameter 'isnew' not described in 'ilookup5_nowait'
   WARNING: ./fs/namei.c:2853 function parameter 'state' not described in '__start_dirop'
   WARNING: ./fs/namei.c:2853 expecting prototype for start_dirop(). Prototype was for __start_dirop() instead
>> Documentation/filesystems/api-summary:59: ./fs/open.c:1157: WARNING: Inline emphasis start-string without end-string. [docutils]
   Documentation/filesystems/api-summary:59: ./fs/open.c:1147: ERROR: Unknown target name: "o". [docutils]
   ERROR: Cannot find file ./include/linux/buffer_head.h
   WARNING: No kernel-doc for file ./include/linux/buffer_head.h
   ERROR: Cannot find file ./include/linux/fscache-cache.h
   WARNING: No kernel-doc for file ./include/linux/fscache-cache.h

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

