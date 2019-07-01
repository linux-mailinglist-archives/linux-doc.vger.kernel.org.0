Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B1B735728
	for <lists+linux-doc@lfdr.de>; Wed,  5 Jun 2019 08:48:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726595AbfFEGso (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 5 Jun 2019 02:48:44 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:33697 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726050AbfFEGsn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 5 Jun 2019 02:48:43 -0400
Received: by mail-wr1-f65.google.com with SMTP id n9so5780557wru.0
        for <linux-doc@vger.kernel.org>; Tue, 04 Jun 2019 23:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=W5TWY3xUWmyojqlHiseZupOW72dJuoI59Q3NcPm8hCw=;
        b=crhUFX5XRcg8XMuiXovWdKrby4iZ6ka7l5XuzpjWsH+FaIIMX3VE8SU14DdE1ABhGx
         n3MNuBTrTJABc6TyVvp0zxXeuk4Sh8m02mz0C8kfLuHIShEtxEebxnAyReniJKeAMfSu
         PwEdukfO29TTJNh6nfWqNZR2wYSOtQlCnChP7RoqPo4Y7riA19vkx05OP3fHtA8isgdd
         r3EECVmM+qz8NwBUjr5Ivv+T3Woj/98Lc8n6CrzH2KowTqAqI3kvYG28+dYxu1u5hj0/
         YyF33PhYMVpwphfL2YdxF7ZvaAzJl+SlGMmoX4Z8eGfER4shOfoU9NnbKXNkLMiKZ47N
         eRrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=W5TWY3xUWmyojqlHiseZupOW72dJuoI59Q3NcPm8hCw=;
        b=rNRCh7Y9Jky5AZXr7vQ1NKnZ59BFfwRbANETqRGpIUAOiA+oFoQKRPKJRi2TMJ4p+B
         wnfjPQIwDCxMYtqJlZR1sgYgWN+ejZ737RLFf9KlRzFvZhu0SJawIxHVH4LNOIxMeg1S
         tSd1p+ydxEC3bNwNljBsw9mK4k08u6jllc4H7YO4OmbL/EmS9sQ1fjZCZk9cd6DvhmUN
         GpFe3HgIupL8mFoUm4TmoypTzjBSetASSNq4be3dxaGSzo+vVIopS6ndQillZysCtHoB
         kRICaLqObtpdVw77UHZAFeDioZGO1SGuILCx/DNMF1mzU9r93atQHLlbFwItfIUvlqm6
         bPNA==
X-Gm-Message-State: APjAAAXynFyvGbdQ8vuxMGb6NkBe1iBs5CRe3hb5UoArcczCqesu6vqX
        5lQyilVfTswygiMFXa6JhEzEdA==
X-Google-Smtp-Source: APXvYqxfoyrq9ifabub4X4wof+1Er2oF20iwQEKwJ1norepUGBPvtiFM7uN0lntWIFsHUufUAwbL1w==
X-Received: by 2002:a5d:424f:: with SMTP id s15mr5388490wrr.37.1559717321800;
        Tue, 04 Jun 2019 23:48:41 -0700 (PDT)
Received: from dell ([2.27.167.43])
        by smtp.gmail.com with ESMTPSA id y17sm43465891wrg.18.2019.06.04.23.48.40
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Jun 2019 23:48:41 -0700 (PDT)
Date:   Wed, 5 Jun 2019 07:48:39 +0100
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
Message-ID: <20190605064839.GH4797@dell>
References: <20190604152019.16100-1-enric.balletbo@collabora.com>
 <20190604152019.16100-4-enric.balletbo@collabora.com>
 <20190604155228.GB9981@kroah.com>
 <beaf3554bb85974eb118d7722ca55f1823b1850c.camel@collabora.com>
 <20190604183527.GA20098@kroah.com>
 <CABXOdTfU9KaBDhQcwvBGWCmVfnd02_ZFmPGtJsCtGQ-iO9A3Qw@mail.gmail.com>
 <20190604185953.GA2061@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190604185953.GA2061@kroah.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 04 Jun 2019, Greg Kroah-Hartman wrote:
> On Tue, Jun 04, 2019 at 11:39:21AM -0700, Guenter Roeck wrote:
> > On Tue, Jun 4, 2019 at 11:35 AM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Tue, Jun 04, 2019 at 01:58:38PM -0300, Ezequiel Garcia wrote:
> > > > Hey Greg,
> > > >
> > > > > > + dev_info(&pdev->dev, "Created misc device /dev/%s\n",
> > > > > > +          data->misc.name);
> > > > >
> > > > > No need to be noisy, if all goes well, your code should be quiet.
> > > > >
> > > >
> > > > I sometimes wonder about this being noise or not, so I will slightly
> > > > hijack this thread for this discussion.
> > > >
> > > > >From a kernel developer point-of-view, or even from a platform
> > > > developer or user with a debugging hat point-of-view, having
> > > > a "device created" or "device registered" message is often very useful.
> > >
> > > For you, yes.  For someone with 30000 devices attached to their system,
> > > it is not, and causes booting to take longer than it should be.

Who has 30,000 devices attached to their systems?  I would argue that
in these special corner-cases, they should knock the log-level *down*
a notch.  For the rest of us who run normal platforms, an extra second
of boot time renders a more forthcoming/useful system than if each of
our devices initialised silently.

Personally I like to know what devices I have on my system, and the
kernel log is the first place I look.  As far as I'm concerned, for
the most part, if it's not in the kernel log, I don't have it.

 "Oh wow, I didn't know I had XXX functionality on this platform."

In my real job, I am currently enabling some newly released AArch64
based laptops for booting with ACPI.  I must have wasted a day whilst
enabling some of the devices the system relies upon, just to find
out that 90% of them were actually probing semi-fine (at least probe()
was succeeding), just silently. *grumble*

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
