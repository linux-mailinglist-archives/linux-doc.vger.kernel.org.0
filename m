Return-Path: <linux-doc+bounces-3777-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC53800EEE
	for <lists+linux-doc@lfdr.de>; Fri,  1 Dec 2023 17:04:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE10E1C209C1
	for <lists+linux-doc@lfdr.de>; Fri,  1 Dec 2023 16:04:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C4924BA84;
	Fri,  1 Dec 2023 16:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="h/zESl6A"
X-Original-To: linux-doc@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9B9010DB;
	Fri,  1 Dec 2023 08:04:01 -0800 (PST)
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pq)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8B2F766073A9;
	Fri,  1 Dec 2023 16:03:58 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701446639;
	bh=Bhi/oJzqpRU3XRA7MITWzV75GEkCiVPyd3d/unY+UEw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=h/zESl6AOEyvT5fTkmmgLDZFkwnxmkiNlB+6F4C5Tm9lvQGKtz6PTU195wBFELpAf
	 d+IBar3yQ6pOBCvwYFz7Jov3kkX0yU3jfbCiXtBL65OBKXz66HCHhzV3nLyrHnwk/e
	 bjdsHYpaiHrGd/VGqVDZxj5N9h2hX0qyBLvMjEg8vQirfCek0icNnFQmy17eRwUBdL
	 H95haaLVHU4c6O5PfozWwnYz4iPThEUFX/MK9YLwSdXiaVPQ58PbHxv+W0WFbGkvNd
	 VbPO9ivmzo7nAtJC8P7MOir3p3pFfxXDpvhXvyd8Ogh4N+6R+kfgzU8ipCZ+vGuoWw
	 YXvM6E78cNI9A==
Date: Fri, 1 Dec 2023 18:03:48 +0200
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: =?UTF-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 Simon Ser <contact@emersion.fr>, Rob Clark <robdclark@gmail.com>,
 daniel@ffwll.ch, Daniel Stone <daniel@fooishbar.org>, 'Marek
 =?UTF-8?B?T2zFocOhayc=?= <maraeo@gmail.com>, Dave Airlie
 <airlied@gmail.com>, Michel =?UTF-8?B?RMOkbnplcg==?=
 <michel.daenzer@mailbox.org>, Randy Dunlap <rdunlap@infradead.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, Thomas
 Zimmermann <tzimmermann@suse.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH] drm/doc: Define KMS atomic state set
Message-ID: <20231201180348.4a42025b.pekka.paalanen@collabora.com>
In-Reply-To: <bgd5xuszaujdjg7lt24dpofvhx2v6gyxfjxnqfo7nmaecmn6om@fejhsggdlffo>
References: <20231130200740.53454-1-andrealmeid@igalia.com>
	<x6cqert2tadgc46w3u2rfgcfaw6evxdeerl2mxvh2peycr4i7q@qf6oqymcti4j>
	<20231201110616.30ad1468.pekka.paalanen@collabora.com>
	<bry3w6w32uy2jlmbkcmbtthw6w6nwux7dwlcju5iuxac2wphku@md6njxjtsbvm>
	<20231201120648.2ba706e1.pekka.paalanen@collabora.com>
	<bgd5xuszaujdjg7lt24dpofvhx2v6gyxfjxnqfo7nmaecmn6om@fejhsggdlffo>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9y=H4uMe86wLJn1vn__+2zA";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/9y=H4uMe86wLJn1vn__+2zA
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 1 Dec 2023 14:20:55 +0100
Maxime Ripard <mripard@kernel.org> wrote:

> On Fri, Dec 01, 2023 at 12:06:48PM +0200, Pekka Paalanen wrote:
> > On Fri, 1 Dec 2023 10:25:09 +0100
> > Maxime Ripard <mripard@kernel.org> wrote:
> >  =20
> > > On Fri, Dec 01, 2023 at 11:06:16AM +0200, Pekka Paalanen wrote: =20
> > > > On Fri, 1 Dec 2023 09:29:05 +0100
> > > > Maxime Ripard <mripard@kernel.org> wrote:
> > > >    =20
> > > > > Hi,
> > > > >=20
> > > > > On Thu, Nov 30, 2023 at 05:07:40PM -0300, Andr=C3=A9 Almeida wrot=
e:   =20
> > > > > > From: Pekka Paalanen <pekka.paalanen@collabora.com>
> > > > > >=20
> > > > > > Specify how the atomic state is maintained between userspace and
> > > > > > kernel, plus the special case for async flips.
> > > > > >=20
> > > > > > Signed-off-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> > > > > > Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
> > > > > > ---
> > > > > >=20
> > > > > > This is a standalone patch from the following serie, the other =
patches are
> > > > > > already merged:
> > > > > > https://lore.kernel.org/lkml/20231122161941.320564-1-andrealmei=
d@igalia.com/
> > > > > >=20
> > > > > >  Documentation/gpu/drm-uapi.rst | 47 ++++++++++++++++++++++++++=
++++++++
> > > > > >  1 file changed, 47 insertions(+)
> > > > > >=20
> > > > > > diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu=
/drm-uapi.rst
> > > > > > index 370d820be248..d0693f902a5c 100644
> > > > > > --- a/Documentation/gpu/drm-uapi.rst
> > > > > > +++ b/Documentation/gpu/drm-uapi.rst
> > > > > > @@ -570,3 +570,50 @@ dma-buf interoperability
> > > > > > =20
> > > > > >  Please see Documentation/userspace-api/dma-buf-alloc-exchange.=
rst for
> > > > > >  information on how dma-buf is integrated and exposed within DR=
M.
> > > > > > +
> > > > > > +KMS atomic state
> > > > > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > > +
> > > > > > +An atomic commit can change multiple KMS properties in an atom=
ic fashion,
> > > > > > +without ever applying intermediate or partial state changes.  =
Either the whole
> > > > > > +commit succeeds or fails, and it will never be applied partial=
ly. This is the
> > > > > > +fundamental improvement of the atomic API over the older non-a=
tomic API which is
> > > > > > +referred to as the "legacy API".  Applying intermediate state =
could unexpectedly
> > > > > > +fail, cause visible glitches, or delay reaching the final stat=
e.
> > > > > > +
> > > > > > +An atomic commit can be flagged with DRM_MODE_ATOMIC_TEST_ONLY=
, which means the
> > > > > > +complete state change is validated but not applied.  Userspace=
 should use this
> > > > > > +flag to validate any state change before asking to apply it. I=
f validation fails
> > > > > > +for any reason, userspace should attempt to fall back to anoth=
er, perhaps
> > > > > > +simpler, final state.  This allows userspace to probe for vari=
ous configurations
> > > > > > +without causing visible glitches on screen and without the nee=
d to undo a
> > > > > > +probing change.
> > > > > > +
> > > > > > +The changes recorded in an atomic commit apply on top the curr=
ent KMS state in
> > > > > > +the kernel. Hence, the complete new KMS state is the complete =
old KMS state with
> > > > > > +the committed property settings done on top. The kernel will t=
ry to avoid     =20
> > > > >=20
> > > > > That part is pretty confusing to me.
> > > > >=20
> > > > > What are you calling the current and old KMS state?   =20
> > > >=20
> > > > Current =3D old, if you read that "current" is the KMS state before
> > > > considering the atomic commit at hand.
> > > >    =20
> > > > > What's confusing to me is that, yes, what you're saying is true f=
or a
> > > > > given object: if it was part of the commit, the new state is the =
old
> > > > > state + whatever the new state changed.
> > > > >=20
> > > > > However, if that object wasn't part of the commit at all, then it=
's
> > > > > completely out of the old or new global KMS state.   =20
> > > >=20
> > > > This is not talking about kernel data structures at all. This is
> > > > talking about how KMS looks from the userspace point of view.   =20
> > >=20
> > > I mean, that's also true from the userspace point of view. You can ve=
ry
> > > well commit only a single property on a single object, and only that
> > > object will be part of the "global KMS state". =20
> >=20
> > What is "global KMS state"? =20
>=20
> struct drm_atomic_state, ie. the object holding the entire new commit con=
tent.
>=20
> > As a userspace developer, the global KMS state is the complete, total,
> > hardware and driver instance state. It's not any kind of data
> > structure, but it is all the condition and all the programming of the
> > whole device (hardware + driver instance) at any specific time instant.=
 =20
>=20
> That was my understanding, and assumption, too.
>=20
> I think part of the issue is that drm_atomic_state is documented as "the
> global state object for atomic updates" which kind of implies that it
> holds *everything*, except that an atomic update can be partial.

I haven't read such doc, and I never intended to refer to struct
drm_atomic_state. It very much sounds like it's not what I mean. I
avoid reading kernel internals docs, they are uninteresting to
userspace developers.

Is it really "global" too? Or is it device-wide? Or is it just the bits
that userspace bothered to mention in an atomic commit?

> So maybe we need to rewrite some other parts of the documentation too
> then?

I guess.

> Or s/drm_atomic_state/drm_atomic_update/ so we don't have two slightly
> different definitions of what a state is?
>=20
> Because, yeah, at the moment we have our object state that is the
> actual, entire, state of the device but the global atomic state is a
> collection of object state but isn't the entire state of the device in
> most cases.
>=20
> If we get rid of the latter, then there's no ambiguity anymore and your
> sentence makes total sense.

I have no idea of kernel internals. Userspace should not care about
kernel internals as that would mean the kernel internals become UABI.
Some internals leak into UABI anyway as observable behaviour, but it
could be worse.

The complete device state is a vague, abstract concept. I do not expect
it to be an actual C struct. It is hardware-specific, too.

> > It is not related to any atomic commit or UAPI call, it is how the
> > hardware is currently programmed.
> >=20
> > How can we make that clear?
> >=20
> > Should "KMS state" be replaced with "complete device state" or
> > something similar? =20
>=20
> I know I've been bitten by that ambiguity, and the part of the doc I've
> replied too mentions the "KMS state in the kernel" and an atomic commit,
> so it's easy to make the parallel with drm_atomic_state here.
>=20
> I guess we can make it clearer that it's from the userspace then?

It's not from userspace. It is a concept from the userspace
perspective. I'm not sure how to make that more clear.

=46rom userspace perspective it looks like the kernel maintains all of a
device's state. What would you call this "all of a device's state as
maintained by the kernel"?


Thanks,
pq

> > > > All objects are always part of the device KMS state as referred to
> > > > in this doc, whether they were mentioned in the atomic commit state=
 set
> > > > or not. That's the whole point: all state that was not explicitly
> > > > modified remains as it was, and is actively used state by the driver
> > > > and hardware. The practical end result state is the same as if all
> > > > objects were (redundantly) mentioned.
> > > >=20
> > > > For example, if you change properties of CRTC 31, it has no effect =
on
> > > > the behaviour of CRTC 54. If CRTC 54 was active, it remains active.=
 If
> > > > CRTC 54 had certain property values, it continues to have those
> > > > property values.   =20
> > >=20
> > > I'm not quite sure I followed your previous paragraph, sorry, but we
> > > agree here and it's kind of my point really: CRTC-54 would not be part
> > > of the new KMS state, so claiming that it is complete is confusing.
> > >=20
> > > It's not complete to me precisely because it doesn't contain the state
> > > of all objects. =20
> >=20
> > Did my explanation of what "KMS state" means from userspace perspective
> > above help?
> >  =20
> > > > This is opposed to something else; the UAPI could have
> > > > been designed to e.g. reset all unmentioned objects to defaults/off=
 by
> > > > the atomic commit. Obviously that's not how it works today, so we n=
eed
> > > > to mention how things do work.   =20
> > >=20
> > > Sure, I'm not claiming we should change anything but the wording of t=
hat
> > > doc.
> > >  =20
> > > > >=20
> > > > > So yeah, individual object KMS state are indeed complete, but
> > > > > drm_atomic_state definitely isn't. And it's the whole point of fu=
nctions
> > > > > like drm_atomic_get_crtc_state() vs drm_atomic_get_old/new_crtc_s=
tate:
> > > > > the old/new variants only return a state if it was part of
> > > > > drm_atomic_state to begin with. drm_atomic_get_crtc_state() bring=
s the
> > > > > crtc state into drm_atomic_state if it wasn't part of it.   =20
> > > >=20
> > > > At no point the text is referring to drm_atomic_state or any other
> > > > kernel data structure.   =20
> > >=20
> > > Then it's even more confusing, because the sentence I was quoting was
> > > "The changes recorded in an atomic commit apply on top the current KMS
> > > state *in the kernel*", which is ambiguous then. =20
> >=20
> > It's perhaps a misguided attempt to say that the kernel maintains the
> > complete device state, and that the complete device state is modified
> > in the kernel. If it helps, the "in the kernel" can be dropped. =20
>=20
> Yeah, that would probably help too
>=20
> Maxime


--Sig_/9y=H4uMe86wLJn1vn__+2zA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmVqA+QACgkQI1/ltBGq
qqc//Q//Sz+1z1KkANCi5LLoNSLELa8vm0D2/6k5G+FcOGT6WHpKKsSqYYOhynoR
IhJkPtzU3qdz5X3yBfvZ+aMteDA/81q0QZoMMReKQeRPto/M2I7DWxhSYtUBxYRt
7NofmGdr1vkOGTuQ7wJObMYzX+zzJNmp5KFdMNVcWW09z6+TlsJeOzfb7+w1/bMb
d5ctl1SDdMBfOez/bk5vpzplul+5aaiAlRqJppzNMrJpj4i7A2Pp/gxJK8npBiYh
H/pkSJwG0E5S//XoxkMx3b7v+7CVLzvTilKuqf9RTHqK/c5hGQKPlarMu2sCKmP/
sri1zE9z0TqONCT1GGp4bOXKo2k5/bxTPRTLjc7DOcctcAPOhly520nuO+HnlBC2
qYXuG5OECLOby2FFa4zGTZbktpJr7VnHqer4fyaiB4KmzkqwXD8uyIcZmt8TZjkv
zpn83IUy1xIgehOQvwd0soNAvFLTqKzQpXOGv16gZs+RmXpjIEcpRSUd3Nn/37Hi
aDR4/9MtxP0axxlrD85QhKIGybXkTHUWPedoRtP5c+EkpdSJhcYs0Vw6z9jGGUCD
MG6xXoqm/ONbyCdwU8oFWbwDLByLJsB2xsibJDAUkas69MzVVDE2g1xnmi4TMRhM
rktya+o5f2mpTzgf88AszGFBIOYx29p8AH2kUauY1fSIJl3aNAY=
=ipke
-----END PGP SIGNATURE-----

--Sig_/9y=H4uMe86wLJn1vn__+2zA--

