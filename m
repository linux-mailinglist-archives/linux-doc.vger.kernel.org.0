Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99A7032E616
	for <lists+linux-doc@lfdr.de>; Fri,  5 Mar 2021 11:20:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229637AbhCEKTf (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 5 Mar 2021 05:19:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229551AbhCEKTA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 5 Mar 2021 05:19:00 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17A6BC06175F
        for <linux-doc@vger.kernel.org>; Fri,  5 Mar 2021 02:18:59 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id z11so2677484lfb.9
        for <linux-doc@vger.kernel.org>; Fri, 05 Mar 2021 02:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xwNLb2P2LVN8VWnFdZc+rwNuJ+QqAA27JjkB8JsHwdE=;
        b=ASt1IVQLPzb9L80bE8m9f6kqqabCk7u0JOhy1MzrBL/Y2CJ0Dk+b11puVpKMC0/6Ns
         ie9feACUA5VpTHep8VxEOVnrNzCWCNw0ghuzbPl2o2TA6BQKPyu2TvpIsSl+n7WOXxhJ
         GnbpuvsdvzZ3lgB/WInil0/rAKCDEgOYM/BQIW1fnTNNKCc9Fub2YSSwCjDghaAsgXLx
         evXri9xJW+v/yVU6UBVsQBMa4XNp4xWamt9MADq5BSFM8ZPLmV2Xkc7NScHS74SmE1hH
         NVzcQFja3IFFj/naH4Ke4fa2zCfotjNhZsI0D7r4QpvMHpkV+H8RGn9fq5IQFSj0RD1D
         yI4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xwNLb2P2LVN8VWnFdZc+rwNuJ+QqAA27JjkB8JsHwdE=;
        b=GFilkzuaLKRVV7x9piSGJQ06A60UgZ3Ry7bj61iyq2GQZYtLzp0owbcbc8rBYX5gOP
         gGH2jRBJ4NyQQMYChSduhIJ6tI3WOS5weg569yio6RFZiEjvr/uhz0eTYBTdn+7b0UVE
         3pl1fxIcaHImw6kH+or0+MqPSFs+HOr+z2tj2abxAM0SUNLhsN5B2r3AyXMHIS3EjO//
         mAAfhDxo6J3F0aatTM9KkSfmsrp/R50Q3YM3TAlo3KPoOWZ/N0rPR2nebEIZ1LZ+GfUL
         cd1YTBsRz15Y7tR/lzkbcs/3WSrmHcwVoNxFRZLkgx3o0O0XaoqNVWO0xmf9YEs8oL4d
         QIjA==
X-Gm-Message-State: AOAM531w3bUkp1/+mLzPm//pR6fM7apuBUMNg5jZPF5M8dPMongAW5a1
        0Eyc7DXzqQJKHTk/LEcVb576NSC6ATuejzUO8fi8mQ==
X-Google-Smtp-Source: ABdhPJxA/IN9FI+YATqXHoTLFT+UsL1VJiDBv807dBmpi79MIpih6Nv69+jErWGhJ3E/idF9JDF05vISQLysXpmYRtw=
X-Received: by 2002:a19:6b13:: with SMTP id d19mr5000896lfa.291.1614939537603;
 Fri, 05 Mar 2021 02:18:57 -0800 (PST)
MIME-Version: 1.0
References: <20210304213902.83903-1-marcan@marcan.st> <20210304213902.83903-7-marcan@marcan.st>
In-Reply-To: <20210304213902.83903-7-marcan@marcan.st>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 5 Mar 2021 11:18:46 +0100
Message-ID: <CACRpkdYZX81vEivv331OOsaRUr65aLza3-Au-by5OL+w1D0RPA@mail.gmail.com>
Subject: Re: [RFT PATCH v3 06/27] dt-bindings: timer: arm,arch_timer: Add
 interrupt-names support
To:     Hector Martin <marcan@marcan.st>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Marc Zyngier <maz@kernel.org>, Rob Herring <robh@kernel.org>,
        Arnd Bergmann <arnd@kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Mark Kettenis <mark.kettenis@xs4all.nl>,
        Tony Lindgren <tony@atomide.com>,
        Mohamed Mediouni <mohamed.mediouni@caramail.com>,
        Stan Skowronek <stan@corellium.com>,
        Alexander Graf <graf@amazon.com>,
        Will Deacon <will@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christoph Hellwig <hch@infradead.org>,
        "David S. Miller" <davem@davemloft.net>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        Linux-Arch <linux-arch@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Mar 4, 2021 at 10:40 PM Hector Martin <marcan@marcan.st> wrote:

> Not all platforms provide the same set of timers/interrupts, and Linux
> only needs one (plus kvm/guest ones); some platforms are working around
> this by using dummy fake interrupts. Implementing interrupt-names allows
> the devicetree to specify an arbitrary set of available interrupts, so
> the timer code can pick the right one.
>
> This also adds the hyp-virt timer/interrupt, which was previously not
> expressed in the fixed 4-interrupt form.
>
> Signed-off-by: Hector Martin <marcan@marcan.st>

This looks good to me.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
