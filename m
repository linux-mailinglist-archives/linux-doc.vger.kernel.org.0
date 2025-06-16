Return-Path: <linux-doc+bounces-49261-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 59AECADB47A
	for <lists+linux-doc@lfdr.de>; Mon, 16 Jun 2025 16:55:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 76FF31886073
	for <lists+linux-doc@lfdr.de>; Mon, 16 Jun 2025 14:55:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBD61202F71;
	Mon, 16 Jun 2025 14:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Jln1o/IM"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8CDE1A7253
	for <linux-doc@vger.kernel.org>; Mon, 16 Jun 2025 14:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750085698; cv=none; b=pexUA72DfLe06kRiBiuvtB7wozEZrSpNO7QttZ6exGEHEk7VF+QLv3WaVKwGghC7Un1N27gRd6CV76Ovwv6naT1bnRGXWju3RV0y3M4xzLum295k8dmh6M75Cwd0JCqeokRr7xZmvwCXD7/Tq4qNYEK6wYCgweeQTymTB3006Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750085698; c=relaxed/simple;
	bh=5Nm9CImpLsi7qFyQR0yZH/U+R7I2IFhkj7QErWfdJPI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lz1E83LbIeYa04KE6/pZUxOhlBCkWPp4aZBU4pM8cVch/szAtBSeI+e5ozm+tkMqrj0MqP7S3c7zy4xaxU6gwCB5CRt3MSWUemRH2mqHLWgrmfQ+0MMRp9wPd42KmpOKuoMsImDLqH3IvHMsv86NNuLiwfi/SWNnt5gVYU8+u1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Jln1o/IM; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-60b8a9be972so1003531eaf.1
        for <linux-doc@vger.kernel.org>; Mon, 16 Jun 2025 07:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750085696; x=1750690496; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IbjUWaweNAfTcsTb0I52VudEVmpioqIEWXQ0+qpwB9M=;
        b=Jln1o/IM8EYQe6Q/oeLM+Yd1u2bSCN7beyDqfSc0HuMJX549XViJLi06lrYzFzzxNM
         s5IbJ5FPnlpB+p70CGAoAs+Xz+uRBCmc+44XoZCgtaf4Ib4ZS/uSdAgAoRetWVIyaukM
         Ngu7HbkCEGlA6lS9EqggoujD2Rmlt0oAUlWSPnP4CVnKKmA3T5B+uV/FkF4l34QgBeVQ
         KC8EqMFC3beZda1atraoGlvVcp9bn7G+WE25aMdEGSp3kDsG0cXdtlMX+4XGGiBzIgk7
         1ETrtjvsoFLmKpo5pAM9hyNoO59zrbVMHCNKyP+CgnRkbkU6WQCngO1KKogjFdB3Pr+r
         UxaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750085696; x=1750690496;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IbjUWaweNAfTcsTb0I52VudEVmpioqIEWXQ0+qpwB9M=;
        b=RwIvBRbgxvQmg2az3q0Rip3Ap6aGWwrSljS+ubRXqVrB7xCKy4AWrDJPV/zucFQ9Qm
         4Q/+RVsS8t7QyrvmaPkvXWuN+wMNxvfQn12Er0qkNyg0HhoV4YDDFd2ROL7p5qUspnEJ
         QFXTZAYpvXVuCqstyzjtTe2rI5kws/oBhbpb7GyH7W5zjvcAvbMPjtPQVzmkRxruTAKM
         tF9ezbZWJputKMh99xMV5slVEnOmSL/4nREp4frhrISYNl4ilRvK3csl6CFwvcGB15MY
         8GrySentPY3yOxsiBafNsYld7Iow6f6h3O6HVwT24IsSe7ADtM6DPeF32qmWsZHi3I4/
         TdtA==
X-Forwarded-Encrypted: i=1; AJvYcCU6uPxkEisUhuovNCTZd9K4SPjuCqr2Z2COUJxq6VEY5SZ6HNtXpZrbpWe1JIMXQNlGx6qi1wBhyv8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMDopPSNLPjDgNGpR0LCzVaOBvCVCVIROIpv3307M1KaHThxML
	4tKTJSs04S2RdEG41xKhaHaih+h2KHDMHUcyaS5N7QCtlC3mT0z/Znjfm2ehHBlxizE=
X-Gm-Gg: ASbGncvZdeDQD8B/2HsWWaK/xrSC8d2iaLmPfJgYKM37mzK6Hi/bAbmiiTpJzWPGLFM
	UJ02A/oqc0cbWrWdrzStwmgIRTJsRkQMFRGPMU3Kkeke000GcgvCTVuqX2l/fr+/68uUJ/BHlFS
	IuYsOEKxQxFCLLNZMCAWyfsMYcahiu9/yrPW8oZ/eQlnRTEUNKSF8uXF6UF78/R/OGkTHYL19AT
	NH9jOd5Zt9SG5bl4ZrSRYchRXV6RzQd9SqSs30JFRkub5FjD5Y8PV/CDcJKT1z+jVdoP5uvhwoq
	lKdDkWVyEDBP+C1WLh9Rd3pvRxDum0LFrbydf3xsV01VrlWLESDPs1i1OpmpQYyGdT4iavglo6V
	lYFG7q0sGWpXp3kBo90pzJTtvGBRfQJQDIioLAvc=
X-Google-Smtp-Source: AGHT+IG/zyPyHx6md2qlWK0JseESq5/UwM8f1EqlrlgEOHuHiIJkuH+hr0ysstl4fbKuuVmWS7NVVw==
X-Received: by 2002:a05:6820:627:b0:610:fa7d:9a14 with SMTP id 006d021491bc7-61110e6582emr5134060eaf.2.1750085695706;
        Mon, 16 Jun 2025 07:54:55 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:9583:1e37:58ed:10ae? ([2600:8803:e7e4:1d00:9583:1e37:58ed:10ae])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-61108ebd14fsm905901eaf.22.2025.06.16.07.54.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 07:54:54 -0700 (PDT)
Message-ID: <c89f4b2f-0892-4f63-b9b4-5ae55b477c01@baylibre.com>
Date: Mon, 16 Jun 2025 09:54:52 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/8] iio: adc: Add support for ad4052
To: Jonathan Cameron <jic23@kernel.org>,
 Jorge Marques <jorge.marques@analog.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <ukleinek@kernel.org>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-pwm@vger.kernel.org
References: <20250610-iio-driver-ad4052-v3-0-cf1e44c516d4@analog.com>
 <20250610-iio-driver-ad4052-v3-4-cf1e44c516d4@analog.com>
 <20250614110812.39af2c41@jic23-huawei>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250614110812.39af2c41@jic23-huawei>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/14/25 5:08 AM, Jonathan Cameron wrote:
> On Tue, 10 Jun 2025 09:34:37 +0200
> Jorge Marques <jorge.marques@analog.com> wrote:
> 
>> The AD4052/AD4058/AD4050/AD4056 are versatile, 16-bit/12-bit, successive
>> approximation register (SAR) analog-to-digital converter (ADC) that
>> enables low-power, high-density data acquisition solutions without
>> sacrificing precision. This ADC offers a unique balance of performance
>> and power efficiency, plus innovative features for seamlessly switching
>> between high-resolution and low-power modes tailored to the immediate
>> needs of the system. The AD4052/AD4058/AD4050/AD4056 are ideal for
>> battery-powered, compact data acquisition and edge sensing applications.
>>

...

>> +static int ad4052_update_xfer_raw(struct iio_dev *indio_dev,
>> +				   struct iio_chan_spec const *chan)
>> +{
>> +	struct ad4052_state *st = iio_priv(indio_dev);
>> +	const struct iio_scan_type *scan_type;
>> +	struct spi_transfer *xfer = &st->xfer;
>> +
>> +	scan_type = iio_get_current_scan_type(indio_dev, chan);
>> +	if (IS_ERR(scan_type))
>> +		return PTR_ERR(scan_type);
>> +
>> +	xfer->rx_buf = st->raw;
>> +	xfer->bits_per_word = scan_type->realbits;
>> +	xfer->len = scan_type->realbits == 24 ? 4 : 2;
> 
> This is a little odd. I'm not sure what happens with len not dividing
> into a whole number of bits per word chunks.
> Maybe a comment?

Even better, there is now spi_bpw_to_bytes() for this.

> 
>> +	xfer->speed_hz = AD4052_SPI_MAX_ADC_XFER_SPEED(st->vio_uv);
>> +
>> +	return 0;
>> +}
> 
> 

...

> 
>> +static int __ad4052_read_chan_raw(struct ad4052_state *st, int *val)
>> +{
>> +	struct spi_device *spi = st->spi;
>> +	struct spi_transfer t_cnv = {};
>> +	int ret;
>> +
>> +	reinit_completion(&st->completion);
>> +
>> +	if (st->cnv_gp) {
>> +		gpiod_set_value_cansleep(st->cnv_gp, 1);
>> +		gpiod_set_value_cansleep(st->cnv_gp, 0);
>> +	} else {
>> +		ret = spi_sync_transfer(spi, &t_cnv, 1);
> 
> Add a comment for this.   I can't immediately spot documentation on what
> a content free transfer actually does.  I assume pulses the chip select?
> is that true for all SPI controllers?

Should be. Setting .delay in the xfer would also make it more
clear that this is doing.

> 
>> +		if (ret)
>> +			return ret;
>> +	}
>> +	/*
>> +	 * Single sample read should be used only for oversampling and
>> +	 * sampling frequency pairs that take less than 1 sec.
>> +	 */
>> +	if (st->gp1_irq) {
>> +		ret = wait_for_completion_timeout(&st->completion,
>> +						  msecs_to_jiffies(1000));
>> +		if (!ret)
>> +			return -ETIMEDOUT;
>> +	}
>> +
>> +	ret = spi_sync_transfer(spi, &st->xfer, 1);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (st->xfer.len == 2)
>> +		*val = sign_extend32(*(u16 *)(st->raw), 15);
>> +	else
>> +		*val = sign_extend32(*(u32 *)(st->raw), 23);
>> +
>> +	return ret;
>> +}
> 

...

>> +
>> +static int ad4052_debugfs_reg_access(struct iio_dev *indio_dev, unsigned int reg,
>> +				     unsigned int writeval, unsigned int *readval)
>> +{
>> +	struct ad4052_state *st = iio_priv(indio_dev);
>> +	int ret;
>> +
>> +	if (!iio_device_claim_direct(indio_dev))
> 
> For these guards in the debugfs callback, please add a comment on why they
> are needed.   We've had a lot of questions about these recently and I'd
> like it to be clear to people when they should cut and paste these and when
> not.

The reason I started doing this is that running the iio_info command attemps
to read register 0x00 via the debug attribute of every single iio device. So
if you run iio_info during a buffered read, and 0x00 is a valid register, it
would break things without this check.

Ideally, general purpose commands wouldn't be poking debug registers, but
that isn't the case. But I suppose we could "fix" iio_info instead.

> 
>> +		return -EBUSY;
>> +
>> +	if (readval)
>> +		ret = regmap_read(st->regmap, reg, readval);
>> +	else
>> +		ret = regmap_write(st->regmap, reg, writeval);
>> +	iio_device_release_direct(indio_dev);
>> +	return ret;
>> +}
> 

