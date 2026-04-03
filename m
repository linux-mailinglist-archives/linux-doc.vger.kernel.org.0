Return-Path: <linux-doc+bounces-82344-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aM0+GPF/z2mvwgYAu9opvQ
	(envelope-from <linux-doc+bounces-82344-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 03 Apr 2026 10:53:05 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3AE3925C9
	for <lists+linux-doc@lfdr.de>; Fri, 03 Apr 2026 10:53:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CBFCA301DE12
	for <lists+linux-doc@lfdr.de>; Fri,  3 Apr 2026 08:47:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C73D37B019;
	Fri,  3 Apr 2026 08:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UVcHZLdQ"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E014537E301
	for <linux-doc@vger.kernel.org>; Fri,  3 Apr 2026 08:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775206024; cv=none; b=ol6dGT6VxI+9W8PqWDvJDRV0G3zb1iAhedV5D9AMNC4ugtOX+ZZVOLJR4mIYHLKJ7XLKhenY95qRFX04/ihmhwlSaG+SD4EgeZI5G2AGMQH6UBSFHCzlMpgB2jmGO5sviYFTtDE7+08j2wWHaiSJIm3wkDtn4UFj9L6Dbmu9Y0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775206024; c=relaxed/simple;
	bh=Lfka4wRcIM9Lzx2LOqAOAIzl3tNzI5DU5r43qi52bOI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fXYUOFW46YDpVOrNw+XpKGrSXn7CZ0wOjGxaRn1EIK6Ix4kPXd0RqYv+k8GPdvZyKjZ2bi1qlb+T3FIfDWHXXk7XxA+r2rkzdtx3Rmcg4N53Msm0GbK73mZXvAUuw8VSmGpkoRn7GGXq9BDFkvXM3T/fPghzho00BRc7gxt/MpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UVcHZLdQ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775206023; x=1806742023;
  h=date:from:to:cc:subject:message-id;
  bh=Lfka4wRcIM9Lzx2LOqAOAIzl3tNzI5DU5r43qi52bOI=;
  b=UVcHZLdQdM5B6NZf2XOtxRj7DEv0J9lhCOdBKZ5vfVfINg2Lx9ISjNMe
   9GNX7rivqBeU3LzjPoYCKpuSqd/OkTfXu9b5RPwJGcPHmNv+dNULwCGcC
   RqecG2X1RN65zuJSVbVZjPBMnJYn6yhpS4qK2XaN5/SIwnIPS0aDRMWgr
   9naJCBWrjvd2fNSspYzSfdO4QK74saH0giTCKuKwpGDioRLidVVBya5f5
   8ZWTobYoCaTYGFemmIRWWaXzJEc0tmqJmFO5ohBgsMt8PB50RzvDi8p7/
   hz8iflOtgsQeer6nID8mAoq5XV710G5nzAXL0RdwPSMcftlQaALn8M69a
   g==;
X-CSE-ConnectionGUID: 2PKHW32pQmWMdShWF8Lt2g==
X-CSE-MsgGUID: nmsV9DU1RqSK9+BZCTM9Vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="75312106"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="75312106"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 01:47:01 -0700
X-CSE-ConnectionGUID: nh+kkF8AR32R+sOjqMRdIQ==
X-CSE-MsgGUID: vNKQfNrhRe6U7AC2kIGinA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="250287312"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 03 Apr 2026 01:46:59 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8aB6-0000000016w-49iK;
	Fri, 03 Apr 2026 08:46:56 +0000
Date: Fri, 03 Apr 2026 16:46:19 +0800
From: kernel test robot <lkp@intel.com>
To: Miklos Szeredi <mszeredi@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, fuse-devel@lists.sourceforge.net,
 linux-doc@vger.kernel.org
Subject: [mszeredi-fuse:for-next 35/53] Warning: fs/fuse/dev.c:524
 This comment starts with '/**', but isn't a kernel-doc comment. Refer to
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202604031126.BGSurGYv-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-82344-lists,linux-doc=lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,01.org:url,intel.com:dkim,intel.com:email,intel.com:mid]
X-Rspamd-Queue-Id: CE3AE3925C9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git for-next
head:   e0d07024fdb2588cd6afcc1b1f1e4bc62ba2c886
commit: ca520dba20d4472694a1895fb4de513be8dab3eb [35/53] fuse: don't access transport layer structs directly from the fs layer
config: i386-randconfig-141-20260403 (https://download.01.org/0day-ci/archive/20260403/202604031126.BGSurGYv-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9004-gb810ac53
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260403/202604031126.BGSurGYv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604031126.BGSurGYv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: fs/fuse/dev.c:524 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Checks if @fc matches the one installed in @fud

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

