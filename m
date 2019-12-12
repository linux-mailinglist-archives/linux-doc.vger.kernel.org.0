Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50F4E11CE23
	for <lists+linux-doc@lfdr.de>; Thu, 12 Dec 2019 14:21:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729404AbfLLNU7 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 12 Dec 2019 08:20:59 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:38343 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729369AbfLLNU6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 12 Dec 2019 08:20:58 -0500
Received: by mail-lj1-f194.google.com with SMTP id k8so2264437ljh.5
        for <linux-doc@vger.kernel.org>; Thu, 12 Dec 2019 05:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Hg7Wl/6CET3pvbTGNm/tGvdeGMQk6gSudBEEyfBygCo=;
        b=SSsBUJhxA1aRWawSyAxOR8XEmSe8IeDhUogI22JjnRdTk3guoUUCNE18wU5spaIBSN
         Tge40xKNTf2c46f/Ct3PtBV62vLDyTgN2F3kU/LEPoq1BJ2nnzBXF8JYtD2eEX1mqIJz
         rW7wDkFNi5MxHljIDydZyIjHe6qK9dZp/ZzKZFTU8OzgxhvVNWUmlr/+DUAbJCPCYqdT
         SZmfh20Q3fi5Bhn0MuHL9ePyN6uLVtDrP1daGTkTkZZvu5ew56B9/mLwobAy+2/ftSrB
         0Q9aN+TRxhkjgCuoZ7lNHssuUGfAJkwH65uRfr9oM3Du3HhN0ra9yv9gV/v3pVzTcRo0
         0k3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Hg7Wl/6CET3pvbTGNm/tGvdeGMQk6gSudBEEyfBygCo=;
        b=AtSk/ikAbk5MIDlGhQUORUBMAT+4e3NNkhhPQ6AdNlm21SjSnIMBK2P9LJQKx6CmTE
         eGOivxG1Cyh47xDk0bu6xYMnvQNWMFPEWmISYBLgKKamI3yaqNRyEwKSTPT1HpIgd3gT
         MEyFgHrrKxWKl4HJcc9ozN13Q6AXPAFvOXTablnJfeSvJ/EyTfdFHz64rWPbdquFJGZC
         MmKeIcT7w3Kgi3YtahnIicNU+z8yCb4Q4XLlOLf+WCYE4w7zImpX+1ZUwh9U7k+rNcnh
         ivTO9biv3aSCrlG2wkfRctXm/eH9OMsrSw9acUcbXkyl5n1zgx0+lOge0T1uKIrEuapv
         Fv2Q==
X-Gm-Message-State: APjAAAU4Vz19ZnSu0bC4dE1Sy4J0J6FoawZJiK+bE36aODZ1RSz+zRoV
        0PiyHx38GsmbVvM25Yv9g4V01Z94u/95pICYFMrCdg==
X-Google-Smtp-Source: APXvYqw5fhzsAgc+HL+XC84iHcSjemi0g8V+vxBZMQOSmUPecN5cY5o5jyiYAB8ZURwvkZwuG5+myIg9qUaLJdi8vHI=
X-Received: by 2002:a2e:844e:: with SMTP id u14mr5871004ljh.183.1576156856527;
 Thu, 12 Dec 2019 05:20:56 -0800 (PST)
MIME-Version: 1.0
References: <20191127084253.16356-1-geert+renesas@glider.be> <20191127084253.16356-3-geert+renesas@glider.be>
In-Reply-To: <20191127084253.16356-3-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 12 Dec 2019 14:20:45 +0100
Message-ID: <CACRpkdYyY0eGipdK6ixZxLtdJ5px=U2mOa79VZb00NEEAEL=6g@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] gpiolib: Add support for gpiochipN-based table lookup
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
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

Hi Geert!

On Wed, Nov 27, 2019 at 9:43 AM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> Currently GPIO controllers can only be referred to by label in GPIO
> lookup tables.
>
> Add support for looking them up by "gpiochipN" name, with "N" either the
> corresponding GPIO device's ID number, or the GPIO controller's first
> GPIO number.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

What the commit message is missing is a rationale, why is this needed?

> If this is rejected, the GPIO Aggregator documentation must be updated.
>
> The second variant is currently used by the legacy sysfs interface only,
> so perhaps the chip->base check should be dropped?

Anything improving the sysfs is actively discouraged by me.
If it is just about staying compatible it is another thing.

> +static int gpiochip_match_id(struct gpio_chip *chip, void *data)
> +{
> +       int id = (uintptr_t)data;
> +
> +       return id == chip->base || id == chip->gpiodev->id;
> +}
>  static struct gpio_chip *find_chip_by_name(const char *name)
>  {
> -       return gpiochip_find((void *)name, gpiochip_match_name);
> +       struct gpio_chip *chip;
> +       int id;
> +
> +       chip = gpiochip_find((void *)name, gpiochip_match_name);
> +       if (chip)
> +               return chip;
> +
> +       if (!str_has_prefix(name, GPIOCHIP_NAME))
> +               return NULL;
> +
> +       if (kstrtoint(name + strlen(GPIOCHIP_NAME), 10, &id))
> +               return NULL;
> +
> +       return gpiochip_find((void *)(uintptr_t)id, gpiochip_match_id);

Isn't it easier to just  augment the existing match function to
check like this:

static int gpiochip_match_name(struct gpio_chip *chip, void *data)
{
        const char *name = data;

        if (!strcmp(chip->label, name))
               return 0;
        return !strcmp(dev_name(&chip->gpiodev->dev), name);
}

We should I guess also add some kerneldoc to say we first
match on the label and second on dev_name().

Yours,
Linus Walleij
