Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A132E35D0F8
	for <lists+linux-doc@lfdr.de>; Mon, 12 Apr 2021 21:23:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237054AbhDLTXh (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 12 Apr 2021 15:23:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237025AbhDLTXh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 12 Apr 2021 15:23:37 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B24EAC061574
        for <linux-doc@vger.kernel.org>; Mon, 12 Apr 2021 12:23:18 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id u21so22109540ejo.13
        for <linux-doc@vger.kernel.org>; Mon, 12 Apr 2021 12:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mELRjVqp68r+toZVxtj/nROQLw+PqRw01stMy/JKAoI=;
        b=RuXsPBJDF3pxAI6ljG05ZKqt8YUmS44gosy5CljDMisMK7z6FRDFFa42SQlfxTeZcm
         pMmiFuREi/CsiEwh3n4f9myye40LULlH6dAutk4fRQm1YLoMfR/GWhHj3j8fvco171Qj
         WVEHi6qmZRdbLgD9XmwL0IDXk3XH1cq1hK5hcjIn+f0FIAUa0DRmEFHP7g2GxPzv8hdk
         kx1AbJe5MgMR8FvTP2jpZy9wdqlHQ7VB3+PRXr524woYvd0H0j+RLlzfJw4VtRrz/98Q
         Pr42+gOxdhKEqRz6dM8XW2MhQA7TutftrfPsfvndRojle93KrK94IGNUc0GTCkm1vYu3
         XQ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mELRjVqp68r+toZVxtj/nROQLw+PqRw01stMy/JKAoI=;
        b=Lr9ibAKi/SVrPY9FTgGT9RQRU0K9BS4Q5siRy7Paik/qYQZ77VRWukLIYZe912H5W+
         gI63XnEArqXQSNjhqZnMxKmXKK01GJf18bZN8/9K4tBFpxK2PbcQ/6YiZ1/yIPlUH7WJ
         ibIZzdq4FQLapvmYl3VNrkOjVVK7MPdHzyL5khMbYxfi78Dworlmf0YYR1Q/4W2EHU6x
         829OSPtRTqWYoJRL5FJk4EszaFsQz6mCuA7JlzjKNUlDjCjDevEcyV720VJmITTzP5i6
         eaoa0MBW9ZDXzKr71Y+hNWbYVYctcllq9p/7ekh/IJpfbN53lYPT9I7NDhOIr7m/TphA
         eqVw==
X-Gm-Message-State: AOAM5330e35rotSY6rVNhmL9KwSKJriMOY8sjpb2RBxmyvG9CBHeMsfb
        XUQ9SG2BYsPuDHEcqtdzxJd0OsdxliAqtrEuZgvPgA==
X-Google-Smtp-Source: ABdhPJwXphtNs2B1kAW+Ay203fgklD+JVIJDuKSEoScP5GErDcEj86IB5CIU+IcorY4kTj6jGjHvAx5XiZS9A93+OEk=
X-Received: by 2002:a17:906:1313:: with SMTP id w19mr12522249ejb.64.1618255397479;
 Mon, 12 Apr 2021 12:23:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200629065008.27620-1-brgl@bgdev.pl> <20200629065008.27620-5-brgl@bgdev.pl>
 <CAKdAkRRRyC3x39CDRq_3ur1=MWuUug6ov-NWmSBc3h+XyRcsgQ@mail.gmail.com>
In-Reply-To: <CAKdAkRRRyC3x39CDRq_3ur1=MWuUug6ov-NWmSBc3h+XyRcsgQ@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 12 Apr 2021 21:23:06 +0200
Message-ID: <CAMRc=MfU8QFPWu_e6oQgtq0cBA34kCSi9=9-1iaFW4gW+yXN6A@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] devres: handle zero size in devm_kmalloc()
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>, linux-hwmon@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Apr 11, 2021 at 5:21 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Hi Bartosz,
>
> On Mon, Jun 29, 2020 at 1:56 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > Make devm_kmalloc() behave similarly to non-managed kmalloc(): return
> > ZERO_SIZE_PTR when requested size is 0. Update devm_kfree() to handle
> > this case.
>
> This is wrong if you consider devm_krealloc API that you added. The
> premise of devm_krealloc() is that it does not disturb devres "stack",
> however in this case there is no entry in the stack. Consider:
>
>         ptr = devm_kzalloc(dev, 0, GFP_KERNEL);
>         ...
>         more devm API calls
>         ...
>
>         /* This allocation will be on top of devm stack, not bottom ! */
>         ptr = devm_krealloc(dev, ptr, 16, GFP_KERNEL);
>
> And also:
>
>         ptr = devm_kzalloc(dev, 16, GFP_KERNEL);
>         ...
>         more devm API calls
>         ...
>         /* Here we lose out position */
>         ptr = devm_krealloc(dev, ptr, 0, GFP_KERNEL);
>         ...
>         /* and now our memory allocation will be released first */
>         ptr = devm_krealloc(dev, ptr, 16, GFP_KERNEL);
>
>
> IMO special-casing 0-size allocations for managed memory allocations
> should not be done.
>
> Thanks.
>
> --
> Dmitry

You're right about the ordering being lost. At the same time
allocating 0 bytes is quite a special case and should result in
returning ZERO_SIZE_PTR as the fault dump resulting from its
dereference will indicate what the bug is.

I need to give it a thought because I'm not yet sure what the right
solution would be. Let me get back to you.

Bartosz
