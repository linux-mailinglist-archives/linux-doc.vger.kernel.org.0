Return-Path: <linux-doc+bounces-61934-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C89BA4693
	for <lists+linux-doc@lfdr.de>; Fri, 26 Sep 2025 17:27:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3D7217B2EBC
	for <lists+linux-doc@lfdr.de>; Fri, 26 Sep 2025 15:26:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D067215F5C;
	Fri, 26 Sep 2025 15:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AAwreQpp"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22D81F5834
	for <linux-doc@vger.kernel.org>; Fri, 26 Sep 2025 15:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758900452; cv=none; b=WUc0cOQjkd/4rdQaJcP+hH0ez1I1qJW1+duxhl2rkcK54xU0qVxbHs7lMjM86mVktBDzoP5QJoWqUxHfrQLNDGWAxop/mCzEqJjucsSNcNqv93yk3GL+tcgzJMebwGyK6dU99Z65OuKqQfDTOEyI062Hzkl0eI+wDTNJvpD/61Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758900452; c=relaxed/simple;
	bh=EFF7ZH+s9DTZ+hcqjoggLDB6+P7HDFxvD9fIKBMwxVA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tMzrG5jLqiBCDgj91jidNpHwJa39KbeGRbCjpjlO8yz23RXIz19H6PZzMjFv0JFIXAAPW80pzWsLN92m66ZMcj2KJ/6WuvfLSvTous0XHWDa5elBlOlNT+09cnyyBgEtPDFckC1UhPmeM/lWe/rCSjSEsrhNT5hCucTFNAojt40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AAwreQpp; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3f2cf786abeso1652772f8f.3
        for <linux-doc@vger.kernel.org>; Fri, 26 Sep 2025 08:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758900448; x=1759505248; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+rHEB641cb2GdpF/5/rE3pgDEs3o5nOg8UBPvdo7xdA=;
        b=AAwreQppSC8v/gjs6m7zTPWaFU+8dzJNHZFqIio2dFvJNQrp1oH9Rk8GfgwxZVq7zB
         vWB86XJRJUeSLA8BDkfQzRZdoTiDIVyhcOfouUkExEdXPsYeUg1aTX4uvLw76jJtnRyk
         RphU6mf704jPk3YnV5L+HCzcO6e4obbDariWKlADCewic/duCwC+no9GbVAVK79a+HUU
         XxmHCqoEczgHjsa1S5162wQUA2pX8m/5yPPLMrWfMBdkQoddhi4VruR25lM8TKXRgz6D
         QV5tR4RW5eR/RksfUcAujxue1ln7Gihhg+h2PChrKF3SvrLJyvoP9hOCUpxOF3CNUC+5
         kjhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758900448; x=1759505248;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+rHEB641cb2GdpF/5/rE3pgDEs3o5nOg8UBPvdo7xdA=;
        b=GBoufb6mEXOK9RpGoihwMxelco3rI/Ee9OIhuaYxZTu0JxBkXHc+cNHqXKr7aPBGep
         aJ4It+CSb0rsRSFsMbWC1XL9tLUfPsyDaeNT2hcbCyN++cJkeore6BcnMzXSZuI7Xxma
         p7YJmk/+Ks5elq/Kb+3qrK8evp5gaPj1DBZ+1zzRJ1Y6wrHCChkXfvqs1HPSptaziEoB
         Kb5zG/zKEN7Y525Bp75fl0aWt2xXXHdFb8BDIDCUOwm/10yFHD/IDML8CFW4AWQHoAlt
         J8YKvbnuEXiYXD6ONbnkeb5zWTFxDxUbEhkpAaUR2TzkJvLdTnNAPRCmeWKCTCWyTqrs
         q4cw==
X-Forwarded-Encrypted: i=1; AJvYcCWkjAkLNFbaTEkBEl32DQSaqhOq1HtvhwmLJr3sNMylSKtOV2royHq0q81ffHLreAY3IWtqoyCZe3E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk6uI07s/OxUQBz2fo/AytNH4KBIBS80Noj8AyV0ONt8pG4nKg
	j3ZLr07enfK/gVvvDojYgvpC3zQHg9Z4c9ArLcWbz89XUqvshWJ+uR49
X-Gm-Gg: ASbGncsaQh2ayAJ+c5cTscnkbIomVLdtcVuDVs3HHjAHR30n9Rs9S5ObXNl+e9aBKBg
	FoMAvU0P2zrLwXi4g3UsW1UEXNqmoX9mEY/vTtKqjGsHeb/aAf8Ri3RSJXuho73QBNvpEQieVI0
	De/xQ/7LbbBKOSmBHZz6WmMWr4MZ4imsMY+jiZk9zNoaJsRhPkcTVm9ZvVdssAQIOZXMQ4/OvsU
	BO9ltmIwQPZr1I1XZOcQpWN1aYJWMJxyzOrZ03PvVqjLvIHHbjMPior52nThlTMzCdGUH4tGtRX
	XOt/lSN8SuBFnUL1TyTBudzFWP1GYINzVHCTmO/L6hA+94gw/x0t/MU5IsF/kl0e0h5Kt7BW4Oh
	Ik8DZNsdhSg+mft1fK0NWO1iaiveUysUXVKugH7rEbSq+osjBIrvJkwErvSQoVqnb/kmTGBXUe5
	yusRtWIJeF8+IWQ3wO43ZppkKK++I2AJwG283GBZA=
X-Google-Smtp-Source: AGHT+IHukc9PAc+ShA0a1/5BNvNstWVE/VpbllBdChFZdr1gLStyH3EQxZd0GUyYSjGKV5ErWMc6Vg==
X-Received: by 2002:a05:6000:240c:b0:3dc:1473:18bd with SMTP id ffacd0b85a97d-40e497c348dmr6881945f8f.3.1758900447759;
        Fri, 26 Sep 2025 08:27:27 -0700 (PDT)
Received: from ?IPV6:2a02:6b6f:e750:1b00:1cfc:9209:4810:3ae5? ([2a02:6b6f:e750:1b00:1cfc:9209:4810:3ae5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fb871d051sm7634404f8f.14.2025.09.26.08.27.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 08:27:26 -0700 (PDT)
Message-ID: <035a8839-c786-45b6-8458-87ac1c48f3bc@gmail.com>
Date: Fri, 26 Sep 2025 16:27:25 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 mm-new 06/12] mm: thp: enable THP allocation
 exclusively through khugepaged
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
 linux-kernel@vger.kernel.org
References: <20250926093343.1000-1-laoar.shao@gmail.com>
 <20250926093343.1000-7-laoar.shao@gmail.com>
From: Usama Arif <usamaarif642@gmail.com>
In-Reply-To: <20250926093343.1000-7-laoar.shao@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 26/09/2025 10:33, Yafang Shao wrote:
> khugepaged_enter_vma() ultimately invokes any attached BPF function with
> the TVA_KHUGEPAGED flag set when determining whether or not to enable
> khugepaged THP for a freshly faulted in VMA.
> 
> Currently, on fault, we invoke this in do_huge_pmd_anonymous_page(), as
> invoked by create_huge_pmd() and only when we have already checked to
> see if an allowable TVA_PAGEFAULT order is specified.
> 
> Since we might want to disallow THP on fault-in but allow it via
> khugepaged, we move things around so we always attempt to enter
> khugepaged upon fault.
> 
> This change is safe because:
> - the checks for thp_vma_allowable_order(TVA_KHUGEPAGED) and
>   thp_vma_allowable_order(TVA_PAGEFAULT) are functionally equivalent

hmm I dont think this is the case. __thp_vma_allowable_orders
deals with TVA_PAGEFAULT (in_pf) differently from TVA_KHUGEPAGED.

> - khugepaged operates at the MM level rather than per-VMA. The THP
>   allocation might fail during page faults due to transient conditions
>   (e.g., memory pressure), it is safe to add this MM to khugepaged for
>   subsequent defragmentation.
> 
> While we could also extend prctl() to utilize this new policy, such a
> change would require a uAPI modification to PR_SET_THP_DISABLE.
> 
> Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
> Acked-by: Lance Yang <lance.yang@linux.dev>
> ---
>  mm/huge_memory.c |  1 -
>  mm/memory.c      | 13 ++++++++-----
>  2 files changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 08372dfcb41a..2b155a734c78 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -1346,7 +1346,6 @@ vm_fault_t do_huge_pmd_anonymous_page(struct vm_fault *vmf)
>  	ret = vmf_anon_prepare(vmf);
>  	if (ret)
>  		return ret;
> -	khugepaged_enter_vma(vma);
>  
>  	if (!(vmf->flags & FAULT_FLAG_WRITE) &&
>  			!mm_forbids_zeropage(vma->vm_mm) &&
> diff --git a/mm/memory.c b/mm/memory.c
> index 58ea0f93f79e..64f91191ffff 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -6327,11 +6327,14 @@ static vm_fault_t __handle_mm_fault(struct vm_area_struct *vma,
>  	if (pud_trans_unstable(vmf.pud))
>  		goto retry_pud;
>  
> -	if (pmd_none(*vmf.pmd) &&
> -	    thp_vma_allowable_order(vma, TVA_PAGEFAULT, PMD_ORDER)) {
> -		ret = create_huge_pmd(&vmf);
> -		if (!(ret & VM_FAULT_FALLBACK))
> -			return ret;
> +	if (pmd_none(*vmf.pmd)) {
> +		if (vma_is_anonymous(vma))
> +			khugepaged_enter_vma(vma);
> +		if (thp_vma_allowable_order(vma, TVA_PAGEFAULT, PMD_ORDER)) {
> +			ret = create_huge_pmd(&vmf);
> +			if (!(ret & VM_FAULT_FALLBACK))
> +				return ret;
> +		}
>  	} else {
>  		vmf.orig_pmd = pmdp_get_lockless(vmf.pmd);
>  


