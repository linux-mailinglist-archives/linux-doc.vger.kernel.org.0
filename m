Return-Path: <linux-doc+bounces-93406-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EcTbKmAHPGqEiwgAu9opvQ
	(envelope-from <linux-doc+bounces-93406-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 24 Jun 2026 18:35:44 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2326C0007
	for <lists+linux-doc@lfdr.de>; Wed, 24 Jun 2026 18:35:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="bdT/RH5T";
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93406-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-93406-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7BC3A3020028
	for <lists+linux-doc@lfdr.de>; Wed, 24 Jun 2026 16:35:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88DEE315D58;
	Wed, 24 Jun 2026 16:35:37 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED78314B8F;
	Wed, 24 Jun 2026 16:35:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782318937; cv=none; b=kdcCXd8bpIv0C/k88q1C/UZOa8tNFhaKcvFvFBKLm9XWkwekKtPByU9wWHQ8lUcxlvUhvUtCkodTGU2yhdlcKHI79DNwHA8IdacQynnxJQJw2gA3f3IeoON/Zh8g2q0N+sloDGbxynfVyS6fvQqyT1YrFZVeUO86p0cBchtcS/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782318937; c=relaxed/simple;
	bh=iX+qCbQAUBwySYYfmw+ejL2gxBV075rCGNnrHZXjQes=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o3SCLE9aNYkIsfvkGSwVvTgyVDaxjB1DPRkVwckKuetJ31dHeLD6ggYz9hPl3pm+mRFn3wSYKlW05LAJKww3kgUiKa7KvP+vPqkpunLqG97kQa2EW5tnPqTn4a1yfE+BQ04l0jiPTTVHFnII9OUdEr80ehK+T31ciCRzhYWs5JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bdT/RH5T; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E2981F00A3A;
	Wed, 24 Jun 2026 16:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782318936;
	bh=Z4kk0HrMKq/Q0UwY7zGO5VYhmHv7vIkGKvZwhgl85Fs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bdT/RH5TtEIJC+MX16Olkc11UeyGwkBOEePW0zTcpTt3miR7VL0hd20cyubpFKtnp
	 1NDBKOyvsHCqXz4j9th2dZ9+SVlQaCWTEG/Mr4mKnNJhN1FVqYkuX3vhI3WnUyI91O
	 GvH0+0a10za14C9VHOjuK8ke0IWTf+dFA1zhnhXz6piMzdUEqAuXZIT/aRaLop7TR3
	 8qD0uJozVkaPbUgcIjrF0kyShqLSKEFx+9phWInc2j+bgVHmOKBhEAjMhiKZDvtTXd
	 wdEUa39chaVXdhbx3EUclxGlHcFkLqIw4Xzn5ihUgcoDLC8nHZYPhBr+aN+0Ix/RqS
	 5OghWkvcBrthw==
Date: Wed, 24 Jun 2026 17:35:30 +0100
From: Conor Dooley <conor@kernel.org>
To: Janani Sunil <jan.sun97@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Rodrigo Alencar <455.rodrigo.alencar@gmail.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <noname.nuno@gmail.com>,
	Janani Sunil <janani.sunil@analog.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: iio: dac: Add AD5529R
Message-ID: <20260624-shriek-condone-b33de4f596ec@spud>
References: <ajVlD-j0nIGrRVow@nsa>
 <20260621153330.79b6600c@jic23-huawei>
 <5u4dnsgxwcwie45f24cacyzf3dko4srhyyyhcpom6tsvhqtmpc@y7d7gmex6n7k>
 <ajkMBh-R_7pYaoAn@nsa>
 <pifhwgj3cp2vc7ia4m6penh52iekzjljrp75y5b7j57vvtooad@32wfqruiqqjl>
 <ajklksIDLsj0BZul@nsa>
 <5guhkvoxhkzevjm4b45hhk3772akpnz3givr3gb56x5ywamzyf@oiycreun4y62>
 <20260623155732.318f34f2@jic23-huawei>
 <9abc53d0-432f-48fc-9e21-4d9a3c5e129f@gmail.com>
 <20260624-decrease-protector-6c883bd1ac47@spud>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WMWGjHXn8EdeWrF5"
Content-Disposition: inline
In-Reply-To: <20260624-decrease-protector-6c883bd1ac47@spud>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.26 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-93406-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_RECIPIENTS(0.00)[m:jan.sun97@gmail.com,m:jic23@kernel.org,m:455.rodrigo.alencar@gmail.com,m:noname.nuno@gmail.com,m:janani.sunil@analog.com,m:lars@metafoo.de,m:Michael.Hennerich@analog.com,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:p.zabel@pengutronix.de,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-iio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:broonie@kernel.org,m:jansun97@gmail.com,m:455rodrigoalencar@gmail.com,m:nonamenuno@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[conor@kernel.org,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-doc@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,analog.com,metafoo.de,baylibre.com,pengutronix.de,lwn.net,linuxfoundation.org,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ED2326C0007


--WMWGjHXn8EdeWrF5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 24, 2026 at 05:32:26PM +0100, Conor Dooley wrote:

> >     dac@0 {
> >         compatible =3D "adi,ad5529r-16";
> >         reg =3D <0>;
> >         adi,device-addrs =3D <0 1>;
>=20
> I think this should be put in the channel itself and made generic.

I guess I should expand on that, putting it in the channel means it's
not tied to some device-specific knowledge about when each device
address is used.
It should be generic because there are at least 3 devices, from 2
different vendors, that we know of, using the exact same scheme.

> >         reset-gpios =3D <&gpio0 87 GPIO_ACTIVE_LOW>;
> >         vdd-supply  =3D <&vdd_reg>;
> >         hvdd-supply =3D <&hvdd_reg>;
> >=20
> >         channel@0  { reg =3D <0>;  adi,output-range-microvolt =3D <0 50=
00000>; };
> >         channel@16 { reg =3D <16>; adi,output-range-microvolt =3D <0 40=
000000>; };
> >     };
> >=20
> > Does this look reasonable to everyone?
> >=20
> > Regards,
> > Janani Sunil
> >=20



--WMWGjHXn8EdeWrF5
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHQEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCajwHUgAKCRB4tDGHoIJi
0nhLAP4wgrvst4IfZUk1vvpeL15upE92bqyykukZcM6dp2xoGwD1GqmVQmsZfafi
heDcZmsOS6givl5H1Zm3U1zaYk5GCw==
=8XW4
-----END PGP SIGNATURE-----

--WMWGjHXn8EdeWrF5--

