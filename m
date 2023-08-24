Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB50C7864ED
	for <lists+linux-doc@lfdr.de>; Thu, 24 Aug 2023 03:52:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239159AbjHXBvx (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 23 Aug 2023 21:51:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239198AbjHXBvw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 23 Aug 2023 21:51:52 -0400
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF09FCE3
        for <linux-doc@vger.kernel.org>; Wed, 23 Aug 2023 18:51:49 -0700 (PDT)
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-4109c8ece5aso21545631cf.1
        for <linux-doc@vger.kernel.org>; Wed, 23 Aug 2023 18:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692841908; x=1693446708;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PKBHsMk1CbMSlqQVgxAHxEP1vVsD/VRgPlVnjdXXDhw=;
        b=aVIuFxpFTMUVSlrSloAOeQreEDd8USTaCSBgez34hDnXw6+dPS/zLAcQIskYR9YOX7
         DjKjaNFZ3/RSSvhy4S3AYMl1Xq7em/Ize3JX+PRC1rZ5zKRcS7HGFBs5ghoBT3Qn8XJT
         UIvMiwOCunRib6uB8qxXeWonKwTy3va/E1gho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692841908; x=1693446708;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PKBHsMk1CbMSlqQVgxAHxEP1vVsD/VRgPlVnjdXXDhw=;
        b=AmCDt2pEjyaxZb+Inh0oNOOnEJqFN2boFZXnUhxMP1/dZiAv+tJ2oStftGx6tP+vgr
         bzE/CjtoBUHCkA96/2jQtEtUnKwtzOUPzrE6tbh8avlIBZa49uL1Mvjrsv/k3qdY3JSj
         lj2ZCXqI9K/gXtHgjcxU7vWm39rh3TWy79Uo793lzrhxZEaoVBVs7Q6HcVNes26Q3wEl
         ye51xvA8XH0E4M55BO5CFiPdvCaRYzfBgwMQ6gxy/EVRiljYivC99bRUerGTzS/40CVv
         ez7OSZ9M16w21usdTAv3z+qLuzu7QyFvcqVHlOSdQDAalXxZI4y59FwvIw56m6FhO9LT
         G80w==
X-Gm-Message-State: AOJu0Yx3mGAyUnEi5cYHIGfdsCgXyWgso+HDByAUB2wnR40G9YSYsI3d
        i6LIkZmEFEp8uYuBS2rghyiWonLGuLKtzbRmK7ChDg==
X-Google-Smtp-Source: AGHT+IGXBKMKdqMcMWVUsY3bMOXeG7ofKlrVKbdJv1BvuxmTY6RVSpN/e583kcpt+oZSpWYg1BkTrw==
X-Received: by 2002:a05:622a:118c:b0:411:fa19:bd63 with SMTP id m12-20020a05622a118c00b00411fa19bd63mr2635822qtk.31.1692841908054;
        Wed, 23 Aug 2023 18:51:48 -0700 (PDT)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com. [209.85.222.180])
        by smtp.gmail.com with ESMTPSA id m12-20020aed27cc000000b00403e7e88205sm4127960qtg.33.2023.08.23.18.51.47
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Aug 2023 18:51:47 -0700 (PDT)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-76dbd877cd9so97651885a.0
        for <linux-doc@vger.kernel.org>; Wed, 23 Aug 2023 18:51:47 -0700 (PDT)
X-Received: by 2002:a0c:e409:0:b0:64f:6d8d:f65f with SMTP id
 o9-20020a0ce409000000b0064f6d8df65fmr741433qvl.51.1692841906999; Wed, 23 Aug
 2023 18:51:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230817012007.131868-1-senozhatsky@chromium.org>
 <CAK7LNASJWKSsdzn5ccgWaC35-XvHGU7pnE6C=eZFDbqrrghtdQ@mail.gmail.com>
 <20230820024519.GK907732@google.com> <CAK7LNAS9KC1GjPgadMEivSpy4TMYU8mQ+BrtfJpNs2kvhK18yA@mail.gmail.com>
 <20230820072119.GM907732@google.com> <20230820073332.GN907732@google.com>
 <CAK7LNARTZXvWD8PrA3bC+Ok7LK85qO=pkMs4kOPGn90OBooL6w@mail.gmail.com>
 <20230822061203.GA610023@google.com> <CAK7LNAS0qEZk+xAq84=7SuJSQz5F3dNBjYKPoeKTd_caq-QMKg@mail.gmail.com>
In-Reply-To: <CAK7LNAS0qEZk+xAq84=7SuJSQz5F3dNBjYKPoeKTd_caq-QMKg@mail.gmail.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 24 Aug 2023 10:51:30 +0900
X-Gmail-Original-Message-ID: <CAAFQd5DeDEhPUQScXB67v9giiV=G33L-YDdtF4e-+UcmBXG6jA@mail.gmail.com>
Message-ID: <CAAFQd5DeDEhPUQScXB67v9giiV=G33L-YDdtF4e-+UcmBXG6jA@mail.gmail.com>
Subject: Re: [RFC][PATCH] kconfig: introduce listunknownconfig
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ying Sun <sunying@nj.iscas.ac.cn>,
        Jesse T <mr.bossman075@gmail.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Jonathan Corbet <corbet@lwn.net>, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Masahiro,

On Thu, Aug 24, 2023 at 10:00=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.=
org> wrote:
>
> On Tue, Aug 22, 2023 at 4:30=E2=80=AFPM Sergey Senozhatsky
> <senozhatsky@chromium.org> wrote:
> >
> > On (23/08/21 21:27), Masahiro Yamada wrote:
> > >
> > > My (original) hope was to add a single switch, KCONFIG_VERBOSE, to ad=
dress both:
> > >
> > >   - A CONFIG option is hidden by unmet dependency (Ying Sun's case)
> > >   - A CONFIG option no longer exists  (your case)
> > >   - Anything else we need to be careful
> >
> > A quick question: is it too late to suggest an alternative name?
> > Could KCONFIG_SANITY_CHECKS be a little cleaner? Because we basically
> > run sanity checks on the config.
>
>
> Ying's is not applied yet. So, it is not too late.
>
> But, I started to be a little worried
> because it is unpredictable how many KCONFIG_* env
> variables will increase until people are satisfied.
>

Is there really a problem with having those? There are a lot of
different env variables affecting different parts of the kernel build.
If they are useful, and even better, allow catching issues quickly,
should we favor less options or usefulness for users?

> >
> > And one more question: those sanity checks seem very reasonable.
> > Is there any reason we would not want to keep them ON by default?
> > And those brave souls, that do not wish for the tool to very that
> > the .config is sane and nothing will get downgraded/disabled, can
> > always set KCONFIG_SANITY_CHECKS to 0.
>
>
> Kconfig is meant to resolve the dependency without causing an error.
> If a feature is not available, it is automatically, silently hidden,
> and that works well.

How do you come to the conclusion that it works well? I've heard many
people unhappy about the way Kconfig works. How does one know that
something is missing (and should maybe be fixed?) if Kconfig silently
hides it?

>
> When a compiler does not support a particular feature,
> 'depends on $(cc-option )' hides that CONFIG option.
> Kconfig is meant to work like that.
>
>
>
> For your case, it is case-by-case.
>
> Let's say a stale code is removed from upstream.
>
> After "obj-$(CONFIG_FOO) +=3D foo.o" is removed
> from upstream, CONFIG_FOO in the .config is a "don't care".
>
> If it were an error, all arch/*/configs/*_defconfig
> must be cleaned up at the same time.
>

I'd argue that clean up should actually happen. An identically named
option could be added in the future again and mean something different
and would end up accidentally selected by those old defconfigs.

>
> So, sometimes it is helpful, but sometimes noisy.
>
>
>
>
> For the MFD_RK808 case particularly,
> I believe Kconfig showed MFD_RK8XX_I2C
> as a new option.

Among tens or hundreds of other new options. Good luck making sure
that you didn't miss it.

>
> Or, when you bumped to a new kernel version,
> you could run 'make listnewconfig'.
> (See 17baab68d337a0bf4654091e2b4cd67c3fdb44d8.
> Redhat says they review every new config option.)
>

What is the listnewconfig supposed to show?

Regardless of that, shouldn't we strive to automate things rather than
just put people at those and wasting the time they could spend on
something more productive?

>
> If you had done a per-config review
> you would have noticed
> c20e8c5b1203af3726561ee5649b147194e0618e
> before spending time on run-time debugging.
>

Instead, I'd have spent time on researching every single new Kconfig
option just to realize that I don't care about it, except the single
one that I needed. In fact, it wouldn't have even guaranteed tracking
down the problem, because I don't necessarily have to know all the
config options that are necessary for my board - how do you associate
some MFD driver Kconfig option with an SD/MMC controller not working?

Best regards,
Tomasz

>
>
>
> --
> Best Regards
> Masahiro Yamada
