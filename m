Return-Path: <linux-doc+bounces-3781-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C3C800FD8
	for <lists+linux-doc@lfdr.de>; Fri,  1 Dec 2023 17:16:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 09FAFB20D25
	for <lists+linux-doc@lfdr.de>; Fri,  1 Dec 2023 16:16:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7B7F4AF7B;
	Fri,  1 Dec 2023 16:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ASi3ciqC"
X-Original-To: linux-doc@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25F6719BA;
	Fri,  1 Dec 2023 08:16:22 -0800 (PST)
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pq)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E9E4766073AA;
	Fri,  1 Dec 2023 16:16:19 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701447380;
	bh=0Rv4K9OjzkDSZX5KyzZrLg8/xF7OKIqDRN1YfpYpnsM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ASi3ciqCKaCPZTQxMXV50Mr//vcT4Akl8gk622IJfHyQWWLFRYYsfVqdKaV0iyJ3I
	 RdnujBEBFmcw72lNSuAO8Vli5XL4HqIr3A5hw2Nq4RDFUrkjCGQrq/A3CyitXKlEIE
	 PHzynbTH+9a2oHsGcIId7HNS06mJ8omIi7hOe7s0BTMWESjRU/pwBcgm955CSR3o8g
	 8BCzk7hdukZ/lrCmwc1wcd/t9iG3001TCD47N0DDZc6uOFQhov6eWN8azHdGzUGa6Q
	 uSq5Yn3wsawuCt10IZKLo9EySbBbhM5RKsfNepyXUnykBPI7Unt015pBgJP5Tj4qL3
	 3W16BZqRR+mlA==
Date: Fri, 1 Dec 2023 18:16:16 +0200
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: =?UTF-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Maxime
 Ripard <mripard@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 'Marek
 =?UTF-8?B?T2zFocOhayc=?= <maraeo@gmail.com>, Michel =?UTF-8?B?RMOkbnpl?=
 =?UTF-8?B?cg==?= <michel.daenzer@mailbox.org>, Randy Dunlap
 <rdunlap@infradead.org>, linux-doc@vger.kernel.org, Thomas Zimmermann
 <tzimmermann@suse.de>, kernel-dev@igalia.com, alexander.deucher@amd.com,
 christian.koenig@amd.com
Subject: Re: [PATCH] drm/doc: Define KMS atomic state set
Message-ID: <20231201181616.4c1f0acc.pekka.paalanen@collabora.com>
In-Reply-To: <ZWn1EC04wBSN9hu2@intel.com>
References: <20231130200740.53454-1-andrealmeid@igalia.com>
	<ZWn1EC04wBSN9hu2@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/F9PPFkMz.hxMWM9_2fl0CIX";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/F9PPFkMz.hxMWM9_2fl0CIX
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 1 Dec 2023 17:00:32 +0200
Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> wrote:

> On Thu, Nov 30, 2023 at 05:07:40PM -0300, Andr=C3=A9 Almeida wrote:
> > From: Pekka Paalanen <pekka.paalanen@collabora.com>
> >=20
> > Specify how the atomic state is maintained between userspace and
> > kernel, plus the special case for async flips.
> >=20
> > Signed-off-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> > Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
> > ---
> >=20
> > This is a standalone patch from the following serie, the other patches =
are
> > already merged:
> > https://lore.kernel.org/lkml/20231122161941.320564-1-andrealmeid@igalia=
.com/
> >=20
> >  Documentation/gpu/drm-uapi.rst | 47 ++++++++++++++++++++++++++++++++++
> >  1 file changed, 47 insertions(+)
> >=20
> > diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uap=
i.rst
> > index 370d820be248..d0693f902a5c 100644
> > --- a/Documentation/gpu/drm-uapi.rst
> > +++ b/Documentation/gpu/drm-uapi.rst
> > @@ -570,3 +570,50 @@ dma-buf interoperability
> > =20
> >  Please see Documentation/userspace-api/dma-buf-alloc-exchange.rst for
> >  information on how dma-buf is integrated and exposed within DRM.
> > +
> > +KMS atomic state
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +An atomic commit can change multiple KMS properties in an atomic fashi=
on,
> > +without ever applying intermediate or partial state changes.  Either t=
he whole
> > +commit succeeds or fails, and it will never be applied partially. This=
 is the
> > +fundamental improvement of the atomic API over the older non-atomic AP=
I which is
> > +referred to as the "legacy API".  Applying intermediate state could un=
expectedly
> > +fail, cause visible glitches, or delay reaching the final state.
> > +
> > +An atomic commit can be flagged with DRM_MODE_ATOMIC_TEST_ONLY, which =
means the
> > +complete state change is validated but not applied.  Userspace should =
use this
> > +flag to validate any state change before asking to apply it. If valida=
tion fails
> > +for any reason, userspace should attempt to fall back to another, perh=
aps
> > +simpler, final state.  This allows userspace to probe for various conf=
igurations
> > +without causing visible glitches on screen and without the need to und=
o a
> > +probing change.
> > +
> > +The changes recorded in an atomic commit apply on top the current KMS =
state in
> > +the kernel. Hence, the complete new KMS state is the complete old KMS =
state with
> > +the committed property settings done on top. The kernel will try to av=
oid
> > +no-operation changes, =20
>=20
> Not how things work. The driver may try to avoid some really
> expensive operations, but generally it will just blindly blast
> the full state to the hardware.
>=20
> IIRC this was discussed long ago when atomic was being designed
> and the general concensus was that the kernel shouldn't generally
> do this kind of stuff, and instead we just leave it to userspace
> to generate optimal commits.

I don't think userspace ever got that memo. If I was cheeky, I could
ask where that is documented, so you could point at it and say "told
you so".

When I was working on Weston atomic KMS support many years ago, I
created a framework that emitted KMS property changes only when they
actually needed changing. By review feedback (*), all that machinery was
dropped in a re-design, and today Weston always emits all KMS
properties it knows to program for a specific CRTC update including all
relevant planes and connectors.

(*) Why do we need to repeat the same state tracking that the kernel
does anyway, and also risk getting out of sync with the kernel due to
bugs which then become more difficult to diagnose. I guess (assumed)
kernel internals leaked to userspace. Oops.

> > so it is safe for userspace to send redundant property
> > +settings. =20
>=20
> Safe but not optimal. Any object included in the state will cause said
> object to be part of the commit, and side effects will also need to be
> observed.
>=20
> So if you add an extra crtc (either directly or indirectly) it will
> have a new commit inserted into the queue and thus and any subsequent
> commit will either block or be rejected with -EBUSY. Also for directly
> added crtcs an event will be emitted once the commit is done.

It is not too hard to keep CRTCs well separated, until the kernel
driver decides under the hood to pull in an unwanted CRTC.

But yes, that caveat could use extending in the doc.

> Any plane added will also need to observe side effects even if the FB
> doesn't change, such as invalidating any internal compressed version
> of the old FB contents, PSR/DSI command mode/etc. will need to upload
> the frame to the display, etc. I suppose we could specify that if no
> FB is specified at all then these kind of side effects could be ignored,
> but that is certainly not how things are implemented right now.

Well, this is all surprise news to me.

> So for optimal behaviour userspace should be minimizing the commits.
>=20


Thanks,
pq

--Sig_/F9PPFkMz.hxMWM9_2fl0CIX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmVqBtAACgkQI1/ltBGq
qqdwcQ//bBatCdsiZdOmuCC1Af74DOwx2tCwocHlKXG7faIgiFaVWlg1qjUAU42L
igH+GrUT+0Jpz84ltKyYr13PJfe71gUuDcsRx731CHEfvMBkdamWdSeFobFlLcZD
zzMAniWIzdkklawHAlcvzLkhwLMulgUDn36weOaTGbuTg2kMzVGP6Vqzhfip+2y5
L5pu/L7Mw5jpnuueqCvd8oLsXVJwu95q9sq9olM/iSyUND3gE4OLKQtD2X+LNk1I
dc242QVtQNnDwCupMXkM7eM+wYGOuwVKZ4/p32GZNbF7rGYorB25cSoUyPETXEfo
yMoGaFLDsZF02w1DGDKQELAPZwIHnMaUVCGjRRwl7sPiW7QC+1AIcRwAhUm4jfUc
H0SoFE/9xhsI/NSlSizPQ6ruZeu3O93nyWASwtqTCUTrhpVR7X1xmqecHsLTLt5A
ISd/ALVZooVMuArY+dlX0DMN8t1SMmR3ZdmXhi/GeE84m20a1ThC7K71yqqMlHBp
OciCWfL5wbIs7nuLWNrFLE5hZrQ4Q7c8pEx3zkolnCVwo0kH8JWdZtFWe8NSDBrx
46HRNW+EyCZBpi6WNAK8MxdkQkbgkbysbxmKjKMcDGhQt9f62PJ+nvHwJc26/Csf
cu2D++QrMB7eJRbMcvV765x30WHNxTueZeiqOtIcWUt+a7j85mg=
=SfJB
-----END PGP SIGNATURE-----

--Sig_/F9PPFkMz.hxMWM9_2fl0CIX--

