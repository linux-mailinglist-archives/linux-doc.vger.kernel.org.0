Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20D374E61F8
	for <lists+linux-doc@lfdr.de>; Thu, 24 Mar 2022 11:48:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347107AbiCXKuQ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 24 Mar 2022 06:50:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349611AbiCXKuO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 24 Mar 2022 06:50:14 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CE6826136
        for <linux-doc@vger.kernel.org>; Thu, 24 Mar 2022 03:48:29 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id g9so5298066ybf.1
        for <linux-doc@vger.kernel.org>; Thu, 24 Mar 2022 03:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o+0BbB+UwcXM8aJXn73uapD7rigb18/OqbdOVcbPmAM=;
        b=sdZYLnC7or9MsJZXuVE7tMujraBEpTXDao/rNXk4s7kbLOGI0vxxX+lv4/HISysnff
         glmrpBpohaUWJU+M66NHw2mEbup5sUCYDgmfZXKj3K+zWvAbTMtsN8vJ+r5Vl5qQteWt
         H5nLU0JZKmqvPPdA9M4ku6yLIgzsVztYd5nP2LI7kqIUoBpprcV140p0xiPrponKCsjt
         tUrDDPsoOaR/cttvnvRzZp4C5zrJ9dG7egr6ws6xZ5BHpKJ3wBauVpUmHSHAnJzJtOT1
         xIN8d8fLYL1Q1FXUfVKkQzklW+DuBocraIXbJSgf/Czx66RBJXcYZGiDkbh6OoW7cu87
         2TLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o+0BbB+UwcXM8aJXn73uapD7rigb18/OqbdOVcbPmAM=;
        b=42wUY1EhgZC06CL0NeW0tyX9mFu+U0u0RW/4AI1/zQh89HbyMO4NRfS7AYDAb9EIwZ
         ORJWxegYzpSi0/R73slM2Ga1E1NtlvRi01RegJUB94LPjaQsud2mUrH135DXl68whQth
         gY0kdx9B+uaNHUY7vk3Lz33jKuqh/sP3+RQcv5sBcvD0R0F+2WQ0oABposRvTbbU2YTI
         tZLUQCGCUCW4OI0p1Pxuz0+QefAoeVVSkcLqJ/3NwAJWCkpFa9FZQ8pR/iVQl4sHht8j
         kiApVUImJ6T2COGDh1XUdnJMrWBjn0F45FUE7UAFw2bwxw5AG2JnTgx3jcap7juXMUic
         lT5w==
X-Gm-Message-State: AOAM5303DgUfe0H3RRWjAP5ueqecSOKozY86YmaTM8oPhyeEAln1M3Kw
        4GzVRc/MT/hZGfYkX7cCkwgE/1hO9srx1mGPQb8oQQ==
X-Google-Smtp-Source: ABdhPJwFEXK/yTmINgXCVpOjf1Cb6C655DP2GnP83SY4yCXEPH0EGfJLHgJ19I1FD6u08GBYwPiw2MGUfQLqdEonGeM=
X-Received: by 2002:a25:943:0:b0:633:883b:3e21 with SMTP id
 u3-20020a250943000000b00633883b3e21mr4000965ybm.132.1648118909179; Thu, 24
 Mar 2022 03:48:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220323125523.79254-2-songmuchun@bytedance.com>
 <202203240546.MHJzsBaO-lkp@intel.com> <20220323151311.289dd405440932e1d6d80f30@linux-foundation.org>
 <7872f093-e26d-3403-d6cf-c6c1a782242b@intel.com> <CAMZfGtXqETxQPqPLebu=0b2P8RBfKiPymraJZCSK1UGAFGo=dw@mail.gmail.com>
 <4bf80e3a-ada7-942b-5bc1-2a1d2fee17c8@intel.com>
In-Reply-To: <4bf80e3a-ada7-942b-5bc1-2a1d2fee17c8@intel.com>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Thu, 24 Mar 2022 18:47:52 +0800
Message-ID: <CAMZfGtVZknHw_Ze7=64GD-wDB_ND5tcJ2rm2eYqdVPHfiUeMyA@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] mm: hugetlb_vmemmap: introduce STRUCT_PAGE_SIZE_IS_POWER_OF_2
To:     "Chen, Rong A" <rong.a.chen@intel.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        kernel test robot <lkp@intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Iurii Zaikin <yzaikin@google.com>,
        Oscar Salvador <osalvador@suse.de>,
        David Hildenbrand <david@redhat.com>, kbuild-all@lists.01.org,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        Xiongchun duan <duanxiongchun@bytedance.com>,
        Muchun Song <smuchun@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Mar 24, 2022 at 6:40 PM Chen, Rong A <rong.a.chen@intel.com> wrote:
>
>
>
> On 3/24/2022 6:20 PM, Muchun Song wrote:
> > On Thu, Mar 24, 2022 at 5:40 PM Chen, Rong A <rong.a.chen@intel.com> wrote:
> >>
> >>
> >>
> >> On 3/24/2022 6:13 AM, Andrew Morton wrote:
> >>> On Thu, 24 Mar 2022 06:06:41 +0800 kernel test robot <lkp@intel.com> wrote:
> >>>
> >>>> Hi Muchun,
> >>>>
> >>>> Thank you for the patch! Yet something to improve:
> >>>>
> >>>> [auto build test ERROR on hnaz-mm/master]
> >>>> [also build test ERROR on linus/master next-20220323]
> >>>> [cannot apply to mcgrof/sysctl-next v5.17]
> >>>> [If your patch is applied to the wrong git tree, kindly drop us a note.
> >>>> And when submitting patch, we suggest to use '--base' as documented in
> >>>> https://git-scm.com/docs/git-format-patch]
> >>>>
> >>>> url:    https://github.com/0day-ci/linux/commits/Muchun-Song/add-hugetlb_free_vmemmap-sysctl/20220323-205902
> >>>> base:   https://github.com/hnaz/linux-mm master
> >>>> config: arc-randconfig-r043-20220323 (https://download.01.org/0day-ci/archive/20220324/202203240546.MHJzsBaO-lkp@intel.com/config)
> >>>> compiler: arc-elf-gcc (GCC) 11.2.0
> >>>> reproduce (this is a W=1 build):
> >>>>           wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >>>>           chmod +x ~/bin/make.cross
> >>>>           # https://github.com/0day-ci/linux/commit/64211be650af117819368a26d7b86c33df5deea4
> >>>>           git remote add linux-review https://github.com/0day-ci/linux
> >>>>           git fetch --no-tags linux-review Muchun-Song/add-hugetlb_free_vmemmap-sysctl/20220323-205902
> >>>>           git checkout 64211be650af117819368a26d7b86c33df5deea4
> >>>>           # save the config file to linux build tree
> >>>>           mkdir build_dir
> >>>>           COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=arc prepare
> >>>>
> >>>> If you fix the issue, kindly add following tag as appropriate
> >>>> Reported-by: kernel test robot <lkp@intel.com>
> >>>>
> >>>> All errors (new ones prefixed by >>):
> >>>>
> >>>>>> cc1: fatal error: cannot open 'kernel/bounds.s' for writing: No such file or directory
> >>>
> >>> It would take a lot of talent for Munchun to have caused this!
> >>>
> >>> Methinks you just ran out of disk space?
> >>
> >> Hi Andrew,
> >>
> >> Thanks for the reply, I tried to apply this patch to the head of
> >> mainline and I still can reproduce the error in my local machine:
> >>
> >> $ wget -q -O -
> >> https://lore.kernel.org/lkml/20220323125523.79254-2-songmuchun@bytedance.com/raw
> >> | git apply -v
> >> $ mkdir build_dir && wget
> >> https://download.01.org/0day-ci/archive/20220324/202203240546.MHJzsBaO-lkp@intel.com/config
> >> -O build_dir/.config
> >> $ COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross
> >> O=build_dir ARCH=arc olddefconfig prepare
> >> make --keep-going CONFIG_OF_ALL_DTBS=y CONFIG_DTC=y
> >> CROSS_COMPILE=/home/nfs/0day/gcc-11.2.0-nolibc/arc-elf/bin/arc-elf-
> >> --jobs=72 O=build_dir ARCH=arc olddefconfig prepare
> >> ...
> >> cc1: fatal error: cannot open 'kernel/bounds.s' for writing: No such
> >> file or directory
> >> compilation terminated.
> >> make[3]: *** [../scripts/Makefile.build:121: kernel/bounds.s] Error 1
> >> make[3]: Target '__build' not remade because of errors.
> >> make[2]: *** [../Makefile:1191: prepare0] Error 2
> >> make[2]: Target 'prepare' not remade because of errors.
> >>
> >
> > Would you help me to test the following patch?  Thanks.
>
> I have confirmed the patch can fix the issue.
>

Thanks Chen.
