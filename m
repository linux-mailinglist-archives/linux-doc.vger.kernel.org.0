Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA66C338E8A
	for <lists+linux-doc@lfdr.de>; Fri, 12 Mar 2021 14:17:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229487AbhCLNQ3 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 12 Mar 2021 08:16:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231450AbhCLNQP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 12 Mar 2021 08:16:15 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EE71C061762
        for <linux-doc@vger.kernel.org>; Fri, 12 Mar 2021 05:16:14 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id j3so7902418edp.11
        for <linux-doc@vger.kernel.org>; Fri, 12 Mar 2021 05:16:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=neZ9V+cHHaOLaO/LQJ3v+VwMZ3+9mlPm1xPT4fXngAQ=;
        b=ZFEkO0tVH3wllnWFMhwQDJUcDBOY4/28BriU2RhZ3+Q5ZIGxNg1b2QaTwYCI7lr/Ce
         Z1ll8s2y3zgQsB5O1ZKpODLeh9AcHobATZSVo4EouwBk9ANUxNvRqCUnaUCjPUzVkzlW
         P6S9InY/9wESuvhpqE6KlDeC9o7BN3i9k7oWQxdq9035NaTQa8KGRTFPISPgVzwVhq2o
         WWHm9LRsZwg+njI4pTtAKwbeXvjcT9mX31UmXyhnmJ0a9K2D/NzZKGU90kE6FIHm09+W
         AEqV0CUhm/hmxCD28XI8gzmSrieF5jwDP2r+m64YuM526E7SQamFH/cqSpSODk57Q63K
         lyOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=neZ9V+cHHaOLaO/LQJ3v+VwMZ3+9mlPm1xPT4fXngAQ=;
        b=etnYaz8DVSWo8ASj54ZfAVOexktm9tKsrjubO5wkXMMmPDqHZV0sQSA6v0JBj4VgfG
         d2RkQTfdvL02GHJL6VOGstj8A4ILILy+yn8aluoZiBWHvM+3qZ1/vnkncEyF8GzC3eh7
         w7iSDUH6uf8TrfhnOgIho9T1Ee8qZG1z1EhrqUYJ2ugNlmH0OGSftMIQJP/sJSXhkQE4
         L+CqGbOgx/N9/PjLAqCs5Iz6IKifdcTk+Y5CrYCkts+qudL242UbcpNRmGhC/3lpuAbS
         bjoPjbuCE/1tvajoFj0D3OuTPrTGbiMiINtgIT4e8vQX5Crj7Sfhw0tCzwKNvhWxculV
         lO/w==
X-Gm-Message-State: AOAM531u9xCWkRHh6IhsfUbYOQfuaUnCo23drF8bJxSN4xerKiQQXYSV
        s3U44HTUbq9PkUlrvFmKVSAgX+O3/o7uN+qLWrZF5w==
X-Google-Smtp-Source: ABdhPJwSNw8JNi+UKnMe99Qf0naPkixWkL2XPqedMsVuKvmkfKkzrdX38EVXWnCItjQXyDYYop5DuKx3MmFhtu4lBB0=
X-Received: by 2002:a05:6402:4309:: with SMTP id m9mr14555462edc.25.1615554973282;
 Fri, 12 Mar 2021 05:16:13 -0800 (PST)
MIME-Version: 1.0
References: <20210312095700.16277-1-brgl@bgdev.pl> <20210312095700.16277-8-brgl@bgdev.pl>
 <YEtTKJliHBep7bL4@smile.fi.intel.com>
In-Reply-To: <YEtTKJliHBep7bL4@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 12 Mar 2021 14:16:02 +0100
Message-ID: <CAMRc=Mc4DCDryO2VuC_2=ZkwT2XLPtUbe1HE47i0rfft=tb4oA@mail.gmail.com>
Subject: Re: [PATCH v4 07/11] lib: bitmap: provide devm_bitmap_alloc() and devm_bitmap_zalloc()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Joel Becker <jlbec@evilplan.org>, Christoph Hellwig <hch@lst.de>,
        Shuah Khan <shuah@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Kent Gibson <warthog618@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-doc <linux-doc@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Mar 12, 2021 at 12:40 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Mar 12, 2021 at 10:56:56AM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > Provide managed variants of bitmap_alloc() and bitmap_zalloc().
>
> Perhaps I missed your answer to Greg's comment...
> So, what do you think about adding _GPL to the export?
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Nah, I missed Greg's comment. :(

Will fix in v5.

Bart
