Return-Path: <linux-doc+bounces-59737-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E44B5153F
	for <lists+linux-doc@lfdr.de>; Wed, 10 Sep 2025 13:16:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D73FE169A28
	for <lists+linux-doc@lfdr.de>; Wed, 10 Sep 2025 11:16:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4AAA26A0A7;
	Wed, 10 Sep 2025 11:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TWTNTkOo"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228B0265CC9
	for <linux-doc@vger.kernel.org>; Wed, 10 Sep 2025 11:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757502969; cv=none; b=CspnD62zt5FRFTPESJCJB7IBmMeVxNAja6hnSnGeU3NtjQE7726rHvyX9G0qqdteWOuMCFPAYyfvwXYWbJxkIyNs4dYVMrM1zKdN3ol1oTNK1WxSFmzbL8PtpqT6tgdtrWYPLfHiB5mwJAODKpFOerSNqUwmq+Hx81NNYPFkNzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757502969; c=relaxed/simple;
	bh=YCJpMj9qaG7japfoXPYyCpmx96TYyuOz3YoP7SVYaT0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GCxyRz4/5ujP9AIhgUdNM6NoPf9tv4YGOHhh5VnLlGJtowlTn1vb5nRn+HgKSNwJHa6HXQnF/dCMP//cMhq2+4XIwlGU3RsHuy1+hmVibUpa1y4FTe5M6KsyHgIAs1fwIPl1amvvuFE1bZQPOFLNYFb0TgND+1Qer1Ter9HEaak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TWTNTkOo; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757502968; x=1789038968;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YCJpMj9qaG7japfoXPYyCpmx96TYyuOz3YoP7SVYaT0=;
  b=TWTNTkOoYP6NMWVcLWpDQykTabxQbNQXx4LshnD3xrYw9XsTGPimUqRq
   0//kEfqKQMm3Fqu27queuwxEDaloZGzUNRNX+AwlsTt6BH/MTfFoJrk1n
   Eam9TM2tOvpAdgdtyYdlR23QMWzKtn93gwkQbiSoeWeYbjj8W2sCLaXio
   TrQHkHau9qVbvvREsWXYOj6nIvpEXWTgEFSrBAceh4xuqPt4dYjBziC76
   kKOLbYM7L2A6jP2EcNy8wBTJE5Mv1+UvmCBFiynpgjvq4cKhyYN8j+9n8
   chn+VaHMvCnA2Pl3ZUS6x2RFGRb3Aedergh8RGWj/AkNtmMDfr28+L0w3
   A==;
X-CSE-ConnectionGUID: gLBClEQqQ+yVpZyfoj9KqQ==
X-CSE-MsgGUID: PfA7SGB+QQKsbyB2JJveMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="59884098"
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; 
   d="scan'208";a="59884098"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 04:16:08 -0700
X-CSE-ConnectionGUID: 4Uw1rM+kTU+uBzdKpqls9g==
X-CSE-MsgGUID: zenIs4FWQMSXOF82Ar6veg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; 
   d="scan'208";a="173278330"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 10 Sep 2025 04:16:06 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uwIo0-0005rv-11;
	Wed, 10 Sep 2025 11:16:04 +0000
Date: Wed, 10 Sep 2025 19:15:48 +0800
From: kernel test robot <lkp@intel.com>
To: Vegard Nossum <vegard.nossum@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Subject: [linux-next:master 7525/7856] Documentation/.renames.txt: warning:
 ignored by one of the .gitignore files
Message-ID: <202509101930.OsSQJxIP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   5f540c4aade9f1d58fb7b9490b4b7d5214ec9746
commit: 4b6fba464322f5850dbcce32f3a25eeebf64e770 [7525/7856] docs: add Documentation/.renames.txt
config: arc-allnoconfig (https://download.01.org/0day-ci/archive/20250910/202509101930.OsSQJxIP-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250910/202509101930.OsSQJxIP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509101930.OsSQJxIP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/.renames.txt: warning: ignored by one of the .gitignore files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

