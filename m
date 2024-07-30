Return-Path: <linux-doc+bounces-21688-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E4C9415AA
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jul 2024 17:48:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8A679B229CB
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jul 2024 15:48:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A19F31B583B;
	Tue, 30 Jul 2024 15:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ApcGJKV9"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96871B5832
	for <linux-doc@vger.kernel.org>; Tue, 30 Jul 2024 15:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722354497; cv=none; b=JFx2/KNIdNHVnt/Xdd3ef+6Q/ModCmnSSs/XE8z5DHPfXSl3yY5BSLyhWPApMptoo4mplIJoE9v3cthyvVkpskjrvfLEjbO0TN59t7xatigOj9BLfHESwt0OJKILn2Kgtzm8tL6HsqnbhGe0hc7D8UDwC8UVfGE3ssxomoO6OCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722354497; c=relaxed/simple;
	bh=WyNq8YsumSLxdlcOiBSQJPBphd1srZMCXa47KPqsWN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iBg4fZtn/4MWYrc2kOhgNepPAmItNYYJAIYbE+yIGzDHMljvuYjfGgUePuMfj9CIG7pGkkEtsLnnZizFfeF/dNr5KerR8M6j1rmohRpbPnB/4O0+rAfJpXpcEl5qW8wKZhP4ObfezbQRfc64rm04KIcBXc/82YnXGZ1Sq2DKGdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ApcGJKV9; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a7a843bef98so499361766b.2
        for <linux-doc@vger.kernel.org>; Tue, 30 Jul 2024 08:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722354494; x=1722959294; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3H3zc2XckgBeMfg/ss6t5PIdHdtIJYeowfICmheZoHU=;
        b=ApcGJKV9imBkWwkYBBGim+CW0xJnJzSpDOSysJs6xC5ZmYzMxW9NChEzSHZlAtZxRU
         nCxopgJdTZkPmwEncgtK0rgnG0QFw7KOW4v2DfPe/Ip31Qx2wG2Dj4Q+8l4mtHmIEss9
         hcjHRe2HeubNieUY0HkyEhK13qY2v2Rx6LmZyJSLAQR7spJiMZTLEb+HdfWvgDrBqdEp
         RKw0dDHAQKg1DFb3qQhbguN7znKe8vvYW8nmJhgM/G4CF5rNrcjutuiB9HuVBdMBS4lA
         K8CDwQMP/P3OSmpxlKPJd3Dl3Xlm3nGP1ujZ6EccuMhnnlL0C6ha7deRO1T2f9VFOOK5
         rJKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722354494; x=1722959294;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3H3zc2XckgBeMfg/ss6t5PIdHdtIJYeowfICmheZoHU=;
        b=wtrp6CFn1APwSwYxt+JvhXA4mOfWh5Dn2hm2/b3U6O6y9/zgPtAGL/cRFLaUAj1SQ7
         jhy9JUPwVt2qfoYFdJwgA4GxxKR/xtfIz5ULdh7NljxZIwnBJq9xfdstMh4qjSO0vyzw
         de2y4vCqd8wzJhbuirN/tRayg2HbSia5v57GEO8I3PveTBPT622eAWzPuu+G9fslZVQM
         ld/w6jTOJilE7NrsI+0UFB/vO/kpljYjKiTaNikUWcj1C5F1/oSNLIsE92nAtHDnLQ+B
         ZCCxm+kzYl/ecyw7X6nGI+sSei/h8bGJ/Uc8z+aTk927rNC0KcwEVopA0kBz1EFdQoa+
         GqgA==
X-Forwarded-Encrypted: i=1; AJvYcCXGiSJ0tWXzyybg0Wti6UIUYz49q6rhgHAoIZJ1lInZfNSIJ7d8/+cH7c3PwuycnddFRKVfXIfYpuYF0Cu1Uanyse20VqaamPCq
X-Gm-Message-State: AOJu0YyjsmAEf3zhw1dqb8BUDh2Giysdjz2VUpn/eSGJYcCFuhemwGOE
	hj4KZRHKJlkttPD5GMvvEhhZM9A1DII4Tbt0VKBk59jFFnBtx+EYb/PAjIFLAQk=
X-Google-Smtp-Source: AGHT+IHx8cAG8qt06h8O+vQMz5ylfzVI9zatMIDF2iye+fJMGPQzpxVamyfv4QTZ7m8qnq1ZA400MQ==
X-Received: by 2002:a17:906:c10f:b0:a7a:bae8:f292 with SMTP id a640c23a62f3a-a7d40101a57mr813329666b.41.1722354493847;
        Tue, 30 Jul 2024 08:48:13 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acab5948asm657937766b.85.2024.07.30.08.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 08:48:13 -0700 (PDT)
Date: Tue, 30 Jul 2024 17:48:11 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: David Finkel <davidf@vimeo.com>
Cc: Muchun Song <muchun.song@linux.dev>, Tejun Heo <tj@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	core-services@vimeo.com, Jonathan Corbet <corbet@lwn.net>, 
	Michal Hocko <mhocko@kernel.org>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Shuah Khan <shuah@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Zefan Li <lizefan.x@bytedance.com>, cgroups@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v6 1/2] mm, memcg: cg2 memory{.swap,}.peak write handlers
Message-ID: <p5p2il4njypdlaolbidz6bid3cv2dlz6vs3xd64ghn4zhw3igc@zxut62vhkwwb>
References: <20240729143743.34236-1-davidf@vimeo.com>
 <20240729143743.34236-2-davidf@vimeo.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4gx6so2i3yytl6uk"
Content-Disposition: inline
In-Reply-To: <20240729143743.34236-2-davidf@vimeo.com>


--4gx6so2i3yytl6uk
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 29, 2024 at 10:37:42AM GMT, David Finkel <davidf@vimeo.com> wro=
te:
> ...
>  Documentation/admin-guide/cgroup-v2.rst |  22 +++--
>  include/linux/cgroup-defs.h             |   5 +
>  include/linux/cgroup.h                  |   3 +
>  include/linux/memcontrol.h              |   5 +
>  include/linux/page_counter.h            |  11 ++-
>  kernel/cgroup/cgroup-internal.h         |   2 +
>  kernel/cgroup/cgroup.c                  |   7 ++
>  mm/memcontrol.c                         | 116 ++++++++++++++++++++++--
>  mm/page_counter.c                       |  30 ++++--
>  9 files changed, 174 insertions(+), 27 deletions(-)

Thanks for the fixups, you can add

Reviewed-by: Michal Koutn=FD <mkoutny@suse.com>

(I believe the test failure in the other thread is unrelated.)


--4gx6so2i3yytl6uk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd6mfF2PbEZnpdoAkt3Wney77BSQUCZqkLOQAKCRAt3Wney77B
Sc8rAQCcFO+D74+1cXWsMXxGu3oxDtVtulirZ1NqSHNVNXmmiQEAlNV5ARTstXPQ
l/+VVlYzT/mxoLdRLR4oakWCXl/BngI=
=DQce
-----END PGP SIGNATURE-----

--4gx6so2i3yytl6uk--

