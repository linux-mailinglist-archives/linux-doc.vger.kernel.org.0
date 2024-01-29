Return-Path: <linux-doc+bounces-7717-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 692F684064B
	for <lists+linux-doc@lfdr.de>; Mon, 29 Jan 2024 14:10:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F58C1F262FC
	for <lists+linux-doc@lfdr.de>; Mon, 29 Jan 2024 13:10:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A80F0629FA;
	Mon, 29 Jan 2024 13:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="lkJJhIQY"
X-Original-To: linux-doc@vger.kernel.org
Received: from aposti.net (aposti.net [89.234.176.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A9F62805;
	Mon, 29 Jan 2024 13:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.234.176.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706533630; cv=none; b=tRqrbhgulL9qOau4pBj/A9u069C6ycS0dBp5yQjr/ADgKDyqgPrnhd8rR1M6L+/eYr7zld9P7crIJZwy/sh4Qhu0Mf4zAFBDyj/BXF4eqIWGRpQDzFMcfa/g0SQj81Bf61DdbJjo424NkqXtHCy75iXORrHHedvLfFYgRKO3FuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706533630; c=relaxed/simple;
	bh=ohwrdZDM8vaPRClPA73d/eC9TaOp9u2xSfByKk4W4Wc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BVanrIfzaTZ9vgGaRuPfMy9BkfNK1UtvTf/kpORf43yh40m5ikDa1czUhJVrF/kcSMPu7G1IU8WjUldaAjWDZtdnlTg9No7KXETtkmy9SOn5gxb8j1h/59oGfovKt08bCSYiqBF2IF8fGFyQVb82XCvKsiiqHAER+qX7TnFLmho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net; spf=pass smtp.mailfrom=crapouillou.net; dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b=lkJJhIQY; arc=none smtp.client-ip=89.234.176.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crapouillou.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
	s=mail; t=1706533620;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=WZ6n1UUyKZ6/GqoAl9C1IKiMh8xfnXYw9yivuJaenjc=;
	b=lkJJhIQY7TfMtm88L38sEkEJxselNAE/Twb2fKnBQqdR6TXUlZ2g4KFkZoV01JpOgc4RAR
	rYr2XoaTW10D8p2tIFa0TUtnH8Nx8VUwnoNONT3e/nD7GZ+aKpfpdjZxhhLhw4eziLUrZs
	1uCNQrzVPFDxkK4VvOHIVRP3VMh3YSE=
Message-ID: <aac82ce15a49c5e4b939a69229b9a8a51ca00f5d.camel@crapouillou.net>
Subject: Re: [PATCH v5 5/8] iio: core: Add new DMABUF interface
 infrastructure
From: Paul Cercueil <paul@crapouillou.net>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
	Jonathan Cameron
	 <jic23@kernel.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>, Sumit Semwal
 <sumit.semwal@linaro.org>,  Vinod Koul <vkoul@kernel.org>, Jonathan Corbet
 <corbet@lwn.net>, linux-doc@vger.kernel.org,  linux-kernel@vger.kernel.org,
 dmaengine@vger.kernel.org,  linux-iio@vger.kernel.org,
 linux-media@vger.kernel.org,  dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Nuno =?ISO-8859-1?Q?S=E1?=
 <noname.nuno@gmail.com>, Michael Hennerich <Michael.Hennerich@analog.com>
Date: Mon, 29 Jan 2024 14:06:58 +0100
In-Reply-To: <d6bef39c-f940-4097-8ca3-0cf4ef89a743@amd.com>
References: <20231219175009.65482-1-paul@crapouillou.net>
	 <20231219175009.65482-6-paul@crapouillou.net>
	 <20231221120624.7bcdc302@jic23-huawei>
	 <ee5d7bb2fb3e74e8fc621d745b23d1858e1f0c3c.camel@crapouillou.net>
	 <20240127165044.22f1b329@jic23-huawei>
	 <d6bef39c-f940-4097-8ca3-0cf4ef89a743@amd.com>
Autocrypt: addr=paul@crapouillou.net; prefer-encrypt=mutual;
 keydata=mQENBF0KhcEBCADkfmrzdTOp/gFOMQX0QwKE2WgeCJiHPWkpEuPH81/HB2dpjPZNW03ZMLQfECbbaEkdbN4YnPfXgcc1uBe5mwOAPV1MBlaZcEt4M67iYQwSNrP7maPS3IaQJ18ES8JJ5Uf5UzFZaUawgH+oipYGW+v31cX6L3k+dGsPRM0Pyo0sQt52fsopNPZ9iag0iY7dGNuKenaEqkYNjwEgTtNz8dt6s3hMpHIKZFL3OhAGi88wF/21isv0zkF4J0wlf9gYUTEEY3Eulx80PTVqGIcHZzfavlWIdzhe+rxHTDGVwseR2Y1WjgFGQ2F+vXetAB8NEeygXee+i9nY5qt9c07m8mzjABEBAAG0JFBhdWwgQ2VyY3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0PokBTgQTAQoAOBYhBNdHYd8OeCBwpMuVxnPua9InSr1BBQJdCoXBAhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEHPua9InSr1BgvIH/0kLyrI3V0f33a6D3BJwc1grbygPVYGuC5l5eMnAI+rDmLR19E2yvibRpgUc87NmPEQPpbbtAZt8On/2WZoE5OIPdlId/AHNpdgAtGXo0ZX4LGeVPjxjdkbrKVHxbcdcnY+zzaFglpbVSvp76pxqgVg8PgxkAAeeJV+ET4t0823Gz2HzCL/6JZhvKAEtHVulOWoBh368SYdolp1TSfORWmHzvQiCCCA+j0cMkYVGzIQzEQhX7Urf9N/nhU5/SGLFEi9DcBfXoGzhyQyLXflhJtKm3XGB1K/pPulbKaPcKAl6rIDWPuFpHkSbmZ9r4KFlBwgAhlGy6nqP7O3u7q23hRW5AQ0EXQqFwQEIAMo+MgvYHsyjX3Ja4Oolg1Txzm8woj30ch2nACFCqaO0R/1kLj2VVeLrDyQUOlXx9PD6IQI4M8wy8m0sR4wV2p/g/paw7k65cjzYYLh+FdLNyO7IW
	YXndJO+wDPi3aK/YKUYepqlP+QsmaHNYNdXEQDRKqNfJg8t0f5rfzp9ryxd1tCnbV+tG8VHQWiZXNqN7062DygSNXFUfQ0vZ3J2D4oAcIAEXTymRQ2+hr3Hf7I61KMHWeSkCvCG2decTYsHlw5Erix/jYWqVOtX0roOOLqWkqpQQJWtU+biWrAksmFmCp5fXIg1Nlg39v21xCXBGxJkxyTYuhdWyu1yDQ+LSIUAEQEAAYkBNgQYAQoAIBYhBNdHYd8OeCBwpMuVxnPua9InSr1BBQJdCoXBAhsMAAoJEHPua9InSr1B4wsH/Az767YCT0FSsMNt1jkkdLCBi7nY0GTW+PLP1a4zvVqFMo/vD6uz1ZflVTUAEvcTi3VHYZrlgjcxmcGu239oruqUS8Qy/xgZBp9KF0NTWQSl1iBfVbIU5VV1vHS6r77W5x0qXgfvAUWOH4gmN3MnF01SH2zMcLiaUGF+mcwl15rHbjnT3Nu2399aSE6cep86igfCAyFUOXjYEGlJy+c6UyT+DUylpjQg0nl8MlZ/7Whg2fAU9+FALIbQYQzGlT4c71SibR9T741jnegHhlmV4WXXUD6roFt54t0MSAFSVxzG8mLcSjR2cLUJ3NIPXixYUSEn3tQhfZj07xIIjWxAYZo=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Christian,

Le lundi 29 janvier 2024 =C3=A0 13:52 +0100, Christian K=C3=B6nig a =C3=A9c=
rit=C2=A0:
> Am 27.01.24 um 17:50 schrieb Jonathan Cameron:
> > > > > +	iio_buffer_dmabuf_put(attach);
> > > > > +
> > > > > +out_dmabuf_put:
> > > > > +	dma_buf_put(dmabuf);
> > > > As below. Feels like a __free(dma_buf_put) bit of magic would
> > > > be a
> > > > nice to have.
> > > I'm working on the patches right now, just one quick question.
> > >=20
> > > Having a __free(dma_buf_put) requires that dma_buf_put is first
> > > "registered" as a freeing function using DEFINE_FREE() in
> > > <linux/dma-
> > > buf.h>, which has not been done yet.
> > >=20
> > > That would mean carrying a dma-buf specific patch in your tree,
> > > are you
> > > OK with that?
> > Needs an ACK from appropriate maintainer, but otherwise I'm fine
> > doing
> > so.=C2=A0 Alternative is to circle back to this later after this code i=
s
> > upstream.
>=20
> Separate patches for that please, the autocleanup feature is so new
> that=20
> I'm not 100% convinced that everything works out smoothly from the
> start.

Separate patches is a given, did you mean outside this patchset?
Because I can send a separate patchset that introduces scope-based
management for dma_fence and dma_buf, but then it won't have users.

Cheers,
-Paul

