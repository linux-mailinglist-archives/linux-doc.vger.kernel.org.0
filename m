Return-Path: <linux-doc+bounces-1213-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BC87D85FC
	for <lists+linux-doc@lfdr.de>; Thu, 26 Oct 2023 17:26:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2C50AB21022
	for <lists+linux-doc@lfdr.de>; Thu, 26 Oct 2023 15:26:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70EAF358AB;
	Thu, 26 Oct 2023 15:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mes1gn0z"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9042D7A5;
	Thu, 26 Oct 2023 15:26:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC321C433C9;
	Thu, 26 Oct 2023 15:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698333978;
	bh=7f5jXWpac8QZKPV1MUAg3K8E6GSbuJvhCPvV6ZUCJUs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mes1gn0zY9wsK9yGdAJYMQwOkw/vWggKfbPilTP63TgMbYNuTEDhgUKEfly6OeUsy
	 Z0/ZzufvG/Kz0eqtWpKHmopfJARvTf/8v/lEp6Bo4RqEntEqzHmpN3JQUaEpJy27S3
	 s6OD+wp0VGGwJEvq1GA0KTDYxjjJpTQywyloxiZIjIxDmcbFkQYXna0L1uUmctcNvt
	 izuOfGIANVrtWl056FnZ93Kpm2u1jtpC7SIORe1R/1ujf6TVPaugc/eOfBOidvqRyc
	 TXA/ObZ6iJUm8g50a4gR3cN1LQdgu+ooMznywwBgVnTN5YIsDnv1xTERQ1cspE6Few
	 byZ9032N1A9AQ==
Date: Thu, 26 Oct 2023 16:26:13 +0100
From: Conor Dooley <conor@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, patrick@stwcx.xyz,
	Jean Delvare <jdelvare@suse.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-i2c@vger.kernel.org,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: Add lltc ltc4286 driver
 bindings
Message-ID: <20231026-poison-encrypt-1df55e023867@spud>
References: <20231026081514.3610343-1-Delphine_CC_Chiu@Wiwynn.com>
 <20231026081514.3610343-2-Delphine_CC_Chiu@Wiwynn.com>
 <20231026-dicing-crispy-a10af575d3e5@spud>
 <fffa4330-8d01-8498-4c5f-772ebf2a6b5a@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="krQTSOoQEUtjB+4u"
Content-Disposition: inline
In-Reply-To: <fffa4330-8d01-8498-4c5f-772ebf2a6b5a@roeck-us.net>


--krQTSOoQEUtjB+4u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 26, 2023 at 08:09:52AM -0700, Guenter Roeck wrote:
> On 10/26/23 07:25, Conor Dooley wrote:
> > Hey,
> >=20
> > On Thu, Oct 26, 2023 at 04:15:11PM +0800, Delphine CC Chiu wrote:
> > > Add a device tree bindings for ltc4286 driver.
> >=20
> > Bindings are for devices, not for drivers.
> >=20
> > >=20
> > > Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
> > >=20
> > > Changelog:
> > >    v2 - Revise vrange_select_25p6 to adi,vrange-select-25p6
> > >       - Add type for adi,vrange-select-25p6
> > >       - Revise rsense-micro-ohms to shunt-resistor-micro-ohms
> > > ---
> > >   .../bindings/hwmon/lltc,ltc4286.yaml          | 50 ++++++++++++++++=
+++
> > >   MAINTAINERS                                   | 10 ++++
> > >   2 files changed, 60 insertions(+)
> > >   create mode 100644 Documentation/devicetree/bindings/hwmon/lltc,ltc=
4286.yaml
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yam=
l b/Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
> > > new file mode 100644
> > > index 000000000000..17022de657bb
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
> > > @@ -0,0 +1,50 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/hwmon/lltc,ltc4286.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: LTC4286 power monitors
> > > +
> > > +maintainers:
> > > +  - Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - lltc,ltc4286
> > > +      - lltc,ltc4287
> >=20
> > I don't recall seeing an answer to Guenter about this ltc4287 device:
> > https://lore.kernel.org/all/22f6364c-611c-ffb6-451c-9ddc20418d0a@roeck-=
us.net/
> >=20
>=20
> At least the chip does officially exist now, and a datasheet is available.
>=20
> https://www.analog.com/en/products/ltc4287.html
>=20
> It shows that coefficients for the telemetry commands are different,
> meaning that indeed both chips need to be explicitly referenced
> in the properties description (and handled in the driver, which proves
> my point of needing a datasheet before accepting such a driver).

Oh neat, would've been good if that'd been mentioned!

> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  adi,vrange-select-25p6:
> > > +    description:
> > > +      This property is a bool parameter to represent the
> > > +      voltage range is 25.6 or not for this chip.
> >=20
> > 25.6 what? Volts? microvolts?
> > What about Guenter's suggestion to name this so that it better matches
> > the other, similar properties?
> >=20
>=20
> I still would prefer one of the more common properties.
> I still prefer adi,vrange-high-enable.

I think, from reading the previous version, that this is actually the
lower voltage range, as there is a 102.x $unit range too that is the
default in the hardware. Obviously, the use of the property could be
inverted to match that naming however.

Cheers,
Conor.

--krQTSOoQEUtjB+4u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZTqFFQAKCRB4tDGHoIJi
0miPAP9L8K6SvI6VCT2EjTet+tJAmaS2yY3HJ6tRbYuno10IBQEAwzAatI/gAbTd
v+T2gZMjF8Xf3EaQtl/98SNYuVMLswc=
=OU8X
-----END PGP SIGNATURE-----

--krQTSOoQEUtjB+4u--

