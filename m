Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BE9A4E7E65
	for <lists+linux-doc@lfdr.de>; Sat, 26 Mar 2022 02:16:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229997AbiCZBSE (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 25 Mar 2022 21:18:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230025AbiCZBSE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 25 Mar 2022 21:18:04 -0400
Received: from mail-vk1-xa36.google.com (mail-vk1-xa36.google.com [IPv6:2607:f8b0:4864:20::a36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE3721960A5
        for <linux-doc@vger.kernel.org>; Fri, 25 Mar 2022 18:16:27 -0700 (PDT)
Received: by mail-vk1-xa36.google.com with SMTP id w189so5119945vke.10
        for <linux-doc@vger.kernel.org>; Fri, 25 Mar 2022 18:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sWh9Ea2SfYQLuMecAvYHl1bg2ANjarcukEX42J9T3Q4=;
        b=Fw839jtTa+ujk4jaMx/ShkgCxzwfRNSxWAk1ruX8Ob/eJXDJFBhPGjXAAk+FVw/2LD
         1kkvuDrQPXXVn+rumYNup3U6BtAAPWRoyhFcg0kO3hsunKH3VxtyTHPCFebKfCeW/CFk
         QILcrPPXH7kIgjswUfQses1yTPTfPXbFXZZbnzzoLdyCofXYJ8VIlebS43mnBqVPD9k0
         b6b5YwV40H+IPneGBDe0iuP3KmBalqQVuKTK4vUJ0NEf4u254ahc8xuxGXT97hG1V9q5
         ft+V2omAMeXN+Ts1DHIoUOI9fawa+p36cwhJJno0y+ZmyXkVneFIfwc50mgyA3ckVAxI
         K41Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sWh9Ea2SfYQLuMecAvYHl1bg2ANjarcukEX42J9T3Q4=;
        b=NiilDbhzFZ0wTA2cQdgi3t5Yl9ctdwqovSYwa4eJhZI0qwc/7imzPrrbW6POhXSRPd
         7E7eixJEo9/CnqKMx4ryOBWbU0dZz68IAxa8A8udEAgJKEjgYzuMn4UddU0ZKucoUkXu
         fCh85FN22H3Vc3J11ljcjiCAV3nZVq91GzcPUgPADYprBGzOZ7ZESjqgxepW1vHFxF7e
         Hln7AFRUJtEZYfmyfHJmGVtiU+0d4wS8dUO0ge/B7jtcAqRH748UDkTkSUfaPPK228ex
         Gdwv2TgsOZlZyI1++h0VTnXd30eMJDShtJBBWCGWU+jl6Kl0RM0+Hgm0HO4xcJOwu719
         cw/g==
X-Gm-Message-State: AOAM531+SQbiPC32kBxUD5uGyZfPzccsnWjeWzGO5tJJNi0CduNpCbdQ
        d4DZC5E/u0UiXrTkAwBq47VyJ5BzMgURMkg1u7KNQg==
X-Google-Smtp-Source: ABdhPJzsZZY01w8F9FI02pR0G+qwcUxzDSqfau5PVajQtOT0uIUI+36L5FVD4NKAgdVasVtVUjzFr849CtqouiU0xZc=
X-Received: by 2002:a1f:a9cb:0:b0:33e:d145:85f0 with SMTP id
 s194-20020a1fa9cb000000b0033ed14585f0mr6593027vke.7.1648257386623; Fri, 25
 Mar 2022 18:16:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220326010003.3155137-1-yuzhao@google.com> <CAHk-=wjp=jEhjvD9GPnHfuV5Kc1=rUnf84b_qscLJ8fkY74u3Q@mail.gmail.com>
In-Reply-To: <CAHk-=wjp=jEhjvD9GPnHfuV5Kc1=rUnf84b_qscLJ8fkY74u3Q@mail.gmail.com>
From:   Yu Zhao <yuzhao@google.com>
Date:   Fri, 25 Mar 2022 19:16:15 -0600
Message-ID: <CAOUHufbqum18T4kZ=d_hMehz=N=3iSuNfGrLof5tB8kjGkk8yw@mail.gmail.com>
Subject: Re: [page-reclaim] Re: [GIT PULL] Multi-gen LRU for 5.18-rc1
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andi Kleen <ak@linux.intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Aneesh Kumar <aneesh.kumar@linux.ibm.com>,
        Barry Song <baohua@kernel.org>,
        Brian Geffon <bgeffon@google.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Daniel Byrne <djbyrne@mtu.edu>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Donald Carr <d@chaos-reins.com>,
        Hillf Danton <hdanton@sina.com>,
        =?UTF-8?Q?Holger_Hoffst=C3=A4tte?= <holger@applied-asynchrony.com>,
        Jan Alexander Steffens <heftig@archlinux.org>,
        Jens Axboe <axboe@kernel.dk>,
        Jesse Barnes <jsbarnes@google.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Konstantin Kharlamov <Hi-Angel@yandex.ru>,
        Matthew Wilcox <willy@infradead.org>,
        Mel Gorman <mgorman@suse.de>,
        Michael Larabel <Michael@michaellarabel.com>,
        Michal Hocko <mhocko@kernel.org>,
        Mike Rapoport <rppt@kernel.org>,
        Oleksandr Natalenko <oleksandr@natalenko.name>,
        Rik van Riel <riel@surriel.com>,
        Shuang Zhai <szhai2@cs.rochester.edu>,
        Sofia Trinh <sofia.trinh@edi.works>,
        Steven Barrett <steven@liquorix.net>,
        Suleiman Souhlal <suleiman@google.com>,
        Vaibhav Jain <vaibhav@linux.ibm.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Will Deacon <will@kernel.org>,
        Ying Huang <ying.huang@intel.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>,
        Kernel Page Reclaim v2 <page-reclaim@google.com>,
        "the arch/x86 maintainers" <x86@kernel.org>
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

On Fri, Mar 25, 2022 at 7:07 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Fri, Mar 25, 2022 at 6:00 PM Yu Zhao <yuzhao@google.com> wrote:
> >
> > This is more of an option than a request for 5.18. I'm sending it to
> > you directly because, in my judgement, it's now as ready as it'll ever
> > be.
>
> So I do expect to merge this, but I don't think it has been in
> linux-next, has it?

No. I could ask Stephen to see if he is willing to take this series. I
was hoping to go through Andrew since his tree is what most MM
developers test. I haven't heard from Andrew, so I assume he has no
strong opinion and I don't want to put him in a different position.
