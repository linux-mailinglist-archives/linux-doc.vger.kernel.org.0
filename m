Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFD3C25811C
	for <lists+linux-doc@lfdr.de>; Mon, 31 Aug 2020 20:32:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729257AbgHaScF (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 31 Aug 2020 14:32:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726174AbgHaScE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 31 Aug 2020 14:32:04 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9D3EC061573
        for <linux-doc@vger.kernel.org>; Mon, 31 Aug 2020 11:32:03 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id m6so4706420wrn.0
        for <linux-doc@vger.kernel.org>; Mon, 31 Aug 2020 11:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=/ZFV5OhR4lC3CDEKGvIih7tt3e4EfiSPTJ9kPq158BY=;
        b=EZ/RE6qqu7G3Fmz+/u860xOlABVaOjwocu5TV+Fm2IKH/e3MSwCnOs0xn6rj2d/XCn
         tUvXRBNRF5hzeybcQFsw4FU0nRsyeSAhJhlKMezhnBPlRZ0vO+QjrwVYltyAIHXEASIM
         gl5nRHoU6KFYbot0g/RQRWfzKiv66HkuZdYRhwYwc9wMALevbBJLBlWV11TeiRR6CWzJ
         CwY3p7gXBFmX6D9imEXLEem6tmuzEpUvo6qjySDEH3Ps2N0cp5oKulIZIVX45D6Cz+lt
         40Odn+lv8PATf/Iv+Xk299AFYMNXtG8fplExOQXl+jkRxbBhv0ezzrBbscFtxlZ2C646
         S3Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=/ZFV5OhR4lC3CDEKGvIih7tt3e4EfiSPTJ9kPq158BY=;
        b=X5TPRO7xG4oVTSPPeeqyhEDpPXo6VKIaojFbTDNWQxFuf019l7PrFZJYExUhJnsUsN
         BTqUeS2EBMu1w5r70mUMS6M5Gy2xz/ZwOmhBjp0NY5/1moGGwEZLwY+1UsPBmuLxR5hM
         a6/trLwABtKD0gEqJbn6Tdt/nCmgdVkNL/ieJ01LTNV35qnUTmeTUpIwa+Iewu8Y6Z2i
         zkBOwuwUk3J2KJXMTNLn4wfV1Gg0nncJRdABY1SHzGTRu5mLXceskZEfYoVj0A+gIsZc
         jFpUNG8fnJ7Q5ZV5okE53XP8LQAhvEuFapEiN9IrADvQdV8I43f62MJO4h71BEcU2r9A
         XXgg==
X-Gm-Message-State: AOAM532HM1L0aVcYqZweP6TtpSve/dIW3qJpdB0NSTYBSqPYB51BmuV4
        YnpCHWeV8BM/ZpxLaut+buzkM0aneq4dYHamtcKLdg==
X-Google-Smtp-Source: ABdhPJz0BghDHQACx6mv+1qWTLE4jnnjQtAR2MSFlnYkFTJB+1+N6USPsX0n6iz6zIpOuLimAK8t9xOGDautZX4xDWk=
X-Received: by 2002:adf:db52:: with SMTP id f18mr2708925wrj.397.1598898722363;
 Mon, 31 Aug 2020 11:32:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200828141344.2277088-1-alinde@google.com> <CAC5umyiNw7FA__Y3HZ1UEG8Y6uQDgAWHTJpOVf7okERzpCjnRg@mail.gmail.com>
 <CAG_fn=XDTWYbxb1Hy1p0hdOtOejZPWvDXfitysK7wUOsPAE_XQ@mail.gmail.com> <CAC5umyhmZmM4+FVDsyDzaUOpFsqd=RTopEpFuuMgnpQ+rzb1ZQ@mail.gmail.com>
In-Reply-To: <CAC5umyhmZmM4+FVDsyDzaUOpFsqd=RTopEpFuuMgnpQ+rzb1ZQ@mail.gmail.com>
From:   Alexander Potapenko <glider@google.com>
Date:   Mon, 31 Aug 2020 20:31:51 +0200
Message-ID: <CAG_fn=WK8P5ytLtPAzW1FswTz1OcTkfyB4pmUYJWWmjWYAm21Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] add fault injection to user memory access
To:     Akinobu Mita <akinobu.mita@gmail.com>
Cc:     Albert Linde <albert.linde@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Borislav Petkov <bp@alien8.de>, Ingo Molnar <mingo@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Arnd Bergmann <arnd@arndb.de>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Andrey Konovalov <andreyknvl@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Marco Elver <elver@google.com>, linux-doc@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        Linux-Arch <linux-arch@vger.kernel.org>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        Albert van der Linde <alinde@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Andrew,

On Mon, Aug 31, 2020 at 6:27 PM Akinobu Mita <akinobu.mita@gmail.com> wrote=
:
>
> Andrew,
>
> Could you take a look at this series, and consider taking in -mm tree?

Please consider picking v3 patches that address Peter's comments instead.

>
> 2020=E5=B9=B49=E6=9C=881=E6=97=A5(=E7=81=AB) 0:49 Alexander Potapenko <gl=
ider@google.com>:
> >
> > > This series looks good to me.
> >
> > Great!
> >
> > Which tree do fault injection patches normally go to?
> >
> > > Reviewed-by: Akinobu Mita <akinobu.mita@gmail.com>
> >
> > Reviewed-by: Alexander Potapenko <glider@google.com>



--=20
Alexander Potapenko
Software Engineer

Google Germany GmbH
Erika-Mann-Stra=C3=9Fe, 33
80636 M=C3=BCnchen

Gesch=C3=A4ftsf=C3=BChrer: Paul Manicle, Halimah DeLaine Prado
Registergericht und -nummer: Hamburg, HRB 86891
Sitz der Gesellschaft: Hamburg
