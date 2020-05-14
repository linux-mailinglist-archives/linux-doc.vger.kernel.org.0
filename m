Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E04021D2B53
	for <lists+linux-doc@lfdr.de>; Thu, 14 May 2020 11:25:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726216AbgENJZC (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 14 May 2020 05:25:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726200AbgENJZC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 14 May 2020 05:25:02 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD0F8C061A0C
        for <linux-doc@vger.kernel.org>; Thu, 14 May 2020 02:25:01 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id nv1so2214911ejb.0
        for <linux-doc@vger.kernel.org>; Thu, 14 May 2020 02:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unikie-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=nZk+31pniUIu3YX3HPBnqYE7/FWix23XhFWqIs5bURU=;
        b=1vlobRK/LZFu0W4DpctQc74BE0OZggxftWAYyg9+kMh9UUhJxpacFHkwwXINlUM0Ql
         Y9vyMrrE3Zd9KrKDr8izLnm8GsKai/wdW6x37oyhAk1n++lI2+CC6pvBswySW+5aoS77
         Xf5Q+GeknU8mke0serBKon4AuRd0lNJUyw87yLSMoyWgOJy1v4Pi9GyDpfmJd4LKc+KI
         gWRFWYp81EitWqScQBJ3IiapSvRNmLgKDryr6r+0bmMR/IO1dZBNd33L6bylGXS5A3Lf
         556w5JsmiDWo9HVAZqJAIp2mIfTjiW447zFX4VD1IPk0mzhZvrWTitSEIV9ifw9HRe28
         D8mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=nZk+31pniUIu3YX3HPBnqYE7/FWix23XhFWqIs5bURU=;
        b=sBNXk3hh+hLXYPdiqOZXB+3eCv4DmiC2yVdCxlTxtkX5T+b2EiNCYNo8Ppl3phOID7
         fOLdSRe7Zt3/Sq4kC4T8yJOEueRlvf0mE3DtnHhQJELw0k3bMOstgyo7Mmo8EHWuo838
         Y+LJswLoeKOu8g9ebrw2cU8odWGHEJm1W3q0iD6t9pRRlUIvMJhty/nY9TbnYW6dqMoN
         bYNVEPWG/Fa8g8w9dw6+Mnf9jxaMnWQjTo2fPHwYYPL6jNHtjkdpH8SrU0kb3ZJtczz8
         IgwZ7eSo6opzJPmNjU+3B+XVtnJ7a2wVDIs8vyOb2MLsVORafZJIGrFTdl3bQvzUekjL
         k0Ug==
X-Gm-Message-State: AOAM530BGCHCE6HjoTBFpXpHb7gqNIj70LmAqOZVCriWxV8gffgGmJcv
        arwnZNzuvEbGKPeKmuO/WqjVJHldfGyPI8uXqGM8UQ==
X-Google-Smtp-Source: ABdhPJxPW+ABXGCY3746+LcRvy1Lr3kAoSq4RmTxoSbROeKhyQWI13KRQosDbdmIB3eiu+igi9m/ADKsnI2Wvh3vob0=
X-Received: by 2002:a17:906:4e8a:: with SMTP id v10mr2808640eju.63.1589448300598;
 Thu, 14 May 2020 02:25:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200513134338.19688-1-John.Mathew@unikie.com>
 <20200513134338.19688-4-John.Mathew@unikie.com> <jhjy2pwq6e2.mognet@arm.com>
In-Reply-To: <jhjy2pwq6e2.mognet@arm.com>
From:   John Mathew <john.mathew@unikie.com>
Date:   Thu, 14 May 2020 12:24:49 +0300
Message-ID: <CAJz2qXn+z3va-NuqXLfdgaG6Ah3S_f2SijmL7Jn96F-8SW_ndw@mail.gmail.com>
Subject: Re: [RFC PATCH v4 2/3] docs: scheduler: Add scheduler overview documentation
To:     Valentin Schneider <valentin.schneider@arm.com>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        corbet@lwn.net, mingo@redhat.com, peterz@infradead.org,
        juri.lelli@redhat.com,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        rostedt@goodmis.org, Benjamin Segall <bsegall@google.com>,
        mgorman@suse.de, bristot@redhat.com, tsbogend@alpha.franken.de,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>, x86@kernel.org,
        linux-mips@vger.kernel.org, tglx@linutronix.de,
        mostafa.chamanara@gmail.com, willy@infradead.org,
        Mostafa Chamanara <mostafa.chamanara@basemark.com>,
        Oleg Tsymbal <oleg.tsymbal@unikie.com>,
        Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, May 13, 2020 at 5:03 PM Valentin Schneider
<valentin.schneider@arm.com> wrote:
>
>
> On 13/05/20 14:43, john mathew wrote:
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> > +Capacity-Aware Scheduling
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> > +
>
> Thanks for taking a jab at this. At a glance it looks okay, with one
> comment below.
>
> FWIW I still intend to write a more pamphlet-sized thing, I'll toss
> something out in the coming weeks - depending on where this goes, I might
> base it on this.
>
> > +Scheduling load balancing on Asymmetric Multiprocessor systems was imp=
roved
> > +through the introduction of Capacity-Aware Scheduling. It identifies t=
he
> > +most efficient CPU to assign a task based on its capacity. This capaci=
ty
> > +may be asymmetric due to heterogeneous computing architecture such
> > +as ARM big.LITTLE. Scheduler gets information about asymmetric capacit=
ies
> > +when the scheduler domain hierarchy is built using build_sched_domains=
().
> > +CPU capacities are provided to the scheduler topology code through the
> > +architecture specific implementation of the arch_scale_cpu_capacity().
> > +The SD_ASYM_CPUCAPACITY flag is set by the scheduler topology for a do=
main
> > +in the hierarchy where all CPU capacities are visible for any cpu's po=
int
> > +of view on asymmetric CPU capacity systems. The scheduler can then tak=
e
> > +capacity asymmetry into account when load balancing.
> > +
> > +Initial CPU capacities are derived from the Device Tree and CPU freque=
ncy.
> > +For RISC-V & ARM64 it is done in drivers/base/arch_topology.c. A cpu-m=
ap
> > +device tree is parsed to obtain the cpu topology and the initial CPU c=
apacity
> > +is set using the CPUFreq subsystem. A callback is registered to the CP=
UFreq
> > +subsystem to rebuild sched_domains when CPU frequency changes.
> > +
>
> We don't rebuild domains on frequency changes (that would be ludicrous!),
> rather we do that on policy changes. It's mostly because we need to wait
> for cpufreq to be loaded before having a complete view over the capacitie=
s
> of the CPUs (which is a mix of =C2=B5arch and frequencies), i.e. we need =
to
> rebuild the SD's again once cpufreq comes up.
Fixed in v5 of the patchset.
Thanks
