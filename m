Return-Path: <linux-doc+bounces-36393-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6C2A22797
	for <lists+linux-doc@lfdr.de>; Thu, 30 Jan 2025 03:02:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E4601885694
	for <lists+linux-doc@lfdr.de>; Thu, 30 Jan 2025 02:02:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75B934B5AE;
	Thu, 30 Jan 2025 02:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eNm7qmWW"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9182013FEE
	for <linux-doc@vger.kernel.org>; Thu, 30 Jan 2025 02:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738202565; cv=none; b=NnkT9Lh9F0iR79hZ/8Nv5tss17WtFbP9/hbgCZUDd6Eh6jn7LYTtq8aTSdpXqIVVLnig0di36nJDD2Y2yYYB/iUOkxPZ/4BHm/NrV9yT/NvE81bg32NzFdIMRhEKPkoG98HDlcAeXqZJPWValgdsMGtE2kqD8L1UbSinaOqqqlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738202565; c=relaxed/simple;
	bh=n/OeGdeZMVIJFEVcwDCl7iqV15bGqS8grI/CpofheSg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=crEdX4UdGLbQgRDGfet012x4/XCawBqdgzbU7mqwuS9Fq/LpOZjlDdI/XRClZ8DZCZiaD+POKmkShA/N0IrFVVFD40IFIttrT9FQNK+i0L1je5Vy8svjcYURa+W8V+C/TGgsfH4d8RrSZt3lJxl6UPSdlZm63r3LBosQrsPvlMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eNm7qmWW; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-21625b4f978so63085ad.0
        for <linux-doc@vger.kernel.org>; Wed, 29 Jan 2025 18:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738202563; x=1738807363; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zjUEKGcrUN8SEEUn3045QyzgbV2Muq4d8woD1luLXEo=;
        b=eNm7qmWWTXmn2+VkKG3q0+oPZyixQ21wqQYBZqY8GDrGDlleD7XFm/8TN+Oqqx80M3
         S/f2X5hbWwderjxXwXbgLU2FxNjEGOCKK6R5+ZYAKf6QSofDYVKgbnJx9uxNMUkR3K73
         cYmqc0caKkQz7IEsQjspeOAoiGvc9yyjCu3qfNFpk5VxjpOSeLqacwEQfTT0IJI4Yo+x
         mIcAQHk34O4iPu1XMdrTtUxSao2j4SrRcSUQUUHmoHQlaCRb+huHW8Y4rjzqWEvttiT1
         rCU8YUuoC77sA+RF8BeNqZb7LBxC6eWuVrgJX3g9XVtVOFwZDJfZpbJ4HEH3x6g1MMkX
         LXmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738202563; x=1738807363;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zjUEKGcrUN8SEEUn3045QyzgbV2Muq4d8woD1luLXEo=;
        b=Wk22ipg2QOCzP/q5WdkOsgEE5yoUYQksTN7r72lUaCSuAj1AqCjimTCsEY6vB4yPde
         vJ+R+E6pNl9sqHe/tsqDRqJgN7bDGB8Mm8ujpbN5GJsLotk7dZrBNq39vbIqElqgPDGy
         IXmwkZBCW3KUXtraKgtmoyWiovzQRlgL91rKVIL9rvGh6MN0VMphsiSuT2Uz6A1arMbY
         yKuNw0/NaZvFG3cf6orVBBqx9QGZyo4W5y60Pd1CuKOSu0xfQoZZEJXSK0Zmhv7HyNxB
         F9Ua+PW/kbWn2l32zm75M7wMsCFfS04mP9gEIpMIAVLB0X0MEK0VgURHHUlk8MXUIvYI
         Q2Bg==
X-Forwarded-Encrypted: i=1; AJvYcCXLyFmJv51Q1wXS4MC4p7DmBhiyMyMpP0gL6fXvUd//04pj+FXU1mzJSVUOjaOZDTSegOqXxrx6yEw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx40p5zxV1qTm1k2bqEhWuRyTfSAV/Zekb9wZgDnnnkJRl1am2D
	phukDLgZgoGpkN/NanQPg6rnBVB5i4IAK1xIVVVGHUyuM2leSO6IABjtnyvvaV5dn50R2vNMcyk
	mo84Qwt4LeJ2v4UpTcXzg+1TZ7cTTTOAsTy8N
X-Gm-Gg: ASbGncut1xpvw8Q30EnCo1CIdB89DRH6zAq1hDZIUEmDMywLLSd2kGLxsnO9ZndhQMR
	NdHa23RtatDj1Bx5qlSc+cdrcOQorov0wfujnmyCOYncwR+zp+poJ0RrY754SCDvgmtuKSHdOhe
	WwQnCpUtdJafp3IrfexYadOf6WWQ==
X-Google-Smtp-Source: AGHT+IFE4A3aWM8yz21uOrZOg4SChpOzryWR+ItPTzgeX3qzwaFRLrgsLB6RJr5+4uESj8JF/qvVZaYyrmavlvqmppA=
X-Received: by 2002:a17:902:fc4b:b0:215:9ab0:402 with SMTP id
 d9443c01a7336-21de24504dfmr1287495ad.18.1738202562597; Wed, 29 Jan 2025
 18:02:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJj2-QFdP6DKVQJ4Tw6rdV+XtgDihe=UOnvm4cm-q61K0hq6CQ@mail.gmail.com>
 <20241211195329.60224-1-sj@kernel.org>
In-Reply-To: <20241211195329.60224-1-sj@kernel.org>
From: Yuanchu Xie <yuanchu@google.com>
Date: Wed, 29 Jan 2025 18:02:26 -0800
X-Gm-Features: AWEUYZmCJuhnrHdMr4LNNVLS2bbqy0msDks-3N4T6wXtjurzCtTNwSUNxZIoRCo
Message-ID: <CAJj2-QEaLTasfQgb=VFfnbOmkcXU3kw2VbsNummNEq0V3b9jdw@mail.gmail.com>
Subject: Re: [PATCH v4 0/9] mm: workingset reporting
To: SeongJae Park <sj@kernel.org>
Cc: David Hildenbrand <david@redhat.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, 
	Khalid Aziz <khalid.aziz@oracle.com>, Henry Huang <henry.hj@antgroup.com>, 
	Yu Zhao <yuzhao@google.com>, Dan Williams <dan.j.williams@intel.com>, 
	Gregory Price <gregory.price@memverge.com>, Huang Ying <ying.huang@intel.com>, 
	Lance Yang <ioworker0@gmail.com>, Randy Dunlap <rdunlap@infradead.org>, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>, Tejun Heo <tj@kernel.org>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Mike Rapoport <rppt@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, Daniel Watson <ozzloy@each.do>, cgroups@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	virtualization@lists.linux.dev, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 11, 2024 at 11:53=E2=80=AFAM SeongJae Park <sj@kernel.org> wrot=
e:
>
> On Fri, 6 Dec 2024 11:57:55 -0800 Yuanchu Xie <yuanchu@google.com> wrote:
>
> > Thanks for the response Johannes. Some replies inline.
> >
> > On Tue, Nov 26, 2024 at 11:26\u202fPM Johannes Weiner <hannes@cmpxchg.o=
rg> wrote:
> > >
> > > On Tue, Nov 26, 2024 at 06:57:19PM -0800, Yuanchu Xie wrote:
> > > > This patch series provides workingset reporting of user pages in
> > > > lruvecs, of which coldness can be tracked by accessed bits and fd
> > > > references. However, the concept of workingset applies generically =
to
> > > > all types of memory, which could be kernel slab caches, discardable
> > > > userspace caches (databases), or CXL.mem. Therefore, data sources m=
ight
> > > > come from slab shrinkers, device drivers, or the userspace.
> > > > Another interesting idea might be hugepage workingset, so that we c=
an
> > > > measure the proportion of hugepages backing cold memory. However, w=
ith
> > > > architectures like arm, there may be too many hugepage sizes leadin=
g to
> > > > a combinatorial explosion when exporting stats to the userspace.
> > > > Nonetheless, the kernel should provide a set of workingset interfac=
es
> > > > that is generic enough to accommodate the various use cases, and ex=
tensible
> > > > to potential future use cases.
> > >
> > > Doesn't DAMON already provide this information?
> > >
> > > CCing SJ.
> > Thanks for the CC. DAMON was really good at visualizing the memory
> > access frequencies last time I tried it out!
>
> Thank you for this kind acknowledgement, Yuanchu!
>
> > For server use cases,
> > DAMON would benefit from integrations with cgroups.  The key then would=
 be a
> > standard interface for exporting a cgroup's working set to the user.
>
> I show two ways to make DAMON supports cgroups for now.  First way is mak=
ing
> another DAMON operations set implementation for cgroups.  I shared a roug=
h idea
> for this before, probably on kernel summit.  But I haven't had a chance t=
o
> prioritize this so far.  Please let me know if you need more details.  Th=
e
> second way is extending DAMOS filter to provide more detailed statistics =
per
> DAMON-region, and adding another DAMOS action that does nothing but only
> accounting the detailed statistics.  Using the new DAMOS action, users wi=
ll be
> able to know how much of specific DAMON-found regions are filtered out by=
 the
> given filter.  Because we have DAMOS filter type for cgroups, we can know=
 how
> much of workingset (or, warm memory) belongs to specific groups.  This ca=
n be
> applied to not only cgroups, but for any DAMOS filter types that exist (e=
.g.,
> anonymous page, young page).
>
> I believe the second way is simpler to implement while providing informat=
ion
> that sufficient for most possible use cases.  I was anyway planning to do=
 this.
For a container orchestrator like kubernetes, the node agents need to
be able to gather the working set stats at a per-job level. Some jobs
can create sub-hierarchies as well, so it's important that we have
hierarchical stats.

Do you think it's a good idea to integrate DAMON to provide some
aggregate stats in a memory controller file? With the DAMOS cgroup
filter, there can be some kind of interface that a DAMOS action or the
damo tool could call into. I feel that would be a straightforward and
integrated way to support cgroups.

Yuanchu

