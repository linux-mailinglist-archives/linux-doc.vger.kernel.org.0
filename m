Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6AAF325F19
	for <lists+linux-doc@lfdr.de>; Fri, 26 Feb 2021 09:33:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230144AbhBZIcI (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 26 Feb 2021 03:32:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230128AbhBZIcA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 26 Feb 2021 03:32:00 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 882DBC061786
        for <linux-doc@vger.kernel.org>; Fri, 26 Feb 2021 00:31:19 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id u11so855500wmq.5
        for <linux-doc@vger.kernel.org>; Fri, 26 Feb 2021 00:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=6d55hczQ7yC4fvKZlIJyccsSIieP5h08F8ol4aHjDSk=;
        b=veP2th8n5/TCGhbAfadppIk6moovuPbnwz7txyIrcjYmTIlvQzaCm4g5KjCoHrQXKH
         NUBVtOlP1i059ojGBq/mkxtq6yEH6qB76l8PmIzWjMTrEJzVCQCEed/BbLN9ioQSJb4P
         u6bijGkY8Iq6GlEY3eqFpWBSyq0rT/htytRoRZKhg8VuaBg3vJgIoHT8yKnbNe3D27fi
         lwX/YIPHXcEd9aqCqW+e38UGEfPetvDMUVvvUfkDAlBbCchQEnljAgP+1IT3ovHNsbfh
         hh0KEGn6ex6Fbwa/8tyvYqS3uQ45Oi9EzBiLGP15g2st4h338LSrA1M4aJCmZYEzWocj
         IwhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=6d55hczQ7yC4fvKZlIJyccsSIieP5h08F8ol4aHjDSk=;
        b=Nqt2xvnVkaT7SA4UIlIvIQrgl0GAetxBJXcW50XwzVFm6Wa9TutXTDO90P7xWxFUAw
         clbkKX9mR6inEWH591YwJHewYOYuiDCNryOgH72QFmIxnCXZLaOa032GWGIzhfKYIPlg
         tXWxHX7pRL0ZD2hblgv9HVv66bdnmdppj8PDhs47NpWpnZhkFbRD84qlS9gvI/j5WX9h
         gCiGx6X0D/CuGa4JArmxwj914pXndOOH+WzR6mArGHuwGnUSgl15SVmXD7lPhj/xXT5+
         fA9SP2rSIcOCy5ttg3tqekFSqKLd6nmo0T9t3H1MB6XnUj2qwfQeiW6zVW9PishtK6QQ
         vauw==
X-Gm-Message-State: AOAM532Br49G3YpagUtwDK2oepAVAQ1ThfBUG+G5EDnPoRkQ3cIsiFQ1
        nODATgBQLpa6W/53LyuU/c4Pmw==
X-Google-Smtp-Source: ABdhPJyNNPBJL8zVQ1bzYzDTc8Boiu+FQOindWJ9jhjeB/7vXL8rqC5WnS5NurawlXFFVEQ8EzTLXw==
X-Received: by 2002:a05:600c:4c17:: with SMTP id d23mr1638944wmp.116.1614328276858;
        Fri, 26 Feb 2021 00:31:16 -0800 (PST)
Received: from dell ([91.110.221.155])
        by smtp.gmail.com with ESMTPSA id w13sm13617941wre.2.2021.02.26.00.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 00:31:16 -0800 (PST)
Date:   Fri, 26 Feb 2021 08:31:14 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Quan Nguyen <quan@os.amperecomputing.com>
Cc:     Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        openbmc@lists.ozlabs.org,
        Open Source Submission <patches@amperecomputing.com>,
        Phong Vo <phong@os.amperecomputing.com>,
        "Thang Q . Nguyen" <thang@os.amperecomputing.com>
Subject: Re: [PATCH 2/4] mfd: simple-mfd-i2c: Adds Ampere's Altra SMpro
 support
Message-ID: <20210226083114.GE641347@dell>
References: <20210225101854.13896-1-quan@os.amperecomputing.com>
 <20210225101854.13896-3-quan@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210225101854.13896-3-quan@os.amperecomputing.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 25 Feb 2021, Quan Nguyen wrote:

> Adds an MFD driver for SMpro found on the Mt.Jade hardware reference
> platform with Ampere's Altra processor family.
> 
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> ---
>  drivers/mfd/Kconfig          | 10 ++++++++++
>  drivers/mfd/simple-mfd-i2c.c | 15 +++++++++++++--
>  2 files changed, 23 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index b74efa469e90..5414371bdea1 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -77,6 +77,16 @@ config MFD_AS3711
>  	help
>  	  Support for the AS3711 PMIC from AMS
>  
> +config MFD_SMPRO
> +	tristate "Ampere Computing MFD SMpro core driver"
> +	select MFD_SIMPLE_MFD_I2C

Nice to see another user here.

> +	help
> +	  Say yes here to enable SMpro driver support for Ampere's Altra
> +	  processor family.
> +
> +	  Ampere's Altra SMpro exposes an I2C regmap interface that can
> +	  be accessed by child devices.
> +
>  config MFD_AS3722
>  	tristate "ams AS3722 Power Management IC"
>  	select MFD_CORE
> diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
> index 87f684cff9a1..0459a9fbd3f5 100644
> --- a/drivers/mfd/simple-mfd-i2c.c
> +++ b/drivers/mfd/simple-mfd-i2c.c
> @@ -21,14 +21,24 @@ static const struct regmap_config simple_regmap_config = {
>  	.val_bits = 8,
>  };
>  
> +static const struct regmap_config simple_word_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 16,
> +};
> +
>  static int simple_mfd_i2c_probe(struct i2c_client *i2c)
>  {
>  	const struct regmap_config *config;
>  	struct regmap *regmap;
>  
>  	config = device_get_match_data(&i2c->dev);
> -	if (!config)
> -		config = &simple_regmap_config;
> +	if (!config) {
> +		if (of_device_is_compatible(i2c->dev.of_node,
> +						"ampere,ac01-smpro"))

Could you use 'struct of_device_id's .data attribute instead please?

> +			config = &simple_word_regmap_config;
> +		else
> +			config = &simple_regmap_config;
> +	}
>  
>  	regmap = devm_regmap_init_i2c(i2c, config);
>  	if (IS_ERR(regmap))
> @@ -39,6 +49,7 @@ static int simple_mfd_i2c_probe(struct i2c_client *i2c)
>  
>  static const struct of_device_id simple_mfd_i2c_of_match[] = {
>  	{ .compatible = "kontron,sl28cpld" },
> +	{ .compatible = "ampere,ac01-smpro" },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, simple_mfd_i2c_of_match);

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
