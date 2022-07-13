Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8F5E5737C9
	for <lists+linux-doc@lfdr.de>; Wed, 13 Jul 2022 15:47:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231435AbiGMNrI (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 13 Jul 2022 09:47:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231274AbiGMNrH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 13 Jul 2022 09:47:07 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3A5010BE;
        Wed, 13 Jul 2022 06:47:06 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id o5-20020a17090a3d4500b001ef76490983so3716724pjf.2;
        Wed, 13 Jul 2022 06:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=E8QifYFp/lwvfFzsp4TOKlqipcqLOhcpZBS/KtNX/OI=;
        b=YlJyOu2QRsl7m3bd5cIDXtw46d/GAajRopQjQ6XtV0d1SHK8UzrD60XhTw7SQbMFe1
         gVbbQ05p1X1lFbtnPlkJGbiHW/YGAsYZq48F76SAAvEqQlezVOUy1uXlCm9djS0E12d4
         0QqbGIOC6sTyMPrOnQJOHieC47LH2tELObQmUEAGV/2k9YfvOpy5lmxWh6gRu1ZzUzmT
         UxKkCqWfCojQs+kPGKpNczq1pVpOHYwCUbTZ9lzEOI/+80maehBcw6cjH/CkrA2fxNd4
         kI66VOaUDpsnTPo8CMIg7K54hVEDUwNASEKwmbexON19ClSoRKylwdOhYpCTCyLLAPGG
         mj7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=E8QifYFp/lwvfFzsp4TOKlqipcqLOhcpZBS/KtNX/OI=;
        b=KvOQmBFZrPXIxcTkcCnKgUNt+Mkc2G8C5w52/YrGgO4oopAXoLMf1ahUQBH2n3qyZY
         f0WP5eOF2GxHBKlH/Ap62gJE+endI7o8AZcgVS80KcfP7wsDy6iF5RMoeqvT0jXSs1ki
         Bk/ChiVnSurjVlYptXU2kDSIeF2Z6LrOVlTLCdl68/4+38Jj9EEtoo9wiFK9NxJslc17
         1+ZjVA57IKeYWvQEm/JVJm7n56xG7epn6RzoYF2DruxwAbWFXmqfR4gWIK50qq15OAm2
         2W8NAhYdLblhgrPhIc5Jmam34pfE0/I523wvqCbbW6QyEw6fEPBnZ2a/Dqmel6CCMJm8
         TImg==
X-Gm-Message-State: AJIora/3XqhBglrJaxLlbUIt4amOQ6OUHW5F7zHCgYa4aNfiYk5JuVFf
        F4EKwOYYwKdnPnqzD/8jRl5fhvQeE0Rrlw==
X-Google-Smtp-Source: AGRyM1tz+UvkD3ZH6hSSZJrft9mTXRXEtOVy7QebAZGY+GZZWMAcmCXDgroD4uzU5TCTQIkRGTHWOA==
X-Received: by 2002:a17:90b:1807:b0:1f0:5875:9751 with SMTP id lw7-20020a17090b180700b001f058759751mr4044679pjb.25.1657720026209;
        Wed, 13 Jul 2022 06:47:06 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902d58a00b0015e8d4eb1d5sm8826990plh.31.2022.07.13.06.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 06:47:01 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 13 Jul 2022 06:46:57 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Eugene Shalygin <eugene.shalygin@gmail.com>
Cc:     Urs Schroffenegger <nabajour@lampshade.ch>,
        Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] hwmon: (asus-ec-sensors) add definitions for ROG
 ZENITH II EXTREME
Message-ID: <20220713134657.GA3799892@roeck-us.net>
References: <20220710202639.1812058-1-eugene.shalygin@gmail.com>
 <20220710202639.1812058-2-eugene.shalygin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220710202639.1812058-2-eugene.shalygin@gmail.com>
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

On Sun, Jul 10, 2022 at 10:26:39PM +0200, Eugene Shalygin wrote:
> From: Urs Schroffenegger <nabajour@lampshade.ch>
> 
> Add definitions for ROG ZENITH II EXTREME and some unknown yet
> temperature sensors in the second EC bank. Details are available at
> [1, 2].
> 
> [1] https://github.com/zeule/asus-ec-sensors/pull/26
> [2] https://github.com/zeule/asus-ec-sensors/issues/16
> 
> Signed-off-by: Urs Schroffenegger <nabajour@lampshade.ch>
> Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>

Applied.

Thanks,
Guenter
> ---
>  Documentation/hwmon/asus_ec_sensors.rst |  1 +
>  drivers/hwmon/asus-ec-sensors.c         | 47 +++++++++++++++++++++++++
>  2 files changed, 48 insertions(+)
> 
> diff --git a/Documentation/hwmon/asus_ec_sensors.rst b/Documentation/hwmon/asus_ec_sensors.rst
> index 1e40c123db77..02f4ad314a1e 100644
> --- a/Documentation/hwmon/asus_ec_sensors.rst
> +++ b/Documentation/hwmon/asus_ec_sensors.rst
> @@ -22,6 +22,7 @@ Supported boards:
>   * ROG STRIX X570-F GAMING
>   * ROG STRIX X570-I GAMING
>   * ROG STRIX Z690-A GAMING WIFI D4
> + * ROG ZENITH II EXTREME
>  
>  Authors:
>      - Eugene Shalygin <eugene.shalygin@gmail.com>
> diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
> index 625c2baa35ec..3049537130be 100644
> --- a/drivers/hwmon/asus-ec-sensors.c
> +++ b/drivers/hwmon/asus-ec-sensors.c
> @@ -56,6 +56,8 @@ static char *mutex_path_override;
>  
>  #define ASUS_HW_ACCESS_MUTEX_RMTW_ASMX	"\\RMTW.ASMX"
>  
> +#define ASUS_HW_ACCESS_MUTEX_SB_PCI0_SBRG_SIO1_MUT0 "\\_SB_.PCI0.SBRG.SIO1.MUT0"
> +
>  #define MAX_IDENTICAL_BOARD_VARIATIONS	3
>  
>  /* Moniker for the ACPI global lock (':' is not allowed in ASL identifiers) */
> @@ -121,6 +123,18 @@ enum ec_sensors {
>  	ec_sensor_temp_water_in,
>  	/* "Water_Out" temperature sensor reading [℃] */
>  	ec_sensor_temp_water_out,
> +	/* "Water_Block_In" temperature sensor reading [℃] */
> +	ec_sensor_temp_water_block_in,
> +	/* "Water_Block_Out" temperature sensor reading [℃] */
> +	ec_sensor_temp_water_block_out,
> +	/* "T_sensor_2" temperature sensor reading [℃] */
> +	ec_sensor_temp_t_sensor_2,
> +	/* "Extra_1" temperature sensor reading [℃] */
> +	ec_sensor_temp_sensor_extra_1,
> +	/* "Extra_2" temperature sensor reading [℃] */
> +	ec_sensor_temp_sensor_extra_2,
> +	/* "Extra_3" temperature sensor reading [℃] */
> +	ec_sensor_temp_sensor_extra_3,
>  };
>  
>  #define SENSOR_TEMP_CHIPSET BIT(ec_sensor_temp_chipset)
> @@ -136,6 +150,12 @@ enum ec_sensors {
>  #define SENSOR_CURR_CPU BIT(ec_sensor_curr_cpu)
>  #define SENSOR_TEMP_WATER_IN BIT(ec_sensor_temp_water_in)
>  #define SENSOR_TEMP_WATER_OUT BIT(ec_sensor_temp_water_out)
> +#define SENSOR_TEMP_WATER_BLOCK_IN BIT(ec_sensor_temp_water_block_in)
> +#define SENSOR_TEMP_WATER_BLOCK_OUT BIT(ec_sensor_temp_water_block_out)
> +#define SENSOR_TEMP_T_SENSOR_2 BIT(ec_sensor_temp_t_sensor_2)
> +#define SENSOR_TEMP_SENSOR_EXTRA_1 BIT(ec_sensor_temp_sensor_extra_1)
> +#define SENSOR_TEMP_SENSOR_EXTRA_2 BIT(ec_sensor_temp_sensor_extra_2)
> +#define SENSOR_TEMP_SENSOR_EXTRA_3 BIT(ec_sensor_temp_sensor_extra_3)
>  
>  enum board_family {
>  	family_unknown,
> @@ -199,6 +219,18 @@ static const struct ec_sensor_info sensors_family_amd_500[] = {
>  		EC_SENSOR("Water_In", hwmon_temp, 1, 0x01, 0x00),
>  	[ec_sensor_temp_water_out] =
>  		EC_SENSOR("Water_Out", hwmon_temp, 1, 0x01, 0x01),
> +	[ec_sensor_temp_water_block_in] =
> +		EC_SENSOR("Water_Block_In", hwmon_temp, 1, 0x01, 0x02),
> +	[ec_sensor_temp_water_block_out] =
> +		EC_SENSOR("Water_Block_Out", hwmon_temp, 1, 0x01, 0x03),
> +	[ec_sensor_temp_sensor_extra_1] =
> +		EC_SENSOR("Extra_1", hwmon_temp, 1, 0x01, 0x09),
> +	[ec_sensor_temp_t_sensor_2] =
> +		EC_SENSOR("T_sensor_2", hwmon_temp, 1, 0x01, 0x0a),
> +	[ec_sensor_temp_sensor_extra_2] =
> +		EC_SENSOR("Extra_2", hwmon_temp, 1, 0x01, 0x0b),
> +	[ec_sensor_temp_sensor_extra_3] =
> +		EC_SENSOR("Extra_3", hwmon_temp, 1, 0x01, 0x0c),
>  };
>  
>  static const struct ec_sensor_info sensors_family_intel_300[] = {
> @@ -231,6 +263,9 @@ static const struct ec_sensor_info sensors_family_intel_600[] = {
>  #define SENSOR_SET_TEMP_CHIPSET_CPU_MB                                         \
>  	(SENSOR_TEMP_CHIPSET | SENSOR_TEMP_CPU | SENSOR_TEMP_MB)
>  #define SENSOR_SET_TEMP_WATER (SENSOR_TEMP_WATER_IN | SENSOR_TEMP_WATER_OUT)
> +#define SENSOR_SET_WATER_BLOCK                                                 \
> +	(SENSOR_TEMP_WATER_BLOCK_IN | SENSOR_TEMP_WATER_BLOCK_OUT)
> +
>  
>  struct ec_board_info {
>  	const char *board_names[MAX_IDENTICAL_BOARD_VARIATIONS];
> @@ -378,6 +413,18 @@ static const struct ec_board_info board_info[] = {
>  		.mutex_path = ASUS_HW_ACCESS_MUTEX_RMTW_ASMX,
>  		.family = family_intel_600_series,
>  	},
> +	{
> +		.board_names = {"ROG ZENITH II EXTREME"},
> +		.sensors = SENSOR_SET_TEMP_CHIPSET_CPU_MB | SENSOR_TEMP_T_SENSOR |
> +			SENSOR_TEMP_VRM | SENSOR_SET_TEMP_WATER |
> +			SENSOR_FAN_CPU_OPT | SENSOR_FAN_CHIPSET | SENSOR_FAN_VRM_HS |
> +			SENSOR_FAN_WATER_FLOW | SENSOR_CURR_CPU | SENSOR_IN_CPU_CORE |
> +			SENSOR_SET_WATER_BLOCK |
> +			SENSOR_TEMP_T_SENSOR_2 | SENSOR_TEMP_SENSOR_EXTRA_1 |
> +			SENSOR_TEMP_SENSOR_EXTRA_2 | SENSOR_TEMP_SENSOR_EXTRA_3,
> +		.mutex_path = ASUS_HW_ACCESS_MUTEX_SB_PCI0_SBRG_SIO1_MUT0,
> +		.family = family_amd_500_series,
> +	},
>  	{}
>  };
>  
