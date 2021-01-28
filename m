Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C9D230804E
	for <lists+linux-doc@lfdr.de>; Thu, 28 Jan 2021 22:13:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229892AbhA1VND (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 28 Jan 2021 16:13:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229769AbhA1VNC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 28 Jan 2021 16:13:02 -0500
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE8BAC06174A
        for <linux-doc@vger.kernel.org>; Thu, 28 Jan 2021 13:12:19 -0800 (PST)
Received: by mail-pg1-x530.google.com with SMTP id z21so5136173pgj.4
        for <linux-doc@vger.kernel.org>; Thu, 28 Jan 2021 13:12:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ShMu7npMsBgX+goAZm1Y3mVWCkhJ62xJJYEjYPKDrdU=;
        b=LcVHEujp7i48aNZYHLcFJ8QklAC3AIgHSsbQlZrkZQ+64grgK+DQvw+eh+88Q+0gVY
         lzBTDitjgJpHE6HJkY3C7XlxVpKTCRP7IrJ1ZtZg0hePT/88PcBRvPgquw5iHZSgDD/q
         bMNJECwtroQg8p+/pvUnpejtWE9TZevO0uROVJmRnQzbylehseDOHUOoezA80Whgr7LB
         tW+0klbeJZXbYQ7tWJ6Oqiq6QMRO2ud9iuHgCaUvPi78saI2TLW679w/Z2Ny/793mScI
         X+8IqNVSBZSH2YfYDSGUjz1wN6OrQnHeuitKgtkqW9hkWBsAKimgWGMoeH1iwxl3MBKF
         kiMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ShMu7npMsBgX+goAZm1Y3mVWCkhJ62xJJYEjYPKDrdU=;
        b=DCHg/LwChwJM8OCLzwOXGmxy3w0bwEY2ypnNKk2gg/vl6LDdVJXHjK3X1K0Z9SOVQK
         k6DF6bzIoaHKmmlysou81iiD+NL7mn6KYkJOqtqrxYPD6P7xQfYl69U+KCdmbk4RZO1Y
         k8nbrGXBGpyt2RGQP5oXHwg3XoXqqgnDhPHfXD09Rz7hZSbomXWbHNlhyH5LpunN+CP4
         JL2k2HWx7a8WN6se24yzkeIne5j46vYFOsZD/q7PxGHZgPQG4fAWrpvHufIeLBYd+hpx
         ItDjD/2tmqCioLIFQIfFoSeUiS3CH2VM2Z6EYO/pvgfOo8I5/0YtlO1jejhZqf6dSUTY
         4c6A==
X-Gm-Message-State: AOAM530NWZhrrfYyz54Uc2TrOaWtb5IjWZHQdcZv6i0kW/LM+lhXJ2FU
        cwpxssnS/eo15XCyw0JnvnxWQSH+y0D5MnS8z6k2vw==
X-Google-Smtp-Source: ABdhPJy4F/jL89P8PDg7r1B//1iPwDshae+6M7+f9u/A1MaB8hTVLWMN2F68VhVNDdSNiZcrt9fTh2YS5DrBPh09H4Y=
X-Received: by 2002:a63:7e10:: with SMTP id z16mr1266474pgc.263.1611868338941;
 Thu, 28 Jan 2021 13:12:18 -0800 (PST)
MIME-Version: 1.0
References: <20210121082451.2240540-1-morbo@google.com> <20210122101156.3257143-1-morbo@google.com>
 <CAKwvOdm+3o8z2GivPjSJRa=c=UKdfkiY-79s6yn2BxJkFnoFTw@mail.gmail.com> <CA+icZUU=XfwqMcXYonQKcD4QgqTBW-mA+d_84b7cU2R3HYPOSQ@mail.gmail.com>
In-Reply-To: <CA+icZUU=XfwqMcXYonQKcD4QgqTBW-mA+d_84b7cU2R3HYPOSQ@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 28 Jan 2021 13:12:06 -0800
Message-ID: <CAKwvOdnUm2FqC0CEF3qFuMCaWoqiUMqr7ddMjA2UNsJugA9DNQ@mail.gmail.com>
Subject: Re: [PATCH v7] pgo: add clang's Profile Guided Optimization infrastructure
To:     Sedat Dilek <sedat.dilek@gmail.com>
Cc:     Bill Wendling <morbo@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jan 28, 2021 at 12:46 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> [ LLVM ]
>
> Today, I switched over to LLVM version 12.0.0-rc1.
>
>
> [ Step #1: 5.11.0-rc5-5-amd64-clang12-pgo ]
>
> My first kernel was built with CONFIG_PGO_CLANG=y and LLVM=1 plus LLVM_IAS=1.
>
> [ start-build_5.11.0-rc5-5-amd64-clang12-pgo.txt ]
> dileks    193090  193065  0 06:54 pts/2    00:00:00 /usr/bin/perf_5.10
> stat make V=1 -j4 HOSTCC=clang HOSTCXX=clang++ HOSTLD=ld.lld CC=clang
> LD=ld.lld LLVM=1 LLVM_IAS=1 PAHOLE=/opt/pahole/bin/pahole
> LOCALVERSION=-5-amd64-clang12-pgo KBUILD_VERBOSE=1
> KBUILD_BUILD_HOST=iniza KBUILD_BUILD_USER=sedat.dilek@gmail.com
> KBUILD_BUILD_TIMESTAMP=2021-01-28 bindeb-pkg
> KDEB_PKGVERSION=5.11.0~rc5-5~bullseye+dileks1
>
> Config: config-5.11.0-rc5-5-amd64-clang12-pgo
>
>
> [ Step #2: x86-64 defconfig & vmlinux.profdata ]
>
> Booted into 5.11.0-rc5-5-amd64-clang12-pgo and built an x86-64
> defconfig to generate/merge a vmlinux.profdata file.
>
> [ start-build_x86-64-defconfig.txt ]
> dileks     18430   15640  0 11:15 pts/2    00:00:00 make V=1 -j4
> HOSTCC=clang HOSTCXX=clang++ HOSTLD=ld.lld CC=clang LD=ld.lld LLVM=1
> LLVM_IAS=1
>
> Script: profile_clang-pgo.sh
> Config: dot-config.x86-64-defconfig
>
>
> [ Step #3.1: 5.11.0-rc5-6-amd64-clang12-pgo & GNU-AS ]
>
> The first rebuild with CONFIG_PGO_CLANG=n and "LLVM=1
> KCFLAGS=-fprofile-use=vmlinux.profdata".
> I was able to boot into this one.
> Used assembler: GNU-AS 2.35.1
>
> [ start-build_5.11.0-rc5-6-amd64-clang12-pgo.txt ]
> dileks     65734   65709  0 11:54 pts/2    00:00:00 /usr/bin/perf_5.10
> stat make V=1 -j4 HOSTCC=clang HOSTCXX=clang++ HOSTLD=ld.lld CC=clang
> LD=ld.lld PAHOLE=/opt/pahole/bin/pahole
> LOCALVERSION=-6-amd64-clang12-pgo KBUILD_VERBOSE=1
> KBUILD_BUILD_HOST=iniza KBUILD_BUILD_USER=sedat.dilek@gmail.com
> KBUILD_BUILD_TIMESTAMP=2021-01-28 bindeb-pkg
> KDEB_PKGVERSION=5.11.0~rc5-6~bullseye+dileks1 LLVM=1
> KCFLAGS=-fprofile-use=vmlinux.profdata
>
> Config: config-5.11.0-rc5-6-amd64-clang12-pgo
>
>
> [ Step #3.2: 5.11.0-rc5-7-amd64-clang12-pgo & Clang-IAS ]
>
> The second rebuild with CONFIG_PGO_CLANG=n and "LLVM=1
> KCFLAGS=-fprofile-use=vmlinux.profdata" plus LLVM_IAS=1.
> Compilable but NOT bootable in QEMU and on bare metal.
> Used assembler: Clang-IAS v12.0.0-rc1
>
> [ start-build_5.11.0-rc5-7-amd64-clang12-pgo.txt ]
> dileks      6545    6520  0 16:31 pts/2    00:00:00 /usr/bin/perf_5.10
> stat make V=1 -j4 HOSTCC=clang HOSTCXX=clang++ HOSTLD=ld.lld CC=clang
> LD=ld.lld PAHOLE=/opt/pahole/bin/pahole
> LOCALVERSION=-7-amd64-clang12-pgo KBUILD_VERBOSE=1
> KBUILD_BUILD_HOST=iniza KBUILD_BUILD_USER=sedat.dilek@gmail.com
> KBUILD_BUILD_TIMESTAMP=2021-01-28 bindeb-pkg
> KDEB_PKGVERSION=5.11.0~rc5-7~bullseye+dileks1 LLVM=1
> KCFLAGS=-fprofile-use=vmlinux.profdata LLVM_IAS=1
>
> Config: config-5.11.0-rc5-7-amd64-clang12-pgo
>
>
> [ Conclusion ]
>
> The only statement I can tell you is a "PGO optimized" rebuild with
> LLVM_IAS=1 is compilable but NOT bootable.

Thanks for the extensive testing and report. Can you compress, upload,
and post a link to your kernel image? I would like to take it for a
spin in QEMU and see if I can find what it's doing, then work
backwards from there.

-- 
Thanks,
~Nick Desaulniers
