Return-Path: <linux-doc+bounces-47699-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 78025AC6EB7
	for <lists+linux-doc@lfdr.de>; Wed, 28 May 2025 19:05:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A0CD1C00779
	for <lists+linux-doc@lfdr.de>; Wed, 28 May 2025 17:05:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4903728DF21;
	Wed, 28 May 2025 17:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="HtFP108E"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07C228E568
	for <linux-doc@vger.kernel.org>; Wed, 28 May 2025 17:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748451913; cv=none; b=TVobLcUqaWX5KkPeGr3Kn7IUpfV9+EGxhOvicfu6sw6Z2hKBbu3CgHDarkRk0V44+BNLERPysQD+1RSHKfczClEjtdJ0chVZPDzY9imqcCg1+jzMtWewQx0+/f1FjzkWfAFazaamKLsYbvqdSL7W0kUZMLfE34T+IlUKqVXx54U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748451913; c=relaxed/simple;
	bh=6QPXsF522lgAxGDMLzu85PkLdcBq5bWzb2eRzcztNo4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hoRqRB/ratVhymGnEv/a4fZ3ZIFP9Sb4YjMVJK8IrjO7cBoeKGf9re+YhxDOUPezr+qgh0EN/JSQSkfiLMnj4CORwdA0B1B+3gbxwL5j9iWuHoux6rEw6jtbwBYX/tyWKNR2I7SNgE7Y9B12qUFqPxs0+5ZgFbtBiRZGB+PzrQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=HtFP108E; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso650835e9.3
        for <linux-doc@vger.kernel.org>; Wed, 28 May 2025 10:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748451909; x=1749056709; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6QPXsF522lgAxGDMLzu85PkLdcBq5bWzb2eRzcztNo4=;
        b=HtFP108Eku7ykVISiHo24iy4v79x1Nmkzdi5HTD9J07Yxk4OqphVkCZF1FChWPP4SC
         U4rGBOURSgKfSf3wDTY1oBptVuLttbkF45XP9XNBqjV2k6js4fmvVN1so4QWk6shIZdq
         1onVisdMD1qU4YanSqlgs8MgW6nHQAwmh3hVhElInr6Eunt5VmzwOoYY1cziQjCS7ewZ
         hkm4pdwpIEl1iLd8DbXnvepK88bVSuHRzM6l6b05i/UcdNnNNkoybOVJUImLHYfZEq1E
         YYTU6c0bkNoI3MCRxcphmYoU752jJ9I+yEBdUip86YCYiK23a5FG/bpqCoROXpFh/AMq
         n0kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748451909; x=1749056709;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6QPXsF522lgAxGDMLzu85PkLdcBq5bWzb2eRzcztNo4=;
        b=jDIJpY7cTYvgnRajYj7m/Y76l2ei7G50E1yX0uCjDjfMfwoxCW5lM7gbb6WCFvQwxO
         rZ899gCyDuyWxpPlb5NTWH5yqQNnSsvhlsIqFkAhnJFzpHJWCsLkPbOP9rjlAiE8dwLQ
         /zFJuZa1iheiIxzVPZMyjxcOY8clwVL/7/q3nC7A+tcex/6+GWElGZNA29MSnumtf2Lm
         3ncrOHswdBGi1cBPkerIJ/6kqBqz7Lbb2a9/8KZ/NemVlB4S19Hfu9teEGRRDmomiVAi
         qDbS2iaPs+Dyc1ohDb0fZ535UGShqxcKMchs1aIxn28cU96tq1Zqd5ZnSMDs8NtJNhKH
         ESBw==
X-Forwarded-Encrypted: i=1; AJvYcCVc88bQUJnfuhKkSBrTN5Aki/k/3MVL5XqFOqPTY4QiOJTYrj5Z/7ZmNtO/CBjW77J5BwLCWE8EDpw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz327ri6OPlnUPB9LkmTLVsIbKtK8TOuFel0Z68FPMJnJxbaVK0
	iAzyMHxMNm3dBJ0FU/tajamaYH6GGV/XmCrf4ysL7cyLy1NZ2eB4gUV9zgXIHqfqPFM=
X-Gm-Gg: ASbGncv/yXvIqMzDKc8KZKUFQYKN5jYQLZ+j9G5wWG25g6OkoT+1sHd3g+UGwMrgwfX
	Min0WQ3w7E1lY9XkqKBFtjKcP8SSKS3epyFDBuy2V9G8bwURqozSU5HiFSzLcgE9fcV4GhpUjok
	M1NuhRtUSQZ0xAyDqKQJucv5smsabg5L1SlEXJXCuKqBzUy/mYY9pKuf+/IHbQad1fdSzrK2+vY
	d9+iL0UKMjt72hrbAeo3+m8OXmabZbkQA8cx00Usrs/9NewtkeXcvEXYwNumRxX00j59Pb8rgWZ
	RxRDJDkjQKrc+vS39x+hiL2/OueKNf/U914MZOZfDRinAwLG8Voqqw==
X-Google-Smtp-Source: AGHT+IGTf3pKK/IgQTggD4z8Aqvs1zWP1VXkcJHKOx61SlzPEwmvUNnUqlL2LM+xk+/b5ozR0cqjyQ==
X-Received: by 2002:a05:600c:64c6:b0:442:ffa6:d07e with SMTP id 5b1f17b1804b1-44c9141d996mr138953735e9.1.1748451909006;
        Wed, 28 May 2025 10:05:09 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4509a0452f4sm22875565e9.28.2025.05.28.10.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 10:05:08 -0700 (PDT)
Date: Wed, 28 May 2025 19:05:06 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Vishal Chourasia <vishalc@linux.ibm.com>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Jonathan Corbet <corbet@lwn.net>, cgroups@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: cgroup: clarify controller enabling
 semantics
Message-ID: <bdstku24kbgj2oalpbzw62uohq7centgaz7fbeatnuymjr2qct@gp2vah7mumk3>
References: <20250527085335.256045-2-vishalc@linux.ibm.com>
 <vzdrzqphpjnvrfynx7ajdrgfraavebig4edipde3kulxp2euqh@7p32zx7ql6k6>
 <aDcNLTA2JfoLXdIM@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="34l27iq75neltcmg"
Content-Disposition: inline
In-Reply-To: <aDcNLTA2JfoLXdIM@linux.ibm.com>


--34l27iq75neltcmg
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] Documentation: cgroup: clarify controller enabling
 semantics
MIME-Version: 1.0

On Wed, May 28, 2025 at 06:48:37PM +0530, Vishal Chourasia <vishalc@linux.i=
bm.com> wrote:
> The part that was confused me, was the meaning behind controller being
> available vs. enabled in a cgroup.
>=20
> Though, the documentation does mention what it means for a controller to
> be enabled in a cgroup later in the text. But at the point of the
> change it is unclear.

There's a picture [1] that may be more descriptive than the docs (on
which it is based).

HTH,
Michal

[1] https://paste.opensuse.org/pastes/987b665209bb

--34l27iq75neltcmg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd6mfF2PbEZnpdoAkt3Wney77BSQUCaDdCQAAKCRAt3Wney77B
SYoAAQDnwGxoiky6TLy1ry5zramOQWjqDHvRW6KNvKnoq64TugEAoDpAv+172mcu
qb6EoX3kd+ZHuNpYgTAgOV5HOv1WbA4=
=NwFj
-----END PGP SIGNATURE-----

--34l27iq75neltcmg--

