Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C2A614BDD2
	for <lists+linux-doc@lfdr.de>; Tue, 28 Jan 2020 17:34:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726446AbgA1Qe2 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 28 Jan 2020 11:34:28 -0500
Received: from foss.arm.com ([217.140.110.172]:60278 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726190AbgA1Qe2 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 28 Jan 2020 11:34:28 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 39BEB1FB;
        Tue, 28 Jan 2020 08:34:27 -0800 (PST)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8A2B03F68E;
        Tue, 28 Jan 2020 08:34:25 -0800 (PST)
From:   Suzuki Kuruppassery Poulose <suzuki.poulose@arm.com>
Subject: Re: [PATCH v2 1/6] arm64: add support for the AMU extension v1
To:     Ionela Voinescu <ionela.voinescu@arm.com>, catalin.marinas@arm.com,
        will@kernel.org, mark.rutland@arm.com, maz@kernel.org,
        sudeep.holla@arm.com, dietmar.eggemann@arm.com
Cc:     peterz@infradead.org, mingo@redhat.com, ggherdovich@suse.cz,
        vincent.guittot@linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191218182607.21607-1-ionela.voinescu@arm.com>
 <20191218182607.21607-2-ionela.voinescu@arm.com>
Message-ID: <2b62c575-3396-3332-2e39-1c3cce2c4bf0@arm.com>
Date:   Tue, 28 Jan 2020 16:34:24 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20191218182607.21607-2-ionela.voinescu@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 18/12/2019 18:26, Ionela Voinescu wrote:
> The activity monitors extension is an optional extension introduced
> by the ARMv8.4 CPU architecture. This implements basic support for
> version 1 of the activity monitors architecture, AMUv1.
> 
> This support includes:
> - Extension detection on each CPU (boot, secondary, hotplugged)
> - Register interface for AMU aarch64 registers
> - (while here) create defines for ID_PFR0_EL1 fields when adding
>    the AMU field information.
> 
> Signed-off-by: Ionela Voinescu <ionela.voinescu@arm.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> ---
>   arch/arm64/Kconfig                  | 27 ++++++++++
>   arch/arm64/include/asm/cpucaps.h    |  3 +-
>   arch/arm64/include/asm/cpufeature.h |  4 ++
>   arch/arm64/include/asm/sysreg.h     | 44 ++++++++++++++++
>   arch/arm64/kernel/cpufeature.c      | 81 +++++++++++++++++++++++++++--
>   5 files changed, 154 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index ac31ed6184d0..6ae7bfa5812e 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -1485,6 +1485,33 @@ config ARM64_PTR_AUTH
>   
>   endmenu
>   
> +menu "ARMv8.4 architectural features"
> +
> +config ARM64_AMU_EXTN
> +	bool "Enable support for the Activity Monitors Unit CPU extension"
> +	default y
> +	help
> +          The activity monitors extension is an optional extension introduced
> +          by the ARMv8.4 CPU architecture. This enables support for version 1
> +          of the activity monitors architecture, AMUv1.
> +
> +          To enable the use of this extension on CPUs that implement it, say Y.
> +
> +          Note that for architectural reasons, firmware _must_ implement AMU
> +          support when running on CPUs that present the activity monitors
> +          extension. The required support is present in:
> +            * Version 1.5 and later of the ARM Trusted Firmware
> +
> +          For kernels that have this configuration enabled but boot with broken
> +          firmware, you may need to say N here until the firmware is fixed.
> +          Otherwise you may experience firmware panics or lockups when
> +          accessing the counter registers. Even if you are not observing these
> +          symptoms, the values returned by the register reads might not
> +          correctly reflect reality. Most commonly, the value read will be 0,
> +          indicating that the counter is not enabled.
> +
> +endmenu
> +
>   config ARM64_SVE
>   	bool "ARM Scalable Vector Extension support"
>   	default y
> diff --git a/arch/arm64/include/asm/cpucaps.h b/arch/arm64/include/asm/cpucaps.h
> index b92683871119..7dde890bde50 100644
> --- a/arch/arm64/include/asm/cpucaps.h
> +++ b/arch/arm64/include/asm/cpucaps.h
> @@ -56,7 +56,8 @@
>   #define ARM64_WORKAROUND_CAVIUM_TX2_219_PRFM	46
>   #define ARM64_WORKAROUND_1542419		47
>   #define ARM64_WORKAROUND_1319367		48
> +#define ARM64_HAS_AMU_EXTN			49
>   
> -#define ARM64_NCAPS				49
> +#define ARM64_NCAPS				50
>   
>   #endif /* __ASM_CPUCAPS_H */
> diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
> index 4261d55e8506..b89e799d6972 100644
> --- a/arch/arm64/include/asm/cpufeature.h
> +++ b/arch/arm64/include/asm/cpufeature.h
> @@ -673,6 +673,10 @@ static inline bool cpu_has_hw_af(void)
>   						ID_AA64MMFR1_HADBS_SHIFT);
>   }
>   
> +#ifdef CONFIG_ARM64_AMU_EXTN
> +extern inline bool cpu_has_amu_feat(void);
> +#endif
> +
>   #endif /* __ASSEMBLY__ */
>   
>   #endif
> diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
> index 6e919fafb43d..bfcc87953a68 100644
> --- a/arch/arm64/include/asm/sysreg.h
> +++ b/arch/arm64/include/asm/sysreg.h
> @@ -382,6 +382,42 @@
>   #define SYS_TPIDR_EL0			sys_reg(3, 3, 13, 0, 2)
>   #define SYS_TPIDRRO_EL0			sys_reg(3, 3, 13, 0, 3)
>   
> +/* Definitions for system register interface to AMU for ARMv8.4 onwards */
> +#define SYS_AM_EL0(crm, op2)		sys_reg(3, 3, 13, crm, op2)
> +#define SYS_AMCR_EL0			SYS_AM_EL0(2, 0)
> +#define SYS_AMCFGR_EL0			SYS_AM_EL0(2, 1)
> +#define SYS_AMCGCR_EL0			SYS_AM_EL0(2, 2)
> +#define SYS_AMUSERENR_EL0		SYS_AM_EL0(2, 3)
> +#define SYS_AMCNTENCLR0_EL0		SYS_AM_EL0(2, 4)
> +#define SYS_AMCNTENSET0_EL0		SYS_AM_EL0(2, 5)
> +#define SYS_AMCNTENCLR1_EL0		SYS_AM_EL0(3, 0)
> +#define SYS_AMCNTENSET1_EL0		SYS_AM_EL0(3, 1)
> +
> +/*
> + * Group 0 of activity monitors (architected):
> + *                op0 CRn   op1   op2     CRm
> + * Counter:       11  1101  011   n<2:0>  010:n<3>
> + * Type:          11  1101  011   n<2:0>  011:n<3>
> + * n: 0-3
> + *
> + * Group 1 of activity monitors (auxiliary):
> + *                op0 CRn   op1   op2     CRm
> + * Counter:       11  1101  011   n<2:0>  110:n<3>
> + * Type:          11  1101  011   n<2:0>  111:n<3>
> + * n: 0-15
> + */
> +
> +#define SYS_AMEVCNTR0_EL0(n)            SYS_AM_EL0(4 + ((n) >> 3), (n) & 0x7)
> +#define SYS_AMEVTYPE0_EL0(n)            SYS_AM_EL0(6 + ((n) >> 3), (n) & 0x7)
> +#define SYS_AMEVCNTR1_EL0(n)            SYS_AM_EL0(12 + ((n) >> 3), (n) & 0x7)
> +#define SYS_AMEVTYPE1_EL0(n)            SYS_AM_EL0(14 + ((n) >> 3), (n) & 0x7)
> +
> +/* V1: Fixed (architecturally defined) activity monitors */
> +#define SYS_AMEVCNTR0_CORE_EL0          SYS_AMEVCNTR0_EL0(0)
> +#define SYS_AMEVCNTR0_CONST_EL0         SYS_AMEVCNTR0_EL0(1)
> +#define SYS_AMEVCNTR0_INST_RET_EL0      SYS_AMEVCNTR0_EL0(2)
> +#define SYS_AMEVCNTR0_MEM_STALL         SYS_AMEVCNTR0_EL0(3)
> +
>   #define SYS_CNTFRQ_EL0			sys_reg(3, 3, 14, 0, 0)
>   
>   #define SYS_CNTP_TVAL_EL0		sys_reg(3, 3, 14, 2, 0)
> @@ -577,6 +613,7 @@
>   #define ID_AA64PFR0_CSV3_SHIFT		60
>   #define ID_AA64PFR0_CSV2_SHIFT		56
>   #define ID_AA64PFR0_DIT_SHIFT		48
> +#define ID_AA64PFR0_AMU_SHIFT		44
>   #define ID_AA64PFR0_SVE_SHIFT		32
>   #define ID_AA64PFR0_RAS_SHIFT		28
>   #define ID_AA64PFR0_GIC_SHIFT		24
> @@ -587,6 +624,7 @@
>   #define ID_AA64PFR0_EL1_SHIFT		4
>   #define ID_AA64PFR0_EL0_SHIFT		0
>   
> +#define ID_AA64PFR0_AMU			0x1
>   #define ID_AA64PFR0_SVE			0x1
>   #define ID_AA64PFR0_RAS_V1		0x1
>   #define ID_AA64PFR0_FP_NI		0xf
> @@ -709,6 +747,12 @@
>   #define ID_AA64MMFR0_TGRAN16_NI		0x0
>   #define ID_AA64MMFR0_TGRAN16_SUPPORTED	0x1
>   
> +#define ID_PFR0_AMU_SHIFT		20
> +#define ID_PFR0_STATE3_SHIFT		12
> +#define ID_PFR0_STATE2_SHIFT		8
> +#define ID_PFR0_STATE1_SHIFT		4
> +#define ID_PFR0_STATE0_SHIFT		0
> +
>   #if defined(CONFIG_ARM64_4K_PAGES)
>   #define ID_AA64MMFR0_TGRAN_SHIFT	ID_AA64MMFR0_TGRAN4_SHIFT
>   #define ID_AA64MMFR0_TGRAN_SUPPORTED	ID_AA64MMFR0_TGRAN4_SUPPORTED
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index 04cf64e9f0c9..c639b3e052d7 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -156,6 +156,7 @@ static const struct arm64_ftr_bits ftr_id_aa64pfr0[] = {
>   	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64PFR0_CSV3_SHIFT, 4, 0),
>   	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64PFR0_CSV2_SHIFT, 4, 0),
>   	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR0_DIT_SHIFT, 4, 0),
> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64PFR0_AMU_SHIFT, 4, 0),
>   	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_SVE),
>   				   FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR0_SVE_SHIFT, 4, 0),
>   	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR0_RAS_SHIFT, 4, 0),
> @@ -314,10 +315,11 @@ static const struct arm64_ftr_bits ftr_id_mmfr4[] = {
>   };
>   
>   static const struct arm64_ftr_bits ftr_id_pfr0[] = {
> -	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, 12, 4, 0),		/* State3 */
> -	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, 8, 4, 0),		/* State2 */
> -	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, 4, 4, 0),		/* State1 */
> -	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, 0, 4, 0),		/* State0 */
> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_PFR0_AMU_SHIFT, 4, 0),

Why is this STRICT while the aa64pfr0 field is NON_STRICT ? On the other
hand, do we need this entry ? Do we plan to support 32bit guests using
AMU counters ? If we do, we may need to cap this field for the guests.

Also, fyi, please note that there may be conflicts with another series 
from Anshuman which cleans up the tables and "naming" the shifts. [1].
[1] purposefully hides the AMU from ID_PFR0 due to the above reasoning.

> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_PFR0_STATE3_SHIFT, 4, 0),
> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_PFR0_STATE2_SHIFT, 4, 0),
> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_PFR0_STATE1_SHIFT, 4, 0),
> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_PFR0_STATE0_SHIFT, 4, 0),
>   	ARM64_FTR_END,
>   };
>   
> @@ -1150,6 +1152,59 @@ static bool has_hw_dbm(const struct arm64_cpu_capabilities *cap,
>   
>   #endif
>   
> +#ifdef CONFIG_ARM64_AMU_EXTN
> +
> +/*
> + * This per cpu variable only signals that the CPU implementation supports
> + * the Activity Monitors Unit (AMU) but does not provide information
> + * regarding all the events that it supports.
> + * When this amu_feat per CPU variable is true, the user of this feature
> + * can only rely on the presence of the 4 fixed counters. But this does
> + * not guarantee that the counters are enabled or access to these counters
> + * is provided by code executed at higher exception levels.
> + *
> + * Also, to ensure the safe use of this per_cpu variable, the following
> + * accessor is defined to allow a read of amu_feat for the current cpu only
> + * from the current cpu.
> + *  - cpu_has_amu_feat()
> + */
> +static DEFINE_PER_CPU_READ_MOSTLY(u8, amu_feat);
> +
> +inline bool cpu_has_amu_feat(void)
> +{
> +	return !!this_cpu_read(amu_feat);
> +}
> +

minor nit: Or you may use a cpumask_t set of CPUs where AMU is
available. But if you plan to extend this for the future AMU version
tracking the mask may not be sufficient.

[1] 
http://lists.infradead.org/pipermail/linux-arm-kernel/2020-January/708287.html


The rest looks fine to me.

Suzuki
