Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 725C2549C6F
	for <lists+linux-doc@lfdr.de>; Mon, 13 Jun 2022 20:59:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245665AbiFMS7N (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 13 Jun 2022 14:59:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347254AbiFMS6y (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 13 Jun 2022 14:58:54 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43F0C2CDC4
        for <linux-doc@vger.kernel.org>; Mon, 13 Jun 2022 09:13:05 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id y19so12115426ejq.6
        for <linux-doc@vger.kernel.org>; Mon, 13 Jun 2022 09:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ClWJGxROkRDHXKyRKDqxhN+/3eAFVZ0J4XFXQm1t9qU=;
        b=352ckjxwFkIPRoqqLFdZX1qx+ohNn0RBDoCcMhG20RcD8Am5eTfV3uZE0VupOpwFdS
         JQxFM4g+EMOniZcH52An4JwINyQFsFGcYHRrDQhYh60Wp3OxVBFl3ut9qmMbePIQgovv
         QxlmDkCHe6VoOOR7AmY6uFB3hPZ0xrRSo6UgMjmvCpFDLaE2n7HkR54ZJAs9OoeUBAFQ
         1wJ4rJ38bIDtUFNVEVY6zOXyiBZ7O7azc+BYvlrplLCUz1rJ88BPzOBcIqELN2dNt6LZ
         GLrE3KUAwVBUe8vZ7Rv8KRS57zXAKiTVwYLlXkh11EGZexZx30i+dld6IKhx7AbBJxdm
         ADsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ClWJGxROkRDHXKyRKDqxhN+/3eAFVZ0J4XFXQm1t9qU=;
        b=rzqqRpueULakw4Z5R2ESVamVE2aQXoA9wtY6VkjTd42+LYmtbZKnR5bvv22Xs2AvuD
         1XOYqjTkWDLBiOAGNlsoK4M+xqZA9U0wvaS4bp4+qj4wgzwcKxyXjsTjZ8pR/VRoR2It
         sLm6Rt+6qFwQkgiRWX4TeHaAQk9BBiyFVNUAH2RRC/QN1ZJL7AMwMw7NRgKWhGQTMlE1
         FTZyd10sb2y2ymoPe/ypgJcYsVHVFnScHNzu6aZdAwTlEPFCGv1/VvjU5JQcTYePxubr
         2shQ9ARwvPXbteii1sus/MNoFXDkSL6He7Qmv9MNIbf6GRx9367YAReL8oe0zZiqfQeA
         CP6g==
X-Gm-Message-State: AOAM530+hCnoInY7N9wWwyHCDSAkKId1/3IvUn7L6qBdNO0f6azN4VeD
        Utq8Mq3QnkcIgp8VEJGy9/F7LR2QmW54ddu02vgCbg==
X-Google-Smtp-Source: ABdhPJySjC9TbtjM/sD70Pf5P+b3I/hrQhRNqdbWjkjgsqa+zsxIpqishLf6a0BMLEDd1Xhsp9hDMzexnGYeDSh2CL4=
X-Received: by 2002:a17:907:90c8:b0:711:c8e1:7109 with SMTP id
 gk8-20020a17090790c800b00711c8e17109mr517177ejb.492.1655136783827; Mon, 13
 Jun 2022 09:13:03 -0700 (PDT)
MIME-Version: 1.0
References: <YqY39Rwi4Lnzw2GH@posteo.de>
In-Reply-To: <YqY39Rwi4Lnzw2GH@posteo.de>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 13 Jun 2022 18:12:53 +0200
Message-ID: <CAMRc=MeVHf2Zq3L9prhxSZ=tNDcY6+aXQKyq_BqO5XF0oDB1HQ@mail.gmail.com>
Subject: Re: [PATCH] docs: driver-api: gpio: Fix filename mismatch
To:     Tom Schwindl <schwindl@posteo.de>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-doc <linux-doc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Jun 12, 2022 at 9:01 PM Tom Schwindl <schwindl@posteo.de> wrote:
>
> The filenames were changed a while ago, but board.rst, consumer.rst and
> intro.rst still refer to the old names. Fix those references to match the
> Actual names and avoid possible confusion.
>
> Signed-off-by: Tom Schwindl <schwindl@posteo.de>
> ---
>  Documentation/driver-api/gpio/board.rst    | 2 +-
>  Documentation/driver-api/gpio/consumer.rst | 6 +++---
>  Documentation/driver-api/gpio/intro.rst    | 6 +++---
>  3 files changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/Documentation/driver-api/gpio/board.rst b/Documentation/driver-api/gpio/board.rst
> index 4e3adf31c8d1..b33aa04f213f 100644
> --- a/Documentation/driver-api/gpio/board.rst
> +++ b/Documentation/driver-api/gpio/board.rst
> @@ -6,7 +6,7 @@ This document explains how GPIOs can be assigned to given devices and functions.
>
>  Note that it only applies to the new descriptor-based interface. For a
>  description of the deprecated integer-based GPIO interface please refer to
> -gpio-legacy.txt (actually, there is no real mapping possible with the old
> +legacy.rst (actually, there is no real mapping possible with the old
>  interface; you just fetch an integer from somewhere and request the
>  corresponding GPIO).
>
> diff --git a/Documentation/driver-api/gpio/consumer.rst b/Documentation/driver-api/gpio/consumer.rst
> index 47869ca8ccf0..72bcf5f5e3a2 100644
> --- a/Documentation/driver-api/gpio/consumer.rst
> +++ b/Documentation/driver-api/gpio/consumer.rst
> @@ -4,7 +4,7 @@ GPIO Descriptor Consumer Interface
>
>  This document describes the consumer interface of the GPIO framework. Note that
>  it describes the new descriptor-based interface. For a description of the
> -deprecated integer-based GPIO interface please refer to gpio-legacy.txt.
> +deprecated integer-based GPIO interface please refer to legacy.rst.
>
>
>  Guidelines for GPIOs consumers
> @@ -78,7 +78,7 @@ whether the line is configured active high or active low (see
>
>  The two last flags are used for use cases where open drain is mandatory, such
>  as I2C: if the line is not already configured as open drain in the mappings
> -(see board.txt), then open drain will be enforced anyway and a warning will be
> +(see board.rst), then open drain will be enforced anyway and a warning will be
>  printed that the board configuration needs to be updated to match the use case.
>
>  Both functions return either a valid GPIO descriptor, or an error code checkable
> @@ -270,7 +270,7 @@ driven.
>  The same is applicable for open drain or open source output lines: those do not
>  actively drive their output high (open drain) or low (open source), they just
>  switch their output to a high impedance value. The consumer should not need to
> -care. (For details read about open drain in driver.txt.)
> +care. (For details read about open drain in driver.rst.)
>
>  With this, all the gpiod_set_(array)_value_xxx() functions interpret the
>  parameter "value" as "asserted" ("1") or "de-asserted" ("0"). The physical line
> diff --git a/Documentation/driver-api/gpio/intro.rst b/Documentation/driver-api/gpio/intro.rst
> index 2e924fb5b3d5..c9c19243b97f 100644
> --- a/Documentation/driver-api/gpio/intro.rst
> +++ b/Documentation/driver-api/gpio/intro.rst
> @@ -14,12 +14,12 @@ Due to the history of GPIO interfaces in the kernel, there are two different
>  ways to obtain and use GPIOs:
>
>    - The descriptor-based interface is the preferred way to manipulate GPIOs,
> -    and is described by all the files in this directory excepted gpio-legacy.txt.
> +    and is described by all the files in this directory excepted legacy.rst.
>    - The legacy integer-based interface which is considered deprecated (but still
> -    usable for compatibility reasons) is documented in gpio-legacy.txt.
> +    usable for compatibility reasons) is documented in legacy.rst.
>
>  The remainder of this document applies to the new descriptor-based interface.
> -gpio-legacy.txt contains the same information applied to the legacy
> +legacy.rst contains the same information applied to the legacy
>  integer-based interface.
>
>
> --
>

Applied, thanks!

Bart
