Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A8BA32E736
	for <lists+linux-doc@lfdr.de>; Fri,  5 Mar 2021 12:27:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229604AbhCEL1V (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 5 Mar 2021 06:27:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:48060 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229528AbhCEL1K (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 5 Mar 2021 06:27:10 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3D1D965017;
        Fri,  5 Mar 2021 11:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1614943630;
        bh=77Pg83kkKq0rgcbztkK8cfZjKohLNoPhQhi/tRCM988=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RR3SljNqCIxku6BbPGUvFiUEaSeLEiwX3XDL9u8u7B0a/LzwudUh9DZhFL4ZZqPOo
         pf13q2D2yF0Exf/If8vIyla9YEo5nsP23REQ/M9/XAKQS7ZXBWaMDP2kMJ/H7USzVW
         RKyDre5oECSuzAbIC+Syg9yBtiwzmAB6hZrIDdNk=
Date:   Fri, 5 Mar 2021 12:27:07 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Joel Becker <jlbec@evilplan.org>,
        Christoph Hellwig <hch@lst.de>, Shuah Khan <shuah@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Kent Gibson <warthog618@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v2 08/12] drivers: export device_is_bound()
Message-ID: <YEIVi8aDSEukrK7E@kroah.com>
References: <20210304102452.21726-1-brgl@bgdev.pl>
 <20210304102452.21726-9-brgl@bgdev.pl>
 <CAMuHMdXRK5=w1-Z=EbM60Sf2bLY1EiVaxbZjMP+XyQ3g7nBpZw@mail.gmail.com>
 <YEHs3CxWnusWklME@kroah.com>
 <CAMRc=MddDb+nakgEM+Xeqm=rMMkkWO2EDekD36EoPJashYP88w@mail.gmail.com>
 <YEHyDUQ3V7Pl6+TU@kroah.com>
 <CAMRc=Md7FeQAd4Syh685+jyZAq2QStBNoo0ACQxrSB=4N6d3dg@mail.gmail.com>
 <YEIG0u8Vg3e6ZBhz@kroah.com>
 <CAMRc=Meznt=5m_4OnSRf04xHsUy39hH7S7_8ftZaHq6GD-taEw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Meznt=5m_4OnSRf04xHsUy39hH7S7_8ftZaHq6GD-taEw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Mar 05, 2021 at 11:58:18AM +0100, Bartosz Golaszewski wrote:
> On Fri, Mar 5, 2021 at 11:24 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Fri, Mar 05, 2021 at 10:16:10AM +0100, Bartosz Golaszewski wrote:
> > > On Fri, Mar 5, 2021 at 9:55 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> > > >
> > > > On Fri, Mar 05, 2021 at 09:45:41AM +0100, Bartosz Golaszewski wrote:
> > > > > On Fri, Mar 5, 2021 at 9:34 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> > > > > >
> > > > > > On Fri, Mar 05, 2021 at 09:18:30AM +0100, Geert Uytterhoeven wrote:
> > > > > > > CC Greg
> > > > > > >
> > > > > > > On Thu, Mar 4, 2021 at 11:30 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > > > > > > >
> > > > > > > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > > > > > >
> > > > > > > > Export the symbol for device_is_bound() so that we can use it in gpio-sim
> > > > > > > > to check if the simulated GPIO chip is bound before fetching its driver
> > > > > > > > data from configfs callbacks in order to retrieve the name of the GPIO
> > > > > > > > chip device.
> > > > > > > >
> > > > > > > > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > > > > > > ---
> > > > > > > >  drivers/base/dd.c | 1 +
> > > > > > > >  1 file changed, 1 insertion(+)
> > > > > > > >
> > > > > > > > diff --git a/drivers/base/dd.c b/drivers/base/dd.c
> > > > > > > > index 9179825ff646..c62c02e3490a 100644
> > > > > > > > --- a/drivers/base/dd.c
> > > > > > > > +++ b/drivers/base/dd.c
> > > > > > > > @@ -353,6 +353,7 @@ bool device_is_bound(struct device *dev)
> > > > > > > >  {
> > > > > > > >         return dev->p && klist_node_attached(&dev->p->knode_driver);
> > > > > > > >  }
> > > > > > > > +EXPORT_SYMBOL_GPL(device_is_bound);
> > > > > >
> > > > > > No.  Please no.  Why is this needed?  Feels like someone is doing
> > > > > > something really wrong...
> > > > > >
> > > > > > NACK.
> > > > > >
> > > > >
> > > > > I should have Cc'ed you the entire series, my bad.
> > > > >
> > > > > This is the patch that uses this change - it's a new, improved testing
> > > > > module for GPIO using configfs & sysfs as you (I think) suggested a
> > > > > while ago:
> > > > >
> > > > > https://lkml.org/lkml/2021/3/4/355
> > > > >
> > > > > The story goes like this: committing the configfs item registers a
> > > > > platform device.
> > > >
> > > > Ick, no, stop there, that's not a "real" device, please do not abuse
> > > > platform devices like that, you all know I hate this :(
> > > >
> > > > Use the virtbus code instead perhaps?
> > > >
> > >
> > > I have no idea what virtbus is and grepping for it only returns three
> > > hits in: ./drivers/pci/iov.c and it's a function argument.
> > >
> > > If it stands for virtual bus then for sure it sounds like the right
> > > thing but I need to find more info on this.
> >
> > Sorry, wrong name, see Documentation/driver-api/auxiliary_bus.rst for
> > the details.  "virtbus" was what I think about it as that was my
> > original name for it, but it eventually got merged with a different
> > name.
> >
> > > > > As far as I understand - there's no guarantee that
> > > > > the device will be bound to a driver before the commit callback (or
> > > > > more specifically platform_device_register_full() in this case)
> > > > > returns so the user may try to retrieve the name of the device
> > > > > immediately (normally user-space should wait for the associated uevent
> > > > > but nobody can force that) by doing:
> > > > >
> > > > > mv /sys/kernel/config/gpio-sim/pending/foo /sys/kernel/config/gpio-sim/live/
> > > > > cat /sys/kernel/config/gpio-sim/live/foo/dev_name
> > > > >
> > > > > If the device is not bound at this point, we'll have a crash in the
> > > > > kernel as opposed to just returning -ENODEV.
> > > >
> > > > How will the kernel crash?  What has created the dev_name sysfs file
> > > > before it is possible to be read from?  That feels like the root
> > > > problem.
> > > >
> > >
> > > It's not sysfs - it's in configfs. Each chip has a read-only configfs
> > > attribute that returns the name of the device - I don't really have a
> > > better idea to map the configfs items to devices that committing
> > > creates.
> >
> > Same question, why are you exporting a configfs attribute that can not
> > be read from?  Only export it when your driver is bound to the device.
> >
> 
> The device doesn't know anything about configfs. Why would it? The
> configuration of a GPIO chip can't be changed after it's instantiated,
> this is why we have committable items.
> 
> We export a directory in configfs: gpio-sim -> user creates a new
> directory (item) in gpio-sim/pending/foo and it's not tied to any
> device yet but exports attributes which we use to configure the device
> (label, number of lines, line names etc.), then we mv
> gpio-sim/pending/foo gpio-sim/live and this is when the device gets
> created and registered with the subsystem. We take all the configured
> attributes and put them into device properties for both the driver and
> gpiolib core (for standard properties) to read - just like we would
> with a regular GPIO driver because this is the goal: test the core
> code.

Ok, but they why are you trying to have dev_name be an exported thing?
I don't understand an attribute here that is visable but can not be read
from.

And why not just use the default device name function: dev_name(), which
will always return a string that will work no matter if the device is
bound to a driver or not.

thanks,

greg k-h
