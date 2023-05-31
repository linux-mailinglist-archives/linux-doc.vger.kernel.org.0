Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1696671881B
	for <lists+linux-doc@lfdr.de>; Wed, 31 May 2023 19:09:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229570AbjEaRJS (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 31 May 2023 13:09:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230149AbjEaRJO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 31 May 2023 13:09:14 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C71CE18D
        for <linux-doc@vger.kernel.org>; Wed, 31 May 2023 10:09:09 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2af30a12e84so66508381fa.0
        for <linux-doc@vger.kernel.org>; Wed, 31 May 2023 10:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1685552948; x=1688144948;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jQ4u7E+2pu1MUIvR5vq40l8aNtL/U44SVHTVaiFl+ZE=;
        b=dpkjmQJu6nzfEvoWvKrVmVKQFGK9PktpjQr+7FUyc7TmLV2jDpBImI3W6D2jWa8bxQ
         l5hJd7cLgyNz7BZdZU1OQXZKfXRkX4bD9w1XsNtr411FOCbaa6RddJGelQbb9wilkc9y
         DMWXRHS43Ov4MPvOjEalEiIKCv7yNQTvhrIlI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685552948; x=1688144948;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jQ4u7E+2pu1MUIvR5vq40l8aNtL/U44SVHTVaiFl+ZE=;
        b=USxwgN9IEGgV2Uc6e6mEzxGNqAEzUuWL0NlERsCOjjXP6W/En1tRhe7aGJsAF+Zw9M
         ISnZr0BhFO7JM1ZnMpv7Xk9+GcO3cWxj3Au1JBugSMIQ+wsfwaWoAt21HtoavdYrD15O
         viAyw+GEBxxl7yNz+KIk+DdSN/eUj6IM2rc7hIb4qfmZBg9lWxMpVzBAE2uK0Hg5lBsP
         ux7yeFTQDX7Ddjta8bhPxiN0YZH6Ap9z9dEs8QfQHeBF1U54bgGs/xikuToL/zceFS8H
         7rlkaiFxwbY35Bs3dWlVheOZBEn+PT2KqQHgp6i4HvBc1Cr4R2zqyKbzhOiXvLkRCsqg
         FP0A==
X-Gm-Message-State: AC+VfDw3brTsOqq4XuzWNP9FmJbIXUbOTBVsyA1xkDquHyEyRCX2om4U
        PN/XvuyW/uyr0y3/UZCdFxCGv+v8DQPwQfb1VDZB
X-Google-Smtp-Source: ACHHUZ4Yj35TR6Xj5jR1jPOnnSx23dqmIilZiSg9iS5EDhMCva7jreZ1DdDVMqkhgJshkIN4lTSdR5pmfFIPgmIgll4=
X-Received: by 2002:a2e:8189:0:b0:2ad:ba85:9f7 with SMTP id
 e9-20020a2e8189000000b002adba8509f7mr3527397ljg.22.1685552947968; Wed, 31 May
 2023 10:09:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230512085321.13259-1-alexghiti@rivosinc.com>
 <20230512085321.13259-9-alexghiti@rivosinc.com> <20230531-0707dc46df8078cd92711314@orel>
In-Reply-To: <20230531-0707dc46df8078cd92711314@orel>
From:   Atish Patra <atishp@atishpatra.org>
Date:   Wed, 31 May 2023 10:08:56 -0700
Message-ID: <CAOnJCU+sda3UaOvC3Si4TT3nvibUSEOwmx94eQK-9ouvG4=ovQ@mail.gmail.com>
Subject: Re: [PATCH v2 08/10] Documentation: admin-guide: Add riscv sysctl_perf_user_access
To:     Andrew Jones <ajones@ventanamicro.com>
Cc:     Alexandre Ghiti <alexghiti@rivosinc.com>,
        Jonathan Corbet <corbet@lwn.net>,
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
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, May 31, 2023 at 8:07=E2=80=AFAM Andrew Jones <ajones@ventanamicro.c=
om> wrote:
>
> On Fri, May 12, 2023 at 10:53:19AM +0200, Alexandre Ghiti wrote:
> > riscv now uses this sysctl so document its usage for this architecture.
> >
> > Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> > ---
> >  Documentation/admin-guide/sysctl/kernel.rst | 24 +++++++++++++++++----
> >  1 file changed, 20 insertions(+), 4 deletions(-)
> >
> > diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentatio=
n/admin-guide/sysctl/kernel.rst
> > index 4b7bfea28cd7..93cd518ca94b 100644
> > --- a/Documentation/admin-guide/sysctl/kernel.rst
> > +++ b/Documentation/admin-guide/sysctl/kernel.rst
> > @@ -941,16 +941,32 @@ enabled, otherwise writing to this file will retu=
rn ``-EBUSY``.
> >  The default value is 8.
> >
> >
> > -perf_user_access (arm64 only)
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +perf_user_access (arm64 and riscv only)
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +Controls user space access for reading perf event counters.
> >
> > -Controls user space access for reading perf event counters. When set t=
o 1,
> > -user space can read performance monitor counter registers directly.
> > +arm64
> > +=3D=3D=3D=3D=3D
> >
> >  The default value is 0 (access disabled).
> > +When set to 1, user space can read performance monitor counter registe=
rs
> > +directly.
> >
> >  See Documentation/arm64/perf.rst for more information.
> >
> > +riscv
> > +=3D=3D=3D=3D=3D
> > +
> > +When set to 0, user access is disabled.
> > +
> > +When set to 1, user space can read performance monitor counter registe=
rs
> > +directly only through perf, any direct access without perf interventio=
n will
> > +trigger an illegal instruction.
> > +
> > +The default value is 2, which enables legacy mode (user space has dire=
ct
> > +access to cycle, time and insret CSRs only). Note that this legacy val=
ue
> > +is deprecated and will be removed once all userspace applications are =
fixed.
>
> All modes can access the time CSR so I'm not sure if it should be pointed
> out here as if it's an exception. Maybe we shouldn't point it out at all
> or we should point it out for all three?
>

Valid point. Thanks Drew.
In the future, we probably want to support prctl
(PR_SET_TSC/SECCOMP_MODE_STRICT) to disable even
time CSR access. I don't think there is any use case for it right now.

> Thanks,
> drew



--=20
Regards,
Atish
