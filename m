Return-Path: <linux-doc+bounces-25203-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1202297876F
	for <lists+linux-doc@lfdr.de>; Fri, 13 Sep 2024 20:02:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3DB3D1C21177
	for <lists+linux-doc@lfdr.de>; Fri, 13 Sep 2024 18:02:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A8E084A5B;
	Fri, 13 Sep 2024 18:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eyd6t+6J"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42967BA50
	for <linux-doc@vger.kernel.org>; Fri, 13 Sep 2024 18:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726250572; cv=none; b=f72NGtaMkSu93EDRFv2Lgh3FRB88SpZJUbmkAzjTw9cxv4F8ssJysLe1WXEjkq8gr1Nh/AfYYtAanBiTNLwC8PZ1o75ef+E98GpDa/5MBCJayKJjoAK4v4R7R9qKxYTEPMiKt3m4O3VBvJ1Js8c3kyJfbvr1i8B7BeKVTDYfVVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726250572; c=relaxed/simple;
	bh=aGCUDXfV/u877/fkGI51wat4K8lT5ShFVAK8Wj6tNt4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=K1M7FFq9Ud3CE6qnfLqeAg3Jx/JBZTnjoWbwqVlR40vr4XQXSmUT42bDcC+jwHDkEwpcgvDnEIlkeUryCzrYDkPU15JKZjEzGOHRPalK1id0cu1/ki5YXScVmBd8vyctF4mUE7aZQqLzhp61N3zf0UFncNGX5Q62AmHTCfgG+sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eyd6t+6J; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6d3aa5a672dso55124267b3.2
        for <linux-doc@vger.kernel.org>; Fri, 13 Sep 2024 11:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726250570; x=1726855370; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=SdKtMk3zFpIjWQQtYnxSCkrmfWA0I64F86jP4xgplJo=;
        b=eyd6t+6J3YIemQOT4ft7gvNG0mImDRIyXa09JbpLgTu27NSWSJAVgBmhWv1qZtCjkX
         xZprwB6PrcnusHDuVUbdr89Mo2i56cDpkfKWvb3SPEecYp2YLOJGJ4UL8yw/icFD56Pt
         +S7ysWPwnnnTU3/fSTbe54r49ldVv3cRs2YV3cYOW+EbLDmGXKmQlfAitG2gkacCp7K8
         yRKQ0unGkXReFP5wsrWe29ZQ+w7O3W1TOmPsN2kQ9AqbxxqDdFpZXbxiTmMwlchvsQJp
         gaeLcW44zKdaCmzw1DbzEwtocX8NlebuTQrG8VM4NxeFVeapieboDeTZlqcPmqz41eiw
         RBPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726250570; x=1726855370;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SdKtMk3zFpIjWQQtYnxSCkrmfWA0I64F86jP4xgplJo=;
        b=tC80WlUAi1J01iK4Z5Nkooq59xM1mlmkfoKKAtBVkyFNMy8wwV4mYwG5xy6qMm+CwA
         OWZ1eYKidGxIMuSzljO/xdz0MJxnZdQgLxum/shvNKoCZQe7e6+Rcn2Nt0oUI3t4LpzX
         yyBPFy1POr874wvyaTTP0rTAN7cENsmLwYzfZ0Dq7ilBDBbaLK59sDNiieV2Brthza5V
         5N9CSVClvA4V1vPxhD7XXu9453L4BuGGQaIjAI3G8oQ/n0IMfGWJx0tRRv+PlHzehBO1
         nS9Rsc+yclmNJ732wJM2K96+DBGehPxcue6ZVds2CGBhpOBm5uYjFsFI4IneXyagiRer
         6LoA==
X-Forwarded-Encrypted: i=1; AJvYcCUhjvljupbnaA6FsDWOZocqw75cbKQ48xeGPE5jvLmvhXH8nCup6/r1aAnpjucZpNiB3LkahtKX9S0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIPer3YT4h/ng/yE86yNaZxdpLJ4ml2AgMVATjQRFLQ+VC3nuO
	l6RPBMyrIYqqe41bcY1AaAn3PWTaKts/eL+jv425brQM76fF/7djkkrmJRVv0QbTKA09TsecBPn
	gdQ==
X-Google-Smtp-Source: AGHT+IGT5Cq9F/Hq6fJKYSOkySIR4cK8FdX4I3mm6MNrBQ/Kg+JyiB86l9pHtdUOjWBXR4MFXaP3rIm2mPU=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:690c:4d43:b0:6db:cd39:4dad with SMTP id
 00721157ae682-6dbcd395214mr2114647b3.5.1726250570352; Fri, 13 Sep 2024
 11:02:50 -0700 (PDT)
Date: Fri, 13 Sep 2024 11:02:48 -0700
In-Reply-To: <20240609154945.55332-5-nsaenz@amazon.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240609154945.55332-1-nsaenz@amazon.com> <20240609154945.55332-5-nsaenz@amazon.com>
Message-ID: <ZuR-SPaaTBwLTxW3@google.com>
Subject: Re: [PATCH 04/18] KVM: x86: hyper-v: Introduce VTL awareness to
 Hyper-V's PV-IPIs
From: Sean Christopherson <seanjc@google.com>
To: Nicolas Saenz Julienne <nsaenz@amazon.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, pbonzini@redhat.com, 
	vkuznets@redhat.com, linux-doc@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	graf@amazon.de, dwmw2@infradead.org, paul@amazon.com, mlevitsk@redhat.com, 
	jgowans@amazon.com, corbet@lwn.net, decui@microsoft.com, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	amoorthy@google.com
Content-Type: text/plain; charset="us-ascii"

On Sun, Jun 09, 2024, Nicolas Saenz Julienne wrote:
> HvCallSendSyntheticClusterIpi and HvCallSendSyntheticClusterIpiEx allow
> sending VTL-aware IPIs. Honour the hcall by exiting to user-space upon
> receiving a request with a valid VTL target. This behaviour is only
> available if the VSM CPUID flag is available and exposed to the guest.
> It doesn't introduce a behaviour change otherwise.
> 
> User-space is accountable for the correct processing of the PV-IPI
> before resuming execution.
> 
> Signed-off-by: Nicolas Saenz Julienne <nsaenz@amazon.com>
> ---
>  arch/x86/kvm/hyperv.c | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/kvm/hyperv.c b/arch/x86/kvm/hyperv.c
> index 42f44546fe79c..d00baf3ffb165 100644
> --- a/arch/x86/kvm/hyperv.c
> +++ b/arch/x86/kvm/hyperv.c
> @@ -2217,16 +2217,20 @@ static void kvm_hv_send_ipi_to_many(struct kvm *kvm, u32 vector,
>  
>  static u64 kvm_hv_send_ipi(struct kvm_vcpu *vcpu, struct kvm_hv_hcall *hc)
>  {
> +	bool vsm_enabled = kvm_hv_cpuid_vsm_enabled(vcpu);
>  	struct kvm_vcpu_hv *hv_vcpu = to_hv_vcpu(vcpu);
>  	u64 *sparse_banks = hv_vcpu->sparse_banks;
>  	struct kvm *kvm = vcpu->kvm;
>  	struct hv_send_ipi_ex send_ipi_ex;
>  	struct hv_send_ipi send_ipi;
> +	union hv_input_vtl *in_vtl;
>  	u64 valid_bank_mask;
> +	int rsvd_shift;
>  	u32 vector;
>  	bool all_cpus;
>  
>  	if (hc->code == HVCALL_SEND_IPI) {
> +		in_vtl = &send_ipi.in_vtl;

I don't see any value in having a local pointer to a union.  Just use send_ipi.in_vtl.

>  		if (!hc->fast) {
>  			if (unlikely(kvm_read_guest(kvm, hc->ingpa, &send_ipi,
>  						    sizeof(send_ipi))))
> @@ -2235,16 +2239,22 @@ static u64 kvm_hv_send_ipi(struct kvm_vcpu *vcpu, struct kvm_hv_hcall *hc)
>  			vector = send_ipi.vector;
>  		} else {
>  			/* 'reserved' part of hv_send_ipi should be 0 */
> -			if (unlikely(hc->ingpa >> 32 != 0))
> +			rsvd_shift = vsm_enabled ? 40 : 32;
> +			if (unlikely(hc->ingpa >> rsvd_shift != 0))
>  				return HV_STATUS_INVALID_HYPERCALL_INPUT;

The existing error handling doesn't make any sense to me.  Why is this the _only_
path that enforces reserved bits?

Regarding the shift, I think it makes more sense to do:

			/* Bits 63:40 are always reserved. */
			if (unlikely(hc->ingpa >> 40 != 0))
				return HV_STATUS_INVALID_HYPERCALL_INPUT;

			send_ipi.in_vtl.as_uint8 = (u8)(hc->ingpa >> 32);
			if (unlikely(!vsm_enabled && send_ipi.in_vtl.as_uint8))
				return HV_STATUS_INVALID_HYPERCALL_INPUT;

so that it's more obvious exactly what is/isn't reserved when VSM isn't/is enabled.

> +			in_vtl->as_uint8 = (u8)(hc->ingpa >> 32);
>  			sparse_banks[0] = hc->outgpa;
>  			vector = (u32)hc->ingpa;
>  		}
>  		all_cpus = false;
>  		valid_bank_mask = BIT_ULL(0);
>  
> +		if (in_vtl->use_target_vtl)

Due to the lack of error checking for the !hc->fast case, this will do the wrong
thing if vsm_enabled=false.

> +			return -ENODEV;
> +
>  		trace_kvm_hv_send_ipi(vector, sparse_banks[0]);
>  	} else {
> +		in_vtl = &send_ipi_ex.in_vtl;
>  		if (!hc->fast) {
>  			if (unlikely(kvm_read_guest(kvm, hc->ingpa, &send_ipi_ex,
>  						    sizeof(send_ipi_ex))))
> @@ -2253,8 +2263,12 @@ static u64 kvm_hv_send_ipi(struct kvm_vcpu *vcpu, struct kvm_hv_hcall *hc)
>  			send_ipi_ex.vector = (u32)hc->ingpa;
>  			send_ipi_ex.vp_set.format = hc->outgpa;
>  			send_ipi_ex.vp_set.valid_bank_mask = sse128_lo(hc->xmm[0]);
> +			in_vtl->as_uint8 = (u8)(hc->ingpa >> 32);
>  		}
>  
> +		if (vsm_enabled && in_vtl->use_target_vtl)
> +			return -ENODEV;
> +
>  		trace_kvm_hv_send_ipi_ex(send_ipi_ex.vector,
>  					 send_ipi_ex.vp_set.format,
>  					 send_ipi_ex.vp_set.valid_bank_mask);
> @@ -2682,6 +2696,9 @@ int kvm_hv_hypercall(struct kvm_vcpu *vcpu)
>  			break;
>  		}
>  		ret = kvm_hv_send_ipi(vcpu, &hc);
> +		/* VTL-enabled ipi, let user-space handle it */
> +		if (ret == -ENODEV)

I generally don't love "magic" error codes, but I don't see an obvious better
solution either.  The other weird thing is that "ret" is a u64, versus the more
common int or even long.  I doubt it's problematic in practice, just a bit odd.

> +			goto hypercall_userspace_exit;
>  		break;
>  	case HVCALL_POST_DEBUG_DATA:
>  	case HVCALL_RETRIEVE_DEBUG_DATA:
> -- 
> 2.40.1
> 

