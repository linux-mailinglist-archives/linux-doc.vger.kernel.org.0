Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3BBE8DEBCB
	for <lists+linux-doc@lfdr.de>; Mon, 21 Oct 2019 14:14:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728356AbfJUMOx (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 21 Oct 2019 08:14:53 -0400
Received: from [217.140.110.172] ([217.140.110.172]:51042 "EHLO foss.arm.com"
        rhost-flags-FAIL-FAIL-OK-OK) by vger.kernel.org with ESMTP
        id S1727725AbfJUMOx (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 21 Oct 2019 08:14:53 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1F541101E;
        Mon, 21 Oct 2019 05:14:22 -0700 (PDT)
Received: from [10.1.194.43] (e112269-lin.cambridge.arm.com [10.1.194.43])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2FB1D3F718;
        Mon, 21 Oct 2019 05:14:20 -0700 (PDT)
Subject: Re: [PATCH v6 10/10] arm64: Retrieve stolen time as paravirtualized
 guest
To:     Marc Zyngier <maz@kernel.org>
Cc:     Mark Rutland <mark.rutland@arm.com>, kvm@vger.kernel.org,
        =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Suzuki K Pouloze <suzuki.poulose@arm.com>,
        linux-doc@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
        linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>,
        Julien Thierry <julien.thierry.kdev@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Will Deacon <will@kernel.org>, kvmarm@lists.cs.columbia.edu,
        linux-arm-kernel@lists.infradead.org
References: <20191011125930.40834-1-steven.price@arm.com>
 <20191011125930.40834-11-steven.price@arm.com> <86a79wzdhk.wl-maz@kernel.org>
From:   Steven Price <steven.price@arm.com>
Message-ID: <5d340d1a-ebd6-7393-9a33-25dee0d8b1f2@arm.com>
Date:   Mon, 21 Oct 2019 13:14:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <86a79wzdhk.wl-maz@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 19/10/2019 21:28, Marc Zyngier wrote:
> On Fri, 11 Oct 2019 13:59:30 +0100,
> Steven Price <steven.price@arm.com> wrote:
>>
>> Enable paravirtualization features when running under a hypervisor
>> supporting the PV_TIME_ST hypercall.
>>
>> For each (v)CPU, we ask the hypervisor for the location of a shared
>> page which the hypervisor will use to report stolen time to us. We set
>> pv_time_ops to the stolen time function which simply reads the stolen
>> value from the shared page for a VCPU. We guarantee single-copy
>> atomicity using READ_ONCE which means we can also read the stolen
>> time for another VCPU than the currently running one while it is
>> potentially being updated by the hypervisor.
>>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> ---
>>  .../admin-guide/kernel-parameters.txt         |   6 +-
>>  arch/arm64/include/asm/paravirt.h             |   9 +-
>>  arch/arm64/kernel/paravirt.c                  | 148 ++++++++++++++++++
>>  arch/arm64/kernel/time.c                      |   3 +
>>  include/linux/cpuhotplug.h                    |   1 +
>>  5 files changed, 163 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
>> index c7ac2f3ac99f..346b1c7a4afb 100644
>> --- a/Documentation/admin-guide/kernel-parameters.txt
>> +++ b/Documentation/admin-guide/kernel-parameters.txt
>> @@ -3083,9 +3083,9 @@
>>  			[X86,PV_OPS] Disable paravirtualized VMware scheduler
>>  			clock and use the default one.
>>  
>> -	no-steal-acc	[X86,KVM] Disable paravirtualized steal time accounting.
>> -			steal time is computed, but won't influence scheduler
>> -			behaviour
>> +	no-steal-acc	[X86,KVM,ARM64] Disable paravirtualized steal time
>> +			accounting. steal time is computed, but won't
>> +			influence scheduler behaviour
>>  
>>  	nolapic		[X86-32,APIC] Do not enable or use the local APIC.
>>  
>> diff --git a/arch/arm64/include/asm/paravirt.h b/arch/arm64/include/asm/paravirt.h
>> index 799d9dd6f7cc..125c26c42902 100644
>> --- a/arch/arm64/include/asm/paravirt.h
>> +++ b/arch/arm64/include/asm/paravirt.h
>> @@ -21,6 +21,13 @@ static inline u64 paravirt_steal_clock(int cpu)
>>  {
>>  	return pv_ops.time.steal_clock(cpu);
>>  }
>> -#endif
>> +
>> +int __init kvm_guest_init(void);
>> +
>> +#else
>> +
>> +#define kvm_guest_init()
>> +
>> +#endif // CONFIG_PARAVIRT
>>  
>>  #endif
>> diff --git a/arch/arm64/kernel/paravirt.c b/arch/arm64/kernel/paravirt.c
>> index 4cfed91fe256..de73dbec238c 100644
>> --- a/arch/arm64/kernel/paravirt.c
>> +++ b/arch/arm64/kernel/paravirt.c
>> @@ -6,13 +6,161 @@
>>   * Author: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
>>   */
>>  
>> +#define pr_fmt(fmt) "kvmarm-pv: " fmt
>> +
>> +#include <linux/arm-smccc.h>
>> +#include <linux/cpuhotplug.h>
>>  #include <linux/export.h>
>> +#include <linux/io.h>
>>  #include <linux/jump_label.h>
>> +#include <linux/printk.h>
>> +#include <linux/psci.h>
>> +#include <linux/reboot.h>
>> +#include <linux/slab.h>
>>  #include <linux/types.h>
>> +
>>  #include <asm/paravirt.h>
>> +#include <asm/pvclock-abi.h>
>> +#include <asm/smp_plat.h>
>>  
>>  struct static_key paravirt_steal_enabled;
>>  struct static_key paravirt_steal_rq_enabled;
>>  
>>  struct paravirt_patch_template pv_ops;
>>  EXPORT_SYMBOL_GPL(pv_ops);
>> +
>> +struct kvmarm_stolen_time_region {
>> +	struct pvclock_vcpu_stolen_time *kaddr;
>> +};
>> +
>> +static DEFINE_PER_CPU(struct kvmarm_stolen_time_region, stolen_time_region);
>> +
>> +static bool steal_acc = true;
>> +static int __init parse_no_stealacc(char *arg)
>> +{
>> +	steal_acc = false;
>> +	return 0;
>> +}
>> +
>> +early_param("no-steal-acc", parse_no_stealacc);
>> +
>> +/* return stolen time in ns by asking the hypervisor */
>> +static u64 kvm_steal_clock(int cpu)
> 
> This isn't KVM specific.

Good point - these changes have grown from an initial KVM-only
implementation, but this is no longer KVM specific in any way. So I'll
rename the KVM part away.

>> +{
>> +	struct kvmarm_stolen_time_region *reg;
>> +
>> +	reg = per_cpu_ptr(&stolen_time_region, cpu);
>> +	if (!reg->kaddr) {
>> +		pr_warn_once("stolen time enabled but not configured for cpu %d\n",
>> +			     cpu);
>> +		return 0;
>> +	}
>> +
>> +	return le64_to_cpu(READ_ONCE(reg->kaddr->stolen_time));
>> +}
>> +
>> +static int disable_stolen_time_current_cpu(void)
>> +{
>> +	struct kvmarm_stolen_time_region *reg;
>> +
>> +	reg = this_cpu_ptr(&stolen_time_region);
>> +	if (!reg->kaddr)
>> +		return 0;
>> +
>> +	memunmap(reg->kaddr);
>> +	memset(reg, 0, sizeof(*reg));
>> +
>> +	return 0;
>> +}
>> +
>> +static int stolen_time_dying_cpu(unsigned int cpu)
>> +{
>> +	return disable_stolen_time_current_cpu();
>> +}
> 
> You can merge these two functions, as there is no other caller.

Will do

>> +
>> +static int init_stolen_time_cpu(unsigned int cpu)
>> +{
>> +	struct kvmarm_stolen_time_region *reg;
>> +	struct arm_smccc_res res;
>> +
>> +	reg = this_cpu_ptr(&stolen_time_region);
>> +
>> +	arm_smccc_1_1_invoke(ARM_SMCCC_HV_PV_TIME_ST, &res);
>> +
>> +	if ((long)res.a0 < 0)
>> +		return -EINVAL;
> 
> I'd rather you check an actual error code, just in case the memory map
> starts growing to a point where we have 64bit (I)PAs...

I suspect we'd have a whole lot of other problems with 64 bit IPAs, but
fair enough; we know the one error code that can be returned.

>> +
>> +	reg->kaddr = memremap(res.a0,
>> +			      sizeof(struct pvclock_vcpu_stolen_time),
>> +			      MEMREMAP_WB);
>> +
>> +	if (!reg->kaddr) {
>> +		pr_warn("Failed to map stolen time data structure\n");
>> +		return -ENOMEM;
>> +	}
>> +
>> +	if (le32_to_cpu(reg->kaddr->revision) != 0 ||
>> +	    le32_to_cpu(reg->kaddr->attributes) != 0) {
>> +		pr_warn("Unexpected revision or attributes in stolen time data\n");
> 
> WARN_ONCE instead? You probably don't want to scream for each and
> every CPU that boots...

Good point.

>> +		return -ENXIO;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int kvm_arm_init_stolen_time(void)
>> +{
>> +	int ret;
>> +
>> +	ret = cpuhp_setup_state(CPUHP_AP_ARM_KVMPV_STARTING,
>> +				"hypervisor/kvmarm/pv:starting",
>> +				init_stolen_time_cpu, stolen_time_dying_cpu);
>> +	if (ret < 0)
>> +		return ret;
>> +	return 0;
>> +}
>> +
>> +static bool has_kvm_steal_clock(void)
> 
> This is not KVM specific either.
> 
>> +{
>> +	struct arm_smccc_res res;
>> +
>> +	/* To detect the presence of PV time support we require SMCCC 1.1+ */
>> +	if (psci_ops.smccc_version < SMCCC_VERSION_1_1)
>> +		return false;
>> +
>> +	arm_smccc_1_1_invoke(ARM_SMCCC_ARCH_FEATURES_FUNC_ID,
>> +			     ARM_SMCCC_HV_PV_TIME_FEATURES, &res);
>> +
>> +	if (res.a0 != SMCCC_RET_SUCCESS)
>> +		return false;
>> +
>> +	arm_smccc_1_1_invoke(ARM_SMCCC_HV_PV_TIME_FEATURES,
>> +			     ARM_SMCCC_HV_PV_TIME_ST, &res);
>> +
>> +	if (res.a0 != SMCCC_RET_SUCCESS)
>> +		return false;
>> +
>> +	return true;
> 
> 	return (res.a0 == SMCCC_RET_SUCCESS);
> 
>> +}
>> +
>> +int __init kvm_guest_init(void)
> 
> How about something like pv_time_init() instead? In the guest, this is
> no way KVM specific, and I still hope for this to work on things like
> Xen/HyperV/VMware (yeah, I'm foolishly optimistic). All the references
> to KVM should go, and be replaced by something more generic (after
> all, you're only implementing the spec, so feel free to call it
> den0057_* if you really want).

pv_time_init() seems like a reasonable name, it rolls off the tongue
better than den0057 :)

Thanks,

Steve

>> +{
>> +	int ret;
>> +
>> +	if (!has_kvm_steal_clock())
>> +		return 0;
>> +
>> +	ret = kvm_arm_init_stolen_time();
>> +	if (ret)
>> +		return ret;
>> +
>> +	pv_ops.time.steal_clock = kvm_steal_clock;
>> +
>> +	static_key_slow_inc(&paravirt_steal_enabled);
>> +	if (steal_acc)
>> +		static_key_slow_inc(&paravirt_steal_rq_enabled);
>> +
>> +	pr_info("using stolen time PV\n");
>> +
>> +	return 0;
>> +}
>> diff --git a/arch/arm64/kernel/time.c b/arch/arm64/kernel/time.c
>> index 0b2946414dc9..a52aea14c6ec 100644
>> --- a/arch/arm64/kernel/time.c
>> +++ b/arch/arm64/kernel/time.c
>> @@ -30,6 +30,7 @@
>>  
>>  #include <asm/thread_info.h>
>>  #include <asm/stacktrace.h>
>> +#include <asm/paravirt.h>
>>  
>>  unsigned long profile_pc(struct pt_regs *regs)
>>  {
>> @@ -65,4 +66,6 @@ void __init time_init(void)
>>  
>>  	/* Calibrate the delay loop directly */
>>  	lpj_fine = arch_timer_rate / HZ;
>> +
>> +	kvm_guest_init();
>>  }
>> diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h
>> index 068793a619ca..89d75edb5750 100644
>> --- a/include/linux/cpuhotplug.h
>> +++ b/include/linux/cpuhotplug.h
>> @@ -136,6 +136,7 @@ enum cpuhp_state {
>>  	/* Must be the last timer callback */
>>  	CPUHP_AP_DUMMY_TIMER_STARTING,
>>  	CPUHP_AP_ARM_XEN_STARTING,
>> +	CPUHP_AP_ARM_KVMPV_STARTING,
>>  	CPUHP_AP_ARM_CORESIGHT_STARTING,
>>  	CPUHP_AP_ARM64_ISNDEP_STARTING,
>>  	CPUHP_AP_SMPCFD_DYING,
>> -- 
>> 2.20.1
>>
>>
> 
> Thanks,
> 
> 	M.
> 

