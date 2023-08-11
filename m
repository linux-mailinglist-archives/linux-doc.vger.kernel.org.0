Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59B6F7792CC
	for <lists+linux-doc@lfdr.de>; Fri, 11 Aug 2023 17:19:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236403AbjHKPTd (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 11 Aug 2023 11:19:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236420AbjHKPTX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 11 Aug 2023 11:19:23 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33E2F3594
        for <linux-doc@vger.kernel.org>; Fri, 11 Aug 2023 08:19:16 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3090d3e9c92so1868559f8f.2
        for <linux-doc@vger.kernel.org>; Fri, 11 Aug 2023 08:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1691767155; x=1692371955;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zADELGUWpGyqS4NPi0hC5rU83b70YaTQQPW65NChPlI=;
        b=PpOJJvvoZpHsn8jNHPEvN1nxCGms1gOAeA/MFe/y/MFBJC1k+8GHowKIfl2C661sWV
         Oj4csFcuW/OF0LpQ7tVVRV5X3PfQnx11ALct0kqhzNIVb+qQ1PDy8brCBGTvCCt/6BSy
         R1BPlxoc090EhGp8CeBhDwLVfUDSzemXaw3/9w2TLLI2xTeaqY8yri4zCXDjI3se0J98
         VwRIEMn3C01rkdVmAfQsmnbW0Aib/IWD9iWEsVQPElZuyH059lYcjrJcJilPApbcz+Y9
         n/xJGgmLgJ19EuCoRfmld0AUlanWpuf01WR1vAViEsa1d0ZNXOhVrBqAScsj6ZGAd7Nr
         JRLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691767155; x=1692371955;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zADELGUWpGyqS4NPi0hC5rU83b70YaTQQPW65NChPlI=;
        b=doGV/pNw2Z3fwhpaf4CWS2EqHD5ZTjelbrU7PoTgMdcriX8W9qoELuvDaNTuEPkLxG
         IXm6/B0MQnv9zQowxkhn4iEZMEBom/MkLlQEbx/RF5uluxMOpYAdauA+orCeHe1kytvJ
         EH9Mfqkm6YyXHlx3FUpjZVyhzZF0afaOa9jl6Xmxs9sC4+M+fOnPy0nXCNjbtGj6nyar
         iquVvxKEVmmlTVZneNoUCRSdobBthvOuU2At22VPrZEzvsx61qdzTwYRywULSSy8GmYT
         qU/fRBawMhMk2MA1l2yC1nCaR+ddEQPHNFBIkZlP/fYY0in5wGH7Q0XjCLDiLCRj3HCi
         sn2A==
X-Gm-Message-State: AOJu0YxbUN42ysYDF/cTvUKXOY18E/Y6AA+hcWodnpD/ciLnr7UawDNx
        YQTw1URMiKhXHM7F9kYYQ/ejf4HlZZ6Ua1RwVkvWjw==
X-Google-Smtp-Source: AGHT+IGFjoN11JGyqXQoLlR2unjvMbQFFXcuLgu03BXMw9TDy8mziYl5bcg3wpOPRTH/LMwE2VWfpYnTL/43MNjFeOQ=
X-Received: by 2002:a05:6000:507:b0:317:de6f:22cb with SMTP id
 a7-20020a056000050700b00317de6f22cbmr1834346wrf.2.1691767154667; Fri, 11 Aug
 2023 08:19:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230802080328.1213905-1-alexghiti@rivosinc.com>
 <20230802080328.1213905-10-alexghiti@rivosinc.com> <20230802-7c19a712ae071f68030ab5f2@orel>
In-Reply-To: <20230802-7c19a712ae071f68030ab5f2@orel>
From:   Alexandre Ghiti <alexghiti@rivosinc.com>
Date:   Fri, 11 Aug 2023 17:19:03 +0200
Message-ID: <CAHVXubhfbZsWx9mEFG-XMKgMY3-r=ROY=7gPK7H71WpyqXFwJQ@mail.gmail.com>
Subject: Re: [PATCH v6 09/10] tools: lib: perf: Implement riscv mmap support
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
        =?UTF-8?Q?R=C3=A9mi_Denis=2DCourmont?= <remi@remlab.net>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Atish Patra <atishp@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Andrew,

On Wed, Aug 2, 2023 at 11:32=E2=80=AFAM Andrew Jones <ajones@ventanamicro.c=
om> wrote:
>
> On Wed, Aug 02, 2023 at 10:03:27AM +0200, Alexandre Ghiti wrote:
> > riscv now supports mmaping hardware counters so add what's needed to
> > take advantage of that in libperf.
> >
> > Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> > Reviewed-by: Atish Patra <atishp@rivosinc.com>
> > ---
> >  tools/lib/perf/mmap.c | 66 +++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 66 insertions(+)
> >
> > diff --git a/tools/lib/perf/mmap.c b/tools/lib/perf/mmap.c
> > index 0d1634cedf44..2184814b37dd 100644
> > --- a/tools/lib/perf/mmap.c
> > +++ b/tools/lib/perf/mmap.c
> > @@ -392,6 +392,72 @@ static u64 read_perf_counter(unsigned int counter)
> >
> >  static u64 read_timestamp(void) { return read_sysreg(cntvct_el0); }
> >
> > +/* __riscv_xlen contains the witdh of the native base integer, here 64=
-bit */
> > +#elif defined(__riscv) && __riscv_xlen =3D=3D 64
> > +
> > +/* TODO: implement rv32 support */
> > +
> > +#define CSR_CYCLE    0xc00
> > +#define CSR_TIME     0xc01
> > +
> > +#define csr_read(csr)                                                \
> > +({                                                           \
> > +     register unsigned long __v;                             \
> > +             __asm__ __volatile__ ("csrr %0, %1"             \
> > +              : "=3Dr" (__v)                                   \
> > +              : "i" (csr) : );                               \
> > +              __v;                                           \
>
> nit: no need for the indentation or line wrap,
>
> ({
>         register unsigned long __v;
>         __asm__ __volatile__ ("csrr %0, %1" : "=3Dr" (__v) : "i" (csr));
>         __v;
> })
>
> Thanks,
> drew

Sorry I didn't answer sooner, I was busy finishing everything before
my holidays :) I won't have time to implement what you proposed, and
more importantly I don't have a setup for rv32 to test quickly. I'll
let Palmer decide if we can keep the TODO so that someone can do that
later on top of this series.

Thanks anyway for your reviews!

Alex
