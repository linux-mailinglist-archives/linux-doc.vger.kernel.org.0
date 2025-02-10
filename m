Return-Path: <linux-doc+bounces-37596-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B6CA2F6B1
	for <lists+linux-doc@lfdr.de>; Mon, 10 Feb 2025 19:18:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1D1F3A67BD
	for <lists+linux-doc@lfdr.de>; Mon, 10 Feb 2025 18:17:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 397CF255E59;
	Mon, 10 Feb 2025 18:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SYC5e8jA"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10EC025742A;
	Mon, 10 Feb 2025 18:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739211463; cv=none; b=JN5MArl5Wvayea9zwzUcYrf2bHljeytzvLXIe+AVEoCRs6tZr8v04Qau3VCHQhS6dGQmThhetw77LPy2yvSQmoCYtJgiwePdi62ZpfJvoXunMJAg+i8JSiPEYkMXrGnZO1l5eFCPWToHmeLpU9TCbjAPbrJYs3pK6t4f5Vg4vGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739211463; c=relaxed/simple;
	bh=WiOKGuitaydzhswX/7JM6O1nTPijJq8eyPlKsuXqT/0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iywAW9+cos94xVC7hArxKDIvz50a4H2lPOQPm2Tv5jB073OtIzNA3eAArwjkxlDhgbIwE2Zz3vHExq9beM50ju+bQlLT+rusf1AOOrhc8tEzh2l+/Nm7n1Ygy2ZgGBLIm8eJqjdpwqIZQhuXE4ojctGoKrW07Q4GHYncafYl9GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SYC5e8jA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02401C4CEE6;
	Mon, 10 Feb 2025 18:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739211462;
	bh=WiOKGuitaydzhswX/7JM6O1nTPijJq8eyPlKsuXqT/0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SYC5e8jAmnFQbgWzl7VBI9YMtbd7So6JvOfGkmZR4rPjBqZ4L77d44l+d00zp2aPK
	 vdY2EDi971nV/mQePhMvYhghFcmArOCv3gVcP2lJiAK0FN3KPcy2bhUNSh+b8pbgMK
	 jD+oZXJW6CRk1yRxk36qHlpWWwKFwyXuQ5iEPykue89vmpXr2X9MqFOqc2O0gBdD6a
	 oCyBLJXpsqq0u00imJlBSuR+8Y6VTLMeycXL1n0SI8dszQCypYTkKHx4OGpFwOmEiT
	 jYACq03l9RxT9tsx6qROQ4SbUcgSmnx8ymMVJUb1kGv2HGgKdi5gmL/d1Y97vRoS9w
	 3uMgSSMariMfg==
Date: Mon, 10 Feb 2025 19:17:39 +0100
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
Message-ID: <20250210-proficient-millipede-of-recreation-91da6c@houat>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-14-9d6f2c9c3058@bootlin.com>
 <20250207-ingenious-daffodil-dugong-51be57@houat>
 <ucttjaf3trkgtpvhnsj7xfsybhnoi4qqow5ucwghlggivbagy7@gngjhbtu73lb>
 <20250210-bold-steel-collie-cecbad@houat>
 <CAA8EJppyDiAeH8bm-rdCUsGoyVOrp=4AvrYLJ-=5BTLtmnP11g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="ctkvotoob64tevup"
Content-Disposition: inline
In-Reply-To: <CAA8EJppyDiAeH8bm-rdCUsGoyVOrp=4AvrYLJ-=5BTLtmnP11g@mail.gmail.com>


--ctkvotoob64tevup
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 14/26] drm/bridge: add support for refcounted DRM
 bridges
MIME-Version: 1.0

On Mon, Feb 10, 2025 at 04:23:44PM +0200, Dmitry Baryshkov wrote:
> On Mon, 10 Feb 2025 at 14:31, Maxime Ripard <mripard@kernel.org> wrote:
> >
> > On Fri, Feb 07, 2025 at 09:54:06PM +0200, Dmitry Baryshkov wrote:
> > > On Fri, Feb 07, 2025 at 12:47:51PM +0100, Maxime Ripard wrote:
> > > > Hi,
> > > >
> > > > On Thu, Feb 06, 2025 at 07:14:29PM +0100, Luca Ceresoli wrote:
> > > > > DRM bridges are currently considered as a fixed element of a DRM =
card, and
> > > > > thus their lifetime is assumed to extend for as long as the card
> > > > > exists. New use cases, such as hot-pluggable hardware with video =
bridges,
> > > > > require DRM bridges to be added and removed to a DRM card without=
 tearing
> > > > > the card down. This is possible for connectors already (used by D=
P MST), so
> > > > > add this possibility to DRM bridges as well.
> > > > >
> > > > > Implementation is based on drm_connector_init() as far as it make=
s sense,
> > > > > and differs when it doesn't. A difference is that bridges are not=
 exposed
> > > > > to userspace, hence struct drm_bridge does not embed a struct
> > > > > drm_mode_object which would provide the refcount. Instead we add =
to struct
> > > > > drm_bridge a refcount field (we don't need other struct drm_mode_=
object
> > > > > fields here) and instead of using the drm_mode_object_*() functio=
ns we
> > > > > reimplement from those functions the few lines that drm_bridge ne=
eds for
> > > > > refcounting.
> > > > >
> > > > > Also add a new devm_drm_bridge_alloc() macro to allocate a new re=
fcounted
> > > > > bridge.
> > > > >
> > > > > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > > >
> > > > So, a couple of general comments:
> > > >
> > > > - I've said it a couple of times already, but I really think you're
> > > >   making it harder than necessary for you here. This (and only this=
!)
> > > >   should be the very first series you should be pushing. The rest c=
an
> > > >   only ever work if that work goes through, and it's already hard e=
nough
> > > >   as it is. So, split that patch into a series of its own, get that
> > > >   merged, and then we will be able to deal with panels conversion a=
nd
> > > >   whatever. That's even more true with panels since there's ongoing=
 work
> > > >   that will make it easier for you too. So the best thing here is
> > > >   probably to wait.
> > >
> > > Luca and I had a quick chat on this during FOSDEM. I really think that
> > > panel (part of the) series can go in first as it fixes a very well kn=
own
> > > bug _and_ allows a pretty good cleanup to a whole set of drivers.
> >
> > I don't necessarily disagree on principle, but if you state that it can
> > get first, and fixes a known problem (which one?), then it should be a
> > separate, standalone, series.
>=20
> A problem of panel bridges having the wrong lifetime because of devm_
> attachment to a wrong device and so either being kept for too long or
> being destroyed too early.

Yeah, and panels too. Which isn't solved there.

> > Ever-expanding features are bad for both the reviewers and the
> > contributors, even more so when the discussion happens off-list.
> >
> > > With all those panel / bridge wrappers gone we should be able to see a
> > > clearer picture of what individual drivers are doing. In other words,
> > > which memory and which code actually hosts and uses internal
> > > 'next_bridge' reference.
> > >
> > > > - This patch really needs to be split into several patches, somethi=
ng
> > > >   along the lines of:
> > > >
> > > >   + Creating devm_drm_bridge_alloc()
> > > >   + Adding refcounting
> > > >   + Taking the references in all the needed places
> > > >   + Converting a bunch of drivers
> > >
> > > The last two parts seem troublematic to me, but, I must admit, I didn=
't
> > > spend so much time reviewing all drm_bridge usage patterns.
> >
> > Why? the third one is already done by that patch, the fourth can
> > relatively easily be done using coccinelle.
>=20
> I have doubts about cocci. It doesn't have a way to know, what is the
> lifetime of the references to the reference-holding memory. Maybe I'm
> missing a point there.

It doesn't matter? Cocci doesn't (have to) understand the code, it
generates a patch for you. It's up to the author to make a correct
patch.

Maxime

--ctkvotoob64tevup
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ6pCwwAKCRAnX84Zoj2+
ds3DAYCmyuWWTQzL+uHFZsj4ooH84JF7ylfCHkygjk4bJCQXQisORfKKbJfiPywk
z2E+5o0BgLSZ3mrnwgjna4TApCO5ujytoxWxMXYaZK8XX1nkPOV0t4H3yXXgLltd
APIGGfkStg==
=nbSx
-----END PGP SIGNATURE-----

--ctkvotoob64tevup--

