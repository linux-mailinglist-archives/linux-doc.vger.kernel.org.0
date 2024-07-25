Return-Path: <linux-doc+bounces-21351-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F14993C839
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jul 2024 20:18:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 00F791F2228F
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jul 2024 18:18:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41BED21350;
	Thu, 25 Jul 2024 18:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0O+hwPJq"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3331D530
	for <linux-doc@vger.kernel.org>; Thu, 25 Jul 2024 18:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721931471; cv=none; b=OB85wr1MmFUMeRsEEuhZNX81FnE2UTr1VYM+R68AvpukkaR+hGrlcdkVDaaDdgg8CJfavml7fquKB4An0X7Car4nGNodC0WAmAfZa5lBOHEy14xjx8eNOdQ+mVyeh811zcOzaTTQsgrJRoHLmRiIm5Qx4/zkpy7PQSeX9LtcsSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721931471; c=relaxed/simple;
	bh=7TGdImb3lenZ6if5s4D0hbXhdDde95DNNoZfafPu3I8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m+PiGJ9BlGv8AD4Lg/5TjJffGyDZq1XU2Q3hKePsFxmlvk29ZIHrix57GP/c4ts6ZQYQPAvVoWS80yH3gc6ZapuPk0wVFNfVZstyGoynvwB22ai6zwzlo9F70NyB+ovOD1kB4HInZ87qJeg18qToLcRjObRSYnZDjkGeRcNnug0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0O+hwPJq; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-70d333d57cdso134521b3a.3
        for <linux-doc@vger.kernel.org>; Thu, 25 Jul 2024 11:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721931468; x=1722536268; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZCU/39n/MEh1qJPI6jK5LfqbsxyFwdIdQzHQHHv611A=;
        b=0O+hwPJqirc88Dd0P+wWSlKQSkkrmqATFfdchfD7NapXyvBCRzpqVHbYYKmKT6pwVC
         xgPQZXCWKhl/DsAJoL72NBeh/YljM+k7gln/rHbqCh6wCQvzKshXxHPFH6ZtH4QagctC
         IhApB9eOLZ55PDNxtmEQtSThiFGhli4UQIlDYAjsOFNzJwnrabnSWOon2tDOXnCPXhEv
         NkygSz7RMD+TzdiRsNA9PzNyVNdns52gpcyczWJg7IL0aDbmfjH+63G5SCFfo8UWRzoJ
         ADtDpUyoULPqJNPoogNoU8aG3xYyGkloRfFbawX4YBzMWUNhF/fEQ/VzQAm94pbWEq+1
         sdkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721931468; x=1722536268;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZCU/39n/MEh1qJPI6jK5LfqbsxyFwdIdQzHQHHv611A=;
        b=khOdgVM6/j74nV6AAN9M3V/YENlAESeoOGu/rOZOAqnlVzlP+DOUq47Gdpsp3zk7X8
         9dLeHI7WMqMlaHf9hpzAzB9rSDFXBnqs9ChAPQWKNb4/ZRYdZwutG9HqDLbL+XgmnnX+
         XbbF4P5pFRc+kWPGxlyH/+3QCs25W/JKAyJdDF2XKph1At6EPCYQzo61R3FZPhWdn+Vy
         kEvdXg4jan0WbBIjpzQ67z0k3yYCcMrgdxTsjPQDbuYB46KXBU6RJLUyRagE/QHzBC6B
         5HB2/SzuLDc7qU7lFPFFjipycx/3XakZIhjg4vlEQRmUwKSXJiKwmW8IxokvtuStpdH9
         rx3A==
X-Forwarded-Encrypted: i=1; AJvYcCVVDWqP7fuFpJy57HpQQ+JABO6LNcd5289mbo79QV5/1zxI9pTigSKuIQsU8Ri5sMrns4QVoTBs3tpXfIphWLwBj4ez9HP0g0uG
X-Gm-Message-State: AOJu0YyPMn8lH2PqQe6JMf1zS4xOuQZBc3eCfb4v2Md1WmCR5oQTvlA3
	gOcfVgN43Bm6KApQ3fMmXB7zyGurfvwtWfJsRtsieX8jCKW2x71Ha+tukK4HyQ==
X-Google-Smtp-Source: AGHT+IGgJJ2MHUDyfdNf8nuLsnVaCfQ9A96+ttKTHUsGKEKorXbwZR90OZ/UEb7mApStThubbs9AYw==
X-Received: by 2002:a05:6a00:2d8c:b0:70e:8070:f9d0 with SMTP id d2e1a72fcca58-70eae8d5c8amr3531836b3a.9.1721931466986;
        Thu, 25 Jul 2024 11:17:46 -0700 (PDT)
Received: from google.com (61.139.125.34.bc.googleusercontent.com. [34.125.139.61])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7a9f884c245sm1490390a12.50.2024.07.25.11.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 11:17:46 -0700 (PDT)
Date: Thu, 25 Jul 2024 11:17:41 -0700
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
Subject: Re: [PATCH v6 08/11] KVM: x86: Optimize kvm_{test_,}age_gfn a little
 bit
Message-ID: <ZqKWxfqRoJzUWroG@google.com>
References: <20240724011037.3671523-1-jthoughton@google.com>
 <20240724011037.3671523-9-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240724011037.3671523-9-jthoughton@google.com>

On 2024-07-24 01:10 AM, James Houghton wrote:
> Optimize both kvm_age_gfn and kvm_test_age_gfn's interaction with the

nit: Use () when referring to functions.

> shadow MMU by, rather than checking if our memslot has rmaps, check if
> there are any indirect_shadow_pages at all.

What is optimized by checking indirect_shadow_pages instead of
have_rmaps and what's the benefit? Smells like a premature optimization.

> 
> Also, for kvm_test_age_gfn, reorder the TDP MMU check to be first. If we
> find that the range is young, we do not need to check the shadow MMU.

This should be a separate commit since it's a logically distinct change
and no dependency on the other change in this commit (other than both
touch the same function).

Splitting the commits up will also make it easier to write more specific
short logs (instead of "optimize a little bit" :)

Also, the commit re-orders kvm_age_gfn() as well but the commit message
only mentions kvm_test_age_gfn(). No objection to keeping the two
functions consistent but it should be called out in the commit message.

> 
> Signed-off-by: James Houghton <jthoughton@google.com>
> ---
>  arch/x86/kvm/mmu/mmu.c | 21 +++++++++++++--------
>  1 file changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> index 7b93ce8f0680..919d59385f89 100644
> --- a/arch/x86/kvm/mmu/mmu.c
> +++ b/arch/x86/kvm/mmu/mmu.c
> @@ -1629,19 +1629,24 @@ static void rmap_add(struct kvm_vcpu *vcpu, const struct kvm_memory_slot *slot,
>  	__rmap_add(vcpu->kvm, cache, slot, spte, gfn, access);
>  }
>  
> +static bool kvm_has_shadow_mmu_sptes(struct kvm *kvm)
> +{
> +	return !tdp_mmu_enabled || READ_ONCE(kvm->arch.indirect_shadow_pages);
> +}
> +
>  bool kvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
>  {
>  	bool young = false;
>  
> -	if (kvm_memslots_have_rmaps(kvm)) {
> +	if (tdp_mmu_enabled)
> +		young |= kvm_tdp_mmu_age_gfn_range(kvm, range);
> +
> +	if (kvm_has_shadow_mmu_sptes(kvm)) {
>  		write_lock(&kvm->mmu_lock);
>  		young = kvm_handle_gfn_range(kvm, range, kvm_age_rmap);
>  		write_unlock(&kvm->mmu_lock);
>  	}
>  
> -	if (tdp_mmu_enabled)
> -		young |= kvm_tdp_mmu_age_gfn_range(kvm, range);
> -
>  	return young;
>  }
>  
> @@ -1649,15 +1654,15 @@ bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
>  {
>  	bool young = false;
>  
> -	if (kvm_memslots_have_rmaps(kvm)) {
> +	if (tdp_mmu_enabled)
> +		young |= kvm_tdp_mmu_test_age_gfn(kvm, range);
> +
> +	if (!young && kvm_has_shadow_mmu_sptes(kvm)) {

nit: A short comment here might be helpful to explain why young is
checked.

>  		write_lock(&kvm->mmu_lock);
>  		young = kvm_handle_gfn_range(kvm, range, kvm_test_age_rmap);
>  		write_unlock(&kvm->mmu_lock);
>  	}
>  
> -	if (tdp_mmu_enabled)
> -		young |= kvm_tdp_mmu_test_age_gfn(kvm, range);
> -
>  	return young;
>  }
>  
> -- 
> 2.46.0.rc1.232.g9752f9e123-goog
> 

