Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56D3D34FAA6
	for <lists+linux-doc@lfdr.de>; Wed, 31 Mar 2021 09:45:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234123AbhCaHoj (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 31 Mar 2021 03:44:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234168AbhCaHoR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 31 Mar 2021 03:44:17 -0400
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0C96C06175F
        for <linux-doc@vger.kernel.org>; Wed, 31 Mar 2021 00:44:13 -0700 (PDT)
Received: by mail-yb1-xb33.google.com with SMTP id x189so20206863ybg.5
        for <linux-doc@vger.kernel.org>; Wed, 31 Mar 2021 00:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GOIub7zSDEO9y3Tk79djblRNVs7ujr2nFJ28h5tSuwQ=;
        b=EblwNNAQO70nhkXNvYGBXkz3u5hkHDN2WOOKohtlnsNvLhTu+Rtrndp9CeVVMk+xBg
         ScWeg54aZ35IQHp3ZTkTYrOkz8mxoXnin32Q8SEPCNnPn2WXmAU2XSiT5e+pkku3YW6g
         Sgsd467/4dNsO/KEf3SJR0ZppXJtl1kfOC+XBiYVimqPXnZIoYKvJYY06/cpFVG/f1va
         eWQD4Bts7QVBORSoCzSBmnjAKr4nKrRL/hEXc2uXyRgmVJfPN8SlZApgbzNeiQRL/x6B
         SpGpocU7Gi5I0gnHDn9rgDRoe5xFU7SdqkEZT+l9am+NpZjz0dK/T2/kpl8PA/uWDn+D
         ZNbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GOIub7zSDEO9y3Tk79djblRNVs7ujr2nFJ28h5tSuwQ=;
        b=e4O3063id4W+VpL/MbzadNf/vPSiWMcifhssFX5iGXuCC0kCNq09Q4/bNb2Hzy5jSS
         ku2OaXpNccomIVeLw4XrAdkdRjGmgTTQGFL1qpLSGZSkoEowPZjYvjX3c7PNbCT5huCg
         79Ol9VzwqIFdRWT/ZJS92GJCRF02UDStGzz0WdauLFFQef3wtL0kMfvECQFFf3CPW4w9
         zetRu1FndJeml6cEXdf7EffGFhj+uqCk5cCvkpP6jF4Vy6LO9CTf0VLYElAg9jujx06b
         hQ8oQ+WZUNOMW2fLgVyKqviJaZb7svH0jZO7n2MzEMN9shBzF7uJSMSS49pEFI5Tjt1d
         UP8A==
X-Gm-Message-State: AOAM5331zixVIqyU7shXzqhGvVFJtODVDenSPaAgb0r1Xpn7rlp8sil6
        ixAFV2SFAmoxreqEZBOsbujA/ERXtotFpaSNy5Tz4A==
X-Google-Smtp-Source: ABdhPJwbHMZniQwRae4TUtkz47WD9WJwmCgxh0PTA7XlOpnGNfc39O0//KTOjxh3AJ1jgFjbrVZ4t3mWTaf7oG738i4=
X-Received: by 2002:a25:768c:: with SMTP id r134mr3069800ybc.366.1617176652325;
 Wed, 31 Mar 2021 00:44:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210329111648.7969-1-ada@thorsis.com> <20210329111648.7969-2-ada@thorsis.com>
In-Reply-To: <20210329111648.7969-2-ada@thorsis.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 31 Mar 2021 09:44:01 +0200
Message-ID: <CAMpxmJUrOZ6irBv2vuV1Qbh-L5XyqkzTUAwsUKPm5ZD7eTEweA@mail.gmail.com>
Subject: Re: [PATCH 1/3] docs: gpio: mockup: Fix parameter name
To:     Alexander Dahl <ada@thorsis.com>
Cc:     linux-doc <linux-doc@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Mar 29, 2021 at 1:17 PM Alexander Dahl <ada@thorsis.com> wrote:
>
> Module probing with the parameter documented yielded this in kernel log:
>
>         gpio_mockup: unknown parameter 'gpio_named_lines' ignored
>
> The parameter documented did not match the parameter actually
> implemented with commit 8a68ea00a62e ("gpio: mockup: implement naming
> the lines") long before introducing the documentation.
>
> Fixes: commit 2fd1abe99e5f ("Documentation: gpio: add documentation for gpio-mockup")
> Signed-off-by: Alexander Dahl <ada@thorsis.com>
> ---
>  Documentation/admin-guide/gpio/gpio-mockup.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/admin-guide/gpio/gpio-mockup.rst b/Documentation/admin-guide/gpio/gpio-mockup.rst
> index 9fa1618b3adc..e3cafb4451aa 100644
> --- a/Documentation/admin-guide/gpio/gpio-mockup.rst
> +++ b/Documentation/admin-guide/gpio/gpio-mockup.rst
> @@ -27,7 +27,7 @@ module.
>          the second 16 and the third 4. The base GPIO for the third chip is set
>          to 405 while for two first chips it will be assigned automatically.
>
> -    gpio_named_lines
> +    gpio_mockup_named_lines
>
>          This parameter doesn't take any arguments. It lets the driver know that
>          GPIO lines exposed by it should be named.
> --
> 2.20.1
>

This was already fixed by Andy.

Bartosz
