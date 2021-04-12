Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E050D35C443
	for <lists+linux-doc@lfdr.de>; Mon, 12 Apr 2021 12:43:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239533AbhDLKnl (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 12 Apr 2021 06:43:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238334AbhDLKnk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 12 Apr 2021 06:43:40 -0400
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1DD8C06174A
        for <linux-doc@vger.kernel.org>; Mon, 12 Apr 2021 03:43:22 -0700 (PDT)
Received: by mail-ot1-x329.google.com with SMTP id i16-20020a9d68d00000b0290286edfdfe9eso1723454oto.3
        for <linux-doc@vger.kernel.org>; Mon, 12 Apr 2021 03:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3AZsdL8BfabydD2z1Twp1UQ1k08lBxkT8Hc0KzFCdr0=;
        b=vOkHMvJJPaTur8H2lzlJi72gN4t1tzLS5yeur+DgK05GqMBGztx+c32SBlK+Rk3PkY
         Mruo096+7nm4BPF9gK2MEMkn2zPsGGBff3D6oYb8XKjR3Uqu56Fodz+1bENCHe/bVTu7
         gLwfKyi8WIujCvNRjmhN59qAPqNCOgaqNTmZRPWQMVdgcFbY9NC+CfugrCtdwBGFMfcQ
         vxbFBfZtxrjSPWpwf1Aj3dpW81kpGGj+Npql8c6TqlAmxiPPAwDCgj640ihot1DuBagl
         zrJWEJhLegGW3aJsfCHvj45TIzL2bqBqxTswgCiS4OqEWDuPvxkuTOkfakOodsTIaabs
         UXkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3AZsdL8BfabydD2z1Twp1UQ1k08lBxkT8Hc0KzFCdr0=;
        b=eMAbyAmIX/6HjeAypztqslU2h/vBWJpuRoCMl64P14cgevg3gUkZPWh4GXhIexuveR
         6XX4Q0U/nMp/vXmr9NGszhq6a9VqqaEwYOvTwHVqvicbmAGaIRJ7Xt1uIrZgBuZwYyg8
         nkgWLOzPxZYoTiEoj8L2KCx2VNdzyq1ed5IwJuDSy0kdu27iP7mUnbkI08LeaDYMhBdN
         NonhYteZ6dXrggCV8SMMw2jHo498/xtboRS+H66BGiNH7+3OUpQScsrjvZJphNxGuApa
         10fOolnimplAp2AUi+xBDrpfRy5wzTINFfkcqDhAcj+FVoRhD/t2fzYc5PQAdBbrjrAP
         yY3A==
X-Gm-Message-State: AOAM531D8inTg6T82s36u5mSqEewzSI6vgqxMTc5LuxOFr2BKlYRF/G6
        9lQYUOrM2yPK73bDbfF+2Cb8XeU70WiLiTz9UX8vtg==
X-Google-Smtp-Source: ABdhPJzB2TfLt7JDp0+LzESd9HFWl1wjG+tDW4wQm0b3kaPueKVCp90GmQjILyEIeDxwsPlCH7glGugGWvOYhVCRU3Q=
X-Received: by 2002:a05:6830:148c:: with SMTP id s12mr24133633otq.251.1618224201740;
 Mon, 12 Apr 2021 03:43:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210410070529.4113432-1-davidgow@google.com> <CAGS_qxo=BCVfePBcN8NWSAb=htf4pdybcvQuGf2aaWMvfiQMsA@mail.gmail.com>
In-Reply-To: <CAGS_qxo=BCVfePBcN8NWSAb=htf4pdybcvQuGf2aaWMvfiQMsA@mail.gmail.com>
From:   Marco Elver <elver@google.com>
Date:   Mon, 12 Apr 2021 12:43:09 +0200
Message-ID: <CANpmjNN0sZ1ZrvidqbYaabre_uL14dR0es0Y9Aogq3qyJ9aO2Q@mail.gmail.com>
Subject: Re: [PATCH] Documentation: dev-tools: Add Testing Overview
To:     Daniel Latypov <dlatypov@google.com>
Cc:     David Gow <davidgow@google.com>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Brendan Higgins <brendanhiggins@google.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        KUnit Development <kunit-dev@googlegroups.com>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, 10 Apr 2021 at 13:53, Daniel Latypov <dlatypov@google.com> wrote:
> On Sat, Apr 10, 2021 at 12:05 AM David Gow <davidgow@google.com> wrote:
[...]
> > +
> > +
> > +Sanitizers
> > +==========
> > +

The "sanitizers" have originally been a group of tools that relied on
compiler instrumentation to perform various dynamic analysis
(initially ASan, TSan, MSan for user space). The term "sanitizer" has
since been broadened to include a few non-compiler based tools such as
GWP-ASan in user space, of which KFENCE is its kernel cousin but it
doesn't have "sanitizer" in its name (because we felt GWP-KASAN was
pushing it with the acronyms ;-)). Also, these days we have HW_TAGS
based KASAN, which doesn't rely on compiler instrumentation but
instead on MTE in Arm64.

Things like kmemleak have never really been called a sanitizer, but
they _are_ dynamic analysis tools.

So to avoid confusion, in particular avoid establishing "sanitizers"
to be synonymous with "dynamic analysis" ("all sanitizers are dynamic
analysis tools, but not all dynamic analysis tools are sanitizers"),
the section here should not be called "Sanitizers" but "Dynamic
Analysis Tools". We could have a subsection "Sanitizers", but I think
it's not necessary.

> > +The kernel also supports a number of sanitizers, which attempt to detect
> > +classes of issues when the occur in a running kernel. These typically
>
> *they occur
>
> > +look for undefined behaviour of some kind, such as invalid memory accesses,
> > +concurrency issues such as data races, or other undefined behaviour like
> > +integer overflows.
> > +
> > +* :doc:`kmemleak` (Kmemleak) detects possible memory leaks.
> > +* :doc:`kasan` detects invalid memory accesses such as out-of-bounds and
> > +  use-after-free errors.
> > +* :doc:`ubsan` detects behaviour that is undefined by the C standard, like
> > +  integer overflows.
> > +* :doc:`kcsan` detects data races.
> > +* :doc:`kfence` is a low-overhead detector of memory issues, which is much
> > +  faster than KASAN and can be used in production.
>
> Hmm, it lives elsewhere, but would also calling out lockdep here be useful?
> I've also not heard anyone call it a sanitizer before, but it fits the
> definition you've given.
>
> Now that I think about it, I've never looked for documentation on it,
> is this the best page?
> https://www.kernel.org/doc/html/latest/locking/lockdep-design.html

Not a "sanitizer" but our sanitizers are all dynamic analysis tools,
and lockdep is also a dynamic analysis tool.

If we want to be pedantic, the kernel has numerous options to add
"instrumentation" (compiler based or explicit) that will detect some
kind of error at runtime. Most of them live in lib/Kconfig.debug. I
think mentioning something like that is in scope of this document, but
we certainly can't mention all debug tools the kernel has to offer.
Mentioning the big ones like above and then referring to
lib/Kconfig.debug is probably fine.

Dmitry recently gave an excellent talk on some of this:
https://www.youtube.com/watch?v=ufcyOkgFZ2Q

Thanks,
-- Marco
