Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DA852F250A
	for <lists+linux-doc@lfdr.de>; Tue, 12 Jan 2021 02:18:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728427AbhALAp2 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 11 Jan 2021 19:45:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726655AbhALAp0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 11 Jan 2021 19:45:26 -0500
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A320C061794
        for <linux-doc@vger.kernel.org>; Mon, 11 Jan 2021 16:44:46 -0800 (PST)
Received: by mail-pf1-x431.google.com with SMTP id c79so337896pfc.2
        for <linux-doc@vger.kernel.org>; Mon, 11 Jan 2021 16:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dPK8pNH4QCaFIUUZrNoOKMv2joVCl+mHPXFylSDuRyY=;
        b=YYZM3nC4hqQi8K3u2YEghUOFWSp0FudnKJQjHHjiXbYDWf5IBbeiuTdLklLvfbn/1J
         I/7XeAxo9NGSa2DgDNEJEess0Hv/TD7PjwXe6TVYuO4D2z/QbcC7iIBGWsJRlNwnrdFW
         wIeOx31f/jqTl1IUALwJLpeqpkBRMQbt7zODBGO0KwTZi7FCQxXRx2dZ2l3MqwHNX6Ab
         Mqed2aDgr2OddzqXikVgh0iy6Ci1vHR+bOcnnUhsCpj5nbt8gP3y7Kp+E1n24vSxhjOo
         +8PMmsMQYd+sUx+SCoqjtEmdW68go5RWEpCftxCH7j13OQXSFBpiKuT5l6pQlpRrDuP/
         Y3mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dPK8pNH4QCaFIUUZrNoOKMv2joVCl+mHPXFylSDuRyY=;
        b=VDBT6sdrUYW+DhDKOJ7MLGOp/SynhK5XzSCKRJOIiZq3HIHl7wrtX/r3QN4zFC3KTi
         y/1HPALPuBY2oRLksi5DenbURP04QrAtRyn0uFzKnh1j4vHLpDAU1n5NykVp+DzQHpj9
         urqxwG6TzGEcBVRTnhkVzL7bM3o5z17Lcj5YnhJicSL6Fcp6RXPEYyXviTdDLFCljSpF
         dHaW8fvytNdsfy6SK9tJUOyvWNGgNhwzQs1tQvO62BfzTzktTwiXxG01bHfA0ylKYkNI
         BGeZJu8J4XtnQUp3L7+Z+wOPZAy4bDWJJ4PJEMg4H8ritFbvozqagfMrH1ohrCbAvC6g
         GHJA==
X-Gm-Message-State: AOAM532vgE+ZC+8pJ4RfbzD7Zg0wKHw9+r0LgNNuEAMhZD1ajIOaSPj1
        x8IaVKvSuWx6YcAH1DRiuQZlVZR0ihB2HX6coiAulIrldlhNpKc1
X-Google-Smtp-Source: ABdhPJyUgt2aK/qEK75FZJTwrK4geThG9TgZIvV8yVMdaHJ9s1TRxET7l03tQOHfyl5cXnSua/lKZ6tmizdHX6/XmRs=
X-Received: by 2002:a63:5a08:: with SMTP id o8mr2065138pgb.118.1610412285888;
 Mon, 11 Jan 2021 16:44:45 -0800 (PST)
MIME-Version: 1.0
References: <20210111081821.3041587-1-morbo@google.com> <20210111201224.l5r2zxuyd7ayszke@google.com>
 <CAGG=3QWo5_wwTMHtif4BzFssByaW1ScvpaEH1p1nZ6ymVggLjA@mail.gmail.com>
 <20210111203120.daeef4yuwgmk5em4@google.com> <CAGG=3QVs8dUaqcnuHYiaqccMhp7OmkxewZ_PAhAr96todNJhfQ@mail.gmail.com>
In-Reply-To: <CAGG=3QVs8dUaqcnuHYiaqccMhp7OmkxewZ_PAhAr96todNJhfQ@mail.gmail.com>
From:   =?UTF-8?B?RsSBbmctcnXDrCBTw7JuZw==?= <maskray@google.com>
Date:   Mon, 11 Jan 2021 16:44:34 -0800
Message-ID: <CAFP8O3+knLmtt1M-wqdr0XGDFNbocz+1gmfTVUTtwDk5mS1FEA@mail.gmail.com>
Subject: Re: [PATCH] pgo: add clang's Profile Guided Optimization infrastructure
To:     Bill Wendling <morbo@google.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jan 11, 2021 at 4:38 PM Bill Wendling <morbo@google.com> wrote:
>
> On Mon, Jan 11, 2021 at 12:31 PM Fangrui Song <maskray@google.com> wrote:
> > On 2021-01-11, Bill Wendling wrote:
> > >On Mon, Jan 11, 2021 at 12:12 PM Fangrui Song <maskray@google.com> wrote:
> > >>
> > >> On 2021-01-11, 'Bill Wendling' via Clang Built Linux wrote:
> > >> >From: Sami Tolvanen <samitolvanen@google.com>
> > >> >
> > >> >Enable the use of clang's Profile-Guided Optimization[1]. To generate a
> > >> >profile, the kernel is instrumented with PGO counters, a representative
> > >> >workload is run, and the raw profile data is collected from
> > >> >/sys/kernel/debug/pgo/profraw.
> > >> >
> > >> >The raw profile data must be processed by clang's "llvm-profdata" tool before
> > >> >it can be used during recompilation:
> > >> >
> > >> >  $ cp /sys/kernel/debug/pgo/profraw vmlinux.profraw
> > >> >  $ llvm-profdata merge --output=vmlinux.profdata vmlinux.profraw
> > >> >
> > >> >Multiple raw profiles may be merged during this step.
> > >> >
> > >> >The data can be used either by the compiler if LTO isn't enabled:
> > >> >
> > >> >    ... -fprofile-use=vmlinux.profdata ...
> > >> >
> > >> >or by LLD if LTO is enabled:
> > >> >
> > >> >    ... -lto-cs-profile-file=vmlinux.profdata ...
> > >>
> > >> This LLD option does not exist.
> > >> LLD does have some `--lto-*` options but the `-lto-*` form is not supported
> > >> (it clashes with -l) https://reviews.llvm.org/D79371
> > >>
> > >That's strange. I've been using that option for years now. :-) Is this
> > >a recent change?
> >
> > The more frequently used options (specifyed by the clang driver) are
> > -plugin-opt=... (options implemented by LLVMgold.so).
> > `-lto-*` is rare.
> >
> > >> (There is an earlier -fprofile-instr-generate which does
> > >> instrumentation in Clang, but the option does not have broad usage.
> > >> It is used more for code coverage, not for optimization.
> > >> Noticeably, it does not even implement the Kirchhoff's current law
> > >> optimization)
> > >>
> > >Right. I've been told outside of this email that -fprofile-generate is
> > >the prefered flag to use.
> > >
> > >> -fprofile-use= is used by both regular PGO and context-sensitive PGO (CSPGO).
> > >>
> > >> clang -flto=thin -fprofile-use= passes -plugin-opt=cs-profile-path= to the linker.
> > >> For regular PGO, this option is effectively a no-op (confirmed with CSPGO main developer).
> > >>
> > >> So I think the "or by LLD if LTO is enabled:" part should be removed.
> > >
> > >But what if you specify the linking step explicitly? Linux doesn't
> > >call "clang" when linking, but "ld.lld".
> >
> > Regular PGO+LTO does not need -plugin-opt=cs-profile-path=
> > CSPGO+LTO needs it.
> > Because -fprofile-use= may be used by both, Clang driver adds it.
> > CSPGO is relevant in this this patch, so the linker option does not need to be mentioned.
>
> I'm still a bit confused. Are you saying that when clang uses
> `-flto=thin -fprofile-use=foo` that the profile file "foo" is embedded
> into the bitcode file so that when the linker's run it'll be used?
>
> This is the workflow:
>
> clang ... -fprofile-use=vmlinux.profdata ... -c -o foo.o foo.c
> clang ... -fprofile-use=vmlinux.profdata ... -c -o bar.o bar.c
> ld.lld ... <output file> foo.o bar.o
>
> Are you saying that we don't need to have
> "-plugin-opt=cs-profile-path=vmlinux.profdata" on the "ld.lld ..."
> line?
>
> -bw

The backend compile step -flto=thin -fprofile-use=foo has all the information.

-plugin-opt=cs-profile-path=vmlinux.profdata is not needed for regular PGO.
