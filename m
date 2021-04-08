Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75765358FB1
	for <lists+linux-doc@lfdr.de>; Fri,  9 Apr 2021 00:14:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232701AbhDHWOv (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 8 Apr 2021 18:14:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232265AbhDHWOv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 8 Apr 2021 18:14:51 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5445C061760
        for <linux-doc@vger.kernel.org>; Thu,  8 Apr 2021 15:14:38 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id o16so4122801ljp.3
        for <linux-doc@vger.kernel.org>; Thu, 08 Apr 2021 15:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UZYFt0LVceFfcAprXRqy7FjMz5TZMkhneNJXsWawHjA=;
        b=jh/m8+mpPAxdKJ0faiWMDsB8ThJ/bVJJ9pnV2DdOmRS9/0Oups3cMyWdWzW18R9i8j
         gbunTrdTzXj61KzAnIHGuLvJ9nkft7x+MraDzr7gFF1yaBGUjtjTTdMiYQ+PunQrg6Mq
         AHGDRg72C/ydMvv4dEfdxZRPqzyRfYLL/pSvqU735sU8zij4s5RgqNN1PZ4wS+Wdi6Ka
         AZRfpoyBNCCwQ3y+fFkFyztWzGjIj4Wpf0KA1axvxXHsmaTEVk+z8NE0++4kRHkHMHFm
         aPIVCbs0pKTV4iffO/p2kmB53EhxBPUETOwOLcv2vlxxWltOmJLjG8b2F2EkOAbgrmI2
         7blw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UZYFt0LVceFfcAprXRqy7FjMz5TZMkhneNJXsWawHjA=;
        b=jqKY+1VjzhEED9xqZ6s5cGn9c8TLiRdpHp0l9zM+BwjClZJSQ4jGdVCoe14+s8bP9O
         qMwIkvF1HSMXJwasHx5waCiz0C+SVjMB1xQm6nFQElLdPP65v+kHdXHeTr9rUbt5i4Fx
         9yGobZ2jgExdCRXlaq3xqUJVDu9HoTzx8NKZJa/wrYysaWNjYwgFC1CdmM6a+MiZE4MG
         cFyDc+7a23+gWWCcJJsIXdNkFrY30iYhzUf6Dq0L5TSduu42pQKdBxVmelXMwdWSbmMt
         P6MXk7Kgx0E4FILLGjyGGBw28l7xOTrI3g7G5tLcfwiSDNEVt1VZuckrJETloy35mbVg
         SaoA==
X-Gm-Message-State: AOAM532vVb54epvNBIt0j3c8jXYhDyZJItNHckZNh0/LhaxlgMzNf0nd
        1hiiE8Os8QBJ4JGJxUygMWSmvvA6cTeyaBBxNaQTMV95VjsY4A==
X-Google-Smtp-Source: ABdhPJzWty7OkE/zjpcMz5z53ansy9SUNQ01JxDM7F1AxOx5za4NUdfe6x0onlsn7zmcaLaN2CQvWeG2UAY2qDU8U9A=
X-Received: by 2002:a2e:864a:: with SMTP id i10mr7305898ljj.467.1617920077290;
 Thu, 08 Apr 2021 15:14:37 -0700 (PDT)
MIME-Version: 1.0
References: <bdb18e9f-fcd7-1e31-2224-19c0e5090706@marcan.st>
In-Reply-To: <bdb18e9f-fcd7-1e31-2224-19c0e5090706@marcan.st>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 9 Apr 2021 00:14:26 +0200
Message-ID: <CACRpkdaijbDoV2rSQsgO3XKnj_Hde8CU9JQ+V9gGePYjvCWJhA@mail.gmail.com>
Subject: Re: [GIT PULL] Apple M1 SoC platform bring-up for 5.13
To:     Hector Martin <marcan@marcan.st>
Cc:     SoC Team <soc@kernel.org>, Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh@kernel.org>, Arnd Bergmann <arnd@kernel.org>,
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
        Jonathan Corbet <corbet@lwn.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christoph Hellwig <hch@infradead.org>,
        "David S. Miller" <davem@davemloft.net>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux-Arch <linux-arch@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Apr 8, 2021 at 5:55 PM Hector Martin <marcan@marcan.st> wrote:

> Hi Arnd and all,
>
> Here's the final version of the M1 SoC bring-up series, based on
> v4 which was reviewed here:
>
> https://lore.kernel.org/linux-arm-kernel/20210402090542.131194-1-marcan@marcan.st/T/#u

Excellent work on this series Hector, thanks for working so hard on this!

Yours,
Linus Walleij
