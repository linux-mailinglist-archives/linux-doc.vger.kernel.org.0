Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8736E32E6D4
	for <lists+linux-doc@lfdr.de>; Fri,  5 Mar 2021 11:55:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229505AbhCEKzJ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 5 Mar 2021 05:55:09 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:50922 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229597AbhCEKzB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 5 Mar 2021 05:55:01 -0500
Received: from mail-wr1-f70.google.com ([209.85.221.70])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lI86l-0000tL-Av
        for linux-doc@vger.kernel.org; Fri, 05 Mar 2021 10:54:59 +0000
Received: by mail-wr1-f70.google.com with SMTP id h21so875447wrc.19
        for <linux-doc@vger.kernel.org>; Fri, 05 Mar 2021 02:54:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zSEM++y1rebUisHLCtkG+UNXZIjCmpiRoJ42u2ytX3M=;
        b=AC9EP93FJKJNfCVSBejsMixsuOkUhdWtr8djIVhH/GNQKqJdsPU8EE1VNBsDcLOKfB
         5z7AOqOXwuhu085Y9vwi9i3OQlIbTkLk7+dzmwkyZFROlB+12da1vrwIjWwdeahQHnOF
         GMS3slP9xBftrVlP60O9mBAZ6kTTbUp6gBiwlzw+fUnuMFsAuNMlvxdxNMqLWTfbMWCs
         eV5VYfEDsUuJPw3aGgEaSNKu9IlXp5kmRGMXg0y2gRgobBDjqsxEcauzHy0Q8FXmR8Uv
         UVnxHV7Ymv0/L9fig4VGO68insL6ggmUutvT3sPXo5iSX3R+0NqoSlMo8t6KI1NcxMeK
         NfnQ==
X-Gm-Message-State: AOAM531MYBW7KBwKl6pNx21mbb9Gj9F1jh5+WmG7Y5I0guqoc7jXcDSu
        xra+vzQblHlUsFqv7wsXXPrkAVFE7LgcnYgmvtf6dPihZ6CNtPxEBk+cJGqKMvs0PDbIuuFWDdF
        Sg7GTI9mM7cM+n9oY7clQlTIbwca0IgHeO/GC4g==
X-Received: by 2002:a7b:c1c4:: with SMTP id a4mr8453971wmj.122.1614941699042;
        Fri, 05 Mar 2021 02:54:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyVP9HaZ/X6h/g7Ggd5kC4cMtRdG0Xd39MHNruIlJ/V8+Cs+3v2YX2SK0aMTtOO80rSXOLn5A==
X-Received: by 2002:a7b:c1c4:: with SMTP id a4mr8453958wmj.122.1614941698935;
        Fri, 05 Mar 2021 02:54:58 -0800 (PST)
Received: from [192.168.1.116] (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.gmail.com with ESMTPSA id s23sm3761833wmc.29.2021.03.05.02.54.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Mar 2021 02:54:58 -0800 (PST)
Subject: Re: [RFT PATCH v3 22/27] tty: serial: samsung_tty: Use
 devm_ioremap_resource
To:     Hector Martin <marcan@marcan.st>,
        linux-arm-kernel@lists.infradead.org
Cc:     Marc Zyngier <maz@kernel.org>, Rob Herring <robh@kernel.org>,
        Arnd Bergmann <arnd@kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Mark Kettenis <mark.kettenis@xs4all.nl>,
        Tony Lindgren <tony@atomide.com>,
        Mohamed Mediouni <mohamed.mediouni@caramail.com>,
        Stan Skowronek <stan@corellium.com>,
        Alexander Graf <graf@amazon.com>,
        Will Deacon <will@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christoph Hellwig <hch@infradead.org>,
        "David S. Miller" <davem@davemloft.net>,
        devicetree@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210304213902.83903-1-marcan@marcan.st>
 <20210304213902.83903-23-marcan@marcan.st>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <fe2cbf68-8b88-5128-035d-f941a9d17d74@canonical.com>
Date:   Fri, 5 Mar 2021 11:54:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210304213902.83903-23-marcan@marcan.st>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 04/03/2021 22:38, Hector Martin wrote:
> This picks up the non-posted I/O mode needed for Apple platforms to
> work properly.
> 
> This removes the request/release functions, which are no longer
> necessary, since devm_ioremap_resource takes care of that already. Most
> other drivers already do it this way, anyway.
> 
> Signed-off-by: Hector Martin <marcan@marcan.st>
> ---
>  drivers/tty/serial/samsung_tty.c | 25 +++----------------------
>  1 file changed, 3 insertions(+), 22 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Best regards,
Krzysztof
