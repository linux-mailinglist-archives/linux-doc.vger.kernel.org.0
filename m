Return-Path: <linux-doc+bounces-984-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BA91D7D53E0
	for <lists+linux-doc@lfdr.de>; Tue, 24 Oct 2023 16:24:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB24F1C20B66
	for <lists+linux-doc@lfdr.de>; Tue, 24 Oct 2023 14:24:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 671A02C85D;
	Tue, 24 Oct 2023 14:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GVjYHRiP"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC31FBFB
	for <linux-doc@vger.kernel.org>; Tue, 24 Oct 2023 14:24:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 570D0C433C7;
	Tue, 24 Oct 2023 14:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698157491;
	bh=JiAgJPKemF9Wi2E3Nn7vBcVAiqFYF94P9jyQ6bRIssY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GVjYHRiP6+XxzVH7PcvA+cqVtDnX8XjFr68MPXEr15HWpNxUubJZCvRUsGdSYooIB
	 96TTfcHjGLsQqmO1T/idyHpCLQAReQYVEHrT07OtneqwvON7jrBfaQgWr95vLuPB0Z
	 de2nNZifq44lq9aPDX3UXBBMf3N5vSxPvGY9mYyRvjNTz0pmvwQ+5qa2o8abfRAIUh
	 1ZGa4qjYnbCThn/DunhPbmAAcvqtUV1zGKMad0cd+AcGL9EtLouUkTgForBJ5hE4sx
	 09h28lmevoSWX3HbXOqTM+1X8xATWi7uw6BirOy+44AR+mwIVoNeSidc26ZQ+lAnYm
	 YNikKsPR4ggpA==
Date: Tue, 24 Oct 2023 16:24:49 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Yuran Pereira <yuran.pereira@hotmail.com>, airlied@gmail.com, 
	neil.armstrong@linaro.org, sam@ravnborg.org, daniel@ffwll.ch, 
	maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, corbet@lwn.net, sumit.semwal@linaro.org, 
	christian.koenig@amd.com, dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] drm: docs: Remove item from TODO list
Message-ID: <c6kwqxz2xgl64qb6dzetjjh6j2a6hj7mvbkeg57f5ulfs2hrib@ocjjsoxw3ns6>
References: <DB3PR10MB683528B8252ED2A802A0E154E8D8A@DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM>
 <CAD=FV=W0G6C-=99viHMQaW2REGRQr2xgaejnJmadOdZkoE7AjA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hybcvdpiqm52svmj"
Content-Disposition: inline
In-Reply-To: <CAD=FV=W0G6C-=99viHMQaW2REGRQr2xgaejnJmadOdZkoE7AjA@mail.gmail.com>


--hybcvdpiqm52svmj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Oct 23, 2023 at 10:25:50AM -0700, Doug Anderson wrote:
> On Mon, Oct 23, 2023 at 9:31=E2=80=AFAM Yuran Pereira <yuran.pereira@hotm=
ail.com> wrote:
> >
> > Since "Clean up checks for already prepared/enabled in panels" has
> > already been done and merged [1], I think there is no longer a need
> > for this item to be in the gpu TODO.
> >
> > [1] https://patchwork.freedesktop.org/patch/551421/
> >
> > Signed-off-by: Yuran Pereira <yuran.pereira@hotmail.com>
> > ---
> >  Documentation/gpu/todo.rst | 25 -------------------------
> >  1 file changed, 25 deletions(-)
>=20
> It's not actually all done. It's in a bit of a limbo state right now,
> unfortunately. I landed all of the "simple" cases where panels were
> needlessly tracking prepare/enable, but the less simple cases are
> still outstanding.
>=20
> Specifically the issue is that many panels have code to properly power
> cycle themselves off at shutdown time and in order to do that they
> need to keep track of the prepare/enable state. After a big, long
> discussion [1] it was decided that we could get rid of all the panel
> code handling shutdown if only all relevant DRM KMS drivers would
> properly call drm_atomic_helper_shutdown().
>=20
> I made an attempt to get DRM KMS drivers to call
> drm_atomic_helper_shutdown() [2] [3] [4]. I was able to land the
> patches that went through drm-misc, but currently many of the
> non-drm-misc ones are blocked waiting for attention.
>=20
> ...so things that could be done to help out:
>=20
> a) Could review patches that haven't landed in [4]. Maybe adding a
> Reviewed-by tag would help wake up maintainers?
>=20
> b) Could see if you can identify panels that are exclusively used w/
> DRM drivers that have already been converted and then we could post
> patches for just those panels. I have no idea how easy this task would
> be. Is it enough to look at upstream dts files by "compatible" string?

I think it is, yes.

Maxime

--hybcvdpiqm52svmj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZTfTsAAKCRDj7w1vZxhR
xcQLAQDLOftRXQ2lHJ/6tZ1C2DlWodIPleYTRFzDQVKVJDBTtQEAvg5gQvFvDTgw
ic2BwYSSUUEriwl/ml0eDvtollJE0gM=
=HH4h
-----END PGP SIGNATURE-----

--hybcvdpiqm52svmj--

