Return-Path: <linux-doc+bounces-19582-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 096A9918803
	for <lists+linux-doc@lfdr.de>; Wed, 26 Jun 2024 18:56:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 86E561F24558
	for <lists+linux-doc@lfdr.de>; Wed, 26 Jun 2024 16:56:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B26618FC98;
	Wed, 26 Jun 2024 16:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="0p2RY6Ib"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9079A18FC69
	for <linux-doc@vger.kernel.org>; Wed, 26 Jun 2024 16:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719420987; cv=none; b=e8tuyTuM1LurIVTuujoTIXOuvHyUYK01JaICkEPdquQQZC/4607cSqwQvQyjtpcBB/0qVL8kQFizqLPuQmdI4DHWiUHXIUG9tA6Wg3qgOZLUW5BjRz48Wnxj/oZ6RLtpluYNFQz7BQA7KQi0SvXDiMaJDkmNzCBgduNQGyJ1o78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719420987; c=relaxed/simple;
	bh=C6ME1IwOzHYbPTSz6neRG6o/tR0/cP7f8Fk4N4+jog8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V3fT+bZX9l6n2VuyTuvZwCNZKCM+mMwdqXb7lqbHFZtXZjBbWgTR6SkZHRXP8WT5jrskausD9JXvGTe8KHUC0ZOmjber0JXbvwr6alFd0T/R9VNcwysBi8VFZ6wNKJJqZf1wiQAvTfhpLg7jEwziPjoqqA6Xat+e2zkzDR2QMi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=0p2RY6Ib; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-6fa11ac8695so4107230a34.3
        for <linux-doc@vger.kernel.org>; Wed, 26 Jun 2024 09:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719420984; x=1720025784; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I9WF5q68ZePMbZuzgldrpeFkJQIx5++lavDIav1RipY=;
        b=0p2RY6Ib4QhMldh0jnWYB2F0kkWudDGuERZHFFmfyT1JMI92a7Mk29ZB7rRauUui8c
         ij0F4Poy2uieWIedtAdS3Hw8TzXBjm5RPiyyAJycucfW8xdItpXE1Tis1I+pGeQ+Q7Im
         fULd/yQc+RvRYCF8mWIDYyBvSfkxm7k3UD+TdFEDJkdTTBd1vxUt77AFENFiqJP+4z5j
         hkzKBjRYaXKaXDnANi/L4bofifxZgx3RBdUqMxJaIS4T5oTA2ol9ThEL7JMMQCc7b02U
         jnp/or1ECaZySF6LyghxRfDyyIVFlq5pBtDXNUlLiQh1ytlV7FXI9Gnkcfr73NNcFNa2
         TVhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719420984; x=1720025784;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I9WF5q68ZePMbZuzgldrpeFkJQIx5++lavDIav1RipY=;
        b=sjhxWOHgeAJpzmpAo7oxUkhbXOyGa58I0qlHWlfM5JarTVUja53CqhwSgBx2yvvFGY
         PMvXlQRTRf6nGtNg9olz1tLYlyAp/ZbsOJkFRKOelP4vlpKAPQz59O+ZiAJuyXcwpz3E
         pI6vu1nsgBVHzGNZGe8AAoE3Y4QlrhZ6JiClvJE2q5rMrcIygQGSwlxN5NM3AaimE2ZU
         kPwv7VH6OCRo+1TMpNNcktIu7Fdjecg8VJG71leEbriwvsDgnQ5JrLXna/bQC2FMW7D6
         45hvkJ+H/Avpj3rs5gHeAwEWvAxkfITYkKIIENzM+1RMG+k1mapuoj+bOfy15/dBLEX+
         4W9A==
X-Forwarded-Encrypted: i=1; AJvYcCVAwb0c61OvF6yxdfBIWQtwsmbhMFvgZZg4GTSdvOHKx3hBLlRNikbWj3HjCGzxV0WqIVxinugQW7OQhkqdIjl8Z/zwkxeLBChi
X-Gm-Message-State: AOJu0YzIHcP0R1tpS7Ufcn7PmqJqyVRFHcRkz9SNwBEOiM+yvh0Imn3l
	TEkA4P9oCD02xZIv1U9wMUtzZT60A4h32u1ndJv4V/Hfl0sCQhIPQDMRakjhsuw=
X-Google-Smtp-Source: AGHT+IFIA6lVNQS4eN/SmzgcST24H2LTBlnYknBiU44VIzeZ3/EW6KKBtCIolqXn4UeVDoEoNyu3xw==
X-Received: by 2002:a05:6830:1045:b0:6fa:17c9:1978 with SMTP id 46e09a7af769-700b12a888bmr12074802a34.30.1719420983632;
        Wed, 26 Jun 2024 09:56:23 -0700 (PDT)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7009c607e9esm1944499a34.45.2024.06.26.09.56.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jun 2024 09:56:23 -0700 (PDT)
Message-ID: <1db5d054-8cce-4cbf-a02c-6ba52791548f@baylibre.com>
Date: Wed, 26 Jun 2024 11:56:22 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/7] iio: adc: Add support for AD4000
To: Marcelo Schmitt <marcelo.schmitt@analog.com>, broonie@kernel.org,
 lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 nuno.sa@analog.com, corbet@lwn.net, marcelo.schmitt1@gmail.com
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1719351923.git.marcelo.schmitt@analog.com>
 <eb5f7b73bdf3ac89117e28f26ee3f54ba849163e.1719351923.git.marcelo.schmitt@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <eb5f7b73bdf3ac89117e28f26ee3f54ba849163e.1719351923.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/25/24 4:55 PM, Marcelo Schmitt wrote:

> +
> +enum ad4000_sdi {
> +	/* datasheet calls this "4-wire mode" (controller CS goes to ADC SDI!) */

It looks like this comment was meant for AD4000_SDI_CS.

> +	AD4000_SDI_MOSI,
> +	/* datasheet calls this "3-wire mode" (not related to SPI_3WIRE!) */
> +	AD4000_SDI_VIO,
> +	AD4000_SDI_CS,
> +};
> +
> +/* maps adi,sdi-pin property value to enum */
> +static const char * const ad4000_sdi_pin[] = {
> +	[AD4000_SDI_MOSI] = "",
> +	[AD4000_SDI_VIO] = "high",
> +	[AD4000_SDI_CS] = "cs",
> +};

Should we go ahead and add "low" here too even though it isn't supported
yet? We could give a different error message in this case. (not supported
mode vs. invalid value).

> +/*
> + * This executes a data sample transfer for when the device connections are
> + * in "3-wire" mode, selected when the adi,sdi-pin device tree property is
> + * absent or set to "high". In this connection mode, the ADC SDI pin is
> + * connected to MOSI or to VIO and ADC CNV pin is connected either to a SPI
> + * controller CS or to a GPIO.
> + * AD4000 series of devices initiate conversions on the rising edge of CNV pin.
> + *
> + * If the CNV pin is connected to an SPI controller CS line (which is by default
> + * active low), the ADC readings would have a latency (delay) of one read.
> + * Moreover, since we also do ADC sampling for filling the buffer on triggered
> + * buffer mode, the timestamps of buffer readings would be disarranged.
> + * To prevent the read latency and reduce the time discrepancy between the
> + * sample read request and the time of actual sampling by the ADC, do a
> + * preparatory transfer to pulse the CS/CNV line.

This description doesn't sound quite correct. When st->turbo_mode is true
the shorter delay will cause a read during conversion, so we would be 
reading the sample from the previous conversion trigger, not the current one.

The description sounds like this function always does a read during
aquisition. So if that is the actual intent (and I agree it should be),
maybe the best thing to do would be to just remove st->turbo_mode for
now? Then we can add it back when we do SPI offload support that actually
needs it to achieve max sample rate. Then the function will match the
description as-is.

st->turbo_mode is never set to true currently anyway. So removing it
for now seems best.

> + */
> +static int ad4000_prepare_3wire_mode_message(struct ad4000_state *st,
> +					     const struct iio_chan_spec *chan)
> +{
> +	unsigned int cnv_pulse_time = st->turbo_mode ? AD4000_TQUIET1_NS
> +						     : AD4000_TCONV_NS;
> +	struct spi_transfer *xfers = st->xfers;
> +
> +	xfers[0].cs_change = 1;
> +	xfers[0].cs_change_delay.value = cnv_pulse_time;
> +	xfers[0].cs_change_delay.unit = SPI_DELAY_UNIT_NSECS;
> +
> +	xfers[1].rx_buf = &st->scan.data;
> +	xfers[1].len = BITS_TO_BYTES(chan->scan_type.storagebits);
> +	xfers[1].delay.value = AD4000_TQUIET2_NS;
> +	xfers[1].delay.unit = SPI_DELAY_UNIT_NSECS;
> +
> +	spi_message_init_with_transfers(&st->msg, st->xfers, 2);
> +
> +	return devm_spi_optimize_message(st->spi, &st->msg);

In the cover letter or after --- in this patch we should mention the
dependency since this is a new API and depends on the tag from Mark.

> +}
> +

