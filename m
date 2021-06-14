Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10A4C3A6B33
	for <lists+linux-doc@lfdr.de>; Mon, 14 Jun 2021 18:03:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234071AbhFNQFS (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 14 Jun 2021 12:05:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233583AbhFNQFR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 14 Jun 2021 12:05:17 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B4DFC061767
        for <linux-doc@vger.kernel.org>; Mon, 14 Jun 2021 09:03:14 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id f30so21993156lfj.1
        for <linux-doc@vger.kernel.org>; Mon, 14 Jun 2021 09:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3MqGDvp9ypUCvhlLUOO4ezsTJgglqtbS6x/EUZzU8+Q=;
        b=Fy7Y+DeoKvsZICPPwA01TqMBiH2RFRKDNCaiYWD2UTBYSxZ4pdeg1d/ChfVV734TmQ
         DT17igrzvRDC6rSUoqpPatzrJNeyqYGImyCufJH3ofLDeNrnxly9mav9aZJLyg1UVkoB
         1qO7A8Pp7Sw0Yt1+gn+KVxTl9wtq5gPrdjAgo7p8Dw6cP35cf73qe5IC2SZlU4EN6JST
         e57ab6dbcs/ksdm+WbwRkuTpfFsQSuzRLgI1XcClxOzoNJYFUWWYmvcoi9U0nWAQ/FND
         HDaz4KI7R9lqXlsABdzH8orcCS5kRcK7Gl62H7bYrC+WblskggwIu+lBaRzzUoj/M9As
         nNVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3MqGDvp9ypUCvhlLUOO4ezsTJgglqtbS6x/EUZzU8+Q=;
        b=FddlVVpSTJE9kQWaminH9FYccDvlLCESoUyCEWDiCIv9I8xh7W1Knh3DzSLm8h0DC9
         5BTvVNXUvIE8pkGW7trgRlQHlHhWNyqJGPLdflPoGDMpwz4/xDhSANVM2NpOYU5zsMPf
         MLAATZPhvItSJ75oNizXqrx2fT+sMVClbHr3nBaMohZCwxhg7Y8D4WKA7afa4uUntDK5
         A1F9NpOTULa29c+V+mLuUeWqkR1wxg/DuOYRv7o4mmIXHKaRYgMAKGEbtjpZfY2Ips/h
         SRnkAyzFRD4h9FwtMcQZeSW/KyoED4+48G2D0HdyoANwRcyZ+RfRG8REOJcl+Ej2tfhT
         qBvA==
X-Gm-Message-State: AOAM532XEQxsW04NPVC27kcjKOfYbkNrTK7CMvO3DSddf4AwWE1ynLqJ
        Y1enVEgCuB5GP9PwYbNiN0YyyYAPuZZDZC3eDAg14g==
X-Google-Smtp-Source: ABdhPJy9T1fv6ss2YqKm05JzBWeSmxI3e8pir4dr37jITMTf4Csn9UJP+HwVMcgnlLH3mP9Ymy3BeWib7d8pn9zu3KY=
X-Received: by 2002:ac2:5cd6:: with SMTP id f22mr13208808lfq.73.1623686592188;
 Mon, 14 Jun 2021 09:03:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAGG=3QXjD1DQjACu=CQQSP=whue-14Pw8FcNcXrJZfLC_E+y9w@mail.gmail.com>
 <YMT5xZsZMX0PpDKQ@hirez.programming.kicks-ass.net> <CAGG=3QVHkkJ236mCJ8Jt_6JtgYtWHV9b4aVXnoj6ypc7GOnc0A@mail.gmail.com>
 <20210612202505.GG68208@worktop.programming.kicks-ass.net>
 <CAGG=3QUZ9tXGNLhbOr+AFDTJABDujZuaG1mYaLKdTcJZguEDWw@mail.gmail.com>
 <YMca2aa+t+3VrpN9@hirez.programming.kicks-ass.net> <CAGG=3QVPCuAx9UMTOzQp+8MJk8KVyOfaYeV0yehpVwbCaYMVpg@mail.gmail.com>
 <YMczJGPsxSWNgJMG@hirez.programming.kicks-ass.net> <CANpmjNNnZv7DHYaJBL7knn9P+50F+SOCvis==Utaf-avENnVsw@mail.gmail.com>
 <202106140817.F584D2F@keescook> <20210614154639.GB68749@worktop.programming.kicks-ass.net>
In-Reply-To: <20210614154639.GB68749@worktop.programming.kicks-ass.net>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 14 Jun 2021 09:03:00 -0700
Message-ID: <CAKwvOd=aAo72j-iE2PNE5Os8BPc0y-Zs7ZoMzd21ck+QNeboBA@mail.gmail.com>
Subject: Re: [PATCH v9] pgo: add clang's Profile Guided Optimization infrastructure
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Kees Cook <keescook@chromium.org>, Marco Elver <elver@google.com>,
        Bill Wendling <morbo@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Fangrui Song <maskray@google.com>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        Andrey Konovalov <andreyknvl@gmail.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Johannes Berg <johannes.berg@intel.com>,
        oberpar@linux.vnet.ibm.com, linux-toolchains@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jun 14, 2021 at 8:46 AM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Mon, Jun 14, 2021 at 08:26:01AM -0700, Kees Cook wrote:
> > > 2. Like (1) but also keep GCOV, given proper support for attribute
> > > no_instrument_function would probably fix it (?).
> > >
> > > 3. Keep GCOV (and KCOV of course). Somehow extract PGO profiles from KCOV.
> > >
> > > 4. Somehow extract PGO profiles from GCOV, or modify kernel/gcov to do so.
> >
> > If there *is* a way to "combine" these, I don't think it makes sense
> > to do it now. PGO has users (and is expanding[1]), and trying to
> > optimize the design before even landing the first version seems like a
> > needless obstruction, and to likely not address currently undiscovered
> > requirements.
>
> Even if that were so (and I'm not yet convinced), the current proposal
> is wedded to llvm-pgo, there is no way gcc-pgo could reuse any of this
> code afaict, which then means they have to create yet another variant.

Similar to GCOV, the runtime support for exporting such data is
heavily compiler (and compiler version) specific, as is the data
format for compilers to consume.  We were able to reuse most of the
runtime code between GCC and Clang support in GCOV; I don't see why we
couldn't do a similar factoring of the runtime code being added to the
kernel here, should anyone care to pursue implementing PGO with GCC.
Having an implementation is a great starting point for folks looking
to extend support or to understand how to support PGO in such a bare
metal environment (one that doesn't dynamically link against
traditional compiler runtimes).
-- 
Thanks,
~Nick Desaulniers
