Return-Path: <linux-doc+bounces-94024-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pDclNj6UQmpZ+AkAu9opvQ
	(envelope-from <linux-doc+bounces-94024-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 29 Jun 2026 17:50:22 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 491BB6DCF00
	for <lists+linux-doc@lfdr.de>; Mon, 29 Jun 2026 17:50:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=N+3HfVqX;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94024-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94024-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 12F213251478
	for <lists+linux-doc@lfdr.de>; Mon, 29 Jun 2026 15:39:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB8633EB7FB;
	Mon, 29 Jun 2026 15:39:15 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692783D6CD4;
	Mon, 29 Jun 2026 15:39:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782747555; cv=none; b=gind5c7lH1mf2prq9PgM+LpjuKPjq6kQzn2SAb30Zn/VQJfLhRHXXAnXwxNRSfEcmsparxGx0qOLe2OQINgW1cZMT7A1o5plIGaYvxPnAGCPAAYo9KaPQS7PFnnqvB5tNuzi798Lp6W4eX6fvLbZvOB0kiyqXGPn+Ped+bu6J/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782747555; c=relaxed/simple;
	bh=q4sV64oI/UhUUIUg8JJc/X3IP7vCZfe2L6JJj+5+DL8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PUS3myYaWMywsOV5qssZZqBAKP+c1qRR09cHHLpkyYeD7rcLgSG+gxLB3PPf0lBelBQTkfL5w2/hXK6OImeciscWgUloKG/E1R2iZ/0q+SzdNEkqQaOubKHbC4nX4RxftDmLoAmAiEK4WX+KFP/pc2bBV0nIfvcnXcwLiFWC5cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N+3HfVqX; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B2EF1F000E9;
	Mon, 29 Jun 2026 15:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782747554;
	bh=XmxJ6c0kqMhhlXGwQar6r/s6+uu4+H6QPJjq1Sx9ksM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=N+3HfVqXvKKhhc0ceXkahK6oMrDZjRkUt2BIdsrQBbEPl7xtotbtunXmIW0HM7XJh
	 D7io6Mh8w1oaA35+8EHnUpTtta1zh4Ywqmwa5WYXX8Iyn8KTKWhJjSmzYNrfDA42Tr
	 qmCv2dHmDMqJ+w5jt/OaEZ8LoxdvkngIa5L3Rl5qK/ma652fHeUhqfwMZhAk2bpbuy
	 FwaWIH8DT5O/OEh3svzE3b22BHkM38ryoWsArEQIQoc0gssUpqgBYq5xwrZIXks1u7
	 86L3W0hDj/D/wOxgAL33yg+AMLF8tKYFieQPhWlWJOpovxfOiH01tyBgSN7gVsCPbO
	 oGUm99ZohucMA==
Date: Mon, 29 Jun 2026 16:39:09 +0100
From: Conor Dooley <conor@kernel.org>
To: Jinseob Kim <kimjinseob88@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v6 1/5] dt-bindings: iio: add Open Sensor Fusion
 device
Message-ID: <20260629-gilled-henna-96bde265d7ed@spud>
References: <20260628191337.937-1-kimjinseob88@gmail.com>
 <20260628191337.937-2-kimjinseob88@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7sWE1OgKcjYNrSYZ"
Content-Disposition: inline
In-Reply-To: <20260628191337.937-2-kimjinseob88@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.26 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:kimjinseob88@gmail.com,m:jic23@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-iio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[conor@kernel.org,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-doc@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-94024-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linux.dev:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,spud:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 491BB6DCF00

--7sWE1OgKcjYNrSYZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 29, 2026 at 04:13:33AM +0900, Jinseob Kim wrote:
> Add a binding for the generic Open Sensor Fusion host interface.
>=20
> Open Sensor Fusion devices report capabilities and samples over an OSF
> protocol stream. Sensor channels are discovered at runtime from
> capability reports instead of being described individually in Device
> Tree.
>=20
> The protocol version is discovered at runtime from the OSF frame header.
> OSF GREEN is a product identity, and OSF0 is a wire-format magic value,
> so neither is used as the Linux compatible string.
>=20
> Signed-off-by: Jinseob Kim <kimjinseob88@gmail.com>
> ---
>  .../bindings/iio/opensensorfusion,osf.yaml    | 54 +++++++++++++++++++
>  .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
>  MAINTAINERS                                   |  6 +++
>  3 files changed, 62 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/opensensorfusio=
n,osf.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/iio/opensensorfusion,osf.y=
aml b/Documentation/devicetree/bindings/iio/opensensorfusion,osf.yaml
> new file mode 100644
> index 000000000..8016d582f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/opensensorfusion,osf.yaml
> @@ -0,0 +1,54 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iio/opensensorfusion,osf.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Open Sensor Fusion Sensor Aggregation Hub
> +
> +maintainers:
> +  - Jinseob Kim <kimjinseob88@gmail.com>
> +
> +description: |
> +  This binding documents the generic Open Sensor Fusion host interface. =
Open
> +  Sensor Fusion is a sensor aggregation hub. The hub exposes an OSF prot=
ocol
> +  data stream over its host interface and reports capabilities and sampl=
es for
> +  multiple sensor classes. The actual sensor channels are discovered at =
runtime
> +  from OSF capability reports instead of describing them in Device Tree.=
 The
> +  protocol version is discovered at runtime.
> +
> +  Public project documentation is available at:
> +
> +    https://github.com/opensensorfusion
> +
> +  The compatible describes the generic Open Sensor Fusion host interface.

> It
> +  is not an OSF GREEN board identity, and it does not encode the OSF0 wi=
re
> +  magic.

I think this is evident from the previous text, and the first part is a
bit confusing while the latter half is a bit confusing.
Just remove this sentence I think.

Binding looks fine to me, I'll provide a r-b when you submit a non-RFC
version.

pw-bot: not-applicable

Thanks,
Conor.

> OSF0, protocol_major, and protocol_minor are wire-protocol details
> +  exchanged in OSF frames.
> +
> +allOf:
> +  - $ref: /schemas/serial/serial-peripheral-props.yaml#
> +
> +properties:
> +  compatible:
> +    const: opensensorfusion,osf
> +
> +  vcc-supply:
> +    description:
> +      Regulator supplying power to the Open Sensor Fusion device.
> +
> +required:
> +  - compatible
> +  - vcc-supply
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    serial {
> +        sensor {
> +            compatible =3D "opensensorfusion,osf";
> +            vcc-supply =3D <&vcc_sensor>;
> +        };
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Doc=
umentation/devicetree/bindings/vendor-prefixes.yaml
> index 28784d66a..88172d4a4 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -1237,6 +1237,8 @@ patternProperties:
>      description: OpenPandora GmbH
>    "^openrisc,.*":
>      description: OpenRISC.io
> +  "^opensensorfusion,.*":
> +    description: Open Sensor Fusion
>    "^openwrt,.*":
>      description: OpenWrt
>    "^option,.*":
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c2c6d7927..e4df9d8dc 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20011,6 +20011,12 @@ F:	Documentation/devicetree/
>  F:	arch/*/boot/dts/
>  F:	include/dt-bindings/
> =20
> +OPEN SENSOR FUSION
> +M:	Jinseob Kim <kimjinseob88@gmail.com>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/iio/opensensorfusion,osf.yaml
> +K:	opensensorfusion
> +
>  OPENCOMPUTE PTP CLOCK DRIVER
>  M:	Vadim Fedorenko <vadim.fedorenko@linux.dev>
>  L:	netdev@vger.kernel.org
> --=20
> 2.43.0
>=20

--7sWE1OgKcjYNrSYZ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCakKRnQAKCRB4tDGHoIJi
0jtPAP9UjwGAQHBPikZntHLh47cDCPr+KIN+72yn0oMFnbNUEAEAjMvGeo18zA1o
e7ThlFUJ0gGdpjOCNYM5aASU2UztAgY=
=hoHF
-----END PGP SIGNATURE-----

--7sWE1OgKcjYNrSYZ--

