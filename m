Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95DDD2D3DF8
	for <lists+linux-doc@lfdr.de>; Wed,  9 Dec 2020 09:55:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728256AbgLIIwd (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 9 Dec 2020 03:52:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726035AbgLIIwX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Dec 2020 03:52:23 -0500
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C34D5C0613CF
        for <linux-doc@vger.kernel.org>; Wed,  9 Dec 2020 00:51:42 -0800 (PST)
Received: by mail-lj1-x241.google.com with SMTP id q8so1294854ljc.12
        for <linux-doc@vger.kernel.org>; Wed, 09 Dec 2020 00:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2LZygKLdMeXtg6UECM3hwilY+T5j2Bz/7hXfM4FH8eM=;
        b=epPtSSR/7bb7N5MVhrvn8mmG61DUhbJ5ceSBz3zdi5ttU8hgJi895CvkV+jIJ/6Elk
         faLbAlJ0Ct8dkmLFvgIrcS2c+E739IaF5RCxecfGNHm3mm9cz8saP5sgGgYp+X1PV4bC
         8mhsjose2UwRapucDt1waykXBayMMNhXuMNDIMFXYNitjuaFIJIsgeaGcS06BwcAfxiT
         KnhaJQskTWoexBWR6Z8n6Tmma+HZsp8I7wCXBC5u3Xfmk6pam3fV2CZ4Ur7GSbOGsa+I
         mOEm5C+iR1V90Ai9/YLl2ZsKt3HZkVjDOpFbulodrKnOwGlU5c4D2BW0bjsEGeVxZrhT
         woEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2LZygKLdMeXtg6UECM3hwilY+T5j2Bz/7hXfM4FH8eM=;
        b=KEzMrPcGt4fjPF/Y9MPRwocb0rnGbIgGLQoe11atdffGAiDrWW+MKIr0R3QieJn53Q
         W9O3RrkBXv+s+0J305qBJnNXL/VwgWI4VU5DNkAoB/CBzzgAPqw7A5ByWFKULL/5lEPf
         m4RxUm9m5KCTUk/BAgSua7aLP4/VXW2LnONCpinKUQtY0vjvhPDXoWISbe6KyLH3iBpz
         XnofpThvoc9ecnXShDBKZArs2FV5v/ndfZKUOQqiGFimd6FpyHQyT0WpfwTPh340fgri
         /GIRdXPy0sChtSp40JHKeDo55m/KuQn8piC2K7cZhRPS32Cja6AJE6v7ByVtuE7i7RzS
         qQBg==
X-Gm-Message-State: AOAM533BOzc+5mL0oMsHhib/I8zs9g/5sWQpxQRGtoY62c0ikgCicDf2
        A8knCl8HIoHn0U1TErWdJaX8sZm1QRMvAjskoW9MaA==
X-Google-Smtp-Source: ABdhPJzppB0j8WgWv6IdUZKKIGJXOVBgkHuLGiXKbyH9OU440iaPPvmtmnyjuDh6a/e9QQ8jwdYfQNzIxLD6F6BmUpY=
X-Received: by 2002:a2e:910f:: with SMTP id m15mr622232ljg.467.1607503901332;
 Wed, 09 Dec 2020 00:51:41 -0800 (PST)
MIME-Version: 1.0
References: <20201203191135.21576-1-info@metux.net> <20201203191135.21576-2-info@metux.net>
 <0080d492-2f07-d1c6-d18c-73d4204a5d40@metux.net> <CACRpkdb4R4yHcUV2KbGEC_RkU+QmH6Xg7X+qee8sEa9TURGr8A@mail.gmail.com>
 <51d3efb7-b7eb-83d7-673a-308dd51616d3@metux.net>
In-Reply-To: <51d3efb7-b7eb-83d7-673a-308dd51616d3@metux.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 9 Dec 2020 09:51:30 +0100
Message-ID: <CACRpkdbqVoT56H88hoZwDqV0kW_8XTaE5TkMQsg-RRrPqgF=cQ@mail.gmail.com>
Subject: Re: Howto listen to/handle gpio state changes ? Re: [PATCH v2 2/2]
 drivers: gpio: add virtio-gpio guest driver
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        virtualization@lists.linux-foundation.org,
        linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Dec 8, 2020 at 3:07 PM Enrico Weigelt, metux IT consult
<lkml@metux.net> wrote:

> I've been looking for some more direct notification callback for gpio
> consumers: here the consumer would register itself as a listener on
> some gpio_desc and called back when something changes (with data what
> exactly changed, eg. "gpio #3 input switched to high").
>
> Seems we currently just have the indirect path via interrupts.

I don't know how indirect it is, it seems pretty direct to me. The subsystem
was designed in response to how the hardware in front of the developers
worked.

So far we have had:
- Cascaded interrupts
- Dedicated (hieararchical) interrupts
- Message Signalled Interrupts

And if you now bring something else to the show then it's not like the
subsystem was designed for some abstract quality such as
generic notification of events that occurred, all practical instances
have been around actual IRQs and that is why it is using
struct irq_chip.

What we need to understand is if your new usecase is an outlier
so it is simplest modeled by a "mock" irq_chip or we have to design
something new altogether like notifications on changes. I suspect
irq_chip would be best because all drivers using GPIOs for interrupts
are expecting interrupts, and it would be an enormous task to
change them all and really annoying to create a new mechanism
on the side.

Yours,
Linus Walleij
