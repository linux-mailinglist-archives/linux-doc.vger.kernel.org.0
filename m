Return-Path: <linux-doc+bounces-49983-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 48068AE2A36
	for <lists+linux-doc@lfdr.de>; Sat, 21 Jun 2025 18:14:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9649A1897754
	for <lists+linux-doc@lfdr.de>; Sat, 21 Jun 2025 16:14:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C528E2144C7;
	Sat, 21 Jun 2025 16:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="G84h/CKe"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2D3DDC1
	for <linux-doc@vger.kernel.org>; Sat, 21 Jun 2025 16:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750522443; cv=none; b=nSUljV6QLP6UCtlVsU9HbcDFIL2zqp453TfUolx2tv7rXndB5h0imTAsh5PKorj+MAQr0/51+DiicyWWPIaVt7YTn6RhkO2+UuELUaT0WvPJc/ZD4xaaWoNQ0/B/MGTWmYDrQ84wa4i6RDU2A8XjIkQyaBlMQBYiw6w1zxZQt/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750522443; c=relaxed/simple;
	bh=7KETfxjlg0pGuyV51WVOVQECN4r6h5PnhiexqQCqFAQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lLdXRLen8f7p2W2ipgmWz/1mUqm+cx3Yz8zcIaUYyJa460az35IlbZw3niRtRs5bnQZ7bW8aiVnORY3cAEc15rRqv1RB1fedqI4mI66mBInjNnF0nh3BC2glqT1X505T3zNg1PztsTv6FNBzbhNmT58ONJINH0jpJz1neeHpibA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=G84h/CKe; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-735a8be4ea9so758697a34.0
        for <linux-doc@vger.kernel.org>; Sat, 21 Jun 2025 09:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750522439; x=1751127239; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1c2cbkU1wZoIdfpzAdgfxtU2KV8DurFLaLMSXOBqGOs=;
        b=G84h/CKekYoZgmapo3CRkvIKdkm/lpLvmCqLHOZg4iv43TwwsrOi8Jj69WDdfJrbsm
         PgS20TeiflRTFdvXxO9JF05u+Lvg6lrpgCjRh6xnICy+rX7y+WsVq2qS+IpDLg1o6ovT
         w6Xoug5U9FjvLP9SmNYy2+xE7AqfI9Yq6PoVUtmn60Cy9nBHzydPlgjDXvdJ7eQBquPf
         0zzMN+oPoi3PjWQ/F6BXm1lzt6NnFQnjbb4YbHp4D/9a/MhLzPXZwgTZ7CtFu/nHf4QA
         Fj3ompr3JSGllhWKsKdXCKr87tSZBfAxun/kB2sSXT2F3BJAXUvzOLsvDbBCSst4ALZl
         Rktg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750522439; x=1751127239;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1c2cbkU1wZoIdfpzAdgfxtU2KV8DurFLaLMSXOBqGOs=;
        b=WkH5MpVbzfBmjb4RVX3Df4YOw60RePuvWy35X3vslNTUVssKPB+i7Kkh0bv60y6IUg
         cMxgI4LjxyHB8gUfbGyuc1nJST/Npo8f2+SGGzfP6Qf7rnred/37qmNmz7k0PuP6yXeq
         u40OYTieu2tnjn49jvG03B7TKPXCD82dhSYF1hYMpuH4EOb5sEcD8ZF89pM/gKbk6Y58
         RpVxwWzYfc81mhlA0VEQMFvU7bJo0woIasCPCvzqNxOXLOcWWYDDJZTpUjAuz9zXoR5+
         A1ANX3G7cqpv/K6y2Ucemb1qa6EnAyY/YC/rD8xJ89DrqQHkK6U682zsQv9eJe69Mv+O
         iXkA==
X-Forwarded-Encrypted: i=1; AJvYcCWf03mr+fUuGwTjQ0XGXZzg2j7AhYLFPUesX+vNNBCEOmDzzzNLRod+9UBtsKRtSFCRsPdDoyMrdjY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxMVMYhUdu910plrmkH+rQV4jWqCkMjGTkzKBkcZV8LZeVUKCy
	YvNky3J0mWqgZxfnXEj9x/b/VvBledf6F/2isqHjYJy4x0vKIlyc7ee8hWEeea7tsYE=
X-Gm-Gg: ASbGncuiPY0pNglu3dV1OTrXPJub1oxUPsZWqf/KIrL1xZ6wTMoMgbSg67lZ/BYoSsW
	BfpPvBKkGZUOaFaNxo03WKLTWiOGCcrOJloc48lH+Hkp46GQeFqT5aJtIJZZnSmoYm6/d2pDbCI
	PCdlUlU8VffjJKDzBEAiRJZ2uW9kLEpTFcwFvq62ZQXcqaOXbtoAogTjbRTmtBh0k7gtflFYQxi
	IJW9NlI5tIJ+REt7Qsjq4ahlQ+T/7sVvq06+QhHLgKRVldeK1FtlnxM8uNWh3tleiNzQuj5BmsG
	knFhUvAaw2xbmsJv7fWCq4xkUx7pptkVBGH3tXzJAfxXyr6WztCxFYMdnQbR3LOoWVyMli0ToB3
	urT6ML8zk20nylst7xI4nQsWme5uUgMFc+sO3Qno=
X-Google-Smtp-Source: AGHT+IHAHVI/5jewwBreOz61eV1cBDMXqhILqfvwJv3mMLaxfzIcU10SwgKu2rBdDnGCClYU4WvTxA==
X-Received: by 2002:a05:6870:5687:b0:2e8:7505:638e with SMTP id 586e51a60fabf-2eeee8902c7mr4345202fac.39.1750522439397;
        Sat, 21 Jun 2025 09:13:59 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:5a14:cde7:1a11:c454? ([2600:8803:e7e4:1d00:5a14:cde7:1a11:c454])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73a908bc982sm762718a34.0.2025.06.21.09.13.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Jun 2025 09:13:58 -0700 (PDT)
Message-ID: <0e8bd9ff-ae2e-486b-8beb-c14d7909cb7c@baylibre.com>
Date: Sat, 21 Jun 2025 11:13:58 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/8] iio: adc: Add support for ad4052
To: Jonathan Cameron <jic23@kernel.org>
Cc: Jorge Marques <jorge.marques@analog.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
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
 <c89f4b2f-0892-4f63-b9b4-5ae55b477c01@baylibre.com>
 <20250621170824.249c6b0c@jic23-huawei>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250621170824.249c6b0c@jic23-huawei>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/21/25 11:08 AM, Jonathan Cameron wrote:
> On Mon, 16 Jun 2025 09:54:52 -0500
> David Lechner <dlechner@baylibre.com> wrote:
> 
>> On 6/14/25 5:08 AM, Jonathan Cameron wrote:
>>> On Tue, 10 Jun 2025 09:34:37 +0200
>>> Jorge Marques <jorge.marques@analog.com> wrote:
>>>   
>>>> The AD4052/AD4058/AD4050/AD4056 are versatile, 16-bit/12-bit, successive
>>>> approximation register (SAR) analog-to-digital converter (ADC) that
>>>> enables low-power, high-density data acquisition solutions without
>>>> sacrificing precision. This ADC offers a unique balance of performance
>>>> and power efficiency, plus innovative features for seamlessly switching
>>>> between high-resolution and low-power modes tailored to the immediate
>>>> needs of the system. The AD4052/AD4058/AD4050/AD4056 are ideal for
>>>> battery-powered, compact data acquisition and edge sensing applications.
>>>>  
>>
>> ...
>>
>>>> +static int ad4052_update_xfer_raw(struct iio_dev *indio_dev,
>>>> +				   struct iio_chan_spec const *chan)
>>>> +{
>>>> +	struct ad4052_state *st = iio_priv(indio_dev);
>>>> +	const struct iio_scan_type *scan_type;
>>>> +	struct spi_transfer *xfer = &st->xfer;
>>>> +
>>>> +	scan_type = iio_get_current_scan_type(indio_dev, chan);
>>>> +	if (IS_ERR(scan_type))
>>>> +		return PTR_ERR(scan_type);
>>>> +
>>>> +	xfer->rx_buf = st->raw;
>>>> +	xfer->bits_per_word = scan_type->realbits;
>>>> +	xfer->len = scan_type->realbits == 24 ? 4 : 2;  
>>>
>>> This is a little odd. I'm not sure what happens with len not dividing
>>> into a whole number of bits per word chunks.
>>> Maybe a comment?  
>>
>> Even better, there is now spi_bpw_to_bytes() for this.
>>
>>>   
>>>> +	xfer->speed_hz = AD4052_SPI_MAX_ADC_XFER_SPEED(st->vio_uv);
>>>> +
>>>> +	return 0;
>>>> +}  
>>>
>>>   
>>
>> ...
>>
>>>   
>>>> +static int __ad4052_read_chan_raw(struct ad4052_state *st, int *val)
>>>> +{
>>>> +	struct spi_device *spi = st->spi;
>>>> +	struct spi_transfer t_cnv = {};
>>>> +	int ret;
>>>> +
>>>> +	reinit_completion(&st->completion);
>>>> +
>>>> +	if (st->cnv_gp) {
>>>> +		gpiod_set_value_cansleep(st->cnv_gp, 1);
>>>> +		gpiod_set_value_cansleep(st->cnv_gp, 0);
>>>> +	} else {
>>>> +		ret = spi_sync_transfer(spi, &t_cnv, 1);  
>>>
>>> Add a comment for this.   I can't immediately spot documentation on what
>>> a content free transfer actually does.  I assume pulses the chip select?
>>> is that true for all SPI controllers?  
>>
>> Should be. Setting .delay in the xfer would also make it more
>> clear that this is doing.
>>
>>>   
>>>> +		if (ret)
>>>> +			return ret;
>>>> +	}
>>>> +	/*
>>>> +	 * Single sample read should be used only for oversampling and
>>>> +	 * sampling frequency pairs that take less than 1 sec.
>>>> +	 */
>>>> +	if (st->gp1_irq) {
>>>> +		ret = wait_for_completion_timeout(&st->completion,
>>>> +						  msecs_to_jiffies(1000));
>>>> +		if (!ret)
>>>> +			return -ETIMEDOUT;
>>>> +	}
>>>> +
>>>> +	ret = spi_sync_transfer(spi, &st->xfer, 1);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	if (st->xfer.len == 2)
>>>> +		*val = sign_extend32(*(u16 *)(st->raw), 15);
>>>> +	else
>>>> +		*val = sign_extend32(*(u32 *)(st->raw), 23);
>>>> +
>>>> +	return ret;
>>>> +}  
>>>   
>>
>> ...
>>
>>>> +
>>>> +static int ad4052_debugfs_reg_access(struct iio_dev *indio_dev, unsigned int reg,
>>>> +				     unsigned int writeval, unsigned int *readval)
>>>> +{
>>>> +	struct ad4052_state *st = iio_priv(indio_dev);
>>>> +	int ret;
>>>> +
>>>> +	if (!iio_device_claim_direct(indio_dev))  
>>>
>>> For these guards in the debugfs callback, please add a comment on why they
>>> are needed.   We've had a lot of questions about these recently and I'd
>>> like it to be clear to people when they should cut and paste these and when
>>> not.  
>>
>> The reason I started doing this is that running the iio_info command attemps
>> to read register 0x00 via the debug attribute of every single iio device. So
>> if you run iio_info during a buffered read, and 0x00 is a valid register, it
>> would break things without this check.
>>
>> Ideally, general purpose commands wouldn't be poking debug registers, but
>> that isn't the case. But I suppose we could "fix" iio_info instead.
>>
> 
> Please do fix iio_info.  It absolutely should not be poking the debug interfaces
> except on specific debug calls.  The user has to know they may be shooting themselves
> in the foot.
> 
> I'm not sure why a read of that register would break buffered capture though.
> Is it a volatile register or is there a sequencing problem with multiple
> accesses in this driver?  If it is multiple accesses then that should be
> prevented via a local lock, not whether we are in buffer mode or not.

IIRC, this was particularly a problem on chips that have a separate data
capture mode and reading a register exits data capture mode.

> 
> So I'm fine with this defense where it is necessary for all register
> accesses, but I would like to see comments on why it is necessary.
> 
> Jonathan
> 
>>>   
>>>> +		return -EBUSY;
>>>> +
>>>> +	if (readval)
>>>> +		ret = regmap_read(st->regmap, reg, readval);
>>>> +	else
>>>> +		ret = regmap_write(st->regmap, reg, writeval);
>>>> +	iio_device_release_direct(indio_dev);
>>>> +	return ret;
>>>> +}  
>>>   
> 


