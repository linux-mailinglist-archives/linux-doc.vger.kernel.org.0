Return-Path: <linux-doc+bounces-27370-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E1F99C483
	for <lists+linux-doc@lfdr.de>; Mon, 14 Oct 2024 11:01:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5048B288BF7
	for <lists+linux-doc@lfdr.de>; Mon, 14 Oct 2024 09:01:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67253155727;
	Mon, 14 Oct 2024 09:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Wa8fpNv2"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D30E1527BB
	for <linux-doc@vger.kernel.org>; Mon, 14 Oct 2024 09:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728896453; cv=none; b=g+TzlqNGxUh/9vmhkcAtgE2zr3aD2NGrbfMBBtpJFn07P1UHAxbguKXFDC8G4GT9goYZ4CV9suJTmWhUDPvkl/mCWVwQCgM9ZNfmemmFjS0zOgw6EbcLUj/If1lja8PbEG6vVyXf3hkvR0A6r+ZVhPVDZ6NVln0itHvBbQ+SOsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728896453; c=relaxed/simple;
	bh=MflAoS/JVwsJxPi1EnBqpdAqnLAu6sZoC0d+TTvhdAM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=STR/3O62Ub3YsoCm3wQMocgu8N5bM+ECnYmZ7DKrWv8d7Y/qqwqpRlsF3hxxt3JpT1cISufxup3jMjHz3psF81J3mb8wetsJWKal5aWWNhFt585DnqqNfwn+cnX3AXtoiQWN41wxb50wMISqlim4DIeJWWPo7WlpMIMF0n+UWIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Wa8fpNv2; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a998a5ca499so608603866b.0
        for <linux-doc@vger.kernel.org>; Mon, 14 Oct 2024 02:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1728896450; x=1729501250; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MflAoS/JVwsJxPi1EnBqpdAqnLAu6sZoC0d+TTvhdAM=;
        b=Wa8fpNv2n0rmPJNhCm2oTJGqGi2zC81zaeIxNvcTy7PonpjLc5Pbil0MLG2X7bk3Us
         cgMCczONEqz+GjAk8jq27p5w7TN2jHlMuO6kLH8wWOVDRU3Ft1xZEmTzqqTPzXnkZAFy
         KaJ+r28nwcYXdj2BVM6AEVcqcK4vcWn5ApwxmJY0Bn0FmjQCk6i3AdFmJp4+8rDqdKbC
         qXf4hTEp/gH6ROkVIC73MwLxMihMF1jzwbcJ0SYvVbAmAO5NoAx/aiKhTYd4OTUN2/02
         gMVo7g2Oq8+fvkifPUFrRlIBIbExAEmk+LaN5mVdGO4P9pvcAzbNJsJM7L76fHvoCab5
         lJbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728896450; x=1729501250;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MflAoS/JVwsJxPi1EnBqpdAqnLAu6sZoC0d+TTvhdAM=;
        b=k/MYMWMoRGLiD3S6xMf6phTKsKh+54i/jpYPqkiIfMcO4MBz0bszyHyvMBAz1d/GFG
         MHPcYJilEqZdZJeRxktTgtidCOxdQqFKuyebgNOsTjmwuwBbNIBe4/b3BU1oO+214mCB
         IcJ4qi917Jc5U9phCBtKal4p48Kfzu5NJYYBE5rGa1YplPcYW9A6Dp7a4vV2o51WZF25
         k6IClI16FY5xvmREi4V3GY4PdLJ48dghKiG6xXbruCT0w26E3EhMf59J/LEqMeIP3bNj
         8lYWSzEBzxFa5ttlahnQ33+XCjG7HQE9kh9m87aodISioJvaKYeDR/QghSScgmOmn/XJ
         y+PA==
X-Forwarded-Encrypted: i=1; AJvYcCXtWibs7dlm5d9Grr5Nfxa/De4fTCLPfcNME3ys1UCGdWLwqKCkxNkeSHmvFxh2GbFPdY2DHx6NeBE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+167k4/95aHMGrba8mmhEnT7FqomGQa84bvc0Sn6GO3sRKA5J
	DgkR2hQyAAy5HFlrEfEFy/mQ0bYrHyRLtvkLqeWDDC2Ip/yTXlayi6yPJyWkv1MhHtGBDYqOXWf
	L8kCSwYKxYM8NxyHiipCrE7uniJLNwbpij5CyPA==
X-Google-Smtp-Source: AGHT+IFlRvGBzelFcPb4MlBwiC6Xm+9AzmFqSrtThZwPQzH3LVUNBawvPUHSA7ddlyUofnVK+089RIIf9I7sU9/EVTw=
X-Received: by 2002:a17:906:fe4b:b0:a99:8abf:3610 with SMTP id
 a640c23a62f3a-a99e3b30f48mr661900666b.14.1728896449865; Mon, 14 Oct 2024
 02:00:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241007-ad7380-fix-supplies-v1-0-badcf813c9b9@baylibre.com>
 <20241007-ad7380-fix-supplies-v1-2-badcf813c9b9@baylibre.com>
 <v7in5n6ktmu5kfzlndn4eujmk5n66fmft4lvwuvucqbcv5r5hb@etdqvn6ev6nl> <20241010192218.12808268@jic23-huawei>
In-Reply-To: <20241010192218.12808268@jic23-huawei>
From: Julien Stephan <jstephan@baylibre.com>
Date: Mon, 14 Oct 2024 11:00:39 +0200
Message-ID: <CAEHHSvaGTKFA1mUeONXUQ=aTirVemHWFc_E-i76sQgtQ5_Svtg@mail.gmail.com>
Subject: Re: [PATCH 2/6] dt-bindings: iio: adc: ad7380: fix ad7380-4 reference supply
To: Jonathan Cameron <jic23@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	David Lechner <dlechner@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 10 oct. 2024 =C3=A0 20:22, Jonathan Cameron <jic23@kernel.org> a =
=C3=A9crit :
>
> On Tue, 8 Oct 2024 09:52:50 +0200
> Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> > On Mon, Oct 07, 2024 at 05:45:45PM +0200, Julien Stephan wrote:
> > > ad7380-4 is the only device from ad738x family that doesn't have an
> > > internal reference. Moreover its external reference is called REFIN i=
n
> > > the datasheet while all other use REFIO as an optional external
> > > reference. If refio-supply is omitted the internal reference is
> > > used.
> > >
> > > Fix the binding by adding refin-supply and makes it required for
> > > ad7380-4 only.
> >
> > Maybe let's just use refio as refin? Reference-IO fits here well.
> > Otherwise you have two supplies for the same.
> Whilst it is ugly, the effort this series is going to in order
> to paper over a naming mismatch makes me agree with Krzysztof.
>
> I think adding a comment to the dt-binding would be sensible
> though as people might fall into this hole.
>

Hi Jonathan and Krzysztof,

I am currently adding support for another chip to this family
(ADAQ4380-4) and it also uses REFIN.. but in another way ad7380-4
does..
So:
- ad7380-4 does not have any internal reference and use a mandatory
refin supply as external reference
- adaq4380-4 does not have external reference but uses a 3V internal
reference derived from a 5V mandatory refin supply
- all others (AFAIK) use an optional refio external reference. If
omitted, use an internal 2.5V reference.

I am not sure using a single refio-supply for all will make things
clearer.. What do you think? Should I also send the adaq series now to
bring more context? (I wanted feedback on this series first).

Cheers
Julien

> Other than the missing ret =3D, rest of series looks fine to me
>
> Jonathan
>
> >
> > Best regards,
> > Krzysztof
> >
>

