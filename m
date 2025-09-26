Return-Path: <linux-doc+bounces-61926-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADE7BA4498
	for <lists+linux-doc@lfdr.de>; Fri, 26 Sep 2025 16:50:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4102762328F
	for <lists+linux-doc@lfdr.de>; Fri, 26 Sep 2025 14:50:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC731199FBA;
	Fri, 26 Sep 2025 14:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dRaSQ30J"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C89D38DE1
	for <linux-doc@vger.kernel.org>; Fri, 26 Sep 2025 14:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758898206; cv=none; b=dq1XQT1K/kcOz3RxMUKcYlTmMiPdWPgkSQvHCvWc5HLdTkqpwt2Pd/mHdLBGrBlv3Tm8m4R42iauRj9csY/NxwHyAXBaHwLYUI63zLLRkarIWgNnBWn+N/TXIGSzbGk14SyzBGHnaeRTir1ypnCcCfIbymCuyHCdAUJI6w168qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758898206; c=relaxed/simple;
	bh=mAp6hBqDCs2MKWcF4MmvTFP9FlAkYa94+ms1Sj43PtQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HM2zfV365G4FMp58al+Sskmfign9cvYoAzVQCw2fL2OfWKDUFX5CzDvIBZ9PLv6sVOmTSubxUsY8h0KY75QaIdgyF47sEA5HZ0GpgjT/qCX/lDnqa9naa0HrmvkW6lnLAxKG9mC5dRTPB8McRorYtnAD6fvoP7kOW0IV7RPdAPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dRaSQ30J; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-46e30ef74b0so16499475e9.0
        for <linux-doc@vger.kernel.org>; Fri, 26 Sep 2025 07:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758898203; x=1759503003; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LfW+9l2SULTf/PnftEI2v39jut/0ik4R4e6yFkbRBVU=;
        b=dRaSQ30JIKiGuUTEXvOWBLU6n5UnDidU8xpvQz1LGmYkrlP+GvIdZO5JFVhnT7RYya
         DMlS3Xbf+Yi0//NcdGNqRIZuRfDEr1ib7k500JwUjtBQhdfWnLnf8lnWY7p2Oo5yl/wf
         fb46QdzXGQIctDmaJ4oVzG5sW4DJT9ILIBTMND8NEjY+kanOOtdU6mtzZLEHpboNfsrx
         n0cQJJdigp8EeEo1Mml81KQc5UQp4MyHzmhhK58zn6wKzj7M9+He8hsA0NdWkp7LH1wM
         TSEp13nzn9OlgWM2vx/h5tEsBU91sP76f3ZMb6SYgh6xoBP60nJq7a8oDwFSy57MjsSf
         aRHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758898203; x=1759503003;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LfW+9l2SULTf/PnftEI2v39jut/0ik4R4e6yFkbRBVU=;
        b=lu3/MluIw9Ylr3XHWkIGzjq+DGkmKj/mvmLSQwksb6qo60PGmmCiQ9jtNKgloEcKR5
         iJ9nMkhsH4NohwcRV4SaArHnKg9fkrGykzkckjINVUvlJjvx458TFCKC771bUNhSCSCG
         S/3ZEUkl9ICFeByjdcka6uI/1YI+2VZUxEHs9UDUBBV3PIFhjZRfTiGWXTAfbEN+MPJj
         cYvKPd3QKZF/wPTQfjR+xPi09+KT7IGcYjfxXPvYUkPuPJpwACePoKqo7rsKrEwibLVE
         VXozyXrLPU1HCpZmT60VMgAfJGSZVfx68xGRmIpbtkbEJ2T5c49rNmY1AYUKgJzrX3oF
         cUhA==
X-Forwarded-Encrypted: i=1; AJvYcCWL9dfS85n2YEzSehFj3qYWh1vMiWOI5k8G4UnkxftPT5NiFn1Q2/JTkCHkELGe7LW9ZECMUTL9X0M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKMO5hJdLNn8QV9jOW22fWe/V8OBuTYSHxyYjx42WmbXGgJdKi
	InbPokn5lYR4f147swcutP3xw55i+nV1g/EURjmq6aCC9iLPya7SOyY5
X-Gm-Gg: ASbGncsQohTgZapmSXOov9Rkn/tkpD3BNpmupkwm4QlC3nFpYwGEgtfMKQNBnLDBedh
	TGrVACTkr3QcLREiS+IbWFsdMhG629D0E42YKBk4hR3q0hu695jdIgiA5K+BjJzB2nzPeZVu7fx
	aKK2dpv7W/Q/DXTs8HECrnMOqrAC3hqZzuy9lK78uKTJ5NawOnhDkWfrupo7TaDpXNks1ymJLRN
	OESRd+MZ8hNAL+qZpEeAifM949Dww3QZfLEx9gJJMnh3ly+L9on8ZCvr23tFK4C0MiHhJcY/BCd
	eHmLXzd0+DnrAEBPvlAwA8MSHqe3ZG7Xfl6lFFWMz1gQUB3X3Kcjgth1UOl8ncoRFSajhR7G99z
	ku46OXyazMCchVYnNCurrHx8DpeNyIgzLJerZwZ+uaYXz1PGiY3YAJuuFERF1cN8xOOvza+Ejr7
	tXkz1TzaaAtKiynEmEli/9ii7gJwkSLYZqgQ==
X-Google-Smtp-Source: AGHT+IGRnafcH0soxzxg3eb9QKsI4SDpey1Eua5rAJCC4vB8nwuidScxQ4sm/5KgvJbQ9NySWjYQ2Q==
X-Received: by 2002:a05:6000:2907:b0:401:41a9:524f with SMTP id ffacd0b85a97d-40e4adce99dmr6532292f8f.29.1758898202610;
        Fri, 26 Sep 2025 07:50:02 -0700 (PDT)
Received: from ?IPV6:2a02:6b6f:e750:1b00:1cfc:9209:4810:3ae5? ([2a02:6b6f:e750:1b00:1cfc:9209:4810:3ae5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fb7203b8asm7487419f8f.9.2025.09.26.07.50.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 07:50:01 -0700 (PDT)
Message-ID: <146b95bd-e0f0-4e6b-a9fa-5a8f11355268@gmail.com>
Date: Fri, 26 Sep 2025 15:49:59 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 mm-new 02/12] mm: thp: remove vm_flags parameter from
 khugepaged_enter_vma()
Content-Language: en-GB
To: Yafang Shao <laoar.shao@gmail.com>, akpm@linux-foundation.org,
 david@redhat.com, ziy@nvidia.com, baolin.wang@linux.alibaba.com,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, dev.jain@arm.com, hannes@cmpxchg.org,
 gutierrez.asier@huawei-partners.com, willy@infradead.org, ast@kernel.org,
 daniel@iogearbox.net, andrii@kernel.org, ameryhung@gmail.com,
 rientjes@google.com, corbet@lwn.net, 21cnbao@gmail.com,
 shakeel.butt@linux.dev, tj@kernel.org, lance.yang@linux.dev
Cc: bpf@vger.kernel.org, linux-mm@kvack.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yang Shi <shy828301@gmail.com>
References: <20250926093343.1000-1-laoar.shao@gmail.com>
 <20250926093343.1000-3-laoar.shao@gmail.com>
From: Usama Arif <usamaarif642@gmail.com>
In-Reply-To: <20250926093343.1000-3-laoar.shao@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 26/09/2025 10:33, Yafang Shao wrote:
> The khugepaged_enter_vma() function requires handling in two specific
> scenarios:
> 1. New VMA creation
>   When a new VMA is created, if vma->vm_mm is not present in
>   khugepaged_mm_slot, it must be added. In this case,
>   khugepaged_enter_vma() is called after vma->vm_flags have been set,
>   allowing direct use of the VMA's flags.
> 2. VMA flag modification
>   When vma->vm_flags are modified (particularly when VM_HUGEPAGE is set),
>   the system must recheck whether to add vma->vm_mm to khugepaged_mm_slot.
>   Currently, khugepaged_enter_vma() is called before the flag update, so
>   the call must be relocated to occur after vma->vm_flags have been set.
> 
> Additionally, khugepaged_enter_vma() is invoked in other contexts, such as
> during VMA merging. However, these calls are unnecessary because the
> existing VMA already ensures that vma->vm_mm is registered in
> khugepaged_mm_slot. While removing these redundant calls represents a
> potential optimization, that change should be addressed separately.
> Because VMA merging only occurs when the vm_flags of both VMAs are
> identical (excluding special flags like VM_SOFTDIRTY), we can safely use
> target->vm_flags instead.
> 

The patch looks good to me, but if we are sure that khugepaged_enter_vma
is not needed in VMA merging case, we should remove it in this patch itself.
If the reason we are removing what flags are being considered when calling
khugepaged_enter_vma in VMA merging case is because the calls are unnecessary,
then we should just remove the calls and not modify them
(if its safe and functionally correct :))

> After this change, we can further remove vm_flags parameter from
> thp_vma_allowable_order(). That will be handled in a followup patch.
> 
> Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
> Cc: Yang Shi <shy828301@gmail.com>
> ---
>  include/linux/khugepaged.h |  6 ++----
>  mm/huge_memory.c           |  2 +-
>  mm/khugepaged.c            | 11 ++---------
>  mm/madvise.c               |  7 +++++++
>  mm/vma.c                   |  6 +++---
>  5 files changed, 15 insertions(+), 17 deletions(-)
> 
> diff --git a/include/linux/khugepaged.h b/include/linux/khugepaged.h
> index f14680cd9854..b30814d3d665 100644
> --- a/include/linux/khugepaged.h
> +++ b/include/linux/khugepaged.h
> @@ -13,8 +13,7 @@ extern void khugepaged_destroy(void);
>  extern int start_stop_khugepaged(void);
>  extern void __khugepaged_enter(struct mm_struct *mm);
>  extern void __khugepaged_exit(struct mm_struct *mm);
> -extern void khugepaged_enter_vma(struct vm_area_struct *vma,
> -				 vm_flags_t vm_flags);
> +extern void khugepaged_enter_vma(struct vm_area_struct *vma);
>  extern void khugepaged_enter_mm(struct mm_struct *mm);
>  extern void khugepaged_min_free_kbytes_update(void);
>  extern bool current_is_khugepaged(void);
> @@ -39,8 +38,7 @@ static inline void khugepaged_fork(struct mm_struct *mm, struct mm_struct *oldmm
>  static inline void khugepaged_exit(struct mm_struct *mm)
>  {
>  }
> -static inline void khugepaged_enter_vma(struct vm_area_struct *vma,
> -					vm_flags_t vm_flags)
> +static inline void khugepaged_enter_vma(struct vm_area_struct *vma)
>  {
>  }
>  static inline void khugepaged_enter_mm(struct mm_struct *mm)
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 1b81680b4225..ac6601f30e65 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -1346,7 +1346,7 @@ vm_fault_t do_huge_pmd_anonymous_page(struct vm_fault *vmf)
>  	ret = vmf_anon_prepare(vmf);
>  	if (ret)
>  		return ret;
> -	khugepaged_enter_vma(vma, vma->vm_flags);
> +	khugepaged_enter_vma(vma);
>  
>  	if (!(vmf->flags & FAULT_FLAG_WRITE) &&
>  			!mm_forbids_zeropage(vma->vm_mm) &&
> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> index f47ac8c19447..04121ae7d18d 100644
> --- a/mm/khugepaged.c
> +++ b/mm/khugepaged.c
> @@ -353,12 +353,6 @@ int hugepage_madvise(struct vm_area_struct *vma,
>  #endif
>  		*vm_flags &= ~VM_NOHUGEPAGE;
>  		*vm_flags |= VM_HUGEPAGE;
> -		/*
> -		 * If the vma become good for khugepaged to scan,
> -		 * register it here without waiting a page fault that
> -		 * may not happen any time soon.
> -		 */
> -		khugepaged_enter_vma(vma, *vm_flags);
>  		break;
>  	case MADV_NOHUGEPAGE:
>  		*vm_flags &= ~VM_HUGEPAGE;
> @@ -467,10 +461,9 @@ void khugepaged_enter_mm(struct mm_struct *mm)
>  	__khugepaged_enter(mm);
>  }
>  
> -void khugepaged_enter_vma(struct vm_area_struct *vma,
> -			  vm_flags_t vm_flags)
> +void khugepaged_enter_vma(struct vm_area_struct *vma)
>  {
> -	if (!thp_vma_allowable_order(vma, vm_flags, TVA_KHUGEPAGED, PMD_ORDER))
> +	if (!thp_vma_allowable_order(vma, vma->vm_flags, TVA_KHUGEPAGED, PMD_ORDER))
>  		return;
>  
>  	khugepaged_enter_mm(vma->vm_mm);
> diff --git a/mm/madvise.c b/mm/madvise.c
> index 35ed4ab0d7c5..ab8b5d47badb 100644
> --- a/mm/madvise.c
> +++ b/mm/madvise.c
> @@ -1425,6 +1425,13 @@ static int madvise_vma_behavior(struct madvise_behavior *madv_behavior)
>  	VM_WARN_ON_ONCE(madv_behavior->lock_mode != MADVISE_MMAP_WRITE_LOCK);
>  
>  	error = madvise_update_vma(new_flags, madv_behavior);
> +	/*
> +	 * If the vma become good for khugepaged to scan,
> +	 * register it here without waiting a page fault that
> +	 * may not happen any time soon.
> +	 */
> +	if (!error && new_flags & VM_HUGEPAGE)
> +		khugepaged_enter_mm(vma->vm_mm);
>  out:
>  	/*
>  	 * madvise() returns EAGAIN if kernel resources, such as
> diff --git a/mm/vma.c b/mm/vma.c
> index a1ec405bda25..6a548b0d64cd 100644
> --- a/mm/vma.c
> +++ b/mm/vma.c
> @@ -973,7 +973,7 @@ static __must_check struct vm_area_struct *vma_merge_existing_range(
>  	if (err || commit_merge(vmg))
>  		goto abort;
>  
> -	khugepaged_enter_vma(vmg->target, vmg->vm_flags);
> +	khugepaged_enter_vma(vmg->target);
>  	vmg->state = VMA_MERGE_SUCCESS;
>  	return vmg->target;
>  
> @@ -1093,7 +1093,7 @@ struct vm_area_struct *vma_merge_new_range(struct vma_merge_struct *vmg)
>  	 * following VMA if we have VMAs on both sides.
>  	 */
>  	if (vmg->target && !vma_expand(vmg)) {
> -		khugepaged_enter_vma(vmg->target, vmg->vm_flags);
> +		khugepaged_enter_vma(vmg->target);
>  		vmg->state = VMA_MERGE_SUCCESS;
>  		return vmg->target;
>  	}
> @@ -2520,7 +2520,7 @@ static int __mmap_new_vma(struct mmap_state *map, struct vm_area_struct **vmap)
>  	 * call covers the non-merge case.
>  	 */
>  	if (!vma_is_anonymous(vma))
> -		khugepaged_enter_vma(vma, map->vm_flags);
> +		khugepaged_enter_vma(vma);
>  	*vmap = vma;
>  	return 0;
>  


