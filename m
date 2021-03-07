Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B08F6330460
	for <lists+linux-doc@lfdr.de>; Sun,  7 Mar 2021 21:00:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232758AbhCGTvm (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 7 Mar 2021 14:51:42 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:56870 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232741AbhCGTvI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 7 Mar 2021 14:51:08 -0500
Received: from mail-wm1-f71.google.com ([209.85.128.71])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lIzQh-0001k0-0w
        for linux-doc@vger.kernel.org; Sun, 07 Mar 2021 19:51:07 +0000
Received: by mail-wm1-f71.google.com with SMTP id j8so1130573wmq.6
        for <linux-doc@vger.kernel.org>; Sun, 07 Mar 2021 11:51:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kfxTFWpE+U1s7RCH9bz3J8B1Q2nmRmVCf8INgvhDrDk=;
        b=qGLYBNbBrKr43BY7lIOV2U/xB0+QiUOYw3BwHkIvjzzrzm6ZcA5dtyPC7K0Udh9h6+
         K9NC+YfPs1peX/pj6Z0RadxIIm2RpnW7BXTuD/zwriYmZx7v8by+MbIOm5PaT56QsPbP
         KjKSOeH2Eckh9eRIRiFWRaG0mXlTYVYHEOJZqbogTuY/QTF4ZC4T/+iZdUWYifjauhuR
         dJpT6Jb64cpynFj/jpFXVd4k3Ke5BHZt2FdbdjsP/Nyenmjk0L3LVmTj8+tzHsvgzP2M
         GiqBUXna/eIj0L2+XGmmqKI5HUI5R5Cztfs20UxkP4Si/l28Sf8WJyW7+PZ6kq3JIrxa
         q4DQ==
X-Gm-Message-State: AOAM531pyzo7H4NdGEpzQkc//2lxmpLPxvc0nZdkaL+ffnvnzJTLzhZl
        BM7GSQWVS57Cco2DwtBbO5z0MJkTaNZ+G/AFkQaZHY0VDsEh+2tmKvcKMeOPPEa778/SaurY+VQ
        lczt+l1UjeUyoJX+QIMzI7H4zZIT9p+Hw6ts1bg==
X-Received: by 2002:a1c:df8a:: with SMTP id w132mr18775269wmg.53.1615146665653;
        Sun, 07 Mar 2021 11:51:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwffZzLs3PiQ9TeAhZa+zD26CO9uqpWEoQh7UlJniVKzU7h8Kyv9yC8ZT05jpfXr7Q8PQWSPQ==
X-Received: by 2002:a1c:df8a:: with SMTP id w132mr18775242wmg.53.1615146665465;
        Sun, 07 Mar 2021 11:51:05 -0800 (PST)
Received: from [192.168.1.116] (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.gmail.com with ESMTPSA id h6sm10016643wmi.6.2021.03.07.11.51.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Mar 2021 11:51:04 -0800 (PST)
Subject: Re: [RFT PATCH v3 21/27] tty: serial: samsung_tty: IRQ rework
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Hector Martin <marcan@marcan.st>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Marc Zyngier <maz@kernel.org>, Rob Herring <robh@kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Mark Kettenis <mark.kettenis@xs4all.nl>,
        Tony Lindgren <tony@atomide.com>,
        Mohamed Mediouni <mohamed.mediouni@caramail.com>,
        Stan Skowronek <stan@corellium.com>,
        Alexander Graf <graf@amazon.com>,
        Will Deacon <will@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christoph Hellwig <hch@infradead.org>,
        "David S. Miller" <davem@davemloft.net>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Linux Documentation List <linux-doc@vger.kernel.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        Linux-Arch <linux-arch@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20210304213902.83903-1-marcan@marcan.st>
 <20210304213902.83903-22-marcan@marcan.st>
 <CAHp75Vc+t9_FNHZ0xYNaJ1+Ny+FFeZKA79abxV2NAsZvpBh3Bg@mail.gmail.com>
 <535ff48e-160e-4ba4-23ac-54e478a2f3ee@marcan.st>
 <CAHp75Vd_kwdjbus3iq_39+p_xRk3rum2ek3nLLFbBDzMwggnKA@mail.gmail.com>
 <05ccc09f-ffea-71cd-4288-beed3020bd45@marcan.st>
 <d33fffec-28bd-99b2-a8b1-cc83b628e4b3@canonical.com>
 <CAK8P3a0o4NHjXZ+ePj_Xpcw6ZmonoiR1dfkcsv=3i1JBEF4arA@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <20a8ce3e-bffa-4fc0-1f1d-185c04be8d9f@canonical.com>
Date:   Sun, 7 Mar 2021 20:51:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAK8P3a0o4NHjXZ+ePj_Xpcw6ZmonoiR1dfkcsv=3i1JBEF4arA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 07/03/2021 17:01, Arnd Bergmann wrote:
> On Sun, Mar 7, 2021 at 12:34 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
>> On 05/03/2021 17:29, Hector Martin wrote:
>>> On 06/03/2021 01.20, Andy Shevchenko wrote:
>>>>> I am just splitting an
>>>>> existing function into two, where one takes the lock and the other does
>>>>> the work. Do you mean using a different locking function? I'm not
>>>>> entirely sure what you're suggesting.
>>>>
>>>> Yes, as a prerequisite
>>>>
>>>> spin_lock_irqsave -> spin_lock().
>>>
>>> Krzysztof, is this something you want in this series? I was trying to
>>> avoid logic changes to the non-Apple paths.
>>
>> I don't quite get the need for such change (the code will be still
>> called in interrupt handler, right?), but assuming the "why?" is
>> properly documented, it can be a separate patch here.
> 
> This is only for readability: the common rule is to not disable
> interrupts when they are already disabled, so a reader might wonder
> if this instance of the handler is special in some case that it might
> be called with interrupts enabled.
> 
> There is also a small overhead in accessing the global irq mask
> register on some architectures, but for a uart that does not make
> any difference of course.
> 
> While I'm generally in favor of that kind of cleanup, I'd also
> prefer to leave it out of this series -- once you get into details
> like this the series gets harder to review.

So it's only about the spinlock in the IRQ handler (which does not need
to disable the IRQs). Makes sense but not related at all to the topic of
bringing up Apple M1, therefore should not stop the review/merging.

Best regards,
Krzysztof
