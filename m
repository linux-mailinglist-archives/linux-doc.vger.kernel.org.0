Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4415E35994
	for <lists+linux-doc@lfdr.de>; Wed,  5 Jun 2019 11:21:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726945AbfFEJVw (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 5 Jun 2019 05:21:52 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:35149 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726841AbfFEJVw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 5 Jun 2019 05:21:52 -0400
Received: by mail-wr1-f66.google.com with SMTP id m3so2860888wrv.2
        for <linux-doc@vger.kernel.org>; Wed, 05 Jun 2019 02:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=HkLrjitg6lVmSSsN339H7rE/QKTw75t3z9ac6zp7EjU=;
        b=nZB7ow7AXRjSr4qoR4f1Dsl4WnuTsh3fvyjw161LZtjSwz/pSxMbXTt26WoA5HDI1P
         LbUh0dYE5eGeTFe1jAta6TMaTpOo0VwOSLzl/lko7lO+reF8XZbuesjvR8pv0qdV9b78
         1+iir5kvR09goxeok2nf1n+ktNwtVeKq4YW5wd90Z/toDEVZNz3DhmqzhmdWlWXBv+Ir
         2CVvRCgkgA/U3LIufzMtSJ4hzvOA8iOnJUl+JfPaf62th2YCjEVlFfQgM1Q92YT6/6A6
         fw3xbd8kyH86itHgB+xO/tSRmiZ+2D8j368pXtZlbrIpHdLWTi/bVx56BfKgNqN11Wde
         fEEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=HkLrjitg6lVmSSsN339H7rE/QKTw75t3z9ac6zp7EjU=;
        b=pnKDkUuNWaEld5V2T8+PhSfuZBo5B4quj/hfnF+fIfh0WU030kevTYFfR1rTKziAVJ
         EBkO6U3gnsQLiFTlVEXsJTWIhiJzmFQcsHObtzjNzojJSZ1jwUrqIsgzTlZc7fU9cxDK
         QjQxmzwyrwPMHHibayOIqfaprFi2zqeLXUSmaFhVMissej084kWvYwQymdX33K9a6fOA
         Bak4LLgwtPx3ASJzb8pdQhHNirTAHJIGrzcyVsUO+yLdU1KY5ZYzWDZTpCgXABxvRC3q
         uYzV3L2UvkDhbZpYBf4G3TyPgnSfodKN8B3OYj7jyjWi2PfvwdVYbeVdImNK98JECG8C
         BVWA==
X-Gm-Message-State: APjAAAW0SRLX4FpJmaw8koK1Q1jGpUCFOimCENePYV4UbSXIGmTUg//p
        6PVboxmXsWeIYoSBT6+IiPxBVbse6Wk=
X-Google-Smtp-Source: APXvYqzQyu7iRiNMClS/A791P+up2dhjhpkSl89DWahEDcK/qdpMbigxSNW0TCIdZjeV5mmHlyo7OQ==
X-Received: by 2002:adf:fd0f:: with SMTP id e15mr24479182wrr.104.1559726509998;
        Wed, 05 Jun 2019 02:21:49 -0700 (PDT)
Received: from dell ([2.27.167.43])
        by smtp.gmail.com with ESMTPSA id o14sm19377907wrp.77.2019.06.05.02.21.47
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Jun 2019 02:21:48 -0700 (PDT)
Date:   Wed, 5 Jun 2019 10:21:46 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Guenter Roeck <groeck@google.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Gwendal Grignou <gwendal@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Benson Leung <bleung@chromium.org>, kernel@collabora.com,
        Dmitry Torokhov <dtor@chromium.org>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        linux-doc@vger.kernel.org, Enno Luebbers <enno.luebbers@intel.com>,
        Guido Kiener <guido@kiener-muenchen.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Jonathan Corbet <corbet@lwn.net>, Wu Hao <hao.wu@intel.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Tycho Andersen <tycho@tycho.ws>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Jilayne Lovejoy <opensource@jilayne.com>
Subject: Re: [PATCH 03/10] mfd / platform: cros_ec: Miscellaneous character
 device to talk with the EC
Message-ID: <20190605092146.GR4797@dell>
References: <20190604152019.16100-4-enric.balletbo@collabora.com>
 <20190604155228.GB9981@kroah.com>
 <beaf3554bb85974eb118d7722ca55f1823b1850c.camel@collabora.com>
 <20190604183527.GA20098@kroah.com>
 <CABXOdTfU9KaBDhQcwvBGWCmVfnd02_ZFmPGtJsCtGQ-iO9A3Qw@mail.gmail.com>
 <20190604185953.GA2061@kroah.com>
 <20190605064839.GH4797@dell>
 <20190605080241.GC9693@kroah.com>
 <20190605084002.GP4797@dell>
 <20190605084813.GA26984@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190605084813.GA26984@kroah.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 05 Jun 2019, Greg Kroah-Hartman wrote:

> On Wed, Jun 05, 2019 at 09:40:02AM +0100, Lee Jones wrote:
> > On Wed, 05 Jun 2019, Greg Kroah-Hartman wrote:
> > 
> > > On Wed, Jun 05, 2019 at 07:48:39AM +0100, Lee Jones wrote:
> > > > On Tue, 04 Jun 2019, Greg Kroah-Hartman wrote:
> > > > > On Tue, Jun 04, 2019 at 11:39:21AM -0700, Guenter Roeck wrote:
> > > > > > On Tue, Jun 4, 2019 at 11:35 AM Greg Kroah-Hartman
> > > > > > <gregkh@linuxfoundation.org> wrote:
> > > > > > >
> > > > > > > On Tue, Jun 04, 2019 at 01:58:38PM -0300, Ezequiel Garcia wrote:
> > > > > > > > Hey Greg,
> > > > > > > >
> > > > > > > > > > + dev_info(&pdev->dev, "Created misc device /dev/%s\n",
> > > > > > > > > > +          data->misc.name);
> > > > > > > > >
> > > > > > > > > No need to be noisy, if all goes well, your code should be quiet.
> > > > > > > > >
> > > > > > > >
> > > > > > > > I sometimes wonder about this being noise or not, so I will slightly
> > > > > > > > hijack this thread for this discussion.
> > > > > > > >
> > > > > > > > >From a kernel developer point-of-view, or even from a platform
> > > > > > > > developer or user with a debugging hat point-of-view, having
> > > > > > > > a "device created" or "device registered" message is often very useful.
> > > > > > >
> > > > > > > For you, yes.  For someone with 30000 devices attached to their system,
> > > > > > > it is not, and causes booting to take longer than it should be.
> > > > 
> > > > Who has 30,000 devices attached to their systems?
> > > 
> > > More than you might imagine.
> > > 
> > > > I would argue that
> > > > in these special corner-cases, they should knock the log-level *down*
> > > > a notch.  For the rest of us who run normal platforms, an extra second
> > > > of boot time renders a more forthcoming/useful system than if each of
> > > > our devices initialised silently.
> > > > 
> > > > Personally I like to know what devices I have on my system, and the
> > > > kernel log is the first place I look.  As far as I'm concerned, for
> > > > the most part, if it's not in the kernel log, I don't have it.
> > > 
> > > Then you "do not have" lots of devices, as we have been removing these
> > > messages for a number of years now :)
> > > 
> > > >  "Oh wow, I didn't know I had XXX functionality on this platform."
> > > > 
> > > > In my real job, I am currently enabling some newly released AArch64
> > > > based laptops for booting with ACPI.  I must have wasted a day whilst
> > > > enabling some of the devices the system relies upon, just to find
> > > > out that 90% of them were actually probing semi-fine (at least probe()
> > > > was succeeding), just silently. *grumble*
> > > 
> > > Yup, that's normal.  If you want to see what devices are in the system,
> > > look in /sys/devices/ as that is what it is for, not the kernel log.
> > 
> > My guess is that less than 1% of Linux users use /sys/devices in this
> > way.  It's a very unfriendly interface.  Besides, when enabling a new
> > platform, access to sysfs comes too far down the line to be useful in
> > the majority of cases.
> 
> `lshw` is your friend :)

Provided you have a command line (with `lshw` installed) and a
working keyboard.  ;)

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
