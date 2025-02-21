Return-Path: <linux-doc+bounces-38932-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 153F7A3F835
	for <lists+linux-doc@lfdr.de>; Fri, 21 Feb 2025 16:15:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC4963AEEA3
	for <lists+linux-doc@lfdr.de>; Fri, 21 Feb 2025 15:15:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4B5F2101BE;
	Fri, 21 Feb 2025 15:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kLG7Jsfh"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0942040A3;
	Fri, 21 Feb 2025 15:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740150911; cv=none; b=i0BkylgG+G3QpeweJ//NjNuwL5GmonnK/Q5n7NgNcJe+AEgda2i8ArCNI5/2lcxPjFjlh7QFr+QT6y+gx8szEndS9a5HrSAAlX4bbT9+vf/vmbTxotk5G6dHYMx4QmcPJFh91loqNI7hwRt8c1DfKh0AaKFczVlDg244Ngsbtmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740150911; c=relaxed/simple;
	bh=LZZDIn882+du5zwGJiIkefHV1QQaICX9MW9PEMXgods=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HKazK1uDm+VVV98U5tdXlWILSGWlDj2upFkLdNcWVfhhUOGPnDdiFPxcEEqmZgY3y7RcMgF6gpoi8gDqH7G4lygSujeYL+pKpH6/SwEEGdqYVuy3m8Jt0Un1AwvoSwEkx3jU2xu/h3Hbt1uM7QHXCYUwU3VjQstAa7Dq5AgdHaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kLG7Jsfh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B624AC4CED6;
	Fri, 21 Feb 2025 15:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740150910;
	bh=LZZDIn882+du5zwGJiIkefHV1QQaICX9MW9PEMXgods=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=kLG7JsfhD0qxdw5xct1tz48UF/iCjnWGHyEsfnOdw9ihXeGctJIQPKO56bW1hAiyl
	 heT0OgEyl3Eu7Jom05MuCyUQxH58IfaySwLuhBr1egJ6/XoZz6obieqiZR/xu9Ch95
	 RS55yKoktF8o6Vwh1visCh/cZaGBywRUQ3RssR0UQuLS88MDKKTAYUH4//yUFaCmcF
	 Hk5TvlEjKrqg3Ohz1anSvLehBFJQNRuIuu3c1P3rHnBm+xSu7R+COz3vQuTRUG7NEc
	 d0TQSsGSvPDnANthLRjKWnWPUFUDTEuhVtl8LkgsueA/Ji1tsPh8x/PmI92Oz6FCaN
	 Fw43JGqHKJxsg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tlUk8-006cla-7o;
	Fri, 21 Feb 2025 15:15:08 +0000
Date: Fri, 21 Feb 2025 15:15:07 +0000
Message-ID: <86pljbqqh0.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Jiaqi Yan <jiaqiyan@google.com>
Cc: oliver.upton@linux.dev,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	pbonzini@redhat.com,
	corbet@lwn.net,
	kvm@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	duenwen@google.com,
	rananta@google.com,
	jthoughton@google.com
Subject: Re: [RFC PATCH v3 1/3] KVM: arm64: SIGBUS VMM for SEA guest abort
In-Reply-To: <20250220232959.247600-1-jiaqiyan@google.com>
References: <20250220232959.247600-1-jiaqiyan@google.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/29.4
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: jiaqiyan@google.com, oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, pbonzini@redhat.com, corbet@lwn.net, kvm@vger.kernel.org, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, duenwen@google.com, rananta@google.com, jthoughton@google.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false

Honestly, please drop this RFC thing.  At v3, either you think this is
in a good enough shape to be merged, or you simply don't post it. I
assume you're in the former camp.

On Thu, 20 Feb 2025 23:29:57 +0000,
Jiaqi Yan <jiaqiyan@google.com> wrote:
> 
> When APEI is unable claim or handles synchronous external abort (SEA)
> today KVM handles SEA for guest by injecting an async SError into the
> guest directly, bypassing VMM, usually results in guest kernel panic.
> 
> One major situation of guest SEA is when vCPU consumes uncorrectable
> memory error on the physical memory. Although SError and guest kernel
> panic effectively stops the propagation of corrupted memory, it is not
> easy for VMM and guest to recover from memory error in a more graceful
> manner.
> 
> This patch teaches KVM to send a SIGBUS BUS_OBJERR to VMM/vCPU, like

https://elixir.bootlin.com/linux/v6.13/source/Documentation/process/submitting-patches.rst#L95

> how core kernel signals SIGBUS BUS_OBJERR to a gernal poison consuming
> userspace thread when APEI is unable to claim the SEA. In addition to
> the benifit that KVM's handling for SEA becomes aligned with core
> kernel's behavior:
> - VMM can inject SEA to guest. Compared to SError, the blast radius in
>   VM is possible to be limited to only the consuming thread in guest,
>   instead of the entire guest kernel (unless the poison consumption is
>   from guest kernel).

But that would be equally possible for this SEA to be delivered from
the host kernel, without involving userspace at all, right? Why
mandate a userspace round trip?

> - VMM usually tracks the poisoned guest pages. Together with [1], if
>   guest consumes again the already poisoned guest pages, VMM can protect
>   itself and the host by stopping the consumption at software level, by
>   intercepting guest's access to poisoned pages, and again injecting
>   SEA to guest.

How does this interact with the userfault thingy? I'd expect the VMM
to simply removing the poisoned page from the memslot, which doesn't
require anything on top of what we have today.

Overall, most of the above belongs to a cover letter, which is
crucially missing in this series.

> 
> KVM now handles SEA as follows:
> 1. Delegate to APEI and GHES to see if SEA can be claimed by them.
> 2. If APEI failed to claim the SEA, send current thread (i.e. VMM in EL0)
>    a si_code=BUS_OBJERR SIGBUS signal. If the DIMM error's physical
>    address is available from FAR_EL2, si_addr will be the DIMM error's
>    host virtual address in VMM/vCPU's memory space.

VMM *or* vcpu? The vcpu address space is the guest's. The VMM address
space is the in userspace.

Also, I'm still not fond of the signal horror. I still feel this is a
broken abstraction, at odds with the rest of the KVM API which relies
on vcpu exit codes. Signals are the perfect recipe to trigger subtle,
potentially exploitable VMM bugs. I'm sure your VMM is perfect (Ah!),
but think of the children! ;-)

>
> Tested on a machine running Siryn AmpereOne processor. A dummy application
> in VM allocated some memory buffer. The test used EINJ to inject an

How? Do we allow error injection from a guest?

> uncorrectable recoverable memory error at a page in the allocated memory
> buffer. The dummy application then consumed the memory error. Some hack
> was done to make core kernel's memory_failure triggered by poison
> generation to fail, so KVM had to deal with the SEA guest abort due to
> poison consumption. vCPU thread in VMM received SIGBUS BUS_OBJERR with
> valid host virtual address of the poisoned page. VMM then injected a SEA
> into guest using KVM_SET_VCPU_EVENTS with ext_dabt_pending=1. At last
> the dummy application in guest was killed by SIGBUS BUS_OBJERR, while the
> guest survived and continued to run.

This has nothing to do in this patch's commit message. But it would
have its place for a selftest doing exactly what you describe.

> 
> [1] https://lpc.events/event/18/contributions/1757/attachments/1442/3073/LPC_%20KVM%20Userfault.pdf
> 
> Changelog
> 
> RFC V3 -> RFC v2
> - SEA or ECC error at all levels of TTW can be handled by SIGBUS EL0,
>   and no case to inject SError to guest anymore.
> - move #include from kvm_ras.h to kvm_ras.c.
> 
> RFC v2 -> RFC v1
> - reword commit msg
> - drop unused parameters from kvm_delegate_guest_sea
> - remove KVM_CAP_ARM_SIGBUS_ON_SEA and its opt in code
> - set FnV bit in vcpu's ESR_ELx if host ESR_EL2's FnV is set
> - add documentation for this new SIGBUS feature

Please talk to your colleagues on how to write a cover letter. None of
that should be here.

> 
> Signed-off-by: Jiaqi Yan <jiaqiyan@google.com>
> ---
>  arch/arm64/include/asm/kvm_ras.h | 29 +++++++-------
>  arch/arm64/kvm/Makefile          |  2 +-
>  arch/arm64/kvm/kvm_ras.c         | 65 ++++++++++++++++++++++++++++++++
>  arch/arm64/kvm/mmu.c             |  8 +---
>  4 files changed, 83 insertions(+), 21 deletions(-)
>  create mode 100644 arch/arm64/kvm/kvm_ras.c
> 
> diff --git a/arch/arm64/include/asm/kvm_ras.h b/arch/arm64/include/asm/kvm_ras.h
> index 87e10d9a635b5..bacae54013b4e 100644
> --- a/arch/arm64/include/asm/kvm_ras.h
> +++ b/arch/arm64/include/asm/kvm_ras.h
> @@ -4,22 +4,25 @@
>  #ifndef __ARM64_KVM_RAS_H__
>  #define __ARM64_KVM_RAS_H__
>  
> -#include <linux/acpi.h>
> -#include <linux/errno.h>
> -#include <linux/types.h>
> -
> -#include <asm/acpi.h>
> +#include <linux/kvm_host.h>
>  
>  /*
> - * Was this synchronous external abort a RAS notification?
> - * Returns '0' for errors handled by some RAS subsystem, or -ENOENT.
> + * For synchrnous external abort taken to KVM at EL2, not on translation

synchronous

> + * table walk or hardware update of translation table, is FAR_EL2 valid?

Do we need all these conditions spelled out? Isn't the goal of such a
helper to *abstract* the complexity of the architecture?

>   */
> -static inline int kvm_handle_guest_sea(phys_addr_t addr, u64 esr)
> -{
> -	/* apei_claim_sea(NULL) expects to mask interrupts itself */
> -	lockdep_assert_irqs_enabled();
> +bool kvm_vcpu_sea_far_valid(const struct kvm_vcpu *vcpu);
>  
> -	return apei_claim_sea(NULL);
> -}
> +/*
> + * Handle synchronous external abort (SEA) in the following order:
> + * 1. Delegate to APEI/GHES to see if they can claim SEA. If so, all done.
> + * 2. Send SIGBUS to current with si_code=BUS_OBJERR and si_addr set to
> + *    the poisoned host virtual address. When accurate HVA is unavailable,
> + *    si_addr will be 0.

How do you disambiguate this with 0 being a valid address? See vm.mmap_min_addr.

> + *
> + * Note this applies to both instruction and data abort (ESR_ELx_EC_IABT_*
> + * and ESR_ELx_EC_DABT_*). As the name suggests, KVM must be taking the SEA
> + * when calling into this function, e.g. kvm_vcpu_abt_issea == true.

Again, this is pointlessly verbose. I'd rather we keep the original
comment here.

> + */
> +void kvm_handle_guest_sea(struct kvm_vcpu *vcpu);
>  
>  #endif /* __ARM64_KVM_RAS_H__ */
> diff --git a/arch/arm64/kvm/Makefile b/arch/arm64/kvm/Makefile
> index 3cf7adb2b5038..c4a3a6d4870e6 100644
> --- a/arch/arm64/kvm/Makefile
> +++ b/arch/arm64/kvm/Makefile
> @@ -23,7 +23,7 @@ kvm-y += arm.o mmu.o mmio.o psci.o hypercalls.o pvtime.o \
>  	 vgic/vgic-v3.o vgic/vgic-v4.o \
>  	 vgic/vgic-mmio.o vgic/vgic-mmio-v2.o \
>  	 vgic/vgic-mmio-v3.o vgic/vgic-kvm-device.o \
> -	 vgic/vgic-its.o vgic/vgic-debug.o
> +	 vgic/vgic-its.o vgic/vgic-debug.o kvm_ras.o
>  
>  kvm-$(CONFIG_HW_PERF_EVENTS)  += pmu-emul.o pmu.o
>  kvm-$(CONFIG_ARM64_PTR_AUTH)  += pauth.o
> diff --git a/arch/arm64/kvm/kvm_ras.c b/arch/arm64/kvm/kvm_ras.c
> new file mode 100644
> index 0000000000000..47531ed378910
> --- /dev/null
> +++ b/arch/arm64/kvm/kvm_ras.c
> @@ -0,0 +1,65 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#include <linux/acpi.h>
> +#include <linux/types.h>
> +
> +#include <asm/acpi.h>
> +#include <asm/kvm_emulate.h>
> +#include <asm/kvm_ras.h>
> +#include <asm/system_misc.h>
> +
> +bool kvm_vcpu_sea_far_valid(const struct kvm_vcpu *vcpu)
> +{
> +	/*
> +	 * FnV is valid only for Data/Instruction aborts and if DFSC/IFSC
> +	 * is ESR_ELx_FSC_EXTABT(0b010000).

This is a terrible sentence. FnV stands for "FAR not Valid". Do you
see the problem? Yes, the same verbiage exists in the spec, but I
don't think we need to sink that low...

> +	 */
> +	if (kvm_vcpu_trap_get_fault(vcpu) == ESR_ELx_FSC_EXTABT)
> +		return !(vcpu->arch.fault.esr_el2 & ESR_ELx_FnV);
> +
> +	/* Other exception classes or aborts don't care about FnV field. */

They absolutely do care. But FnV is RES0 in this case. So the real
question is why don't you simply return the negated bit in all cases?

> +	return true;
> +}
> +
> +/*
> + * Was this synchronous external abort a RAS notification?
> + * Returns '0' for errors handled by some RAS subsystem, or -ENOENT.
> + */
> +static int kvm_delegate_guest_sea(void)
> +{
> +	/* apei_claim_sea(NULL) expects to mask interrupts itself */
> +	lockdep_assert_irqs_enabled();
> +	return apei_claim_sea(NULL);
> +}
> +
> +void kvm_handle_guest_sea(struct kvm_vcpu *vcpu)
> +{
> +	int idx;
> +	u64 vcpu_esr = kvm_vcpu_get_esr(vcpu);
> +	phys_addr_t fault_ipa = kvm_vcpu_get_fault_ipa(vcpu);
> +	gfn_t gfn = fault_ipa >> PAGE_SHIFT;
> +	unsigned long hva = 0UL;
> +
> +	/*
> +	 * For RAS the host kernel may handle this abort.
> +	 * There is no need to SIGBUS VMM, or pass the error into the guest.
> +	 */
> +	if (kvm_delegate_guest_sea() == 0)
> +		return;
> +
> +	if (kvm_vcpu_sea_far_valid(vcpu)) {
> +		idx = srcu_read_lock(&vcpu->kvm->srcu);
> +		hva = gfn_to_hva(vcpu->kvm, gfn);
> +		srcu_read_unlock(&vcpu->kvm->srcu, idx);
> +	}
> +
> +	/*
> +	 * When FAR is not valid, or GFN to HVA translation failed, send 0
> +	 * as si_addr like what do_sea() does.
> +	 */
> +	if (kvm_is_error_hva(hva))
> +		hva = 0UL;

See my earlier comment about 0 being a valid VA.

> +
> +	arm64_notify_die("synchronous external abort",
> +			 current_pt_regs(), SIGBUS, BUS_OBJERR, hva, vcpu_esr);
> +}
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 1f55b0c7b11d9..ef6127d0bf24f 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1808,13 +1808,7 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
>  
>  	/* Synchronous External Abort? */
>  	if (kvm_vcpu_abt_issea(vcpu)) {
> -		/*
> -		 * For RAS the host kernel may handle this abort.
> -		 * There is no need to pass the error into the guest.
> -		 */
> -		if (kvm_handle_guest_sea(fault_ipa, kvm_vcpu_get_esr(vcpu)))
> -			kvm_inject_vabt(vcpu);
> -
> +		kvm_handle_guest_sea(vcpu);

But this is an ABI change. My userspace is not ready, willing nor able
to handle this, and yet you're forcing it on me?

	M.

-- 
Without deviation from the norm, progress is not possible.

