Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 758F225FBB0
	for <lists+linux-doc@lfdr.de>; Mon,  7 Sep 2020 15:54:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729686AbgIGNxZ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 7 Sep 2020 09:53:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729543AbgIGNto (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 Sep 2020 09:49:44 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE3A5C061573
        for <linux-doc@vger.kernel.org>; Mon,  7 Sep 2020 06:49:35 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id l17so12832225edq.12
        for <linux-doc@vger.kernel.org>; Mon, 07 Sep 2020 06:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XZkLomLib6REZxGcB13cjfAcIZQ8j5/AgQHdwRkSrk0=;
        b=0bzBc0rjsSCxBE1AN+yH+086oSRWcCd5qjvDJyEnbLsLlSfTn9H3CvFC3r7VPMXKWs
         Eh8DEj/bnaCcJgdGu5U9TG0LTuxYm5RXKgbSkJex+auJVF5Col6AkxfTfbL8pdj2fM2T
         7iH+Z7OcAy2lOMZlUhM5cM2B2GCZG9aeyKCmvopGO5D7iz/IhUd+V5YKZ/y9huDb9aAs
         xzGPurWWxhiEbCZBUxLDJe6+dZFG9jUwWta6P1dli45fq+JfthHFj/6Jy/VREBX13VqK
         KgcPw0LJ97bBwsm6h3Pt2hObpI8UuQhLBnUwbfMVYJ0mxdKcT2lUGNIIX3HLofO5SsE4
         bicQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XZkLomLib6REZxGcB13cjfAcIZQ8j5/AgQHdwRkSrk0=;
        b=T8guHqFkco+UkhdkVPTHaAIdu0OD20De7DlzNqWl4WfXXdC2vshWC6KhkWgIpuCf5b
         VGjhnTYeLtas2GpgRnScL2Ut8ycZtRvKBO43nuE7FQ+wT2h9vbRyaqtsdKje2+mbptjs
         eS+O6Pycy7ynsAoH8BqcwG9JD6FfYqxkK2/PUiCy2RivehFP5jpafkABAMGw/kVeZG5a
         v6GBBc9y33awpgFYZrMsXnvO1+LfYmSVV1jyNCfYjia+SxmFZdIWeh3Vs4+ah0ISErAj
         dMFWJHfElvplgml/0jjH/1jEi+7TEcd325JcOwqw1dPTPzkgNWML81aj9VTXMGKVwTFy
         syPQ==
X-Gm-Message-State: AOAM531Pmbo3FoHmgxtC6AmcrrF5mfbAgr7/95Sn/V//kwqkMYxerCAf
        BChKdR9+LeOEKHboyos6MQGQdt5Su+D4RUe+SbU7zg==
X-Google-Smtp-Source: ABdhPJzhEluKdgYZ4MWnxjBqFsobQ3ZUoS/aewy6S0+xnMJ7yFw4veFRt3xmMQoMX1dmxmwU0YOjWmerxNVEkmWgDqM=
X-Received: by 2002:a05:6402:b72:: with SMTP id cb18mr21084458edb.299.1599486574313;
 Mon, 07 Sep 2020 06:49:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200904154547.3836-1-brgl@bgdev.pl> <20200904154547.3836-24-brgl@bgdev.pl>
 <26ea1683-da8f-30e7-f004-3616e96d56b3@infradead.org> <20200907095932.GU1891694@smile.fi.intel.com>
 <CAMpxmJXvhYOVkZY7LLf=v+o8E2xKTh1RYhLrdVsS9nN1XZ5QJQ@mail.gmail.com>
 <20200907115310.GA1891694@smile.fi.intel.com> <CAMpxmJUfNkko4Rrb4N5CF_rdwRAWGhVr9DSOHfhYyTxYSH7dsQ@mail.gmail.com>
 <20200907122238.GA1849893@kroah.com>
In-Reply-To: <20200907122238.GA1849893@kroah.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 7 Sep 2020 15:49:23 +0200
Message-ID: <CAMpxmJXM=8oGoPSGg8G8XJ4HXJFrAQ2-_EXrz3rf3+ZmCSWB7g@mail.gmail.com>
Subject: Re: [PATCH 23/23] Documentation: gpio: add documentation for gpio-mockup
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Jonathan Corbet <corbet@lwn.net>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-doc <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Sep 7, 2020 at 2:22 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, Sep 07, 2020 at 02:06:15PM +0200, Bartosz Golaszewski wrote:
> > On Mon, Sep 7, 2020 at 1:53 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > On Mon, Sep 07, 2020 at 12:26:34PM +0200, Bartosz Golaszewski wrote:
> > > > On Mon, Sep 7, 2020 at 11:59 AM Andy Shevchenko
> > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > >
> > > > > On Fri, Sep 04, 2020 at 08:15:59PM -0700, Randy Dunlap wrote:
> > > > > > On 9/4/20 8:45 AM, Bartosz Golaszewski wrote:
> > > > >
> > > > > ...
> > > > >
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
> > is it fine to just entirely remove the previous gpio-mockup? Should we
> > keep some backwards compatibility? Should we introduce an entirely new
> > module and have a transition period before removing previous
> > gpio-mockup?
> >
> > Also: this is a testing module so to me debugfs is just fine. Is
> > configfs considered stable ABI like sysfs?
>
> Yes it is.  Or at least until you fix all existing users so that if you
> do change it, no one notices it happening :)
>

Then another question is: do we really want to commit to a stable ABI
for a module we only use for testing purposes and which doesn't
interact with any real hardware.

Rewriting this module without any legacy cruft is tempting though. :)

Bart
