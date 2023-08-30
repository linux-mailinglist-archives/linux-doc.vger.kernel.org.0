Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A528178DC12
	for <lists+linux-doc@lfdr.de>; Wed, 30 Aug 2023 20:47:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238219AbjH3Sh2 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 30 Aug 2023 14:37:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242229AbjH3HbN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 30 Aug 2023 03:31:13 -0400
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com [IPv6:2607:f8b0:4864:20::e2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B70ECCB
        for <linux-doc@vger.kernel.org>; Wed, 30 Aug 2023 00:31:07 -0700 (PDT)
Received: by mail-vs1-xe2b.google.com with SMTP id ada2fe7eead31-44d4c3fa6a6so2231276137.0
        for <linux-doc@vger.kernel.org>; Wed, 30 Aug 2023 00:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1693380665; x=1693985465; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cb57tEvO6icqbBigTK6Bn8btOLvPxwu8pA4Mib+Kbig=;
        b=HRstby8ZVH5hvjDbobpFSuGLTxtCGjqo6C4xsnmrVMKflaCAy9VSJEUd7zrhLLR4TA
         IeLZ0KMTD7l7Qah1nbTKa2nW0oK7E+EMRPrbBHSmC19kXXvNVb4qORHOfj8teofW/SJg
         uH6+xTfOSGb6kmX+qCX4J9j1KX+b9xHsJkdJM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693380665; x=1693985465;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cb57tEvO6icqbBigTK6Bn8btOLvPxwu8pA4Mib+Kbig=;
        b=SZBqTjdvF3KjGO4lr4bGEfD9SnM6tK4fGU0f3eqDROnvqw4UVPLIs07S7z7RTJuCeD
         gdt6K3cq9C6Yctk1J39JMAHZC8Wk9016F+tmcQaH1k6oeGSIHKdZruuP501TFLr2Xd4j
         j9xYeG2+Vv5Yx17XfGeVR0aaMwXuz4hqcHnpTyu7iCRk5ZmvkTYO4TM5UqLZFoB36juK
         VhU9OXbY8dgFvbR3Ru/BBr1Ga60KBG4LZvOv3lDe8EX51N62AoYVLgleG0V42GXN0q7z
         R7EBC5dQI5nutNZrW5SkCusrfOH0Lm7+rNYwaysPiOHTxffLT8xIsV3jo869oJ9bndkj
         NETQ==
X-Gm-Message-State: AOJu0YwUhjoa8sXRUgANlCTFMJEok0P9RsuEGWIRAv0cGxyPqIG8FHZf
        UdVlJmJglT438BXBy/sDnUMB6SFEaNRSbiu4fcyRcA==
X-Google-Smtp-Source: AGHT+IF9J1i4XEYLd60ZtWm0/llxBbnX95ka48DRh+9I1uxBHmaXbn6FyfhncFoCsJqhJ0wV1rdvTw==
X-Received: by 2002:a67:e3a6:0:b0:44d:f177:279e with SMTP id j6-20020a67e3a6000000b0044df177279emr1357968vsm.22.1693380665559;
        Wed, 30 Aug 2023 00:31:05 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id q11-20020ab04a0b000000b0078cf32c7d3dsm1753191uae.12.2023.08.30.00.31.04
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Aug 2023 00:31:05 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-44d56d26c32so2229587137.3
        for <linux-doc@vger.kernel.org>; Wed, 30 Aug 2023 00:31:04 -0700 (PDT)
X-Received: by 2002:a05:6102:d7:b0:44d:47c3:3790 with SMTP id
 u23-20020a05610200d700b0044d47c33790mr1259859vsp.10.1693380664365; Wed, 30
 Aug 2023 00:31:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230817012007.131868-1-senozhatsky@chromium.org>
 <CAK7LNASJWKSsdzn5ccgWaC35-XvHGU7pnE6C=eZFDbqrrghtdQ@mail.gmail.com>
 <20230820024519.GK907732@google.com> <CAK7LNAS9KC1GjPgadMEivSpy4TMYU8mQ+BrtfJpNs2kvhK18yA@mail.gmail.com>
 <20230820072119.GM907732@google.com> <20230820073332.GN907732@google.com>
 <CAK7LNARTZXvWD8PrA3bC+Ok7LK85qO=pkMs4kOPGn90OBooL6w@mail.gmail.com>
 <20230822061203.GA610023@google.com> <CAK7LNAS0qEZk+xAq84=7SuJSQz5F3dNBjYKPoeKTd_caq-QMKg@mail.gmail.com>
 <CAAFQd5DeDEhPUQScXB67v9giiV=G33L-YDdtF4e-+UcmBXG6jA@mail.gmail.com> <CAK7LNATj-jnOLMkgzz=3MfqWgUjKF-MwSKQkr4hW0g7+tEsXUw@mail.gmail.com>
In-Reply-To: <CAK7LNATj-jnOLMkgzz=3MfqWgUjKF-MwSKQkr4hW0g7+tEsXUw@mail.gmail.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 30 Aug 2023 16:30:47 +0900
X-Gmail-Original-Message-ID: <CAAFQd5AhN5m8eaGsrKfh1gHPLiOVd9_3BwoHpr7u6iY92Ft-bg@mail.gmail.com>
Message-ID: <CAAFQd5AhN5m8eaGsrKfh1gHPLiOVd9_3BwoHpr7u6iY92Ft-bg@mail.gmail.com>
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

On Sat, Aug 26, 2023 at 10:11=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.=
org> wrote:
>
> On Thu, Aug 24, 2023 at 2:30=E2=80=AFPM Tomasz Figa <tfiga@chromium.org> =
wrote:
> >
> > Hi Masahiro,
> >
> > On Thu, Aug 24, 2023 at 10:00=E2=80=AFAM Masahiro Yamada <masahiroy@ker=
nel.org> wrote:
> > >
> > > On Tue, Aug 22, 2023 at 4:30=E2=80=AFPM Sergey Senozhatsky
> > > <senozhatsky@chromium.org> wrote:
> > > >
> > > > On (23/08/21 21:27), Masahiro Yamada wrote:
> > > > >
> > > > > My (original) hope was to add a single switch, KCONFIG_VERBOSE, t=
o address both:
> > > > >
> > > > >   - A CONFIG option is hidden by unmet dependency (Ying Sun's cas=
e)
> > > > >   - A CONFIG option no longer exists  (your case)
> > > > >   - Anything else we need to be careful
> > > >
> > > > A quick question: is it too late to suggest an alternative name?
> > > > Could KCONFIG_SANITY_CHECKS be a little cleaner? Because we basical=
ly
> > > > run sanity checks on the config.
> > >
> > >
> > > Ying's is not applied yet. So, it is not too late.
> > >
> > > But, I started to be a little worried
> > > because it is unpredictable how many KCONFIG_* env
> > > variables will increase until people are satisfied.
> > >
> >
> > Is there really a problem with having those? There are a lot of
> > different env variables affecting different parts of the kernel build.
> > If they are useful, and even better, allow catching issues quickly,
> > should we favor less options or usefulness for users?
>
>
>
> I am considering how to implement it.
>
>
>
> One way is to add env variables as a new request arises.
>
> Sergey is doing two things by one option.
>
>
>    KCONFIG_WARN_UNKNWON_SYMBOL : warn unknown symbol in input .config
> or defconfig
>    KCONFIG_WARN_TO_ERROR       : turn warnings into errors
>
>
>
> Another way is to handle those as command line options.
>
>   -Wunknown-symbol
>   -Werror             (associated with W=3De)
>   -Wall               (associated with W=3D1)
>
>
>
>   $ make W=3D1e olddefconfig
>
>
> will work to sanity check.
>
>

I see, I think I misunderstood your previous message, sorry. Agreed
that there could be other approaches than an environment variable and
a command line option could definitely work as well. I'll leave the
details to you and Sergey, but ideally we would have something that is
simple to use both in scripts (e.g. distro build systems) and in
manual build for end users

>
>
>
> > > >
> > > > And one more question: those sanity checks seem very reasonable.
> > > > Is there any reason we would not want to keep them ON by default?
> > > > And those brave souls, that do not wish for the tool to very that
> > > > the .config is sane and nothing will get downgraded/disabled, can
> > > > always set KCONFIG_SANITY_CHECKS to 0.
> > >
> > >
> > > Kconfig is meant to resolve the dependency without causing an error.
> > > If a feature is not available, it is automatically, silently hidden,
> > > and that works well.
> >
> > How do you come to the conclusion that it works well? I've heard many
> > people unhappy about the way Kconfig works. How does one know that
> > something is missing (and should maybe be fixed?) if Kconfig silently
> > hides it?
>
>
> Kconfig has worked like that for a long time, but I do not know
> how to detect non-existing symbols.
>
>

I think a tool to detect symbols present in old config, but missing in
new kernel solves the "upgraded config" part of the problem.

The other part ("new config") would probably be solved by some kind of
a tool that looks at the currently present hardware and spews a list
of Kconfig options together with their dependencies, but arguably
that's not something that would be a part of Kconfig itself.

For the graphical configuration tools like menuconfig I could imagine
that the options with unmet dependencies could be still displayed but
greyed out, so at least one can open the help for the item and check
which dependencies are missing.

>
>
> >
> > >
> > > When a compiler does not support a particular feature,
> > > 'depends on $(cc-option )' hides that CONFIG option.
> > > Kconfig is meant to work like that.
> > >
> > >
> > >
> > > For your case, it is case-by-case.
> > >
> > > Let's say a stale code is removed from upstream.
> > >
> > > After "obj-$(CONFIG_FOO) +=3D foo.o" is removed
> > > from upstream, CONFIG_FOO in the .config is a "don't care".
> > >
> > > If it were an error, all arch/*/configs/*_defconfig
> > > must be cleaned up at the same time.
> > >
> >
> > I'd argue that clean up should actually happen. An identically named
> > option could be added in the future again and mean something different
> > and would end up accidentally selected by those old defconfigs.
>
>
> For renaming, I agree with you.
> All defconfig files should be updated to keep the equivalent behavior.
>
> For code removal, defconfig cleaning can be deferred because
> that would possibly cause conflicts across subsystems.
>

True. In that case it sounds like the new behavior definitely needs to
be optional.

> Reusing the same CONFIG name for different meaning must be
> sorted out properly but that rarely happens, I guess.
>

Sure, I have to admit that it was a bit of an imaginary case. :)

>
>
> > >
> > > So, sometimes it is helpful, but sometimes noisy.
> > >
> > >
> > >
> > >
> > > For the MFD_RK808 case particularly,
> > > I believe Kconfig showed MFD_RK8XX_I2C
> > > as a new option.
> >
> > Among tens or hundreds of other new options. Good luck making sure
> > that you didn't miss it.
> >
> > >
> > > Or, when you bumped to a new kernel version,
> > > you could run 'make listnewconfig'.
> > > (See 17baab68d337a0bf4654091e2b4cd67c3fdb44d8.
> > > Redhat says they review every new config option.)
> > >
> >
> > What is the listnewconfig supposed to show?
>
>
> Documented in Documentation/kbuild/kconfig.rst
> line 16 - 34.
>

I see, thanks.

Best regards,
Tomasz
