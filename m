Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B96D34DC72
	for <lists+linux-doc@lfdr.de>; Tue, 30 Mar 2021 01:29:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229555AbhC2X3J (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 29 Mar 2021 19:29:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229861AbhC2X25 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 29 Mar 2021 19:28:57 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DD5CC061764
        for <linux-doc@vger.kernel.org>; Mon, 29 Mar 2021 16:28:57 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id x189so15468445ybg.5
        for <linux-doc@vger.kernel.org>; Mon, 29 Mar 2021 16:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WDde1oog8pONjUYe4veyTF77bnbUW5uOW/VjN8BRrfc=;
        b=tR1uudSRQlnzL7FPxhVK1H2lmKlgH5Jstl69KtGaXiKfzpJeNtd3sKUREc83E14Hyg
         KNtpU52k/3GvnCheolompf0OcGFwxjIztQl12NPKWvtVUo2Ca28hh6VmkNVc+jIKNYve
         qR/5ZhPcLbSkgxU1WQSwPiF+Kkczewe7xqJWQApgPqPzpetjUWvmTZ7Qr41GdZDiJIJH
         XibRwn4VLj8hlEfGH9NN6fS+EgkU8yH6ME68JPyNOJ8MKcOIyH806NIpP9D2drko4jdM
         T3dCqd2FpbrDSQ8blvlO8F8dItLzhwn6XP5WAL3ZurP3FGTL5yuve9pXPXBjS913UV8N
         utww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WDde1oog8pONjUYe4veyTF77bnbUW5uOW/VjN8BRrfc=;
        b=tSF5t1sV/pDoP40/oMuV87bjxonJi9R1XzYsplrHoOMgPaWsGIETWChksPMlTwkkf/
         0MbWDgyyOUE6/3NuuxSps6s/zFkdGHSRy132TwaxiIsiTYhXbjfgBhcO9rjLJrB8r6yD
         7gdlA+uUVNFd9OOQ6z0gsnsW2Ux29aB6qo4X/gg8enp0hjXtUOQJmRmcLamuTIlHh1K5
         xBq5hBCWeqs2BUgzToe2IqwGL8x5DjZylwD0OXGERKH9gTC5+vFE0MlrF15RfpoIKmv9
         Abdw5Qr1iy84PwUS6WUQ0le4qVd5CfZpHiD1JPykesYxWNQKldcILi2XzTlsN/yUrSVz
         hDzw==
X-Gm-Message-State: AOAM532VxTxyRpuKZuzpIDu0r8hW1BWjUNLJvrHhdWiK8ygYi5NWqmTY
        2y2T3UOQYegKC/WBUkAJ/jEOEcB1zxqb3Dcv3BiEdQ==
X-Google-Smtp-Source: ABdhPJxJ0sCTNyDyfI1b+8FrpLSQIIgEbs4baXc7OkRt3EK4dgFfRKGNOBy2PoOel1NkVVc1/6RzZA8g9VrfRrbLeWw=
X-Received: by 2002:a25:b443:: with SMTP id c3mr43370477ybg.32.1617060536158;
 Mon, 29 Mar 2021 16:28:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210205222644.2357303-9-saravanak@google.com>
 <20210210114435.122242-1-tudor.ambarus@microchip.com> <20210210114435.122242-2-tudor.ambarus@microchip.com>
 <CGME20210325133159eucas1p297b769beb681743fb32d362a86cc6e3e@eucas1p2.samsung.com>
 <d24bebc5-0f78-021f-293f-e58defa32531@samsung.com> <9b206c4d00dfe8b7f941260f18909914b2b2eecb.camel@suse.de>
 <161678243444.3012082.5031467952132861429@swboyd.mtv.corp.google.com>
 <CAMuHMdV5PGUujsFP2TXMxij4UxVnrrurh_qVhq8+480w21jJAg@mail.gmail.com> <161705310317.3012082.15148238105608149214@swboyd.mtv.corp.google.com>
In-Reply-To: <161705310317.3012082.15148238105608149214@swboyd.mtv.corp.google.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Mon, 29 Mar 2021 16:28:20 -0700
Message-ID: <CAGETcx8reqKoPoJ8dV7f9=SHYKmNhcVpkNHoCS-0L4UHCBahoA@mail.gmail.com>
Subject: Re: [PATCH] clk: Mark fwnodes when their clock provider is added
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Tudor Ambarus <tudor.ambarus@microchip.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Frank Rowand <frowand.list@gmail.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Kevin Hilman <khilman@kernel.org>,
        Len Brown <len.brown@intel.com>, Len Brown <lenb@kernel.org>,
        Marc Zyngier <maz@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Pavel Machek <pavel@ucw.cz>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        DOCUMENTATION <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux PM list <linux-pm@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS <devicetre
        e@vger.kernel.org>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Android Kernel Team <kernel-team@android.com>, linux-rpi-kernel" 
        <linux-rpi-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Mar 29, 2021 at 2:25 PM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Geert Uytterhoeven (2021-03-26 11:29:55)
> > On Fri, Mar 26, 2021 at 7:13 PM Stephen Boyd <sboyd@kernel.org> wrote:
> > > Quoting Nicolas Saenz Julienne (2021-03-25 11:25:24)
> > > > >
> > > > > This patch mainly revealed that clk/bcm/clk-raspberrypi.c driver calls
> > > > > devm_of_clk_add_hw_provider(), with a device pointer, which has a NULL
> > > > > dev->of_node. I'm not sure if adding a check for a NULL np in
> > > > > of_clk_add_hw_provider() is a right fix, though.
> > > >
> > > > I believe the right fix is not to call 'devm_of_clk_add_hw_provider()' if
> > > > 'pdev->dev.of_node == NULL'. In such case, which is RPi3's, only the CPU clock
> > > > is used, and it's defined and queried later through
> > > > devm_clk_hw_register_clkdev().
> > > >
> > > > @Marek, I don't mind taking care of it if it's OK with you.
> > > >
> > >
> > > Ah I see this is related to the patch I just reviewed. Can you reference
> > > this in the commit text? And instead of putting the change into the clk
> > > provider let's check for NULL 'np' in of_clk_add_hw_provider() instead
> > > and return 0 if there's nothing to do. That way we don't visit this
> > > problem over and over again.
> >
> > I'm not sure the latter is what we reall want: shouldn't calling
> > *of*_clk_add_hw_provider() with a NULL np be a bug in the provider?
> >
>
> I don't have a strong opinion either way. Would it be useful if the
> function returned an error when 'np' is NULL?

I lean towards returning an error. Not a strong opinion either.

-Saravana

> I guess the caller could
> use that to figure out that it should register a clkdev. But it
> shouldn't hurt to register both a clkdev lookup and a DT provider for
> the same clk. The framework will try the DT path first and then fallback
> to a clkdev lookup otherwise, so we'll be wasting memory for clkdev but
> otherwise be fine.
>
> Really it feels like we should try to unify around a
> devm_clk_add_hw_provider() API that figures out what to do based on if
> the device has an of_node or not. That would mean implementing something
> like clkdev but for a whole provider instead of a single clk. Then this
> question of returning an error would be moot here.
