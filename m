Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 319CA1A1581
	for <lists+linux-doc@lfdr.de>; Tue,  7 Apr 2020 21:03:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727077AbgDGTDl (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 7 Apr 2020 15:03:41 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:45171 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726794AbgDGTDl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 7 Apr 2020 15:03:41 -0400
Received: by mail-pg1-f196.google.com with SMTP id o26so2148794pgc.12
        for <linux-doc@vger.kernel.org>; Tue, 07 Apr 2020 12:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+9ktnBB45aXlgSe0vRhpOUgxZAxDNe5YDUe3z1UsWXQ=;
        b=Iu7XU9Q1UurBhDGdXS/vYjiFh68jWNQ8e06hHF28IR+07VW9uNQPZ2Orsrw+Pgq9BO
         doulhBpDbe64U+hrCXWN+604MB1kGpL7KVRePvHJDGez6gbPRuZgDDeyN30VBzawqR6M
         5HwFaxk16hCeVhMLwDt73YD8os8sIgrniSikPkS57lMVxuI5/UV0gB1uuMSwVUANffZd
         1T4VFWplx4Puxa7YyCVMq95NNiVzc7cVwY9U6ShahHQ6UOUr5uQEOkT7mnuF9mRVqgm4
         RqMjYoIoqb/2PtFFXepG8yBz/GVR2+PNOEB8wXFOTqoRX0nG+M0omn2qf5lJGgzM7QWi
         4HqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+9ktnBB45aXlgSe0vRhpOUgxZAxDNe5YDUe3z1UsWXQ=;
        b=N6UN7AaeDmnpwnkOnPFQjl9vQZBrrdLT6V4tgRLlQ2LCQn2pmWqbekH+AkQ7hI9Y2z
         XVSZw83PwoPTL65WHqE7BNEQStlktAR19SNq7ChpVru20nOLnMr5HuH+LUbW67hD+Q76
         Az4+zcADg8N+z/elGjc6dIq6/uMGwUj13wimn9hbLlugzny+7D1UkhJtuBmHk4eUGBY7
         QXylGg0EbAKN0X07kCdEAsQsxBPPs45QLEJmTVs1uW7nPMawSvmyR02mKuc3p240GhGU
         XEgCpWdjA0NmM9RE6oWfFCfM//yqpY4UceAkxQx72H8GA5ZqQqueMAJU71d2l/1Ug7LF
         kOgg==
X-Gm-Message-State: AGi0PuZYmEOTQA409FuEmuDETB1YsCBCb720ISLehMq/GuoHvzmn8zM1
        7olO6O6H6qY+0z+YHoSMWmWSNfurILPXlyhExOhEJg==
X-Google-Smtp-Source: APiQypInHGpY7jZ4h51jJj3LKW1TA1Mq84UMe1r78naeeUH4EQq8+MTwZ3cUNL06uiOby8Imllg/eeIxoTxeqrNEbWM=
X-Received: by 2002:aa7:919a:: with SMTP id x26mr3880195pfa.39.1586286220287;
 Tue, 07 Apr 2020 12:03:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200407184336.14612-1-masahiroy@kernel.org>
In-Reply-To: <20200407184336.14612-1-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 7 Apr 2020 12:03:29 -0700
Message-ID: <CAKwvOd=pz7yWSyZ-v3uGNpc9u4zDAiycBrdGczp5oWrY7H_rvg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] kbuild: replace AS=clang with LLVM_IA=1
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Apr 7, 2020 at 11:44 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> The 'AS' variable is unused for building the kernel. Only the remaining
> usage is to turn on the integrated assembler. A boolean flag is a better
> fit for this purpose.
>
> AS=clang was added for experts. So, I replaced it with LLVM_IA=1,
> breaking the backward compatibility.
>
> Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Thank you for this series!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>
> Changes in v2:
>   - new patch
>
>  Documentation/kbuild/llvm.rst | 5 ++++-
>  Makefile                      | 2 +-
>  2 files changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
> index eefbdfa3e4d9..2b40afa58049 100644
> --- a/Documentation/kbuild/llvm.rst
> +++ b/Documentation/kbuild/llvm.rst
> @@ -50,11 +50,14 @@ LLVM Utilities
>  LLVM has substitutes for GNU binutils utilities. These can be invoked as
>  additional parameters to `make`.
>
> -       make CC=clang AS=clang LD=ld.lld AR=llvm-ar NM=llvm-nm STRIP=llvm-strip \\
> +       make CC=clang LD=ld.lld AR=llvm-ar NM=llvm-nm STRIP=llvm-strip \\
>           OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump OBJSIZE=llvm-size \\
>           READELF=llvm-readelf HOSTCC=clang HOSTCXX=clang++ HOSTAR=llvm-ar \\
>           HOSTLD=ld.lld
>
> +Currently, the integrated assembler is disabled by default. You can pass
> +LLVM_IA=1 to enable it.
> +
>  Getting Help
>  ------------
>
> diff --git a/Makefile b/Makefile
> index 1b2691057cb5..f9beb696d6d3 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -538,7 +538,7 @@ endif
>  ifneq ($(GCC_TOOLCHAIN),)
>  CLANG_FLAGS    += --gcc-toolchain=$(GCC_TOOLCHAIN)
>  endif
> -ifeq ($(if $(AS),$(shell $(AS) --version 2>&1 | head -n 1 | grep clang)),)
> +ifneq ($(LLVM_IA),1)
>  CLANG_FLAGS    += -no-integrated-as
>  endif
>  CLANG_FLAGS    += -Werror=unknown-warning-option
> --
> 2.17.1
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20200407184336.14612-1-masahiroy%40kernel.org.



-- 
Thanks,
~Nick Desaulniers
