Return-Path: <linux-doc+bounces-80007-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJVJDJjhummDcwIAu9opvQ
	(envelope-from <linux-doc+bounces-80007-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 18 Mar 2026 18:32:08 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7262C054F
	for <lists+linux-doc@lfdr.de>; Wed, 18 Mar 2026 18:32:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7BDFF301EF39
	for <lists+linux-doc@lfdr.de>; Wed, 18 Mar 2026 17:31:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 588A92FD673;
	Wed, 18 Mar 2026 17:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GMeBMOAL"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336922D6E6F;
	Wed, 18 Mar 2026 17:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773855052; cv=none; b=Fy82xHzmzWRX2YjfNizvtyWneXhQ/Gm400SImlu7E9oY1596m222dhtZHRINyi6moRbEFrQ+/ejlntLSc6r/3MmzX+0EfGTFacMbdiN8k+AD1tTg3XmkXkLzxFJuWxR6ogaqzl5gzLNZ4Mb7za9mKmTp0q4tfyhQoX+ptYTjPMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773855052; c=relaxed/simple;
	bh=XPx/yjvwyXAw7enHLNKPnNMYBVBUVEXGERhVxlQJpoM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PlGkjv7scpaWVxixAKk2Oia03frZt048a1XI3xy+e3wNBcxjvvLxljeB+X31yiRymvtazXdiyancCq4W8Pz0KIabAdgAN7/0POdbc7nir3ElD17dXPXibDJcSugoKU3aM4R+2mO6vvNFixE0ruuM58xcnQAno3BfVdn/8bIDBxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GMeBMOAL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 807DCC19421;
	Wed, 18 Mar 2026 17:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773855052;
	bh=XPx/yjvwyXAw7enHLNKPnNMYBVBUVEXGERhVxlQJpoM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GMeBMOAL3e7UC4bl+EQYKpGV94hdghAJhWzjCgt36Ph4uDLD37wBMd4hO+Nv5n1f0
	 M7EJsbDo3PubNZUZzLQxEslrOEcCxuTjcYqsGe6NhKWwhgufvkXGL1tX3r03sZhwA1
	 IP1sNZW9BHQ3R5aG14WWZ1mpN/Wy+BCw6oTbupuk9Ttp5eTbRXgSJZnlrVsEOXzWb7
	 r/c4b65UuoiPM80BvnIK5tPpgeKDZXHaCNGCHYItqyl68oTF9gC949U49c5iF3DlbS
	 6u9FHxJNDYgjixZu5RYwFEvmHVsfooz+c/opQjOPUzqn6+VCsalG2TUSq8yXa0VIXr
	 q42yyqIwwG1FQ==
Date: Wed, 18 Mar 2026 17:31:04 +0000
From: Jean-Philippe Brucker <jpb@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Oliver Upton <oupton@kernel.org>, Dave Martin <Dave.Martin@arm.com>,
	Fuad Tabba <tabba@google.com>, Mark Rutland <mark.rutland@arm.com>,
	Ben Horgan <ben.horgan@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v10 06/30] KVM: arm64: Pull ctxt_has_ helpers to start of
 sysreg-sr.h
Message-ID: <20260318173104.GD2390801@myrica>
References: <20260306-kvm-arm64-sme-v10-0-43f7683a0fb7@kernel.org>
 <20260306-kvm-arm64-sme-v10-6-43f7683a0fb7@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306-kvm-arm64-sme-v10-6-43f7683a0fb7@kernel.org>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-80007-lists,linux-doc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jpb@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DD7262C054F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 06, 2026 at 05:00:58PM +0000, Mark Brown wrote:
> Rather than add earlier prototypes of specific ctxt_has_ helpers let's just
> pull all their definitions to the top of sysreg-sr.h so they're all
> available to all the individual save/restore functions.
> 
> Reviewed-by: Fuad Tabba <tabba@google.com>
> Signed-off-by: Mark Brown <broonie@kernel.org>

Reviewed-by: Jean-Philippe Brucker <jpb@kernel.org>

> ---
>  arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h | 84 +++++++++++++++---------------
>  1 file changed, 41 insertions(+), 43 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
> index a17cbe7582de..5624fd705ae3 100644
> --- a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
> +++ b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
> @@ -16,8 +16,6 @@
>  #include <asm/kvm_hyp.h>
>  #include <asm/kvm_mmu.h>
>  
> -static inline bool ctxt_has_s1poe(struct kvm_cpu_context *ctxt);
> -
>  static inline struct kvm_vcpu *ctxt_to_vcpu(struct kvm_cpu_context *ctxt)
>  {
>  	struct kvm_vcpu *vcpu = ctxt->__hyp_running_vcpu;
> @@ -28,47 +26,6 @@ static inline struct kvm_vcpu *ctxt_to_vcpu(struct kvm_cpu_context *ctxt)
>  	return vcpu;
>  }
>  
> -static inline bool ctxt_is_guest(struct kvm_cpu_context *ctxt)
> -{
> -	return host_data_ptr(host_ctxt) != ctxt;
> -}
> -
> -static inline u64 *ctxt_mdscr_el1(struct kvm_cpu_context *ctxt)
> -{
> -	struct kvm_vcpu *vcpu = ctxt_to_vcpu(ctxt);
> -
> -	if (ctxt_is_guest(ctxt) && kvm_host_owns_debug_regs(vcpu))
> -		return &vcpu->arch.external_mdscr_el1;
> -
> -	return &ctxt_sys_reg(ctxt, MDSCR_EL1);
> -}
> -
> -static inline u64 ctxt_midr_el1(struct kvm_cpu_context *ctxt)
> -{
> -	struct kvm *kvm = kern_hyp_va(ctxt_to_vcpu(ctxt)->kvm);
> -
> -	if (!(ctxt_is_guest(ctxt) &&
> -	      test_bit(KVM_ARCH_FLAG_WRITABLE_IMP_ID_REGS, &kvm->arch.flags)))
> -		return read_cpuid_id();
> -
> -	return kvm_read_vm_id_reg(kvm, SYS_MIDR_EL1);
> -}
> -
> -static inline void __sysreg_save_common_state(struct kvm_cpu_context *ctxt)
> -{
> -	*ctxt_mdscr_el1(ctxt)	= read_sysreg(mdscr_el1);
> -
> -	// POR_EL0 can affect uaccess, so must be saved/restored early.
> -	if (ctxt_has_s1poe(ctxt))
> -		ctxt_sys_reg(ctxt, POR_EL0)	= read_sysreg_s(SYS_POR_EL0);
> -}
> -
> -static inline void __sysreg_save_user_state(struct kvm_cpu_context *ctxt)
> -{
> -	ctxt_sys_reg(ctxt, TPIDR_EL0)	= read_sysreg(tpidr_el0);
> -	ctxt_sys_reg(ctxt, TPIDRRO_EL0)	= read_sysreg(tpidrro_el0);
> -}
> -
>  static inline bool ctxt_has_mte(struct kvm_cpu_context *ctxt)
>  {
>  	struct kvm_vcpu *vcpu = ctxt_to_vcpu(ctxt);
> @@ -131,6 +88,47 @@ static inline bool ctxt_has_sctlr2(struct kvm_cpu_context *ctxt)
>  	return kvm_has_sctlr2(kern_hyp_va(vcpu->kvm));
>  }
>  
> +static inline bool ctxt_is_guest(struct kvm_cpu_context *ctxt)
> +{
> +	return host_data_ptr(host_ctxt) != ctxt;
> +}
> +
> +static inline u64 *ctxt_mdscr_el1(struct kvm_cpu_context *ctxt)
> +{
> +	struct kvm_vcpu *vcpu = ctxt_to_vcpu(ctxt);
> +
> +	if (ctxt_is_guest(ctxt) && kvm_host_owns_debug_regs(vcpu))
> +		return &vcpu->arch.external_mdscr_el1;
> +
> +	return &ctxt_sys_reg(ctxt, MDSCR_EL1);
> +}
> +
> +static inline u64 ctxt_midr_el1(struct kvm_cpu_context *ctxt)
> +{
> +	struct kvm *kvm = kern_hyp_va(ctxt_to_vcpu(ctxt)->kvm);
> +
> +	if (!(ctxt_is_guest(ctxt) &&
> +	      test_bit(KVM_ARCH_FLAG_WRITABLE_IMP_ID_REGS, &kvm->arch.flags)))
> +		return read_cpuid_id();
> +
> +	return kvm_read_vm_id_reg(kvm, SYS_MIDR_EL1);
> +}
> +
> +static inline void __sysreg_save_common_state(struct kvm_cpu_context *ctxt)
> +{
> +	*ctxt_mdscr_el1(ctxt)	= read_sysreg(mdscr_el1);
> +
> +	// POR_EL0 can affect uaccess, so must be saved/restored early.
> +	if (ctxt_has_s1poe(ctxt))
> +		ctxt_sys_reg(ctxt, POR_EL0)	= read_sysreg_s(SYS_POR_EL0);
> +}
> +
> +static inline void __sysreg_save_user_state(struct kvm_cpu_context *ctxt)
> +{
> +	ctxt_sys_reg(ctxt, TPIDR_EL0)	= read_sysreg(tpidr_el0);
> +	ctxt_sys_reg(ctxt, TPIDRRO_EL0)	= read_sysreg(tpidrro_el0);
> +}
> +
>  static inline void __sysreg_save_el1_state(struct kvm_cpu_context *ctxt)
>  {
>  	ctxt_sys_reg(ctxt, SCTLR_EL1)	= read_sysreg_el1(SYS_SCTLR);
> 
> -- 
> 2.47.3
> 
> 

