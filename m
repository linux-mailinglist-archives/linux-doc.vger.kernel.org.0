Return-Path: <linux-doc+bounces-33519-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BBC9F99F0
	for <lists+linux-doc@lfdr.de>; Fri, 20 Dec 2024 20:05:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F97F1884759
	for <lists+linux-doc@lfdr.de>; Fri, 20 Dec 2024 19:01:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEADD21D5A8;
	Fri, 20 Dec 2024 19:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JgctmeK0"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17956199E8D
	for <linux-doc@vger.kernel.org>; Fri, 20 Dec 2024 19:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734721271; cv=none; b=Yzw2oUp/7M5FH53azxHhKsecSzRBpRelsAHaXSTlskPYYN/LUkoVXyL8ZckVmVasRIeqEoYzToW3ZUfMkXH0LSCOc734BWv/btrDHcm8u5GPmKL+3mV8LVxGIOV4Z7c8CA02bCqhlqIPR9FKTjieClMfLHX6nlkcV1C/TSE+zqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734721271; c=relaxed/simple;
	bh=v2z2UnhGQD/+iZO9DnypjMDvz4UjuwfFXHdKq5TOAoU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cv9ovdSIA48hHoq2lbhQWnEUqM+vg4769OvPC0cSspfEYeswFxDIkZ3MpXQ7ovo2ddDq7mvaJmxkSM0KzZ0zmhF2D9PLeO434tA+rxRykjc+Rsbk6+8vDwpkT0Mss1yDuaG086ZpyaP/GWpnVuzmkzMQy9It/+EeNTSv8yv9Oq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JgctmeK0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734721269;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ug2XIccF0/YqFCL6Bdhqogh1COfkkzUL+XNw1IcnJx8=;
	b=JgctmeK0h5hCK84WClPmHoD5CGaE34yotuDkcEheI111kpaTA3soUEaT1od2kgCtpvlgfL
	rFdRVZEz62hNF9wrmyM6dc6VXmuGEGf0vHPDm2DYKbsDqF5nJDvJjpmAAFy4b/9QG2I1p/
	b9u8l9bCJG/J2Yv35cSJ6W+iErwZ1W0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-543-3-RZZM_RPyygHuLUfSbf_Q-1; Fri, 20 Dec 2024 14:01:07 -0500
X-MC-Unique: 3-RZZM_RPyygHuLUfSbf_Q-1
X-Mimecast-MFC-AGG-ID: 3-RZZM_RPyygHuLUfSbf_Q
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-385f0829430so1459156f8f.1
        for <linux-doc@vger.kernel.org>; Fri, 20 Dec 2024 11:01:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734721267; x=1735326067;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ug2XIccF0/YqFCL6Bdhqogh1COfkkzUL+XNw1IcnJx8=;
        b=TkLoJeatCv2KnbFUYhy83V/7Z2q1iaNQhIleO1sDAhxqSH5TR19ORiZvLHRbQPSJ3S
         4xq5+Q6WxzHE7MshXsGpRPqeod2zttNXBI14mbPYUkL1R57aoxxeF8kIVA57K07xoyUD
         hSjH6MuOLqBAN9Oo2l9FhTKYbrCzsxDjm4QABAq92ScPAWeUW+mGyI6HIw6aXmZVQUXM
         s9UujTKCciOb2mOscwnOGUZcEdXh/JHcJq7sdrip9d8fldc25GqeRSGZVcQyHYR4QMrh
         dmLt6JNNAcYoxYA55uLS5TmVwWMprOgk8PKV9lRiv/dkxi5vXiMEm1bB2BjrDRGoNQYN
         QBdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZFbcGeD7clorDqj0qd1w23HU/XO8c+UTBpw8CnHwQ0tAhNRWYp/8b41MHXxFQVqc5073EH0nnHmA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDnSHZGvOq2C97RA8VNB7dQrQSx0r53FnOddOxpOMfmm1RNUBJ
	lLUbry4fVSfUZt36TDNAFij2b7TI7/VCauSOomA1DReeu5aoVOMNlL+umYbN1NSTsMh3gExdqtU
	DUK1e9bK1lfMvs19BaTY36NwKi/B76X0Cb/P1QZRp1ohoCmvoUnAxkdfNNA==
X-Gm-Gg: ASbGncszwZLledFZ94eNTfziJSHs/8vmzvcoLtGBG7z4IG7lv9+9O+CT0Y/kmgor8v+
	cjh9J5hF46wa+If5d4rbDhLU71kOKcd5dwY03cAKoTRS12M5l5cUqYvqw0qqJQREMuwImMD2Bfu
	yRGpfk4IkZNlti7+DQ3QyUu2yuEe83w4WIqDDHs8EnVG7pdxFVfH4Y7s4cK91dlo5GF0H4rFoLo
	vY/oXg9wo2utxnCC64GmPp1IKvhKRdRv0rC2VDgfIzIwLg7URvK6dJn6uH1r1oCozhVadWEn/VY
	ZaL3/hr+bNTXfysj75FcoEMUQsGBbrBgdhLX67PbINUby3KrQKvVZPLMA0xyWFxn/NJcmAWCwb3
	lEZf9tEQu
X-Received: by 2002:a5d:6d84:0:b0:382:46ea:113f with SMTP id ffacd0b85a97d-38a221e2799mr4695515f8f.10.1734721266504;
        Fri, 20 Dec 2024 11:01:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE509IM4SN9jE/jQGrc5Y1LN5lcHkipiJsCNaT3s/Oi8fyaGDIBaILpQ3fg+YFYHK3krJT9Yg==
X-Received: by 2002:a5d:6d84:0:b0:382:46ea:113f with SMTP id ffacd0b85a97d-38a221e2799mr4695410f8f.10.1734721265957;
        Fri, 20 Dec 2024 11:01:05 -0800 (PST)
Received: from ?IPV6:2003:cb:c708:9d00:edd9:835b:4bfb:2ce3? (p200300cbc7089d00edd9835b4bfb2ce3.dip0.t-ipconnect.de. [2003:cb:c708:9d00:edd9:835b:4bfb:2ce3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8b874asm4653683f8f.109.2024.12.20.11.01.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 11:01:05 -0800 (PST)
Message-ID: <d4d32e17-d8e2-4447-bd33-af41e89a528f@redhat.com>
Date: Fri, 20 Dec 2024 20:01:02 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/25] mm/memory: Enhance insert_page_into_pte_locked()
 to create writable mappings
To: Alistair Popple <apopple@nvidia.com>, akpm@linux-foundation.org,
 dan.j.williams@intel.com, linux-mm@kvack.org
Cc: lina@asahilina.net, zhang.lyra@gmail.com, gerald.schaefer@linux.ibm.com,
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
 david@fromorbit.com
References: <cover.18cbcff3638c6aacc051c44533ebc6c002bf2bd9.1734407924.git-series.apopple@nvidia.com>
 <25a23433cb70f0fe6af92042eb71e962fcbf092b.1734407924.git-series.apopple@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 xsFNBFXLn5EBEAC+zYvAFJxCBY9Tr1xZgcESmxVNI/0ffzE/ZQOiHJl6mGkmA1R7/uUpiCjJ
 dBrn+lhhOYjjNefFQou6478faXE6o2AhmebqT4KiQoUQFV4R7y1KMEKoSyy8hQaK1umALTdL
 QZLQMzNE74ap+GDK0wnacPQFpcG1AE9RMq3aeErY5tujekBS32jfC/7AnH7I0v1v1TbbK3Gp
 XNeiN4QroO+5qaSr0ID2sz5jtBLRb15RMre27E1ImpaIv2Jw8NJgW0k/D1RyKCwaTsgRdwuK
 Kx/Y91XuSBdz0uOyU/S8kM1+ag0wvsGlpBVxRR/xw/E8M7TEwuCZQArqqTCmkG6HGcXFT0V9
 PXFNNgV5jXMQRwU0O/ztJIQqsE5LsUomE//bLwzj9IVsaQpKDqW6TAPjcdBDPLHvriq7kGjt
 WhVhdl0qEYB8lkBEU7V2Yb+SYhmhpDrti9Fq1EsmhiHSkxJcGREoMK/63r9WLZYI3+4W2rAc
 UucZa4OT27U5ZISjNg3Ev0rxU5UH2/pT4wJCfxwocmqaRr6UYmrtZmND89X0KigoFD/XSeVv
 jwBRNjPAubK9/k5NoRrYqztM9W6sJqrH8+UWZ1Idd/DdmogJh0gNC0+N42Za9yBRURfIdKSb
 B3JfpUqcWwE7vUaYrHG1nw54pLUoPG6sAA7Mehl3nd4pZUALHwARAQABzSREYXZpZCBIaWxk
 ZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT7CwZgEEwEIAEICGwMGCwkIBwMCBhUIAgkKCwQW
 AgMBAh4BAheAAhkBFiEEG9nKrXNcTDpGDfzKTd4Q9wD/g1oFAl8Ox4kFCRKpKXgACgkQTd4Q
 9wD/g1oHcA//a6Tj7SBNjFNM1iNhWUo1lxAja0lpSodSnB2g4FCZ4R61SBR4l/psBL73xktp
 rDHrx4aSpwkRP6Epu6mLvhlfjmkRG4OynJ5HG1gfv7RJJfnUdUM1z5kdS8JBrOhMJS2c/gPf
 wv1TGRq2XdMPnfY2o0CxRqpcLkx4vBODvJGl2mQyJF/gPepdDfcT8/PY9BJ7FL6Hrq1gnAo4
 3Iv9qV0JiT2wmZciNyYQhmA1V6dyTRiQ4YAc31zOo2IM+xisPzeSHgw3ONY/XhYvfZ9r7W1l
 pNQdc2G+o4Di9NPFHQQhDw3YTRR1opJaTlRDzxYxzU6ZnUUBghxt9cwUWTpfCktkMZiPSDGd
 KgQBjnweV2jw9UOTxjb4LXqDjmSNkjDdQUOU69jGMUXgihvo4zhYcMX8F5gWdRtMR7DzW/YE
 BgVcyxNkMIXoY1aYj6npHYiNQesQlqjU6azjbH70/SXKM5tNRplgW8TNprMDuntdvV9wNkFs
 9TyM02V5aWxFfI42+aivc4KEw69SE9KXwC7FSf5wXzuTot97N9Phj/Z3+jx443jo2NR34XgF
 89cct7wJMjOF7bBefo0fPPZQuIma0Zym71cP61OP/i11ahNye6HGKfxGCOcs5wW9kRQEk8P9
 M/k2wt3mt/fCQnuP/mWutNPt95w9wSsUyATLmtNrwccz63XOwU0EVcufkQEQAOfX3n0g0fZz
 Bgm/S2zF/kxQKCEKP8ID+Vz8sy2GpDvveBq4H2Y34XWsT1zLJdvqPI4af4ZSMxuerWjXbVWb
 T6d4odQIG0fKx4F8NccDqbgHeZRNajXeeJ3R7gAzvWvQNLz4piHrO/B4tf8svmRBL0ZB5P5A
 2uhdwLU3NZuK22zpNn4is87BPWF8HhY0L5fafgDMOqnf4guJVJPYNPhUFzXUbPqOKOkL8ojk
 CXxkOFHAbjstSK5Ca3fKquY3rdX3DNo+EL7FvAiw1mUtS+5GeYE+RMnDCsVFm/C7kY8c2d0G
 NWkB9pJM5+mnIoFNxy7YBcldYATVeOHoY4LyaUWNnAvFYWp08dHWfZo9WCiJMuTfgtH9tc75
 7QanMVdPt6fDK8UUXIBLQ2TWr/sQKE9xtFuEmoQGlE1l6bGaDnnMLcYu+Asp3kDT0w4zYGsx
 5r6XQVRH4+5N6eHZiaeYtFOujp5n+pjBaQK7wUUjDilPQ5QMzIuCL4YjVoylWiBNknvQWBXS
 lQCWmavOT9sttGQXdPCC5ynI+1ymZC1ORZKANLnRAb0NH/UCzcsstw2TAkFnMEbo9Zu9w7Kv
 AxBQXWeXhJI9XQssfrf4Gusdqx8nPEpfOqCtbbwJMATbHyqLt7/oz/5deGuwxgb65pWIzufa
 N7eop7uh+6bezi+rugUI+w6DABEBAAHCwXwEGAEIACYCGwwWIQQb2cqtc1xMOkYN/MpN3hD3
 AP+DWgUCXw7HsgUJEqkpoQAKCRBN3hD3AP+DWrrpD/4qS3dyVRxDcDHIlmguXjC1Q5tZTwNB
 boaBTPHSy/Nksu0eY7x6HfQJ3xajVH32Ms6t1trDQmPx2iP5+7iDsb7OKAb5eOS8h+BEBDeq
 3ecsQDv0fFJOA9ag5O3LLNk+3x3q7e0uo06XMaY7UHS341ozXUUI7wC7iKfoUTv03iO9El5f
 XpNMx/YrIMduZ2+nd9Di7o5+KIwlb2mAB9sTNHdMrXesX8eBL6T9b+MZJk+mZuPxKNVfEQMQ
 a5SxUEADIPQTPNvBewdeI80yeOCrN+Zzwy/Mrx9EPeu59Y5vSJOx/z6OUImD/GhX7Xvkt3kq
 Er5KTrJz3++B6SH9pum9PuoE/k+nntJkNMmQpR4MCBaV/J9gIOPGodDKnjdng+mXliF3Ptu6
 3oxc2RCyGzTlxyMwuc2U5Q7KtUNTdDe8T0uE+9b8BLMVQDDfJjqY0VVqSUwImzTDLX9S4g/8
 kC4HRcclk8hpyhY2jKGluZO0awwTIMgVEzmTyBphDg/Gx7dZU1Xf8HFuE+UZ5UDHDTnwgv7E
 th6RC9+WrhDNspZ9fJjKWRbveQgUFCpe1sa77LAw+XFrKmBHXp9ZVIe90RMe2tRL06BGiRZr
 jPrnvUsUUsjRoRNJjKKA/REq+sAnhkNPPZ/NNMjaZ5b8Tovi8C0tmxiCHaQYqj7G2rgnT0kt
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <25a23433cb70f0fe6af92042eb71e962fcbf092b.1734407924.git-series.apopple@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17.12.24 06:12, Alistair Popple wrote:
> In preparation for using insert_page() for DAX, enhance
> insert_page_into_pte_locked() to handle establishing writable
> mappings.  Recall that DAX returns VM_FAULT_NOPAGE after installing a
> PTE which bypasses the typical set_pte_range() in finish_fault.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Suggested-by: Dan Williams <dan.j.williams@intel.com>
> 
> ---
> 
> Changes since v2:
> 
>   - New patch split out from "mm/memory: Add dax_insert_pfn"
> ---
>   mm/memory.c | 45 +++++++++++++++++++++++++++++++++++++--------
>   1 file changed, 37 insertions(+), 8 deletions(-)
> 
> diff --git a/mm/memory.c b/mm/memory.c
> index 06bb29e..cd82952 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -2126,19 +2126,47 @@ static int validate_page_before_insert(struct vm_area_struct *vma,
>   }
>   
>   static int insert_page_into_pte_locked(struct vm_area_struct *vma, pte_t *pte,
> -			unsigned long addr, struct page *page, pgprot_t prot)
> +				unsigned long addr, struct page *page,
> +				pgprot_t prot, bool mkwrite)
>   {
>   	struct folio *folio = page_folio(page);
> +	pte_t entry = ptep_get(pte);
>   	pte_t pteval;
>   
> -	if (!pte_none(ptep_get(pte)))
> -		return -EBUSY;
> +	if (!pte_none(entry)) {
> +		if (!mkwrite)
> +			return -EBUSY;
> +
> +		/*
> +		 * For read faults on private mappings the PFN passed in may not
> +		 * match the PFN we have mapped if the mapped PFN is a writeable
> +		 * COW page.  In the mkwrite case we are creating a writable PTE
> +		 * for a shared mapping and we expect the PFNs to match. If they
> +		 * don't match, we are likely racing with block allocation and
> +		 * mapping invalidation so just skip the update.
> +		 */

Would it make sense to instead have here

/* See insert_pfn(). */

But ...

> +		if (pte_pfn(entry) != page_to_pfn(page)) {
> +			WARN_ON_ONCE(!is_zero_pfn(pte_pfn(entry)));
> +			return -EFAULT;
> +		}
> +		entry = maybe_mkwrite(entry, vma);
> +		entry = pte_mkyoung(entry);
> +		if (ptep_set_access_flags(vma, addr, pte, entry, 1))
> +			update_mmu_cache(vma, addr, pte);

... I am not sure if we want the above at all. Someone inserted a page, 
which is refcounted + mapcounted already.

Now you ignore that and do like the second insertion "worked" ?

No, that feels wrong, I suspect you will run into refcount+mapcount issues.

If there is already something, inserting must fail IMHO. If you want to 
change something to upgrade write permissions, then a different 
interface should be used.

> +		return 0;
> +	}
> +
>   	/* Ok, finally just insert the thing.. */
>   	pteval = mk_pte(page, prot);
>   	if (unlikely(is_zero_folio(folio))) {
>   		pteval = pte_mkspecial(pteval);
>   	} else {
>   		folio_get(folio);
> +		entry = mk_pte(page, prot);
> +		if (mkwrite) {
> +			entry = pte_mkyoung(entry);
 > +			entry = maybe_mkwrite(pte_mkdirty(entry), vma);> +		}
>   		inc_mm_counter(vma->vm_mm, mm_counter_file(folio));
>   		folio_add_file_rmap_pte(folio, page, vma);
>   	}
> @@ -2147,7 +2175,7 @@ static int insert_page_into_pte_locked(struct vm_area_struct *vma, pte_t *pte,
>   }
>   
>   static int insert_page(struct vm_area_struct *vma, unsigned long addr,
> -			struct page *page, pgprot_t prot)
> +			struct page *page, pgprot_t prot, bool mkwrite)
>   {
>   	int retval;
>   	pte_t *pte;
> @@ -2160,7 +2188,8 @@ static int insert_page(struct vm_area_struct *vma, unsigned long addr,
>   	pte = get_locked_pte(vma->vm_mm, addr, &ptl);
>   	if (!pte)
>   		goto out;
> -	retval = insert_page_into_pte_locked(vma, pte, addr, page, prot);
> +	retval = insert_page_into_pte_locked(vma, pte, addr, page, prot,
> +					mkwrite);

Alignment looks odd. Likely you can also just put it into a single line.



-- 
Cheers,

David / dhildenb


