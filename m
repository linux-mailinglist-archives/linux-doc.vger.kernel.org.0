Return-Path: <linux-doc+bounces-40010-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDD2A50323
	for <lists+linux-doc@lfdr.de>; Wed,  5 Mar 2025 16:06:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9858E188933D
	for <lists+linux-doc@lfdr.de>; Wed,  5 Mar 2025 15:01:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A579F24EF77;
	Wed,  5 Mar 2025 15:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="R0f2Rv5R"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994EF24EAAE
	for <linux-doc@vger.kernel.org>; Wed,  5 Mar 2025 15:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741186904; cv=none; b=Sp77uQRGmtx5wl7Pr0ewqnujlILnZb2Hr1EapAHKOiVYcxxYIddTa7p2zz8NUwtdhO8ikjBsws5ZBzKxryubCNHAoQ6492JtL7Zkqz/0GFxdsjimAkffGk9iuooHRPLePP9TQZ3Puz+k5Hkfg96h5Gmj4QislmlgsTsqX6zUkpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741186904; c=relaxed/simple;
	bh=lUDN2FTPIBZksZjXeFJs8IYepzlRpej42fM20ZtJ10Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m7vOJZtrka5nNUbc47yfeMjuxc56U4vdooOKuyproBo44cdUmzbZAgD8uIXOXlneyx5gKC6vumDm6wmARR32XD8knpotAA8RdzJ+hbkt6mrAKp72xpJSLUvY8l7p0gUqfYdZeZqYNV3O2S9rt5u1fs8fNM0VDwkb7HAwfsw3JYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=R0f2Rv5R; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4394036c0efso44132395e9.2
        for <linux-doc@vger.kernel.org>; Wed, 05 Mar 2025 07:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741186901; x=1741791701; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lUDN2FTPIBZksZjXeFJs8IYepzlRpej42fM20ZtJ10Y=;
        b=R0f2Rv5Rmqu57EmOcE2UXowXc/PksYag574O8qQ5gfVyF78UFrExUqw/nuaIm0+YiG
         Ic3am0KS3CuJ7FSKhNc8XVN4ec/vsjoTDVe2xQsonEtuAk7VTAUkjJXwjUZAOL3GByrv
         zHveXe9le0sarmSjh9yojKakozUsRyw2zDvNwSwFuOhBLgYylr1YOIYeeCPb3/XmDTdx
         j6WoryV1BcGHkRaBWpxnXrd1RjTZZuhmXMdvCFTbY6GFYke0Y034c8mOSAQJJEHEOEzV
         asvtiOB+tyMZb2Eh6XukDzL9zUv6GJ4RkWLHsL1ogSj3bxbTsnpGvrXDd++SIqYB/rw7
         wObA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741186901; x=1741791701;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lUDN2FTPIBZksZjXeFJs8IYepzlRpej42fM20ZtJ10Y=;
        b=vgjvcwhkNVxJcEcJWgF4EY/Ege04krfiV8GKe5H8wl+G00xno4l8fw/OTygtD+QdKv
         swjrz/wXpsNluEypUMMMc8C1nP8sALMjdvgksTNc6XdEGbjn/UhUy6gKZvd+965U7cEz
         6T976rlnkHD/gnE9OumgswisEeyD8hOSGi1nrE7aVPfGIVU2q11aZ5GMrxtNZrOcMoVy
         6JFmdhgERFGTWwzHFhadQ2JWT6wJBLH2J2L5qZClszgvzC58y8+0FdyMx7xKtYKFwnDY
         dZyjZOmjxL+6IjBrr4foHvIzIMOWrYkOMqSGQk3/2r8ewwinsqyLq6MrTH/WDnzfg8a7
         akKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWffJRW8DiL/oZpuS/AR0MAGwmk1bcQuY9uc5F2RgLJ57YaJlh2JxUW+ZX2z3W1fANBT8r+LGKsRK0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwabBIpFf7DDiekGWFIj9YGs5v4BTvnrGvtUXf/mwBjhbWxfWlL
	1+QKQa0UavTEKF9hOKSMvx3bHoG4E6vG3p6/tvtZFwWhJ5+NtKgGT+dcHMQhhmo=
X-Gm-Gg: ASbGncuKF1WsL9JZRvoFvr/BMX6Fw22L+IW+9hWOPwacsow5cJRRJscu8uo8F3z9lwi
	0rDSxcCvZZnl4ERLMtRaCD0H4o8U0Fuh6eojBZUl6nUGhGTgPPk/YpoXVhctrsHqt5QRKKo6WOk
	KQKDROnt/p6fw6y4V1z4G3C18C/SJHSjwttZf72SPu7PzOPTIBt7rwaI7H0A2/2YMCK+256yrt/
	5dtgnDyx2gbEDQmMUWUw3zCV1WrsJlUPLo6B2QzJrgk96eRQopAfFDdqvxq5kgD2kzFn/5CRute
	MxZt1OfV3OwBHlSKo1IyhAa66GaPD0Pn2i1GgA3Eai6lwHg=
X-Google-Smtp-Source: AGHT+IE5xeV0NUbNuYKzvFOV3AEJUr+EReH4NEBfc38jPX0mdKmdS3ZR7+QmzK4BxhzpwO1278L48A==
X-Received: by 2002:a05:600c:1c26:b0:439:9274:81db with SMTP id 5b1f17b1804b1-43bd292a806mr33898885e9.5.1741186900528;
        Wed, 05 Mar 2025 07:01:40 -0800 (PST)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e484451fsm21658482f8f.63.2025.03.05.07.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 07:01:40 -0800 (PST)
Date: Wed, 5 Mar 2025 16:01:38 +0100
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Christian Brauner <brauner@kernel.org>, Alexander Mikhalitsyn <alexander@mihalicyn.com>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Kees Cook <kees@kernel.org>, 
	"Eric W . Biederman" <ebiederm@xmission.com>, Oleg Nesterov <oleg@redhat.com>
Subject: Re: [PATCH 2/2] pid: Optional first-fit pid allocation
Message-ID: <sk77mxmicnkuikluyi7r7oipn5rzf3v6d5jbhe7qtfvxrlpcgp@44yzmfadjtaa>
References: <20250221170249.890014-1-mkoutny@suse.com>
 <20250221170249.890014-3-mkoutny@suse.com>
 <20250221161854.8ea0dd0b2da05d38574cefc4@linux-foundation.org>
 <20250222090208.2b7aa864@pumpkin>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="n4qsuijfubozppny"
Content-Disposition: inline
In-Reply-To: <20250222090208.2b7aa864@pumpkin>


--n4qsuijfubozppny
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 2/2] pid: Optional first-fit pid allocation
MIME-Version: 1.0

On Sat, Feb 22, 2025 at 09:02:08AM +0000, David Laight <david.laight.linux@gmail.com> wrote:
> It also seems a good way of being able to predict the next pid and
> doing all the 'nasty' things that allows because there is no guard
> time on pid reuse.

The motivations was not to make guessing next pid more difficult, I'll
update the docs with better explanation.

> Both first-fit and next-fit have the same issue.
> Picking a random pid is better.

I surely don't want to delve into this now. (I acknowledge that having a
possible range specified per pid ns would be useful for such a
randomization.)

Michal

--n4qsuijfubozppny
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd6mfF2PbEZnpdoAkt3Wney77BSQUCZ8hnUAAKCRAt3Wney77B
SatLAQCLUp9Io5Ukm//Nmg5Fi6bNTNJ9OOvj3Vz0RpfBn1XDDwD/ZLoJh3aJ008u
HVxHLGdnDtj801p48rWW+9FitrsiyAA=
=A1Hk
-----END PGP SIGNATURE-----

--n4qsuijfubozppny--

