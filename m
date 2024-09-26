Return-Path: <linux-doc+bounces-25857-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5EA987BF8
	for <lists+linux-doc@lfdr.de>; Fri, 27 Sep 2024 01:41:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 00D5F1C24E7C
	for <lists+linux-doc@lfdr.de>; Thu, 26 Sep 2024 23:41:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDA321B1400;
	Thu, 26 Sep 2024 23:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=intelfx.name header.i=@intelfx.name header.b="QFX+Ft7Y"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95801B1404
	for <linux-doc@vger.kernel.org>; Thu, 26 Sep 2024 23:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727394012; cv=none; b=MB8FcQ13lUw45tmP+9Km1YsA0s2t1AkO1Qyu/ABvmhz01QMHmBTYUm13uOwmPK3glHJhWtWppDIgc6FQCKLRU88JaGiSfOchEAWhK1TKA/lCj/rT4RaPgLD64PQjCDmLV2+DQancpC1SFLFSdhWXc/yICeGNlsAKJdisEFAdq7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727394012; c=relaxed/simple;
	bh=uKpTAzqoyySlR+8oqQyPqaB39JLjizvNxi99XSP5i98=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Owb7HPhoDRn3qam7Yto8ZXVbO9JpvR7jkmiai3VjbXg3tdlomIbUWlk5aPRDiGZo1FjB+oqDxEx/YmJkN0dMpvlN9NL0Q4mKZNu2LAAwlGAqMhl+XHpSLu+zFjvaHeNeSd9Qhz3Jr/dY3I3/MrlOM+QlMzwfewjwd93qmVwsGOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=intelfx.name; spf=pass smtp.mailfrom=intelfx.name; dkim=pass (1024-bit key) header.d=intelfx.name header.i=@intelfx.name header.b=QFX+Ft7Y; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=intelfx.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intelfx.name
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a7aa086b077so199335366b.0
        for <linux-doc@vger.kernel.org>; Thu, 26 Sep 2024 16:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intelfx.name; s=google; t=1727394009; x=1727998809; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uKpTAzqoyySlR+8oqQyPqaB39JLjizvNxi99XSP5i98=;
        b=QFX+Ft7YywEEskbKgsXV/CTtt1FV9ukAeC8w9TAM7Hxec9SjXJBMbY35rhs+MX/wa9
         LEOQgC5GUJNY5SRBBbBtN2e6ztdOmcslNnyPyfzEp/0VIdUh1blM5tG3/gIpKewMw/e/
         Kuitv85MCNL+saNolcjFZQ/o5DJqlqTRiGOvQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727394009; x=1727998809;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uKpTAzqoyySlR+8oqQyPqaB39JLjizvNxi99XSP5i98=;
        b=aD28vhC8vsmezqIkqkfuFMlRZIQFCYVygd4yZCgwvRj6r9LPuD+gTAXieDPhSk4SwX
         UXwOldMBEcoSevVUEcW6qJzzOsr4G976ky2ysxuBsZW+bS7ISWA2rk/zxjNYtxuWvyzA
         mYygb8UkAAmFx/aeAjUMctR4cBaI5lHaT13cBDG/BaH6qBUChmOeTI6kqDkiD0sPKT/h
         BcuT4h+6NZFgLKy6l/0nTGY9/ogrD5uWJ0Ablt79dMJD9rIXCVKJb8EkuhbD/KmOsTp4
         W3q6HTA17O31JGd1lkTx1EmefgkJeAX1ZPSrTarOkMAbkRcv2vHXROQHJSmrjbw7ZbQa
         NZxQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2xCAIfoWSPDIAGGC88joUaYULv+oRQI0vfQzwU0FRqh8LsyySDjwgTYBBSlTx6Zi8ko90Ft1NVYc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaoH6EbtzWYzh512GZrCwM6eMwykdPlSTl5xYx+hGyN6ibNtsB
	24FC8OrnSg4oRi7EH0sdfxHf6QxZ4x/j/RMtu/bZSMfIFpxiFS49QNomT1/aP+8=
X-Google-Smtp-Source: AGHT+IGk3lENN9qHrkJbZyp06+cpIkHb4ayVeIlhXVUADB4zcIETe8YE9A2AKIcrQu83XuXRnfdFEw==
X-Received: by 2002:a17:907:3f9e:b0:a7a:b070:92c6 with SMTP id a640c23a62f3a-a93c4a880acmr85163766b.50.1727394009153;
        Thu, 26 Sep 2024 16:40:09 -0700 (PDT)
Received: from able.exile.i.intelfx.name ([188.129.244.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27ecd10sm51403266b.96.2024.09.26.16.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 16:40:07 -0700 (PDT)
Message-ID: <dba9d7d9542d4f3d979a89f88253418c1d8a9775.camel@intelfx.name>
Subject: Re: [PATCH] zswap: improve memory.zswap.writeback inheritance
From: Ivan Shapovalov <intelfx@intelfx.name>
To: Nhat Pham <nphamcs@gmail.com>
Cc: linux-kernel@vger.kernel.org, Mike Yuan <me@yhndnzj.com>, Tejun Heo	
 <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>, Johannes Weiner	
 <hannes@cmpxchg.org>, Michal =?ISO-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>, 
 Jonathan Corbet	 <corbet@lwn.net>, Yosry Ahmed <yosryahmed@google.com>,
 Chengming Zhou	 <chengming.zhou@linux.dev>, Michal Hocko
 <mhocko@kernel.org>, Roman Gushchin	 <roman.gushchin@linux.dev>, Shakeel
 Butt <shakeel.butt@linux.dev>, Muchun Song	 <muchun.song@linux.dev>, Andrew
 Morton <akpm@linux-foundation.org>, Chris Li	 <chrisl@kernel.org>,
 cgroups@vger.kernel.org, linux-doc@vger.kernel.org, 	linux-mm@kvack.org
Date: Fri, 27 Sep 2024 01:40:04 +0200
In-Reply-To: <CAKEwX=MmCKrOkvDO5Yc_M8EB+k5U9AZ3boEiu4u2HUb7p0z+Kw@mail.gmail.com>
References: <20240926225531.700742-1-intelfx@intelfx.name>
	 <CAKEwX=MmCKrOkvDO5Yc_M8EB+k5U9AZ3boEiu4u2HUb7p0z+Kw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On 2024-09-26 at 16:12 -0700, Nhat Pham wrote:
> On Thu, Sep 26, 2024 at 3:55=E2=80=AFPM Ivan Shapovalov <intelfx@intelfx.=
name> wrote:
> >=20
> > Improve the inheritance behavior of the `memory.zswap.writeback` cgroup
> > attribute introduced during the 6.11 cycle. Specifically, in 6.11 we
> > walk the parent cgroups until we find a _disabled_ writeback, which doe=
s
> > not allow the user to selectively enable zswap writeback while having i=
t
> > disabled by default.
>=20
> Is there an actual need for this? This is a theoretical use case I
> thought of (and raised), but I don't think anybody actually wants
> this...?

This is of course anecdata, but yes, it does solve a real use-case that
I'm having right now, as well as a bunch of my colleagues who recently
complained to me (in private) about pretty much the same use-case.

The use-case is following: it turns out that it could be beneficial for
desktop systems to run with a pretty high swappiness and zswap
writeback globally disabled, to nudge the system to compress cold pages
but not actually write them back to the disk (which would happen pretty
aggressively if it was not disabled) to reduce I/O and latencies.
However, under this setup it is sometimes needed to re-enable zswap
writeback for specific memory-heavy applications that allocate a lot of
cold pages, to "allow" the kernel to actually swap those programs out.

>=20
> Besides, most people who want this can just:
>=20
> 1. Enable zswap writeback on root cgroup (and all non-leaf cgroups).
>=20
> 2. Disable zswap writeback on leaf cgroups on creation by default.
>=20
> 3. Selectively enable zswap writeback for the leaf cgroups.
>=20
> All of this is quite doable in userspace. It's not even _that_ racy -
> just do this before adding tasks etc. to the cgroup?

Well, yes, it is technically doable from userspace, just like it was
technically doable prior to commit e39925734909 to have userspace
explicitly control the entire hierarchy of writeback settings.
However it _is_ pretty painful, and the flow you described would
essentially negate any benefits of that patch (it would require
userspace to, once again, manage the entire hierarchy explicitly
without any help from the kernel).

IOWs, per the above commit I concluded that reducing pain levels for
userspace implementations was an acceptable design goal :-)

Thanks,
--=20
Ivan Shapovalov / intelfx /

