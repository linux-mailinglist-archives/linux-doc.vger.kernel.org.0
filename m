Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79D7C2187CE
	for <lists+linux-doc@lfdr.de>; Wed,  8 Jul 2020 14:41:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729216AbgGHMll (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 8 Jul 2020 08:41:41 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:48298 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728918AbgGHMlk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 8 Jul 2020 08:41:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1594212098;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PWJrF8GNrTsOPJXQF6A4Nm884YZBFXppAIvdzvPyPnk=;
        b=WaeUpVJO0XJg224DKxAsyj1mcTR2R7v9vcYRNL4Iy0IV/FpI6erK0dNFeqRglYnpD3Oa1b
        7i4vcPO8S7HavB3cjtJzhB4wXwi7Q+ba0T8fGizbEsXguJ6wtSszRoYfbtDnoRjVEp62CZ
        VpomXYecg+k+9y/Ourm/BWQsn5y9Rbo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-5YvKZmOjM-G6hFJmwYDijw-1; Wed, 08 Jul 2020 08:41:36 -0400
X-MC-Unique: 5YvKZmOjM-G6hFJmwYDijw-1
Received: by mail-wm1-f72.google.com with SMTP id u68so2818999wmu.3
        for <linux-doc@vger.kernel.org>; Wed, 08 Jul 2020 05:41:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PWJrF8GNrTsOPJXQF6A4Nm884YZBFXppAIvdzvPyPnk=;
        b=Wb1lUNBXVa4brIyJpU7+5iALwEgJ5Z2rhq+Ny8zCuf+2srgeglo3npFHB2USNkVxti
         AR6QFnh3TjFKGFKA1YWtT7avKGwxfVlwP1yizBgYEWQTUdQ0s+O/6gMBXkz/ETYx3WUn
         JcgqVlsXWtU0IwYaQsT3kk53JSL4/Ujl+SPi+z0xd34gqvbDt4RdSU8e0Fxp1Z1KtTI2
         uF8r66Zl64r8S9eTPK5oUpCdV67K/EXVOEJ0sAA+BVrXNMnKIxiHyMj4iMUAKi4o71IP
         6brISdhOtdlP9YmekP/v4Oy6P/ou5rBxgh+6l1C7JE3M/pFg8PLOOltnmQxlE5KOu1Uc
         o6Jw==
X-Gm-Message-State: AOAM5307hemKgYWQNhzAgr7yYLN12il/EfOKiiTOBSafT2KSyDXFGpNk
        qLD4Xq1gQg2LFopJGt84VUOIvx7yrtrGfVW39/ZlOt2vWJFkbxpTZOyTuLvsTcFuVib6tRyTwuT
        5t8jnOf+WLUN73BEopIuq
X-Received: by 2002:a1c:b007:: with SMTP id z7mr8852859wme.37.1594212095599;
        Wed, 08 Jul 2020 05:41:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9S0KjmUjXRwLCzzIVJdozgXmlU23+U8U7gcW0F2/tm0N0HaqBXAGWFoxFryTLZhmG5ysKYg==
X-Received: by 2002:a1c:b007:: with SMTP id z7mr8852837wme.37.1594212095362;
        Wed, 08 Jul 2020 05:41:35 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:9541:9439:cb0f:89c? ([2001:b07:6468:f312:9541:9439:cb0f:89c])
        by smtp.gmail.com with ESMTPSA id d10sm5909342wrx.66.2020.07.08.05.41.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2020 05:41:34 -0700 (PDT)
Subject: Re: [PATCH v3 4/8] KVM: X86: Split kvm_update_cpuid()
To:     Xiaoyao Li <xiaoyao.li@intel.com>,
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
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <4123eb60-d89a-9112-dd7e-1a7627a0fc70@redhat.com>
Date:   Wed, 8 Jul 2020 14:41:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <92184f05-ca27-268c-ea72-f939fb1a0ab2@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 08/07/20 14:33, Xiaoyao Li wrote:
> On 7/8/2020 8:06 PM, Paolo Bonzini wrote:
>> On 08/07/20 08:50, Xiaoyao Li wrote:
>>> Split the part of updating vcpu model out of kvm_update_cpuid(), and put
>>> it into a new kvm_update_vcpu_model(). So it's more clear that
>>> kvm_update_cpuid() is to update guest CPUID settings, while
>>> kvm_update_vcpu_model() is to update vcpu model (settings) based on the
>>> updated CPUID settings.
>>>
>>> Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
>>
>> I would prefer to keep the kvm_update_cpuid name for what you called
>> kvm_update_vcpu_model(), and rename the rest to
>> kvm_update_cpuid_runtime().
> 
> But there is no CPUID being updated in kvm_update_cpuid(), after
> kvm_update_cpuid_runtime() is split out. This is confusing, IMO.

Then what about kvm_vcpu_after_set_cpuid()?  It's the "model" that is
not clear.

Thanks,

Paolo

>> Paolo
>>
>>> ---
>>>   arch/x86/kvm/cpuid.c | 38 ++++++++++++++++++++++++--------------
>>>   arch/x86/kvm/cpuid.h |  1 +
>>>   arch/x86/kvm/x86.c   |  1 +
>>>   3 files changed, 26 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/arch/x86/kvm/cpuid.c b/arch/x86/kvm/cpuid.c
>>> index a825878b7f84..001f5a94880e 100644
>>> --- a/arch/x86/kvm/cpuid.c
>>> +++ b/arch/x86/kvm/cpuid.c
>>> @@ -76,7 +76,6 @@ static int kvm_check_cpuid(struct kvm_vcpu *vcpu)
>>>   void kvm_update_cpuid(struct kvm_vcpu *vcpu)
>>>   {
>>>       struct kvm_cpuid_entry2 *best;
>>> -    struct kvm_lapic *apic = vcpu->arch.apic;
>>>         best = kvm_find_cpuid_entry(vcpu, 1, 0);
>>>       if (best) {
>>> @@ -89,26 +88,14 @@ void kvm_update_cpuid(struct kvm_vcpu *vcpu)
>>>                  vcpu->arch.apic_base & MSR_IA32_APICBASE_ENABLE);
>>>       }
>>>   -    if (best && apic) {
>>> -        if (cpuid_entry_has(best, X86_FEATURE_TSC_DEADLINE_TIMER))
>>> -            apic->lapic_timer.timer_mode_mask = 3 << 17;
>>> -        else
>>> -            apic->lapic_timer.timer_mode_mask = 1 << 17;
>>> -    }
>>> -
>>>       best = kvm_find_cpuid_entry(vcpu, 7, 0);
>>>       if (best && boot_cpu_has(X86_FEATURE_PKU) && best->function ==
>>> 0x7)
>>>           cpuid_entry_change(best, X86_FEATURE_OSPKE,
>>>                      kvm_read_cr4_bits(vcpu, X86_CR4_PKE));
>>>         best = kvm_find_cpuid_entry(vcpu, 0xD, 0);
>>> -    if (!best) {
>>> -        vcpu->arch.guest_supported_xcr0 = 0;
>>> -    } else {
>>> -        vcpu->arch.guest_supported_xcr0 =
>>> -            (best->eax | ((u64)best->edx << 32)) & supported_xcr0;
>>> +    if (best)
>>>           best->ebx = xstate_required_size(vcpu->arch.xcr0, false);
>>> -    }
>>>         best = kvm_find_cpuid_entry(vcpu, 0xD, 1);
>>>       if (best && (cpuid_entry_has(best, X86_FEATURE_XSAVES) ||
>>> @@ -127,6 +114,27 @@ void kvm_update_cpuid(struct kvm_vcpu *vcpu)
>>>                          vcpu->arch.ia32_misc_enable_msr &
>>>                          MSR_IA32_MISC_ENABLE_MWAIT);
>>>       }
>>> +}
>>> +
>>> +void kvm_update_vcpu_model(struct kvm_vcpu *vcpu)
>>> +{
>>> +    struct kvm_lapic *apic = vcpu->arch.apic;
>>> +    struct kvm_cpuid_entry2 *best;
>>> +
>>> +    best = kvm_find_cpuid_entry(vcpu, 1, 0);
>>> +    if (best && apic) {
>>> +        if (cpuid_entry_has(best, X86_FEATURE_TSC_DEADLINE_TIMER))
>>> +            apic->lapic_timer.timer_mode_mask = 3 << 17;
>>> +        else
>>> +            apic->lapic_timer.timer_mode_mask = 1 << 17;
>>> +    }
>>> +
>>> +    best = kvm_find_cpuid_entry(vcpu, 0xD, 0);
>>> +    if (!best)
>>> +        vcpu->arch.guest_supported_xcr0 = 0;
>>> +    else
>>> +        vcpu->arch.guest_supported_xcr0 =
>>> +            (best->eax | ((u64)best->edx << 32)) & supported_xcr0;
>>>         /* Note, maxphyaddr must be updated before tdp_level. */
>>>       vcpu->arch.maxphyaddr = cpuid_query_maxphyaddr(vcpu);
>>> @@ -218,6 +226,7 @@ int kvm_vcpu_ioctl_set_cpuid(struct kvm_vcpu *vcpu,
>>>       kvm_apic_set_version(vcpu);
>>>       kvm_x86_ops.cpuid_update(vcpu);
>>>       kvm_update_cpuid(vcpu);
>>> +    kvm_update_vcpu_model(vcpu);
>>>         kvfree(cpuid_entries);
>>>   out:
>>> @@ -247,6 +256,7 @@ int kvm_vcpu_ioctl_set_cpuid2(struct kvm_vcpu *vcpu,
>>>       kvm_apic_set_version(vcpu);
>>>       kvm_x86_ops.cpuid_update(vcpu);
>>>       kvm_update_cpuid(vcpu);
>>> +    kvm_update_vcpu_model(vcpu);
>>>   out:
>>>       return r;
>>>   }
>>> diff --git a/arch/x86/kvm/cpuid.h b/arch/x86/kvm/cpuid.h
>>> index f136de1debad..45e3643e2fba 100644
>>> --- a/arch/x86/kvm/cpuid.h
>>> +++ b/arch/x86/kvm/cpuid.h
>>> @@ -10,6 +10,7 @@ extern u32 kvm_cpu_caps[NCAPINTS] __read_mostly;
>>>   void kvm_set_cpu_caps(void);
>>>     void kvm_update_cpuid(struct kvm_vcpu *vcpu);
>>> +void kvm_update_vcpu_model(struct kvm_vcpu *vcpu);
>>>   struct kvm_cpuid_entry2 *kvm_find_cpuid_entry(struct kvm_vcpu *vcpu,
>>>                             u32 function, u32 index);
>>>   int kvm_dev_ioctl_get_cpuid(struct kvm_cpuid2 *cpuid,
>>> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
>>> index 09ee54f5e385..6f376392e6e6 100644
>>> --- a/arch/x86/kvm/x86.c
>>> +++ b/arch/x86/kvm/x86.c
>>> @@ -8184,6 +8184,7 @@ static void enter_smm(struct kvm_vcpu *vcpu)
>>>   #endif
>>>         kvm_update_cpuid(vcpu);
>>> +    kvm_update_vcpu_model(vcpu);
>>>       kvm_mmu_reset_context(vcpu);
>>>   }
>>>  
>>
> 

