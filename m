Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7F1C12FFB8
	for <lists+linux-doc@lfdr.de>; Sat,  4 Jan 2020 01:38:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726229AbgADAiv (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 3 Jan 2020 19:38:51 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:47030 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726703AbgADAiv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 3 Jan 2020 19:38:51 -0500
Received: by mail-lf1-f65.google.com with SMTP id f15so32888100lfl.13
        for <linux-doc@vger.kernel.org>; Fri, 03 Jan 2020 16:38:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7uC7JWFx9OYNnl310U+ygwv67SYyeHmDQsyNae/VGhA=;
        b=MuL59PMNVVu75FiAbIkclAny8nz760/4Z2GfHF30DCsopTe93BZOBYrLPjR6gD61X2
         Ia+4C7u+qJ4p2FyZtfAjId1AXzKlKxic1WMzqQg3NK3gBNXV+ez2toaBlaN1/drja0og
         tIKURSFgHmO9j4DdW9Kg1qqGdU8X4KroveTVqF1A7gOlP2tT27bciMW13pYilBQg6pZn
         a+2PY4wz/bporm9hUJNRMPypAoDIa3/U2adVPtQMJv9LEO7KBcF8N+TWsqrpBnJmw+aM
         gkmDtXdZ7UfMFin1mBsGFfPqu0VvKDX866NlPztG0aOz3SZpNjkSJgcIgQz5IArawDNs
         HyBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7uC7JWFx9OYNnl310U+ygwv67SYyeHmDQsyNae/VGhA=;
        b=rMK/lyv66c3KLqDPU9ZPdJYBqytG297xDWRrU/Fsi/uSnrF2bDU7hC8q5CKzAaR15X
         TT/GixiVjXYrVyfWWRwpzm/TyW5wT+YZYjplNHXIqoe30eaTfsAObTR1WQ1hOOhICQ3W
         quxYrTGugojaZhVLeHmD+uzo7mcUQgOUrLB323V3Sk82ZoYB5M3Sdqh16YVfVT3dC4/M
         PfcpD1Y1PdXBkcf4AlPoOxlJ1l7XrJuacAq5pWg+5u3jRZXcJK47H+IeI39Q02MUUOZd
         11eMl8qbjhZrG3rxXQtrv8/sd3Z2bQWsb7HdAYU1iHGPNQSYzyJvIAgep1SD0NqpGXVT
         ymyg==
X-Gm-Message-State: APjAAAXDAZ2TfPNlWG9Syc95pyJXhVEPhEqJT1EoU4ckCm0gDUC4dD8/
        7nalSHSsJn1XIbqzKQEvYWeV+YHuTUcOlQzyO+FK7A==
X-Google-Smtp-Source: APXvYqx7qnNmzEGHh3l0ybIURRNlv3h+0jMWrPNsddLXYBAWaFoIfBU2PrBmBZ6fwZizOYviRGZkOY/zqCQGjuwVAnQ=
X-Received: by 2002:a19:c0b:: with SMTP id 11mr52456055lfm.135.1578098329258;
 Fri, 03 Jan 2020 16:38:49 -0800 (PST)
MIME-Version: 1.0
References: <20191127084253.16356-1-geert+renesas@glider.be>
 <20191127084253.16356-6-geert+renesas@glider.be> <CACRpkdaW7nmpE99FAvBDBTmkTZOTQ5WdM=JbMzBTLk7cbLRXPw@mail.gmail.com>
 <CAMuHMdVbk5S__8OK-zNXmiW66=WVA8Jzyc=hUvf_hJSU=u9TFg@mail.gmail.com>
In-Reply-To: <CAMuHMdVbk5S__8OK-zNXmiW66=WVA8Jzyc=hUvf_hJSU=u9TFg@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 4 Jan 2020 01:38:38 +0100
Message-ID: <CACRpkda8QD_tDA=YVDRNVnHd8QHs-yHBTzZuJHsnocgMdxv9cA@mail.gmail.com>
Subject: Re: [PATCH v3 5/7] gpio: Add GPIO Aggregator/Repeater driver
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Harish Jenny K N <harish_kandiga@mentor.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Alexander Graf <graf@amazon.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Phil Reid <preid@electromag.com.au>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Christoffer Dall <christoffer.dall@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Sorry for slowness... christmas.

On Thu, Dec 12, 2019 at 4:24 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Thu, Dec 12, 2019 at 3:34 PM Linus Walleij <linus.walleij@linaro.org> wrote:

> > > +         This can serve the following purposes:
> > > +           1. Assign a collection of GPIOs to a user, or export them to a
> > > +              virtual machine,
> >
> > This is ambiguous. What is a "user"? A process calling from
> > userspace? A device tree node?
>
> A user is an entity with a UID, typically listed in /etc/passwd.
> This is similar to letting some, not all, people on the machine access
> the CD-ROM drive.

Ah I get it. Maybe we can say "assign permissions for a collection
of GPIOs to a user".

> > I would write "assign a collection of GPIO lines from any lines on
> > existing physical GPIO chips to form a new virtual GPIO chip"
> >
> > That should be to the point, right?
>
> Yes, that's WHAT it does. The WHY is the granular access control.

So I guess we can write both?

> > > +           3. Provide a generic driver for a GPIO-operated device, to be
> > > +               controlled from userspace using the GPIO chardev interface.
> >
> > I don't understand this, it needs to be elaborated. What is meant
> > by a "GPIO-operated device" in this context? Example?
>
> E.g. a motor. Or a door opener.
>
>         door-opener {
>                 compatible = "mydoor,opener";
>
>                 gpios = <&gpio2 19 GPIO_ACTIVE_HIGH>;
>         };
>
> You don't need a full-featured kernel driver for that, so just bind the
> gpio-aggregator to the door-opener, and control it through libgpiod.

Yep it's a perfect industrial control example, I get it.

Maybe we should blurb something about industrial control?

The rest I think we cleared out else I will see it when I review again.

Yours,
Linus Walleij
