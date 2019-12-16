Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D803120FD1
	for <lists+linux-doc@lfdr.de>; Mon, 16 Dec 2019 17:43:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726191AbfLPQlX (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 16 Dec 2019 11:41:23 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:42477 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726181AbfLPQlX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 16 Dec 2019 11:41:23 -0500
Received: by mail-wr1-f67.google.com with SMTP id q6so8069872wro.9
        for <linux-doc@vger.kernel.org>; Mon, 16 Dec 2019 08:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=Wad68DLaXUpd0xmHmGc4hyH7aNMrYmcFPI6lvzyrzXQ=;
        b=ZUl2wU8huzRepFCJe7yB6pF057RW3caVmmRvTKRDOdPECwbEIB0WefXqVHnVyANG51
         g5T22LDlh2yQLNAv708JsGohtDmViR8MgHBxQn/6No0xuswgQ4YrVXCmjytjX67eleE/
         Rp5jkygE9YLzltRq1VkqZtxx5kK4h//PSSw742m0L7HWFdlUHnuEIRaEcjkJ4raUcfEf
         HmrOkebAcd8HbWC4sFmTPedNt2WDm1JwiFfKxlJaij8xugE1B7IIRHaL6KnfDFYpeBgL
         qERcKs/N55IXPtvl60tG6bSo+GEcxPhvEHpnvh0EEp7lhMx+dCHIkAkrvVV+IB7cNeB+
         nl8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=Wad68DLaXUpd0xmHmGc4hyH7aNMrYmcFPI6lvzyrzXQ=;
        b=l9IAS0wHkG6Y7HhOC2N3N51sum/o+OvuA/O3lJ674grA5OxetO9Ei7CJX+EuMPc/3W
         kh5qJ+wuFStdHV1OjtSHjLNcvnOuZ7rZ0KyxU2xgwFQxws+yL53qN7qygUHXL0CubExE
         7ar4Q24MA9wEe6jlB9ruGe/2awahg+oEM5d1HGUp8vPVvuKatGKJz8jdpyTIiQz5/aEP
         aKIYBpstzfdiIRyxNMgaLlDPSAlzbHn1bBojYcqAMIfw8sCXC0vzPsIf87lLQ+JteWsf
         zPcRb+3ecy4S+4PphzlTNL3bzqFq6IyEfTHlep2pZIgdZaCxl1ZUt15sYFJXLQrQtBKQ
         4YdA==
X-Gm-Message-State: APjAAAWcrXmbXU5lORyJ/V2joEnrYTGiCz+sneL0YyqwFQmZCEmb/Rnx
        QgXRIYTpLhZ9pvcf0lZ24eDu6g==
X-Google-Smtp-Source: APXvYqwzL/lxHeATvNiqlDcJrYl6wzPRCIG9ji/dIYZtc3SBOtEVGWzMvLG64qHY14Tril+j6sQMqA==
X-Received: by 2002:adf:f1c6:: with SMTP id z6mr15126699wro.279.1576514481576;
        Mon, 16 Dec 2019 08:41:21 -0800 (PST)
Received: from dell ([185.17.149.202])
        by smtp.gmail.com with ESMTPSA id z3sm22137942wrs.94.2019.12.16.08.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2019 08:41:20 -0800 (PST)
Date:   Mon, 16 Dec 2019 16:41:20 +0000
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
Subject: Re: [PATCH v6 04/15] mfd: rohm PMICs - use platform_device_id to
 match MFD sub-devices
Message-ID: <20191216164120.GB18955@dell>
References: <cover.1576054779.git.matti.vaittinen@fi.rohmeurope.com>
 <e5998dff02b4e155059f38614191daf32a778a0a.1576054779.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e5998dff02b4e155059f38614191daf32a778a0a.1576054779.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 11 Dec 2019, Matti Vaittinen wrote:

> Thanks to Stephen Boyd I today learned we can use platform_device_id
> to do device and module matching for MFD sub-devices!
> 
> Do device matching using the platform_device_id instead of using
> explicit module_aliases to load modules and custom parent-data field
> to do module loading and sub-device matching.
> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> ---
> 
> No changes since v5
> 
>  drivers/clk/clk-bd718x7.c             | 12 ++++++++-
>  drivers/regulator/bd718x7-regulator.c | 17 +++++++++---

>  drivers/mfd/rohm-bd70528.c            |  3 +--
>  drivers/mfd/rohm-bd718x7.c            | 39 ++++++++++++++++++++++-----
>  include/linux/mfd/rohm-generic.h      |  3 +--

For my own reference:
  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
