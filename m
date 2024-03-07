Return-Path: <linux-doc+bounces-11694-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 080BA874EA1
	for <lists+linux-doc@lfdr.de>; Thu,  7 Mar 2024 13:09:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 70E571F22721
	for <lists+linux-doc@lfdr.de>; Thu,  7 Mar 2024 12:09:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68394129A7A;
	Thu,  7 Mar 2024 12:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BnR+GVP+"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3E4128801
	for <linux-doc@vger.kernel.org>; Thu,  7 Mar 2024 12:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709813376; cv=none; b=JCRYVgXimA2SSFTYa4pb9CpYO7OfinWQkAD3I28qpfChC9tQ8Loh0MeNJ/nfII3H/exXae9E5nl2G/EX4xN65RIJuCLYWwWhfQLK/QNAvfTvmtnVLBg6St5PsvWQZ26DyHPesxJjPVcWqGYfTAWTWmDhET1diOU0YHsXFwv/sFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709813376; c=relaxed/simple;
	bh=ZcbSxQHa64styGyObPAmI3FZxXzS+Ei0HMj7rBDGJks=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=E8Xw4OMfkNgQbeQGu+n67SHq0C88w0L+Hb+VYzs+ms9E8/cITupW5WlcjLEODYlap1tz1uBR0mHmzUKU3sccCimwWwIE8iwaBd8BmDow0cvLrr243dEopyz5vx9bkBmf4GEZYOt+i4b7DT0wuhLGMVXiGGfbXjjBTcCTbuFZKVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BnR+GVP+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709813373;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=sobtdTCw6g7Ovv2LKnqxm7QgwpUgMPOLE+MVJRQS8vw=;
	b=BnR+GVP+phvw/5f3xq/jOwMN1jIHX108mSYvN4lmwHYox+vaQu0VA5QXBqsdVX1Bq1FM73
	DsSjhskbNu+rwWk8szokZvEra3UgQXO5djWsKUDUEAjODCnN1g2aJ+PujQUmSN9qr5RM1Y
	CWTH4GTST860CEv4Re4bsTPAwLjYEm4=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-6-gc1jKJqrPZCI6w4g7GuT_Q-1; Thu, 07 Mar 2024 07:09:32 -0500
X-MC-Unique: gc1jKJqrPZCI6w4g7GuT_Q-1
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-2d2a5e2e7c3so5482851fa.2
        for <linux-doc@vger.kernel.org>; Thu, 07 Mar 2024 04:09:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709813371; x=1710418171;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:from:content-language:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sobtdTCw6g7Ovv2LKnqxm7QgwpUgMPOLE+MVJRQS8vw=;
        b=cksNf7nRlrdHIfrSQ15lWcHRHSBob3YbFGgyQl5W/MIeUiRxLt5TtX/UNTZ/8XPXmO
         oWpNbwl+/BhFLPxR8gB+BfkAJnV9gXNSAkT9QYmep/4VYfRqwuS5qKxGKsK4XOVrwxU8
         WPE9Te3XBp3EHoN+2335zs7iQLdu/pwg9km/2KUolFGiaAcCmQ76Gc5Yed+wmS8m4e50
         exRTCC5EKKcVgVJdo/WSjb/x43emycA27SY1Or7wRsbCC3HgtNCj2sRoAd4iHWehMBht
         lNjP/p6PqPx9+jC5q/iATetkn6Y1r7p/n/GeuKPKOQIMtvxOPW5kScUG9KCE3Ms4AY/i
         criw==
X-Forwarded-Encrypted: i=1; AJvYcCVEVs5IAc+G9LU+meY/jXcSLQizBkGvZBaVrDqSy2cf/Jv/T4sdkb+7jGsUZBxM4syPuBkhEjBNk4fZlkrMHI0AMbL4ClFfYj5r
X-Gm-Message-State: AOJu0YxsBDZSTm6+/TyPpI+JsO6ym9UaV7G7M/gUVUAEcFGSLmZ+ZXLf
	LGfYy803359skugSuPZoBmA/colatG1KNdkgOzgUHksQSy/GxAB6qgdt9+cfIOAM/spurRKt8qh
	a8nPQO9DyT2eLDo0H2qkSTm/k9+oxU7UU98wZpiVZayRPpudUuqQhnJeHrA==
X-Received: by 2002:a2e:a454:0:b0:2d3:f013:61d9 with SMTP id v20-20020a2ea454000000b002d3f01361d9mr1185961ljn.31.1709813371092;
        Thu, 07 Mar 2024 04:09:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEGBqQrNg2/4YA5+A4tvNB+c5+9du3LnR6q5NsERUYIO5uu6WXY83AiEti24fQryCe6kaCZhA==
X-Received: by 2002:a2e:a454:0:b0:2d3:f013:61d9 with SMTP id v20-20020a2ea454000000b002d3f01361d9mr1185932ljn.31.1709813370661;
        Thu, 07 Mar 2024 04:09:30 -0800 (PST)
Received: from ?IPV6:2003:cb:c74d:6400:4867:4ed0:9726:a0c9? (p200300cbc74d640048674ed09726a0c9.dip0.t-ipconnect.de. [2003:cb:c74d:6400:4867:4ed0:9726:a0c9])
        by smtp.gmail.com with ESMTPSA id r12-20020adfe68c000000b0033df5710fabsm20100194wrm.44.2024.03.07.04.09.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Mar 2024 04:09:30 -0800 (PST)
Message-ID: <a73c78be-8cdc-4f0e-b72f-e5255c906a5f@redhat.com>
Date: Thu, 7 Mar 2024 13:09:28 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] [RFC] proc: pagemap: Expose whether a PTE is writable
Content-Language: en-US
From: David Hildenbrand <david@redhat.com>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mm <linux-mm@kvack.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 upstream+pagemap <upstream+pagemap@sigma-star.at>,
 adobriyan <adobriyan@gmail.com>, wangkefeng wang
 <wangkefeng.wang@huawei.com>, ryan roberts <ryan.roberts@arm.com>,
 hughd <hughd@google.com>, peterx <peterx@redhat.com>,
 avagin <avagin@google.com>, lstoakes <lstoakes@gmail.com>,
 vbabka <vbabka@suse.cz>, Andrew Morton <akpm@linux-foundation.org>,
 usama anjum <usama.anjum@collabora.com>, Jonathan Corbet <corbet@lwn.net>
References: <20240306232339.29659-1-richard@nod.at>
 <d673247b-a67b-43e1-a947-18fdae5f0ea1@redhat.com>
 <1058679077.23275.1709809843605.JavaMail.zimbra@nod.at>
 <7d9321db-a3c1-4593-91fa-c7f97bd9eecd@redhat.com>
 <1525238492.23321.1709812267495.JavaMail.zimbra@nod.at>
 <0644814b-869b-4694-bdb1-bab4e6186136@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <0644814b-869b-4694-bdb1-bab4e6186136@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 07.03.24 12:59, David Hildenbrand wrote:
> On 07.03.24 12:51, Richard Weinberger wrote:
>> ----- Ursprüngliche Mail -----
>>> Von: "David Hildenbrand" <david@redhat.com>
>>>> I'm currently investigating why a real-time application faces unexpected
>>>> page faults. Page faults are usually fatal for real-time work loads because
>>>> the latency constraints are no longer met.
>>>
>>> Are you concerned about any type of page fault, or are things like a
>>> simple remapping of the same page from "read-only to writable"
>>> acceptable? ("very minor fault")
>>
>> Any page fault has to be avoided.
>> To give you more background, the real time application runs on Xenomai,
>> a real time extension for Linux.
>> Xenomai applies already many tweaks to the kernel to trigger pre-faulting of
>> memory areas. But sometimes the application does not use the Xenomai API
>> correctly or there is an bug in Xenomai it self.
>> Currently I'm suspecting the latter.
>>    
> 
> Thanks for the details!
> 
>>>>
>>>> So, I wrote a small tool to inspect the memory mappings of a process to find
>>>> areas which are not correctly pre-faulted. While doing so I noticed that
>>>> there is currently no way to detect CoW mappings.
>>>> Exposing the writable property of a PTE seemed like a good start to me.
>>>
>>> Is it just about "detection" for debugging purposes or about "fixup" in
>>> running applications?
>>
>> It's only about debugging. If an application fails a test I want to have
>> a tool which tells me what memory mappings are wonky or could cause a fault
>> at runtime.
> 
> One destructive way to find out in a writable mapping if the page would
> actually get remapped:
> 
> a) Read the PFN of a virtual address using pagemap
> b) Write to the virtual address using /proc/pid/mem
> c) Read the PFN of a virtual address using pagemap to see if it changed
> 
> If the application can be paused, you could read+write a single byte,
> turning it non-destructive.
> 
> But that would still "hide" the remap-writable-type faults.
> 
>>
>> I fully understand that my use case is a corner case and anything but mainline.
>> While developing my debug tool I thought that improving the pagemap interface
>> might help others too.
> 
> I'm fine with this (can be a helpful debugging tool for some other cases
> as well, and IIRC we don't have another interface to introspect this),
> as long as we properly document the corner case that there could still
> be writefaults on some architectures when the page would not be
> accessed/dirty yet.
> 

[and I just recall, there are some other corner cases. For example, 
pages in a shadow stack can be pte_write(), but they can only be written 
by HW indirectly when modifying the stack, and ordinary write access 
would still fault]

-- 
Cheers,

David / dhildenb


