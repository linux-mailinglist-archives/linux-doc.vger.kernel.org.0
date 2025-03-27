Return-Path: <linux-doc+bounces-41813-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE30A73E36
	for <lists+linux-doc@lfdr.de>; Thu, 27 Mar 2025 19:57:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D5B9189A894
	for <lists+linux-doc@lfdr.de>; Thu, 27 Mar 2025 18:57:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EC7921ADB0;
	Thu, 27 Mar 2025 18:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="X0BESfn/"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2938121ABCD
	for <linux-doc@vger.kernel.org>; Thu, 27 Mar 2025 18:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743101819; cv=none; b=gxqQB5z5yCA9Fkufy8ZVwOLnznx+XweCxzmSSvnbTtA+nmZzLK9fHQP/anhvVOZttck7qrsmSK1sgZQHIBiev6L0JPoMqLugopW6vMjwMO/plOvNXC1iCjE3QHYmmAzXAKc6HLFjqKnEard2ekiLNd7jLBOC3XCwYAkIitpf5NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743101819; c=relaxed/simple;
	bh=aL7jAvW1zq17+CkLFMN0vR9BHYTKgDypZs9AcsEJ2U0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g3A49W1AkIN9rn5kMpwH8FxEzL7YujooME8E9x9lB2zsTShOL2LJqbbi+4FZ5TU0X3qgey7K0sm699fgDZkorYCWKJTnmxBWmCPgUuWOm+T3MR2ECf7L0pRYc6+dy7eqUtppeHjwbxUErwXwclUm/83+g8zLppLZxhM7qX89TE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=X0BESfn/; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3fb3f4bf97aso395461b6e.2
        for <linux-doc@vger.kernel.org>; Thu, 27 Mar 2025 11:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743101816; x=1743706616; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ppDgiMP1+TTl1CVJagamGzQJqV2s8GHoMlgEqGIQygU=;
        b=X0BESfn/8DCN09dbPQRaSXiTBdh7dGAS2Drg2E9cWVMd2elTNBNn5aCxjTlz9kf2LU
         f7xpbRw0bN2ahvPBGAgGDKmLiD+FZTA61F+iEwk3NqdJ7nr/wCvAUPffCA6fhyROQRBQ
         M09/bkGcrSwp83wx7+jzIUC+UUK8b6TRsqo65wPQQHo0XpHu4+sKldMK2Kb6NEyFH5S+
         +tDmFb26Xzq1EPpk3N+sLpOGUXkGY/CngFgR2y31+jDBFaDjXmJ4nx69n7DQHFDeePwH
         QO7RfXE8yRx/8U2VtIN6u7lJ5NwUvtAjs7MvCahHtKUpfm6+uGUW65y9pOaZP+ZCELta
         fgmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743101816; x=1743706616;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ppDgiMP1+TTl1CVJagamGzQJqV2s8GHoMlgEqGIQygU=;
        b=k1I4L4UbY/fPU/r7dVH1wX5ELnDOwNU1KLUFax6vNwfcCJmkh9hQEwYQzD+tJnLcI7
         g/qseenNLQ2XVed4qd1OB9VW00Xq1cB1ETMwKi0MXxUOdpV9WkUj7ii+vwBKQkjQnrZo
         YltbpXo/LY9G5ZtHJXSnCLzCZbBh83EvI43dOqhNFu52mnJDZFS4u/wIHTHAtpVmGwP2
         4KlnPcOz5te3cMJftNSUvBEYua3qLfvUnw8N+3esdlbHxH2EY+3SsKsM6UBpZa3UA7DT
         t4spgO7biLTWLVaoDXgAYzKlhWZj54Btg0INCRDmtqQdEDP8LvOURZWfDYlClqGt2gRm
         IkiA==
X-Forwarded-Encrypted: i=1; AJvYcCXCIwTmyZ5rb/Fpx+8axp6gPACwITVp585QuOi7xHSvLJA/M89MUPj65ZJ6Ol3d5hPcDE5PenhzQcM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2xCnfWg6JFsqdeoGBTasFHirL444+S8D80DRd/6r8rsod/bjv
	OivPwua7IObP3KK0gTPniapYxSMPupv1YvrzFQo/0MfrDW5RWBrbo9xEQg8TnNk=
X-Gm-Gg: ASbGncuNhFXNV2fJA47UQwhEmbNG8mFSbC3QmLcaRyTPEoGLGlPEppuDmd7XuasVmx1
	F6+Yre9ypqCCV0OpOv9ZwAY5FNMP3Qy5eairI9ouYeUMNGsrANA/3P1bT71eSx22yHXgWVOJv09
	4127lRblpCm93Jyaayf0xQUOcxgBjyRayoXesgcvzBZUPQVQQpkFsGfXdwfr1ixMKv/8pS7GqxI
	YKEGNZ4ZSpxsvkoLgjF/wQAkxGIblQdzrAWKseoq0OpotlSKqGJfbGvCCZtuQYhAGLiGhsDPFlz
	CVIpfsNv03McpJWToFNF54UknM/eP621WToSUWoDVrWDXvLH22DcwF6jk3EOomlzB6ivkqnG5xs
	m45q/mA==
X-Google-Smtp-Source: AGHT+IEQ7yeeO97qge5eKvr5YgK7xRNfEO9wfjwIfT1DcQqiR9u2xozYXLpQrS2Y9HkfQp6VTfz+Mg==
X-Received: by 2002:a05:6808:1113:b0:3fe:af0a:f8da with SMTP id 5614622812f47-3fefa622addmr2224838b6e.38.1743101816034;
        Thu, 27 Mar 2025 11:56:56 -0700 (PDT)
Received: from [192.168.0.113] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3ff0516733csm36666b6e.2.2025.03.27.11.56.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 11:56:55 -0700 (PDT)
Message-ID: <55553cdc-db84-49a6-9576-3e9e630647e0@baylibre.com>
Date: Thu, 27 Mar 2025 13:56:53 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] iio: adc: ad4000: Add support for SPI offload
To: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
Cc: Marcelo Schmitt <marcelo.schmitt@analog.com>, linux-iio@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, jic23@kernel.org,
 lars@metafoo.de, Michael.Hennerich@analog.com, corbet@lwn.net
References: <cover.1742992305.git.marcelo.schmitt@analog.com>
 <d67e71b9fab270d16b6b5e26a3594dfc73be1ae5.1742992305.git.marcelo.schmitt@analog.com>
 <35f4d22a-e478-4a43-bbb6-f9d34ce1f888@baylibre.com>
 <Z-WRMih3UCFjym9p@debian-BULLSEYE-live-builder-AMD64>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <Z-WRMih3UCFjym9p@debian-BULLSEYE-live-builder-AMD64>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/27/25 12:56 PM, Marcelo Schmitt wrote:

...

>>>  	case AD4000_SDI_VIO:
>>> -		indio_dev->info = &ad4000_info;
>>> -		indio_dev->channels = chip->chan_spec;
>>> +		if (st->using_offload) {
>>> +			indio_dev->info = &ad4000_offload_info;
>>> +			indio_dev->channels = &chip->offload_chan_spec;
>>> +			indio_dev->num_channels = 1;
>>> +
>>> +			/* Set CNV/CS high time for when turbo mode is not used */
>>> +			if (!st->cnv_gpio) {
>>> +				spi->cs_inactive.value = st->time_spec->t_conv_ns;
>>> +				spi->cs_inactive.unit = SPI_DELAY_UNIT_NSECS;
>>
>> I'm still not sold on this. We know it has no effect with AXI SPI Engine and
>> it is writing over something that usually comes from DT. It is misleading.
> 
> I thought it was okay to set cs_inactive and call spi_setup() from the field
> doc in include/linux/spi/spi.h.
> 
> 	set_cs_timing() method is for SPI controllers that supports
> 	configuring CS timing.
> 	
> 	This hook allows SPI client drivers to request SPI controllers
> 	to configure specific CS timing through spi_set_cs_timing() after
> 	spi_setup().
> 
> Would it be better to set spi-cs-inactive-delay-ns in ADC dt node?
> Or it still doesn't look like a proper use of cs_inactive?
> 
>>
>> And the non-offload case already does:
>>
>> 	xfers[0].cs_change_delay.value = st->time_spec->t_conv_ns;
>>
>> which actually does work with the AXI SPI Engine. So why not be consistent and
>> do it the same way for the offload case?
> 
> One of the points in using `bits_per_word` in spi transfers was to reach high
> frequency sample rate, right? I think it makes sense to use them for SPI offload
> transfers. But we were also trying to set a proper CNV/CS dealy so that ADC
> conversion could complete properly before starting requesting the data. That
> also sound reasonable to me. But, spi_transfer struct doesn't provide a good
> way of setting a CS inactive delay if only one transfer is executed. If we
> use `cs_change_delay`, we would then be running two transfers, no? 

We would still only be doing one xfer per SPI offload trigger. The only
difference it would make is that it would ensure that the second trigger
could not come too soon after the CS deassert of the previous message.

In other words, the sampling frequency is already supplying this delay
between subsequent SPI messages. Setting xfers[0].cs_change_delay just
adds insurance that if the next trigger comes too soon, it will be ignored.
This could happen, e.g. if someone sets the max SCLK rate to something
low enough that the single xfer takes longer than the trigger period at
the max sampling frequency.

In most cases though, we won't actually see cs_change_delay having any
effect because the trigger to start the next SPI message doesn't come
until later.

> Plus, the ADC
> would be doing two conversions (one after CS deasert of previous message and
> one after CS deassert at the end of the first transfer) while we only read one
> of them.
> 
> The offload message preparation would look like what we had in v2:
> 
> static int ad4000_prepare_offload_turbo_message(struct ad4000_state *st,
> 						const struct iio_chan_spec *chan)
> {
> 	struct spi_transfer *xfers = st->offload_xfers;
> 
> 	/* Dummy transfer to guarantee enough CS high time. */
> 	xfers[0].cs_change = 1;
> 	xfers[0].cs_change_delay.value = st->time_spec->t_quiet1_ns;
> 	xfers[0].cs_change_delay.unit = SPI_DELAY_UNIT_NSECS;
> 
> 	xfers[1].bits_per_word = chan->scan_type.realbits;
> 	xfers[1].len = chan->scan_type.realbits > 16 ? 4 : 2;
> 	xfers[1].delay.value = st->time_spec->t_quiet2_ns;
> 	xfers[1].delay.unit = SPI_DELAY_UNIT_NSECS;
> 	xfers[1].offload_flags = SPI_OFFLOAD_XFER_RX_STREAM;
> 
> 	spi_message_init_with_transfers(&st->offload_msg, xfers, 2);
> 	st->offload_msg.offload = st->offload;
> 
> 	return devm_spi_optimize_message(&st->spi->dev, st->spi, &st->offload_msg);
> }
> 
> Are we worried about a few clock cycles in between transfers but not worried
> about running an entire dummy transfer?
> 
> Plus, I've tested the single-transfer offload message version with ADAQ4003 on
> CoraZ7 and verified the results were correct.
> FWIW, I put a copy of the dts I used for the tests at the end of this email.
> 
>>
>> It also seems safe to omit this altogether in the offload case and assume that
>> the max sample rate will also ensure that the miniumum time for CS deasserted
>> is respected.
> 
> If we can assume that, then I think that's another reason why we don't need
> a dummy transfer to set CS high delay.
> 

I agree we don't need two xfers, especially in turbo mode.

