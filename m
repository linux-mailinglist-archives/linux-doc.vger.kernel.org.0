Return-Path: <linux-doc+bounces-37614-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B40BDA2F7B5
	for <lists+linux-doc@lfdr.de>; Mon, 10 Feb 2025 19:46:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 08B63188ABF4
	for <lists+linux-doc@lfdr.de>; Mon, 10 Feb 2025 18:46:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D41D257443;
	Mon, 10 Feb 2025 18:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SVNbldM4"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19F92566EB
	for <linux-doc@vger.kernel.org>; Mon, 10 Feb 2025 18:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739213119; cv=none; b=VgVyTPJgghmutYGyVS78zy4AIhTZyth8whhLdKJtseqHWdDzEXY75SqrZJHR0I8Ncz/SfcUV/llWKD2guMX6phddbo77IzOpbTOhPLazfSmz0mwa++lwWQN4bmUYf8Iy5xz0W/AYv0X+xVjziLBavI/lbu1jB60LuPZhNNByEEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739213119; c=relaxed/simple;
	bh=zaU4bsQzGEUFJkkRyBDEFO5HRaR53OVXhrJKky23YWM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UpdLnE+NejB9nUChFShLxy8jZWqfpECWJ1xbeG7fxWNmzgZRTWN5o2WK2ISXGFF4IZQfwlO8PYMZccxDBb79tNMbFxiPC2PJH44Zd1lgN0xiN0NgYcH2j27jtWTGqWQZfvi2qrZi+N4JLswLAZfVnmyqtKWocSU4kdyIHhoKthU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SVNbldM4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739213115;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=KSceIq+QW6QfAQSxFrhFP3CSjeVr/8tSdt+enYDxg60=;
	b=SVNbldM4wwu/t97ErQfoCwqhA1QeLW3eHAr2WygoP9yu/5hBWAg8NddK7gL42wveboEou0
	NlBjNedXkuGBq3nuDKmAmo9lgER6FGbuc87x9msszrRS9TTki0kb9PyXkrn44vRmFKyZXh
	QppMZ3YQY9eUCbrPlaTEPs9ywlOg2Y0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-189-MCU50NZ6MiayBKtJR6YivQ-1; Mon, 10 Feb 2025 13:45:14 -0500
X-MC-Unique: MCU50NZ6MiayBKtJR6YivQ-1
X-Mimecast-MFC-AGG-ID: MCU50NZ6MiayBKtJR6YivQ
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43943bd1409so9386925e9.3
        for <linux-doc@vger.kernel.org>; Mon, 10 Feb 2025 10:45:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739213113; x=1739817913;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KSceIq+QW6QfAQSxFrhFP3CSjeVr/8tSdt+enYDxg60=;
        b=JS1Eu/GsyfvFJAHbEigAmDUlfQUSA8ebqhyqabs3G+xf0B1bsmpQp79mRxG+iAapuO
         vf2D7KRVnAztufNqjU8IFLOvf1k5ShIRbXuFSOXLQsXhigJWd5g9AdFjThWYt2XyMup1
         2sGbtdJmLg2GeQoq8eF7KpwircGF91SShGz57Bzs1q07jookzJGzTcU9DyYyELNsI272
         NJO9GaQQ1vC87g+WA3RYkE/uyyuo6D0wh/Z58/DQezmkK5VJsQCxbbu/OTtxgdyrgG5l
         kzoj6BUJwvU37FubGLprFNf1ZuReGu7uFmfolWX4OM+Twxr7g3YnkZL1xi6pp1Yi+WZv
         Fa8w==
X-Forwarded-Encrypted: i=1; AJvYcCXDyUsY2XFPseLc6XtCHye7qBxL0jvo1/hDxoaCvQ75HE+qU2tWdxyoLcT7EpMVqvQ7LhFMUVL+28I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ8BPBinMNDPas7bAlF7ePmNUYrQLiD5gLKvm+4+2fVCmURvvH
	k5VAUfiwxRn7Bg8qBooVDCDpntlYbjhMOby9Dx/QQvzE6XUpUXe5qkOX+K3bKI6FJap+wvuUxER
	t0Mrgu2L5Hu2nuoysYyDFFWE2+idNnbzVW1FeeGOwf0yVXqraBvibV2sGfQ==
X-Gm-Gg: ASbGnctdvZma/Ik7idfFyauBBLrECM/lY/8oTdCygdKF5MGpNyhwMF7nNMpDfQgZ92M
	Xaizv2f588VX2i8DLbwKRNEU8wZU7T0760/CVjaofoWjOQ4RteRJn8n7KteqZCref3GuAihTLJ+
	vnAJrZqJqIhHHy0Fj7KtDUPUdi4HYrZARJ4Z7mg0KFJ5s8kHYjy8udLUAkbAmfE06kJKk5cuxNx
	i+N6N75bvGQZENou8e9+pr5zeYSVGFe5QyCoaEGSjFSYkch/ASk+NnF+Pw0g9QtdBW9oZkXbR4L
	LdM3YcB41z3WI6AHJycsPZFFZOXDcnhxsfIA3KzhYwtNt6lxOASYNBIwXqogfcGYtQ3YhRTLsnY
	xSrhFq5fOeRh8l0/ZndZd02DVYCfrrOqu
X-Received: by 2002:a05:600c:4f89:b0:439:4b9e:45fc with SMTP id 5b1f17b1804b1-4394b9e4883mr19868675e9.4.1739213113281;
        Mon, 10 Feb 2025 10:45:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG1DW8uYaNIQGndHHpAaZ/R379l1WaaDggkqsZF2ysLByrh9c9rDZgcYBCPGohQqt0EwrYjTg==
X-Received: by 2002:a05:600c:4f89:b0:439:4b9e:45fc with SMTP id 5b1f17b1804b1-4394b9e4883mr19868135e9.4.1739213112852;
        Mon, 10 Feb 2025 10:45:12 -0800 (PST)
Received: from ?IPV6:2003:cb:c734:b800:12c4:65cd:348a:aee6? (p200300cbc734b80012c465cd348aaee6.dip0.t-ipconnect.de. [2003:cb:c734:b800:12c4:65cd:348a:aee6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dc9ffd8sm151856745e9.10.2025.02.10.10.45.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 10:45:11 -0800 (PST)
Message-ID: <afff4368-9401-4943-b802-1b15bdcf5aaa@redhat.com>
Date: Mon, 10 Feb 2025 19:45:09 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 16/20] huge_memory: Add vmf_insert_folio_pmd()
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
 <9f10e88441f3cb26eff6be0c9ef5997844c8c24e.1738709036.git-series.apopple@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <9f10e88441f3cb26eff6be0c9ef5997844c8c24e.1738709036.git-series.apopple@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04.02.25 23:48, Alistair Popple wrote:
> Currently DAX folio/page reference counts are managed differently to normal
> pages. To allow these to be managed the same as normal pages introduce
> vmf_insert_folio_pmd. This will map the entire PMD-sized folio and take
> references as it would for a normally mapped page.
> 
> This is distinct from the current mechanism, vmf_insert_pfn_pmd, which
> simply inserts a special devmap PMD entry into the page table without
> holding a reference to the page for the mapping.
> 
> It is not currently useful to implement a more generic vmf_insert_folio()
> which selects the correct behaviour based on folio_order(). This is because
> PTE faults require only a subpage of the folio to be PTE mapped rather than
> the entire folio. It would be possible to add this context somewhere but
> callers already need to handle PTE faults and PMD faults separately so a
> more generic function is not useful.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>

Nit: patch subject ;)

> 
> ---
> 
> Changes for v7:
> 
>   - Fix bad pgtable handling for PPC64 (Thanks Dan and Dave)

Is it? ;) insert_pfn_pmd() still doesn't consume a "pgtable_t *"

But maybe I am missing something ...

-- 
Cheers,

David / dhildenb


