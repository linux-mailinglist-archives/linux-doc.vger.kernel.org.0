Return-Path: <linux-doc+bounces-36416-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CAB5A22AAF
	for <lists+linux-doc@lfdr.de>; Thu, 30 Jan 2025 10:51:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0AD7C3A4E50
	for <lists+linux-doc@lfdr.de>; Thu, 30 Jan 2025 09:51:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC8741B6CF0;
	Thu, 30 Jan 2025 09:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="ig49FL93"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2162F1B6D08
	for <linux-doc@vger.kernel.org>; Thu, 30 Jan 2025 09:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738230687; cv=none; b=QFh+fC18AGmqiNxIsbf7/4qjAgDehKeRYwlYCMALmePGd/YugDk2PBAja3nj4iPfVFVifwLK8AI62qdVoWdD5I81z84R6j7cZxwp+/LYyDezAxrmY/JltKZp6uT+EEev1fBUvCszfcfGE9hdy7s/MIsWeMFQRQEHDJJgAkDAzNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738230687; c=relaxed/simple;
	bh=8UIe0mbcZxGl6HAVuQAu9CV5p9fg006dvocNfZQuaCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fy3fYW6bZneJavaaVRrCDpN+MpwXz7C53jS1AczuevTcc45u5XMfxCrOhHDmFHw/IgQuWXrqCys6Ka6IMqiyCbBKeVJnUSJr6aCz1vhrmgkkfUIgjn+kBUuZJtJMQ3RJk9pVWO1z13x7RDu2neLdDlTAjLR67SyhtZgBoykuReQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=ig49FL93; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4368a293339so6427035e9.3
        for <linux-doc@vger.kernel.org>; Thu, 30 Jan 2025 01:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1738230684; x=1738835484; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/pdSjiOp9c4OOZ/yEIi55/ppp/3tp0YczNnLQ60kX3w=;
        b=ig49FL93FUTKyaZR5mLb/s/6QJvkiglhHIfcLiwX8A4vGHHp+43HY4Dp6cKu6Nwtj4
         lVbJ7ABeiC3KHCNqndAZ9Rs6EFxAbjue3hFGqZ7Jm95b8lhCVnOUEf1u4GXTGqAv2Nyk
         r8FqqNLn8v7Fu4l2T+pkYJFhyq5LfQsJVbtPg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738230684; x=1738835484;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/pdSjiOp9c4OOZ/yEIi55/ppp/3tp0YczNnLQ60kX3w=;
        b=MkRF0Z1tj7SlSm9TrIhoQh3IHdo9AcX7srOMk54knJ13SjZQYjyVCdbmPZyKou2huX
         93J8eVluSh00mNIxMClgQijbKzp831KMjLb+Mmf4OLTaN98oGSOu5CO/EIRtlEv9iqt0
         hffj/cYLvLct1tkKpK/dqrxT3oxowkoB/OV0yBNm51fB7rx+xBpcsUP1ynEX1SulL7hm
         NOnlyMI+baPAlpPAYFj/CSpue8U6ZqNFzxkWAy2D7YwGPwT4UMbB2PRLNG1gw6Y8/QG3
         DlMZ1s6uaKWg57u78xpXHoyU1UFPX5hrafZqKBrCyhTfZftFP3WM0YMpFmlTtxKoEc/q
         TASw==
X-Forwarded-Encrypted: i=1; AJvYcCWUa54Djnr3EHF6ePdBY55qrjnbCx5Mz4RP+HZdqILmYZLEV8NQV5uXX2BihzpTlomBB03kDn5Fjx0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHNKuqZXpM4QHStFNij38sZVN00RG4us7YNRPa97Kjbs56i14f
	6UzuRdDoOY+GpUrkKeSMWPuGn5hm21HNQsu01h6xJsRom1bdziNjNqycE9jGnC4=
X-Gm-Gg: ASbGnctVoGyAcVAKOJx7wUiSO9vLq6uxinMch2JWECEbbwwLNxpkqhCqckWQweR0pSq
	FS2unhocBq8+f3I8Y2618nDnDFUus1/yoMyNDvRKQ1UV7tcOiHYOkIbH9pzBlgXs5O7HWHg1mJY
	HR/SBuSrQR5hSjEwEn10B90eg48pqKsNyK94SIsXtpqz4J4hZVa6CzKcKmDyz7mMCCU+T5enrMr
	wE2Nt2VnP9C+Q5uzsz6Na/vrcfUM9x3bAQKpFaehXXwasleioDIxTS27l3+q29Qbn3x7rq7vvu1
	LGjOcj8YfrMXv7hpHeHkS8inY9U=
X-Google-Smtp-Source: AGHT+IF1314un3GQgKorQlU7Ooz/rQrCyj9j2D9rJRU+9J5toI9CX1diHYvVJ9K+Omvgaz97Oy+yBw==
X-Received: by 2002:a05:600c:1d82:b0:438:a240:c55 with SMTP id 5b1f17b1804b1-438e298e709mr9982485e9.1.1738230684290;
        Thu, 30 Jan 2025 01:51:24 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e245efbcsm16833505e9.33.2025.01.30.01.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 01:51:23 -0800 (PST)
Date: Thu, 30 Jan 2025 10:51:21 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
	nouveau@lists.freedesktop.org,
	Andrew Morton <akpm@linux-foundation.org>,
	=?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Peter Xu <peterx@redhat.com>, Alistair Popple <apopple@nvidia.com>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v1 05/12] mm/memory: detect writability in
 restore_exclusive_pte() through can_change_pte_writable()
Message-ID: <Z5tLmYOQaZrdWQHN@phenom.ffwll.local>
Mail-Followup-To: David Hildenbrand <david@redhat.com>,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
	nouveau@lists.freedesktop.org,
	Andrew Morton <akpm@linux-foundation.org>,
	=?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Peter Xu <peterx@redhat.com>, Alistair Popple <apopple@nvidia.com>,
	Jason Gunthorpe <jgg@nvidia.com>
References: <20250129115411.2077152-1-david@redhat.com>
 <20250129115411.2077152-6-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250129115411.2077152-6-david@redhat.com>
X-Operating-System: Linux phenom 6.12.11-amd64 

On Wed, Jan 29, 2025 at 12:54:03PM +0100, David Hildenbrand wrote:
> Let's do it just like mprotect write-upgrade or during NUMA-hinting
> faults on PROT_NONE PTEs: detect if the PTE can be writable by using
> can_change_pte_writable().
> 
> Set the PTE only dirty if the folio is dirty: we might not
> necessarily have a write access, and setting the PTE writable doesn't
> require setting the PTE dirty.

Not sure whether there's much difference in practice, since a device
exclusive access means a write, so the folio better be dirty (unless we
aborted halfway through). But then I couldn't find the code in nouveau to
do that, so now I'm confused.
-Sima

> With this change in place, there is no need to have separate
> readable and writable device-exclusive entry types, and we'll merge
> them next separately.
> 
> Note that, during fork(), we first convert the device-exclusive entries
> back to ordinary PTEs, and we only ever allow conversion of writable
> PTEs to device-exclusive -- only mprotect can currently change them to
> readable-device-exclusive. Consequently, we always expect
> PageAnonExclusive(page)==true and can_change_pte_writable()==true,
> unless we are dealing with soft-dirty tracking or uffd-wp. But reusing
> can_change_pte_writable() for now is cleaner.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  mm/memory.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/mm/memory.c b/mm/memory.c
> index 03efeeef895a..db38d6ae4e74 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -725,18 +725,21 @@ static void restore_exclusive_pte(struct vm_area_struct *vma,
>  	struct folio *folio = page_folio(page);
>  	pte_t orig_pte;
>  	pte_t pte;
> -	swp_entry_t entry;
>  
>  	orig_pte = ptep_get(ptep);
>  	pte = pte_mkold(mk_pte(page, READ_ONCE(vma->vm_page_prot)));
>  	if (pte_swp_soft_dirty(orig_pte))
>  		pte = pte_mksoft_dirty(pte);
>  
> -	entry = pte_to_swp_entry(orig_pte);
>  	if (pte_swp_uffd_wp(orig_pte))
>  		pte = pte_mkuffd_wp(pte);
> -	else if (is_writable_device_exclusive_entry(entry))
> -		pte = maybe_mkwrite(pte_mkdirty(pte), vma);
> +
> +	if ((vma->vm_flags & VM_WRITE) &&
> +	    can_change_pte_writable(vma, address, pte)) {
> +		if (folio_test_dirty(folio))
> +			pte = pte_mkdirty(pte);
> +		pte = pte_mkwrite(pte, vma);
> +	}
>  
>  	VM_BUG_ON_FOLIO(pte_write(pte) && (!folio_test_anon(folio) &&
>  					   PageAnonExclusive(page)), folio);
> -- 
> 2.48.1
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

