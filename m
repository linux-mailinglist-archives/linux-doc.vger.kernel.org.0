Return-Path: <linux-doc+bounces-37611-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC84AA2F76F
	for <lists+linux-doc@lfdr.de>; Mon, 10 Feb 2025 19:41:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 486901622BE
	for <lists+linux-doc@lfdr.de>; Mon, 10 Feb 2025 18:41:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BAA325A2C5;
	Mon, 10 Feb 2025 18:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SHqJlH/I"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6277543AA1
	for <linux-doc@vger.kernel.org>; Mon, 10 Feb 2025 18:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739212865; cv=none; b=IoJmEjop5A+kiNT6SDC1gJibx3lWIH8zJz/0cZOQ0r4QuFj9T2RT9cdTpudoZ7CQtNsykRDsKS5DPZP2XBK/TyVN4ZIZBNgUakT7hJuQnPzE8vwsluZYphiLTiENLnbI6JYh26IrR1ILUUC1IOACAJhvriOjdEXyoN7xGHwQhdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739212865; c=relaxed/simple;
	bh=RiumRp+8jT3r88kVofJLy7fpR5zAXNhnYTLlo61sQv0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H/mLuw94jd12A2E1GX97LYcjIaR6K3WLyvfs9qWt0KLCNyHgyN0/qUDSAqIzf4QzTbytyX65UsRfOxKQmtTWpQcJglbUXor+GLDZjCi6cRTsJgZ1Zi83ReG5/0R88c2usD6YVud8tZsEhwwQjpOrrqME4kUgNVvZ6J7LSrKNJKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SHqJlH/I; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739212862;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=g1KV9WSg/lyUU/31KD2wiBY4CVQnFn2Ocr7fjoXlBPA=;
	b=SHqJlH/I0s93cqBdCHvhtWrVbcz8fAEv8Q3Uqcm6Kio6XlHaMrG/Lq4suM5Ey7TnMKpnDQ
	fOvyNb8syIDiGjWsad+9ytXbgwSJL1uG65xiRqmmqRVK3fbXsxSvmNx54YsDxqSmtDV96m
	rcC/UV3IpIHwfaNWGgwMy3M/VhIHTNI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-213-ihqeFdWCOfaVDhgHj87Qhw-1; Mon, 10 Feb 2025 13:41:00 -0500
X-MC-Unique: ihqeFdWCOfaVDhgHj87Qhw-1
X-Mimecast-MFC-AGG-ID: ihqeFdWCOfaVDhgHj87Qhw
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-38ddee8329eso689754f8f.1
        for <linux-doc@vger.kernel.org>; Mon, 10 Feb 2025 10:41:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739212859; x=1739817659;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=g1KV9WSg/lyUU/31KD2wiBY4CVQnFn2Ocr7fjoXlBPA=;
        b=kvkX/k32WBrtuwZJKwnFjtPr3uya6jREeMYvIwdGDoxbkBtgd/PHKYNopHOzpihZF1
         l5/lHOxX2rLs2dL+ypi8lcYCs+tth5tG7UQb974l5o0MtAeO6KXLu72dIp1zyY4Fclyb
         L7paR+Z2kvZ6/BaStzs/qtkdO/cKNVFtpaBGwKJEDBjjdKijEcUTRwfWnq/WgA+gifCf
         aONfokckbE8UXKrgoCXzqRChNHDeEWobK33q6f+l5Gj/hFnn+K82CY6D2P0Zr3HbpnZ2
         83JFyiOg1xbaTdAmX9x0SoL/6reR74NNRfDdRZCpfW6Nj/6sg4+t4z0fL0fBVVNqfOb3
         uOnA==
X-Forwarded-Encrypted: i=1; AJvYcCUlL94Z1691stdofAKgq3Wum4YBjMzQZq3e4M11u4PuQ8587hrnCi15HnOmTQKDfQ+qc1no4cBKGoo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjK9aknV/p9BnfiE38x/Bu4P0c+ZU51WJpDyGGJtSltkojqdGC
	d1ema14HdLkof/BmsW2Z4F3JraEE4ceCwWGRHv6hwumzJ3uaXqiAr8fkudtzDFIv+nTXRpzkKtJ
	Qq5PSRF0mCzoFh6DcDStMAKJ98HnaCA9zRnt6gVkZ+o06qRdJ4B/7Dygw1A==
X-Gm-Gg: ASbGncuKbXoVAzuVJ0xF1BGU+A4u/oqN/aAnwi+b1RmcAlksfVY17etRkMRmmBAGMlC
	rlMmhaMEPOg1185X7YIlEiQkMrOpOuEnmQgD/ThKvpHlVBU/AZeRWP8GIMSRNqjZjl7Y4lPuMOJ
	okXkcOaxGJJAXA4zsZ77JWUHBOZ94x+sdUb/8MUYcA3crNeJspV9ZqvBCleXYkJYoI1RnM3BUti
	bp7TN9ZBIFNUmySgQ4i0ocbr8payWf1Toi38fu8jKu1amULLRnP2z0MOEzMzXcqsTti+JCY8VPV
	4s+5MwVy3LuvBumAAg5A9pRDmiGYIZVfD2qM9J1wc6pM+/dFO1oOuOP4ODNPNu1Wzw0kYvU4i2b
	S6HeePhddSmYjIpKytpkbuz9ik/ZJBcVU
X-Received: by 2002:a05:6000:4023:b0:38d:e420:3984 with SMTP id ffacd0b85a97d-38de4203c6fmr720454f8f.39.1739212859652;
        Mon, 10 Feb 2025 10:40:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHGdyRFSrPW6CDaatY3A9b5Pbjiq+vqKKBwRSMaTLmNlwLMqalsMGCRptdeQalX+PBAO6tSww==
X-Received: by 2002:a05:6000:4023:b0:38d:e420:3984 with SMTP id ffacd0b85a97d-38de4203c6fmr720406f8f.39.1739212859214;
        Mon, 10 Feb 2025 10:40:59 -0800 (PST)
Received: from ?IPV6:2003:cb:c734:b800:12c4:65cd:348a:aee6? (p200300cbc734b80012c465cd348aaee6.dip0.t-ipconnect.de. [2003:cb:c734:b800:12c4:65cd:348a:aee6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439471bf782sm28276465e9.39.2025.02.10.10.40.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 10:40:58 -0800 (PST)
Message-ID: <0c8640f5-2a80-45ff-a922-476a5fd5f82d@redhat.com>
Date: Mon, 10 Feb 2025 19:40:56 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 13/20] mm/memory: Add vmf_insert_page_mkwrite()
To: Alistair Popple <apopple@nvidia.com>, akpm@linux-foundation.org,
 dan.j.williams@intel.com, linux-mm@kvack.org
Cc: Alison Schofield <alison.schofield@intel.com>, lina@asahilina.net,
 zhang.lyra@gmail.com, gerald.schaefer@linux.ibm.com,
 vishal.l.verma@intel.com, dave.jiang@intel.com, logang@deltatee.com,
 bhelgaas@google.com, jack@suse.cz, jgg@ziepe.ca, catalin.marinas@arm.com,
 will@kernel.org, mpe@ellerman.id.au, npiggin@gmail.com,
 dave.hansen@linux.intel.com, ira.weiny@intel.com, willy@infradead.org,
 djwong@kernel.org, tytso@mit.edu, linmiaohe@huawei.com, peterx@redhat.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 nvdimm@lists.linux.dev, linux-cxl@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
 david@fromorbit.com, chenhuacai@kernel.org, kernel@xen0n.name,
 loongarch@lists.linux.dev
References: <cover.472dfc700f28c65ecad7591096a1dc7878ff6172.1738709036.git-series.apopple@nvidia.com>
 <e98b7e6bed4c1c63feac7b907439168388ecc9fd.1738709036.git-series.apopple@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <e98b7e6bed4c1c63feac7b907439168388ecc9fd.1738709036.git-series.apopple@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04.02.25 23:48, Alistair Popple wrote:
> Currently to map a DAX page the DAX driver calls vmf_insert_pfn. This
> creates a special devmap PTE entry for the pfn but does not take a
> reference on the underlying struct page for the mapping. This is
> because DAX page refcounts are treated specially, as indicated by the
> presence of a devmap entry.
> 
> To allow DAX page refcounts to be managed the same as normal page
> refcounts introduce vmf_insert_page_mkwrite(). This will take a
> reference on the underlying page much the same as vmf_insert_page,
> except it also permits upgrading an existing mapping to be writable if
> requested/possible.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> 
> ---
> 
> Changes for v7:
>   - Fix vmf_insert_page_mkwrite by removing pfn gunk as suggested by
>     David.
> 
> Updates from v2:
> 
>   - Rename function to make not DAX specific
> 
>   - Split the insert_page_into_pte_locked() change into a separate
>     patch.
> 
> Updates from v1:
> 
>   - Re-arrange code in insert_page_into_pte_locked() based on comments
>     from Jan Kara.
> 
>   - Call mkdrity/mkyoung for the mkwrite case, also suggested by Jan.
> ---
>   include/linux/mm.h |  2 ++
>   mm/memory.c        | 21 +++++++++++++++++++++
>   2 files changed, 23 insertions(+)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 7b1068d..6567ece 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -3544,6 +3544,8 @@ int vm_map_pages(struct vm_area_struct *vma, struct page **pages,
>   				unsigned long num);
>   int vm_map_pages_zero(struct vm_area_struct *vma, struct page **pages,
>   				unsigned long num);
> +vm_fault_t vmf_insert_page_mkwrite(struct vm_fault *vmf, struct page *page,
> +			bool write);
>   vm_fault_t vmf_insert_pfn(struct vm_area_struct *vma, unsigned long addr,
>   			unsigned long pfn);
>   vm_fault_t vmf_insert_pfn_prot(struct vm_area_struct *vma, unsigned long addr,
> diff --git a/mm/memory.c b/mm/memory.c
> index 41befd9..b88b488 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -2622,6 +2622,27 @@ static vm_fault_t __vm_insert_mixed(struct vm_area_struct *vma,
>   	return VM_FAULT_NOPAGE;
>   }
>   
> +vm_fault_t vmf_insert_page_mkwrite(struct vm_fault *vmf, struct page *page,
> +			bool write)
> +{
> +	struct vm_area_struct *vma = vmf->vma;
> +	pgprot_t pgprot = vma->vm_page_prot;

Probably could have avoided that temp without harming readability

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb


