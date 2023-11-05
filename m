Return-Path: <linux-doc+bounces-1712-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3924B7E15DB
	for <lists+linux-doc@lfdr.de>; Sun,  5 Nov 2023 19:32:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44607281249
	for <lists+linux-doc@lfdr.de>; Sun,  5 Nov 2023 18:32:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4E15210B;
	Sun,  5 Nov 2023 18:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AqI3caOT"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89B41798B
	for <linux-doc@vger.kernel.org>; Sun,  5 Nov 2023 18:32:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B657BE;
	Sun,  5 Nov 2023 10:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699209150; x=1730745150;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R0L/B9+G43pJL9c/v/Vq++BkH19ajLYgDw9ZMK049po=;
  b=AqI3caOTuwufERMdDmpjhT7YF4y3xiBeNQaBxuVeBn0bHyWwK9oPtuJR
   PIL8AGmbeApmiEVkyXfMZDJBAa8WnNSeTo2oPsGMWJT1RtIxr4p+ORJ+0
   Hx1Lch9w4oZUp9+IJNRIKqEyGne0suR2WXuFwY3mM4UaWLD4OPks/2kgL
   so6wGLc6hKOQ0vF6GukdYu8lsqwKJNEo/XhEqU+oRl6Fe5wLBEYpuRVkr
   QtvPeygngcB1me9Bc+dzF9OZ1Y5Z9ncb3iTp99Lw2UJzSlhR3fzWr6Z9x
   IPyApAuQriDjWiqxQjQfnccb03SKLNjB7BRfReTaUVdM2fj/MiwF4vbUh
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="10706200"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="10706200"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 10:32:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="905851888"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="905851888"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 05 Nov 2023 10:32:28 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzhv7-0005ht-2s;
	Sun, 05 Nov 2023 18:32:25 +0000
Date: Mon, 6 Nov 2023 02:32:15 +0800
From: kernel test robot <lkp@intel.com>
To: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
	linux-doc@vger.kernel.org
Subject: drivers/xen/xen-front-pgdir-shbuf.c:34: warning: This comment starts
 with '/**', but isn't a kernel-doc comment. Refer
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202311060203.yQrpPZhm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1c41041124bd14dd6610da256a3da4e5b74ce6b1
commit: 5641f19bdfc4193f1c2d5a829896c25dd5c0ec3d drm/xen-front: Use Xen common shared buffer implementation
date:   4 years, 11 months ago
config: x86_64-randconfig-r054-20230808 (https://download.01.org/0day-ci/archive/20231106/202311060203.yQrpPZhm-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231106/202311060203.yQrpPZhm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311060203.yQrpPZhm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/xen/xen-front-pgdir-shbuf.c:34: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * This structure represents the structure of a shared page
   drivers/xen/xen-front-pgdir-shbuf.c:45: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Shared buffer ops which are differently implemented
   drivers/xen/xen-front-pgdir-shbuf.c:73: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Get granted reference to the very first page of the
   drivers/xen/xen-front-pgdir-shbuf.c:93: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Map granted references of the shared buffer.
   drivers/xen/xen-front-pgdir-shbuf.c:114: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Unmap granted references of the shared buffer.
   drivers/xen/xen-front-pgdir-shbuf.c:135: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Free all the resources of the shared buffer.
   drivers/xen/xen-front-pgdir-shbuf.c:163: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Get the number of pages the page directory consumes itself.
   drivers/xen/xen-front-pgdir-shbuf.c:173: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Calculate the number of grant references needed to share the buffer
   drivers/xen/xen-front-pgdir-shbuf.c:185: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Calculate the number of grant references needed to share the buffer
   drivers/xen/xen-front-pgdir-shbuf.c:203: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Unmap the buffer previously mapped with grant references
   drivers/xen/xen-front-pgdir-shbuf.c:251: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Map the buffer with grant references provided by the backend.
   drivers/xen/xen-front-pgdir-shbuf.c:326: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Fill page directory with grant references to the pages of the
   drivers/xen/xen-front-pgdir-shbuf.c:356: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Fill page directory with grant references to the pages of the
   drivers/xen/xen-front-pgdir-shbuf.c:395: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Grant references to the frontend's buffer pages.
   drivers/xen/xen-front-pgdir-shbuf.c:424: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Grant all the references needed to share the buffer.
   drivers/xen/xen-front-pgdir-shbuf.c:472: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Allocate all required structures to mange shared buffer.
   drivers/xen/xen-front-pgdir-shbuf.c:512: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Allocate a new instance of a shared buffer.


vim +34 drivers/xen/xen-front-pgdir-shbuf.c

b3383974fee272 Oleksandr Andrushchenko 2018-11-30  32  
b3383974fee272 Oleksandr Andrushchenko 2018-11-30  33  /**
b3383974fee272 Oleksandr Andrushchenko 2018-11-30 @34   * This structure represents the structure of a shared page
b3383974fee272 Oleksandr Andrushchenko 2018-11-30  35   * that contains grant references to the pages of the shared
b3383974fee272 Oleksandr Andrushchenko 2018-11-30  36   * buffer. This structure is common to many Xen para-virtualized
b3383974fee272 Oleksandr Andrushchenko 2018-11-30  37   * protocols at include/xen/interface/io/
b3383974fee272 Oleksandr Andrushchenko 2018-11-30  38   */
b3383974fee272 Oleksandr Andrushchenko 2018-11-30  39  struct xen_page_directory {
b3383974fee272 Oleksandr Andrushchenko 2018-11-30  40  	grant_ref_t gref_dir_next_page;
b3383974fee272 Oleksandr Andrushchenko 2018-11-30  41  	grant_ref_t gref[1]; /* Variable length */
b3383974fee272 Oleksandr Andrushchenko 2018-11-30  42  };
b3383974fee272 Oleksandr Andrushchenko 2018-11-30  43  

:::::: The code at line 34 was first introduced by commit
:::::: b3383974fee272ad0d444a2d083f456879447cd8 xen: Introduce shared buffer helpers for page directory...

:::::: TO: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
:::::: CC: Boris Ostrovsky <boris.ostrovsky@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

