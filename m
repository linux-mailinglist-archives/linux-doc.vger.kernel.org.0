Return-Path: <linux-doc+bounces-36641-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56681A254BE
	for <lists+linux-doc@lfdr.de>; Mon,  3 Feb 2025 09:47:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CCD101664A5
	for <lists+linux-doc@lfdr.de>; Mon,  3 Feb 2025 08:47:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3E1D1FBC92;
	Mon,  3 Feb 2025 08:47:29 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA7FE1E9905;
	Mon,  3 Feb 2025 08:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738572449; cv=none; b=HtKQJOfepQ7/7bIC2bFovwMQcR7im8gkNN8uaf5o27LKbCQjGyV1bIgPFIrW7VID+YPAk1CqGvsH5RIxk+0O+PKYTjCfNaHaRgThGszZJUeAVnxAKKTtqCL1VOj0ne4lMBz/1l3A4VjIWvnCij9X7ZQALXOnuAMZXpzbmDFXo4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738572449; c=relaxed/simple;
	bh=0wjl1heE4Ba+1t33BhOz7vUgamJrjLVtlPgBLOwRrzQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YnreSjvww0U5w9GMRQ7Vc4YsQbA1xAudi2VXdP73VK1RmlF7Xk8r1UWt+OcQ7ILPtB5v854KwiNpF0DhTSO4EExyzGsZqvi7x75z2z7yxRGisW7EcyXJopG93P2aqhIm8JIMaVVZcmOGlrx/gNVRV8qhuyttcCMCDDiMz46x938=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5D9BD1476;
	Mon,  3 Feb 2025 00:47:50 -0800 (PST)
Received: from [10.162.16.79] (unknown [10.162.16.79])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6A4DC3F63F;
	Mon,  3 Feb 2025 00:47:21 -0800 (PST)
Message-ID: <a8b8733e-2a6a-4a79-a30c-5b2c5af73ea7@arm.com>
Date: Mon, 3 Feb 2025 14:17:18 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 09/11] arm64: Handle BRBE booting requirements
To: "Rob Herring (Arm)" <robh@kernel.org>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Zenghui Yu <yuzenghui@huawei.com>, James Clark <james.clark@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kvmarm@lists.linux.dev
References: <20250202-arm-brbe-v19-v19-0-1c1300802385@kernel.org>
 <20250202-arm-brbe-v19-v19-9-1c1300802385@kernel.org>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250202-arm-brbe-v19-v19-9-1c1300802385@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/3/25 06:13, Rob Herring (Arm) wrote:
> From: Anshuman Khandual <anshuman.khandual@arm.com>
> 
> To use the Branch Record Buffer Extension (BRBE), some configuration is
> necessary at EL3 and EL2. This patch documents the requirements and adds
> the initial EL2 setup code, which largely consists of configuring the
> fine-grained traps and initializing a couple of BRBE control registers.
> 
> Before this patch, __init_el2_fgt() would initialize HDFGRTR_EL2 and
> HDFGWTR_EL2 with the same value, relying on the read/write trap controls
> for a register occupying the same bit position in either register. The
> 'nBRBIDR' trap control only exists in bit 59 of HDFGRTR_EL2, while bit
> 59 of HDFGRTR_EL2 is RES0, and so this assumption no longer holds.
> 
> To handle HDFGRTR_EL2 and HDFGWTR_EL2 having (slightly) different bit
> layouts, __init_el2_fgt() is changed to accumulate the HDFGRTR_EL2 and
> HDFGWTR_EL2 control bits separately. While making this change the
> open-coded value (1 << 62) is replaced with
> HDFG{R,W}TR_EL2_nPMSNEVFR_EL1_MASK.
> 
> The BRBCR_EL1 and BRBCR_EL2 registers are unusual and require special
> initialisation: even though they are subject to E2H renaming, both have
> an effect regardless of HCR_EL2.TGE, even when running at EL2, and
> consequently both need to be initialised. This is handled in
> __init_el2_brbe() with a comment to explain the situation.
> 
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Oliver Upton <oliver.upton@linux.dev>
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> [Mark: rewrite commit message, fix typo in comment]

This commit message after rewrite is better, thanks !

> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  Documentation/arch/arm64/booting.rst | 21 +++++++++
>  arch/arm64/include/asm/el2_setup.h   | 86 ++++++++++++++++++++++++++++++++++--
>  2 files changed, 104 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/arch/arm64/booting.rst b/Documentation/arch/arm64/booting.rst
> index cad6fdc96b98..0a421757cacf 100644
> --- a/Documentation/arch/arm64/booting.rst
> +++ b/Documentation/arch/arm64/booting.rst
> @@ -352,6 +352,27 @@ Before jumping into the kernel, the following conditions must be met:
>  
>      - HWFGWTR_EL2.nSMPRI_EL1 (bit 54) must be initialised to 0b01.
>  
> +  For CPUs with feature Branch Record Buffer Extension (FEAT_BRBE):
> +
> +  - If EL3 is present:
> +
> +    - MDCR_EL3.SBRBE (bits 33:32) must be initialised to 0b11.
> +
> +  - If the kernel is entered at EL1 and EL2 is present:
> +
> +    - BRBCR_EL2.CC (bit 3) must be initialised to 0b1.
> +    - BRBCR_EL2.MPRED (bit 4) must be initialised to 0b1.
> +
> +    - HDFGRTR_EL2.nBRBDATA (bit 61) must be initialised to 0b1.
> +    - HDFGRTR_EL2.nBRBCTL  (bit 60) must be initialised to 0b1.
> +    - HDFGRTR_EL2.nBRBIDR  (bit 59) must be initialised to 0b1.
> +
> +    - HDFGWTR_EL2.nBRBDATA (bit 61) must be initialised to 0b1.
> +    - HDFGWTR_EL2.nBRBCTL  (bit 60) must be initialised to 0b1.
> +
> +    - HFGITR_EL2.nBRBIALL (bit 56) must be initialised to 0b1.
> +    - HFGITR_EL2.nBRBINJ  (bit 55) must be initialised to 0b1.
> +
>    For CPUs with the Scalable Matrix Extension FA64 feature (FEAT_SME_FA64):
>  
>    - If EL3 is present:
> diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
> index 25e162651750..bf21ce513aff 100644
> --- a/arch/arm64/include/asm/el2_setup.h
> +++ b/arch/arm64/include/asm/el2_setup.h
> @@ -163,6 +163,39 @@
>  .Lskip_set_cptr_\@:
>  .endm
>  
> +/*
> + * Configure BRBE to permit recording cycle counts and branch mispredicts.
> + *
> + * At any EL, to record cycle counts BRBE requires that both BRBCR_EL2.CC=1 and
> + * BRBCR_EL1.CC=1.
> + *
> + * At any EL, to record branch mispredicts BRBE requires that both
> + * BRBCR_EL2.MPRED=1 and BRBCR_EL1.MPRED=1.
> + *
> + * When HCR_EL2.E2H=1, the BRBCR_EL1 encoding is redirected to BRBCR_EL2, but
> + * the {CC,MPRED} bits in the real BRBCR_EL1 register still apply.
> + *
> + * Set {CC,MPRED} in both BRBCR_EL2 and BRBCR_EL1 so that at runtime we only
> + * need to enable/disable these in BRBCR_EL1 regardless of whether the kernel
> + * ends up executing in EL1 or EL2.
> + */
> +.macro __init_el2_brbe
> +	mrs	x1, id_aa64dfr0_el1
> +	ubfx	x1, x1, #ID_AA64DFR0_EL1_BRBE_SHIFT, #4
> +	cbz	x1, .Lskip_brbe_\@
> +
> +	mov_q	x0, BRBCR_ELx_CC | BRBCR_ELx_MPRED
> +	msr_s	SYS_BRBCR_EL2, x0
> +
> +	__check_hvhe .Lset_brbe_nvhe_\@, x1
> +	msr_s	SYS_BRBCR_EL12, x0	// VHE
> +	b	.Lskip_brbe_\@
> +
> +.Lset_brbe_nvhe_\@:
> +	msr_s	SYS_BRBCR_EL1, x0	// NVHE
> +.Lskip_brbe_\@:
> +.endm
> +
>  /* Disable any fine grained traps */
>  .macro __init_el2_fgt
>  	mrs	x1, id_aa64mmfr0_el1
> @@ -170,16 +203,48 @@
>  	cbz	x1, .Lskip_fgt_\@
>  
>  	mov	x0, xzr
> +	mov	x2, xzr
>  	mrs	x1, id_aa64dfr0_el1
>  	ubfx	x1, x1, #ID_AA64DFR0_EL1_PMSVer_SHIFT, #4
>  	cmp	x1, #3
>  	b.lt	.Lskip_spe_fgt_\@
> +
>  	/* Disable PMSNEVFR_EL1 read and write traps */
> -	orr	x0, x0, #(1 << 62)
> +	orr	x0, x0, #HDFGRTR_EL2_nPMSNEVFR_EL1_MASK
> +	orr	x2, x2, #HDFGWTR_EL2_nPMSNEVFR_EL1_MASK
>  
>  .Lskip_spe_fgt_\@:
> +#ifdef CONFIG_ARM64_BRBE
> +	mrs	x1, id_aa64dfr0_el1
> +	ubfx	x1, x1, #ID_AA64DFR0_EL1_BRBE_SHIFT, #4
> +	cbz	x1, .Lskip_brbe_reg_fgt_\@
> +
> +	/*
> +	 * Disable read traps for the following registers
> +	 *
> +	 * [BRBSRC|BRBTGT|RBINF]_EL1
> +	 * [BRBSRCINJ|BRBTGTINJ|BRBINFINJ|BRBTS]_EL1
> +	 */
> +	orr	x0, x0, #HDFGRTR_EL2_nBRBDATA_MASK
> +
> +	/*
> +	 * Disable write traps for the following registers
> +	 *
> +	 * [BRBSRCINJ|BRBTGTINJ|BRBINFINJ|BRBTS]_EL1
> +	 */
> +	orr	x2, x2, #HDFGWTR_EL2_nBRBDATA_MASK
> +
> +	/* Disable read and write traps for [BRBCR|BRBFCR]_EL1 */
> +	orr	x0, x0, #HDFGRTR_EL2_nBRBCTL_MASK
> +	orr	x2, x2, #HDFGWTR_EL2_nBRBCTL_MASK
> +
> +	/* Disable read traps for BRBIDR_EL1 */
> +	orr	x0, x0, #HDFGRTR_EL2_nBRBIDR_MASK
> +
> +.Lskip_brbe_reg_fgt_\@:
> +#endif /* CONFIG_ARM64_BRBE */
>  	msr_s	SYS_HDFGRTR_EL2, x0
> -	msr_s	SYS_HDFGWTR_EL2, x0
> +	msr_s	SYS_HDFGWTR_EL2, x2
>  
>  	mov	x0, xzr
>  	mrs	x1, id_aa64pfr1_el1
> @@ -220,7 +285,21 @@
>  .Lset_fgt_\@:
>  	msr_s	SYS_HFGRTR_EL2, x0
>  	msr_s	SYS_HFGWTR_EL2, x0
> -	msr_s	SYS_HFGITR_EL2, xzr
> +	mov	x0, xzr
> +#ifdef CONFIG_ARM64_BRBE
> +	mrs	x1, id_aa64dfr0_el1
> +	ubfx	x1, x1, #ID_AA64DFR0_EL1_BRBE_SHIFT, #4
> +	cbz	x1, .Lskip_brbe_insn_fgt_\@
> +
> +	/* Disable traps for BRBIALL instruction */
> +	orr	x0, x0, #HFGITR_EL2_nBRBIALL_MASK
> +
> +	/* Disable traps for BRBINJ instruction */
> +	orr	x0, x0, #HFGITR_EL2_nBRBINJ_MASK
> +
> +.Lskip_brbe_insn_fgt_\@:
> +#endif /* CONFIG_ARM64_BRBE */
> +	msr_s	SYS_HFGITR_EL2, x0
>  
>  	mrs	x1, id_aa64pfr0_el1		// AMU traps UNDEF without AMU
>  	ubfx	x1, x1, #ID_AA64PFR0_EL1_AMU_SHIFT, #4
> @@ -275,6 +354,7 @@
>  	__init_el2_hcrx
>  	__init_el2_timers
>  	__init_el2_debug
> +	__init_el2_brbe
>  	__init_el2_lor
>  	__init_el2_stage2
>  	__init_el2_gicv3
> 

LGTM.

Both commit message and in code comments formatting have been changed from V18.

