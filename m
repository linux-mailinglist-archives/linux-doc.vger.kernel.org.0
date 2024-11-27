Return-Path: <linux-doc+bounces-31679-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2E99DAFE0
	for <lists+linux-doc@lfdr.de>; Thu, 28 Nov 2024 00:33:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F33292816F7
	for <lists+linux-doc@lfdr.de>; Wed, 27 Nov 2024 23:33:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19447197A82;
	Wed, 27 Nov 2024 23:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1u5Fm/XL"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F346194ACB
	for <linux-doc@vger.kernel.org>; Wed, 27 Nov 2024 23:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732750428; cv=none; b=PL2yvv6zx+yr3WuRD8C3mOSAnZaISiP+P/B1cSUkd37qExa13JvQmV0i2M/5arYer2vFVpuEM3m3WSuNKYd7bSajct6KiJQyA8RWVnByzxQ34220+qQHzekMCFetlQCh6tmEdmKwL/F2KK+yYU6D+k6+9Wd16/ZKQRWtrDg7RJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732750428; c=relaxed/simple;
	bh=c/6BdA/FGDD21UXuX3fBYvnBpYxd4lTVjYqF3flseHQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F91iK9ix/o9daiQWoO1uD4wUkdD6BNoih9R1bbF+yM9m2xYdg54Pad3s0A79Buehhb4IrQo3WJx8e0Pexkr7LA3W+kMQknd5J9U8N58FP5Au0SU3QgKVNkQqnhmyjsWAy8GvRGQg+DJK/HUhzg4bcOW4XpP4IAPtiliL+otRgro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1u5Fm/XL; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4af1578d288so64378137.3
        for <linux-doc@vger.kernel.org>; Wed, 27 Nov 2024 15:33:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732750423; x=1733355223; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DeE7gf3SgsSd53Xjo/FWaB9otQ/uDFTu3yrje1a8eJQ=;
        b=1u5Fm/XL9z61DnnrtKu15kIyntW74akmYy+uoLkB+3YHbT5kGy123u3qCt8Gy4634H
         NYW04StCFn5R3d38XVrCHjJturaAy8GD0u5vxzxBh1ygOtCUb8H2Kyvk3gLvlnpyD5HN
         YnQMogZ7+JOi1mDId6hw37BreCw7l5BBn+AziCmrb7D7c+6KR0TlaqNp6nw54MSlO/qS
         pbEgwgt3SbzuK503uih7GM+QLAH8obdtwEd1CKcfpW8/wpILSAPDqCx9z34RAuopiR4r
         17ajia8ybnjKBA/y3+l9MCoYF0Ur8r/Zi6vFKTo15kvDuI8/TWEPflRihze78ywtSSi0
         PspQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732750423; x=1733355223;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DeE7gf3SgsSd53Xjo/FWaB9otQ/uDFTu3yrje1a8eJQ=;
        b=LUAoYS9KlQpM0TuIVqXH7y+4qPcgwl4G9r3tT4Gh0IlLTlRZVcMnMwK88FeQ8THkBn
         Jx0JKK0nPko3Ux8jKMz0JWX9SHlxiOuBUYHQEPVuQkWj/0EHJXB0IKbtqE5cRQK8ZkW2
         cpgKhPNrngLoES0k0Zcqn6AGxB3Do3ALseWAev7ejrM9jnmC8OTGlLUF/cKtSrWoC2+z
         JQ+xxW/LyTf/aRelHLejzz8BPUn6Yuc8IlqM6FFdZeZmyiJgOXYpGptal4U4WoB46iCC
         u9QYTce79ePOfCq2mkcRi+1Y2ixzZN+hQ+qIdJX/vOQDdvsnGmIpQMKRzGfdOlPKH8PX
         ykAQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+PVv4siTkz6tjN2PGF8Ht/5dJ/zDxpYJ5KlDfeWsHlirELIreKovsYJpcs0AsemxGIbbPEew4byg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7xFdrcHKQKy1hc4x9YLvDJ3Wg8n699s0IrHOfXcMwLsw7yv99
	oK9HhNhGXlT6qZLTpb3Q/49M8d1T+tcYCaSzXlYmmpsJTo8YmuEmefohWtqjd9Lnc2QJeMAy6wg
	MshsRvGlPAcKCZW4k71j3Az33YG6DkLgkJH8H
X-Gm-Gg: ASbGncsJP7XbvaJMyCkLDNO2o35yZTnMb3ZOE/fuMFu+a6BAnXLHCey520bmUzgNCMo
	TTOrCrWT5hek3MmGER7QMqj3QJmFKKYZTH9v0v0o8EpxeS7P1L+a3IP4BZvqTsHmM
X-Google-Smtp-Source: AGHT+IEb//pM5Q5yvsRmUmFE24+3YoU7gB1MI5HQU46JSAJh0oacWRVHYZ8480xFDhv7sb4Ta2tJ7XV+rafI2QDjbYc=
X-Received: by 2002:a05:6102:1899:b0:4af:469b:d3b8 with SMTP id
 ada2fe7eead31-4af469bd4d8mr4257577137.25.1732750423237; Wed, 27 Nov 2024
 15:33:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241127025728.3689245-1-yuanchu@google.com> <20241127072604.GA2501036@cmpxchg.org>
In-Reply-To: <20241127072604.GA2501036@cmpxchg.org>
From: Yu Zhao <yuzhao@google.com>
Date: Wed, 27 Nov 2024 16:33:06 -0700
Message-ID: <CAOUHufZ04fUgPUba89edv0UDLSiz7w+VJp-nbKPiVD8B-MMdfQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/9] mm: workingset reporting
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: Yuanchu Xie <yuanchu@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, 
	Khalid Aziz <khalid.aziz@oracle.com>, Henry Huang <henry.hj@antgroup.com>, 
	Dan Williams <dan.j.williams@intel.com>, Gregory Price <gregory.price@memverge.com>, 
	Huang Ying <ying.huang@intel.com>, Lance Yang <ioworker0@gmail.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Muhammad Usama Anjum <usama.anjum@collabora.com>, 
	Tejun Heo <tj@kernel.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Mike Rapoport <rppt@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, Daniel Watson <ozzloy@each.do>, cgroups@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	virtualization@lists.linux.dev, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, SeongJae Park <sj@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 27, 2024 at 12:26=E2=80=AFAM Johannes Weiner <hannes@cmpxchg.or=
g> wrote:
>
> On Tue, Nov 26, 2024 at 06:57:19PM -0800, Yuanchu Xie wrote:
> > This patch series provides workingset reporting of user pages in
> > lruvecs, of which coldness can be tracked by accessed bits and fd
> > references. However, the concept of workingset applies generically to
> > all types of memory, which could be kernel slab caches, discardable
> > userspace caches (databases), or CXL.mem. Therefore, data sources might
> > come from slab shrinkers, device drivers, or the userspace.
> > Another interesting idea might be hugepage workingset, so that we can
> > measure the proportion of hugepages backing cold memory. However, with
> > architectures like arm, there may be too many hugepage sizes leading to
> > a combinatorial explosion when exporting stats to the userspace.
> > Nonetheless, the kernel should provide a set of workingset interfaces
> > that is generic enough to accommodate the various use cases, and extens=
ible
> > to potential future use cases.
>
> Doesn't DAMON already provide this information?

Yuanchu might be able to answer this question a lot better than I do,
since he studied DAMON and tried to leverage it in our fleet.

My impression is that there are some fundamental differences in access
detection and accounting mechanisms between the two, i.e., sampling vs
scanning-based detection and non-lruvec vs lruvec-based accounting.

> CCing SJ.
>
> > Use cases
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > Job scheduling
> > On overcommitted hosts, workingset information improves efficiency and
> > reliability by allowing the job scheduler to have better stats on the
> > exact memory requirements of each job. This can manifest in efficiency =
by
> > landing more jobs on the same host or NUMA node. On the other hand, the
> > job scheduler can also ensure each node has a sufficient amount of memo=
ry
> > and does not enter direct reclaim or the kernel OOM path. With workings=
et
> > information and job priority, the userspace OOM killing or proactive
> > reclaim policy can kick in before the system is under memory pressure.
> > If the job shape is very different from the machine shape, knowing the
> > workingset per-node can also help inform page allocation policies.
> >
> > Proactive reclaim
> > Workingset information allows the a container manager to proactively
> > reclaim memory while not impacting a job's performance. While PSI may
> > provide a reactive measure of when a proactive reclaim has reclaimed to=
o
> > much, workingset reporting allows the policy to be more accurate and
> > flexible.
>
> I'm not sure about more accurate.

Agreed. This is a (very) poor argument, unless there are facts to back this=
 up.

> Access frequency is only half the picture. Whether you need to keep
> memory with a given frequency resident depends on the speed of the
> backing device.

Along a similar line, we also need to consider use cases that don't
involve backing storage, e.g., far memory (remote node). More details below=
.

> There is memory compression; there is swap on flash; swap on crappy
> flash; swapfiles that share IOPS with co-located filesystems. There is
> zswap+writeback, where avg refault speed can vary dramatically.
>
> You can of course offload much more to a fast zswap backend than to a
> swapfile on a struggling flashdrive, with comparable app performance.
>
> So I think you'd be hard pressed to achieve a high level of accuracy
> in the usecases you list without taking the (often highly dynamic)
> cost of paging / memory transfer into account.
>
> There is a more detailed discussion of this in a paper we wrote on
> proactive reclaim/offloading - in 2.5 Hardware Heterogeneity:
>
> https://www.cs.cmu.edu/~dskarlat/publications/tmo_asplos22.pdf
>
> > Ballooning (similar to proactive reclaim)
> > The last patch of the series extends the virtio-balloon device to repor=
t
> > the guest workingset.
> > Balloon policies benefit from workingset to more precisely determine th=
e
> > size of the memory balloon. On end-user devices where memory is scarce =
and
> > overcommitted, the balloon sizing in multiple VMs running on the same
> > device can be orchestrated with workingset reports from each one.
> > On the server side, workingset reporting allows the balloon controller =
to
> > inflate the balloon without causing too much file cache to be reclaimed=
 in
> > the guest.
> >
> > Promotion/Demotion
> > If different mechanisms are used for promition and demotion, workingset
> > information can help connect the two and avoid pages being migrated bac=
k
> > and forth.
> > For example, given a promotion hot page threshold defined in reaccess
> > distance of N seconds (promote pages accessed more often than every N
> > seconds). The threshold N should be set so that ~80% (e.g.) of pages on
> > the fast memory node passes the threshold. This calculation can be done
> > with workingset reports.
> > To be directly useful for promotion policies, the workingset report
> > interfaces need to be extended to report hotness and gather hotness
> > information from the devices[1].
> >
> > [1]
> > https://www.opencompute.org/documents/ocp-cms-hotness-tracking-requirem=
ents-white-paper-pdf-1
> >
> > Sysfs and Cgroup Interfaces
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > The interfaces are detailed in the patches that introduce them. The mai=
n
> > idea here is we break down the workingset per-node per-memcg into time
> > intervals (ms), e.g.
> >
> > 1000 anon=3D137368 file=3D24530
> > 20000 anon=3D34342 file=3D0
> > 30000 anon=3D353232 file=3D333608
> > 40000 anon=3D407198 file=3D206052
> > 9223372036854775807 anon=3D4925624 file=3D892892
> >
> > Implementation
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > The reporting of user pages is based off of MGLRU, and therefore requir=
es
> > CONFIG_LRU_GEN=3Dy. We would benefit from more MGLRU generations for a =
more
> > fine-grained workingset report, but we can already gather a lot of data
> > with just four generations. The workingset reporting mechanism is gated
> > behind CONFIG_WORKINGSET_REPORT, and the aging thread is behind
> > CONFIG_WORKINGSET_REPORT_AGING.
> >
> > Benchmarks
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > Ghait Ouled Amar Ben Cheikh has implemented a simple policy and ran Lin=
ux
> > compile and redis benchmarks from openbenchmarking.org. The policy and
> > runner is referred to as WMO (Workload Memory Optimization).
> > The results were based on v3 of the series, but v4 doesn't change the c=
ore
> > of the working set reporting and just adds the ballooning counterpart.
> >
> > The timed Linux kernel compilation benchmark shows improvements in peak
> > memory usage with a policy of "swap out all bytes colder than 10 second=
s
> > every 40 seconds". A swapfile is configured on SSD.
> > --------------------------------------------
> > peak memory usage (with WMO): 4982.61328 MiB
> > peak memory usage (control): 9569.1367 MiB
> > peak memory reduction: 47.9%
> > --------------------------------------------
> > Benchmark                                           | Experimental     =
|Control         | Experimental_Std_Dev | Control_Std_Dev
> > Timed Linux Kernel Compilation - allmodconfig (sec) | 708.486 (95.91%) =
| 679.499 (100%) | 0.6%                 | 0.1%
> > --------------------------------------------
> > Seconds, fewer is better
>
> You can do this with a recent (>2018) upstream kernel and ~100 lines
> of python [1]. It also works on both LRU implementations.
>
> [1] https://github.com/facebookincubator/senpai
>
> We use this approach in virtually the entire Meta fleet, to offload
> unneeded memory, estimate available capacity for job scheduling, plan
> future capacity needs, and provide accurate memory usage feedback to
> application developers.
>
> It works over a wide variety of CPU and storage configurations with no
> specific tuning.

How would Senpai work for use cases that don't have local storage,
i.e., all memory is mapped by either the fast or the slow tier? (>95%
memory usage in our fleet is mapped and local storage for non-storage
servers is only scratch space.)

My current understanding is that its approach would not be able to
form a feedback loop because there are currently no refaults from the
slow tier (because it's also mapped), and that's where I think this
proposal or something similar can help.

Also this proposal reports histograms, not scalars. So in theory,
userspace can see the projections of its potential actions, rather
than solely rely on trial and error. Of course, this needs to be
backed with data. So yes, some comparisons from real-world use cases
would be very helpful to demonstrate the value of this proposal.

