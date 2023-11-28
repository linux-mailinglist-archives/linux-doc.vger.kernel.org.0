Return-Path: <linux-doc+bounces-3246-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 637487FB2A5
	for <lists+linux-doc@lfdr.de>; Tue, 28 Nov 2023 08:25:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C58C2B20BD8
	for <lists+linux-doc@lfdr.de>; Tue, 28 Nov 2023 07:25:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CC06134BA;
	Tue, 28 Nov 2023 07:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OOWU448B"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34AB819A2
	for <linux-doc@vger.kernel.org>; Mon, 27 Nov 2023 23:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701156308;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iANepy4LcEVc0PFmyCqY5MwriaBXl1P+qYoxDZZLGVY=;
	b=OOWU448BUi1q8C1jSz7YkZtbjQ0FUzSXhG7yJZSiSs3bKwet8BRd4VoP9SDnpp6mkC4/Uc
	/G4lBkzMS8JhgeSilduz97jqNfMx0Z1O4yPbVuqBClnM6XJHkrF1nHY5zkQDByTSsokoNn
	bgaCIAB0T1LZhhqKaxLV2l/9ZK6EV0I=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-18-xz0FX1IuNueotce2gKJW6g-1; Tue, 28 Nov 2023 02:25:07 -0500
X-MC-Unique: xz0FX1IuNueotce2gKJW6g-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-332dfa77997so3539720f8f.0
        for <linux-doc@vger.kernel.org>; Mon, 27 Nov 2023 23:25:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701156306; x=1701761106;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iANepy4LcEVc0PFmyCqY5MwriaBXl1P+qYoxDZZLGVY=;
        b=o+1XCx4Frvr9laTKcT0N1mxG2bnCf9ErmfzbRepjLmcXZTSQmdxfcXxvbD6cK+4R2O
         7+55pAB8zyun3ZX9B7aTzaybiCnSK78G9LcgxpMvs2LvjrkSyyQ0un1I9y6bIBxN1iIW
         WAyT/RFLeO/2LCMEo5jFb47aCe4r/qsLuQaqFAcCtjZmDQI0mtetvRJ9DkQuv8y0rBY+
         ZIlQWWPCtO5Z8sn1DS3RQ6rIxRo1fbzI8HgVY48xfrfWyWEaG1bsI68Kol9dj3y9z3+5
         nvKIebAThGkOXdgcg3EF8GHO9snorjf2idiyQ19WlBAYeA8Y79X4kUk9RszgIVp2FlmZ
         U9+Q==
X-Gm-Message-State: AOJu0YwvCjDOs4KLvBCTnZKBMSlumv3Gm2jjC5rYsgPn+uXsF356YXV+
	M17FjwBHiJ9ZEVMe04Fo03Im9NP6yDz7AAvaAgg07GN4gcwpCAiw6puNUE9f5sc0bqvlsbgO6JD
	S0pvzGFOIyZiVyM48lZb4
X-Received: by 2002:a5d:464f:0:b0:32d:bb4a:525c with SMTP id j15-20020a5d464f000000b0032dbb4a525cmr10101810wrs.14.1701156305899;
        Mon, 27 Nov 2023 23:25:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE0QQYA/ChFd9v/3X2VV1Y1Nh7hNFAIVNaVFuTH1R2mIuDpnEA9cp9CcfXyFdGFcLHjPhMM+Q==
X-Received: by 2002:a5d:464f:0:b0:32d:bb4a:525c with SMTP id j15-20020a5d464f000000b0032dbb4a525cmr10101791wrs.14.1701156305564;
        Mon, 27 Nov 2023 23:25:05 -0800 (PST)
Received: from starship ([77.137.131.4])
        by smtp.gmail.com with ESMTPSA id d21-20020adf9b95000000b003316ad360c1sm14269010wrc.24.2023.11.27.23.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 23:25:05 -0800 (PST)
Message-ID: <c9d68c7f42a5ea936179b676bdf0970062d4f3a7.camel@redhat.com>
Subject: Re: [RFC 09/33] KVM: x86: hyper-v: Introduce per-VTL vcpu helpers
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Nicolas Saenz Julienne <nsaenz@amazon.com>, kvm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org, 
 pbonzini@redhat.com, seanjc@google.com, vkuznets@redhat.com,
 anelkz@amazon.com,  graf@amazon.com, dwmw@amazon.co.uk, jgowans@amazon.com,
 corbert@lwn.net,  kys@microsoft.com, haiyangz@microsoft.com,
 decui@microsoft.com, x86@kernel.org,  linux-doc@vger.kernel.org
Date: Tue, 28 Nov 2023 09:25:03 +0200
In-Reply-To: <20231108111806.92604-10-nsaenz@amazon.com>
References: <20231108111806.92604-1-nsaenz@amazon.com>
	 <20231108111806.92604-10-nsaenz@amazon.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Wed, 2023-11-08 at 11:17 +0000, Nicolas Saenz Julienne wrote:
> Introduce two helper functions. The first one queries a vCPU's VTL
> level, the second one, given a struct kvm_vcpu and VTL pair, returns the
> corresponding 'sibling' struct kvm_vcpu at the right VTL.
> 
> We keep track of each VTL's state by having a distinct struct kvm_vpcu
> for each level. VTL-vCPUs that belong to the same guest CPU share the
> same physical APIC id, but belong to different APIC groups where the
> apic group represents the vCPU's VTL.
> 
> Signed-off-by: Nicolas Saenz Julienne <nsaenz@amazon.com>
> ---
>  arch/x86/kvm/hyperv.h | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/arch/x86/kvm/hyperv.h b/arch/x86/kvm/hyperv.h
> index 2bfed69ba0db..5433107e7cc8 100644
> --- a/arch/x86/kvm/hyperv.h
> +++ b/arch/x86/kvm/hyperv.h
> @@ -23,6 +23,7 @@
>  
>  #include <linux/kvm_host.h>
>  #include "x86.h"
> +#include "lapic.h"
>  
>  /* "Hv#1" signature */
>  #define HYPERV_CPUID_SIGNATURE_EAX 0x31237648
> @@ -83,6 +84,23 @@ static inline struct kvm_hv_syndbg *to_hv_syndbg(struct kvm_vcpu *vcpu)
>  	return &vcpu->kvm->arch.hyperv.hv_syndbg;
>  }
>  
> +static inline struct kvm_vcpu *kvm_hv_get_vtl_vcpu(struct kvm_vcpu *vcpu, int vtl)
> +{
> +	struct kvm *kvm = vcpu->kvm;
> +	u32 target_id = kvm_apic_id(vcpu);
> +
> +	kvm_apic_id_set_group(kvm, vtl, &target_id);
> +	if (vcpu->vcpu_id == target_id)
> +		return vcpu;
> +
> +	return kvm_get_vcpu_by_id(kvm, target_id);
> +}

> +
> +static inline u8 kvm_hv_get_active_vtl(struct kvm_vcpu *vcpu)
> +{
> +	return kvm_apic_group(vcpu);
> +}
> +
>  static inline u32 kvm_hv_get_vpindex(struct kvm_vcpu *vcpu)
>  {
>  	struct kvm_vcpu_hv *hv_vcpu = to_hv_vcpu(vcpu);


Ideally I'll prefer the kernel to not know the VTL mapping at all but rather,
that each vCPU be assigned to an apic group / namespace and has its assigned VTL.

Then the kernel works in this way:

* Regular APIC IPI -> send it to the apic namespace to which the sender belongs or if we go with the idea of using
  multiple VMs, then this will work unmodified.

* Hardware interrupt -> send it to the vCPU/VM which userspace configured it to send via GSI mappings.

* HyperV IPI -> if same VTL as the vCPU assigned VTL -> deal with it the same as with regular IPI
             -> otherwise exit to the userspace.

* Page fault -> if related to violation of current VTL protection,
  exit to userspace, and the userspace can then queue the SynIC message, and wakeup the higher VTL.


Best regards,
	Maxim Levitsky




