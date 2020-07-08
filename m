Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FAE82186EA
	for <lists+linux-doc@lfdr.de>; Wed,  8 Jul 2020 14:06:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729030AbgGHMGJ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 8 Jul 2020 08:06:09 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:42071 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728681AbgGHMGJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 8 Jul 2020 08:06:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1594209967;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PGDnI+tq2M1CuGv6kUVZuIa3j3HxiWlBIYy2dNXIfh0=;
        b=f9Ebcc9hBnEurtqDXL9ZKGIH6LVrzXI40Qq6syOy+VShhcfgV6C9bNDqbEZ76+JMW//T/E
        gyiWO8xCLnWK82DRJSnzqvZOhzq/m/KTLq+ekkC0I5rumbCCWWvygQ/PFFVHo8b4RgqbdX
        +V56lMinh82jpz00tvPvoF3868xz6OA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-jzH3zUCtMamok20ImNJHNQ-1; Wed, 08 Jul 2020 08:06:05 -0400
X-MC-Unique: jzH3zUCtMamok20ImNJHNQ-1
Received: by mail-wr1-f72.google.com with SMTP id b8so37802557wro.19
        for <linux-doc@vger.kernel.org>; Wed, 08 Jul 2020 05:06:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PGDnI+tq2M1CuGv6kUVZuIa3j3HxiWlBIYy2dNXIfh0=;
        b=jJBtaQpqyWCSjjseEabmoVL7wqgzt1uOtbmYhCk/v4vUwKX59pCQ2eEkbL0NpPhTie
         H+f74kNBxvOJdUIUIJCtNa7Zc1dOhMOvypHVCxTirwneV4SLncJsS8qCykpBBq4Y9O+s
         tWPGH6E6Sh347f6hgUKRmk3UOuudB/Q3BYMl1MDe88W3ZhraZ+NTD3T8up3biqcrMv7G
         pqiYWTx0G8FnQbwUqdDUG7aYGohnJhK82xLM0yAiaZene1PX/aYiOCMRmcDBZZi7izrn
         ans2Ts93Ff0ixtKoBNiBmH92skM9wanNZxyabldIdkzaziazVUyF7DY5/DiKgvrWFZf/
         eCGg==
X-Gm-Message-State: AOAM532ffzQ/24Lj27QdqS5ilkT0SyjC0dKr0czmq90wxkXGpch/oy8O
        QlhtTA+MvvOsjK5YjvdS4aNmY7THa/HOBzWGPXfk14WbYggruw3oYccUa87wk6CiIRyYE6YCf4r
        g44RfvYIIc9RA24omUw+F
X-Received: by 2002:a5d:5270:: with SMTP id l16mr57870378wrc.122.1594209963854;
        Wed, 08 Jul 2020 05:06:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwuluZHlJi0gJ3KHsQYv1PPFRPGuu66foduw3C07LUOufgdALfT6pObfuRZwqAEkSI0AFNb0A==
X-Received: by 2002:a5d:5270:: with SMTP id l16mr57870355wrc.122.1594209963601;
        Wed, 08 Jul 2020 05:06:03 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:9541:9439:cb0f:89c? ([2001:b07:6468:f312:9541:9439:cb0f:89c])
        by smtp.gmail.com with ESMTPSA id 12sm5574207wmg.6.2020.07.08.05.06.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2020 05:06:02 -0700 (PDT)
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
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <ad349b28-bc62-e478-c610-e829974a8342@redhat.com>
Date:   Wed, 8 Jul 2020 14:06:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200708065054.19713-5-xiaoyao.li@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 08/07/20 08:50, Xiaoyao Li wrote:
> Split the part of updating vcpu model out of kvm_update_cpuid(), and put
> it into a new kvm_update_vcpu_model(). So it's more clear that
> kvm_update_cpuid() is to update guest CPUID settings, while
> kvm_update_vcpu_model() is to update vcpu model (settings) based on the
> updated CPUID settings.
> 
> Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>

I would prefer to keep the kvm_update_cpuid name for what you called
kvm_update_vcpu_model(), and rename the rest to kvm_update_cpuid_runtime().

Paolo

> ---
>  arch/x86/kvm/cpuid.c | 38 ++++++++++++++++++++++++--------------
>  arch/x86/kvm/cpuid.h |  1 +
>  arch/x86/kvm/x86.c   |  1 +
>  3 files changed, 26 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/x86/kvm/cpuid.c b/arch/x86/kvm/cpuid.c
> index a825878b7f84..001f5a94880e 100644
> --- a/arch/x86/kvm/cpuid.c
> +++ b/arch/x86/kvm/cpuid.c
> @@ -76,7 +76,6 @@ static int kvm_check_cpuid(struct kvm_vcpu *vcpu)
>  void kvm_update_cpuid(struct kvm_vcpu *vcpu)
>  {
>  	struct kvm_cpuid_entry2 *best;
> -	struct kvm_lapic *apic = vcpu->arch.apic;
>  
>  	best = kvm_find_cpuid_entry(vcpu, 1, 0);
>  	if (best) {
> @@ -89,26 +88,14 @@ void kvm_update_cpuid(struct kvm_vcpu *vcpu)
>  			   vcpu->arch.apic_base & MSR_IA32_APICBASE_ENABLE);
>  	}
>  
> -	if (best && apic) {
> -		if (cpuid_entry_has(best, X86_FEATURE_TSC_DEADLINE_TIMER))
> -			apic->lapic_timer.timer_mode_mask = 3 << 17;
> -		else
> -			apic->lapic_timer.timer_mode_mask = 1 << 17;
> -	}
> -
>  	best = kvm_find_cpuid_entry(vcpu, 7, 0);
>  	if (best && boot_cpu_has(X86_FEATURE_PKU) && best->function == 0x7)
>  		cpuid_entry_change(best, X86_FEATURE_OSPKE,
>  				   kvm_read_cr4_bits(vcpu, X86_CR4_PKE));
>  
>  	best = kvm_find_cpuid_entry(vcpu, 0xD, 0);
> -	if (!best) {
> -		vcpu->arch.guest_supported_xcr0 = 0;
> -	} else {
> -		vcpu->arch.guest_supported_xcr0 =
> -			(best->eax | ((u64)best->edx << 32)) & supported_xcr0;
> +	if (best)
>  		best->ebx = xstate_required_size(vcpu->arch.xcr0, false);
> -	}
>  
>  	best = kvm_find_cpuid_entry(vcpu, 0xD, 1);
>  	if (best && (cpuid_entry_has(best, X86_FEATURE_XSAVES) ||
> @@ -127,6 +114,27 @@ void kvm_update_cpuid(struct kvm_vcpu *vcpu)
>  					   vcpu->arch.ia32_misc_enable_msr &
>  					   MSR_IA32_MISC_ENABLE_MWAIT);
>  	}
> +}
> +
> +void kvm_update_vcpu_model(struct kvm_vcpu *vcpu)
> +{
> +	struct kvm_lapic *apic = vcpu->arch.apic;
> +	struct kvm_cpuid_entry2 *best;
> +
> +	best = kvm_find_cpuid_entry(vcpu, 1, 0);
> +	if (best && apic) {
> +		if (cpuid_entry_has(best, X86_FEATURE_TSC_DEADLINE_TIMER))
> +			apic->lapic_timer.timer_mode_mask = 3 << 17;
> +		else
> +			apic->lapic_timer.timer_mode_mask = 1 << 17;
> +	}
> +
> +	best = kvm_find_cpuid_entry(vcpu, 0xD, 0);
> +	if (!best)
> +		vcpu->arch.guest_supported_xcr0 = 0;
> +	else
> +		vcpu->arch.guest_supported_xcr0 =
> +			(best->eax | ((u64)best->edx << 32)) & supported_xcr0;
>  
>  	/* Note, maxphyaddr must be updated before tdp_level. */
>  	vcpu->arch.maxphyaddr = cpuid_query_maxphyaddr(vcpu);
> @@ -218,6 +226,7 @@ int kvm_vcpu_ioctl_set_cpuid(struct kvm_vcpu *vcpu,
>  	kvm_apic_set_version(vcpu);
>  	kvm_x86_ops.cpuid_update(vcpu);
>  	kvm_update_cpuid(vcpu);
> +	kvm_update_vcpu_model(vcpu);
>  
>  	kvfree(cpuid_entries);
>  out:
> @@ -247,6 +256,7 @@ int kvm_vcpu_ioctl_set_cpuid2(struct kvm_vcpu *vcpu,
>  	kvm_apic_set_version(vcpu);
>  	kvm_x86_ops.cpuid_update(vcpu);
>  	kvm_update_cpuid(vcpu);
> +	kvm_update_vcpu_model(vcpu);
>  out:
>  	return r;
>  }
> diff --git a/arch/x86/kvm/cpuid.h b/arch/x86/kvm/cpuid.h
> index f136de1debad..45e3643e2fba 100644
> --- a/arch/x86/kvm/cpuid.h
> +++ b/arch/x86/kvm/cpuid.h
> @@ -10,6 +10,7 @@ extern u32 kvm_cpu_caps[NCAPINTS] __read_mostly;
>  void kvm_set_cpu_caps(void);
>  
>  void kvm_update_cpuid(struct kvm_vcpu *vcpu);
> +void kvm_update_vcpu_model(struct kvm_vcpu *vcpu);
>  struct kvm_cpuid_entry2 *kvm_find_cpuid_entry(struct kvm_vcpu *vcpu,
>  					      u32 function, u32 index);
>  int kvm_dev_ioctl_get_cpuid(struct kvm_cpuid2 *cpuid,
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index 09ee54f5e385..6f376392e6e6 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -8184,6 +8184,7 @@ static void enter_smm(struct kvm_vcpu *vcpu)
>  #endif
>  
>  	kvm_update_cpuid(vcpu);
> +	kvm_update_vcpu_model(vcpu);
>  	kvm_mmu_reset_context(vcpu);
>  }
>  
> 

