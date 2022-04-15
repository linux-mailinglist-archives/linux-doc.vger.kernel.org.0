Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C5A3502FB9
	for <lists+linux-doc@lfdr.de>; Fri, 15 Apr 2022 22:19:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351959AbiDOUVp (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 15 Apr 2022 16:21:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243464AbiDOUVo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 15 Apr 2022 16:21:44 -0400
Received: from mail-vk1-xa2b.google.com (mail-vk1-xa2b.google.com [IPv6:2607:f8b0:4864:20::a2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4879DE932
        for <linux-doc@vger.kernel.org>; Fri, 15 Apr 2022 13:19:14 -0700 (PDT)
Received: by mail-vk1-xa2b.google.com with SMTP id 80so3734218vkw.0
        for <linux-doc@vger.kernel.org>; Fri, 15 Apr 2022 13:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RL4h06AiN/8w2o0+WiSAeDo+mIxH1CqmEN55coz0ZRI=;
        b=cG7AXdVOmojd7MPJeyvdAKpKNSrCsdc+0C+jBZpP/l0cPfjWbDkpXc3uKsnXjHbZV9
         qR7pzwGxqiqamTg07BI4QpeQJkph+ny9gAUXN6/7mo8ghhN+OIANuDNLKjziKKYdyzyJ
         El2R76h+olnjDnbnNKUeCK0M3JWu48ALCpHFw7W/rtZut0Gl0juIqxIeEwZ9yWG+EZC3
         TOKHl8t1j7iotttaFvZUE2R9Je9NTb/0fRabz22i0mg7OujgPkQryjsCzYOwAskzqem+
         OHTlmpmBZVh9rADP00Nu6D0ZtshSsA0skqt2BD2DVNk9Ymqle9R1FG8+H/pL8yJzoA0r
         f8FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RL4h06AiN/8w2o0+WiSAeDo+mIxH1CqmEN55coz0ZRI=;
        b=0XWaZZTMXRUH0RrKmf/sr3+FPmT0BOq2x0PhBIZTSWjzfOKTDtHkZCRHXQunUHd3iu
         9Fma7vj4fSDLiXNDJyAu8OLku+lsgzrqR0jhzUPN6yS/64cytTtlntbt0vd0aYP5zL+f
         xxdHRBDyP1BigXjsJRo26SabV1BxwjoyuIATcrZQ16zHTd07G84iFNdwbG2feloVeyxF
         gNH7rbR+IuRRzMArybXS0VprY5FCDO8AR4/MDYd9AKfc1Ctqm+0DEv5uWPsI6dyDaADj
         Oa5a4RJDwQFxMVslPY+GN/+Uocyd4VpbyppzCRuk+dRqXwrJ0+tduC1iP/mBIjqv6Xso
         50gw==
X-Gm-Message-State: AOAM532n0jUl3ybwSXSCySvKyhmEdf6pnsLWmLYxU3ckEVLhaOWl/eK6
        +SKIBXfLqTuZCaxBY1ht8/w9PfC2d1mj/lVISqKtmg==
X-Google-Smtp-Source: ABdhPJyixbc34eO6iyu54XQyh9mZgb+tRH7Zy9C+wfiLqmqg/wY+fuq9KDoFF7OSWdQsq/iJaXoxUlUwz8RQNa0Yfso=
X-Received: by 2002:a1f:32cf:0:b0:345:cdce:5dcd with SMTP id
 y198-20020a1f32cf000000b00345cdce5dcdmr200317vky.14.1650053953620; Fri, 15
 Apr 2022 13:19:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220407031525.2368067-1-yuzhao@google.com> <20220407031525.2368067-7-yuzhao@google.com>
 <CAGsJ_4xqm4L4E4dW4PPHos8Ed9ej6hph28tSGy21Re3u7WiuOA@mail.gmail.com>
 <YliFs3NOHeo2LeXl@google.com> <CAGsJ_4yYP1Wv7_KqX+bo2u=YZNGAqYsLf8evekqz9Y6djbWD7Q@mail.gmail.com>
In-Reply-To: <CAGsJ_4yYP1Wv7_KqX+bo2u=YZNGAqYsLf8evekqz9Y6djbWD7Q@mail.gmail.com>
From:   Yu Zhao <yuzhao@google.com>
Date:   Fri, 15 Apr 2022 14:18:37 -0600
Message-ID: <CAOUHufbJnQGT+_Bg-bXZHH_PZ8GdZ72y=iCCguzq-waT5A0fEQ@mail.gmail.com>
Subject: Re: [PATCH v10 06/14] mm: multi-gen LRU: minimal implementation
To:     Barry Song <21cnbao@gmail.com>
Cc:     Stephen Rothwell <sfr@rothwell.id.au>,
        Linux-MM <linux-mm@kvack.org>, Andi Kleen <ak@linux.intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Aneesh Kumar <aneesh.kumar@linux.ibm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Hillf Danton <hdanton@sina.com>, Jens Axboe <axboe@kernel.dk>,
        Jesse Barnes <jsbarnes@google.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Matthew Wilcox <willy@infradead.org>,
        Mel Gorman <mgorman@suse.de>,
        Michael Larabel <Michael@michaellarabel.com>,
        Michal Hocko <mhocko@kernel.org>,
        Mike Rapoport <rppt@kernel.org>,
        Rik van Riel <riel@surriel.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Will Deacon <will@kernel.org>,
        Ying Huang <ying.huang@intel.com>,
        LAK <linux-arm-kernel@lists.infradead.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Kernel Page Reclaim v2 <page-reclaim@google.com>,
        x86 <x86@kernel.org>, Brian Geffon <bgeffon@google.com>,
        Jan Alexander Steffens <heftig@archlinux.org>,
        Oleksandr Natalenko <oleksandr@natalenko.name>,
        Steven Barrett <steven@liquorix.net>,
        Suleiman Souhlal <suleiman@google.com>,
        Daniel Byrne <djbyrne@mtu.edu>,
        Donald Carr <d@chaos-reins.com>,
        =?UTF-8?Q?Holger_Hoffst=C3=A4tte?= <holger@applied-asynchrony.com>,
        Konstantin Kharlamov <Hi-Angel@yandex.ru>,
        Shuang Zhai <szhai2@cs.rochester.edu>,
        Sofia Trinh <sofia.trinh@edi.works>,
        Vaibhav Jain <vaibhav@linux.ibm.com>
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

On Fri, Apr 15, 2022 at 4:26 AM Barry Song <21cnbao@gmail.com> wrote:
>
> On Fri, Apr 15, 2022 at 8:36 AM Yu Zhao <yuzhao@google.com> wrote:
> >
> > On Thu, Apr 14, 2022 at 06:03:10PM +1200, Barry Song wrote:
> > >
> > > On Thu, Apr 7, 2022 at 3:16 PM Yu Zhao <yuzhao@google.com> wrote:
> > > >
> > > > +
> > > > +static int isolate_folios(struct lruvec *lruvec, struct scan_control *sc, int swappiness,
> > > > +                         int *type_scanned, struct list_head *list)
> > > > +{
> > > > +       int i;
> > > > +       int type;
> > > > +       int scanned;
> > > > +       int tier = -1;
> > > > +       DEFINE_MIN_SEQ(lruvec);
> > > > +
> > > > +       VM_BUG_ON(!seq_is_valid(lruvec));
> > > > +
> > > > +       /*
> > > > +        * Try to make the obvious choice first. When anon and file are both
> > > > +        * available from the same generation, interpret swappiness 1 as file
> > > > +        * first and 200 as anon first.
> > > > +        */
> > >
> > > Has this changed the ABI of swapiness?
> >
> > No.
> >
> > > or it is only something
> > > meaningful for the internal code?
> >
> > This is how swappiness is interpreted.
> >
> > > if so, can we rename it to
> > > something else? otherwise, it is quite confusing.
> >
> > Feel free to suggest something.
> >
> > > it seems 1 is set internally as a magic number here:
> > > +static void lru_gen_shrink_lruvec(struct lruvec *lruvec, struct
> > > scan_control *sc)
> > > +{
> > > + ...
> > > + else if (!cgroup_reclaim(sc) && get_swappiness(lruvec, sc))
> > > + swappiness = 1;
> > > + else
> > > + swappiness = 0;
> > > + }
> > > obviously this swappiness is neither /proc/sys/vm/swappiness  nor
> > > /sys/fs/cgroup/memory/<group>/>memory.swappiness, right?
> >
> > Right.
> >
> > > > @@ -3928,6 +4726,11 @@ static void age_active_anon(struct pglist_data *pgdat,
> > > >         struct mem_cgroup *memcg;
> > > >         struct lruvec *lruvec;
> > > >
> > > > +       if (lru_gen_enabled()) {
> > > > +               lru_gen_age_node(pgdat, sc);
> > > > +               return;
> > > > +       }
> > >
> > > is it really a good place for  lru_gen_age_node() since the function
> > > is named age_active_anon()
> > > but here you are doing aging for both anon and file pages?
> >
> > Yes.
> >
> > > obviously
> > > lru_gen_age_node() is not
>
> > > doing "age active anon".
> >
> ;> We can rename it if you have something in mind.
>
> i wonder if we can directly do:
>
> if (lru_gen_enabled())
>       lru_gen_age_node(pgdat, sc);
> else
>      age_active_anon();

This looks good to me. I've queued it for the next version. Thanks.
