Return-Path: <linux-doc+bounces-50379-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E457BAE6C71
	for <lists+linux-doc@lfdr.de>; Tue, 24 Jun 2025 18:32:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3C78D4A28AB
	for <lists+linux-doc@lfdr.de>; Tue, 24 Jun 2025 16:32:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE0162E175C;
	Tue, 24 Jun 2025 16:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xvPOu6Yq"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410AB2E1757
	for <linux-doc@vger.kernel.org>; Tue, 24 Jun 2025 16:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750782725; cv=none; b=oX8EM1hRI8dLtOJxkOOLz4U8JxTY0i5+zTuiYO56oYYt+9nRTseSrFDzV5NPTQOxHJ9M0gOVqlPF2b63tdyIa9oQQFMSvcucrkNWAaM3yT27LqchVLPxrJ28owGbBLIMgVppcT6MooPRqPnYXzfPicBVEz+vY6hKq7dHNI49LCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750782725; c=relaxed/simple;
	bh=olUyBWxDQPtIHZXCrj2D5nX3VCAezpOoJNhDp42CoSw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FHHYZE9F1ZCV4EEkKl6dGGw37Fuvsfymr5lm5PIu7fH/aF2vTA1M0G1wxRjlh0q3noZWvylzhZQtR/dVpBer45ddHvvcGEs5thHVCPOWrP72amGAk7OET/4bixR7Ryst9EZbPYIiKZ6PpRwz5JJKScieU56+FHuIwTdlhDXzGYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xvPOu6Yq; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-23689228a7fso9916345ad.1
        for <linux-doc@vger.kernel.org>; Tue, 24 Jun 2025 09:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750782723; x=1751387523; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=XsS+ElmraQqT2Fu4rLd2/fa1KgRzuoHdf4Xkll7wCgE=;
        b=xvPOu6Yq0qfmEirTPIub+feLaP0bKw0C/EHwdQydB8CvJzHyuuzCmCFqPVzk4uGoeV
         y5HuIk8c9Nxpzo8CQcV67pO8+Ucgoyab2wyMRtqY/djPf0cJ0Y8QcSSItdZ/9skcmIhZ
         pctY9I4K7ZrjCZ7p7EDpMGjgD5sXkDbzyboAiwbhDBl0cK39zTj3hjosM0gmFZWhfhxh
         BBQQrRVrFsrSdXfKpwaeRQ7xKfePbhT1ySP2GUIYW62Oipc3TCgkWhWOOeQ26brNq9vW
         DGTCGsJ0Kcdmp4xnfls12O9JhmfUoYSws2O97Dn89US58+qMBfWmgL7EAve4wAaeOlCA
         LLlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750782723; x=1751387523;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XsS+ElmraQqT2Fu4rLd2/fa1KgRzuoHdf4Xkll7wCgE=;
        b=ZAB6gxRXoL8HDVdqwl4Zif9SqF6P7GX1NzQ7f3M9AzbZD7k9gKhw6NkT/ZMK3v0d/2
         Ea4BVfa4Du3P8X6AdMo+GG+3B4UpMPYVNA40ZV4TM8H6TkDPO7pY+WYNa57pZMhz4jIq
         t66ZqdFKcH7ZVt02kwR+Flx9hWGBHkqlAi5l/bVdLKxliZulPTTU7n98lhFdFyKrBFLy
         9GA95TZ1lXyPjYGhzlcpJZ27BYmosSVrpfjr5B4tGRmKbtbMXRS5r9sS4vqdisrTmoV4
         NJG8+BYKt7am1eI19eKDnds1JePo3uRegwlnceGUGF/Nq0lLVcQpXAw5Gl//L/GUrudO
         1YDg==
X-Forwarded-Encrypted: i=1; AJvYcCV+aPnE7M6Lhz6ZumP2cJ9LDebdsqSxbsUBe3G9XdI0iNZG/MTel+Z5XS2fwGY15K41POSGA+Q0W/U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzKXxnwayDm0GRkt1LnzCBVzn6mug2d0qhAswwQVQdndvcKZ1K
	Lh+TJ9n2qBs0Apwl8oWMz6D4N5XKyrIdEUFy6pGhnaKyjlXrWVNj9xudZMDjRpdNHGhaktxCOZZ
	eocCLgg==
X-Google-Smtp-Source: AGHT+IEGQw4P+7gI/qlyHfyN7lsnbcl2WppeAde2ZamzUdLwVr0mYJgpyGapX/fOe6J7uhawtLrxthKo/zo=
X-Received: from pgho22.prod.google.com ([2002:a63:fb16:0:b0:b2c:4226:67db])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:1589:b0:21f:4631:811c
 with SMTP id adf61e73a8af0-22026ec726cmr22498760637.19.1750782723360; Tue, 24
 Jun 2025 09:32:03 -0700 (PDT)
Date: Tue, 24 Jun 2025 09:32:01 -0700
In-Reply-To: <20250328171205.2029296-15-xin@zytor.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250328171205.2029296-1-xin@zytor.com> <20250328171205.2029296-15-xin@zytor.com>
Message-ID: <aFrTAT-xTLmlwO5V@google.com>
Subject: Re: [PATCH v4 14/19] KVM: VMX: Dump FRED context in dump_vmcs()
From: Sean Christopherson <seanjc@google.com>
To: "Xin Li (Intel)" <xin@zytor.com>
Cc: pbonzini@redhat.com, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, corbet@lwn.net, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, andrew.cooper3@citrix.com, luto@kernel.org, 
	peterz@infradead.org, chao.gao@intel.com, xin3.li@intel.com
Content-Type: text/plain; charset="us-ascii"

On Fri, Mar 28, 2025, Xin Li (Intel) wrote:
> From: Xin Li <xin3.li@intel.com>
> 
> Add FRED related VMCS fields to dump_vmcs() to dump FRED context.
> 
> Signed-off-by: Xin Li <xin3.li@intel.com>
> Signed-off-by: Xin Li (Intel) <xin@zytor.com>
> Tested-by: Shan Kang <shan.kang@intel.com>
> ---
> 
> Change in v3:
> * Use (vmentry_ctrl & VM_ENTRY_LOAD_IA32_FRED) instead of is_fred_enabled()
>   (Chao Gao).
> 
> Changes in v2:
> * Use kvm_cpu_cap_has() instead of cpu_feature_enabled() (Chao Gao).
> * Dump guest FRED states only if guest has FRED enabled (Nikolay Borisov).
> ---
>  arch/x86/kvm/vmx/vmx.c | 40 +++++++++++++++++++++++++++++++++-------
>  1 file changed, 33 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
> index c76015e1e3f8..03855d6690b2 100644
> --- a/arch/x86/kvm/vmx/vmx.c
> +++ b/arch/x86/kvm/vmx/vmx.c
> @@ -6462,7 +6462,7 @@ void dump_vmcs(struct kvm_vcpu *vcpu)
>  	struct vcpu_vmx *vmx = to_vmx(vcpu);
>  	u32 vmentry_ctl, vmexit_ctl;
>  	u32 cpu_based_exec_ctrl, pin_based_exec_ctrl, secondary_exec_control;
> -	u64 tertiary_exec_control;
> +	u64 tertiary_exec_control, secondary_vmexit_ctl;
>  	unsigned long cr4;
>  	int efer_slot;
>  
> @@ -6473,6 +6473,8 @@ void dump_vmcs(struct kvm_vcpu *vcpu)
>  
>  	vmentry_ctl = vmcs_read32(VM_ENTRY_CONTROLS);
>  	vmexit_ctl = vmcs_read32(VM_EXIT_CONTROLS);
> +	secondary_vmexit_ctl = cpu_has_secondary_vmexit_ctrls() ?
> +			       vmcs_read64(SECONDARY_VM_EXIT_CONTROLS) : 0;
>  	cpu_based_exec_ctrl = vmcs_read32(CPU_BASED_VM_EXEC_CONTROL);
>  	pin_based_exec_ctrl = vmcs_read32(PIN_BASED_VM_EXEC_CONTROL);
>  	cr4 = vmcs_readl(GUEST_CR4);
> @@ -6519,6 +6521,16 @@ void dump_vmcs(struct kvm_vcpu *vcpu)
>  	vmx_dump_sel("LDTR:", GUEST_LDTR_SELECTOR);
>  	vmx_dump_dtsel("IDTR:", GUEST_IDTR_LIMIT);
>  	vmx_dump_sel("TR:  ", GUEST_TR_SELECTOR);
> +	if (vmentry_ctl & VM_ENTRY_LOAD_IA32_FRED)
> +		pr_err("FRED guest: config=0x%016llx, stack_levels=0x%016llx\n"
> +		       "RSP0=0x%016llx, RSP1=0x%016llx\n"
> +		       "RSP2=0x%016llx, RSP3=0x%016llx\n",
> +		       vmcs_read64(GUEST_IA32_FRED_CONFIG),
> +		       vmcs_read64(GUEST_IA32_FRED_STKLVLS),
> +		       __rdmsr(MSR_IA32_FRED_RSP0),

There is no guarantee the vCPU's FRED_RSP is loaded in hardware at this point.
I think you need to use vmx_read_guest_fred_rsp0().

> +		       vmcs_read64(GUEST_IA32_FRED_RSP1),
> +		       vmcs_read64(GUEST_IA32_FRED_RSP2),
> +		       vmcs_read64(GUEST_IA32_FRED_RSP3));
>  	efer_slot = vmx_find_loadstore_msr_slot(&vmx->msr_autoload.guest, MSR_EFER);
>  	if (vmentry_ctl & VM_ENTRY_LOAD_IA32_EFER)
>  		pr_err("EFER= 0x%016llx\n", vmcs_read64(GUEST_IA32_EFER));
> @@ -6566,6 +6578,16 @@ void dump_vmcs(struct kvm_vcpu *vcpu)
>  	       vmcs_readl(HOST_TR_BASE));
>  	pr_err("GDTBase=%016lx IDTBase=%016lx\n",
>  	       vmcs_readl(HOST_GDTR_BASE), vmcs_readl(HOST_IDTR_BASE));
> +	if (vmexit_ctl & SECONDARY_VM_EXIT_LOAD_IA32_FRED)
> +		pr_err("FRED host: config=0x%016llx, stack_levels=0x%016llx\n"
> +		       "RSP0=0x%016lx, RSP1=0x%016llx\n"
> +		       "RSP2=0x%016llx, RSP3=0x%016llx\n",
> +		       vmcs_read64(HOST_IA32_FRED_CONFIG),
> +		       vmcs_read64(HOST_IA32_FRED_STKLVLS),
> +		       (unsigned long)task_stack_page(current) + THREAD_SIZE,

Maybe add a helper in arch/x86/include/asm/fred.h to generate the desired RSP0?
Not sure it's worth doing that just for this code.

> +		       vmcs_read64(HOST_IA32_FRED_RSP1),
> +		       vmcs_read64(HOST_IA32_FRED_RSP2),
> +		       vmcs_read64(HOST_IA32_FRED_RSP3));
>  	pr_err("CR0=%016lx CR3=%016lx CR4=%016lx\n",
>  	       vmcs_readl(HOST_CR0), vmcs_readl(HOST_CR3),
>  	       vmcs_readl(HOST_CR4));
> @@ -6587,25 +6609,29 @@ void dump_vmcs(struct kvm_vcpu *vcpu)
>  	pr_err("*** Control State ***\n");
>  	pr_err("CPUBased=0x%08x SecondaryExec=0x%08x TertiaryExec=0x%016llx\n",
>  	       cpu_based_exec_ctrl, secondary_exec_control, tertiary_exec_control);
> -	pr_err("PinBased=0x%08x EntryControls=%08x ExitControls=%08x\n",
> -	       pin_based_exec_ctrl, vmentry_ctl, vmexit_ctl);
> +	pr_err("PinBased=0x%08x EntryControls=0x%08x\n",
> +	       pin_based_exec_ctrl, vmentry_ctl);
> +	pr_err("ExitControls=0x%08x SecondaryExitControls=0x%016llx\n",
> +	       vmexit_ctl, secondary_vmexit_ctl);
>  	pr_err("ExceptionBitmap=%08x PFECmask=%08x PFECmatch=%08x\n",
>  	       vmcs_read32(EXCEPTION_BITMAP),
>  	       vmcs_read32(PAGE_FAULT_ERROR_CODE_MASK),
>  	       vmcs_read32(PAGE_FAULT_ERROR_CODE_MATCH));
> -	pr_err("VMEntry: intr_info=%08x errcode=%08x ilen=%08x\n",
> +	pr_err("VMEntry: intr_info=%08x errcode=%08x ilen=%08x event_data=%016llx\n",
>  	       vmcs_read32(VM_ENTRY_INTR_INFO_FIELD),
>  	       vmcs_read32(VM_ENTRY_EXCEPTION_ERROR_CODE),
> -	       vmcs_read32(VM_ENTRY_INSTRUCTION_LEN));
> +	       vmcs_read32(VM_ENTRY_INSTRUCTION_LEN),
> +	       kvm_cpu_cap_has(X86_FEATURE_FRED) ? vmcs_read64(INJECTED_EVENT_DATA) : 0);
>  	pr_err("VMExit: intr_info=%08x errcode=%08x ilen=%08x\n",
>  	       vmcs_read32(VM_EXIT_INTR_INFO),
>  	       vmcs_read32(VM_EXIT_INTR_ERROR_CODE),
>  	       vmcs_read32(VM_EXIT_INSTRUCTION_LEN));
>  	pr_err("        reason=%08x qualification=%016lx\n",
>  	       vmcs_read32(VM_EXIT_REASON), vmcs_readl(EXIT_QUALIFICATION));
> -	pr_err("IDTVectoring: info=%08x errcode=%08x\n",
> +	pr_err("IDTVectoring: info=%08x errcode=%08x event_data=%016llx\n",
>  	       vmcs_read32(IDT_VECTORING_INFO_FIELD),
> -	       vmcs_read32(IDT_VECTORING_ERROR_CODE));
> +	       vmcs_read32(IDT_VECTORING_ERROR_CODE),
> +	       kvm_cpu_cap_has(X86_FEATURE_FRED) ? vmcs_read64(ORIGINAL_EVENT_DATA) : 0);
>  	pr_err("TSC Offset = 0x%016llx\n", vmcs_read64(TSC_OFFSET));
>  	if (secondary_exec_control & SECONDARY_EXEC_TSC_SCALING)
>  		pr_err("TSC Multiplier = 0x%016llx\n",
> -- 
> 2.48.1
> 

