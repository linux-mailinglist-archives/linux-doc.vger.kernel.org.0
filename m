Return-Path: <linux-doc+bounces-10551-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 402EF861037
	for <lists+linux-doc@lfdr.de>; Fri, 23 Feb 2024 12:19:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DE49DB2262C
	for <lists+linux-doc@lfdr.de>; Fri, 23 Feb 2024 11:18:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6434167C7D;
	Fri, 23 Feb 2024 11:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gQJwTg+D"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F555C911;
	Fri, 23 Feb 2024 11:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708687136; cv=none; b=NR5qolPAUVy8vxhjL8r8owz6yMecGDYNb0FUi3bs6FkT8D8Cj4YBn6sv+G+/fgaNEzI+TsdKCheyYsrp6HDEYRiUU1MPR8CoKcZ5Bz1JSA2etcQHxswVkp0ej1GFg5NjAWaTZUwzG5olp1Pz6gAyCYRJaslbKNJVwUVXWnBFOXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708687136; c=relaxed/simple;
	bh=DDeLOBkL7z6riCGOV97XoJTY1vZaFPeBQPATuj2ulYg=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DWIGTNTFJ24OlaXBsl03+jODOoIce0EySGJi5RSXq3ga6GMhR0kfObRUGZ62E70FOZv1xQkEwUuBR7418UmO52B3rYqWplfArLhBp8a1Bu844TWhF/1usqjqy1hwLysEGj97+HF29dpYyZCjGh7lmiyxO9zY5cso2o302eYFHzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gQJwTg+D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5627C433C7;
	Fri, 23 Feb 2024 11:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708687135;
	bh=DDeLOBkL7z6riCGOV97XoJTY1vZaFPeBQPATuj2ulYg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=gQJwTg+DR9eBYHrl/ADjvl6lI9Vf1UqIjNUSfmAHFFQcC7Rcxbar7XlUSEn5J+yHu
	 Mhhgzmb/yc/ts8Db5mpYWBgzh/rV/06HP3eNGeGEcq/2CRgeifmkAcGmaBLlYsXPkF
	 oV/QUKA/Olz+pTPM7qNSOzFvMvLvFUmKSigeL2Slb+ZZs9VB30yphngm4ASU21d0TU
	 Ed2Qs2c1XwAhmF2UNNHh63HUB+Q+ABG/Q3Exw3pTqM7K1rggVAIefCM7s3YoDeKVJG
	 x3aSLeQeuSOUMnN2NjUjnZ9nomDec/Z3QBAvx0q2HVFG5FTV760ipiDIOSLJmLNpwO
	 VbF3GFox8/NOg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1rdTZt-00642G-4l;
	Fri, 23 Feb 2024 11:18:53 +0000
Date: Fri, 23 Feb 2024 11:18:51 +0000
Message-ID: <86plwn2ztw.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dave Martin <dave.martin@arm.com>,
	kvmarm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v4 12/14] KVM: arm64: Support FEAT_FPMR for guests
In-Reply-To: <20240122-arm64-2023-dpisa-v4-12-776e094861df@kernel.org>
References: <20240122-arm64-2023-dpisa-v4-0-776e094861df@kernel.org>
	<20240122-arm64-2023-dpisa-v4-12-776e094861df@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/29.1
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: broonie@kernel.org, catalin.marinas@arm.com, will@kernel.org, oliver.upton@linux.dev, james.morse@arm.com, suzuki.poulose@arm.com, corbet@lwn.net, shuah@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, dave.martin@arm.com, kvmarm@lists.linux.dev, linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false

On Mon, 22 Jan 2024 16:28:15 +0000,
Mark Brown <broonie@kernel.org> wrote:
> 
> FEAT_FPMR introduces a new system register FPMR which allows configuration
> of floating point behaviour, currently for FP8 specific features. Allow use
> of this in guests, disabling the trap while guests are running and saving
> and restoring the value along with the rest of the floating point state.
> Since FPMR is stored immediately after the main floating point state we
> share it with the hypervisor by adjusting the size of the shared region.
> 
> Access to FPMR is covered by both a register specific trap HCRX_EL2.EnFPM
> and the overall floating point access trap so we just unconditionally
> enable the FPMR specific trap and rely on the floating point access trap to
> detect guest floating point usage.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  arch/arm64/include/asm/kvm_arm.h        |  2 +-
>  arch/arm64/include/asm/kvm_host.h       |  3 ++-
>  arch/arm64/kvm/emulate-nested.c         |  8 ++++++++
>  arch/arm64/kvm/fpsimd.c                 |  2 +-
>  arch/arm64/kvm/hyp/include/hyp/switch.h |  7 ++++++-
>  arch/arm64/kvm/sys_regs.c               | 11 +++++++++++
>  6 files changed, 29 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_arm.h b/arch/arm64/include/asm/kvm_arm.h
> index 7f45ce9170bb..b2ddb6165953 100644
> --- a/arch/arm64/include/asm/kvm_arm.h
> +++ b/arch/arm64/include/asm/kvm_arm.h
> @@ -103,7 +103,7 @@
>  #define HCR_HOST_VHE_FLAGS (HCR_RW | HCR_TGE | HCR_E2H)
>  
>  #define HCRX_GUEST_FLAGS \
> -	(HCRX_EL2_SMPME | HCRX_EL2_TCR2En | \
> +	(HCRX_EL2_SMPME | HCRX_EL2_TCR2En | HCRX_EL2_EnFPM | \

No. We don't do that anymore. This can only be enabled if the guest
has it advertised via ID_AA64PFR2_EL1.FPMR.

>  	 (cpus_have_final_cap(ARM64_HAS_MOPS) ? (HCRX_EL2_MSCEn | HCRX_EL2_MCE2) : 0))
>  #define HCRX_HOST_FLAGS (HCRX_EL2_MSCEn | HCRX_EL2_TCR2En | HCRX_EL2_EnFPM)
>  
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index c4fdcc94d733..99c0f8944f04 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -384,6 +384,8 @@ enum vcpu_sysreg {
>  	APGAKEYLO_EL1,
>  	APGAKEYHI_EL1,
>  
> +	FPMR,
> +
>  	/* Memory Tagging Extension registers */
>  	RGSR_EL1,	/* Random Allocation Tag Seed Register */
>  	GCR_EL1,	/* Tag Control Register */
> @@ -544,7 +546,6 @@ struct kvm_vcpu_arch {
>  	enum fp_type fp_type;
>  	unsigned int sve_max_vl;
>  	u64 svcr;
> -	unsigned long fpmr;
>  
>  	/* Stage 2 paging state used by the hardware on next switch */
>  	struct kvm_s2_mmu *hw_mmu;
> diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
> index 431fd429932d..3af5fd0e28dc 100644
> --- a/arch/arm64/kvm/emulate-nested.c
> +++ b/arch/arm64/kvm/emulate-nested.c
> @@ -67,6 +67,8 @@ enum cgt_group_id {
>  	CGT_HCR_TTLBIS,
>  	CGT_HCR_TTLBOS,
>  
> +	CGT_HCRX_EnFPM,
> +
>  	CGT_MDCR_TPMCR,
>  	CGT_MDCR_TPM,
>  	CGT_MDCR_TDE,
> @@ -279,6 +281,11 @@ static const struct trap_bits coarse_trap_bits[] = {
>  		.mask		= HCR_TTLBOS,
>  		.behaviour	= BEHAVE_FORWARD_ANY,
>  	},
> +	[CGT_HCRX_EnFPM] = {
> +		.index		= HCRX_EL2,
> +		.mask		= HCRX_EL2_EnFPM,
> +		.behaviour	= BEHAVE_FORWARD_ANY,

This is obviously incorrect.

> +	},
>  	[CGT_MDCR_TPMCR] = {
>  		.index		= MDCR_EL2,
>  		.value		= MDCR_EL2_TPMCR,
> @@ -478,6 +485,7 @@ static const struct encoding_to_trap_config encoding_to_cgt[] __initconst = {
>  	SR_TRAP(SYS_AIDR_EL1,		CGT_HCR_TID1),
>  	SR_TRAP(SYS_SMIDR_EL1,		CGT_HCR_TID1),
>  	SR_TRAP(SYS_CTR_EL0,		CGT_HCR_TID2),
> +	SR_TRAP(SYS_FPMR,		CGT_HCRX_EnFPM),
>  	SR_TRAP(SYS_CCSIDR_EL1,		CGT_HCR_TID2_TID4),
>  	SR_TRAP(SYS_CCSIDR2_EL1,	CGT_HCR_TID2_TID4),
>  	SR_TRAP(SYS_CLIDR_EL1,		CGT_HCR_TID2_TID4),
> diff --git a/arch/arm64/kvm/fpsimd.c b/arch/arm64/kvm/fpsimd.c
> index 6cf22cd8f020..9e002489c843 100644
> --- a/arch/arm64/kvm/fpsimd.c
> +++ b/arch/arm64/kvm/fpsimd.c
> @@ -152,7 +152,7 @@ void kvm_arch_vcpu_ctxsync_fp(struct kvm_vcpu *vcpu)
>  		fp_state.sve_vl = vcpu->arch.sve_max_vl;
>  		fp_state.sme_state = NULL;
>  		fp_state.svcr = &vcpu->arch.svcr;
> -		fp_state.fpmr = &vcpu->arch.fpmr;
> +		fp_state.fpmr = (unsigned long *)&__vcpu_sys_reg(vcpu, FPMR);
>  		fp_state.fp_type = &vcpu->arch.fp_type;
>  
>  		if (vcpu_has_sve(vcpu))
> diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
> index 27fcdfd432b9..abf785c473d0 100644
> --- a/arch/arm64/kvm/hyp/include/hyp/switch.h
> +++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
> @@ -370,10 +370,15 @@ static bool kvm_hyp_handle_fpsimd(struct kvm_vcpu *vcpu, u64 *exit_code)
>  	isb();
>  
>  	/* Write out the host state if it's in the registers */
> -	if (vcpu->arch.fp_state == FP_STATE_HOST_OWNED)
> +	if (vcpu->arch.fp_state == FP_STATE_HOST_OWNED) {
>  		__fpsimd_save_state(&(vcpu->arch.host_uw->fpsimd_state));
> +		if (cpus_have_final_cap(ARM64_HAS_FPMR))

Same thing as above: this cannot be unconditional.

> +			vcpu->arch.host_uw->fpmr = read_sysreg_s(SYS_FPMR);
> +	}
>  
>  	/* Restore the guest state */
> +	if (cpus_have_final_cap(ARM64_HAS_FPMR))
> +		write_sysreg_s(__vcpu_sys_reg(vcpu, FPMR), SYS_FPMR);
>  	if (sve_guest)
>  		__hyp_sve_restore_guest(vcpu);
>  	else
> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index 38503b1cd2eb..216eac44c124 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -2067,6 +2067,15 @@ static unsigned int hidden_user_visibility(const struct kvm_vcpu *vcpu,
>  	.visibility = hidden_user_visibility,	\
>  }
>  
> +static unsigned int fpmr_visibility(const struct kvm_vcpu *vcpu,
> +				    const struct sys_reg_desc *rd)
> +{
> +	if (cpus_have_final_cap(ARM64_HAS_FPMR))
> +		return 0;

Same thing.

> +
> +	return REG_HIDDEN;
> +}
> +
>  /*
>   * Since reset() callback and field val are not used for idregs, they will be
>   * used for specific purposes for idregs.
> @@ -2463,6 +2472,8 @@ static const struct sys_reg_desc sys_reg_descs[] = {
>  	{ SYS_DESC(SYS_CSSELR_EL1), access_csselr, reset_unknown, CSSELR_EL1 },
>  	{ SYS_DESC(SYS_CTR_EL0), access_ctr },
>  	{ SYS_DESC(SYS_SVCR), undef_access },
> +	{ SYS_DESC(SYS_FPMR), access_rw, reset_unknown, FPMR,
> +	  .visibility = fpmr_visibility },
>  
>  	{ PMU_SYS_REG(PMCR_EL0), .access = access_pmcr, .reset = reset_pmcr,
>  	  .reg = PMCR_EL0, .get_user = get_pmcr, .set_user = set_pmcr },
> 

Thanks,

	M.

-- 
Without deviation from the norm, progress is not possible.

