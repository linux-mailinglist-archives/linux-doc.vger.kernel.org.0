Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 800053B5305
	for <lists+linux-doc@lfdr.de>; Sun, 27 Jun 2021 13:36:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230174AbhF0Li5 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 27 Jun 2021 07:38:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229936AbhF0Li5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 27 Jun 2021 07:38:57 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B511C061767
        for <linux-doc@vger.kernel.org>; Sun, 27 Jun 2021 04:36:32 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id a18so3923801lfs.10
        for <linux-doc@vger.kernel.org>; Sun, 27 Jun 2021 04:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=L0uluB7HuQhsw7mGnLWslYA3uy3EG1MTHEbuGazF1rg=;
        b=ePrWJTf7MzJcYP7/RoZK6gO7JLRBO7zov1scQSv9IVmTZKotCrKZoFil5Br5uhC/mq
         LmsZKu5JQrdFYFzB2L1VY8HZqJjae/32EPCP7RIsqJVyGu8BpM/KdvFHyofUzkEGy7yQ
         xy/7kIRtpt2O+sotuqaMxLbTySSIaoe4lry2oJKnKu+Rahjuf0c2wow19vmAlrlXT0js
         sXrkKtHJeBtoguCVvVQNJrLVqvGtORkuiXhNBzPe2EDsx+3SuJ8tgRQ2b3lqIY85Tbe8
         SKo+Z8vVKo5d+6UPMHPSxjAChI3zdgwGPzM332aDSNCggqFnPvIIgQP53lyKzRLUgXc4
         O7oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L0uluB7HuQhsw7mGnLWslYA3uy3EG1MTHEbuGazF1rg=;
        b=q5GZPXCsMU7HfByfbYCRoRNRfyQna09oJQPdB9xI6MpJaJhpbmX26L/TC9i/6b3AQU
         GegWdlGO2to5gK3KKEEcNTvh1ijYCn/zlRGgEeAbIsJBJFuBbwG0w8gg5NIizZEnNQVL
         LVNbb/7mabCt09ZF6Tq+8M49xhDIkSjXRMURqFUvSrz1nQr/EYoUMmXlwobO31y3cjqm
         0XKbfMjS5WQk7j8/l/GF+W3SAZC7SMS68OSt6+0cjkTrACf6JRuOAQq8U37y5REGtZFc
         wYaOejK9ogS7dEmyGCiTLJug66ztvcfDgvXXnte6CcY3W/M6MEJjCTQiVcykSRpVQC+Z
         qTtw==
X-Gm-Message-State: AOAM532tXV09UnUDi2+L/854qJnHaWjbCkE1do0b4Hc7aTAySwddL4g4
        70LlfPCjAEEyyvivm5SAC8stAnicIrBvgxoUfMmFxQ==
X-Google-Smtp-Source: ABdhPJxWfLAvo/+u9bB5PGDdyQPOHtnDXhWs2ic8sha6ZDWiAWx0ULOR3o0RjVDJruFbYAGHa1N/Vwt3sGwfhFv2iiU=
X-Received: by 2002:a05:6512:3c9f:: with SMTP id h31mr5354921lfv.465.1624793790690;
 Sun, 27 Jun 2021 04:36:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210625235532.19575-1-dipenp@nvidia.com> <20210625235532.19575-10-dipenp@nvidia.com>
In-Reply-To: <20210625235532.19575-10-dipenp@nvidia.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 27 Jun 2021 13:36:18 +0200
Message-ID: <CACRpkdaqKJLUdf3NiFHaTgu6buyhMb_D1yKyHF4M=eTQ94pe-g@mail.gmail.com>
Subject: Re: [RFC 09/11] tools: gpio: Add new hardware clock type
To:     Dipen Patel <dipenp@nvidia.com>
Cc:     "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Kent Gibson <warthog618@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Jun 26, 2021 at 1:48 AM Dipen Patel <dipenp@nvidia.com> wrote:

> gpiolib-cdev is extended to support hardware clock type, this
> patch reflects that fact.
>
> Signed-off-by: Dipen Patel <dipenp@nvidia.com>
(...)
>                 case 'w':
>                         config.flags |= GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME;
>                         break;
> +               case 't':
> +                       config.flags |= GPIO_V2_LINE_FLAG_EVENT_CLOCK_HARDWARE;
> +                       break;

After the checking of the command line options we need a small sanity
check so we don't try to enable both realtime and hardware clock
at the same time, we will only be able to request one of them.

Yours,
Linus Walleij
