Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B1E51BCEC5
	for <lists+linux-doc@lfdr.de>; Tue, 28 Apr 2020 23:33:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726272AbgD1VdN (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 28 Apr 2020 17:33:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725934AbgD1VdN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 28 Apr 2020 17:33:13 -0400
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com [IPv6:2607:f8b0:4864:20::944])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D92D8C03C1AC
        for <linux-doc@vger.kernel.org>; Tue, 28 Apr 2020 14:33:12 -0700 (PDT)
Received: by mail-ua1-x944.google.com with SMTP id t8so126824uap.3
        for <linux-doc@vger.kernel.org>; Tue, 28 Apr 2020 14:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=De9un6BJ2p4x3KGWjUlROhvJ0MQt7eKKFJEAHbkYVKo=;
        b=Q164BEzQpMCO+yXR5UTZKVBBSmsRxOmAyN/KrF3t7TxsTwMmrQgCsqsuZL+BeMJL03
         XecUGYvDtMil6cTU9seGNu+kDsVffn8AP7rW5uFNrhocyNYZybOPErY5sXsUxUhf0DiW
         9pUAv3ehkC7LHPm8Cfr3GXeTslc09VpGfVEKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=De9un6BJ2p4x3KGWjUlROhvJ0MQt7eKKFJEAHbkYVKo=;
        b=RIDUEIH6w/ZCi11igtEwXxp0lt3MK+LvRHAiHE3LhO06B2saHhlV6PqU5lEOJHGVm9
         Bh9QY8uKZq1SuE57uV6uCsDZMkWB0+CdCaYcm4xdsXeZ/G0ae6+5wL3Az0/cPFfThjdO
         mCpUdCZMtvvi0PHA/c+pNniKSB0Y8pUUUUVXbTbGaueYgr5OGXMtL7ZHVGa2uGk69O20
         XoKj3B/3M8GPu5LDDHqJGYvXsc4wrE4ipK8N0AIFn4elIuX1uNc4N11PA5ovmbMaRdCt
         wB5ZlzzWCmrTXjw6jZis6L+UN9C5V80CMHten2zaaeTwApWRjyZdFdhk3viMWbKAN3lv
         wH7A==
X-Gm-Message-State: AGi0PuYsIZnONyIS3F0fl37e0V/CIGqb9gSIbS9RKvfiaTc5oNA/DigC
        bI97uDB2wuWykliRvWraY6APW09Yahk=
X-Google-Smtp-Source: APiQypKsmXMCfy1fLbzZg3HHG0BLReEfIM+IPD44/ptg11qs9YBScfUzUAJdTBsXif3ZvgWElFXu7A==
X-Received: by 2002:a67:ec4a:: with SMTP id z10mr20956304vso.125.1588109591826;
        Tue, 28 Apr 2020 14:33:11 -0700 (PDT)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id d205sm685632vkd.36.2020.04.28.14.33.11
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2020 14:33:11 -0700 (PDT)
Received: by mail-vk1-f181.google.com with SMTP id d6so109827vko.4
        for <linux-doc@vger.kernel.org>; Tue, 28 Apr 2020 14:33:11 -0700 (PDT)
X-Received: by 2002:a67:c40c:: with SMTP id c12mr23285523vsk.106.1588109589393;
 Tue, 28 Apr 2020 14:33:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200421211447.193860-1-dianders@chromium.org>
 <20200421141234.v2.7.I7d5eb42c6180c831d47aef1af44d0b8be3fac559@changeid> <20200427164619.kw4mihmoxmxzjk66@holly.lan>
In-Reply-To: <20200427164619.kw4mihmoxmxzjk66@holly.lan>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 28 Apr 2020 14:32:57 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W9nZKOB8powEuSecnwkDA01YR0c2uNY87+nV8+5jZZug@mail.gmail.com>
Message-ID: <CAD=FV=W9nZKOB8powEuSecnwkDA01YR0c2uNY87+nV8+5jZZug@mail.gmail.com>
Subject: Re: [PATCH v2 7/9] Documentation: kgdboc: Document new
 earlycon_kgdboc parameter
To:     Daniel Thompson <daniel.thompson@linaro.org>
Cc:     Jason Wessel <jason.wessel@windriver.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        kgdb-bugreport@lists.sourceforge.net,
        Ingo Molnar <mingo@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>, bp@alien8.de,
        linux-serial@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Frank Rowand <frowand.list@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jiri Slaby <jslaby@suse.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Will Deacon <will@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Borislav Petkov <bp@suse.de>, Juergen Gross <jgross@suse.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On Mon, Apr 27, 2020 at 9:46 AM Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> On Tue, Apr 21, 2020 at 02:14:45PM -0700, Douglas Anderson wrote:
> > The recent patch ("kgdboc: Add earlycon_kgdboc to support early kgdb
> > using boot consoles") adds a new kernel command line parameter.
> > Document it.
> >
> > Note that the patch adding the feature does some comparing/contrasting
> > of "earlycon_kgdboc" vs. the existing "ekgdboc".  See that patch for
> > more details, but briefly "ekgdboc" can be used _instead_ of "kgdboc"
> > and just makes "kgdboc" do its normal initialization early (only works
> > if your tty driver is already ready).  The new "earlycon_kgdboc" works
> > in combination with "kgdboc" and is backed by boot consoles.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> > Changes in v2: None
> >
> >  .../admin-guide/kernel-parameters.txt         | 20 +++++++++++++++++++
> >  Documentation/dev-tools/kgdb.rst              | 14 +++++++++++++
> >  2 files changed, 34 insertions(+)
> >
> > diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> > index f2a93c8679e8..588625ec2993 100644
> > --- a/Documentation/admin-guide/kernel-parameters.txt
> > +++ b/Documentation/admin-guide/kernel-parameters.txt
> > @@ -1132,6 +1132,22 @@
> >                       address must be provided, and the serial port must
> >                       already be setup and configured.
> >
> > +     earlycon_kgdboc=        [KGDB,HW]
> > +                     If the boot console provides the ability to read
> > +                     characters and can work in polling mode, you can use
> > +                     this parameter to tell kgdb to use it as a backend
> > +                     until the normal console is registered. Intended to
> > +                     be used together with the kgdboc parameter which
> > +                     specifies the normal console to transition to.
> > +
> > +                     The the name of the early console should be specified
> > +                     as the value of this parameter. Note that the name of
> > +                     the early console might be different than the tty
> > +                     name passed to kgdboc. If only one boot console with
> > +                     a read() function is enabled it's OK to leave the
> > +                     value blank and the first boot console that implements
> > +                     read() will be picked.
>
> There's no need for the "If only one boot console with a read()
> funcuiton is enabled" here,
>
> Seeing this in alphabetic order in this patch it also crosses my mind
> that kgdboc_earlycon might be a better name so that is sorts closer
> to the other kgdb options. This is a kgdboc feature that uses earlycon
> not an earlycon feature that uses kgdboc.

OK.  'git format-patch', sed, and 'git am' for the win.


> > +
> >       earlyprintk=    [X86,SH,ARM,M68k,S390]
> >                       earlyprintk=vga
> >                       earlyprintk=sclp
> > @@ -1190,6 +1206,10 @@
> >                       This is designed to be used in conjunction with
> >                       the boot argument: earlyprintk=vga
> >
> > +                     This parameter works in place of the kgdboc parameter
> > +                     but can only be used if the backing tty is available
> > +                     very early in the boot process.
> > +
>
> I wonder if pragmatic advice is more useful:
>
>   For early debugging via a serial port see earlycon_kgdboc instead.

Done.


> >       edd=            [EDD]
> >                       Format: {"off" | "on" | "skip[mbr]"}
> >
> > diff --git a/Documentation/dev-tools/kgdb.rst b/Documentation/dev-tools/kgdb.rst
> > index d38be58f872a..c0b321403d9a 100644
> > --- a/Documentation/dev-tools/kgdb.rst
> > +++ b/Documentation/dev-tools/kgdb.rst
> > @@ -274,6 +274,20 @@ don't like this are to hack gdb to send the :kbd:`SysRq-G` for you as well as
> >  on the initial connect, or to use a debugger proxy that allows an
> >  unmodified gdb to do the debugging.
> >
> > +Kernel parameter: ``earlycon_kgdboc``
> > +-------------------------------------
> > +
> > +If you specify the kernel parameter ``earlycon_kgdboc`` and your serial
> > +driver registers a boot console that supports polling (doesn't need
> > +interrupts and implements a nonblocking read() function) kgdb will attempt
> > +to work using the boot console until it can transition to the regular
> > +tty driver specified by the ``kgdboc`` parameter.
> > +
> > +Normally there is only one boot console (especially that implements the
> > +read() function) so just adding ``earlycon_kgdboc`` on its own is
> > +sufficient to make this work.  If you have more than one boot console you
> > +can add the boot console's name to differentiate.
> > +
>
> I think we need an example here. The example in the patch header for
> the previous patch was useful (at least for me).

Done.
