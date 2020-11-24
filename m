Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5A6D2C2E6A
	for <lists+linux-doc@lfdr.de>; Tue, 24 Nov 2020 18:26:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390799AbgKXRZp (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 24 Nov 2020 12:25:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390796AbgKXRZo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 24 Nov 2020 12:25:44 -0500
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com [IPv6:2607:f8b0:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D918C061A4D
        for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2020 09:25:44 -0800 (PST)
Received: by mail-il1-x141.google.com with SMTP id a19so14235549ilm.3
        for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2020 09:25:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Z6tlEwV2va2PDMozZGMdT895LM4tZsvIbgGRKWaEoV4=;
        b=O1otos6rFw3st6xur2OtmZ59kmbeoRug0Ytr6D48haYnFV/4i5YTnbi7zgXShcxOYw
         qW4Lxi/kxwNU/9Q+YW3586WdhZjbM0GSSV2zXURBFZGjJuH+gfoFZj+6309L5sfOP7Uz
         ZNE/98YEWZrRlCURKbfdWnqDbiBV906YsvYKY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z6tlEwV2va2PDMozZGMdT895LM4tZsvIbgGRKWaEoV4=;
        b=J7nH3aAOyBgRGl28xJGQdVQj7CnPbd59DxPDGtSbH8wy3wHULe5zTdsIAzBl2k8u3c
         /k9Mr6RT7lXMfnu19xdO8zu9qdP16NLWXiawFeBZxoxkpx81KCSs34WMV0ySjQNyIXnC
         mxK2w5Cjn0/MIPoj2QfUIisBWcuRKIudTm3R7nymUVgEWzqF9xT9bmvgs91ANZW2h0KY
         c+gCN1dZW7v5VdyN/eiorgF0F/+K4Pfw39kDvD+3lRZ72AT7FUiTQDnOSs2Rvves7vnj
         yQn01RXIVlwu+MNvuc3lyE0IpevsGhMRznGt0c+OpYhKZ4LkpYlo0CuyMTe7OanzUx1g
         0X9Q==
X-Gm-Message-State: AOAM532CC1gZVhx191MafmnzxB+A+hw2mKTH2N1uHsTH0WhCwo4bRzja
        1BSMJIZAaslPncdbGLeZ5GtHvcTSRdswQdBM
X-Google-Smtp-Source: ABdhPJzfxoY2YZ5Cre7kYjRurpA1Zyrf1adAO64BTEjLSnHh2pKkaA2JsqXQG7OnKDr2ugu6lOW9wg==
X-Received: by 2002:a92:de47:: with SMTP id e7mr4774018ilr.15.1606238743402;
        Tue, 24 Nov 2020 09:25:43 -0800 (PST)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com. [209.85.166.49])
        by smtp.gmail.com with ESMTPSA id k26sm8000645iom.32.2020.11.24.09.25.41
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2020 09:25:42 -0800 (PST)
Received: by mail-io1-f49.google.com with SMTP id r1so22700828iob.13
        for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2020 09:25:41 -0800 (PST)
X-Received: by 2002:a02:b144:: with SMTP id s4mr5587937jah.32.1606238741494;
 Tue, 24 Nov 2020 09:25:41 -0800 (PST)
MIME-Version: 1.0
References: <20201124153845.132207-1-ribalda@chromium.org> <20201124153845.132207-5-ribalda@chromium.org>
 <f1055d12-8bde-80d0-29f3-dfbfbf59cc11@arm.com>
In-Reply-To: <f1055d12-8bde-80d0-29f3-dfbfbf59cc11@arm.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Tue, 24 Nov 2020 18:25:30 +0100
X-Gmail-Original-Message-ID: <CANiDSCuVgN=d-TdW1T0EVxMALhyOcy2Sc511D4SkxN_1kh8h9A@mail.gmail.com>
Message-ID: <CANiDSCuVgN=d-TdW1T0EVxMALhyOcy2Sc511D4SkxN_1kh8h9A@mail.gmail.com>
Subject: Re: [PATCH 5/6] media: uvcvideo: Use dma_alloc_noncontiguos API
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
        Joerg Roedel <joro@8bytes.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Robin

On Tue, Nov 24, 2020 at 5:29 PM Robin Murphy <robin.murphy@arm.com> wrote:
>
> On 2020-11-24 15:38, Ricardo Ribalda wrote:
> > On architectures where the is no coherent caching such as ARM use the
> > dma_alloc_noncontiguos API and handle manually the cache flushing using
> > dma_sync_single().
> >
> > With this patch on the affected architectures we can measure up to 20x
> > performance improvement in uvc_video_copy_data_work().
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >   drivers/media/usb/uvc/uvc_video.c | 74 ++++++++++++++++++++++++++-----
> >   drivers/media/usb/uvc/uvcvideo.h  |  1 +
> >   2 files changed, 63 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> > index a6a441d92b94..9e90b261428a 100644
> > --- a/drivers/media/usb/uvc/uvc_video.c
> > +++ b/drivers/media/usb/uvc/uvc_video.c
> > @@ -1490,6 +1490,11 @@ static void uvc_video_encode_bulk(struct uvc_urb *uvc_urb,
> >       urb->transfer_buffer_length = stream->urb_size - len;
> >   }
> >
> > +static inline struct device *stream_to_dmadev(struct uvc_streaming *stream)
> > +{
> > +     return stream->dev->udev->bus->controller->parent;
> > +}
> > +
> >   static void uvc_video_complete(struct urb *urb)
> >   {
> >       struct uvc_urb *uvc_urb = urb->context;
> > @@ -1539,6 +1544,11 @@ static void uvc_video_complete(struct urb *urb)
> >        * Process the URB headers, and optionally queue expensive memcpy tasks
> >        * to be deferred to a work queue.
> >        */
> > +     if (uvc_urb->pages)
> > +             dma_sync_single_for_cpu(stream_to_dmadev(stream),
> > +                                     urb->transfer_dma,
> > +                                     urb->transfer_buffer_length,
> > +                                     DMA_FROM_DEVICE);
>
> This doesn't work. Even in iommu-dma, the streaming API still expects to
> work on physically-contiguous memory that could have been passed to
> dma_map_single() in the first place. As-is, this will invalidate
> transfer_buffer_length bytes from the start of the *first* physical
> page, and thus destroy random other data if lines from subsequent
> unrelated pages are dirty in caches.
>
> The only feasible way to do a DMA sync on disjoint pages in a single
> call is with a scatterlist.

Thanks for pointing this out. I guess I was lucky on my hardware and
the areas were always  contiguous.

Will rework and send back to the list.

Thanks again.

>
> Robin.
>
> >       stream->decode(uvc_urb, buf, buf_meta);
> >
> >       /* If no async work is needed, resubmit the URB immediately. */
> > @@ -1566,8 +1576,15 @@ static void uvc_free_urb_buffers(struct uvc_streaming *stream)
> >                       continue;
> >
> >   #ifndef CONFIG_DMA_NONCOHERENT
> > -             usb_free_coherent(stream->dev->udev, stream->urb_size,
> > -                               uvc_urb->buffer, uvc_urb->dma);
> > +             if (uvc_urb->pages) {
> > +                     vunmap(uvc_urb->buffer);
> > +                     dma_free_noncontiguous(stream_to_dmadev(stream),
> > +                                            stream->urb_size,
> > +                                            uvc_urb->pages, uvc_urb->dma);
> > +             } else {
> > +                     usb_free_coherent(stream->dev->udev, stream->urb_size,
> > +                                       uvc_urb->buffer, uvc_urb->dma);
> > +             }
> >   #else
> >               kfree(uvc_urb->buffer);
> >   #endif
> > @@ -1577,6 +1594,47 @@ static void uvc_free_urb_buffers(struct uvc_streaming *stream)
> >       stream->urb_size = 0;
> >   }
> >
> > +#ifndef CONFIG_DMA_NONCOHERENT
> > +static bool uvc_alloc_urb_buffer(struct uvc_streaming *stream,
> > +                              struct uvc_urb *uvc_urb, gfp_t gfp_flags)
> > +{
> > +     struct device *dma_dev = dma_dev = stream_to_dmadev(stream);
> > +
> > +     if (!dma_can_alloc_noncontiguous(dma_dev)) {
> > +             uvc_urb->buffer = usb_alloc_coherent(stream->dev->udev,
> > +                                                  stream->urb_size,
> > +                                                  gfp_flags | __GFP_NOWARN,
> > +                                                  &uvc_urb->dma);
> > +             return uvc_urb->buffer != NULL;
> > +     }
> > +
> > +     uvc_urb->pages = dma_alloc_noncontiguous(dma_dev, stream->urb_size,
> > +                                              &uvc_urb->dma,
> > +                                              gfp_flags | __GFP_NOWARN, 0);
> > +     if (!uvc_urb->pages)
> > +             return false;
> > +
> > +     uvc_urb->buffer = vmap(uvc_urb->pages,
> > +                            PAGE_ALIGN(stream->urb_size) >> PAGE_SHIFT,
> > +                            VM_DMA_COHERENT, PAGE_KERNEL);
> > +     if (!uvc_urb->buffer) {
> > +             dma_free_noncontiguous(dma_dev, stream->urb_size,
> > +                                    uvc_urb->pages, uvc_urb->dma);
> > +             return false;
> > +     }
> > +
> > +     return true;
> > +}
> > +#else
> > +static bool uvc_alloc_urb_buffer(struct uvc_streaming *stream,
> > +                              struct uvc_urb *uvc_urb, gfp_t gfp_flags)
> > +{
> > +     uvc_urb->buffer = kmalloc(stream->urb_size, gfp_flags | __GFP_NOWARN);
> > +
> > +     return uvc_urb->buffer != NULL;
> > +}
> > +#endif
> > +
> >   /*
> >    * Allocate transfer buffers. This function can be called with buffers
> >    * already allocated when resuming from suspend, in which case it will
> > @@ -1607,19 +1665,11 @@ static int uvc_alloc_urb_buffers(struct uvc_streaming *stream,
> >
> >       /* Retry allocations until one succeed. */
> >       for (; npackets > 1; npackets /= 2) {
> > +             stream->urb_size = psize * npackets;
> >               for (i = 0; i < UVC_URBS; ++i) {
> >                       struct uvc_urb *uvc_urb = &stream->uvc_urb[i];
> >
> > -                     stream->urb_size = psize * npackets;
> > -#ifndef CONFIG_DMA_NONCOHERENT
> > -                     uvc_urb->buffer = usb_alloc_coherent(
> > -                             stream->dev->udev, stream->urb_size,
> > -                             gfp_flags | __GFP_NOWARN, &uvc_urb->dma);
> > -#else
> > -                     uvc_urb->buffer =
> > -                         kmalloc(stream->urb_size, gfp_flags | __GFP_NOWARN);
> > -#endif
> > -                     if (!uvc_urb->buffer) {
> > +                     if (!uvc_alloc_urb_buffer(stream, uvc_urb, gfp_flags)) {
> >                               uvc_free_urb_buffers(stream);
> >                               break;
> >                       }
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > index a3dfacf069c4..3e3ef1f1daa5 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -532,6 +532,7 @@ struct uvc_urb {
> >
> >       char *buffer;
> >       dma_addr_t dma;
> > +     struct page **pages;
> >
> >       unsigned int async_operations;
> >       struct uvc_copy_op copy_operations[UVC_MAX_PACKETS];
> >



-- 
Ricardo Ribalda
