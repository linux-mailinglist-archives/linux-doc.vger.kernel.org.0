Return-Path: <linux-doc+bounces-36525-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BDA3A23B27
	for <lists+linux-doc@lfdr.de>; Fri, 31 Jan 2025 10:16:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 946677A028F
	for <lists+linux-doc@lfdr.de>; Fri, 31 Jan 2025 09:15:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 397D61494D9;
	Fri, 31 Jan 2025 09:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UaS3rueD"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0FD28EC
	for <linux-doc@vger.kernel.org>; Fri, 31 Jan 2025 09:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738314962; cv=none; b=s0DniQnYbNUNHUB1sznWlytAthbN2d2P5WU8ZB/MAPDXPPAZ2gwzweS/1fmLeZ+01KUXVxdcC8vLAtFleNU8Hj67obtT9zgAJOsmpua2PgLyxwKHgURwBB4VxoDm2IMYdu4WfNdHDVbnzaHIC/U7OrMFFnlUZ2CULSUQL4T2RnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738314962; c=relaxed/simple;
	bh=glyT+QWYXKYahd+I79RsYZGkHUF4s+Cq3KEzK52hoco=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=C6AGXIdtuwvtiWquZARXaXKJM19DneDQQZSqwvJRfVZYKsPbnFvyx9KIdCWbkaoIe3u2oYZAoHcnxexWA7CNoxNuLjSqSDuDYfxvevJzvL9fbzffs7SIl62T4v4n6aasRzrJ5TSLGVZ8hAJBhVg0oaAgpqitIxXp4O0ylht8WfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UaS3rueD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738314959;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=HzaOmWcSL+l/lizA+4IKEkVZYK5BRi2x1EBU9BNH+gQ=;
	b=UaS3rueDbLNY7Vd3DTPE9lUM+vS+U6iw1sJEA0Tn+r/tB5KAUH/n6nuM4zixue/ir1xzG/
	afoUZpFTx/ouApAUFine+00TMEp9agsGLxqS86QzKQW9MQDM4f0sepl4YpJxGHoyapaI88
	OFKOLFuRSukbL48fphd2MrObze7p21k=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-308-851DGo6oPD-YwmQAka0tgw-1; Fri, 31 Jan 2025 04:15:57 -0500
X-MC-Unique: 851DGo6oPD-YwmQAka0tgw-1
X-Mimecast-MFC-AGG-ID: 851DGo6oPD-YwmQAka0tgw
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4361eb83f46so12989495e9.3
        for <linux-doc@vger.kernel.org>; Fri, 31 Jan 2025 01:15:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738314956; x=1738919756;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HzaOmWcSL+l/lizA+4IKEkVZYK5BRi2x1EBU9BNH+gQ=;
        b=VgBrhrLEyZRmjKTRhYOQiDC+A++e9z3R1gw3IlZdeDD6x4BnJC7NiawjF6UaUp5qyj
         OHPzKLJ7J057/jQ63ZyZPr/JCT05uqjzhfkikZepCLTGsAEdsxUe8sUpBKsktLUH8bEP
         UKHQXCUR4MzPQf2XiioLExZYqF9RO/NzTOTo8hbRTxYUcXmuiBgknniCYB1gMg6yhV9H
         djBUPp2O7E/Zphk+B+5ElFoPd/Ga42atAU46XaTimNAcaSFvNjA1vtaI8ND2ipm54zjf
         hZXxiszGU+lZDNAhcPM0Ix7jKZx5yEU6LUGM5CpIO90rjcDmtR2YQrfGv/q+9Gt5kJpt
         mzbg==
X-Forwarded-Encrypted: i=1; AJvYcCXDp129M6XZEj1quUeBr/g3Z2e8LXJHRwZ0zueem3IyD5Kxi7VHD6eIU9Qhf4Nc3myjoU03RnnOpc0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZH0OQr27rFsPxyGBhv+ryG32DSPFrgLvS8kObKrn/Ssvj4KgA
	9gBlPD+1SToYYVRFxqSPk975sDqJYal5RnT53Z/yhyeE3Qv/eXjWjiR32QHp2BLvZLQTOXKaCyK
	VLvDrCGR5v24uZ2yeL4lZ4QyDXd8Xcdj/lkNCO6kXQ83yXEUGHt1T2uXtNnn9egSjJmp4JOY=
X-Gm-Gg: ASbGncuyK+dlRJbVIE1f3bugM95zYCjIoC0srwzBXPY7O46QC1BknWnrcJM9feQ93vw
	ZhLCCVS6aAvR8D4RH/PMy5yNbbQEbeUed664nKugkh/rrgmRyqhDgDkZShbKFtDhx5c81RP6RN9
	WxTJ8rpXCLW7N1IOgfPgpzIkuoDAEvgz4v8EhX6ul9yzvLG2Tipy68wHCEUX75/HT/ZV85ST/aI
	cAaOg1dzrslOkDxd39KIsMSO+JO9Y6VpTS/TUQsBYQ2tIsN0Tm4jtGn4f8jpqQXhEvwTboBRpGE
	542YChjYaQa4OALxTIJ718P17F/ZjQfqPtAwwcCrl7pjZs9BlxGk5klCOimcBTshzcDlHKKad00
	taa5Faj7aDtwKkNA9V0lXSluN8bbbHRB8
X-Received: by 2002:a05:600c:3c9f:b0:434:a684:9b1 with SMTP id 5b1f17b1804b1-438dc3a90d4mr90257165e9.4.1738314956651;
        Fri, 31 Jan 2025 01:15:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGScYGuxXjKtihBe+hdO9xjhNcFnSB8wvV9N01bOdfpX49RMhXyL6h1mpb+YeLUidK0rGazGw==
X-Received: by 2002:a05:600c:3c9f:b0:434:a684:9b1 with SMTP id 5b1f17b1804b1-438dc3a90d4mr90256745e9.4.1738314956112;
        Fri, 31 Jan 2025 01:15:56 -0800 (PST)
Received: from ?IPV6:2003:cb:c70a:1c00:b8d4:bc62:e7ed:ec0e? (p200300cbc70a1c00b8d4bc62e7edec0e.dip0.t-ipconnect.de. [2003:cb:c70a:1c00:b8d4:bc62:e7ed:ec0e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c139bafsm4178523f8f.58.2025.01.31.01.15.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 01:15:54 -0800 (PST)
Message-ID: <05c387f0-25b7-47f3-88a8-36f6b5b1a736@redhat.com>
Date: Fri, 31 Jan 2025 10:15:52 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/4] mm/memory: document restore_exclusive_pte()
To: Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, nouveau@lists.freedesktop.org,
 Andrew Morton <akpm@linux-foundation.org>, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?=
 <jglisse@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>, Peter Xu <peterx@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>
References: <20250129115803.2084769-1-david@redhat.com>
 <20250129115803.2084769-5-david@redhat.com>
 <7vejbjs7btkof4iguvn3nqvozxqpnzbymxbumd7pant4zi4ac4@3ozuzfzsm5tp>
 <Z5tXzV0vcKJg_wuM@phenom.ffwll.local>
 <6moaipt4rmc62ijy2rtjbmzb5phgjpygxgqeic3bljydlwhxls@qqzuqbvs5gnh>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <6moaipt4rmc62ijy2rtjbmzb5phgjpygxgqeic3bljydlwhxls@qqzuqbvs5gnh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31.01.25 01:20, Alistair Popple wrote:
> On Thu, Jan 30, 2025 at 11:43:25AM +0100, Simona Vetter wrote:
>> On Thu, Jan 30, 2025 at 11:27:37AM +1100, Alistair Popple wrote:
>>> On Wed, Jan 29, 2025 at 12:58:02PM +0100, David Hildenbrand wrote:
>>>> Let's document how this function is to be used, and why the requirement
>>>> for the folio lock might maybe be dropped in the future.
>>>
>>> Sorry, only just catching up on your other thread. The folio lock was to ensure
>>> the GPU got a chance to make forward progress by mapping the page. Without it
>>> the CPU could immediately invalidate the entry before the GPU had a chance to
>>> retry the fault.
>>>
>>> Obviously performance wise having such thrashing is terrible, so should
>>> really be avoided by userspace, but the lock at least allowed such programs
>>> to complete.
>>
>> Imo this is not a legit use-case. If userspace concurrently (instead of
>> clearly alternating) uses the same 4k page for gpu atomics and on the cpu,
>> it just gets to keep the fallout.
>>
>> Plus there's no guarantee that we hold the folio_lock long enough for the
>> gpu to actually complete the atomic, so this isn't even really helping
>> with forward progress even if this somehow would be a legit usecase.
> 
> Yes, agree it's not a legit real world use case. In practice though it was
> useful for testing this and other driver code by thrashing to generate a lot
> device/cpu faults and invalidations. Obviously "just for testing" is not a great
> justification though, so if it's causing problems we could get rid of it.

Okay, I'll make that clear in the documentation. Getting rid of the 
folio lock might be really beneficial in some cases.

-- 
Cheers,

David / dhildenb


