Return-Path: <linux-doc+bounces-45226-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DA6AA8B33
	for <lists+linux-doc@lfdr.de>; Mon,  5 May 2025 04:59:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C7B83ABB80
	for <lists+linux-doc@lfdr.de>; Mon,  5 May 2025 02:59:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1322E19CC29;
	Mon,  5 May 2025 02:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WqBEpRRy"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB782FC23
	for <linux-doc@vger.kernel.org>; Mon,  5 May 2025 02:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746413954; cv=none; b=nwT68MkbRp+RYK5+XpgkGCR/T8lUaq/IA89valZnqozq99CUCaVlcRzlFKji20nP2ajgbqEnK3r5Gcv1yGl1DEteEa/YLy29SRHPnf0f5MPN5MVgfe/kRen3Nwsd0R6VI+YaOywMGOEN2mbNoZ57He8cMp1VVtE1+FJvMwY92LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746413954; c=relaxed/simple;
	bh=d1Zhoze0D/62CGWBox28gWgPxfbNb6CF8IymIUyGKvE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MnsrS/1PfkdO8tEkclZMknTRe57eTVGiFU6WJ5pBTeBCuoexEXTySD2KUiGb/Sda7omdKtst/W7NU5mwmVRxiJDGzPu8IfFn6NJ3qdn5ZNzeKiRO7p07yH3pr/wDDNYnsaShYggorzWyGnvOZ/Q5e85jVpsqCZlvPNviJQX+0nE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WqBEpRRy; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22438c356c8so35990285ad.1
        for <linux-doc@vger.kernel.org>; Sun, 04 May 2025 19:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746413950; x=1747018750; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ymtos8Nv3YWokwFqS1uDUEsEYH1a4tVaYiVJAE7YAbs=;
        b=WqBEpRRyEXOaXqVOSODLskc7NWuHAzGe1J2mXq1ZDcHbWB/WMuJSQpCP0mHE2dLDCU
         KwCEAP0O6SY7kMuyUX9DVqkAJ3kpf3jbSWhWOcWMPN5cuIpbmR0Aop4HxrSQsYUx8hhy
         x38zuROYWAQ9rydPkyrMh0Q48OtrLHnIVJc0s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746413950; x=1747018750;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ymtos8Nv3YWokwFqS1uDUEsEYH1a4tVaYiVJAE7YAbs=;
        b=gWnLRD36SvdD6xYklwBc2HB1Om2dXpS4x+RHXV7ubcW1VUHIjJfSNtbs5lPTYKNWPO
         OfnRJw29yMBM5o3Gz3mRSab6AiG4xo1SqIZnIAS1kPXT6E5DloGPhFhgsDNlWrFtJlwp
         +HF7YFdjjXYVcEEe8PyIn73RNlN67S8Zy9fHneToqo0GW3SkVUwFlreHwKRsPmNbdsWx
         AlhXbo+0KcIZ/YWOBKkQmwTmpLKlkKRBDHT6+GGnbw4eXobzvDcpP9NnN0oZB/a16H/3
         MQUR61ZS5J1KZiPW1qAOwKH2ncQc0P1TlVqyS415jOA+nYJmHA2KeC5ONWrxGnOcBSt+
         xJxw==
X-Forwarded-Encrypted: i=1; AJvYcCU90aaBbE39c6KbFEP91O8K9EhHGxgmtKKd4bjfvTjMNEdYne4OjF54YyzEoFPg3qsY+TYh0BVDKMI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7SLi//BycZCJD9R3u2m0YyzGJ9YIUc0XPoESoM/3Lsm7IR1JS
	PntfSRNKGuevEpvt9xIDSoZyi+lzQ7gs1nPRBjb+78fNdPwb1YN6X8aYeMCsEg==
X-Gm-Gg: ASbGncuqrnqJKrogydHShxYjyGeoYGa27NNfNdNdVHoHbQYjyhyvzzpccm545zKEMDc
	eKLT4coF5v/WpLGakRvXzi7gg1AoUIKh0LyJgg2k1AUSH6LDPBgSJWpJ+3JxzcfAvzLeltsXBdh
	6UE2gfx88YGQwiAh+KEe0p9GxXn3/T2nI4uaEGOKB1l0ikYSdF7z2XdaIsLvSmh8umzNwajarMX
	tzDU6tdmmwT9jYinimTY8DWlJpZ5z76F436kHFSdTHw3MMj+iW2aHwAWjQ3X8cuIPZ4hs5W7XLE
	H1t7fdvU7wB+wCJC9oXbph6ZgsNF6nquP1NOp4ppveic
X-Google-Smtp-Source: AGHT+IGpzOWkSrdcO9TOyY0TMdEW8dx8hBfFucltiM2W4Gt20M+07RWuMYi0uDTOf6nqfMF7umSTvQ==
X-Received: by 2002:a17:903:22c4:b0:220:d257:cdbd with SMTP id d9443c01a7336-22e1ea9a1d8mr99273415ad.48.1746413950037;
        Sun, 04 May 2025 19:59:10 -0700 (PDT)
Received: from google.com ([2401:fa00:1:10:da1:c82f:c4ba:2f8f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e15228bb1sm43824165ad.166.2025.05.04.19.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 19:59:09 -0700 (PDT)
Date: Mon, 5 May 2025 10:59:06 +0800
From: Sung-Chi Li <lschyi@chromium.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>, chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 2/3] hwmon: (cros_ec) add PWM control over fans
Message-ID: <aBgpepY29tFUGVYm@google.com>
References: <20250502-cros_ec_fan-v2-0-4d588504a01f@chromium.org>
 <20250502-cros_ec_fan-v2-2-4d588504a01f@chromium.org>
 <a89ee43f-79d9-405a-a099-7ce90fe6eb55@t-8ch.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a89ee43f-79d9-405a-a099-7ce90fe6eb55@t-8ch.de>

On Sat, May 03, 2025 at 09:36:39AM +0200, Thomas Wei�schuh wrote:
> On 2025-05-02 13:34:46+0800, Sung-Chi Li via B4 Relay wrote:
> > From: Sung-Chi Li <lschyi@chromium.org>
> > 
> > Newer EC firmware supports controlling fans through host commands, so
> > adding corresponding implementations for controlling these fans in the
> > driver for other kernel services and userspace to control them.
> > 
> > The driver will first probe the supported host command versions (get and
> > set of fan PWM values, get and set of fan control mode) to see if the
> > connected EC fulfills the requirements of controlling the fan, then
> > exposes corresponding sysfs nodes for userspace to control the fan with
> > corresponding read and write implementations.
> > As EC will automatically change the fan mode to auto when the device is
> > suspended, the power management hooks are added as well to keep the fan
> > control mode and fan PWM value consistent during suspend and resume. As
> > we need to access the hwmon device in the power management hook, update
> > the driver by storing the hwmon device in the driver data as well.
> > 
> > Signed-off-by: Sung-Chi Li <lschyi@chromium.org>
> > ---
> >  Documentation/hwmon/cros_ec_hwmon.rst |   5 +-
> >  drivers/hwmon/cros_ec_hwmon.c         | 201 ++++++++++++++++++++++++++++++++++
> >  2 files changed, 205 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/hwmon/cros_ec_hwmon.rst b/Documentation/hwmon/cros_ec_hwmon.rst
> > index 47ecae983bdbef4bfcafc5dd2fff3de039f77f8e..5b802be120438732529c3d25b1afa8b4ee353305 100644
> > --- a/Documentation/hwmon/cros_ec_hwmon.rst
> > +++ b/Documentation/hwmon/cros_ec_hwmon.rst
> > @@ -23,4 +23,7 @@ ChromeOS embedded controller used in Chromebooks and other devices.
> >  
> >  The channel labels exposed via hwmon are retrieved from the EC itself.
> >  
> > -Fan and temperature readings are supported.
> > +Fan and temperature readings are supported. PWM fan control is also supported if
> > +the EC also supports setting fan PWM values and fan mode. Note that EC will
> > +switch fan control mode back to auto when suspended. This driver will restore
> > +the fan state before suspended.
> > diff --git a/drivers/hwmon/cros_ec_hwmon.c b/drivers/hwmon/cros_ec_hwmon.c
> > index 9991c3fa020ac859cbbff29dfb669e53248df885..c5e42e2a03a0c8c68d3f8afbb2bb45b93a58b955 100644
> > --- a/drivers/hwmon/cros_ec_hwmon.c
> > +++ b/drivers/hwmon/cros_ec_hwmon.c
> > @@ -7,6 +7,7 @@
> >  

> > +static int cros_ec_hwmon_read_pwm_value(struct cros_ec_device *cros_ec, u8 index, u8 *pwm_value)
> > +{
> > +	struct ec_params_pwm_get_fan_duty req = {
> > +		.fan_idx = index,
> > +	};
> > +	struct ec_response_pwm_get_fan_duty resp;
> > +	int ret = cros_ec_cmd(cros_ec, 0, EC_CMD_PWM_GET_FAN_DUTY, &req, sizeof(req),
> > +			      &resp, sizeof(resp));
> 
> As mentioned before, please split the variable declaration and the
> assignment.
> 

Oh sorry, because I saw we use `struct cros_ec_hwmon_priv *priv = dev_get_drvdata(dev)`
in the declaration section, I thought it is ok to do so as well for the `ret`.

Will update these assignments in the declaration section.

> >  static int cros_ec_hwmon_read_temp(struct cros_ec_device *cros_ec, u8 index, u8 *temp)
> >  {
> >  	unsigned int offset;
> > @@ -76,6 +114,8 @@ static int cros_ec_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
> >  	struct cros_ec_hwmon_priv *priv = dev_get_drvdata(dev);
> >  	int ret = -EOPNOTSUPP;
> >  	u16 speed;
> > +	u8 control_method;
> > +	u8 pwm_value;
> 
> Ordering.
> 

I thought you are talking about only the u8 variables, or do you mean the
ordering should be applied with different types (and the declarations of
different types are mixed)?

> > @@ -233,6 +359,21 @@ static void cros_ec_hwmon_probe_fans(struct cros_ec_hwmon_priv *priv)
> >  	}
> >  }
> >  
> > +static inline bool is_cros_ec_cmd_fulfilled(struct cros_ec_device *cros_ec,
> > +					    u16 cmd, u8 version)
> > +{
> > +	int ret = cros_ec_get_cmd_versions(cros_ec, cmd);
> > +
> > +	return ret >= 0 && (ret & EC_VER_MASK(version));
> > +}
> > +
> > +static bool cros_ec_hwmon_probe_fan_control_supported(struct cros_ec_device *cros_ec)
> > +{
> > +	return is_cros_ec_cmd_fulfilled(cros_ec, EC_CMD_PWM_GET_FAN_DUTY, 0) &&
> 
> As mentioned before, the hardcoded version constants are used in
> multiple places. They should use a #define instead.
> 

Oh sorry, I thought you are talking about the process of `is_cros_ec_cmd_fulfilled`.
Will make these versions in a #define respectively.

> > +static int cros_ec_hwmon_resume(struct platform_device *pdev)
> > +{
> > +	const struct cros_ec_hwmon_priv *priv = platform_get_drvdata(pdev);
> > +	size_t i;
> > +
> > +	if (!priv->fan_control_supported)
> > +		return 0;
> > +
> > +	/* EC sets fan control to auto after suspended, restore to settings before suspended. */
> > +	for (i = 0; i < EC_FAN_SPEED_ENTRIES; i++) {
> > +		if (!(priv->manual_fans & BIT(i)))
> > +			continue;
> > +
> > +		/*
> > +		 * Setting fan PWM value to EC will change the mode to manual for that fan in EC as
> > +		 * well, so we do not need to issue a separate fan mode to manual call.
> > +		 */
> > +		cros_ec_hwmon_set_fan_pwm_val(priv->cros_ec, i, priv->manual_fan_pwm_values[i]);
> 
> Error handling?
> 

I removed the error checking in the v2 version because after second thought, I
think even if we failed at the i th fan, we should do our best to restore these
fan settings, thus continuing on the (i+1) th fan and so on rather than stop the
process immediately. Is adding a warning log for the failure sufficient?

> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >  static const struct platform_device_id cros_ec_hwmon_id[] = {
> >  	{ DRV_NAME, 0 },
> >  	{}
> > @@ -274,6 +473,8 @@ static const struct platform_device_id cros_ec_hwmon_id[] = {
> >  static struct platform_driver cros_ec_hwmon_driver = {
> >  	.driver.name	= DRV_NAME,
> >  	.probe		= cros_ec_hwmon_probe,
> > +	.suspend	= cros_ec_hwmon_suspend,
> > +	.resume		= cros_ec_hwmon_resume,
> 
> I think these should use pm_ptr() to so the functions can be optimized
> away if !CONFIG_PM.
> 

Got it, and I think we should also set the `priv->fan_control_supported` to
false as well if !CONFIG_PM. Will update in v3.

> >  	.id_table	= cros_ec_hwmon_id,
> >  };
> >  module_platform_driver(cros_ec_hwmon_driver);
> > 
> > -- 
> > 2.49.0.906.g1f30a19c02-goog
> > 
> > 

