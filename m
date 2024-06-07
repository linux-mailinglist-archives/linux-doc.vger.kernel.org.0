Return-Path: <linux-doc+bounces-18008-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D83C900D6D
	for <lists+linux-doc@lfdr.de>; Fri,  7 Jun 2024 23:20:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E12CA1F22CEE
	for <lists+linux-doc@lfdr.de>; Fri,  7 Jun 2024 21:20:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D755715532B;
	Fri,  7 Jun 2024 21:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="QlLlAFEI"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2789114F9E9
	for <linux-doc@vger.kernel.org>; Fri,  7 Jun 2024 21:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717795213; cv=none; b=nKr74TWOzBt751YYBplrb/3iZJ+4qwtFNpS4Y0b6knhKtBCR2C3nweUYVtQHxnxvkx3vn8lorqnwWNVvWylzh+vvmVfT82YxEchHC7UNOJ9pes7fecABhS7WGPbZBBsXau8AL6UXSgI39H3EbsmOkQ+nq2IVCg66QVaxD4cSPhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717795213; c=relaxed/simple;
	bh=Jiu3xAbeO4nEFEt+N6Nvptef1YE/pXXPdfDj3I+OOuc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TQItv8pmywoGxU/OQj2wvhA+q1GeWZIoI3eWZKP+Yo+1yuPDTiQUmxR2vsOvKKmCkdC0THmECOyrXsx7z5ahtvlZ6KuFFQfZWyV5ocraiTbuIh+0KYaIh+yShQy7dEjEWfbDd8NjQ/nSgV3/qHK9p0ZadF/b++oODt80aGlNGJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=QlLlAFEI; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Jiu3
	xAbeO4nEFEt+N6Nvptef1YE/pXXPdfDj3I+OOuc=; b=QlLlAFEIRKrGI7zg0yaw
	zrUOccMiburdjHRH+MZpiAdoFTguqiKZR/AbvDt4CAcz4SY8I14gTLmLZWZSdZ2M
	WCkerrALnVa7BZ+66ukhx9HyfpAjHWOYA5fZPNHLOQDrvRbgG1W9ZZ05Iz79HeDK
	fDPNUKc9spatzQxVuvK/8yne4Jd0aI7tKWEWAK3xeWhQvSiQ8+Pok2y8EfEBWJPy
	zoh/T8Gw/Fyw42OMNTdzCPxS2tlB/WXM7Js/Zh0XjVZ65JrXcRmcoZ9gOLyQT/IY
	HMsLj64issGJHSLJnY4X2avxaIEPWLJCiYHffL41qVHQDMRUXTOF/oOQ7y7/2KHP
	Pw==
Received: (qmail 3445681 invoked from network); 7 Jun 2024 23:20:06 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Jun 2024 23:20:06 +0200
X-UD-Smtp-Session: l3s3148p1@x2wOXVMaxttehhrL
Date: Fri, 7 Jun 2024 23:20:05 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: linux-i2c@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] docs: i2c: summary: document use of inclusive
 language
Message-ID: <56qtono23q4couvjk4rdovqliujkcxjnvo7xrsgb3iturplmrw@o7jjxfklfr4c>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Easwar Hariharan <eahariha@linux.microsoft.com>, linux-i2c@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240607111726.12678-1-wsa+renesas@sang-engineering.com>
 <20240607111726.12678-5-wsa+renesas@sang-engineering.com>
 <dcd7adf8-bcb6-483b-859b-06e7b2831e23@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2pekpatlprr4tko4"
Content-Disposition: inline
In-Reply-To: <dcd7adf8-bcb6-483b-859b-06e7b2831e23@linux.microsoft.com>


--2pekpatlprr4tko4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > +A **target** chip is a node that responds to communications when addre=
ssed
> > +by the controller. In Linux it is called a **client**. Client drivers =
are kept
>=20
> Are we continuing to use client instead of local target and remote target?

Nope, "client" is just the Linux word for "target". Like "adapter" for
"controller". Historic legacy. So, in a way "local client" and "remote
client" would also work to emphasize the distinction.

This document so far only talks about "remote targets". I noticed this a
few hours ago and concluded that another paragraph needs to be added
explaining that Linux can be a target as well. And that this is called a
"local target" while the other ones are "remote targets".

Makes sense?


--2pekpatlprr4tko4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZjeYEACgkQFA3kzBSg
KbaPyw/7BisRsp9Zc7xEKDZRnF73eXTKc8ORJ0iIcRVRt6j1SA2RjCc6oSQ5tLr/
TL3xOpKql6o7DOmTvDJu+KhUgEqiYf4VHdccWcsHysNRpk2UgpUGMx63gZ06iKDI
AdjFrHCkqnNdeaZnYJ2Oht/VSM7ucybsgicQ8KcrlEx7WE6xfzo46qOvXZE8rGvW
SkgB5sRawdk3Ux2OmP2jbcR0KwgINqlN/nHK9tIX1yANsm704XTWs584ggzMVMYp
mYvgvtYc2KcC75Iom8bZVAjXjFdm5SlF+W86TvI+XSNRBnVn0hS6z+cothsBePxc
s1u4fjPPNe2hSHL3wrX5Memq1r+IYS5RTBgGEUn4HL8BCQgLTYhfQTWFAh23sGPK
aZXVOHid0fWEBpomP7PUAclUyWUG84n+r4+pu5PY/yDmj0jTqQxmuXezXlKW2ocm
9CjmlgjSRUqakjamtWF+7IONskStuCdEhcCQSqPjHEGCS9l4ctngySdbXJO457ZE
S0rMrPsEljEro2qYMmELN2A0wy9uu8gjCk7AcBOjbD5sEwXgAIArIDo2g7ZeYbhu
upJL8eZktfgbz3l3FdoiyPYaKGNU0h4IcKty7fU/w291Swq0tHwu1Bv9pwFkptYd
4kcKKaTbc4TMQqS/Le0VQ5MeQ90rHnlRyjJiNG3QNrb2a46aKCw=
=Ql+c
-----END PGP SIGNATURE-----

--2pekpatlprr4tko4--

