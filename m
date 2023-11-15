Return-Path: <linux-doc+bounces-2184-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C187E8F28
	for <lists+linux-doc@lfdr.de>; Sun, 12 Nov 2023 09:27:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3CE7C280CA8
	for <lists+linux-doc@lfdr.de>; Sun, 12 Nov 2023 08:27:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2F2A6D3F;
	Sun, 12 Nov 2023 08:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ASZqd+fo"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D521A7469
	for <linux-doc@vger.kernel.org>; Sun, 12 Nov 2023 08:27:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24F0A2D73;
	Sun, 12 Nov 2023 00:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699777667; x=1731313667;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SRwwL6be49QrhtrbCrgRdGumKxy/22938qANWee9Ndg=;
  b=ASZqd+foYj5+2PCd+urCSg1zKkIHSEkCIQKG/3T2p2AxcZKAB7fcredx
   IM/vgkaULDYOhI6uXsNdnRF2gJCva24rhZnPM4cAeF37y0vpRwCRKIvDz
   8yhFs6fgY0W63FGDC3AO40kmo+keRhOvEUT4fXZUwcbc5tpRiACVmzpu0
   AFjVbUQv5CiI5R2zyBsG92PGonEpn9+VkBPLWqKwXlGr9JFbK2Nsu0s8n
   Qelbb96binB35BGq8V9twvyuFRiNgViU0+3jJiTBjeN8FaJN9jdU1gteh
   ro0Oi8RHF6Fs+8odkRVpgsnl5diAjvRpyOPJ/ZuzcdhxnjCELfSq+QgPd
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="393186310"
X-IronPort-AV: E=Sophos;i="6.03,297,1694761200"; 
   d="scan'208";a="393186310"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2023 00:27:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="713964310"
X-IronPort-AV: E=Sophos;i="6.03,297,1694761200"; 
   d="scan'208";a="713964310"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 12 Nov 2023 00:27:45 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r25ok-000B22-2O;
	Sun, 12 Nov 2023 08:27:42 +0000
Date: Sun, 12 Nov 2023 16:26:44 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Miklos Szeredi <mszeredi@redhat.com>, linux-doc@vger.kernel.org
Subject: fs/overlayfs/util.c:352: warning: This comment starts with '/**',
 but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
Message-ID: <202311121628.byHp8tkv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1b907d0507354b74a4f2c286380cd6059af79248
commit: ad0af7104dadccd55cd2b390271677fac142650f vfs: introduce inode 'inuse' lock
date:   6 years ago
config: x86_64-randconfig-a001-20230604 (https://download.01.org/0day-ci/archive/20231112/202311121628.byHp8tkv-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231112/202311121628.byHp8tkv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311121628.byHp8tkv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/overlayfs/util.c:352: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Caller must hold a reference to inode to prevent it from being freed while


vim +352 fs/overlayfs/util.c

   350	
   351	/**
 > 352	 * Caller must hold a reference to inode to prevent it from being freed while
   353	 * it is marked inuse.
   354	 */
   355	bool ovl_inuse_trylock(struct dentry *dentry)
   356	{
   357		struct inode *inode = d_inode(dentry);
   358		bool locked = false;
   359	
   360		spin_lock(&inode->i_lock);
   361		if (!(inode->i_state & I_OVL_INUSE)) {
   362			inode->i_state |= I_OVL_INUSE;
   363			locked = true;
   364		}
   365		spin_unlock(&inode->i_lock);
   366	
   367		return locked;
   368	}
   369	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

