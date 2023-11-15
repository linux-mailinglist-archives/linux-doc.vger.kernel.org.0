Return-Path: <linux-doc+bounces-2089-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B82557E7043
	for <lists+linux-doc@lfdr.de>; Thu,  9 Nov 2023 18:28:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E81B01C20B91
	for <lists+linux-doc@lfdr.de>; Thu,  9 Nov 2023 17:28:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EAAB225CE;
	Thu,  9 Nov 2023 17:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T4ihTJ5n"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504BB2232D;
	Thu,  9 Nov 2023 17:28:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 216FFC433C8;
	Thu,  9 Nov 2023 17:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699550901;
	bh=fDpDgJjp07F/CuXsJ3kAARhJnGkS0j6Gp1SFLSeVnvQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T4ihTJ5n/Deirp/WmVZltnPol3WIAkn9VPL06TMSsbjZXvLQqmaY7Y62O7hSQ/o99
	 2xVPue9Bq0DjX2OxVKESXQZam5UHDq+kYZxdABbI5XNqL7a6dMWr5arIbLAFwOR7c/
	 uRozaYSff0ACgX39oQ5QR16i5ysDXBeEDT/ifVeJJGiAQGbGAqlFLWHrbGN/aZs0PV
	 2fcDJz6byQyFyLnl9tIBu9T+1HHvJGHqMWxwXGG0gSnYQO4tiN6IMBO3N8R/9PBd7K
	 Lmsw8hmXg4wET8+6A61GYEoOSo+CdSB928U2h0bFKMFaF/kfE0c19Po/j8dlrX2035
	 3HxROJHaw8PTA==
Date: Thu, 9 Nov 2023 17:28:15 +0000
From: Conor Dooley <conor@kernel.org>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 4/4] dt-bindings: hwmon: Add Amphenol ChipCap 2
Message-ID: <20231109-deprecate-sandbag-f85910a06e9e@spud>
References: <20231020-topic-chipcap2-v2-0-f5c325966fdb@gmail.com>
 <20231020-topic-chipcap2-v2-4-f5c325966fdb@gmail.com>
 <008715d1-de4a-47dd-955c-e2fb7af36a25@linaro.org>
 <0b103837-54e7-430f-8a01-94b620b84f89@gmail.com>
 <9fb14ef2-ee2e-41c6-a080-01df2e947091@linaro.org>
 <b39e0a17-0a9a-482d-a584-db8bb79c75dc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZnQ1bUcw4vLeaXJ8"
Content-Disposition: inline
In-Reply-To: <b39e0a17-0a9a-482d-a584-db8bb79c75dc@gmail.com>


--ZnQ1bUcw4vLeaXJ8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 09, 2023 at 10:25:39AM +0100, Javier Carrasco wrote:
>=20
>=20
> On 09.11.23 10:20, Krzysztof Kozlowski wrote:
> > On 09/11/2023 10:02, Javier Carrasco wrote:
> >>
> >>
> >> On 09.11.23 09:53, Krzysztof Kozlowski wrote:
> >>> On 08/11/2023 16:37, Javier Carrasco wrote:
> >>>> Add device tree bindings and an example for the ChipCap 2 humidity
> >>>> and temperature sensor.
> >>>>
> >>>> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> >>>> ---
> >>>>  .../bindings/hwmon/amphenol,chipcap2.yaml          | 68 +++++++++++=
+++++++++++
> >>>>  1 file changed, 68 insertions(+)
> >>>>
> >>>> diff --git a/Documentation/devicetree/bindings/hwmon/amphenol,chipca=
p2.yaml b/Documentation/devicetree/bindings/hwmon/amphenol,chipcap2.yaml
> >>>> new file mode 100644
> >>>> index 000000000000..8bb6daa293d3
> >>>> --- /dev/null
> >>>> +++ b/Documentation/devicetree/bindings/hwmon/amphenol,chipcap2.yaml
> >>>> @@ -0,0 +1,68 @@
> >>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >>>> +%YAML 1.2
> >>>> +---
> >>>> +$id: http://devicetree.org/schemas/hwmon/amphenol,chipcap2.yaml#
> >>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>>> +
> >>>> +title: ChipCap 2 humidity and temperature iio sensor
> >>>> +
> >>>> +maintainers:
> >>>> +  - Javier Carrasco <javier.carrasco.cruz@gmail.com>
> >>>> +
> >>>> +description: |
> >>>> +  Relative humidity and temperature sensor on I2C bus.
> >>>> +
> >>>> +  Datasheets:
> >>>> +    https://www.amphenol-sensors.com/en/telaire/humidity/527-humidi=
ty-sensors/3095-chipcap-2
> >>>> +
> >>>> +properties:
> >>>> +  compatible:
> >>>> +    enum:
> >>>> +      - amphenol,cc2dxx
> >>>> +      - amphenol,cc2dxxs
> >>>> +
> >>>
> >>> Nothing improved.
> >>>
> >>> Really, you just ignored the review.
> >>>
> >>> Best regards,
> >>> Krzysztof
> >>>
> >> I am sorry if I missed something from your first review. I changed the
> >> interrupt description to have one per item as you suggested and removed
> >> the empty line. I did not change the compatible enum to add all part
> >> numbers because it was still under discussion, but now that I know that
> >> I have to add all of them, I will change for the next version.
> >=20
> > And a new patch should not be sent while discussion happens. Literally I
> > had no chances to respond to your comment and v2 appears.
> >=20
> > Best regards,
> > Krzysztof
> >=20
> You are right, there is a lot to review and I should have gathered more
> feedback. I will wait a few days to receive more input and in the
> meantime I will add all part numbers (there is eight of them, which is
> manageable) to the documentation and the device tables. Wildcards and
> families will be dropped.

I'm not sure what was said in the prior feedback, but it would be
possible, if any of these devices have an identical programming model,
is allow one of their compatibles in isolation and use that compatible
as a fallback for all other devices that have an identical or compatible
programming model.

--ZnQ1bUcw4vLeaXJ8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZU0WrwAKCRB4tDGHoIJi
0t6qAQCIAWRTzcKH12jQXNF41JEsJTrieXGfuJQWRRbt5t6+IQEAibkXDA3XXcxt
Jwv9YqdSmvg/11lX/vkSOW488tVNrAo=
=V0VZ
-----END PGP SIGNATURE-----

--ZnQ1bUcw4vLeaXJ8--

