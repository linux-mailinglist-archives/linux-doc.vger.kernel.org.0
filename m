Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CBD497661B3
	for <lists+linux-doc@lfdr.de>; Fri, 28 Jul 2023 04:16:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229933AbjG1CQi (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 27 Jul 2023 22:16:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbjG1CQi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 27 Jul 2023 22:16:38 -0400
Received: from mgamail.intel.com (unknown [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 534892D6A
        for <linux-doc@vger.kernel.org>; Thu, 27 Jul 2023 19:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690510597; x=1722046597;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J6zQpySJ121iiQhygfONYNvr7Z865W96HFXLPbkplnY=;
  b=L9uawTcAQXdyT/DCfgaAWm5robpKwYbVnKWiGra2KCFZZCxBrkteU2SW
   GJLGnstsC2wsxTuEqtR5WkphtRehUQCgTbHq/w48S3f08CJ9i8Gkc4GfY
   ek6xpz4T9a8Jo1EwI5jpSSvsNDP6mIit4enoowCvwvQPdtC5DIGAXSP8r
   gMsGFlF1Tlku///8j3gCiWu8uH9O0zYSTMKBMDykEImx7OYajATkS0yrS
   ej8FfcK54K8V8o9sKxGQpMStJThuZg98WlmNzy/EIn6QpWD2XA9zoyVTB
   shz5xsbypuhASsWnVHfbKzVcdae91/IRxCriBfU35BAbMKK+FH9AdiEVL
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="358506459"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; 
   d="scan'208";a="358506459"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 19:16:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="1057947531"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; 
   d="scan'208";a="1057947531"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 27 Jul 2023 19:16:35 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qPD1q-0002ml-1G;
        Fri, 28 Jul 2023 02:16:32 +0000
Date:   Fri, 28 Jul 2023 10:15:30 +0800
From:   kernel test robot <lkp@intel.com>
To:     Heiko Carstens <hca@linux.ibm.com>
Cc:     oe-kbuild-all@lists.linux.dev,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-doc@vger.kernel.org
Subject: [linux-next:master 4903/5027] htmldocs: Warning:
 kernel/Kconfig.kexec references a file that doesn't exist:
 file:Documentation/s390/zfcpdump.rst
Message-ID: <202307281049.40t8s0uv-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   451cc82bd11eb6a374f4dbcfc1cf007eafea91ab
commit: a6c36063805330633ef9a6846896a76c2ab7a351 [4903/5027] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/s390/linux.git
reproduce: (https://download.01.org/0day-ci/archive/20230728/202307281049.40t8s0uv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307281049.40t8s0uv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: kernel/Kconfig.kexec references a file that doesn't exist: file:Documentation/s390/zfcpdump.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
