Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A92C3C8406
	for <lists+linux-doc@lfdr.de>; Wed, 14 Jul 2021 13:45:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239255AbhGNLr7 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 14 Jul 2021 07:47:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50914 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239088AbhGNLr6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 14 Jul 2021 07:47:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1626263106;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=sUkXi73maUwIwZJT/dIBNQGb2h9o1ydx3iAklNKDix0=;
        b=MJT4EHxC0DkBUlYL49oYgoLX18qWUYrQyDiUNPoWPycSZLFmkscAweci7EdlfFSuSvWjj6
        8zREeOR/4Ul/dSZDPOk5qNXCSGlya3dMnQ0SfeQJtG5Ohl8HhKihDJ7orxjmFmz1P1CB8O
        8mZ4QAqA2DCakBtIRCjPLgNpPoGnJCM=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-575-T331zVhUOpOb9gZUt7irOg-1; Wed, 14 Jul 2021 07:45:05 -0400
X-MC-Unique: T331zVhUOpOb9gZUt7irOg-1
Received: by mail-ej1-f72.google.com with SMTP id bl17-20020a170906c251b029052292d7c3b4so682439ejb.9
        for <linux-doc@vger.kernel.org>; Wed, 14 Jul 2021 04:45:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=sUkXi73maUwIwZJT/dIBNQGb2h9o1ydx3iAklNKDix0=;
        b=pEI3N/NE6Mm3jidwFFXvJg2rzvuc+As0OmXwXaeYMYuOcU3J/t5YUHmlqB0E2bXS6E
         foNFiTVNMtlTuqPZLhnOuz/b2BZ1RNWRuTQvpQzdDHylbzS7xYQrsAstTkK/GlquaK4U
         L7agZ/X0JoLx8SxyijML9ilelHBpcgj8GdWf1frWK0mMOSDMXF7ZxMVunJPpw/JRICd+
         GGsExRI81W9eUhFsh3ILcCQPHCRy7GnzCJJ+XIwcB0ZP4AB9eOzqnoU5EolnTnP3vvgg
         lMyApB2zXLvsKR5DASSWTOy/xTRKFxXo4s10j0NumGlp02xw/hpMk7SHsF6pk3BDxhug
         YZ2w==
X-Gm-Message-State: AOAM532hADt9CQEpzOfrd1Ae6She6yoXSm2cH38OHgqboT28oV8PoGPa
        iNu2hZ7fB3dX0WTas3B/uvhKmw1taqO3HHW6yhHeW2NyNOdobLCqjQz2t4mN1JFfOq5c/l2DIl+
        kMijuwEsstIGgFR0VLyBv
X-Received: by 2002:a17:906:d045:: with SMTP id bo5mr12078830ejb.461.1626263104238;
        Wed, 14 Jul 2021 04:45:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyGJgPhEtAhl/WQs5vXFywLTNZpwoCVFAsTepi7vc5r54pDtGS85pTYIcpYMisa+e9E66WyhQ==
X-Received: by 2002:a17:906:d045:: with SMTP id bo5mr12078805ejb.461.1626263103969;
        Wed, 14 Jul 2021 04:45:03 -0700 (PDT)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
        by smtp.gmail.com with ESMTPSA id n14sm862810edo.23.2021.07.14.04.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 04:45:03 -0700 (PDT)
From:   Vitaly Kuznetsov <vkuznets@redhat.com>
To:     Juergen Gross <jgross@suse.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Sean Christopherson <seanjc@google.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org,
        x86@kernel.org, linux-doc@vger.kernel.org, kvm@vger.kernel.org
Subject: Re: [PATCH 6/6] x86/kvm: add boot parameter for setting max number
 of vcpus per guest
In-Reply-To: <1ddffb87-a6a2-eba3-3f34-cf606a2ecba2@suse.com>
References: <20210701154105.23215-1-jgross@suse.com>
 <20210701154105.23215-7-jgross@suse.com>
 <87h7gx2lkt.fsf@vitty.brq.redhat.com>
 <1ddffb87-a6a2-eba3-3f34-cf606a2ecba2@suse.com>
Date:   Wed, 14 Jul 2021 13:45:02 +0200
Message-ID: <878s292k75.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Juergen Gross <jgross@suse.com> writes:

> On 14.07.21 13:15, Vitaly Kuznetsov wrote:
>> Juergen Gross <jgross@suse.com> writes:
>> 
>>> Today the maximum number of vcpus of a kvm guest is set via a #define
>>> in a header file.
>>>
>>> In order to support higher vcpu numbers for guests without generally
>>> increasing the memory consumption of guests on the host especially on
>>> very large systems add a boot parameter for specifying the number of
>>> allowed vcpus for guests.
>>>
>>> The default will still be the current setting of 288. The value 0 has
>>> the special meaning to limit the number of possible vcpus to the
>>> number of possible cpus of the host.
>>>
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>> ---
>>>   Documentation/admin-guide/kernel-parameters.txt | 10 ++++++++++
>>>   arch/x86/include/asm/kvm_host.h                 |  5 ++++-
>>>   arch/x86/kvm/x86.c                              |  7 +++++++
>>>   3 files changed, 21 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
>>> index 99bfa53a2bbd..8eb856396ffa 100644
>>> --- a/Documentation/admin-guide/kernel-parameters.txt
>>> +++ b/Documentation/admin-guide/kernel-parameters.txt
>>> @@ -2373,6 +2373,16 @@
>>>   			guest can't have more vcpus than the set value + 1.
>>>   			Default: 1023
>>>   
>>> +	kvm.max_vcpus=	[KVM,X86] Set the maximum allowed numbers of vcpus per
>>> +			guest. The special value 0 sets the limit to the number
>>> +			of physical cpus possible on the host (including not
>>> +			yet hotplugged cpus). Higher values will result in
>>> +			slightly higher memory consumption per guest. Depending
>>> +			on the value and the virtual topology the maximum
>>> +			allowed vcpu-id might need to be raised, too (see
>>> +			kvm.max_vcpu_id parameter).
>> 
>> I'd suggest to at least add a sanity check: 'max_vcpu_id' should always
>> be >= 'max_vcpus'. Alternatively, we can replace 'max_vcpu_id' with say
>> 'vcpu_id_to_vcpus_ratio' and set it to e.g. '4' by default.
>
> Either would be fine with me.
>
> A default of '2' for the ratio would seem more appropriate for me,
> however. A thread count per core not being a power of 2 is quite
> unlikely, and the worst case scenario for cores per socket would be
> 2^n + 1.
>

(I vaguely recall AMD EPYC had more than thread id (package id?)
encapsulated into APIC id).

Personally, I'd vote for introducing a 'ratio' parameter then so
generally users will only have to set 'kvm.max_vcpus'.

>> 
>>> +			Default: 288
>>> +
>>>   	l1tf=           [X86] Control mitigation of the L1TF vulnerability on
>>>   			      affected CPUs
>>>   
>>> diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
>>> index 39cbc4b6bffb..65ae82a5d444 100644
>>> --- a/arch/x86/include/asm/kvm_host.h
>>> +++ b/arch/x86/include/asm/kvm_host.h
>>> @@ -37,7 +37,8 @@
>>>   
>>>   #define __KVM_HAVE_ARCH_VCPU_DEBUGFS
>>>   
>>> -#define KVM_MAX_VCPUS 288
>>> +#define KVM_DEFAULT_MAX_VCPUS 288
>>> +#define KVM_MAX_VCPUS max_vcpus
>>>   #define KVM_SOFT_MAX_VCPUS 240
>>>   #define KVM_DEFAULT_MAX_VCPU_ID 1023
>>>   #define KVM_MAX_VCPU_ID max_vcpu_id
>>> @@ -1509,6 +1510,8 @@ extern u64  kvm_max_tsc_scaling_ratio;
>>>   extern u64  kvm_default_tsc_scaling_ratio;
>>>   /* bus lock detection supported? */
>>>   extern bool kvm_has_bus_lock_exit;
>>> +/* maximum number of vcpus per guest */
>>> +extern unsigned int max_vcpus;
>>>   /* maximum vcpu-id */
>>>   extern unsigned int max_vcpu_id;
>>>   /* per cpu vcpu bitmasks (disable preemption during usage) */
>>> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
>>> index a9b0bb2221ea..888c4507504d 100644
>>> --- a/arch/x86/kvm/x86.c
>>> +++ b/arch/x86/kvm/x86.c
>>> @@ -177,6 +177,10 @@ module_param(force_emulation_prefix, bool, S_IRUGO);
>>>   int __read_mostly pi_inject_timer = -1;
>>>   module_param(pi_inject_timer, bint, S_IRUGO | S_IWUSR);
>>>   
>>> +unsigned int __read_mostly max_vcpus = KVM_DEFAULT_MAX_VCPUS;
>>> +module_param(max_vcpus, uint, S_IRUGO);
>>> +EXPORT_SYMBOL_GPL(max_vcpus);
>>> +
>>>   unsigned int __read_mostly max_vcpu_id = KVM_DEFAULT_MAX_VCPU_ID;
>>>   module_param(max_vcpu_id, uint, S_IRUGO);
>>>   
>>> @@ -10648,6 +10652,9 @@ int kvm_arch_hardware_setup(void *opaque)
>>>   	if (boot_cpu_has(X86_FEATURE_XSAVES))
>>>   		rdmsrl(MSR_IA32_XSS, host_xss);
>>>   
>>> +	if (max_vcpus == 0)
>>> +		max_vcpus = num_possible_cpus();
>> 
>> Is this special case really needed? I mean 'max_vcpus' is not '0' by
>> default so whoever sets it manually probably knows how big his guests
>> are going to be anyway and it is not always obvious how many CPUs are
>> reported by 'num_possible_cpus()' (ACPI tables can be weird for example).
>
> The idea was to make it easy for anyone managing a large fleet of hosts
> and wanting to have a common setting for all of them.
>

I see. It seems to be uncommon indeed to run guests with more vCPUs than
host pCPUs so everything >= num_online_cpus() should be OK. My only
concern about num_possible_cpus() is that it is going to be hard to
explain what 'possible CPUs' mean (but whoever cares that much about
wasting memory can always set the required value manually).

> It would even be possible to use '0' as the default (probably via config
> option only).
>
>> 
>>> +
>>>   	kvm_pcpu_vcpu_mask = __alloc_percpu(KVM_VCPU_MASK_SZ,
>>>   					    sizeof(unsigned long));
>>>   	kvm_hv_vp_bitmap = __alloc_percpu(KVM_HV_VPMAP_SZ, sizeof(u64));
>> 

-- 
Vitaly

