Return-Path: <linux-doc+bounces-31264-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 314679D4201
	for <lists+linux-doc@lfdr.de>; Wed, 20 Nov 2024 19:29:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 955DD283385
	for <lists+linux-doc@lfdr.de>; Wed, 20 Nov 2024 18:29:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59F71155CB0;
	Wed, 20 Nov 2024 18:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Kw/Trhai"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06D24437C
	for <linux-doc@vger.kernel.org>; Wed, 20 Nov 2024 18:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732127366; cv=none; b=F2bl9TU/KPrEF5e/PvniR2ezgcBdJuJ7hDHC92am3QdT2e9VucezqcYAoifSKQRQhAY6W+Y3bUODXnpzhH1kUiUKRsayK8X4o2TyFglzCH3lB7XhBG0L0Yf/cmmDQblf/x2nNH0j8bdBeLQDZEcYTADluvsRFfdg09z+91umCJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732127366; c=relaxed/simple;
	bh=cM3JcCkCVDZj2/LIzkmgPx17zG3hge8L4eJu13ALF5c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uWHAy8jmEIDD3j6xK+Y6at6VYfKAHHwUqd525j9RYS2n4v1yNdg5sml4FqZn/Sm7yaBzkC84rcX9YGUOSnGcVHaoO5eJldzYJT0WiNZ855kD7o5mmR9IWbh3ba57cb9q2X59VTmzu4NYnT4/7Xepz131qbPpE7d0O3yxmj9B3z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Kw/Trhai; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732127363;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=xCs7iTIJNkzy1KhjvLmAaqevnqcTQGBiRk9bohfxGPs=;
	b=Kw/Trhai/5gJwyT/LwwqsLpopza3s8dvMx5hREVi6vV/fCEZEAQvhmDxZCL9KsrHoLyXU8
	Ry/RlhR3Yw/eVhLIr6la99v8wfQjMlVqoReWjX4EcoBjc5QkiZhXdP++5x5xEJJRLeMe76
	NNnzNP+sKU4eZgnNDq+8wnd8nHBZUC0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-529-52xK3R0kOruEuwBh0YyOfA-1; Wed, 20 Nov 2024 13:29:22 -0500
X-MC-Unique: 52xK3R0kOruEuwBh0YyOfA-1
X-Mimecast-MFC-AGG-ID: 52xK3R0kOruEuwBh0YyOfA
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4316ac69e6dso12055e9.0
        for <linux-doc@vger.kernel.org>; Wed, 20 Nov 2024 10:29:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732127361; x=1732732161;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xCs7iTIJNkzy1KhjvLmAaqevnqcTQGBiRk9bohfxGPs=;
        b=mhkGVrw7wVtaqkc6oe9RUiJwkMDLExb0ETE6qnYETSypAVT4cHvPiG+xhPI8Jy2F//
         TVLKxkvABUMUT4DpDWjx+2sodg6jlhWH+Y8ozpSDfmi22q38M/Yn6Ne6SXpvBas7wuee
         mFzs4rE33NpT3pkxHa4XlV/BoJfbCQgHe9w6kftYHvMfzmz2EL4PU18aF+LZR9UQ2ctw
         mzaAYnIgyY0QO6iK80iR0OlLUB/d6Gce8LBzV3AJBz9INgLRh4iSetwksSfFOQ9S3adr
         sBBAo+YXzWQPEWdRMcHAOKl2oiXijAg0bhl2zaYWrZky+T91DFhfNSHYi39Y5w6bVtXw
         CBoA==
X-Forwarded-Encrypted: i=1; AJvYcCWIgetA257WWV0oukqijwz47GKmEkat/O5hGm2Lkx0M2SGpDO0kbUhjEEdrP184LJCrhOTl0Zxyya4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvufjHmW206HLAqs4u0TdfHmLkcXR3gz0B4WMPXJHcmCIDVhKK
	vdvfDntd7sbHATQzTspIIrSRWISoY9lyDvslMd9exmBWFrPUnJHa4QnSKy+CdM14Ouub4FBUqpg
	BS0Z/7nRq4PtJNYTb/U4/bsp33uth4N9bpa3wcPooAT6cgaCS8XJNbijyrw==
X-Gm-Gg: ASbGncsy6sErzmWuUMVCMkC10bp3PqZQVSFXdryngzW7sj1HVrJPuoMUX6AANJkV5RK
	9v4CCjGpDzn8QE2dQnWxi546DJFya7LGyxAGmN32HU4lnF6oL457a24zfrt+656EeCuWP0Gn9tJ
	DeO8zrZUWVBmMZ9Eit3Tz3UsTfXSx8nhlR1Ys3Enrer5Yn6b/1dHEeS//FZ8GFGhuAhPwx+WUsd
	66HHFNLra9Fh/nIK5YRtqy7FQu7663Q6o58WCFAJSDnv6DdHIEq8GS5H66izvEoo3AN6BVc2GWG
	3c34S1QFvPql41jA3vhAFtlG+hBKr8vVjWdWKYdcwzCD5yz8/KnU7HLcXu2LJlRf+IiCM8Spb+9
	CEQ==
X-Received: by 2002:a05:600c:4504:b0:430:5654:45d0 with SMTP id 5b1f17b1804b1-433489b3dc4mr36321255e9.14.1732127360852;
        Wed, 20 Nov 2024 10:29:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEVhH45DncZkRLkGWEYic5HXC4ydjlOUpFmVslfUz0dJd4CdqCHxs+qDbL17KG8YydFigfirQ==
X-Received: by 2002:a05:600c:4504:b0:430:5654:45d0 with SMTP id 5b1f17b1804b1-433489b3dc4mr36320935e9.14.1732127360476;
        Wed, 20 Nov 2024 10:29:20 -0800 (PST)
Received: from ?IPV6:2003:cb:c705:4200:ce79:acf6:d832:60df? (p200300cbc7054200ce79acf6d83260df.dip0.t-ipconnect.de. [2003:cb:c705:4200:ce79:acf6:d832:60df])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433b45fa706sm28765815e9.16.2024.11.20.10.29.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Nov 2024 10:29:19 -0800 (PST)
Message-ID: <74cbda4a-7820-45a9-a1b2-139da9dae593@redhat.com>
Date: Wed, 20 Nov 2024 19:29:17 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/4] KVM: ioctl for populating guest_memfd
To: kalyazin@amazon.com, pbonzini@redhat.com, corbet@lwn.net,
 kvm@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: jthoughton@google.com, brijesh.singh@amd.com, michael.roth@amd.com,
 graf@amazon.de, jgowans@amazon.com, roypat@amazon.co.uk, derekmn@amazon.com,
 nsaenz@amazon.es, xmarcalx@amazon.com,
 Sean Christopherson <seanjc@google.com>, linux-mm@kvack.org
References: <20241024095429.54052-1-kalyazin@amazon.com>
 <08aeaf6e-dc89-413a-86a6-b9772c9b2faf@amazon.com>
 <01b0a528-bec0-41d7-80f6-8afe213bd56b@redhat.com>
 <efe6acf5-8e08-46cd-88e4-ad85d3af2688@redhat.com>
 <55b6b3ec-eaa8-494b-9bc7-741fe0c3bc63@amazon.com>
 <9286da7a-9923-4a3b-a769-590e8824fa10@redhat.com>
 <f55d56d7-0ab9-495f-96bf-9bf642a9762d@redhat.com>
 <03a12598-74aa-4202-a79a-668b45dbcc47@amazon.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <03a12598-74aa-4202-a79a-668b45dbcc47@amazon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20.11.24 18:21, Nikita Kalyazin wrote:
> 
> 
> On 20/11/2024 16:44, David Hildenbrand wrote:
>>> If the problem is the "pagecache" overhead, then yes, it will be a
>>> harder nut to crack. But maybe there are some low-hanging fruits to
>>> optimize? Finding the main cause for the added overhead would be
>>> interesting.
> 
> Agreed, knowing the exact root cause would be really nice.
> 
>> Can you compare uffdio_copy() when using anonymous memory vs. shmem?
>> That's likely the best we could currently achieve with guest_memfd.
> 
> Yeah, I was doing that too. It was about ~28% slower in my setup, while
> with guest_memfd it was ~34% slower. 

I looked into uffdio_copy() for shmem and we still walk+modify page 
tables. In theory, we could try hacking that out: for filling the 
pagecache we would only need the vma properties, not the page table 
properties; that would then really resemble "only modify the pagecache".

That would likely resemble what we would expect with guest_memfd: work 
only on the pagecache and not the page tables. So it's rather surprising 
that guest_memfd is slower than that, as it currently doesn't mess with 
user page tables at all.

  The variance of the data was quite
> high so the difference may well be just noise.  In other words, I'd be
> much happier if we could bring guest_memfd (or even shmem) performance
> closer to the anon/private than if we just equalised guest_memfd with
> shmem (which are probably already pretty close).

Makes sense. Best we can do is:

anon: work only on page tables
shmem/guest_memfd: work only on pageacache

So at least "only one treelike structure to update".

-- 
Cheers,

David / dhildenb


