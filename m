Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA88A11FFB9
	for <lists+linux-doc@lfdr.de>; Mon, 16 Dec 2019 09:30:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726926AbfLPIaE (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 16 Dec 2019 03:30:04 -0500
Received: from mail-ua1-f66.google.com ([209.85.222.66]:43762 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726788AbfLPIaD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 16 Dec 2019 03:30:03 -0500
Received: by mail-ua1-f66.google.com with SMTP id o42so1768519uad.10
        for <linux-doc@vger.kernel.org>; Mon, 16 Dec 2019 00:30:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kDxQhaeLo6rNMVFT3CBcpOhBFhoVMYpLfsYqZHIsllM=;
        b=GJ6KAmw6S+sq3Ccetl/H3ixiZVhos+PR0jEMWgPCzfx0kYdnBXsUmmddRDGHKCa+IW
         XpoIFbLS8+19HgHvj1aji88fMJFyb1lR/OZ36673QRjkhDqdlzrIFkgM8oE+oLQDArnf
         b7+9QxLZM6bFfD0TyRkuo4e0dVkdBL0SKoIBmAyTVM1uFsJHNelZ/+e0ANXGZ4aezkeZ
         o4gb0cTRAp9bOD/PgQ9vQbyM+lGwK9Ok7JQXcF4SJ5b4Kw9UhJJL2BCwrf0d2BtMgGGk
         5R3A+AL4JyWngHzSseIzNmoBzR/zYQxFslU5c3tgyAMleZF6TpW7mWEL4HtKwSHPi2AZ
         9W7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kDxQhaeLo6rNMVFT3CBcpOhBFhoVMYpLfsYqZHIsllM=;
        b=CO/ZD+PmOq6m+JTedYwp2DGo8BwCbmzE11jQGeXD7gRnK7cHaPeSpo509anH+ha77p
         VtPDQ7asi08nib1u0IhzapfUbifoFKR4AhWNjFntZ5JVDchL+ia8WX7Zdq1Rou6fCazS
         /g810vfnkmZU34ZdIS/noEfSce/pZi3iXnE0kBr7oCC3YCy21up1YI3hi1Pndvz+FRn6
         5ZAwgQWZpW4T8UeF+aC1X3+LJcOYlWnRO5OWR/UKoyZvC4ZZ1bhXAOFMMOnKppVSEI82
         iwT4pNZSBFJJRZmPSHn/k5QbnopIWOfmtjFjTnHby2+xQ+Qchd7dOND9usvd1xs2CH+Q
         ojbg==
X-Gm-Message-State: APjAAAWyPivP9SBrYTY5VLKyf1J0kIzHdGDA3V056Vuk2zDJJPcSI44D
        IbrjZ/ngO2B66yossIVSXeDjYhMpJZ0WsBimuRIJpQ==
X-Google-Smtp-Source: APXvYqwni+l6XxPCyreJYxRHqzJXidyE2iM9tvx9B737sdIeXKOHoRA6FLpVo5xoUtWtnIiiMdWW6jDBBKJSinB1wok=
X-Received: by 2002:ab0:5512:: with SMTP id t18mr22623715uaa.128.1576485002794;
 Mon, 16 Dec 2019 00:30:02 -0800 (PST)
MIME-Version: 1.0
References: <cover.1576054779.git.matti.vaittinen@fi.rohmeurope.com> <f34765b5cb4e949c2e85415ded3d0ee7736cc97b.1576054779.git.matti.vaittinen@fi.rohmeurope.com>
In-Reply-To: <f34765b5cb4e949c2e85415ded3d0ee7736cc97b.1576054779.git.matti.vaittinen@fi.rohmeurope.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 16 Dec 2019 09:29:51 +0100
Message-ID: <CACRpkdbUS7WeQ7OoTtjGnB7L=uhYncwwcHxkJ1Uj6GqYCGNGJA@mail.gmail.com>
Subject: Re: [PATCH v6 10/15] gpio: devres: Add devm_gpiod_get_parent_array
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     Matti Vaittinen <mazziesaccount@gmail.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Dec 11, 2019 at 10:47 AM Matti Vaittinen
<matti.vaittinen@fi.rohmeurope.com> wrote:

> Bunch of MFD sub-devices which are instantiated by MFD do not have
> own device-tree nodes but have (for example) the GPIO consumer
> information in parent device's DT node. Add resource managed
> devm_gpiod_get_array() for such devices so that they can get the
> consumer information from parent DT while still binding the GPIO
> reservation life-time to this sub-device life time.
>
> If devm_gpiod_get_array is used as such - then unloading and then
> re-loading the child device fails as the GPIOs reserved during first
> load are not freed when driver for sub-device is unload (if parent
> stays there).
>
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> ---
>
> Changes since v5:
> - renamed internal function (no __ - prefixes for Linus :] )

Thanks, as there are things happening in the GPIO subsystem I
have put this one patch on an immutable branch here:
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git/log/?h=ib-devm-gpiod-get-parent-array

Please ask the maintainer (I guess Lee?) to pull this into wherever
the rest of the patches should be merged if you want patches beyond
this point to be applied for the next (v5.6) merge window, then this
patch is not needed in the series.

Yours,
Linus Walleij
