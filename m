Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FCFB44ACE4
	for <lists+linux-doc@lfdr.de>; Tue,  9 Nov 2021 12:50:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343598AbhKILw5 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 9 Nov 2021 06:52:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343590AbhKILw4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 9 Nov 2021 06:52:56 -0500
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 873DAC0613F5
        for <linux-doc@vger.kernel.org>; Tue,  9 Nov 2021 03:50:10 -0800 (PST)
Received: by mail-ot1-x32c.google.com with SMTP id b5-20020a9d60c5000000b0055c6349ff22so19673106otk.13
        for <linux-doc@vger.kernel.org>; Tue, 09 Nov 2021 03:50:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ALBcIFK0M2sDqjczdXHc9NoWo8sCRANOPePxtQKC6v0=;
        b=WiNjKmsahtkj7noZ9ffdWo8zufH5fxNGTifxSgsaMThK1Bc25ubh55+CHeuGaG7dca
         IUJu9SE+F1ZklwyVbmXyyhhwcj0fg+IcXAUeMkT2TM5AtPRpH3WjiiGM0JbYuy1FNyNo
         W/m4prG/Qo/AI9tmUfrtEwc1xzSfJ8Q+7ZXo7dZw2gmjbx0/oFHLRnz+TXr7yb4yt4rw
         DbpNSz1GfVi/hAHf/6iZhz37emGktf2XV99bWXojbMU9ELu6783fpV36atKSUBhOD6FP
         qt5X3Lt9oO+YFKDBZilTPQ4bEsJUs+P+vARkfPy4jNZXysxqcTZkkSfcAc6qC7oUWOwo
         t/8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ALBcIFK0M2sDqjczdXHc9NoWo8sCRANOPePxtQKC6v0=;
        b=UCR3wEMAiGRTDEIbmwgwUOGAJtD6Dn2fBQZqiVeHbe2cvqpysupvf7FTMOk/UylSOv
         pfp1t/hQ7iHnTIZXgnDUTf+Y3IcoTPOxrpZA+n/IXzcR3G/x74Tj2t4LgS1xup9CKUxQ
         gGZ9jgSd0HR5gbbciCYkYDquWH/Ec7pbyBPqha7q9XzaZTN2DbUIhp2+8c8UZnA5fmtO
         twl1GOXHMDHorsjWz2IAeXZkNUN/eRsyLh1Pq+7iYgQockrvkwRkyL6LPvYGoN6iC7bX
         X3rpdkKMYABv84vroYv1MRpTtjG6hKUecyyIfSPyuBU5q9u7rwdMCbUx1JAAHauedZFG
         NSUA==
X-Gm-Message-State: AOAM530jjauQZM0wr5yqTcCz+701YERfsoOX4ZolYwUOCalA8WV4Rj8j
        DNw0hyUVYe0X05vXfszUY9cqkUxdGFqiZ4vwGHirHg==
X-Google-Smtp-Source: ABdhPJykswbjVxAwy6QccCD6a4oKxQG8ZBoSavSKVwonmEEZcj7+3DiAKXMLdnvkMbWw05xgzSkhW8FiyFJlI+8TVv8=
X-Received: by 2002:a9d:ed6:: with SMTP id 80mr5272989otj.35.1636458609456;
 Tue, 09 Nov 2021 03:50:09 -0800 (PST)
MIME-Version: 1.0
References: <20211105130338.241100-1-arnd@kernel.org>
In-Reply-To: <20211105130338.241100-1-arnd@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 9 Nov 2021 12:49:58 +0100
Message-ID: <CACRpkdYKs==og5pSsSxMXXozkexybJEnTHZWUr1ObsqAsGPuRA@mail.gmail.com>
Subject: Re: [RFC 1/3] gpiolib: remove irq_to_gpio() definition
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-m68k@lists.linux-m68k.org, geert@linux-m68k.org,
        gerg@linux-m68k.org, linux@armlinux.org.uk,
        linux-arm-kernel@lists.infradead.org, linux-sh@vger.kernel.org,
        dalias@libc.org, ysato@users.sourceforge.jp,
        Arnd Bergmann <arnd@arndb.de>,
        Fu Wei <tekkamanninja@gmail.com>, Alex Shi <alexs@kernel.org>,
        Hu Haowen <src.res@email.cn>,
        linux-doc-tw-discuss@lists.sourceforge.net,
        Jonathan Corbet <corbet@lwn.net>,
        Drew Fustini <drew@beagleboard.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Nov 5, 2021 at 2:03 PM Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> All implementations other than coldfire have returned an error since
> the avr32 and blackfin architectures got removed, and the last user in
> driver code was removed in 2016, so just remove this old interface.
>
> The only reference is now in the Chinese documentation, which should be
> changed to remove this reference as well.
>
> Cc: Fu Wei <tekkamanninja@gmail.com>
> Cc: Alex Shi <alexs@kernel.org>
> Cc: Hu Haowen <src.res@email.cn>
> Cc: linux-doc-tw-discuss@lists.sourceforge.net
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks for doing this Arnd. I had it on my mind some years
ago but I think Coldfire or something was still using it and didn't
think about it as the last user disappeared.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
