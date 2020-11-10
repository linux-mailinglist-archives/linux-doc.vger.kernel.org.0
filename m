Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED23C2AD2D2
	for <lists+linux-doc@lfdr.de>; Tue, 10 Nov 2020 10:50:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731643AbgKJJus (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 10 Nov 2020 04:50:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731442AbgKJJur (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 10 Nov 2020 04:50:47 -0500
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC015C0613D1
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2020 01:50:46 -0800 (PST)
Received: by mail-ej1-x641.google.com with SMTP id o23so16619473ejn.11
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2020 01:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/xvo1QegjGszfBVPbZfwcJiTRf9LyLsH4tfXgS3DTXk=;
        b=XBZqy3t9IZQRFydJbi3EOQsbNKSoGIh1pco/g0+bITyoIUkri4wfPjhNf10PvUjdHM
         oiUisGj+v2Bm78WVce9YT8uqvFdrkdOzLCpu67P/MAJzNpCqHb4m8FThormd6bSjouLr
         54cSY+5h7nBsSNX31MZu8MmYatBGeKY3cH/a8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/xvo1QegjGszfBVPbZfwcJiTRf9LyLsH4tfXgS3DTXk=;
        b=X/rMtWPI1/B3BnPKGVO30Y0AiUgjs2zQvQFfVAb/cUYAaw+W1h4p4x4BkBswrQgtpU
         HTCHPV/N1ttuP7/VCco5jUE+BjOv5Q6XeX89ACk4k4A955B/U8CYJAA3bzT4CpnxCOfO
         GzdA8JmU+aS8Vbek93N3L6G9b1PZZnCHcoY60gkjwMcpQH/BEcBrghJVsJ4G4kwp7yOq
         EzGntALaEorrvZ/OX4+dbTRvQSXte8OGhkSHro8+UyhMv3Ij2HAfwmuRyd+qYTF+4VK5
         gpS+XynHWfTBxesC3Vil5QkB1qfrFQJqGkG3QGZik97KRPagcVMXx3DAok3aq6tY/Ol3
         fS6A==
X-Gm-Message-State: AOAM5310dZXJytsh94Yb8/R59r1nLGY56rlmxUXRSY39jqzG0eV0Kv58
        lyRcD0r+qEdJUc1NIuzGQy3Nl2WLnWtkqw==
X-Google-Smtp-Source: ABdhPJyHDHHp65bGTeEoApM6kpOgqE6rE6kdKMXmWCmgIrPIhWvP8X+X/CT5n4WNaJBU0x5NIE/o8w==
X-Received: by 2002:a17:906:82c4:: with SMTP id a4mr18239946ejy.131.1605001845276;
        Tue, 10 Nov 2020 01:50:45 -0800 (PST)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com. [209.85.221.44])
        by smtp.gmail.com with ESMTPSA id c8sm10388739edr.29.2020.11.10.01.50.44
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2020 01:50:44 -0800 (PST)
Received: by mail-wr1-f44.google.com with SMTP id 23so11938792wrc.8
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2020 01:50:44 -0800 (PST)
X-Received: by 2002:adf:ed11:: with SMTP id a17mr8193482wro.197.1605001843595;
 Tue, 10 Nov 2020 01:50:43 -0800 (PST)
MIME-Version: 1.0
References: <20200930160917.1234225-1-hch@lst.de> <20200930160917.1234225-9-hch@lst.de>
 <CAAFQd5CttttqMXb=iDPb+Z0WGUa2g=W6JwXJ-5HbhmrDyxP+cQ@mail.gmail.com>
 <CANiDSCtefXKw-xC3bskyggW-BzCmVPj6GGLvO=cCPZHbS1oTDA@mail.gmail.com>
 <20201110092506.GA24469@lst.de> <CANiDSCsBUBV1WA2To9x26Uhc5SU-4xuh3m4wUwXBcGwA6n8now@mail.gmail.com>
In-Reply-To: <CANiDSCsBUBV1WA2To9x26Uhc5SU-4xuh3m4wUwXBcGwA6n8now@mail.gmail.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 10 Nov 2020 18:50:32 +0900
X-Gmail-Original-Message-ID: <CAAFQd5CCOrp0OA_n_SHNO5RAhV-MQ2KuQJA+oWHQ76h_So=M2Q@mail.gmail.com>
Message-ID: <CAAFQd5CCOrp0OA_n_SHNO5RAhV-MQ2KuQJA+oWHQ76h_So=M2Q@mail.gmail.com>
Subject: Re: [PATCH 8/8] WIP: add a dma_alloc_contiguous API
To:     Ricardo Ribalda <ribalda@chromium.org>,
        Christoph Hellwig <hch@lst.de>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Nov 10, 2020 at 6:33 PM Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> Hi Christoph
>
> On Tue, Nov 10, 2020 at 10:25 AM Christoph Hellwig <hch@lst.de> wrote:
> >
> > On Mon, Nov 09, 2020 at 03:53:55PM +0100, Ricardo Ribalda wrote:
> > > Hi Christoph
> > >
> > > I have started now to give a try to your patchset. Sorry for the delay.
> > >
> > > For uvc I have prepared this patch:
> > > https://github.com/ribalda/linux/commit/9094fe223fe38f8c8ff21366d893b43cbbdf0113
> > >
> > > I have tested successfully in a x86_64 noteboot..., yes I know there
> > > is no change for that platform :).
> > > I am trying to get hold of an arm device that can run the latest
> > > kernel from upstream.
> > >
> > > On the meanwhile if you could take a look to the patch to verify that
> > > this the way that you expect the drivers to use your api I would
> > > appreciate it
> >
> > This looks pretty reaosnable.
> >
>
> Great
>

Thanks Christoph for taking a look quickly.

> Also FYI, I managed to boot an ARM device with that tree. But I could
> not test the uvc driver (it was a remote device with no usb device
> attached)
>
> Hopefully I will be able to test it for real this week.
>
> Any suggestions for how to measure performance difference?

Back in time Kieran (+CC) shared a patch to add extra statistics for
packet processing and payload assembly, with results of various
approaches summarized in a spreadsheet:
https://docs.google.com/spreadsheets/d/1uPdbdVcebO9OQ0LQ8hR2LGIEySWgSnGwwhzv7LPXAlU/edit#gid=0

That and just simple CPU usage comparison would be enough.

>
> Thanks!
>
> > Note that ifdef  CONFIG_DMA_NONCOHERENT in the old code doesn't actually
> > work, as that option is an internal thing just for mips and sh..

In what terms it doesn't actually work? Last time I checked some
platforms actually defined CONFIG_DMA_NONCOHERENT, so those would
instead use the kmalloc() + dma_map() path. I don't have any
background on why that was added and whether it needs to be preserved,
though. Kieran, Laurent, do you have any insight?

Best regards,
Tomasz
