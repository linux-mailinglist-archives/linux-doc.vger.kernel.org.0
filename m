Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51BC94117B7
	for <lists+linux-doc@lfdr.de>; Mon, 20 Sep 2021 17:01:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233136AbhITPCw (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 20 Sep 2021 11:02:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231887AbhITPCv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 20 Sep 2021 11:02:51 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86EDEC061574
        for <linux-doc@vger.kernel.org>; Mon, 20 Sep 2021 08:01:22 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id v24so62587640eda.3
        for <linux-doc@vger.kernel.org>; Mon, 20 Sep 2021 08:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Z6SXVjESwxqs4/+lmjaMikpAAHEBRQ8ZRJFrE3wi3Bw=;
        b=UKTuZjmty+RFPaupr20A8UCZDY8504Sk+38CFMdAglqniYuLPAMBF94HWGXR5fQc+5
         ZbPwyT9XkZQwJafvZWCO7WbtOT/V4FmTxB6Jixv1JEcauu9Fk/oGrYyWdg37cbX8N2d8
         Nvg1lDsjOCF2jY2pSxfuMwcwyJxbfuAK44NDMdyyhGQY/wEB2IJcJv14GKfxjuARjmkV
         +n7/euaMZT5n17Idl0UdXntBNVq70Wxpqbf2lJNhoF67H/kCP1LQeOKzE6QmJfUDWqO4
         XPan2swbgqA9MwzQDHee04OziG4E4PRXrNuvYgcSEdn5xo1godwXuQwoVieBAiEmfebh
         kT9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z6SXVjESwxqs4/+lmjaMikpAAHEBRQ8ZRJFrE3wi3Bw=;
        b=0rEvlZLFvRAziPnFJTVfK0u7maqinXvHm5nze7eTYz9INwhASaI2WOJKPvKXVU235O
         jn1fJ9OdiI082w1eMTwMemkFgIz1S7atkDz1xUGrf+28yXLhfzc6JbDb9owHQwU4ufMb
         biDDn7+RzK54fcX9CxeoRa1BOAgcBdrJPOGk3Jb6Q1IQkahcD5Lb39yeub6qg6hGXpzD
         0slLDt3CpvXL89CpM9qCXE8PCsSdUyY9NhL7oWHQoREQFd5lZo9eOVS/8HEZA2pV2C3j
         X+cce5LjECKlk5/WtmnppSWE2mWRf0KYQXoEe39gRcJ4dmVff3Hr+7rS05mtXXIsX+EV
         CaFw==
X-Gm-Message-State: AOAM530ieaUv01JhAiIRijbgcjPdcggd/PFmE36bxUPwMmi32menSelg
        3vvMA0b6nsxAIPWlm0+GQWjjwEDRtXfsK5spB6bsJQ==
X-Google-Smtp-Source: ABdhPJzT1B90STBVxrV2Y11rYWrG6lqNbbI3X7Hc7MS7LxIhduOaEblG0K9zBWTd7NJQN4IENPBYzFOg9JqgvyaI4Gg=
X-Received: by 2002:a05:6402:399:: with SMTP id o25mr30240808edv.118.1632150021260;
 Mon, 20 Sep 2021 08:00:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210920140509.5177-1-brgl@bgdev.pl> <20210920140509.5177-3-brgl@bgdev.pl>
 <20210920140938.GA24424@lst.de> <CAMuHMdXoZdhSydMpbW8B6oQJNnpYpTxmhHrV5CJNTUP7T1KsoA@mail.gmail.com>
 <20210920143046.GA26163@lst.de> <CAMRc=McQoD=cUHLu6TMyW85fdtXOm4x38tHVnEGjkVfcfX0mfA@mail.gmail.com>
 <CAMuHMdXUpMvhjjgNdLgfJvaWWG9_oHa_pmx4TTy0mC1p1zUEmw@mail.gmail.com>
In-Reply-To: <CAMuHMdXUpMvhjjgNdLgfJvaWWG9_oHa_pmx4TTy0mC1p1zUEmw@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 20 Sep 2021 17:00:10 +0200
Message-ID: <CAMRc=MdNQ+rquq6_rf-rxvoPzz9G0EzO4T=ryF6XYXh51NBL_w@mail.gmail.com>
Subject: Re: [PATCH v5 2/8] configfs: use BIT() for internal flags
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Christoph Hellwig <hch@lst.de>, Joel Becker <jlbec@evilplan.org>,
        Shuah Khan <shuah@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Kent Gibson <warthog618@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Sep 20, 2021 at 4:50 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Bartosz,
>
> On Mon, Sep 20, 2021 at 4:47 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > On Mon, Sep 20, 2021 at 4:30 PM Christoph Hellwig <hch@lst.de> wrote:
> > > On Mon, Sep 20, 2021 at 04:29:30PM +0200, Geert Uytterhoeven wrote:
> > > > On Mon, Sep 20, 2021 at 4:09 PM Christoph Hellwig <hch@lst.de> wrote:
> > > > > On Mon, Sep 20, 2021 at 04:05:03PM +0200, Bartosz Golaszewski wrote:
> > > > > > For better readability and maintenance: use the BIT() macro for flag
> > > > > > definitions.
> > > > >
> > > > > NAK.  BIT() is the stupidest macro in the kernel and shall not be used
> > > > > ever.  And I'm pretty sure we had this discussion a few times.
> > > >
> > > > Care to explain why it is a stupid macro?
> > >
> > > Please look at the previous thread.  I'm tired of this discussion.
> >
> > The only previous answer from Christoph is this:
> > https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg2399968.html
>
> Yep, found that one, too.
>
> Now, as these definitions do not correspond to hardware register bits,
> perhaps use an enum?
>

These are flags, we can set more than one to any given dirent.

Anyway, I'm more interested in Al's comments on the implementation of
committable items than bikeshedding about whether to use or not to use
BIT() so I'll wait for those before revisiting this patch.

Bart
