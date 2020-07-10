Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EC7B21BA49
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jul 2020 18:03:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728080AbgGJQDt (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 10 Jul 2020 12:03:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728069AbgGJQDt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 10 Jul 2020 12:03:49 -0400
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com [IPv6:2607:f8b0:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0165C08C5DC
        for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2020 09:03:48 -0700 (PDT)
Received: by mail-il1-x141.google.com with SMTP id h16so5467956ilj.11
        for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2020 09:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DwtRvDT0fE9SjkvKFymZ3wwQRafCOuOpn69akOKMWQE=;
        b=rC2SRyrvMhIqnaNEsdXH5dHqfT6I0Fuwc568Cha7qAdneSqu12N31FFgng14p8uxuB
         jlj2/ZGgm/bYyXy7Hz7nI26zEt2sDofDxXAG3jos70408S0G57lEX/ZaeqjXvIm/4cgt
         QeglSiUjQy+zIx4ufn9EOyLd5ZEBM7DeasQuMKSJNRa/6EcM0fdTO9sItI7rJd0fM36D
         hUVVgClmAD3jrcPBlHaZe/fkC0/Eg2xyKrAnzVnawwvZDHfZV0HEwOxlj6it4hqx8U07
         6g3QeJDSC2DokCFhYD7mNPEO3ID7zFws8xnzwghBPaeXvOUSqZscTV7feBTwAIPbpURl
         S/Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DwtRvDT0fE9SjkvKFymZ3wwQRafCOuOpn69akOKMWQE=;
        b=KX8cZitnwvfwxsTqF5EA2ClIiaVa7CZjfuS5n+sXZ0wVFb4Spmm0wsO7vtW6HCjLBd
         U5LmDESiDV/WbGe7oQqoVLL82jwf47c+xHyhlsgVZ3WguYMMvh7z+fPKBjvZI0Jrbwmp
         VcysjWLodk87dZBWZ0YQInjMkMOi1hiqfiSNAGFlhPnsBWkNvYGThd0Itm7zRZXiAolu
         mbjzRlCPn3obczZyGlnRsZv93qwB+zxkGaQzIMYSq0Ofs80e4Mf69BNnrbM6G5O6V2bp
         f28oH5bbWxvHdvx+ZIit+ph5VQ3VOp4a8O3ImYNy5NNSLfjZYxK481297vQ5cBHhGNq/
         3j1A==
X-Gm-Message-State: AOAM532vQVepS5RLovZCZ2DiXe4YurCUGoEfFEggUfZIqJ5/kxQfoLNn
        epC/fRVgSUn4hjrc9RoE7Vv05hrYARz2Dq5/am7jqg==
X-Google-Smtp-Source: ABdhPJwJAZ3yGKN0TblyVdcj96DstgCQb3QGd8g40AV18tjNeGW87g9bMbpwM+p7vqduY14vMiQCR/PrO6n5L+J8oBE=
X-Received: by 2002:a92:d64d:: with SMTP id x13mr52571706ilp.287.1594397027320;
 Fri, 10 Jul 2020 09:03:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200629065008.27620-1-brgl@bgdev.pl> <20200629065008.27620-5-brgl@bgdev.pl>
 <5c2e7514-b6d0-1331-37b0-d17a0cdb9693@nvidia.com>
In-Reply-To: <5c2e7514-b6d0-1331-37b0-d17a0cdb9693@nvidia.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 10 Jul 2020 18:03:36 +0200
Message-ID: <CAMRc=Mf1Laqa65hEOG3iLSQu6J-u5yHmrMNh8NMJmt3amw2A6Q@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] devres: handle zero size in devm_kmalloc()
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        linux-doc <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-hwmon@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jul 10, 2020 at 3:46 PM Jon Hunter <jonathanh@nvidia.com> wrote:
>
> Hi Bartosz,
>
> On 29/06/2020 07:50, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > Make devm_kmalloc() behave similarly to non-managed kmalloc(): return
> > ZERO_SIZE_PTR when requested size is 0. Update devm_kfree() to handle
> > this case.
> >
> > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > ---
> >  drivers/base/devres.c | 9 ++++++---
> >  1 file changed, 6 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/base/devres.c b/drivers/base/devres.c
> > index 1df1fb10b2d9..ed615d3b9cf1 100644
> > --- a/drivers/base/devres.c
> > +++ b/drivers/base/devres.c
> > @@ -819,6 +819,9 @@ void *devm_kmalloc(struct device *dev, size_t size, gfp_t gfp)
> >  {
> >       struct devres *dr;
> >
> > +     if (unlikely(!size))
> > +             return ZERO_SIZE_PTR;
> > +
> >       /* use raw alloc_dr for kmalloc caller tracing */
> >       dr = alloc_dr(devm_kmalloc_release, size, gfp, dev_to_node(dev));
> >       if (unlikely(!dr))
> > @@ -950,10 +953,10 @@ void devm_kfree(struct device *dev, const void *p)
> >       int rc;
> >
> >       /*
> > -      * Special case: pointer to a string in .rodata returned by
> > -      * devm_kstrdup_const().
> > +      * Special cases: pointer to a string in .rodata returned by
> > +      * devm_kstrdup_const() or NULL/ZERO ptr.
> >        */
> > -     if (unlikely(is_kernel_rodata((unsigned long)p)))
> > +     if (unlikely(is_kernel_rodata((unsigned long)p) || ZERO_OR_NULL_PTR(p)))
> >               return;
> >
> >       rc = devres_destroy(dev, devm_kmalloc_release,
>
>
> This change caught a bug in one of our Tegra drivers, which I am in the
> process of fixing. Once I bisected to this commit it was easy to track
> down, but I am wondering if there is any reason why we don't add a
> WARN_ON() if size is 0 in devm_kmalloc? It was essentially what I ended
> up doing to find the bug.
>
> Jon
>
> --
> nvpublic

Hi Jon,

this is in line with what the regular kmalloc() does. If size is zero,
it returns ZERO_SIZE_PTR. It's not an error condition. Actually in
user-space malloc() does a similar thing: for size == 0 it allocates
one-byte and returns a pointer to it (at least in glibc).

Bartosz
