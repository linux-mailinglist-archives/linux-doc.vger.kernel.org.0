Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D45ED6A9E0B
	for <lists+linux-doc@lfdr.de>; Fri,  3 Mar 2023 18:55:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231488AbjCCRz1 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 3 Mar 2023 12:55:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231493AbjCCRz0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 3 Mar 2023 12:55:26 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24C651027A
        for <linux-doc@vger.kernel.org>; Fri,  3 Mar 2023 09:55:25 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id i10so3501936plr.9
        for <linux-doc@vger.kernel.org>; Fri, 03 Mar 2023 09:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1677866124;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qRWO/a0makPL7j0XITCw1g2YJTUyDK+2r5VDGpGpgco=;
        b=MewXJ09TAhZZU3SsVCmawiuEScOiCFcck9Ego9SXXtTRwrfEQNk8A4OdzL78aldjYc
         ULORaf8aWSIKLB0D2sfg8sUO3CHutDWOvkJlrkNiKidiQvzcN77g4k/c9bF5G5Kcfl3q
         EObgbGKKx+zSCQOsOIswVYilE21ZJ9/onqk84hEE3RDrr4tPDTWHTr592gKuj3rFMexh
         z2Vrhf+GrrWd6D15ri5SOo8b5JTYokU/g1aQpLE2DPSECqnZ19qWms3T0PSpQvB2bLEv
         KUMtSmV3jtcklEzhwwWUKAkAqNuJwyqWhMcv9ULrFIqNq37cfbY4ZSntLmbTwWeFpHpA
         hRBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677866124;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qRWO/a0makPL7j0XITCw1g2YJTUyDK+2r5VDGpGpgco=;
        b=uKUNQ4JVQ2Z4snHIiN/il8G2i/w3hfK2izUBLFmpDhKzzlgyqsGVdYnxrZUHNNuxVL
         +ZnMRNLLBRc0SUE98F7f9M35D2l1dpM+ouMKaY73H3Vqmj0bqCZoTUtu19N3IZQBPKAp
         X05nkrhWKgEvvEcG5rCT+t48O84e3FVTUz0OZufzpFZ1dobQ5j5cWQ9df49pwdmgsLla
         GzwEn9DFaAR/EBqDSAHj01mrDBVjM2aaAVTWPRhKA29oAprHm2tFCZC9NNFHPtqtQFnx
         v9PPoXVd0OtVTuShvgUpBDnmf3hHc6WpWpOzaw07mlzrZOHZrAaOEt5tUViXDJEQVSy+
         /skA==
X-Gm-Message-State: AO0yUKV293+iNuHsMUp1EdLZqzYiWDB4Zdku3HezJEhuDtt3SektmDco
        ZH8kkG0XleU1HT5wBFp6tZTbfg==
X-Google-Smtp-Source: AK7set90R3peqzliFYxhEWKEcycvlf7/ubtd7KlEN2lKwGwj0JvfWi02bngMzYS1uqf6HGFQqBAfyg==
X-Received: by 2002:a17:902:e884:b0:19e:845d:d898 with SMTP id w4-20020a170902e88400b0019e845dd898mr2904318plg.14.1677866124605;
        Fri, 03 Mar 2023 09:55:24 -0800 (PST)
Received: from sunil-laptop ([49.206.8.117])
        by smtp.gmail.com with ESMTPSA id y20-20020a170902ed5400b001963a178dfcsm1780752plb.244.2023.03.03.09.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 09:55:24 -0800 (PST)
Date:   Fri, 3 Mar 2023 23:25:16 +0530
From:   Sunil V L <sunilvl@ventanamicro.com>
To:     Andrew Jones <ajones@ventanamicro.com>
Cc:     linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Anup Patel <apatel@ventanamicro.com>,
        Atish Patra <atishp@rivosinc.com>,
        'Conor Dooley ' <conor.dooley@microchip.com>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Subject: Re: [PATCH V3 12/20] RISC-V: cpufeature: Add ACPI support in
 riscv_fill_hwcap()
Message-ID: <ZAI0hFuJjA8ikf2p@sunil-laptop>
References: <20230303133647.845095-1-sunilvl@ventanamicro.com>
 <20230303133647.845095-13-sunilvl@ventanamicro.com>
 <20230303161647.mksonnutzaw4d3gb@orel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230303161647.mksonnutzaw4d3gb@orel>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Mar 03, 2023 at 05:16:47PM +0100, Andrew Jones wrote:
> On Fri, Mar 03, 2023 at 07:06:39PM +0530, Sunil V L wrote:
> > On ACPI based systems, the information about the hart
> > like ISA is provided by the RISC-V Hart Capabilities Table (RHCT).
> > Enable filling up hwcap structure based on the information in RHCT.
> > 
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > ---
> >  arch/riscv/kernel/cpufeature.c | 41 ++++++++++++++++++++++++++--------
> >  1 file changed, 32 insertions(+), 9 deletions(-)
> > 
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > index 59d58ee0f68d..478dbf129922 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -6,6 +6,7 @@
> >   * Copyright (C) 2017 SiFive
> >   */
> >  
> > +#include <linux/acpi.h>
> >  #include <linux/bitmap.h>
> >  #include <linux/ctype.h>
> >  #include <linux/libfdt.h>
> > @@ -13,6 +14,8 @@
> >  #include <linux/memory.h>
> >  #include <linux/module.h>
> >  #include <linux/of.h>
> > +#include <linux/of_device.h>
> > +#include <asm/acpi.h>
> >  #include <asm/alternative.h>
> >  #include <asm/cacheflush.h>
> >  #include <asm/errata_list.h>
> > @@ -91,7 +94,9 @@ void __init riscv_fill_hwcap(void)
> >  	char print_str[NUM_ALPHA_EXTS + 1];
> >  	int i, j, rc;
> >  	unsigned long isa2hwcap[26] = {0};
> > -	unsigned long hartid;
> > +	struct acpi_table_header *rhct;
> > +	acpi_status status;
> > +	unsigned int cpu;
> >  
> >  	isa2hwcap['i' - 'a'] = COMPAT_HWCAP_ISA_I;
> >  	isa2hwcap['m' - 'a'] = COMPAT_HWCAP_ISA_M;
> > @@ -104,18 +109,33 @@ void __init riscv_fill_hwcap(void)
> >  
> >  	bitmap_zero(riscv_isa, RISCV_ISA_EXT_MAX);
> >  
> > -	for_each_of_cpu_node(node) {
> > +	if (!acpi_disabled) {
> > +		status = acpi_get_table(ACPI_SIG_RHCT, 0, &rhct);
> > +		if (ACPI_FAILURE(status))
> > +			return;
> > +	}
> > +
> > +	for_each_possible_cpu(cpu) {
> >  		unsigned long this_hwcap = 0;
> >  		DECLARE_BITMAP(this_isa, RISCV_ISA_EXT_MAX);
> >  		const char *temp;
> >  
> > -		rc = riscv_of_processor_hartid(node, &hartid);
> > -		if (rc < 0)
> > -			continue;
> 
> The above is an unrelated cleanup and should be in a separate patch.
> 
Okay, let me split this.

Thanks,
Sunil
