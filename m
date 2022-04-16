Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0101C503786
	for <lists+linux-doc@lfdr.de>; Sat, 16 Apr 2022 18:32:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232392AbiDPQfI (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 16 Apr 2022 12:35:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232233AbiDPQfH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 16 Apr 2022 12:35:07 -0400
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com [IPv6:2001:4860:4864:20::29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33AC31400C
        for <linux-doc@vger.kernel.org>; Sat, 16 Apr 2022 09:32:34 -0700 (PDT)
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-de3eda6b5dso10597668fac.0
        for <linux-doc@vger.kernel.org>; Sat, 16 Apr 2022 09:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxtx.org; s=google;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc;
        bh=sZr+uwfdHKmeg2pHKOfIzlKY2/0N62xG4fWchiL4BA0=;
        b=R6vut8AJtPQR6vznNzXpxi2jqRZtGeBIMFdJ1p4UIz7AsaB5JEDXWyzkEvcAxsfL2r
         h0XosbIiuHiNtCXmVNH9C2+WW0Di+6JDXCrMyOX400xLizB7IDqkl4VmZL7N77hShzEI
         OAzUydHeAkZ7wwy5N2UPWZJvF/EWE2V8DZ/7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc;
        bh=sZr+uwfdHKmeg2pHKOfIzlKY2/0N62xG4fWchiL4BA0=;
        b=vDKmDeSYrzFyO8gPqSCPQWCLyOdSkAvn010DlJz/AQA+e4THU3F60rfv1j2C2cl7WZ
         y3suzKXJlisNSLw+rdT4DgZ5v6RD5NkaMebyGl+/JEkTGcXH37Lbas/MrpC1F0yQGm3A
         CQp4PJXPx7NNCVCCjIojeafh8Lo/6h0PjqSobuBAbdai1cx78Ln4211MPCTXTGCD3Fqm
         AcL9khSdwBZAdX+gnbFwiG/PPrKMnPY8+JHWheKH5FU+DQ8lTImPVYtBmqowXLVAWAqi
         Hp6lar3FAO0/pvQHu4o68O98ekrKnxd1WyfVPIZtySr+GqcYr8tJaAvcLDLdiQ8KHb/I
         3Y8g==
X-Gm-Message-State: AOAM532coDFo5q2ZhAgvu9SdiTdu14rk9nqBKSmzyXRN6JvUlIKQ6N1o
        6ZQmowNIPH5z5jiMP6DOFNvn5mbluCgvCsfKtq0=
X-Google-Smtp-Source: ABdhPJwLbUqj8nih29Fi7fV5gp7/+GTRs4zaQVM4CGm/XSGzEG6RFBBQjrtTnkX2BT9dXc+mxafk/Q==
X-Received: by 2002:a05:6870:e6d3:b0:e5:8d67:beb with SMTP id s19-20020a056870e6d300b000e58d670bebmr3053959oak.162.1650126753173;
        Sat, 16 Apr 2022 09:32:33 -0700 (PDT)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com. [209.85.167.174])
        by smtp.gmail.com with ESMTPSA id os2-20020a0568707d0200b000e42ef7cff2sm2501155oab.43.2022.04.16.09.32.30
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Apr 2022 09:32:31 -0700 (PDT)
Sender: Justin Forbes <jmforbes@linuxtx.org>
Received: by mail-oi1-f174.google.com with SMTP id z8so10978991oix.3
        for <linux-doc@vger.kernel.org>; Sat, 16 Apr 2022 09:32:30 -0700 (PDT)
X-Received: by 2002:a17:90a:ca84:b0:1cb:adf4:1740 with SMTP id
 y4-20020a17090aca8400b001cbadf41740mr10027204pjt.109.1650126739461; Sat, 16
 Apr 2022 09:32:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220407031525.2368067-1-yuzhao@google.com> <20220407031525.2368067-9-yuzhao@google.com>
 <20220411191621.0378467ad99ebc822d5ad005@linux-foundation.org>
 <CAOUHufYeC=Kuu59BPL_48sM67CqACxH2wWy-SYGXpadgMDmY3w@mail.gmail.com>
 <20220414185654.e7150bcbe859e0dd4b9c61af@linux-foundation.org>
 <CAOUHufYy6yQS9ARN9C5+ODkopR+ez4TH3hZNZo4HtNHBExS1mA@mail.gmail.com>
 <20220415121521.764a88dda55ae8c676ad26b0@linux-foundation.org>
 <CAOUHufYsjwMGMFCfYoh79rFZqwqS1jDihcBS9sHd-gBxEAD3Ug@mail.gmail.com> <20220415143220.cc37b0b0a368ed2bf2a821f8@linux-foundation.org>
In-Reply-To: <20220415143220.cc37b0b0a368ed2bf2a821f8@linux-foundation.org>
From:   Justin Forbes <jforbes@fedoraproject.org>
Date:   Sat, 16 Apr 2022 11:32:08 -0500
X-Gmail-Original-Message-ID: <CAFbkSA3jdtDrWz9-i2ZED5k8uBx6nwrikSO6x22qGeWqj8bgHg@mail.gmail.com>
Message-ID: <CAFbkSA3jdtDrWz9-i2ZED5k8uBx6nwrikSO6x22qGeWqj8bgHg@mail.gmail.com>
Subject: Re: [PATCH v10 08/14] mm: multi-gen LRU: support page table walks
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Yu Zhao <yuzhao@google.com>, Stephen Rothwell <sfr@rothwell.id.au>,
        Linux-MM <linux-mm@kvack.org>, Andi Kleen <ak@linux.intel.com>,
        Aneesh Kumar <aneesh.kumar@linux.ibm.com>,
        Barry Song <21cnbao@gmail.com>,
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
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Kernel Page Reclaim v2 <page-reclaim@google.com>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        Brian Geffon <bgeffon@google.com>,
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
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Apr 15, 2022 at 4:33 PM Andrew Morton <akpm@linux-foundation.org> wrote:
>
> On Fri, 15 Apr 2022 14:11:32 -0600 Yu Zhao <yuzhao@google.com> wrote:
>
> > >
> > > I grabbed
> > > https://kojipkgs.fedoraproject.org//packages/kernel/5.18.0/0.rc2.23.fc37/src/kernel-5.18.0-0.rc2.23.fc37.src.rpm
> > > and
> >
> > Yes, Fedora/RHEL is one concrete example of the model I mentioned
> > above (experimental/stable). I added Justin, the Fedora kernel
> > maintainer, and he can further clarify.

We almost split into 3 scenarios. In rawhide we run a standard Fedora
config for rcX releases and .0, but git snapshots are built with debug
configs only. The trade off is that we can't turn on certain options
which kill performance, but we do get more users running these kernels
which expose real bugs.  The rawhide kernel follows Linus' tree and is
rebuilt most weekdays.  Stable Fedora is not a full debug config, but
in cases where we can keep a debug feature on without it much getting
in the way of performance, as is the case with CONFIG_DEBUG_VM, I
think there is value in keeping those on, until there is not.  And of
course RHEL is a much more conservative config, and a much more
conservative rebase/backport codebase.

> > If we don't want more VM_BUG_ONs, I'll remove them. But (let me
> > reiterate) it seems to me that just defeats the purpose of having
> > CONFIG_DEBUG_VM.
> >
>
> Well, I feel your pain.  It was never expected that VM_BUG_ON() would
> get subverted in this fashion.

Fedora is not trying to subvert anything.  If keeping the option on
becomes problematic, we can simply turn it off.   Fedora certainly has
a more diverse installed base than typical enterprise distributions,
and much more diverse than most QA pools.  Both in the array of
hardware, and in the use patterns, so things do get uncovered that
would not be seen otherwise.

> We could create a new MM-developer-only assertion.  Might even call it
> MM_BUG_ON().  With compile-time enablement but perhaps not a runtime
> switch.
>
> With nice simple semantics, please.  Like "it returns void" and "if you
> pass an expression with side-effects then you lose".  And "if you send
> a patch which produces warnings when CONFIG_MM_BUG_ON=n then you get to
> switch to windows95 for a month".
>
> Let's leave the mglru assertions in place for now and let's think about
> creating something more suitable, with a view to switching mglru over
> to that at a later time.
>
>
>
> But really, none of this addresses the core problem: *_BUG_ON() often
> kills the kernel.  So guess what we just did?  We killed the user's
> kernel at the exact time when we least wished to do so: when they have
> a bug to report to us.  So the thing is self-defeating.
>
> It's much much better to WARN and to attempt to continue.  This makes
> it much more likely that we'll get to hear about the kernel flaw.

I agree very much with this. We hear about warnings from users, they
don't go unnoticed, and several of these users are willing to spend
time to help get to the bottom of an issue. They may not know the
code, but plenty are willing to test various patches or scenarios.

Justin
