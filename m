Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3C977458A4
	for <lists+linux-doc@lfdr.de>; Mon,  3 Jul 2023 11:45:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231140AbjGCJpV (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 3 Jul 2023 05:45:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231135AbjGCJpS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 3 Jul 2023 05:45:18 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B034E5B
        for <linux-doc@vger.kernel.org>; Mon,  3 Jul 2023 02:45:12 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3fbc244d3a8so42661195e9.2
        for <linux-doc@vger.kernel.org>; Mon, 03 Jul 2023 02:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688377511; x=1690969511;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rYrikqEYLAou4pnYR2Aq6pNjv0Vdk8l8/0T1K6ojTeg=;
        b=2tXF85BjqNH/+g3RjKxu5KayJ5sZPo7Hf7CG6Rs2NqvX6hmkBrEvQuTxNo1lYNPDKz
         KV4Z4oA24Y7BjKB1xYxChMdvy2tp1kH/12HdWcz5qmLpAZIBPVOGp9zwKIIzZGmg8rQu
         fOe4HZ+2Gn94vJCDnNBMYLltoSeL+WUWEuLSdbeIYaqbbFxE0TAHBIsbsNejzaTJpM67
         /wcm95xGEECPHfT6Cd4x3kpsl+CaCDtNBghXs/fIVeMZJ/s5Uay3fW9SHeoLBOKLLmtJ
         el1gtaSLGON+Ih6l8SaFeLZm9ybTSF/jxT6c1RT6i5Rv0//NC/vZ2yPsP3Zh+aURel4c
         EwJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688377511; x=1690969511;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rYrikqEYLAou4pnYR2Aq6pNjv0Vdk8l8/0T1K6ojTeg=;
        b=IH3SEtEcnu3Qqt2age7zp/RXcjwYRxu8HU0+uaL9liRprg9c+lYCcE0r779owxhg6c
         9BezW0fHg4IMFFYILemgU1Aeu0m21XRHgEnnvQlotqtQLgJAx7bT08URZpqKVS1YM35j
         WRilBYABuBcQz4FUcp6xrY5FGZ5hqZO7NYyEj1+JwTP4DpkUgbRjhEQaW6aIocvfE4Lz
         30W0x+iJHowOeMNqucuyor12co2CEHgTbvbcuMUHeBgGRuIhAa+okt6lvaNK6J6yLnwG
         9vXklAN9GoYwkEkY3DHtgxNgf/156KAe83s2jaDzK3f1KhuN/PxpY+x+hXrH/Xqx3rSL
         MlWQ==
X-Gm-Message-State: AC+VfDyBMwEt/tVnSAcZzyER5AmwkDBL3t63QUW475MCHMjQxsVTarPi
        kgmVkKOK6JLYUZZ4QX0UON/3JYywYECEtnA6xS4VJQ==
X-Google-Smtp-Source: ACHHUZ68NLQzXNzGeeF7k2ifsyB3gqwunDPHxpAfWYOPgJw1xDOPD6ZNy0ihSYOsi4YSHukqztCwt/Z/vGICPKx+RDA=
X-Received: by 2002:a05:600c:3787:b0:3fa:8c67:fc43 with SMTP id
 o7-20020a05600c378700b003fa8c67fc43mr8267813wmr.32.1688377510814; Mon, 03 Jul
 2023 02:45:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230630083013.102334-1-alexghiti@rivosinc.com>
 <20230630083013.102334-9-alexghiti@rivosinc.com> <20230630-f714cc46ee65cc65318f2ada@orel>
In-Reply-To: <20230630-f714cc46ee65cc65318f2ada@orel>
From:   Alexandre Ghiti <alexghiti@rivosinc.com>
Date:   Mon, 3 Jul 2023 11:45:00 +0200
Message-ID: <CAHVXubh97QyXbiQ6wcaEOkPBKJwzCzm77FgQ+eHEYFFEQyToJw@mail.gmail.com>
Subject: Re: [PATCH v3 08/10] Documentation: admin-guide: Add riscv sysctl_perf_user_access
To:     Andrew Jones <ajones@ventanamicro.com>
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
        Atish Patra <atishp@atishpatra.org>,
        Anup Patel <anup@brainfault.org>,
        Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jun 30, 2023 at 1:16=E2=80=AFPM Andrew Jones <ajones@ventanamicro.c=
om> wrote:
>
> On Fri, Jun 30, 2023 at 10:30:11AM +0200, Alexandre Ghiti wrote:
> > riscv now uses this sysctl so document its usage for this architecture.
> >
> > Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> > ---
> >  Documentation/admin-guide/sysctl/kernel.rst | 26 +++++++++++++++++----
> >  1 file changed, 22 insertions(+), 4 deletions(-)
> >
> > diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentatio=
n/admin-guide/sysctl/kernel.rst
> > index d85d90f5d000..c376692b372b 100644
> > --- a/Documentation/admin-guide/sysctl/kernel.rst
> > +++ b/Documentation/admin-guide/sysctl/kernel.rst
> > @@ -941,16 +941,34 @@ enabled, otherwise writing to this file will retu=
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
>
> Should add a blank line here.

Done, thanks

>
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
>
> Remove 'directly only'
>
> (It can't be both "direct" and "through" at the same time.)
>
> > +trigger an illegal instruction.
> > +
> > +The default value is 2,
>
> This is no longer true.

Damn, sorry about that.

>
> > which enables legacy mode (user space has direct
> > +access to cycle and insret CSRs only). Note that this legacy value
> > +is deprecated and will be removed once all userspace applications are =
fixed.
> > +
> > +Note that the time CSR is for now always accessible to all modes.
>
> s/always accessible/always directly accessible/
>
> Also, remove 'for now'. While we may change this in the future, I'm not
> sure if the 'for now' helps much. Maybe a "This may change in the future.=
"
> type of sentence? Or, just nothing (for now :-) and we'll modify this
> document if it changes later.

I won't say anything about the future, thanks!

I also harmonized the "user space" and "userspace" in this document
with what arm64 does.

Thanks

>
> Thanks,
> drew
>
> >
> >  pid_max
> >  =3D=3D=3D=3D=3D=3D=3D
> > --
> > 2.39.2
> >
