Return-Path: <linux-doc+bounces-49223-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF77ADAE0E
	for <lists+linux-doc@lfdr.de>; Mon, 16 Jun 2025 13:11:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1DAB2170453
	for <lists+linux-doc@lfdr.de>; Mon, 16 Jun 2025 11:11:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C3CE29DB96;
	Mon, 16 Jun 2025 11:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="i61a8DaJ"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F741E501C
	for <linux-doc@vger.kernel.org>; Mon, 16 Jun 2025 11:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750072292; cv=none; b=Prt4Lx2bvfy9LMLVqcfYhb2xhG0tY3rFjCt0I/xH6EGBv/JhEFsOoUd05UuqqACVX4cHOmZuCj+CN7LFDjK3mdbvnjVrxC/53z5kXuTOd6YQjYLnQf+BzCahOBfybBmqdqlklrgxCv2Ixk+o5ci2WkGPoYRjfnBppUbjXmiAKAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750072292; c=relaxed/simple;
	bh=L+/0GbTgnhAB+sxDd5acFZF2jlhUGHoQ643wy4xKowo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q7NtlEuka3gFBxdL7bGaS+V/3zyjIDi06ydOy7oF8NWomp77TDstrgLFQaFOuftVJTeGocaKhfCbR/qT2wbOq7FqsJ1h4th5UhMC3KROTyK/L+wYsACTIfBBxVvl2LCF3MB76OlhINzvjoenyfK7/YZPiPaK9UnsgGV9Vtyh4qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=i61a8DaJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750072289;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=BERX747lEinIdEXTdcIA4KAA7Mg7HKBQ4b7ZuczQJbs=;
	b=i61a8DaJtfZGWyS92taC3p0obOu1zIW06yYOOlFMnk7xQV/ayeES0++fshdN69bYKGEU54
	He90ZclrMNoMuJ1t4La5SdpdlMrEYQ0+qT+P5iaj2JLD5DIBtRirV4QLyS01pLkXBQDGMB
	1/UsOMVXfmsy5qpFLZhn/YGN2KMkJs8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-136-4VgvxmbAPQa1CYqa_DU-jA-1; Mon, 16 Jun 2025 07:11:28 -0400
X-MC-Unique: 4VgvxmbAPQa1CYqa_DU-jA-1
X-Mimecast-MFC-AGG-ID: 4VgvxmbAPQa1CYqa_DU-jA_1750072287
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-45311704d22so28662235e9.2
        for <linux-doc@vger.kernel.org>; Mon, 16 Jun 2025 04:11:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750072287; x=1750677087;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BERX747lEinIdEXTdcIA4KAA7Mg7HKBQ4b7ZuczQJbs=;
        b=JPjIccw0HSG5qikN/aQtzX2DWBSZjchJ5EHQCLmnxu5G5i4hBk6EHU29Bxu+B0jyOx
         Pp9BxUvHQqNAXMotQVp95KovZuN0pcWg/bXKFQcxVSYS5pF1y0JYMQy0gC2zLHldSZ7z
         injiKrEWM7SNIi6epDF9EIpFW9N/Ba5hlbIN6yMlQZtFxeJYDlqG5zldkUq4IOcz9KuQ
         5CVy/u3lSytbGpZR83KAhZ8YdE4/1g3ZTQA66H8+6/q7o6gWsO+nnXMnYbyTEQP7auWo
         k5LIjoNZzO6ZtlbWZumMBaGcsa68CuudQshpmyFerbcgJYXBYHboYsiwfkXJe9Ts4rTL
         AcGw==
X-Forwarded-Encrypted: i=1; AJvYcCXpLG49EQFeY3pcQAl5rKZA8ubloiCIZxxb5gJ7c04M9iOJntJwQ08knEil9G544KKcH2+Q/l+kRK4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmDBsVO1oWWsG8orzYxI+LBGE2GgNihTN2gfnnq2we2odwWRe2
	HfxVKC9CzRpHy/dOtlsvS78k902ozMm108SRL/bY+wkiWOHmvlYFv3SQtUfze0TBPhNSHfYiCCD
	t1WVBSgY8Cqs4kZwggOG93C0CPNrIynZabRXL3zi+4hM4eXhBwsd1MO9bkM4SYQ==
X-Gm-Gg: ASbGnctzTDPwRC8WylGFHsUI2O9gZmHUTK+WMeDXClfL9k5lhebtxzZPyx7+Omy/EMH
	1r8q166slpXmLEoB1vF+KqJvxY55Xz+lSmD9c0ihQlGscbls60/zROZVtx+RGxKmsVCqcw8+tC/
	ILf8GE4pb1YanDZP47ilf5dkbzURkoQjNXIVn0AMKTwiS5rs0oBUjhOzOhy/4BE7QXaC/GrGtXb
	oSivynpdaeKI8o9+KPWdNv+pXUG2jfW21nB5PbW7cZWlwvoDqrW667ivNf39qhN6w2hM+ok1Nwq
	B/DbvuMZj+kr+hWmCspycNAEboXqaVrdhkkd/R1FaYx+M6hKUsMuKiHNFcmUgWQ8ywyoxvpFwDZ
	U9e46huhwqN1rSKSHL+z+PHIdPAA1a7Kp8yAvv6YQCupYdkA=
X-Received: by 2002:a05:600c:8b2a:b0:440:61eb:2ce5 with SMTP id 5b1f17b1804b1-4533cb488b5mr82128445e9.17.1750072286781;
        Mon, 16 Jun 2025 04:11:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwywYqr0Arb313QzJn3MB1mjdrc64cA2pYWJ8AYs0j5Ak1u4ZO1B1Tt0fiAumeV4DVXw72Fw==
X-Received: by 2002:a05:600c:8b2a:b0:440:61eb:2ce5 with SMTP id 5b1f17b1804b1-4533cb488b5mr82128125e9.17.1750072286381;
        Mon, 16 Jun 2025 04:11:26 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f25:bd00:949:b5a9:e02a:f265? (p200300d82f25bd000949b5a9e02af265.dip0.t-ipconnect.de. [2003:d8:2f25:bd00:949:b5a9:e02a:f265])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a54a36sm10916076f8f.15.2025.06.16.04.11.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 04:11:25 -0700 (PDT)
Message-ID: <5a331053-0777-4426-b0da-4d813cbe0a9a@redhat.com>
Date: Mon, 16 Jun 2025 13:11:24 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/4] mm/mempolicy: Expose policy_nodemask() in
 include/linux/mempolicy.h
To: "Huang, Ying" <ying.huang@linux.alibaba.com>
Cc: Bijan Tabatabai <bijan311@gmail.com>, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, sj@kernel.org,
 akpm@linux-foundation.org, corbet@lwn.net, ziy@nvidia.com,
 matthew.brost@intel.com, joshua.hahnjy@gmail.com, rakie.kim@sk.com,
 byungchul@sk.com, gourry@gourry.net, apopple@nvidia.com,
 bijantabatab@micron.com, venkataravis@micron.com, emirakhur@micron.com,
 ajayjoshi@micron.com, vtavarespetr@micron.com, damon@lists.linux.dev
References: <20250612181330.31236-1-bijan311@gmail.com>
 <20250612181330.31236-2-bijan311@gmail.com>
 <5a50eeba-b26d-4913-8016-45278608a1ee@redhat.com>
 <CAMvvPS5U8exSvy0fknfhv8ym_dKgMVa7cfMOqn0fGyd+NSjSuQ@mail.gmail.com>
 <e40aa590-f0a2-4666-84b0-c33c8f4fef87@redhat.com>
 <87plf43q6s.fsf@DESKTOP-5N7EMDA>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <87plf43q6s.fsf@DESKTOP-5N7EMDA>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 16.06.25 13:02, Huang, Ying wrote:
> David Hildenbrand <david@redhat.com> writes:
> 
>> On 13.06.25 18:33, Bijan Tabatabai wrote:
>>> On Fri, Jun 13, 2025 at 8:45 AM David Hildenbrand <david@redhat.com> wrote:
>>>>
>>>> On 12.06.25 20:13, Bijan Tabatabai wrote:
>>>>> From: Bijan Tabatabai <bijantabatab@micron.com>
>>>>>
> 
> [snip]
> 
>>> I did not use get_vma_policy or mpol_misplaced, which I believe is
>>> the
>>> closest function that exists for what I want in this patch, because
>>> those functions
>>
>> I think what you mean is, that you are performing an rmap walk. But
>> there, you do have a VMA + MM available (stable).
>>
>>> seem to assume they are called inside of the task that the folio/vma
>>> is mapped to.
>>
>> But, we do have a VMA at hand, so why would we want to ignore any set
>> policy? (I think VMA policies so far only apply to shmem, but still).
>>
>> I really think you want to use get_vma_policy() instead of the task policy.
>>
>>
>>> More specifically, mpol_misplaced assumes it is being called within a
>>> page fault.
>>> This doesn't work for us, because we call it inside of a kdamond process.
>>
>> Right.
>>
>> But it uses the vmf only for ...
>>
>> 1) Obtaining the VMA
>> 2) Sanity-checking that the ptlock is held.
> 
> 3) update NUMA balancing per-folio cpupid state (via should_numa_migrate_memory()).

How is the vmf used for that ("it uses the vmf only for ...")?

But yes, anything that relies on "thiscpu" and "thisnid" might be 
fault-specific as well (what I mentioned further below)


-- 
Cheers,

David / dhildenb


