Return-Path: <linux-doc+bounces-94487-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +kL7Hjx5RWo1AwsAu9opvQ
	(envelope-from <linux-doc+bounces-94487-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 01 Jul 2026 22:31:56 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C982D6F1791
	for <lists+linux-doc@lfdr.de>; Wed, 01 Jul 2026 22:31:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=YF8F+Yne;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94487-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94487-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CED85300B3EE
	for <lists+linux-doc@lfdr.de>; Wed,  1 Jul 2026 20:31:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D92663A59B1;
	Wed,  1 Jul 2026 20:31:53 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7518366816;
	Wed,  1 Jul 2026 20:31:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782937913; cv=none; b=I6PTB3+rTtq8ixySSScNK2qum54NgomcSrG5oZAIDQ52mdwwhDUWuv73n+MRxzvgiZYoPIWefEP4RlhxR4JfkjMUbyUCPKoSfuLum0xqhBB2cNopIq3ZT4cG/UihVDO4veQcGMZYzWe2YILz7iJ53PpDDYh76R3/Y64V2c4+b90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782937913; c=relaxed/simple;
	bh=URgVHpcL9iQYQ8SxfKORweblHKZznsJiLp2eiL9vvBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j4n+qQkzsm7nirndoCvxG26qJHLldw3fo5wNox4rjCd//AbPjQHi0P8iHyCBSY5uWth5e2h2IukKzd6TGTA8PVX/ZONCVymOJsXyD0ptxDrb/VLydnWpcG2GsMq0LT4dpDwWu/Ea5Gohwfb/A7XoeMEqMJ9jb4BAv0hbX5rfqGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YF8F+Yne; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EE0C1F000E9;
	Wed,  1 Jul 2026 20:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782937912;
	bh=9HVsCqOTiNzOnHYIgHR3CzOqO25v3kJTgZItH+Woa7o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YF8F+YneR5nKJ1qP48FJvjrBLyifVzhtl0r0mKm9PNnulJ43Z6LPRKyytM7zfQ91m
	 wayUSnZ+ZggoFhXBTYbudubCoTlbi54LSyepuWS+0Y10xidmQVFKF59MU5wbBUjDEt
	 mGdHXdry9hT3SyeaCZWpUL+hFYc00u6AgBKyL5Xa2Gu6zQ/yjKCuky9JYqNb8AObYa
	 b2hqbHnFyvIpjLdRH0OetjAZuAgZhvtThplzGJylUV4zeTj7VaSg4JeDJA7BK2d9yc
	 uwdhjDZCNp60SGG7jb+XdjeBtNk0/a2E8HABCJ4aZT+OHF5kJ4uhsFf8kMXYkkV64X
	 MT4W5EqOXrkiQ==
Date: Wed, 1 Jul 2026 21:31:46 +0100
From: Conor Dooley <conor@kernel.org>
To: David Lechner <dlechner@baylibre.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Janani Sunil <janani.sunil@analog.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
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
Subject: Re: [PATCH v5 1/3] dt-bindings: spi: Add spi,device-addr peripheral
 property
Message-ID: <20260701-carpenter-romp-33a39756dfec@spud>
References: <20260701-ad5529r-driver-v5-0-ed087900e642@analog.com>
 <20260701-ad5529r-driver-v5-1-ed087900e642@analog.com>
 <20260701-immodest-carrot-611d255656b5@spud>
 <20260701192915.2fca6b06@jic23-huawei>
 <0bb77749-4aef-47dc-9107-a93b961a0187@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2P9d6LXYZY7Fu/BO"
Content-Disposition: inline
In-Reply-To: <0bb77749-4aef-47dc-9107-a93b961a0187@baylibre.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.26 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94487-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[conor@kernel.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:dlechner@baylibre.com,m:jic23@kernel.org,m:janani.sunil@analog.com,m:lars@metafoo.de,m:Michael.Hennerich@analog.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:p.zabel@pengutronix.de,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:broonie@kernel.org,m:linux-iio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:jan.sun97@gmail.com,m:linux-spi@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:jansun97@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-doc@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,analog.com,metafoo.de,pengutronix.de,lwn.net,linuxfoundation.org,vger.kernel.org,gmail.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C982D6F1791

--2P9d6LXYZY7Fu/BO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 01, 2026 at 01:48:24PM -0500, David Lechner wrote:
> Note that a few subsystems, including spi want the subject
> to be `spi: dt-bindings:` rather than the other way around.
>=20
> See https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting=
-patches.html
>=20
>=20
> On 7/1/26 1:29 PM, Jonathan Cameron wrote:
> > On Wed, 1 Jul 2026 12:04:37 +0100
> > Conor Dooley <conor@kernel.org> wrote:
> >=20
> >> On Wed, Jul 01, 2026 at 08:40:39AM +0200, Janani Sunil wrote:
> >>> Some SPI devices support sharing a single chip select across multiple
> >>> physical chips by encoding a device address in the SPI frame itself.
> >>> Add a generic spi,device-addr property to document this per-peripheral
> >>> address. This property belongs in channel or sub-device nodes of
> >>> peripherals that use this addressing scheme.
> >>>
> >>> Signed-off-by: Janani Sunil <janani.sunil@analog.com>
> >>> ---
> >>>  Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml | 5 =
+++++
> >>>  1 file changed, 5 insertions(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/spi/spi-peripheral-pro=
ps.yaml b/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
> >>> index 880a9f624566..3774e8018355 100644
> >>> --- a/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
> >>> +++ b/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
> >>> @@ -142,6 +142,11 @@ properties:
> >>>      minItems: 2
> >>>      maxItems: 4
> >>> =20
> >>> +  spi,device-addr: =20
> >>
> >> To match other generic spi properties, s/,/-/.
> >>
> >> However, you don't actually use this as a spi peripheral's property in
> >> your device binding, so you've got your wires crossed here somewhere.
> >=20
> > If we are going to make this generic (which I'm not against) I think
> > it should also work for the case of multiple independent devices.
> > So it can also be a top level device node spi property.
> >=20
> > That kind of makes me wonder if we are better off having it always
> > in the top level node, but allowing multiple values to represent
> > sub devices under this.  That would leave figuring out mappings of which
> > channels are on which device to the driver. The driver must know the
> > mapping afterall.  For the example something like
> >=20
> >=20
> > #include <dt-bindings/gpio/gpio.h>
> > spi {
> >     #address-cells =3D <1>;
> >     #size-cells =3D <0>;
> >     dac@0 {
> >         compatible =3D "adi,ad5529r-16";
> >         reg =3D <0>;
> >         spi-max-frequency =3D <25000000>;
> >=20
> >         spi-device-addreses =3D <0 3>
> > ...
> >=20
> >         #address-cells =3D <1>;
> >         #size-cells =3D <0>;
> >=20
> >         channel@0 {
> >             reg =3D <0>;
> >             adi,output-range-microvolt =3D <0 5000000>;
> >         };
> >=20
> >         channel@16 { #on second device using dev addr 3
> >             reg =3D <16>;
> >             adi,output-range-microvolt =3D <(-10000000) 10000000>;
> >         };
> >         channel@18 { #3rd channel on device using dev addr 3
> >             reg =3D <18>;
> >             adi,output-range-microvolt =3D <0 40000000>;
> >         };
> >     };
> > };
> >=20
> > Where devices are truely independent then you would have separate device
> > nodes each with one entry in spi-device-addresses
> >=20
> > I'm a bit dubious about putting this in the spi namespace though given
> > it is not part of any standard specification.  Do we have any precedence
> > for that sort of thing?
>=20
> It seems like most SPI controllers/devices don't really follow any
> standards, so I think there is plenty of precedence for a property
> like this. It would be nice to see one or two more examples of SPI
> peripherals with this feature though other than the one chip in
> this series. Otherwise, I wouldn't try to make it a standard property.

There are two microchip devices with a property like "microchip,hw-addr"
that I pointed out on ?v3? (whichever thread had the long discussion) that
do the exact same thing as this device.
I did ask that the submitter convert those to the new property as
evidence that this is actually generic, but that request was not
implemented. If done at the device level, this should be trivial, as the
microchip devices don't actually have support for multiple devices on
the same cs in the drivers, they just parse the property to correctly
support a single device.

> I'm also in favor of making it an array and letting the device-specific
> bindings decide what multiple devices with different addresses on the
> same CS line means.

I kinda wanted it to be in the channels, but I think, on reflection,
that putting it at the device level is probably fine. Pretending
that two devices are one extended device is always going to have some
ickyness about presentation, and putting it in the channels means
defining it again and again and again for each type of device that wants
it.

> But... if we are leaving it up to devices to deal with the property rather
> than the core SPI code, maybe it shouldn't be a standard SPI property.
> Although, I suppose the core SPI code could parse the property and just
> pass that information in the struct spi_device to let the device driver
> do what it wants with it.

--2P9d6LXYZY7Fu/BO
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCakV5MgAKCRB4tDGHoIJi
0gPPAP4sS2U1r0LoGoUOX7hfkPoCqdUYGik8IJA8cZ0L2SgfZwD/bIUwnmgsFEmz
oBrPyf4GNoeEWxDJBi9xNcqYfzpzwQs=
=jJgT
-----END PGP SIGNATURE-----

--2P9d6LXYZY7Fu/BO--

