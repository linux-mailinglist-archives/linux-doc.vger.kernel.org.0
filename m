Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8875A207CCD
	for <lists+linux-doc@lfdr.de>; Wed, 24 Jun 2020 22:20:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391394AbgFXUUs (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 24 Jun 2020 16:20:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391330AbgFXUUr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 24 Jun 2020 16:20:47 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41C28C0613ED
        for <linux-doc@vger.kernel.org>; Wed, 24 Jun 2020 13:20:47 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id x207so1723062pfc.5
        for <linux-doc@vger.kernel.org>; Wed, 24 Jun 2020 13:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6VX8l56o/9phg5oRAnfBhOhnSRSgx40667vVlnrgP1c=;
        b=Sts5HjeXaRIsjaUUSOulF2b0QJW/rtbjE50f2+QWQIT17OrFkVY+Z2bpYbafSTBuhE
         jxvDPfNLBtSH2Ou4l6yD3zA3bSURrtxiM0TzakQ0Cyg+LVoz4iXNXXrN/3Pk6/icJOul
         Z16sTB6L0/w6Dq6u/vlp+QWuyJg235QG/tvM1E3K4IedKvz3c0z9c6NfrN/bbHZ5G8fY
         wgIDX2Wo3ZlTsNzOZMWvutvhS1YdbOeKKZVcOA3R3ompjsm/GmA4l7JPIX1erW80E4Xe
         f7WqejKmK1rE7yp57rosd315QgC4GDBxxpJty94hEmaRpg571BdsL0lc7su+QmaUVxdz
         A0Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6VX8l56o/9phg5oRAnfBhOhnSRSgx40667vVlnrgP1c=;
        b=A4HjQ03d/dU/yw5yJPxarfl3wS8EYeiA4L/ael1W76iQOuX1CT6u5blbvwWEUmx6rc
         Og4i+dIJ7F1aj696O6G07BGzoYmoNPxoOBLDKUzE4RQp7lUMd0zKm4nj21d1Gm5hLeyL
         cUoRgEpvyRrKqvuXyfN4hetO3gnYQuYbYLm2vyQRLJfDUzL+04qUJOBkYhossdHfRaaX
         /rWXNPtKY0ZJztoFb7DSkKF9XoUAqthUt5eXt252sAAJcu3XxO5MLAYN/n6+2TJ1hGMe
         i1lbqvSJ/7MqzrBFVJL7C/XclyfDN5ykPYX7u75fZm4XIUUFAgt4Ar/H7RFL6hkPO8Sd
         9jpw==
X-Gm-Message-State: AOAM5304qLaLzwIJfvpYVKICipPNNw+2UZ/Z/bS+cl8Osui5OeM2Hi+E
        tJ0NQ+XxcoA2fhl1jkv+lMSfSfr7Lx2u91ZgPYZPNQ==
X-Google-Smtp-Source: ABdhPJyrliHHssGy3danayvmx9aPSjdbjHWaiTrvgu7jCsDLKzKm48Geyd4LzOvmXoNzU9YMecGFnsoNN/nEaFMMSFU=
X-Received: by 2002:aa7:979b:: with SMTP id o27mr29432985pfp.284.1593030046391;
 Wed, 24 Jun 2020 13:20:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200228012036.15682-5-brendanhiggins@google.com> <202003021439.A6B6FD8@keescook>
In-Reply-To: <202003021439.A6B6FD8@keescook>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Wed, 24 Jun 2020 13:20:35 -0700
Message-ID: <CAFd5g45Jz-5wtO-YNuqPN2Zc_rJtoA1qbPLVs2wrJFQyZpd5QQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] init: main: add KUnit to kernel init
To:     Kees Cook <keescook@chromium.org>
Cc:     Frank Rowand <frowand.list@gmail.com>,
        Jeff Dike <jdike@addtoit.com>,
        Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Alan Maguire <alan.maguire@oracle.com>,
        Iurii Zaikin <yzaikin@google.com>,
        David Gow <davidgow@google.com>,
        Andrew Morton <akpm@linux-foundation.org>, rppt@linux.ibm.com,
        Greg KH <gregkh@linuxfoundation.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Logan Gunthorpe <logang@deltatee.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        linux-um <linux-um@lists.infradead.org>,
        linux-arch@vger.kernel.org,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        KUnit Development <kunit-dev@googlegroups.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Mar 2, 2020 at 2:45 PM Kees Cook <keescook@chromium.org> wrote:

Sorry it took so long to respond. I am reviving this patchset now,
about to send out a new revision and I just saw this comment.

> On 2/27/20 7:20 PM, Brendan Higgins wrote:
> > Remove KUnit from init calls entirely, instead call directly from
> > kernel_init().
> >
> > Co-developed-by: Alan Maguire <alan.maguire@oracle.com>
> > Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
> > Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> > Reviewed-by: Stephen Boyd <sboyd@kernel.org>
> > [...]
> > diff --git a/init/main.c b/init/main.c
> > index ee4947af823f3..7875a5c486dc4 100644
> > --- a/init/main.c
> > +++ b/init/main.c
> > @@ -104,6 +104,8 @@
> >  #define CREATE_TRACE_POINTS
> >  #include <trace/events/initcall.h>
> >
> > +#include <kunit/test.h>
> > +
> >  static int kernel_init(void *);
> >
> >  extern void init_IRQ(void);
> > @@ -1444,6 +1446,8 @@ static noinline void __init kernel_init_freeable(void)
> >
> >       do_basic_setup();
> >
> > +     kunit_run_all_tests();
> > +
> >       console_on_rootfs();
> >
> >       /*
>
> I'm nervous about this happening before two key pieces of the kernel
> setup, which might lead to weird timing-sensitive bugs or false
> positives:
>         async_synchronize_full()
>         mark_readonly()
>
> Now, I realize kunit tests _should_ be self-contained, but this seems
> like a possible robustness problem. Is there any reason this can't be
> moved after rcu_end_inkernel_boot() in kernel_init() instead?

I tried that, but it doesn't work without an initramfs. We could add
an initramfs for KUnit at some point if highly desired, but I think
that is outside the scope of this patchset. Additionally, this patch
actually moves running tests to later in the init process, which is
still an improvement over the way KUnit works today.

There are some other reasons I wouldn't want to make that change right
now, which will become apparent in a patch that I will send out in
short order.

Cheers
