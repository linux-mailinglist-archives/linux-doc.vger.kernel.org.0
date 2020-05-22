Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BA001DEF45
	for <lists+linux-doc@lfdr.de>; Fri, 22 May 2020 20:33:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730896AbgEVSdL (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 22 May 2020 14:33:11 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:30815 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1730864AbgEVSdK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 22 May 2020 14:33:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1590172388;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=uta1I5iF41Eoil1XzR/BDEIMHG3jmCK+59X2nwZOw7Y=;
        b=ZWbg1Am4pqN2ZrM6Sc4zVwq6GImq4OUz5HKOFxeOCehFOBqzcAWauD6QacdHitfjtpe91E
        EwuXk9MjFOgtRis83xilUtFbFBEFZg2quTAsDWe5c/7d9hUVkgx9eoGUrI2JNMiGqsop6j
        1pf97zS1kJBPAMrX20IwhELE/Uuyz8g=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-196-py9skfsQNK2nWn5zC1v7hQ-1; Fri, 22 May 2020 14:33:06 -0400
X-MC-Unique: py9skfsQNK2nWn5zC1v7hQ-1
Received: by mail-wr1-f72.google.com with SMTP id g10so4720779wrr.10
        for <linux-doc@vger.kernel.org>; Fri, 22 May 2020 11:33:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uta1I5iF41Eoil1XzR/BDEIMHG3jmCK+59X2nwZOw7Y=;
        b=UfMX06+0zBkX2DTuD8bhSscWGY99lK3nDbyEA5MH5Ebm0glu88tr9mlYKMus9rVcmW
         BkZH6/XOByMAtrWawINzL0HF67nZbPQXjI+81uekEFQ8oOSMhcOZ/i/O5NDq//nSc3FZ
         93TNZppqIPLI5XbfDnPaSNJM9aJrQ1HLhk4XyyMqaN6YaPSq9o4HB3plBqK/pgVDbQp2
         i2AqMT081X9yTZXXqh4vpAyPI3CXD5Jm/bwlq24cm2NtQiY97S+2LwzV2zox7oTOh/zJ
         +eFeygiQLGJ1QXF44ChcTQsrT06vhQaIJ4G3imbMoTkbix8nVxMFUTKh+hUs1tWA8+Ie
         ZJgA==
X-Gm-Message-State: AOAM530McoYar/2lfOt3A8zkKT4gnA5sBLgweJhAxRs7N73bFhVK2PoK
        2hImmbbjIRiNvYpMeR89oLhWuM6KILL2lO8pxd8rHrkPc5H9pYWD/fZ42D44lDmQOCdQr4f2Zwv
        lfUQ+e+bAlH1UEwIJZ6F0
X-Received: by 2002:adf:e752:: with SMTP id c18mr4302992wrn.353.1590172383466;
        Fri, 22 May 2020 11:33:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzn/9jhwi2m5kBMJV4PsKRS2Rwy8FdJSifbCfwoz7LBYi0qkU+MUcZbwiy9UVXg/sYxLJm62A==
X-Received: by 2002:adf:e752:: with SMTP id c18mr4302945wrn.353.1590172383198;
        Fri, 22 May 2020 11:33:03 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:803:ce64:3f04:d540? ([2001:b07:6468:f312:803:ce64:3f04:d540])
        by smtp.gmail.com with ESMTPSA id x186sm1848481wmg.8.2020.05.22.11.33.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2020 11:33:02 -0700 (PDT)
Subject: Re: [PATCH 5.4] KVM: x86: Fix pkru save/restore when guest CR4.PKE=0,
 move it to x86.c
To:     Babu Moger <babu.moger@amd.com>, corbet@lwn.net,
        tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, hpa@zytor.com,
        sean.j.christopherson@intel.com, stable@vger.kernel.org
Cc:     x86@kernel.org, vkuznets@redhat.com, wanpengli@tencent.com,
        jmattson@google.com, joro@8bytes.org, dave.hansen@linux.intel.com,
        luto@kernel.org, peterz@infradead.org, mchehab+samsung@kernel.org,
        changbin.du@intel.com, namit@vmware.com, bigeasy@linutronix.de,
        yang.shi@linux.alibaba.com, asteinhauser@google.com,
        anshuman.khandual@arm.com, jan.kiszka@siemens.com,
        akpm@linux-foundation.org, steven.price@arm.com,
        rppt@linux.vnet.ibm.com, peterx@redhat.com,
        dan.j.williams@intel.com, arjunroy@google.com, logang@deltatee.com,
        thellstrom@vmware.com, aarcange@redhat.com, justin.he@arm.com,
        robin.murphy@arm.com, ira.weiny@intel.com, keescook@chromium.org,
        jgross@suse.com, andrew.cooper3@citrix.com,
        pawan.kumar.gupta@linux.intel.com, fenghua.yu@intel.com,
        vineela.tummalapalli@intel.com, yamada.masahiro@socionext.com,
        sam@ravnborg.org, acme@redhat.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, kvm@vger.kernel.org
References: <159016509437.3131.17229420966309596602.stgit@naples-babu.amd.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <66c7b432-39ce-c942-d4a1-c5bac540ac94@redhat.com>
Date:   Fri, 22 May 2020 20:33:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <159016509437.3131.17229420966309596602.stgit@naples-babu.amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 22/05/20 18:32, Babu Moger wrote:
> [Backported upstream commit 37486135d3a7b03acc7755b63627a130437f066a]
> 
> Though rdpkru and wrpkru are contingent upon CR4.PKE, the PKRU
> resource isn't. It can be read with XSAVE and written with XRSTOR.
> So, if we don't set the guest PKRU value here(kvm_load_guest_xsave_state),
> the guest can read the host value.
> 
> In case of kvm_load_host_xsave_state, guest with CR4.PKE clear could
> potentially use XRSTOR to change the host PKRU value.
> 
> While at it, move pkru state save/restore to common code and the
> host_pkru field to kvm_vcpu_arch.  This will let SVM support protection keys.
> 
> Cc: stable@vger.kernel.org
> Reported-by: Jim Mattson <jmattson@google.com>
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  arch/x86/include/asm/kvm_host.h |    1 +
>  arch/x86/kvm/vmx/vmx.c          |   18 ------------------
>  arch/x86/kvm/x86.c              |   17 +++++++++++++++++
>  3 files changed, 18 insertions(+), 18 deletions(-)
> 
> diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> index 4fc61483919a..e204c43ed4b0 100644
> --- a/arch/x86/include/asm/kvm_host.h
> +++ b/arch/x86/include/asm/kvm_host.h
> @@ -550,6 +550,7 @@ struct kvm_vcpu_arch {
>  	unsigned long cr4;
>  	unsigned long cr4_guest_owned_bits;
>  	unsigned long cr8;
> +	u32 host_pkru;
>  	u32 pkru;
>  	u32 hflags;
>  	u64 efer;
> diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
> index 04a8212704c1..728758880cb6 100644
> --- a/arch/x86/kvm/vmx/vmx.c
> +++ b/arch/x86/kvm/vmx/vmx.c
> @@ -1384,7 +1384,6 @@ void vmx_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
>  
>  	vmx_vcpu_pi_load(vcpu, cpu);
>  
> -	vmx->host_pkru = read_pkru();
>  	vmx->host_debugctlmsr = get_debugctlmsr();
>  }
>  
> @@ -6541,11 +6540,6 @@ static void vmx_vcpu_run(struct kvm_vcpu *vcpu)
>  
>  	kvm_load_guest_xcr0(vcpu);
>  
> -	if (static_cpu_has(X86_FEATURE_PKU) &&
> -	    kvm_read_cr4_bits(vcpu, X86_CR4_PKE) &&
> -	    vcpu->arch.pkru != vmx->host_pkru)
> -		__write_pkru(vcpu->arch.pkru);
> -
>  	pt_guest_enter(vmx);
>  
>  	atomic_switch_perf_msrs(vmx);
> @@ -6634,18 +6628,6 @@ static void vmx_vcpu_run(struct kvm_vcpu *vcpu)
>  
>  	pt_guest_exit(vmx);
>  
> -	/*
> -	 * eager fpu is enabled if PKEY is supported and CR4 is switched
> -	 * back on host, so it is safe to read guest PKRU from current
> -	 * XSAVE.
> -	 */
> -	if (static_cpu_has(X86_FEATURE_PKU) &&
> -	    kvm_read_cr4_bits(vcpu, X86_CR4_PKE)) {
> -		vcpu->arch.pkru = rdpkru();
> -		if (vcpu->arch.pkru != vmx->host_pkru)
> -			__write_pkru(vmx->host_pkru);
> -	}
> -
>  	kvm_put_guest_xcr0(vcpu);
>  
>  	vmx->nested.nested_run_pending = 0;
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index 5d530521f11d..502a23313e7b 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -821,11 +821,25 @@ void kvm_load_guest_xcr0(struct kvm_vcpu *vcpu)
>  			xsetbv(XCR_XFEATURE_ENABLED_MASK, vcpu->arch.xcr0);
>  		vcpu->guest_xcr0_loaded = 1;
>  	}
> +
> +	if (static_cpu_has(X86_FEATURE_PKU) &&
> +	    (kvm_read_cr4_bits(vcpu, X86_CR4_PKE) ||
> +	     (vcpu->arch.xcr0 & XFEATURE_MASK_PKRU)) &&
> +	    vcpu->arch.pkru != vcpu->arch.host_pkru)
> +		__write_pkru(vcpu->arch.pkru);
>  }
>  EXPORT_SYMBOL_GPL(kvm_load_guest_xcr0);
>  
>  void kvm_put_guest_xcr0(struct kvm_vcpu *vcpu)
>  {
> +	if (static_cpu_has(X86_FEATURE_PKU) &&
> +	    (kvm_read_cr4_bits(vcpu, X86_CR4_PKE) ||
> +	     (vcpu->arch.xcr0 & XFEATURE_MASK_PKRU))) {
> +		vcpu->arch.pkru = rdpkru();
> +		if (vcpu->arch.pkru != vcpu->arch.host_pkru)
> +			__write_pkru(vcpu->arch.host_pkru);
> +	}
> +
>  	if (vcpu->guest_xcr0_loaded) {
>  		if (vcpu->arch.xcr0 != host_xcr0)
>  			xsetbv(XCR_XFEATURE_ENABLED_MASK, host_xcr0);
> @@ -3437,6 +3451,9 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
>  
>  	kvm_x86_ops->vcpu_load(vcpu, cpu);
>  
> +	/* Save host pkru register if supported */
> +	vcpu->arch.host_pkru = read_pkru();
> +
>  	fpregs_assert_state_consistent();
>  	if (test_thread_flag(TIF_NEED_FPU_LOAD))
>  		switch_fpu_return();
> 

Acked-by: Paolo Bonzini <pbonzini@redhat.com>

