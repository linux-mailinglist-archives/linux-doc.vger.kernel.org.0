Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D710D502FAE
	for <lists+linux-doc@lfdr.de>; Fri, 15 Apr 2022 22:19:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351700AbiDOUU4 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 15 Apr 2022 16:20:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351787AbiDOUUz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 15 Apr 2022 16:20:55 -0400
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com [IPv6:2607:f8b0:4864:20::e31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 424A3DE930
        for <linux-doc@vger.kernel.org>; Fri, 15 Apr 2022 13:18:21 -0700 (PDT)
Received: by mail-vs1-xe31.google.com with SMTP id j16so7862889vsv.2
        for <linux-doc@vger.kernel.org>; Fri, 15 Apr 2022 13:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Cbb1YDb5NaiuUde42DTRSKAfH6XbrCM5Doeox4W/L1U=;
        b=R+fWKSybpUALXVyi7dr5ULcwrcaXsKRmDx3orLXnDSP1dKdn6sslxaR84/Vt1idESV
         R0gbbnc2Eo5O2hvxGNOm5+O5l7zO9r5grwhRC/H1pjlfnAengg/oNlV3PjITQ52N9xvj
         ttmr00bahnI6zPcHkkGyVH85UyIFb3BiDQXe1wN6D7t4+4SOidckXgXl4WmZtYM9G8g/
         aed3/o6NSjZAcWDOvNGsi7PFryJv2kBPX+cLbidK7S7FBT3z2r51EStnpXahSrD5q8Gs
         bTdzVJmEmNuyfh9W4BKstW6XQcg/tnhQUf9CLonBDa0jnHYmD9BzjVmbUocVwfvlS2tZ
         ESWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Cbb1YDb5NaiuUde42DTRSKAfH6XbrCM5Doeox4W/L1U=;
        b=A0FQFYGEKPVRpkw1hV1vk8IlvWsPb7GY/gemSs8XFFvDUSXC59yh+b+2m8Q3XGsQZL
         qDg7VkcFg3dFOosN1UBD4ZG3tHDiXU3F983F3e1bSI3xx7LFImOmWfFAOr5LKILrrYVu
         jezyIBFBfzsq7fatKgbyvRReyptuDcBmPPBOJk9tHRNCawPv+szFZU63ZDQYIGLowtNg
         OjoCzVMrgLvQ1lDxtNQmqwEKSqcJc8Nxkx2RTQxfrVmQqzL49ZybbXjgAfH3FQZfragP
         EDdNSGkre97XmhHuiIWlgv84t8tDUrl0mcCd6IAmRmHJi0L8VKkRoXMUt5xp4iKAugUx
         HMNw==
X-Gm-Message-State: AOAM532jCJ+XYJmW1SH/F/srF7bqlc9PR/haSVziUQ8skx1pGFhTDA1x
        3tzwMP5/EtZGX6DXRGK37xxrEisoqNIh3MSZobI4hg==
X-Google-Smtp-Source: ABdhPJwO94bILh3nEx3+nxP4ZO5hEG2ftNGY6x330YGarczURLY5R/Y+L+rCRpLt0Wpji7SMuT9MzVQDZVeugH9nIdA=
X-Received: by 2002:a67:de17:0:b0:32a:4007:cd86 with SMTP id
 q23-20020a67de17000000b0032a4007cd86mr220678vsk.22.1650053900285; Fri, 15 Apr
 2022 13:18:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220407031525.2368067-1-yuzhao@google.com> <20220407031525.2368067-7-yuzhao@google.com>
 <CAGsJ_4xqm4L4E4dW4PPHos8Ed9ej6hph28tSGy21Re3u7WiuOA@mail.gmail.com>
 <YliFs3NOHeo2LeXl@google.com> <20220414143959.0daf4534613f2511b9b27f11@linux-foundation.org>
 <CAGsJ_4ymn55eEkmSh5nBkoHcazHxuTBO6wtPJ0C+xE8WB+jqLg@mail.gmail.com>
In-Reply-To: <CAGsJ_4ymn55eEkmSh5nBkoHcazHxuTBO6wtPJ0C+xE8WB+jqLg@mail.gmail.com>
From:   Yu Zhao <yuzhao@google.com>
Date:   Fri, 15 Apr 2022 14:17:43 -0600
Message-ID: <CAOUHufY5EeXAn-H_A0V0rzwJOzMs+6cbbmjpxL1Yxrp7msiJog@mail.gmail.com>
Subject: Re: [PATCH v10 06/14] mm: multi-gen LRU: minimal implementation
To:     Barry Song <21cnbao@gmail.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Stephen Rothwell <sfr@rothwell.id.au>,
        Linux-MM <linux-mm@kvack.org>, Andi Kleen <ak@linux.intel.com>,
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
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Apr 15, 2022 at 4:16 AM Barry Song <21cnbao@gmail.com> wrote:
>
> On Fri, Apr 15, 2022 at 9:40 AM Andrew Morton <akpm@linux-foundation.org> wrote:
> >
> > On Thu, 14 Apr 2022 14:36:03 -0600 Yu Zhao <yuzhao@google.com> wrote:
> >
> > > > or it is only something
> > > > meaningful for the internal code?
> > >
> > > This is how swappiness is interpreted.
> > >
> > > > if so, can we rename it to
> > > > something else? otherwise, it is quite confusing.
> > >
> > > Feel free to suggest something.
> >
> > It is confusing,   swap_preference?
>
> seems to be much better. might also be worth using MACRO to replace those
> 1, 200, 0 magic numbers  to tell readers the exact meaning?

How do you read "swap_preference=0"?

I read it as "no (swap) preference", which means anon and file are
equal. The real meaning though, is "don't swap"; and the "no
preference" value is actually 100.
