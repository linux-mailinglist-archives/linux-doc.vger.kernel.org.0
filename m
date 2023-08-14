Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D85077BE54
	for <lists+linux-doc@lfdr.de>; Mon, 14 Aug 2023 18:45:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232100AbjHNQpT (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 14 Aug 2023 12:45:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231202AbjHNQoo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 14 Aug 2023 12:44:44 -0400
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com [IPv6:2607:f8b0:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2015E5F
        for <linux-doc@vger.kernel.org>; Mon, 14 Aug 2023 09:44:42 -0700 (PDT)
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-3492e05be7cso2385ab.0
        for <linux-doc@vger.kernel.org>; Mon, 14 Aug 2023 09:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692031482; x=1692636282;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4KXPrAStR12aDL51nwQABf9ix/0Q7n4sXO4NMniW8cc=;
        b=UGhkLfl1MElLYpBWre4N8rfcTTkCn+BCtzJP1Nf4Exoi4CGx/rVX0MaiPDqH5fjFX/
         fNBAOFxqWn5N9BkZlAGEe/DQtzNjtloHnJMSagB2iEK9nY6PjnKurmNHor1vVk5gMHCK
         63CVsWAsCMWpwIL7HrQqeEANJ4aJ3Nib/M4K6ELwA0R2d31+XJEtD/4hp5EzRzAvg/47
         VvM7xy9dz1Am+eMNLMhyHIYGbIR7wbaoMX+15xM4uBEXx0HuKUu8M7wDvV4nEanp/qOt
         CfCZy9aP54tqKIE1NH4+3mB1NPcv4tMGo6AN16O4xS4WdFAbJXY1p5getsdz1VQWCI6b
         j3EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692031482; x=1692636282;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4KXPrAStR12aDL51nwQABf9ix/0Q7n4sXO4NMniW8cc=;
        b=irGTIHnznrsAMCrCIi9a+6oKJ8zhX7epl6HmvjQn7k7Xd28HvwTM/WaO00jALGgY8z
         C9Inbp2iWJo0ly8Ppoe31znfRciVq6BNILasYxmdGa0cMRmRcOn+sX/OkUgtfXiKUUQy
         kwYNNwQZHyLhEaaEOBme3ea/5h++AeyeFiwv916M4Mki4x+8iuuArcfscfeh9l1K8WPn
         cLOVwMCjCBZysRDXoPUvToBzzT9ftRC93ozeMZiRL9e86dyGaaiNhZlIZRgfGKjrT1XT
         5pgicx+2lXmZFvPPexHeY8RQ3EVIGVVk4PZ6numgYb/Ip80SzOnIw901IK5GshjQ0tkn
         fZtw==
X-Gm-Message-State: AOJu0Yy2hH4+Qs5PBw1oshckR01kydx3U3cLPBXvy+tE5DmkYX+SCyT+
        fPm8yK0hV1rY5eOR6+vxCfgdEZuBy4HzqBoIPoi8ag==
X-Google-Smtp-Source: AGHT+IFOzjGtKiWLy03OiyHrBN0kpiXV4ZOPGD8JA08f6Z8vU3wqmAQpLCW07oLHz7zD6SI66eEdSE0XZjRV20/5KQE=
X-Received: by 2002:a05:6e02:1b86:b0:349:3c79:e634 with SMTP id
 h6-20020a056e021b8600b003493c79e634mr697261ili.17.1692031481932; Mon, 14 Aug
 2023 09:44:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230802080328.1213905-1-alexghiti@rivosinc.com> <20230802080328.1213905-10-alexghiti@rivosinc.com>
In-Reply-To: <20230802080328.1213905-10-alexghiti@rivosinc.com>
From:   Ian Rogers <irogers@google.com>
Date:   Mon, 14 Aug 2023 09:44:29 -0700
Message-ID: <CAP-5=fWZ8GDBn3fUUzjwknLq4KZV4tepX03oDn092zzboC8Dgw@mail.gmail.com>
Subject: Re: [PATCH v6 09/10] tools: lib: perf: Implement riscv mmap support
To:     Alexandre Ghiti <alexghiti@rivosinc.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Atish Patra <atishp@atishpatra.org>,
        Anup Patel <anup@brainfault.org>,
        Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
        Andrew Jones <ajones@ventanamicro.com>,
        =?UTF-8?Q?R=C3=A9mi_Denis=2DCourmont?= <remi@remlab.net>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Atish Patra <atishp@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Aug 2, 2023 at 1:13=E2=80=AFAM Alexandre Ghiti <alexghiti@rivosinc.=
com> wrote:
>
> riscv now supports mmaping hardware counters so add what's needed to
> take advantage of that in libperf.
>
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
>  tools/lib/perf/mmap.c | 66 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 66 insertions(+)
>
> diff --git a/tools/lib/perf/mmap.c b/tools/lib/perf/mmap.c
> index 0d1634cedf44..2184814b37dd 100644
> --- a/tools/lib/perf/mmap.c
> +++ b/tools/lib/perf/mmap.c
> @@ -392,6 +392,72 @@ static u64 read_perf_counter(unsigned int counter)
>
>  static u64 read_timestamp(void) { return read_sysreg(cntvct_el0); }
>
> +/* __riscv_xlen contains the witdh of the native base integer, here 64-b=
it */
> +#elif defined(__riscv) && __riscv_xlen =3D=3D 64
> +
> +/* TODO: implement rv32 support */
> +
> +#define CSR_CYCLE      0xc00
> +#define CSR_TIME       0xc01
> +
> +#define csr_read(csr)                                          \
> +({                                                             \
> +       register unsigned long __v;                             \
> +               __asm__ __volatile__ ("csrr %0, %1"             \
> +                : "=3Dr" (__v)                                   \
> +                : "i" (csr) : );                               \
> +                __v;                                           \
> +})
> +
> +static unsigned long csr_read_num(int csr_num)
> +{
> +#define switchcase_csr_read(__csr_num, __val)           {\
> +       case __csr_num:                                 \
> +               __val =3D csr_read(__csr_num);            \
> +               break; }
> +#define switchcase_csr_read_2(__csr_num, __val)         {\
> +       switchcase_csr_read(__csr_num + 0, __val)        \
> +       switchcase_csr_read(__csr_num + 1, __val)}
> +#define switchcase_csr_read_4(__csr_num, __val)         {\
> +       switchcase_csr_read_2(__csr_num + 0, __val)      \
> +       switchcase_csr_read_2(__csr_num + 2, __val)}
> +#define switchcase_csr_read_8(__csr_num, __val)         {\
> +       switchcase_csr_read_4(__csr_num + 0, __val)      \
> +       switchcase_csr_read_4(__csr_num + 4, __val)}
> +#define switchcase_csr_read_16(__csr_num, __val)        {\
> +       switchcase_csr_read_8(__csr_num + 0, __val)      \
> +       switchcase_csr_read_8(__csr_num + 8, __val)}
> +#define switchcase_csr_read_32(__csr_num, __val)        {\
> +       switchcase_csr_read_16(__csr_num + 0, __val)     \
> +       switchcase_csr_read_16(__csr_num + 16, __val)}
> +
> +       unsigned long ret =3D 0;
> +
> +       switch (csr_num) {
> +       switchcase_csr_read_32(CSR_CYCLE, ret)
> +       default:
> +               break;
> +       }
> +
> +       return ret;
> +#undef switchcase_csr_read_32
> +#undef switchcase_csr_read_16
> +#undef switchcase_csr_read_8
> +#undef switchcase_csr_read_4
> +#undef switchcase_csr_read_2
> +#undef switchcase_csr_read
> +}
> +
> +static u64 read_perf_counter(unsigned int counter)
> +{
> +       return csr_read_num(CSR_CYCLE + counter);
> +}
> +
> +static u64 read_timestamp(void)
> +{
> +       return csr_read_num(CSR_TIME);
> +}
> +
>  #else
>  static u64 read_perf_counter(unsigned int counter __maybe_unused) { retu=
rn 0; }
>  static u64 read_timestamp(void) { return 0; }
> --
> 2.39.2
>
