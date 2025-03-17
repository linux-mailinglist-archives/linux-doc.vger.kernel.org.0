Return-Path: <linux-doc+bounces-41040-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 189E1A64EF7
	for <lists+linux-doc@lfdr.de>; Mon, 17 Mar 2025 13:33:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BC1D77A64C4
	for <lists+linux-doc@lfdr.de>; Mon, 17 Mar 2025 12:32:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3EE222257F;
	Mon, 17 Mar 2025 12:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LTNQZB2Z"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE92E23BCF9
	for <linux-doc@vger.kernel.org>; Mon, 17 Mar 2025 12:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742214793; cv=none; b=lnzLwOxICT1xXAhnLz++RxV+C/+Z55G/pyDlIjN/F9N0PgnYx+VRPeFjwUznRhWthfv/IN8VwJX5uuLQkW5zz/ZLlMsavGpOInigRNT0TR+rl0vH30pkV2aT1GwOnNXdGY5pYcCDjqdUhLC1I5IB7rc0ASV+cdtOM0PjdfWJAJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742214793; c=relaxed/simple;
	bh=HaoDdTNElxGgiWHcCwujbysz5G/lNSZtyXhMi7JJJig=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qexVAZu7i1JqmP9+rax+mxDPueSyQWNn7aOuEnW91dFi86+bxDJvxFvfas4a+QHLwgLY0QOWHpBCLPHXEcvWq16PsHu8fEKBaWo1oLzpzxPiLUGnpxMvOKpSutZNS4tvdcFKDCx6GGmysnJ18dr45Bd0eViX6kuQ/8O1FZzIuqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LTNQZB2Z; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742214790;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JezHzOr4cH5CC3OkxH2pDIucxBNDf0tG1TD0C+sq9bs=;
	b=LTNQZB2Z4rOFFkDjIau+z7/x/lLNTTmz3xzmpd7xI9d9VEy1bVMhQZWKUQS9UtwhuRBLKW
	yC1yLW9MgRBb0hrPzv+xlGdB8Tf6/rZwKRoBTEieCudqt7LGNMcYE57IcJ3+n/GFm+oNuh
	YNON5xC/wGAid+aLVNE2vxFJsB8iP0o=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-22-qVcve6IqOdeTJOcy8tFuyA-1; Mon, 17 Mar 2025 08:33:09 -0400
X-MC-Unique: qVcve6IqOdeTJOcy8tFuyA-1
X-Mimecast-MFC-AGG-ID: qVcve6IqOdeTJOcy8tFuyA_1742214788
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-ac287f284f8so311674666b.0
        for <linux-doc@vger.kernel.org>; Mon, 17 Mar 2025 05:33:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742214788; x=1742819588;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JezHzOr4cH5CC3OkxH2pDIucxBNDf0tG1TD0C+sq9bs=;
        b=l4yxjQKQ+zkvwZOXdtXNBGmK20vJ9XRnx3qTL0CTrnYFiyalkmsSqKWpoc6iIJJPuP
         FUYGzMOVC6cF4yqmOaRoNdHu3HYzJXzDlMAmhzWLG5a66LYinYmEXYZVSPf5S/X9Lkjy
         Bg8S6Khs4HNioavLc5QmDzOVsfnMfkOZ/uN7flPZGhSijVeoERcH5OceZ53BgA2e5nf6
         kZF6b/B9VAb1TgoYco3P6yWHQcddFBMvJ4A/YvU7qy9hlYWvPkVchNpIsZoFCMl7ojiR
         dCCB7Ng6+z9UimBCkJFebTN+4wH0R4/tbddVy5iNa7R3nrmm8kh4AeNBPRsxlvmFr8fR
         V/Fw==
X-Forwarded-Encrypted: i=1; AJvYcCXtp7Z0ehIFOIaDf1pbXsnRXmY3I4CKNlpYIJEzBinhx5MKQwjHpWrcpkiZSel394jXyxcLnuDzC2E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCE26xJVZ3BmhWqHegCZ3s2TjVbRsQBNkd4v0mo2RVDBYy2sKR
	e/ZtKIlQpexNffVDak7l2vt9jQS5u96gcQgLTLrbxdYzo/h7Y9pI5ilEw87kojEP0z3A1dqqa77
	tSQ2MPz9tp0nVU/5wfg77BDrADFKicD7UytfsCfBI+IHbsesSFuxLRtbMbA==
X-Gm-Gg: ASbGncuP/J6DdlIwngnPQit/tqGqfFo28/kVXzNpXoliOLHyGcHax9391aQX7xT/3wR
	G1Xtrf7QuUmXWuM3+qCe1nxx799JihVP4yyjz98GFuECIsbhjJ5PQDOhKU53i1LUkt20zMPAIWk
	m2gvxVnq46sfZgNuoFYmXFyc1yJE1OtdAGEQg2X4rsBF47x2NeFLsXEnMHaVd34EXT26+wePnT1
	mZpw3WAjaU03IUywSFrcottqE5IfaiuWr7qewYQ9zf/Tm/fgnzM/+dN4q7YSKkCknOQ41X5D3yE
	33CDSD3b5uGzxEJ8T2k=
X-Received: by 2002:a17:907:d92:b0:abf:6b14:6cf0 with SMTP id a640c23a62f3a-ac3301de27bmr1318318866b.12.1742214787895;
        Mon, 17 Mar 2025 05:33:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWN4ituXBhYLFP8L5JaUI3RJRAtsiwYlQaRBm96BxIsMNoPk9NSO6TYSOqRrxmgRK86+9NZw==
X-Received: by 2002:a17:907:d92:b0:abf:6b14:6cf0 with SMTP id a640c23a62f3a-ac3301de27bmr1318315766b.12.1742214787390;
        Mon, 17 Mar 2025 05:33:07 -0700 (PDT)
Received: from [10.40.98.122] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac314a4bf4dsm659816866b.154.2025.03.17.05.33.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 05:33:06 -0700 (PDT)
Message-ID: <c7a198b5-bebb-498b-9e77-17b467f4dc48@redhat.com>
Date: Mon, 17 Mar 2025 13:32:55 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/13] platform/x86: oxpec: Add charge threshold and
 behaviour to OneXPlayer
To: Antheas Kapenekakis <lkml@antheas.dev>,
 platform-driver-x86@vger.kernel.org
Cc: linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-pm@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
 Joaquin Ignacio Aramendia <samsagax@gmail.com>,
 Derek J Clark <derekjohn.clark@gmail.com>,
 Kevin Greenberg <kdgreenberg234@protonmail.com>,
 Joshua Tam <csinaction@pm.me>, Parth Menon <parthasarathymenon@gmail.com>,
 Eileen <eileen@one-netbook.com>
References: <20250311165406.331046-1-lkml@antheas.dev>
 <20250311165406.331046-7-lkml@antheas.dev>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250311165406.331046-7-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 11-Mar-25 17:53, Antheas Kapenekakis wrote:
> With the X1 (AMD), OneXPlayer added a charge limit and charge bypass to
> their devices. Charge limit allows for choosing an arbitrary battery
> charge setpoint in percentages. Charge bypass allows to instruct the
> device to stop charging either when it is in s0 or always.

Again please don't use the word bypass, use inhibit instead.

> This feature was then extended for the F1Pro as well. OneXPlayer also
> released BIOS updates for the X1 Mini, X1 (Intel), and F1 devices that
> add support for this feature. Therefore, enable it for all F1 and
> X1 devices.
> 
> Add both of these under the standard sysfs battery endpoints for them,
> by looking for the battery. OneXPlayer devices have a single battery.
> 
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>  drivers/platform/x86/Kconfig |   1 +
>  drivers/platform/x86/oxpec.c | 217 +++++++++++++++++++++++++++++++++++
>  2 files changed, 218 insertions(+)
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 82cfc76bc5c9..f4d993658c01 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -1189,6 +1189,7 @@ config SEL3350_PLATFORM
>  config OXP_EC
>  	tristate "OneXPlayer EC platform control"
>  	depends on ACPI_EC
> +	depends on ACPI_BATTERY
>  	depends on HWMON
>  	depends on X86
>  	help
> diff --git a/drivers/platform/x86/oxpec.c b/drivers/platform/x86/oxpec.c
> index dc3a0871809c..d73a10598d8f 100644
> --- a/drivers/platform/x86/oxpec.c
> +++ b/drivers/platform/x86/oxpec.c
> @@ -24,6 +24,7 @@
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>  #include <linux/processor.h>
> +#include <acpi/battery.h>
>  
>  /* Handle ACPI lock mechanism */
>  static u32 oxp_mutex;
> @@ -87,6 +88,24 @@ static enum oxp_board board;
>  
>  #define OXP_TURBO_RETURN_VAL           0x00 /* Common return val */
>  
> +/* Battery bypass settings */
> +#define EC_CHARGE_CONTROL_BEHAVIOURS_X1	(BIT(POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO)             | \
> +					 BIT(POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE)    | \
> +					 BIT(POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE_S0))
> +
> +#define OXP_X1_CHARGE_LIMIT_REG      0xA3 /* X1 charge limit (%) */
> +#define OXP_X1_CHARGE_BYPASS_REG     0xA4 /* X1 bypass charging */
> +
> +#define OXP_X1_CHARGE_BYPASS_MASK_S0 0x01

Again avoid the word BYPASS please, if OneXPlayer are calling this bypass in their 
own documentation maybe add a note here when defining the registers that OneXPlayer
calls this bypass and then use inhibit from there on.

> +/*
> + * Cannot control S3, S5 individually.
> + * X1 Mask is 0x0A, OneXFly F1Pro is just 0x02
> + * but the extra bit on the X1 does nothing.
> + */
> +#define OXP_X1_CHARGE_BYPASS_MASK_S3S5 0x02

Ok, so suspend is treated as off, but that is for S3 suspend, what about
s2idle, or does this hw not do s2idle ?

> +#define OXP_X1_CHARGE_BYPASS_MASK_ALWAYS (OXP_X1_CHARGE_BYPASS_MASK_S0 | \
> +	OXP_X1_CHARGE_BYPASS_MASK_S3S5)
> +
>  static const struct dmi_system_id dmi_table[] = {
>  	{
>  		.matches = {
> @@ -434,6 +453,194 @@ static ssize_t tt_toggle_show(struct device *dev,
>  
>  static DEVICE_ATTR_RW(tt_toggle);
>  
> +/* Callbacks for charge behaviour attributes */
> +static bool charge_behaviour_supported(void)
> +{
> +	switch (board) {
> +	case oxp_x1:
> +	case oxp_fly:
> +		return 1;
> +	default:
> +		break;
> +	}
> +	return 0;
> +}
> +
> +static ssize_t charge_behaviour_store(struct device *dev,
> +			       struct device_attribute *attr, const char *buf,
> +			       size_t count)
> +{
> +	unsigned int available;
> +	long val, s0, always;
> +	int ret;
> +	u8 reg;
> +
> +	switch (board) {
> +	case oxp_x1:
> +	case oxp_fly:
> +		s0 = OXP_X1_CHARGE_BYPASS_MASK_S0;
> +		always = OXP_X1_CHARGE_BYPASS_MASK_ALWAYS;
> +		reg = OXP_X1_CHARGE_BYPASS_REG;
> +		available = EC_CHARGE_CONTROL_BEHAVIOURS_X1;
> +		break;

Since these are always the same this does not seem useful, please
use the defines directly below.

> +	default:
> +		return -EINVAL;
> +	}
> +
> +	ret = power_supply_charge_behaviour_parse(available, buf);
> +	if (ret < 0)
> +		return ret;
> +
> +	switch (ret) {
> +	case POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO:
> +		val = 0;
> +		break;
> +	case POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE_S0:
> +		val = s0;
> +		break;
> +	case POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE:
> +		val = always;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	ret = write_to_ec(reg, val);
> +	if (ret)
> +		return ret;
> +
> +	return count;
> +}
> +
> +static ssize_t charge_behaviour_show(struct device *dev,
> +			      struct device_attribute *attr, char *buf)
> +{
> +	long val, s0, always, sel;
> +	unsigned int available;
> +	int ret;
> +	u8 reg;
> +
> +	switch (board) {
> +	case oxp_x1:
> +	case oxp_fly:
> +		s0 = OXP_X1_CHARGE_BYPASS_MASK_S0;
> +		always = OXP_X1_CHARGE_BYPASS_MASK_ALWAYS;
> +		reg = OXP_X1_CHARGE_BYPASS_REG;
> +		available = EC_CHARGE_CONTROL_BEHAVIOURS_X1;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	ret = read_from_ec(reg, 1, &val);
> +	if (ret)
> +		return ret;
> +
> +	if ((val & always) == always)
> +		sel = POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE;
> +	else if ((val & s0) == s0)
> +		sel = POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE_S0;
> +	else
> +		sel = POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO;
> +
> +	return power_supply_charge_behaviour_show(dev, available, sel, buf);
> +}
> +
> +static DEVICE_ATTR_RW(charge_behaviour);
> +
> +static ssize_t charge_control_end_threshold_store(struct device *dev,
> +			       struct device_attribute *attr, const char *buf,
> +			       size_t count)
> +{
> +	u64 val, reg;
> +	int ret;
> +
> +	ret = kstrtou64(buf, 10, &val);
> +	if (ret)
> +		return ret;
> +
> +	if (val > 100)
> +		return -EINVAL;
> +
> +	switch (board) {
> +	case oxp_x1:
> +	case oxp_fly:
> +		reg = OXP_X1_CHARGE_LIMIT_REG;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	ret = write_to_ec(reg, val);
> +	if (ret)
> +		return ret;
> +
> +	return count;
> +}
> +
> +static ssize_t charge_control_end_threshold_show(struct device *dev,
> +			      struct device_attribute *attr, char *buf)
> +{
> +	long val;
> +	int ret;
> +	u8 reg;
> +
> +	switch (board) {
> +	case oxp_x1:
> +	case oxp_fly:
> +		reg = OXP_X1_CHARGE_LIMIT_REG;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	ret = read_from_ec(reg, 1, &val);
> +	if (ret)
> +		return ret;
> +
> +	return sysfs_emit(buf, "%ld\n", val);
> +}
> +
> +static DEVICE_ATTR_RW(charge_control_end_threshold);
> +
> +static int oxp_battery_add(struct power_supply *battery, struct acpi_battery_hook *hook)
> +{
> +	/* OneXPlayer devices only have one battery. */
> +	if (strcmp(battery->desc->name, "BAT0") != 0 &&
> +	    strcmp(battery->desc->name, "BAT1") != 0 &&
> +	    strcmp(battery->desc->name, "BATC") != 0 &&
> +	    strcmp(battery->desc->name, "BATT") != 0)
> +		return -ENODEV;
> +
> +	if (device_create_file(&battery->dev,
> +	    &dev_attr_charge_control_end_threshold))
> +		return -ENODEV;
> +
> +	if (device_create_file(&battery->dev,
> +	    &dev_attr_charge_behaviour)) {
> +		device_remove_file(&battery->dev,
> +				&dev_attr_charge_control_end_threshold);
> +		return -ENODEV;
> +	}
> +
> +	return 0;
> +}
> +
> +static int oxp_battery_remove(struct power_supply *battery, struct acpi_battery_hook *hook)
> +{
> +	device_remove_file(&battery->dev,
> +			   &dev_attr_charge_control_end_threshold);
> +	device_remove_file(&battery->dev,
> +			   &dev_attr_charge_behaviour);
> +	return 0;
> +}
> +
> +static struct acpi_battery_hook battery_hook = {
> +	.add_battery = oxp_battery_add,
> +	.remove_battery = oxp_battery_remove,
> +	.name = "OneXPlayer Battery",
> +};
> +

Since this is new code it should use the new power-supply extension support instead
of the old battery_hook mechanism:

https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=6037802bbae892f3ad0c7b4c4faee39b967e32b0



>  /* PWM enable/disable functions */
>  static int oxp_pwm_enable(void)
>  {
> @@ -716,15 +923,25 @@ static int oxp_platform_probe(struct platform_device *pdev)
>  	hwdev = devm_hwmon_device_register_with_info(dev, "oxpec", NULL,
>  						     &oxp_ec_chip_info, NULL);
>  
> +	if (charge_behaviour_supported())
> +		battery_hook_register(&battery_hook);
> +
>  	return PTR_ERR_OR_ZERO(hwdev);
>  }
>  
> +static void oxp_platform_remove(struct platform_device *device)
> +{
> +	if (charge_behaviour_supported())
> +		battery_hook_unregister(&battery_hook);
> +}
> +
>  static struct platform_driver oxp_platform_driver = {
>  	.driver = {
>  		.name = "oxp-platform",
>  		.dev_groups = oxp_ec_groups,
>  	},
>  	.probe = oxp_platform_probe,
> +	.remove = oxp_platform_remove,
>  };
>  
>  static struct platform_device *oxp_platform_device;

Regards,

Hans



