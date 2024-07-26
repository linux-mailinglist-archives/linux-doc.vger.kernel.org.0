Return-Path: <linux-doc+bounces-21383-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CA42F93CF72
	for <lists+linux-doc@lfdr.de>; Fri, 26 Jul 2024 10:19:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 726EA1F2129D
	for <lists+linux-doc@lfdr.de>; Fri, 26 Jul 2024 08:19:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61B84176FB2;
	Fri, 26 Jul 2024 08:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="TM4i/mnD"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644F1176FA3
	for <linux-doc@vger.kernel.org>; Fri, 26 Jul 2024 08:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721981951; cv=none; b=sV7rJX2bSmx9MEivl0D8N7dDjtoQEGM1nS+nchTFKfztWdCOlynSO3hKSdJQNYNiX3ys366eieWAZaiJrFdYj5OB7WTAN1An3znZh9RF0pNacHWGQaqEIqlMl52sss7aq11I/r9g/4cYr+D0q0O1qpH6NkPUUfVjyY4WM6cepHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721981951; c=relaxed/simple;
	bh=cx+01TCbO6DpaC7tHPkUFYEU6Li5+7QekGE9g6IIqA0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TVgphc9B3v/wcgt+wbbxIjgEJsgSyHqFCa53AglkN6lid1PcMJkBM5QaFTp0M06f/Emyasro3VTAEoJZqHHZmag6TZRUgbaBeLe4BnbJLR7H0HCAt98OHAvrANNnnDAeFPLHrZIvvq02gUtC5G6NtCreYGrW+T5DGqqwRjkTEd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=TM4i/mnD; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a7a91cdcc78so79967766b.3
        for <linux-doc@vger.kernel.org>; Fri, 26 Jul 2024 01:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721981948; x=1722586748; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1nxDdDPuqoZhhkQdgxi6lLL82Z/S+1HfGQKwxEW2Xr4=;
        b=TM4i/mnDYtKQL7xhLSs7LMUrBSea7QQJmkeJeK5KEHxkPhzYOA1rGqYiX6Uv7SCL7z
         U0zHIWXFCIGYxY95ua/eIIjfJHlk9gpXfu3g+rXpJ+JZ4z31rWpRWBReETjD/0Zzc0Iu
         7tR2Fv4qL38ujKfpLZMinDbFFaSmkgedgpJNnMf2x/HhwvDXGrWXC8bRAgEzSZ6AMDo7
         PuZDaS+Z8C8306yv50ebFhaNKR6kQ9+C4P/2VLQgX/DZvAHwo2ulJ9Cx4pKhl8OEIFqj
         OWrh7LFimO4ZRu7xe9IeqpHRC/Pl4ipCZSdG4F3K2Jyns3um3ceQ7ySzVDOfshAOgmEf
         qh1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721981948; x=1722586748;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1nxDdDPuqoZhhkQdgxi6lLL82Z/S+1HfGQKwxEW2Xr4=;
        b=bHyEghyxYwQFVzZOln3D3LwMucbBIjSaGOOEnThZKZz2uDDEey2J9NFitG9Wr9MNGS
         qiFng4TlnkHYoRleK8frk+p+R9Xt93qgCmvSpyg51QgHbvn9LLChNQEcXte0H0NWhn4g
         0j9VlDUY+eh7cDdFWQfDitAqhN8JEmA7I+zLGAdq3FvWCEG+Iqp71iMubplTiLnyPghm
         HDl/M92dCEyr5k6Le0K19fh1i2doV63EqllFG7IT2w2RALb4Xu1Viagj5A+uVzU4mYoi
         uhf+85Cnm9fT9v8wo8Dx312eTdxnFHpyokrTPzqLdmZLjzkHS5QsaUJC3Tto63rT2SAk
         laiA==
X-Forwarded-Encrypted: i=1; AJvYcCXwAkYiOupVRmLBCJ/aMseiAQ9J1Md749Qht2EI9Y2SMMgtXpF5FMHOBnvyFhLuxtc5fAj+Eu6a+aY8zKZiafVyP4pE3yh4N2+F
X-Gm-Message-State: AOJu0Yz6+bC8p5H8lXazdSqKOu6uc3iW000HuDQDL1P+2Mx8YHDuCnEM
	dKhOVFS+rm9/KWk4xp8U2DobqYIpLANWiHhU/cDjk6wOX9p6cj7k4Nr1nxvXnwk=
X-Google-Smtp-Source: AGHT+IEKCNWFIWSIa0WEqcLAmK79+P9DH8UDMg3F8CdyMwZNKChDWbgmxYrh315TuPC354rnk9EOyA==
X-Received: by 2002:a50:d54a:0:b0:5a3:d140:1a57 with SMTP id 4fb4d7f45d1cf-5ac6203a1f4mr4350486a12.1.1721981947474;
        Fri, 26 Jul 2024 01:19:07 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ac63b59c86sm1641627a12.42.2024.07.26.01.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 01:19:06 -0700 (PDT)
Date: Fri, 26 Jul 2024 10:19:05 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Waiman Long <longman@redhat.com>
Cc: Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>, cgroups@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kamalesh Babulal <kamalesh.babulal@oracle.com>, Roman Gushchin <roman.gushchin@linux.dev>
Subject: Re: [PATCH-cgroup v4] cgroup: Show # of subsystem CSSes in
 cgroup.stat
Message-ID: <qozzqah5blnsvc73jrhfuldsaxwsoluuewvgpukzgcuud4nqgc@xnctlkgk5yjv>
References: <20240711025153.2356213-1-longman@redhat.com>
 <23hhazcy34yercbmsogrljvxatfmy6b7avtqrurcze3354defk@zpekfjpgyp6h>
 <0efbedff-3456-4e6a-8d2d-79b89a18864d@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xlb3knarn2v64q76"
Content-Disposition: inline
In-Reply-To: <0efbedff-3456-4e6a-8d2d-79b89a18864d@redhat.com>


--xlb3knarn2v64q76
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 25, 2024 at 04:05:42PM GMT, Waiman Long <longman@redhat.com> wr=
ote:
> > There's also 'debug' subsys. Have you looked at (extending) that wrt
> > dying csses troubleshooting?
> > It'd be good to document here why you decided against it.
> The config that I used for testing doesn't include CONFIG_CGROUP_DEBUG.

I mean if you enable CONFIG_CGROUP_DEBUG, there is 'debug' controller
that exposes files like debug.csses et al.

> That is why "debug" doesn't show up in the sample outputs. The CSS #
> for the debug subsystem should show up if it is enabled.

So these "debugging" numbers could be implemented via debug subsys. So I
wondered why it's not done this way. That reasoning is missing in the
commit message.

> > > +	for_each_css(css, ssid, cgroup) {
> > > +		if ((BIT(ssid) & cgrp_dfl_inhibit_ss_mask) ||
> > > +		    (cgroup_subsys[ssid]->root !=3D  &cgrp_dfl_root))
> > > +			continue;
> > Is this taken? (Given cgroup.stat is only on the default hierarchy.)
>=20
> I am not sure what you are asking here. Since cgroup.stat is a cgroup v2
> only control file, it won't show subsystems that are bound to cgroup v1.

So, is the if (...) ever true? (The file won't exist on v1.)

Michal

--xlb3knarn2v64q76
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd6mfF2PbEZnpdoAkt3Wney77BSQUCZqNb9wAKCRAt3Wney77B
Se+pAPoDu9bBY0yYCOVsOkk/g0USVMXESbUsc4TCgMsB5DRypAEAufCXfjxxMNXX
uOu6x5is+qJ4tUK/UzXu47ZzQQqsHg8=
=NpIn
-----END PGP SIGNATURE-----

--xlb3knarn2v64q76--

