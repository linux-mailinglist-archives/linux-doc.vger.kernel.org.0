Return-Path: <linux-doc+bounces-51367-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99429AEF4E3
	for <lists+linux-doc@lfdr.de>; Tue,  1 Jul 2025 12:19:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DAE653AADC1
	for <lists+linux-doc@lfdr.de>; Tue,  1 Jul 2025 10:19:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D752126E6E4;
	Tue,  1 Jul 2025 10:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hP4FIARG"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A3026D4F2
	for <linux-doc@vger.kernel.org>; Tue,  1 Jul 2025 10:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751365195; cv=none; b=aHJOCyS3n6ebHdZY96NIQ/L2GleKZoo9aypqgIvWH+3E0ptN9tUAn7NO/poDFfMyv6wQbHK5wiMG6Q85GmAsmvWHKkqPJ6TvLaZ/UunxRm4E50XS/DGju8X3Jh139UOtJfnt/M9H5ZkfvSZie7PrDytGQmpDR9z30tVG2L9/NwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751365195; c=relaxed/simple;
	bh=eWXCqLdIdfgzszHNKbWVBcVaZ/f1SJiLTZ8B2Fxl6KM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LBryG6OAyyAYKuN1Nx2uNbNIZdGheFzefBbY8MfWhh9cui+UBovrGt5I6OI3rGB+J+TQL8st7fuEHRgE5J9LL+3Pmp8BQCvp/9LkNh7BrlmIRzE1Jx4zY4MbO+btJhzEccD7ZuX3aj3z+gsJLcRVexsXbSgwhFlwCoIZgcb62tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hP4FIARG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751365193;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=F4jCtuuDml1rKQTvhcRaw4++6CgpogXopSkG6zuHOew=;
	b=hP4FIARGLZg6aDGishO5XGwX4BLjwYeXc9hMnOLTn9nKzWGVHr96u+tdM+58gKJU12O2Rz
	EXb3D1TP5ZiwOgpj6xl0MVfW0S7k2ZAQ3ywjg0jMt2oLQH1BLaNrcNv4R0q2OPJAPYpuKA
	nNEGYXLbu55SpJTdvYI/mOuHYpbmYUE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554-DjO91Ft4PwyJHpKZOVX3bw-1; Tue, 01 Jul 2025 06:19:52 -0400
X-MC-Unique: DjO91Ft4PwyJHpKZOVX3bw-1
X-Mimecast-MFC-AGG-ID: DjO91Ft4PwyJHpKZOVX3bw_1751365191
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-451ac1b43c4so27157715e9.0
        for <linux-doc@vger.kernel.org>; Tue, 01 Jul 2025 03:19:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751365191; x=1751969991;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=F4jCtuuDml1rKQTvhcRaw4++6CgpogXopSkG6zuHOew=;
        b=LwzwvfsQwJy4MsFHhyB3KVRWuwztKmDReO0ZOETYqMmqN+HKLwt61cGLgKBdzLxq6G
         sIPG87qvGBQeb5onOPYWqa2vkBZQVz4xMCVGHgnfDCBiFF+DOnEZZV9HNblMLLBUMa13
         HTN4wlDWhVgHcOVMpgjcO1TU8lp/X/tyrqkFZAFwKZpPGsowr9nbPPlQkY+phy5YcXAc
         uesmz1MCvG8/SSy1iKRdtwkM1ImXzbE/AY4m5vOBJBhX4G0y9aw4jbpL1LxdzH6emPk4
         JXHm9Ae7Bsfzjp+rDsjmfHI9uOqEgBXgfcAalpDc/0cgwVS0zneOFaGipL0yV3akXxRJ
         R4Mg==
X-Forwarded-Encrypted: i=1; AJvYcCVq7B4tPRbLpX+IvTyzG1fdI+WWiA7PlxJETaIDlCRIcp/5dsBD0baSAi/lIuApjfyz90iGK+efxJ0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFerF8pJxjFBdZrsiGAaMMTuaOTG38kvNFKAjva8v0PvRI440c
	1UUiXewZp42lPbVjgIM2nj68c9G8VpM/P2dBb3tPTGhUNH06upK6gSda9u4B6O1Uts4JAP9D9zl
	U1nCLuIuwOjz5PILZ2YSX272sKGaVES7MQToj73RKOsXiU5+GkvIPiW0g3RHNTA==
X-Gm-Gg: ASbGncudMDD1FF35k32RPwLFZXRY9vdDKQAhz1vUtkIHXT7eEQ1RtWykNwlsgP6kJFF
	RLqKzdxfpfJZ0Q1Dj9ioP5u8CIevAxxBBRIXOpHiBGLckoIZ3zMrsGSEp/5BIV2yzfCzBvQKgAN
	8Jw6a57zgh7O0ETDlfGFoFCiX2rdfMbDEh7rPNAZxUYCXGP1jLHbUznxZ9LNUMkYZIaGfW/ZwaP
	atItmv2zfWGQuOESDAnu5m7/v2xlNcMrvbWqu7WtH5OTSa0EBckyHtAbvd3nwxrrrnAxm2boWSQ
	rJel9OVD7C58JcR2FbEfru+KvGTHLmolAIU09mIsnu42eeC9q+c3ZfB5CGEPgD4EwI9U7vYm8Q0
	njVx6ZtaLNbpUFxIdSaI8dbCY0Z74vTweQ8TDqz8eEU5ve8iwww==
X-Received: by 2002:a05:600c:8b6f:b0:43c:fe15:41dd with SMTP id 5b1f17b1804b1-4538f9b3107mr146369295e9.6.1751365190648;
        Tue, 01 Jul 2025 03:19:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHpCA3mH1COjv0bYFBhoLOUBhwD5kNXEqvEScAb8vhGq9c4wIOHtPDtpOwNJjwRv+ZSvZmz2Q==
X-Received: by 2002:a05:600c:8b6f:b0:43c:fe15:41dd with SMTP id 5b1f17b1804b1-4538f9b3107mr146368525e9.6.1751365190153;
        Tue, 01 Jul 2025 03:19:50 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f18:7500:202e:b0f1:76d6:f9af? (p200300d82f187500202eb0f176d6f9af.dip0.t-ipconnect.de. [2003:d8:2f18:7500:202e:b0f1:76d6:f9af])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7e7386sm12685296f8f.20.2025.07.01.03.19.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 03:19:49 -0700 (PDT)
Message-ID: <94333692-0093-4351-a081-13e202dd2322@redhat.com>
Date: Tue, 1 Jul 2025 12:19:47 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 13/29] mm/balloon_compaction: stop using
 __ClearPageMovable()
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 virtualization@lists.linux.dev, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Jerrin Shaji George <jerrin.shaji-george@broadcom.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?=
 <eperezma@redhat.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Minchan Kim <minchan@kernel.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Brendan Jackman <jackmanb@google.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
 Peter Xu <peterx@redhat.com>, Xu Xin <xu.xin16@zte.com.cn>,
 Chengming Zhou <chengming.zhou@linux.dev>, Miaohe Lin
 <linmiaohe@huawei.com>, Naoya Horiguchi <nao.horiguchi@gmail.com>,
 Oscar Salvador <osalvador@suse.de>, Rik van Riel <riel@surriel.com>,
 Harry Yoo <harry.yoo@oracle.com>, Qi Zheng <zhengqi.arch@bytedance.com>,
 Shakeel Butt <shakeel.butt@linux.dev>
References: <20250630130011.330477-1-david@redhat.com>
 <20250630130011.330477-14-david@redhat.com>
 <65804db3-71c0-47ff-8189-6a1587d4a0cc@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <65804db3-71c0-47ff-8189-6a1587d4a0cc@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01.07.25 12:03, Lorenzo Stoakes wrote:
> On Mon, Jun 30, 2025 at 02:59:54PM +0200, David Hildenbrand wrote:
>> We can just look at the balloon device (stored in page->private), to see
>> if the page is still part of the balloon.
>>
>> As isolated balloon pages cannot get released (they are taken off the
>> balloon list while isolated), we don't have to worry about this case in
>> the putback and migration callback. Add a WARN_ON_ONCE for now.
>>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
> 
> Seems reasonable, one comment below re: comment.
> 
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> 
>> ---
>>   include/linux/balloon_compaction.h |  4 +---
>>   mm/balloon_compaction.c            | 11 +++++++++++
>>   2 files changed, 12 insertions(+), 3 deletions(-)
>>
>> diff --git a/include/linux/balloon_compaction.h b/include/linux/balloon_compaction.h
>> index bfc6e50bd004b..9bce8e9f5018c 100644
>> --- a/include/linux/balloon_compaction.h
>> +++ b/include/linux/balloon_compaction.h
>> @@ -136,10 +136,8 @@ static inline gfp_t balloon_mapping_gfp_mask(void)
>>    */
>>   static inline void balloon_page_finalize(struct page *page)
>>   {
>> -	if (IS_ENABLED(CONFIG_BALLOON_COMPACTION)) {
>> -		__ClearPageMovable(page);
>> +	if (IS_ENABLED(CONFIG_BALLOON_COMPACTION))
>>   		set_page_private(page, 0);
>> -	}
>>   	/* PageOffline is sticky until the page is freed to the buddy. */
>>   }
>>
>> diff --git a/mm/balloon_compaction.c b/mm/balloon_compaction.c
>> index ec176bdb8a78b..e4f1a122d786b 100644
>> --- a/mm/balloon_compaction.c
>> +++ b/mm/balloon_compaction.c
>> @@ -206,6 +206,9 @@ static bool balloon_page_isolate(struct page *page, isolate_mode_t mode)
>>   	struct balloon_dev_info *b_dev_info = balloon_page_device(page);
>>   	unsigned long flags;
>>
>> +	if (!b_dev_info)
>> +		return false;
>> +
>>   	spin_lock_irqsave(&b_dev_info->pages_lock, flags);
>>   	list_del(&page->lru);
>>   	b_dev_info->isolated_pages++;
>> @@ -219,6 +222,10 @@ static void balloon_page_putback(struct page *page)
>>   	struct balloon_dev_info *b_dev_info = balloon_page_device(page);
>>   	unsigned long flags;
>>
>> +	/* Isolated balloon pages cannot get deflated. */
>> +	if (WARN_ON_ONCE(!b_dev_info))
>> +		return;
>> +
>>   	spin_lock_irqsave(&b_dev_info->pages_lock, flags);
>>   	list_add(&page->lru, &b_dev_info->pages);
>>   	b_dev_info->isolated_pages--;
>> @@ -234,6 +241,10 @@ static int balloon_page_migrate(struct page *newpage, struct page *page,
>>   	VM_BUG_ON_PAGE(!PageLocked(page), page);
>>   	VM_BUG_ON_PAGE(!PageLocked(newpage), newpage);
>>
>> +	/* Isolated balloon pages cannot get deflated. */
> 
> Hm do you mean migrated?

Well, they can get migrated, obviously :)

Deflation would be the other code path where we would remove a balloon 
page from the balloon, and invalidate page->private, suddenly seeing 
!b_dev_info here.

But that cannot happen, as isolation takes them off the balloon list. So 
deflating the balloon cannot find them until un-isolated.

-- 
Cheers,

David / dhildenb


