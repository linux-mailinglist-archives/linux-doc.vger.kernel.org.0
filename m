Return-Path: <linux-doc+bounces-51451-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D999FAF03CF
	for <lists+linux-doc@lfdr.de>; Tue,  1 Jul 2025 21:32:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E4CE31C20DA6
	for <lists+linux-doc@lfdr.de>; Tue,  1 Jul 2025 19:32:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 852DD274643;
	Tue,  1 Jul 2025 19:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QThG5kYp"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D821427B4E8
	for <linux-doc@vger.kernel.org>; Tue,  1 Jul 2025 19:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751398326; cv=none; b=AxvhQzibS1ru3cxJZYthHB6y95mNfvhzJwe3R9P/CN4S06Z77mIxgxntsj8AFxIydU+5XN8KParvZc/0lInMRc7cng6RvPCMh1uYTWEFR6nWQ5AW5Oxm7kuZ7Kw8ylUHsJjeSvBmUIvgRGL3r2nv58E8ZPUTIz2glnLPzJk/AUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751398326; c=relaxed/simple;
	bh=kXopyC6c5M9a9rWPFBYHZbv8zu6NBxoYlUYtgbPR6Dc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CJf5c0njXnCBnKCt+20pPOB8/LVWnKu9merx7Nn1HSdPVzMwbsc/nTJRpo34TrT1EuNck7X9ATFS2y/OslWoJJXC/fL3OFtuaqhy3yviZ26zi5pk5pth2bPCJYaHeDY0bASWJHUEeda77Xl0Tl3sPWGsoQl30yD3/XsuODPnSfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QThG5kYp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751398324;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=pan++p2TzQShdGmkALz5U+1UZhqUiE8i0SNRToHfyJg=;
	b=QThG5kYpaphI23a0IFUWVKaoZYGWGF0TiIbErtyy++6WXYQDWhE73L7doEo/ACk4+llLT6
	VgAb7CxTBlDTF/Rt4sll02o2pKUvoF4lgZG5YmYUYb5H1tLmAcJ05Ky5TB4UcYkQ1MZdTb
	Z+j65CyTxvA7nWSJ86wmU0R6BhB2qjI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-578-Bt0meeYUN1-QafBXISPRRw-1; Tue, 01 Jul 2025 15:32:01 -0400
X-MC-Unique: Bt0meeYUN1-QafBXISPRRw-1
X-Mimecast-MFC-AGG-ID: Bt0meeYUN1-QafBXISPRRw_1751398320
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-450de98b28eso33068865e9.0
        for <linux-doc@vger.kernel.org>; Tue, 01 Jul 2025 12:32:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751398320; x=1752003120;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pan++p2TzQShdGmkALz5U+1UZhqUiE8i0SNRToHfyJg=;
        b=fyNOl3itjVfRI5f5wzfiiG5p3aYJnVg/j5epQbsvScLB39AN/xAhLKtGCedU5wqz3F
         jexA9h/shCWDtn0gcuQeZZlMqLAFs943DifAiMp4IPe4U3/B4OwFbv29QC0rbM39OPmP
         E5tLFv9+0Gxqh+IeLS/027Hiu6WlB7rbBTSewt/rR/3ZkViDSLEHVNWSgejqas3nTSdY
         Q30wzMAKlU25gudxtus40DzeCsyzIlZjlxpd32NWNbK4mv9ndkPpI3cksgmHNu8PC2yg
         4l1dn7jZaCmHBeLMyYfAe3v4uemjLfNuYsPxSkcpOnMLILwHGad/WOBddvoozLN8cMWu
         sVeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQokE8eYvyvFcE1QuqRPEmZsHFKpjeV4bY05EkdCXv0B3bSyY//HuWCvyFsmJiuxHAybTkn10dYTE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjVAc2wg8ExtaWhwV68CEWShBNJ5SXAdYIYPdEdeQ3U17tY8I3
	vi/Ikz+CnQxygWjVpBdSsStV+JSvqZdwAlF09SNiH4GEZeHSJQ5aqjd7tQ+7UGXYJeDHgZ22pkx
	uqgML8vx+nPxnxwGBK3aeCpSGVStr2IqG5pv+VTaau9SJpG7YxAyAkTbXPQ2v1Q==
X-Gm-Gg: ASbGncvFBiMtnjZxubynr+4+f/FjpvnPqtBqPXd/fydVwiMp2kex0wbGyTnnxt4kVR2
	v6MkF2/0jN7NT8lLLck2Iv3QbzWx53TILEPWD0FzFy9mrZDjoLMTeB0hvcTJknc6oTisBLUFrWg
	elydu9eZvcHTYAaoMRBVqnOsyqf+xy59IbDYZ6+4TDcJ5J0oBaLziP6/wQTp8oLkzVhF8U7OlGu
	BJdoQf++bVGX9Lrjl3Bo9NUYruMOR50BIuAxVl7FV7pzqIw15suJoYxkcYV9ZaaQj3bi1+bcYBx
	7CL46/SFCKlQENv006fPaMih83CZ2xqHKHtgXE4o8zt2Y2KYFA6gXknyp6DybqCQhfP8UQXJvod
	laBCsKiIUaSruZ8tMXSZXyTIuGndIZJemK90YjE+XF7WattfKiw==
X-Received: by 2002:a05:600c:8211:b0:43b:c857:e9d7 with SMTP id 5b1f17b1804b1-454a36e495amr3356955e9.5.1751398320056;
        Tue, 01 Jul 2025 12:32:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5TyN7r+4oBk64JocA+5QoglGL345dK2Fcu0b1IazgnSHOIgn7V2SOlRTU0EkUwtcUGQo9tg==
X-Received: by 2002:a05:600c:8211:b0:43b:c857:e9d7 with SMTP id 5b1f17b1804b1-454a36e495amr3356625e9.5.1751398319493;
        Tue, 01 Jul 2025 12:31:59 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f18:7500:202e:b0f1:76d6:f9af? (p200300d82f187500202eb0f176d6f9af.dip0.t-ipconnect.de. [2003:d8:2f18:7500:202e:b0f1:76d6:f9af])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823ad01csm206159325e9.22.2025.07.01.12.31.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 12:31:59 -0700 (PDT)
Message-ID: <48e9a5de-3131-4e36-8a21-5f77669116a9@redhat.com>
Date: Tue, 1 Jul 2025 21:31:56 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 22/29] mm/page-flags: rename PAGE_MAPPING_MOVABLE to
 PAGE_MAPPING_ANON_KSM
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
 <20250630130011.330477-23-david@redhat.com>
 <5357d4d9-d817-4351-9927-bcd03794964c@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <5357d4d9-d817-4351-9927-bcd03794964c@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01.07.25 14:54, Lorenzo Stoakes wrote:
> On Mon, Jun 30, 2025 at 03:00:03PM +0200, David Hildenbrand wrote:
>> KSM is the only remaining user, let's rename the flag. While at it,
>> adjust to remaining page -> folio in the doc.
> 
> Hm I wonder if we could just ideally have this be a separate flag rather than a
> bitwise combination, however I bet there's code that does somehow rely on this.

Well, KSM folios are anon folios, so that must hold.

Of course, now you could make folio_test_anon() test both bits, and have 
KSM folios only set a PAGE_MAPPING_KSM bit.

That should be possible on top of this change, but not sure if that's 
really what we want. After all, KSM folios are special ANON folios.

> 
> I know for sure there's code that has to do a folio_test_ksm() on something
> folio_test_anon()'d because the latter isn't sufficient.
 > > But this is one for the future I guess :)

Yes :)

> 
> Nice: re change to folio, that is a nice cleanup based on fact you've now made
> the per-page mapping op stuff not be part of this.
> 
>>
>> Reviewed-by: Zi Yan <ziy@nvidia.com>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
> 
> LGTM, so:
> 
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

Thanks!


-- 
Cheers,

David / dhildenb


