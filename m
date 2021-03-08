Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8D703311DD
	for <lists+linux-doc@lfdr.de>; Mon,  8 Mar 2021 16:14:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230144AbhCHPOG (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 8 Mar 2021 10:14:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230440AbhCHPNp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 8 Mar 2021 10:13:45 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F15FC06175F
        for <linux-doc@vger.kernel.org>; Mon,  8 Mar 2021 07:13:45 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id b7so15236473edz.8
        for <linux-doc@vger.kernel.org>; Mon, 08 Mar 2021 07:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UxI0+0pA6hdqL66mFw/aL7E3tqFzlN/0V87Y8dO+dYE=;
        b=UpPJMT5ZopEuCtzpzVsg/vaiXVkVA5Htpk52k7Vwu3CSSQCqZrcL02bNcaomKYSUII
         bcCbiES60T2QEUofBw6HJexKJ6J+AIceLXgf2p7Ze76J3beMSb7EyZWvhLWMX3IpP2pa
         zlkhibYGqRRagI+x6LLN4f7Wqx0XicPIHan9r5blJqteY2ms4B4QAoQzMYqm+SdXMznn
         8CI7gdC6LTMJXYzCHVimCKIBow4G1EZSijPl8MvDpnEXK94+fUGfXU6phJBKM14ElpbN
         yVo5ZDkU8ofWXUfN67LGTYiKyTlTDY768vIoYa/hi5XN7r1yNlvqPzaFy4G9+C5wdVhG
         aEaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UxI0+0pA6hdqL66mFw/aL7E3tqFzlN/0V87Y8dO+dYE=;
        b=J7ARd/NYXgAHYGxn0kd8kw6C2hi1Jr8MUHrPO9wTlGjnn7Knq5U0LzXvGtLcn9jjKa
         VEpZ04C+wamTbTHzYDs6Y52jL7IgFTuVzoEgz6dHR0whVi9jRYPsH18xWSByuAi9hk3Z
         yC2Q4LdiAFt/TzMpUaIwWo22KpcghuEjQPliFaFQ+hTmh+eoNXc2VicKvd0pJsiQL5Lk
         yGS5kMLqAV/RzD2IFh3wLbgSdxPS4g0CyH3mO64D0YPP475zz61x/sTwocVQzxUuM54F
         7xLugpOE1vz2K3O02ugJM3HYzCeZwNZwsUNqIVm826fLM5JBRC+Fn9WVk+PooLBHa9lI
         +aWw==
X-Gm-Message-State: AOAM531Na5Rism+isqmTuoMSOwUFuiPseYBJEkerdQaDZu6Du5Rtpffl
        AOyaWG9nPq+MdPbh7X36OQbnBty0/lPpDzz2vmSY8g==
X-Google-Smtp-Source: ABdhPJz972n1M9l8sjy7+Bqpm3MgGcln6axCSK8ToPji3J+crFfFlREkJB+prRLT4jTvXcfT2iha3njPubQxqmSA/mw=
X-Received: by 2002:a05:6402:17d6:: with SMTP id s22mr22398572edy.232.1615216424076;
 Mon, 08 Mar 2021 07:13:44 -0800 (PST)
MIME-Version: 1.0
References: <20210304102452.21726-1-brgl@bgdev.pl> <20210304102452.21726-10-brgl@bgdev.pl>
 <YEDdbfbM9abHJpIO@smile.fi.intel.com> <CAMRc=MdRxXzoZuyLs-24dXfOft=OQqDneTHa4-ZKqFE1kMBWcg@mail.gmail.com>
 <YEIE1nG8lZ4V2MXq@smile.fi.intel.com> <CAMRc=MekGnK17rYf3Bx_UHumVVrpmJphOnMfO352NB9SaOJCGw@mail.gmail.com>
 <YEY9DFk6NEcnEWGE@smile.fi.intel.com>
In-Reply-To: <YEY9DFk6NEcnEWGE@smile.fi.intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 8 Mar 2021 16:13:33 +0100
Message-ID: <CAMpxmJVTUfveuaY9yhP5PLXoOdrkYQ2WbE5-P+4XRi3=VdQKjg@mail.gmail.com>
Subject: Re: [PATCH v2 09/12] gpio: sim: new testing module
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Joel Becker <jlbec@evilplan.org>,
        Christoph Hellwig <hch@lst.de>, Shuah Khan <shuah@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Kent Gibson <warthog618@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-doc <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Mar 8, 2021 at 4:05 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Mar 08, 2021 at 03:23:31PM +0100, Bartosz Golaszewski wrote:
> > On Fri, Mar 5, 2021 at 11:15 AM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Thu, Mar 04, 2021 at 09:15:29PM +0100, Bartosz Golaszewski wrote:
> > > > On Thu, Mar 4, 2021 at 2:15 PM Andy Shevchenko
> > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > On Thu, Mar 04, 2021 at 11:24:49AM +0100, Bartosz Golaszewski wrote:
> > > > > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> > > > > > +
> > > > > > +     /*
> > > > > > +      * FIXME If anyone knows a better way to parse that - please let me
> > > > > > +      * know.
> > > > > > +      */
> > > > >
> > > > > If comma can be replaced with ' ' (space) then why not to use next_arg() from
> > > > > cmdline.c? I.o.w. do you have strong opinion why should we use comma here?
> > > > >
> > > >
> > > > My opinion is not very strong but I wanted to make the list of names
> > > > resemble what we pass to the gpio-line-names property in device tree.
> > > > Doesn't next_arg() react differently to string of the form: "foo=bar"?
> > >
> > > It's ambiguous here.
> > >
> > > So, the strings '"foo=bar"' and 'foo=bar' (w/o single quotes!) are indeed
> > > parsed differently, i.e.
> > >         '"foo=bar"' -> 'foo=bar',
> > > while
> > >         "foo=bar" -> 'foo' + 'bar'.
> > >
> >
> > IMO '"foo", "bar", "", "foobar"' looks better than '"foo" "bar" ""
> > "foobar"' and I'm also not sure next_arg will understand an empty
> > quote?
>
> I guess it understands it. But I agree that comma-separated it would look
> better.
>
> > If you're not objecting strongly, then I would prefer my version.
>
> I have strong opinion not to open code "yet another parser".
>
> So, grepping on 'strsep(.*, ",")' shows a lot of code that wants something like
> this. Interesting are the net/9p cases. This in particular pointed out to
> lib/parser.c which in turn shows promising match_strlcpy() / match_strdup(). I
> haven't looked deeply though.
>
> That said, I agree that next_arg() is not the best here.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Shall we revisit this once it's upstream with a generalization for
separating comma separated strings?

Bart
