Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0866127B057
	for <lists+linux-doc@lfdr.de>; Mon, 28 Sep 2020 16:52:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726621AbgI1Owj (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 28 Sep 2020 10:52:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726526AbgI1Owi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 Sep 2020 10:52:38 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88D1FC0613CF
        for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2020 07:52:38 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id q13so8911080ejo.9
        for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2020 07:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pb2hEgRaRZDX0+sB29ngdH9rbWg1o3VgDq0s7JnHNBs=;
        b=FntVd3CAlGxvIH4D+noS3jlMmsCTpRkC5DCHq1JxdpEAXzkRTzYq261oz+W7Lof3vk
         hGokbGShQ01LM1tmcsHu+Hx//aZCwNyAU+V6nWjgmSn9sdxDcInd2Aue35dQbaKmZ9TZ
         NTJuZ8wCzV+W83TR6rvT+PfxVsyjAMsy6N8y8yiDtV9N6oKKLUgNwuYQXAQVY3eGFLh4
         NZ2BmJpg3yCZmeiMWUKJaN3uVcpI5+sBo+b0pNvWOFGFcOuDNh5ayN9eyEI2LEXmhRa/
         WZqvMztMmjoFxeg2m6w4QFLfng09t25Iv+k+WZG074s9e/uTZHlwMfK4p11mv8htlXZo
         tXNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pb2hEgRaRZDX0+sB29ngdH9rbWg1o3VgDq0s7JnHNBs=;
        b=V1Tqc+Rp7YLS/jwls7878oJ9mEW1nL77CUZA5kFrNiXdWFGYaDfCUIbEf4CRXasrWv
         EQ0FcDbXKDo0kDfodcOBkQMXe91ndZR0usaIniNxqFl32ROY2VyEe5Cnv8tziLb3C6No
         QzsEeOpPrSYUrU4udLJk+gwzOl1xSdifarTeJylG00FvXyHHFDqvSiQ1pfkHSqxdzHJO
         n3z3It4f7eeWT+LsG3jcRYQsBsNcYDHCdDsfvRfSVnRNz0b3mNGS0T//m6sezTy5Rju4
         2X1f/+QbU8Ej1j8tfXs/FnWnZdQP6W9mChIdOwtA6vxU7TQQAPNFRtABcM6PzHRChpHp
         8NCw==
X-Gm-Message-State: AOAM532HhMo9Yn8ju31DCSRjv6HizxiBPzDoY/PfiBmFmboEQHK01S0u
        5oDfK3Zjb85MRiKd/wusErOAxG4FJn97rlOwmdIABw==
X-Google-Smtp-Source: ABdhPJxAVB9xurPA1BXZAPcuQbV34dpBJ02LnYYlhE5yglFppCdXdT/R38mm7JohT1o0mbbC7O6T5vKvHG2sRQ3ukPE=
X-Received: by 2002:a17:906:fccb:: with SMTP id qx11mr2049874ejb.429.1601304756574;
 Mon, 28 Sep 2020 07:52:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200928104155.7385-1-brgl@bgdev.pl> <20200928104155.7385-8-brgl@bgdev.pl>
 <20200928130023.GJ3956970@smile.fi.intel.com> <CAMpxmJVGAe224JaXL4EmeEFV4Qv7ohjgn_W_CwPjC4MHgP4gTA@mail.gmail.com>
 <20200928140028.GO3956970@smile.fi.intel.com>
In-Reply-To: <20200928140028.GO3956970@smile.fi.intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 28 Sep 2020 16:52:25 +0200
Message-ID: <CAMpxmJUMMia+b6DQ1KoZ70XPUzhutg1tnWF5PCvfaRF5-XQnVg@mail.gmail.com>
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

On Mon, Sep 28, 2020 at 4:00 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Sep 28, 2020 at 03:13:53PM +0200, Bartosz Golaszewski wrote:
> > On Mon, Sep 28, 2020 at 3:00 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > On Mon, Sep 28, 2020 at 12:41:53PM +0200, Bartosz Golaszewski wrote:
> > > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > >
> > > > While we do check the "chip-name" property in probe(), we never actually
> > > > use it. Let's pass the chip label to the driver using device properties
> > > > as we'll want to allow users to define their own once dynamically
> > > > created chips are supported.
> > > >
> > > > The property is renamed to "chip-label" to not cause any confusion with
> > > > the actual chip name which is of the form: "gpiochipX".
> > > >
> >
> > ^^^ here, see below
> >
> > > > If the "chip-label" property is missing, let's do what most devices in
> > > > drivers/gpio/ do and use dev_name().
> > >
> > > ...
> > >
> > > > +             snprintf(chip_label, sizeof(chip_label),
> > > > +                      "gpio-mockup-%c", i + 'A');
> > > > +             properties[prop++] = PROPERTY_ENTRY_STRING("chip-label",
> > > > +                                                        chip_label);
> > >
> > > You added new property, now count is up to 4. But at the same time
> > >
> > >         #define GPIO_MOCKUP_MAX_PROP  4
> > >
> > > how do you avoid overflow?
> > >
> >
> > I renamed the property, the previous "chip-name" is no longer used. In
> > fact it was never used but was accounted for in GPIO_MOCKUP_MAX_PROP.
>
> Either I'm missing something or...
>
> Current code in linux-next has 3 properties to be possible
>
> PROPERTY_ENTRY_U32("gpio-base", base);
> PROPERTY_ENTRY_U16("nr-gpios", ngpio);
> PROPERTY_ENTRY_BOOL("named-gpio-lines");
>
> You adding here
> PROPERTY_ENTRY_STRING("chip-label", chip_label);
>
> Altogether after this patch is 4 which is maximum, but since array is passed by
> a solely pointer, the terminator is a must.
>

Thanks for explaining my code to me. Yes you're right and I'm not sure
why I missed this. :)

I'll fix this in v3.

Actually this means the code is wrong even before this series - it's
just that we don't use the "chip-name" property.

Bartosz
