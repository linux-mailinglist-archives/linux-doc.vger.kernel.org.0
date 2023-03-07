Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E85256AD948
	for <lists+linux-doc@lfdr.de>; Tue,  7 Mar 2023 09:32:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229571AbjCGIca (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 7 Mar 2023 03:32:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229558AbjCGIc3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 7 Mar 2023 03:32:29 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EBBEB473;
        Tue,  7 Mar 2023 00:32:26 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id BB17EB811BB;
        Tue,  7 Mar 2023 08:32:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34CC7C433EF;
        Tue,  7 Mar 2023 08:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678177943;
        bh=xem4cnyElkfHouIQJkIc1dnubLF73jjz9tUkSaamQBk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=OpS98nduUfx3C1yvxIKqxIGqbrpeB/C9wOs3ilzSHWUnrAzCd3tufYFih5GQf8pML
         UsaBsVbks4ymGtjGFNDK9egc9XqBboxAcnKNtQJfCcLQARbMjwX4htlpbtq4MsVH1F
         LTI7C+asdKju2KTHF1yYl7hFHP8lMBcH5Odwo/NFlVocRjciO0h7H2zhwfB+unxPde
         TYkJjwEwY4rLeFbc9m2VxH0k+mdrEfofuPwYE6KvePkbDKVXItNlu4gyiri6wiUXa6
         lozY2Mp9amDbo9IsFcQmd47pdPGouHZIsf/bm8wD3VNNpdfpxYyUITlQeBHI4/UA2u
         Q95wNI4/CBp/w==
Received: from ip-185-104-136-29.ptr.icomera.net ([185.104.136.29] helo=wait-a-minute.misterjones.org)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.95)
        (envelope-from <maz@kernel.org>)
        id 1pZSk7-00FTPz-Ho;
        Tue, 07 Mar 2023 08:32:20 +0000
Date:   Tue, 07 Mar 2023 08:32:02 +0000
Message-ID: <87ilfdgdx9.wl-maz@kernel.org>
From:   Marc Zyngier <maz@kernel.org>
To:     Shanker Donthineni <sdonthineni@nvidia.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Vikram Sethi <vsethi@nvidia.com>,
        Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH] irqchip/gicv3: Workaround for NVIDIA erratum T241-FABRIC-4
In-Reply-To: <20230306013148.3483335-1-sdonthineni@nvidia.com>
References: <20230306013148.3483335-1-sdonthineni@nvidia.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/27.1
 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.104.136.29
X-SA-Exim-Rcpt-To: sdonthineni@nvidia.com, tglx@linutronix.de, catalin.marinas@arm.com, will@kernel.org, corbet@lwn.net, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, vsethi@nvidia.com, treding@nvidia.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 06 Mar 2023 01:31:48 +0000,
Shanker Donthineni <sdonthineni@nvidia.com> wrote:
> 
> The purpose of this patch is to address the T241 erratum T241-FABRIC-4,
> which causes unexpected behavior in the GIC when multiple transactions

nit: "The purpose of this patch" is superfluous. Instead, write
something like:

"The T241 platform suffers from the T241-FABRIC-4 erratum which
causes..."

> are received simultaneously from different sources. This hardware issue
> impacts NVIDIA server platforms that use more than two T241 chips
> interconnected. Each chip has support for 320 {E}SPIs.
> 
> This issue occurs when multiple packets from different GICs are
> incorrectly interleaved at the target chip. The erratum text below
> specifies exactly what can cause multiple transfer packets susceptible
> to interleaving and GIC state corruption. GIC state corruption can
> lead to a range of problems, including kernel panics, and unexpected
> behavior.
> 
> From the erratum text:
>   "In some cases, inter-socket AXI4 Stream packets with multiple
>   transfers, may be interleaved by the fabric when presented to ARM
>   Generic Interrupt Controller. GIC expects all transfers of a packet
>   to be delivered without any interleaving.
> 
>   The following GICv3 commands may result in multiple transfer packets
>   over inter-socket AXI4 Stream interface:
>    - Register reads from GICD_I* and GICD_N*
>    - Register writes to 64-bit GICD registers other than GICD_IROUTERn*
>    - ITS command MOVALL

Does is also affect cross-chip traffic such as SPI deactivation?

> 
>   Multiple commands in GICv4+ utilize multiple transfer packets,
>   including VMOVP, VMOVI and VMAPP.
> 
>   This issue impacts system configurations with more than 2 sockets,
>   that require multi-transfer packets to be sent over inter-socket
>   AXI4 Stream interface between GIC instances on different sockets.
>   GICv4 cannot be supported. GICv3 SW model can only be supported
>   with the workaround. Single and Dual socket configurations are not
>   impacted by this issue and support GICv3 and GICv4."

Do you have a public link to this erratum? This is really something
that we should be go back to when changing things in the GIC code
(should we ever use MOVALL, for example).

But kudos for disclosing the problem -- this is a much better attitude
than the usual "hide the crap under the carpet" upheld by the other
platform vendors.

> 
> To fix this problem, the patch implements a workaround that ensures

s/this patch implements/implement/

> read accesses to the GICD_In{E} registers are directed to the chip
> that owns the SPI, and disables GICv4.x features for KVM.
> 
> Signed-off-by: Shanker Donthineni <sdonthineni@nvidia.com>
> Signed-off-by: Vikram Sethi <vsethi@nvidia.com>

This SoB chain looks wrong. It needs at least a Co-developed-by: tag.

> ---
>  Documentation/arm64/silicon-errata.rst |   2 +
>  drivers/irqchip/irq-gic-common.c       |  10 +-
>  drivers/irqchip/irq-gic-common.h       |   3 +-
>  drivers/irqchip/irq-gic-v3.c           | 124 +++++++++++++++++++++++--
>  drivers/irqchip/irq-gic.c              |   3 +-
>  drivers/irqchip/irq-hip04.c            |   2 +-
>  6 files changed, 131 insertions(+), 13 deletions(-)
> 
> diff --git a/Documentation/arm64/silicon-errata.rst b/Documentation/arm64/silicon-errata.rst
> index ec5f889d76819..e31f6c0687041 100644
> --- a/Documentation/arm64/silicon-errata.rst
> +++ b/Documentation/arm64/silicon-errata.rst
> @@ -172,6 +172,8 @@ stable kernels.
>  +----------------+-----------------+-----------------+-----------------------------+
>  | NVIDIA         | Carmel Core     | N/A             | NVIDIA_CARMEL_CNP_ERRATUM   |
>  +----------------+-----------------+-----------------+-----------------------------+
> +| NVIDIA         | T241 GICv3/4.x  | T241-FABRIC-4   | N/A                         |
> ++----------------+-----------------+-----------------+-----------------------------+
>  +----------------+-----------------+-----------------+-----------------------------+
>  | Freescale/NXP  | LS2080A/LS1043A | A-008585        | FSL_ERRATUM_A008585         |
>  +----------------+-----------------+-----------------+-----------------------------+
> diff --git a/drivers/irqchip/irq-gic-common.c b/drivers/irqchip/irq-gic-common.c
> index a610821c8ff2a..83b2187d342af 100644
> --- a/drivers/irqchip/irq-gic-common.c
> +++ b/drivers/irqchip/irq-gic-common.c
> @@ -39,7 +39,8 @@ void gic_enable_quirks(u32 iidr, const struct gic_quirk *quirks,
>  }
>  
>  int gic_configure_irq(unsigned int irq, unsigned int type,
> -		       void __iomem *base, void (*sync_access)(void))
> +		      void __iomem *base, void (*sync_access)(void),
> +		      void __iomem *base_read_alias)
>  {
>  	u32 confmask = 0x2 << ((irq % 16) * 2);
>  	u32 confoff = (irq / 16) * 4;
> @@ -52,7 +53,10 @@ int gic_configure_irq(unsigned int irq, unsigned int type,
>  	 * for "irq", depending on "type".
>  	 */
>  	raw_spin_lock_irqsave(&irq_controller_lock, flags);
> -	val = oldval = readl_relaxed(base + confoff);
> +	if (base_read_alias == NULL)
> +		base_read_alias = base;
> +
> +	val = oldval = readl_relaxed(base_read_alias + confoff);
>  	if (type & IRQ_TYPE_LEVEL_MASK)
>  		val &= ~confmask;
>  	else if (type & IRQ_TYPE_EDGE_BOTH)
> @@ -73,7 +77,7 @@ int gic_configure_irq(unsigned int irq, unsigned int type,
>  	 * non-secure mode, and hence it may not be catastrophic.
>  	 */
>  	writel_relaxed(val, base + confoff);
> -	if (readl_relaxed(base + confoff) != val)
> +	if (readl_relaxed(base_read_alias + confoff) != val)
>  		ret = -EINVAL;

Do we really need the two base addresses? For a given SPI range
belonging to a given distributor, you should be able to use the same
MMIO region for both read and writes.

This would save a lot of churn.

Or is there another requirement that writes always happen via the
global alias?

>  
>  	raw_spin_unlock_irqrestore(&irq_controller_lock, flags);
> diff --git a/drivers/irqchip/irq-gic-common.h b/drivers/irqchip/irq-gic-common.h
> index 27e3d4ed4f328..c955f83d1f8f2 100644
> --- a/drivers/irqchip/irq-gic-common.h
> +++ b/drivers/irqchip/irq-gic-common.h
> @@ -19,7 +19,8 @@ struct gic_quirk {
>  };
>  
>  int gic_configure_irq(unsigned int irq, unsigned int type,
> -                       void __iomem *base, void (*sync_access)(void));
> +		      void __iomem *base, void (*sync_access)(void),
> +		      void __iomem *base_read_alias);
>  void gic_dist_config(void __iomem *base, int gic_irqs,
>  		     void (*sync_access)(void));
>  void gic_cpu_config(void __iomem *base, int nr, void (*sync_access)(void));
> diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
> index 997104d4338e7..f460f832c87e6 100644
> --- a/drivers/irqchip/irq-gic-v3.c
> +++ b/drivers/irqchip/irq-gic-v3.c
> @@ -45,6 +45,13 @@ struct redist_region {
>  	bool			single_redist;
>  };
>  
> +/* Distributor alias region for {E}SPIs registers */
> +struct dist_base_alias {
> +	u32		intid_start;
> +	u32		intid_end;
> +	void __iomem	*base;
> +};
> +
>  struct gic_chip_data {
>  	struct fwnode_handle	*fwnode;
>  	void __iomem		*dist_base;
> @@ -57,8 +64,12 @@ struct gic_chip_data {
>  	bool			has_rss;
>  	unsigned int		ppi_nr;
>  	struct partition_desc	**ppi_descs;
> +	struct dist_base_alias	*base_read_aliases;
> +	u32			nr_dist_base_aliases;
>  };
>  
> +static DEFINE_STATIC_KEY_FALSE(gic_nvidia_t241_erratum);
> +
>  static struct gic_chip_data gic_data __read_mostly;
>  static DEFINE_STATIC_KEY_TRUE(supports_deactivate_key);
>  
> @@ -188,6 +199,26 @@ static inline bool gic_irq_in_rdist(struct irq_data *d)
>  	}
>  }
>  
> +static inline void __iomem *gic_dist_base_read_alias(irq_hw_number_t intid)
> +{
> +	struct dist_base_alias *base_alias;
> +	int i;
> +
> +	if (static_branch_unlikely(&gic_nvidia_t241_erratum)) {
> +		base_alias = gic_data.base_read_aliases;
> +		for (i = 0; i < gic_data.nr_dist_base_aliases; i++) {
> +			if (base_alias->base &&
> +			   (intid >= base_alias->intid_start) &&
> +			   (intid <= base_alias->intid_end)) {
> +				return base_alias->base;
> +			}
> +			base_alias++;
> +		}
> +	}

Each distributor has the exact same number of SPIs. So why isn't this
just a division that gives you a distributor number?

> +
> +	return gic_data.dist_base;
> +}
> +
>  static inline void __iomem *gic_dist_base(struct irq_data *d)
>  {
>  	switch (get_intid_range(d)) {
> @@ -346,7 +377,7 @@ static int gic_peek_irq(struct irq_data *d, u32 offset)
>  	if (gic_irq_in_rdist(d))
>  		base = gic_data_rdist_sgi_base();
>  	else
> -		base = gic_data.dist_base;
> +		base = gic_dist_base_read_alias(irqd_to_hwirq(d));
>  
>  	return !!(readl_relaxed(base + offset + (index / 32) * 4) & mask);
>  }
> @@ -580,6 +611,7 @@ static int gic_set_type(struct irq_data *d, unsigned int type)
>  	enum gic_intid_range range;
>  	unsigned int irq = gic_irq(d);
>  	void __iomem *base;
> +	void __iomem *base_read_alias;
>  	u32 offset, index;
>  	int ret;
>  
> @@ -594,14 +626,17 @@ static int gic_set_type(struct irq_data *d, unsigned int type)
>  	    type != IRQ_TYPE_LEVEL_HIGH && type != IRQ_TYPE_EDGE_RISING)
>  		return -EINVAL;
>  
> -	if (gic_irq_in_rdist(d))
> +	if (gic_irq_in_rdist(d)) {
>  		base = gic_data_rdist_sgi_base();
> -	else
> +		base_read_alias = base;
> +	} else {
>  		base = gic_data.dist_base;
> +		base_read_alias = gic_dist_base_read_alias(irqd_to_hwirq(d));
> +	}
>  
>  	offset = convert_offset_index(d, GICD_ICFGR, &index);
> -
> -	ret = gic_configure_irq(index, type, base + offset, NULL);
> +	ret = gic_configure_irq(index, type, base + offset, NULL,
> +				base_read_alias + offset);
>  	if (ret && (range == PPI_RANGE || range == EPPI_RANGE)) {
>  		/* Misconfigured PPIs are usually not fatal */
>  		pr_warn("GIC: PPI INTID%d is secure or misconfigured\n", irq);
> @@ -1719,6 +1754,70 @@ static bool gic_enable_quirk_hip06_07(void *data)
>  	return false;
>  }
>  
> +static bool gic_enable_quirk_nvidia_t241(void *data)
> +{
> +#ifdef CONFIG_ACPI
> +	struct dist_base_alias *base_alias;
> +	struct acpi_table_header *madt;
> +	int i, intid, nchips = 0;
> +	acpi_status status;
> +	phys_addr_t phys;
> +
> +	status = acpi_get_table(ACPI_SIG_MADT, 0, &madt);
> +	if (ACPI_FAILURE(status))
> +		return false;
> +
> +	/* Check NVIDIA OEM ID */
> +	if (memcmp(madt->oem_id, "NVIDIA", 6)) {

What guarantees do we have that this string will always be present?
"oem_id" is usually updated to reflect the integrator, not the
silicon vendor.

> +		acpi_put_table(madt);
> +		return false;
> +	}
> +
> +	/* Find the number of chips based on OEM_TABLE_ID */
> +	if ((!memcmp(madt->oem_table_id, "T241x3", 6)) ||
> +	    (!memcmp(madt->oem_table_id, "T241c3", 6))) {
> +		nchips = 3;
> +	} else if ((!memcmp(madt->oem_table_id, "T241x4", 6)) ||
> +		   (!memcmp(madt->oem_table_id, "T241c4", 6))) {
> +		nchips = 4;
> +	}

Same question for these. This seems pretty fragile.

> +
> +	acpi_put_table(madt);
> +	if (nchips < 3)
> +		return false;
> +
> +	base_alias = kmalloc_array(nchips, sizeof(*base_alias),
> +				   GFP_KERNEL | __GFP_ZERO);

You are fully initialising the structures, right? So why the
__GFP_ZERO?

> +	if (!base_alias)
> +		return false;
> +
> +	gic_data.base_read_aliases = base_alias;
> +	gic_data.nr_dist_base_aliases = nchips;
> +
> +	/**
> +	 * Setup GICD alias and {E}SPIs range for each chip
> +	 * {E}SPI blocks mappings:
> +	 *    Chip0 = 00-09
> +	 *    Chip1 = 10-19
> +	 *    Chip2 = 20-29
> +	 *    Chip3 = 30-39

What are these ranges? From the code below, I can (sort of) guess that
each chip has 10 registers in the SPI/ESPI range, with chips 0-1
dealing with SPIs, and chips 2-3 dealing with ESPIs.

It would be a lot clearer if you indicated the actual INTID ranges.

> +	 */
> +	for (i = 0; i < nchips; i++, base_alias++) {
> +		phys = ((1ULL << 44) * i) | 0x23580000;

Where is this address coming from? Can it be inferred from the MADT?
It would also be a lot more readable if written as:

#define CHIP_MASK	GENMASK_ULL(45, 44)
#define CHIP_ALIAS_BASE	0x23580000

		phys = CHIP_ALIAS_BASE;
		phys |= FIELD_PREP(CHIP_MASK, i);

> +		base_alias->base = ioremap(phys, SZ_64K);
> +		WARN_ON(!base_alias->base);
> +
> +		intid = i < 3 ? 32 + i * 10 * 32 : ESPI_BASE_INTID;
> +		base_alias->intid_start = intid;
> +		base_alias->intid_end = intid + 10 * 32 - 1;

This really is obfuscated. And it also shows that we really don't need
the INTID ranges in the data structure. You can easily get to the chip
number with something like:

	switch (__get_intid_range(intid)) {
	case SPI_RANGE:
		chip = (intid - 32) / 320;
		break;
	case ESPI_RANGE:
		chip = (intid - ESPI_BASE_INTID) / 320;
		break;
	}

	alias = base_alias[chip];

Bonus point if you add a #define for the magic numbers.

> +	}
> +	static_branch_enable(&gic_nvidia_t241_erratum);
> +	return true;
> +#else
> +	return false;
> +#endif
> +}

How about moving the whole function under #ifdef CONFIG_ACPI?

> +
>  static const struct gic_quirk gic_quirks[] = {
>  	{
>  		.desc	= "GICv3: Qualcomm MSM8996 broken firmware",
> @@ -1750,6 +1849,12 @@ static const struct gic_quirk gic_quirks[] = {
>  		.mask	= 0xe8f00fff,
>  		.init	= gic_enable_quirk_cavium_38539,
>  	},
> +	{
> +		.desc	= "GICv3: NVIDIA erratum T241-FABRIC-4",
> +		.iidr	= 0x0402043b,
> +		.mask	= 0xffffffff,
> +		.init	= gic_enable_quirk_nvidia_t241,
> +	},

and this as well?

>  	{
>  	}
>  };
> @@ -2377,8 +2482,13 @@ static void __init gic_acpi_setup_kvm_info(void)
>  		vcpu->end = vcpu->start + ACPI_GICV2_VCPU_MEM_SIZE - 1;
>  	}
>  
> -	gic_v3_kvm_info.has_v4 = gic_data.rdists.has_vlpis;
> -	gic_v3_kvm_info.has_v4_1 = gic_data.rdists.has_rvpeid;
> +	if (static_branch_unlikely(&gic_nvidia_t241_erratum)) {
> +		gic_v3_kvm_info.has_v4 = false;
> +		gic_v3_kvm_info.has_v4_1 = false;
> +	} else {
> +		gic_v3_kvm_info.has_v4 = gic_data.rdists.has_vlpis;
> +		gic_v3_kvm_info.has_v4_1 = gic_data.rdists.has_rvpeid;
> +	}
>  	vgic_set_kvm_info(&gic_v3_kvm_info);
>  }
>  
> diff --git a/drivers/irqchip/irq-gic.c b/drivers/irqchip/irq-gic.c
> index 210bc2f4d5550..73575bbf4df67 100644
> --- a/drivers/irqchip/irq-gic.c
> +++ b/drivers/irqchip/irq-gic.c
> @@ -306,7 +306,8 @@ static int gic_set_type(struct irq_data *d, unsigned int type)
>  			    type != IRQ_TYPE_EDGE_RISING)
>  		return -EINVAL;
>  
> -	ret = gic_configure_irq(gicirq, type, base + GIC_DIST_CONFIG, NULL);
> +	ret = gic_configure_irq(gicirq, type, base + GIC_DIST_CONFIG, NULL,
> +				NULL);
>  	if (ret && gicirq < 32) {
>  		/* Misconfigured PPIs are usually not fatal */
>  		pr_warn("GIC: PPI%d is secure or misconfigured\n", gicirq - 16);
> diff --git a/drivers/irqchip/irq-hip04.c b/drivers/irqchip/irq-hip04.c
> index 46161f6ff289d..dc19f48d6f5a5 100644
> --- a/drivers/irqchip/irq-hip04.c
> +++ b/drivers/irqchip/irq-hip04.c
> @@ -130,7 +130,7 @@ static int hip04_irq_set_type(struct irq_data *d, unsigned int type)
>  
>  	raw_spin_lock(&irq_controller_lock);
>  
> -	ret = gic_configure_irq(irq, type, base + GIC_DIST_CONFIG, NULL);
> +	ret = gic_configure_irq(irq, type, base + GIC_DIST_CONFIG, NULL, NULL);
>  	if (ret && irq < 32) {
>  		/* Misconfigured PPIs are usually not fatal */
>  		pr_warn("GIC: PPI%d is secure or misconfigured\n", irq - 16);
> -- 
> 2.25.1
> 
> 

Thanks,

	M.

-- 
Without deviation from the norm, progress is not possible.
