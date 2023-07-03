Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C38D745CCC
	for <lists+linux-doc@lfdr.de>; Mon,  3 Jul 2023 15:03:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230114AbjGCNDz (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 3 Jul 2023 09:03:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231266AbjGCNDy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 3 Jul 2023 09:03:54 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7803BE67
        for <linux-doc@vger.kernel.org>; Mon,  3 Jul 2023 06:03:50 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3fbc244d3a8so45108345e9.2
        for <linux-doc@vger.kernel.org>; Mon, 03 Jul 2023 06:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1688389429; x=1690981429;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cPBpk9U/09/3mwSB5bUrvUTAuq++fuN/NRKxbA7bKNo=;
        b=hAy+BEYKnzd4+DmBw0GRbDQ1l88L7pEEpB2kO9554H/4kn61UlVe/JewCteAPvuSVE
         tmHSfhdRmq/m2BO8bQ1qgGndwlyxlrIsSXXAYBEnR430VaszhPz+2tggA1hjNRjby+KP
         EwZvL8n3NZO0qqnUXPAMkMhCXoP512GXkLhHr5OTUny1/ERP8Ex26t5hv3LYOMc2yO1B
         S7C4C5WAY9ZROLBQBX+q17uc27P0Wl1l9w5z8s4vvVYM6INBw8kEhCI1dCJSaftfbi/J
         r2JAepRR1Kn0tXpI/2p2zc657H8zKm4N8YnyIvL0PSLZ2vEx0WPq2hRN/TFVmAtKQheW
         atnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688389429; x=1690981429;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cPBpk9U/09/3mwSB5bUrvUTAuq++fuN/NRKxbA7bKNo=;
        b=HbR1+TJ/ATKeprsUS5EnECW3KQiotfmlv+65+NW4P5U/+RbY57lKTbq/AZGiCUF/B6
         wypTyBaHB4pb7Y1EJPCSjM064yeqYTBysklHY2fXio6CZ9hwiGZiTa8iVBpxYQ3okVla
         z6gekelsA93Y/nYbjzehBkUg2USsIBMb57K8YnYTEsK8pwNHCu0/QK1yi3dr+0Cd/DVh
         NIDj28pLrBEZTY+1SFM9f0Ew7e6SVLuBaUnHbYAQ1t5DbQWxIk1zwQfJvbCSsYcLsrHa
         /0vPb9bi1zJzfznTMcawH3LyilRr627eWIZrgpeg+ZItoT6QDCV44YO6/Zw5uOA0m8Xp
         FZUA==
X-Gm-Message-State: ABy/qLYcrohI9ol1pmuCZEB75v8ClqQkkhaK9Q64lXICwVko2chPcCES
        3CY3ZC8eNsnnppZKbYWi6/atkw==
X-Google-Smtp-Source: APBJJlFzwWsag5H3B4fJAbl6Ppsd6Y16qbcXnimVTA19W+2BGHYWOjsyQihmyCv5gjCQoJYwvqbZ2w==
X-Received: by 2002:a5d:5542:0:b0:314:3aa5:d285 with SMTP id g2-20020a5d5542000000b003143aa5d285mr1272124wrw.11.1688389428832;
        Mon, 03 Jul 2023 06:03:48 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id d5-20020adff845000000b003141b9ddab3sm10587287wrq.114.2023.07.03.06.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 06:03:48 -0700 (PDT)
Date:   Mon, 3 Jul 2023 15:03:47 +0200
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
Subject: Re: [PATCH v4 08/10] Documentation: admin-guide: Add riscv
 sysctl_perf_user_access
Message-ID: <20230703-c7f3e773f50ed6c934662f3f@orel>
References: <20230703124647.215952-1-alexghiti@rivosinc.com>
 <20230703124647.215952-9-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230703124647.215952-9-alexghiti@rivosinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jul 03, 2023 at 02:46:45PM +0200, Alexandre Ghiti wrote:
> riscv now uses this sysctl so document its usage for this architecture.
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  Documentation/admin-guide/sysctl/kernel.rst | 27 ++++++++++++++++++---
>  1 file changed, 23 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
> index d85d90f5d000..19b627883313 100644
> --- a/Documentation/admin-guide/sysctl/kernel.rst
> +++ b/Documentation/admin-guide/sysctl/kernel.rst
> @@ -941,16 +941,35 @@ enabled, otherwise writing to this file will return ``-EBUSY``.
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
>  
> +When set to 1, user space can read performance monitor counter registers
> +directly.
> +
>  See Documentation/arm64/perf.rst for more information.
>  
> +riscv
> +=====
> +
> +When set to 0, user space access is disabled.
> +
> +The default value is 1, user space can read performance monitor counter
> +registers through perf, any direct access without perf intervention will trigger
> +an illegal instruction.
> +
> +When set to 2, which enables legacy mode (user space has direct access to cycle
> +and insret CSRs only). Note that this legacy value is deprecated and will be
> +removed once all user space applications are fixed.
> +
> +Note that the time CSR is always directly accessible to all modes.
>  
>  pid_max
>  =======
> -- 
> 2.39.2
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
