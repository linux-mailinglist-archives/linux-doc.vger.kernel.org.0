Return-Path: <linux-doc+bounces-1678-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A29D7DFF76
	for <lists+linux-doc@lfdr.de>; Fri,  3 Nov 2023 08:44:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D9306B2129C
	for <lists+linux-doc@lfdr.de>; Fri,  3 Nov 2023 07:44:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E6737499;
	Fri,  3 Nov 2023 07:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FPamwwx+"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F52748C
	for <linux-doc@vger.kernel.org>; Fri,  3 Nov 2023 07:44:16 +0000 (UTC)
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9D3083;
	Fri,  3 Nov 2023 00:44:15 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-6ce532451c7so966149a34.2;
        Fri, 03 Nov 2023 00:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698997455; x=1699602255; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H4O0vQt5/kYcmx8zMREu13SPTAgKxXvRq08jWfn9u1s=;
        b=FPamwwx+ZB2YNLtREVHAKT/5zXwylv2Fnk/cK2tnFG53D6h+JhepeuvdJqX5a1Iw+/
         4+7fUzvFONO5G+VsKbO9Oal3OQTxhQkkWSLEj4NCV9cego0SQCQTpPt2M8lNegMkc/YT
         nDeUGCSV7XUdcN1/VLq1haD8+dU4Y4gpTWx2IRo/G21A2G8Y6nCowSmP2bu9zgsGuxJH
         qSyX7lCS+uskdJNQW8RwkPcEV8Pq80emrWS3uKK5jFDHaw5fi5Kg+8OmN1FEP3XXAWbl
         +LlZtYmfBm1xMZEfr4gxXErE7UnfanFD3FBxpMGMTSZX5Lxp6zN3l4eJMfu5a46DYII1
         CkAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698997455; x=1699602255;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H4O0vQt5/kYcmx8zMREu13SPTAgKxXvRq08jWfn9u1s=;
        b=M410VLOo3kDkBE3N8qv1OUTnd+mJlI4AQAYFh1i+EcfFZk5mSB+kKjUln8zVu7NClE
         JTgt1JinfeTMB9nUpQGl468HbE6rFuu/Jlz7pZH1vc+srBlGCowoHQPk60McsvCmRyfd
         mFAhrt2LJegwwSNNO4WFYUDx1ZTSjZhz6vhEFpB1p5vazVLaqmZEcrHwh+BoIhQOGNx3
         cT1Z1sYv7D57g3SjpUPEfnuSP+0S1XwCo/PG5eTGgz+z/xxYEsafpi/VDK9dEgYgQ4C8
         CXwsjavGebeq3gmZ3LtnFT51N+kC49E+/b4P0cXLaomL2WBiyRw+jeSgpaJ84MwDPar/
         b96Q==
X-Gm-Message-State: AOJu0YxbW+wTdkh0QsjHx6VJxW4psy4F8xK9Pgb2WN4hYExUBs5RVZHW
	4QiIDsxEcZDTSGQd17m3789ZXv9RkuY=
X-Google-Smtp-Source: AGHT+IGj1KrzwjF6V/c5fVBJiNGIZf3ig7W5ge6lNsOltt5oL5Mpq+TUWMzMRdHhiilPtwaRNdEmdg==
X-Received: by 2002:a05:6830:7190:b0:6b8:9932:b8ad with SMTP id el16-20020a056830719000b006b89932b8admr21333834otb.1.1698997455037;
        Fri, 03 Nov 2023 00:44:15 -0700 (PDT)
Received: from debian.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id t20-20020aa79394000000b006c0fdc98c89sm861512pfe.85.2023.11.03.00.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Nov 2023 00:44:14 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id B767083A431C; Fri,  3 Nov 2023 14:44:10 +0700 (WIB)
Date: Fri, 3 Nov 2023 14:44:10 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Akira Yokosawa <akiyks@gmail.com>,
	Stanislav Fomichev <sdf@google.com>,
	David Vernet <void@manifault.com>, Miguel Ojeda <ojeda@kernel.org>,
	James Seo <james@equiv.tech>,
	Daniel Vetter <daniel.vetter@ffwll.ch>,
	Federico Vaga <federico.vaga@vaga.pv.it>,
	Carlos Bilbao <carlos.bilbao@amd.com>, linux-spdx@vger.kernel.org,
	Richard Fontana <rfontana@redhat.com>
Subject: Re: [PATCH RFC RESEND 1/4] LICENSES: Add SIL Open Font License 1.1
Message-ID: <ZUSkypGfDccEkKL6@debian.me>
References: <20231102123225.32768-1-bagasdotme@gmail.com>
 <20231102123225.32768-2-bagasdotme@gmail.com>
 <2023110211-absolute-backfire-b6a0@gregkh>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mXzQ05Hs+7vZrDLe"
Content-Disposition: inline
In-Reply-To: <2023110211-absolute-backfire-b6a0@gregkh>


--mXzQ05Hs+7vZrDLe
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 02, 2023 at 03:09:21PM +0100, Greg Kroah-Hartman wrote:
> On Thu, Nov 02, 2023 at 07:32:19PM +0700, Bagas Sanjaya wrote:
> > Add the license text along with appropriate tags for reference and
> > tooling. The text is taken from the text as distributed in Google
> > Fonts's zip files.
> >=20
> > As the license itself may or may note be compatible with GPLv2,
> > let's take on the err side and require combining it with
> > GPL-compatible licenses when using the license.
> >=20
> > Cc: linux-spdx@vger.kernel.org
> > Cc: Richard Fontana <rfontana@redhat.com>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> > ---
> >  LICENSES/dual/OFL-1.1 | 107 ++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 107 insertions(+)
> >  create mode 100644 LICENSES/dual/OFL-1.1
>=20
> Same comment as made before here:
> 	https://lore.kernel.org/all/2023110222-renewed-monologue-008e@gregkh/

Thanks for the pointer to the OG thread!

--=20
An old man doll... just what I always wanted! - Clara

--mXzQ05Hs+7vZrDLe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZUSkxAAKCRD2uYlJVVFO
o4/3AP9cll0+k64GMF2R1FBOVWrpYzG65Q8hYgATNGSeGOnz8gD/Xvd9t3d/Szg+
9pTmX4ohHSK6w29kxoQFZxwzt9EZ2Qo=
=+us9
-----END PGP SIGNATURE-----

--mXzQ05Hs+7vZrDLe--

