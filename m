Return-Path: <linux-doc+bounces-77905-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CO+lMHK+qGmXwwAAu9opvQ
	(envelope-from <linux-doc+bounces-77905-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 05 Mar 2026 00:21:22 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CDA208F0C
	for <lists+linux-doc@lfdr.de>; Thu, 05 Mar 2026 00:21:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 988553026306
	for <lists+linux-doc@lfdr.de>; Wed,  4 Mar 2026 23:21:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF8FB364E91;
	Wed,  4 Mar 2026 23:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mngYpzQt"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C4236167C
	for <linux-doc@vger.kernel.org>; Wed,  4 Mar 2026 23:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772666478; cv=none; b=HuuoO7OMOYSVX10KuqGSVD8JdB3LddewM4xO3G3M5CBI9m1uFJOBbI3WpsQifFBFyvcaJWcTx90K+OMBxyvx5uegVf1nl1WckRNeMjyLpYFHV9ZxigrCDBsQS+z4S8pIjDw6YY64IFKzj9xawl9QQgdQL6KZw0r7BpF0Qsa36dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772666478; c=relaxed/simple;
	bh=g+h7yoTYJAJLd1YpGS7KB0fkDtfQ21kQJZKi2fGASKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qf7bVbav2pHbLnj0bBRPvfu88n+CT4skUQrPF4h85pUVXNWEIFySp/UdEhGC444h1zC1vP5kms/ISdcoGdwJ4rrH0yhvwAlJr6FKJGGi+Cm8pdt4K8MvJgG01eZsScG+qKew9XyHLG/PHnamUPBlF9voci6oT9bqey4Ofcp7wyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mngYpzQt; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8297e0b27e5so380530b3a.1
        for <linux-doc@vger.kernel.org>; Wed, 04 Mar 2026 15:21:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772666477; x=1773271277; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=g+h7yoTYJAJLd1YpGS7KB0fkDtfQ21kQJZKi2fGASKg=;
        b=mngYpzQthke9BlCsTmhhmhE6YZUVLvrWGiATmAnJJfjvA8zagVDTNdQ8zGcYYJOTQf
         a2S15TMcv9cjGGgrD/3I/t7S9MOcUMyZGcVTvMDtTzaO2iB5AfJG6abNGMsKJaWU5jcO
         ERvusttJOW82II1oWJKW/YuOHl/BSSj+dEcCaLZJd4KZn//cawjk2lmFNo/mfOaTXtUm
         eobMnETCtyVXsqOS8N3SY46ZzkM2TOHMoS/lrmFhwsHG2W42QfcKurtAfDf3WrEJqqK1
         t3fbjlPw7pVyBDFSUsnB+vSATImh6Rb/Oil09aR/MUe/YHIW0qEn1tZlONCjSBobaJ3m
         TeIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772666477; x=1773271277;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g+h7yoTYJAJLd1YpGS7KB0fkDtfQ21kQJZKi2fGASKg=;
        b=c4kRUyE224dlz7nu0CCcZKjUHSGIZs9S3RSPRPXUrcSKcVAy2tENQjw1A0VaOqRTTK
         N3mf0UKBYOHp4YLBxYUGijpVf/H+Izivwv6FLeRBenqr2GSu6JCxDq36kRhyZroA1hil
         SkcS0jtek6ME5Ub5QDz1HkC3fXeQBnteAoW8uCJ4jMEyXezauvEiO4m4J3x+WDCTkuS7
         5DNULmBPhvIHw3lQfjgGuBmrdvB+LPVxmbR2HiAdY6HJwfTWTVOkvulVmZJ0MFCG2Gqo
         ci3U8yMy7TtW0o/efoaXC/t77TJ3KypKGzI4ZmlkYlo3q4tT+O12at2Y3P4PZiNA3kRq
         Vv0A==
X-Forwarded-Encrypted: i=1; AJvYcCWfwB3Nt3jaQ3bN0CXiK7rr/GnJmfIOREC3Ppq12L6vM+dYNekz1U+UP9Es3vDtpMGbW0LY3bKuscc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7hsJk4ssxGf2GIAnRAwgo95PuZlPMhRbCt+gMCedxKokZ3qfW
	EchGkZyjD6Ijmgz4PT+T6EzfWh8ZkALwhKMgIjskPJFzfbh9bal6cJqs
X-Gm-Gg: ATEYQzxAySYrMLZj8FT5kPH2RENKVaOZ/OW93WKNDYi+VwpNbC3VzWfjVzaGRxhmg77
	DO0TU7+HzUZCeQ6BGM1srEJzdZjPjOsaIhuSZsIupICDKK63L1Pi00ZiLflopIEfwINLfmpRVac
	KCeHA2+J+XcmF+mlOxyfCjHmisNbueCXvEGoXkI0ibzC8fuZa1jzKNC5KG/BWjmpVoiv+joNy6+
	Zp+xshLYFVv+1Jg/CS9E/qdYgmQnu1U/1x5UQq2zvQoM8sypQVbQnzWhhUibcIfxFjFPkPbhQ1e
	BB703EyqmGGC+Ol7+Ry1eAwwrOBgpWBHfiUjyL7JxiZasV+AmG11yG+lKfapNmZb0iarNQVDkK+
	09rX2qsxk0wwNeYV/ud/ZyuHrr3QoWisRcxXQv/1KlZv+/KIniZQ6YmYWVk2t9w6SZ4O73IuTIP
	MgZMrw2cl3HWBwbMXn0tQ=
X-Received: by 2002:a05:6a00:950a:b0:81f:4cf5:f252 with SMTP id d2e1a72fcca58-82972bcf9f9mr3169987b3a.24.1772666476941;
        Wed, 04 Mar 2026 15:21:16 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8297faf677bsm776704b3a.60.2026.03.04.15.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 15:21:14 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id EE69541E88FA; Thu, 05 Mar 2026 06:21:10 +0700 (WIB)
Date: Thu, 5 Mar 2026 06:21:10 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: Re: [REGRESSION BISECTED] Unexpected section title false positive
 warnings on DOC: directive
Message-ID: <aai-Zingex2zOvQZ@archie.me>
References: <aZu9muHK02vPPl8E@archie.me>
 <3e1d90fc-b35f-4785-8263-fd7427c4455a@leemhuis.info>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="f7YVX34Y0PT+R42a"
Content-Disposition: inline
In-Reply-To: <3e1d90fc-b35f-4785-8263-fd7427c4455a@leemhuis.info>
X-Rspamd-Queue-Id: 71CDA208F0C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-77905-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bagasdotme@gmail.com,linux-doc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-doc,huawei];
	RCPT_COUNT_SEVEN(0.00)[7];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,archie.me:mid]
X-Rspamd-Action: no action


--f7YVX34Y0PT+R42a
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 04, 2026 at 04:31:33PM +0100, Thorsten Leemhuis wrote:
> On 2/23/26 03:38, Bagas Sanjaya wrote:
> > [this is actually a repost of [1] since that thread didn't get any atte=
ntion
> > from the regressor.]
>=20
> "Regressor" feels like a odd word choice here (one that according to
> lore nobody has used before). Makes way more sense (and at least to me
> feels more polite) to say something like "the culprit's author (Mauro)"
> =E2=80=93 especially as the person might have forgotten already that they
> authored the change in questions.

I was using bugzilla lingo, though.

>=20
> > Building htmldocs on docs-next currenly produces about 80 new warnings;=
 which
> > all of them are unexpected section title on DOC: kernel-doc directive, =
like:
>=20
> For now it looks like your the only one to see that problem, so maybe
> it's something that is odd on your systems; and given that these are
> warnings I'm included to stop tracking this as a regression.

OK, thanks!

--=20
An old man doll... just what I always wanted! - Clara

--f7YVX34Y0PT+R42a
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaai+XwAKCRD2uYlJVVFO
o2QTAP9jsBY9TAAxQIiBYay4I4iVNg2nRHdKhXsKUqH1GPyycgD/QEjvKI8HT3TR
0JXvx7gDuFyh2MKWqJ/9rPOwV2uWZgY=
=Tawq
-----END PGP SIGNATURE-----

--f7YVX34Y0PT+R42a--

