Return-Path: <linux-doc+bounces-41802-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BF6A7366A
	for <lists+linux-doc@lfdr.de>; Thu, 27 Mar 2025 17:12:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C1AEF188B149
	for <lists+linux-doc@lfdr.de>; Thu, 27 Mar 2025 16:12:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA9DD1946C8;
	Thu, 27 Mar 2025 16:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Xtc2u7vF"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B8919D882
	for <linux-doc@vger.kernel.org>; Thu, 27 Mar 2025 16:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743091934; cv=none; b=dqvdQVRZUH6fSNAKV34QoRnQumSN8ZvBr+pZqjA9ouK8Ds6ZtLaBx6IijqY8kYo98Wxlpgo9Pwmhc8PuMVfM+dvboMCz61zmhhS9QPQyKv65cYx3AA78ehYjmzIYHTJPHsFcgf4Dr6FV3jPOfxHLpmW6uuKiZqxcPtgnIKzxGHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743091934; c=relaxed/simple;
	bh=0SQScDqEeMbzQnwpiKKIFG9Vk68To6MbYwSHP1HvL3w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u0T8/1PFRONqOjIvtLUYUTwNTy+BC/lCej04jvxT1/YbrLVqoMPUSX8WTo1g/RSnhTcR48NrxrvJHB3n/W36TGZ4U5vRSHOhRfHazngHm0mVKoQ+yVuAVqm4QIM09oLrrvRBafEVMxBtsxyvtShFnjSgsa3AjCdWssTbScg6huM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Xtc2u7vF; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3f6a92f2328so653377b6e.0
        for <linux-doc@vger.kernel.org>; Thu, 27 Mar 2025 09:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743091931; x=1743696731; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=unBVHfPgws2ZkgWdON6HD2DMgITftuEecvFOlYQpcdY=;
        b=Xtc2u7vFHOb37SBR0T56eXgaf+/sBptQ9j+ezC78qT4beeRDX1s5a99Pav5/IFOVBe
         zh+cmNHwkoJbqknMt2phTjCQAgdKXYg7oQD9yVQaBMGksO4gQRni4eoC+2+y31Avno0D
         FM+iignRE1pU5Icvw9MJNEi1dda1m3Ym2NDMxZU+ZkKuBmDghffnTxHieH3X9L1CULOO
         wsgOwR/fneDpF/znALSo16vdZ2TeS0+USX2TO/eBrHmjIGXTxwrxVH+WyESKdw31A+ox
         C4jfrdGNO4NwI7Tiq8Ty1e8GCADV6wP4P9ZXXZi88rRnpNt+oH4aQvbEiYDiq0hibaO4
         nePQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743091931; x=1743696731;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=unBVHfPgws2ZkgWdON6HD2DMgITftuEecvFOlYQpcdY=;
        b=Io2CAtR9+nNWBnN5IglPg39/sgtNo6guYGHImtZjEJNP59XwFhIKvEelvzeHFqIu4l
         uIp1/8oREQBYCbENz6P5FMt4qQmLCaZJn9dlbN/ThhKT9s5Hwh4r01N+/uf2QoGvY5Tp
         BYRDkBXXhGh1sIU8vtfbCCrIwzBWU8j8oyisvvQwbKKI4HpkvuHmhJcCNSe5FETmnE8w
         CfhSlcjxt5MXRPnDC/Istk4yOG2peEbAMjVrQRF8zc2jvwKrU8kGhLenQedZ/YJZTw7l
         nCm+U2Sn7iDwJt3dItxvO8yYPB6tqO9Lkcf9rq2ioCFyjxtoFRdtJedGiiVm//woHmST
         Ma+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWQ/XtAMa/LXRWAebWgcZ/1VzGOeeC67mNaUThc66Dq03Ah53YCP6M7ItUdBPxpgq8vfLpZn9nzvss=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIu1oOqmjwS5BvF8cYJwBiLL4BbTK/3OG/S1VjV6bZOFzxQ2Fa
	ai2PQ2dbhYjArFUWgmVsLsdyOMGXc3r+leR9WxCEPo/EM/poDe1I1SzIvFC82oY=
X-Gm-Gg: ASbGncu/gTcLOWhJmKvrCbBfoeCMcheN0GRHRMdY07tR3fnxOnsQB6ktiKPrZ6oKsT9
	hnmwXxKl6rhvqUfyWSMkPUUNiiSNVIgEBnUf/rEviZQn2goruwRq2OURcQVUsJn2HhWWydbQXTy
	FfBojnFXCMwlOFp93tPOXOm3CTCsVeqQ5BL/4YkTys296dgitDD/KsKNpTzKCzRAeMV2SbMFS+F
	M2zGstDixrUlsx3mLOblikz89LrYLoZQRQjX5BCx+PeKPWBjuD8o+7uVN8vDQUw7TNM0NDDEhbg
	hdQebKnD4gKRpJqiVnL6f8zMkaiHO4lF6f6saA7RnWsPMxxIC+G6URG1M5itQfwKqZdENU9rzLe
	ienzAFw==
X-Google-Smtp-Source: AGHT+IEByi/X8WFBEGBZrgq4UEw/KyKlyq98XRQT7qQm4oHe4x24ITtjZpAD1WQiKg8vcaO17wnr9A==
X-Received: by 2002:a05:6808:3c46:b0:3f6:ab0d:8db1 with SMTP id 5614622812f47-3ff032dcf36mr751735b6e.3.1743091930689;
        Thu, 27 Mar 2025 09:12:10 -0700 (PDT)
Received: from [192.168.0.113] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3febf5e4c32sm2826363b6e.0.2025.03.27.09.12.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 09:12:09 -0700 (PDT)
Message-ID: <35f4d22a-e478-4a43-bbb6-f9d34ce1f888@baylibre.com>
Date: Thu, 27 Mar 2025 11:12:08 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] iio: adc: ad4000: Add support for SPI offload
To: Marcelo Schmitt <marcelo.schmitt@analog.com>, linux-iio@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: jic23@kernel.org, lars@metafoo.de, Michael.Hennerich@analog.com,
 corbet@lwn.net, marcelo.schmitt1@gmail.com
References: <cover.1742992305.git.marcelo.schmitt@analog.com>
 <d67e71b9fab270d16b6b5e26a3594dfc73be1ae5.1742992305.git.marcelo.schmitt@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <d67e71b9fab270d16b6b5e26a3594dfc73be1ae5.1742992305.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/26/25 8:24 AM, Marcelo Schmitt wrote:
> FPGA HDL projects can include a PWM generator in addition to SPI-Engine.
> The PWM IP is used to trigger SPI-Engine offload modules that in turn set
> SPI-Engine to execute transfers to poll data from the ADC. That allows data
> to be read at the maximum sample rates. Also, it is possible to set a
> specific sample rate by setting the proper PWM duty cycle and related state
> parameters, thus allowing an adjustable ADC sample rate when a PWM (offload
> trigger) is used in combination with SPI-Engine.
> 
> Add support for SPI offload.
> 
> Signed-off-by: Marcelo Schmitt <marcelo.schmitt@analog.com>
> ---

...

> diff --git a/drivers/iio/adc/ad4000.c b/drivers/iio/adc/ad4000.c
> index 4fe8dee48da9..9fc56853265e 100644
> --- a/drivers/iio/adc/ad4000.c
> +++ b/drivers/iio/adc/ad4000.c
> @@ -16,11 +16,13 @@
>  #include <linux/gpio/consumer.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/spi/spi.h>
> +#include <linux/spi/offload/consumer.h>

Alphabetical order?

>  #include <linux/units.h>
>  #include <linux/util_macros.h>
>  #include <linux/iio/iio.h>
>  
>  #include <linux/iio/buffer.h>
> +#include <linux/iio/buffer-dmaengine.h>
>  #include <linux/iio/triggered_buffer.h>
>  #include <linux/iio/trigger_consumer.h>
>  

...

>  
> +/*
> + * When SPI offload is configured, transfers are executed withouth CPU

s/withouth/without/

> + * intervention so no soft timestamp can be recorded when transfers run.
> + * Because of that, the macros that set timestamp channel are only used when
> + * transfers are not offloaded.
> + */

...

> @@ -784,7 +1081,10 @@ static int ad4000_probe(struct spi_device *spi)
>  	switch (st->sdi_pin) {
>  	case AD4000_SDI_MOSI:
>  		indio_dev->info = &ad4000_reg_access_info;
> -		indio_dev->channels = chip->reg_access_chan_spec;
> +
> +		/* Set CNV/CS high time for when turbo mode is used */
> +		spi->cs_inactive.value = st->time_spec->t_quiet1_ns;
> +		spi->cs_inactive.unit = SPI_DELAY_UNIT_NSECS;

This code path later calls ad4000_prepare_3wire_mode_message() which sets:

	xfers[0].cs_change_delay.value = st->time_spec->t_conv_ns;

Which contradicts/overrides this.

>  
>  		/*
>  		 * In "3-wire mode", the ADC SDI line must be kept high when
> @@ -796,9 +1096,26 @@ static int ad4000_probe(struct spi_device *spi)
>  		if (ret < 0)
>  			return ret;
>  
> +		if (st->using_offload) {
> +			indio_dev->channels = &chip->reg_access_offload_chan_spec;
> +			indio_dev->num_channels = 1;
> +			ret = ad4000_prepare_offload_message(st, indio_dev->channels);
> +			if (ret)
> +				return dev_err_probe(dev, ret,
> +						     "Failed to optimize SPI msg\n");
> +		} else {
> +			indio_dev->channels = chip->reg_access_chan_spec;
> +			indio_dev->num_channels = ARRAY_SIZE(chip->reg_access_chan_spec);
> +		}
> +
> +		/*
> +		 * Call ad4000_prepare_3wire_mode_message() so single-shot read
> +		 * SPI messages are always initialized.
> +		 */
>  		ret = ad4000_prepare_3wire_mode_message(st, &indio_dev->channels[0]);
>  		if (ret)
> -			return ret;
> +			return dev_err_probe(dev, ret,
> +					     "Failed to optimize SPI msg\n");
>  
>  		ret = ad4000_config(st);
>  		if (ret < 0)
> @@ -806,19 +1123,47 @@ static int ad4000_probe(struct spi_device *spi)
>  
>  		break;
>  	case AD4000_SDI_VIO:
> -		indio_dev->info = &ad4000_info;
> -		indio_dev->channels = chip->chan_spec;
> +		if (st->using_offload) {
> +			indio_dev->info = &ad4000_offload_info;
> +			indio_dev->channels = &chip->offload_chan_spec;
> +			indio_dev->num_channels = 1;
> +
> +			/* Set CNV/CS high time for when turbo mode is not used */
> +			if (!st->cnv_gpio) {
> +				spi->cs_inactive.value = st->time_spec->t_conv_ns;
> +				spi->cs_inactive.unit = SPI_DELAY_UNIT_NSECS;

I'm still not sold on this. We know it has no effect with AXI SPI Engine and
it is writing over something that usually comes from DT. It is misleading.

And the non-offload case already does:

	xfers[0].cs_change_delay.value = st->time_spec->t_conv_ns;

which actually does work with the AXI SPI Engine. So why not be consistent and
do it the same way for the offload case?

It also seems safe to omit this altogether in the offload case and assume that
the max sample rate will also ensure that the miniumum time for CS deasserted
is respected.

> +				ret = spi_setup(spi);
> +				if (ret < 0)
> +					return ret;
> +			}
> +
> +			ret = ad4000_prepare_offload_message(st, indio_dev->channels);
> +			if (ret)
> +				return dev_err_probe(dev, ret,
> +						     "Failed to optimize SPI msg\n");
> +		} else {
> +			indio_dev->info = &ad4000_info;
> +			indio_dev->channels = chip->chan_spec;
> +			indio_dev->num_channels = ARRAY_SIZE(chip->chan_spec);
> +		}
> +
>  		ret = ad4000_prepare_3wire_mode_message(st, &indio_dev->channels[0]);
>  		if (ret)
> -			return ret;
> +			return dev_err_probe(dev, ret,
> +					     "Failed to optimize SPI msg\n");
>  
>  		break;

