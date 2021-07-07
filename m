Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C6B63BF0C2
	for <lists+linux-doc@lfdr.de>; Wed,  7 Jul 2021 22:31:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231755AbhGGUeY (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 7 Jul 2021 16:34:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231210AbhGGUeV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 7 Jul 2021 16:34:21 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81E72C06175F
        for <linux-doc@vger.kernel.org>; Wed,  7 Jul 2021 13:31:40 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id p1so7489258lfr.12
        for <linux-doc@vger.kernel.org>; Wed, 07 Jul 2021 13:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WK/UppGz71jkba2Ll+L/TuQuuPyl95ERCqbRa/Kjsng=;
        b=FSqoFPJdoDp0fQFVFmgACdu+RsTBYS6NEnKKjiyts1bU2UXWQczZw6EcT+rtRpRZC9
         /MrzUA7pCtAzqijIcSp1iBVFa0LsV1MryY0RUBPgg74FFM1PhinqG7lJ17YlbxIMxott
         XUqEZnTK3/EoGhPaPyCmuWHOC+UH3RkXbDwBa6AEw15C4LMzm8LDcK4ez0XWMdhKZHsb
         PpPd05Kyh6/UXVjhj/3jkQHTA5pxu2zjORv7VKHQ503Uxo+gOiKADo2lY4ObP/SoHPPa
         V98c7llgs4ePbWcMdO4yPJPF8tqfHlO20oo6ifhqNbh2KoJyNKW90Dn5oQ6N6r9fmUid
         NF+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WK/UppGz71jkba2Ll+L/TuQuuPyl95ERCqbRa/Kjsng=;
        b=DbNIzpJ9DJ/HeGFBu9z/lROkypOXE5QLpRMqRNMkc3MZnT1VfIREwdHa4+FPzwmq6u
         4qyqrTRkpMZHgyF48jKRPviEjlTMXTdVx3yOtLY1r/Alpq7JgErz05ypos3aJb70BqRX
         HZ3RVjs/pOjN7GSKFyIVmNv8sgaV7c+v1PfOIh5eiGbLbU23oxbGIiZcx22Cg1BTy7I7
         wg5VEGNe9j3ps9M0bPtTSW53xNRO2g7SFkbQzU42hnc+jZS9FfLh0zDWFKfL+eoRrgVZ
         KQsHKgJVQEZcsUpmtRQ+9cmFL6QxAmyyUIydb1suhjitDyHsqPepPpTKtn7s+BwNVX/f
         nqDg==
X-Gm-Message-State: AOAM5328DDhwKEhud5hWCrA157d1F5GImhBFnI0oNnrnp9R4CWuvl+o1
        YTDUhqeGwkZtk6kBxYzrmdD2EhoCesuuTwvazYAv9w==
X-Google-Smtp-Source: ABdhPJx/JTBDMrZxnW4BiPJjE/ztABpvFp2gHqhIACrYNIc20OQaJES1GsGTaYegI7OzbVCkRjN1rvOz+8mShnoBZiQ=
X-Received: by 2002:a2e:8708:: with SMTP id m8mr20831340lji.244.1625689898523;
 Wed, 07 Jul 2021 13:31:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210704202756.29107-1-ojeda@kernel.org> <20210704202756.29107-5-ojeda@kernel.org>
In-Reply-To: <20210704202756.29107-5-ojeda@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 7 Jul 2021 13:31:18 -0700
Message-ID: <CAKwvOdkWCgUb+G+iQ7pcvrVvrOfOaFYc6YvO1a9AKSd-oU_Kvg@mail.gmail.com>
Subject: Re: [PATCH 04/17] vsprintf: add new `%pA` format specifier
To:     ojeda@kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Finn Behrens <me@kloenk.de>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        Sumera Priyadarsini <sylphrenadin@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Sven Van Asbroeck <thesven73@gmail.com>,
        Gary Guo <gary@garyguo.net>,
        Boris-Chengbiao Zhou <bobo1239@web.de>,
        Fox Chen <foxhlchen@gmail.com>,
        Ayaan Zaidi <zaidi.ayaan@gmail.com>,
        Douglas Su <d0u9.su@outlook.com>, Yuki Okushi <jtitor@2k36.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Jul 4, 2021 at 1:29 PM <ojeda@kernel.org> wrote:
>
> From: Miguel Ojeda <ojeda@kernel.org>
>
> This patch adds a format specifier `%pA` to `vsprintf` which formats
> a pointer as `core::fmt::Arguments`. Doing so allows us to directly
> format to the internal buffer of `printf`, so we do not have to use
> a temporary buffer on the stack to pre-assemble the message on
> the Rust side.
>
> This specifier is intended only to be used from Rust and not for C, so
> `checkpatch.pl` is intentionally unchanged to catch any misuse.
>
> Co-developed-by: Alex Gaynor <alex.gaynor@gmail.com>
> Signed-off-by: Alex Gaynor <alex.gaynor@gmail.com>
> Co-developed-by: Geoffrey Thomas <geofft@ldpreload.com>
> Signed-off-by: Geoffrey Thomas <geofft@ldpreload.com>
> Co-developed-by: Finn Behrens <me@kloenk.de>
> Signed-off-by: Finn Behrens <me@kloenk.de>
> Co-developed-by: Adam Bratschi-Kaye <ark.email@gmail.com>
> Signed-off-by: Adam Bratschi-Kaye <ark.email@gmail.com>
> Co-developed-by: Wedson Almeida Filho <wedsonaf@google.com>
> Signed-off-by: Wedson Almeida Filho <wedsonaf@google.com>
> Co-developed-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> Co-developed-by: Sumera Priyadarsini <sylphrenadin@gmail.com>
> Signed-off-by: Sumera Priyadarsini <sylphrenadin@gmail.com>
> Co-developed-by: Michael Ellerman <mpe@ellerman.id.au>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> Co-developed-by: Sven Van Asbroeck <thesven73@gmail.com>
> Signed-off-by: Sven Van Asbroeck <thesven73@gmail.com>
> Co-developed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Gary Guo <gary@garyguo.net>
> Co-developed-by: Boris-Chengbiao Zhou <bobo1239@web.de>
> Signed-off-by: Boris-Chengbiao Zhou <bobo1239@web.de>
> Co-developed-by: Fox Chen <foxhlchen@gmail.com>
> Signed-off-by: Fox Chen <foxhlchen@gmail.com>
> Co-developed-by: Ayaan Zaidi <zaidi.ayaan@gmail.com>
> Signed-off-by: Ayaan Zaidi <zaidi.ayaan@gmail.com>
> Co-developed-by: Douglas Su <d0u9.su@outlook.com>
> Signed-off-by: Douglas Su <d0u9.su@outlook.com>
> Co-developed-by: Yuki Okushi <jtitor@2k36.org>
> Signed-off-by: Yuki Okushi <jtitor@2k36.org>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>  lib/vsprintf.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/lib/vsprintf.c b/lib/vsprintf.c
> index f0c35d9b65b..e7afe954004 100644
> --- a/lib/vsprintf.c
> +++ b/lib/vsprintf.c
> @@ -2182,6 +2182,10 @@ char *fwnode_string(char *buf, char *end, struct fwnode_handle *fwnode,
>         return widen_string(buf, buf - buf_start, end, spec);
>  }
>
> +#ifdef CONFIG_RUST
> +char *rust_fmt_argument(char* buf, char* end, void *ptr);

Which patch in the series adds the definition of rust_fmt_argument?
Sorry, I haven't looked through the entire series yet, but I don't
think it was an earlier patch in the series.  If it's later in the
series, you may want to rebase this to be after (or combine it with
the patch that provides the definition).  For instance, let's say the
first half of this series was accepted/merged, but not the latter
half. It would be weird to provide such definitions/calls to undefined
symbols.

> +#endif
> +
>  /* Disable pointer hashing if requested */
>  bool no_hash_pointers __ro_after_init;
>  EXPORT_SYMBOL_GPL(no_hash_pointers);
> @@ -2335,6 +2339,10 @@ early_param("no_hash_pointers", no_hash_pointers_enable);
>   *
>   * Note: The default behaviour (unadorned %p) is to hash the address,
>   * rendering it useful as a unique identifier.
> + *
> + * There is also a '%pA' format specifier, but it is only intended to be used
> + * from Rust code to format core::fmt::Arguments. Do *not* use it from C.
> + * See rust/kernel/print.rs for details.
>   */
>  static noinline_for_stack
>  char *pointer(const char *fmt, char *buf, char *end, void *ptr,
> @@ -2407,6 +2415,10 @@ char *pointer(const char *fmt, char *buf, char *end, void *ptr,
>                 return device_node_string(buf, end, ptr, spec, fmt + 1);
>         case 'f':
>                 return fwnode_string(buf, end, ptr, spec, fmt + 1);
> +#ifdef CONFIG_RUST
> +       case 'A':
> +               return rust_fmt_argument(buf, end, ptr);
> +#endif
>         case 'x':
>                 return pointer_string(buf, end, ptr, spec);
>         case 'e':
> --
> 2.32.0
>


--
Thanks,
~Nick Desaulniers
