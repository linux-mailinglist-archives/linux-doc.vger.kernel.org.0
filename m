Return-Path: <linux-doc+bounces-11975-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8BE8797B3
	for <lists+linux-doc@lfdr.de>; Tue, 12 Mar 2024 16:36:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5AC5E1F21AC0
	for <lists+linux-doc@lfdr.de>; Tue, 12 Mar 2024 15:36:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75BE67C6D6;
	Tue, 12 Mar 2024 15:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="De7W//s0"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407237C0BC;
	Tue, 12 Mar 2024 15:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710257791; cv=none; b=hcyYdbWfnJjCjn+SK7BjqvS4BNnAMxxCc2N+uXBxovjEb/oGWrIYyGHWlSRN5z0bytNor1JQhqZ/yVbwj65AcnvaNMcZaqKd9BRbwweN4GKt3WaM8hB16jF6fq/KBDEYUy8CWz1h4OCEZPUaSciGhukHvZxlGZgAVNtzh1iXbFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710257791; c=relaxed/simple;
	bh=wKVJV0Guheiy5ccw9xsQRL2O+QCrf6YHcmhC4LaNjE0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PnI+M+ApFzljAYESxCFRbudhEZ+2G/JXwceyzrE0jX8H/Ium/iT2oNP0sHd+Gjvex1X2mkeJng/769SvOWgBHk1+7ON88E9zyd97Wm7tPDYNE+BW0LVUoRyQGNGXJWUsPDZBIV3MGLt0O4QHyPK/zIPB7O6w11/d1Bb6P0MrPVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=De7W//s0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70274C433F1;
	Tue, 12 Mar 2024 15:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710257790;
	bh=wKVJV0Guheiy5ccw9xsQRL2O+QCrf6YHcmhC4LaNjE0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=De7W//s0w15UCZPDbgdyFNkOCQE3mhlTM3jHRJAAeoO5ATF/9jpLZnofPIa6oENaY
	 MDEoDaVjXrFRFvf4Lb0u1JF2IZlnMcPbhZMhWoepwX3v61zCZSk69KBCKibLnsHInH
	 aG4GZHDFoyXvyCrLg+FZTC3ohnawBnF9GzWoz8RgwlBzt4h8amanr+bSa8pwDsMJeT
	 7gnf0TVU4tNWegwQaDAFqSHlSCSTF1jD7qESq99MccIAF7NPCi6mkB6Ndsp7pz+qbK
	 BXQf7K79e6kgRPaTqIgVJ+g5VT3bdJmjTofr6bM4O7ignAjfzLraPSnZpgeYqxOeIJ
	 L0LTIKtPRrK/A==
Received: from [209.214.232.173] (helo=wait-a-minute.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1rk4B1-00BmAg-D8;
	Tue, 12 Mar 2024 15:36:27 +0000
Date: Tue, 12 Mar 2024 15:36:19 +0000
Message-ID: <87v85rpimk.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <len.brown@intel.com>,
	Pavel Machek <pavel@ucw.cz>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Mostafa Saleh <smostafa@google.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-pm@vger.kernel.org
Subject: Re: [RFC PATCH 1/2] KVM: arm64: Add PSCI SYSTEM_OFF2 function for hibernation
In-Reply-To: <20240312135958.727765-2-dwmw2@infradead.org>
References: <20240312135958.727765-1-dwmw2@infradead.org>
	<20240312135958.727765-2-dwmw2@infradead.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/28.2
 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 209.214.232.173
X-SA-Exim-Rcpt-To: dwmw2@infradead.org, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, pbonzini@redhat.com, corbet@lwn.net, oliver.upton@linux.dev, james.morse@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, lpieralisi@kernel.org, rafael@kernel.org, len.brown@intel.com, pavel@ucw.cz, dwmw@amazon.co.uk, smostafa@google.com, jean-philippe@linaro.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, linux-pm@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false

On Tue, 12 Mar 2024 13:51:28 +0000,
David Woodhouse <dwmw2@infradead.org> wrote:
> 
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> The PSCI v1.3 specification (alpha) adds support for a SYSTEM_OFF2 function
> which is analogous to ACPI S4 state. This will allow hosting environments
> to determine that a guest is hibernated rather than just powered off, and
> ensure that they preserve the virtual environment appropriately to allow
> the guest to resume safely (or bump the hardware_signature in the FACS to
> trigger a clean reboot instead).
> 
> The beta version will be changed to say that PSCI_FEATURES returns a bit
> mask of the supported hibernate types, which is implemented here.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>  Documentation/virt/kvm/api.rst       | 11 +++++++++
>  arch/arm64/include/asm/kvm_host.h    |  2 ++
>  arch/arm64/include/uapi/asm/kvm.h    |  6 +++++
>  arch/arm64/kvm/arm.c                 |  5 ++++
>  arch/arm64/kvm/hyp/nvhe/psci-relay.c |  2 ++
>  arch/arm64/kvm/psci.c                | 37 ++++++++++++++++++++++++++++
>  include/uapi/linux/kvm.h             |  1 +
>  include/uapi/linux/psci.h            |  5 ++++
>  8 files changed, 69 insertions(+)
> 
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index bd93cafd3e4e..f5963c3770a5 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -6761,6 +6761,10 @@ the first `ndata` items (possibly zero) of the data array are valid.
>     the guest issued a SYSTEM_RESET2 call according to v1.1 of the PSCI
>     specification.
>  
> + - for arm64, data[0] is set to KVM_SYSTEM_EVENT_SHUTDOWN_FLAG_PSCI_OFF2
> +   if the guest issued a SYSTEM_OFF2 call according to v1.3 of the PSCI
> +   specification.
> +
>   - for RISC-V, data[0] is set to the value of the second argument of the
>     ``sbi_system_reset`` call.
>  
> @@ -6794,6 +6798,13 @@ either:
>   - Deny the guest request to suspend the VM. See ARM DEN0022D.b 5.19.2
>     "Caller responsibilities" for possible return values.
>  
> +Hibernation using the PSCI SYSTEM_OFF2 call is enabled with the
> +KVM_CAP_ARM_SYSTEM_OFF2 VM capability. If a guest invokes the PSCI

Checking that PSCI 1.3 is enabled for the guest should be enough, no?
I don't think providing yet another level of optionally brings us
much, other than complexity.

> +SYSTEM_OFF2 function, KVM will exit to userspace with the
> +KVM_SYSTEM_EVENT_SHUTDOWN event type and with data[0] set to
> +KVM_SYSTEM_EVENT_SHUTDOWN_FLAG_PSCI_OFF2. The only supported hibernate
> +type for the SYSTEM_OFF2 function is HIBERNATE_OFF (0x0).
> +
>  ::
>  
>  		/* KVM_EXIT_IOAPIC_EOI */
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 21c57b812569..d6da0eb1c236 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -274,6 +274,8 @@ struct kvm_arch {
>  #define KVM_ARCH_FLAG_TIMER_PPIS_IMMUTABLE		6
>  	/* Initial ID reg values loaded */
>  #define KVM_ARCH_FLAG_ID_REGS_INITIALIZED		7
> +	/* PSCI SYSTEM_OFF2 (hibernate) enabled for the guest */
> +#define KVM_ARCH_FLAG_SYSTEM_OFF2_ENABLED		8
>  	unsigned long flags;
>  
>  	/* VM-wide vCPU feature set */
> diff --git a/arch/arm64/include/uapi/asm/kvm.h b/arch/arm64/include/uapi/asm/kvm.h
> index 964df31da975..66736ff04011 100644
> --- a/arch/arm64/include/uapi/asm/kvm.h
> +++ b/arch/arm64/include/uapi/asm/kvm.h
> @@ -484,6 +484,12 @@ enum {
>   */
>  #define KVM_SYSTEM_EVENT_RESET_FLAG_PSCI_RESET2	(1ULL << 0)
>  
> +/*
> + * Shutdown caused by a PSCI v1.3 SYSTEM_OFF2 call.
> + * Valid only when the system event has a type of KVM_SYSTEM_EVENT_SHUTDOWN.
> + */
> +#define KVM_SYSTEM_EVENT_SHUTDOWN_FLAG_PSCI_OFF2	(1ULL << 0)
> +
>  /* run->fail_entry.hardware_entry_failure_reason codes. */
>  #define KVM_EXIT_FAIL_ENTRY_CPU_UNSUPPORTED	(1ULL << 0)
>  
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index a25265aca432..1c58762272eb 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -98,6 +98,10 @@ int kvm_vm_ioctl_enable_cap(struct kvm *kvm,
>  		r = 0;
>  		set_bit(KVM_ARCH_FLAG_SYSTEM_SUSPEND_ENABLED, &kvm->arch.flags);
>  		break;
> +	case KVM_CAP_ARM_SYSTEM_OFF2:
> +		r = 0;
> +		set_bit(KVM_ARCH_FLAG_SYSTEM_OFF2_ENABLED, &kvm->arch.flags);
> +		break;
>  	case KVM_CAP_ARM_EAGER_SPLIT_CHUNK_SIZE:
>  		new_cap = cap->args[0];
>  
> @@ -238,6 +242,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>  	case KVM_CAP_VCPU_ATTRIBUTES:
>  	case KVM_CAP_PTP_KVM:
>  	case KVM_CAP_ARM_SYSTEM_SUSPEND:
> +	case KVM_CAP_ARM_SYSTEM_OFF2:
>  	case KVM_CAP_IRQFD_RESAMPLE:
>  	case KVM_CAP_COUNTER_OFFSET:
>  		r = 1;
> diff --git a/arch/arm64/kvm/hyp/nvhe/psci-relay.c b/arch/arm64/kvm/hyp/nvhe/psci-relay.c
> index d57bcb6ab94d..0d4bea0b9ca2 100644
> --- a/arch/arm64/kvm/hyp/nvhe/psci-relay.c
> +++ b/arch/arm64/kvm/hyp/nvhe/psci-relay.c
> @@ -264,6 +264,8 @@ static unsigned long psci_1_0_handler(u64 func_id, struct kvm_cpu_context *host_
>  	switch (func_id) {
>  	case PSCI_1_0_FN_PSCI_FEATURES:
>  	case PSCI_1_0_FN_SET_SUSPEND_MODE:
> +	case PSCI_1_3_FN_SYSTEM_OFF2:
> +	case PSCI_1_3_FN64_SYSTEM_OFF2:

nit: order by version number.

>  	case PSCI_1_1_FN64_SYSTEM_RESET2:
>  		return psci_forward(host_ctxt);
>  	case PSCI_1_0_FN64_SYSTEM_SUSPEND:
> diff --git a/arch/arm64/kvm/psci.c b/arch/arm64/kvm/psci.c
> index 1f69b667332b..59570eea8aa7 100644
> --- a/arch/arm64/kvm/psci.c
> +++ b/arch/arm64/kvm/psci.c
> @@ -194,6 +194,12 @@ static void kvm_psci_system_off(struct kvm_vcpu *vcpu)
>  	kvm_prepare_system_event(vcpu, KVM_SYSTEM_EVENT_SHUTDOWN, 0);
>  }
>  
> +static void kvm_psci_system_off2(struct kvm_vcpu *vcpu)
> +{
> +	kvm_prepare_system_event(vcpu, KVM_SYSTEM_EVENT_SHUTDOWN,
> +				 KVM_SYSTEM_EVENT_SHUTDOWN_FLAG_PSCI_OFF2);
> +}
> +
>  static void kvm_psci_system_reset(struct kvm_vcpu *vcpu)
>  {
>  	kvm_prepare_system_event(vcpu, KVM_SYSTEM_EVENT_RESET, 0);
> @@ -353,6 +359,11 @@ static int kvm_psci_1_x_call(struct kvm_vcpu *vcpu, u32 minor)
>  			if (test_bit(KVM_ARCH_FLAG_SYSTEM_SUSPEND_ENABLED, &kvm->arch.flags))
>  				val = 0;
>  			break;
> +		case PSCI_1_3_FN_SYSTEM_OFF2:
> +		case PSCI_1_3_FN64_SYSTEM_OFF2:
> +			if (test_bit(KVM_ARCH_FLAG_SYSTEM_OFF2_ENABLED, &kvm->arch.flags))
> +				val = 1UL << PSCI_1_3_HIBERNATE_TYPE_OFF;
> +			break;

Testing the PSCI version should be enough (minor >= 3). Same thing
goes the the capability: checking that the host supports 1.3 should be
enough.

	M.

-- 
Without deviation from the norm, progress is not possible.

