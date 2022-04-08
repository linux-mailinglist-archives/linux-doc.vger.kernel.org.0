Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC94B4F9E09
	for <lists+linux-doc@lfdr.de>; Fri,  8 Apr 2022 22:09:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239404AbiDHULR (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 8 Apr 2022 16:11:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239409AbiDHULP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 8 Apr 2022 16:11:15 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AB46353AB3
        for <linux-doc@vger.kernel.org>; Fri,  8 Apr 2022 13:09:03 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id c2so8666459pga.10
        for <linux-doc@vger.kernel.org>; Fri, 08 Apr 2022 13:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lps+VNBxsxLTQEq6nQohZpJYqrkqH9hvkhZrZvs8ibQ=;
        b=RCf6vfwHloKvazwXoXjT3SbJbG6javpXCWAOqpmzI5xWQaDqYTQcsOMEQ207Cos5B5
         qO9ltnjeXz+TlC6P6gS5antoHVMaIZrCQ11eHYBSz4eTQ/R5GGKOKUyFI3+806vxMnK1
         fbXlyPceUpjETNwwV/acg+2NG+XN7k8bQEJSHpWLS+RnyRLA9cOOAyhj2wlwHqa6fXhX
         5UzERtidt5e1I1tW46oeIC+BAKtd/hL8cz2X59EFfp/FyB0bvhoBiag+huSUtmzW0EGF
         ZloCHuXwEcJaDEAdLae+GRpT74s5Z5tB2VxWhFW/wTLF+JzkDyExAWJEJn5dCTzRM2C4
         T/4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lps+VNBxsxLTQEq6nQohZpJYqrkqH9hvkhZrZvs8ibQ=;
        b=tcXeBBvvAllLJ9l0mhfFCGF5YTD5NYPH4ey0JnzhUCmlZ28zOeTdo5OuhXtidRVKZd
         Sj/egs9Ln/mEZGgxKBY7oz7oswaR5Eb9bogOfUYcF0Na+EgsmCGhzxm+ru6BJPi3f9OB
         9RCVYqrnDuJmQiT0jwtOm13mghOvENWli5IPK/6ZjHHesCWnRzTjUcCB6A+2XwVF8IxJ
         AGBOQzunhej0ZlB1qp8YyOCQSVzD0ajHlJlcIel4Jjr8BqasnYleMi8SW4XRlOUnn9Ku
         ZVqqvFL4/GdZRFUvSt0gZRKVi1zFTiVI3J7fxDoCDdFhcmrFClaBGD3iUN39HnnjIXxo
         wyGw==
X-Gm-Message-State: AOAM530c3VpDnimd6We/fh733AK2BtPL7ER6lkUZuyMnzhz8ePx47C8R
        Z+smW2ifMDvYo+wq1emXs0DX35SWShwDzgufBjwvlg==
X-Google-Smtp-Source: ABdhPJzz7VtU/jWLapetzfgx+tJK9xG2ELYFWCgBlgjsJVs1zlzEQ0TGnJccuDT8XjoFmwm+1J8zGhZZ1ZeuNlXpWT0=
X-Received: by 2002:a63:ff63:0:b0:386:327:5353 with SMTP id
 s35-20020a63ff63000000b0038603275353mr16630830pgk.401.1649448542724; Fri, 08
 Apr 2022 13:09:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220408045743.1432968-1-yosryahmed@google.com>
 <20220408045743.1432968-2-yosryahmed@google.com> <YlA754XNFAmWQcm6@dschatzberg-fedora-PC0Y6AEN.dhcp.thefacebook.com>
 <YlBCeadBqbeVvALK@dhcp22.suse.cz> <YlBM/HlPyPUZew5N@dschatzberg-fedora-PC0Y6AEN.dhcp.thefacebook.com>
In-Reply-To: <YlBM/HlPyPUZew5N@dschatzberg-fedora-PC0Y6AEN.dhcp.thefacebook.com>
From:   Yosry Ahmed <yosryahmed@google.com>
Date:   Fri, 8 Apr 2022 13:08:26 -0700
Message-ID: <CAJD7tkbFjbGJ7CnNogpGq5enh_uhP8T5c0U+ku9PfwMoVLf2gg@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] memcg: introduce per-memcg reclaim interface
To:     Dan Schatzberg <schatzberg.dan@gmail.com>,
        Michal Hocko <mhocko@suse.com>
Cc:     Johannes Weiner <hannes@cmpxchg.org>,
        Shakeel Butt <shakeelb@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Roman Gushchin <roman.gushchin@linux.dev>,
        David Rientjes <rientjes@google.com>,
        Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <shuah@kernel.org>, Yu Zhao <yuzhao@google.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Wei Xu <weixugc@google.com>, Greg Thelen <gthelen@google.com>,
        Chen Wandun <chenwandun@huawei.com>,
        Vaibhav Jain <vaibhav@linux.ibm.com>,
        =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
        Tim Chen <tim.c.chen@linux.intel.com>, cgroups@vger.kernel.org,
        linux-doc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Apr 8, 2022 at 7:55 AM Dan Schatzberg <schatzberg.dan@gmail.com> wrote:
>
> On Fri, Apr 08, 2022 at 04:11:05PM +0200, Michal Hocko wrote:
> > Regarding "max" as a possible input. I am not really sure to be honest.
> > I can imagine that it could be legit to simply reclaim all the charges
> > (e.g. before removing the memcg) which should be achieveable by
> > reclaiming the reported consumption. Or what exactly should be the
> > semantic?
>
> Yeah, it just allows you to avoid reading memory.current to just
> reclaim everything if you can specify "max" - you're still protected
> by nretries to eventually bail out. Mostly, though I just feel like
> supporting "max" makes memory.reclaim semetric with a lot of the
> cgroup memory control files which tend to support "max".

One possible approach here is to have force_empty behavior when we
write "max" to memory.reclaim. From Google's perspective we don't have
a preference, but it seems to me like logical behavior. We can do this
either by directly calling mem_cgroup_force_empty() or just draining
stock and lrus in memory_reclaim().

This actually brings up another interesting point. Do you think we
should drain lrus if try_to_free_mem_cgroup_pages() fails to reclaim
the request amount? We can do this after the first call or before the
last one. It could introduce more evictable pages for
try_to_free_mem_cgroup_pages() to free.
