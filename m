Return-Path: <linux-doc+bounces-95664-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hPlNKhcTTmplCgIAu9opvQ
	(envelope-from <linux-doc+bounces-95664-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 08 Jul 2026 11:06:31 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5E272372E
	for <lists+linux-doc@lfdr.de>; Wed, 08 Jul 2026 11:06:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=L3j5Dv3k;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95664-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-95664-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3F5163011A5B
	for <lists+linux-doc@lfdr.de>; Wed,  8 Jul 2026 09:04:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A34A3FBED0;
	Wed,  8 Jul 2026 09:04:12 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515313F39FC
	for <linux-doc@vger.kernel.org>; Wed,  8 Jul 2026 09:04:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783501452; cv=none; b=I5A6YH/YY9T+wgsfoudfddkQezks+oZOPmuXZvxX36jyVyrgXH++qBecsHqH6ww6lF8zJv8TPuwLx9TjhsxwFJP07suIZfODQaVzYiOFpFUFsATBCSz+3TCnqKZV9ITAZezOjnqo8xFmECWkKpUG6HKfu54wlDO/hbjl2tmu50U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783501452; c=relaxed/simple;
	bh=0ttgfS7PI7S6E/+kOsmnxTsnPvxIfwYSyy8onWHW/s4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XsJ1Gccng8H+iQW1jPrMiYdLa9jsgSXyKz3IWDalp1cMQWZJ6i9S9kk/0pZiTwaIRLW/nQr7d8428A3L/UoDeRb2wraYynqvzFgpGjyzioQH0xId4jyeOpQh3vqKUcR9/2jbAm65iQIIZ9kphvHqmk3heId/Ot/tVisN4iP1gPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=L3j5Dv3k; arc=none smtp.client-ip=209.85.128.47
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493c486f012so1608905e9.3
        for <linux-doc@vger.kernel.org>; Wed, 08 Jul 2026 02:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783501449; x=1784106249; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0ttgfS7PI7S6E/+kOsmnxTsnPvxIfwYSyy8onWHW/s4=;
        b=L3j5Dv3k9fRjX7AwgCgN6nByvWbpdyA/BXNAZaL72KePHNuh8HxoOnmsqA/lY/oin5
         1W0mKu3Te2JPj4CJ6BCJLOD93gGyns6I6H6+SZ5tFWayr2ybXqbzwgaTDQ3foLMtU/Gz
         qyzZQ00uH5sz99F1YNPmBHydCHi1Wix/qzhUXFywKEjFhTtbpNuUpy6jK/Uth9GGdlc9
         CBwyJAIu2oC1S6UcXK3/s/uUxLzHn5s8uNtPz6T9sP0YhPKRwahpHdmheYVk1o30vn85
         4mJtupsBX/sBjIzPi0Y2/E3+lFDhGMvuiwHboqVL/8WZS8RbuuOcX3BT+Ah+Q+WbQYEW
         KVgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783501449; x=1784106249;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0ttgfS7PI7S6E/+kOsmnxTsnPvxIfwYSyy8onWHW/s4=;
        b=M7YM/SY0hMWKiunsPfYCXe6p4e56ttgnchX+ozYglW1mKSO35vfWxd6wZUsXbJUNrb
         24uAfmTypcxje9Xh8H0/6c5PGOpfQZRyhTZ/mimvTS4f1pPrFyIybfHjw2MXNLnOHNwY
         bjq6LYQkSmYZYdwutrRXHyeBMZIjwXx/t9URRwtHqi9eN2YVShCftodhUiS3RteKRDgT
         dRNL8Oumw/vAVolZ/tCQD3aJ/DCaWpWVYr/MJ6pfsPbkbYonoZIYX0mN7ZBVO1j/vFEp
         il6jMeEMvnFmv14Pz3+wQUVRQup/O727vzMeqFJk0wocSRHi9OZB23TtUpsWmiTZnZSP
         gLLg==
X-Forwarded-Encrypted: i=1; AHgh+Rqgr/ScHebIHeHCsLyQ2HqB9XvLuBnM7E1eh/yIVqxsbkECEQNzuCaQuGPStm5FQ/Y1TCgN1LuQCvQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaRd+nAC8piit8Q0aPyiww4VSkYwWz8vn0Igps2IRtbZ7ZBkCN
	21YuGdAaLtA8vC8bnSdljkeNxjcK4VzzNepCr8RUAheUBvRYEiDks4SwFIDc+mUW28Y=
X-Gm-Gg: AfdE7cnqtToi/H/7A1si3lvNfqwJhMUksFn8WNA5wwibtJJASHGPSRcyBiEkQFfUY/y
	yejTPm6MootJtNY0vl8peCy5Nr296yqm9gEJLet4QTHySICyBshXFWSYbu7XDKcZUgkGp6UCRC7
	YR6zTui+zSKkOdwF7NbYH8FjKzpmCKXLaKeL70DDUwAn8P7MtO/tUsrkO+O50b4kBZ8uTLYTsh2
	hUreNeX3h8hiBJ5RwHf3dyX6Rd/rhLoGmqH0MRHtfHY9Uo+YM/WuotgE0JWA2smRsEw5KDzvn5z
	3cnOtnFuMWxboS7HWTVAHKmb5NKghKOrkMzeugTaUEPWhCNXvg8HqgI18mvNqJaeijOQZPm9nCl
	DBn+qks4TFNoXm+8EfnkhZw2w+tIBVQowEmkmV4jnALeWKCvQLcdcRPnOh8NjSZPILwwXEo0oC3
	7hGcI++H8p8nOaZoAbmG1o8A62cgRCjh9ynIGMdJkbkYfw2hq+reiJkl+kXPAWCKp3VtgnoJhcV
	yLo
X-Received: by 2002:a05:600c:8119:b0:490:9d1b:f086 with SMTP id 5b1f17b1804b1-493e686ad70mr14985975e9.14.1783501448658;
        Wed, 08 Jul 2026 02:04:08 -0700 (PDT)
Received: from localhost (p200300f65f47db04930dc5bd4534e1e5.dip0.t-ipconnect.de. [2003:f6:5f47:db04:930d:c5bd:4534:e1e5])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493e0f3318dsm111773165e9.3.2026.07.08.02.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 02:04:07 -0700 (PDT)
Date: Wed, 8 Jul 2026 11:04:06 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: rodrigo.alencar@analog.com
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-hardening@vger.kernel.org, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH v7 10/17] iio: frequency: ad9910: initial driver
 implementation
Message-ID: <ak4SSFQZVVh6DuGy@monoceros>
References: <20260707-ad9910-iio-driver-v7-0-a4ec30f63700@analog.com>
 <20260707-ad9910-iio-driver-v7-10-a4ec30f63700@analog.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zsfy6shrbu2mdzpn"
Content-Disposition: inline
In-Reply-To: <20260707-ad9910-iio-driver-v7-10-a4ec30f63700@analog.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:rodrigo.alencar@analog.com,m:linux-iio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:lars@metafoo.de,m:Michael.Hennerich@analog.com,m:jic23@kernel.org,m:dlechner@baylibre.com,m:andy@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:p.zabel@pengutronix.de,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	DMARC_NA(0.00)[baylibre.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-95664-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[baylibre.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,monoceros:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1D5E272372E


--zsfy6shrbu2mdzpn
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v7 10/17] iio: frequency: ad9910: initial driver
 implementation
MIME-Version: 1.0

Hello,

On Tue, Jul 07, 2026 at 03:04:31PM +0100, Rodrigo Alencar via B4 Relay wrote:
> +#include <linux/mod_devicetable.h>

Please don't add new users for this header file. Only use those
<linux/device-id/*.h> that you actually need (if any).

Thanks
Uwe

--zsfy6shrbu2mdzpn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpOEoIACgkQj4D7WH0S
/k6KCwf/Vgjpa4Op4HxG6UMD29jr9xEIWuo5E45vasyVBmM8XpQPLy8lof6Ftx5z
hKUALu3RTBas4V+7sxlgbyGcbnq3sn+fG8nq0zuMmYjJ/Yt3M40ysryX0FyOJhBD
nReg2c3lQ7EsVtCcBMpvuPCBq8hb/gzAJ5gW46cP068KzoGgP5Tp31EtZ8W3+Uyv
/7p6nWKibQVKI+yB08a0JQK/A9KbjYfbLR/kJdIn62ypQBOxx5i/w9EQ4a+1qHzI
HorFt9nltPe4VidIEEsFE7pylt1wW2O8crfi83ZvbFtBPUAtG2EOBpVQ2PRPZhFU
mXtkyx5tKMD50sJB81tvJVJzv/vpGw==
=WxHJ
-----END PGP SIGNATURE-----

--zsfy6shrbu2mdzpn--

