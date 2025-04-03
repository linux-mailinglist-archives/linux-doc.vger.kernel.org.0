Return-Path: <linux-doc+bounces-42097-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5021EA7A452
	for <lists+linux-doc@lfdr.de>; Thu,  3 Apr 2025 15:50:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A98463B67CB
	for <lists+linux-doc@lfdr.de>; Thu,  3 Apr 2025 13:50:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 513AE24CEE9;
	Thu,  3 Apr 2025 13:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ANWdMtjb"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C531210FB
	for <linux-doc@vger.kernel.org>; Thu,  3 Apr 2025 13:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743688205; cv=none; b=dEro2cDcryt5CI7vlknAmU6EUeB2wvlnuje4D0bt7ChOGuMINulR6stcFo8ialtm9CdCLwFihjrhr+N2qBK+qYDLyzhFfXV7sA8TkFthgEVxOn5b6Crvqhl139vzVLTc6JBzVjNa6mu8cZxFT315J1BG/y8J6VnWXL6DjHDOxaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743688205; c=relaxed/simple;
	bh=vdd7yTGrSGgJQnwiFH3GX/Ya2oRFXhaHCoT0+pHHmFM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s4rMYx/k9vm2rDJasKQkT1WG4t8Y/PKaqEuLZdNXstfcuynGNM0mv+xlmMUNWx7mOnp6KWnmP/Xm3PTWnEE7cRCqrSjX4D5FxiW9bzvlVaZ5e8rwvAqmNKi0e1fl0BtEIrpx5wRpj7F16TtjGMD4M85snv8cagN30u9Y3qTf14g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ANWdMtjb; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743688202;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=lRqdczoDWYZxO2i1hbydlrSlY7SaWvbdg5pK6g1JwTU=;
	b=ANWdMtjbnc4/+7A58MjujceF5+Ca5JER4u3ca3TTOoG6GJu/vjlBqFKiIedonCP4tO6Seo
	VDxSz9RaeFNZlGsqvE2JaUpswtdw69Vi0VGLh051jMf2mzUBXm9vUIQeTJSTuOsf5WBpu5
	vbKpH+CH+tGHAUm14pCvsgIyRIX1IeQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-151-KRhRvC0yMkWI3PHw2T8UUg-1; Thu, 03 Apr 2025 09:49:30 -0400
X-MC-Unique: KRhRvC0yMkWI3PHw2T8UUg-1
X-Mimecast-MFC-AGG-ID: KRhRvC0yMkWI3PHw2T8UUg_1743688170
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3914bc0cc4aso561138f8f.3
        for <linux-doc@vger.kernel.org>; Thu, 03 Apr 2025 06:49:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743688169; x=1744292969;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lRqdczoDWYZxO2i1hbydlrSlY7SaWvbdg5pK6g1JwTU=;
        b=rrx1DEBYg5yjTgrNoKETfWqE5Fq1L+3ZJYFWBmD6oaQhspmn0KCsy+wbiXRNgQ1zG0
         dw4n/9k7ubiF6I+LUjiTnmk3QNAjKNH0XkC+P87AMdtyETNzK48ynYbJWvG4GyJ3JNH2
         ik33vZ67cT9ziYCLJba/6XPfeiQlp/zFRFua/Z1ha6Idn99gsHuDXdwhm+ZOxlyMoSy2
         NeSd0NcwMSlz2EAgqQAp+n9u+S9zYIBXEzQexe9g9luf5Y+fkdrOtbzcqC5UhEcKvsMa
         nc1u4HJP0gA4X/InBY3TCVYUDh13cxT/SyOk5mafOpLRCbr9ZHqIqQn1DZTXCI1hxnku
         ZG1A==
X-Forwarded-Encrypted: i=1; AJvYcCXLwvk1/K0LHpaYgc7HRPWQ6WA+6HlH1wv5uOd7ZGYW346JvPSCrkNsNYSQzE6Ftfp4wHuhSoBUAOI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqSSj676+Vp35Rh+vvhOe9iN2dO+5E5wEmn0NDsxjVmo53RGk9
	TDqluq2IJxgJ7Yfu9e+pKljzLDVycFiD8Ft3eEB8nB37tmMcIbhJ7mO0YXzpvA0RikNmpZCMIP/
	6l3d+nZLszTCEpHvruQh86btzdpHej7qTtj4mRIMgRCA04lcySF9P1E3T0w==
X-Gm-Gg: ASbGncvSc2s2tjPdUCyyKY8X4Pu6OIbMjbqo2hs6GP1Ln02YeaVgUiDPCocmcYbgjTP
	yv8sbT8lE5s6N3pUoSYvVW+8eM44KICU4n3zW2Nca6N1ShWgHrei1ujWoJB1waeuTIWYkIQKtnl
	6SriIeg7UBljBd0fcf4J832MJ8mYVwnGiNKr7p7NGIZ0RGkS5TRZJVJbEw3fDbtYJ/JsaH64rKm
	8H7wvFUaWqOcgckYqJfLhGvYc/5DqOJ0aAg6EY1sM8hYiHwNca5ltTiBiFSyv6lCFrysK5Z+rNz
	hoiSP7un4jhRfkN4mVVxspZbOp7rvd/Zad2Fk0A/lY0h9O2f0FNDWAs5/eHSfU24vr24SBvgtrj
	msV37VR68APEmCQFXR3Rwcf0oqumXXkFDm5PxygzQ9ck=
X-Received: by 2002:a05:6000:2706:b0:39c:1257:cd3f with SMTP id ffacd0b85a97d-39c1257d4fbmr12332859f8f.57.1743688169526;
        Thu, 03 Apr 2025 06:49:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF66xkcnMOU7ICCE3/YZPhs4roIfRz8ewz31zY+zYWAj+2qBSMMxsghtZB6Kj+6Q11d5seXPw==
X-Received: by 2002:a05:6000:2706:b0:39c:1257:cd3f with SMTP id ffacd0b85a97d-39c1257d4fbmr12332842f8f.57.1743688169131;
        Thu, 03 Apr 2025 06:49:29 -0700 (PDT)
Received: from ?IPV6:2003:cb:c70a:7b00:54a7:eb96:63bc:ccf4? (p200300cbc70a7b0054a7eb9663bcccf4.dip0.t-ipconnect.de. [2003:cb:c70a:7b00:54a7:eb96:63bc:ccf4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301b6778sm1803857f8f.46.2025.04.03.06.49.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 06:49:28 -0700 (PDT)
Message-ID: <77b19486-28ca-47e1-b506-6de604f6ec0a@redhat.com>
Date: Thu, 3 Apr 2025 15:49:27 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: update THP admin guide about non-tmpfs filesystem
 support
To: "Pankaj Raghav (Samsung)" <kernel@pankajraghav.com>,
 Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org, willy@infradead.org, linux-mm@kvack.org,
 da.gomez@kernel.org, mcgrof@kernel.org, gost.dev@samsung.com,
 linux-doc@vger.kernel.org, Pankaj Raghav <p.raghav@samsung.com>
References: <20250403103805.173761-1-kernel@pankajraghav.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250403103805.173761-1-kernel@pankajraghav.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03.04.25 12:38, Pankaj Raghav (Samsung) wrote:
> From: Pankaj Raghav <p.raghav@samsung.com>
> 
> THP support for non-tmpfs filesystem has been around for some time now.
> Update the admin guide to reflect it.
> 
> Signed-off-by: Pankaj Raghav <p.raghav@samsung.com>
> ---
>   Documentation/admin-guide/mm/transhuge.rst | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/admin-guide/mm/transhuge.rst b/Documentation/admin-guide/mm/transhuge.rst
> index dff8d5985f0f..01b7ce90d693 100644
> --- a/Documentation/admin-guide/mm/transhuge.rst
> +++ b/Documentation/admin-guide/mm/transhuge.rst
> @@ -12,8 +12,8 @@ using huge pages for the backing of virtual memory with huge pages
>   that supports the automatic promotion and demotion of page sizes and
>   without the shortcomings of hugetlbfs.
>   
> -Currently THP only works for anonymous memory mappings and tmpfs/shmem.
> -But in the future it can expand to other filesystems.
> +Currently, THP only works for anonymous memory mappings, tmpfs/shmem and
> +filesystems that support large folios.
>   
>   .. note::
>      in the examples below we presume that the basic page size is 4K and
> @@ -463,6 +463,10 @@ fields for each mapping. (Note that AnonHugePages only applies to traditional
>   PMD-sized THP for historical reasons and should have been called
>   AnonHugePmdMapped).
>   
> +The number of PMD-sized transparent huge pages currently used by
> +filesystem data (page cache) is available by reading the FileHugePages field
> +in ``/proc/meminfo``.
> +

These changed look good. Do we also want to talk about FilePmdMapped? 
(PMD-sized THPs in the page cache that are mapped in to user space using 
a PMD ?)

Do we have to distinguish it from below? (shmem also uses the page cache)

>   The number of file transparent huge pages mapped to userspace is available
>   by reading ShmemPmdMapped and ShmemHugePages fields in ``/proc/meminfo``.
>   To identify what applications are mapping file transparent huge pages, it

Previously here, but: this reads rather odd. "file transparent huge 
pages". "PMD-sized THPs specific to shmem are tracked separately ..." ?

-- 
Cheers,

David / dhildenb


