Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8784732E660
	for <lists+linux-doc@lfdr.de>; Fri,  5 Mar 2021 11:29:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229637AbhCEK3V (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 5 Mar 2021 05:29:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229730AbhCEK2v (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 5 Mar 2021 05:28:51 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 543BAC061762
        for <linux-doc@vger.kernel.org>; Fri,  5 Mar 2021 02:28:50 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id u4so2817487lfs.0
        for <linux-doc@vger.kernel.org>; Fri, 05 Mar 2021 02:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lo7hHCf2xoJPHW7HnDCyEwaSFaM7Keg2AX2jZ4uVfBI=;
        b=W50MxM+40GpkXjVUgQZ+hglkhIatQ62en1ksXZx59zKvAOfcZtgwWtdXoYBHbG7Q23
         AqbI/7ojmTDD4QGv0lw8kRBK/x1R3M7p046e8wJ9yk0jYBxUiHfx2gNulxd5b2VkSfEn
         FQpet8cbJgwx+ZAH1E58hlDWyP2/BJOZ8MPWCf0sXMFllAX98uCZ3wbY5ayGxbMs4OXY
         0ELSFzLEg/Oig2lds2PIkXAjDMUnftrtBWKSIEXKfQzpOgXgiPiHqw6il4Rg8bh1JzBm
         Ely81fAir1FA+I23NIFzQHAxRDDpkYyqM2YyJJ9hcyu3flk6I1hwaOVux6oKkJYSxbzh
         KMTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lo7hHCf2xoJPHW7HnDCyEwaSFaM7Keg2AX2jZ4uVfBI=;
        b=az89eL5T6f/4lLHYYl6I0UHJGf30Ktnuvo3vpR+iTWOGz/pVCm/F5FC9Gna1NXAbtr
         2aXB1U6yj3qqEeFRiP1XmYIm4j4yTctlNgdCGWxC/sMGZEKAyu9ncZw1ROWs61pwshFY
         ZrgUPbescCzNwuLta6EsJJ4+pD/qtohzk9QSfYIscGAObiJNwLAiQQhgizDae9wKUonr
         gy4qYnuNLM7+ynQiOhQIPAMq9vE4qbXkaRsrxoa+Z0Hq7E7deNPmRwqE4BFICQIvg5Oy
         ZZlPTfNs0KIDc5w3kMEH1qkCQBDCc9D0hR0v3wg8w7Tn0bsckXuIvR4CdQOrXe18PgFI
         4Tdg==
X-Gm-Message-State: AOAM533C2A8anA5mCdKfHzEksnrvc/Rup+BbDZivg1olpkdNtaUzKAUH
        h0LEUknNNN8KGe3l9zYr3C37pvds/8vQv43KQcG6jA==
X-Google-Smtp-Source: ABdhPJxqboRmk7GaUgHUNxF2rciULSS6Cfp4YQ2azcCXSVJPJxIT8FGFZd/sqZPKGLsQ+vg8Pkh7I/AkoigHnc7uIX0=
X-Received: by 2002:a05:6512:74a:: with SMTP id c10mr5124313lfs.586.1614940128739;
 Fri, 05 Mar 2021 02:28:48 -0800 (PST)
MIME-Version: 1.0
References: <20210304213902.83903-1-marcan@marcan.st> <20210304213902.83903-13-marcan@marcan.st>
In-Reply-To: <20210304213902.83903-13-marcan@marcan.st>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 5 Mar 2021 11:28:37 +0100
Message-ID: <CACRpkdZHpqF1f2rSmgb90d8v_7NDe=Bqk4M1YbRJpOMFZmod4w@mail.gmail.com>
Subject: Re: [RFT PATCH v3 12/27] of/address: Add infrastructure to declare
 MMIO as non-posted
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

> This implements the 'nonposted-mmio' and 'posted-mmio' boolean
> properties. Placing these properties in a bus marks all child devices as
> requiring non-posted or posted MMIO mappings. If no such properties are
> found, the default is posted MMIO.
>
> of_mmio_is_nonposted() performs the tree walking to determine if a given
> device has requested non-posted MMIO.
>
> of_address_to_resource() uses this to set the IORESOURCE_MEM_NONPOSTED
> flag on resources that require non-posted MMIO.
>
> of_iomap() and of_io_request_and_map() then use this flag to pick the
> correct ioremap() variant.
>
> This mechanism is currently restricted to Apple ARM platforms, as an
> optimization.
>
> Signed-off-by: Hector Martin <marcan@marcan.st>

This is fine with me atleast given that the nonposted IO is acceptable.
Caching the quirk state in a static local is maybe a bit overoptimized
but if the compiler can't see it but we can, why not.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
