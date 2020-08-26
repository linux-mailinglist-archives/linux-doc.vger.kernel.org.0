Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B45D92537B1
	for <lists+linux-doc@lfdr.de>; Wed, 26 Aug 2020 20:58:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726929AbgHZS6u (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 26 Aug 2020 14:58:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726825AbgHZS6t (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 26 Aug 2020 14:58:49 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 284E0C061574
        for <linux-doc@vger.kernel.org>; Wed, 26 Aug 2020 11:58:49 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id o13so1554135pgf.0
        for <linux-doc@vger.kernel.org>; Wed, 26 Aug 2020 11:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jX9ahxxqEFpJhnR/JmUOxhJx7X6V8xhX4eMTXHbLdG8=;
        b=uHY6i03f1RlJICjFcskNNTzUKHc2WX7cOvlUM6AaZI5aKDNz8mmZUwDF5vkcx9UaDh
         T4sumsp3RWnaZNWF/uK22UCIteUEa/+j23j63nx1Yr7Yla/rlljoXUmKVG71OW+HBcmd
         dx6LxPRmjN6atBM5z2yxqp2NC2zgSkUQSfLH76uxpzTu3KOkGkT3OO31u7Oj/+V9sbXk
         2P1R7AjvOmv2/3ibUjBLkveAFutKM11h2/BLtZZidAoEISkhpYhDbC9fGul6UxnkDQH7
         EXCBKgF4Oy9OIrmet1fJmmyxWTYO/h+uGcDRJ6HZWJ1tdKNvs+APVd+dANRfLpuyoEW+
         ul4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jX9ahxxqEFpJhnR/JmUOxhJx7X6V8xhX4eMTXHbLdG8=;
        b=SNNMl4Zu1IO54E77ds/g1xwUyJXEdJBqclH4djeoVbspD6Y0Zxzc8Zn4jDxw6X17LG
         QAldu469Gshe0OKH5sEeOuuivd1lOfBHII0Af24clovvgyDpzZV4i/oHHPlHdVJQAOLe
         rc7aqwhuVWcC2YX8uxPvlTJELOafjo7pC8Lrlb91ugdS9BzUansz5tjXXIvNF/IFe60g
         Ezf47oOfK/oNKMeLiWhDM+hCLs4QVzPI+y66jg618kydBjnI9tF5edm3QqktJaq4WP2Q
         tx3oGl3jCXIUhGwVp3S9lFe3D1QwMsHu+w0gC0ZvXakbtPML/vB/skn6IPr9SdPVvPu1
         1TLw==
X-Gm-Message-State: AOAM530bHf0f83CtlYbzuvfp8KPjVy9hJ0dkgSDCvhTvX5hbKZqtmnJF
        /iin8qrm8vDR3v8HBCEegXBAMsS4i38eKLPNC6fOkw==
X-Google-Smtp-Source: ABdhPJzEx2X+o8glvzrKL5VN+XVSVbctKrXGzkS6AlxrHGDAdYi5a6NEj0UN5z2MuDLRYijEMRoy1y9MtIIlaZd5xfU=
X-Received: by 2002:a63:4e56:: with SMTP id o22mr11208777pgl.381.1598468325860;
 Wed, 26 Aug 2020 11:58:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200825222552.3113760-1-ndesaulniers@google.com> <CA+icZUVhwqF=TT2V3XOw1RbdX4g_i5qVX-5eTkVcsgEbfGyJkw@mail.gmail.com>
In-Reply-To: <CA+icZUVhwqF=TT2V3XOw1RbdX4g_i5qVX-5eTkVcsgEbfGyJkw@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 26 Aug 2020 11:58:34 -0700
Message-ID: <CAKwvOd=Hc3SkTdm+JLoswwEQ-QW50Cy82t=AEMusqJnHYOKUQg@mail.gmail.com>
Subject: Re: [PATCH] Documentation: add minimum clang/llvm version
To:     Sedat Dilek <sedat.dilek@gmail.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Randy Dunlap <rdunlap@infradead.org>,
        "Theodore Ts'o" <tytso@mit.edu>, Kees Cook <keescook@chromium.org>,
        Will Deacon <will@kernel.org>, Borislav Petkov <bp@suse.de>,
        "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        Clang-Built-Linux ML <clang-built-linux@googlegroups.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Aug 26, 2020 at 8:53 AM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> Thanks for the text - a first good step.
>
> Do you plan checks in the source-code - in the future (see [1] where I
> played a bit)?

Oh, I forgot! Good idea, will add a check to compiler-clang.h.

> Arch-specific supported LLVM toolchain versions?

No.  That's going to be a complicated mess with frequent churn.

> Feature-specific support (like KCSAN, Clang-IAS, etc.)?

Ditto. (no)

> In the future we should introduce some checks for this to be user-friendly.
>
> If you talk about "Clang/LLVM" does this include the LLD linker?
> Personally, I think LLD is worth a separate item like GNU/ld (BFD) linker.

binutils version checks aren't enforced like the compiler version is,
so for now I'll stick to just checking the compiler version.  That
dodges the combinatorial explosion with regards to support you're
referring to.  Otherwise we're talking about a complicated
multidimensional table that we don't have CI coverage of.

> [1] https://github.com/ClangBuiltLinux/linux/issues/941
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/kbuild/llvm.rst#n47
-- 
Thanks,
~Nick Desaulniers
