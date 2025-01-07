Return-Path: <linux-doc+bounces-34167-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF48A03DB1
	for <lists+linux-doc@lfdr.de>; Tue,  7 Jan 2025 12:29:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9F5351886A6F
	for <lists+linux-doc@lfdr.de>; Tue,  7 Jan 2025 11:30:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72D741E377E;
	Tue,  7 Jan 2025 11:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="L2PxUMFp"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF3217C9E8
	for <linux-doc@vger.kernel.org>; Tue,  7 Jan 2025 11:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736249391; cv=none; b=Dho2vshyE56iSUHsdLxRhmfi0bJ1Ave7E8PGfbVXtSN0KgtgXha9J92nJZ4ZKOp/O4UKApGL3IdR+IM52p9fKRUtA34C2rsXhJBA6+lm4IWmz7yz8T3kFNuYM3yN7ZXKtyQbSrUJRXy4tu8rC28f5E1lMkwAykwjj8fDE2Ntw+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736249391; c=relaxed/simple;
	bh=UUKH+3f7te6b8Lcca0m/RZwQdYdbtuMENEk9IWOoe1Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lUzepIt5Rp/hP0IaUsFFgdwzn9J7tfHyvTBm5jDxQvKrOb50u+wlcixZKSjkrKCLgYkWu+vSVx/7GRPeER6+Ki+ixEUwByh4yDLxlf/L0XvpsR4BKYirqwWxwTNoRkj3yhZ3J9vQtkJc5F9Ffs/UXRahPKlLr7RWu4boAy2e/8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=L2PxUMFp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736249386;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=dT6jaGzM8ONtg5YiCq4PRzv+lHLx9HZ9naYINeLLcq4=;
	b=L2PxUMFpoNxd6WOAT4mqXwr6PtvHCmEsleESDwiRR6ddc0rzRDzMLddtWP/SumJOhmqROm
	00Y7AxQt9qWnTY9um2qiOcNdrOIOACv8mlrDqptzYaxTjAaOSednVCbkv7RGZQjEfVn0Ap
	0q90OqXCh/XI5lUqAKtFf7i68NncsN4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-546-5NZ9XEEMOoKkouoeqWZhNg-1; Tue, 07 Jan 2025 06:29:45 -0500
X-MC-Unique: 5NZ9XEEMOoKkouoeqWZhNg-1
X-Mimecast-MFC-AGG-ID: 5NZ9XEEMOoKkouoeqWZhNg
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43626224274so46778755e9.0
        for <linux-doc@vger.kernel.org>; Tue, 07 Jan 2025 03:29:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736249384; x=1736854184;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dT6jaGzM8ONtg5YiCq4PRzv+lHLx9HZ9naYINeLLcq4=;
        b=jLw2tkvv+cTQSL2FU5A4DyRwnIHggyUKiRsms79ZxPx+AwlNe415Vu0BIZxI4R3fJp
         at+eSUtQcYp0DWYOBSdBtTYftVCgKzQUmXQo6+CPcELrdzr61BeVwYKwYRf5eDQkl9uv
         r4H3ecsDMfXsyjKYZ0T5OXU+EkkiRFgdf5f/55+SNvPFAe5j0C0wBHQlWzMvJW6YsU92
         q8Fe0ZQMcOkYsiXcULjiNNCkKuyWbDan/CiQADOC9uBL2PNo8oFMWg6SFMbX1Fzh1VyN
         7E0N8klDnSsJv+jimTnBLH95eal2Vzw7t05t3TV02rBkMF9MnnRjxyE3dxF8dG7Ho1Rn
         4FWA==
X-Forwarded-Encrypted: i=1; AJvYcCVEDt5HmyMo4ROVZj3QMp+LT8tHeHoShf1AqQP0eSegefkKjEeHXkPcDHXVjlp529dSqeBRiE3uWvI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzllW61e22lSBuJvGfxgo1kS4MeXzBWTXCrz7jj9ZaDDutsJ7HL
	1UOO2AVhnbEwRwWttnlouw68+qvFi4eZsUih12hvmavQwgRQa4ApcX1OeR4FjgEUOxOkX9gQ4Us
	F4kHiDxsdBwLBQ1GIUmPAzWy1fP5PZ6Xkm5YPLoI2qAa6Mm39aNMVAf/FkQ==
X-Gm-Gg: ASbGnctppWCifm4gf0Gbuxx0GMHoUFQn5+XWi9Rl6dM5KNrQJqwR0dvDEqQvDYaxmu1
	QLmedGIy78tIInlPG3VZXWDuJ9AyMGBLItT/7Hge/FXuSkODRc/xRWqpHbBWDLooF7WvyrpVUb8
	t3I2X+vvB8E2aOLe0hnNk987yVSDRKuws4Gkq7l3HJkqKiybNxtJtVQbNqzhbLpGmwUcwARa8uh
	l2yiilETUmsaritpVEv/YhWepeJJAhjcI/RweV4JiQe4IH5nj0lKqettxoW5uP5BjpMv/CSLyt8
	n+Rh1Hk9V8SiTapnpPwiNLqRcH0Ty2kcP99lXZMeRikf4PJHs3+VNHqV0RBNoqiBTP58K/gGHUK
	ukImaL3xp
X-Received: by 2002:a05:600c:45d2:b0:434:f7f0:1880 with SMTP id 5b1f17b1804b1-436cf562615mr96542645e9.32.1736249383790;
        Tue, 07 Jan 2025 03:29:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHJ3qnj0FFqFijLuXZ4Dwc22AX0w86kSYGeu3WGMLaEQBJgLzuIVM01ibBPmcl6KS6iZpaLSA==
X-Received: by 2002:a05:600c:45d2:b0:434:f7f0:1880 with SMTP id 5b1f17b1804b1-436cf562615mr96542315e9.32.1736249383367;
        Tue, 07 Jan 2025 03:29:43 -0800 (PST)
Received: from ?IPV6:2003:cb:c719:1700:56dc:6a88:b509:d3f3? (p200300cbc719170056dc6a88b509d3f3.dip0.t-ipconnect.de. [2003:cb:c719:1700:56dc:6a88:b509:d3f3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b3b214sm635741635e9.28.2025.01.07.03.29.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2025 03:29:42 -0800 (PST)
Message-ID: <35b64e41-b9b1-4fdb-af4f-1296602592ff@redhat.com>
Date: Tue, 7 Jan 2025 12:29:40 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/25] mm/memory: Enhance insert_page_into_pte_locked()
 to create writable mappings
To: Alistair Popple <apopple@nvidia.com>
Cc: akpm@linux-foundation.org, dan.j.williams@intel.com, linux-mm@kvack.org,
 lina@asahilina.net, zhang.lyra@gmail.com, gerald.schaefer@linux.ibm.com,
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
 <d4d32e17-d8e2-4447-bd33-af41e89a528f@redhat.com>
 <6254ce2c-4a47-4501-b518-dedaddcbf91a@redhat.com>
 <gjuqvidcpvzwqrwogeoygwnsbvlpa4fvsvaoq6rlfzcq4wxmh5@tdhz3f2fm4ga>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <gjuqvidcpvzwqrwogeoygwnsbvlpa4fvsvaoq6rlfzcq4wxmh5@tdhz3f2fm4ga>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06.01.25 03:07, Alistair Popple wrote:
> On Fri, Dec 20, 2024 at 08:06:48PM +0100, David Hildenbrand wrote:
>> On 20.12.24 20:01, David Hildenbrand wrote:
>>> On 17.12.24 06:12, Alistair Popple wrote:
>>>> In preparation for using insert_page() for DAX, enhance
>>>> insert_page_into_pte_locked() to handle establishing writable
>>>> mappings.  Recall that DAX returns VM_FAULT_NOPAGE after installing a
>>>> PTE which bypasses the typical set_pte_range() in finish_fault.
>>>>
>>>> Signed-off-by: Alistair Popple <apopple@nvidia.com>
>>>> Suggested-by: Dan Williams <dan.j.williams@intel.com>
>>>>
>>>> ---
>>>>
>>>> Changes since v2:
>>>>
>>>>     - New patch split out from "mm/memory: Add dax_insert_pfn"
>>>> ---
>>>>     mm/memory.c | 45 +++++++++++++++++++++++++++++++++++++--------
>>>>     1 file changed, 37 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/mm/memory.c b/mm/memory.c
>>>> index 06bb29e..cd82952 100644
>>>> --- a/mm/memory.c
>>>> +++ b/mm/memory.c
>>>> @@ -2126,19 +2126,47 @@ static int validate_page_before_insert(struct vm_area_struct *vma,
>>>>     }
>>>>     static int insert_page_into_pte_locked(struct vm_area_struct *vma, pte_t *pte,
>>>> -			unsigned long addr, struct page *page, pgprot_t prot)
>>>> +				unsigned long addr, struct page *page,
>>>> +				pgprot_t prot, bool mkwrite)
>>>>     {
>>>>     	struct folio *folio = page_folio(page);
>>>> +	pte_t entry = ptep_get(pte);
>>>>     	pte_t pteval;
>>>> -	if (!pte_none(ptep_get(pte)))
>>>> -		return -EBUSY;
>>>> +	if (!pte_none(entry)) {
>>>> +		if (!mkwrite)
>>>> +			return -EBUSY;
>>>> +
>>>> +		/*
>>>> +		 * For read faults on private mappings the PFN passed in may not
>>>> +		 * match the PFN we have mapped if the mapped PFN is a writeable
>>>> +		 * COW page.  In the mkwrite case we are creating a writable PTE
>>>> +		 * for a shared mapping and we expect the PFNs to match. If they
>>>> +		 * don't match, we are likely racing with block allocation and
>>>> +		 * mapping invalidation so just skip the update.
>>>> +		 */
>>>
>>> Would it make sense to instead have here
>>>
>>> /* See insert_pfn(). */
>>>
>>> But ...
>>>
>>>> +		if (pte_pfn(entry) != page_to_pfn(page)) {
>>>> +			WARN_ON_ONCE(!is_zero_pfn(pte_pfn(entry)));
>>>> +			return -EFAULT;
>>>> +		}
>>>> +		entry = maybe_mkwrite(entry, vma);
>>>> +		entry = pte_mkyoung(entry);
>>>> +		if (ptep_set_access_flags(vma, addr, pte, entry, 1))
>>>> +			update_mmu_cache(vma, addr, pte);
>>>
>>> ... I am not sure if we want the above at all. Someone inserted a page,
>>> which is refcounted + mapcounted already.
>>>
>>> Now you ignore that and do like the second insertion "worked" ?
>>>
>>> No, that feels wrong, I suspect you will run into refcount+mapcount issues.
>>>
>>> If there is already something, inserting must fail IMHO. If you want to
>>> change something to upgrade write permissions, then a different
>>> interface should be used.
>>
>> Ah, now I realize that the early exit saves you because we won't adjust the
>> refcount +mapcount.
> 
> Right.
>   
>> I still wonder if that really belongs in here, I would prefer to not play
>> such tricks to upgrade write permissions if possible.
> 
> As you have pointed out this was all inspired (ie. mostly copied)
> from the existing insert_pfn() implementation which is used from
> vmf_insert_mixed{_mkwrite}().
> 
> I agree a different interface to upgrade permissions would be nice. However
> it's tricky because in general callers of these functions (eg. FS DAX) aren't
> aware if the page is already mapped by a PTE/PMD. They only know a fault has
> occured and the faulting permissions.
> 
> This wouldn't be impossible to fix - the mm does provide vm_ops->page_mkwrite()
> for permission upgrades. The difficulty is that most filesystems that support
> FS DAX (ie. ext4, XFS) don't treat a vm_ops->page_mkwrite() call any differently
> from a vm_ops->fault() call due to write fault. Therefore the FS DAX code is
> unaware of whether or not this is a permission upgrade or initial writeable
> mapping of the page in the VMA.
> 
> A further issue in there is currently no vm_ops->huge_mkwrite() callback.
> 
> Obviously this could all be plumbed through the MM/FS layers, but that would
> require a separate patch series. Given the current implementation has no issues
> beyond the cosmetic I'd rather not delay this series any longer, especially as
> the cosmetic defect is largely pre-existing (vmf_insert_mixed{_mkwrite}() could
> have equally had a separate upgrade interface).

Fine with me, just stumbled over it an thought "that looks odd".

-- 
Cheers,

David / dhildenb


