Return-Path: <linux-doc+bounces-27042-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 39DC6998146
	for <lists+linux-doc@lfdr.de>; Thu, 10 Oct 2024 11:01:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B2BB41F24C66
	for <lists+linux-doc@lfdr.de>; Thu, 10 Oct 2024 09:01:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7F241BC092;
	Thu, 10 Oct 2024 08:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BPBCV2yU"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F951A303E
	for <linux-doc@vger.kernel.org>; Thu, 10 Oct 2024 08:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728550681; cv=none; b=FaiPfGMdBItJuOYtELdZx0Mqe3bIopWHhfyeMU/BUALFeCORHWcF2ro0rb4Y5HzTaNbD6wx2cApGa5GtK5WUSMti52UdX49pfbuhUUJzM0+frBxe9MzMRkL9AKQKaXp3ooGq9tHHetpAgy6T9b9r42LIL37nB9RkentXg3LUxlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728550681; c=relaxed/simple;
	bh=uEoD+N+ErCzjUQzAybretMtYvnPznERIurac1+tT/ug=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=gxAAH1di2kyz1sHWhVvq7/RgQWNf2TvPmZb3OXhrBHJlrSOSb4E1rKyNVBE9a3PFVvjJEJdJI/bxlHVR9FJA7sr+jw9Kb+dGtAGYV3hz3xbwFH6DDZy061ipeDy5qwDfnkeaGop0XcmH8fr6KvgLGSVuF0zd5A18PyfA5DRKgf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BPBCV2yU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728550679;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V3mfLBxE7mgA5D2j+dKOJ0660aCNEHB3kXbTGLynC34=;
	b=BPBCV2yUr/1yFMwuHtkIMBME2oPxGZE5HOpc9Budoa4tDQbnuOHITHaoQppR4tfAg7ov76
	0w5o+DCiBT3wrVnbMU+TG7vFn0WTLNqBBmthENe6cQvq1EaDRnzQSI2Bt+Us6jFUtOmb0G
	EnRZiGq1yjWW6l5Y0GvS3pZnDvHoqAk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-133-u24YVGOGPhyS9DaitQzdRw-1; Thu, 10 Oct 2024 04:57:58 -0400
X-MC-Unique: u24YVGOGPhyS9DaitQzdRw-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-42cdeac2da6so4089965e9.2
        for <linux-doc@vger.kernel.org>; Thu, 10 Oct 2024 01:57:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728550677; x=1729155477;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V3mfLBxE7mgA5D2j+dKOJ0660aCNEHB3kXbTGLynC34=;
        b=dZ2qxlqEP1MkQIOj4EFK2EeftRiGgX2f4JzCTtrnQOOfVUB0jxE6cG2j31Db7biYQ6
         QuHyPsoV00LFDRLjhFfMDByvPsnwJeV3Rdrhz5PAcmn61wLtbyMyskWt4hcZCuFEgyxe
         6hOJ3lrkOVaY1v2x5ABgDWC1kYjsxYTdLuA80FXfzbNcg6bZ7pC/rIY1QtmXzhX6pZjY
         s16Mv0ZENz/xTGTtrAmiNN4jxwxj3zTYfS4u3eusJoShWu2qSjKHhjSWHlOaDbHOmaoY
         FGuhuUOIa443oQTjKZnfVRAemGRrE64dHiIFMDYnp2G47eesW16ZvhcG/u8bo7koONap
         YWVA==
X-Forwarded-Encrypted: i=1; AJvYcCXpGI2/Xi8k4FnQjoQO/F8Bvq9yBanFLTR+/UEVFxfoWnS4pHCCEFikPtmCltVzbc7nI7jTbYTl/Ps=@vger.kernel.org
X-Gm-Message-State: AOJu0YxudiSGSzzPyyCMziE7OjUlkKQ0m6Rf2Hf8K3pGf3mlJuoaSxyj
	39v+0ODrcxah1dral8qjFcwA7wJl0lT7I4q1GOsQE6CPVX6DTLCMOwaSg16VfAHOC0JZ91s0pBX
	2IZv9jvuoOfR8m8Karw6PlAiDmj4M/jpdfmZDTUBmNZVoqAoOT3vQjJbR0w==
X-Received: by 2002:a05:600c:a08:b0:42f:7ed4:4c26 with SMTP id 5b1f17b1804b1-430ccf1d794mr43479675e9.12.1728550676802;
        Thu, 10 Oct 2024 01:57:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFO2YZz0KIdt9CH7YpTmaKm1V5sN7oLsDloXPoVkbSMJb4dyCl0+OpMHrvepMEuByPjcRlSzQ==
X-Received: by 2002:a05:600c:a08:b0:42f:7ed4:4c26 with SMTP id 5b1f17b1804b1-430ccf1d794mr43479505e9.12.1728550676374;
        Thu, 10 Oct 2024 01:57:56 -0700 (PDT)
Received: from fedora (g2.ign.cz. [91.219.240.8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b6a8666sm913435f8f.22.2024.10.10.01.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 01:57:56 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Nikolas Wipper <nikwip@amazon.de>
Cc: Nicolas Saenz Julienne <nsaenz@amazon.com>, Alexander Graf
 <graf@amazon.de>, James Gowans <jgowans@amazon.com>,
 nh-open-source@amazon.com, Sean Christopherson <seanjc@google.com>, Paolo
 Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, Nikolas Wipper <nik.wipper@gmx.de>,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, x86@kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 1/7] KVM: Add API documentation for
 KVM_HYPERV_SET_TLB_FLUSH_INHIBIT
In-Reply-To: <20241004140810.34231-2-nikwip@amazon.de>
References: <20241004140810.34231-1-nikwip@amazon.de>
 <20241004140810.34231-2-nikwip@amazon.de>
Date: Thu, 10 Oct 2024 10:57:55 +0200
Message-ID: <874j5kgwrw.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Nikolas Wipper <nikwip@amazon.de> writes:

> Add API documentation for the new KVM_HYPERV_SET_TLB_FLUSH_INHIBIT ioctl.
>
> Signed-off-by: Nikolas Wipper <nikwip@amazon.de>
> ---
>  Documentation/virt/kvm/api.rst | 41 ++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index a4b7dc4a9dda..9c11a8af336b 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -6443,6 +6443,47 @@ the capability to be present.
>  `flags` must currently be zero.
>  
>  
> +4.144 KVM_HYPERV_SET_TLB_FLUSH_INHIBIT
> +--------------------------------------
> +
> +:Capability: KVM_CAP_HYPERV_TLB_FLUSH_INHIBIT
> +:Architectures: x86
> +:Type: vcpu ioctl
> +:Parameters: struct kvm_hyperv_tlb_flush_inhibit
> +:returnReturns: 0 on success, this ioctl can't fail
> +
> +KVM_HYPERV_SET_TLB_FLUSH_INHIBIT allows userspace to prevent Hyper-V
> hyper-calls

Very minor nitpick: I suggest standardize on "hypercall" spelling
without the dash because:

$ grep -c hypercall Documentation/virt/kvm/api.rst
56
$ grep -c hyper-call Documentation/virt/kvm/api.rst
3

(I see all three 'hypercall', 'hyper-call', 'hyper call' usages in the
wild and I honestly don't think it matters but it would be nice to
adhere to one share across the same file / KVM docs).

> +that remotely flush a vCPU's TLB, i.e. HvFlushVirtualAddressSpace(Ex)/
> +HvFlushVirtualAddressList(Ex). When the flag is set, a vCPU attempting to flush
> +an inhibited vCPU will be suspended and will only resume once the flag is
> +cleared again using this ioctl. During suspension, the vCPU will not finish the
> +hyper-call, but may enter the guest to retry it. Because it is caused by a
> +hyper-call, the suspension naturally happens on a guest instruction boundary.
> +This behaviour and the suspend state itself are specified in Microsoft's
> +"Hypervisor Top Level Functional Specification" (TLFS).
> +
> +::
> +
> +  /* for KVM_HYPERV_SET_TLB_FLUSH_INHIBIT */
> +  struct kvm_hyperv_tlb_flush_inhibit {
> +      /* in */
> +      __u16 flags;
> +  #define KVM_HYPERV_UNINHIBIT_TLB_FLUSH 0
> +  #define KVM_HYPERV_INHIBIT_TLB_FLUSH 1
> +      __u8  inhibit;
> +      __u8 padding[5];
> +  };
> +
> +No flags are specified so far, the corresponding field must be set to zero,
> +otherwise the ioctl will fail with exit code -EINVAL.
> +
> +The suspension is transparent to userspace. It won't cause KVM_RUN to return or
> +the MP state to be changed. The suspension cannot be manually induced or exited
> +apart from changing the TLB flush inhibit flag of a targeted processor.
> +
> +There is no way for userspace to query the state of the flush inhibit flag.
> +Userspace must keep track of the required state itself.
> +
>  5. The kvm_run structure
>  ========================

-- 
Vitaly


