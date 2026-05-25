Return-Path: <linux-doc+bounces-89384-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 3cCRMxd5FGrbNgcAu9opvQ
	(envelope-from <linux-doc+bounces-89384-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 25 May 2026 18:30:15 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E625CCE31
	for <lists+linux-doc@lfdr.de>; Mon, 25 May 2026 18:30:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8290B30117A4
	for <lists+linux-doc@lfdr.de>; Mon, 25 May 2026 16:30:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0AF93F5BD8;
	Mon, 25 May 2026 16:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hNb4uZSk"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA443F5BD7;
	Mon, 25 May 2026 16:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779726611; cv=none; b=AQvpAKmYPwELDfUaJMxslejVFCY54skgWsk1F951HQ0sPYwQ9mRCG0XNOe0IFWDgx700ZTj9vLS/RbqVNPljwHu8lKQz0pBRAbkQ4aNJE2cvr28A1XkgkICB6nluQBpQZXQdUG6BBwC64dlKo6u2UaZrl+VIVGRNfy2mqLOCuy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779726611; c=relaxed/simple;
	bh=+UxIrZYQCZEEiS7KeSOLtxAWKDIemVLC311YUWDD9NY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rRY6MIYqTCVyniUTnt6RDhBoTTmrGE/pc301vXIqOtLlPOpqECEnAPNhLDixLa2fV68Huoe26aD1X05yDLXY83yU7XcrWCZDaNJkNxjGPyO++RJqITsuSSNdlu3Ujlclh5R1y8VbtBQG19XDA9LyNuvIJ0NK80kvBP/EYPySCHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hNb4uZSk; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A8471F000E9;
	Mon, 25 May 2026 16:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779726607;
	bh=7e4ZjPZTzdJ7a9vb91nzCeyvVjuclLuvDc6BQmWdQRU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hNb4uZSkYgaa7z+NOOVNswqhmvL0sto1/BW92/7A0PCsitvkCNDEE/IqWczRrstTu
	 cPVqHJSqnY4uPhcyFC65BTLNGRoujQQCIBF5wqFIYstIfQebYILF53K0iAPUW8AYeE
	 dRmcWb6+MZweGAhfCAvawH0B64aQoVKc4SOiQ+/UX6z5HdC0HkUiAv9R3/i0pPTI5w
	 X72+lD+rX+WkfDv72k952vCturPts5k+JYofr3qm4cOOvQuhwZ7HtIocQVE+Q45/Xc
	 yEXBQSgi4Qk4+g5jErOy8ROfdp2y9hFFbzW+rUyVRKEj1RS8O9Tnjw5zCbD5u+GU2j
	 aNZMfrUIDMSxw==
Date: Mon, 25 May 2026 17:30:02 +0100
From: Conor Dooley <conor@kernel.org>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Janani Sunil <janani.sunil@analog.com>,
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
	linux-doc@vger.kernel.org, Janani Sunil <jan.sun97@gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: iio: dac: Add AD5529R
Message-ID: <20260525-dedicator-strut-6f7618a92180@spud>
References: <20260519-ad5529r-driver-v3-0-267c0731aa68@analog.com>
 <20260519-ad5529r-driver-v3-1-267c0731aa68@analog.com>
 <20260522180207.63b725fb@jic23-huawei>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6uUOUNcFd2y0rFek"
Content-Disposition: inline
In-Reply-To: <20260522180207.63b725fb@jic23-huawei>
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-89384-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[analog.com,metafoo.de,baylibre.com,kernel.org,pengutronix.de,lwn.net,linuxfoundation.org,vger.kernel.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[analog.com:url,analog.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 82E625CCE31
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--6uUOUNcFd2y0rFek
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 22, 2026 at 06:02:07PM +0100, Jonathan Cameron wrote:
> On Tue, 19 May 2026 17:42:58 +0200
> Janani Sunil <janani.sunil@analog.com> wrote:
>=20
> > Devicetree bindings for AD5529R 16 channel 12/16 bit high voltage,
> > buffered voltage output digital-to-analog converter (DAC) with an
> > integrated precision reference.
>=20
> Note that I'm seeing this as Changes Requested in the DT-binding patchwork
> but didn't see any replies.
>=20
> Seems I didn't get the sashiko reply - nor did the IIO patchwork.
> Hopefully Janani did!
> https://patchwork.kernel.org/project/devicetree/patch/20260519-ad5529r-dr=
iver-v3-1-267c0731aa68@analog.com/

The sashiko stuff is per subsystem or something, so dt stuff only goes
to us and the submitters. I think that's kinda stupid but also probably
required to avoid pissing people off. There's quite a bit of noise
generated by it, especially with it repeating the same incorrect stuff
on every version.

>=20
> >=20
> > Signed-off-by: Janani Sunil <janani.sunil@analog.com>
> > ---
> >  .../devicetree/bindings/iio/dac/adi,ad5529r.yaml   | 217 +++++++++++++=
++++++++
> >  MAINTAINERS                                        |   7 +
> >  2 files changed, 224 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/iio/dac/adi,ad5529r.yaml=
 b/Documentation/devicetree/bindings/iio/dac/adi,ad5529r.yaml
> > new file mode 100644
> > index 000000000000..eb66f6ca063d
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/iio/dac/adi,ad5529r.yaml
> > @@ -0,0 +1,217 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/iio/dac/adi,ad5529r.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Analog Devices AD5529R 16-Channel 12/16-bit High Voltage DAC
> > +
> > +maintainers:
> > +  - Janani Sunil <janani.sunil@analog.com>
> > +
> > +description: |
> > +  The AD5529R is a 16-channel, 12-bit or 16-bit, high voltage, buffere=
d voltage output
>=20
> Long line. Check the wrap.
>=20
> > +  digital-to-analog converter (DAC) with an integrated precision refer=
ence.
> > +  The device operates from unipolar and bipolar supplies. It is guaran=
teed
> > +  monotonic and has built-in rail-to-rail output buffers that can sour=
ce or
> > +  sink up to 25mA.
> > +
> > +  Specifications:
> > +  * 16 independent 12-bit or 16-bit DAC channels
> > +  * Independently programmable output ranges: 0V to 5V, 0V to 10V, 0V =
to 20V,
> > +    0V to 40V, =B15V, =B110V, =B115V, and =B120V
> > +  * The device supports SPI communication with Mode 0 and Mode 3.
> > +  * 4.096V precision reference, 12ppm/=B0C maximum
> > +  * Built-in function generation: Toggle, Sinusoidal Dither, and Ramp =
waveforms
> > +  * Multiplexer for output voltage, load current sense and die tempera=
ture
> > +
> > +  Datasheet: https://www.analog.com/media/en/technical-documentation/d=
ata-sheets/ad5529r.pdf
> > +
>=20
> > +patternProperties:
> > +  "^channel@([0-9]|1[0-5])$":
>=20
> Sashiko commented that this should be hex.  Why the forcing to decimal?
>=20

--6uUOUNcFd2y0rFek
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCahR5CgAKCRB4tDGHoIJi
0tLtAQD2NkZ3SKvwFKlYRM6tkItnO0qro7viL1UlnWD1XTzOKAEA2QVFNfAlYphU
rSUGx+kylIOdUu3kU2WYXyI0bqasvQU=
=TboO
-----END PGP SIGNATURE-----

--6uUOUNcFd2y0rFek--

