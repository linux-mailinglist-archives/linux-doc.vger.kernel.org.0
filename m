Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4ED842D12AA
	for <lists+linux-doc@lfdr.de>; Mon,  7 Dec 2020 14:56:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726653AbgLGNz0 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 7 Dec 2020 08:55:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20588 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726685AbgLGNzZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 Dec 2020 08:55:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607349239;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=a53OP+sz/FZD7xQxfgASvprmIF0p8vj6RU1ckdy2paI=;
        b=P0TTNfvwLKemBB+gUxehe1fgfMqUNgyiU2FJCQP5pYDzKJagdmVnCW/IpRN7Z8BeW9/ojm
        MDWjuYMHdb27llB9lPUitfJVoSr6ZdxNjFVylRBqr/YO7MFYsha+JLhejDB2wkwjdFj6PO
        0PYASCG5ClPFRDw+tUxXtRqavDDtNcs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-uTXOdWkdM96KrjNj_ngKxA-1; Mon, 07 Dec 2020 08:53:56 -0500
X-MC-Unique: uTXOdWkdM96KrjNj_ngKxA-1
Received: by mail-wm1-f70.google.com with SMTP id a134so4158624wmd.8
        for <linux-doc@vger.kernel.org>; Mon, 07 Dec 2020 05:53:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=a53OP+sz/FZD7xQxfgASvprmIF0p8vj6RU1ckdy2paI=;
        b=NS4BLBaANc9LYLbURkr/VGMcjRyWh4Klkdjldbt5lU9/AKxG8oMHvzqLMKVH2max+z
         y/zrVDAs/iNspmJNcMwZabSMoT/dhmV9PC+pCWSjffz1ow2+TqJHuZxi+Ei2LlwPxqS5
         NqWFBqgUXJS7xvKLbQsd+CGALfGkPPeWpvuiEyBXh238ug6OXdce+gNwzgMHt5/CmBN4
         DDBYIJgW9ucm8MJnu+5ji9nF5ZTgmgXhT8hTAeI0EQbylf+XleWY3fxMkSWm4CPsmCSy
         T+zokNRelBepPnu+3xufSbxT87Z8rS/rZfb4d81BHJKi4OmLedqAFuQdOXVAFw38JmmZ
         Jd5Q==
X-Gm-Message-State: AOAM533jcw6hoJAYBb38RsiTXUQNWSwDu1l6/+SBZLYM0W4bP1lBs4tf
        Vw52m1qz2ogWVroNYv7KPsZ9TWj3uwEuG/tiMgpn2tJDvBO43zLFGT61W4iKK0c2aF7zFiEabMc
        SgzY+b8L0gHJbh+dDzVOT
X-Received: by 2002:a1c:7218:: with SMTP id n24mr18476343wmc.186.1607349233152;
        Mon, 07 Dec 2020 05:53:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxDMDoy/W2sgstBoP6oEPEFLzcmZHr+KtnYFjyMu7YeY3+NBrhAUVxzjo1UnbiGlW76bxVjFA==
X-Received: by 2002:a1c:7218:: with SMTP id n24mr18476325wmc.186.1607349232936;
        Mon, 07 Dec 2020 05:53:52 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
        by smtp.gmail.com with ESMTPSA id m81sm13857942wmf.29.2020.12.07.05.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 05:53:52 -0800 (PST)
Date:   Mon, 7 Dec 2020 08:53:49 -0500
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Jason Wang <jasowang@redhat.com>
Cc:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        linux-kernel@vger.kernel.org, corbet@lwn.net,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        linux-doc@vger.kernel.org, linux-gpio@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-riscv@lists.infradead.org, stefanha@redhat.com,
        msuchanek@suse.de
Subject: Re: [PATCH v2 2/2] drivers: gpio: add virtio-gpio guest driver
Message-ID: <20201207085247-mutt-send-email-mst@kernel.org>
References: <20201203191135.21576-1-info@metux.net>
 <20201203191135.21576-2-info@metux.net>
 <8209ce55-a4aa-f256-b9b9-f7eb3cac877b@redhat.com>
 <96aca1e6-2d5a-deb1-2444-88f938c7a9de@metux.net>
 <20201205142218-mutt-send-email-mst@kernel.org>
 <842519cc-94ca-3c11-ddd6-543e5a89c998@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <842519cc-94ca-3c11-ddd6-543e5a89c998@redhat.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Dec 07, 2020 at 11:12:50AM +0800, Jason Wang wrote:
> 
> On 2020/12/6 上午3:32, Michael S. Tsirkin wrote:
> > On Sat, Dec 05, 2020 at 08:59:55AM +0100, Enrico Weigelt, metux IT consult wrote:
> > > On 04.12.20 04:35, Jason Wang wrote:
> > > 
> > > > > --- a/drivers/gpio/Kconfig
> > > > > +++ b/drivers/gpio/Kconfig
> > > > > @@ -1615,6 +1615,15 @@ config GPIO_MOCKUP
> > > > > Â Â Â Â Â Â Â  tools/testing/selftests/gpio/gpio-mockup.sh. Reference the
> > > > > usage in
> > > > > Â Â Â Â Â Â Â  it.
> > > > > Â  +config GPIO_VIRTIO
> > > > > +Â Â Â  tristate "VirtIO GPIO support"
> > > > > +Â Â Â  depends on VIRTIO
> > > > 
> > > > Let's use select, since there's no prompt for VIRTIO and it doesn't have
> > > > any dependencies.
> > > whoops, it's not that simple:
> > > 
> > > make: Entering directory '/home/nekrad/src/apu2-dev/pkg/kernel.apu2.git'
> > > make[1]: Entering directory
> > > '/home/nekrad/src/dk/DistroKit/platform-x86_64/build-target/linux-5.8.9-build'
> > >    GEN     Makefile
> > > drivers/gpu/drm/Kconfig:74:error: recursive dependency detected!
> > > drivers/gpu/drm/Kconfig:74:	symbol DRM_KMS_HELPER is selected by
> > > DRM_VIRTIO_GPU
> > > drivers/gpu/drm/virtio/Kconfig:2:	symbol DRM_VIRTIO_GPU depends on VIRTIO
> > > drivers/virtio/Kconfig:2:	symbol VIRTIO is selected by GPIO_VIRTIO
> > > drivers/gpio/Kconfig:1618:	symbol GPIO_VIRTIO depends on GPIOLIB
> > > drivers/gpio/Kconfig:14:	symbol GPIOLIB is selected by I2C_MUX_LTC4306
> > > drivers/i2c/muxes/Kconfig:47:	symbol I2C_MUX_LTC4306 depends on I2C
> > > drivers/i2c/Kconfig:8:	symbol I2C is selected by FB_DDC
> > > drivers/video/fbdev/Kconfig:63:	symbol FB_DDC depends on FB
> > > drivers/video/fbdev/Kconfig:12:	symbol FB is selected by DRM_KMS_FB_HELPER
> > > drivers/gpu/drm/Kconfig:80:	symbol DRM_KMS_FB_HELPER depends on
> > > DRM_KMS_HELPER
> > > 
> > > Seems that we can only depend on or select some symbol - we run into
> > > huge trouble if thats mixed. Just changed DRM_VIRTIO_GPU to just select
> > > VIRIO instead of depending on it, and now it works.
> > > 
> > > I've posted another patch for fixing drivers/gpu/drm/virtio/Kconfig
> > > to use 'select' instead of 'depends on'.
> > It seems a bit of a mess, at this point I'm not entirely sure when
> > should drivers select VIRTIO and when depend on it.
> > 
> > The text near it says:
> > 
> > # SPDX-License-Identifier: GPL-2.0-only
> > config VIRTIO
> >          tristate
> >          help
> >            This option is selected by any driver which implements the virtio
> >            bus, such as CONFIG_VIRTIO_PCI, CONFIG_VIRTIO_MMIO, CONFIG_RPMSG
> >            or CONFIG_S390_GUEST.
> > 
> > Which seems clear enough and would indicate drivers for devices *behind*
> > the bus should not select VIRTIO and thus presumably should "depend on" it.
> > This is violated in virtio console and virtio fs drivers.
> > 
> > For console it says:
> > 
> > commit 9f30eb29c514589e16f2999ea070598583d1f6ec
> > Author: Michal Suchanek <msuchanek@suse.de>
> > Date:   Mon Aug 31 18:58:50 2020 +0200
> > 
> >      char: virtio: Select VIRTIO from VIRTIO_CONSOLE.
> >      Make it possible to have virtio console built-in when
> >      other virtio drivers are modular.
> >      Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> >      Reviewed-by: Amit Shah <amit@kernel.org>
> >      Link: https://lore.kernel.org/r/20200831165850.26163-1-msuchanek@suse.de
> >      Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > 
> > which seems kind of bogus - why do we care about allowing a builtin
> > virtio console driver if the pci virtio bus driver is a module?
> > There won't be any devices on the bus to attach to ...
> 
> 
> For testing like switching bus from pci to MMIO?


Not sure I understand ... can you give an example?

> 
> > And for virtio fs it was like this from the beginning.
> > 
> > I am inclined to fix console and virtio fs to depend on VIRTIO:
> > select is harder to use correctly ...
> > 
> > Jason?
> 
> 
> I think it works, but we need a prompt for VIRTIO otherwise there's no way
> to enable it.
> 
> Thanks

That's even messier. No one needs VIRTIO core by itself - it's only used
by transports and drivers.

> 
> > 
> > 
> > > -- 
> > > ---
> > > Hinweis: unverschlÃ¼sselte E-Mails kÃ¶nnen leicht abgehÃ¶rt und manipuliert
> > > werden ! FÃ¼r eine vertrauliche Kommunikation senden Sie bitte ihren
> > > GPG/PGP-SchlÃ¼ssel zu.
> > > ---
> > > Enrico Weigelt, metux IT consult
> > > Free software and Linux embedded engineering
> > > info@metux.net -- +49-151-27565287

