Return-Path: <linux-doc+bounces-10854-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 102F48691B9
	for <lists+linux-doc@lfdr.de>; Tue, 27 Feb 2024 14:26:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 338F81C21B24
	for <lists+linux-doc@lfdr.de>; Tue, 27 Feb 2024 13:26:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B15113AA4F;
	Tue, 27 Feb 2024 13:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="YI+H3/pN"
X-Original-To: linux-doc@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9616813A87C;
	Tue, 27 Feb 2024 13:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709040405; cv=none; b=XV5Q1M9iWssQkiEJfzivlA33SCzNofUEbxKxy5D3PD0O4jPl+kBADsw4N+X2NjOOcfRXfSn8nRTWxGm7/gOsyKe82++omr5vXX+zr0q9sSMMA1WmRGxuDfF2v7iRw5woIsZa7mVtvRPY8epavmY6DyAPof7iuxaVf0vFfWItb80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709040405; c=relaxed/simple;
	bh=je8RxzPOXqGPjuvQPyzxZ26n+2I11ZgZOJBFkDsTSWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WIvDe4WdiA1vkwzhjTiR2uxHDBZWMbvH1IkBO8UFWTYpkwML2ehXXmXxp+VaMcUQGDSVhhFd0/5p8dyLcOR7HaiWQtc5F1d2t/jy0sl12EUkwpdPt+fGf9kDjO6iLLV2JZayoPnkEtWypaknaiLid6DYPeIc+8M2jEWTr6Mi0E0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=YI+H3/pN; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709040401;
	bh=je8RxzPOXqGPjuvQPyzxZ26n+2I11ZgZOJBFkDsTSWQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=YI+H3/pNPwYSk40IM1WIt8OyCHs4sJeIYUuJLN3RZY6RsJJXgt48JtuzrdwFFpBzv
	 5a1K9LLFs+mJ1I0oJftOMhv1qrLELTQ9YpFiJEVroOyw4AwOubJ5BhhFuQot8g0ZGf
	 sJhHGs2GEMTSPBdEzDaAHjhN3v4iA2WrDmHRWHVqacoyd6MEshyfjL4TCDAtuy0tv6
	 jJI3/Pk7SeIXWguIWjB9RlYlEjCtw1kn90GX0GKqae0Bgc1Ky6N6nw/A4MHifaNxTe
	 UTpuzM8EoaFPWgU7UnBEnbu5T9mefr2a77JC2k2/2Cfq9Oe4coyCD0gb2Nez5LBMaS
	 mLg6rIa/l9MhA==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pq)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id DBDBB3781FE6;
	Tue, 27 Feb 2024 13:26:40 +0000 (UTC)
Date: Tue, 27 Feb 2024 15:26:39 +0200
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Arthur Grillo <arthurgrillo@riseup.net>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, Melissa Wen
 <melissa.srw@gmail.com>, =?UTF-8?B?TWHDrXJh?= Canal
 <mairacanal@riseup.net>, Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/vkms: Add information on how to benchmark
Message-ID: <20240227152639.6426c401.pekka.paalanen@collabora.com>
In-Reply-To: <0892593d-0fd9-4381-b2bd-843627bd2723@riseup.net>
References: <20240226-bench-vkms-v1-1-515ef91b11c8@riseup.net>
	<20240227111941.061a2892.pekka.paalanen@collabora.com>
	<8ac7bf91-fbce-4403-a801-9dfee39ea802@riseup.net>
	<20240227135545.62dd5f57.pekka.paalanen@collabora.com>
	<0892593d-0fd9-4381-b2bd-843627bd2723@riseup.net>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DX6kKQq2iBgSz7fGP6YUgnj";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/DX6kKQq2iBgSz7fGP6YUgnj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 27 Feb 2024 09:29:58 -0300
Arthur Grillo <arthurgrillo@riseup.net> wrote:

> On 27/02/24 08:55, Pekka Paalanen wrote:
> > On Tue, 27 Feb 2024 08:44:52 -0300
> > Arthur Grillo <arthurgrillo@riseup.net> wrote:
> >  =20
> >> On 27/02/24 06:19, Pekka Paalanen wrote: =20
> >>> On Mon, 26 Feb 2024 17:42:11 -0300
> >>> Arthur Grillo <arthurgrillo@riseup.net> wrote:
> >>>    =20
> >>>> Now that we have a defined benchmark for testing the driver, add
> >>>> documentation on how to run it.
> >>>>
> >>>> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> >>>> ---
> >>>>  Documentation/gpu/vkms.rst | 6 ++++++
> >>>>  1 file changed, 6 insertions(+)
> >>>>
> >>>> diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
> >>>> index ba04ac7c2167..6d07f79f77ff 100644
> >>>> --- a/Documentation/gpu/vkms.rst
> >>>> +++ b/Documentation/gpu/vkms.rst
> >>>> @@ -89,6 +89,12 @@ You can also run subtests if you do not want to r=
un the entire test::
> >>>>    sudo ./build/tests/kms_flip --run-subtest basic-plain-flip --devi=
ce "sys:/sys/devices/platform/vkms"
> >>>>    sudo IGT_DEVICE=3D"sys:/sys/devices/platform/vkms" ./build/tests/=
kms_flip --run-subtest basic-plain-flip
> >>>> =20
> >>>> +If you are developing features that may affect performance, you can=
 run the kms_fb_stress   =20
> >>>
> >>> s/can/must/
> >>>    =20
> >>>> +benchmark::   =20
> >>>
> >>> before and after, and report the numbers.   =20
> >>
> >> Did you mean to write the benchmarks logs here? =20
> >=20
> > I mean people should be required tell their before and after numbers in
> > either commit message (my preference) or in series cover letter (if
> > benchmarking commits is not useful).
> >=20
> > With the addition of YUV support in VKMS, maybe the benchmark needs to =
=20
>=20
> With the upcoming addition, I've sent a patch to arbitrarily change the
> formats on the benchmark via command-line options. It's not adding a new
> case, but maybe just this could already help.
>=20
> https://lore.kernel.org/all/20240226-kms_fb_stress-dev-v1-0-1c14942b1244@=
riseup.net/

In that case you would need to document exactly what command line
options to use, and ask people to report the numbers of each test
case.

That works. Alternatively or additionally, the test cases could be
built in to the benchmark, and it just reports numbers for all of them
in a single invocation. Then people running the standard benchmark do
not need to worry about getting the command line options right, or
running multiple cases. And reviewers do not need to ask to re-run with
the correct options.

I suppose rotations might get added, too.

Or maybe you'd provide a script that covers all the standard
performance test cases?


Thanks,
pq

> > start printing YUV numbers separately as a new case.
> >=20
> >=20
> > Thanks,
> > pq
> >  =20
> >> =20
> >>>    =20
> >>>> +
> >>>> +  sudo ./build/benchmarks/kms_fb_stress --device "sys:/sys/devices/=
platform/vkms"
> >>>> +  sudo IGT_DEVICE=3D"sys:/sys/devices/platform/vkms" ./build/benchm=
arks/kms_fb_stress   =20
> >>>
> >>> Do people need to run both commands?   =20
> >>
> >> No, they don't, just two options.
> >>
> >> Best Regards,
> >> ~Arthur Grillo
> >> =20
> >>>
> >>> Anyway, a good idea.
> >>>
> >>> Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> >>>
> >>>
> >>> Thanks,
> >>> pq
> >>>    =20
> >>>> +
> >>>>  TODO
> >>>>  =3D=3D=3D=3D
> >>>> =20
> >>>>
> >>>> ---
> >>>> base-commit: eeb8e8d9f124f279e80ae679f4ba6e822ce4f95f
> >>>> change-id: 20240226-bench-vkms-5b8b7aab255e
> >>>>
> >>>> Best regards,   =20
> >>>    =20
> >  =20


--Sig_/DX6kKQq2iBgSz7fGP6YUgnj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmXd4w8ACgkQI1/ltBGq
qqfnHxAAp79lJUjUsLan8ziK6wUyuM4IoJLwb3oFaNNDCcPrFKMLXTUBu87boL/n
n47WzJ/1mKbMlgSXCWLR/2j6RTjBy+gGCPx1TLDBY+2Jf+s48ms/RyS6GTEB1Bj0
MhCUhYt4FrgqXecdpINJXQ4/WpIbt4RECU1chiMF0PoXvTe21G02Zhg2rfvyc1Xh
yLn3I+I3cjwqTVmLMPTPGRIoX0ax64TWMU6L1CSWpRdHkQanUJLERb1NKZG0y3gK
eZF2CaSyq5IM2zur9TrYIzJjuHvsvNx0ax6FBifZYLmFGWB7BSx2BPg49mCdM2zF
8wSTcn2OW+ndUsXY1aZrUF/breJXIdCne008J43ygXOahg7ltAezMu7g0LE+tjBC
o3tRPlspfDjyVVvjFXjDvRmdagYUzemAcZY6NldG38TqmqYegXjR/RC6NLI/MKTd
X1Lo4xIArbPU7GU0gyJz0VwehFgc4ZcTaq8j7/KhTQRXNkDnotoNdhY8VIrd3EO/
Fvh6xSE22xxvmFw4psscLe5lxmM3BBecRRhQ83IoBxhCIOQrOsg8+HK8rmv+dGkT
xtwqvEieZHmvKqmSbJsLXhgNNe2OOZHz8BfyvXQUeQ7fn3V+dqepSopeVDOqS4t5
hSd67SKpCocwdmXOkap20qYxWtiquw/0Viv4HtgD45EpnYHVi4o=
=MeCb
-----END PGP SIGNATURE-----

--Sig_/DX6kKQq2iBgSz7fGP6YUgnj--

