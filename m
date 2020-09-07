Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF25E25FAD6
	for <lists+linux-doc@lfdr.de>; Mon,  7 Sep 2020 14:58:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729395AbgIGM6O (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 7 Sep 2020 08:58:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729371AbgIGM5m (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 Sep 2020 08:57:42 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF558C061575
        for <linux-doc@vger.kernel.org>; Mon,  7 Sep 2020 05:57:41 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id z23so18045085ejr.13
        for <linux-doc@vger.kernel.org>; Mon, 07 Sep 2020 05:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YucY+gKGhRi1ywbzRpYu6vJHZlJfD5eC4RFNZlM+vEU=;
        b=1DzPBq8QjNiAQmlUVLnJE9yHuQ5x3n8G/vy0ZHLOXkG6W/kp2qThs+PrIcQgSO+DLl
         Mtr+mRX9iTNI1t3koKVQTf3UTcrsvsBk9AQUu3frC/lANh5EF5ujvpUOLRLLLbN02Fv/
         Ejg2Mv8zLuigka+OAZV8Em2LcGiq60oOD0K3R9TgkVbTkWwRtngnyPew7C504FOK/kxt
         a0SLzOflYvfHL/WwdZELsw3cyyzQudmNHsXJhRnvJ4MUojJze58ec0y4c3+/cLTceGGq
         AU2p5RCEC7tkzqvI4yVyeEh229yaW3rpoEmpZeqzfMcDpv7V3rMCkYHNJJJvwbEMmkwA
         foZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YucY+gKGhRi1ywbzRpYu6vJHZlJfD5eC4RFNZlM+vEU=;
        b=YV5j3/kOeVlQ7VFujw417bi5SSJDnTZ/GNtCgL6Y6mHUdE37WgRwUh8Kvaqt0cZK4Z
         GOOc7TcJEsrRAL4HI+PgYdrHWmRIWwArq/wh8i0ciAz5qwWjHGk0NBL/NJx9uEJc5rUe
         11V1vMcc3PDfSFAsqscSjwiI8B6T4b8v5cQG4uRjfYR1i7ST9yVEwCifUclMqHaTj6Yd
         ye/Nfc3MD4Bqa8sPiu6lKeOuj0Fl6OZU+Xsca52v1GTbaM5v08XLUEec0xU9n9yVf6og
         y6DPr3EGVrGxAEyf3dD6/iZnSn144jkTDYMjLLS4A2caDmqBsfltw+gmdna/SBLfFKXF
         qrPA==
X-Gm-Message-State: AOAM533YYAbWJa/LSI8YAL1ep8MRlEhOcM2a17PXRaVVNmdvzVy9L/dm
        kxdbgikb7YiH7HBib64YefxBX9FetVKVgodRgdQOOA==
X-Google-Smtp-Source: ABdhPJzUQafzXEGFCABczGMzi5b/L3y2GqxJ0LOSr4ft7RzvZoPkp2ieYMUtiQRIu+JpJvYoyuFNg39EZzYaGsKijH4=
X-Received: by 2002:a17:906:19db:: with SMTP id h27mr19207447ejd.154.1599483460603;
 Mon, 07 Sep 2020 05:57:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200904154547.3836-1-brgl@bgdev.pl> <20200904154547.3836-24-brgl@bgdev.pl>
 <26ea1683-da8f-30e7-f004-3616e96d56b3@infradead.org> <20200907095932.GU1891694@smile.fi.intel.com>
 <CAMpxmJXvhYOVkZY7LLf=v+o8E2xKTh1RYhLrdVsS9nN1XZ5QJQ@mail.gmail.com>
 <20200907115310.GA1891694@smile.fi.intel.com> <CAMpxmJUfNkko4Rrb4N5CF_rdwRAWGhVr9DSOHfhYyTxYSH7dsQ@mail.gmail.com>
 <20200907123837.GG1891694@smile.fi.intel.com>
In-Reply-To: <20200907123837.GG1891694@smile.fi.intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 7 Sep 2020 14:57:29 +0200
Message-ID: <CAMpxmJXNYZb66SPuzR_3CEVwD=PQ6z6Ew3ia7ZL=wSU0QGhjEA@mail.gmail.com>
Subject: Re: [PATCH 23/23] Documentation: gpio: add documentation for gpio-mockup
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-doc <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Sep 7, 2020 at 2:38 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Sep 07, 2020 at 02:06:15PM +0200, Bartosz Golaszewski wrote:
> > On Mon, Sep 7, 2020 at 1:53 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Mon, Sep 07, 2020 at 12:26:34PM +0200, Bartosz Golaszewski wrote:
> > > > On Mon, Sep 7, 2020 at 11:59 AM Andy Shevchenko
> > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > On Fri, Sep 04, 2020 at 08:15:59PM -0700, Randy Dunlap wrote:
> > > > > > On 9/4/20 8:45 AM, Bartosz Golaszewski wrote:
>
> ...
>
> > > > > > > +GPIO Testing Driver
> > > > > > > +===================
> > > > > > > +
> > > > > > > +The GPIO Testing Driver (gpio-mockup) provides a way to create simulated GPIO
> > > > > > > +chips for testing purposes. There are two ways of configuring the chips exposed
> > > > > > > +by the module. The lines can be accessed using the standard GPIO character
> > > > > > > +device interface as well as manipulated using the dedicated debugfs directory
> > > > > > > +structure.
> > > > > >
> > > > > > Could configfs be used for this instead of debugfs?
> > > > > > debugfs is ad hoc.
> > > > >
> > > > > Actually sounds like a good idea.
> > > > >
> > > >
> > > > Well, then we can go on and write an entirely new mockup driver
> > > > (ditching module params and dropping any backwards compatibility)
> > > > because we're already using debugfs for line values.
> > > >
> > > > How would we pass the device properties to configfs created GPIO chips
> > > > anyway? Devices seem to only be created using mkdir. Am I missing
> > > > something?
> > >
> > > Same way how USB composite works, no?
> > >
> >
> > OK, so create a new chip directory in configfs, configure it using
> > some defined configfs attributes and then finally instantiate it from
> > sysfs?
> >
> > Makes sense and is probably the right way to go. Now the question is:
> > is it fine to just entirely remove the previous gpio-mockup?
>
> Since, for example, I never saw device property bindings for that driver I
> assume that it was never considered as an ABI, so feel free to hack it in
> either direction.
>
> > Should we
> > keep some backwards compatibility?
>
> I wouldn't probably spend time on this.
>
> > Should we introduce an entirely new
> > module and have a transition period before removing previous
> > gpio-mockup?
>
> Neither transition period.
>

I wouldn't rush this actually. gpio-mockup is used a lot by libgpiod
and probably by Kent's Go library. My main goal with this series is to
extend it to allow for more advanced testing like simulating spurious
irqs to test the software debouncer or custom line name formats to
test name lookups.

I need to think about it some more. An entirely new configfs interface
would take time too.

Bart
