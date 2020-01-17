Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 294E1141295
	for <lists+linux-doc@lfdr.de>; Fri, 17 Jan 2020 22:05:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729799AbgAQVFn (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 17 Jan 2020 16:05:43 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:42132 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729818AbgAQVFg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 17 Jan 2020 16:05:36 -0500
Received: by mail-lj1-f193.google.com with SMTP id y4so27837044ljj.9
        for <linux-doc@vger.kernel.org>; Fri, 17 Jan 2020 13:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZBkS9S8oFTr7ty1NIiAX5JrGRHx/96iPY51B8fxdR2Y=;
        b=cHQbz9MerebtnThsNe1yZb3HrtSTeIETgYrDu7Q6ONNqX19PijFVSf1lIzu4QilAmq
         hnzwI7P9xI2x5Nd23oDV61kz+2bLOlRlL10WS0JzuDLyURLzzSJmFejdlEtxX62vduXq
         TpK3nS16M0AtekVAN7KXLTgm+8OVHS0eXGhicVmwjML/hqokK/cH4dVEcUKTav6rGeHG
         F2mggp9KMtiE0o776HZy0j2hC+yCq9L9owGloa+hAahvM5W8iEcIFR2imdSPMy3FtcK2
         qu8VkJVvrJS72NCEqvK6tJF2u/4NncgSSpbA7HFFqnczDZ/uro6Wxu9pbLQt70yvz9qn
         t7xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZBkS9S8oFTr7ty1NIiAX5JrGRHx/96iPY51B8fxdR2Y=;
        b=MRYguLhERWOKLUKqAM6QKoSt2x2aQAr8V+tIL1PySuKyDtfWhWmuP9micwXbOCuUfM
         oxqjwHoyR9z8/B1HfyMnVjtc8pMZ1dC4bDqtIBW69IJxlSE8f60bhcUipaWJmjMVXijQ
         0AvuQZvGvx7fpHvQBAPbmYb4gl4sUXu4ZRwDoF8REU+y+wAPVnqwXZU2ENzp1auJF2Yr
         qc6vDUOcCRP2Rx1hZelL16ie3XLRVYMGmKUPZaOLbl0Ts6gNKOgC00Osa12DADhfAbmS
         MX89+u2rxyzlN/FIHYn5Wn11O5L9IQOs6Yo9cxIcp2KNU8oHDBkD11C+IbrTsNqAmga0
         4CEg==
X-Gm-Message-State: APjAAAXv7PDH04JW05JjZ3aYZ2CRrhGtl4w3rPjSq+X9t+I8DMqvCkjH
        1PmoNSCAQVeDQ1VeiNU1DtfocMbNuX8avcRIcKDvow==
X-Google-Smtp-Source: APXvYqwUSECeAUfn+Q3aKc4hgEvhvTGDwKPCeuq5cHdmTnCOCRP0mwkFi9O47FkIodi5rljBhCBu+PmnCppplmipwMc=
X-Received: by 2002:a2e:9143:: with SMTP id q3mr6695400ljg.199.1579295134552;
 Fri, 17 Jan 2020 13:05:34 -0800 (PST)
MIME-Version: 1.0
References: <20190617221134.9930-1-f.fainelli@gmail.com> <20191114181243.q37rxoo3seds6oxy@pengutronix.de>
 <7322163f-e08e-a6b7-b143-e9d59917ee5b@gmail.com> <20191115070842.2x7psp243nfo76co@pengutronix.de>
 <20191115114416.ba6lmwb7q4gmepzc@pengutronix.de> <60bda4a9-f4f8-3641-2612-17fab3173b29@gmail.com>
 <CACRpkdYJR3gQCb4WXwF4tGzk+tT7jMcV9=nDK0PFkeh+0G11bA@mail.gmail.com> <2639dfb0-9e48-cc0f-27e5-34308f790293@gmail.com>
In-Reply-To: <2639dfb0-9e48-cc0f-27e5-34308f790293@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 17 Jan 2020 22:05:23 +0100
Message-ID: <CACRpkdYs-jeYO+8avOryJnXdWsB9AkPy7Q5FRQ1gGC1NU35MHA@mail.gmail.com>
Subject: Re: [PATCH v6 0/6] KASan for arm
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     Marco Felsch <m.felsch@pengutronix.de>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Michal Hocko <mhocko@suse.com>,
        Julien Thierry <julien.thierry@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christoffer Dall <christoffer.dall@arm.com>,
        David Howells <dhowells@redhat.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Andrey Ryabinin <ryabinin.a.a@gmail.com>,
        Alexander Potapenko <glider@google.com>,
        kvmarm@lists.cs.columbia.edu, Jonathan Corbet <corbet@lwn.net>,
        Abbott Liu <liuwenliang@huawei.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Russell King <linux@armlinux.org.uk>,
        kasan-dev <kasan-dev@googlegroups.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        drjones@redhat.com, Vladimir Murzin <vladimir.murzin@arm.com>,
        Kees Cook <keescook@chromium.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Andre Przywara <andre.przywara@arm.com>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        Jinbum Park <jinb.park7@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Sascha Hauer <kernel@pengutronix.de>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Nicolas Pitre <nico@fluxnic.net>,
        Greg KH <gregkh@linuxfoundation.org>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Rob Landley <rob@landley.net>, philip@cog.systems,
        Andrew Morton <akpm@linux-foundation.org>,
        Thomas Garnier <thgarnie@google.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jan 17, 2020 at 8:55 PM Florian Fainelli <f.fainelli@gmail.com> wrote:

> [Me]
> > Can we start to submit these patches to Russell's patch tracker?
> > Any more testing I should be doing?
>
> Let me submit and rebase v7 get the auto builders some days to see if it
> exposes a new build issue and then we toss it to RMK's patch tracker and
> fix bugs from there?

OK you can add my Tested-by: Linus Walleij <linus.walleij@linaro.org>
to the patches.

Thanks,
Linus Walleij
