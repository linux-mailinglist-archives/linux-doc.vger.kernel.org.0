Return-Path: <linux-doc+bounces-37755-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A543A305DD
	for <lists+linux-doc@lfdr.de>; Tue, 11 Feb 2025 09:35:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 76A287A2EC4
	for <lists+linux-doc@lfdr.de>; Tue, 11 Feb 2025 08:34:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F33BE1F03C0;
	Tue, 11 Feb 2025 08:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BZJJFXQs"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07AFC1EF0AB
	for <linux-doc@vger.kernel.org>; Tue, 11 Feb 2025 08:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739262844; cv=none; b=FUgFkbBczBG6eK3NbgaBH+4vCcThbZdkU3KSIMUWbT0Xjl+zznE5pv0/4KiLFLv8EnLyCbHs2PmI+da+h+Bsr5GdXnbfZF3ktoEMDgzku1pmc27hmJ1/KBRq8fsGzTT5E7uIfcNYn7DBBmBPHVL1XZy9DB4y/wozlU+tIpJSq7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739262844; c=relaxed/simple;
	bh=Au8XBPmMwlwFZ61FwwJbY3H/g7cAz6iuo5ULUZnNq+g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ao8EokL3fEiT0keJmLht/E1fp8PN7Gkx8FbmlhyOFeZehAFpdv6WrcPIbdNOiGkRAkQ3UXYIyI+OL1fEukHxlVb58xfWJADrLCliW5wqALkQC2+ZoCivbODgCSOZfwMSL4Ok9VK72fQ+GldSDadTe6LZxDpK4XNFfDSljbUcnsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BZJJFXQs; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739262842;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=mIqIp1BIbRZ5jFRcS7Am3BCGDHCX3wHlAnSNlNmFiWQ=;
	b=BZJJFXQsViIkEimABulVkmWR3bJc2iqVVaU6Jbp6miWED9r0jT12jek0hp2nl+uzw9EdeU
	VyW+JwkWogb9OwlW3eG2l+pJ1A8TlV+avv926kBRY3Mt6VXMe+GSthz1px5gOWWPMoiC82
	A7FXJpXPMk+9Miu0jWOIB1V0NLrU0ag=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-573-7To9l-tjOLyKQGDRDbW12Q-1; Tue, 11 Feb 2025 03:34:00 -0500
X-MC-Unique: 7To9l-tjOLyKQGDRDbW12Q-1
X-Mimecast-MFC-AGG-ID: 7To9l-tjOLyKQGDRDbW12Q
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43942e82719so14089765e9.2
        for <linux-doc@vger.kernel.org>; Tue, 11 Feb 2025 00:34:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739262839; x=1739867639;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mIqIp1BIbRZ5jFRcS7Am3BCGDHCX3wHlAnSNlNmFiWQ=;
        b=Goc/hV0HwkzfupjetljR8YN7dHOWKsRIkwsswMd0b431JMRm2OWhPevSBB3PvUs3qH
         QJQczOABKNjT+oTLLnf3E53f9SYtdZjeDPrrCGHkbcJqIWF5gbKlVxlsgUHOrkFX55nG
         4QDvXTM5W/gftaKls5FxZEAd/pBZoK3a633ypxtw4m3AdxZ1bcKuvlsW2iKaGHcKkvc5
         MBxS2GyolFL8dmIwOFQGzeeu27E+pq7VmudxwHjXDi09zpSWCQhZ5yXyK10IqSQS+cBO
         bd/eqz+80mRwM9INMxJIuuFRZN85BXP0X6UBgeBN0avmfHwqDg5Sil4T1h8yGQrgfsem
         fCgQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+EN1AKYfKva46P4q8XZGWuVt3YLCzYIOBPH3eSTYYCqXxYG/FFkaz84Xb6BjsPss9AfzH+lvMn+s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHAwSZPQD41q5SQrIBFESemnFyMEdWLU44nZKYx8imTLgXqNGG
	EJt4ubYg29XJ/8jAlGNYi+jmzQzH7UY27pAhUT0MOI7q75csSU2/JJeqwfvwLEhJFFyJqNtVZu2
	/NcVvNWU/npdrIrCIfLEnyC6OQmZ4B3TvWMVHXNn1y4Ha6LWcYtdh7TAu5A==
X-Gm-Gg: ASbGncvbzHtbgvXwCHDhMv3+HxOPKe49xzWBtuUNxiXwb00de6We0qyKP4jxD55ICPI
	ruCM1wIGeMwNyDQJL4op/g/69ZVnZA9tkucWMRkpRh6dDy19oWTCldRXqzP6xfZ/mQQMfv6lMi2
	PXl5koQhLmzyLGsFscr4zCESQ6ebHu+QP8PFMBvJGcryay6TbiELJcwWCTxQojoJ379Fz05LAbD
	I7yDSnCCIZ2PxghgVNQK1p7lhwvk9LFmcC4iai7/aibriub8gjR/sgXDlHitjXDo/QFh8C/G/RN
	MU7cGqhmTyNTPDboBGcMipmDAcFINVGCBHxBuU7P7SSzEg==
X-Received: by 2002:a05:600c:358f:b0:436:1bbe:f686 with SMTP id 5b1f17b1804b1-439249a83c0mr109645835e9.21.1739262839409;
        Tue, 11 Feb 2025 00:33:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEJyNq+mZpSMIMzz0wnTiImVt/FUDNeInl/wSkrB9SyIlWYR/M5mlCRyd/qU2Yby5bdkaf4JQ==
X-Received: by 2002:a05:600c:358f:b0:436:1bbe:f686 with SMTP id 5b1f17b1804b1-439249a83c0mr109645555e9.21.1739262838972;
        Tue, 11 Feb 2025 00:33:58 -0800 (PST)
Received: from ?IPV6:2a01:599:929:885b:12c0:a824:1abd:41c4? ([2a01:599:929:885b:12c0:a824:1abd:41c4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4394136fb8bsm65885945e9.29.2025.02.11.00.33.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 00:33:57 -0800 (PST)
Message-ID: <48fd75b9-696e-402c-95bd-55f2f0e24dfc@redhat.com>
Date: Tue, 11 Feb 2025 09:33:54 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/17] mm/rmap: convert make_device_exclusive_range()
 to make_device_exclusive()
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 nouveau@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, damon@lists.linux.dev,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, SeongJae Park <sj@kernel.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>, Peter Xu <peterx@redhat.com>,
 Alistair Popple <apopple@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Simona Vetter <simona.vetter@ffwll.ch>
References: <20250210193801.781278-1-david@redhat.com>
 <20250210193801.781278-4-david@redhat.com>
 <20250210210001.5dc68b38eb1bfa44d0fd78f6@linux-foundation.org>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250210210001.5dc68b38eb1bfa44d0fd78f6@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11.02.25 06:00, Andrew Morton wrote:
> On Mon, 10 Feb 2025 20:37:45 +0100 David Hildenbrand <david@redhat.com> wrote:
> 
>> The single "real" user in the tree of make_device_exclusive_range() always
>> requests making only a single address exclusive. The current implementation
>> is hard to fix for properly supporting anonymous THP / large folios and
>> for avoiding messing with rmap walks in weird ways.
>>
>> So let's always process a single address/page and return folio + page to
>> minimize page -> folio lookups. This is a preparation for further
>> changes.
>>
>> Reject any non-anonymous or hugetlb folios early, directly after GUP.
>>
>> While at it, extend the documentation of make_device_exclusive() to
>> clarify some things.
> 
> x86_64 allmodconfig:
> 
> drivers/gpu/drm/nouveau/nouveau_svm.c: In function 'nouveau_atomic_range_fault':
> drivers/gpu/drm/nouveau/nouveau_svm.c:612:68: error: 'folio' undeclared (first use in this function)
>    612 |                 page = make_device_exclusive(mm, start, drm->dev, &folio);
>        |                                                                    ^~~~~
> drivers/gpu/drm/nouveau/nouveau_svm.c:612:68: note: each undeclared identifier is reported only once for each function it appears in

Ah! Because I was carrying on the same branch SVM fixes [1] that are
getting surprisingly little attention so far.


The following sorts it out for now:

 From 337c68bf24af59f36477be11ea6ef7c7ce9aa8ae Mon Sep 17 00:00:00 2001
From: David Hildenbrand <david@redhat.com>
Date: Tue, 11 Feb 2025 09:33:04 +0100
Subject: [PATCH] merge

Signed-off-by: David Hildenbrand <david@redhat.com>
---
  drivers/gpu/drm/nouveau/nouveau_svm.c | 1 +
  1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index 39e3740980bb7..1fed638b9eba8 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -590,6 +590,7 @@ static int nouveau_atomic_range_fault(struct nouveau_svmm *svmm,
  	unsigned long timeout =
  		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
  	struct mm_struct *mm = svmm->notifier.mm;
+	struct folio *folio;
  	struct page *page;
  	unsigned long start = args->p.addr;
  	unsigned long notifier_seq;
-- 
2.48.1


I'll resend [1] once this stuff here landed.

Let me know if you want a full resend of this series, thanks.


[1] https://lkml.kernel.org/r/20250124181524.3584236-1-david@redhat.com

-- 
Cheers,

David / dhildenb


