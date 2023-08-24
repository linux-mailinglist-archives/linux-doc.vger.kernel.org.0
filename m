Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAB7D787A02
	for <lists+linux-doc@lfdr.de>; Thu, 24 Aug 2023 23:13:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231608AbjHXVNT (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 24 Aug 2023 17:13:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243474AbjHXVMs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 24 Aug 2023 17:12:48 -0400
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8CD31FD9
        for <linux-doc@vger.kernel.org>; Thu, 24 Aug 2023 14:12:35 -0700 (PDT)
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-4109c8ece5aso1348201cf.1
        for <linux-doc@vger.kernel.org>; Thu, 24 Aug 2023 14:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692911554; x=1693516354;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4U1ivCyumzozlOIlLtJN6Z5xOoT4k9wuOs/HLGPW8t0=;
        b=VJTm8lTcxoztRvIBEKss1oLLWxWSKgQM+369NiNy8dvn6YCJDWVB+CfukSFIaxAJUD
         KH1SYydQ4D1GB4zvI2rf433XTYXT8mIRtF+fh4asnISKH84UUcQcOGYjbhhyc6s+3VVy
         l/jl/mku25gwK5PWyZxzTsGrcj5POmnlDzqJ0aK/7nblSFUoWz0Wp69s7yyrz30fM6Ju
         42+RX2+D62Pw75tLd9JnBqgcnuM+Iqa3jNAiw6LBvWXKLuxIeWMXofxmelfE01nIyoGT
         wJIwK/xjL1v0pE0G13JTFZQMB7DfQaKWxGkxX8+3OFgYOeOsarWYFtTlgBttr7mWS/CL
         EajQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692911554; x=1693516354;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4U1ivCyumzozlOIlLtJN6Z5xOoT4k9wuOs/HLGPW8t0=;
        b=DjpKAAyZ+tdol14a5YNaYrJoeCccNlSy2RGrSugbEyEdMP2sDE59L6rT0KSbhjgVpR
         n3BorMyEMuCqNLRHaAp1TwGA7sQyPrEhD1eojlPIQmwpjgQuUK6/v0qaLYam7gJdPghq
         PBQlAqDuuVf2LjjQBt4diS2KxBrE6+KZt2yc6zgPzZGew3CYO0wrezt8/SsJlqv2zga1
         KIl2rUrKMJSe8NNKGS/QuTAAh71iGoNJpU5zxC4WJpI5FuG7qxg5HBJ7+h0m8zmjIywS
         NohKYsVOJjiY4zBoJF3+rfsuxm7ng9QW9Pud/SQ663B+7g/Cze8/bZ1KTJRrWHfCvUFF
         ERgA==
X-Gm-Message-State: AOJu0YzP36iMzWaXCb2sr364KbzZgYr8k94sLBYsE13JvTCWbdSmcERk
        hMMw1YYU5RHVORCQPzc4fsUYGj1hgQ7nunnsNCUNsw==
X-Google-Smtp-Source: AGHT+IHJ5oM96Zm8ClYAtCrxKInIQduZvCd9928l9ysBLty471FXDG4CQkDMxa/8esRD1pekknsSAm8ScMk0Ote30z8=
X-Received: by 2002:a0c:ac49:0:b0:647:2def:6a8 with SMTP id
 m9-20020a0cac49000000b006472def06a8mr15925588qvb.45.1692911554574; Thu, 24
 Aug 2023 14:12:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230824-docs-v1-1-67e061278b8f@google.com> <20230824184910.GA2015748@dev-arch.thelio-3990X>
 <CAKwvOdkdb=dDggNNPHb08AiZNp5V-H9utgm0H+2hJmZJdO-biA@mail.gmail.com>
In-Reply-To: <CAKwvOdkdb=dDggNNPHb08AiZNp5V-H9utgm0H+2hJmZJdO-biA@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 24 Aug 2023 14:12:23 -0700
Message-ID: <CAKwvOdkuxO0TeERBCRFrjKvKUsg=nchOuPJc_gx_zGfOaWwhmA@mail.gmail.com>
Subject: Re: [PATCH] Documentation/llvm: refresh docs
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>, Tom Rix <trix@redhat.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Jonathan Corbet <corbet@lwn.net>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, llvm@lists.linux.dev,
        linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Aug 24, 2023 at 1:32=E2=80=AFPM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Thu, Aug 24, 2023 at 11:49=E2=80=AFAM Nathan Chancellor <nathan@kernel=
.org> wrote:
> >
>
> > I see a few new kernel-doc warnings from not adjusting the underlines t=
o
> > match the new length of the title:
> >
> >   Documentation/kbuild/llvm.rst:40: WARNING: Title underline too short.
> >
> >   The LLVM=3D argument
> >   --------------
> >   Documentation/kbuild/llvm.rst:40: WARNING: Title underline too short.
> >
> >   The LLVM=3D argument
> >   --------------
> >   Documentation/kbuild/llvm.rst:102: WARNING: Title underline too short=
.
> >
> >   The LLVM_IAS=3D argument
> >   -----------------
> >   Documentation/kbuild/llvm.rst:102: WARNING: Title underline too short=
.
> >
> >   The LLVM_IAS=3D argument
> >   -----------------
>
> oops! remind me of the make target to observe these?

Found it;
make htmldocs
https://www.kernel.org/doc/html/latest/doc-guide/sphinx.html


--=20
Thanks,
~Nick Desaulniers
