Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 220573BA7B9
	for <lists+linux-doc@lfdr.de>; Sat,  3 Jul 2021 10:05:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229808AbhGCIH5 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 3 Jul 2021 04:07:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30043 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229823AbhGCIH5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 3 Jul 2021 04:07:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1625299523;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=kKIOnpxOcNmgTRp3B6WHqjm7D0aNgAomWGm0e5Ck0pA=;
        b=V9MDyarP7tRy4tszvPeMY2BuAA8JxySol/3V6BlhzZX82GhvK3/R5DR/j/F5pAfDV23UL4
        eYmpQe1bEo+N01lb9GYqY0PXF7R21gXUqlffWYVGGvuvLt1jlHj/lVjan2OBhXSJAJtP7w
        PYVF9fWNFTM9BZSp6jROzrhVjGFj+mM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-201-WIHq67zaPw-uY5IxwOILkA-1; Sat, 03 Jul 2021 04:05:21 -0400
X-MC-Unique: WIHq67zaPw-uY5IxwOILkA-1
Received: by mail-wr1-f71.google.com with SMTP id y5-20020adfe6c50000b02901258bf1d760so4461736wrm.14
        for <linux-doc@vger.kernel.org>; Sat, 03 Jul 2021 01:05:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kKIOnpxOcNmgTRp3B6WHqjm7D0aNgAomWGm0e5Ck0pA=;
        b=Ny0exyDpDT9WaiUw3iKk3phxR3g8EXOGJBF4OE9Bz5YubafkAM7cEbbzJr/U1OUkGz
         D80jYQI4yxHbINnqPTuWb1oAie1RQ4IwqwbuwAupcXszLiIx1eW6vHQJC5t+XyVRvTic
         TWy97BjPFdpkyJhoRPut2qYwGZ1Tn/Po2vj3SmbJivXxNpLUvjAfB0zQ1AtMlAHrcCXW
         X1iDOb5zXYCjrknCri82lvpXud/9+2q7JG0uvYmfFixMq7yb0QFes4IHRfYEyE0DT85U
         WyFNizAwGk+PvMMDySZGoyFhwl+3iQ7yA6axi0LJopBvs+PqX3IHUwOA0ExTVleRFNaQ
         P9Vw==
X-Gm-Message-State: AOAM533Z9jA6n3xmChZVYLoB+ngDoEj9y4sPiB2XFglMC4pEbng45UKz
        ktVOOF1xtlGeMeC98Me3tFHWEot0CgK7ojpUdOk95eFCaW37wm+i15SVYQLT5OBuMKebssnpoef
        l8ixmgXUcEoOWdTEaDUyy
X-Received: by 2002:adf:a74a:: with SMTP id e10mr3938763wrd.185.1625299520830;
        Sat, 03 Jul 2021 01:05:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwKSHjkKeNS1veZXd/UH5HPoz05bwQZrIGUjhF4ktH5u6/iyfCkd4WgsIejTPdf0V3pNrgQdQ==
X-Received: by 2002:adf:a74a:: with SMTP id e10mr3938741wrd.185.1625299520609;
        Sat, 03 Jul 2021 01:05:20 -0700 (PDT)
Received: from redhat.com ([2.55.4.39])
        by smtp.gmail.com with ESMTPSA id c8sm5566926wri.91.2021.07.03.01.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jul 2021 01:05:19 -0700 (PDT)
Date:   Sat, 3 Jul 2021 04:05:15 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        bgolaszewski@baylibre.com, Jason Wang <jasowang@redhat.com>,
        Linux Documentation <linux-doc@vger.kernel.org>,
        linux-gpio@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 2/2] drivers: gpio: add virtio-gpio guest driver
Message-ID: <20210703040504-mutt-send-email-mst@kernel.org>
References: <20201203191135.21576-1-info@metux.net>
 <20201203191135.21576-2-info@metux.net>
 <CAOh2x=kcM351ObubnQSzUa=FVBQUmAUhz4u8ExORUthQQ0WbGQ@mail.gmail.com>
 <253f218d-07ac-1963-75e1-9ac2d035437a@metux.net>
 <20210526033206.5v362hdywb55msve@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210526033206.5v362hdywb55msve@vireshk-i7>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, May 26, 2021 at 09:02:06AM +0530, Viresh Kumar wrote:
> On 25-05-21, 14:59, Enrico Weigelt, metux IT consult wrote:
> > On 24.05.21 13:27, Viresh Kumar wrote:
> > 
> > Hi,
> > 
> > 
> > > We (Linaro's Project Stratos
> > > https://linaro.atlassian.net/wiki/spaces/STR/overview)
> > >   are interested in this stuff. I was trying to look at the last status
> > > of all this. Few
> > > questions for you:
> > > 
> > > - Was the spec ever posted to virtio-dev list ? I thought that's the
> > > very first step before
> > > we merge the code.
> > 
> > I had posted some spec quite some time ago, but it wasn't in the form
> > of patches against the .tex documentation files yet. It's been laying
> > aside for quite a while, since I've been busy w/ other things.
> 
> Will you be fine if I take that up and restart the thread ?

It's been a while - why not right?

> -- 
> viresh

