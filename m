Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BCC3142632
	for <lists+linux-doc@lfdr.de>; Mon, 20 Jan 2020 09:54:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726635AbgATIy6 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 20 Jan 2020 03:54:58 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:37385 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726589AbgATIy5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 20 Jan 2020 03:54:57 -0500
Received: by mail-wr1-f65.google.com with SMTP id w15so28642097wru.4
        for <linux-doc@vger.kernel.org>; Mon, 20 Jan 2020 00:54:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=wFASbmAcjMPLyphRbOiX44SHWrp7PXj1/IhOzEqtzro=;
        b=vDepYFXLBoVAdHKjwHAvg6Gv/5dJ2HbkMPPpNvh407VhcxpDu6rwVdq06AwjKNtA7z
         yVjrmfzAr7J2P7/UahLaaxU+a9AEin1BmQ3qPLTeKJebJSXIg/GqD6eKP+QgCMTIHa5X
         jBpSKQD6BwgTsW0J/wTt5Zr0L9ZVvXUPcN2VJBYBYxNPNOMRhV4Hfkpi0lDASbYL13e2
         SEQiVDtM6nt9Q+3J9KyCbGBppcZCANbQ0HIohP6/TRBANJBA+oNkyK6r5wifm7b3mZgO
         MkRAmiuzyekDPZPKh4U9itVgYWiSU0UvlIsEc7d/lTaMTBf5g+VlJWFL9+d0A2NRG0aR
         unjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=wFASbmAcjMPLyphRbOiX44SHWrp7PXj1/IhOzEqtzro=;
        b=O+xFLftFpFcg+twGSxV6OA9otHvpXv6ivgJm3M6X7Dk0pdzmWHA2cVpY4X48J6f+y3
         RQd/MWnYChTdBg3rmS8swalb6nW3gdJcyLaM4oelo0QdLzP/0WTcaV47wHW4f2nuLuWV
         6WljCFmkEqGiSBkfLYwr1jcyZFgDxoKeGXqikp7Wirh5VUp4z82hwoKZs7Nt+X/hMC1Z
         eNBS0ROSLxhZAi/RgIyiLh51wjJeHBokw4Ax8GO8jTzC5QVz+9ErY0sM2DpnEjHzySzg
         RNtD/+Fzk+SOsDNaFUJjl6GHDmFn5ZpvlsbM8KtjN4dPdqWYWHIjJl2vRV8Ii5WWTfkF
         trag==
X-Gm-Message-State: APjAAAWP0c6fByjD+cInX6L650AJaNoVuT6WtT4ElBPKwoe59tc7mtYm
        ZM6MH8KkL817N2xU/UXGvBR3jQ==
X-Google-Smtp-Source: APXvYqwCRnZUydx1xxyOAIBs26zb8aTMIoGVsErSpJUIql/6cfDBP9xZ/3XnLh11Kt0M950WObQehQ==
X-Received: by 2002:adf:fc08:: with SMTP id i8mr16738404wrr.82.1579510494964;
        Mon, 20 Jan 2020 00:54:54 -0800 (PST)
Received: from dell ([2.27.35.227])
        by smtp.gmail.com with ESMTPSA id m10sm47135255wrx.19.2020.01.20.00.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2020 00:54:54 -0800 (PST)
Date:   Mon, 20 Jan 2020 08:55:10 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     mazziesaccount@gmail.com,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH v11 06/13] mfd: input: bd71828: Add power-key support
Message-ID: <20200120085510.GB15507@dell>
References: <cover.1579501711.git.matti.vaittinen@fi.rohmeurope.com>
 <aa965067acfbdaa862f5f5de8b66e2c161f276a0.1579501711.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aa965067acfbdaa862f5f5de8b66e2c161f276a0.1579501711.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 20 Jan 2020, Matti Vaittinen wrote:

> Use gpio_keys to send power input-event to user-space when power
> button (short) press is detected.
> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
> ---
> No changes since v10
> 
>  drivers/mfd/rohm-bd71828.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)

Drop the "input:" tag from the subject line please.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
