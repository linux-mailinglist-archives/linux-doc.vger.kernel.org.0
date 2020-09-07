Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F03A625F81B
	for <lists+linux-doc@lfdr.de>; Mon,  7 Sep 2020 12:26:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728736AbgIGK0w (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 7 Sep 2020 06:26:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728715AbgIGK0r (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 Sep 2020 06:26:47 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F46AC061573
        for <linux-doc@vger.kernel.org>; Mon,  7 Sep 2020 03:26:47 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id a26so17589933ejc.2
        for <linux-doc@vger.kernel.org>; Mon, 07 Sep 2020 03:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HmvvDOBbOI3Ap25LolJkNiUzAqYW/BkylmIeV4YjRD8=;
        b=QDdavu3QQmHCnnU4KwLOJr5Oqa+V9NiMQ1XwjqwN4Vf2/Yl3FamhFwkRnK9uYu0WMM
         PSIo98ml3rL98H/MFyPHXu20UitXy3KZs6DuWoJyxF5RrbDa1aPfsa1zk2tKopjDf92t
         oxo871xKdzsVRbGhOSWrfmLzWXP1g3/zK22U4SR+waK/pY8uV+I18/6oBOqI7kXsfGG+
         lRPUidIYCyv/fl7hMJdze89IE3yiK8vG8YSPcuMTCt3puxMTRgbzm+XlUiKl6PSZAZFB
         UrTltAyeJJ/5hiL9WET3bwgBk0tFhMnH+r3fxLY6lbC1V0A6JzZcriwY/wtmltFYV3GN
         TqjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HmvvDOBbOI3Ap25LolJkNiUzAqYW/BkylmIeV4YjRD8=;
        b=hNrtjjIssU6N8y7LxMdqkW2EUAnd/WiNSVK54kqcDtOC8MIURiSI6x7wpuajQae7cn
         vzAgnf/iGC9OhPqcwOtx1ld18odE7x5dL+Bi3TlNcgldRS3wmJzDz2BVQxY1nia4MuBP
         UUj/Ca8otV/OvE1/ipXuORTPU+0h6Rg42xDliVy9T9vgLhbnLTvhWfBLDDIrh0E+PpnT
         r0E87cJBZNFRnCa9kKBJmTx/Nz2r5k3xin1wiYCizIm1JgsNojukn/Lg7kI7CEnTZfEj
         nFhROlb8+bQccufmYStOmBuqsIht0aPwy0yr+HK47wrBZgScRMolpWvet1jm14UZaIzB
         /kMQ==
X-Gm-Message-State: AOAM531zhYS+oHHveLByCe7XqI/E54kmGDUqQiJ+nCt2NDih8KlI86Q5
        FeYTUhxx1B+dwco55rvbLsYLpCy4Wao8yhHm8KZ3mA==
X-Google-Smtp-Source: ABdhPJzU3TRrxz7IZqvY6j9hu2ty43AjKwNnl8X1LKDXaPDRCwBiEKtxjLALYuvJMHAGMXF/jF07pg9xrPNCh4fKRnk=
X-Received: by 2002:a17:907:20d9:: with SMTP id qq25mr15792481ejb.382.1599474405853;
 Mon, 07 Sep 2020 03:26:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200904154547.3836-1-brgl@bgdev.pl> <20200904154547.3836-24-brgl@bgdev.pl>
 <26ea1683-da8f-30e7-f004-3616e96d56b3@infradead.org> <20200907095932.GU1891694@smile.fi.intel.com>
In-Reply-To: <20200907095932.GU1891694@smile.fi.intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 7 Sep 2020 12:26:34 +0200
Message-ID: <CAMpxmJXvhYOVkZY7LLf=v+o8E2xKTh1RYhLrdVsS9nN1XZ5QJQ@mail.gmail.com>
Subject: Re: [PATCH 23/23] Documentation: gpio: add documentation for gpio-mockup
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-doc <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, linux-acpi@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Sep 7, 2020 at 11:59 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Sep 04, 2020 at 08:15:59PM -0700, Randy Dunlap wrote:
> > On 9/4/20 8:45 AM, Bartosz Golaszewski wrote:
>
> ...
>
> > > +GPIO Testing Driver
> > > +===================
> > > +
> > > +The GPIO Testing Driver (gpio-mockup) provides a way to create simulated GPIO
> > > +chips for testing purposes. There are two ways of configuring the chips exposed
> > > +by the module. The lines can be accessed using the standard GPIO character
> > > +device interface as well as manipulated using the dedicated debugfs directory
> > > +structure.
> >
> > Could configfs be used for this instead of debugfs?
> > debugfs is ad hoc.
>
> Actually sounds like a good idea.
>

Well, then we can go on and write an entirely new mockup driver
(ditching module params and dropping any backwards compatibility)
because we're already using debugfs for line values.

How would we pass the device properties to configfs created GPIO chips
anyway? Devices seem to only be created using mkdir. Am I missing
something?

Bart
