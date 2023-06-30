Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7275D743A9F
	for <lists+linux-doc@lfdr.de>; Fri, 30 Jun 2023 13:16:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232910AbjF3LQ5 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 30 Jun 2023 07:16:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232512AbjF3LQu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 30 Jun 2023 07:16:50 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5F9D19BA
        for <linux-doc@vger.kernel.org>; Fri, 30 Jun 2023 04:16:43 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-992dcae74e0so81031666b.3
        for <linux-doc@vger.kernel.org>; Fri, 30 Jun 2023 04:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1688123802; x=1690715802;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G8RwKyWjQ7rl3Ppk6BKT6e69k8Me0Zd0vefhl7KFO/s=;
        b=alSd83XbCIZVP078BLSQM0l4zqXAmX9RA3KGRnaY0VhC8hH2Q7YphCMDU6ie3QuThk
         O1RYBXNwBlv24hRu/r78aorS08LRpDAnGkPJ6pLRkxMN9wYzGXmWGO53nTSShJxsjJM4
         lWAK6bN478iwmKDc4K6TB6+s/aQQWDu4nEpNzbieMCgZlZO6+K+5u6k86+dWD14sPWUh
         JICl5qx/D6iS0mtvfgjli1Cv0Gg+GVVdP3E8PZznNgza08lE2OoqtJKQps5qiO6Ysr2M
         0+/spiNhqfevxHk8EEBDMRP326Z+3vUIOk6Ca0WwHpBhg2jcwDXW7hSsFJM/qQEvnjlC
         7rOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688123802; x=1690715802;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G8RwKyWjQ7rl3Ppk6BKT6e69k8Me0Zd0vefhl7KFO/s=;
        b=IHliMPEzMHgyMQR0OxUnSEpzhACcNWI2/6vfMH1BXxjcr0NHkDbCYmhIe3xH2E37/B
         /kvS9VtbRpRu4e8SSbInVNaTFAKMcEuPFKspjc5nSSwVLmX3iuCKhjyLuvrU8jGNiP6a
         EPfBHojyv4DX0RNrCH57Wj1YRzcXnfYg83zg+XBmHRg1m2M5HDa7wJifNnHohyc9YGsZ
         qA3+WKqF2ucU+8YVlE6ZFOv/GdCfcja6Dr/OpEgQM5RruJNGT9kEMRG811VtkPGZLuCM
         T2LWEFd+c2rsNvjl/+JVObCWtn7H0TP9Rlocit7uSP6TxuoHzt/Q3jB6EsrjmastQcd9
         YFGQ==
X-Gm-Message-State: ABy/qLbADovgcyDrHsWOzIQXQOLA8Zgg8am1r5KmNkdIDMhdwHJrElO2
        hnTOpHLDzsDH0GH7lnazgU8e+A==
X-Google-Smtp-Source: APBJJlGSh9pnM2wyCvB7H8i4x229ME/Bu1b+gqOsS0eyPxPuv9wkd6hm541bA82OQ/1dlmptKbQXrA==
X-Received: by 2002:a17:906:d961:b0:990:8807:8f88 with SMTP id rp1-20020a170906d96100b0099088078f88mr1741080ejb.55.1688123802399;
        Fri, 30 Jun 2023 04:16:42 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id u12-20020a1709064acc00b009930308425csm22356ejt.31.2023.06.30.04.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 04:16:42 -0700 (PDT)
Date:   Fri, 30 Jun 2023 13:16:41 +0200
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
Subject: Re: [PATCH v3 08/10] Documentation: admin-guide: Add riscv
 sysctl_perf_user_access
Message-ID: <20230630-f714cc46ee65cc65318f2ada@orel>
References: <20230630083013.102334-1-alexghiti@rivosinc.com>
 <20230630083013.102334-9-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230630083013.102334-9-alexghiti@rivosinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jun 30, 2023 at 10:30:11AM +0200, Alexandre Ghiti wrote:
> riscv now uses this sysctl so document its usage for this architecture.
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  Documentation/admin-guide/sysctl/kernel.rst | 26 +++++++++++++++++----
>  1 file changed, 22 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
> index d85d90f5d000..c376692b372b 100644
> --- a/Documentation/admin-guide/sysctl/kernel.rst
> +++ b/Documentation/admin-guide/sysctl/kernel.rst
> @@ -941,16 +941,34 @@ enabled, otherwise writing to this file will return ``-EBUSY``.
>  The default value is 8.
>  
>  
> -perf_user_access (arm64 only)
> -=================================
> +perf_user_access (arm64 and riscv only)
> +=======================================
> +
> +Controls user space access for reading perf event counters.
>  
> -Controls user space access for reading perf event counters. When set to 1,
> -user space can read performance monitor counter registers directly.
> +arm64
> +=====
>  
>  The default value is 0 (access disabled).

Should add a blank line here.

> +When set to 1, user space can read performance monitor counter registers
> +directly.
>  
>  See Documentation/arm64/perf.rst for more information.
>  
> +riscv
> +=====
> +
> +When set to 0, user access is disabled.
> +
> +When set to 1, user space can read performance monitor counter registers
> +directly only through perf, any direct access without perf intervention will

Remove 'directly only'

(It can't be both "direct" and "through" at the same time.)

> +trigger an illegal instruction.
> +
> +The default value is 2,

This is no longer true.

> which enables legacy mode (user space has direct
> +access to cycle and insret CSRs only). Note that this legacy value
> +is deprecated and will be removed once all userspace applications are fixed.
> +
> +Note that the time CSR is for now always accessible to all modes.

s/always accessible/always directly accessible/

Also, remove 'for now'. While we may change this in the future, I'm not
sure if the 'for now' helps much. Maybe a "This may change in the future."
type of sentence? Or, just nothing (for now :-) and we'll modify this
document if it changes later.

Thanks,
drew

>  
>  pid_max
>  =======
> -- 
> 2.39.2
> 
