Return-Path: <linux-doc+bounces-64095-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D1845BF8214
	for <lists+linux-doc@lfdr.de>; Tue, 21 Oct 2025 20:43:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9445C4E30CA
	for <lists+linux-doc@lfdr.de>; Tue, 21 Oct 2025 18:43:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 933272571DE;
	Tue, 21 Oct 2025 18:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QFUiTydi"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C150D34D93E
	for <linux-doc@vger.kernel.org>; Tue, 21 Oct 2025 18:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761072196; cv=none; b=p6xEk+XVw2bFpOZkuFkKX2cv9qPd2LTmBY54XkR3tt7vcAKh0BQlVmMVH63yY/VDPa39RzjthOS1bTBR3gPP6tcCDgrYlst0AFbmwqkBrfGwCheojMuUW7pAQUe90zRS5TUw0ECfpliZXGgXz+uFT0baXjuD2ZyYeQRkBKb9Vgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761072196; c=relaxed/simple;
	bh=pk4QGgGHYEy1ITQUuv5ZBh9SCV9ju+FTCz1WTQv0wHw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iIv0D1WfHtc2KzC0TsXSVfVQi99XRJKAP8m1arH9gZIhuRVc8G0pYNe+37qv4mbBnGStCvgkKcFJvQh9uf4sVFC2ilUg1lSSBAOKWTzBkDt59xBjeKCQRgySMuIwSR7sgn2Wv0uAvwre5UC4oQ402LhUULsBlsEcPlAA3blQbU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QFUiTydi; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761072193;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=4/1n5Qmv6fUzICSy7SJ2nfo+Y+QoRpq1dX3+wvV2FX4=;
	b=QFUiTydi2xdwvKtLBbSkPXPfhxVqOg/ww4e8Bf9GK4C98yOF9txblKnAPjDWa6RMaODw3p
	mVNceFutpVGp7crQWv4sAEAK3aEEpP8e9/F98n87UjJYHHRDtnvf1gJBCj16ZmfTDI+dws
	bxixijqyevKI2Vbfj9nf1//EYuKxTbk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-108-JHhwSZ3wP3ieblf53xmEwA-1; Tue, 21 Oct 2025 14:43:12 -0400
X-MC-Unique: JHhwSZ3wP3ieblf53xmEwA-1
X-Mimecast-MFC-AGG-ID: JHhwSZ3wP3ieblf53xmEwA_1761072191
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-47105bfcf15so32975765e9.2
        for <linux-doc@vger.kernel.org>; Tue, 21 Oct 2025 11:43:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761072191; x=1761676991;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4/1n5Qmv6fUzICSy7SJ2nfo+Y+QoRpq1dX3+wvV2FX4=;
        b=JPO0JjWHdBR7aeBpBp/5JOjocmd95fF62OB4C1a+zQa7Da8rH9qXxB5lohkWw/pqRc
         MNPGWPLXxoyCkvvHF4vO6g/PXT4Irzjcc5nHQEUUAi2757n9vMD8++RMbwHOmEDoBHuz
         zQW5cTSPQ0tS/V93EjNGkdnhHSlEIrtKxn5nejVgZTRBsPTZlkb9HlzFAuOhV4lJoq+s
         azcfp29CgkSF1b78eW+37G29JxYFcfWPTAeTgFXYYuF5t1/LUCOE3NXV/wBtVfUUCH42
         IFmsnoZ3sWhQosZqv81LU59cUQLfAsAlqlMvzwC1aL5xCuWKLY9XKqF3ew/KNXgGR6+L
         IkaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWx5i1Mv8INZFGmSKTlN0gUIUzH8E1UErNODSztUd+kDg+YvBCReF93inj07BV7Zg6UPjbdX2d1Frg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOEYNiUJ1KkS+PKD5Z063cnf2qWndl8Hp+AwUH6aQzGaom0Pp8
	QLgebsQeNfSIwyNaGB0OZAJyD/LPTj3Xz0NgiPYkwYX5NohCDm8LCieME33XEcHEXi8xPQ+udaP
	fKyaUMDYalsqIC2YKD33ggz5m27AaOtCKuIDQeTBWbxxTYaXLu+04bVOUs3JoDw==
X-Gm-Gg: ASbGnctAjqwhdS4zfppspFyQjYh4Qbx8ZMeVIPyJJP1xVCxnQizklhXm38/5LVEjTbi
	tiHY8FkrzNnbpwcdW7ssUntVZ7akNOV5gNghgjAgRxefuu3DrWG4YqSvp9TlWpCJwtx8p1so1vb
	579Tkfac01TZir3goAlvUBEHbV+GEHVCF3jeUHi2+0af6dyS3KaAr6GoZOqNHgEXEJV7T4JZ1du
	fHITuJyYhvyXFbn/MWEDhs9s0wnRiallA8T9HF4ByhxqirJOGzAgzVerbD6kTRggsoYN9whxNgd
	REVNEso2g1wAftqDsnZz/D7kZEY9IYPg7Qsr6w5PUFEyG3I+lEq9HZxYpVQZNiCZsWpufXK5pnn
	PiQfSyu28Nyei7ItS0MsL/vC6hJFKPNFwJQlOnyEGbXrWP4dudRHKZivDnFeLb69548BYgcmeCF
	aawqELzaAh1zDApMw3iZlB6wMgjDY=
X-Received: by 2002:a05:600c:444d:b0:471:15bb:ad7f with SMTP id 5b1f17b1804b1-471178b04cfmr118237645e9.17.1761072191202;
        Tue, 21 Oct 2025 11:43:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGF48PaGIZJJ8yDfzibDZrtRJ8BYf6TIUYzgr5nqD6RJbRA6dQ/xlt74jqHg+pveBdy6E8oUw==
X-Received: by 2002:a05:600c:444d:b0:471:15bb:ad7f with SMTP id 5b1f17b1804b1-471178b04cfmr118237325e9.17.1761072190791;
        Tue, 21 Oct 2025 11:43:10 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3? (p200300d82f4e3200c99da38b3f3ad4b3.dip0.t-ipconnect.de. [2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c438caeesm4880295e9.18.2025.10.21.11.43.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 11:43:10 -0700 (PDT)
Message-ID: <5e35a398-af4e-4c54-9285-4202da08f456@redhat.com>
Date: Tue, 21 Oct 2025 20:43:08 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 20/23] mm/kconfig: make BALLOON_COMPACTION depend on
 MIGRATION
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, linux-doc@vger.kernel.org,
 virtualization@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>,
 Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Arnd Bergmann
 <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jerrin Shaji George <jerrin.shaji-george@broadcom.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?=
 <eperezma@redhat.com>, Zi Yan <ziy@nvidia.com>
References: <20251021125929.377194-1-david@redhat.com>
 <20251021150040.498160-1-david@redhat.com>
 <20251021150040.498160-4-david@redhat.com>
 <3ba11b0c-818f-41d5-8885-038c7e0133f5@infradead.org>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <3ba11b0c-818f-41d5-8885-038c7e0133f5@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21.10.25 19:13, Randy Dunlap wrote:
> 
> 
> On 10/21/25 8:00 AM, David Hildenbrand wrote:
>> Migration support for balloon memory depends on MIGRATION not
>> COMPACTION. Compaction is simply another user of page migration.
>>
>> The last dependency on compaction.c was effectively removed with
>> commit 3d388584d599 ("mm: convert "movable" flag in page->mapping to a
>> page flag"). Ever since, everything for handling movable_ops page
>> migration resides in core migration code.
>>
>> So let's change the dependency and adjust the description +
>> help text.
>>
>> We'll rename BALLOON_COMPACTION separately next.
>>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>   mm/Kconfig | 17 +++++++----------
>>   1 file changed, 7 insertions(+), 10 deletions(-)
>>
>> diff --git a/mm/Kconfig b/mm/Kconfig
>> index e47321051d765..3aff4d05a2d8c 100644
>> --- a/mm/Kconfig
>> +++ b/mm/Kconfig
>> @@ -599,17 +599,14 @@ config MEMORY_BALLOON
>>   #
>>   # support for memory balloon compaction
>>   config BALLOON_COMPACTION
>> -	bool "Allow for balloon memory compaction/migration"
>> +	bool "Allow for balloon memory migration"
>>   	default y
>> -	depends on COMPACTION && MEMORY_BALLOON
>> -	help
>> -	  Memory fragmentation introduced by ballooning might reduce
>> -	  significantly the number of 2MB contiguous memory blocks that can be
>> -	  used within a guest, thus imposing performance penalties associated
>> -	  with the reduced number of transparent huge pages that could be used
>> -	  by the guest workload. Allowing the compaction & migration for memory
>> -	  pages enlisted as being part of memory balloon devices avoids the
>> -	  scenario aforementioned and helps improving memory defragmentation.
>> +	depends on MIGRATION && MEMORY_BALLOON
>> +	help
>> +	  Allow for migration of pages inflated in a memory balloon such that
>> +	  they can be allocated from memory areas only available for movable
>> +	  allocations (e.g., ZONE_MOVABLE, CMA) and such that they can get
> 
> nit:
> s/get/be/

Thanks!

-- 
Cheers

David / dhildenb


