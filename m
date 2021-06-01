Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89EEF397922
	for <lists+linux-doc@lfdr.de>; Tue,  1 Jun 2021 19:31:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234635AbhFARdR (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 1 Jun 2021 13:33:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234581AbhFARdQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 1 Jun 2021 13:33:16 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 776E2C06174A
        for <linux-doc@vger.kernel.org>; Tue,  1 Jun 2021 10:31:33 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id i9so23008897lfe.13
        for <linux-doc@vger.kernel.org>; Tue, 01 Jun 2021 10:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4zgCVIyculkg6vmD5i7vJioJPtV1qABy2b5RHzq/zCI=;
        b=dG+qpI2+UVX+VMugxWfFZSjxR9/GlPHwfvtXi089sqeZUZ/c4PmYDvE3VUrC3dTgOF
         qc9dscgpLYFRM/Eigba4uN60Ah8fz4eM5qAl7vKGIYbE/nYGmw5kTFUB3oJQK4MtL7qi
         HnZS94DKyfydH9731IFcKVFQ5bF7jyaVvx0oD9U4gSSn58L2N1asTPczJEy10yhZ99OH
         m/4QznKbwZqpSxYEcAy3hce8uRf4zMF//wP53oix/JTW6n0mJ9WpezqmrOuFr62EFSWb
         sxXwwnholjiD4ZHr8OjyKWHnYZVjp5yBSwD1nlsJHy1fFs8RJl4ll5IYqfiqA8pgiFXv
         1ZFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4zgCVIyculkg6vmD5i7vJioJPtV1qABy2b5RHzq/zCI=;
        b=SiD95EzYve6P63PpF5gyFq7BI352jknQ5xGpFzaPPijcYzvk2Sm3V7PkUOQowoGbqc
         OgaM6Fdfq1iUnj19jSN+fCa7VwYzJjf8bWoBvpz+ImK1DqhnkPmeh8JZ84x+EiexZ0MD
         M9bf/toZiGoguJAUyVRxyYduvpxKiUDb1/i2NeirAQ402+icicishCzN7k0R8zWpyIYP
         p95L/+OHH+g7L3KbPE8WaZKB5MibLuYR3hvuO22L/Ei0AOKAZx8ni6JHzmcJqHhaB/bM
         Y8RlHdatcChexBWP8Hy8I3HZbHh8CAjeGDPemB+OkP30rginAUohFTld8YtGgIb2u9K9
         JaBg==
X-Gm-Message-State: AOAM5310Nu2u0KdB9vjCzdpiL2dwXBEC7NgKZmMjKrhHrYjh7WK2DEBT
        GdpjijeKkFFX89Y9bjOZWqyXqs6axFfF8CpQPyFK8g==
X-Google-Smtp-Source: ABdhPJyF2YA6EH9y6xWofqIGiZg4NIoD3l/KcdTsiGWhtFQIRDdf8HPduC/i9+0EqbFdErTBaNfr55StqCL3Lkqencc=
X-Received: by 2002:a19:f706:: with SMTP id z6mr5376947lfe.122.1622568691591;
 Tue, 01 Jun 2021 10:31:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210111081821.3041587-1-morbo@google.com> <20210407211704.367039-1-morbo@google.com>
 <202105191422.2E6748C4E0@keescook> <YLVRTilQ5k5n+Vmz@archlinux-ax161>
In-Reply-To: <YLVRTilQ5k5n+Vmz@archlinux-ax161>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 1 Jun 2021 10:31:20 -0700
Message-ID: <CAKwvOdkbCmfraMwf684J2m4Q929UO+7ZOW9xP41pwjUR_Y5G2w@mail.gmail.com>
Subject: Re: [PATCH v9] pgo: add clang's Profile Guided Optimization infrastructure
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Kees Cook <keescook@chromium.org>,
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
        Fangrui Song <maskray@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, May 31, 2021 at 2:12 PM Nathan Chancellor <nathan@kernel.org> wrote:
> Would this be appropriate to send?
>
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c45613c30803..0d03f6ccdb70 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14378,9 +14378,13 @@ F:     include/uapi/linux/personality.h
>  PGO BASED KERNEL PROFILING
>  M:     Sami Tolvanen <samitolvanen@google.com>
>  M:     Bill Wendling <wcw@google.com>
> +M:     Kees Cook <keescook@chromium.org>
>  R:     Nathan Chancellor <nathan@kernel.org>
>  R:     Nick Desaulniers <ndesaulniers@google.com>
> +L:     clang-built-linux@googlegroups.com
>  S:     Supported
> +B:     https://github.com/ClangBuiltLinux/linux/issues
> +T:     git git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/clang/pgo
>  F:     Documentation/dev-tools/pgo.rst
>  F:     kernel/pgo/
>

I think so.
Acked-by: Nick Desaulniers <ndesaulniers@google.com>
-- 
Thanks,
~Nick Desaulniers
