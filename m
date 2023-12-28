Return-Path: <linux-doc+bounces-5962-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E58881F4CA
	for <lists+linux-doc@lfdr.de>; Thu, 28 Dec 2023 06:52:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D437283265
	for <lists+linux-doc@lfdr.de>; Thu, 28 Dec 2023 05:52:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 272991FDC;
	Thu, 28 Dec 2023 05:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TWH9mAiX"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3AE1FB9
	for <linux-doc@vger.kernel.org>; Thu, 28 Dec 2023 05:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-552d39ac3ccso11812570a12.0
        for <linux-doc@vger.kernel.org>; Wed, 27 Dec 2023 21:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1703742733; x=1704347533; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f7MLraVP9QwLg0rDVio+i50pdPqXCBSQ9O3dkydmdrY=;
        b=TWH9mAiX1EgehSnUxHsJvj+FSXKwY6TsfW/B3HCDDKW3GXZeG0ofS8OvYAeF+O/JIO
         tIaUUymyCZEIM1E6TpmDPCVaN313xnAqDoPoHP86YTYgsI8SZuDmH920urZhjp1kCfPQ
         YiSUocanBUX9gS0vqyH7z/sLxPeo3TXtxkymU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703742733; x=1704347533;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f7MLraVP9QwLg0rDVio+i50pdPqXCBSQ9O3dkydmdrY=;
        b=FF1haXOs5bFnYscgRBZtQoZSfvdBW90pNawXpF41AISnVco8JY/JNuoFsOHOWj6bH1
         AIRkB9xwQa/3yddb7E+e5BK/c7Hr7QUfVzx+uOsnl0RYkc9io0Ksuac4k6aQntz4EPjK
         pmVOsbGxTxrenmoTv5juO3kohNWvr4xMhTIh26J6UQZxUfZcs3xVqIZe7y4C1m9zPiJZ
         zUWOcdt6ZPNPXfpTS38lzm6AL0RI2b5SQ3VV8W0bRnTZ/PtvXqoQWRvKe+kvYm4+JxLE
         nc+OJiHCIki97rb4mk+HKm1Wb+zBD5vHqZnXQchYrQ5XzAu08pUBPr/xXXwseoulJNV7
         A6RQ==
X-Gm-Message-State: AOJu0Yz5dm9KW5SpXP8mpZAiBrW8VJNSOeoJWSaUma0N4q3z3F9w4fqC
	F6iWJZkEmXlAZF/GSH77k7jASBqx7bnv+5mLH1gj5ak//a39fx0=
X-Google-Smtp-Source: AGHT+IFSoS7F1ZUraGW9WJmAtLLRpP92Es3q4+DOQBeJJxy/tIVG7UZeYVxzrhDQbjHzEusMwa939A==
X-Received: by 2002:a17:906:4ed6:b0:a26:c590:1b4e with SMTP id i22-20020a1709064ed600b00a26c5901b4emr9854771ejv.36.1703742733276;
        Wed, 27 Dec 2023 21:52:13 -0800 (PST)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com. [209.85.128.43])
        by smtp.gmail.com with ESMTPSA id y15-20020a17090668cf00b00a234c5d0834sm7261678ejr.175.2023.12.27.21.52.12
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Dec 2023 21:52:12 -0800 (PST)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-40d5b7b8adfso9486515e9.0
        for <linux-doc@vger.kernel.org>; Wed, 27 Dec 2023 21:52:12 -0800 (PST)
X-Received: by 2002:a05:600c:a46:b0:40d:604b:4a24 with SMTP id
 c6-20020a05600c0a4600b0040d604b4a24mr685133wmq.143.1703742732404; Wed, 27 Dec
 2023 21:52:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230817012007.131868-1-senozhatsky@chromium.org>
 <CAK7LNASJWKSsdzn5ccgWaC35-XvHGU7pnE6C=eZFDbqrrghtdQ@mail.gmail.com>
 <20230820024519.GK907732@google.com> <CAK7LNAS9KC1GjPgadMEivSpy4TMYU8mQ+BrtfJpNs2kvhK18yA@mail.gmail.com>
 <20230820072119.GM907732@google.com> <20230820073332.GN907732@google.com>
 <CAK7LNARTZXvWD8PrA3bC+Ok7LK85qO=pkMs4kOPGn90OBooL6w@mail.gmail.com>
 <20230822061203.GA610023@google.com> <CAK7LNAS0qEZk+xAq84=7SuJSQz5F3dNBjYKPoeKTd_caq-QMKg@mail.gmail.com>
 <CAAFQd5DeDEhPUQScXB67v9giiV=G33L-YDdtF4e-+UcmBXG6jA@mail.gmail.com>
 <CAK7LNATj-jnOLMkgzz=3MfqWgUjKF-MwSKQkr4hW0g7+tEsXUw@mail.gmail.com>
 <CAAFQd5AhN5m8eaGsrKfh1gHPLiOVd9_3BwoHpr7u6iY92Ft-bg@mail.gmail.com>
 <CAK7LNAR6o=K=eGzi194Ly787Ji4Twfqq3dcr8NE5m23ayGM3Fg@mail.gmail.com> <CAAFQd5DTNfNDPtvFd-=kkGYY5nduLp3SLjzNmHPgu6QfQO3ypw@mail.gmail.com>
In-Reply-To: <CAAFQd5DTNfNDPtvFd-=kkGYY5nduLp3SLjzNmHPgu6QfQO3ypw@mail.gmail.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Thu, 28 Dec 2023 14:51:55 +0900
X-Gmail-Original-Message-ID: <CAAFQd5BY+8O-Wj-A5sVF6SWPhpU_fyZ4c7+6XUCy6RD+Gd3Hug@mail.gmail.com>
Message-ID: <CAAFQd5BY+8O-Wj-A5sVF6SWPhpU_fyZ4c7+6XUCy6RD+Gd3Hug@mail.gmail.com>
Subject: Re: [RFC][PATCH] kconfig: introduce listunknownconfig
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Ying Sun <sunying@nj.iscas.ac.cn>, 
	Jesse T <mr.bossman075@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Nicolas Schier <nicolas@fjasle.eu>, 
	Jonathan Corbet <corbet@lwn.net>, linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 4, 2023 at 2:10=E2=80=AFPM Tomasz Figa <tfiga@chromium.org> wro=
te:
>
> On Fri, Sep 1, 2023 at 12:28=E2=80=AFAM Masahiro Yamada <masahiroy@kernel=
.org> wrote:
> >
> > On Thu, Aug 31, 2023 at 11:30=E2=80=AFAM Tomasz Figa <tfiga@chromium.or=
g> wrote:
> > >
> > > On Sat, Aug 26, 2023 at 10:11=E2=80=AFAM Masahiro Yamada <masahiroy@k=
ernel.org> wrote:
> > > >
> > > > On Thu, Aug 24, 2023 at 2:30=E2=80=AFPM Tomasz Figa <tfiga@chromium=
.org> wrote:
> > > > >
> > > > > Hi Masahiro,
> > > > >
> > > > > On Thu, Aug 24, 2023 at 10:00=E2=80=AFAM Masahiro Yamada <masahir=
oy@kernel.org> wrote:
> > > > > >
> > > > > > On Tue, Aug 22, 2023 at 4:30=E2=80=AFPM Sergey Senozhatsky
> > > > > > <senozhatsky@chromium.org> wrote:
> > > > > > >
> > > > > > > On (23/08/21 21:27), Masahiro Yamada wrote:
> > > > > > > >
> > > > > > > > My (original) hope was to add a single switch, KCONFIG_VERB=
OSE, to address both:
> > > > > > > >
> > > > > > > >   - A CONFIG option is hidden by unmet dependency (Ying Sun=
's case)
> > > > > > > >   - A CONFIG option no longer exists  (your case)
> > > > > > > >   - Anything else we need to be careful
> > > > > > >
> > > > > > > A quick question: is it too late to suggest an alternative na=
me?
> > > > > > > Could KCONFIG_SANITY_CHECKS be a little cleaner? Because we b=
asically
> > > > > > > run sanity checks on the config.
> > > > > >
> > > > > >
> > > > > > Ying's is not applied yet. So, it is not too late.
> > > > > >
> > > > > > But, I started to be a little worried
> > > > > > because it is unpredictable how many KCONFIG_* env
> > > > > > variables will increase until people are satisfied.
> > > > > >
> > > > >
> > > > > Is there really a problem with having those? There are a lot of
> > > > > different env variables affecting different parts of the kernel b=
uild.
> > > > > If they are useful, and even better, allow catching issues quickl=
y,
> > > > > should we favor less options or usefulness for users?
> > > >
> > > >
> > > >
> > > > I am considering how to implement it.
> > > >
> > > >
> > > >
> > > > One way is to add env variables as a new request arises.
> > > >
> > > > Sergey is doing two things by one option.
> > > >
> > > >
> > > >    KCONFIG_WARN_UNKNWON_SYMBOL : warn unknown symbol in input .conf=
ig
> > > > or defconfig
> > > >    KCONFIG_WARN_TO_ERROR       : turn warnings into errors
> > > >
> > > >
> > > >
> > > > Another way is to handle those as command line options.
> > > >
> > > >   -Wunknown-symbol
> > > >   -Werror             (associated with W=3De)
> > > >   -Wall               (associated with W=3D1)
> > > >
> > > >
> > > >
> > > >   $ make W=3D1e olddefconfig
> > > >
> > > >
> > > > will work to sanity check.
> > > >
> > > >
> > >
> > > I see, I think I misunderstood your previous message, sorry. Agreed
> > > that there could be other approaches than an environment variable and
> > > a command line option could definitely work as well. I'll leave the
> > > details to you and Sergey, but ideally we would have something that i=
s
> > > simple to use both in scripts (e.g. distro build systems) and in
> > > manual build for end users
> > >
> > > >
> > > >
> > > >
> > > > > > >
> > > > > > > And one more question: those sanity checks seem very reasonab=
le.
> > > > > > > Is there any reason we would not want to keep them ON by defa=
ult?
> > > > > > > And those brave souls, that do not wish for the tool to very =
that
> > > > > > > the .config is sane and nothing will get downgraded/disabled,=
 can
> > > > > > > always set KCONFIG_SANITY_CHECKS to 0.
> > > > > >
> > > > > >
> > > > > > Kconfig is meant to resolve the dependency without causing an e=
rror.
> > > > > > If a feature is not available, it is automatically, silently hi=
dden,
> > > > > > and that works well.
> > > > >
> > > > > How do you come to the conclusion that it works well? I've heard =
many
> > > > > people unhappy about the way Kconfig works. How does one know tha=
t
> > > > > something is missing (and should maybe be fixed?) if Kconfig sile=
ntly
> > > > > hides it?
> > > >
> > > >
> > > > Kconfig has worked like that for a long time, but I do not know
> > > > how to detect non-existing symbols.
> > > >
> > > >
> > >
> > > I think a tool to detect symbols present in old config, but missing i=
n
> > > new kernel solves the "upgraded config" part of the problem.
> > >
> > > The other part ("new config") would probably be solved by some kind o=
f
> > > a tool that looks at the currently present hardware and spews a list
> > > of Kconfig options together with their dependencies, but arguably
> > > that's not something that would be a part of Kconfig itself.
> > >
> > > For the graphical configuration tools like menuconfig I could imagine
> > > that the options with unmet dependencies could be still displayed but
> > > greyed out, so at least one can open the help for the item and check
> > > which dependencies are missing.
> >
> >
> > Yes. That idea exists, and at least for xconfig,
> > I got a patch to grey out hidden options.
> >
> > https://lore.kernel.org/linux-kbuild/20200708133015.12286-1-maxime.chre=
tien@bootlin.com/
> >
> >
> > I liked the idea, and suggested improvements, but did not receive v2.
> >
> > Maybe I could revisit it when I have some time,
> > but I always have TODOs more than my capacity.
> >
>
> Let me see if I can do something about it. It sounds like a very
> convenient thing, although I'd definitely prefer menuconfig over
> xconfig.

To close the loop, it took me a while to find some time to give it a
stab, but here is a patch:

https://lore.kernel.org/linux-kbuild/20231228054630.3595093-1-tfiga@chromiu=
m.org/T/#u

One thing that may need to be added is a toggle for the new behavior
if there are people who prefer all the options to look the same (or
just the dim text is problematic for some reason).

Best,
Tomasz

