Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CA9067F7B6
	for <lists+linux-doc@lfdr.de>; Sat, 28 Jan 2023 13:03:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234003AbjA1MDi (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 28 Jan 2023 07:03:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233973AbjA1MDh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 28 Jan 2023 07:03:37 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6002578AF6;
        Sat, 28 Jan 2023 04:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674907415; x=1706443415;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=g0nYUyAl0keLEWY5bIHOgRjp4TZCidbtA0BM2hVWcKk=;
  b=U76kHGUIDiTpqcLKu5zGJtdcSl5xR+L8Nh1BAjZllsy0kRC8vYYRpCpR
   M8dstdLciebtLkV4D/w9FAq69BREHQcVZDh8H75vDNqgMUQ1AHBfC9wxS
   X45jSNiLSPicokZrUf5tPk9dRM/+ozRZkNza6Dx8Ce2UFERaemzjlkyhY
   pPkCRYYhyXdkMWIgfR3rJc1SdEl9CIl6i7biqxgMgoV7SPzZoJOWkMzdu
   CGET0d/Gnu6gXQPlRpOqpAOLFUpnWnGWwdVDi5fUlUsObxn/V+kijNO5H
   A1y9GWk2ZM4IWmzGf+apG3c6YvHBEoRTyatlSB074tVpstm5WQy5RcmTI
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="354593396"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="354593396"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2023 04:03:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="656917222"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="656917222"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 28 Jan 2023 04:03:28 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pLjvb-0000cn-1O;
        Sat, 28 Jan 2023 12:03:27 +0000
Date:   Sat, 28 Jan 2023 20:03:23 +0800
From:   kernel test robot <lkp@intel.com>
To:     Gregory Price <gourry.memverge@gmail.com>,
        linux-kernel@vger.kernel.org
Cc:     oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org,
        oleg@redhat.com, avagin@gmail.com, luto@kernel.org,
        krisman@collabora.com, tglx@linutronix.de, corbet@lwn.net,
        shuah@kernel.org, Gregory Price <gregory.price@memverge.com>
Subject: Re: [PATCH v7 1/1] ptrace,syscall_user_dispatch: checkpoint/restore
 support for SUD
Message-ID: <202301281932.AtpbMlh9-lkp@intel.com>
References: <20230126190645.18341-2-gregory.price@memverge.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230126190645.18341-2-gregory.price@memverge.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Gregory,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on tip/core/entry v6.2-rc5 next-20230127]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gregory-Price/ptrace-syscall_user_dispatch-checkpoint-restore-support-for-SUD/20230128-145101
patch link:    https://lore.kernel.org/r/20230126190645.18341-2-gregory.price%40memverge.com
patch subject: [PATCH v7 1/1] ptrace,syscall_user_dispatch: checkpoint/restore support for SUD
config: x86_64-rhel-8.3-syz (https://download.01.org/0day-ci/archive/20230128/202301281932.AtpbMlh9-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/bc68df21f98617e74a8c5368a901041f89bdb17f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Gregory-Price/ptrace-syscall_user_dispatch-checkpoint-restore-support-for-SUD/20230128-145101
        git checkout bc68df21f98617e74a8c5368a901041f89bdb17f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash kernel/entry/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   kernel/entry/syscall_user_dispatch.c: In function 'syscall_user_dispatch_get_config':
   kernel/entry/syscall_user_dispatch.c:114:45: error: storage size of 'config' isn't known
     114 |         struct syscall_user_dispatch_config config;
         |                                             ^~~~~~
   kernel/entry/syscall_user_dispatch.c:116:28: error: invalid application of 'sizeof' to incomplete type 'struct syscall_user_dispatch_config'
     116 |         if (size != sizeof(struct syscall_user_dispatch_config))
         |                            ^~~~~~
>> kernel/entry/syscall_user_dispatch.c:114:45: warning: unused variable 'config' [-Wunused-variable]
     114 |         struct syscall_user_dispatch_config config;
         |                                             ^~~~~~
   kernel/entry/syscall_user_dispatch.c: In function 'syscall_user_dispatch_set_config':
   kernel/entry/syscall_user_dispatch.c:137:45: error: storage size of 'config' isn't known
     137 |         struct syscall_user_dispatch_config config;
         |                                             ^~~~~~
   kernel/entry/syscall_user_dispatch.c:139:28: error: invalid application of 'sizeof' to incomplete type 'struct syscall_user_dispatch_config'
     139 |         if (size != sizeof(struct syscall_user_dispatch_config))
         |                            ^~~~~~
   kernel/entry/syscall_user_dispatch.c:137:45: warning: unused variable 'config' [-Wunused-variable]
     137 |         struct syscall_user_dispatch_config config;
         |                                             ^~~~~~
   kernel/entry/syscall_user_dispatch.c:147:1: error: control reaches end of non-void function [-Werror=return-type]
     147 | }
         | ^
   cc1: some warnings being treated as errors


vim +/config +114 kernel/entry/syscall_user_dispatch.c

   109	
   110	int syscall_user_dispatch_get_config(struct task_struct *task, unsigned long size,
   111			void __user *data)
   112	{
   113		struct syscall_user_dispatch *sd = &task->syscall_dispatch;
 > 114		struct syscall_user_dispatch_config config;
   115	
   116		if (size != sizeof(struct syscall_user_dispatch_config))
   117			return -EINVAL;
   118	
   119		if (test_syscall_work(SYSCALL_USER_DISPATCH))
   120			config.mode = PR_SYS_DISPATCH_ON;
   121		else
   122			config.mode = PR_SYS_DISPATCH_OFF;
   123	
   124		config.offset = sd->offset;
   125		config.len = sd->len;
   126		config.selector = sd->selector;
   127	
   128		if (copy_to_user(data, &config, sizeof(config)))
   129			return -EFAULT;
   130	
   131		return 0;
   132	}
   133	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
