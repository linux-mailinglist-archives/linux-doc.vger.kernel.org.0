Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8008319C83B
	for <lists+linux-doc@lfdr.de>; Thu,  2 Apr 2020 19:40:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390119AbgDBRko (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 2 Apr 2020 13:40:44 -0400
Received: from mail-pj1-f67.google.com ([209.85.216.67]:33037 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390109AbgDBRko (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 2 Apr 2020 13:40:44 -0400
Received: by mail-pj1-f67.google.com with SMTP id jz1so55978pjb.0
        for <linux-doc@vger.kernel.org>; Thu, 02 Apr 2020 10:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nNj9UWy+adV8xUYOhsOn+0IPS9HHD1PHgo+3YUVx5tE=;
        b=j9d3nGYO+vImn9Ah56bhXrZY5ohVu3dkH9USmRV2WScjAPCWH8zRCrBp1U5+hzFaP1
         +CSS6P7LMyN8Bx0wBTHJz52pxR+7g4ZZGMU6wAvQKH38g3SvuAynX7g/hO7bHvL85grU
         MAQZnqjpjGOyuoyyW85+/dINzwUUZ4oKynDPOkWVbSuOflXn9ojlm0ut9LnLil6QK7oD
         g5TjrdMsBZhZMuIhUGzyGlJU+n0WWz/mmkVUawuY2ILtjQjGfRrASKzHVIFV+SFLrstI
         XyFqwz98+8hl8qMrm1y12zUCHZNBtbpErPSeWXs5iE3CCdUoSMyeslHSNMbW3SGO1Nxt
         0Hfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nNj9UWy+adV8xUYOhsOn+0IPS9HHD1PHgo+3YUVx5tE=;
        b=BXb7lJJUw+x5/3FWBn1OP8sB/IfvV3Pe1HLCiUWSalg0maNsKvdPRy9Md6T2utilsp
         rpBM7Ud7TmsJVeYQSvjRiFQHKnBGXPYx3pJysPOVvG/jRUOhYarAl8y6nPleZ5FaAuk3
         lukTlhcm8sMOyoqtdMRW9LtKSsTOxi3do705oifD6pdZpB3wqf0JiUidxL4bvxC2KwT4
         G/qdlLG1fkz87bk2zoyKgGIhgVv7/SAv919UUc7a/qERc0uuygOycqsGYEdmOs6W+AdY
         O9N9fvJmBYKEnZlGcl6H5jkQYNUZs3rSgF2+pcBkaJtztxC/IPmENUncapXQIOFd+ZFE
         tLBA==
X-Gm-Message-State: AGi0Pua8Lyt3hEIarJkbr7p3r8zVNSsFXVi9z43Ql+DA/o15H0GiFH1B
        AhRhvsTNV2Ie6PGE94/wrpvgtKeInTnShsZ1G/ldWg==
X-Google-Smtp-Source: APiQypIdxa1oDQwUT8/HPtN0SsfP+74JHOVfIUEAdwj3kA0JfxTpxqsmYGp3noybOOAdNmZl81K8fAcmMCRbTmK/Pk4=
X-Received: by 2002:a17:90a:8085:: with SMTP id c5mr4564376pjn.186.1585849242863;
 Thu, 02 Apr 2020 10:40:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200402173842.96013-1-maskray@google.com>
In-Reply-To: <20200402173842.96013-1-maskray@google.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 2 Apr 2020 10:40:31 -0700
Message-ID: <CAKwvOdkHugeJW8GOa_8Pf+axPnhFiy+4t0fsOyzp2hxaDE1NAw@mail.gmail.com>
Subject: Re: [PATCH] Documentation/llvm: fix the name of llvm-size
To:     Fangrui Song <maskray@google.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Apr 2, 2020 at 10:38 AM 'Fangrui Song' via Clang Built Linux
<clang-built-linux@googlegroups.com> wrote:
>
> The tool is called llvm-size, not llvm-objsize.
>
> Fixes: fcf1b6a35c16 ("Documentation/llvm: add documentation on building w/ Clang/LLVM")
> Signed-off-by: Fangrui Song <maskray@google.com>
> ---
>  Documentation/kbuild/llvm.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
> index d6c79eb4e23e..eefbdfa3e4d9 100644
> --- a/Documentation/kbuild/llvm.rst
> +++ b/Documentation/kbuild/llvm.rst
> @@ -51,7 +51,7 @@ LLVM has substitutes for GNU binutils utilities. These can be invoked as
>  additional parameters to `make`.
>
>         make CC=clang AS=clang LD=ld.lld AR=llvm-ar NM=llvm-nm STRIP=llvm-strip \\
> -         OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump OBJSIZE=llvm-objsize \\
> +         OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump OBJSIZE=llvm-size \\
>           READELF=llvm-readelf HOSTCC=clang HOSTCXX=clang++ HOSTAR=llvm-ar \\
>           HOSTLD=ld.lld
>
> --

OBJCOPY -> llvm-objcopy
OBJDUMP -> llvm-objdump
OBJSIZE -> llvm-size

Oops, thanks for the patch.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

-- 
Thanks,
~Nick Desaulniers
