Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF62037397C
	for <lists+linux-doc@lfdr.de>; Wed,  5 May 2021 13:34:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233085AbhEELfr (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 5 May 2021 07:35:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232995AbhEELfr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 5 May 2021 07:35:47 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91440C061763
        for <linux-doc@vger.kernel.org>; Wed,  5 May 2021 04:34:50 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id x2so2057081lff.10
        for <linux-doc@vger.kernel.org>; Wed, 05 May 2021 04:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IgvoE77MnMbex7B2S0TkrRa1RsaV/q1aQVIu3eT5F4I=;
        b=dAIjjW2qqzmG32ewtdJN+Q3kO51I+XWS+ICZ5Q/QlSc2OVA+FPOXH5+6ZS9pXMnlZE
         Wxkl5zEarjWAxfNUZtq5GqF0sd6K4VBDcbpjzDWdxZeMXHrEdAxDgvzeOWqFlMh12LiQ
         Cq19ZFLDmD9FpgdjvSoafBFGgrQ67n6PLXpV7YuSoimkTtCr4Yo/pze+IqCqjBaOcPUp
         rYKBPzZsjA6JkGrfrsqxLXLAjGsJEdMVrujwr59VLv4B0a9ClOIxKk4knJnJhEe4VLet
         NgrSgD4d3S6nbuNcvaP39+rn0ISeLOg4fM86jrwl15wcqhO+SkMfUxMic+EcMKsMIHSx
         sNmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IgvoE77MnMbex7B2S0TkrRa1RsaV/q1aQVIu3eT5F4I=;
        b=ZML54kizHrR5NJpeLlc2mtwhqqp0lLBFXYygcsoAj37REnjQiBCmezdU9xH7I/cxQH
         aza6ZK3Cpjs+/KPQHUz6rlHJUoeQzQ6LmKyAd2YtC2gC6Bk5bVTeWSiCrdGxdAiOGQep
         8cF6VzY5OYXaJ8IOoPWuJrZwP+wphNcA2wqWY8Zo1ip1n7jxYBHkShZoxAeKhySk1xuI
         mFweQN7sRjg7ZV+wOrje5D6QtT57hlVXmuL7a0lr0Nn9w0B4DIYG4HHoWqWrlO2+NgD5
         mAdy518jxNhhmHR7hJ+azjC/jenUGi9N2gTRTi+j3sUCBD1CgGvgg4Se6/hef397LrL9
         0xJQ==
X-Gm-Message-State: AOAM533pj4z/D7zKesTq9UsfUtUJw0RADPSP5CLYeYO+mXtUGRlO0iE6
        5WhcI6qZXzyOjs3W/e+4m2uUGV775yUzmm1NibvNtQ==
X-Google-Smtp-Source: ABdhPJzSF9AHtOJF7IjLoW++ovuVHUkakgCSuRT8+ZsyQan+kbMdLPrMBrXFyvwHLXQlXaBHgo0G0xAvZDHqik5psVs=
X-Received: by 2002:ac2:5e36:: with SMTP id o22mr10820729lfg.529.1620214488167;
 Wed, 05 May 2021 04:34:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org> <YHiMyE4E1ViDcVPi@hirez.programming.kicks-ass.net>
 <YHj02M3jMSweoP4l@google.com> <CACRpkdat8bny=D2mAsUXcDQvFJ=9jSZSccMMZzH=10dHQ_bXrQ@mail.gmail.com>
 <CANiq72niCj9SfPhfQBMtxF+jth--cXdPQtUo5jhDDJgL6DTXZQ@mail.gmail.com>
 <CACRpkdarfkA1P0ERCXHSA=6VTBn6FXgOxB8haneQtN_4-tyQ0w@mail.gmail.com>
 <CANiq72=VA_cH9yw_LZr3P+n1AsQEEhtY4xdk76jHgimTufHRsQ@mail.gmail.com>
 <CACRpkdYodGnURuaYMBwVAY=8bU0PQoPAvTp34uYksPFmxBsT2A@mail.gmail.com>
 <CANiq72m9V3dVG59jAoR-OM+7QtJauQgrix3DZkw=oCuaaf3H5w@mail.gmail.com>
 <CACRpkdYzqy69G1Fpj4rFQFS+mYmpbQAzTszwCUBuEhe4YW4cuQ@mail.gmail.com> <CANiq72k+x13L+sFkjtDLahcvnpEySqk_NGow6FVMZfrV+MmHPw@mail.gmail.com>
In-Reply-To: <CANiq72k+x13L+sFkjtDLahcvnpEySqk_NGow6FVMZfrV+MmHPw@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 5 May 2021 13:34:37 +0200
Message-ID: <CACRpkdbNv4O7zs0OpZhWa2fkXkF5arQgDOF9++zKvr+yB5yk_w@mail.gmail.com>
Subject: Re: [PATCH 00/13] [RFC] Rust support
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Wedson Almeida Filho <wedsonaf@google.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux <rust-for-linux@vger.kernel.org>,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, May 5, 2021 at 1:30 AM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
> On Tue, May 4, 2021 at 11:21 PM Linus Walleij <linus.walleij@linaro.org> wrote:

> > I think right now the right thing for Rust is to work out-of-tree until
> > there is Rust support for all archs, while encouraging kernel
> > developers to learn the language.
>
> That would be an option, yes, but if the decision ends up being made
> and we are encouraging kernel developers to learn the language, what
> do we achieve by keeping things out-of-tree?
>
> In fact, by getting in-tree people, organizations & companies would be
> encouraged to give more support sooner rather than later to the LLVM
> backends they care about and/or to the GCC frontend for Rust. So, in a
> way, it can be a win for those projects too.

In a way it is a fair point because for example Unix and C evolved
together and were intermingled at the onset. And they kind of
needed each other to evolve.

Right now it seems like those organizations and companies
would be some academic institutions who like rust (because they
study languages and compilers) and Google. But that is a
pretty nice start, and one upside I would see in it is that
the academic people stop writing so many papers and get their
hands dirty and work on practical problems in the kernel. So
if that can be achieved I would be happy.

Yours,
Linus Walleij
