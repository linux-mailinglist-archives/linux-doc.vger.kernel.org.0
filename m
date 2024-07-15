Return-Path: <linux-doc+bounces-20737-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5311D931C34
	for <lists+linux-doc@lfdr.de>; Mon, 15 Jul 2024 22:46:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D096281899
	for <lists+linux-doc@lfdr.de>; Mon, 15 Jul 2024 20:46:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD06B13BAE9;
	Mon, 15 Jul 2024 20:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vimeo.com header.i=@vimeo.com header.b="TdPybFYV"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3490013A3E8
	for <linux-doc@vger.kernel.org>; Mon, 15 Jul 2024 20:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721076409; cv=none; b=XGjv35olao/r6YH3mv/NUDzxJ+maoSlcD5v8810S4A5e/hCtCfocpGK2l7VKiRgwzW4LvpM0ULCzK6Z3wmFuxVXMGHFxAjKF++TmFtqaPtKgnMSNb5NSgXNw+zeV+LP3670ISNeI/3MRwmCpNlMS20FCf6lrB0AoVdaj/pdM0Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721076409; c=relaxed/simple;
	bh=GQ54mLYiVMVt/0Wn4mvVmeXg2DX+uzh0Qv7ZRekpfKQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oQaLnNs7NJtAmjBbS7yCPMyxDgpTbg1FwdY4uN9mREWPxVUKfN0WIKHLIHAhVQCwbqt4V5wzx9RF2kGHhna25SDdnejUw9hNNhYNVIHYdbFvgpiMsiSbdH4Xl5+S9+NXD/k2mF6N1P0vtWq9b17VoICF+77zRGz1xBfDsqdRnkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vimeo.com; spf=fail smtp.mailfrom=vimeo.com; dkim=pass (1024-bit key) header.d=vimeo.com header.i=@vimeo.com header.b=TdPybFYV; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vimeo.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=vimeo.com
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-793a3a79a83so766611a12.3
        for <linux-doc@vger.kernel.org>; Mon, 15 Jul 2024 13:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vimeo.com; s=google; t=1721076407; x=1721681207; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v5r4BlMeFMsBLJXnwagqjfkA1OJefHXmchvn97qJwwY=;
        b=TdPybFYVWeprffHZEWQs0vAGpBPewMyOZuQHBfs302UX0lg1YSHgJ0XpXXswq5yU/0
         mqOxi923/pjvTl5Q/LjDuMYyIdqSXH67DmSwuMnZNRPXAwWCAdBnn5OLsfIe6cnH31kL
         TT/vpseppfJH5/Z5VdwIqvaq6bubPcuCOYPJ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721076407; x=1721681207;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v5r4BlMeFMsBLJXnwagqjfkA1OJefHXmchvn97qJwwY=;
        b=VSN2EvYSAkd/G8c3EN3sqNJ8gvT1FPp0Kt/l9DY4G+y1pB7gZWkdTTCHebnSjPtBt5
         ZTHdHsqPV0Twxohrch802XDZj5ajmzpYJZNiCwVuCy31myotvF4QJ1wTbNeDrWDZplzo
         JETEWLhbDbRlEJmK3gD4edw/oHIBzHDGJvjgUTA9KcGVrFcDBzmSOXX3QxRzZcCPK8BF
         qWKt/YBy95Ul/6T+nS7+o2jVCiQ/e9926SuR+TSXb6dHl2eTrOTANecC6JchP6CMBzNW
         u5uAdCNUmmOKApDm+IO9mqbOTJAkKtWQUNZQ5PYhR4jY7E2wRemqhhvz3leAkMZZyvAY
         j3Yw==
X-Forwarded-Encrypted: i=1; AJvYcCVgX799oES/U98VX9rXuNJaLFZ0Vz5ePO/vCeG5d6qhP6CcVuc5VOS28EtlRoQ5LIZgvEVL4JcpAUlpeCTubRJWEDlC/2uQ7+pP
X-Gm-Message-State: AOJu0YxdQbnjHZ+IAsFKuJF/gu0sgYx8fEAp7li/qVJDkz8ZW6K541NC
	3igWsM6U6KOGbE9zm/B1lgcuBrCFhk2FjbpbYavwIV4YNqV4485OrUSd+lcjJutWgKcjEZwpwSB
	BZjymb+5lWfzhHgAURYDggfmM9QYZbJw9Kqu5Lw==
X-Google-Smtp-Source: AGHT+IGWEblruDt5y6iV398H0NEwY8WcXmFhJ/wPOIreRwsCOPEZS49X+zbp4U+Eol1q+HMj+BVSAINrdsm2Vp6js/Y=
X-Received: by 2002:a05:6a20:43a9:b0:1c0:f23c:28b1 with SMTP id
 adf61e73a8af0-1c3f122d69bmr94469637.23.1721076407209; Mon, 15 Jul 2024
 13:46:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240715203625.1462309-1-davidf@vimeo.com> <20240715203625.1462309-2-davidf@vimeo.com>
 <CAFUnj5Oh_OsP4TikWTGT6cKKTnWLaBYpE5PGzcxLTp7b=UqLkQ@mail.gmail.com>
In-Reply-To: <CAFUnj5Oh_OsP4TikWTGT6cKKTnWLaBYpE5PGzcxLTp7b=UqLkQ@mail.gmail.com>
From: David Finkel <davidf@vimeo.com>
Date: Mon, 15 Jul 2024 16:46:36 -0400
Message-ID: <CAFUnj5MahNvM+B2zynVtcnYKJ7LZHwBNEcPKGAdz-tesDeOXcw@mail.gmail.com>
Subject: Re: [PATCH] mm, memcg: cg2 memory{.swap,}.peak write handlers
To: Muchun Song <muchun.song@linux.dev>, Andrew Morton <akpm@linux-foundation.org>
Cc: core-services@vimeo.com, Jonathan Corbet <corbet@lwn.net>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shuah Khan <shuah@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, Tejun Heo <tj@kernel.org>, 
	Zefan Li <lizefan.x@bytedance.com>, cgroups@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, Shakeel Butt <shakeel.butt@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

[Fixing Shakeel's email address (I didn't notice it changed when
comparing my previous "git send-email" commandline and
get_mainainer.pl output)]

On Mon, Jul 15, 2024 at 4:42=E2=80=AFPM David Finkel <davidf@vimeo.com> wro=
te:
>
> Note: this is a simple rebase of a patch I sent a few months ago,
> which received two acks before the thread petered out:
> https://www.spinics.net/lists/cgroups/msg40602.html
>
> Thanks,
>
> On Mon, Jul 15, 2024 at 4:38=E2=80=AFPM David Finkel <davidf@vimeo.com> w=
rote:
> >
> > Other mechanisms for querying the peak memory usage of either a process
> > or v1 memory cgroup allow for resetting the high watermark. Restore
> > parity with those mechanisms.
> >
> > For example:
> >  - Any write to memory.max_usage_in_bytes in a cgroup v1 mount resets
> >    the high watermark.
> >  - writing "5" to the clear_refs pseudo-file in a processes's proc
> >    directory resets the peak RSS.
> >
> > This change copies the cgroup v1 behavior so any write to the
> > memory.peak and memory.swap.peak pseudo-files reset the high watermark
> > to the current usage.
> >
> > This behavior is particularly useful for work scheduling systems that
> > need to track memory usage of worker processes/cgroups per-work-item.
> > Since memory can't be squeezed like CPU can (the OOM-killer has
> > opinions), these systems need to track the peak memory usage to compute
> > system/container fullness when binpacking workitems.
> >
> > Signed-off-by: David Finkel <davidf@vimeo.com>
> > ---
> >  Documentation/admin-guide/cgroup-v2.rst       | 20 +++---
> >  mm/memcontrol.c                               | 23 ++++++
> >  .../selftests/cgroup/test_memcontrol.c        | 72 ++++++++++++++++---
> >  3 files changed, 99 insertions(+), 16 deletions(-)
> >
> > diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/ad=
min-guide/cgroup-v2.rst
> > index 8fbb0519d556..201d8e5d9f82 100644
> > --- a/Documentation/admin-guide/cgroup-v2.rst
> > +++ b/Documentation/admin-guide/cgroup-v2.rst
> > @@ -1322,11 +1322,13 @@ PAGE_SIZE multiple when read back.
> >         reclaim induced by memory.reclaim.
> >
> >    memory.peak
> > -       A read-only single value file which exists on non-root
> > -       cgroups.
> > +       A read-write single value file which exists on non-root cgroups=
.
> > +
> > +       The max memory usage recorded for the cgroup and its descendant=
s since
> > +       either the creation of the cgroup or the most recent reset.
> >
> > -       The max memory usage recorded for the cgroup and its
> > -       descendants since the creation of the cgroup.
> > +       Any non-empty write to this file resets it to the current memor=
y usage.
> > +       All content written is completely ignored.
> >
> >    memory.oom.group
> >         A read-write single value file which exists on non-root
> > @@ -1652,11 +1654,13 @@ PAGE_SIZE multiple when read back.
> >         Healthy workloads are not expected to reach this limit.
> >
> >    memory.swap.peak
> > -       A read-only single value file which exists on non-root
> > -       cgroups.
> > +       A read-write single value file which exists on non-root cgroups=
.
> > +
> > +       The max swap usage recorded for the cgroup and its descendants =
since
> > +       the creation of the cgroup or the most recent reset.
> >
> > -       The max swap usage recorded for the cgroup and its
> > -       descendants since the creation of the cgroup.
> > +       Any non-empty write to this file resets it to the current swap =
usage.
> > +       All content written is completely ignored.
> >
> >    memory.swap.max
> >         A read-write single value file which exists on non-root
> > diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> > index 8f2f1bb18c9c..abfa547615d6 100644
> > --- a/mm/memcontrol.c
> > +++ b/mm/memcontrol.c
> > @@ -25,6 +25,7 @@
> >   * Copyright (C) 2020 Alibaba, Inc, Alex Shi
> >   */
> >
> > +#include <linux/cgroup-defs.h>
> >  #include <linux/page_counter.h>
> >  #include <linux/memcontrol.h>
> >  #include <linux/cgroup.h>
> > @@ -6915,6 +6916,16 @@ static u64 memory_peak_read(struct cgroup_subsys=
_state *css,
> >         return (u64)memcg->memory.watermark * PAGE_SIZE;
> >  }
> >
> > +static ssize_t memory_peak_write(struct kernfs_open_file *of,
> > +                                char *buf, size_t nbytes, loff_t off)
> > +{
> > +       struct mem_cgroup *memcg =3D mem_cgroup_from_css(of_css(of));
> > +
> > +       page_counter_reset_watermark(&memcg->memory);
> > +
> > +       return nbytes;
> > +}
> > +
> >  static int memory_min_show(struct seq_file *m, void *v)
> >  {
> >         return seq_puts_memcg_tunable(m,
> > @@ -7232,6 +7243,7 @@ static struct cftype memory_files[] =3D {
> >                 .name =3D "peak",
> >                 .flags =3D CFTYPE_NOT_ON_ROOT,
> >                 .read_u64 =3D memory_peak_read,
> > +               .write =3D memory_peak_write,
> >         },
> >         {
> >                 .name =3D "min",
> > @@ -8201,6 +8213,16 @@ static u64 swap_peak_read(struct cgroup_subsys_s=
tate *css,
> >         return (u64)memcg->swap.watermark * PAGE_SIZE;
> >  }
> >
> > +static ssize_t swap_peak_write(struct kernfs_open_file *of,
> > +                                char *buf, size_t nbytes, loff_t off)
> > +{
> > +       struct mem_cgroup *memcg =3D mem_cgroup_from_css(of_css(of));
> > +
> > +       page_counter_reset_watermark(&memcg->swap);
> > +
> > +       return nbytes;
> > +}
> > +
> >  static int swap_high_show(struct seq_file *m, void *v)
> >  {
> >         return seq_puts_memcg_tunable(m,
> > @@ -8283,6 +8305,7 @@ static struct cftype swap_files[] =3D {
> >                 .name =3D "swap.peak",
> >                 .flags =3D CFTYPE_NOT_ON_ROOT,
> >                 .read_u64 =3D swap_peak_read,
> > +               .write =3D swap_peak_write,
> >         },
> >         {
> >                 .name =3D "swap.events",
> > diff --git a/tools/testing/selftests/cgroup/test_memcontrol.c b/tools/t=
esting/selftests/cgroup/test_memcontrol.c
> > index 41ae8047b889..681972de673b 100644
> > --- a/tools/testing/selftests/cgroup/test_memcontrol.c
> > +++ b/tools/testing/selftests/cgroup/test_memcontrol.c
> > @@ -161,12 +161,12 @@ static int alloc_pagecache_50M_check(const char *=
cgroup, void *arg)
> >  /*
> >   * This test create a memory cgroup, allocates
> >   * some anonymous memory and some pagecache
> > - * and check memory.current and some memory.stat values.
> > + * and checks memory.current, memory.peak, and some memory.stat values=
.
> >   */
> > -static int test_memcg_current(const char *root)
> > +static int test_memcg_current_peak(const char *root)
> >  {
> >         int ret =3D KSFT_FAIL;
> > -       long current;
> > +       long current, peak, peak_reset;
> >         char *memcg;
> >
> >         memcg =3D cg_name(root, "memcg_test");
> > @@ -180,12 +180,32 @@ static int test_memcg_current(const char *root)
> >         if (current !=3D 0)
> >                 goto cleanup;
> >
> > +       peak =3D cg_read_long(memcg, "memory.peak");
> > +       if (peak !=3D 0)
> > +               goto cleanup;
> > +
> >         if (cg_run(memcg, alloc_anon_50M_check, NULL))
> >                 goto cleanup;
> >
> > +       peak =3D cg_read_long(memcg, "memory.peak");
> > +       if (peak < MB(50))
> > +               goto cleanup;
> > +
> > +       peak_reset =3D cg_write(memcg, "memory.peak", "\n");
> > +       if (peak_reset !=3D 0)
> > +               goto cleanup;
> > +
> > +       peak =3D cg_read_long(memcg, "memory.peak");
> > +       if (peak > MB(30))
> > +               goto cleanup;
> > +
> >         if (cg_run(memcg, alloc_pagecache_50M_check, NULL))
> >                 goto cleanup;
> >
> > +       peak =3D cg_read_long(memcg, "memory.peak");
> > +       if (peak < MB(50))
> > +               goto cleanup;
> > +
> >         ret =3D KSFT_PASS;
> >
> >  cleanup:
> > @@ -817,13 +837,14 @@ static int alloc_anon_50M_check_swap(const char *=
cgroup, void *arg)
> >
> >  /*
> >   * This test checks that memory.swap.max limits the amount of
> > - * anonymous memory which can be swapped out.
> > + * anonymous memory which can be swapped out. Additionally, it verifie=
s that
> > + * memory.swap.peak reflects the high watermark and can be reset.
> >   */
> > -static int test_memcg_swap_max(const char *root)
> > +static int test_memcg_swap_max_peak(const char *root)
> >  {
> >         int ret =3D KSFT_FAIL;
> >         char *memcg;
> > -       long max;
> > +       long max, peak;
> >
> >         if (!is_swap_enabled())
> >                 return KSFT_SKIP;
> > @@ -840,6 +861,12 @@ static int test_memcg_swap_max(const char *root)
> >                 goto cleanup;
> >         }
> >
> > +       if (cg_read_long(memcg, "memory.swap.peak"))
> > +               goto cleanup;
> > +
> > +       if (cg_read_long(memcg, "memory.peak"))
> > +               goto cleanup;
> > +
> >         if (cg_read_strcmp(memcg, "memory.max", "max\n"))
> >                 goto cleanup;
> >
> > @@ -862,6 +889,27 @@ static int test_memcg_swap_max(const char *root)
> >         if (cg_read_key_long(memcg, "memory.events", "oom_kill ") !=3D =
1)
> >                 goto cleanup;
> >
> > +       peak =3D cg_read_long(memcg, "memory.peak");
> > +       if (peak < MB(29))
> > +               goto cleanup;
> > +
> > +       peak =3D cg_read_long(memcg, "memory.swap.peak");
> > +       if (peak < MB(29))
> > +               goto cleanup;
> > +
> > +       if (cg_write(memcg, "memory.swap.peak", "\n"))
> > +               goto cleanup;
> > +
> > +       if (cg_read_long(memcg, "memory.swap.peak") > MB(10))
> > +               goto cleanup;
> > +
> > +
> > +       if (cg_write(memcg, "memory.peak", "\n"))
> > +               goto cleanup;
> > +
> > +       if (cg_read_long(memcg, "memory.peak"))
> > +               goto cleanup;
> > +
> >         if (cg_run(memcg, alloc_anon_50M_check_swap, (void *)MB(30)))
> >                 goto cleanup;
> >
> > @@ -869,6 +917,14 @@ static int test_memcg_swap_max(const char *root)
> >         if (max <=3D 0)
> >                 goto cleanup;
> >
> > +       peak =3D cg_read_long(memcg, "memory.peak");
> > +       if (peak < MB(29))
> > +               goto cleanup;
> > +
> > +       peak =3D cg_read_long(memcg, "memory.swap.peak");
> > +       if (peak < MB(19))
> > +               goto cleanup;
> > +
> >         ret =3D KSFT_PASS;
> >
> >  cleanup:
> > @@ -1295,7 +1351,7 @@ struct memcg_test {
> >         const char *name;
> >  } tests[] =3D {
> >         T(test_memcg_subtree_control),
> > -       T(test_memcg_current),
> > +       T(test_memcg_current_peak),
> >         T(test_memcg_min),
> >         T(test_memcg_low),
> >         T(test_memcg_high),
> > @@ -1303,7 +1359,7 @@ struct memcg_test {
> >         T(test_memcg_max),
> >         T(test_memcg_reclaim),
> >         T(test_memcg_oom_events),
> > -       T(test_memcg_swap_max),
> > +       T(test_memcg_swap_max_peak),
> >         T(test_memcg_sock),
> >         T(test_memcg_oom_group_leaf_events),
> >         T(test_memcg_oom_group_parent_events),
> > --
> > 2.40.1
> >
>
>
> --
> David Finkel
> Senior Principal Software Engineer, Core Services



--=20
David Finkel
Senior Principal Software Engineer, Core Services

