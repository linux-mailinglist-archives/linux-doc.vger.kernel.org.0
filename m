Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95869121001
	for <lists+linux-doc@lfdr.de>; Mon, 16 Dec 2019 17:49:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726700AbfLPQra (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 16 Dec 2019 11:47:30 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:35368 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726545AbfLPQra (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 16 Dec 2019 11:47:30 -0500
Received: by mail-wm1-f65.google.com with SMTP id p17so26651wmb.0
        for <linux-doc@vger.kernel.org>; Mon, 16 Dec 2019 08:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=Hk4aENi5JfntNywk6okXwxduwNUObctMo6Ti9zshqoY=;
        b=MupdptuUoWe4nG6XWXO8Am4U5S+54eAzf2A0C0d2Y/5L2NO1Pz8TTYTYp5Oj5iY/hm
         93t/S9vt5md+700bRha+NTqKBl6oALW4Cyyoy6nn+4F5ibH3bCyki7R/JsAZ4NHflnE+
         ylV5xuhgvWwd1TxuaFKOb/aFAARfMBD2SMozH1sxIsh3v61V0bAF0jCcttX+d+5MsQ8a
         N7X0BKMbj5GiVmGpbnjoYcA5U6nauymoWAe/L8NRaOKwVvAw6MyZaLOAepZg7xnyZ+Wh
         oZqdlXigYNHIy+jwcnTQ+KhoxTXXftAxwM7ur1lCbGU4eP+IxWxLxRdYTCK5wujQtV8H
         6qig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=Hk4aENi5JfntNywk6okXwxduwNUObctMo6Ti9zshqoY=;
        b=SlrFJRez0L2v4yq4O+dstl8rDSsPOVWXM3UeHYgDe3W1wehnNJ6Sxw34EdTZigHHny
         +avEaRj/o+/BN4bpVsoi3UnKFa5nmd4qlNw63BRMqZHQbqY9nPSjw8C82MEzOZ8LyNMe
         pF/EskyWzdt0qqWNjJj+Lprzi6lbIplfYCMW++HTMhm5S+dITa9EJW7qhGRzDQ4eWXPc
         4rnUVDuoBn3IsuusIX3/0OkzIf5f03Ua4YMrwtafAWOzYP9kwrgJQHShWUgtZbOlZazf
         m0YYFYwmpCmKUP2McmZtlCTWNPcF1FkwwLyPXMPoQtKWNC8tmegkarbZn9MM33apjMqm
         yQRg==
X-Gm-Message-State: APjAAAX6Jlei6Tv+EW1waZahyCjtPyz8EghSQwqJcEmtov6ApaIBjKZi
        CerlpUUFXk1wvSB3RTqSgmtwXQ==
X-Google-Smtp-Source: APXvYqyNpItBQC+K60hdbMXgCjsSVi+l3bidixDPaRGU5wZG3XvKQQsnCfJdpNCLx9rGhg7CBCc8sw==
X-Received: by 2002:a05:600c:108a:: with SMTP id e10mr30010613wmd.38.1576514848119;
        Mon, 16 Dec 2019 08:47:28 -0800 (PST)
Received: from dell ([185.17.149.202])
        by smtp.gmail.com with ESMTPSA id p5sm21821060wrt.79.2019.12.16.08.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2019 08:47:27 -0800 (PST)
Date:   Mon, 16 Dec 2019 16:47:26 +0000
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
Subject: Re: [PATCH v6 07/15] clk: bd718x7: Support ROHM BD71828 clk block
Message-ID: <20191216164726.GD18955@dell>
References: <cover.1576054779.git.matti.vaittinen@fi.rohmeurope.com>
 <b88c451a1bece5a22936e9a021146f3e026f8885.1576054779.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b88c451a1bece5a22936e9a021146f3e026f8885.1576054779.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 11 Dec 2019, Matti Vaittinen wrote:

> BD71828GW is a single-chip power management IC for battery-powered portable
> devices. Add support for controlling BD71828 clk using bd718x7 driver.
> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> ---
> 
> No changes since v5
> 
>  drivers/clk/Kconfig              |  6 ++---
>  drivers/clk/clk-bd718x7.c        | 38 +++++++++++++++++++++++---------

>  include/linux/mfd/rohm-bd70528.h |  6 -----
>  include/linux/mfd/rohm-bd71828.h |  4 ----
>  include/linux/mfd/rohm-bd718x7.h |  6 -----

For my own reference:
  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
