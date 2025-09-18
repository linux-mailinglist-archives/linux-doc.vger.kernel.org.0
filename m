Return-Path: <linux-doc+bounces-60521-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E2AB576DE
	for <lists+linux-doc@lfdr.de>; Mon, 15 Sep 2025 12:45:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A7AE516358A
	for <lists+linux-doc@lfdr.de>; Mon, 15 Sep 2025 10:44:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C00E61B4231;
	Mon, 15 Sep 2025 10:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZVWcrepZ"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4732ED846
	for <linux-doc@vger.kernel.org>; Mon, 15 Sep 2025 10:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757933083; cv=none; b=VLvM+8r4rXBPdVk9iAL4zNDBFvv01hV0xbzgWmOBDejaY8zbdBPTITlrCSj2DaY99PK/D4ZvdtKAEaQh7+Y134ulPoPQ92TSVDRBNgBUP0zWo/JtTA+DDz14EkFgq/ulRR/96JZ5m8aE+3gMqFEjCNWd+bs175D4epoTINRV/eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757933083; c=relaxed/simple;
	bh=5w4k8EcLvF61+VRzmKHTpNHP2/KD4diDnXkd57nVb28=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Uh6psQU2gOObBP2Sc/ygpPtpLJc+wUqXcL1HyObAFHDycg/CPR8AywtKtYjv4qQwGuojdm0fjWZF4QSUh/MrTcPtrSFyV4lK2hUQUPfEqvvnCOofKTtDFfl9cuZQnbreLrjdbm98J3l+haEzxuC6RmwPkeGLHjgHQy6mmze7IWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZVWcrepZ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757933081;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=pfBeZpYZH3kwLaHNF9xrLr+NfYDzXqMeo508dRBOzOs=;
	b=ZVWcrepZ+x4jlBzYr81ZJ/C1iPx+pjSBOb+vzyTXdAHWIYNtONq+fLpc6BH7sEHHS0T5FZ
	r+uyVvBIWQE9mhVGMPJqCni+STChLJ3vtwCQD3bRv5tIOyQBpRh36P5CyKsi9o0AI1d3g+
	Wc84b7KiHDVuuP0B2byUsKDadSgfT+I=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-543-8ZmHjyhpMAi8U5Aj-bub2w-1; Mon, 15 Sep 2025 06:44:39 -0400
X-MC-Unique: 8ZmHjyhpMAi8U5Aj-bub2w-1
X-Mimecast-MFC-AGG-ID: 8ZmHjyhpMAi8U5Aj-bub2w_1757933079
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3eae0de749dso447262f8f.3
        for <linux-doc@vger.kernel.org>; Mon, 15 Sep 2025 03:44:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757933078; x=1758537878;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pfBeZpYZH3kwLaHNF9xrLr+NfYDzXqMeo508dRBOzOs=;
        b=CmqPEkxNi8s+06cJLYkphFESx2JqxxFOl9cuzkB4/y6aFkBBa1wobDuYaBd/kD8cQl
         XYF5DoG/cnylzw+WELucWo3xJ3DWbanDTPUJsVNWVaIccS2N+cMyS13jhZMPckbfJJm4
         iqJMxnOQ5o9REloSZLLuUQtmgCMBzSFR9HdPiZZvsfQf+wu5gBA5srvgaAMApDrxnc88
         lbtqVEgYzmnmmAtLphyFSvWXxgObL8GL1EsluuPgb6i7lFSmYFI3i0LxM0uoESPK8BH9
         HcNZeG94P6Cb4ZegjuiEkyC2VoLDl8RNjuBuVxdQ1bOPn19Rucb9Lbv1BJoIPcC4B9Ye
         TgPw==
X-Forwarded-Encrypted: i=1; AJvYcCWB771ALrOnmWrklWlYjGvdte6WSorekEu/SvPQUb+Z37e0x9qJJswteXRKvTUhUi5um6mOfhVb9/k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/8oguMaNDE/nGXSqBkYXnxw2GTki2VfPRH1Pse79XRp/3X52/
	AKMT4dK8iB2+KVLJKEI/EkYooeHKbekrpMsu0sgQwNuvm2y9PLT53ddnXlYYYNHsEIgLHMQSVyr
	FC8dy9jBgn1uFk9cFHQYuxduJfXavOkzkCC0S8uTrcH+AKFDG7KQSB6kEeb6HdFVoL1uNvQ==
X-Gm-Gg: ASbGncs72BiAMdBEutG1ePKYDl1buT90EP7dPtDUIs6QuU+6tWu1+d+HxxAwmx7U7Az
	+NTsUahXhp3yARB7J1yOu5dZ4bDyQ/+bV9dN6glEuA2IxEPANakRCDdpXRN7tKOqG+JNhLR4WmA
	aZIjeT0yG5+ysa/n7y4bwRpukOq+pruUU+4KoQIUo6V5z8TaB8y3TzFRC1PPmKylbzoBqijYWHB
	ti9ptweebRDxQWLhTj6s+fBjGCLj6XYrXzZLBvO8xpJ5wl+ogfDbdtyJsO15qlJg98gLfMugR4K
	1sp8OV4j7oGPZJYF2LtYNy6QHxdRAVf9tp2alNGsDX3YYPWf5wWtFc9NFWc7xFpPTkkfkIY5Ifp
	FbUacAZRsk0a5ZuDmX89330Jp5QrxpCmIoTOvxkaP1Znz1FFnKKYhKGKNUN/QLWJ/8Jg=
X-Received: by 2002:a05:6000:4313:b0:3e4:64b0:a779 with SMTP id ffacd0b85a97d-3e765a0adbcmr10716112f8f.53.1757933078489;
        Mon, 15 Sep 2025 03:44:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZ67BH6eODIX53bsHRNys6uDTQ10DKCXfSX16I+6EVy74wqGrkRZ/YiWiJ663QUmC8ksBjyw==
X-Received: by 2002:a05:6000:4313:b0:3e4:64b0:a779 with SMTP id ffacd0b85a97d-3e765a0adbcmr10716076f8f.53.1757933078032;
        Mon, 15 Sep 2025 03:44:38 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f18:f900:e0ae:65d5:8bf8:8cfd? (p200300d82f18f900e0ae65d58bf88cfd.dip0.t-ipconnect.de. [2003:d8:2f18:f900:e0ae:65d5:8bf8:8cfd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45f2acbeee0sm67118205e9.0.2025.09.15.03.44.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Sep 2025 03:44:37 -0700 (PDT)
Message-ID: <34754ca4-fced-4a3c-8ff8-c00967d487de@redhat.com>
Date: Mon, 15 Sep 2025 12:44:34 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 00/15] khugepaged: mTHP support
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Kiryl Shutsemau <kas@kernel.org>, Nico Pache <npache@redhat.com>,
 linux-mm@kvack.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, ziy@nvidia.com,
 baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com,
 ryan.roberts@arm.com, dev.jain@arm.com, corbet@lwn.net, rostedt@goodmis.org,
 mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
 akpm@linux-foundation.org, baohua@kernel.org, willy@infradead.org,
 peterx@redhat.com, wangkefeng.wang@huawei.com, usamaarif642@gmail.com,
 sunnanyong@huawei.com, vishal.moola@gmail.com,
 thomas.hellstrom@linux.intel.com, yang@os.amperecomputing.com,
 aarcange@redhat.com, raquini@redhat.com, anshuman.khandual@arm.com,
 catalin.marinas@arm.com, tiwai@suse.de, will@kernel.org,
 dave.hansen@linux.intel.com, jack@suse.cz, cl@gentwo.org,
 jglisse@google.com, surenb@google.com, zokeefe@google.com,
 hannes@cmpxchg.org, rientjes@google.com, mhocko@suse.com,
 rdunlap@infradead.org, hughd@google.com, richard.weiyang@gmail.com,
 lance.yang@linux.dev, vbabka@suse.cz, rppt@kernel.org, jannh@google.com,
 pfalcato@suse.de
References: <20250912032810.197475-1-npache@redhat.com>
 <ppzgohmkll7dbf2aiwhw7f4spf6kxjtwwe3djkx26pwy4ekrnd@mgeantq5sn2z>
 <d0e81c75-ad63-4e37-9948-3ae89bc94334@redhat.com>
 <CAA1CXcA+pb5KvEnJJqdf1eSjaFiBZ82MRB+KDmyhj3DbiQqOxg@mail.gmail.com>
 <enrgrocqajwu5d3x34voghja7pbvau45oobxgabawrly44ld4u@ahch3xn6rtq5>
 <cd8e7f1c-a563-4ae9-a0fb-b0d04a4c35b4@redhat.com>
 <2c5328ee-fb6e-45cf-a151-868cc8e7ff97@lucifer.local>
 <4508810d-7645-4f57-a0c5-2ee9f44206fc@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <4508810d-7645-4f57-a0c5-2ee9f44206fc@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

>>> Mapping that to actual THP sizes (#pages in a thp) on an arch will be easy.
>>
>> And at different mTHP levels too right?
>>
> 
> Another point here, since we have to keep:
> 
> /sys/kernel/mm/transparent_hugepage/khugepaged/max_ptes_none
> 
> Around, and users will try to set values there, presumably we will now add:
> 
> /sys/kernel/mm/transparent_hugepage/khugepaged/eagerness
> 
> How will we map <-> the two tunables?

Well, the easy case if someone updates eagerness, then we simply et it 
to whatever magic value we compute and document.

The other direction is more problematic, likely we'll simply warn and do 
something reasonable (map it to whatever eagerness scale is closest or 
simply indicate it as "-1" -- user intervened or sth like that)

-- 
Cheers

David / dhildenb


