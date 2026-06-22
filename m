Return-Path: <linux-doc+bounces-93124-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FBOEBHqBOWpSugcAu9opvQ
	(envelope-from <linux-doc+bounces-93124-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 22 Jun 2026 20:39:54 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 555716B1D10
	for <lists+linux-doc@lfdr.de>; Mon, 22 Jun 2026 20:39:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=eddX1OD+;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93124-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-93124-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 14DF9302001F
	for <lists+linux-doc@lfdr.de>; Mon, 22 Jun 2026 18:39:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAABD34676F;
	Mon, 22 Jun 2026 18:39:50 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66AE345751;
	Mon, 22 Jun 2026 18:39:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782153590; cv=none; b=tu/Vg6kXIS69MoZQGqPvoEkcpQiByjCj/SWYHq0LI68hJJMHiQfT/zW24D24eZuKyl0OhCVUPSD64eeU3LtjW3CQ1NCwMZH0Ey3hVn4zliqNta0Gz4aRy0kzRQt/URsqbFHOVQ5amGSTRuF7xV+476r1SC3wNdc/k+Qrv5aO+Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782153590; c=relaxed/simple;
	bh=P1Z8Kb1kgC1UU4dsPEHbpnrtWggCM0AVbBdG4S8RsTw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VhtvJSjSeVwwK6LM6dBdkXU+sT2s3R3NVEe74jFwsbCGR6rpHVpPBfxfVy2JMDLp6gyvzVEnlYUHwqUcrzlADWrKxin8M7TL6RKI5sdc5Fv96Y7yO9RjCjfg7gPzxm0pnQ3bwYpRr4S1mE+ORjYeZwDkkP1ZYenP1kh2p/q3p6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eddX1OD+; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6644F1F000E9;
	Mon, 22 Jun 2026 18:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782153589;
	bh=mTAUX7iL8MIKP459YDbkJrM5XX2iCJ+gAz986kzvZy4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eddX1OD+d1gw/xDyzjjgWxZnM+/v0Zw1KG0RgLC/osLVhHAAztmm6Ce5f4z2dZ8MV
	 lKFPsXx4lyc8uYnYyWJgj7MFqyFQqsGhXSA9Cl7IWTX1CgB+6b7mUU5YKVGjXwyjo5
	 U2wcw0DK5u2DkzvILF/UyuOeaEq5ukPeY6PNSq1HZqDaQ15/PeoTjk92FhM1R03LN1
	 qnXFJ0iry1RWM0T7Ro5YZNZ9B1khrBJVM2kV86JZZWGb3vFpPjEfJzr1GZyqkiyxdi
	 daKcQKVtOmfL8gkrCF8BnKhwsnTZsGfBQ9BYAEJwR5022V6bb3MSdACP8fK9AtvxJo
	 Hflt/27xVeCzg==
Date: Mon, 22 Jun 2026 19:39:43 +0100
From: Conor Dooley <conor@kernel.org>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Nuno =?iso-8859-1?Q?S=E1?= <noname.nuno@gmail.com>,
	Rodrigo Alencar <455.rodrigo.alencar@gmail.com>,
	Janani Sunil <jan.sun97@gmail.com>,
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
Message-ID: <20260622-captive-tux-067efd31ceac@spud>
References: <076d7d2d-81a0-49c2-af94-bd65ead66c09@gmail.com>
 <20260619-obstinate-polo-a230bef97fda@spud>
 <20260619-bunch-diocese-dd7805cc17ff@spud>
 <ajU73_TkKrSbqD4f@nsa>
 <20260619-concierge-doozy-9c161533c369@spud>
 <ajVlD-j0nIGrRVow@nsa>
 <20260621153330.79b6600c@jic23-huawei>
 <5u4dnsgxwcwie45f24cacyzf3dko4srhyyyhcpom6tsvhqtmpc@y7d7gmex6n7k>
 <ajkMBh-R_7pYaoAn@nsa>
 <20260622172911.48259a0c@jic23-huawei>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LINbEWIvA6tlgjut"
Content-Disposition: inline
In-Reply-To: <20260622172911.48259a0c@jic23-huawei>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.26 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_RECIPIENTS(0.00)[m:jic23@kernel.org,m:noname.nuno@gmail.com,m:455.rodrigo.alencar@gmail.com,m:jan.sun97@gmail.com,m:janani.sunil@analog.com,m:lars@metafoo.de,m:Michael.Hennerich@analog.com,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:p.zabel@pengutronix.de,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-iio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:broonie@kernel.org,m:nonamenuno@gmail.com,m:455rodrigoalencar@gmail.com,m:jansun97@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93124-lists,linux-doc=lfdr.de];
	FORGED_SENDER(0.00)[conor@kernel.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-doc@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,analog.com,metafoo.de,baylibre.com,kernel.org,pengutronix.de,lwn.net,linuxfoundation.org,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,spud:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 555716B1D10


--LINbEWIvA6tlgjut
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 22, 2026 at 05:29:11PM +0100, Jonathan Cameron wrote:
> > > > Yeah. It's not clear to me how that works for the microchip devices
> > > > (I suspect it doesn't!)
> > > >=20
> > > > Just thinking as I type, but could we do something a bit nasty with
> > > > a gpio mux that doesn't actually switch but represents the GPIO bei=
ng
> > > > shared?  Given this is all tied to the spi bus that should all happ=
en
> > > > under serializing locks.=20
> > > >=20
> > > > Agreed though that this would be nicer as an SPI thing that let
> > > > us specify that a single CS is share by multiple devices and their
> > > > is some other signal acting to select which one we are talking to.
> > > >  =20
> > >=20
> > > If the device-addressing on the same chip-select is to be handled
> > > by the spi framework, wouldn't we lose device-specific features?
> > >=20
> > > I understand that this multi-device feature is there mostly to extend=
 the
> > > channel count from 16 to 32, 48 or 64. I suppose the command:
> > >=20
> > > 	"MULTI DEVICE SW LDAC MODE"
> > >=20
> > > exists so that software can update channel values accross multiple de=
vices. =20
> >=20
> > Right! You do have a point! I agree the main driver for a feature like
> > this is likely to extend the channel count and effectively "aggregate"
> > devices.
> >=20
> > But I would say that even with the spi solution the MULTI DEVICE stuff
> > should be doable (as we still need a sort of adi,pin-id property).=20
> >=20
> > But yes, I do feel that the whole feature is for aggregation so seeing
> > one device with 32 channels is the expectation here? Rather than seeing
> > two devices with 16 channels.
>=20
> Agreed - if we have messages that address both devices at once that needs
> to be a unified driver and given they are about triggering simultaneous
> update of all channels it needs to look like one big device.
> This ends up similar to how we handle daisy chain devices.
>=20
> The question of what to do on devices that don't have this feature
> is rather different. Good thing you read the datasheet :)

I'm not sure it really is, the intent for the microchip devices I think
is pretty similar. The mcp3911 datasheet cites three-phase power
metering using three devices as a typical use-case, for example.
Probably creating an amalgamated device is a good fit there too?

I assume an amalgamated device for this ADI product means per-channel ID
properties? If so, I think they should be made generic and the Microchip
products retrofitted to use them, with a fallback to the proprietary
property. Not going to ask for the support for multiple devices in those
drivers, since the current way doesn't work and there'd be no loss of
support. Someone from Microchip can do that. The proprietary property
to generic conversion should be straightforward and provides weight to
an argument for this being generic, since that'd be three devices that
can all share?

--LINbEWIvA6tlgjut
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCajmBbwAKCRB4tDGHoIJi
0s7YAP0VfL1OuHJwk04s+lI2XMRzrfrP41oK6CFEBDAEWEQzfAEA1S8DE6xpjMxY
7GwAtQ0Q8puQZd3ZbpZoY2n5JedDEgs=
=W4pc
-----END PGP SIGNATURE-----

--LINbEWIvA6tlgjut--

