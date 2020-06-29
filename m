Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72C3F20D7F8
	for <lists+linux-doc@lfdr.de>; Mon, 29 Jun 2020 22:08:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730497AbgF2Tea (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 29 Jun 2020 15:34:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732781AbgF2Tcm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 29 Jun 2020 15:32:42 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8833AC02A56F
        for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2020 06:37:07 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id d4so8311382pgk.4
        for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2020 06:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5YTtTdEX8FTCzpnfrCubKRqJx+y/VqQUc/flbZtjjCI=;
        b=e/q+PfD5kE1/yVtUCvQwghyRh/D/e9PW9NdzULRnOh/6jWh+tujy7lrmf8mr6phUqc
         LZOH/WSbi2F3ingzlUgYYQbq81L9ZcHSDuN6KTOdUiHOPKwTUyHfEB2jaTKURhQjp+hJ
         XEquntYXXEjYTUErMrU7XGhRAUSx+TuHz/IixciEJCjX0EekzH49oo2n4vjDUJKjBcsD
         qKfUvWFn1iIA99Uh2r6cic15REOBKoLuEdjUH3XlqMLoJ2OFYG/Dk+r8bRvE/BucnMwf
         6s//Q09NcvHtXI6XHTeHCRUGpTIm7ZzsBHN9d8YmIx4Tdp5tcu6/vocQJfNehaFjTtKG
         eeIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5YTtTdEX8FTCzpnfrCubKRqJx+y/VqQUc/flbZtjjCI=;
        b=CioB/zuCSsYwb9DhqJg11r12pMjr3BUJVyr+8cTTAFIqhAXXzHamBp/Gv36+0rLPeQ
         0knRKUYpCu+6ZwoY3/UCm5I0tmgc0lnhqrxHNy3qUQW1t0jq9Huq8gYq/tXV0V6x3Ic1
         qD3op4AE905LzWPUFXhuphbD1tWJy0J2ISL4cUuKcKPeH4o3W/JZE+I9mgGF+OHhlcfH
         xCizaWai4q9pLAfRkYwlBAJu8vbwZ/mnX6Y7Lb9264/XLoj+kU1CjUvxXwggSYliM0yK
         WdQK3B2hD7SH+mHKL27Ihe+aCJh4MGua7Zcwiv2hlhh7Ga5EkzXgMG9Z+YJDBbSp19DB
         JIRg==
X-Gm-Message-State: AOAM531LHkt+uw91x02CzWSzKnhsRt6z/Po0F+cX5/5+Kpezl2tgF0e+
        RBNIDqzKZYTE5vRN7iZ3MOhTRmZW78vm+NInvWJNtA==
X-Google-Smtp-Source: ABdhPJycqBRPrNS3fS1vuT7eHk+0vIheYFriuEKiCjpMIU+1btpgbGFFY2PzC0Rq8+OEr2b87r/3K1zIuGHkpOLuFDg=
X-Received: by 2002:a65:64d8:: with SMTP id t24mr10733075pgv.286.1593437826864;
 Mon, 29 Jun 2020 06:37:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200629104157.3242503-1-elver@google.com> <20200629104157.3242503-2-elver@google.com>
In-Reply-To: <20200629104157.3242503-2-elver@google.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Mon, 29 Jun 2020 15:36:55 +0200
Message-ID: <CAAeHK+y=1oocjAMfYd5m2_Zb9Y8M5r0X3K6YYyKvjs+zSAC8tg@mail.gmail.com>
Subject: Re: [PATCH 2/2] kasan: Update required compiler versions in documentation
To:     Marco Elver <elver@google.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Alexander Potapenko <glider@google.com>,
        LKML <linux-kernel@vger.kernel.org>,
        kasan-dev <kasan-dev@googlegroups.com>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Walter Wu <walter-zh.wu@mediatek.com>,
        Arnd Bergmann <arnd@arndb.de>, Daniel Axtens <dja@axtens.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jun 29, 2020 at 12:42 PM Marco Elver <elver@google.com> wrote:
>
> Updates the recently changed compiler requirements for KASAN. In
> particular, we require GCC >= 8.3.0, and add a note that Clang 11
> supports OOB detection of globals.
>
> Fixes: 7b861a53e46b ("kasan: Bump required compiler version")
> Fixes: acf7b0bf7dcf ("kasan: Fix required compiler version")
> Signed-off-by: Marco Elver <elver@google.com>
> ---
>  Documentation/dev-tools/kasan.rst |  7 ++-----
>  lib/Kconfig.kasan                 | 24 +++++++++++++++---------
>  2 files changed, 17 insertions(+), 14 deletions(-)
>
> diff --git a/Documentation/dev-tools/kasan.rst b/Documentation/dev-tools/kasan.rst
> index c652d740735d..15a2a53e77b0 100644
> --- a/Documentation/dev-tools/kasan.rst
> +++ b/Documentation/dev-tools/kasan.rst
> @@ -13,11 +13,8 @@ KASAN uses compile-time instrumentation to insert validity checks before every
>  memory access, and therefore requires a compiler version that supports that.
>
>  Generic KASAN is supported in both GCC and Clang. With GCC it requires version
> -4.9.2 or later for basic support and version 5.0 or later for detection of
> -out-of-bounds accesses for stack and global variables and for inline
> -instrumentation mode (see the Usage section). With Clang it requires version
> -7.0.0 or later and it doesn't support detection of out-of-bounds accesses for
> -global variables yet.
> +8.3.0 or later. With Clang it requires version 7.0.0 or later, but detection of
> +out-of-bounds accesses for global variables is only supported since Clang 11.
>
>  Tag-based KASAN is only supported in Clang and requires version 7.0.0 or later.
>
> diff --git a/lib/Kconfig.kasan b/lib/Kconfig.kasan
> index 89053defc0d9..047b53dbfd58 100644
> --- a/lib/Kconfig.kasan
> +++ b/lib/Kconfig.kasan
> @@ -40,6 +40,7 @@ choice
>           software tag-based KASAN (a version based on software memory
>           tagging, arm64 only, similar to userspace HWASan, enabled with
>           CONFIG_KASAN_SW_TAGS).
> +
>           Both generic and tag-based KASAN are strictly debugging features.
>
>  config KASAN_GENERIC
> @@ -51,16 +52,18 @@ config KASAN_GENERIC
>         select STACKDEPOT
>         help
>           Enables generic KASAN mode.
> -         Supported in both GCC and Clang. With GCC it requires version 4.9.2
> -         or later for basic support and version 5.0 or later for detection of
> -         out-of-bounds accesses for stack and global variables and for inline
> -         instrumentation mode (CONFIG_KASAN_INLINE). With Clang it requires
> -         version 3.7.0 or later and it doesn't support detection of
> -         out-of-bounds accesses for global variables yet.
> +
> +         This mode is supported in both GCC and Clang. With GCC it requires
> +         version 8.3.0 or later. With Clang it requires version 7.0.0 or
> +         later, but detection of out-of-bounds accesses for global variables
> +         is supported only since Clang 11.
> +
>           This mode consumes about 1/8th of available memory at kernel start
>           and introduces an overhead of ~x1.5 for the rest of the allocations.
>           The performance slowdown is ~x3.
> +
>           For better error detection enable CONFIG_STACKTRACE.
> +
>           Currently CONFIG_KASAN_GENERIC doesn't work with CONFIG_DEBUG_SLAB
>           (the resulting kernel does not boot).
>
> @@ -73,15 +76,19 @@ config KASAN_SW_TAGS
>         select STACKDEPOT
>         help
>           Enables software tag-based KASAN mode.
> +
>           This mode requires Top Byte Ignore support by the CPU and therefore
> -         is only supported for arm64.
> -         This mode requires Clang version 7.0.0 or later.
> +         is only supported for arm64. This mode requires Clang version 7.0.0
> +         or later.
> +
>           This mode consumes about 1/16th of available memory at kernel start
>           and introduces an overhead of ~20% for the rest of the allocations.
>           This mode may potentially introduce problems relating to pointer
>           casting and comparison, as it embeds tags into the top byte of each
>           pointer.
> +
>           For better error detection enable CONFIG_STACKTRACE.
> +
>           Currently CONFIG_KASAN_SW_TAGS doesn't work with CONFIG_DEBUG_SLAB
>           (the resulting kernel does not boot).
>
> @@ -107,7 +114,6 @@ config KASAN_INLINE
>           memory accesses. This is faster than outline (in some workloads
>           it gives about x2 boost over outline instrumentation), but
>           make kernel's .text size much bigger.
> -         For CONFIG_KASAN_GENERIC this requires GCC 5.0 or later.
>
>  endchoice
>
> --
> 2.27.0.212.ge8ba1cc988-goog
>

Reviewed-by: Andrey Konovalov <andreyknvl@google.com>

Thanks!
