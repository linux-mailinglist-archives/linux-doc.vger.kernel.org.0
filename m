Return-Path: <linux-doc+bounces-588-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF5F7CEC5B
	for <lists+linux-doc@lfdr.de>; Thu, 19 Oct 2023 01:51:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 40E241C20EE7
	for <lists+linux-doc@lfdr.de>; Wed, 18 Oct 2023 23:51:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E6C24666F;
	Wed, 18 Oct 2023 23:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mvmi0VVs"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6209946665
	for <linux-doc@vger.kernel.org>; Wed, 18 Oct 2023 23:51:12 +0000 (UTC)
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 807B8FA;
	Wed, 18 Oct 2023 16:51:10 -0700 (PDT)
Received: by mail-io1-xd2a.google.com with SMTP id ca18e2360f4ac-7a66a321e62so64655639f.2;
        Wed, 18 Oct 2023 16:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697673070; x=1698277870; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f1fdvR+TCyCaeZPp3VqktkqpHwhabkS/n0H1eh7TjWE=;
        b=mvmi0VVsvUX3jCpfN2o7B8SwDXi01NlKK4aJwmgPNzZL54iof1Iv+R90Zc1uMiG+9B
         Pt3Q+7KnAEIIMp2f10wTwe9XAg8fdcAo5xkxqfE1N0Yes/T21HLj64L/hkjaRTpwI6qz
         Il1O/RvMFQsQ7q2mUz6vSb+KHUR5kG9oPeqP+aE5KevD7lOUcFYSB4z/kBcvIiiBELTY
         Gf6XcGRH6fpKY7dV+c06V85s+UAymFrBCf0wx9DvnPfvhywigX9EJ4js01UPV0IYaY6Z
         wAwvhaD/DIU0xtVtwUpXrzR2Ws6drwVof+Ldph+3YaEmW2Z4kUCMW0pwefF8YT9AFScb
         /XNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697673070; x=1698277870;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f1fdvR+TCyCaeZPp3VqktkqpHwhabkS/n0H1eh7TjWE=;
        b=HuykW/bSAzi4Yr97/toqaT7ygpHioooS7RtvrjgyUn5ypy1Jn8DKFGaAcga/BZRAEm
         uDJu3rX2pYUOvLZhJ2WmqEGsvnVU0D1HpTQDNgV6up0A6Ck5UfCMN6cUmH2q//eZWE9g
         kG+e9J18pGlLikKI/j/Gt4XxwbyMjAyx9tIai5aEYs6w5s6B1B2/uUezE5a/tCYqw9++
         T0NxJKMuVHdbZLLgV6hA6br7e0jFtXuyKPegLQ+HfUuNP9EMMLlrd1A5XXCPcz1zkMdg
         TPW7FbTYPMzwALz5+iNQBZ8/gp8VoqF0Ucn/qL0aMjuRqFElUCtZYEQQEozZy1kMd4RE
         s9jA==
X-Gm-Message-State: AOJu0YyKxWZsqMcG+tMi8HMT3Twegzlk8n/uK/cPoSpcQOOrttq59wXF
	mlAmqsLNe9nhLGQm1pb2m8jX3KEYnBfUyMSaHEc=
X-Google-Smtp-Source: AGHT+IFHBTy1yUFfbNvGAnxqV3acY9biX8730DPbrQDx60KoV+MDRcMFSmdjRQYok0C1JQPn4kC3aXATW4EDBuLRQm8=
X-Received: by 2002:a05:6602:2e10:b0:792:8d16:91ef with SMTP id
 o16-20020a0566022e1000b007928d1691efmr756328iow.18.1697673069754; Wed, 18 Oct
 2023 16:51:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231017232152.2605440-1-nphamcs@gmail.com> <20231017232152.2605440-4-nphamcs@gmail.com>
 <CAJD7tkbz1d-E-q0MphD=676-ftp-bmOOCFgVxq5mRKgbgGLuYA@mail.gmail.com>
In-Reply-To: <CAJD7tkbz1d-E-q0MphD=676-ftp-bmOOCFgVxq5mRKgbgGLuYA@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Wed, 18 Oct 2023 16:50:58 -0700
Message-ID: <CAKEwX=M26xaZiC+CCWnDJ1+va1q9JumWY1WEJkgvx9E_UkBN+Q@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] mm: memcg: add per-memcg zswap writeback stat
To: Yosry Ahmed <yosryahmed@google.com>
Cc: akpm@linux-foundation.org, hannes@cmpxchg.org, cerasuolodomenico@gmail.com, 
	sjenning@redhat.com, ddstreet@ieee.org, vitaly.wool@konsulko.com, 
	mhocko@kernel.org, roman.gushchin@linux.dev, shakeelb@google.com, 
	muchun.song@linux.dev, linux-mm@kvack.org, kernel-team@meta.com, 
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, shuah@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 18, 2023 at 4:25=E2=80=AFPM Yosry Ahmed <yosryahmed@google.com>=
 wrote:
>
> On Tue, Oct 17, 2023 at 4:21=E2=80=AFPM Nhat Pham <nphamcs@gmail.com> wro=
te:
> >
> > From: Domenico Cerasuolo <cerasuolodomenico@gmail.com>
> >
> > Since zswap now writes back pages from memcg-specific LRUs, we now need=
 a
> > new stat to show writebacks count for each memcg.
> >
> > Suggested-by: Nhat Pham <nphamcs@gmail.com>
> > Signed-off-by: Domenico Cerasuolo <cerasuolodomenico@gmail.com>
> > Signed-off-by: Nhat Pham <nphamcs@gmail.com>
> > ---
> >  include/linux/memcontrol.h |  2 ++
> >  mm/memcontrol.c            | 15 +++++++++++++++
> >  mm/zswap.c                 |  3 +++
> >  3 files changed, 20 insertions(+)
> >
> > diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
> > index 3de10fabea0f..7868b1e00bf5 100644
> > --- a/include/linux/memcontrol.h
> > +++ b/include/linux/memcontrol.h
> > @@ -38,6 +38,7 @@ enum memcg_stat_item {
> >         MEMCG_KMEM,
> >         MEMCG_ZSWAP_B,
> >         MEMCG_ZSWAPPED,
> > +       MEMCG_ZSWAP_WB,
> >         MEMCG_NR_STAT,
> >  };
> >
> > @@ -1884,6 +1885,7 @@ static inline void count_objcg_event(struct obj_c=
group *objcg,
> >  bool obj_cgroup_may_zswap(struct obj_cgroup *objcg);
> >  void obj_cgroup_charge_zswap(struct obj_cgroup *objcg, size_t size);
> >  void obj_cgroup_uncharge_zswap(struct obj_cgroup *objcg, size_t size);
> > +void obj_cgroup_report_zswap_wb(struct obj_cgroup *objcg);
> >  #else
> >  static inline bool obj_cgroup_may_zswap(struct obj_cgroup *objcg)
> >  {
> > diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> > index 1bde67b29287..a9118871e5a6 100644
> > --- a/mm/memcontrol.c
> > +++ b/mm/memcontrol.c
> > @@ -1505,6 +1505,7 @@ static const struct memory_stat memory_stats[] =
=3D {
> >  #if defined(CONFIG_MEMCG_KMEM) && defined(CONFIG_ZSWAP)
> >         { "zswap",                      MEMCG_ZSWAP_B                  =
 },
> >         { "zswapped",                   MEMCG_ZSWAPPED                 =
 },
> > +       { "zswap_wb",                   MEMCG_ZSWAP_WB                 =
 },
>
> zswap_writeback would be more consistent with file_writeback below.
>
> Taking a step back, this is not really a "state". We increment it by 1
> every time and never decrement it. Sounds awfully similar to events :)

Ah yeah, this is probably closer to zswpin/zswpout counters :)
We can probably re-use that piece of logic.

>
> You can also use count_objcg_event() directly and avoid the need for
> obj_cgroup_report_zswap_wb() below.
>
> >  #endif
> >         { "file_mapped",                NR_FILE_MAPPED                 =
 },
> >         { "file_dirty",                 NR_FILE_DIRTY                  =
 },
> > @@ -1541,6 +1542,7 @@ static int memcg_page_state_unit(int item)
> >         switch (item) {
> >         case MEMCG_PERCPU_B:
> >         case MEMCG_ZSWAP_B:
> > +       case MEMCG_ZSWAP_WB:
> >         case NR_SLAB_RECLAIMABLE_B:
> >         case NR_SLAB_UNRECLAIMABLE_B:
> >         case WORKINGSET_REFAULT_ANON:
> > @@ -7861,6 +7863,19 @@ void obj_cgroup_uncharge_zswap(struct obj_cgroup=
 *objcg, size_t size)
> >         rcu_read_unlock();
> >  }
> >
> > +void obj_cgroup_report_zswap_wb(struct obj_cgroup *objcg)
> > +{
> > +       struct mem_cgroup *memcg;
> > +
> > +       if (!cgroup_subsys_on_dfl(memory_cgrp_subsys))
> > +               return;
> > +
> > +       rcu_read_lock();
> > +       memcg =3D obj_cgroup_memcg(objcg);
> > +       mod_memcg_state(memcg, MEMCG_ZSWAP_WB, 1);
> > +       rcu_read_unlock();
> > +}
> > +
> >  static u64 zswap_current_read(struct cgroup_subsys_state *css,
> >                               struct cftype *cft)
> >  {
> > diff --git a/mm/zswap.c b/mm/zswap.c
> > index d2989ad11814..15485427e3fa 100644
> > --- a/mm/zswap.c
> > +++ b/mm/zswap.c
> > @@ -704,6 +704,9 @@ static enum lru_status shrink_memcg_cb(struct list_=
head *item, struct list_lru_o
> >         }
> >         zswap_written_back_pages++;
> >
> > +       if (entry->objcg)
> > +               obj_cgroup_report_zswap_wb(entry->objcg);
> > +
> >         /*
> >          * Writeback started successfully, the page now belongs to the
> >          * swapcache. Drop the entry from zswap - unless invalidate alr=
eady
> > --
> > 2.34.1

