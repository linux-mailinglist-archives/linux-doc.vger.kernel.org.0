Return-Path: <linux-doc+bounces-64812-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8C5C16592
	for <lists+linux-doc@lfdr.de>; Tue, 28 Oct 2025 18:59:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 76D1E18990BC
	for <lists+linux-doc@lfdr.de>; Tue, 28 Oct 2025 17:57:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97A3234C9B5;
	Tue, 28 Oct 2025 17:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eHx5i/SY"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E5F34B1A1
	for <linux-doc@vger.kernel.org>; Tue, 28 Oct 2025 17:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761674179; cv=none; b=BVVpS3cBlPkQK+wBMHa8PodhOKKFUocM28TXGi3iJESO5dIgVfc3ngYSweSlrUJgTXlcsHCtJdJi5IQ7BYyKRgo1y46fUu7151MbGzCWND+FSKFXwGmfqrg++bucUZc7RPlzQHVKnfMbImZXT9H2Bv9OZGOt/OcMlQD82iUzh9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761674179; c=relaxed/simple;
	bh=ixAv4f+ol10qMkv/OLbSXev4ui1XzEtPKfJ3O1UP9lM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LawgvYM93EIwCrRSnCTy4e7ahIQ7vlp5Sq6y7DvgrHcR5RjQHP/GoT3gaXudjZRX+Gm531oMhVOvcWiPttXZ0AAPiKPMBMhDKRopYgqBblwcJSRotUWnUuaKTaSNx/rSUGYCYhTRAZbSZeeVEWSfluGHBSZ9G2DTTu1hMRmqmqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eHx5i/SY; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761674177;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=g6eToIGweByE2pHgRfb2gPb2S77u3+GTDDQYyAyPH+k=;
	b=eHx5i/SYMOBOsGES7TldI6jgNaJkmrY+mNjvjUP3f7HV55MTId6U7KIfxwgNCbtUhDAGDb
	xLPTkw3XK4JnK3I5XbfPU5iUmVDgjVeQqa7s30qlb4fZQrt0Ssbpgo/4g/UO8hOaHUMCf7
	hku9QQx+9CnrVb6UOkDqFzNHsCNfFGo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-287-MljMnfj5PpWsKhFa5eZN_g-1; Tue, 28 Oct 2025 13:56:15 -0400
X-MC-Unique: MljMnfj5PpWsKhFa5eZN_g-1
X-Mimecast-MFC-AGG-ID: MljMnfj5PpWsKhFa5eZN_g_1761674174
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-475ddd57999so30547955e9.1
        for <linux-doc@vger.kernel.org>; Tue, 28 Oct 2025 10:56:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761674174; x=1762278974;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g6eToIGweByE2pHgRfb2gPb2S77u3+GTDDQYyAyPH+k=;
        b=Ukkhs3Q9AeyiiKB/x2gl0UqoA1VgPr2SNwPxiFHtrXeg5MrE1wZTkEvzyV9vBQskNo
         3Vd1uuvDbUobFeuQT8iJa4BEWFecb78URYEtJZ1N8ZsMZXwbSCfiTfPjmMMUhkQs3leM
         9wxmDoVRhZDoK/WBL8ySTBlUBxYwMV0gmny6kTm2Aqy+IpFMjhCdz76MDvE7GSHTJZZQ
         B8vaQnJeAC6ImKBJ7RXVF6i/zo2dFqVwktXpdyqVZbj18vxhK46DwD0E4J49BgsqXrUv
         qZcL8rsKWtrO8Ka6riAeM5UxXEHu9v4OosqY/axipOLaFIjwlFYozuztsT8/l+mUNXnc
         F5rQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfnt0l0p5iosIET8hLeJ3i5M2aqxa0Nz+8kgQ9J0uYCm05gDwQasZ2hx4ovygLP7lQ2OHrnYmUyV8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCaYBGMcDhJlL0Gczbck92U6BvLXh8vPazScTNc3rs/gHJ/p0u
	WIkLmtR687NKtsmqvPsVMJvNHcbm08tQQZcP5o0Cbl8MMIhcyNRKeWr6ZnAO0QHMVx2Qlv5BpEg
	OOFVKGWprS6JV5mdpzeq8QSHUp1DnidJUiCh76+Ja9muLCstkKk26v9ZGOEWUCQ==
X-Gm-Gg: ASbGncsuMhhm6VLEAZtvhqj0yEqw8FnhhdcNPsfe6rU72UH5ynsrxyFXGVewapD7BZX
	xwrYAVgwpHggL9AW5cOUNjZALckkQBz/ZBrH1HXTmwDh98TJVreJ+AEHm9rACzfAQj29KvnmlRq
	Rd3rcT4ngq/HS7ZUDdaiXVSGsiiZobnv49cFeb1f9ehS6hYnQoGXBhzoyViUwZ5SY2ep6dhC58/
	l7WAGOv7sdh5g4WuVPipVkEPLSxw2KS6zyMsJxDqk2bxpUr+PCohsdv3Q53kfVcldZbyrNNU0dU
	pUdTwLhE7IpwPQaWI4ozY4GZE7m0pXKHkSIL7yLwVocBfGgvkVzD5ORYp6lKcOQx3HZvmkfA0ad
	pI9eHEFiytMxme2/EKodhEMSEppl9HioCCCi3nHc=
X-Received: by 2002:a05:600c:4e56:b0:471:989:9d7b with SMTP id 5b1f17b1804b1-4771e1de250mr3042305e9.21.1761674174487;
        Tue, 28 Oct 2025 10:56:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEY4oqI01ymhTqStAjkQ0EYI9rwIiErh5/4NzRqUPCO8tW2HD5t4ifGkOgJh9RHOuRsKfElhQ==
X-Received: by 2002:a05:600c:4e56:b0:471:989:9d7b with SMTP id 5b1f17b1804b1-4771e1de250mr3042165e9.21.1761674174052;
        Tue, 28 Oct 2025 10:56:14 -0700 (PDT)
Received: from [192.168.200.155] (host-80-81-2-50.customer.m-online.net. [80.81.2.50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952de4a1sm21724189f8f.37.2025.10.28.10.56.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 10:56:13 -0700 (PDT)
Message-ID: <e2a89e74-1533-4a83-8d0f-3f4821750e25@redhat.com>
Date: Tue, 28 Oct 2025 18:56:10 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 mm-new 06/15] khugepaged: introduce
 collapse_max_ptes_none helper function
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Nico Pache <npache@redhat.com>, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, ziy@nvidia.com, Liam.Howlett@oracle.com,
 ryan.roberts@arm.com, dev.jain@arm.com, corbet@lwn.net, rostedt@goodmis.org,
 mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
 akpm@linux-foundation.org, baohua@kernel.org, willy@infradead.org,
 peterx@redhat.com, wangkefeng.wang@huawei.com, usamaarif642@gmail.com,
 sunnanyong@huawei.com, vishal.moola@gmail.com,
 thomas.hellstrom@linux.intel.com, yang@os.amperecomputing.com,
 kas@kernel.org, aarcange@redhat.com, raquini@redhat.com,
 anshuman.khandual@arm.com, catalin.marinas@arm.com, tiwai@suse.de,
 will@kernel.org, dave.hansen@linux.intel.com, jack@suse.cz, cl@gentwo.org,
 jglisse@google.com, surenb@google.com, zokeefe@google.com,
 hannes@cmpxchg.org, rientjes@google.com, mhocko@suse.com,
 rdunlap@infradead.org, hughd@google.com, richard.weiyang@gmail.com,
 lance.yang@linux.dev, vbabka@suse.cz, rppt@kernel.org, jannh@google.com,
 pfalcato@suse.de
References: <20251022183717.70829-1-npache@redhat.com>
 <20251022183717.70829-7-npache@redhat.com>
 <5f8c69c1-d07b-4957-b671-b37fccf729f1@lucifer.local>
 <063f8369-96c7-4345-ab28-7265ed7214cb@linux.alibaba.com>
 <9a3f2d8d-abd1-488c-8550-21cd12efff3e@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <9a3f2d8d-abd1-488c-8550-21cd12efff3e@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

[...]

> 
>> towards David's earlier simplified approach:
>> 	max_ptes_none == 511 -> collapse mTHP always
>> 	max_ptes_none != 511 -> collapse mTHP only if all PTEs are non-none/zero
> 
> Pretty sure David's suggestion was that max_ptes_none would literally get set to
> 511 if you specified 511, or 0 if you specified anything else.

We had multiple incarnations of this approach, but the first one really was:

max_ptes_none == 511 -> collapse mTHP always
max_ptes_none == 0 -> collapse mTHP only if all non-none/zero

And for the intermediate values

(1) pr_warn() when mTHPs are enabled, stating that mTHP collapse is not 
supported yet with other values
(2) treat it like max_ptes_none == 0 or (maybe better?) just disable 
mTHP collapse


I still like that approach because it let's us defer solving the creep 
problem later and doesn't add a silent capping.

Using intermediate max_ptes_none values are really only reasonable with 
the deferred shrinker today. And that one does not support mTHP even 
with this series, so it's future work either way.

-- 
Cheers

David / dhildenb


