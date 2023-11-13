Return-Path: <linux-doc+bounces-2264-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2077EA405
	for <lists+linux-doc@lfdr.de>; Mon, 13 Nov 2023 20:53:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 555A9280F06
	for <lists+linux-doc@lfdr.de>; Mon, 13 Nov 2023 19:53:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D16E123778;
	Mon, 13 Nov 2023 19:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rks3S6dZ"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7DCE2376D;
	Mon, 13 Nov 2023 19:53:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B413DC433C9;
	Mon, 13 Nov 2023 19:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699905180;
	bh=ffLcDRGqnUdm0yatIQP+KftLtw8Kq854UisLinpCfkE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rks3S6dZ+7Jjp4tXAycU1iqgHBCErzgrQVDxCo/cZU5shwg2hEgTJXJUeXaeLFyni
	 +CVDX2NiHzYtD20ed6jtswkVpDqmglEmqUdpM5oohrdvWku/nzYSgG20l/Piy70n7B
	 NB5rmdA5VNxDBJpiqP6X2PhaLbSfswQuIvMf0p9QLDoQEOz5324ZwgDJfdXZmrezwU
	 44iZP1NTiGvAdWPMM6476hnynjk40o/M7OEoNLOeQvDnJz5qw4U/wSUvMt1TzwSRw+
	 aDEeoHZcsUvSyMsL6zCHaFdOgkHF1C+YltwZzPUwQ9oJUI9FWKr0HvVULJfsqs3hud
	 gsm6TGvm1ArIw==
Date: Mon, 13 Nov 2023 19:52:56 +0000
From: Conor Dooley <conor@kernel.org>
To: Peter Yin <peteryin.openbmc@gmail.com>
Cc: patrick@stwcx.xyz, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>, Joel Stanley <joel@jms.id.au>,
	Chanh Nguyen <chanh@os.amperecomputing.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: Add mps mp5990 driver bindings
Message-ID: <20231113-zesty-utilize-10ffeb80cb80@squawk>
References: <20231113155008.2147090-1-peteryin.openbmc@gmail.com>
 <20231113155008.2147090-2-peteryin.openbmc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="w0GpC5z66S9rvkCL"
Content-Disposition: inline
In-Reply-To: <20231113155008.2147090-2-peteryin.openbmc@gmail.com>


--w0GpC5z66S9rvkCL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 13, 2023 at 11:50:07PM +0800, Peter Yin wrote:
> Add a device tree bindings for mp5990 device.
>=20
> Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor,

> ---
>  Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Doc=
umentation/devicetree/bindings/trivial-devices.yaml
> index 7680c8a9b4ad..eb83ab4c02ee 100644
> --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> @@ -123,6 +123,8 @@ properties:
>            - mps,mp2888
>              # Monolithic Power Systems Inc. multi-phase controller mp2975
>            - mps,mp2975
> +            # Monolithic Power Systems Inc. multi-phase hot-swap control=
ler mp5990
> +          - mps,mp5990
>              # Honeywell Humidicon HIH-6130 humidity/temperature sensor
>            - honeywell,hi6130
>              # IBM Common Form Factor Power Supply Versions (all versions)
> --=20
> 2.25.1
>=20

--w0GpC5z66S9rvkCL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZVJ+lgAKCRB4tDGHoIJi
0v2OAP9c9NGnaiv1W+5gqKFFbzEC35fZg8gCBlYC3BjyLfEsyQD/YNq8VwQytXuA
Dp6g72fS9OCud1M5ffI7sbMNw+//lwE=
=dQgz
-----END PGP SIGNATURE-----

--w0GpC5z66S9rvkCL--

