Return-Path: <linux-doc+bounces-6721-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 008C482C244
	for <lists+linux-doc@lfdr.de>; Fri, 12 Jan 2024 15:55:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A7A071F25F49
	for <lists+linux-doc@lfdr.de>; Fri, 12 Jan 2024 14:55:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE3EA6EB50;
	Fri, 12 Jan 2024 14:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="neAeT8Xs"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4806E2CA
	for <linux-doc@vger.kernel.org>; Fri, 12 Jan 2024 14:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2cd64022164so64514711fa.3
        for <linux-doc@vger.kernel.org>; Fri, 12 Jan 2024 06:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1705071325; x=1705676125; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+L9xJDVEsE7V3csU6sYKZtbMRfUFtdtCzJGzvU7993M=;
        b=neAeT8XsY2KdELItdqx8vka/T7u8iZ1br+YyzJ66sp++PsaSwbcpzQBbafe7kn4Yup
         ob/fgH1cbZ54UfcRoXIcwbwIUuEK8cbNxm/y/BAFdWYhGVJ3BPdFwNmGmelgLiylWH6x
         5euzjlgFG8peaiL1Yju9cW5Jtnkq9SMTtrUAkkQXjSa1p0A4rUEpOxw3+sZZCgZsYhKG
         D7U64C3EKTZ1n1p+WGVNduEy2gZHvIlj2/495fUKi/T2zkcJGxDjIvBqS7DclZRZoF3c
         Vn87/dvtQd6g/ZQZj7yJGLnuF+DFXSqPVvA+lYX847xapKRI0JcVyZsW108ekSQEA+zJ
         Ya2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705071325; x=1705676125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+L9xJDVEsE7V3csU6sYKZtbMRfUFtdtCzJGzvU7993M=;
        b=G5342OvzyhB7oHKTxPkS4aUIU4y0RExabywDJ/RAb61nf4+JhQ5pqI/sXYMkGTQL2Q
         ss0oGMga2AShMdl0y2fQAvaYD1i/KIG17y+fD8gp0Jsx1X+4/05ULM++sMq+2y9kZFcy
         7uSDEL6KycC7p/z0QmAtOb4bAPmRrzaoJ0nDjUJ7ZBNtAjwFV1PFHjYrVYwNj+AJ0U9z
         F1xsHEzhIdHoRbvzePrXfrF9CbqugtU6mN8Ci2zMU3vHvEE7bKc4knoBEEKBsHr1P3K2
         9u5v9Aw0gk+NDAgZWJiQk+uX3yySvWE1lQCCIw3yGi0IfgRdGB8ZNMfIASSFqbiOazKI
         /aRA==
X-Gm-Message-State: AOJu0Yyh/C9DQ/vncSP9RLKiII1GhtoN+vdhx1iiHdPS4DMQhzJ8/xl9
	FwppxcCQjX5OfomP04/9xgsHV0aB4eW2B3HuJUwbtK4Et+z4kw==
X-Google-Smtp-Source: AGHT+IHOBCkkSmKcJgoDfFQ2qfKU3lRx2F8RaRRCwSuhk/vh9byUp+s06T/ssB1/fybT50ECpPe/HwOtDD/JTDQsV8Q=
X-Received: by 2002:a2e:b0d9:0:b0:2cc:f31b:56ea with SMTP id
 g25-20020a2eb0d9000000b002ccf31b56eamr844666ljl.92.1705071324606; Fri, 12 Jan
 2024 06:55:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240109-axi-spi-engine-series-3-v1-0-e42c6a986580@baylibre.com>
 <20240109-axi-spi-engine-series-3-v1-10-e42c6a986580@baylibre.com> <20240112123759.00007440@Huawei.com>
In-Reply-To: <20240112123759.00007440@Huawei.com>
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 12 Jan 2024 08:55:13 -0600
Message-ID: <CAMknhBHOEQ7vs9S=SFPxDPsKFWdoWe4EtxU_8+M=h7gDH83Afw@mail.gmail.com>
Subject: Re: [PATCH 10/13] iio: buffer: dmaengine: export devm_iio_dmaengine_buffer_alloc()
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Mark Brown <broonie@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Hennerich <michael.hennerich@analog.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Frank Rowand <frowand.list@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Jonathan Corbet <corbet@lwn.net>, linux-spi@vger.kernel.org, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 12, 2024 at 6:38=E2=80=AFAM Jonathan Cameron
<Jonathan.Cameron@huawei.com> wrote:
>
> On Wed, 10 Jan 2024 13:49:51 -0600
> David Lechner <dlechner@baylibre.com> wrote:
>
> > This changes devm_iio_dmaengine_buffer_alloc() to an exported symbol.
> > This will be used by drivers that need to allocate a DMA buffer without
> > attaching it to an IIO device.
> >
> > Signed-off-by: David Lechner <dlechner@baylibre.com>
> > ---
> >  Documentation/driver-api/driver-model/devres.rst   |  1 +
> >  drivers/iio/buffer/Kconfig                         | 14 +++++++-------
> >  drivers/iio/buffer/industrialio-buffer-dmaengine.c |  3 ++-
> >  include/linux/iio/buffer-dmaengine.h               |  2 ++
> >  4 files changed, 12 insertions(+), 8 deletions(-)
> >
> > diff --git a/Documentation/driver-api/driver-model/devres.rst b/Documen=
tation/driver-api/driver-model/devres.rst
> > index b23d4a2b68a6..60e4b7ba38e5 100644
> > --- a/Documentation/driver-api/driver-model/devres.rst
> > +++ b/Documentation/driver-api/driver-model/devres.rst
> > @@ -285,6 +285,7 @@ I2C
> >  IIO
> >    devm_iio_device_alloc()
> >    devm_iio_device_register()
> > +  devm_iio_dmaengine_buffer_alloc()
> >    devm_iio_dmaengine_buffer_setup()
> >    devm_iio_kfifo_buffer_setup()
> >    devm_iio_kfifo_buffer_setup_ext()
> > diff --git a/drivers/iio/buffer/Kconfig b/drivers/iio/buffer/Kconfig
> > index 925c5bf074bc..27d82fb4bc4d 100644
> > --- a/drivers/iio/buffer/Kconfig
> > +++ b/drivers/iio/buffer/Kconfig
> > @@ -40,6 +40,13 @@ config IIO_BUFFER_HW_CONSUMER
> >         Should be selected by drivers that want to use the generic Hw c=
onsumer
> >         interface.
> >
> > +config IIO_HW_TRIGGERED_BUFFER
> > +     tristate "Industrial I/O hardware triggered buffer support"
> > +     select AUXILIARY_BUS
> > +     select IIO_TRIGGER
> > +     help
> > +       Provides helper functions for setting up hardware triggered buf=
fers.
> > +
> >  config IIO_KFIFO_BUF
> >       tristate "Industrial I/O buffering based on kfifo"
> >       help
> > @@ -53,10 +60,3 @@ config IIO_TRIGGERED_BUFFER
> >       select IIO_KFIFO_BUF
> >       help
> >         Provides helper functions for setting up triggered buffers.
> > -
> > -config IIO_HW_TRIGGERED_BUFFER
> > -     tristate "Industrial I/O hardware triggered buffer support"
> > -     select AUXILIARY_BUS
> > -     select IIO_TRIGGER
> > -     help
> > -       Provides helper functions for setting up hardware triggered buf=
fers.
>
> Why move this?
>

Oops, this shouldn't be here. Looks like an artifact from a botched
rebase. The intention was to put it in alphabetical order.

