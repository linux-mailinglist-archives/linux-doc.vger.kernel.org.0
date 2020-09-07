Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7218125FA2A
	for <lists+linux-doc@lfdr.de>; Mon,  7 Sep 2020 14:10:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729177AbgIGMKT (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 7 Sep 2020 08:10:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729212AbgIGMGk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 Sep 2020 08:06:40 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 473F7C061575
        for <linux-doc@vger.kernel.org>; Mon,  7 Sep 2020 05:06:27 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id a26so17954442ejc.2
        for <linux-doc@vger.kernel.org>; Mon, 07 Sep 2020 05:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Tw4f2wX8YqmmfCG4fLEsa1aDy9xcwa2clW6NhysDtyc=;
        b=vXqecv/JD1j08x2l2xv8uMY2f5Yrx4K3HukAwUizDgeJSij+T75ajGmL1q9blQ9UrJ
         qCvwj8FsbXkYLIOkfpnIyoCMd0YWDwu7jzDwuPBz5d/I0pvFV2rv2MaIlzwpB+L6BBvL
         KLuAAE/uYoT21Qcb0Ek9uNjNv+Tc1kJZB6gBNZEqfR4K8F3owTI8UDBaBNdeerEXBRQf
         svknQedIT00FvncGNd3SMt5eJGRvr9n1qI1k7jYBXFJTuIChik7GAJQR8GK7RuqOeYDV
         6OpI9z0F1CVv5xPg/cyAf/YafdgiGJcwRMOp33wT+hcztaMEzFbH2LHAvgY5FPcU8BxK
         qNyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Tw4f2wX8YqmmfCG4fLEsa1aDy9xcwa2clW6NhysDtyc=;
        b=W+6ZeuYV1em7FC1mU8h3fAdbMYGvhuTwgm5Ly4tQgGmOrglvw0agYCO7G7+DzOYJ3c
         RyRGBK2se9axzuBtNTglbBlv/whJy7oHJLJ3+D/tEMn42P3bxS5Iks5CdSeO6SdDg/0h
         5mVG8Vlkw7ZE7HXS9LAJM6Be1Zvd6VfFQCz4irqS0ux8SSI0aqJdmsaNIyXlbvL4Uav1
         B2zzjEXIy+E69HQ8JR7aV/ER47QhVorMGUcqhYfUwngihKGsiKFVeh+TfcySXuuIUmkT
         WTyY5Ra4pSLPbTBG1YB6yTc9yRL7PQECZpVOEPX+0hPg1VvnUAJLRW7U9dGO8VaMnOcL
         3jmg==
X-Gm-Message-State: AOAM530dQYUiCaMKyPhxo/BAX3kR96MII2xdq98X3OvmGvPiUarUo/ca
        h0fHpH0o3bCETneqsSKWHhoiZu8xc1EF7fSzUb+JEA==
X-Google-Smtp-Source: ABdhPJw+GbBoK76Yk9oXUxiHnhTP8BrVOQx6dDXADdyKLjOSvFHDs9IyPG0ZhERjAUhRxXRKmTxwpbMibpY7sdicuFI=
X-Received: by 2002:a17:906:f11:: with SMTP id z17mr2135074eji.88.1599480386425;
 Mon, 07 Sep 2020 05:06:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200904154547.3836-1-brgl@bgdev.pl> <20200904154547.3836-24-brgl@bgdev.pl>
 <26ea1683-da8f-30e7-f004-3616e96d56b3@infradead.org> <20200907095932.GU1891694@smile.fi.intel.com>
 <CAMpxmJXvhYOVkZY7LLf=v+o8E2xKTh1RYhLrdVsS9nN1XZ5QJQ@mail.gmail.com> <20200907115310.GA1891694@smile.fi.intel.com>
In-Reply-To: <20200907115310.GA1891694@smile.fi.intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 7 Sep 2020 14:06:15 +0200
Message-ID: <CAMpxmJUfNkko4Rrb4N5CF_rdwRAWGhVr9DSOHfhYyTxYSH7dsQ@mail.gmail.com>
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

On Mon, Sep 7, 2020 at 1:53 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Sep 07, 2020 at 12:26:34PM +0200, Bartosz Golaszewski wrote:
> > On Mon, Sep 7, 2020 at 11:59 AM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > On Fri, Sep 04, 2020 at 08:15:59PM -0700, Randy Dunlap wrote:
> > > > On 9/4/20 8:45 AM, Bartosz Golaszewski wrote:
> > >
> > > ...
> > >
> > > > > +GPIO Testing Driver
> > > > > +===================
> > > > > +
> > > > > +The GPIO Testing Driver (gpio-mockup) provides a way to create simulated GPIO
> > > > > +chips for testing purposes. There are two ways of configuring the chips exposed
> > > > > +by the module. The lines can be accessed using the standard GPIO character
> > > > > +device interface as well as manipulated using the dedicated debugfs directory
> > > > > +structure.
> > > >
> > > > Could configfs be used for this instead of debugfs?
> > > > debugfs is ad hoc.
> > >
> > > Actually sounds like a good idea.
> > >
> >
> > Well, then we can go on and write an entirely new mockup driver
> > (ditching module params and dropping any backwards compatibility)
> > because we're already using debugfs for line values.
> >
> > How would we pass the device properties to configfs created GPIO chips
> > anyway? Devices seem to only be created using mkdir. Am I missing
> > something?
>
> Same way how USB composite works, no?
>

OK, so create a new chip directory in configfs, configure it using
some defined configfs attributes and then finally instantiate it from
sysfs?

Makes sense and is probably the right way to go. Now the question is:
is it fine to just entirely remove the previous gpio-mockup? Should we
keep some backwards compatibility? Should we introduce an entirely new
module and have a transition period before removing previous
gpio-mockup?

Also: this is a testing module so to me debugfs is just fine. Is
configfs considered stable ABI like sysfs?

Bart
