Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC75F6A1C24
	for <lists+linux-doc@lfdr.de>; Fri, 24 Feb 2023 13:29:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229829AbjBXM3j (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 24 Feb 2023 07:29:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229906AbjBXM3i (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 24 Feb 2023 07:29:38 -0500
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 261EC55C2F
        for <linux-doc@vger.kernel.org>; Fri, 24 Feb 2023 04:29:31 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id i3so6136905plg.6
        for <linux-doc@vger.kernel.org>; Fri, 24 Feb 2023 04:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I64OIj5JM5jVLmuB1aGRMosStTA9JU6adN4APAydm64=;
        b=brp9cb638P51eq5ehuHgI2HFngdi1uyqvFfnsN0iNV6jajEV4Lbv4g4fsWhjOEE+j0
         Ui3ro/7bG8IoQZMs/RVYwWzfr6jFfVRUXTFjxW4WnXECCU9VONc8cvKvKstMJDqrvgcG
         FRcwRFD3shxmmND0s/fh5FpN+2n38gNFwX2kieY3QmNbi3OUH2u1tYKDZEXjW4/NcuBU
         IlH7A/Gbmz1tHnK65v+Ad3D6rvzfZeJ/lpaYkdHXsbyOX34vl3PSxEbNpJjyG+TNW4VX
         dYxdQd4byJG/hUZNn8AwtzhsgLAaB78s/8OQzAZP20Sw0C8/U31n2288sy2gG6pN5ib5
         4CDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I64OIj5JM5jVLmuB1aGRMosStTA9JU6adN4APAydm64=;
        b=goskdZQ6nHvgqAa/nyoEcf0lTFPWM6uas23k3tJQ6NR+hQgO2PMjxH9ylvRRdtiqI4
         I85P8yOaO6LZ2uK6e3Q9NMoZZcwT3JAq6fJmqeq+57RGW7MpWDULqAi33i5syldJKBTq
         oruqt7lD7V8B/h3HOhkmB1zoiqepM2DghQyu2fa32Uk9Ulrl54sxx+wyny5Om9jJPtm7
         pSsjiU4fpAoYlrrsMkQYMJ7Z/rqCZvDFVLRajzER80Nx8rbX2koQwLhkRngsVswMtdVm
         AeAjnWHeSLzdzXFFJBr/qe6MrHDOFz5ltgEzfwtvzWA9bfY4IGea7sN0rZooWlp+cp7W
         W7Gg==
X-Gm-Message-State: AO0yUKVNxwulPNCYKhfE+mjSwVKKN2wMeJdUNQRdfK0RQboUTyD163jm
        RbRu7Iu/3h4thFligcJGQj+DUg==
X-Google-Smtp-Source: AK7set++3aPbfhVhU7RzG1W+bNoSLXJ5kLpnrFXm+bGTgYrXsXUtOzbg4lBwpNZZFrbYZW6O3YaNXQ==
X-Received: by 2002:a17:90b:3a8f:b0:237:9cc7:28a4 with SMTP id om15-20020a17090b3a8f00b002379cc728a4mr1197994pjb.14.1677241770561;
        Fri, 24 Feb 2023 04:29:30 -0800 (PST)
Received: from sunil-laptop ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id g9-20020a17090a9b8900b0022bb3ee9b68sm1458634pjp.13.2023.02.24.04.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 04:29:30 -0800 (PST)
Date:   Fri, 24 Feb 2023 17:59:21 +0530
From:   Sunil V L <sunilvl@ventanamicro.com>
To:     Andrew Jones <ajones@ventanamicro.com>
Cc:     Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Conor Dooley <conor.dooley@microchip.com>,
        Anup Patel <apatel@ventanamicro.com>,
        Atish Patra <atishp@rivosinc.com>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Subject: Re: [PATCH V2 14/21] irqchip/riscv-intc: Add ACPI support
Message-ID: <Y/itoXOnbmmYAwoJ@sunil-laptop>
References: <20230216182043.1946553-1-sunilvl@ventanamicro.com>
 <20230216182043.1946553-15-sunilvl@ventanamicro.com>
 <20230220193714.kuef6sfg7xmdyfty@orel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230220193714.kuef6sfg7xmdyfty@orel>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Feb 20, 2023 at 08:37:14PM +0100, Andrew Jones wrote:
> On Thu, Feb 16, 2023 at 11:50:36PM +0530, Sunil V L wrote:
> > Add support for initializing the RISC-V INTC driver on ACPI
> > platforms.
> > 
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > ---
> >  drivers/irqchip/irq-riscv-intc.c | 78 +++++++++++++++++++++++++++-----
> >  1 file changed, 66 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/irqchip/irq-riscv-intc.c b/drivers/irqchip/irq-riscv-intc.c
> > index f229e3e66387..97a8db0fbc6c 100644
> > --- a/drivers/irqchip/irq-riscv-intc.c
> > +++ b/drivers/irqchip/irq-riscv-intc.c
> > @@ -6,6 +6,7 @@
> >   */
> >  
> >  #define pr_fmt(fmt) "riscv-intc: " fmt
> > +#include <linux/acpi.h>
> >  #include <linux/atomic.h>
> >  #include <linux/bits.h>
> >  #include <linux/cpu.h>
> > @@ -112,6 +113,30 @@ static struct fwnode_handle *riscv_intc_hwnode(void)
> >  	return intc_domain->fwnode;
> >  }
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
> >  static int __init riscv_intc_init(struct device_node *node,
> >  				  struct device_node *parent)
> >  {
> > @@ -133,24 +158,53 @@ static int __init riscv_intc_init(struct device_node *node,
> >  	if (riscv_hartid_to_cpuid(hartid) != smp_processor_id())
> >  		return 0;
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
> >  	if (rc) {
> > -		pr_err("failed to set irq handler\n");
> > +		pr_err("failed to initialize INTC\n");
> >  		return rc;
> >  	}
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
> 
> Please keep the function and its return type on the same line. We can go
> to 100 chars.
> 
Yes, missed updating this instance. Thanks!

Thanks,
Sunil
