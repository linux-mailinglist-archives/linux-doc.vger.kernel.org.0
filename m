Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F5753B65F8
	for <lists+linux-doc@lfdr.de>; Mon, 28 Jun 2021 17:44:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237604AbhF1Pqb (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 28 Jun 2021 11:46:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237469AbhF1Pp6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 Jun 2021 11:45:58 -0400
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com [IPv6:2607:f8b0:4864:20::c2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F356C08E6D4;
        Mon, 28 Jun 2021 08:08:06 -0700 (PDT)
Received: by mail-oo1-xc2c.google.com with SMTP id k1-20020a0568200161b029024bef8a628bso4823798ood.7;
        Mon, 28 Jun 2021 08:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=AI9tdVAS1a3ZFWWLw4BWgGI37S7QwTybdrtF1J8sERQ=;
        b=TMFTOGbyUYJ3MP9nyyAjtEyfSr7Xea4MazFQPyoKv6vnrFOCE6wICFk5QGJH+DFOXi
         T0hErWqMpcIiyqdmhD3kP9s7Zqmi9tZqRs6QH8lgDwRrckGDJExaNyPs73nJeSYQTC00
         gOI3yi/f6N+TeR8aDIURROBNFCh2KEzh5qgxSHogzHnf0bGF1LliqQYt47Nl012p381/
         a+Tzl9Xvtqu5PHQ70UJ/wN3y1gT7kypFGHmgcAfWDib/xmXazuQSzzrikvSjLqxSTduu
         RQKJEiqYj5yb63kct0xI0cxIqQF0OmaxO0BV/2RHUZ8uudLFxOBKQEgSAZI50keO0zpG
         0t+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=AI9tdVAS1a3ZFWWLw4BWgGI37S7QwTybdrtF1J8sERQ=;
        b=Pm2xu9EVyXRQuvjasdUDTcRLX7mXZjrcib1xV2pGiS3arRsMMfYfNL5lj/Q6SvtkrK
         QU3qmSkWNW9SYReVVqmm413tMIZAyk/HKtz/p85CzH2PdzQrEzslJ553u0T+SqdPrNOe
         CEtxgl/xP6ouv+8fNc3nKMwughN1/ACBh8FhSghAmTppeGenk4ZvbfQhM62yMZxglaKD
         GkUelQCcIyuGYcEWgvRhwLKhcuB9EflZnytUgjpa8//c+NduqwG9vTq2XlN/llf6NLaB
         O+zq8mEn1yIA8u7ZyGUUbMfpUmVSri/Mu6hGcDQ5SItSUMmTwhhZBlNOUqAUjm+8p+hu
         Uvyg==
X-Gm-Message-State: AOAM533mYPw8mDTdyMq3Fn0Ax1yellDen9JfNCFpBpnJ+sbXDEKHJN2r
        OIs4FkPqMxcNr/f+cFSwS84rgimlMXo=
X-Google-Smtp-Source: ABdhPJzb0LzG5m3MAsY8/lLhAQ+T/BcdngQWf2Nmr8Q0RaGIE6xH8hmwtKoEGTTT4Y8ob4HhOuwvhQ==
X-Received: by 2002:a4a:97ab:: with SMTP id w40mr19601423ooi.19.1624892885406;
        Mon, 28 Jun 2021 08:08:05 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w12sm3010874oor.35.2021.06.28.08.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jun 2021 08:08:04 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 28 Jun 2021 08:08:03 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Emil Renner Berthing <esmil@mailme.dk>
Cc:     Jean Delvare <jdelvare@suse.com>, Rob Herring <robh+dt@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Samin Guo <samin.guo@starfivetech.com>,
        Emil Renner Berthing <kernel@esmil.dk>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] hwmon: (sfctemp) Add StarFive JH7100 temperature
 sensor
Message-ID: <20210628150803.GA441036@roeck-us.net>
References: <20210624162108.832518-1-esmil@mailme.dk>
 <20210624162108.832518-3-esmil@mailme.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210624162108.832518-3-esmil@mailme.dk>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jun 24, 2021 at 06:21:08PM +0200, Emil Renner Berthing wrote:
> From: Emil Renner Berthing <kernel@esmil.dk>
> 
> Register definitions and conversion constants based on sfctemp driver by
> Samin in the StarFive 5.10 kernel.
> 
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Signed-off-by: Samin Guo <samin.guo@starfivetech.com>
> ---
>  Documentation/hwmon/index.rst   |   1 +
>  Documentation/hwmon/sfctemp.rst |  32 ++++
>  MAINTAINERS                     |   8 +
>  drivers/hwmon/Kconfig           |  10 ++
>  drivers/hwmon/Makefile          |   1 +
>  drivers/hwmon/sfctemp.c         | 288 ++++++++++++++++++++++++++++++++
>  6 files changed, 340 insertions(+)
>  create mode 100644 Documentation/hwmon/sfctemp.rst
>  create mode 100644 drivers/hwmon/sfctemp.c
> 
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index 9ed60fa84cbe..f23308e97d2e 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -161,6 +161,7 @@ Hardware Monitoring Kernel Drivers
>     sch5627
>     sch5636
>     scpi-hwmon
> +   sfctemp
>     sht15
>     sht21
>     sht3x
> diff --git a/Documentation/hwmon/sfctemp.rst b/Documentation/hwmon/sfctemp.rst
> new file mode 100644
> index 000000000000..465edce2fea5
> --- /dev/null
> +++ b/Documentation/hwmon/sfctemp.rst
> @@ -0,0 +1,32 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +Kernel driver sfctemp
> +=====================
> +
> +Supported chips:
> + - StarFive JH7100
> +
> +Authors:
> + - Emil Renner Berthing <kernel@esmil.dk>
> +
> +Description
> +-----------
> +
> +This driver adds support for reading the built-in temperature sensor on the
> +JH7100 RISC-V SoC by StarFive Technology Co. Ltd.
> +
> +``sysfs`` interface
> +-------------------
> +
> +The temperature sensor can be enabled, disabled and queried via the standard
> +hwmon interface in sysfs under ``/sys/class/hwmon/hwmonX`` for some value of
> +``X``:
> +
> +================ ==== =============================================
> +Name             Perm Description
> +================ ==== =============================================
> +temp1_enable     RW   Enable or disable temperature sensor.
> +                      Automatically enabled by the driver,
> +                      but may be disabled to save power.
> +temp1_input      RO   Temperature reading in milli-degrees Celsius.
> +================ ==== =============================================
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8c5ee008301a..a7d25a672270 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16535,6 +16535,14 @@ L:	netdev@vger.kernel.org
>  S:	Supported
>  F:	drivers/net/ethernet/sfc/
>  
> +SFCTEMP HWMON DRIVER
> +M:	Emil Renner Berthing <kernel@esmil.dk>
> +L:	linux-hwmon@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/hwmon/starfive,jh7100-temp.yaml
> +F:	Documentation/hwmon/sfctemp.rst
> +F:	drivers/hwmon/sfctemp.c
> +
>  SFF/SFP/SFP+ MODULE SUPPORT
>  M:	Russell King <linux@armlinux.org.uk>
>  L:	netdev@vger.kernel.org
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 87624902ea80..7da8fd8beb06 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1751,6 +1751,16 @@ config SENSORS_STTS751
>  	  This driver can also be built as a module. If so, the module
>  	  will be called stts751.
>  
> +config SENSORS_SFCTEMP
> +	tristate "Starfive JH7100 temperature sensor"
> +	depends on OF && (RISCV || COMPILE_TEST)
> +	help
> +	  If you say yes here you get support for temperature sensor
> +	  on the Starfive JH7100 SoC.
> +
> +	  This driver can also be built as a module.  If so, the module
> +	  will be called sfctemp.
> +
>  config SENSORS_SMM665
>  	tristate "Summit Microelectronics SMM665"
>  	depends on I2C
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index 59e78bc212cf..3723eb580bf3 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -167,6 +167,7 @@ obj-$(CONFIG_SENSORS_SBTSI)	+= sbtsi_temp.o
>  obj-$(CONFIG_SENSORS_SCH56XX_COMMON)+= sch56xx-common.o
>  obj-$(CONFIG_SENSORS_SCH5627)	+= sch5627.o
>  obj-$(CONFIG_SENSORS_SCH5636)	+= sch5636.o
> +obj-$(CONFIG_SENSORS_SFCTEMP)	+= sfctemp.o
>  obj-$(CONFIG_SENSORS_SL28CPLD)	+= sl28cpld-hwmon.o
>  obj-$(CONFIG_SENSORS_SHT15)	+= sht15.o
>  obj-$(CONFIG_SENSORS_SHT21)	+= sht21.o
> diff --git a/drivers/hwmon/sfctemp.c b/drivers/hwmon/sfctemp.c
> new file mode 100644
> index 000000000000..4328aacf9272
> --- /dev/null
> +++ b/drivers/hwmon/sfctemp.c
> @@ -0,0 +1,288 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2021 Emil Renner Berthing <kernel@esmil.dk>
> + * Copyright (C) 2021 Samin Guo <samin.guo@starfivetech.com>
> + */
> +#include <linux/completion.h>
> +#include <linux/delay.h>
> +#include <linux/hwmon.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +
> +/*
> + * TempSensor reset. The RSTN can be de-asserted once the analog core has
> + * powered up. Trst(min 100ns)
> + * 0:reset  1:de-assert
> + */
> +#define SFCTEMP_RSTN	BIT(0)
> +
> +/*
> + * TempSensor analog core power down. The analog core will be powered up
> + * Tpu(min 50us) after PD is de-asserted. RSTN should be held low until the
> + * analog core is powered up.
> + * 0:power up  1:power down
> + */
> +#define SFCTEMP_PD	BIT(1)
> +
> +/*
> + * TempSensor start conversion enable.
> + * 0:disable  1:enable
> + */
> +#define SFCTEMP_RUN	BIT(2)
> +
> +/*
> + * TempSensor conversion value output.
> + * Temp(C)=DOUT*Y/4094 - K
> + */
> +#define SFCTEMP_DOUT_POS	16
> +#define SFCTEMP_DOUT_MSK	GENMASK(27, 16)
> +
> +/* DOUT to Celcius conversion constants */
> +#define SFCTEMP_Y1000	237500L
> +#define SFCTEMP_Z	4094L
> +#define SFCTEMP_K1000	81100L
> +
> +struct sfctemp {
> +	/* serialize access to hardware register and enabled below */
> +	struct mutex lock;
> +	struct completion conversion_done;
> +	void __iomem *regs;
> +	bool enabled;
> +};
> +
> +static irqreturn_t sfctemp_isr(int irq, void *data)
> +{
> +	struct sfctemp *sfctemp = data;
> +
> +	complete(&sfctemp->conversion_done);
> +	return IRQ_HANDLED;
> +}
> +
> +static void sfctemp_power_up(struct sfctemp *sfctemp)
> +{
> +	/* make sure we're powered down first */
> +	writel(SFCTEMP_PD, sfctemp->regs);
> +	udelay(1);
> +
> +	writel(0, sfctemp->regs);
> +	/* wait t_pu(50us) + t_rst(100ns) */
> +	usleep_range(60, 200);
> +
> +	/* de-assert reset */
> +	writel(SFCTEMP_RSTN, sfctemp->regs);
> +	udelay(1); /* wait t_su(500ps) */
> +}
> +
> +static void sfctemp_power_down(struct sfctemp *sfctemp)
> +{
> +	writel(SFCTEMP_PD, sfctemp->regs);
> +}
> +
> +static void sfctemp_run_single(struct sfctemp *sfctemp)
> +{
> +	writel(SFCTEMP_RSTN | SFCTEMP_RUN, sfctemp->regs);
> +	udelay(1);
> +	writel(SFCTEMP_RSTN, sfctemp->regs);
> +}
> +
> +static int sfctemp_enable(struct sfctemp *sfctemp)
> +{
> +	mutex_lock(&sfctemp->lock);
> +	if (sfctemp->enabled)
> +		goto done;
> +
> +	sfctemp_power_up(sfctemp);
> +	sfctemp->enabled = true;
> +done:
> +	mutex_unlock(&sfctemp->lock);
> +	return 0;
> +}
> +
> +static int sfctemp_disable(struct sfctemp *sfctemp)
> +{
> +	mutex_lock(&sfctemp->lock);
> +	if (!sfctemp->enabled)
> +		goto done;
> +
> +	sfctemp_power_down(sfctemp);
> +	sfctemp->enabled = false;
> +done:
> +	mutex_unlock(&sfctemp->lock);
> +	return 0;
> +}
> +
> +static void sfctemp_disable_action(void *data)
> +{
> +	sfctemp_disable(data);
> +}
> +
> +static int sfctemp_convert(struct sfctemp *sfctemp, long *val)
> +{
> +	int ret;
> +
> +	mutex_lock(&sfctemp->lock);
> +	if (!sfctemp->enabled) {
> +		ret = -ENODATA;
> +		goto out;
> +	}
> +
> +	sfctemp_run_single(sfctemp);
> +
> +	ret = wait_for_completion_interruptible_timeout(&sfctemp->conversion_done,
> +							msecs_to_jiffies(10));
> +	if (ret < 0)
> +		goto out;

Does this need to handle timeouts ?

	if (ret == 0)
		return -ETIMEDOUT;
> +
> +	/* calculate temperature in milli Celcius */
> +	*val = (long)((readl(sfctemp->regs) & SFCTEMP_DOUT_MSK) >> SFCTEMP_DOUT_POS)
> +		* SFCTEMP_Y1000 / SFCTEMP_Z - SFCTEMP_K1000;
> +
> +	ret = 0;
> +out:
> +	mutex_unlock(&sfctemp->lock);
> +	return ret;
> +}
> +
> +static umode_t sfctemp_is_visible(const void *data, enum hwmon_sensor_types type,
> +				  u32 attr, int channel)
> +{
> +	switch (type) {
> +	case hwmon_temp:
> +		switch (attr) {
> +		case hwmon_temp_enable:
> +			return 0644;
> +		case hwmon_temp_input:
> +			return 0444;
> +		}
> +		return 0;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static int sfctemp_read(struct device *dev, enum hwmon_sensor_types type,
> +			u32 attr, int channel, long *val)
> +{
> +	struct sfctemp *sfctemp = dev_get_drvdata(dev);
> +
> +	switch (type) {
> +	case hwmon_temp:
> +		switch (attr) {
> +		case hwmon_temp_enable:
> +			*val = sfctemp->enabled;
> +			return 0;
> +		case hwmon_temp_input:
> +			return sfctemp_convert(sfctemp, val);
> +		}
> +		return -EINVAL;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static int sfctemp_write(struct device *dev, enum hwmon_sensor_types type,
> +			 u32 attr, int channel, long val)
> +{
> +	struct sfctemp *sfctemp = dev_get_drvdata(dev);
> +
> +	switch (type) {
> +	case hwmon_temp:
> +		switch (attr) {
> +		case hwmon_temp_enable:
> +			if (val == 0)
> +				return sfctemp_disable(sfctemp);
> +			if (val == 1)
> +				return sfctemp_enable(sfctemp);
> +			break;
> +		}
> +		return -EINVAL;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static const struct hwmon_channel_info *sfctemp_info[] = {
> +	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
> +	HWMON_CHANNEL_INFO(temp, HWMON_T_ENABLE | HWMON_T_INPUT),
> +	NULL
> +};
> +
> +static const struct hwmon_ops sfctemp_hwmon_ops = {
> +	.is_visible = sfctemp_is_visible,
> +	.read = sfctemp_read,
> +	.write = sfctemp_write,
> +};
> +
> +static const struct hwmon_chip_info sfctemp_chip_info = {
> +	.ops = &sfctemp_hwmon_ops,
> +	.info = sfctemp_info,
> +};
> +
> +static int sfctemp_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device *hwmon_dev;
> +	struct resource *mem;
> +	struct sfctemp *sfctemp;
> +	int ret;
> +
> +	sfctemp = devm_kzalloc(dev, sizeof(*sfctemp), GFP_KERNEL);
> +	if (!sfctemp)
> +		return -ENOMEM;
> +
> +	dev_set_drvdata(dev, sfctemp);
> +	mutex_init(&sfctemp->lock);
> +	init_completion(&sfctemp->conversion_done);
> +
> +	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	sfctemp->regs = devm_ioremap_resource(dev, mem);
> +	if (IS_ERR(sfctemp->regs))
> +		return PTR_ERR(sfctemp->regs);
> +
> +	ret = platform_get_irq(pdev, 0);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = devm_request_irq(dev, ret, sfctemp_isr,
> +			       IRQF_SHARED, pdev->name, sfctemp);
> +	if (ret) {
> +		dev_err(dev, "request irq failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = devm_add_action(dev, sfctemp_disable_action, sfctemp);
> +	if (ret)
> +		return ret;
> +
> +	ret = sfctemp_enable(sfctemp);
> +	if (ret)
> +		return ret;
> +
> +	hwmon_dev = devm_hwmon_device_register_with_info(dev, pdev->name, sfctemp,
> +							 &sfctemp_chip_info, NULL);
> +	return PTR_ERR_OR_ZERO(hwmon_dev);
> +}
> +
> +static const struct of_device_id sfctemp_of_match[] = {
> +	{ .compatible = "starfive,jh7100-temp" },
> +	{ /* sentinel */ }
> +};
> +
> +MODULE_DEVICE_TABLE(of, sfctemp_of_match);
> +
> +static struct platform_driver sfctemp_driver = {
> +	.driver = {
> +		.name = "sfctemp",
> +		.of_match_table = of_match_ptr(sfctemp_of_match),
> +	},
> +	.probe  = sfctemp_probe,
> +};
> +module_platform_driver(sfctemp_driver);
> +
> +MODULE_AUTHOR("Emil Renner Berthing");
> +MODULE_DESCRIPTION("StarFive JH7100 temperature sensor driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.32.0
> 
