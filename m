Return-Path: <linux-doc+bounces-21352-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5167693C84E
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jul 2024 20:24:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A9C0C283812
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jul 2024 18:24:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 365E124B2A;
	Thu, 25 Jul 2024 18:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="B0Sz0iC2"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B344421350
	for <linux-doc@vger.kernel.org>; Thu, 25 Jul 2024 18:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721931885; cv=none; b=S/IWJln0hRpE4/7+ZaLykeWXdkNuy7Ya3dCzpBNwNoGG45FkdS8MP3hvk4nA8OMsfsxoyxlm86tJAIgZ3XkvHYypD/LUoo/9SxUoeItq06DjlDLznkP56FQWzlKcG5oHiBTOC1rKshT4rWSc34qQyBDNsUtJTHvLyKZBw6Qv6fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721931885; c=relaxed/simple;
	bh=i3R8nP9zLb+svWwS6BlGQj3N7iJXoBGSLMafotY8l+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tV6RXM7+zl7Ovkiu+ubLNUIY4AxkS4dTXkGWtSuCO1kWykjPEgeNV6fB+njVjpGrZi27zu6EG9VshCsH0Sh51MyTLGaNMNgq+8MDSQrv77HmFdWxctgtFyMtAsAOdtHdq7Tzy1A7nxv2FFhBt5uVdv0jNoASehBiVNaRIUDAaTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=B0Sz0iC2; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1fc658b6b2eso11269025ad.0
        for <linux-doc@vger.kernel.org>; Thu, 25 Jul 2024 11:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721931883; x=1722536683; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Se8gRYY5LIzNKXtdqfpnU7+bApyeWuI8Q5DVjozYskA=;
        b=B0Sz0iC2mQxQ1OlnT48cw0EaJRrxh3u4oaSuWDITfETMQ5TAw5Jmtwp/Ub681JbEOg
         k3ExGVrA1en2nRKW8pmyMzH0oe1eRaodEJl0IulyJxTfu3mu5Fks+/5rr8ZSvUbL8hz0
         OFJ9Hu/4rLy1d+lsQKe6sHAQu25if6Eu8DWB5hP5pJc1jYVHRSG2Ma5H3WaDHI9zhH7r
         MgO006Gm7ZZoJEAAGO0ztS9WVK0bDeaw2UyAYIvE3kS5HmANHOHpcSmUi2WS+vac6aGV
         uqUZ488oQSxmby2BMrno2rluMLBeBTqFL68ccdCyckkGlUXRINoYtoQgR4qHqzSKLU6p
         QcDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721931883; x=1722536683;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Se8gRYY5LIzNKXtdqfpnU7+bApyeWuI8Q5DVjozYskA=;
        b=sEQJZDIJS5GUSHpEKpCLgXPmMLQPsyjvWWiScsN7cMAnsgG4g/id7jBatbf0/ZX2VU
         6aQ7cQ2jr3/XtQ1PVcMGYAd55kolPZsssHHdxDaX/bqMJ3Vuillhc0eJC7q2/CmVqLwa
         sY61J1bVcUf2vWXVNhFFrR4gN1RvVQwRtMCc1Ldcz7CY2XJWzwpNcJQnzGcP27TQa4+H
         1RKxguU0C2kmAoL/VMZjlFYiRLnrHXKThs6zHYPoGThso7SoWGoATrVXB5VgTnObPd7f
         RZAQ93Ueqo2SR/05VAuP2gv5KklJH5/lsgV9hsu+hvdQJ+oSB+SwdWXomn2S5MaZamwJ
         VT9w==
X-Forwarded-Encrypted: i=1; AJvYcCVL5PluzTrNT/OjIUOXwgfU0Hre/ynI0rf1xDOhhseL8nJAvz7c6D74XXkiCt7ygB6FqDkpdTfYu3beCy2MwguBYg7JiN7lcRKr
X-Gm-Message-State: AOJu0Yxx68J//pneYG7pMM50AnDW/UfVXSXipTEgXTPR06QAUK9WR6nE
	rr4tsKVOJZxZ7JXagXqHfMpc/LeS7McT9wBTX804tI0DQ5i3udcpDEgPVlB/9w==
X-Google-Smtp-Source: AGHT+IGk5VWe3MPnS2h4842sbCO2M3IxnHPFyqsvxia4EgfDcheEN/25uzJzuwNsHLA2SFZv0xA2tg==
X-Received: by 2002:a17:902:da91:b0:1fc:5b68:ffb8 with SMTP id d9443c01a7336-1fed38ba92fmr44676985ad.30.1721931882617;
        Thu, 25 Jul 2024 11:24:42 -0700 (PDT)
Received: from google.com (61.139.125.34.bc.googleusercontent.com. [34.125.139.61])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7fa4045sm17298215ad.258.2024.07.25.11.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 11:24:42 -0700 (PDT)
Date: Thu, 25 Jul 2024 11:24:37 -0700
From: David Matlack <dmatlack@google.com>
To: James Houghton <jthoughton@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Ankit Agrawal <ankita@nvidia.com>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	David Rientjes <rientjes@google.com>,
	James Morse <james.morse@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Sean Christopherson <seanjc@google.com>,
	Shaoqin Huang <shahuang@redhat.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Wei Xu <weixugc@google.com>, Will Deacon <will@kernel.org>,
	Yu Zhao <yuzhao@google.com>, Zenghui Yu <yuzenghui@huawei.com>,
	kvmarm@lists.linux.dev, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v6 09/11] KVM: x86: Implement fast_only versions of
 kvm_{test_,}age_gfn
Message-ID: <ZqKYZagP55dVD1m4@google.com>
References: <20240724011037.3671523-1-jthoughton@google.com>
 <20240724011037.3671523-10-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240724011037.3671523-10-jthoughton@google.com>

On 2024-07-24 01:10 AM, James Houghton wrote:
> These fast-only versions simply ignore the shadow MMU. We can locklessly
> handle the shadow MMU later.
> 
> Set HAVE_KVM_MMU_NOTIFIER_YOUNG_FAST_ONLY for X86_64 only, as that is
> the only case where the TDP MMU might be used. Without the TDP MMU, the
> fast-only notifiers will always be no-ops. It would be ideal not to
> report has_fast_only if !tdp_mmu_enabled, but tdp_mmu_enabled can be
> changed at any time.

tdp_mmu_enabled is a read-only KVM parameter. And even when it was
writable, it was still fixed for a given VM at VM creation time.

Would it make more sense to have kvm_arch_post_init_vm() set
has_fast_aging if the architecture supports it. And for x86 that means
iff tdp_mmu_enabled.

> 
> Signed-off-by: James Houghton <jthoughton@google.com>
> ---
>  arch/x86/kvm/Kconfig   | 1 +
>  arch/x86/kvm/mmu/mmu.c | 4 ++--
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
> index 6ac43074c5e9..ed9049cf1255 100644
> --- a/arch/x86/kvm/Kconfig
> +++ b/arch/x86/kvm/Kconfig
> @@ -24,6 +24,7 @@ config KVM
>  	select KVM_COMMON
>  	select KVM_GENERIC_MMU_NOTIFIER
>  	select KVM_MMU_NOTIFIER_YOUNG_LOCKLESS
> +	select HAVE_KVM_MMU_NOTIFIER_YOUNG_FAST_ONLY if X86_64
>  	select HAVE_KVM_IRQCHIP
>  	select HAVE_KVM_PFNCACHE
>  	select HAVE_KVM_DIRTY_RING_TSO
> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> index 919d59385f89..3c6c9442434a 100644
> --- a/arch/x86/kvm/mmu/mmu.c
> +++ b/arch/x86/kvm/mmu/mmu.c
> @@ -1641,7 +1641,7 @@ bool kvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
>  	if (tdp_mmu_enabled)
>  		young |= kvm_tdp_mmu_age_gfn_range(kvm, range);
>  
> -	if (kvm_has_shadow_mmu_sptes(kvm)) {
> +	if (!range->arg.fast_only && kvm_has_shadow_mmu_sptes(kvm)) {
>  		write_lock(&kvm->mmu_lock);
>  		young = kvm_handle_gfn_range(kvm, range, kvm_age_rmap);
>  		write_unlock(&kvm->mmu_lock);
> @@ -1657,7 +1657,7 @@ bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
>  	if (tdp_mmu_enabled)
>  		young |= kvm_tdp_mmu_test_age_gfn(kvm, range);
>  
> -	if (!young && kvm_has_shadow_mmu_sptes(kvm)) {
> +	if (!young && !range->arg.fast_only && kvm_has_shadow_mmu_sptes(kvm)) {
>  		write_lock(&kvm->mmu_lock);
>  		young = kvm_handle_gfn_range(kvm, range, kvm_test_age_rmap);
>  		write_unlock(&kvm->mmu_lock);
> -- 
> 2.46.0.rc1.232.g9752f9e123-goog
> 

