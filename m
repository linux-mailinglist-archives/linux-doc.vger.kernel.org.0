Return-Path: <linux-doc+bounces-3760-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C7E800BAE
	for <lists+linux-doc@lfdr.de>; Fri,  1 Dec 2023 14:21:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2A6DDB20EEF
	for <lists+linux-doc@lfdr.de>; Fri,  1 Dec 2023 13:21:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59AE02D638;
	Fri,  1 Dec 2023 13:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PnhhvnTT"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8AC2D637
	for <linux-doc@vger.kernel.org>; Fri,  1 Dec 2023 13:20:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A2A6C433CA;
	Fri,  1 Dec 2023 13:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701436858;
	bh=lb57380Z6ugr6guMiZVpDWebznO0iyP5F6Acln3lLTM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PnhhvnTTMY5jF0gBuiuPWRfLnYDyw+pcgXlKo5isR3n8nSkasLw3FyCuPrYNqD6pj
	 aEZBm4x1vzRCA2XZFBEb7zaT8I4W87PTbudPmwfu98V3J/KJOwXbf+3AnMiyU4mRE5
	 EfAkhAJ2j7A2yfWPcZ3SuLv9jqiZKr7EqD3p25TlqR3KwehJuyYnV0ZkVK6SuSt7+q
	 KVucTdmaA5ZAqqxfAV3jQimwczZY+yByj+9P+Kv2CjQUi6cSaBh4k6WG6VyfGsoYrm
	 EeLBwbYPTrZS/wDTgt2O16Pxk3TdPxwsT2ntfpq89KkoovWVA+CyzoqiWsDrEkL1tR
	 oc+qoqwsAiY8w==
Date: Fri, 1 Dec 2023 14:20:55 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-dev@igalia.com, 
	alexander.deucher@amd.com, christian.koenig@amd.com, Simon Ser <contact@emersion.fr>, 
	Rob Clark <robdclark@gmail.com>, daniel@ffwll.ch, Daniel Stone <daniel@fooishbar.org>, 
	'Marek =?utf-8?B?T2zFocOhayc=?= <maraeo@gmail.com>, Dave Airlie <airlied@gmail.com>, 
	Michel =?utf-8?Q?D=C3=A4nzer?= <michel.daenzer@mailbox.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, 
	Thomas Zimmermann <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH] drm/doc: Define KMS atomic state set
Message-ID: <bgd5xuszaujdjg7lt24dpofvhx2v6gyxfjxnqfo7nmaecmn6om@fejhsggdlffo>
References: <20231130200740.53454-1-andrealmeid@igalia.com>
 <x6cqert2tadgc46w3u2rfgcfaw6evxdeerl2mxvh2peycr4i7q@qf6oqymcti4j>
 <20231201110616.30ad1468.pekka.paalanen@collabora.com>
 <bry3w6w32uy2jlmbkcmbtthw6w6nwux7dwlcju5iuxac2wphku@md6njxjtsbvm>
 <20231201120648.2ba706e1.pekka.paalanen@collabora.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="o3ba5zbnynqveu6a"
Content-Disposition: inline
In-Reply-To: <20231201120648.2ba706e1.pekka.paalanen@collabora.com>


--o3ba5zbnynqveu6a
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 01, 2023 at 12:06:48PM +0200, Pekka Paalanen wrote:
> On Fri, 1 Dec 2023 10:25:09 +0100
> Maxime Ripard <mripard@kernel.org> wrote:
>=20
> > On Fri, Dec 01, 2023 at 11:06:16AM +0200, Pekka Paalanen wrote:
> > > On Fri, 1 Dec 2023 09:29:05 +0100
> > > Maxime Ripard <mripard@kernel.org> wrote:
> > >  =20
> > > > Hi,
> > > >=20
> > > > On Thu, Nov 30, 2023 at 05:07:40PM -0300, Andr=E9 Almeida wrote: =
=20
> > > > > From: Pekka Paalanen <pekka.paalanen@collabora.com>
> > > > >=20
> > > > > Specify how the atomic state is maintained between userspace and
> > > > > kernel, plus the special case for async flips.
> > > > >=20
> > > > > Signed-off-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> > > > > Signed-off-by: Andr=E9 Almeida <andrealmeid@igalia.com>
> > > > > ---
> > > > >=20
> > > > > This is a standalone patch from the following serie, the other pa=
tches are
> > > > > already merged:
> > > > > https://lore.kernel.org/lkml/20231122161941.320564-1-andrealmeid@=
igalia.com/
> > > > >=20
> > > > >  Documentation/gpu/drm-uapi.rst | 47 ++++++++++++++++++++++++++++=
++++++
> > > > >  1 file changed, 47 insertions(+)
> > > > >=20
> > > > > diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/d=
rm-uapi.rst
> > > > > index 370d820be248..d0693f902a5c 100644
> > > > > --- a/Documentation/gpu/drm-uapi.rst
> > > > > +++ b/Documentation/gpu/drm-uapi.rst
> > > > > @@ -570,3 +570,50 @@ dma-buf interoperability
> > > > > =20
> > > > >  Please see Documentation/userspace-api/dma-buf-alloc-exchange.rs=
t for
> > > > >  information on how dma-buf is integrated and exposed within DRM.
> > > > > +
> > > > > +KMS atomic state
> > > > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > +
> > > > > +An atomic commit can change multiple KMS properties in an atomic=
 fashion,
> > > > > +without ever applying intermediate or partial state changes.  Ei=
ther the whole
> > > > > +commit succeeds or fails, and it will never be applied partially=
=2E This is the
> > > > > +fundamental improvement of the atomic API over the older non-ato=
mic API which is
> > > > > +referred to as the "legacy API".  Applying intermediate state co=
uld unexpectedly
> > > > > +fail, cause visible glitches, or delay reaching the final state.
> > > > > +
> > > > > +An atomic commit can be flagged with DRM_MODE_ATOMIC_TEST_ONLY, =
which means the
> > > > > +complete state change is validated but not applied.  Userspace s=
hould use this
> > > > > +flag to validate any state change before asking to apply it. If =
validation fails
> > > > > +for any reason, userspace should attempt to fall back to another=
, perhaps
> > > > > +simpler, final state.  This allows userspace to probe for variou=
s configurations
> > > > > +without causing visible glitches on screen and without the need =
to undo a
> > > > > +probing change.
> > > > > +
> > > > > +The changes recorded in an atomic commit apply on top the curren=
t KMS state in
> > > > > +the kernel. Hence, the complete new KMS state is the complete ol=
d KMS state with
> > > > > +the committed property settings done on top. The kernel will try=
 to avoid   =20
> > > >=20
> > > > That part is pretty confusing to me.
> > > >=20
> > > > What are you calling the current and old KMS state? =20
> > >=20
> > > Current =3D old, if you read that "current" is the KMS state before
> > > considering the atomic commit at hand.
> > >  =20
> > > > What's confusing to me is that, yes, what you're saying is true for=
 a
> > > > given object: if it was part of the commit, the new state is the old
> > > > state + whatever the new state changed.
> > > >=20
> > > > However, if that object wasn't part of the commit at all, then it's
> > > > completely out of the old or new global KMS state. =20
> > >=20
> > > This is not talking about kernel data structures at all. This is
> > > talking about how KMS looks from the userspace point of view. =20
> >=20
> > I mean, that's also true from the userspace point of view. You can very
> > well commit only a single property on a single object, and only that
> > object will be part of the "global KMS state".
>=20
> What is "global KMS state"?

struct drm_atomic_state, ie. the object holding the entire new commit conte=
nt.

> As a userspace developer, the global KMS state is the complete, total,
> hardware and driver instance state. It's not any kind of data
> structure, but it is all the condition and all the programming of the
> whole device (hardware + driver instance) at any specific time instant.

That was my understanding, and assumption, too.

I think part of the issue is that drm_atomic_state is documented as "the
global state object for atomic updates" which kind of implies that it
holds *everything*, except that an atomic update can be partial.

So maybe we need to rewrite some other parts of the documentation too
then?

Or s/drm_atomic_state/drm_atomic_update/ so we don't have two slightly
different definitions of what a state is?

Because, yeah, at the moment we have our object state that is the
actual, entire, state of the device but the global atomic state is a
collection of object state but isn't the entire state of the device in
most cases.

If we get rid of the latter, then there's no ambiguity anymore and your
sentence makes total sense.

> It is not related to any atomic commit or UAPI call, it is how the
> hardware is currently programmed.
>=20
> How can we make that clear?
>=20
> Should "KMS state" be replaced with "complete device state" or
> something similar?

I know I've been bitten by that ambiguity, and the part of the doc I've
replied too mentions the "KMS state in the kernel" and an atomic commit,
so it's easy to make the parallel with drm_atomic_state here.

I guess we can make it clearer that it's from the userspace then?

> > > All objects are always part of the device KMS state as referred to
> > > in this doc, whether they were mentioned in the atomic commit state s=
et
> > > or not. That's the whole point: all state that was not explicitly
> > > modified remains as it was, and is actively used state by the driver
> > > and hardware. The practical end result state is the same as if all
> > > objects were (redundantly) mentioned.
> > >=20
> > > For example, if you change properties of CRTC 31, it has no effect on
> > > the behaviour of CRTC 54. If CRTC 54 was active, it remains active. If
> > > CRTC 54 had certain property values, it continues to have those
> > > property values. =20
> >=20
> > I'm not quite sure I followed your previous paragraph, sorry, but we
> > agree here and it's kind of my point really: CRTC-54 would not be part
> > of the new KMS state, so claiming that it is complete is confusing.
> >=20
> > It's not complete to me precisely because it doesn't contain the state
> > of all objects.
>=20
> Did my explanation of what "KMS state" means from userspace perspective
> above help?
>=20
> > > This is opposed to something else; the UAPI could have
> > > been designed to e.g. reset all unmentioned objects to defaults/off by
> > > the atomic commit. Obviously that's not how it works today, so we need
> > > to mention how things do work. =20
> >=20
> > Sure, I'm not claiming we should change anything but the wording of that
> > doc.
> >=20
> > > >=20
> > > > So yeah, individual object KMS state are indeed complete, but
> > > > drm_atomic_state definitely isn't. And it's the whole point of func=
tions
> > > > like drm_atomic_get_crtc_state() vs drm_atomic_get_old/new_crtc_sta=
te:
> > > > the old/new variants only return a state if it was part of
> > > > drm_atomic_state to begin with. drm_atomic_get_crtc_state() brings =
the
> > > > crtc state into drm_atomic_state if it wasn't part of it. =20
> > >=20
> > > At no point the text is referring to drm_atomic_state or any other
> > > kernel data structure. =20
> >=20
> > Then it's even more confusing, because the sentence I was quoting was
> > "The changes recorded in an atomic commit apply on top the current KMS
> > state *in the kernel*", which is ambiguous then.
>=20
> It's perhaps a misguided attempt to say that the kernel maintains the
> complete device state, and that the complete device state is modified
> in the kernel. If it helps, the "in the kernel" can be dropped.

Yeah, that would probably help too

Maxime

--o3ba5zbnynqveu6a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZWndtwAKCRDj7w1vZxhR
xYahAQCkC8F5L+poHuAwA0RByHSOZA53MCk+I2C2/Oh+cnVB0AEAmPRIDWEy8/ee
K3svOnrPldx8OJVZFtr7TrfgU0zp8wk=
=fvCD
-----END PGP SIGNATURE-----

--o3ba5zbnynqveu6a--

