Return-Path: <linux-doc+bounces-1683-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A4B7DFFBE
	for <lists+linux-doc@lfdr.de>; Fri,  3 Nov 2023 09:29:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C4146B21326
	for <lists+linux-doc@lfdr.de>; Fri,  3 Nov 2023 08:29:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A8E98473;
	Fri,  3 Nov 2023 08:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XEUH4Q4/"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30787847B
	for <linux-doc@vger.kernel.org>; Fri,  3 Nov 2023 08:29:41 +0000 (UTC)
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10EC7D42;
	Fri,  3 Nov 2023 01:29:36 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1cc0d0a0355so14872905ad.3;
        Fri, 03 Nov 2023 01:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699000175; x=1699604975; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rTlctj8hnqNzhCMN/+l01lQ+Uns5l1/j387sOUjthe0=;
        b=XEUH4Q4/p9C1GlsHiLH+YEBPQIbnDLEZrtiVM68inksIZvBhBRC/Q5WtWRHptur9QK
         EwVx/nd5mKH66bTfY3ZWrh8JB3VGHJ2dsgKVoKePlTOHS1XLBuoxcXY+PAsl6dkLuOB7
         HceSuLNh031bdlsvjlG3I6T4gSV/ex9mQFE50n3GW/zMPVVJwjACtcyT3ao7LjXw9K9t
         F700PaWKjrLZBysxtmjvpt7jdMukeAZmuJ94PYg9g2CJN/YShEBju2ibNgVe2VM8t+RD
         Nw7vykWkIrsGOKikkFQXGDV6OAZ4bw3kjAiiwHBNVCYh59je200cjpCWUPAo8Rs0Kvl7
         1o1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699000175; x=1699604975;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rTlctj8hnqNzhCMN/+l01lQ+Uns5l1/j387sOUjthe0=;
        b=rnLuRUK7M3jfrmjpdPtniYJeEuWXzXN11KSqqguShRaX2X/yt72prY9aQp1pu/Lxqb
         PFlFzRmCsK7Fto9KP5+A4svcAJnvqC+/q9VpaQOxYVDXdxvNpVOy+ccSUGJYIQZI/nLm
         FGN6YZMHFc+1KE503jr6tD6vn+6et4HVgxinHnXLOJWS7GQJkTDkcnqwgH78PkRQpEKA
         1JGaoM975DlD/vd8FqZpA9unMbUq97/6jf5tyAAE29pT51+pKmj8ibDGL4s5ritsRNz0
         sH+2dn8aUTmGpG4Jio2rH4gKTojkmBogd38cCx7Ra/5l6dR35h6VEX5xU9Ht9W7J4a2V
         6OXQ==
X-Gm-Message-State: AOJu0YyZ/IdfLOo3i5llkiQB6HNrLTz2mPSvprZCDyF3Kq7pyyI+HZBz
	X1vuE9VbTGzfwTyRVUVpo1E=
X-Google-Smtp-Source: AGHT+IGC6Bo8fPehYZXxcFAuJeXflkdKtLj9x94EL042EHE5PQHVhBM4mee8VnRRhKQMBFkZZWP5HQ==
X-Received: by 2002:a17:902:c78c:b0:1c9:d8b6:e7ad with SMTP id w12-20020a170902c78c00b001c9d8b6e7admr16745633pla.56.1699000175482;
        Fri, 03 Nov 2023 01:29:35 -0700 (PDT)
Received: from debian.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id ix20-20020a170902f81400b001c75d7f2597sm902888plb.141.2023.11.03.01.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Nov 2023 01:29:34 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id BBC6091D73FF; Fri,  3 Nov 2023 15:29:32 +0700 (WIB)
Date: Fri, 3 Nov 2023 15:29:32 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Akira Yokosawa <akiyks@gmail.com>,
	Stanislav Fomichev <sdf@google.com>,
	David Vernet <void@manifault.com>, Miguel Ojeda <ojeda@kernel.org>,
	James Seo <james@equiv.tech>,
	Daniel Vetter <daniel.vetter@ffwll.ch>,
	Federico Vaga <federico.vaga@vaga.pv.it>,
	Carlos Bilbao <carlos.bilbao@amd.com>
Subject: Re: [PATCH RFC RESEND 0/4] Documentation: Web fonts for kernel
 documentation
Message-ID: <ZUSvbCVCC25vMyNH@debian.me>
References: <20231102123225.32768-1-bagasdotme@gmail.com>
 <874ji48658.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="I1jQczm8fw5Fu96M"
Content-Disposition: inline
In-Reply-To: <874ji48658.fsf@meer.lwn.net>


--I1jQczm8fw5Fu96M
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 02, 2023 at 10:35:47AM -0600, Jonathan Corbet wrote:
> So my immediate response to this is pretty uniformly negative.
>=20
> - If you don't like serif, tweaking conf.py is easy enough without
>   pushing it on everybody else.

As local commit of course.

>=20
> - I'm not thrilled about adding a bunch of binary font data to the
>   kernel, and suspect a lot of people would not feel that the bloat is
>   worth it.

MediaWiki project takes the same stance regarding web fonts:

> What about using webfonts?
>
> Webfonts is a system to deliver a font to users who do not have it instal=
led.
> This involves having a user's browser download a font we provide, which c=
auses
> additional resources to load and would have a negative impact on site
> performance (i.e. how fast pages load). This is particularly true for old=
er
> browsers. In the future we may explore using webfonts, but for now this u=
pdate
> provides greater readability and consistency while not degrading page load
> times.

Indeed, it's possible to achieve the same effect without resorting to web
fonts (as MediaWiki did), see [1].

>=20
> - The licensing of the fonts is not fully free.

That was being discussed on the original RFC thread.

>=20
> There's so much we can do to improve our documentation and access to it;
> messing around with web fonts seems - to me, at least - pretty low on
> the list.
>=20
> I suppose I can ask people at the kernel summit session in a couple
> weeks to see if others feel differently.

OK, I want to hear about their opinion.

Thanks.

[1]: https://www.mediawiki.org/wiki/Typography_refresh

--=20
An old man doll... just what I always wanted! - Clara

--I1jQczm8fw5Fu96M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZUSvbAAKCRD2uYlJVVFO
o+UHAQCt9yzSppTguWjvALTOz9ee0uHu5vMdzTTRmA8X+gPlJAEAsUjhBKMibYVc
oRCK/CmbYw1pojwttDiRNoFrDXjvwww=
=ahSS
-----END PGP SIGNATURE-----

--I1jQczm8fw5Fu96M--

