Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11C9619607C
	for <lists+linux-doc@lfdr.de>; Fri, 27 Mar 2020 22:33:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727806AbgC0Vdy (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 27 Mar 2020 17:33:54 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:35401 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727752AbgC0Vdx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 27 Mar 2020 17:33:53 -0400
Received: by mail-lf1-f68.google.com with SMTP id t16so8253221lfl.2
        for <linux-doc@vger.kernel.org>; Fri, 27 Mar 2020 14:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dzvDwMUyG06J3AV5cwO/m7cs6Sh4fmPAAPA7hxTv980=;
        b=gRSIg1QwEzIrjZsOKmca5lM0DJGUPgYdVr2fCBp18i17PUM79/QbUfa9whxB1yleIu
         19uOZ+GytcxmNRc+uGdfToX3iDfx/vj5Kkp0opY6r+xrlOGCbN5MmsDlz21KklP+n7hQ
         MpylNrstB6SstKltT48fN3JOCTPNt4jT6z/fjF0dX9tM8PbnFU0oJer4qREeeUNAKSpX
         6MKL5IavYbzJ1uANrnLVHQGFD6Y5HLW5QSK2FzMDh807/dLrnRAMUw/QJgFrV0cgo2Q+
         Qet9m7dtlAssP+WFw0OjcCXKeYbPU6jo6nm6uKCq3kYu0//UDnT30vx9p2BejYcVUvZh
         ZO1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dzvDwMUyG06J3AV5cwO/m7cs6Sh4fmPAAPA7hxTv980=;
        b=gMRXmHoMbTetb+eA1ObwwYX9V9Jd9S9Auq6hWTdcF+NKz6Oxnp2bKIL7vL4wgOb/yE
         e6FnnEtbxXYB4R0+YC6Ymor44CCP0Ly0910UEIFoIeCO/jzae5LzcNe3opYzsqbMBMEG
         5+EyO6JOCnPOwa+sjzY4Qvpixo3NTksI7/vQTThuAhwM0T31x4dnf6WuOj18nEbCxfhu
         xGIrM+qEJ0e6RKfjFhFSRtkJj5bfBu8rzbkL5+wSKkmBs1XYhL8Bk5Ntj3yOkWCRj+Pc
         kLtIubV5AmkS3Zf+GwrDslbQYefQAYSAlm73na8/vNtgXGoIv31BEvpZQXOiTUKdSloB
         AM3g==
X-Gm-Message-State: AGi0PuYBzuP80EiOX4jW8Lj6B5da3nUdw+KZTJzEyiHQW3uPg7tMGejh
        uR3qKpbBxEpgZIRoN5MhQ1wjZ5daMpfOJHQJ+SIYeshHQ70=
X-Google-Smtp-Source: APiQypLPB2bx74iqYlIDZcf1TI5kqtkeuL4BUeP6Olm1S22lCTiyT7KkrzX0yGdpEq6wWOI9W+VlzHcPMEoWS21Y4Is=
X-Received: by 2002:a19:be92:: with SMTP id o140mr740571lff.217.1585344830265;
 Fri, 27 Mar 2020 14:33:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200324135328.5796-1-geert+renesas@glider.be>
 <20200324135653.6676-1-geert+renesas@glider.be> <20200324135653.6676-5-geert+renesas@glider.be>
 <CACRpkdZuQrPqFPyoop9pv6MVwqwz_C6ZNKMxWqSFXdAMkhbsvQ@mail.gmail.com> <CAMuHMdVpiO+KGRTF=83kubuuJF2p8TJhWe_X32amSTa6bXsCxg@mail.gmail.com>
In-Reply-To: <CAMuHMdVpiO+KGRTF=83kubuuJF2p8TJhWe_X32amSTa6bXsCxg@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 27 Mar 2020 22:33:38 +0100
Message-ID: <CACRpkdaG0Fd7rpfqO6p0j9RL3T-whCof=YewH=rR3Bwe89KeUA@mail.gmail.com>
Subject: Re: [PATCH v6 5/8] gpiolib: Introduce gpiod_set_config()
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Harish Jenny K N <harish_kandiga@mentor.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Alexander Graf <graf@amazon.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Phil Reid <preid@electromag.com.au>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Christoffer Dall <christoffer.dall@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Mar 27, 2020 at 9:45 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Thu, Mar 26, 2020 at 10:26 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> > On Tue, Mar 24, 2020 at 2:57 PM Geert Uytterhoeven
> > <geert+renesas@glider.be> wrote:
> > > The GPIO Aggregator will need a method to forward a .set_config() call
> > > to its parent gpiochip.  This requires obtaining the gpio_chip and
> > > offset for a given gpio_desc.  While gpiod_to_chip() is public,
> > > gpio_chip_hwgpio() is not, so there is currently no method to obtain the
> > > needed GPIO offset parameter.
> > >
> > > Hence introduce a public gpiod_set_config() helper, which invokes the
> > > .set_config() callback through a gpio_desc pointer, like is done for
> > > most other gpio_chip callbacks.
> > >
> > > Rewrite the existing gpiod_set_debounce() helper as a wrapper around
> > > gpiod_set_config(), to avoid duplication.
> > >
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > ---
> > > v6:
> > >   - New.
> >
> > This is nice, I tried to actually just apply this (you also sent some
> > two cleanups that I tried to apply) byt Yue's cleanup patch
> > commit d18fddff061d2796525e6d4a958cb3d30aed8efd
> > "gpiolib: Remove duplicated function gpio_do_set_config()"
> > makes none of them apply :/
>
> /me confused.
>
> That commit was reverted later, so it shouldn't matter.
>
> I have just verified, and both my full series and just this single
> patch, do apply fine to all of current gpio/for-next, linus/master, and
> next-20200327.  They even apply fine to gpio/for-next before or after
> the two cleanups I sent, too.
>
> What am I missing?

Ah I see, it is because my development branch is based on
v5.6-rc1. So I have to merge in a later -rc where this revert
is applied so that this applies.

Yours,
Linus Walleij
