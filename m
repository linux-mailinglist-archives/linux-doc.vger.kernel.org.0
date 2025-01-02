Return-Path: <linux-doc+bounces-33824-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BCA49FF8E1
	for <lists+linux-doc@lfdr.de>; Thu,  2 Jan 2025 12:36:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 024063A00D4
	for <lists+linux-doc@lfdr.de>; Thu,  2 Jan 2025 11:35:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4A191A08DB;
	Thu,  2 Jan 2025 11:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BYYVySp6"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2202613FEE
	for <linux-doc@vger.kernel.org>; Thu,  2 Jan 2025 11:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735817756; cv=none; b=MIUH0svzZqJkVvys0sYIJJQIvTEQkj+WAkid4Lop/WGLZtgFoayFHzOhd3MP9yN6fbkHGGbH4d/bj+fgXLon0cp4ta+Ld6ieefo49t2CAPglpBcaMqX+7dL9uD2R9BQ5vHuQyIKh7Rjx7ieTIRN65ktkhTtSMHub5+KB0yMtxPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735817756; c=relaxed/simple;
	bh=jPwzxu6JMhSPoRS2vMKIcwfSVYT3dafZi4QNVHv3NCg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bDUlNa8H6ZIgbyXjVX7Na5x24k0qetXHVT1xe5uI8FC1jueCdcjssjSAcY7AZoj28Rg3UIaJ1QwNxG4UYNgcRaWon+8VKfdEhdwz2uYCSl2q0u77PSzSekcN1h8CPeOzwB0GnQDAupc4MuMmuMEROPed+IQoir9B4T874tZajk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BYYVySp6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1735817754;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=5ukftuiSSdjRUGWNl+Q9bxAz+SDSXpgm9QL3acZknL8=;
	b=BYYVySp6njuXLX7gtoXJAAx5CVZ8YbZ+MGW9Ks+jmtrjymXaesAgkTy75mOH1raB7PRD+B
	OJLMylEx75HVb+HO1ohV1avrOYGeJSkpBpQuqkZw2uisFJXzJtx7zFLeLLj3OX+pZkjZRD
	s8Zr8eIS6NTBG6Gq6hn8O2fJzGiCw7s=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-689-i1dLoj4QMUS3vtzYgaUmUg-1; Thu, 02 Jan 2025 06:35:53 -0500
X-MC-Unique: i1dLoj4QMUS3vtzYgaUmUg-1
X-Mimecast-MFC-AGG-ID: i1dLoj4QMUS3vtzYgaUmUg
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-385e2579507so4945685f8f.1
        for <linux-doc@vger.kernel.org>; Thu, 02 Jan 2025 03:35:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735817752; x=1736422552;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5ukftuiSSdjRUGWNl+Q9bxAz+SDSXpgm9QL3acZknL8=;
        b=mwH0AZN8gh1brMmX8TB8zfAO8RT6Qv00RU7b1+HIw/OCkCEwlH/MykZroGfE/PRmTc
         jrQRx7OpWdWCAveuq0S3soplcGIbCmDjbz90xEzneo2990x2AuSJQn0e3u5WCpBbR0tj
         ahgLkwQzHI7uyIWoCSKspzTehpNIVevGTkmbmKSKGkdJI1ABoqbb3lSTjt9kmDtpjAoJ
         SMaqE6rRL0k3o/61We1ZIuB6e6v1bxodPkxMp2EMJPGV2WH0o00QICybgiZrHBix7V5G
         MTsT+EzdD9oY/O1qQa7n1o63538CIConjJ+c6p6eC+pBE9PqLTKP7BEdu8UA3w76CblQ
         FBYA==
X-Forwarded-Encrypted: i=1; AJvYcCVMyRc//+a+gMJtyGWWUG/VkUDwI26ti+4OSt3OQy1k4YCXrGfAIChdEMgly93vrKE83oMtbZrER7s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjmQelnc2V1HPU1hWf89+eClIB6lwk4BIG5l/Sh5Mggwzp4w0r
	xOw+c8Z1AxaewxnJefV4ikQBewAzl5nKH0zCbV7SXrQnrT6HMpBIyeAmczxC/ggnrdrTRaIUovu
	V7/VrLdJg8zizjCPOM2AQ/GipVg2OoOykm86qWN0AEjf+8SKC1KzjckYL1w==
X-Gm-Gg: ASbGnctbvKMiKInqEeeNLeRWoh+R594/KALxt+DUtmpccQvcbrZFe4KRykImFYR39Av
	+d2hdB++P8haHYkhZXdj4CkpxevT3u50pCYkRIK4GQ42IYhvVNgVfjE6VzZAZnHTULD3/VfRCQ+
	nu+8fvvif8gBjxqifLl1xPMLH1qR8uEmN2EL82K0xmT7MZ14EWKeuFdcuGPqh+jx+xnZR/5ukYV
	nK9Rs9fmZqdZwXPJyVJWj7/r/ymTIojxIn/2s2h7UUlo93YjOneLAcdNvk82XFJCVkugt8rKjMf
	g198bwFUnOZre9n3VNlc/WB+8ZBBQzxylP8UZ6UO5fwvOl/zxnvd3HjLIMw5xU6jQNmclOfrXj5
	MsiIgdB6t
X-Received: by 2002:a05:6000:480a:b0:386:1cd3:89fa with SMTP id ffacd0b85a97d-38a221fa8c6mr43353747f8f.33.1735817751898;
        Thu, 02 Jan 2025 03:35:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHTvXfH9Yjkw7Lq8XjHNQdAJWD6JFUT9lIiaonrhZq0Se6kwgjVAxEZ6BjDbqnSc4iGe+BANQ==
X-Received: by 2002:a05:6000:480a:b0:386:1cd3:89fa with SMTP id ffacd0b85a97d-38a221fa8c6mr43353722f8f.33.1735817751577;
        Thu, 02 Jan 2025 03:35:51 -0800 (PST)
Received: from ?IPV6:2003:cb:c735:9400:f91f:1f24:e403:81fe? (p200300cbc7359400f91f1f24e40381fe.dip0.t-ipconnect.de. [2003:cb:c735:9400:f91f:1f24:e403:81fe])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c84705esm38104596f8f.44.2025.01.02.03.35.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jan 2025 03:35:50 -0800 (PST)
Message-ID: <3a2d03dd-ee70-43b4-8b05-1be948bd0997@redhat.com>
Date: Thu, 2 Jan 2025 12:35:48 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] mm: add build-time option for hotplug memory default
 online type
To: Gregory Price <gourry@gourry.net>
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 kernel-team@meta.com, corbet@lwn.net, osalvador@suse.de,
 akpm@linux-foundation.org, chenhuacai@kernel.org, kernel@xen0n.name,
 gregkh@linuxfoundation.org, rafael@kernel.org
References: <20241220210709.300066-1-gourry@gourry.net>
 <5e958aaa-b1ac-4512-a592-0e1612032861@redhat.com>
 <Z2edvO0X6H_IoMRz@gourry-fedora-PF4VCD3F>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <Z2edvO0X6H_IoMRz@gourry-fedora-PF4VCD3F>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22.12.24 06:03, Gregory Price wrote:
> On Sat, Dec 21, 2024 at 04:30:21PM +0100, David Hildenbrand wrote:
>>
>>> -config MEMORY_HOTPLUG_DEFAULT_ONLINE
>>> -	bool "Online the newly added memory blocks by default"
>>> -	depends on MEMORY_HOTPLUG
>>> +choice
>>> +	prompt "Memory Hotplug Default Online Type"
>>> +	default MHP_DEFAULT_ONLINE_TYPE_OFFLINE
>>>    	help
>>> +	  Default memory type for driver managed hotplug memory.
>>
>> We should call it "hotplugged memory" consistently, which it is from a pure
>> core-mm perspective ("add memory").
>>
>> "Driver managed" reminds too much about add_memory_driver_managed(), which
>> is only one case. Maybe just drop the "e.g., page tables" from the examples
>> below.
>>
> 
> I suppose it's accurate that this also affects VM-hotplugged memory,
> which may not necessarily be "driver managed" in that regard. So it's
> more accurate to just say "hotplugged memory" - although even that's not
> quite completely accurate according to the definition in the docs.
> 
> Either way, will change it to "hotplugged memory".

The "really correct" thing might be "hot-added memory blocks", because 
that's what it is from a Linux MM POV.

Not sure though, if that will be particularly easier to grasp for end users.

-- 
Cheers,

David / dhildenb


