Return-Path: <linux-doc+bounces-36717-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F67A2681C
	for <lists+linux-doc@lfdr.de>; Tue,  4 Feb 2025 00:56:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E63CA188613C
	for <lists+linux-doc@lfdr.de>; Mon,  3 Feb 2025 23:57:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28F2E211A07;
	Mon,  3 Feb 2025 23:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="aRTFx9+s"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66CB3211474
	for <linux-doc@vger.kernel.org>; Mon,  3 Feb 2025 23:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738627000; cv=none; b=rd8Fmf0ULW+0vuqvJoAcU6CcUKs/hKPOMR4knvSLR/Udxrpah6GxjcY35gKRanA265S7s2cQaXOlIJ6dMynmlxbOEUeBI7R3svsDwHUqY3oP9Nh/qUN9cc4z7h9q3sSKLHNWI0TozZ10ecknIRFswoXOV/cv7LnECJVCSDNhuEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738627000; c=relaxed/simple;
	bh=6bfY8esdXKtLqUQd1fhPDdkAXXiFdyuuVoqjvQgGpVo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QrxlJXzlLkRwQx1h0hI1tUbpaDIXg4whqYc4zc+vd2G9kMDzEUWV47Dr6VtrJc6gb2gPikTM2d1+tZUF7Ichx7vtJ5T9E5pS8CaDcwVwqtgdjNQ79AsCYu6bqo65SC9KGZ/aFvLhKtlE8KACdC3XO+lg5muBbTWxFlZgoUEtbRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=aRTFx9+s; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3ebb4aae80dso2237201b6e.2
        for <linux-doc@vger.kernel.org>; Mon, 03 Feb 2025 15:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738626995; x=1739231795; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/xu2q60ftFjil+2WyZ+3K18tmew3edKyX9djWiudgYE=;
        b=aRTFx9+s0MjeFRsivw+cyxKArgJ7YwGUJptaF7MmyKdS0vwiHsVUKCJ68pvAgv+4Ne
         XBNeIrqfpzb1hbc6MVQvOlblJ5yLIxrsl5cbbMSI/YcwTEpOUZf3zAPAOeaH6QXMgIHu
         wBdaadknnkF/6eMDA3U6+aJ7eEEKtc6OuBQMebsjqf2Gxql2QoKzmFTU35djxcwWBxn/
         EfJ1Gk3XxKd38MMQbRwepE8NNkLKOoOYKhaYeMXcTihzRrHlwgtjPk6cUMUwTRqPPdCb
         2Fe/c3Belojg2MHZH6fJHrktS/PX2FPebdX/hhfmvdrbk3AetHVnfFvhaSB5pD1U5G9G
         sMxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738626995; x=1739231795;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/xu2q60ftFjil+2WyZ+3K18tmew3edKyX9djWiudgYE=;
        b=mgZy4meCBrPqAcqbgOmOgle4ykULYvzG37F9LkZwo7iBz6EePCt9xv6i1vHViiaYPQ
         YBVAH5aKegqssbuCYO+ba5TwYF5cYobWrDlw7yajVyX8Dn2Mlr6WsJX6WGPDCZ3slSnp
         xPhOE95XVqgR8A1/1ydvgzeBbJNOGttC/AQ4Pov2VOk21MyFblpxZ6viR6Ki76xo5kV5
         /LEzv0xvRB5jJiw6TIdYPn66/waPBs0IJSR4DIKdk8qd0B268KFR5iMn92+IywH3ynjc
         v02pAsTOszy7KQ7X7tGBw7bUx9o1ieIuyURavMEUpZNZftnZsswT5g2hJ+sFTQsfgMby
         Bcgw==
X-Forwarded-Encrypted: i=1; AJvYcCWib/LSfuDonIPEiDsP5JVzRgPN7s0UJWQrfiKYO650Gq0XWzBfyDyM7GzJBxLqqTT6BGpVDOSSxUE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlZjFbkFTXGNdki9vLfLhZC9QdORprUt1dFaM5sgv77nVPHdhJ
	xEzc+Lu5ATF0t9ygTBp6pJK9cF776U5iVpCzBeLT1gXi7wNotqexKdgYVt5dBcg=
X-Gm-Gg: ASbGncvdawZ2LsrRnc+fC5Gkb4kE/tT23ZhfHVGUel68q4k1jgex9+RYE3oKXd/bCDl
	zsZ+dAv4mWGUbbtGXtWVR3ZHbcgUF++nwobfmks07YFxgIK7z8ajYi17j7dplTUnihxcuNlzPxt
	2/HV+I4ikjMIW1mWHn5UV8IvdYvtc+EV38kfsumffFjw4l+DbLjA2/ZfwWjCIzNSRA6ogUHLsSf
	Zujn+IYsgBmUSSW1xjXvZ9uJ2Ef74/E2VR21Xa+EvPDKUwlPAss4+Ix5u90hfwyiPdme6BegMG6
	tfBT20IjHKa1eypwjTCUvYR3DyxuqyR4koCd2lKcAtLD9GnQ+wFH
X-Google-Smtp-Source: AGHT+IHLl4B1e5FWZOT9Bo5mYCa5NQELHRFmSzg8P8PhZmuN4UoXnvrT9yW4CejfgIHVoT9bJuRkBQ==
X-Received: by 2002:a05:6808:308a:b0:3f1:f540:e6db with SMTP id 5614622812f47-3f323a56073mr15363987b6e.17.1738626995299;
        Mon, 03 Feb 2025 15:56:35 -0800 (PST)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5fc104cc33dsm2919764eaf.14.2025.02.03.15.56.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 15:56:33 -0800 (PST)
Message-ID: <3f03b03d-9f41-4683-a284-df48afbee83e@baylibre.com>
Date: Mon, 3 Feb 2025 17:56:32 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] iio: adc: ad7191: add AD7191
To: Alisa-Dariana Roman <alisadariana@gmail.com>,
 "Rob Herring (Arm)" <robh@kernel.org>,
 Alisa-Dariana Roman <alisa.roman@analog.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Ramona Gradinariu <ramona.bolboaca13@gmail.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
Cc: Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
References: <20250203133254.313106-1-alisa.roman@analog.com>
 <20250203133254.313106-3-alisa.roman@analog.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <20250203133254.313106-3-alisa.roman@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/3/25 7:31 AM, Alisa-Dariana Roman wrote:
> AD7191 is a pin-programmable, ultra-low noise 24-bit sigma-delta ADC
> designed for precision bridge sensor measurements. It features two
> differential analog input channels, selectable output rates,
> programmable gain, internal temperature sensor and simultaneous
> 50Hz/60Hz rejection.
> 
> Signed-off-by: Alisa-Dariana Roman <alisa.roman@analog.com>
> ---

...

> +struct ad7191_state {
> +	struct ad_sigma_delta		sd;
> +	struct mutex			lock; /* Protect device state */
> +
> +	struct gpio_descs		*odr_gpios;
> +	struct gpio_descs		*pga_gpios;
> +	struct gpio_desc		*temp_gpio;
> +	struct gpio_desc		*chan_gpio;
> +
> +	u16				int_vref_mv;
> +	u32				scale_avail_gpio[4][2];
> +	u32				scale_avail_pinstrap[1][2];
> +	const u32			(*scale_avail)[2];

This feels a bit reduant to have two arrays and then a pointer to one of those
arrays. We could just have a single static const array of 4 and use that in both
cases. (also see further comments later)

> +	size_t				scale_avail_size;
> +	u32				scale_index;
> +	u32				samp_freq_avail_gpio[4];
> +	u32				samp_freq_avail_pinstrap[1];
> +	const u32			*samp_freq_avail;

ditto

> +	size_t				samp_freq_avail_size;
> +	u32				samp_freq_index;
> +
> +	struct clk			*mclk;
> +};
> +
> +static int ad7191_set_channel(struct ad_sigma_delta *sd, unsigned int address)
> +{
> +	struct ad7191_state *st = ad_sigma_delta_to_ad7191(sd);
> +	u8 temp_gpio_val, chan_gpio_val;
> +
> +	if (!FIELD_FIT(AD7191_CHAN_MASK | AD7191_TEMP_MASK, address))
> +		return -EINVAL;
> +
> +	chan_gpio_val = FIELD_GET(AD7191_CHAN_MASK, address);
> +	temp_gpio_val = FIELD_GET(AD7191_TEMP_MASK, address);
> +
> +	gpiod_set_value(st->chan_gpio, chan_gpio_val);
> +	gpiod_set_value(st->temp_gpio, temp_gpio_val);
> +
> +	return 0;
> +}
> +
...

> +
> +static int ad7191_config_setup(struct iio_dev *indio_dev)
> +{
> +	struct ad7191_state *st = iio_priv(indio_dev);
> +	struct device *dev = &st->sd.spi->dev;
> +	/* Sampling frequencies in Hz, see Table 5 */
> +	const int samp_freq[4] = { 120, 60, 50, 10 };

As per my earlier suggestion, we can make this static const...

> +	/* Gain options, see Table 7 */
> +	const int gain[4] = { 1, 8, 64, 128 };

ditto

> +	int odr_value, odr_index, pga_value, pga_index, i, ret;
> +	u64 scale_uv;
> +
> +	st->samp_freq_index = 0;
> +	st->scale_index = 0;
> +
> +	ret = device_property_read_u32(dev, "adi,odr-value", &odr_value);

Shoud also check if (ret && ret != -EINVAL) first to catch other errors like
someone put a string in the .dts instead of a u32.

> +	if (ret == -EINVAL) {
> +		st->odr_gpios = devm_gpiod_get_array(dev, "odr", GPIOD_OUT_LOW);
> +		if (IS_ERR(st->odr_gpios))
> +			return dev_err_probe(dev, PTR_ERR(st->odr_gpios),
> +					     "Failed to get odr gpios.\n");
> +
> +		for (i = 0; i < ARRAY_SIZE(samp_freq); i++)
> +			st->samp_freq_avail_gpio[i] = samp_freq[i];
> +
> +		st->samp_freq_avail = st->samp_freq_avail_gpio;
> +		st->samp_freq_avail_size = ARRAY_SIZE(st->samp_freq_avail_gpio);

...then here instead of copying...

		st->samp_freq_avail = samp_freq;
		st->samp_freq_avail_size = ARRAY_SIZE(samp_freq);

> +	} else {
> +		for (i = 0; i < ARRAY_SIZE(samp_freq); i++) {
> +			if (odr_value != samp_freq[i])
> +				continue;
> +			odr_index = i;

missing break;?

Also, should we error if match not found? Otherwise we could have uninitalized
odr_index;

> +		}
> +
> +		st->samp_freq_avail_pinstrap[0] = samp_freq[odr_index];
> +
> +		st->samp_freq_avail = st->samp_freq_avail_pinstrap;
> +		st->samp_freq_avail_size = ARRAY_SIZE(st->samp_freq_avail_pinstrap);
> +

and here...

		st->samp_freq_avail = &samp_freq[odr_index];
		st->samp_freq_avail_size = 1;

> +		st->odr_gpios = NULL;
> +	}
> +
> +	ret = device_property_read_u32(dev, "adi,pga-value", &pga_value);

ditto about error checking

> +	if (ret == -EINVAL) {
> +		st->pga_gpios = devm_gpiod_get_array(dev, "pga", GPIOD_OUT_LOW);
> +		if (IS_ERR(st->pga_gpios))
> +			return dev_err_probe(dev, PTR_ERR(st->pga_gpios),
> +					     "Failed to get pga gpios.\n");
> +
> +		for (i = 0; i < ARRAY_SIZE(st->scale_avail_gpio); i++) {
> +			scale_uv = ((u64)st->int_vref_mv * NANO) >>
> +				(indio_dev->channels[0].scan_type.realbits - 1);
> +			do_div(scale_uv, gain[i]);
> +			st->scale_avail_gpio[i][1] = do_div(scale_uv, NANO);
> +			st->scale_avail_gpio[i][0] = scale_uv;
> +		}
> +
> +		st->scale_avail = st->scale_avail_gpio;
> +		st->scale_avail_size = ARRAY_SIZE(st->scale_avail_gpio);
> +	} else {
> +		for (i = 0; i < ARRAY_SIZE(gain); i++) {
> +			if (pga_value != gain[i])
> +				continue;
> +			pga_index = i;
> +		}
> +
> +		scale_uv = ((u64)st->int_vref_mv * NANO) >>
> +			(indio_dev->channels[0].scan_type.realbits - 1);
> +		do_div(scale_uv, gain[pga_index]);
> +		st->scale_avail_pinstrap[0][1] = do_div(scale_uv, NANO);
> +		st->scale_avail_pinstrap[0][0] = scale_uv;
> +
> +		st->scale_avail = st->scale_avail_pinstrap;
> +		st->scale_avail_size = ARRAY_SIZE(st->scale_avail_pinstrap);
> +
> +		st->pga_gpios = NULL;
> +	}

and ditto about st->scale_avail and pinstrap matching for loop

> +
> +	st->temp_gpio = devm_gpiod_get(dev, "temp", GPIOD_OUT_LOW);
> +	if (IS_ERR(st->temp_gpio))
> +		return dev_err_probe(dev, PTR_ERR(st->temp_gpio),
> +				     "Failed to get temp gpio.\n");
> +
> +	st->chan_gpio = devm_gpiod_get(dev, "chan", GPIOD_OUT_LOW);
> +	if (IS_ERR(st->chan_gpio))
> +		return dev_err_probe(dev, PTR_ERR(st->chan_gpio),
> +				     "Failed to get chan gpio.\n");
> +
> +	return 0;
> +}
> +

...

> +
> +static int ad7191_set_gain(struct ad7191_state *st, int gain_index)
> +{
> +	unsigned long value = gain_index;
> +
> +	st->scale_index = gain_index;
> +
> +	return gpiod_set_array_value_cansleep(st->pga_gpios->ndescs,
> +					      st->pga_gpios->desc,
> +					      st->pga_gpios->info, &value);
> +}

Depending on timing, we might be able to take advantage of [1].

But it isn't merged yet and needs another revision and you are very fast, so
don't wait on it. ;-)

[1]: https://lore.kernel.org/linux-iio/20250131-gpio-set-array-helper-v1-0-991c8ccb4d6e@baylibre.com/


> +
> +static const struct iio_chan_spec ad7191_channels[] = {
> +	{
> +		.type = IIO_TEMP,
> +		.address = AD7191_CH_TEMP,
> +		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW) |
> +				      BIT(IIO_CHAN_INFO_OFFSET),
> +		.info_mask_shared_by_all = BIT(IIO_CHAN_INFO_SAMP_FREQ),
> +		.info_mask_shared_by_all_available = BIT(IIO_CHAN_INFO_SAMP_FREQ),

Should this one be info_mask_separate?

Since this is a multiplexed ADC and not simelutaneous sampling, I would expect
that if the ORD pins are set to 10Hz (0.1s period), then a buffered read with
all channels enabled would take 0.3s to do the 3 samples (effective sample rate
of 3.33Hz), but if only one channel was enabled in the buffer, then it only
takes 0.1s to do all of the samples (effective sample rate is 10Hz).

The iio convention is to use info_mask_separate for the sampling_frequency
attribute to indicate that the rate only applies to each individual channel
and not the combined rate to do one "set" of samples for all enabled channels.

A sampling_frequency attribute that was shared_by_all would mean that on each
period equivlent to this rate, all samples are read no matter how many channels
were enabled for a buffered read.

> +		.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE),
> +		.scan_type = {
> +			.sign = 'u',
> +			.realbits = 24,
> +			.storagebits = 32,
> +			.endianness = IIO_BE,
> +		},
> +	},



