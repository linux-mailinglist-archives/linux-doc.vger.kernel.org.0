Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FED030A36D
	for <lists+linux-doc@lfdr.de>; Mon,  1 Feb 2021 09:38:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232543AbhBAIia (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 1 Feb 2021 03:38:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232552AbhBAIiX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 1 Feb 2021 03:38:23 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 786EFC061574
        for <linux-doc@vger.kernel.org>; Mon,  1 Feb 2021 00:37:43 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id y9so1427755ejp.10
        for <linux-doc@vger.kernel.org>; Mon, 01 Feb 2021 00:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=xpUA4tQkXNeG9xtZvt8WotR4TDH6DJJdjLxiEPVNVP4=;
        b=E25H5NyvBv+rR9x8HIOsCMCpG3jpr/TmGdn6lrOg1acyCXThOTfgeHQMo9txJ1oLcu
         Cc9AcfS95/01gFk7GbSx0Yh93k7nzQcZ8+tAyPR380PEOS3lmf6WQASQKOFh7h9dvfg9
         up1JkSwDtnD9l3ncrjfkkxfEuHvoUgk5RDhFItRW+UrbyJ23JeiVSQ1ghWSYUtZo4vtA
         3dmx3IJrn7HkgOnriuKu8mPoE4GrlURv1jHaRUK9ct265ATmz6sUzX99ts689E7BS9NU
         fLUfj0BSXiGAgggYLWm8h3DazLmip6bVzMOUv6/uJAhtqGFqJUMZZ7g2aDxgamDKSNBE
         1+Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=xpUA4tQkXNeG9xtZvt8WotR4TDH6DJJdjLxiEPVNVP4=;
        b=kIjtyHJrkiGvfIXg9TjaeFUl+K34bxkesY1sOAaspKthkITU6s7G4FnBc6XwnH8r7n
         2y1y/wnUZ77UXDXrYQnbiXQs0ZoSJXhFI4ZQM1u4zhO+mqFySD1VI9CSMg8mtnfpfg90
         Db5CA850XoZvu7Wpt06jyAvFZiaVimboKlzgNjcFzfp4iJiCXENfpvCYip64tg+RdZsZ
         GoWw7LIh3enbKBs7eindf0PjvkxcpQSFsNG294pnS9HLGXqja9v6dFvLF8gfqyu131zp
         ari2Ep+sE0sznl1INSfIzSzA8r8f8ATAtbNp8P1bc6SdPSL+QCJ1pRJ5r3LFZigVF3nW
         aEuQ==
X-Gm-Message-State: AOAM532IlBbuN+1/Y3UoGTCJZv8SP4AiA2dFFgUlrxGk4Wawi6JHoJgT
        tvHs45EVsNN+6xgtuRylgqGi+Z+LvOds/hCRda33mA==
X-Google-Smtp-Source: ABdhPJwY2quGjJdmByP+gMuoEbYEH34iJnCL9i9KVMyKc4bRYauNJYZpzjBnXt2wBEzF3EzPvzdi26YZ8JANKfkXC1M=
X-Received: by 2002:a17:906:eddd:: with SMTP id sb29mr7734704ejb.383.1612168661707;
 Mon, 01 Feb 2021 00:37:41 -0800 (PST)
MIME-Version: 1.0
References: <20210129134624.9247-1-brgl@bgdev.pl> <20210130212009.2uugdj6vmisegau2@pengutronix.de>
In-Reply-To: <20210130212009.2uugdj6vmisegau2@pengutronix.de>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 1 Feb 2021 09:37:30 +0100
Message-ID: <CAMRc=MdwoJCw1-BdNRnfRFaXYfZD0+vn_8yq0J+rshHqZMdDXQ@mail.gmail.com>
Subject: Re: [PATCH 0/8] gpio: implement the configfs testing module
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Joel Becker <jlbec@evilplan.org>,
        Christoph Hellwig <hch@lst.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Kent Gibson <warthog618@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-doc <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Jan 30, 2021 at 10:20 PM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> Hello,
>
> On Fri, Jan 29, 2021 at 02:46:16PM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > This series adds a new GPIO testing module based on configfs committabl=
e items
> > and sysfs. The goal is to provide a testing driver that will be configu=
rable
> > at runtime (won't need module reload) and easily extensible. The contro=
l over
> > the attributes is also much more fine-grained than in gpio-mockup.
> >
> > I am aware that Uwe submitted a virtual driver called gpio-simulator so=
me time
> > ago and I was against merging it as it wasn't much different from gpio-=
mockup.
> > I would ideally want to have a single testing driver to maintain so I a=
m
> > proposing this module as a replacement for gpio-mockup but since selfte=
sts
> > and libgpiod depend on it and it also has users in the community, we ca=
n't
> > outright remove it until everyone switched to the new interface. As for=
 Uwe's
> > idea for linking two simulated chips so that one controls the other - w=
hile
> > I prefer to have an independent code path for controlling the lines (he=
nce
> > the sysfs attributes), I'm open to implementing it in this new driver. =
It
> > should be much more feature friendly thanks to configfs than gpio-mocku=
p.
>
> Funny you still think about my simulator driver. I recently thought

It's because I always feel bad when I refuse to merge someone's hard work.

> about reanimating it for my private use. The idea was to implement a
> rotary-encoder driver (that contrast to
> drivers/input/misc/rotary_encoder.c really implements an encoder and not
> a decoder). With the two linked chips I can plug
> drivers/input/misc/rotary_encoder.c on one side and my encoder on the
> other to test both drivers completely in software.
>
> I didn't look into your driver yet, but getting such a driver into
> mainline would be very welcome!
>

My idea for linking chips (although that's not implemented yet) is an
attribute in each configfs group called 'link' or something like that,
that would take as argument the name of the chip to link to making the
'linker' the input and the 'linkee' the output.

It would be tempting to use symbolic links too but I'm afraid this
would need further extension of configfs.

> I intend to look into your driver next week, but please don't hold back
> on merging for my feedback.
>

Don't worry, I'm not really aiming at v5.12 with this.

> Best regards
> Uwe
>

Bart
