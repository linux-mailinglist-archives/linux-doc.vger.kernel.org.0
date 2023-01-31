Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1BDF8682862
	for <lists+linux-doc@lfdr.de>; Tue, 31 Jan 2023 10:13:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232585AbjAaJNl (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 31 Jan 2023 04:13:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232532AbjAaJNW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 31 Jan 2023 04:13:22 -0500
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46C704E52D
        for <linux-doc@vger.kernel.org>; Tue, 31 Jan 2023 01:11:13 -0800 (PST)
Received: by mail-pf1-x42c.google.com with SMTP id c124so9749953pfb.8
        for <linux-doc@vger.kernel.org>; Tue, 31 Jan 2023 01:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+G7LKm94Gh8IveRXkVxzmqetNifcC6zGcwfVmKZiIxU=;
        b=eqXSbhCEC9s02q8nHxUEus2+H/2Y0rvRKIp9bmt9yZfTuOssg1+p7nndjt2NON5wIW
         0/xDxXb9svWhNEqPLB2Rkr2XW12YJIgZLHJUxwc0oD+YaTcloroWP2GQkUwK+y+rcFij
         yzwEDLuRbzZv/qbhS6M4i67X+ja+AFpECod3dAEHZNGXfwqFJdUtRuZEqhVKkIh/jbTc
         u5WZQInCjtsSmScQ182N0Rn8PUceGOmZ46ulxNvHkMWH9xtNpDxiA8fFGaKzebqxW9LB
         KgY3T9Sy1JDPUittTemk7HZycvL7LywHjj+jk2cmQYG6Qc22WgvPMX58TH4Hixxm7rrQ
         6aJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+G7LKm94Gh8IveRXkVxzmqetNifcC6zGcwfVmKZiIxU=;
        b=rlhBahU0aWTmv4SUafhqTAEsHusO0LVOwh94A9+kApLSK72PrwakFvSm1VBjv0TXpF
         su0K/I0nv4Y9gwxgNGmRLMfcPsRdSTtVL4Dn8tXenIXYHUnTDTnqJAay91yCrB+D6A1K
         Hr9FZxTG6Bw5qZxaahsZozf1kxj8+J5sO4kmhICDob7UXaLVdAEiAtVKzZ2YBv15Eu5M
         jCw3AGy0OxMYOAsjfxiNpC/HnHqpWnqOi1/E9iKEGvtsfeINLaDsfDT1mxmoxryWYm2V
         KRO5hNBxJ8cgFcPmZO6Yfgn+3kMopGMcdNoTlMVk/mOm9qYHIFtk9CW6z2Bu6DHrZY9q
         KeCw==
X-Gm-Message-State: AO0yUKVhLFZkepIgAW18Ze5gA/i1WPYfsX1sXKqp5fftB02bxsv7PU1o
        UYYEtD44/czTbBDbVTfKCP3BjQ==
X-Google-Smtp-Source: AK7set9Wno7a0XYRFhzJYb6jckFGgD3MgmlKDmdJYnMg7BAjHupX6GqxvIMpR9adRETeVxpQn4ox6A==
X-Received: by 2002:a05:6a00:1483:b0:592:61a5:40 with SMTP id v3-20020a056a00148300b0059261a50040mr15751149pfu.16.1675156269503;
        Tue, 31 Jan 2023 01:11:09 -0800 (PST)
Received: from sunil-laptop ([49.206.9.96])
        by smtp.gmail.com with ESMTPSA id bt26-20020a056a00439a00b0058a7bacd31fsm6540587pfb.32.2023.01.31.01.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 01:11:09 -0800 (PST)
Date:   Tue, 31 Jan 2023 14:41:00 +0530
From:   Sunil V L <sunilvl@ventanamicro.com>
To:     Jessica Clarke <jrtc27@jrtc27.com>
Cc:     Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Anup Patel <apatel@ventanamicro.com>,
        linux-doc@vger.kernel.org, Atish Patra <atishp@rivosinc.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-acpi@vger.kernel.org, linux-riscv@lists.infradead.org,
        Andrew Jones <ajones@ventanamicro.com>
Subject: Re: [PATCH 11/24] RISC-V: ACPI: irqchip/riscv-intc: Add ACPI support
Message-ID: <Y9jbJDwuJ0RnkviA@sunil-laptop>
References: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
 <20230130182225.2471414-12-sunilvl@ventanamicro.com>
 <AFDD5897-27A3-4418-B08B-9650B543692D@jrtc27.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AFDD5897-27A3-4418-B08B-9650B543692D@jrtc27.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Jessica,

On Mon, Jan 30, 2023 at 11:38:49PM +0000, Jessica Clarke wrote:
> On 30 Jan 2023, at 18:22, Sunil V L <sunilvl@ventanamicro.com> wrote:
> > 
> > Add support for initializing the RISC-V INTC driver on ACPI based
> > platforms.
> > 
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > ---
> > drivers/irqchip/irq-riscv-intc.c | 79 +++++++++++++++++++++++++++-----
> > 1 file changed, 67 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/irqchip/irq-riscv-intc.c b/drivers/irqchip/irq-riscv-intc.c
> > index f229e3e66387..044ec92fcba7 100644
> > --- a/drivers/irqchip/irq-riscv-intc.c
> > +++ b/drivers/irqchip/irq-riscv-intc.c
> > @@ -6,6 +6,7 @@
> >  */
> > 
> > #define pr_fmt(fmt) "riscv-intc: " fmt
> > +#include <linux/acpi.h>
> > #include <linux/atomic.h>
> > #include <linux/bits.h>
> > #include <linux/cpu.h>
> > @@ -112,6 +113,30 @@ static struct fwnode_handle *riscv_intc_hwnode(void)
> > 	return intc_domain->fwnode;
> > }
> > 
> > +static int __init riscv_intc_init_common(struct fwnode_handle *fn)
> > +{
> > +	int rc;
> > +
> > +	intc_domain = irq_domain_create_linear(fn, BITS_PER_LONG,
> > +					       &riscv_intc_domain_ops, NULL);
> > +	if (!intc_domain) {
> > +		pr_err("unable to add IRQ domain\n");
> > +		return -ENXIO;
> > +	}
> > +
> > +	rc = set_handle_irq(&riscv_intc_irq);
> > +	if (rc) {
> > +		pr_err("failed to set irq handler\n");
> > +		return rc;
> > +	}
> > +
> > +	riscv_set_intc_hwnode_fn(riscv_intc_hwnode);
> > +
> > +	pr_info("%d local interrupts mapped\n", BITS_PER_LONG);
> > +
> > +	return 0;
> > +}
> > +
> > static int __init riscv_intc_init(struct device_node *node,
> > 				  struct device_node *parent)
> > {
> > @@ -133,24 +158,54 @@ static int __init riscv_intc_init(struct device_node *node,
> > 	if (riscv_hartid_to_cpuid(hartid) != smp_processor_id())
> > 		return 0;
> > 
> > -	intc_domain = irq_domain_add_linear(node, BITS_PER_LONG,
> > -					    &riscv_intc_domain_ops, NULL);
> > -	if (!intc_domain) {
> > -		pr_err("unable to add IRQ domain\n");
> > -		return -ENXIO;
> > -	}
> > -
> > -	rc = set_handle_irq(&riscv_intc_irq);
> > +	rc = riscv_intc_init_common(of_node_to_fwnode(node));
> > 	if (rc) {
> > -		pr_err("failed to set irq handler\n");
> > +		pr_err("failed to initialize INTC\n");
> > 		return rc;
> > 	}
> > 
> > -	riscv_set_intc_hwnode_fn(riscv_intc_hwnode);
> > +	return 0;
> > +}
> > 
> > -	pr_info("%d local interrupts mapped\n", BITS_PER_LONG);
> > +IRQCHIP_DECLARE(riscv, "riscv,cpu-intc", riscv_intc_init);
> > +
> > +#ifdef CONFIG_ACPI
> > +
> > +static int __init
> > +riscv_intc_acpi_init(union acpi_subtable_headers *header,
> > +		     const unsigned long end)
> > +{
> > +	int rc;
> > +	struct fwnode_handle *fn;
> > +	struct acpi_madt_rintc *rintc;
> > +
> > +	rintc = (struct acpi_madt_rintc *)header;
> > +
> > +	/*
> > +	 * The ACPI MADT will have one INTC for each CPU (or HART)
> > +	 * so riscv_intc_acpi_init() function will be called once
> > +	 * for each INTC. We only need to do INTC initialization
> > +	 * for the INTC belonging to the boot CPU (or boot HART).
> > +	 */
> > +	if (riscv_hartid_to_cpuid(rintc->hart_id) != smp_processor_id())
> > +		return 0;
> 
> Why are we carrying forward this mess to ACPI? The DT bindings are
> awful and a complete pain to deal with, as evidenced by how both Linux
> and FreeBSD have to go out of their way to do special things to only
> look at one of the many copies of the same thing.
>

Local interrupt controller structures are per-cpu in any architecture.
So, there will be multiple such structures. It is upto the OS to choose
one of them. What is the issue here?

The RISC-V DT code is selecting the one which is corresponding to the boot
cpu. While in ACPI we can choose any one, I think it is better to
follow the DT code to keep it similar and boot cpu is always guaranteed
to be available.

Thanks!
Sunil
