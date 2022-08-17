Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8B8E59732A
	for <lists+linux-doc@lfdr.de>; Wed, 17 Aug 2022 17:38:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239714AbiHQPg0 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 17 Aug 2022 11:36:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233350AbiHQPgZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 17 Aug 2022 11:36:25 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B37B647CF;
        Wed, 17 Aug 2022 08:36:23 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id u22so4043574plq.12;
        Wed, 17 Aug 2022 08:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc;
        bh=25FTFOf2VdHHJiNkSRTD1qR6P4bK+u3RbzoO/N+GYIk=;
        b=WhJHeAGn4Sdt+u+g1EMvkBsPo18dloUs5zvzaKljnVtJU7oJtGWV15l5Csbv6O1evz
         FRldsj7wFXZsFRmqxqRwYPXubMeQdsV9oFcM4mOogCWl1/iHeFiS878qbVcyFmEphk3A
         knfv82BpqrQHU8ZA6eNZEmJQhVa7k7D+ka1Cf3dhK1qLFQAAp2QRN7cdMgcAA2aOcfNp
         5ZYX+MPoKk/rzsq7OSitylHwCPFJRduJ/RGdxXkNUWPjAENg+q168nuH+ZkilfzBYn1a
         Xc5M6yo1kRokPATEBgVer9jSXc+RjOi0mgxAQglfXwNFIlBGuU4M+WYA19iKA44kGoHO
         wjqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc;
        bh=25FTFOf2VdHHJiNkSRTD1qR6P4bK+u3RbzoO/N+GYIk=;
        b=FHY+jkq0nJZ3F92oDWGiN9oLahiaSi6nUwYkLhxZaOs85XNBRmzqbTEN7mgz26z0q6
         a9588VD7VeNUBUhIbAWu+j+ayd4M6m21gCh6I8siSWPrGQsE9mQxrHl2NUSNB8Z7HglD
         TejROX/sXvWHZmxzjD73JS/EghWmrq0WUGlr/kohIUMoBVJkmzRb8gsC8MjzneQe8xFN
         0hcS1rsgul4INvCMcasp0R8OzC8ewSE97imx1VCt8k58JMIqa4K22b6F/9gLo/8lzIQC
         /OXOaTqDCLPAZsCTZlFAuJ/Sh0Ho9shZJBVegN2tIKT1QgtB4Um+8kvdhlZut2/w5X6M
         qGPw==
X-Gm-Message-State: ACgBeo03snTTjnMxVfrCeQ0z8yspcBRKK6YASr+dDhXYA1gcANkb1jpK
        h7ZAlSZA/fRz80bzUaHwtkjxfgVJd+Q=
X-Google-Smtp-Source: AA6agR4j8x7o8QRK1QPH0n3bLvvSTGQWdadgqRISRNnCnF7jYTmQDQK7sUdO2APW5IDwLJVxg8GMcg==
X-Received: by 2002:a17:90a:c402:b0:1f8:c335:d4d7 with SMTP id i2-20020a17090ac40200b001f8c335d4d7mr4384266pjt.242.1660750582655;
        Wed, 17 Aug 2022 08:36:22 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f14-20020a170902684e00b0016d5428f041sm46153pln.199.2022.08.17.08.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 08:36:21 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 17 Aug 2022 08:36:20 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Eugene Shalygin <eugene.shalygin@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
        linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] hwmon: (asus_wmi_ec_sensors) remove driver
Message-ID: <20220817153620.GA1408169@roeck-us.net>
References: <20220720072016.102086-1-eugene.shalygin@gmail.com>
 <20220720072016.102086-2-eugene.shalygin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220720072016.102086-2-eugene.shalygin@gmail.com>
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jul 20, 2022 at 09:20:16AM +0200, Eugene Shalygin wrote:
> This driver utilises a WMI interface found in AMD 500 series ASUS boards,
> to read EC registers. But it turned out that ASUS abandoned the
> interface, as it disappeared from Intel 600 series boards. Additionally,
> the WMI interface was incredibly slow. Therefore this driver was deprecated
> in favor of the asus_ec_sensors driver, which supports more boards, more
> sensors, and is faster.
> 
> Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  Documentation/hwmon/asus_wmi_ec_sensors.rst |  38 --
>  Documentation/hwmon/index.rst               |   1 -
>  MAINTAINERS                                 |   7 -
>  drivers/hwmon/Kconfig                       |  15 -
>  drivers/hwmon/Makefile                      |   1 -
>  drivers/hwmon/asus_wmi_ec_sensors.c         | 622 --------------------
>  6 files changed, 684 deletions(-)
>  delete mode 100644 Documentation/hwmon/asus_wmi_ec_sensors.rst
>  delete mode 100644 drivers/hwmon/asus_wmi_ec_sensors.c
> 
> diff --git a/Documentation/hwmon/asus_wmi_ec_sensors.rst b/Documentation/hwmon/asus_wmi_ec_sensors.rst
> deleted file mode 100644
> index 1b287f229e86..000000000000
> --- a/Documentation/hwmon/asus_wmi_ec_sensors.rst
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -.. SPDX-License-Identifier: GPL-2.0-or-later
> -
> -Kernel driver asus_wmi_ec_sensors
> -=================================
> -
> -Supported boards:
> - * PRIME X570-PRO,
> - * Pro WS X570-ACE,
> - * ROG CROSSHAIR VIII DARK HERO,
> - * ROG CROSSHAIR VIII FORMULA,
> - * ROG CROSSHAIR VIII HERO,
> - * ROG STRIX B550-E GAMING,
> - * ROG STRIX B550-I GAMING,
> - * ROG STRIX X570-E GAMING.
> -
> -Authors:
> -    - Eugene Shalygin <eugene.shalygin@gmail.com>
> -
> -Description:
> -------------
> -ASUS mainboards publish hardware monitoring information via Super I/O
> -chip and the ACPI embedded controller (EC) registers. Some of the sensors
> -are only available via the EC.
> -
> -ASUS WMI interface provides a method (BREC) to read data from EC registers,
> -which is utilized by this driver to publish those sensor readings to the
> -HWMON system. The driver is aware of and reads the following sensors:
> -
> -1. Chipset (PCH) temperature
> -2. CPU package temperature
> -3. Motherboard temperature
> -4. Readings from the T_Sensor header
> -5. VRM temperature
> -6. CPU_Opt fan RPM
> -7. Chipset fan RPM
> -8. Readings from the "Water flow meter" header (RPM)
> -9. Readings from the "Water In" and "Water Out" temperature headers
> -10. CPU current
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index f7113b0f8b2a..98fa687b361e 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -44,7 +44,6 @@ Hardware Monitoring Kernel Drivers
>     asc7621
>     aspeed-pwm-tacho
>     asus_ec_sensors
> -   asus_wmi_ec_sensors
>     asus_wmi_sensors
>     bcm54140
>     bel-pfe
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 66bffb24a348..71272cbc7c99 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3162,13 +3162,6 @@ L:	linux-hwmon@vger.kernel.org
>  S:	Maintained
>  F:	drivers/hwmon/asus_wmi_sensors.c
>  
> -ASUS WMI EC HARDWARE MONITOR DRIVER
> -M:	Eugene Shalygin <eugene.shalygin@gmail.com>
> -M:	Denis Pauk <pauk.denis@gmail.com>
> -L:	linux-hwmon@vger.kernel.org
> -S:	Maintained
> -F:	drivers/hwmon/asus_wmi_ec_sensors.c
> -
>  ASUS EC HARDWARE MONITOR DRIVER
>  M:	Eugene Shalygin <eugene.shalygin@gmail.com>
>  L:	linux-hwmon@vger.kernel.org
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index fd2446cf343b..7b26baa9146f 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -2341,21 +2341,6 @@ config SENSORS_ASUS_WMI
>  	  This driver can also be built as a module. If so, the module
>  	  will be called asus_wmi_sensors.
>  
> -config SENSORS_ASUS_WMI_EC
> -	tristate "ASUS WMI B550/X570"
> -	depends on ACPI_WMI && SENSORS_ASUS_EC=n
> -	help
> -	  If you say yes here you get support for the ACPI embedded controller
> -	  hardware monitoring interface found in B550/X570 ASUS motherboards.
> -	  This driver will provide readings of fans, voltages and temperatures
> -	  through the system firmware.
> -
> -	  This driver is deprecated in favor of the ASUS EC Sensors driver
> -	  which provides fully compatible output.
> -
> -	  This driver can also be built as a module. If so, the module
> -	  will be called asus_wmi_sensors_ec.
> -
>  config SENSORS_ASUS_EC
>  	tristate "ASUS EC Sensors"
>  	depends on X86
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index 007e829d1d0d..f62c5c36b276 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -11,7 +11,6 @@ obj-$(CONFIG_SENSORS_ACPI_POWER) += acpi_power_meter.o
>  obj-$(CONFIG_SENSORS_ATK0110)	+= asus_atk0110.o
>  obj-$(CONFIG_SENSORS_ASUS_EC)	+= asus-ec-sensors.o
>  obj-$(CONFIG_SENSORS_ASUS_WMI)	+= asus_wmi_sensors.o
> -obj-$(CONFIG_SENSORS_ASUS_WMI_EC)	+= asus_wmi_ec_sensors.o
>  
>  # Native drivers
>  # asb100, then w83781d go first, as they can override other drivers' addresses.
> diff --git a/drivers/hwmon/asus_wmi_ec_sensors.c b/drivers/hwmon/asus_wmi_ec_sensors.c
> deleted file mode 100644
> index a3a2f014dec0..000000000000
> --- a/drivers/hwmon/asus_wmi_ec_sensors.c
> +++ /dev/null
> @@ -1,622 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-or-later
> -/*
> - * HWMON driver for ASUS B550/X570 motherboards that publish sensor
> - * values via the embedded controller registers.
> - *
> - * Copyright (C) 2021 Eugene Shalygin <eugene.shalygin@gmail.com>
> - * Copyright (C) 2018-2019 Ed Brindley <kernel@maidavale.org>
> - *
> - * EC provides:
> - * - Chipset temperature
> - * - CPU temperature
> - * - Motherboard temperature
> - * - T_Sensor temperature
> - * - VRM temperature
> - * - Water In temperature
> - * - Water Out temperature
> - * - CPU Optional Fan RPM
> - * - Chipset Fan RPM
> - * - Water Flow Fan RPM
> - * - CPU current
> - */
> -
> -#include <linux/acpi.h>
> -#include <linux/dmi.h>
> -#include <linux/hwmon.h>
> -#include <linux/init.h>
> -#include <linux/jiffies.h>
> -#include <linux/kernel.h>
> -#include <linux/module.h>
> -#include <linux/mutex.h>
> -#include <linux/nls.h>
> -#include <linux/units.h>
> -#include <linux/wmi.h>
> -
> -#include <asm/unaligned.h>
> -
> -#define ASUSWMI_MONITORING_GUID		"466747A0-70EC-11DE-8A39-0800200C9A66"
> -#define ASUSWMI_METHODID_BLOCK_READ_EC	0x42524543 /* BREC */
> -/* From the ASUS DSDT source */
> -#define ASUSWMI_BREC_REGISTERS_MAX	16
> -#define ASUSWMI_MAX_BUF_LEN		128
> -#define SENSOR_LABEL_LEN		16
> -
> -static u32 hwmon_attributes[hwmon_max] = {
> -	[hwmon_chip]	= HWMON_C_REGISTER_TZ,
> -	[hwmon_temp]	= HWMON_T_INPUT | HWMON_T_LABEL,
> -	[hwmon_in]	= HWMON_I_INPUT | HWMON_I_LABEL,
> -	[hwmon_curr]	= HWMON_C_INPUT | HWMON_C_LABEL,
> -	[hwmon_fan]	= HWMON_F_INPUT | HWMON_F_LABEL,
> -};
> -
> -struct asus_wmi_ec_sensor_address {
> -	u8 index;
> -	u8 bank;
> -	u8 size;
> -};
> -
> -#define MAKE_SENSOR_ADDRESS(size_i, bank_i, index_i) {	\
> -	.size = size_i,					\
> -	.bank = bank_i,					\
> -	.index = index_i,				\
> -}
> -
> -struct ec_sensor_info {
> -	struct asus_wmi_ec_sensor_address addr;
> -	char label[SENSOR_LABEL_LEN];
> -	enum hwmon_sensor_types type;
> -};
> -
> -#define EC_SENSOR(sensor_label, sensor_type, size, bank, index) {	\
> -	.addr = MAKE_SENSOR_ADDRESS(size, bank, index),			\
> -	.label = sensor_label,						\
> -	.type = sensor_type,						\
> -}
> -
> -enum known_ec_sensor {
> -	SENSOR_TEMP_CHIPSET,
> -	SENSOR_TEMP_CPU,
> -	SENSOR_TEMP_MB,
> -	SENSOR_TEMP_T_SENSOR,
> -	SENSOR_TEMP_VRM,
> -	SENSOR_FAN_CPU_OPT,
> -	SENSOR_FAN_CHIPSET,
> -	SENSOR_FAN_VRM_HS,
> -	SENSOR_FAN_WATER_FLOW,
> -	SENSOR_CURR_CPU,
> -	SENSOR_TEMP_WATER_IN,
> -	SENSOR_TEMP_WATER_OUT,
> -	SENSOR_MAX
> -};
> -
> -/* All known sensors for ASUS EC controllers */
> -static const struct ec_sensor_info known_ec_sensors[] = {
> -	[SENSOR_TEMP_CHIPSET]	= EC_SENSOR("Chipset", hwmon_temp, 1, 0x00, 0x3a),
> -	[SENSOR_TEMP_CPU]	= EC_SENSOR("CPU", hwmon_temp, 1, 0x00, 0x3b),
> -	[SENSOR_TEMP_MB]	= EC_SENSOR("Motherboard", hwmon_temp, 1, 0x00, 0x3c),
> -	[SENSOR_TEMP_T_SENSOR]	= EC_SENSOR("T_Sensor", hwmon_temp, 1, 0x00, 0x3d),
> -	[SENSOR_TEMP_VRM]	= EC_SENSOR("VRM", hwmon_temp, 1, 0x00, 0x3e),
> -	[SENSOR_FAN_CPU_OPT]	= EC_SENSOR("CPU_Opt", hwmon_fan, 2, 0x00, 0xb0),
> -	[SENSOR_FAN_VRM_HS]	= EC_SENSOR("VRM HS", hwmon_fan, 2, 0x00, 0xb2),
> -	[SENSOR_FAN_CHIPSET]	= EC_SENSOR("Chipset", hwmon_fan, 2, 0x00, 0xb4),
> -	[SENSOR_FAN_WATER_FLOW]	= EC_SENSOR("Water_Flow", hwmon_fan, 2, 0x00, 0xbc),
> -	[SENSOR_CURR_CPU]	= EC_SENSOR("CPU", hwmon_curr, 1, 0x00, 0xf4),
> -	[SENSOR_TEMP_WATER_IN]	= EC_SENSOR("Water_In", hwmon_temp, 1, 0x01, 0x00),
> -	[SENSOR_TEMP_WATER_OUT]	= EC_SENSOR("Water_Out", hwmon_temp, 1, 0x01, 0x01),
> -};
> -
> -struct asus_wmi_data {
> -	const enum known_ec_sensor known_board_sensors[SENSOR_MAX + 1];
> -};
> -
> -/* boards with EC support */
> -static struct asus_wmi_data sensors_board_PW_X570_P = {
> -	.known_board_sensors = {
> -		SENSOR_TEMP_CHIPSET, SENSOR_TEMP_CPU, SENSOR_TEMP_MB,
> -		SENSOR_TEMP_T_SENSOR, SENSOR_TEMP_VRM,
> -		SENSOR_FAN_CHIPSET,
> -		SENSOR_MAX
> -	},
> -};
> -
> -static struct asus_wmi_data sensors_board_PW_X570_A = {
> -	.known_board_sensors = {
> -		SENSOR_TEMP_CHIPSET, SENSOR_TEMP_CPU, SENSOR_TEMP_MB, SENSOR_TEMP_VRM,
> -		SENSOR_FAN_CHIPSET,
> -		SENSOR_CURR_CPU,
> -		SENSOR_MAX
> -	},
> -};
> -
> -static struct asus_wmi_data sensors_board_R_C8H = {
> -	.known_board_sensors = {
> -		SENSOR_TEMP_CHIPSET, SENSOR_TEMP_CPU, SENSOR_TEMP_MB,
> -		SENSOR_TEMP_T_SENSOR, SENSOR_TEMP_VRM,
> -		SENSOR_TEMP_WATER_IN, SENSOR_TEMP_WATER_OUT,
> -		SENSOR_FAN_CPU_OPT, SENSOR_FAN_CHIPSET, SENSOR_FAN_WATER_FLOW,
> -		SENSOR_CURR_CPU,
> -		SENSOR_MAX
> -	},
> -};
> -
> -/* Same as Hero but without chipset fan */
> -static struct asus_wmi_data sensors_board_R_C8DH = {
> -	.known_board_sensors = {
> -		SENSOR_TEMP_CHIPSET, SENSOR_TEMP_CPU, SENSOR_TEMP_MB,
> -		SENSOR_TEMP_T_SENSOR, SENSOR_TEMP_VRM,
> -		SENSOR_TEMP_WATER_IN, SENSOR_TEMP_WATER_OUT,
> -		SENSOR_FAN_CPU_OPT, SENSOR_FAN_WATER_FLOW,
> -		SENSOR_CURR_CPU,
> -		SENSOR_MAX
> -	},
> -};
> -
> -/* Same as Hero but without water */
> -static struct asus_wmi_data sensors_board_R_C8F = {
> -	.known_board_sensors = {
> -		SENSOR_TEMP_CHIPSET, SENSOR_TEMP_CPU, SENSOR_TEMP_MB,
> -		SENSOR_TEMP_T_SENSOR, SENSOR_TEMP_VRM,
> -		SENSOR_FAN_CPU_OPT, SENSOR_FAN_CHIPSET,
> -		SENSOR_CURR_CPU,
> -		SENSOR_MAX
> -	},
> -};
> -
> -static struct asus_wmi_data sensors_board_RS_B550_E_G = {
> -	.known_board_sensors = {
> -		SENSOR_TEMP_CHIPSET, SENSOR_TEMP_CPU, SENSOR_TEMP_MB,
> -		SENSOR_TEMP_T_SENSOR, SENSOR_TEMP_VRM,
> -		SENSOR_FAN_CPU_OPT,
> -		SENSOR_MAX
> -	},
> -};
> -
> -static struct asus_wmi_data sensors_board_RS_B550_I_G = {
> -	.known_board_sensors = {
> -		SENSOR_TEMP_CHIPSET, SENSOR_TEMP_CPU, SENSOR_TEMP_MB,
> -		SENSOR_TEMP_T_SENSOR, SENSOR_TEMP_VRM,
> -		SENSOR_FAN_VRM_HS,
> -		SENSOR_CURR_CPU,
> -		SENSOR_MAX
> -	},
> -};
> -
> -static struct asus_wmi_data sensors_board_RS_X570_E_G = {
> -	.known_board_sensors = {
> -		SENSOR_TEMP_CHIPSET, SENSOR_TEMP_CPU, SENSOR_TEMP_MB,
> -		SENSOR_TEMP_T_SENSOR, SENSOR_TEMP_VRM,
> -		SENSOR_FAN_CHIPSET,
> -		SENSOR_CURR_CPU,
> -		SENSOR_MAX
> -	},
> -};
> -
> -#define DMI_EXACT_MATCH_ASUS_BOARD_NAME(name, sensors) {			\
> -	.matches = {								\
> -		DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC."),	\
> -		DMI_EXACT_MATCH(DMI_BOARD_NAME, name),				\
> -	},									\
> -	.driver_data = sensors,							\
> -}
> -
> -static const struct dmi_system_id asus_wmi_ec_dmi_table[] = {
> -	DMI_EXACT_MATCH_ASUS_BOARD_NAME("PRIME X570-PRO", &sensors_board_PW_X570_P),
> -	DMI_EXACT_MATCH_ASUS_BOARD_NAME("Pro WS X570-ACE", &sensors_board_PW_X570_A),
> -	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG CROSSHAIR VIII DARK HERO", &sensors_board_R_C8DH),
> -	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG CROSSHAIR VIII FORMULA", &sensors_board_R_C8F),
> -	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG CROSSHAIR VIII HERO", &sensors_board_R_C8H),
> -	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX B550-E GAMING", &sensors_board_RS_B550_E_G),
> -	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX B550-I GAMING", &sensors_board_RS_B550_I_G),
> -	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX X570-E GAMING", &sensors_board_RS_X570_E_G),
> -	{}
> -};
> -MODULE_DEVICE_TABLE(dmi, asus_wmi_ec_dmi_table);
> -
> -struct ec_sensor {
> -	enum known_ec_sensor info_index;
> -	long cached_value;
> -};
> -
> -/**
> - * struct asus_wmi_ec_info - sensor info.
> - * @sensors: list of sensors.
> - * @read_arg: UTF-16LE string to pass to BRxx() WMI function.
> - * @read_buffer: decoded output from WMI result.
> - * @nr_sensors: number of board EC sensors.
> - * @nr_registers: number of EC registers to read (sensor might span more than 1 register).
> - * @last_updated: in jiffies.
> - */
> -struct asus_wmi_ec_info {
> -	struct ec_sensor sensors[SENSOR_MAX];
> -	char read_arg[(ASUSWMI_BREC_REGISTERS_MAX * 4 + 1) * 2];
> -	u8 read_buffer[ASUSWMI_BREC_REGISTERS_MAX];
> -	unsigned int nr_sensors;
> -	unsigned int nr_registers;
> -	unsigned long last_updated;
> -};
> -
> -struct asus_wmi_sensors {
> -	struct asus_wmi_ec_info ec;
> -	/* lock access to internal cache */
> -	struct mutex lock;
> -};
> -
> -static int asus_wmi_ec_fill_board_sensors(struct asus_wmi_ec_info *ec,
> -					  const enum known_ec_sensor *bsi)
> -{
> -	struct ec_sensor *s = ec->sensors;
> -	int i;
> -
> -	ec->nr_sensors = 0;
> -	ec->nr_registers = 0;
> -
> -	for (i = 0; bsi[i] != SENSOR_MAX; i++) {
> -		s[i].info_index = bsi[i];
> -		ec->nr_sensors++;
> -		ec->nr_registers += known_ec_sensors[bsi[i]].addr.size;
> -	}
> -
> -	return 0;
> -}
> -
> -/*
> - * The next four functions convert to or from BRxx string argument format.
> - * The format of the string is as follows:
> - * - The string consists of two-byte UTF-16LE characters.
> - * - The value of the very first byte in the string is equal to the total
> - *   length of the next string in bytes, thus excluding the first two-byte
> - *   character.
> - * - The rest of the string encodes the pairs of (bank, index) pairs, where
> - *   both values are byte-long (0x00 to 0xFF).
> - * - Numbers are encoded as UTF-16LE hex values.
> - */
> -static int asus_wmi_ec_decode_reply_buffer(const u8 *in, u32 length, u8 *out)
> -{
> -	char buffer[ASUSWMI_MAX_BUF_LEN * 2];
> -	u32 len = min_t(u32, get_unaligned_le16(in), length - 2);
> -
> -	utf16s_to_utf8s((wchar_t *)(in + 2), len / 2, UTF16_LITTLE_ENDIAN, buffer, sizeof(buffer));
> -
> -	return hex2bin(out, buffer, len / 4);
> -}
> -
> -static void asus_wmi_ec_encode_registers(const u8 *in, u32 len, char *out)
> -{
> -	char buffer[ASUSWMI_MAX_BUF_LEN * 2];
> -
> -	bin2hex(buffer, in, len);
> -
> -	utf8s_to_utf16s(buffer, len * 2, UTF16_LITTLE_ENDIAN, (wchar_t *)(out + 2), len * 2);
> -
> -	put_unaligned_le16(len * 4, out);
> -}
> -
> -static void asus_wmi_ec_make_block_read_query(struct asus_wmi_ec_info *ec)
> -{
> -	u8 registers[ASUSWMI_BREC_REGISTERS_MAX * 2];
> -	const struct ec_sensor_info *si;
> -	int i, j, offset;
> -
> -	offset = 0;
> -	for (i = 0; i < ec->nr_sensors; i++) {
> -		si = &known_ec_sensors[ec->sensors[i].info_index];
> -		for (j = 0; j < si->addr.size; j++) {
> -			registers[offset++] = si->addr.bank;
> -			registers[offset++] = si->addr.index + j;
> -		}
> -	}
> -
> -	asus_wmi_ec_encode_registers(registers, offset, ec->read_arg);
> -}
> -
> -static int asus_wmi_ec_block_read(u32 method_id, char *query, u8 *out)
> -{
> -	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
> -	struct acpi_buffer input;
> -	union acpi_object *obj;
> -	acpi_status status;
> -	int ret;
> -
> -	/* The first byte of the BRxx() argument string has to be the string size. */
> -	input.length = query[0] + 2;
> -	input.pointer = query;
> -	status = wmi_evaluate_method(ASUSWMI_MONITORING_GUID, 0, method_id, &input, &output);
> -	if (ACPI_FAILURE(status))
> -		return -EIO;
> -
> -	obj = output.pointer;
> -	if (!obj)
> -		return -EIO;
> -
> -	if (obj->type != ACPI_TYPE_BUFFER || obj->buffer.length < 2) {
> -		ret = -EIO;
> -		goto out_free_obj;
> -	}
> -
> -	ret = asus_wmi_ec_decode_reply_buffer(obj->buffer.pointer, obj->buffer.length, out);
> -
> -out_free_obj:
> -	ACPI_FREE(obj);
> -	return ret;
> -}
> -
> -static inline long get_sensor_value(const struct ec_sensor_info *si, u8 *data)
> -{
> -	switch (si->addr.size) {
> -	case 1:
> -		return *data;
> -	case 2:
> -		return get_unaligned_be16(data);
> -	case 4:
> -		return get_unaligned_be32(data);
> -	default:
> -		return 0;
> -	}
> -}
> -
> -static void asus_wmi_ec_update_ec_sensors(struct asus_wmi_ec_info *ec)
> -{
> -	const struct ec_sensor_info *si;
> -	struct ec_sensor *s;
> -	u8 i_sensor;
> -	u8 *data;
> -
> -	data = ec->read_buffer;
> -	for (i_sensor = 0; i_sensor < ec->nr_sensors; i_sensor++) {
> -		s = &ec->sensors[i_sensor];
> -		si = &known_ec_sensors[s->info_index];
> -		s->cached_value = get_sensor_value(si, data);
> -		data += si->addr.size;
> -	}
> -}
> -
> -static long asus_wmi_ec_scale_sensor_value(long value, int data_type)
> -{
> -	switch (data_type) {
> -	case hwmon_curr:
> -	case hwmon_temp:
> -	case hwmon_in:
> -		return value * MILLI;
> -	default:
> -		return value;
> -	}
> -}
> -
> -static int asus_wmi_ec_find_sensor_index(const struct asus_wmi_ec_info *ec,
> -					 enum hwmon_sensor_types type, int channel)
> -{
> -	int i;
> -
> -	for (i = 0; i < ec->nr_sensors; i++) {
> -		if (known_ec_sensors[ec->sensors[i].info_index].type == type) {
> -			if (channel == 0)
> -				return i;
> -
> -			channel--;
> -		}
> -	}
> -	return -EINVAL;
> -}
> -
> -static int asus_wmi_ec_get_cached_value_or_update(struct asus_wmi_sensors *sensor_data,
> -						  int sensor_index,
> -						  long *value)
> -{
> -	struct asus_wmi_ec_info *ec = &sensor_data->ec;
> -	int ret = 0;
> -
> -	mutex_lock(&sensor_data->lock);
> -
> -	if (time_after(jiffies, ec->last_updated + HZ)) {
> -		ret = asus_wmi_ec_block_read(ASUSWMI_METHODID_BLOCK_READ_EC,
> -					     ec->read_arg, ec->read_buffer);
> -		if (ret)
> -			goto unlock;
> -
> -		asus_wmi_ec_update_ec_sensors(ec);
> -		ec->last_updated = jiffies;
> -	}
> -
> -	*value = ec->sensors[sensor_index].cached_value;
> -
> -unlock:
> -	mutex_unlock(&sensor_data->lock);
> -
> -	return ret;
> -}
> -
> -/* Now follow the functions that implement the hwmon interface */
> -
> -static int asus_wmi_ec_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
> -				  u32 attr, int channel, long *val)
> -{
> -	struct asus_wmi_sensors *sensor_data = dev_get_drvdata(dev);
> -	struct asus_wmi_ec_info *ec = &sensor_data->ec;
> -	int ret, sidx, info_index;
> -	long value = 0;
> -
> -	sidx = asus_wmi_ec_find_sensor_index(ec, type, channel);
> -	if (sidx < 0)
> -		return sidx;
> -
> -	ret = asus_wmi_ec_get_cached_value_or_update(sensor_data, sidx, &value);
> -	if (ret)
> -		return ret;
> -
> -	info_index = ec->sensors[sidx].info_index;
> -	*val = asus_wmi_ec_scale_sensor_value(value, known_ec_sensors[info_index].type);
> -
> -	return ret;
> -}
> -
> -static int asus_wmi_ec_hwmon_read_string(struct device *dev,
> -					 enum hwmon_sensor_types type, u32 attr,
> -					 int channel, const char **str)
> -{
> -	struct asus_wmi_sensors *sensor_data = dev_get_drvdata(dev);
> -	struct asus_wmi_ec_info *ec = &sensor_data->ec;
> -	int sensor_index;
> -
> -	sensor_index = asus_wmi_ec_find_sensor_index(ec, type, channel);
> -	*str = known_ec_sensors[ec->sensors[sensor_index].info_index].label;
> -
> -	return 0;
> -}
> -
> -static umode_t asus_wmi_ec_hwmon_is_visible(const void *drvdata,
> -					    enum hwmon_sensor_types type, u32 attr,
> -					    int channel)
> -{
> -	const struct asus_wmi_sensors *sensor_data = drvdata;
> -	const struct asus_wmi_ec_info *ec = &sensor_data->ec;
> -	int index;
> -
> -	index = asus_wmi_ec_find_sensor_index(ec, type, channel);
> -
> -	return index < 0 ? 0 : 0444;
> -}
> -
> -static int asus_wmi_hwmon_add_chan_info(struct hwmon_channel_info *asus_wmi_hwmon_chan,
> -					struct device *dev, int num,
> -					enum hwmon_sensor_types type, u32 config)
> -{
> -	u32 *cfg;
> -
> -	cfg = devm_kcalloc(dev, num + 1, sizeof(*cfg), GFP_KERNEL);
> -	if (!cfg)
> -		return -ENOMEM;
> -
> -	asus_wmi_hwmon_chan->type = type;
> -	asus_wmi_hwmon_chan->config = cfg;
> -	memset32(cfg, config, num);
> -
> -	return 0;
> -}
> -
> -static const struct hwmon_ops asus_wmi_ec_hwmon_ops = {
> -	.is_visible = asus_wmi_ec_hwmon_is_visible,
> -	.read = asus_wmi_ec_hwmon_read,
> -	.read_string = asus_wmi_ec_hwmon_read_string,
> -};
> -
> -static struct hwmon_chip_info asus_wmi_ec_chip_info = {
> -	.ops = &asus_wmi_ec_hwmon_ops,
> -};
> -
> -static int asus_wmi_ec_configure_sensor_setup(struct device *dev,
> -					      const enum known_ec_sensor *bsi)
> -{
> -	struct asus_wmi_sensors *sensor_data = dev_get_drvdata(dev);
> -	struct asus_wmi_ec_info *ec = &sensor_data->ec;
> -	struct hwmon_channel_info *asus_wmi_hwmon_chan;
> -	const struct hwmon_channel_info **asus_wmi_ci;
> -	int nr_count[hwmon_max] = {}, nr_types = 0;
> -	const struct hwmon_chip_info *chip_info;
> -	const struct ec_sensor_info *si;
> -	enum hwmon_sensor_types type;
> -	struct device *hwdev;
> -	int i, ret;
> -
> -	ret = asus_wmi_ec_fill_board_sensors(ec, bsi);
> -	if (ret)
> -		return ret;
> -
> -	if (!sensor_data->ec.nr_sensors)
> -		return -ENODEV;
> -
> -	for (i = 0; i < ec->nr_sensors; i++) {
> -		si = &known_ec_sensors[ec->sensors[i].info_index];
> -		if (!nr_count[si->type])
> -			nr_types++;
> -		nr_count[si->type]++;
> -	}
> -
> -	if (nr_count[hwmon_temp]) {
> -		nr_count[hwmon_chip]++;
> -		nr_types++;
> -	}
> -
> -	/*
> -	 * If we can get values for all the registers in a single query,
> -	 * the query will not change from call to call.
> -	 */
> -	asus_wmi_ec_make_block_read_query(ec);
> -
> -	asus_wmi_hwmon_chan = devm_kcalloc(dev, nr_types, sizeof(*asus_wmi_hwmon_chan),
> -					   GFP_KERNEL);
> -	if (!asus_wmi_hwmon_chan)
> -		return -ENOMEM;
> -
> -	asus_wmi_ci = devm_kcalloc(dev, nr_types + 1, sizeof(*asus_wmi_ci), GFP_KERNEL);
> -	if (!asus_wmi_ci)
> -		return -ENOMEM;
> -
> -	asus_wmi_ec_chip_info.info = asus_wmi_ci;
> -	chip_info = &asus_wmi_ec_chip_info;
> -
> -	for (type = 0; type < hwmon_max; type++) {
> -		if (!nr_count[type])
> -			continue;
> -
> -		ret = asus_wmi_hwmon_add_chan_info(asus_wmi_hwmon_chan, dev,
> -						   nr_count[type], type,
> -						   hwmon_attributes[type]);
> -		if (ret)
> -			return ret;
> -
> -		*asus_wmi_ci++ = asus_wmi_hwmon_chan++;
> -	}
> -
> -	dev_dbg(dev, "board has %d EC sensors that span %d registers",
> -		ec->nr_sensors, ec->nr_registers);
> -
> -	hwdev = devm_hwmon_device_register_with_info(dev, "asus_wmi_ec_sensors",
> -						     sensor_data, chip_info, NULL);
> -
> -	return PTR_ERR_OR_ZERO(hwdev);
> -}
> -
> -static int asus_wmi_probe(struct wmi_device *wdev, const void *context)
> -{
> -	struct asus_wmi_sensors *sensor_data;
> -	struct asus_wmi_data *board_sensors;
> -	const struct dmi_system_id *dmi_id;
> -	const enum known_ec_sensor *bsi;
> -	struct device *dev = &wdev->dev;
> -
> -	dmi_id = dmi_first_match(asus_wmi_ec_dmi_table);
> -	if (!dmi_id)
> -		return -ENODEV;
> -
> -	board_sensors = dmi_id->driver_data;
> -	bsi = board_sensors->known_board_sensors;
> -
> -	sensor_data = devm_kzalloc(dev, sizeof(*sensor_data), GFP_KERNEL);
> -	if (!sensor_data)
> -		return -ENOMEM;
> -
> -	mutex_init(&sensor_data->lock);
> -
> -	dev_set_drvdata(dev, sensor_data);
> -
> -	return asus_wmi_ec_configure_sensor_setup(dev, bsi);
> -}
> -
> -static const struct wmi_device_id asus_ec_wmi_id_table[] = {
> -	{ ASUSWMI_MONITORING_GUID, NULL },
> -	{ }
> -};
> -
> -static struct wmi_driver asus_sensors_wmi_driver = {
> -	.driver = {
> -		.name = "asus_wmi_ec_sensors",
> -	},
> -	.id_table = asus_ec_wmi_id_table,
> -	.probe = asus_wmi_probe,
> -};
> -module_wmi_driver(asus_sensors_wmi_driver);
> -
> -MODULE_AUTHOR("Ed Brindley <kernel@maidavale.org>");
> -MODULE_AUTHOR("Eugene Shalygin <eugene.shalygin@gmail.com>");
> -MODULE_DESCRIPTION("Asus WMI Sensors Driver");
> -MODULE_LICENSE("GPL");
