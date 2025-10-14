Return-Path: <linux-doc+bounces-63282-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DBFBD97E7
	for <lists+linux-doc@lfdr.de>; Tue, 14 Oct 2025 15:00:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9616E3E507E
	for <lists+linux-doc@lfdr.de>; Tue, 14 Oct 2025 12:59:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA012313E26;
	Tue, 14 Oct 2025 12:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H2ver2Ms"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EECBE313E00
	for <linux-doc@vger.kernel.org>; Tue, 14 Oct 2025 12:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760446782; cv=none; b=U9WQ6G11PQtCOW61ucF8YFNLkYBbifUukx48p5uWEoXWc8o16QspzBeno9l8sSy3v/QO8iU/FkdZ8yPQe7ay9CvUlzGNsSpLPLhlUjtCePN7oP1YGJ0rQCVrmD/VwDsNf+vdCkkad1Fm46H190jMZC/urnAeTUlPxLXUcKhD7dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760446782; c=relaxed/simple;
	bh=Z1Th0V3A9t5q0RL6uoXSwWvKS3kowUSTZ0Ef18CL46Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Be1XtKu2N6ahCVmmKEUFSNztzd0fvf6ydMg8TzgrK4KBPLLOjSPe6OmJu2/LgpftUtK14DlNacsh44bgb6x0xeTfTKFIUkhqeHesU6yzny2PuAB9US/zlqWTSBZwN7HVXA4igswCvvoIuc9/MLon6fJ4Cl25IeC2UrmKL+sFN7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H2ver2Ms; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760446780;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=iu1mp0L5rze+u9w9cyraP7Gulphe1rkUj/3PhF2TPeI=;
	b=H2ver2Ms/W4BTWyV5as0l2Ig7cuvlJeaZlwkZBmK7p9EpTLxtLlBZjYMdhHGPU+UsmXA4D
	nL+gB82GZi0kUS+l2JfSTu9H8pDFFBd9DDh8vXLv/8dgcRX7lnvkTsu3cmRl9wEhG1Dvf9
	QBOlWb5VZuBswmCfzTvQYH+GiM+oGw0=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-436--T7vfgE5OtavQgrHLsj7hA-1; Tue, 14 Oct 2025 08:59:34 -0400
X-MC-Unique: -T7vfgE5OtavQgrHLsj7hA-1
X-Mimecast-MFC-AGG-ID: -T7vfgE5OtavQgrHLsj7hA_1760446773
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-aff0df4c4abso726526266b.1
        for <linux-doc@vger.kernel.org>; Tue, 14 Oct 2025 05:59:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760446773; x=1761051573;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iu1mp0L5rze+u9w9cyraP7Gulphe1rkUj/3PhF2TPeI=;
        b=MkJjkKE9RYmAynnG4+bwREJX8Nasa/Zt9fu0pRJnH1Gcdc/73gmv5GG5uEu2KlgnTb
         Fjn8hi5w7vEQSxMZLapCgcdf4Q7kvnkeMLqYeP3f5o9lF+/wzIagTEQFbM2supr1cTzW
         Qx+jJb9VyuX3BsMDbM+otP6nOuy+hu72bCu6vTjh8EIorOYtsgrIHJ07f2Lw1ksVga6d
         iy0VTcBxt9px9/GdINh+APbL9VpUoVnSEdjhaAmXJevLBfn/Xtxrnl/yzF0mFMQUSC/z
         d6Hazmsgv0nnZ3WF4UVWi2cXjhZ7ZDf2isz7r2eZVj9H4Cro6Y46qY+GNMqwxxd25cmR
         wBdg==
X-Forwarded-Encrypted: i=1; AJvYcCXcFFoGlYc1Vo+ZMCcGkNH3CCB6latPfQlWZlbApuIy+nkGDvS9HCkHjXXAR25pTFufI2vJh/ErqvA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+9/mHQDF22r1/BfUsMTuwPDYsU42ur1qTRl72M7iP3BOIP7nm
	aLshV97CBLgE9tPbNiu9BBe7QbHXFLHwmaA0lpTMY3VruMYvdGPLYLBSWxaW0Yc1eLQPWKqc1Rd
	4Z7Rl478mH7Semgngp08c4w404Cq1PgNmi2WiOXGqQFhuEM//kCZ3XsTvSHv/mswC1nTLKw==
X-Gm-Gg: ASbGnct32jl+5/Aw04LNEAbNytcHqEetSIr4U67Mp5u5Ii8qkMvTaXl25gVyOuoYQN7
	SEtI1Vps0e8IEtiDVEfno8kO35qjS4py9kmghcSCxTfYwvetubNdGNb0jQRNjaGiA33vM8jU+qV
	05kCzg8NNts/fzNKtpFgvDUJHnZF92K7VPj1IL4N7fcCsj+bcq7c8ADOh6V0jyH2UA8ZvAfCxGX
	P2f3kBc0c2zwrFJHglEYcgWU2bnec96EC5WXY/Rg2peem9tPxcAgxllBlBTi5oACyV3ZwWeQC24
	OeZr35GipzkQBCexIIEeTbmLi9nlFFJSX4GmCjUzM63rRzpjKjEZ4QlqXvbzow7GnDZo0jZ9pA=
	=
X-Received: by 2002:a17:906:f5a5:b0:b29:c2ae:78f8 with SMTP id a640c23a62f3a-b50ac5d08bamr2706962766b.46.1760446773162;
        Tue, 14 Oct 2025 05:59:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkEiy+cHw9UIH18Z36gnOBTWV4pz/7vpgUvMjb/aSdBKnsv8qXvi1i95BnCc/gOYElOXfN6Q==
X-Received: by 2002:a17:906:f5a5:b0:b29:c2ae:78f8 with SMTP id a640c23a62f3a-b50ac5d08bamr2706957766b.46.1760446772515;
        Tue, 14 Oct 2025 05:59:32 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b58244d17e1sm725071566b.75.2025.10.14.05.59.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 05:59:31 -0700 (PDT)
Message-ID: <71380b43-c23c-42b5-8aab-f158bb37bc75@redhat.com>
Date: Tue, 14 Oct 2025 14:59:30 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 20/20] mm: stop maintaining the per-page mapcount of
 large folios (CONFIG_NO_PAGE_MAPCOUNT)
To: Wei Yang <richard.weiyang@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 cgroups@vger.kernel.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 linux-api@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>, Tejun Heo <tj@kernel.org>,
 Zefan Li <lizefan.x@bytedance.com>, Johannes Weiner <hannes@cmpxchg.org>,
 =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 Muchun Song <muchun.song@linux.dev>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>
References: <20250303163014.1128035-1-david@redhat.com>
 <20250303163014.1128035-21-david@redhat.com>
 <20251014122335.dpyk5advbkioojnm@master>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <20251014122335.dpyk5advbkioojnm@master>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14.10.25 14:23, Wei Yang wrote:
> On Mon, Mar 03, 2025 at 05:30:13PM +0100, David Hildenbrand wrote:
> [...]
>> @@ -1678,6 +1726,22 @@ static __always_inline void __folio_remove_rmap(struct folio *folio,
>> 		break;
>> 	case RMAP_LEVEL_PMD:
>> 	case RMAP_LEVEL_PUD:
>> +		if (IS_ENABLED(CONFIG_NO_PAGE_MAPCOUNT)) {
>> +			last = atomic_add_negative(-1, &folio->_entire_mapcount);
>> +			if (level == RMAP_LEVEL_PMD && last)
>> +				nr_pmdmapped = folio_large_nr_pages(folio);
>> +			nr = folio_dec_return_large_mapcount(folio, vma);
>> +			if (!nr) {
>> +				/* Now completely unmapped. */
>> +				nr = folio_large_nr_pages(folio);
>> +			} else {
>> +				partially_mapped = last &&
>> +						   nr < folio_large_nr_pages(folio);
> 
> Hi, David

Hi!

> 
> Do you think this is better to be?
> 
> 	partially_mapped = last && nr < nr_pmdmapped;

I see what you mean, it would be similar to the CONFIG_PAGE_MAPCOUNT 
case below.

But probably it could then be

	partially_mapped = nr < nr_pmdmapped;

because nr_pmdmapped is only set when "last = true".

I'm not sure if there is a good reason to change it at this point 
though. Smells like a micro-optimization for PUD, which we probably 
shouldn't worry about.

> 
> As commit 349994cf61e6 mentioned, we don't support partially mapped PUD-sized
> folio yet.

We do support partially mapped PUD-sized folios I think, but not 
anonymous PUD-sized folios.

So consequently the partially_mapped variable will never really be used 
later on, because the folio_test_anon() will never hit in the PUD case.

-- 
Cheers

David / dhildenb


