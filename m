Return-Path: <linux-doc+bounces-33702-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9519FD295
	for <lists+linux-doc@lfdr.de>; Fri, 27 Dec 2024 10:39:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6BA0916197D
	for <lists+linux-doc@lfdr.de>; Fri, 27 Dec 2024 09:39:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E850155CA5;
	Fri, 27 Dec 2024 09:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="yp2VrLJq"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BAB325777
	for <linux-doc@vger.kernel.org>; Fri, 27 Dec 2024 09:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735292352; cv=none; b=Q8k1AzKvlZHj2Od7kHOy21TOnMdADYKkOE5errbtf2sMyEsns5K1Wcz4cPiZBVLkIGbkowqxI5TKlpQlpuA0c6MO26K901HoXBQbPR/gYNhZNsmo7q1iSjoJ2fkBCBU6MB5CFNbGCc3xghxVFg3j1k00kTAJ1GZ4/ON5e7p6hDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735292352; c=relaxed/simple;
	bh=+h7rRV/5KhypsaXf8tY6MAqwemm6Fq4/cVkam+uxLTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gaFChDqHlbrNR4/h1LDb19PRGI3w7iE1jGL5w5ISyg77U+m24u2kO2gX024NoFx8deyrJMhv12On2jNxMs1B/T2HAnmkXEKuVUPV4nKc2E00dm4xrI/jWijDq7BDO8BB/1dNzXawWKzTBBgAD2xhqH4k4XZMy+tRkGxyyS/6MrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=yp2VrLJq; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-aa696d3901bso545122366b.1
        for <linux-doc@vger.kernel.org>; Fri, 27 Dec 2024 01:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1735292348; x=1735897148; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=muhe/20Z7b0sEWZIfjDas1xZr3XnBHQqN7Fv5V7UJe4=;
        b=yp2VrLJq3lWKo+XzNdOpkjeRum3Sv9CyvsDC4UGuBQkbhnaKs+lhDoKOAeR+Li1ubC
         mzOXkyP5FJWpMI7KEWNaoODNtXOhgxX6KqvfnRL26qpLsRZvztcAMFqQDZQBjkMc4uu1
         cAdSbtGnPY/ZsfFUM9qYcUE8ici2vi/r8t+uskNNaEqlMKSOypHRKKaKdaZkjH5lH8xd
         2rtLDyc7SejLLo/bTu/9WQUc9DXSXWrt6MY4R0Zpdn6rRu6sx6IMMp8NxF9w5kbr+z/c
         yZjTONfkpY1HyLFUOlZ19mxQWERGRR4tHO+bATPp2S/2QCX0jXNsUEQRigsRInnWiO8n
         456A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735292348; x=1735897148;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=muhe/20Z7b0sEWZIfjDas1xZr3XnBHQqN7Fv5V7UJe4=;
        b=JH0UhxfiF808JFh51FT5OUAQq3AbB0311SYi7/MO1QjdH6Rawtr5MhzGzKlBPzm1QR
         L7qsUCuA134f1vIpweDrgJpRSvc5qIKlVSeNUrWYMaZlfy57Nfdtl9drnYUJlLGhPryn
         6zPnodfP7HoaRjT4d94bqD3f3AvVzuW+BIHyhvGuvJvIMrtQORA+J8E9KKLSnVsLyYPS
         kZuOgyaft4JST3ycwefrU01AhguXNRrdS0lZDXul9A4H3mtTDGIfPZx3NRnIqtwBmy9D
         Lq4tO28vS0VzUHauETiyMqEcPTHUKsdC0rdLjlJNh3VHT5bZh0siEvG/3goLONufub0O
         X2Qw==
X-Forwarded-Encrypted: i=1; AJvYcCUNzQ9Xr2lhnyeYz2+trt1ltVoVMyxXAF5HzCpjHxpQfyfssPRyfjTI/x71W9hWqYi4c6HrHwYK51c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe5M51YRmcgGszMG48VwxAmO6yFVGMRcs/HvFjAlQHYFl2RMTF
	XbNzcSguqr+tplle+4rTi/5A0AGovzjALNfqil/Z3NhPJBU9imSMxuz/NpFtYC8=
X-Gm-Gg: ASbGncseA7kVmcsNQRIHPeXKjFZE7tMszunWxDtxsfM5Z41c1tTBuUNQQqyidisEC03
	cfdxyxCw6vWLsC+DqEeq8hQF7LANqtk18Oqa9iJcLM74WqfGN5V/3I3W0DaE5OkG+KJ6+II7myO
	B20Nn6/pc8lP1N2XNKa+ZlTtrfSJPO9tGgHQyqb31+0JQhjYO1LPfofm0xasqfczztO42ueQ2M9
	B+13tPX5lwSizW8F2uI2d4QK3PCMHAMHWcfJxp+wP9LNdJD+yWSOIXepNZdJ5BrFNN/dQmVkAkN
	pWs7VzSSCQ==
X-Google-Smtp-Source: AGHT+IGL+T5Zw5qqpYAOCdJtQuOD3K+0ak2SWdeCwz0UDaXDpxi2T5hLnz/eH2Tu5d0PTpApVa+VNQ==
X-Received: by 2002:a17:906:f5a6:b0:aae:b259:ef6c with SMTP id a640c23a62f3a-aaeb259f285mr1966326766b.0.1735292348275;
        Fri, 27 Dec 2024 01:39:08 -0800 (PST)
Received: from localhost (p50915bc6.dip0.t-ipconnect.de. [80.145.91.198])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e8961a6sm1084329966b.57.2024.12.27.01.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 01:39:07 -0800 (PST)
Date: Fri, 27 Dec 2024 10:39:06 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Julien Stephan <jstephan@baylibre.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	David Lechner <dlechner@baylibre.com>, Jonathan Cameron <jic23@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Subject: Re: [PATCH RFC v2 3/4] iio: adc: ad7380: add alert support
Message-ID: <mfuzlmbylzjcbepyqyrsgcbzdasjagk3mtu23r7kvzlmmdykyq@2jn4rlksw2dx>
References: <20241224-ad7380-add-alert-support-v2-0-7c89b2bf7cb3@baylibre.com>
 <20241224-ad7380-add-alert-support-v2-3-7c89b2bf7cb3@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cslpseuvr445aqct"
Content-Disposition: inline
In-Reply-To: <20241224-ad7380-add-alert-support-v2-3-7c89b2bf7cb3@baylibre.com>


--cslpseuvr445aqct
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RFC v2 3/4] iio: adc: ad7380: add alert support
MIME-Version: 1.0

Hello Julien,

On Tue, Dec 24, 2024 at 10:34:32AM +0100, Julien Stephan wrote:
> +static void ad7380_enable_irq(struct ad7380_state *st)
> +{
> +	if (st->spi->irq && !atomic_cmpxchg(&st->irq_enabled, 0, 1))
> +		enable_irq(st->spi->irq);
> +}
> +
> +static void ad7380_disable_irq(struct ad7380_state *st)
> +{
> +	if (st->spi->irq && atomic_cmpxchg(&st->irq_enabled, 1, 0)) {
> +		disable_irq(st->spi->irq);
> +		synchronize_irq(st->spi->irq);

disable_irq() already cares for synchronize_irq().

> +	}
> +}
> +
> +static void ad7380_disable_irq_nosync(struct ad7380_state *st)
> +{
> +	if (st->spi->irq && atomic_cmpxchg(&st->irq_enabled, 1, 0))
> +		disable_irq_nosync(st->spi->irq);
> +}
> +
>  static int ad7380_debugfs_reg_access(struct iio_dev *indio_dev, u32 reg,
>  				     u32 writeval, u32 *readval)
>  {
> @@ -727,8 +791,8 @@ static int ad7380_regval_to_osr(int regval)
> =20
>  static int ad7380_get_osr(struct ad7380_state *st, int *val)
>  {
> -	int tmp;
> -	int ret =3D 0;
> +	u32 tmp;
> +	int ret;

unrelated change?

>  	ret =3D regmap_read(st->regmap, AD7380_REG_ADDR_CONFIG1, &tmp);
>  	if (ret)
> @@ -834,6 +898,13 @@ static int ad7380_update_xfers(struct ad7380_state *=
st,
>  	return 0;
>  }
> =20
> +static void ad7380_handle_event_reset_timeout(struct timer_list *t)
> +{
> +	struct ad7380_state *st =3D from_timer(st, t, alert_timer);
> +
> +	ad7380_enable_irq(st);
> +}
> +
>  static int ad7380_triggered_buffer_preenable(struct iio_dev *indio_dev)
>  {
>  	struct ad7380_state *st =3D iio_priv(indio_dev);
> @@ -841,6 +912,12 @@ static int ad7380_triggered_buffer_preenable(struct =
iio_dev *indio_dev)
>  	struct spi_message *msg =3D &st->normal_msg;
>  	int ret;
> =20
> +	timer_setup(&st->alert_timer, ad7380_handle_event_reset_timeout, 0);
> +
> +	ad7380_enable_irq(st);
> +
> +	st->buffered_read_enabled =3D true;
> +
>  	/*
>  	 * Currently, we always read all channels at the same time. The scan_ty=
pe
>  	 * is the same for all channels, so we just pass the first channel.
> @@ -894,6 +971,8 @@ static int ad7380_triggered_buffer_postdisable(struct=
 iio_dev *indio_dev)
>  	struct spi_message *msg =3D &st->normal_msg;
>  	int ret;
> =20
> +	st->buffered_read_enabled =3D false;
> +
>  	if (st->seq) {
>  		ret =3D regmap_update_bits(st->regmap,
>  					 AD7380_REG_ADDR_CONFIG1,
> @@ -908,6 +987,9 @@ static int ad7380_triggered_buffer_postdisable(struct=
 iio_dev *indio_dev)
> =20
>  	spi_unoptimize_message(msg);
> =20
> +	ad7380_disable_irq(st);
> +	timer_shutdown_sync(&st->alert_timer);

If the timer triggers between ad7380_disable_irq() and
timer_shutdown_sync() the irq ends up enabled. It's unclear to me why
the irq is enabled in a timer.

> +
>  	return 0;
>  }
> =20
> @@ -1002,8 +1084,11 @@ static int ad7380_read_raw(struct iio_dev *indio_d=
ev,
>  		if (ret)
>  			return ret;
> =20
> -		ret =3D ad7380_read_direct(st, chan->scan_index,
> -					 scan_type, val);
> +		ad7380_enable_irq(st);
> +
> +		ret =3D ad7380_read_direct(st, chan->scan_index, scan_type, val);
> +
> +		ad7380_disable_irq(st);

Why do you enable the irq only during register reading? Wouldn't it be
natural to have it enabled constantly (assuming a valid limit is
configured)?

>  		iio_device_release_direct_mode(indio_dev);
> =20
> @@ -1151,12 +1236,190 @@ static int ad7380_get_current_scan_type(const st=
ruct iio_dev *indio_dev,
>  					    : AD7380_SCAN_TYPE_NORMAL;
>  }
> =20
> +static int ad7380_read_event_config(struct iio_dev *indio_dev,
> +				    const struct iio_chan_spec *chan,
> +				    enum iio_event_type type,
> +				    enum iio_event_direction dir)
> +{
> +	struct ad7380_state *st =3D iio_priv(indio_dev);
> +	int alert_en, tmp, ret;
> +
> +	ret =3D iio_device_claim_direct_mode(indio_dev);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D regmap_read(st->regmap, AD7380_REG_ADDR_CONFIG1, &tmp);
> +
> +	iio_device_release_direct_mode(indio_dev);
> +
> +	if (ret)
> +		return ret;
> +
> +	alert_en =3D FIELD_GET(AD7380_CONFIG1_ALERTEN, tmp);
> +
> +	return alert_en;
> +}
> +
> +static int ad7380_write_event_config(struct iio_dev *indio_dev,
> +				     const struct iio_chan_spec *chan,
> +				     enum iio_event_type type,
> +				     enum iio_event_direction dir,
> +				     bool state)
> +{
> +	struct ad7380_state *st =3D iio_priv(indio_dev);
> +	int ret;
> +
> +	ret =3D iio_device_claim_direct_mode(indio_dev);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D regmap_update_bits(st->regmap,
> +				 AD7380_REG_ADDR_CONFIG1,
> +				 AD7380_CONFIG1_ALERTEN,
> +				 FIELD_PREP(AD7380_CONFIG1_ALERTEN, state));
> +
> +	iio_device_release_direct_mode(indio_dev);
> +
> +	if (ret)
> +		return ret;
> +
> +	return 0;

The last three code lines are equivalent to a plain

	return ret;

> +}
> +
> [...]
> @@ -1190,6 +1459,50 @@ static int ad7380_init(struct ad7380_state *st, bo=
ol external_ref_en)
>  					     AD7380_NUM_SDO_LINES));
>  }
> =20
> +static irqreturn_t ad7380_primary_event_handler(int irq, void *private)
> +{
> +	struct iio_dev *indio_dev =3D private;
> +	struct ad7380_state *st =3D iio_priv(indio_dev);
> +
> +	if (!atomic_read(&st->irq_enabled))
> +		return IRQ_NONE;
> +
> +	ad7380_disable_irq_nosync(st);

I wonder why this is needed. The irq is requested with IRQF_ONESHOT, so
the irq is already masked here? And if you drop the masking here, you
can (I think) simplify the irq state tracking and drop the _nosync
variant completely.

> +	return IRQ_WAKE_THREAD;
> +}
> +
> +static irqreturn_t ad7380_event_handler(int irq, void *private)
> +{
> +	struct iio_dev *indio_dev =3D private;
> +	s64 timestamp =3D iio_get_time_ns(indio_dev);
> +	struct ad7380_state *st =3D iio_priv(indio_dev);
> +	const struct iio_chan_spec *chan =3D &indio_dev->channels[0];
> +	unsigned int i;
> +
> +	for (i =3D 0; i < st->chip_info->num_channels - 1; i++) {
> +		iio_push_event(indio_dev,
> +			       chan->differential ?
> +			       IIO_DIFF_EVENT_CODE(IIO_VOLTAGE,
> +						   2 * i,
> +						   2 * i + 1,
> +						   IIO_EV_TYPE_THRESH,
> +						   IIO_EV_DIR_EITHER) :
> +			       IIO_UNMOD_EVENT_CODE(IIO_VOLTAGE,
> +						    i,
> +						    IIO_EV_TYPE_THRESH,
> +						    IIO_EV_DIR_EITHER),
> +			       timestamp);
> +	}
> +
> +	if (st->spi->irq && st->buffered_read_enabled)
> +		mod_timer(&st->alert_timer,
> +			  jiffies +
> +			  msecs_to_jiffies(st->alert_reset_timeout_ms));
> +
> +	return IRQ_HANDLED;
> +}
> +
>  static int ad7380_probe(struct spi_device *spi)
>  {
>  	struct device *dev =3D &spi->dev;
> @@ -1361,6 +1674,39 @@ static int ad7380_probe(struct spi_device *spi)
>  	indio_dev->modes =3D INDIO_DIRECT_MODE;
>  	indio_dev->available_scan_masks =3D st->chip_info->available_scan_masks;
> =20
> +	if (spi->irq) {
> +		struct iio_chan_spec *chans;
> +		size_t size;
> +		int ret;
> +
> +		ret =3D devm_request_threaded_irq(dev, spi->irq,
> +						&ad7380_primary_event_handler,
> +						&ad7380_event_handler,
> +						IRQF_TRIGGER_FALLING | IRQF_ONESHOT

I didn't double check, but I think with the explicit
IRQF_TRIGGER_FALLING you overwrite the trigger info from the device
tree.

> +						| IRQF_NO_AUTOEN,
> +						indio_dev->name,
> +						indio_dev);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "Failed to request irq\n");
> +
> +		atomic_set(&st->irq_enabled, 0);
> +
> +		/*
> +		 * Copy channels to be able to update the event_spec, since some
> +		 * attributes are visible only when irq are configured
> +		 */
> +		size =3D indio_dev->num_channels * sizeof(*indio_dev->channels);
> +		chans =3D devm_kzalloc(dev, size, GFP_KERNEL);
> +		if (!chans)
> +			return -ENOMEM;
> +
> +		memcpy(chans, indio_dev->channels, size);
> +		chans->event_spec =3D ad7380_events_irq;
> +		chans->num_event_specs =3D ARRAY_SIZE(ad7380_events_irq);
> +
> +		indio_dev->channels =3D chans;
> +	}
> +
>  	ret =3D devm_iio_triggered_buffer_setup(dev, indio_dev,
>  					      iio_pollfunc_store_time,
>  					      ad7380_trigger_handler,

Best regards
Uwe

--cslpseuvr445aqct
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmdudbgACgkQj4D7WH0S
/k5N4Qf/QBuWb8MJFpmNa2Dg5ReJl7uJNXJ9bu0r1JAOWZBVXh6E9NqNlVjXHKA3
ZwFiJ0llA+aW6xlUuYDFRLnSYM8+MMAqbKXwQWuFu72gUdN80vPFKgp1QrIoc/GK
IuBOqOCBF6C3agQz9FmZtUqZ0lwBJF2dyUKHIbtPqmBatbfmOxm+dQdpB+HJEEFg
4LhpRsHuLr2WsOitrelJW7m/lOFyf+6OksQcHDjtWWrvXytmmiteXvywp3DsS5RG
5aMIyiN8kYdINmgndlm9fV/8WmQkIyTIOgkB2N8clY3uAcPRnmph5Jcobtks1OVZ
GkgJ7ug9Vmd98NQIP2SLnSPMfsGsAA==
=fg1t
-----END PGP SIGNATURE-----

--cslpseuvr445aqct--

