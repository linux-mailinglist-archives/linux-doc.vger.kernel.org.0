Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E877327AEDA
	for <lists+linux-doc@lfdr.de>; Mon, 28 Sep 2020 15:14:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726526AbgI1NOG (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 28 Sep 2020 09:14:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725290AbgI1NOF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 Sep 2020 09:14:05 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BAACC061755
        for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2020 06:14:05 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id j2so1253393eds.9
        for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2020 06:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=l3K/ikGaL4KEcuEFMJUwHGHEbciMv8TvEFjmQGXR94c=;
        b=QJpYnnydDTm9ollDZBeV7iMr1rQVwH7tZLhOYVkSBLq5wKc8J6VWDDTsHLiCKyt/Z+
         tXksvbbH4bkmiO9ruDyziaQIlwkdaFnZyOhBMGPIb4Xxmr0fxyM7Zj9C+7Ez7J5eq4/x
         tIyiexBI+9cXt6v/bV/LOBlvuqBb0cyPiwRyZBE5qB3BEscVSPDU8LRzIa0tIwwVQHmZ
         zS7IV7XId8mrauqrsENbPxaJVXfytMcDL1kOtCoET/GJ/J9VBGtf8/qsnzJQce+nTOIY
         M6ndRNpA3K4jCeGhW+kmoYG1P3AFh81TOWuu9OOJfrNUJVr4BuUpGFb9jwvYzhDHwrCW
         RwyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l3K/ikGaL4KEcuEFMJUwHGHEbciMv8TvEFjmQGXR94c=;
        b=gXMlrdwcaPBAjcU3vgMOy1HUj2+ypd3Gwt9+BF2Sy8/kp6RBRFfiq25TNxt4jOobpY
         7D5CBQeDc7cGkjJUp3OE8byyU5xhJFem3xkBE1mnOms7EXUB+1p6aHBek7lnO8UKMt2r
         5XNzo0UHDXvUfFUqbManaPAQZJpeYd0u5KtRJEdc6H8WUlSJcsw0lEiMVy4WJXIlfXnv
         jAx3h9VNhT6SF+MOTdPq5iEe5NBn4Xn8O+yZD9XmWiGVsjMmtJdwMUo0zTiasPe7DzW3
         Xb/ANv/KLTAp4N+ZpXzLPLv8GOIxrs29IEV1SofPx62F1FtnLtxI5VfjwKbDP9Q2U00L
         IaNQ==
X-Gm-Message-State: AOAM5305ULZrwDXT0dsHyHmJHD/Rt9oKDbpaG4dWvtOtl6FbBk/dyJT6
        N81eIKwjyl7v9Eb4/Tsw9ekHEgOhnC7zW8AJt9Nluw==
X-Google-Smtp-Source: ABdhPJyi4hmtUWms2kh5NssrFGxYFUl7eKUiJjnwerE72AebrLYPVlCp2VJDbypkEmMJCwJmmHlf0iynnbvps57Udas=
X-Received: by 2002:a05:6402:a51:: with SMTP id bt17mr1754936edb.186.1601298844257;
 Mon, 28 Sep 2020 06:14:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200928104155.7385-1-brgl@bgdev.pl> <20200928104155.7385-8-brgl@bgdev.pl>
 <20200928130023.GJ3956970@smile.fi.intel.com>
In-Reply-To: <20200928130023.GJ3956970@smile.fi.intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 28 Sep 2020 15:13:53 +0200
Message-ID: <CAMpxmJVGAe224JaXL4EmeEFV4Qv7ohjgn_W_CwPjC4MHgP4gTA@mail.gmail.com>
Subject: Re: [PATCH v2 7/9] gpio: mockup: pass the chip label as device property
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Kent Gibson <warthog618@gmail.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-doc <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Sep 28, 2020 at 3:00 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Sep 28, 2020 at 12:41:53PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > While we do check the "chip-name" property in probe(), we never actually
> > use it. Let's pass the chip label to the driver using device properties
> > as we'll want to allow users to define their own once dynamically
> > created chips are supported.
> >
> > The property is renamed to "chip-label" to not cause any confusion with
> > the actual chip name which is of the form: "gpiochipX".
> >

^^^ here, see below

> > If the "chip-label" property is missing, let's do what most devices in
> > drivers/gpio/ do and use dev_name().
>
> ...
>
> > +             snprintf(chip_label, sizeof(chip_label),
> > +                      "gpio-mockup-%c", i + 'A');
> > +             properties[prop++] = PROPERTY_ENTRY_STRING("chip-label",
> > +                                                        chip_label);
>
> You added new property, now count is up to 4. But at the same time
>
>         #define GPIO_MOCKUP_MAX_PROP  4
>
> how do you avoid overflow?
>

I renamed the property, the previous "chip-name" is no longer used. In
fact it was never used but was accounted for in GPIO_MOCKUP_MAX_PROP.

Bart
