Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D96C7673FD
	for <lists+linux-doc@lfdr.de>; Fri, 28 Jul 2023 19:54:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229874AbjG1Ryc (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 28 Jul 2023 13:54:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233578AbjG1Rya (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 28 Jul 2023 13:54:30 -0400
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com [IPv6:2607:f8b0:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F21A3C26
        for <linux-doc@vger.kernel.org>; Fri, 28 Jul 2023 10:54:14 -0700 (PDT)
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-346099c6f43so8005ab.0
        for <linux-doc@vger.kernel.org>; Fri, 28 Jul 2023 10:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690566854; x=1691171654;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G9AAgjBmyD799jjvKnH8ZnrCuWVbFIsU8j6BR3fo8nI=;
        b=IFMJ07Jo5MYfc9jdSIkyL82QFEQawGu9euKN/ce2G+5PIx7+8KWxnLSHh3Gx9HO21J
         4w8Kpw2y8qhWKSAJInH+bR9CThehc0Y7cOfD+MTByzzM/5BLVWzh1IWBCm/iBaBgTh9R
         TTGw3M5cIz6sGBFiX5FYij5Ev94R6UNdOAlIZWq+34Lb76z+T791T2SSNcp3mkHi5WMK
         FmTcRrU4bNODUY54dsMvzb7wYn9nWETgzSbQS6mazUnuxsTBfk0AqYpSf97+JPE0qmcJ
         HG8wpPiIfPRYEyB3j1d+PjRP6zV+9iqjFl8ilKpJ0Z0I/T19cOCa8S70OzmDe2qXRkmr
         460w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690566854; x=1691171654;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G9AAgjBmyD799jjvKnH8ZnrCuWVbFIsU8j6BR3fo8nI=;
        b=Xn4NgkgcBZOLzbnA+E1k510KX4+EXhmwyXmyA+N9jYJM6ESIfH240FLnyMG5Zsobgv
         0SziF/mjn+c4cCtm5yotuisRgkQ0moM6nVkUlYgh4PZ6dnPe2IqPxeK06o+95zLjg7IW
         FtNFbH98rWJKTs3GEVaihKztK4MmcjFJqapJ4iM7NbXjsFDUufjs0nqzaI7QFD5Uy2zt
         4zm4lFTa56MyPQQrF66N/Ab1UYAmGcV/0Ef1UIPpKHa0n4PpZFydLoipGWpqs3XW1GTM
         9EB5C0EakHwIVmnb+EvOqlpJ2YJaGzwaruzd7tqoTTMxVYfJXpVnkw2/C2P/6J9nHqVH
         jfAw==
X-Gm-Message-State: ABy/qLaj3z+B0YsyL9OyaadNaj7wu5K4nlC2XHeVOw1AlUfmngxif4y7
        HmvStezqC2b4fbHP87Lsz7pcduFYgePKfnwnwECh3A==
X-Google-Smtp-Source: APBJJlH/oBIkVtQyGOMeYkPz/oJFbJ6Z643p7i54IVii3VDnaU3OEiAeI27Lip+S4Yd4zw51VVx8Ytw/k/UXxrnWNE0=
X-Received: by 2002:a05:6e02:156d:b0:348:d8e1:50c2 with SMTP id
 k13-20020a056e02156d00b00348d8e150c2mr11186ilu.15.1690566853890; Fri, 28 Jul
 2023 10:54:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230727141428.962286-1-alexghiti@rivosinc.com> <20230727141428.962286-11-alexghiti@rivosinc.com>
In-Reply-To: <20230727141428.962286-11-alexghiti@rivosinc.com>
From:   Ian Rogers <irogers@google.com>
Date:   Fri, 28 Jul 2023 10:54:02 -0700
Message-ID: <CAP-5=fXvqJk9hA51pDSXodEWSP4DzN+RJ1scpyzJOrxk2w5kjg@mail.gmail.com>
Subject: Re: [PATCH v4 10/10] perf: tests: Adapt mmap-basic.c for riscv
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
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jul 27, 2023 at 7:30=E2=80=AFAM Alexandre Ghiti <alexghiti@rivosinc=
.com> wrote:
>
> riscv now supports mmaping hardware counters to userspace so adapt the te=
st
> to run on this architecture.
>
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>
> ---
>  tools/perf/tests/mmap-basic.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tools/perf/tests/mmap-basic.c b/tools/perf/tests/mmap-basic.=
c
> index e68ca6229756..f5075ca774f8 100644
> --- a/tools/perf/tests/mmap-basic.c
> +++ b/tools/perf/tests/mmap-basic.c
> @@ -284,7 +284,7 @@ static struct test_case tests__basic_mmap[] =3D {
>                          "permissions"),
>         TEST_CASE_REASON("User space counter reading of instructions",
>                          mmap_user_read_instr,
> -#if defined(__i386__) || defined(__x86_64__) || defined(__aarch64__)
> +#if defined(__i386__) || defined(__x86_64__) || defined(__aarch64__) || =
__riscv_xlen =3D=3D 64

Same comment relating to the guard, why not defined(__riscv) ?

Thanks,
Ian

>                          "permissions"
>  #else
>                          "unsupported"
> @@ -292,7 +292,7 @@ static struct test_case tests__basic_mmap[] =3D {
>                 ),
>         TEST_CASE_REASON("User space counter reading of cycles",
>                          mmap_user_read_cycles,
> -#if defined(__i386__) || defined(__x86_64__) || defined(__aarch64__)
> +#if defined(__i386__) || defined(__x86_64__) || defined(__aarch64__) || =
__riscv_xlen =3D=3D 64
>                          "permissions"
>  #else
>                          "unsupported"
> --
> 2.39.2
>
