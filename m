Return-Path: <linux-doc+bounces-94332-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bwlPDDP4RGoM4QoAu9opvQ
	(envelope-from <linux-doc+bounces-94332-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 01 Jul 2026 13:21:23 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9291A6ECBD3
	for <lists+linux-doc@lfdr.de>; Wed, 01 Jul 2026 13:21:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="lCBpK/qC";
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94332-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94332-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5FDB230CF1D0
	for <lists+linux-doc@lfdr.de>; Wed,  1 Jul 2026 11:08:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A52B43CEFE;
	Wed,  1 Jul 2026 11:07:50 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2993642DFF6;
	Wed,  1 Jul 2026 11:07:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782904070; cv=none; b=AleJkUBWvLXF38qtmKajfrhGQADOLXu842u4lsMIvSBIU2c7Ynauo4JSpW6rTvpCu6wPJ43QCKUR+mvP/y7kHtRNyEywskGLWbFwcvrQV6WurACxTYJ7VUDkRTV5mZeDhIvcWIofm48guqfEXnS6wCgUJh+Cp+YUjCbg7Tw6UDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782904070; c=relaxed/simple;
	bh=NJLKXuAy7Y09RSdhb1EYekxiJOEEQTEVUn+u+kA7hG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mSvzBMFgkK4gWxpzrKJARgy1bSHNPDRAey4o/71Kk4LL5bUDfmarGAj0P1qBCD8/vUEB9XctWyWfIn9gFko9dUBXkF1YOWWcM2euhFNINcgsN756AmQChZCCJ9Ee6deJrqbfjxFYJmsTm31nebz+Hn9+MxxLU/AItKs6MfM2S5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lCBpK/qC; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED5681F000E9;
	Wed,  1 Jul 2026 11:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782904068;
	bh=nQ4PsDHYabC62Okbc3S5UnoU2U7Ydz2PKMaX+5DJstc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lCBpK/qCLR0Wp8AMFtVO2ZYKGh9TJDJPL16mIuJ2LZBUdPDw0MaNMgtyuiuCaPChT
	 M+8NfHmujqdqKDN0WuRF13M6FiO7GqG+2tudMLyW41C2O1Oowh+ty83dVJ/bAQuIwY
	 mIAuBL2zzyd9UZTAelVEZjhAkYYYsDUJXJHi8DubvpitE6aKob3L2hzZTQgSa4HBPp
	 oGVjBe4yS5HDCYir4Jkfe4jcnGp5FNv7PBAJT9B4amHZffTze/tFBA4QosYBlhSj/3
	 r40OIoXB0aaove71G2aMs/TB7eE4jEcUP0AdbW9sX7TZ2aCO/Fij19i8EnJeBt09J1
	 09V/U5cvYPh/Q==
Date: Wed, 1 Jul 2026 12:07:43 +0100
From: Conor Dooley <conor@kernel.org>
To: Janani Sunil <janani.sunil@analog.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Mark Brown <broonie@kernel.org>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Janani Sunil <jan.sun97@gmail.com>,
	linux-spi@vger.kernel.org
Subject: Re: [PATCH v5 2/3] dt-bindings: iio: dac: Add AD5529R
Message-ID: <20260701-ardently-sloping-2d5ba83b61fb@spud>
References: <20260701-ad5529r-driver-v5-0-ed087900e642@analog.com>
 <20260701-ad5529r-driver-v5-2-ed087900e642@analog.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0M00TNO2mVEAmOIw"
Content-Disposition: inline
In-Reply-To: <20260701-ad5529r-driver-v5-2-ed087900e642@analog.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.26 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS(0.00)[m:janani.sunil@analog.com,m:lars@metafoo.de,m:Michael.Hennerich@analog.com,m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:p.zabel@pengutronix.de,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:broonie@kernel.org,m:linux-iio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:jan.sun97@gmail.com,m:linux-spi@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:jansun97@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94332-lists,linux-doc=lfdr.de];
	FORGED_SENDER(0.00)[conor@kernel.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-doc@vger.kernel.org];
	FREEMAIL_CC(0.00)[metafoo.de,analog.com,kernel.org,baylibre.com,pengutronix.de,lwn.net,linuxfoundation.org,vger.kernel.org,gmail.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[spud:mid,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9291A6ECBD3

--0M00TNO2mVEAmOIw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 01, 2026 at 08:40:40AM +0200, Janani Sunil wrote:

> +patternProperties:
> +  "^channel@([0-9a-f]{1,2})$":
> +    type: object
> +    description: Child nodes for individual channel configuration
> +
> +    properties:
> +      reg:
> +        description: Channel number.
> +        minimum: 0
> +        maximum: 63
> +
> +      spi,device-addr:
> +        $ref: /schemas/types.yaml#/definitions/uint32

Same comments apply here about whether this is a channel or a spi
peripheral level property.

> +        enum: [0, 1, 2, 3]
> +        description:
> +          Device address selected by the ID0 and ID1 pins. Up to four AD5529R
> +          devices can share a single SPI chip select; each device responds only
> +          to transfers whose address bits [13:12] match its configured address.
> +
> +      adi,output-range-microvolt:

I didn't notice this on the previous versions, but doesn't this
duplicate the common output-range-microvolt in dac.yaml, which you
should be including here because these channels are dacs?

pw-bot: changes-requested

Cheers,
Conor.

> +        description: |
> +          Output voltage range for this channel as [min, max] in microvolts.
> +          If not specified, defaults to 0V to 5V range.
> +        oneOf:
> +          - items:
> +              - const: 0
> +              - enum: [5000000, 10000000, 20000000, 40000000]
> +          - items:
> +              - const: -5000000
> +              - const: 5000000
> +          - items:
> +              - const: -10000000
> +              - const: 10000000
> +          - items:
> +              - const: -15000000
> +              - const: 15000000
> +          - items:
> +              - const: -20000000
> +              - const: 20000000

--0M00TNO2mVEAmOIw
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCakT0/gAKCRB4tDGHoIJi
0pnQAQD9lhRrxn1NbXQ8zdd56gFpnXVgtHwgo/R9/U8JU6MARgEAuKhd4IqN1Y05
FDtxSXMlM8NIEpnzxf86fNIaYlXdcgc=
=Qn0X
-----END PGP SIGNATURE-----

--0M00TNO2mVEAmOIw--

