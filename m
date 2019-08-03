Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A51EE80615
	for <lists+linux-doc@lfdr.de>; Sat,  3 Aug 2019 13:55:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390084AbfHCLz2 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 3 Aug 2019 07:55:28 -0400
Received: from inca-roads.misterjones.org ([213.251.177.50]:57306 "EHLO
        inca-roads.misterjones.org" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2390012AbfHCLz2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 3 Aug 2019 07:55:28 -0400
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78] helo=why)
        by cheepnis.misterjones.org with esmtpsa (TLSv1.2:AES256-GCM-SHA384:256)
        (Exim 4.80)
        (envelope-from <maz@kernel.org>)
        id 1htsd4-0007Y3-3V; Sat, 03 Aug 2019 13:55:19 +0200
Date:   Sat, 3 Aug 2019 12:55:15 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Steven Price <steven.price@arm.com>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Radim =?UTF-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>,
        Russell King <linux@armlinux.org.uk>,
        Will Deacon <will@kernel.org>,
        James Morse <james.morse@arm.com>,
        Julien Thierry <julien.thierry.kdev@gmail.com>,
        Suzuki K Pouloze <suzuki.poulose@arm.com>,
        kvm@vger.kernel.org, kvmarm@lists.cs.columbia.edu,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/9] KVM: arm64: Support stolen time reporting via
 shared structure
Message-ID: <20190803125515.6aa50084@why>
In-Reply-To: <20190802145017.42543-5-steven.price@arm.com>
References: <20190802145017.42543-1-steven.price@arm.com>
        <20190802145017.42543-5-steven.price@arm.com>
Organization: Approximate
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: steven.price@arm.com, catalin.marinas@arm.com, pbonzini@redhat.com, rkrcmar@redhat.com, linux@armlinux.org.uk, will@kernel.org, james.morse@arm.com, julien.thierry.kdev@gmail.com, suzuki.poulose@arm.com, kvm@vger.kernel.org, kvmarm@lists.cs.columbia.edu, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on cheepnis.misterjones.org); SAEximRunCond expanded to false
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri,  2 Aug 2019 15:50:12 +0100
Steven Price <steven.price@arm.com> wrote:

> Implement the service call for configuring a shared structre between a

structure

> VCPU and the hypervisor in which the hypervisor can write the time
> stolen from the VCPU's execution time by other tasks on the host.
> 
> The hypervisor allocates memory which is placed at an IPA chosen by user
> space. The hypervisor then uses WRITE_ONCE() to update the shared
> structre ensuring single copy atomicity of the 64-bit unsigned value

structure

> that reports stolen time in nanoseconds.
> 
> Whenever stolen time is enabled by the guest, the stolen time counter is
> reset.
> 
> The stolen time itself is retrieved from the sched_info structure
> maintained by the Linux scheduler code. We enable SCHEDSTATS when
> selecting KVM Kconfig to ensure this value is meaningful.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
>  arch/arm64/include/asm/kvm_host.h | 13 +++++-
>  arch/arm64/kvm/Kconfig            |  1 +
>  include/kvm/arm_hypercalls.h      |  1 +
>  include/linux/kvm_types.h         |  2 +
>  virt/kvm/arm/arm.c                | 18 ++++++++
>  virt/kvm/arm/hypercalls.c         | 70 +++++++++++++++++++++++++++++++
>  6 files changed, 104 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index f656169db8c3..78f270190d43 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -44,6 +44,7 @@
>  	KVM_ARCH_REQ_FLAGS(0, KVM_REQUEST_WAIT | KVM_REQUEST_NO_WAKEUP)
>  #define KVM_REQ_IRQ_PENDING	KVM_ARCH_REQ(1)
>  #define KVM_REQ_VCPU_RESET	KVM_ARCH_REQ(2)
> +#define KVM_REQ_RECORD_STEAL	KVM_ARCH_REQ(3)
>  
>  DECLARE_STATIC_KEY_FALSE(userspace_irqchip_in_use);
>  
> @@ -83,6 +84,11 @@ struct kvm_arch {
>  
>  	/* Mandated version of PSCI */
>  	u32 psci_version;
> +
> +	struct kvm_arch_pvtime {
> +		void *st;

Is it really a void *? I'm sure you can use a proper type here...

> +		gpa_t st_base;
> +	} pvtime;
>  };
>  
>  #define KVM_NR_MEM_OBJS     40
> @@ -338,8 +344,13 @@ struct kvm_vcpu_arch {
>  	/* True when deferrable sysregs are loaded on the physical CPU,
>  	 * see kvm_vcpu_load_sysregs and kvm_vcpu_put_sysregs. */
>  	bool sysregs_loaded_on_cpu;
> -};
>  
> +	/* Guest PV state */
> +	struct {
> +		u64 steal;
> +		u64 last_steal;
> +	} steal;
> +};
>  /* Pointer to the vcpu's SVE FFR for sve_{save,load}_state() */
>  #define vcpu_sve_pffr(vcpu) ((void *)((char *)((vcpu)->arch.sve_state) + \
>  				      sve_ffr_offset((vcpu)->arch.sve_max_vl)))
> diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
> index a67121d419a2..d8b88e40d223 100644
> --- a/arch/arm64/kvm/Kconfig
> +++ b/arch/arm64/kvm/Kconfig
> @@ -39,6 +39,7 @@ config KVM
>  	select IRQ_BYPASS_MANAGER
>  	select HAVE_KVM_IRQ_BYPASS
>  	select HAVE_KVM_VCPU_RUN_PID_CHANGE
> +	select SCHEDSTATS
>  	---help---
>  	  Support hosting virtualized guest machines.
>  	  We don't support KVM with 16K page tables yet, due to the multiple
> diff --git a/include/kvm/arm_hypercalls.h b/include/kvm/arm_hypercalls.h
> index 35a5abcc4ca3..9f0710ab4292 100644
> --- a/include/kvm/arm_hypercalls.h
> +++ b/include/kvm/arm_hypercalls.h
> @@ -7,6 +7,7 @@
>  #include <asm/kvm_emulate.h>
>  
>  int kvm_hvc_call_handler(struct kvm_vcpu *vcpu);
> +int kvm_update_stolen_time(struct kvm_vcpu *vcpu);
>  
>  static inline u32 smccc_get_function(struct kvm_vcpu *vcpu)
>  {
> diff --git a/include/linux/kvm_types.h b/include/linux/kvm_types.h
> index bde5374ae021..1c88e69db3d9 100644
> --- a/include/linux/kvm_types.h
> +++ b/include/linux/kvm_types.h
> @@ -35,6 +35,8 @@ typedef unsigned long  gva_t;
>  typedef u64            gpa_t;
>  typedef u64            gfn_t;
>  
> +#define GPA_INVALID	(~(gpa_t)0)
> +
>  typedef unsigned long  hva_t;
>  typedef u64            hpa_t;
>  typedef u64            hfn_t;
> diff --git a/virt/kvm/arm/arm.c b/virt/kvm/arm/arm.c
> index f645c0fbf7ec..ebd963d2580b 100644
> --- a/virt/kvm/arm/arm.c
> +++ b/virt/kvm/arm/arm.c
> @@ -40,6 +40,10 @@
>  #include <asm/kvm_coproc.h>
>  #include <asm/sections.h>
>  
> +#include <kvm/arm_hypercalls.h>
> +#include <kvm/arm_pmu.h>
> +#include <kvm/arm_psci.h>
> +
>  #ifdef REQUIRES_VIRT
>  __asm__(".arch_extension	virt");
>  #endif
> @@ -135,6 +139,7 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
>  	kvm->arch.max_vcpus = vgic_present ?
>  				kvm_vgic_get_max_vcpus() : KVM_MAX_VCPUS;
>  
> +	kvm->arch.pvtime.st_base = GPA_INVALID;
>  	return ret;
>  out_free_stage2_pgd:
>  	kvm_free_stage2_pgd(kvm);
> @@ -371,6 +376,7 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
>  	kvm_vcpu_load_sysregs(vcpu);
>  	kvm_arch_vcpu_load_fp(vcpu);
>  	kvm_vcpu_pmu_restore_guest(vcpu);
> +	kvm_make_request(KVM_REQ_RECORD_STEAL, vcpu);
>  
>  	if (single_task_running())
>  		vcpu_clear_wfe_traps(vcpu);
> @@ -617,6 +623,15 @@ static void vcpu_req_sleep(struct kvm_vcpu *vcpu)
>  	smp_rmb();
>  }
>  
> +static void vcpu_req_record_steal(struct kvm_vcpu *vcpu)
> +{
> +	int idx;
> +
> +	idx = srcu_read_lock(&vcpu->kvm->srcu);
> +	kvm_update_stolen_time(vcpu);
> +	srcu_read_unlock(&vcpu->kvm->srcu, idx);
> +}
> +
>  static int kvm_vcpu_initialized(struct kvm_vcpu *vcpu)
>  {
>  	return vcpu->arch.target >= 0;
> @@ -636,6 +651,9 @@ static void check_vcpu_requests(struct kvm_vcpu *vcpu)
>  		 * that a VCPU sees new virtual interrupts.
>  		 */
>  		kvm_check_request(KVM_REQ_IRQ_PENDING, vcpu);
> +
> +		if (kvm_check_request(KVM_REQ_RECORD_STEAL, vcpu))
> +			vcpu_req_record_steal(vcpu);
>  	}
>  }
>  
> diff --git a/virt/kvm/arm/hypercalls.c b/virt/kvm/arm/hypercalls.c
> index 2906b2df99df..196c71c8dd87 100644
> --- a/virt/kvm/arm/hypercalls.c
> +++ b/virt/kvm/arm/hypercalls.c
> @@ -10,6 +10,70 @@
>  #include <kvm/arm_hypercalls.h>
>  #include <kvm/arm_psci.h>
>  
> +
> +static struct pvclock_vcpu_stolen_time_info *pvtime_get_st(
> +		struct kvm_vcpu *vcpu)

nit: on a single line.

> +{
> +	struct pvclock_vcpu_stolen_time_info *st = vcpu->kvm->arch.pvtime.st;
> +
> +	if (!st)
> +		return NULL;
> +
> +	return &st[kvm_vcpu_get_idx(vcpu)];
> +}
> +
> +int kvm_update_stolen_time(struct kvm_vcpu *vcpu)
> +{
> +	u64 steal;
> +	struct pvclock_vcpu_stolen_time_info *kaddr;
> +
> +	if (vcpu->kvm->arch.pvtime.st_base == GPA_INVALID)
> +		return -ENOTSUPP;

So for a guest that doesn't have stolen time support (which is 100% of
them for the foreseeable future), we still set a request, take the srcu
lock and end-up here for nothing. I'd rather we test this st_base
early, as it should never change once the guest has started.

> +
> +	kaddr = pvtime_get_st(vcpu);
> +
> +	if (!kaddr)
> +		return -ENOTSUPP;

How can this happen?

> +
> +	kaddr->revision = 0;
> +	kaddr->attributes = 0;

Why does this need to be written each time we update the stolen time? I
have the feeling this would be better moved to the hypercall
initializing the data structure.

> +
> +	/* Let's do the local bookkeeping */
> +	steal = vcpu->arch.steal.steal;
> +	steal += current->sched_info.run_delay - vcpu->arch.steal.last_steal;
> +	vcpu->arch.steal.last_steal = current->sched_info.run_delay;
> +	vcpu->arch.steal.steal = steal;
> +
> +	/* Now write out the value to the shared page */
> +	WRITE_ONCE(kaddr->stolen_time, cpu_to_le64(steal));

Is there any requirement for this to be visible to another CPU than the
one this is being written from?

> +
> +	return 0;
> +}
> +
> +static int kvm_hypercall_stolen_time(struct kvm_vcpu *vcpu)
> +{
> +	u64 ret;
> +	int err;
> +
> +	/*
> +	 * Start counting stolen time from the time the guest requests
> +	 * the feature enabled.
> +	 */
> +	vcpu->arch.steal.steal = 0;
> +	vcpu->arch.steal.last_steal = current->sched_info.run_delay;
> +
> +	err = kvm_update_stolen_time(vcpu);
> +
> +	if (err)
> +		ret = SMCCC_RET_NOT_SUPPORTED;
> +	else
> +		ret = vcpu->kvm->arch.pvtime.st_base +
> +			(sizeof(struct pvclock_vcpu_stolen_time_info) *
> +			 kvm_vcpu_get_idx(vcpu));
> +
> +	smccc_set_retval(vcpu, ret, 0, 0, 0);
> +	return 1;
> +}
>  int kvm_hvc_call_handler(struct kvm_vcpu *vcpu)
>  {
>  	u32 func_id = smccc_get_function(vcpu);
> @@ -57,8 +121,14 @@ int kvm_hvc_call_handler(struct kvm_vcpu *vcpu)
>  	case ARM_SMCCC_HV_PV_FEATURES:
>  		feature = smccc_get_arg1(vcpu);
>  		switch (feature) {
> +		case ARM_SMCCC_HV_PV_FEATURES:
> +		case ARM_SMCCC_HV_PV_TIME_ST:
> +			val = SMCCC_RET_SUCCESS;
> +			break;
>  		}
>  		break;
> +	case ARM_SMCCC_HV_PV_TIME_ST:
> +		return kvm_hypercall_stolen_time(vcpu);
>  	default:
>  		return kvm_psci_call(vcpu);
>  	}


Thanks,

	M.
-- 
Without deviation from the norm, progress is not possible.
