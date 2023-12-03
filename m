Return-Path: <linux-doc+bounces-3865-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D410180212D
	for <lists+linux-doc@lfdr.de>; Sun,  3 Dec 2023 07:05:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A9751C20821
	for <lists+linux-doc@lfdr.de>; Sun,  3 Dec 2023 06:05:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A52D10FF;
	Sun,  3 Dec 2023 06:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cb5gtGMV"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08EF4107;
	Sat,  2 Dec 2023 22:04:59 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1d075392ff6so6194565ad.1;
        Sat, 02 Dec 2023 22:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701583498; x=1702188298; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nVXjD/L9/cbkwMY3wbB+hh1LGOMERcZLOKnsHF24pTg=;
        b=Cb5gtGMVxk+8TCCOQTWwbOq7G6hWcoCoM41P4GdnvAReblLtlJth3igGQJrhUSo43a
         4ew6K/5sApYhf7luoeeksv6yMnkzh4mcGT5UbHOZ5qiY/veuySK+VoxgX243IBML0tmQ
         xwPqQ629SYbRT/KaiJ64CW8M4Q7QxnvpU1QO4k6Atn+nPbOw99SEMhsgRYj+CXP1QAp9
         b9phUbSvu2lxqvDY+Al3PoXRdrWGyOEsRrhBubiQqOYsZW/EAfFKPoLtkaUcwK+6aqBU
         gzGVxq/gRKMbWLFXkFh+wLZD11PNivj/EDtBnA5yfWKYU8u7pcjvdQGXRiNrTt/vOJRl
         E0+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701583498; x=1702188298;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nVXjD/L9/cbkwMY3wbB+hh1LGOMERcZLOKnsHF24pTg=;
        b=AM23+Xc3WpL+sfLTZpFqxWCE2h6HczX8Y3rGMAbTXzm1PQW3G+UdkX/e7eSCXBsOAr
         nYryl2GNDDMHw7TRqTctv09j9FDkwCev7qVnE8zzVu1EkY8fWMQy1/bhxYJgBI/kcVWf
         62TIP+mqztO/cNpJ1+WpqhzY8rzYKWrAZHtDApdjMJy/r9TmznLfg0iCRHG5BmF+egvN
         aJyEbMmz1GzLxpX2V2xH2mtyw5m7+iMcCqI18ROdfHWkYFM3gI2kq4xDJ4+1WTHQkPnQ
         Kv2Cw6zBTQqTzQrYbyJPMyUPSvSsdTCb/5p1MXm+KRf3e1XXLSSdlOlXiSAPqj2/T2nE
         c8iA==
X-Gm-Message-State: AOJu0YyqDHFc327iixVG5uVgDsFm8WCY7Zie+XIwAuIYofOakNMdQ0SY
	FPB+HzFRwcNX+qa+k6Cbqa12Vfi9Y5wjhg==
X-Google-Smtp-Source: AGHT+IHFrkj5B2svdEzIFIBX7O9ZktHdg5OzqYIA+mN9yeCRen+kK9pdRJeir+OSL+xiNKQfbfE3ZA==
X-Received: by 2002:a17:902:e892:b0:1d0:700b:3f69 with SMTP id w18-20020a170902e89200b001d0700b3f69mr2491101plg.35.1701583498291;
        Sat, 02 Dec 2023 22:04:58 -0800 (PST)
Received: from archie.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id q1-20020a17090311c100b001cfc9c926b7sm2487339plh.75.2023.12.02.22.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Dec 2023 22:04:57 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id E6E851033EDEB; Sun,  3 Dec 2023 13:04:53 +0700 (WIB)
Date: Sun, 3 Dec 2023 13:04:53 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] docs: nvmem: generate kernel-doc API documentation
Message-ID: <ZWwahc1PSY6Uj6_J@archie.me>
References: <20231201-nvmem-docs-kerneldoc-v1-0-3e8f2b706ce6@bootlin.com>
 <20231201-nvmem-docs-kerneldoc-v1-1-3e8f2b706ce6@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uCTGfMDxg/6CCkGF"
Content-Disposition: inline
In-Reply-To: <20231201-nvmem-docs-kerneldoc-v1-1-3e8f2b706ce6@bootlin.com>


--uCTGfMDxg/6CCkGF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 01, 2023 at 02:10:42PM +0100, Luca Ceresoli wrote:
> This is useful on its own, and it also enables hyperlink generation for
> functions mentioned in ReST documentation.
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  Documentation/driver-api/nvmem.rst | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/Documentation/driver-api/nvmem.rst b/Documentation/driver-ap=
i/nvmem.rst
> index de221e91c8e3..d5655b95c0f4 100644
> --- a/Documentation/driver-api/nvmem.rst
> +++ b/Documentation/driver-api/nvmem.rst
> @@ -200,3 +200,9 @@ and let you add cells dynamically.
>  Another use case for layouts is the post processing of cells. With layou=
ts,
>  it is possible to associate a custom post processing hook to a cell. It
>  even possible to add this hook to cells not created by the layout itself.
> +
> +9. Internal kernel API
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +.. kernel-doc:: drivers/nvmem/core.c
> +   :export:
>=20

LGTM, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--uCTGfMDxg/6CCkGF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZWwaggAKCRD2uYlJVVFO
o9c5AP4jnH8NopKOR8cw3bjDvuA5mR1FVyJBkvglnpeDdknxtQEAwacGaItumATx
+A9i7rvGsdhEO/dbT3H1W2LzWrP41g4=
=qIT7
-----END PGP SIGNATURE-----

--uCTGfMDxg/6CCkGF--

