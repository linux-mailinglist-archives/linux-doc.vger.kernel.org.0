Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28D5B2188F1
	for <lists+linux-doc@lfdr.de>; Wed,  8 Jul 2020 15:27:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729311AbgGHN1i (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 8 Jul 2020 09:27:38 -0400
Received: from mga01.intel.com ([192.55.52.88]:44799 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728148AbgGHN1h (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 8 Jul 2020 09:27:37 -0400
IronPort-SDR: GFOFpmxs39ys2LWS0Cxyt9SFupqrx1y1YjRbjKrN/mj8YNxgia+OC4mQamq5zAw7YGYxzhsqrO
 mv2b71UMbphA==
X-IronPort-AV: E=McAfee;i="6000,8403,9675"; a="165885625"
X-IronPort-AV: E=Sophos;i="5.75,327,1589266800"; 
   d="scan'208";a="165885625"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2020 06:27:36 -0700
IronPort-SDR: u8Fz46potcxJSI3SBmI7+w1H8xOv5qWfS8QDcZKGd5HubYAHAUzU8aC4Su31Bv/43RVnDmdEgz
 lyBSIZPis3RA==
X-IronPort-AV: E=Sophos;i="5.75,327,1589266800"; 
   d="scan'208";a="283797182"
Received: from xiaoyaol-mobl.ccr.corp.intel.com (HELO [10.255.31.184]) ([10.255.31.184])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2020 06:27:34 -0700
Subject: Re: [PATCH v3 4/8] KVM: X86: Split kvm_update_cpuid()
To:     Paolo Bonzini <pbonzini@redhat.com>,
        Sean Christopherson <sean.j.christopherson@intel.com>,
        Jim Mattson <jmattson@google.com>
Cc:     kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Joerg Roedel <joro@8bytes.org>
References: <20200708065054.19713-1-xiaoyao.li@intel.com>
 <20200708065054.19713-5-xiaoyao.li@intel.com>
 <ad349b28-bc62-e478-c610-e829974a8342@redhat.com>
 <92184f05-ca27-268c-ea72-f939fb1a0ab2@intel.com>
 <4123eb60-d89a-9112-dd7e-1a7627a0fc70@redhat.com>
From:   Xiaoyao Li <xiaoyao.li@intel.com>
Message-ID: <0c0084cb-92c0-23fe-dc5a-441e4b04742c@intel.com>
Date:   Wed, 8 Jul 2020 21:27:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <4123eb60-d89a-9112-dd7e-1a7627a0fc70@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 7/8/2020 8:41 PM, Paolo Bonzini wrote:
> On 08/07/20 14:33, Xiaoyao Li wrote:
>> On 7/8/2020 8:06 PM, Paolo Bonzini wrote:
>>> On 08/07/20 08:50, Xiaoyao Li wrote:
>>>> Split the part of updating vcpu model out of kvm_update_cpuid(), and put
>>>> it into a new kvm_update_vcpu_model(). So it's more clear that
>>>> kvm_update_cpuid() is to update guest CPUID settings, while
>>>> kvm_update_vcpu_model() is to update vcpu model (settings) based on the
>>>> updated CPUID settings.
>>>>
>>>> Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
>>>
>>> I would prefer to keep the kvm_update_cpuid name for what you called
>>> kvm_update_vcpu_model(), and rename the rest to
>>> kvm_update_cpuid_runtime().
>>
>> But there is no CPUID being updated in kvm_update_cpuid(), after
>> kvm_update_cpuid_runtime() is split out. This is confusing, IMO.
> 
> Then what about kvm_vcpu_after_set_cpuid()?  It's the "model" that is
> not clear.

I'm ok with kvm_vcpu_after_set_cpuid().

BTW there is an unknown for me regarding enter_smm(). Currently, it 
calls kvm_update_cpuid(). I'm not sure which part it really needs, 
update CPUID or update vcpu state based on CPUID? maybe both?
So in this Patch, after splitting kvm_update_cpuid(), I keep both 
functions there to ensure no functional change in enter_smm().
So using the name "kvm_vcpu_after_set_cpuid" seems weird in that function.

> Thanks,
> 
> Paolo
> 
>>> Paolo
>>>
>>>> ---
>>>>    arch/x86/kvm/cpuid.c | 38 ++++++++++++++++++++++++--------------
>>>>    arch/x86/kvm/cpuid.h |  1 +
>>>>    arch/x86/kvm/x86.c   |  1 +
>>>>    3 files changed, 26 insertions(+), 14 deletions(-)
>>>>
>>>> diff --git a/arch/x86/kvm/cpuid.c b/arch/x86/kvm/cpuid.c
>>>> index a825878b7f84..001f5a94880e 100644
>>>> --- a/arch/x86/kvm/cpuid.c
>>>> +++ b/arch/x86/kvm/cpuid.c
>>>> @@ -76,7 +76,6 @@ static int kvm_check_cpuid(struct kvm_vcpu *vcpu)
>>>>    void kvm_update_cpuid(struct kvm_vcpu *vcpu)
>>>>    {
>>>>        struct kvm_cpuid_entry2 *best;
>>>> -    struct kvm_lapic *apic = vcpu->arch.apic;
>>>>          best = kvm_find_cpuid_entry(vcpu, 1, 0);
>>>>        if (best) {
>>>> @@ -89,26 +88,14 @@ void kvm_update_cpuid(struct kvm_vcpu *vcpu)
>>>>                   vcpu->arch.apic_base & MSR_IA32_APICBASE_ENABLE);
>>>>        }
>>>>    -    if (best && apic) {
>>>> -        if (cpuid_entry_has(best, X86_FEATURE_TSC_DEADLINE_TIMER))
>>>> -            apic->lapic_timer.timer_mode_mask = 3 << 17;
>>>> -        else
>>>> -            apic->lapic_timer.timer_mode_mask = 1 << 17;
>>>> -    }
>>>> -
>>>>        best = kvm_find_cpuid_entry(vcpu, 7, 0);
>>>>        if (best && boot_cpu_has(X86_FEATURE_PKU) && best->function ==
>>>> 0x7)
>>>>            cpuid_entry_change(best, X86_FEATURE_OSPKE,
>>>>                       kvm_read_cr4_bits(vcpu, X86_CR4_PKE));
>>>>          best = kvm_find_cpuid_entry(vcpu, 0xD, 0);
>>>> -    if (!best) {
>>>> -        vcpu->arch.guest_supported_xcr0 = 0;
>>>> -    } else {
>>>> -        vcpu->arch.guest_supported_xcr0 =
>>>> -            (best->eax | ((u64)best->edx << 32)) & supported_xcr0;
>>>> +    if (best)
>>>>            best->ebx = xstate_required_size(vcpu->arch.xcr0, false);
>>>> -    }
>>>>          best = kvm_find_cpuid_entry(vcpu, 0xD, 1);
>>>>        if (best && (cpuid_entry_has(best, X86_FEATURE_XSAVES) ||
>>>> @@ -127,6 +114,27 @@ void kvm_update_cpuid(struct kvm_vcpu *vcpu)
>>>>                           vcpu->arch.ia32_misc_enable_msr &
>>>>                           MSR_IA32_MISC_ENABLE_MWAIT);
>>>>        }
>>>> +}
>>>> +
>>>> +void kvm_update_vcpu_model(struct kvm_vcpu *vcpu)
>>>> +{
>>>> +    struct kvm_lapic *apic = vcpu->arch.apic;
>>>> +    struct kvm_cpuid_entry2 *best;
>>>> +
>>>> +    best = kvm_find_cpuid_entry(vcpu, 1, 0);
>>>> +    if (best && apic) {
>>>> +        if (cpuid_entry_has(best, X86_FEATURE_TSC_DEADLINE_TIMER))
>>>> +            apic->lapic_timer.timer_mode_mask = 3 << 17;
>>>> +        else
>>>> +            apic->lapic_timer.timer_mode_mask = 1 << 17;
>>>> +    }
>>>> +
>>>> +    best = kvm_find_cpuid_entry(vcpu, 0xD, 0);
>>>> +    if (!best)
>>>> +        vcpu->arch.guest_supported_xcr0 = 0;
>>>> +    else
>>>> +        vcpu->arch.guest_supported_xcr0 =
>>>> +            (best->eax | ((u64)best->edx << 32)) & supported_xcr0;
>>>>          /* Note, maxphyaddr must be updated before tdp_level. */
>>>>        vcpu->arch.maxphyaddr = cpuid_query_maxphyaddr(vcpu);
>>>> @@ -218,6 +226,7 @@ int kvm_vcpu_ioctl_set_cpuid(struct kvm_vcpu *vcpu,
>>>>        kvm_apic_set_version(vcpu);
>>>>        kvm_x86_ops.cpuid_update(vcpu);
>>>>        kvm_update_cpuid(vcpu);
>>>> +    kvm_update_vcpu_model(vcpu);
>>>>          kvfree(cpuid_entries);
>>>>    out:
>>>> @@ -247,6 +256,7 @@ int kvm_vcpu_ioctl_set_cpuid2(struct kvm_vcpu *vcpu,
>>>>        kvm_apic_set_version(vcpu);
>>>>        kvm_x86_ops.cpuid_update(vcpu);
>>>>        kvm_update_cpuid(vcpu);
>>>> +    kvm_update_vcpu_model(vcpu);
>>>>    out:
>>>>        return r;
>>>>    }
>>>> diff --git a/arch/x86/kvm/cpuid.h b/arch/x86/kvm/cpuid.h
>>>> index f136de1debad..45e3643e2fba 100644
>>>> --- a/arch/x86/kvm/cpuid.h
>>>> +++ b/arch/x86/kvm/cpuid.h
>>>> @@ -10,6 +10,7 @@ extern u32 kvm_cpu_caps[NCAPINTS] __read_mostly;
>>>>    void kvm_set_cpu_caps(void);
>>>>      void kvm_update_cpuid(struct kvm_vcpu *vcpu);
>>>> +void kvm_update_vcpu_model(struct kvm_vcpu *vcpu);
>>>>    struct kvm_cpuid_entry2 *kvm_find_cpuid_entry(struct kvm_vcpu *vcpu,
>>>>                              u32 function, u32 index);
>>>>    int kvm_dev_ioctl_get_cpuid(struct kvm_cpuid2 *cpuid,
>>>> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
>>>> index 09ee54f5e385..6f376392e6e6 100644
>>>> --- a/arch/x86/kvm/x86.c
>>>> +++ b/arch/x86/kvm/x86.c
>>>> @@ -8184,6 +8184,7 @@ static void enter_smm(struct kvm_vcpu *vcpu)
>>>>    #endif
>>>>          kvm_update_cpuid(vcpu);
>>>> +    kvm_update_vcpu_model(vcpu);
>>>>        kvm_mmu_reset_context(vcpu);
>>>>    }
>>>>   
>>>
>>
> 

