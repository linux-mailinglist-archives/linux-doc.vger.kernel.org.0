Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2BA0394361
	for <lists+linux-doc@lfdr.de>; Fri, 28 May 2021 15:28:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235412AbhE1N3r (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 28 May 2021 09:29:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229653AbhE1N3q (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 28 May 2021 09:29:46 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BC7CC061574;
        Fri, 28 May 2021 06:28:06 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id n3-20020a9d74030000b029035e65d0a0b8so3429735otk.9;
        Fri, 28 May 2021 06:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=VEJJAqLc8tdz6U0snpDUF0TlDmD4azqtjq9FRx+8Gvc=;
        b=K5BMGyF0Aar7xJpLxBsIqrG2jL9dH4mYj5nT+IaI4oqS+rlf2Rtehwf2GBZCXuVfRl
         GCUeLMyHxJA6v6+oWrHw19IldgaYmr3H+CFkaUnw45NhPKCqiyS/e2Xdf6VHPNcqFW3k
         LVcVmpwfTKmOgQQ+Tw/yf1CaJMJj6wlCwLsLMQvpeRKKafsiyGeki+0CGyCfwHXSo9Tt
         HFQcGsBIhcj/L7NX5i91U91sz2iZqrupQroKORCraeZ60hTu+tkI1olk3Qloc6ECH207
         X+wQ/qV1GaPLBssHaqC+PMT8igQ3q2vuKguxpXTAPhvlWErgY101XtqRnC8BpE3HxQW8
         BFjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=VEJJAqLc8tdz6U0snpDUF0TlDmD4azqtjq9FRx+8Gvc=;
        b=gtl3QGneEYkLwmhQK5GpK6ikcglMVXlfCH1uMMoJqad7B1iQ0HyEIVlktn3g40RijN
         RPyAZugZE6pNLEnq5PQfCjN3czhnO1vuhWB3TUvrK5md0kIU8+gP4zAflipqmI8yBBM1
         PUv1frOEl9opXK1zNx3ZwYyDBsr/A/h42fpg2IenEzZY2yhlx6zV7O74xiXf0EkGfLuH
         WuYUuiVEm5SO6QlgvULADNzXsLxw5/HToJPL69hq4q3LpuVeIcHnoyepcZ0Xry1GOxOl
         dJ2vtD2EGfPDLwKcCQH566oc/H5utJxNrwZtTr0ndZbwgbyjV1+e7UIpAhfMGD6bf4S1
         4E6w==
X-Gm-Message-State: AOAM531NphPxiRxXg+FzbwEUPWguf99utGXRBGy0MAPfzoudy89OCEkN
        CDza6rPY9tyVKl7H4ulYynk=
X-Google-Smtp-Source: ABdhPJwCjOcvlDsIc9eoGvSE3gRxAgs8FkDgLAC83KWbZ6SZcl7VhOS7KF6uKl96sl+HNZOPILy4Qw==
X-Received: by 2002:a05:6830:1e70:: with SMTP id m16mr6975269otr.340.1622208485627;
        Fri, 28 May 2021 06:28:05 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x31sm1134319ota.24.2021.05.28.06.28.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 May 2021 06:28:05 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
To:     Robert Marko <robert.marko@sartura.hr>, robh+dt@kernel.org,
        jdelvare@suse.com, corbet@lwn.net, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        trivial@kernel.org, Jonathan.Cameron@huawei.com,
        alexandre.belloni@bootlin.com, sst@poczta.fm, krzk@kernel.org,
        alexandru.ardelean@analog.com, devicetree@vger.kernel.org
Cc:     luka.perkov@sartura.hr, jmp@epiphyte.org, pmenzel@molgen.mpg.de,
        buczek@molgen.mpg.de
References: <20210528103828.53320-1-robert.marko@sartura.hr>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2 1/3] hwmon: (pmbus) Add driver for Delta DPS-920AB PSU
Message-ID: <479725a2-7d85-1489-4228-ddff16b52287@roeck-us.net>
Date:   Fri, 28 May 2021 06:28:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210528103828.53320-1-robert.marko@sartura.hr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 5/28/21 3:38 AM, Robert Marko wrote:
> This adds support for the Delta DPS-920AB PSU.
> 
> Only missing feature is fan control which the PSU supports.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> ---
> Changes in v2:
> * Check for Manufacturer and Model
> * Restrict word read/write to supported only
> * Update documentation to reflect driver changes
> * Add basic debugfs entries
> 
>   Documentation/hwmon/dps920ab.rst |  73 ++++++++++
>   Documentation/hwmon/index.rst    |   1 +
>   drivers/hwmon/pmbus/Kconfig      |   9 ++
>   drivers/hwmon/pmbus/Makefile     |   1 +
>   drivers/hwmon/pmbus/dps920ab.c   | 229 +++++++++++++++++++++++++++++++
>   5 files changed, 313 insertions(+)
>   create mode 100644 Documentation/hwmon/dps920ab.rst
>   create mode 100644 drivers/hwmon/pmbus/dps920ab.c
> 
> diff --git a/Documentation/hwmon/dps920ab.rst b/Documentation/hwmon/dps920ab.rst
> new file mode 100644
> index 000000000000..c33b4cdc0a60
> --- /dev/null
> +++ b/Documentation/hwmon/dps920ab.rst
> @@ -0,0 +1,73 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +
> +Kernel driver dps920ab
> +========================
> +
> +Supported chips:
> +
> +  * Delta DPS920AB
> +
> +    Prefix: 'dps920ab'
> +
> +    Addresses scanned: -
> +
> +Authors:
> +    Robert Marko <robert.marko@sartura.hr>
> +
> +
> +Description
> +-----------
> +
> +This driver implements support for Delta DPS920AB 920W 54V DC single output
> +power supply with PMBus support.
> +
> +The driver is a client driver to the core PMBus driver.
> +Please see Documentation/hwmon/pmbus.rst for details on PMBus client drivers.
> +
> +
> +Usage Notes
> +-----------
> +
> +This driver does not auto-detect devices. You will have to instantiate the
> +devices explicitly. Please see Documentation/i2c/instantiating-devices.rst for
> +details.
> +
> +
> +Sysfs entries
> +-------------
> +
> +======================= ======================================================
> +curr1_label		"iin"
> +curr1_input		Measured input current
> +curr1_alarm		Input current high alarm
> +
> +curr2_label		"iout1"
> +curr2_input		Measured output current
> +curr2_max		Maximum output current
> +curr2_rated_max		Maximum rated output current
> +
> +in1_label		"vin"
> +in1_input		Measured input voltage
> +in1_alarm		Input voltage alarm
> +
> +in2_label		"vout1"
> +in2_input		Measured output voltage
> +in2_rated_min		Minimum rated output voltage
> +in2_rated_max		Maximum rated output voltage
> +in2_alarm		Output voltage alarm
> +
> +power1_label		"pin"
> +power1_input		Measured input power
> +power1_alarm		Input power high alarm
> +
> +power2_label		"pout1"
> +power2_input		Measured output power
> +power2_rated_max	Maximum rated output power
> +
> +temp[1-3]_input		Measured temperature
> +temp[1-3]_alarm		Temperature alarm
> +
> +fan1_alarm		Fan 1 warning.
> +fan1_fault		Fan 1 fault.
> +fan1_input		Fan 1 speed in RPM.
> +======================= ======================================================
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index 8d5a2df1ecb6..b24436f22052 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -54,6 +54,7 @@ Hardware Monitoring Kernel Drivers
>      dell-smm-hwmon
>      dme1737
>      drivetemp
> +   dps920ab
>      ds1621
>      ds620
>      emc1403
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index 32d2fc850621..865ade0aa205 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -66,6 +66,15 @@ config SENSORS_IBM_CFFPS
>   	  This driver can also be built as a module. If so, the module will
>   	  be called ibm-cffps.
>   
> +config SENSORS_DPS920AB
> +	tristate "Delta DPS920AB Power Supply"
> +	help
> +	  If you say yes here you get hardware monitoring support for Delta
> +	  DPS920AB Power Supplies.
> +
> +	  This driver can also be built as a module. If so, the module will
> +	  be called dps920ab.
> +
>   config SENSORS_INSPUR_IPSPS
>   	tristate "INSPUR Power System Power Supply"
>   	help
> diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
> index 6a4ba0fdc1db..f59ba0123d68 100644
> --- a/drivers/hwmon/pmbus/Makefile
> +++ b/drivers/hwmon/pmbus/Makefile
> @@ -9,6 +9,7 @@ obj-$(CONFIG_SENSORS_ADM1266)	+= adm1266.o
>   obj-$(CONFIG_SENSORS_ADM1275)	+= adm1275.o
>   obj-$(CONFIG_SENSORS_BEL_PFE)	+= bel-pfe.o
>   obj-$(CONFIG_SENSORS_IBM_CFFPS)	+= ibm-cffps.o
> +obj-$(CONFIG_SENSORS_DPS920AB)	+= dps920ab.o
>   obj-$(CONFIG_SENSORS_INSPUR_IPSPS) += inspur-ipsps.o
>   obj-$(CONFIG_SENSORS_IR35221)	+= ir35221.o
>   obj-$(CONFIG_SENSORS_IR38064)	+= ir38064.o
> diff --git a/drivers/hwmon/pmbus/dps920ab.c b/drivers/hwmon/pmbus/dps920ab.c
> new file mode 100644
> index 000000000000..de084a42dec3
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/dps920ab.c
> @@ -0,0 +1,229 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Driver for Delta DPS920AB PSU
> + *
> + * Copyright (C) 2021 Delta Networks, Inc.
> + * Copyright (C) 2021 Sartura Ltd.
> + */
> +
> +#include <linux/debugfs.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include "pmbus.h"
> +
> +struct dps920ab_data {
> +	struct i2c_client *client;
> +	struct dentry *debugfs_dir;
> +};
> +
> +static int dps920ab_read_word_data(struct i2c_client *client, int page, int phase, int reg)
> +{
> +	int ret;
> +
> +	/*
> +	 * This masks commands which are not supported.
> +	 * PSU advertises that all features are supported,
> +	 * in reality that unfortunately is not true.
> +	 * So enable only those that the datasheet confirms.
> +	 */
> +	switch (reg) {
> +	case PMBUS_FAN_COMMAND_1:
> +	case PMBUS_IOUT_OC_WARN_LIMIT:
> +	case PMBUS_STATUS_WORD:
> +	case PMBUS_READ_VIN:
> +	case PMBUS_READ_IIN:
> +	case PMBUS_READ_VOUT:
> +	case PMBUS_READ_IOUT:
> +	case PMBUS_READ_TEMPERATURE_1:
> +	case PMBUS_READ_TEMPERATURE_2:
> +	case PMBUS_READ_TEMPERATURE_3:
> +	case PMBUS_READ_FAN_SPEED_1:
> +	case PMBUS_READ_POUT:
> +	case PMBUS_READ_PIN:
> +	case PMBUS_MFR_VOUT_MIN:
> +	case PMBUS_MFR_VOUT_MAX:
> +	case PMBUS_MFR_IOUT_MAX:
> +	case PMBUS_MFR_POUT_MAX:
> +		break;
> +	default:
> +		return -ENXIO;
> +	}
> +
> +	ret = pmbus_set_page(client, page, phase);
> +	if (ret < 0)
> +		return ret;
> +
> +	return i2c_smbus_read_word_data(client, reg);

I find the code a bit confusing. I think it would be better to move the action code
into the case statement.

> +}
> +
> +static int dps920ab_write_word_data(struct i2c_client *client, int page, int reg,
> +				    u16 word)
> +{
> +	int ret;
> +
> +	/*
> +	 * This masks commands which are not supported.
> +	 * PSU only has one R/W register and that is
> +	 * for the fan.
> +	 */
> +	switch (reg) {
> +	case PMBUS_FAN_COMMAND_1:
> +		break;
> +	default:
> +		ret = -ENODATA;
> +	}
> +

Does this work ? It is the wrong error message for a failed write;
it should probably return -EACCES.

> +	ret = pmbus_set_page(client, page, 0xff);
> +	if (ret < 0)
> +		return ret;
> +
There is only one page, so what would this be for ?

> +	return i2c_smbus_write_word_data(client, reg, word);

Same as avove; I think it would be better to handle the
access code in the case statement.

> +}
> +
> +static struct pmbus_driver_info dps920ab_info = {
> +	.pages = 1,
> +
> +	.format[PSC_VOLTAGE_IN] = linear,
> +	.format[PSC_VOLTAGE_OUT] = linear,
> +	.format[PSC_CURRENT_IN] = linear,
> +	.format[PSC_CURRENT_OUT] = linear,
> +	.format[PSC_POWER] = linear,
> +	.format[PSC_FAN] = linear,
> +	.format[PSC_TEMPERATURE] = linear,
> +
> +	.func[0] =
> +		PMBUS_HAVE_VIN | PMBUS_HAVE_IIN | PMBUS_HAVE_PIN |
> +		PMBUS_HAVE_VOUT | PMBUS_HAVE_IOUT | PMBUS_HAVE_POUT |
> +		PMBUS_HAVE_TEMP  | PMBUS_HAVE_TEMP2 | PMBUS_HAVE_TEMP3 |
> +		PMBUS_HAVE_FAN12 | PMBUS_HAVE_STATUS_FAN12 |
> +		PMBUS_HAVE_STATUS_VOUT | PMBUS_HAVE_STATUS_IOUT |
> +		PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_STATUS_TEMP,
> +	.read_word_data = dps920ab_read_word_data,
> +	.write_word_data = dps920ab_write_word_data,
> +};
> +
> +static int dps920ab_mfr_id_show(struct seq_file *s, void *data)
> +{
> +	struct dps920ab_data *priv = s->private;
> +	u8 buf[I2C_SMBUS_BLOCK_MAX + 1];
> +	int ret;
> +
> +	ret = i2c_smbus_read_block_data(priv->client, PMBUS_MFR_ID, buf);
> +	if (ret < 0)
> +		return ret;
> +
	buf[ret] = '\0';

missing here. With that, the two functions are effectively the same
and can be merged into one with the register as additional parameter.
Also, you might consider storing this information in struct dps920ab_data.
After all, it is unlikely to change, so reading it over and over again
has no real value.

> +	seq_printf(s, "%s\n", buf);
> +
> +	return 0;
> +}
> +
> +DEFINE_SHOW_ATTRIBUTE(dps920ab_mfr_id);
> +
> +static int dps920ab_mfr_model_show(struct seq_file *s, void *data)
> +{
> +	struct dps920ab_data *priv = s->private;
> +	u8 buf[I2C_SMBUS_BLOCK_MAX + 1];
> +	int ret;
> +
> +	ret = i2c_smbus_read_block_data(priv->client, PMBUS_MFR_MODEL, buf);
> +	if (ret < 0)
> +		return ret;
> +
> +	buf[ret] = '\0';
> +
> +	seq_printf(s, "%s\n", buf);
> +
> +	return 0;
> +}
> +
> +DEFINE_SHOW_ATTRIBUTE(dps920ab_mfr_model);
> +
> +static void dps920ab_init_debugfs(struct dps920ab_data *data)
> +{
> +	struct dentry *root;
> +
> +	root = pmbus_get_debugfs_dir(data->client);
> +	if (!root)
> +		return;
> +
> +	data->debugfs_dir = debugfs_create_dir(data->client->name, root);
> +	if (!data->debugfs_dir)
> +		return;
> +
> +	debugfs_create_file("mfr_id",
> +			    0400,
> +			    data->debugfs_dir,
> +			    data,
> +			    &dps920ab_mfr_id_fops);
> +
> +	debugfs_create_file("mfr_model",
> +			    0400,
> +			    data->debugfs_dir,
> +			    data,
> +			    &dps920ab_mfr_model_fops);
> +}
> +
> +static int dps920ab_probe(struct i2c_client *client)
> +{
> +	u8 buf[I2C_SMBUS_BLOCK_MAX + 1];
> +	struct dps920ab_data *data;
> +	int ret;
> +
> +	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_ID, buf);
> +	if (ret < 0) {
> +		dev_err(&client->dev, "Failed to read Manufacturer ID\n");
> +		return ret;
> +	}
> +	if (ret != 5 || strncmp(buf, "DELTA", 5)) {

Does this return 5 or 6 ? Just asking, because other supplies from Delta
return 6.

> +		buf[ret] = '\0';
> +		dev_err(&client->dev, "Unsupported Manufacturer ID '%s'\n", buf);
> +		return -ENODEV;
> +	}
> +
> +	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, buf);
> +	if (ret < 0) {
> +		dev_err(&client->dev, "Failed to read Manufacturer Model\n");
> +		return ret;
> +	}
> +	if (ret != 11 || strncmp(buf, "DPS-920AB", 9)) {
> +		buf[ret] = '\0';
> +		dev_err(&client->dev, "Unsupported Manufacturer Model '%s'\n", buf);
> +		return -ENODEV;
> +	}
> +
> +	ret = pmbus_do_probe(client, &dps920ab_info);
> +	if (ret)
> +		return ret;
> +
> +	data = devm_kzalloc(&client->dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->client = client;
> +
> +	dps920ab_init_debugfs(data);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id __maybe_unused dps920ab_of_match[] = {
> +	{ .compatible = "delta,dps920ab", },
> +	{}
> +};
> +
> +MODULE_DEVICE_TABLE(of, dps920ab_of_match);
> +
> +static struct i2c_driver dps920ab_driver = {
> +	.driver = {
> +		   .name = "dps920ab",
> +		   .of_match_table = of_match_ptr(dps920ab_of_match),
> +	},
> +	.probe_new = dps920ab_probe,
> +};
> +
> +module_i2c_driver(dps920ab_driver);
> +
> +MODULE_AUTHOR("Robert Marko <robert.marko@sartura.hr>");
> +MODULE_DESCRIPTION("PMBus driver for Delta DPS920AB PSU");
> +MODULE_LICENSE("GPL");
> 

