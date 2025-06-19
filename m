Return-Path: <linux-doc+bounces-49709-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7E9ADFEB9
	for <lists+linux-doc@lfdr.de>; Thu, 19 Jun 2025 09:31:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 80CD618953DC
	for <lists+linux-doc@lfdr.de>; Thu, 19 Jun 2025 07:32:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B7DD22FE06;
	Thu, 19 Jun 2025 07:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WrsIaStf"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00AC31624FE
	for <linux-doc@vger.kernel.org>; Thu, 19 Jun 2025 07:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750318306; cv=none; b=tUzH1ISrIfySOOYouwnxe0Iba7XzkcKFhTdzT0ahCBCDBA4PIqVZrsuN+yyeovfjvCotKy7dGbr0apBqEBlu7fJp8RCtffMITS2VSNuzZtiTPWO6a9T7kAP+BA9DArXxxbtmNx7wdBuJ/J4myFKbjxvn6u0shjUtM6SCBQEUCkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750318306; c=relaxed/simple;
	bh=h/xAbTgqwuDuCs07xJgrDe0Zl4dSSM0gNNwMrlIxM4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lhoEGiZ+tBLXSW6zAImCzPVGdHD4SKo3u1WvFSWtO/FM3RzvKrxpoMWhXwK+6Bee42AaSig+uAKJDbXBP0j8qGrrKZI/eqyelqVjjtN7sMhQCxKxnxg0fpF9amXhfXrByzBI4asYE2Agfy9DRYLs1r0bLtaLUea5wrDYdAI1QZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WrsIaStf; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-748c3afd0dbso281976b3a.0
        for <linux-doc@vger.kernel.org>; Thu, 19 Jun 2025 00:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750318304; x=1750923104; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/6HEeVYXpXU6RreyOy7zn5CfwVrX4q21JdmfX9O+7vE=;
        b=WrsIaStflcS+BtjUi9gmFHObJuC5gl/OyoV0Lkw36FfPIqBHv5PEuCmMZ9Mpz586+9
         5ipUOPYEaqxkOuxVxqCtpnck27Ow0XjiJElcwSYBDpbMNCd89NAYSI3ojtOGqYeKqmeD
         pWadNSYYwoCVk5C4Nzcf8AIoE7lji+/PslNiU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750318304; x=1750923104;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/6HEeVYXpXU6RreyOy7zn5CfwVrX4q21JdmfX9O+7vE=;
        b=Sl0nbPyvu7ZwMVh+iXc27agtha74nWgD3t6E0txKwc6RM9DibdKT7o1Rwm3lK7YIs7
         allXBWE4GgXeaeeXh/kuYxJs/pIAUcwIRa9q3c36z19hP2rWCwFjFoZWCjGtX3cNH59h
         cdaLzsblL+nCwb+az8MDgigZ0CdMVsbgyHpZQkrK5/5zpu8pUS0IR77k6539E2HnBEqO
         FSEt1BctQASqa3Vl0F1qZ3oCDF86+nLtGdJL8BDdPgAgLqGthHkszn4vVyZ7wnN0kD+f
         6+qFCtQGAWen8BSZ0ITm/GoFsP0x4HR5zz2mXsSQMQEcNVkkxLIleuO/2W/BVhpT03eX
         mf2Q==
X-Forwarded-Encrypted: i=1; AJvYcCX6dMp7RVA5LhMaqi7P8kROODaM5ZRAZWBqoyyKbQxTtVSCjrmZV4Ket2/58NiEUo9NLe668EHd7Qw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt4vOKThKZSFz07g4+YSq8bL8UexmNbQypN+2yNwH+nQGHDO3M
	ynZQ/ykZnVwEusUpo0qYr4UYz3kVzsnQgAr3BSPxib9CVaxwDsQhBPaPnkpFwjKmcw==
X-Gm-Gg: ASbGnctwZBecTHwlX5NG4IzBiAyRqTzUEEyafi5c1bkSbK8KilXU5wuaOf6WcE8wtEf
	r3v9u12wGGJ8T8dOhQYZlSwfhAJGdfRNUCAGHvrZikPjrbxKZL8as7NADXiy21/yuDl2D7/wXqC
	kptFVTOBQ8F5qoksSdFXb3lcuEb+6f6FRrdYjwcjVI68hqspwmDgzXIfDhU2PVyiobaMNeSmeUg
	Ua0SMReU96x3LYl06opIKkcygiD4m3/H0oL2xwry8O+iw9W/+mXGfQqmyHDNaRWdVyUvrGUlVdI
	7Opl+YmTCXDfHXycVxIWzTrWuLrEdBn7m3Qud7gj26+CJAIOhto/7ZI+
X-Google-Smtp-Source: AGHT+IF0ZYZgWeMtdv/hdPMG5U98Dqrg1Jl+7X1ZOlhA9cR0wv8e8vSVU5qxSXVj3uoB4yRwTNll9A==
X-Received: by 2002:a05:6a21:6d8c:b0:21f:53a9:b72c with SMTP id adf61e73a8af0-21fbd5d4e88mr30033304637.38.1750318304219;
        Thu, 19 Jun 2025 00:31:44 -0700 (PDT)
Received: from google.com ([2401:fa00:1:10:ccaf:647f:8bd4:277f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fe168d7ecsm12385185a12.64.2025.06.19.00.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 00:31:43 -0700 (PDT)
Date: Thu, 19 Jun 2025 15:31:39 +0800
From: Sung-Chi Li <lschyi@chromium.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>, chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 3/3] hwmon: (cros_ec) register fans into thermal
 framework cooling devices
Message-ID: <aFO82_5riDyC0FMs@google.com>
References: <20250512-cros_ec_fan-v3-0-a9f2b255f0cd@chromium.org>
 <20250512-cros_ec_fan-v3-3-a9f2b255f0cd@chromium.org>
 <7309c804-19e3-4715-b8c9-efa31c8ea9e1@t-8ch.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7309c804-19e3-4715-b8c9-efa31c8ea9e1@t-8ch.de>

On Mon, May 12, 2025 at 09:35:47AM +0200, Thomas Wei�schuh wrote:
> On 2025-05-12 15:11:57+0800, Sung-Chi Li via B4 Relay wrote:
> > +	if (!IS_ENABLED(CONFIG_THERMAL))
> > +		return;
> > +
> > +	if (!priv->fan_control_supported)
> > +		return;
> > +
> > +	for (i = 0; i < EC_FAN_SPEED_ENTRIES; i++) {
> > +		if (!(priv->usable_fans & BIT(i)))
> > +			continue;
> > +
> > +		cpriv = devm_kzalloc(dev, sizeof(*cpriv), GFP_KERNEL);
> > +		if (!cpriv)
> > +			return;
> 
> The failures are swallowed silently. They should be propagated.
> 

After rethinking  about the logic, I think I should try and register all fans
with best effort, so I should not return immediately; instead, I will log an
warning log, and continue with the next fan.

> > +
> > +		type = devm_kasprintf(dev, GFP_KERNEL, "%s-fan%zu", dev_name(dev), i);
> > +		if (!type)
> > +			return;
> > +
> > +		cpriv->hwmon_priv = priv;
> > +		cpriv->index = i;
> > +		cdev = devm_thermal_of_cooling_device_register(dev, NULL, type, cpriv,
> > +							       &cros_ec_thermal_cooling_ops);
> > +		if (!cdev)
> 
> ..._cooling_device_register() returns an error pointer on failure, not NULL.
> 

Thank you, will use IS_ERR for checking and %pe to print error.

> > +			return;
> > +	}
> > +}
> > +
> >  static int cros_ec_hwmon_probe(struct platform_device *pdev)
> >  {
> >  	struct device *dev = &pdev->dev;
> > @@ -412,6 +489,7 @@ static int cros_ec_hwmon_probe(struct platform_device *pdev)
> >  	cros_ec_hwmon_probe_temp_sensors(dev, priv, thermal_version);
> >  	cros_ec_hwmon_probe_fans(priv);
> >  	priv->fan_control_supported = cros_ec_hwmon_probe_fan_control_supported(priv->cros_ec);
> > +	cros_ec_hwmon_register_fan_cooling_devices(dev, priv);
> >  
> >  	hwmon_dev = devm_hwmon_device_register_with_info(dev, "cros_ec", priv,
> >  							 &cros_ec_hwmon_chip_info, NULL);
> > 
> > -- 
> > 2.49.0.1015.ga840276032-goog
> > 
> > 

