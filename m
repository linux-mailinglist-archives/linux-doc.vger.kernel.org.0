Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A76B66A78E1
	for <lists+linux-doc@lfdr.de>; Thu,  2 Mar 2023 02:31:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229451AbjCBBa6 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 1 Mar 2023 20:30:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229615AbjCBBa5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 1 Mar 2023 20:30:57 -0500
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55EF412849
        for <linux-doc@vger.kernel.org>; Wed,  1 Mar 2023 17:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677720656; x=1709256656;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VmT+dZV75CS9wvcNwH4fwrKGw++uHIIxBqISeVzjmTY=;
  b=ajUXdCM5HyV5Yd+CpCKjS24w/nzrZqSV4KkBFA5+LHWyskjE4NJyPIfS
   s6I81AYm+5y6/x3NZS+KYayKNBjYl1zUJmJ4DV+LaLdcAwj8MOljYli5K
   Ln8g9sMk4QVYz8CDlKvzGQqIRpw7TCgAypwEiXZsKNtlHebQQ1xUcH3fM
   /rzGLk/n71t9tr8sPSd99BUYpE3Wco/ukVpFrcau1Um2WQ12FAa6YGS2Q
   h6ycfYviOinfFPEgmsgWZhQWoIyc4QGL0aGEAFo3IXjYMaXPsoL+VHWQR
   LnzWFr25c9w1hXok76eV32AIM2iaVszTXKedGgH9tCZoV3u+jOaG8gFhk
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="399368994"
X-IronPort-AV: E=Sophos;i="5.98,226,1673942400"; 
   d="scan'208";a="399368994"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2023 17:30:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="743644358"
X-IronPort-AV: E=Sophos;i="5.98,226,1673942400"; 
   d="scan'208";a="743644358"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 01 Mar 2023 17:30:54 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pXXmX-00002r-2E;
        Thu, 02 Mar 2023 01:30:53 +0000
Date:   Thu, 2 Mar 2023 09:30:42 +0800
From:   kernel test robot <lkp@intel.com>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        linux-doc@vger.kernel.org
Subject: [arnd-playground:pccard-rework-2 6/6]
 drivers/pci/hotplug/yenta_socket.c:2816: warning: This comment starts with
 '/**', but isn't a kernel-doc comment. Refer
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202303020953.osvq08Qm-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git pccard-rework-2
head:   22de4720268f5b24fc90587fcb9c7b09d8bfbf90
commit: 22de4720268f5b24fc90587fcb9c7b09d8bfbf90 [6/6] pci: hotplug: move cardbus code from drivers/pcmcia
config: x86_64-randconfig-a014 (https://download.01.org/0day-ci/archive/20230302/202303020953.osvq08Qm-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git/commit/?id=22de4720268f5b24fc90587fcb9c7b09d8bfbf90
        git remote add arnd-playground https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git
        git fetch --no-tags arnd-playground pccard-rework-2
        git checkout 22de4720268f5b24fc90587fcb9c7b09d8bfbf90
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/pci/hotplug/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303020953.osvq08Qm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pci/hotplug/yenta_socket.c:2816: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * EnE specific part. EnE bridges are register compatible with TI bridges but


vim +2816 drivers/pci/hotplug/yenta_socket.c

eb0a90b4970d66 drivers/pcmcia/yenta_socket.c Dominik Brodowski 2005-07-12  2813  
eb0a90b4970d66 drivers/pcmcia/yenta_socket.c Dominik Brodowski 2005-07-12  2814  
f494bd9d3cca28 drivers/pcmcia/yenta_socket.c Arnd Bergmann     2023-02-23  2815  /**
f494bd9d3cca28 drivers/pcmcia/yenta_socket.c Arnd Bergmann     2023-02-23 @2816   * EnE specific part. EnE bridges are register compatible with TI bridges but
f494bd9d3cca28 drivers/pcmcia/yenta_socket.c Arnd Bergmann     2023-02-23  2817   * have their own test registers and more important their own little problems.
f494bd9d3cca28 drivers/pcmcia/yenta_socket.c Arnd Bergmann     2023-02-23  2818   * Some fixup code to make everybody happy (TM).
f494bd9d3cca28 drivers/pcmcia/yenta_socket.c Arnd Bergmann     2023-02-23  2819   */
f494bd9d3cca28 drivers/pcmcia/yenta_socket.c Arnd Bergmann     2023-02-23  2820  

:::::: The code at line 2816 was first introduced by commit
:::::: f494bd9d3cca2859edb3bbd1aa6b48c7d042a0c0 yenta_socket: copy pccard core code into driver

:::::: TO: Arnd Bergmann <arnd@arndb.de>
:::::: CC: Arnd Bergmann <arnd@arndb.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
