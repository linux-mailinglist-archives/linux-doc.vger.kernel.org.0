Return-Path: <linux-doc+bounces-38300-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BD976A37EB6
	for <lists+linux-doc@lfdr.de>; Mon, 17 Feb 2025 10:36:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D80123AE6A9
	for <lists+linux-doc@lfdr.de>; Mon, 17 Feb 2025 09:33:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5668A215F75;
	Mon, 17 Feb 2025 09:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TiRRxlR/"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3AC215F57
	for <linux-doc@vger.kernel.org>; Mon, 17 Feb 2025 09:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739784770; cv=none; b=QSMO6VvnMsh3eO5MlqZffp1Jwnwdr5TtBLAdTLkI92Apgbs/91g2cDlR6dNm6juy/Xnq/bPtzxsmu33puXjoS3HC7Jf01Hdd1PNm+DOz7bme0Y3gDX2NtwcXED85dmix/HjVQYqu5+6I3rW/G4YdUmAKTazvRrBaKxCbTEjzdq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739784770; c=relaxed/simple;
	bh=C18oNuSiRM+TIpqOyHblP4q4/wiZKl1/Sm7Ge/iJ9oU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B4n8Q3fR6vt6oKdfHUsmMic9MEVqsvjkh12Y9cgW8p7oebxlPSI0ny1HONbPEs/Ovf7C6BST8mdgdftUJtCPUmAETad8pulRJikt1FtjXnfRJaS+evLJJhsQ9CzDD6gzhduoaTsCnKkQ6A/5juZU6Xxn1SKP5l3VrDBOEMrQSGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TiRRxlR/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739784767;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Eeb7nv1cNhGbfxr+l0PpfHS4x7aSgl8Mgbc1lpE/bK0=;
	b=TiRRxlR/6a/m9YJepzkTVOSgQ0gjqB3NkDKx+nKAnyGlubIM8RCBSNc8uMJC0TgoM+Bgjz
	gPe8mBNhLX50JhHA2mq8ClIlIXV8jhzhlu4LrU0IBsyg1fePkCDw1cjfcvR6pKS3HDFCgz
	/Ey8UB7oIQS7gI09r74LXGVm3niTzrw=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-509-JRqOmDTIOriD1qKIjHIobQ-1; Mon, 17 Feb 2025 04:32:46 -0500
X-MC-Unique: JRqOmDTIOriD1qKIjHIobQ-1
X-Mimecast-MFC-AGG-ID: JRqOmDTIOriD1qKIjHIobQ_1739784765
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ab7d2d60e88so412224366b.1
        for <linux-doc@vger.kernel.org>; Mon, 17 Feb 2025 01:32:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739784765; x=1740389565;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Eeb7nv1cNhGbfxr+l0PpfHS4x7aSgl8Mgbc1lpE/bK0=;
        b=xAOQ7vS5O9TyxhX8puJg3vvz0DN47FjBHxSgfWUZtVU4q+42IG2KF4Jqljx3I0jo/z
         U+LjThpQAnFdMezjbQJCG14ZJMewaqCVieBex5sK7vFO7DVXN4iSm6Rakt3TlKLHp8VD
         XlzF1LnFDMxOg51tLrs1kjajudXFCy8tGtLHvbNaETuyfi8NChuj0LdwayGikcrJTauB
         UtTcDmPk9cP6fK2LREN/gFXBADWyYkWpqmMnVmpRGkDoahEn0IQnQzm0/69gexx+xXx5
         1gMvAY6gxfMuI+JN9kGOZdCUPghg3G9BTVUXWfxJClUqikeMum0aJO98mRMimT6QZrHC
         f7pw==
X-Forwarded-Encrypted: i=1; AJvYcCV/iwim0vnIEDdtnXqXg2EDIq/scCoar7c5ZJ/hxzwe8LTyigovWF0KKEiYYhgeEtzWop2TBArJYCE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNM9V4zMMuMhesyXTkws0Qu3vFEQ+uYL3PvOUKAAGFo9FODXMf
	sTayttif/NV4KJESeQ2I6C0i6ONLIG7+FqiNtf5ZRJ+Bs7SjEyG5NstRCDFQXcN/9JLwIBhXIEf
	Lw3jgV2gIUo+WLSc38hlDWjxn7YiHrEOMLdFEEK9ysl589K07H9cHV3AGPA==
X-Gm-Gg: ASbGncuBl5sfbpn5LfkZPmrTHysvAWUV4utAJhaR+JzajdJ1aFpZc16dDfgqHv2M0M/
	haB29n6722bT9lpZlPw5OF9e7fCPwk0MgYoMeAl0b30ryby8EQ7BoVDpwho/EeTZTT5+uaCrOg1
	/xLKu7liALv0Hhx9yxF543dqAJOea9WNhF7w9R7fPF8neSxRxnf0QSvL1a112dKKKZYeQroAlbx
	r+kiXJFrEU6QeL0vQ4D8SQNjzdNXXbs8spPUUKGSbEJQzMV7cabeyNMrRTpK8kI8k0W4Ds4X4jV
	FtSpUoRQLnwRK0z6wu4Pye258mE6naQjzYrh2Z1xLtRVMooaak5SvlmLcrHDrBA0BcpAOnPf+pW
	/q1zvoyMmOz4Z8wbnGed4aIhvrB0FuQ==
X-Received: by 2002:a17:906:31d6:b0:ab7:e943:4c1 with SMTP id a640c23a62f3a-abb7091ab36mr780762766b.11.1739784763481;
        Mon, 17 Feb 2025 01:32:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH3Wgg/IfmYVp/LsQNMw7j+PPvq4aGzaMQEi/BT3iuWyQBhHI1flKgzEnpyKaqJ/zoXhyrMhQ==
X-Received: by 2002:a17:906:31d6:b0:ab7:e943:4c1 with SMTP id a640c23a62f3a-abb7091ab36mr780753066b.11.1739784761522;
        Mon, 17 Feb 2025 01:32:41 -0800 (PST)
Received: from ?IPV6:2003:cb:c739:900:900f:3c9e:2f7b:5d0a? (p200300cbc7390900900f3c9e2f7b5d0a.dip0.t-ipconnect.de. [2003:cb:c739:900:900f:3c9e:2f7b:5d0a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba53376bb3sm864425066b.109.2025.02.17.01.32.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Feb 2025 01:32:40 -0800 (PST)
Message-ID: <76a9a0dc-4d2f-430c-a2be-a2371f3108d7@redhat.com>
Date: Mon, 17 Feb 2025 10:32:38 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/17] mm/rmap: convert make_device_exclusive_range()
 to make_device_exclusive()
To: Alistair Popple <apopple@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, nouveau@lists.freedesktop.org,
 linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 damon@lists.linux.dev, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?=
 <jglisse@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Masami Hiramatsu <mhiramat@kernel.org>,
 Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 SeongJae Park <sj@kernel.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>, Peter Xu <peterx@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Simona Vetter <simona.vetter@ffwll.ch>
References: <20250210193801.781278-1-david@redhat.com>
 <20250210193801.781278-4-david@redhat.com>
 <20250210210001.5dc68b38eb1bfa44d0fd78f6@linux-foundation.org>
 <48fd75b9-696e-402c-95bd-55f2f0e24dfc@redhat.com>
 <vclmxoorivzhamd4smaaeyamdeangj3aqlbl27muzxuljasdrg@t4jj77rmiozu>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <vclmxoorivzhamd4smaaeyamdeangj3aqlbl27muzxuljasdrg@t4jj77rmiozu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17.02.25 01:01, Alistair Popple wrote:
> On Tue, Feb 11, 2025 at 09:33:54AM +0100, David Hildenbrand wrote:
>> On 11.02.25 06:00, Andrew Morton wrote:
>>> On Mon, 10 Feb 2025 20:37:45 +0100 David Hildenbrand <david@redhat.com> wrote:
>>>
>>>> The single "real" user in the tree of make_device_exclusive_range() always
>>>> requests making only a single address exclusive. The current implementation
>>>> is hard to fix for properly supporting anonymous THP / large folios and
>>>> for avoiding messing with rmap walks in weird ways.
>>>>
>>>> So let's always process a single address/page and return folio + page to
>>>> minimize page -> folio lookups. This is a preparation for further
>>>> changes.
>>>>
>>>> Reject any non-anonymous or hugetlb folios early, directly after GUP.
>>>>
>>>> While at it, extend the documentation of make_device_exclusive() to
>>>> clarify some things.
>>>
>>> x86_64 allmodconfig:
>>>
>>> drivers/gpu/drm/nouveau/nouveau_svm.c: In function 'nouveau_atomic_range_fault':
>>> drivers/gpu/drm/nouveau/nouveau_svm.c:612:68: error: 'folio' undeclared (first use in this function)
>>>     612 |                 page = make_device_exclusive(mm, start, drm->dev, &folio);
>>>         |                                                                    ^~~~~
>>> drivers/gpu/drm/nouveau/nouveau_svm.c:612:68: note: each undeclared identifier is reported only once for each function it appears in
>>
>> Ah! Because I was carrying on the same branch SVM fixes [1] that are
>> getting surprisingly little attention so far.
> 
> I believe this has been picked up in drm-misc-fixes now:
> 
> https://lore.kernel.org/dri-devel/Z69eloo_7LM6NneO@cassiopeiae/

Yes. Both trees should merge without conflicts. However, we can later 
get rid of the now-superfluous page_folio() that was required in the drm 
fix.

-- 
Cheers,

David / dhildenb


