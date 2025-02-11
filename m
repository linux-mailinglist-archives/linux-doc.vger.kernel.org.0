Return-Path: <linux-doc+bounces-37758-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F9EA30640
	for <lists+linux-doc@lfdr.de>; Tue, 11 Feb 2025 09:48:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3CF211882528
	for <lists+linux-doc@lfdr.de>; Tue, 11 Feb 2025 08:48:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B019C1EF0AD;
	Tue, 11 Feb 2025 08:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TU/TSiTj"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856D11EE7B7;
	Tue, 11 Feb 2025 08:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739263714; cv=none; b=k9tZbACvqDTjwK3OLK7X30532kFd0/eIx06tBjUARMRsR1L4DHbxBIYPXTq0/tr8INl3DpTzOg/e9AwkJLS6MG3ad4Vh7u3bsQUgD2LIJ9uffJD3diGt1/8MS0HPB4UL+VTB1lX0P39jtRRbUMj9xjxeQsvBQCtFDTKykuxzuXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739263714; c=relaxed/simple;
	bh=RaoR38MAfgncLsExh3zxNSsVfIrOsKI21zd8P7jRzvY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JYvvKdFw6+YwJ0oROEvgvapXhrw5sZc6FF3fv4f8FI7X9LZ5BWOmxL6H1cj+Ea+X8/TLxg9hKQLekEH1Dsb8GIVdPWOpwW8bpqtsSNqc3B758KwrK2lcJmYjhuryxetzliTl/W6nFu9lNB+8gpv4/yiUhS58Bd7m6KwaipphpKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TU/TSiTj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 761D9C4CEDD;
	Tue, 11 Feb 2025 08:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739263714;
	bh=RaoR38MAfgncLsExh3zxNSsVfIrOsKI21zd8P7jRzvY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TU/TSiTjqCksvH33oti3xGiyB1AAaelkA14GCMUz1ViJyhuNCs0rZ2lGiQvhYEzBF
	 xwxHqqGp0sAbaVg5J9QS8SjnWvqSVYlFNYL3o9gNz3rHaCaWZuw8LO+YJ+9ozcyBRY
	 sHcps1c2+APyovdL2aSaQikD1nTcJp8F5ic7bGSiwgB6US+vd3+246yEC84lpU6sf0
	 LJaLwTn4VC325ONrYA0WOdOGr8c0Ed7W+ZirlI3BlL5r3mtcIHDeqbuDX6z+2eZzTm
	 4OguIw00rzH+A7srN3KXdRo9y9P+mAud410Fyhe8ShsdrrbP9yF2C4Vz2TRZH72BuX
	 hbFgnF5LZVeOw==
Date: Tue, 11 Feb 2025 09:48:31 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Sam Ravnborg <sam@ravnborg.org>, Boris Brezillon <bbrezillon@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Paul Kocialkowski <contact@paulk.fr>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, =?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v6 14/26] drm/bridge: add support for refcounted DRM
 bridges
Message-ID: <20250211-venomous-dragon-of-competition-d76bf9@houat>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-14-9d6f2c9c3058@bootlin.com>
 <20250207-ingenious-daffodil-dugong-51be57@houat>
 <ucttjaf3trkgtpvhnsj7xfsybhnoi4qqow5ucwghlggivbagy7@gngjhbtu73lb>
 <20250210181244.0e3e9189@booty>
 <qnuskv4mln32nqgbgvwi2qcdwfma6tqfbq7e6sqb3za6pmms2j@ir7pt5634dsh>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="imifw34cjfchn5qq"
Content-Disposition: inline
In-Reply-To: <qnuskv4mln32nqgbgvwi2qcdwfma6tqfbq7e6sqb3za6pmms2j@ir7pt5634dsh>


--imifw34cjfchn5qq
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 14/26] drm/bridge: add support for refcounted DRM
 bridges
MIME-Version: 1.0

On Tue, Feb 11, 2025 at 01:14:28AM +0200, Dmitry Baryshkov wrote:
> On Mon, Feb 10, 2025 at 06:12:44PM +0100, Luca Ceresoli wrote:
> > Hi Maxime, Dmitry
> >=20
> > On Fri, 7 Feb 2025 21:54:06 +0200
> > Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> >=20
> > > > > +/* Internal function (for refcounted bridges) */
> > > > > +void __drm_bridge_free(struct kref *kref)
> > > > > +{
> > > > > +	struct drm_bridge *bridge =3D container_of(kref, struct drm_bri=
dge, refcount);
> > > > > +	void *container =3D ((void *)bridge) - bridge->container_offset;
> > > > > +
> > > > > +	DRM_DEBUG("bridge=3D%p, container=3D%p FREE\n", bridge, contain=
er); =20
> > > >=20
> > > > Pointers are not really useful to track here, since they are obfusc=
ated
> > > > most of the time. Using the bridge device name would probably be be=
tter
> > > > (or removing the SHOUTING DEBUG entirely :)) =20
> > >=20
> > > bridge device name or bridge funcs (I opted for the latter for the
> > > debugfs file)
> >=20
> > These DRM_DEBUG()s proved extremely useful exactly because of the
> > pointer. This is because when using hotplug one normally has the same
> > device added and removed multiple times, and so the device name or
> > bridge funcs is always the same, preventing from understanding which
> > instance is leaking, or being freed, get, put, etc.
> >=20
> > Do you think this is a sufficient motivation to keep it?
>=20
> Then it should be something like %px. I found that %p is mangled.
> What about having both device name _and_ a pointer?

No, %px must not be used there. %p is mangled but should be consistent
across calls. But yeah, it's kind of the reason I suggested to use the
bridge device name instead.

Maxime

--imifw34cjfchn5qq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ6sO0wAKCRAnX84Zoj2+
dpsfAX0XKk9jgzP+l4NaW5Vkc5IAqgJ0NPSMpGi70iR+EJy/2ca7vtNGaoaDTjQQ
YBBFvAQBfj5XOszrteaDSLvVerz2c7UtT6xwxq1cOmlS8TLC8qdnzjM7+/de1HH+
J+GkLTm69A==
=LMtT
-----END PGP SIGNATURE-----

--imifw34cjfchn5qq--

