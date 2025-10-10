Return-Path: <linux-doc+bounces-62975-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F7EBCE6AA
	for <lists+linux-doc@lfdr.de>; Fri, 10 Oct 2025 21:45:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6BC0F355778
	for <lists+linux-doc@lfdr.de>; Fri, 10 Oct 2025 19:45:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 696B33019C1;
	Fri, 10 Oct 2025 19:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RuYvCcSf"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74CA301717
	for <linux-doc@vger.kernel.org>; Fri, 10 Oct 2025 19:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760125510; cv=none; b=lD0GtRaeRmhirGRx7g7lEZb1AgxguRtQjsIQD5KmSxE5nqEnry8YirRqzmGSwbg1tnMio1a3J9467iWae3nI9YklYGGvEfITRx00qnVAeV+lrkAEdsJEiq7urqugU0AMsNhcG+pIqB7SA7FVW0141wC8yUrIEW9KD3JE/b9MtHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760125510; c=relaxed/simple;
	bh=j7eRCO8WXdU/zad3n+NWlTSndVmgNqtq1p4vqwLQNX8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mQR1e1Bv30cGYepQExW6Ej/n/tSOAB8IDyCihIPBmvzpV4ebGXTMSW7fKzqXK9eO3vtRnkVALYt2l2xcFjFtLXDkHbN+FM46aTElVWUeBIZ6BcjrisjV4yibe7oDZPtNBId8NN9+Uba95+0iUytrQP1sxlkVgx44Tw19FUHsRNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RuYvCcSf; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-46e504975dbso14533315e9.1
        for <linux-doc@vger.kernel.org>; Fri, 10 Oct 2025 12:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760125506; x=1760730306; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eQu0rr6UjxQklgSlwaowAdD1/Ytw7JaYBhmk2aJvOXk=;
        b=RuYvCcSfJyIRhZ2o6Z9aV4YLxxndlUqEqvOjjxTQErygeiptPow5tlZRLSd0WzpIrA
         xpezIgxuexsk0wMXBurwDM+KPzJPrWaY+05h3DITGERd2QjYQ/w57k7Mg/8aPo2hS8X6
         g0cfNLDMzAv6m3UxQF1Vr48Yjt0qiRJ8lLr/p3PsFkVMLpgLAIiPjFicXz7v2zwkkw2O
         nIEntAakKjQNS/Wg9RmrrTd7UYMfNvXxwn82LRW/REyFCfW6oSz034jlLI/nDqyFBNOF
         Q5+0SxeMQCNW+9APIdfWhbFlFLzoT/+BsLHDxvdkF4GGOh2msKYl/9f/HPJWQLARHhk7
         3H5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760125506; x=1760730306;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eQu0rr6UjxQklgSlwaowAdD1/Ytw7JaYBhmk2aJvOXk=;
        b=sr5yUwZRgvelQY6RFgg19826yr0MXGqNXhISn2JMTGDVj5lkRV5+85L8rv7B6DU4SY
         AHTdWAQpX1y2qov+WlQWVXTtqHngbe1GLXRVVSRXHYmmHFp1uRSg7zl7Fgwb23Je5m07
         ceJ4KIZsslmAwB0CI5o17lg7c6HyWF5MKsbYk62I49ZMKFGBc0Pl9foAlpKM32Fm/qkb
         T8DNTBKcdvU1xQ/wr9AY1HkcfDSCe+c5oBQ0pZ6/n0bSu3DzN3uwY4sva+u8wueOhHUR
         C7lkgFzMAtjRaUBzm4LBK3DEkvCt8sLND2tVk4yuS+/MNAlG1xq/ASCLjnIC7lx1xD7D
         wOXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVn9AdN36JrIPxlrLWh61aNB8ZMRy9sGkjhGT0IGT2lOXRl0pOM81nZQU5fepSjmh/CsY2cYVqwytY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDGfGNICPSefsRzALpHSaVqNNnxMDGzUTJBJNxGybKmkPdH55I
	kP2L7sVEHk/0LGRdiyYKZRsobJOHmqKgP6OmWp6veU84sl145BnKg9Gq
X-Gm-Gg: ASbGnctggayAN/hSDtMt0wSnw333V5Fj6jPD0C4RjmKMwm7zFNgpodX7s5A85etZyEp
	6tcoamWw2x8qiAHK1TX9yJkdIxDqHjUStSw4kkk2jjMQOiAlxN1eaPdYUwWgAZrwiCWSCxb6mna
	gV5yitYIbe4SemIV4yp3V0IwOwnbssKRMtQRknYc8KRnzIXqCurBHn7mZ1mzXBdWW0pXmciLPmp
	EKCWb1P9wdZx/ypO98QbO2dZCxrfXsAJm99B7i35nADdxXcCl/H/Khgf/AD/+1l8UEbZw8h4Ucr
	aGURqVbATbMxuaPd1hAh3SmUBOsADcqQShPrQVpw8XaiGw4KEFMnOf/Nv8OAQZL9GrUeGwpaZqB
	jruOvsB0a4umK+yhA1Pz4iX71OW9gj4L/QFmT24GgO6QIlBrMkNEbMHdMpMbMlu9Y1Bo6F9CYi4
	F3EcBOMxzVK0vctegCoOpxo+qY
X-Google-Smtp-Source: AGHT+IHHHrb9if1pSYItixsAXjV8Fo41Ye9u4kM+Ypfmjxxvzg1eG3Pwur7ZSPXeiqGWANKsBZ20ow==
X-Received: by 2002:a05:600c:4506:b0:45b:8a0e:cda9 with SMTP id 5b1f17b1804b1-46fa9a8638dmr92447005e9.2.1760125505754;
        Fri, 10 Oct 2025 12:45:05 -0700 (PDT)
Received: from ?IPv6:2001:818:ea56:d000:94c4:fb0e:28f:2a8d? ([2001:818:ea56:d000:94c4:fb0e:28f:2a8d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb32a84edsm39166195e9.4.2025.10.10.12.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 12:45:05 -0700 (PDT)
Message-ID: <755d4fcea043d62ba6ac44c483f70c0a08b5e41e.camel@gmail.com>
Subject: Re: [PATCH v4 6/8] iio: adc: ad4030: Add SPI offload support
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: David Lechner <dlechner@baylibre.com>, Marcelo Schmitt	
 <marcelo.schmitt@analog.com>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-pwm@vger.kernel.org, 	linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: jic23@kernel.org, ukleinek@kernel.org, michael.hennerich@analog.com, 
	nuno.sa@analog.com, eblanc@baylibre.com, andy@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, corbet@lwn.net, 
	marcelo.schmitt1@gmail.com, Trevor Gamblin <tgamblin@baylibre.com>, Axel
 Haslam	 <ahaslam@baylibre.com>
Date: Fri, 10 Oct 2025 19:46:01 +0100
In-Reply-To: <576b582e-7388-4ee4-9a4c-4f7e04fc3fda@baylibre.com>
References: <cover.1759929814.git.marcelo.schmitt@analog.com>
	 <2bde211f1bc730ee147c9540b88339a93b2983e6.1759929814.git.marcelo.schmitt@analog.com>
	 <a86007ab148f9556af032f5ba61991a74a5641c0.camel@gmail.com>
	 <576b582e-7388-4ee4-9a4c-4f7e04fc3fda@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2025-10-10 at 11:18 -0500, David Lechner wrote:
> On 10/10/25 6:19 AM, Nuno S=C3=A1 wrote:
> > On Wed, 2025-10-08 at 10:51 -0300, Marcelo Schmitt wrote:
> > > AD4030 and similar ADCs can capture data at sample rates up to 2 mega
> > > samples per second (MSPS). Not all SPI controllers are able to achiev=
e such
> > > high throughputs and even when the controller is fast enough to run
> > > transfers at the required speed, it may be costly to the CPU to handl=
e
> > > transfer data at such high sample rates. Add SPI offload support for =
AD4030
> > > and similar ADCs to enable data capture at maximum sample rates.
> > >=20
> > > Co-developed-by: Trevor Gamblin <tgamblin@baylibre.com>
> > > Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> > > Co-developed-by: Axel Haslam <ahaslam@baylibre.com>
> > > Signed-off-by: Axel Haslam <ahaslam@baylibre.com>
> > > Signed-off-by: Marcelo Schmitt <marcelo.schmitt@analog.com>
> > > ---
> > > Change log v3 -> v4
> > > - Applied code adjustments suggested to SPI offload patch.
> > > - Only select SPI_OFFLOAD_TRIGGER_PWM if (SPI_OFFLOAD && PWM).
> > >=20
> > > =C2=A0drivers/iio/adc/Kconfig=C2=A0 |=C2=A0=C2=A0 3 +
> > > =C2=A0drivers/iio/adc/ad4030.c | 504 ++++++++++++++++++++++++++++++++=
+++----
> > > =C2=A02 files changed, 465 insertions(+), 42 deletions(-)
> > >=20
> > > diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
> > > index 58a14e6833f6..1ed091b6731a 100644
> > > --- a/drivers/iio/adc/Kconfig
> > > +++ b/drivers/iio/adc/Kconfig
> > > @@ -62,7 +62,10 @@ config AD4030
> > > =C2=A0	depends on GPIOLIB
> > > =C2=A0	select REGMAP
> > > =C2=A0	select IIO_BUFFER
> > > +	select IIO_BUFFER_DMA
> > > +	select IIO_BUFFER_DMAENGINE
> > > =C2=A0	select IIO_TRIGGERED_BUFFER
> > > +	select SPI_OFFLOAD_TRIGGER_PWM if (SPI_OFFLOAD && PWM)
> >=20
> > Two things as I mentioned in [1]:
> >=20
> > 1) Wouldn't 'imply SPI_OFFLOAD_TRIGGER_PWM' accomplish the same?
> > 2) Don't we also need stubs for spi/offload/consumer.h?
>=20
> It doesn't hurt to enable SPI offload support even if no controller
> supports it, so I would prefer that drivers that use it just select
> SPI_OFFLOAD.

It does not hurt for sure. I just don't love enabling code when the feature=
 is
optional. For things like GPIO it not does not matter much because it's mos=
t likely
always enabled anyways.

But, fair enough! I don't feel strong about this at all and if we wanted to=
 be picky
then we would also have to take into account that IIO_BUFFER_DMA and
IIO_BUFFER_DMAENGINE also depend on SPI_OFFLOAD being present and we just s=
elect
those.

- Nuno S=C3=A1

>=20
> >=20
> > [1]:
> > https://lore.kernel.org/linux-pwm/2e82eaf275b5c8df768c8b842167c3562991e=
50c.camel@gmail.com/T/#t
> > - Nuno S=C3=A1
> > =C2=A0

