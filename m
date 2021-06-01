Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37FCE3973E0
	for <lists+linux-doc@lfdr.de>; Tue,  1 Jun 2021 15:10:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233064AbhFANMW (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 1 Jun 2021 09:12:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233960AbhFANMV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 1 Jun 2021 09:12:21 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9155BC061574
        for <linux-doc@vger.kernel.org>; Tue,  1 Jun 2021 06:10:38 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id i10so9668008lfj.2
        for <linux-doc@vger.kernel.org>; Tue, 01 Jun 2021 06:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2HMwOvv9SR1W/bxoGgWg4cUvDlXOdWAGJD6u6Soh2LI=;
        b=dbKkzGC+kyTfj8xkuiVATzIZWLdWylr7YqjmIRUKiRwvW3/1M6gJYBUsW3dK7S0bXu
         FqFWqmPMGA0y8rsJ1/+ah/cm7sFmkDjDzhbEak0Wx3IWXevn9FcHcJq35gObMAsqAtR1
         W2npntuSrwW9VVodfrEydfxGYkcM5xud3PDWBv+/eB5cRbZuLf/1zuuszth0DY8V1y6u
         Qwvq4KEtQ4p2mjlJPKIofZttldW7Ddf9YgPEXFKJJdRISBIzmy6x8Cp5u7Gl5acd3rUK
         s3hQP7RwlFJRSf/IACqdCfuD/8P1lfdiUEzgBcYZKr5totLGkj677otDNsAZqV5iQCMa
         +HcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2HMwOvv9SR1W/bxoGgWg4cUvDlXOdWAGJD6u6Soh2LI=;
        b=OjP2CBTC6JXWkCiHzfDw1wdM8rnOhCeVE3GSb8VdbS1YyjmuvUQm1nJ1yTdlt0MKbW
         r/XTpfZv6XWR6cNSKqLonoX97muOWal6iu/lVLWAwJuOYLcn9JKCNtss/99Xj0T25Ndf
         wSbvNrJHo451bdtin1esi3XxaDbq0WsrNJFvJuBRsDfMEF9sLV3Ym12/PuQISrcQ8Jpo
         WZRhdXaUxmmD4LlU90HjJZKVxV43XjNEcLd3b9twDUL2u/7FxiuFSiCa0do8LaLKR2wG
         iMiu46tKGhHPE6nqn1N/RFE2EZo8PJMAWqYfpxn/d1TgzMG48tS4mC83XHmR5oJHaoeH
         1kQQ==
X-Gm-Message-State: AOAM533/tSW8keD/QdwkqTDf8jfEk4MQ9BGQP/6AAbBc87qCy3F2rbWb
        u1VppC6Y86MiAchqChx/73BYfw==
X-Google-Smtp-Source: ABdhPJw3nrXjJmU8OaJc40fydfAiEK/nTF2dswy4rZC3fnW3vFEAjRu5dKDZmxifEXTEypWTM0aSAw==
X-Received: by 2002:ac2:43c5:: with SMTP id u5mr8585621lfl.156.1622553036768;
        Tue, 01 Jun 2021 06:10:36 -0700 (PDT)
Received: from toster (89-73-146-138.dynamic.chello.pl. [89.73.146.138])
        by smtp.gmail.com with ESMTPSA id r17sm1978630ljp.40.2021.06.01.06.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 06:10:36 -0700 (PDT)
Date:   Tue, 1 Jun 2021 15:10:34 +0200
From:   Stanislaw Kardach <kda@semihalf.com>
To:     Atish Patra <atish.patra@wdc.com>
Cc:     linux-kernel@vger.kernel.org, Anup Patel <anup.patel@wdc.com>,
        bpf@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>,
        Guo Ren <guoren@linux.alibaba.com>,
        Heinrich Schuchardt <xypron.glpk@gmx.de>,
        Kefeng Wang <wangkefeng.wang@huawei.com>,
        linux-doc@vger.kernel.org, linux-perf-users@vger.kernel.org,
        linux-riscv@lists.infradead.org,
        Nick Kossifidis <mick@ics.forth.gr>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Alan Kao <alankao@andestech.com>,
        Nick Hu <nickhu@andestech.com>,
        Vincent Chen <vincent.chen@sifive.com>
Subject: Re: [RFC v2 6/7] RISC-V: Add perf platform driver based on SBI PMU
 extension
Message-ID: <20210601131034.j423a2acw5nxuo6g@toster>
References: <20210528184405.1793783-1-atish.patra@wdc.com>
 <20210528184405.1793783-7-atish.patra@wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210528184405.1793783-7-atish.patra@wdc.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, May 28, 2021 at 11:44:04AM -0700, Atish Patra wrote:
> RISC-V SBI specification added a PMU extension that allows to configure
> /start/stop any pmu counter. The RISC-V perf can use most of the generic
> perf features except interrupt overflow and event filtering based on
> privilege mode which will be added in future.
> 
> It also allows to monitor a handful of firmware counters that can provide
> insights into firmware activity during a performance analysis.
> 
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  drivers/perf/Kconfig         |   8 +
>  drivers/perf/Makefile        |   1 +
>  drivers/perf/riscv_pmu.c     |   2 +
>  drivers/perf/riscv_pmu_sbi.c | 537 +++++++++++++++++++++++++++++++++++
>  4 files changed, 548 insertions(+)
>  create mode 100644 drivers/perf/riscv_pmu_sbi.c
> 
> diff --git a/drivers/perf/Kconfig b/drivers/perf/Kconfig
> index 1546a487d970..2acb5feaab35 100644
> --- a/drivers/perf/Kconfig
> +++ b/drivers/perf/Kconfig
> @@ -73,6 +73,14 @@ config RISCV_PMU_LEGACY
>  	  implementation on RISC-V based systems. This only allows counting
>  	  of cycle/instruction counter and will be removed in future.
>  
> +config RISCV_PMU_SBI
> +	depends on RISCV_PMU
> +	bool "RISC-V PMU based on SBI PMU extension"
> +	default y
> +	help
> +	  Say y if you want to use the CPU performance monitor
> +	  using SBI PMU extension on RISC-V based systems.
> +
>  config ARM_PMU_ACPI
>  	depends on ARM_PMU && ACPI
>  	def_bool y
> diff --git a/drivers/perf/Makefile b/drivers/perf/Makefile
> index e8aa666a9d28..7bcac4b5a983 100644
> --- a/drivers/perf/Makefile
> +++ b/drivers/perf/Makefile
> @@ -13,6 +13,7 @@ obj-$(CONFIG_QCOM_L3_PMU) += qcom_l3_pmu.o
>  obj-$(CONFIG_RISCV_PMU) += riscv_pmu.o
>  ifeq ($(CONFIG_RISCV_PMU), y)
>  obj-$(CONFIG_RISCV_PMU_LEGACY) += riscv_pmu_legacy.o
> +obj-$(CONFIG_RISCV_PMU_SBI) += riscv_pmu_sbi.o
>  endif
>  obj-$(CONFIG_THUNDERX2_PMU) += thunderx2_pmu.o
>  obj-$(CONFIG_XGENE_PMU) += xgene_pmu.o
> diff --git a/drivers/perf/riscv_pmu.c b/drivers/perf/riscv_pmu.c
> index c184aa50134d..596af3a40948 100644
> --- a/drivers/perf/riscv_pmu.c
> +++ b/drivers/perf/riscv_pmu.c
> @@ -15,6 +15,8 @@
>  #include <linux/printk.h>
>  #include <linux/smp.h>
>  
> +#include <asm/sbi.h>
> +
>  static unsigned long csr_read_num(int csr_num)
>  {
>  #define switchcase_csr_read(__csr_num, __val)		{\
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> new file mode 100644
> index 000000000000..80dd1de428c4
> --- /dev/null
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -0,0 +1,537 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * RISC-V performance counter support.
> + *
> + * Copyright (C) 2021 Western Digital Corporation or its affiliates.
> + *
> + * This code is based on ARM perf event code which is in turn based on
> + * sparc64 and x86 code.
> + */
> +
> +#include <linux/mod_devicetable.h>
> +#include <linux/perf/riscv_pmu.h>
> +#include <linux/platform_device.h>
> +
> +#include <asm/sbi.h>
> +
> +union sbi_pmu_ctr_info {
> +	unsigned long value;
> +	struct {
> +		unsigned long csr:12;
> +		unsigned long width:6;
> +#if __riscv_xlen == 32
> +		unsigned long reserved:13;
> +#else
> +		unsigned long reserved:45;
> +#endif
> +		unsigned long type:1;
> +	};
> +};
> +
> +/**
> + * RISC-V doesn't have hetergenous harts yet. This need to be part of
> + * per_cpu in case of harts with different pmu counters
> + */
> +static union sbi_pmu_ctr_info *pmu_ctr_list;
> +
> +struct pmu_event_data {
> +	union {
> +		union {
> +			struct hw_gen_event {
> +				uint32_t event_code:16;
> +				uint32_t event_type:4;
> +				uint32_t reserved:12;
> +			} hw_gen_event;
> +			struct hw_cache_event {
> +				uint32_t result_id:1;
> +				uint32_t op_id:2;
> +				uint32_t cache_id:13;
> +				uint32_t event_type:4;
> +				uint32_t reserved:12;
> +			} hw_cache_event;
> +		};
> +		uint32_t event_idx;
> +	};
> +};
> +
> +static const struct pmu_event_data pmu_hw_event_map[] = {
> +	[PERF_COUNT_HW_CPU_CYCLES]		= {.hw_gen_event = {
> +							SBI_PMU_HW_CPU_CYCLES,
> +							SBI_PMU_EVENT_TYPE_HW, 0}},
> +	[PERF_COUNT_HW_INSTRUCTIONS]		= {.hw_gen_event = {
> +							SBI_PMU_HW_INSTRUCTIONS,
> +							SBI_PMU_EVENT_TYPE_HW, 0}},
> +	[PERF_COUNT_HW_CACHE_REFERENCES]	= {.hw_gen_event = {
> +							SBI_PMU_HW_CACHE_REFERENCES,
> +							SBI_PMU_EVENT_TYPE_HW, 0}},
> +	[PERF_COUNT_HW_CACHE_MISSES]		= {.hw_gen_event = {
> +							SBI_PMU_HW_CACHE_MISSES,
> +							SBI_PMU_EVENT_TYPE_HW, 0}},
> +	[PERF_COUNT_HW_BRANCH_INSTRUCTIONS]	= {.hw_gen_event = {
> +							SBI_PMU_HW_BRANCH_INSTRUCTIONS,
> +							SBI_PMU_EVENT_TYPE_HW, 0}},
> +	[PERF_COUNT_HW_BRANCH_MISSES]		= {.hw_gen_event = {
> +							SBI_PMU_HW_BRANCH_MISSES,
> +							SBI_PMU_EVENT_TYPE_HW, 0}},
> +	[PERF_COUNT_HW_BUS_CYCLES]		= {.hw_gen_event = {
> +							SBI_PMU_HW_BUS_CYCLES,
> +							SBI_PMU_EVENT_TYPE_HW, 0}},
> +	[PERF_COUNT_HW_STALLED_CYCLES_FRONTEND]	= {.hw_gen_event = {
> +							SBI_PMU_HW_STALLED_CYCLES_FRONTEND,
> +							SBI_PMU_EVENT_TYPE_HW, 0}},
> +	[PERF_COUNT_HW_STALLED_CYCLES_BACKEND]	= {.hw_gen_event = {
> +							SBI_PMU_HW_STALLED_CYCLES_BACKEND,
> +							SBI_PMU_EVENT_TYPE_HW, 0}},
> +	[PERF_COUNT_HW_REF_CPU_CYCLES]		= {.hw_gen_event = {
> +							SBI_PMU_HW_REF_CPU_CYCLES,
> +							SBI_PMU_EVENT_TYPE_HW, 0}},
> +};
> +
> +#define C(x) PERF_COUNT_HW_CACHE_##x
> +static const struct pmu_event_data pmu_cache_event_map[PERF_COUNT_HW_CACHE_MAX]
> +[PERF_COUNT_HW_CACHE_OP_MAX]
> +[PERF_COUNT_HW_CACHE_RESULT_MAX] = {
> +	[C(L1D)] = {
> +		[C(OP_READ)] = {
> +			[C(RESULT_ACCESS)] = {.hw_cache_event = {C(RESULT_ACCESS),
> +					C(OP_READ), C(L1D), SBI_PMU_EVENT_TYPE_CACHE, 0}},
> +			[C(RESULT_MISS)] = {.hw_cache_event = {C(RESULT_MISS),
> +					C(OP_READ), C(L1D), SBI_PMU_EVENT_TYPE_CACHE, 0}},
> +		},
> +		[C(OP_WRITE)] = {
> +			[C(RESULT_ACCESS)] = {.hw_cache_event = {C(RESULT_ACCESS),
> +					C(OP_WRITE), C(L1D), SBI_PMU_EVENT_TYPE_CACHE, 0}},
> +			[C(RESULT_MISS)] = {.hw_cache_event = {C(RESULT_MISS),
> +					C(OP_WRITE), C(L1D), SBI_PMU_EVENT_TYPE_CACHE, 0}},
> +		},
> +		[C(OP_PREFETCH)] = {
> +			[C(RESULT_ACCESS)] = {.hw_cache_event = {C(RESULT_ACCESS),
> +					C(OP_PREFETCH), C(L1D), SBI_PMU_EVENT_TYPE_CACHE, 0}},
> +			[C(RESULT_MISS)] = {.hw_cache_event = {C(RESULT_MISS),
> +					C(OP_PREFETCH), C(L1D), SBI_PMU_EVENT_TYPE_CACHE, 0}},
> +		},
> +	},
> +	[C(L1I)] = {
> +		[C(OP_READ)] = {
> +			[C(RESULT_ACCESS)] = {.hw_cache_event =	{C(RESULT_ACCESS),
> +					C(OP_READ), C(L1I), SBI_PMU_EVENT_TYPE_CACHE, 0}},
> +			[C(RESULT_MISS)] = {.hw_cache_event = {C(RESULT_MISS), C(OP_READ),
> +					C(L1I), SBI_PMU_EVENT_TYPE_CACHE, 0}},
> +		},
> +		[C(OP_WRITE)] = {
> +			[C(RESULT_ACCESS)] = {.hw_cache_event = {C(RESULT_ACCESS),
> +					C(OP_WRITE), C(L1I), SBI_PMU_EVENT_TYPE_CACHE, 0}},
> +			[C(RESULT_MISS)] = {.hw_cache_event = {C(RESULT_MISS),
> +					C(OP_WRITE), C(L1I), SBI_PMU_EVENT_TYPE_CACHE, 0}},
> +		},
> +		[C(OP_PREFETCH)] = {
> +			[C(RESULT_ACCESS)] = {.hw_cache_event = {C(RESULT_ACCESS),
> +					C(OP_PREFETCH), C(L1I), SBI_PMU_EVENT_TYPE_CACHE, 0}},
> +			[C(RESULT_MISS)] = {.hw_cache_event = {C(RESULT_MISS),
> +					C(OP_PREFETCH), C(L1I), SBI_PMU_EVENT_TYPE_CACHE, 0}},
> +		},
> +	},
> +	[C(LL)] = {
> +		[C(OP_READ)] = {
> +			[C(RESULT_ACCESS)] = {.hw_cache_event = {C(RESULT_ACCESS),
> +					C(OP_READ), C(LL), SBI_PMU_EVENT_TYPE_CACHE, 0}},
> +			[C(RESULT_MISS)] = {.hw_cache_event = {C(RESULT_MISS),
> +					C(OP_READ), C(LL), SBI_PMU_EVENT_TYPE_CACHE, 0}},
> +		},
> +		[C(OP_WRITE)] = {
> +			[C(RESULT_ACCESS)] = {.hw_cache_event = {C(RESULT_ACCESS),
> +					C(OP_WRITE), C(LL), SBI_PMU_EVENT_TYPE_CACHE, 0}},
> +			[C(RESULT_MISS)] = {.hw_cache_event = {C(RESULT_MISS),
> +					C(OP_WRITE), C(LL), SBI_PMU_EVENT_TYPE_CACHE, 0}},
> +		},
> +		[C(OP_PREFETCH)] = {
> +			[C(RESULT_ACCESS)] = {.hw_cache_event = {C(RESULT_ACCESS),
> +					C(OP_PREFETCH), C(LL), SBI_PMU_EVENT_TYPE_CACHE, 0}},
> +			[C(RESULT_MISS)] = {.hw_cache_event = {C(RESULT_MISS),
> +					C(OP_PREFETCH), C(LL), SBI_PMU_EVENT_TYPE_CACHE, 0}},
> +		},
> +	},
> +	[C(DTLB)] = {
> +		[C(OP_READ)] = {
> +			[C(RESULT_ACCESS)] = {.hw_cache_event = {C(RESULT_ACCESS),
> +					C(OP_READ), C(DTLB), SBI_PMU_EVENT_TYPE_CACHE, 0}},
> +			[C(RESULT_MISS)] = {.hw_cache_event = {C(RESULT_MISS),
> +					C(OP_READ), C(DTLB), SBI_PMU_EVENT_TYPE_CACHE, 0}},
> +		},
> +		[C(OP_WRITE)] = {
> +			[C(RESULT_ACCESS)] = {.hw_cache_event = {C(RESULT_ACCESS),
> +					C(OP_WRITE), C(DTLB), SBI_PMU_EVENT_TYPE_CACHE, 0}},
> +			[C(RESULT_MISS)] = {.hw_cache_event = {C(RESULT_MISS),
> +					C(OP_WRITE), C(DTLB), SBI_PMU_EVENT_TYPE_CACHE, 0}},
> +		},
> +		[C(OP_PREFETCH)] = {
> +			[C(RESULT_ACCESS)] = {.hw_cache_event = {C(RESULT_ACCESS),
> +					C(OP_PREFETCH), C(DTLB), SBI_PMU_EVENT_TYPE_CACHE, 0}},
> +			[C(RESULT_MISS)] = {.hw_cache_event = {C(RESULT_MISS),
> +					C(OP_PREFETCH), C(DTLB), SBI_PMU_EVENT_TYPE_CACHE, 0}},
> +		},
> +	},
> +	[C(ITLB)] = {
> +		[C(OP_READ)] = {
> +			[C(RESULT_ACCESS)] = {.hw_cache_event = {C(RESULT_ACCESS),
> +					C(OP_READ), C(ITLB), SBI_PMU_EVENT_TYPE_CACHE, 0}},
> +			[C(RESULT_MISS)] = {.hw_cache_event = {C(RESULT_MISS),
> +					C(OP_READ), C(ITLB), SBI_PMU_EVENT_TYPE_CACHE, 0}},
> +		},
> +		[C(OP_WRITE)] = {
> +			[C(RESULT_ACCESS)] = {.hw_cache_event = {C(RESULT_ACCESS),
> +					C(OP_WRITE), C(ITLB), SBI_PMU_EVENT_TYPE_CACHE, 0}},
> +			[C(RESULT_MISS)] = {.hw_cache_event = {C(RESULT_MISS),
> +					C(OP_WRITE), C(ITLB), SBI_PMU_EVENT_TYPE_CACHE, 0}},
> +		},
> +		[C(OP_PREFETCH)] = {
> +			[C(RESULT_ACCESS)] = {.hw_cache_event = {C(RESULT_ACCESS),
> +					C(OP_PREFETCH), C(ITLB), SBI_PMU_EVENT_TYPE_CACHE, 0}},
> +			[C(RESULT_MISS)] = {.hw_cache_event = {C(RESULT_MISS),
> +					C(OP_PREFETCH), C(ITLB), SBI_PMU_EVENT_TYPE_CACHE, 0}},
> +		},
> +	},
> +	[C(BPU)] = {
> +		[C(OP_READ)] = {
> +			[C(RESULT_ACCESS)] = {.hw_cache_event = {C(RESULT_ACCESS),
> +					C(OP_READ), C(BPU), SBI_PMU_EVENT_TYPE_CACHE, 0}},
> +			[C(RESULT_MISS)] = {.hw_cache_event = {C(RESULT_MISS),
> +					C(OP_READ), C(BPU), SBI_PMU_EVENT_TYPE_CACHE, 0}},
> +		},
> +		[C(OP_WRITE)] = {
> +			[C(RESULT_ACCESS)] = {.hw_cache_event = {C(RESULT_ACCESS),
> +					C(OP_WRITE), C(BPU), SBI_PMU_EVENT_TYPE_CACHE, 0}},
> +			[C(RESULT_MISS)] = {.hw_cache_event = {C(RESULT_MISS),
> +					C(OP_WRITE), C(BPU), SBI_PMU_EVENT_TYPE_CACHE, 0}},
> +		},
> +		[C(OP_PREFETCH)] = {
> +			[C(RESULT_ACCESS)] = {.hw_cache_event = {C(RESULT_ACCESS),
> +					C(OP_PREFETCH), C(BPU), SBI_PMU_EVENT_TYPE_CACHE, 0}},
> +			[C(RESULT_MISS)] = {.hw_cache_event = {C(RESULT_MISS),
> +					C(OP_PREFETCH), C(BPU), SBI_PMU_EVENT_TYPE_CACHE, 0}},
> +		},
> +	},
> +	[C(NODE)] = {
> +		[C(OP_READ)] = {
> +			[C(RESULT_ACCESS)] = {.hw_cache_event = {C(RESULT_ACCESS),
> +					C(OP_READ), C(NODE), SBI_PMU_EVENT_TYPE_CACHE, 0}},
> +			[C(RESULT_MISS)] = {.hw_cache_event = {C(RESULT_MISS),
> +					C(OP_READ), C(NODE), SBI_PMU_EVENT_TYPE_CACHE, 0}},
> +		},
> +		[C(OP_WRITE)] = {
> +			[C(RESULT_ACCESS)] = {.hw_cache_event = {C(RESULT_ACCESS),
> +					C(OP_WRITE), C(NODE), SBI_PMU_EVENT_TYPE_CACHE, 0}},
> +			[C(RESULT_MISS)] = {.hw_cache_event = {C(RESULT_MISS),
> +					C(OP_WRITE), C(NODE), SBI_PMU_EVENT_TYPE_CACHE, 0}},
> +		},
> +		[C(OP_PREFETCH)] = {
> +			[C(RESULT_ACCESS)] = {.hw_cache_event = {C(RESULT_ACCESS),
> +					C(OP_PREFETCH), C(NODE), SBI_PMU_EVENT_TYPE_CACHE, 0}},
> +			[C(RESULT_MISS)] = {.hw_cache_event = {C(RESULT_MISS),
> +					C(OP_PREFETCH), C(NODE), SBI_PMU_EVENT_TYPE_CACHE, 0}},
> +		},
> +	},
> +};
> +
> +static int pmu_sbi_ctr_get_width(int idx)
> +{
> +	return pmu_ctr_list[idx].width;
> +}
> +
> +static int pmu_sbi_ctr_get_idx(struct perf_event *event)
> +{
> +	struct hw_perf_event *hwc = &event->hw;
> +	struct riscv_pmu *rvpmu = to_riscv_pmu(event->pmu);
> +	struct cpu_hw_events *cpuc = this_cpu_ptr(rvpmu->hw_events);
> +	struct sbiret ret;
> +	int idx;
> +	uint64_t cbase = 0;
> +	uint64_t cmask = GENMASK_ULL(rvpmu->num_counters - 1, 0);
> +	unsigned long cflags = 0;
> +
> +	/* retrieve the available counter index */
> +	ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_CFG_MATCH, cbase, cmask,
> +			cflags, hwc->event_base, hwc->config, 0);
> +	if (ret.error) {
> +		pr_debug("Not able to find a counter for event %lx config %llx\n",
> +			hwc->event_base, hwc->config);
> +		return sbi_err_map_linux_errno(ret.error);
> +	}
> +
> +	idx = ret.value;
> +	if (idx >= rvpmu->num_counters || !pmu_ctr_list[idx].value)
> +		return -ENOENT;
> +
> +	/* Additional sanity check for the counter id */
> +	if (!test_and_set_bit(idx, cpuc->used_event_ctrs))
> +		return idx;
> +	else
> +		return -ENOENT;
> +}
> +
> +static void pmu_sbi_ctr_clear_idx(struct perf_event *event)
> +{
> +
> +	struct hw_perf_event *hwc = &event->hw;
> +	struct riscv_pmu *rvpmu = to_riscv_pmu(event->pmu);
> +	struct cpu_hw_events *cpuc = this_cpu_ptr(rvpmu->hw_events);
> +	int idx = hwc->idx;
> +
> +	clear_bit(idx, cpuc->used_event_ctrs);
> +}
> +
> +static int pmu_event_find_cache(u64 config)
> +{
> +	unsigned int cache_type, cache_op, cache_result, ret;
> +
> +	cache_type = (config >>  0) & 0xff;
> +	if (cache_type >= PERF_COUNT_HW_CACHE_MAX)
> +		return -EINVAL;
> +
> +	cache_op = (config >>  8) & 0xff;
> +	if (cache_op >= PERF_COUNT_HW_CACHE_OP_MAX)
> +		return -EINVAL;
> +
> +	cache_result = (config >> 16) & 0xff;
> +	if (cache_result >= PERF_COUNT_HW_CACHE_RESULT_MAX)
> +		return -EINVAL;
> +
> +	ret = pmu_cache_event_map[cache_type][cache_op][cache_result].event_idx;
> +
> +	return ret;
> +}
> +
> +static bool pmu_sbi_is_fw_event(struct perf_event *event)
> +{
> +	u32 type = event->attr.type;
> +	u64 config = event->attr.config;
> +
> +	if ((type == PERF_TYPE_RAW) && ((config >> 63) == 1))
> +		return true;
> +	else
> +		return false;
> +}
> +
> +static int pmu_sbi_event_map(struct perf_event *event, u64 *econfig)
> +{
> +	u32 type = event->attr.type;
> +	u64 config = event->attr.config;
> +	int bSoftware;
> +	u64 raw_config_val;
> +	int ret;
> +
> +	switch (type) {
> +	case PERF_TYPE_HARDWARE:
> +		if (config >= PERF_COUNT_HW_MAX)
> +			return -EINVAL;
> +		ret = pmu_hw_event_map[event->attr.config].event_idx;
> +		break;
> +	case PERF_TYPE_HW_CACHE:
> +		ret = pmu_event_find_cache(config);
> +		break;
> +	case PERF_TYPE_RAW:
> +		/*
> +		 * As per SBI specification, the upper 7 bits must be unused for
> +		 * a raw event. Use the MSB (63b) to distinguish between hardware
> +		 * raw event and firmware events.
> +		 */
> +		bSoftware = config >> 63;
> +		raw_config_val = config & RISCV_PMU_RAW_EVENT_MASK;
> +		if (bSoftware) {
> +			if (raw_config_val < SBI_PMU_FW_MAX)
> +				ret = (raw_config_val & 0xFFFF) |
> +				      (SBI_PMU_EVENT_TYPE_FW << 16);
> +			else
> +				return -EINVAL;
> +		} else {
> +			ret = RISCV_PMU_RAW_EVENT_IDX;
> +			*econfig = raw_config_val;
> +		}
> +		break;
> +	default:
> +		ret = -EINVAL;
> +		break;
> +	}
> +
> +	return ret;
> +}
> +
> +static u64 pmu_sbi_ctr_read(struct perf_event *event)
> +{
> +	struct hw_perf_event *hwc = &event->hw;
> +	int idx = hwc->idx;
> +	struct sbiret ret;
> +	union sbi_pmu_ctr_info info;
> +	u64 val = 0;
> +
> +	if (pmu_sbi_is_fw_event(event)) {
> +		ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_FW_READ,
> +				hwc->idx, 0, 0, 0, 0, 0);
> +		if (!ret.error)
> +			val = ret.value;
> +	} else {
> +		info = pmu_ctr_list[idx];
> +		val = riscv_pmu_ctr_read_csr(info.csr);
> +		if (IS_ENABLED(CONFIG_32BIT))
> +			val = ((u64)riscv_pmu_ctr_read_csr(info.csr + 0x80)) << 32 | val;
> +	}
> +
> +	return val;
> +}
> +
> +static void pmu_sbi_ctr_start(struct perf_event *event, u64 ival)
> +{
> +	struct sbiret ret;
> +	struct hw_perf_event *hwc = &event->hw;
> +
> +	ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START, hwc->idx,
> +			1, 1, ival, 0, 0);
> +	if (ret.error)
> +		pr_err("Starting counter idx %d failed with error %d\n",
> +			hwc->idx, sbi_err_map_linux_errno(ret.error));
> +}
> +
> +static void pmu_sbi_ctr_stop(struct perf_event *event)
> +{
> +	struct sbiret ret;
> +	struct hw_perf_event *hwc = &event->hw;
> +	struct riscv_pmu *rvpmu = to_riscv_pmu(event->pmu);
> +	struct cpu_hw_events *cpuc = this_cpu_ptr(rvpmu->hw_events);
> +	unsigned long flag = 0;
> +
> +	if (cpuc->events[hwc->idx] == NULL)
> +		flag = SBI_PMU_STOP_FLAG_RESET;
> +	ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_STOP, hwc->idx, 1, flag, 0, 0, 0);
> +	if (ret.error)
> +		pr_err("Stopping counter idx %d failed with error %d\n",
> +			hwc->idx, sbi_err_map_linux_errno(ret.error));
> +}
> +
> +static int pmu_sbi_find_num_ctrs(void)
> +{
> +	struct sbiret ret;
> +
> +	ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_NUM_COUNTERS, 0, 0, 0, 0, 0, 0);
> +	if (!ret.error)
> +		return ret.value;
> +	else
> +		return sbi_err_map_linux_errno(ret.error);
> +}
> +
> +static int pmu_sbi_get_ctrinfo(int nctr)
> +{
> +	struct sbiret ret;
> +	int i, num_hw_ctr = 0, num_fw_ctr = 0;
> +	union sbi_pmu_ctr_info cinfo;
> +
> +	pmu_ctr_list = kzalloc(sizeof(*pmu_ctr_list) * nctr, GFP_KERNEL);
> +	if (!pmu_ctr_list)
> +		return -ENOMEM;
> +
> +	for (i = 0; i <= nctr; i++) {
> +		ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_GET_INFO, i, 0, 0, 0, 0, 0);
> +		if (ret.error)
> +			/* The logical counter ids are not expected to be contiguous */
> +			continue;
> +		cinfo.value = ret.value;
> +		if (cinfo.type == SBI_PMU_CTR_TYPE_FW)
> +			num_fw_ctr++;
> +		else
> +			num_hw_ctr++;
> +		pmu_ctr_list[i].value = cinfo.value;
> +	}
> +
> +	pr_info("There are %d firmware & %d hardware counters available\n",
> +		num_fw_ctr, num_hw_ctr);
> +
> +	return 0;
> +}
> +
> +static int pmu_sbi_starting_cpu(unsigned int cpu)
> +{
> +	/* Enable the access for TIME csr only from the user mode now */
> +	csr_write(CSR_SCOUNTEREN, 0x2);
Would it be possible to also enable CYCLE csr here (and I guess same
would propagate to mcounteren logic in the opensbi patches)? Are there
any security concerns in allowing applications to read it directly?

It would be useful given that the frequency of TIME is not fixed in spec
and it may not be enough for a rdtsc-like counter. In such cases CYCLE
csr might be useful to userspace applications (i.e. DPDK) with obvious
limitations such as gating via WFI or value changes when using perf.

For context: there was a similar situation with arm64 at the point of
DPDK port to that arch. Armv7-A standardized their timer (CNTVCT) but
not its frequency which usually was ~100MHz. The PMU cycle counter
(PMCCNTR) was by default disabled for read from userspace (EL0). This
required DPDK folks to create a kernel module to enable the PMCCNTR in
userspace so that they could implement high-resolution rte_rdtsc() call.
This got fixed in Armv8.6-A which specified the timer counter frequency
to be 1GHz.

If the CYCLE csr remains S-mode private, I will have to effectively
resort to the same kernel-module trick as arm64 in the RISC-V DPDK port.
Alternatively perhaps a sysfs knob or driver parameter could be added to
enable the CYCLE csr in U-mode?
> +
> +	return 0;
> +}
> +
> +static int pmu_sbi_dying_cpu(unsigned int cpu)
> +{
> +	/* Disable all counters access for user mode now */
> +	csr_write(CSR_SCOUNTEREN, 0x0);
> +
> +	return 0;
> +}
> +
> +
> +static int pmu_sbi_device_probe(struct platform_device *pdev)
> +{
> +	struct riscv_pmu *pmu = NULL;
> +	int num_counters;
> +
> +	pmu = riscv_pmu_alloc();
> +	if (!pmu)
> +		return -ENOMEM;
> +
> +	if (((sbi_major_version() == 0) && (sbi_minor_version() < 3)) ||
> +		sbi_probe_extension(SBI_EXT_PMU) <= 0) {
> +		/* Fall back to the legacy implementation */
> +		riscv_pmu_legacy_init(pmu);
> +		return 0;
> +	}
> +
> +	pr_info("SBI PMU extension is available\n");
> +
> +	num_counters = pmu_sbi_find_num_ctrs();
> +	if (num_counters < 0) {
> +		pr_err("SBI PMU extension doesn't provide any counters\n");
> +		return -ENODEV;
> +	}
> +
> +	/* cache all the information about counters now */
> +	if (pmu_sbi_get_ctrinfo(num_counters))
> +		return -ENODEV;
> +
> +	pmu->num_counters = num_counters;
> +	pmu->ctr_start = pmu_sbi_ctr_start;
> +	pmu->ctr_stop = pmu_sbi_ctr_stop;
> +	pmu->event_map = pmu_sbi_event_map;
> +	pmu->ctr_get_idx = pmu_sbi_ctr_get_idx;
> +	pmu->ctr_get_width = pmu_sbi_ctr_get_width;
> +	pmu->ctr_clear_idx = pmu_sbi_ctr_clear_idx;
> +	pmu->ctr_read = pmu_sbi_ctr_read;
> +
> +	perf_pmu_register(&pmu->pmu, "cpu", PERF_TYPE_RAW);
> +
> +	cpuhp_setup_state(CPUHP_AP_PERF_RISCV_STARTING,
> +			  "perf/riscv/pmu:starting",
> +			  pmu_sbi_starting_cpu, pmu_sbi_dying_cpu);
> +
> +	return 0;
> +}
> +
> +static struct platform_driver pmu_sbi_driver = {
> +	.probe		= pmu_sbi_device_probe,
> +	.driver		= {
> +		.name	= RISCV_PMU_PDEV_NAME,
> +	},
> +};
> +
> +static int __init pmu_sbi_devinit(void)
> +{
> +	int ret;
> +	struct platform_device *pdev;
> +
> +	ret = platform_driver_register(&pmu_sbi_driver);
> +	if (ret)
> +		return ret;
> +
> +	pdev = platform_device_register_simple(RISCV_PMU_PDEV_NAME, -1, NULL, 0);
> +	if (IS_ERR(pdev)) {
> +		platform_driver_unregister(&pmu_sbi_driver);
> +		return PTR_ERR(pdev);
> +	}
> +
> +	return ret;
> +}
> +device_initcall(pmu_sbi_devinit)
> -- 
> 2.25.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

-- 
Best Regards,
Stanislaw Kardach
