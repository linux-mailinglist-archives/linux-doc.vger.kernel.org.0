Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 630615D9EC
	for <lists+linux-doc@lfdr.de>; Wed,  3 Jul 2019 02:57:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727410AbfGCA5X (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 2 Jul 2019 20:57:23 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:37720 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726150AbfGCA5W (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 Jul 2019 20:57:22 -0400
Received: by mail-lj1-f196.google.com with SMTP id 131so504668ljf.4
        for <linux-doc@vger.kernel.org>; Tue, 02 Jul 2019 17:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=16juguPwtTD1vWpUNQpyIYEAEOADqNOzx5F+yEENpfM=;
        b=S/9wjNxzHSQ44lx7QK89mdaRsjoKX1ZHgfg3NuCejeCzRPPew2tWGQF+4K7vlloGvm
         tyN6KUOOcr3VvGxxqoNTkXQVxwWSdgw6rRxyFAtqS2wmE4uIzfvXER5NQaV0WvTgDSO/
         G7CftJYBPlUxgiiZGrDHr7XemlK99J37xqC6ZOicBwBXGmkzZiihRX4yIIpvZp2yFexg
         a7FQYsjQ7dRg4vmj1VZqWbV5+hptW5EvSKIt7hNJxWmqz6RxXpQcQrlL4oP+c+fXuPnm
         JcF2i68p+gi5kx0i/DM9PMGUD2oVxl7Rs4ZjGSg8mLnFJjXxbx6vHt20X8U5l6/jqpk/
         XrvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=16juguPwtTD1vWpUNQpyIYEAEOADqNOzx5F+yEENpfM=;
        b=pYm9lwOXEwCGyFaiQ2SOSCgpBjGMUjnxRnR7/QNpSvSRiBsWDb+iVyd5FY3B+XVBcF
         WwwuwQ166X+NYK6COxa5s6wSES1U/mZA/dlDQYcaFGNBTtMwe4AMlZy4gSV28EB5aceh
         D6s5rnBG9q9LHFx9yqgG448v7kMaWjN5RdnVo6+4D8EEiURrHkbvuy2Qdd9esl6Lx+n6
         SKZffxi9Gq6T57/A5jo9JXLX+BYOwRdvqxfr0RHf7q2yLaUVJ0nNpCzYe8SmZE+5EiRy
         mN2aCGUz273IYBy4cIztyJha4oOEVvgwYhh2nOqjqrVzhsl6BZXFh2+zSxmOGGwMmt+J
         S8OQ==
X-Gm-Message-State: APjAAAV1aJxQSsRwYbPFyd/D3Kbp1CGQSZxHXDNi78IaPON+8TRtNEoG
        TLgL2t7js4+7kvt+o7HyQ0EggrroP2cXliWMIHU3pw==
X-Google-Smtp-Source: APXvYqzqBXDeMKmpI7HFc6XkzadQ68osH+Li6FhgxXGtJx4NhJW7ZyaamzfpJOk299AcYNEfRxB1ATHZc5WRU8OT9jg=
X-Received: by 2002:a2e:a0cf:: with SMTP id f15mr18775412ljm.180.1562101588459;
 Tue, 02 Jul 2019 14:06:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190617221134.9930-1-f.fainelli@gmail.com>
In-Reply-To: <20190617221134.9930-1-f.fainelli@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 2 Jul 2019 23:06:16 +0200
Message-ID: <CACRpkdbqW2kJNdPi6JPupaHA_qRTWG-MsUxeCz0c38MRujOSSA@mail.gmail.com>
Subject: Re: [PATCH v6 0/6] KASan for arm
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Alexander Potapenko <glider@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Russell King <linux@armlinux.org.uk>, christoffer.dall@arm.com,
        Marc Zyngier <marc.zyngier@arm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Nicolas Pitre <nico@fluxnic.net>,
        Vladimir Murzin <vladimir.murzin@arm.com>,
        Kees Cook <keescook@chromium.org>, jinb.park7@gmail.com,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        liuwenliang@huawei.com, Rob Landley <rob@landley.net>,
        Greg KH <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Thomas Gleixner <tglx@linutronix.de>, thgarnie@google.com,
        David Howells <dhowells@redhat.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Andre Przywara <andre.przywara@arm.com>,
        julien.thierry@arm.com, drjones@redhat.com, philip@cog.systems,
        mhocko@suse.com, kirill.shutemov@linux.intel.com,
        kasan-dev@googlegroups.com,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        kvmarm@lists.cs.columbia.edu,
        Andrey Ryabinin <ryabinin.a.a@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Florian,

On Tue, Jun 18, 2019 at 12:11 AM Florian Fainelli <f.fainelli@gmail.com> wrote:

> Abbott submitted a v5 about a year ago here:
>
> and the series was not picked up since then, so I rebased it against
> v5.2-rc4 and re-tested it on a Brahma-B53 (ARMv8 running AArch32 mode)
> and Brahma-B15, both LPAE and test-kasan is consistent with the ARM64
> counter part.
>
> We were in a fairly good shape last time with a few different people
> having tested it, so I am hoping we can get that included for 5.4 if
> everything goes well.

Thanks for picking this up. I was trying out KASan in the past,
got sidetracked and honestly lost interest a bit because it was
boring. But I do realize that it is really neat, so I will try to help
out with some review and test on a bunch of hardware I have.

At one point I even had this running on the ARMv4 SA1100
(no joke!) and if I recall correctly, I got stuck because of things
that might very well have been related to using a very fragile
Arm testchip that later broke down completely in the l2cache
when we added the spectre/meltdown fixes.

I start reviewing and testing.

Yours,
Linus Walleij
