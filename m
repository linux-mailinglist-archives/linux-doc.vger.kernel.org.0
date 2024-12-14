Return-Path: <linux-doc+bounces-32786-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E8B9F1FA8
	for <lists+linux-doc@lfdr.de>; Sat, 14 Dec 2024 16:23:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A089018864AF
	for <lists+linux-doc@lfdr.de>; Sat, 14 Dec 2024 15:23:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF2E719580F;
	Sat, 14 Dec 2024 15:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BIG1Fg7c"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7361818AE2
	for <linux-doc@vger.kernel.org>; Sat, 14 Dec 2024 15:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734189789; cv=none; b=OxZoE0tlUJSXuzxO2HKwoxZ9nZUiZRHWYmpn5G+4uaC8PlR+WIkawZx+kqfG3H3/k+vjK896453XrJZX8VMwzme05ni5sVechCYDujO7MuHEKDGav0Fs/zJQGouR+TtraPEJZ3NfF1sHrmVbHKX0EH02ZkO8XqIRhe3Tqm8kGOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734189789; c=relaxed/simple;
	bh=jkdG9VVa/wTY2yy0geXHQ0O4Psz84VzAmqde2au0yKQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tJUkyWst5Qz1XerSe2aQhGZM3qHFMVYE2ZHdpKHo92r8Dh0B/u///X9XdCV89/BGI7UEo0E4E6DmWKMfAYrSQO28jGpZ0VBLK0HDosFukFQVGPR229Uyn35i2rJU+VClqODG8VVxgz8gGWmI3/PVEIMoq4AToXx3HPFR5yccDd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BIG1Fg7c; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734189786;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=WzJW0Dxa8i83uf13tdPe4mY1mNQ+O1FvKqm+giPK/c8=;
	b=BIG1Fg7cBowd/4jA60lw1bJBtWceFt6kO1fIEdNSompe1HrvrtegBNcY2JBagu3I/EbPGK
	VZwlVlTG9+vWRBAoMwy4Afvhnw5wcVvwaNEg0wgGABQD9ja1jKy6Vj+PweSmM/b+PDVQSp
	mQjgAHqHS9LFXme/Zfi+ReJWxXv4+js=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554-sTttvni_P5eXs2r2Hp8qNA-1; Sat, 14 Dec 2024 10:23:04 -0500
X-MC-Unique: sTttvni_P5eXs2r2Hp8qNA-1
X-Mimecast-MFC-AGG-ID: sTttvni_P5eXs2r2Hp8qNA
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-436228ebc5eso15412465e9.3
        for <linux-doc@vger.kernel.org>; Sat, 14 Dec 2024 07:23:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734189783; x=1734794583;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WzJW0Dxa8i83uf13tdPe4mY1mNQ+O1FvKqm+giPK/c8=;
        b=p4EZHx6ulAG7iyomKCdsYA8Qvhi65odCkQgqA97sCNZUx1IDf7JZPKWioAw3vRWawk
         ZsWCT2+jkWu3lkYoxk1oZJyGDf0v6PL0W8als2bgaP9cCLuqm54Q6w337Lo/LGbyjcJ4
         9PJT6aWhzkSducQ/WKSpELbbApL5uGZ/JwRNxFRkAfmoRzXRY7TR42V1TeKpXKhi2qU3
         cdytBNz+h5lD8DuNskjuaUxZGtNGc72myiPcG+aazGZYfbwlf8XRhTS+uSypSO/wMiH9
         ZMHYWUQRJlwPbmLiQYcGuwXLjfn8pl6RXLGLJn3WL1gjFUmuSOn6YJ2an/EYWeenU+Vd
         h8uw==
X-Forwarded-Encrypted: i=1; AJvYcCU6UVBQNqf80/1NClS/UO8ZE+jubOD+z17oAL5MOqZm/6fFO8fUU34++hsnBJi69uBh+9wb/mWMqrQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1sIjmNLNuTmb/oVyc0953aI7Pv7RKFWgRYDIYfZMp4WgSQXuk
	mBfibHQCXh5lesUhzSAXSNWokA5sqRHLNGdjQtLbWqf6fKXVi0A+jYnffmiMSfm6Lw9UKigbiAP
	0lsajyvBflUxtvYNuVUDglO1VxNSY1My/8I7faQ/gQONBaUufek0Fs+vGlQ==
X-Gm-Gg: ASbGncuxoPYIUfyDwxPbMHx3y5Ms4YNTncJmNr6SJ8SdeAxyjh9FoQuiMrbHEUgeNx5
	N89WSvJa5Mwy3MRsEDEviGGmQAAfg7jTs736N6rfKcJaiwZ3Di7B/SKIscVOsa7bfHZ1VkcUeTA
	lDPSyhJvQRR0liTgIF6mpt8ZtoPippSVwLsGnQZzg0UV7EVdG5MEO2nkDrreeqqDsNZCldNhiUA
	MF1qbxZI6wQrlsnSgDNsT9lCs07jzRhcRcODyiuvuVdFqDKGYWWXd0ALYyGwkdKgoURfp0LJAma
	bR5/f+qlKZ3D9VwL5AHrWssGFlwrcA8PuTXIX7bOT3CwBff99m+QLQi7RYVS9xBhW9vt0rfoNoq
	b8x+dqraN
X-Received: by 2002:a05:600c:1c07:b0:434:a968:89a3 with SMTP id 5b1f17b1804b1-4362aa2e544mr63037965e9.9.1734189783528;
        Sat, 14 Dec 2024 07:23:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFroEMk6tFJ9Cy5+aMYXPulXjntj5yFN5KYCR5CVhsKcoZETtTRpp5EY+z8zXmRnRx7Xb1Kzg==
X-Received: by 2002:a05:600c:1c07:b0:434:a968:89a3 with SMTP id 5b1f17b1804b1-4362aa2e544mr63037545e9.9.1734189783051;
        Sat, 14 Dec 2024 07:23:03 -0800 (PST)
Received: from ?IPV6:2003:cb:c711:6400:d1b9:21c5:b517:5f4e? (p200300cbc7116400d1b921c5b5175f4e.dip0.t-ipconnect.de. [2003:cb:c711:6400:d1b9:21c5:b517:5f4e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43625550518sm82347835e9.5.2024.12.14.07.22.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Dec 2024 07:23:01 -0800 (PST)
Message-ID: <45555f72-e82a-4196-94af-22d05d6ac947@redhat.com>
Date: Sat, 14 Dec 2024 16:22:58 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/25] fs/dax: Fix ZONE_DEVICE page reference counts
To: Dan Williams <dan.j.williams@intel.com>,
 Alistair Popple <apopple@nvidia.com>, linux-mm@kvack.org
Cc: lina@asahilina.net, zhang.lyra@gmail.com, gerald.schaefer@linux.ibm.com,
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
 david@fromorbit.com, akpm@linux-foundation.org, sfr@canb.auug.org.au
References: <cover.e1ebdd6cab9bde0d232c1810deacf0bae25e6707.1732239628.git-series.apopple@nvidia.com>
 <675ce1e5a3d68_fad0294d0@dwillia2-xfh.jf.intel.com.notmuch>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <675ce1e5a3d68_fad0294d0@dwillia2-xfh.jf.intel.com.notmuch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14.12.24 02:39, Dan Williams wrote:
> [ add akpm and sfr for next steps ]
> 
> Alistair Popple wrote:
>> Main updates since v2:
>>
>>   - Rename the DAX specific dax_insert_XXX functions to vmf_insert_XXX
>>     and have them pass the vmf struct.
>>
>>   - Seperate out the device DAX changes.
>>
>>   - Restore the page share mapping counting and associated warnings.
>>
>>   - Rework truncate to require file-systems to have previously called
>>     dax_break_layout() to remove the address space mapping for a
>>     page. This found several bugs which are fixed by the first half of
>>     the series. The motivation for this was initially to allow the FS
>>     DAX page-cache mappings to hold a reference on the page.
>>
>>     However that turned out to be a dead-end (see the comments on patch
>>     21), but it found several bugs and I think overall it is an
>>     improvement so I have left it here.
>>
>> Device and FS DAX pages have always maintained their own page
>> reference counts without following the normal rules for page reference
>> counting. In particular pages are considered free when the refcount
>> hits one rather than zero and refcounts are not added when mapping the
>> page.
>>
>> Tracking this requires special PTE bits (PTE_DEVMAP) and a secondary
>> mechanism for allowing GUP to hold references on the page (see
>> get_dev_pagemap). However there doesn't seem to be any reason why FS
>> DAX pages need their own reference counting scheme.
>>
>> By treating the refcounts on these pages the same way as normal pages
>> we can remove a lot of special checks. In particular pXd_trans_huge()
>> becomes the same as pXd_leaf(), although I haven't made that change
>> here. It also frees up a valuable SW define PTE bit on architectures
>> that have devmap PTE bits defined.
>>
>> It also almost certainly allows further clean-up of the devmap managed
>> functions, but I have left that as a future improvment. It also
>> enables support for compound ZONE_DEVICE pages which is one of my
>> primary motivators for doing this work.
> 
> So this is feeling ready for -next exposure, and ideally merged for v6.14. I
> see the comments from John and Bjorn and that you were going to respin for
> that, but if it's just those details things they can probably be handled
> incrementally.
> 
> Alistair, are you ready for this to hit -next?
> 
> As for which tree...
> 
> Andrew, we could take this through -mm, but my first instinct would be to try
> to take it through nvdimm.git mainly to offload any conflict wrangling work and
> small fixups which are likely to be an ongoing trickle.
> 
> However, I am not going to put up much of a fight if others prefer this go
> through -mm.
> 
> Thoughts?

I'm in the process of preparing v2 of [1] that will result in conflicts 
with this series in the rmap code (in particular [PATCH v3 14/25] 
huge_memory: Allow mappings of PUD sized pages).

I'll be away for 2 weeks over Christmas, but I assume I'll manage to 
post v2 shortly.

Which reminds me that I still have to take a closer look at some things 
in this series :) Especially also #14 regarding accounting.

I wonder if we could split out the rmap changes in #14, and have that 
patch simply in two trees? No idea.

[1] 
https://lore.kernel.org/all/20240829165627.2256514-1-david@redhat.com/T/#u

-- 
Cheers,

David / dhildenb


