Return-Path: <linux-doc+bounces-43052-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D5EA887B6
	for <lists+linux-doc@lfdr.de>; Mon, 14 Apr 2025 17:49:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8EC67177B31
	for <lists+linux-doc@lfdr.de>; Mon, 14 Apr 2025 15:49:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 359FB27A110;
	Mon, 14 Apr 2025 15:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vQHDRh49"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A74A27466A;
	Mon, 14 Apr 2025 15:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744645760; cv=none; b=Jw18hfqNArJz7UoKxm6adDwFaq/Dc24n2xcY1vBmr4U7UwiP9unU/KToKsL1Ed4Qmi/O7EnbKwRK+l2U2eSa4lhaWfsBxMiHC3dcVtsYD8iUYyDWnVy6SbdCNUgkfcMNFeFWMhn8kaoc3d8uBxJFhBAXkayF69FN26xQwUgfjEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744645760; c=relaxed/simple;
	bh=LW+sWehA2wdSuARkuJpL0aAVzRSrHG73IzO/zg+cjAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BlIlyBBT6sET7koc2FgoA3tg2YDqIPQZaleEHtYRw2NPafFbDlh63vqEWER+tqwYLEsZZTLPUwu879do+iMN4BcmiAhumsYedxmgkjLUpJ1PKd5qimNMY4YO+dGzYCIbFoGfQU1zD04D6omJaLIiM0037A8QgwcCa3kzRBoL9YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vQHDRh49; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5D77C4CEE2;
	Mon, 14 Apr 2025 15:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744645759;
	bh=LW+sWehA2wdSuARkuJpL0aAVzRSrHG73IzO/zg+cjAA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vQHDRh490SnMEjPeOhE4Iu7MOzuIs/dIp0Ha/Zouf40WmLSuctYyJhbsxq0a0o+wJ
	 +7nayZFxRAVHdI3Rx7G55dVCsguYPSojJ48ZT56icKJLtI3Zejoa2XDYvucCb73EBC
	 LYqVRnY4shH4pedqs20qzvXRYpUZginHF8UcAtQW7F7GAOr2mvx7uv4ckY5VtUF+fk
	 oxZggRIpA0nCVXq2bnxxHYcDjcRfockIwI7ypLRY9pjDBZ7zbeHRY365/tm1O3D37P
	 PLi8r2pi9aUvQ9YKj2iTKA6kUYTBr/0Ika98yvY64amsJQSvG69AHS2cZH4XWD1kyX
	 56tAKc+A3uMpA==
Date: Mon, 14 Apr 2025 17:49:16 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Anusha Srivatsa <asrivats@redhat.com>, Paul Kocialkowski <paulk@sys-base.io>, 
	Dmitry Baryshkov <lumag@kernel.org>, =?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>, 
	Hui Pu <Hui.Pu@gehealthcare.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/2] drm/tests: bridge: add a KUnit test for
 devm_drm_bridge_alloc()
Message-ID: <20250414-misty-hungry-woodlouse-dbbd64@houat>
References: <20250409-drm-bridge-alloc-doc-test-v7-0-a3ca4b97597f@bootlin.com>
 <20250409-drm-bridge-alloc-doc-test-v7-2-a3ca4b97597f@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4jicyu5cwq5bgi2g"
Content-Disposition: inline
In-Reply-To: <20250409-drm-bridge-alloc-doc-test-v7-2-a3ca4b97597f@bootlin.com>


--4jicyu5cwq5bgi2g
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v7 2/2] drm/tests: bridge: add a KUnit test for
 devm_drm_bridge_alloc()
MIME-Version: 1.0

Hi,

On Wed, Apr 09, 2025 at 04:50:35PM +0200, Luca Ceresoli wrote:
> Add a basic KUnit test for the newly introduced drm_bridge_alloc().
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>=20
> ---
>=20
> Changed in v7:
>  - rebase on current drm-misc-next, which now has a drm_bridge_test.c file
>  - cleanup commit message
>=20
> Changed in v6:
>  - update to new devm_drm_bridge_alloc() API
>  - remove drm_test_drm_bridge_put test, not straightforward to write with
>    the new API and the current notification mechanism
>  - do not allocate a drm_device: a bridge is allocated without one
>  - rename some identifiers for easier code reading
>=20
> This patch was added in v5.
> ---
>  drivers/gpu/drm/tests/drm_bridge_test.c | 60 +++++++++++++++++++++++++++=
++++++
>  1 file changed, 60 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/tests/drm_bridge_test.c b/drivers/gpu/drm/te=
sts/drm_bridge_test.c
> index ff88ec2e911c9cc9a718483f09d4c764f45f991a..87fb64744b67f0780457a546a=
ba77ba945a0ce67 100644
> --- a/drivers/gpu/drm/tests/drm_bridge_test.c
> +++ b/drivers/gpu/drm/tests/drm_bridge_test.c
> @@ -8,6 +8,7 @@
>  #include <drm/drm_bridge_helper.h>
>  #include <drm/drm_kunit_helpers.h>
> =20
> +#include <kunit/device.h>
>  #include <kunit/test.h>
> =20
>  struct drm_bridge_init_priv {
> @@ -407,11 +408,70 @@ static struct kunit_suite drm_bridge_helper_reset_c=
rtc_test_suite =3D {
>  	.test_cases =3D drm_bridge_helper_reset_crtc_tests,
>  };
> =20
> +struct drm_bridge_alloc_test_ctx {
> +	struct device *dev;
> +};

You don't need a struct there then, you can just pass the device pointer.

> +/*
> + * Mimick the typical struct defined by a bridge driver, which embeds a
> + * bridge plus other fields.
> + */
> +struct dummy_drm_bridge {
> +	int dummy; // ensure we test non-zero @bridge offset
> +	struct drm_bridge bridge;
> +};

drm_bridge_init_priv gives you that already.

> +static const struct drm_bridge_funcs drm_bridge_dummy_funcs =3D {
> +};
> +
> +static int drm_test_bridge_alloc_init(struct kunit *test)
> +{
> +	struct drm_bridge_alloc_test_ctx *ctx;
> +
> +	ctx =3D kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> +
> +	ctx->dev =3D kunit_device_register(test, "drm-bridge-dev");
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx->dev);
> +
> +	test->priv =3D ctx;
> +
> +	return 0;
> +}
> +
> +/*
> + * Test that the allocation and initialization of a bridge works as
> + * expected and doesn't report any error.
> + */
> +static void drm_test_drm_bridge_alloc(struct kunit *test)
> +{
> +	struct drm_bridge_alloc_test_ctx *ctx =3D test->priv;
> +	struct dummy_drm_bridge *dummy;
> +
> +	dummy =3D devm_drm_bridge_alloc(ctx->dev, struct dummy_drm_bridge, brid=
ge,
> +				      &drm_bridge_dummy_funcs);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dummy);

Why did you need the dummy value in dummy_drm_bridge if you're not using
it?

We'd need a couple more tests, in particular some to make sure the
bridge pointer is properly cleaned up when the device goes away, but not
when we have called drm_bridge_get pointer on it, etc.

Maxime

--4jicyu5cwq5bgi2g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ/0ufAAKCRDj7w1vZxhR
xciJAPwN/nr+7o9AH21EBA74RUDiqX8sNRT5jbGun9PPilLS9wEAxZulZJey52X/
5KR4SC2mAdeAyULYDu85vBJzNMc+aA8=
=Bh9n
-----END PGP SIGNATURE-----

--4jicyu5cwq5bgi2g--

