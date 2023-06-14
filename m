Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8611718430
	for <lists+linux-doc@lfdr.de>; Wed, 31 May 2023 16:07:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237408AbjEaOHj (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 31 May 2023 10:07:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237496AbjEaOHW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 31 May 2023 10:07:22 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43B75E4E
        for <linux-doc@vger.kernel.org>; Wed, 31 May 2023 07:02:44 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-96fb45a5258so1018517766b.2
        for <linux-doc@vger.kernel.org>; Wed, 31 May 2023 07:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1685541687; x=1688133687;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xV0p1cILT3YTZiyLBW2gM8L29pLx3no3Au0rCN/fAsw=;
        b=gUF0PwXYe8VCgDpxtcKPgbxsSJTGNkqXOtSRlywJlkOjfIJ4RSdfa2UVuR44ynbHFw
         NKNlI0h8WPdCGNa+vUoV2SDzv0cNPY++y1O+tSLD8DyL+GNgS0+nkfGF0a6i3YJH+wNV
         x4Bp+2sGbToPR2nr3y4lOVew5cRUUf0c0FY3u/GtWzluqFr8GLUv2Nk+8WCV1g20INdO
         UOcEZhwWwmk9YeNFWiDVZ/Gl2IRFnDzPIDxnaFptnayBtNdH1D8DIsrPvDfelv48ixSU
         FJeUMC0Jl9ubMq0XnS+bntiTO2K2CBvylp+N3GZIEWWPJ2nplN2VeXy5NQg1vGhN3qCH
         j4pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685541687; x=1688133687;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xV0p1cILT3YTZiyLBW2gM8L29pLx3no3Au0rCN/fAsw=;
        b=dV7eHaaqyULp4qk+h22srraiJzmpPHBbI1J4TCJTfAbVQTV8rHrkh8X91tYhnlr3yJ
         q/+GIqNkZeuz5ZEtkGikg43+tA6EzeDTsBRFLbnBsrSYE5JONKsrZ6M2kqBY9mvfNqqP
         xwliZWx2HcFEy8o1Oz1fhUPzimZ4TSJIKq2wIgNZfguiybEtlckqHQtFhOkM48Dm9iBk
         qSqQODFv/EMsScJvHH8n0zoEzKKCRKLhBw7gzP4mSFF3F1SgETLB39uaqH3IwAkeBhJu
         XGh+ELlwyFL/FMFRQMKa4BMlJH60gQdQCRP586hzgY6zAN+MoRD32CdQI/Wn+6WYaETP
         KU6g==
X-Gm-Message-State: AC+VfDxGUF2pWWuVYqFQtdU+nuRFW9H00b2jnCmz2DOOhLrxyUr9cj2B
        NdEzE6keVN/Pl+WcZPLbarKPgw==
X-Google-Smtp-Source: ACHHUZ65P5pCqpKEk6KKg8Qqezxma5Yv53pnk0dfCkZMl5e4aOBfLb2ibQkhM3VpJR/whOzqfU8jYA==
X-Received: by 2002:a17:907:72cb:b0:974:1d8b:ca5e with SMTP id du11-20020a17090772cb00b009741d8bca5emr5212006ejc.14.1685541686880;
        Wed, 31 May 2023 07:01:26 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id e6-20020a170906504600b00965ac1510f8sm8966578ejk.185.2023.05.31.07.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 07:01:26 -0700 (PDT)
Date:   Wed, 31 May 2023 16:01:25 +0200
From:   Andrew Jones <ajones@ventanamicro.com>
To:     Alexandre Ghiti <alexghiti@rivosinc.com>
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
Subject: Re: [PATCH v2 03/10] riscv: Make legacy counter enum match the HW
 numbering
Message-ID: <20230531-ddb2d631e152526102f41d5e@orel>
References: <20230512085321.13259-1-alexghiti@rivosinc.com>
 <20230512085321.13259-4-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230512085321.13259-4-alexghiti@rivosinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, May 12, 2023 at 10:53:14AM +0200, Alexandre Ghiti wrote:
> RISCV_PMU_LEGACY_INSTRET used to be set to 1 whereas the offset of this
> hardware counter from CSR_CYCLE is actually 2: make this offset match the
> real hw offset so that we can directly expose those values to userspace.
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  drivers/perf/riscv_pmu_legacy.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/perf/riscv_pmu_legacy.c b/drivers/perf/riscv_pmu_legacy.c
> index ca9e20bfc7ac..0d8c9d8849ee 100644
> --- a/drivers/perf/riscv_pmu_legacy.c
> +++ b/drivers/perf/riscv_pmu_legacy.c
> @@ -12,8 +12,11 @@
>  #include <linux/perf/riscv_pmu.h>
>  #include <linux/platform_device.h>
>  
> -#define RISCV_PMU_LEGACY_CYCLE		0
> -#define RISCV_PMU_LEGACY_INSTRET	1
> +enum {
> +	RISCV_PMU_LEGACY_CYCLE,
> +	RISCV_PMU_LEGACY_TIME,
> +	RISCV_PMU_LEGACY_INSTRET
> +};

I guess this doesn't hurt, since these are just indices internal to this
driver, but it's a bit odd to also have a RISCV_PMU_LEGACY_TIME, when
the driver is only for cycle and instret, as its Kconfig help text says.

Thanks,
drew
