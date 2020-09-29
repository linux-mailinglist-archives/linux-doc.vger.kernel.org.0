Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DA7427C17F
	for <lists+linux-doc@lfdr.de>; Tue, 29 Sep 2020 11:43:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727928AbgI2JnB (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 29 Sep 2020 05:43:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727854AbgI2Jm5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 29 Sep 2020 05:42:57 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E13B2C061755
        for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2020 02:42:55 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id e2so4099425wme.1
        for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2020 02:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ofBo1DHZJAYOAfdvKdc+JIzoJ7spso5qBxDDaOUD8P0=;
        b=fTyuu6u3qm+M2poqn0Gh7usMFQPyTseW+CABT/qMsrjz9vOA8ceeD4o7RmCWOO26dW
         oEaa7rL+447KXdmCLIYEt0xHiW6wdJTKY/qI1uMQxBs0Nd5zdu0trrBr1m0YFgNNt6rG
         8oGSRaxE7XwJ8CME7sbQRGm4iczVVBYCbzkuAwleDfDszVa5s/EtrWW9nrBvClGfiQpM
         KjjsFT2izPU0BbVZrdZjX8npp+iXjBHsJ3db51ZC+kXY09b9YgK7ziZgel3ZOKf/ncTe
         QjmfoEa7fSN+S1tCyKDwsN/YF7tyGjJPBAUeuQltd45vLTSOPaqTGd74EXDsdziiCEDc
         /IfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ofBo1DHZJAYOAfdvKdc+JIzoJ7spso5qBxDDaOUD8P0=;
        b=pWFNE8X8IzLS3wqlHvk1X8xo0AZCHszb5MYxH88dV09695tMzus4p8oSd8vk6Og+tx
         Z4OY8uRokOTamzNZTuHDWibWGPQOK6j3iXKw/zQpLocdZBvxjNzTO+eUr67czV2ZE4c0
         ngErx1kUodzVcr74adce1I/LosIKflmfoVIRwb8J8aOnevEUSlBUNPa/kVxVEZUtc/JA
         PGoJ4Yak+qiJRRLiog6mDHjaIrVbmQg6c54dHSitezkTD8kb2jnBKPbLNBLghBAMFe4s
         0XlUmH3p6rSpsdWbjxn4MG9dn6fYNAlQZwjwsgmDSGtRQMfCu48IWQENgRF98MI9MTdo
         VGpg==
X-Gm-Message-State: AOAM532YOxSyFm24quKGjKOOip8IS2t/lJVtlV3XDtvpUOCsnEiaUgV2
        Te8eEqNJATGAVGpIxgUXDhPktr4G5wUQnAe+mkq0Sw==
X-Google-Smtp-Source: ABdhPJy8aJk0Qe5jx6T1KNmqaPSZNL92RWZshamoYqVLfPSR/i7AzMct9OcCvBPhw+CDlfdfUemPaLx4dXCGXWCh5xA=
X-Received: by 2002:a05:600c:22d1:: with SMTP id 17mr3540326wmg.58.1601372574620;
 Tue, 29 Sep 2020 02:42:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200928104155.7385-1-brgl@bgdev.pl> <20200928104155.7385-2-brgl@bgdev.pl>
 <2fcfd81f62ec87d9b75cca32468d8b9583faec47.camel@perches.com>
 <CAMRc=Mds0ccYBhRJnCQ0NEPkUpWRGtyX4FKj4+4rxN27_gfobA@mail.gmail.com>
 <12317bbc7712d96be8f52a3bf574e47628830191.camel@perches.com>
 <3ba6779e11684ec8bc32638aa67ab952@AcuMS.aculab.com> <20200929084912.GZ3956970@smile.fi.intel.com>
In-Reply-To: <20200929084912.GZ3956970@smile.fi.intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 29 Sep 2020 11:42:43 +0200
Message-ID: <CAMpxmJV84C9KTj+z8+BBE2zaiMhRSRcybBO52P7VEc008Pb6yg@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] lib: string_helpers: provide kfree_strarray()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     David Laight <David.Laight@aculab.com>,
        Joe Perches <joe@perches.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Kent Gibson <warthog618@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-doc <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Sep 29, 2020 at 10:49 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Sep 29, 2020 at 08:10:10AM +0000, David Laight wrote:
> > From: Joe Perches
> > > Sent: 28 September 2020 17:07
> > >
> > > On Mon, 2020-09-28 at 18:02 +0200, Bartosz Golaszewski wrote:
> > > > On Mon, Sep 28, 2020 at 5:59 PM Joe Perches <joe@perches.com> wrote:
> > > > > On Mon, 2020-09-28 at 12:41 +0200, Bartosz Golaszewski wrote:
> > > > > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > > > >
> > > > > > There's a common pattern of dynamically allocating an array of char
> > > > > > pointers and then also dynamically allocating each string in this
> > > > > > array. Provide a helper for freeing such a string array with one call.
> > > > >
> > > > > Isn't this also common for things like ring buffers?
> > > > > Why limit this to char *[]?
> > > > >
> > > >
> > > > I don't want to add APIs nobody is using. What do you suggest?
> > >
> > > Change the argument to void** and call it
> > >
> > > void kfree_array(void **array, int count);
> >
> > Does help, void doesn't work that way.
>
> Actually good catch. void * and void ** have a big difference in the implicit
> casting behaviour. I was stumbled over this while playing with some
> experimental stuff locally.
>

I'll keep kfree_strarray() then.

Bart
