Return-Path: <linux-doc+bounces-21349-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C69D293C823
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jul 2024 20:08:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 823EF282CAA
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jul 2024 18:08:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9EE319E7F3;
	Thu, 25 Jul 2024 18:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FTjMrEPq"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB3E19E7EF
	for <linux-doc@vger.kernel.org>; Thu, 25 Jul 2024 18:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721930881; cv=none; b=tZD13Ud4WbqmDHukk6/19dAmaAQSlLU644eKVHhWXm7/hG0oCEkUvayoCCPG/jbHhTzKLAI5qzjs2es7d+BcE3OAYg1pA26XhhOB+tlYjZSqbPvuaQfMjQ4vWX3GR+pv30LuDSEDTR72F10qdOiq0Q27vpKLruRQsB552z2YWcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721930881; c=relaxed/simple;
	bh=Hqc5azVRbGUwAYmN2fQHG0YmRuwfvqYpwYq9g9X88dk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AkdRlguDAvwSx9BBPRN//ueEePd2/nHHf9F1/ur4DfvMXGEiM02hdDIEben76Ec7w+4lkFNiiSs0Smn236oqc8GXV4fyl6uo8oMCJmvgJXeqUpxdBKKHSkyFXKaOUcwyuU5serzZyKpCIUPld8180ZS7MwHok4b3bUvoMEKjVoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FTjMrEPq; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1fc5549788eso9357095ad.1
        for <linux-doc@vger.kernel.org>; Thu, 25 Jul 2024 11:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721930879; x=1722535679; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UUGaRPCQ3N3wWtHO14ZqED92UBSd1h87iBGfjwpcBN0=;
        b=FTjMrEPqVBzeDD6E4eR/N6vtbJ4X14DZ4q5z5caJdXwcUa5ey71VDOLdo4mGp9NGNe
         zh549dbw78yHHRvB2pTVQk4pjHIvP7jrbpHH832Sdu5OVpHytBfjHk7MnPuUEl41rWBX
         2VlGPLpXrIQV1cd/VvpQ0lW0QQSLOcpNkFhh6rSAMYFZGCpwQQBBmX/+Z5ejwFRv28Wk
         1PG4o/0Uoy8wLI15DHy2a2KIh+mmxZd+YxupjeUXIq0xJyJ4w5svR6RcS1ND5LdVSTmY
         tPZLN5PvWcY8IXMtJ9AtIk9WHusZ8I6zZNpIKmH6F9Qf4YK43UYqOvAh9QWzGKCKXlGb
         g+1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721930879; x=1722535679;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UUGaRPCQ3N3wWtHO14ZqED92UBSd1h87iBGfjwpcBN0=;
        b=fEWWyBbNY2UAFk6aNxStuCAzXF1ujpIKEBgwKhQsA1BaEePZYa9UeotdIbVoRgSiVF
         SmgGCrnFw07W/Gg5y2v/y6Cdc7tz5NE3R01z2kVfw3tivc6kr+1MUOG/ticYB6ao1VbM
         pLpN8SOthDEarWZsWRmVprmrxrbqcia9Dh9mJOujbxkVmNpL9rCI1Oyi3hZ3IgWsrWgF
         bH3UOm/jk7FJDMzRRoWcsfHuIFddborrkYNToVaoo/INkM8isLn1X6Lsf68VMCz/+ewU
         QtMNfveOHVyTQtIGjelDb0Or7djGb4HsSCpvv5h++YTJuvtWiMp74U0Pvym0YEneKlT4
         gsyQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/fX5+j8RP56spB3tJrsn+kri2GzA9NrACqjhEalD5tJfZD/0Yk5ZL/1dZRpxNQ1v4tAMtV+scbcZ04ymsGHOhZwMjNsWnUXSn
X-Gm-Message-State: AOJu0YwUnFawVBr0r/TVDGVS9qwTYGFeLU11ZFNMX7m68qRXsZFfqCby
	9zmKmEHdmWjv8tP46sOacXVP2ifrOgHkxEF9mn7d3NR2zNH/WCB7B3CVH9Voig==
X-Google-Smtp-Source: AGHT+IHI1A1tvfnC1v1eHXLnRKjVzRp5f2FjOQ5bxe8jqwJy1SWM+jZHo5hxZrA2PYuH6SKb8vBZaw==
X-Received: by 2002:a17:903:1c4:b0:1fc:2ee3:d46f with SMTP id d9443c01a7336-1fed90b6bd7mr34131415ad.11.1721930878977;
        Thu, 25 Jul 2024 11:07:58 -0700 (PDT)
Received: from google.com (61.139.125.34.bc.googleusercontent.com. [34.125.139.61])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7a9f9ec7acdsm1454827a12.66.2024.07.25.11.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 11:07:58 -0700 (PDT)
Date: Thu, 25 Jul 2024 11:07:53 -0700
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
Subject: Re: [PATCH v6 02/11] KVM: x86: Relax locking for kvm_test_age_gfn
 and kvm_age_gfn
Message-ID: <ZqKUefN3HgBQQkuA@google.com>
References: <20240724011037.3671523-1-jthoughton@google.com>
 <20240724011037.3671523-3-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240724011037.3671523-3-jthoughton@google.com>

On 2024-07-24 01:10 AM, James Houghton wrote:
> Walk the TDP MMU in an RCU read-side critical section. This requires a
> way to do RCU-safe walking of the tdp_mmu_roots; do this with a new
> macro. The PTE modifications are now done atomically, and
> kvm_tdp_mmu_spte_need_atomic_write() has been updated to account for the
> fact that kvm_age_gfn can now lockless update the accessed bit and the
> R/X bits).
> 
> If the cmpxchg for marking the spte for access tracking fails, we simply
> retry if the spte is still a leaf PTE. If it isn't, we return false
> to continue the walk.
> 
> Harvesting age information from the shadow MMU is still done while
> holding the MMU write lock.
> 
> Suggested-by: Yu Zhao <yuzhao@google.com>
> Signed-off-by: James Houghton <jthoughton@google.com>

Aside from the comment fixes below,

Reviewed-by: David Matlack <dmatlack@google.com>

> ---
>  arch/x86/include/asm/kvm_host.h |  1 +
>  arch/x86/kvm/Kconfig            |  1 +
>  arch/x86/kvm/mmu/mmu.c          | 10 ++++-
>  arch/x86/kvm/mmu/tdp_iter.h     | 27 +++++++------
>  arch/x86/kvm/mmu/tdp_mmu.c      | 67 +++++++++++++++++++++++++--------
>  5 files changed, 77 insertions(+), 29 deletions(-)
> 
[...]
> --- a/arch/x86/kvm/mmu/tdp_iter.h
> +++ b/arch/x86/kvm/mmu/tdp_iter.h
> @@ -25,6 +25,13 @@ static inline u64 kvm_tdp_mmu_write_spte_atomic(tdp_ptep_t sptep, u64 new_spte)
>  	return xchg(rcu_dereference(sptep), new_spte);
>  }
>  
> +static inline u64 tdp_mmu_clear_spte_bits_atomic(tdp_ptep_t sptep, u64 mask)
> +{
> +	atomic64_t *sptep_atomic = (atomic64_t *)rcu_dereference(sptep);
> +
> +	return (u64)atomic64_fetch_and(~mask, sptep_atomic);
> +}
> +
>  static inline void __kvm_tdp_mmu_write_spte(tdp_ptep_t sptep, u64 new_spte)
>  {
>  	KVM_MMU_WARN_ON(is_ept_ve_possible(new_spte));
> @@ -32,10 +39,11 @@ static inline void __kvm_tdp_mmu_write_spte(tdp_ptep_t sptep, u64 new_spte)
>  }
>  
>  /*
> - * SPTEs must be modified atomically if they are shadow-present, leaf
> - * SPTEs, and have volatile bits, i.e. has bits that can be set outside
> - * of mmu_lock.  The Writable bit can be set by KVM's fast page fault
> - * handler, and Accessed and Dirty bits can be set by the CPU.
> + * SPTEs must be modified atomically if they have bits that can be set outside
> + * of the mmu_lock. This can happen for any shadow-present leaf SPTEs, as the
> + * Writable bit can be set by KVM's fast page fault handler, the Accessed and
> + * Dirty bits can be set by the CPU, and the Accessed and R/X bits can be

"R/X bits" should be "W/R/X bits".

> + * cleared by age_gfn_range.

nit: "age_gfn_range()"


