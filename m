Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C542732AAB
	for <lists+linux-doc@lfdr.de>; Fri, 16 Jun 2023 10:57:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234125AbjFPI5K (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 16 Jun 2023 04:57:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231860AbjFPI5J (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 16 Jun 2023 04:57:09 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D52ADB3
        for <linux-doc@vger.kernel.org>; Fri, 16 Jun 2023 01:57:07 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-311099fac92so312694f8f.0
        for <linux-doc@vger.kernel.org>; Fri, 16 Jun 2023 01:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1686905826; x=1689497826;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aKmBd/hk94KIms9coTfr32sXba2SQWkRq10+sLhytcA=;
        b=JKPxfqh9BgcQebcWJLie7vNP9FJDT7beqezBv/ZAlaD2Y4L8nk+y+hNKSbU1Td7qz6
         HD1Y1MQxIiFqAoiRN3aOIAfp4/+7OLmVQrrr6R4+UuUlvpqK2uQlCHOJv5BWCX3OCRyH
         BCK5RyLF7hwR6cCrLPJmlZKcHKMmp+34Z+3vtwZHK0HcratK78xZys7EJ8UtTjJisJ/x
         19XYdpYcCjdNI25BAUrVhW6P5/di3z0EFupM2PZGuy548Gl8Z1EnkAg5WFh+i6nDcXN1
         9U+CjXbAOkOEvuBeF6ekUM3u4XF0VQtKU1W7eyCjvqFK5m9o18TyHWyXAD0HWaiGwPu0
         KoFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686905826; x=1689497826;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aKmBd/hk94KIms9coTfr32sXba2SQWkRq10+sLhytcA=;
        b=hBp3BFHr/anAaX21TA6jCL+bKv6gaqdqRFXqXw9lOe88TiZvd8QmPPM2XmDyn/vUek
         oMKZrwkrowgpQGUGo0tShN9yl0ax3Bm8vE6rUeDfwWJdiy8tM5+n/Uwba+BBxGYB3j+d
         ieoiMH9/KJ2JWEVeRf4uPa8CmIMQFWI5004IgGE1gz+ik4VlGFSsemcubLuhDLrgJbOX
         k1/tTHjtkikrjpKJTrD7s4ZBYkLEvNZYefzx+GnmQ4obaYVYWgiRjlZxs+plw2il7DpC
         aGt5VuYqMUgf1g9A4BqTWy30WNmLK1vWfS4dTKTKTzOgcOzW6s5ybRt5w4O71P10tGjh
         yecg==
X-Gm-Message-State: AC+VfDzDy3e+pgpsuNWdvNb8r1Se63BxAiGX6gMuNbitgm/7skiS7uor
        jtw+qo3VGgtJFp68sq2ikVwstszSLz+N1UUa/Oo0ZA==
X-Google-Smtp-Source: ACHHUZ5jPIUrzu04CjDJzoaFD0WKJjlvz2Y5fINE2J0n3d/mCRpYiDv7vqKnkQsINekHfqABzeXw1TJ9lMBtPOaSBPc=
X-Received: by 2002:a5d:4c88:0:b0:309:38af:d300 with SMTP id
 z8-20020a5d4c88000000b0030938afd300mr914039wrs.33.1686905826176; Fri, 16 Jun
 2023 01:57:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230512085321.13259-1-alexghiti@rivosinc.com>
 <20230512085321.13259-6-alexghiti@rivosinc.com> <CAOnJCUL8t-BMfLX0uvjbFK9TFVyqEdCnkYN9aE0hB4NXEtRHZw@mail.gmail.com>
In-Reply-To: <CAOnJCUL8t-BMfLX0uvjbFK9TFVyqEdCnkYN9aE0hB4NXEtRHZw@mail.gmail.com>
From:   Alexandre Ghiti <alexghiti@rivosinc.com>
Date:   Fri, 16 Jun 2023 10:56:55 +0200
Message-ID: <CAHVXubjty9spB5EG9gmEAgUT67DaTmGDQMb7kqt46cW-cV2_PA@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] riscv: Prepare for user-space perf event mmap support
To:     Atish Patra <atishp@atishpatra.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>,
        Ian Rogers <irogers@google.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Anup Patel <anup@brainfault.org>,
        Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
        Andrew Jones <ajones@ventanamicro.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jun 16, 2023 at 10:28=E2=80=AFAM Atish Patra <atishp@atishpatra.org=
> wrote:
>
> On Fri, May 12, 2023 at 1:58=E2=80=AFAM Alexandre Ghiti <alexghiti@rivosi=
nc.com> wrote:
> >
> > Provide all the necessary bits in the generic riscv pmu driver to be
> > able to mmap perf events in userspace: the heavy lifting lies in the
> > driver backend, namely the legacy and sbi implementations.
> >
> > Note that arch_perf_update_userpage is almost a copy of arm64 code.
> >
> > Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> > ---
> >  arch/riscv/kernel/Makefile     |  2 +-
> >  arch/riscv/kernel/perf_event.c | 58 ++++++++++++++++++++++++++++++++++
> >  drivers/perf/riscv_pmu.c       | 41 ++++++++++++++++++++++++
> >  include/linux/perf/riscv_pmu.h |  4 +++
> >  4 files changed, 104 insertions(+), 1 deletion(-)
> >  create mode 100644 arch/riscv/kernel/perf_event.c
> >
> > diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
> > index 4cf303a779ab..0d215fd9860d 100644
> > --- a/arch/riscv/kernel/Makefile
> > +++ b/arch/riscv/kernel/Makefile
> > @@ -70,7 +70,7 @@ obj-$(CONFIG_DYNAMIC_FTRACE)  +=3D mcount-dyn.o
> >
> >  obj-$(CONFIG_TRACE_IRQFLAGS)   +=3D trace_irq.o
> >
> > -obj-$(CONFIG_PERF_EVENTS)      +=3D perf_callchain.o
> > +obj-$(CONFIG_PERF_EVENTS)      +=3D perf_callchain.o perf_event.o
> >  obj-$(CONFIG_HAVE_PERF_REGS)   +=3D perf_regs.o
> >  obj-$(CONFIG_RISCV_SBI)                +=3D sbi.o
> >  ifeq ($(CONFIG_RISCV_SBI), y)
> > diff --git a/arch/riscv/kernel/perf_event.c b/arch/riscv/kernel/perf_ev=
ent.c
> > new file mode 100644
> > index 000000000000..94174a0fc251
> > --- /dev/null
> > +++ b/arch/riscv/kernel/perf_event.c
> > @@ -0,0 +1,58 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +#include <linux/sched_clock.h>
> > +
> > +void arch_perf_update_userpage(struct perf_event *event,
> > +                              struct perf_event_mmap_page *userpg, u64=
 now)
> > +{
> > +       struct clock_read_data *rd;
> > +       unsigned int seq;
> > +       u64 ns;
> > +
> > +       userpg->cap_user_time =3D 0;
> > +       userpg->cap_user_time_zero =3D 0;
> > +       userpg->cap_user_time_short =3D 0;
> > +       userpg->cap_user_rdpmc =3D
> > +               !!(event->hw.flags & PERF_EVENT_FLAG_USER_READ_CNT);
> > +
> > +       userpg->pmc_width =3D 64;
> > +
>
> The counter width is 64 for cycle & instret. Other hpmcounter can have
> different width.
> This information should retrieved from counter info.

Yes, this is done in patch 7 when I adapt the perf SBI backend to
allow the user access.

>
> > +       do {
> > +               rd =3D sched_clock_read_begin(&seq);
> > +
> > +               userpg->time_mult =3D rd->mult;
> > +               userpg->time_shift =3D rd->shift;
> > +               userpg->time_zero =3D rd->epoch_ns;
> > +               userpg->time_cycles =3D rd->epoch_cyc;
> > +               userpg->time_mask =3D rd->sched_clock_mask;
> > +
> > +               /*
> > +                * Subtract the cycle base, such that software that
> > +                * doesn't know about cap_user_time_short still 'works'
> > +                * assuming no wraps.
> > +                */
> > +               ns =3D mul_u64_u32_shr(rd->epoch_cyc, rd->mult, rd->shi=
ft);
> > +               userpg->time_zero -=3D ns;
> > +
> > +       } while (sched_clock_read_retry(seq));
> > +
> > +       userpg->time_offset =3D userpg->time_zero - now;
> > +
> > +       /*
> > +        * time_shift is not expected to be greater than 31 due to
> > +        * the original published conversion algorithm shifting a
> > +        * 32-bit value (now specifies a 64-bit value) - refer
> > +        * perf_event_mmap_page documentation in perf_event.h.
> > +        */
> > +       if (userpg->time_shift =3D=3D 32) {
> > +               userpg->time_shift =3D 31;
> > +               userpg->time_mult >>=3D 1;
> > +       }
> > +
> > +       /*
> > +        * Internal timekeeping for enabled/running/stopped times
> > +        * is always computed with the sched_clock.
> > +        */
> > +       userpg->cap_user_time =3D 1;
> > +       userpg->cap_user_time_zero =3D 1;
> > +       userpg->cap_user_time_short =3D 1;
> > +}
> > diff --git a/drivers/perf/riscv_pmu.c b/drivers/perf/riscv_pmu.c
> > index ebca5eab9c9b..af69da268246 100644
> > --- a/drivers/perf/riscv_pmu.c
> > +++ b/drivers/perf/riscv_pmu.c
> > @@ -171,6 +171,8 @@ int riscv_pmu_event_set_period(struct perf_event *e=
vent)
> >
> >         local64_set(&hwc->prev_count, (u64)-left);
> >
> > +       perf_event_update_userpage(event);
> > +
> >         return overflow;
> >  }
> >
> > @@ -267,6 +269,9 @@ static int riscv_pmu_event_init(struct perf_event *=
event)
> >         hwc->idx =3D -1;
> >         hwc->event_base =3D mapped_event;
> >
> > +       if (rvpmu->event_init)
> > +               rvpmu->event_init(event);
> > +
> >         if (!is_sampling_event(event)) {
> >                 /*
> >                  * For non-sampling runs, limit the sample_period to ha=
lf
> > @@ -283,6 +288,39 @@ static int riscv_pmu_event_init(struct perf_event =
*event)
> >         return 0;
> >  }
> >
> > +static int riscv_pmu_event_idx(struct perf_event *event)
> > +{
> > +       struct riscv_pmu *rvpmu =3D to_riscv_pmu(event->pmu);
> > +
> > +       if (!(event->hw.flags & PERF_EVENT_FLAG_USER_READ_CNT))
> > +               return 0;
> > +
> > +       if (rvpmu->csr_index)
> > +               return rvpmu->csr_index(event) + 1;
> > +
> > +       return 0;
> > +}
> > +
> > +static void riscv_pmu_event_mapped(struct perf_event *event, struct mm=
_struct *mm)
> > +{
> > +       struct riscv_pmu *rvpmu =3D to_riscv_pmu(event->pmu);
> > +
> > +       if (rvpmu->event_mapped) {
> > +               rvpmu->event_mapped(event, mm);
> > +               perf_event_update_userpage(event);
> > +       }
> > +}
> > +
> > +static void riscv_pmu_event_unmapped(struct perf_event *event, struct =
mm_struct *mm)
> > +{
> > +       struct riscv_pmu *rvpmu =3D to_riscv_pmu(event->pmu);
> > +
> > +       if (rvpmu->event_unmapped) {
> > +               rvpmu->event_unmapped(event, mm);
> > +               perf_event_update_userpage(event);
> > +       }
> > +}
> > +
> >  struct riscv_pmu *riscv_pmu_alloc(void)
> >  {
> >         struct riscv_pmu *pmu;
> > @@ -307,6 +345,9 @@ struct riscv_pmu *riscv_pmu_alloc(void)
> >         }
> >         pmu->pmu =3D (struct pmu) {
> >                 .event_init     =3D riscv_pmu_event_init,
> > +               .event_mapped   =3D riscv_pmu_event_mapped,
> > +               .event_unmapped =3D riscv_pmu_event_unmapped,
> > +               .event_idx      =3D riscv_pmu_event_idx,
> >                 .add            =3D riscv_pmu_add,
> >                 .del            =3D riscv_pmu_del,
> >                 .start          =3D riscv_pmu_start,
> > diff --git a/include/linux/perf/riscv_pmu.h b/include/linux/perf/riscv_=
pmu.h
> > index 9f70d94942e0..1452c8af3b67 100644
> > --- a/include/linux/perf/riscv_pmu.h
> > +++ b/include/linux/perf/riscv_pmu.h
> > @@ -55,6 +55,10 @@ struct riscv_pmu {
> >         void            (*ctr_start)(struct perf_event *event, u64 init=
_val);
> >         void            (*ctr_stop)(struct perf_event *event, unsigned =
long flag);
> >         int             (*event_map)(struct perf_event *event, u64 *con=
fig);
> > +       void            (*event_init)(struct perf_event *event);
> > +       void            (*event_mapped)(struct perf_event *event, struc=
t mm_struct *mm);
> > +       void            (*event_unmapped)(struct perf_event *event, str=
uct mm_struct *mm);
> > +       uint8_t         (*csr_index)(struct perf_event *event);
> >
> >         struct cpu_hw_events    __percpu *hw_events;
> >         struct hlist_node       node;
> > --
> > 2.37.2
> >
>
>
> --
> Regards,
> Atish
