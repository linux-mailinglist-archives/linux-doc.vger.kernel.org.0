Return-Path: <linux-doc+bounces-33562-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 232729FA166
	for <lists+linux-doc@lfdr.de>; Sat, 21 Dec 2024 16:30:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C94D1632A8
	for <lists+linux-doc@lfdr.de>; Sat, 21 Dec 2024 15:30:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B6941FA8CF;
	Sat, 21 Dec 2024 15:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gzeEyYrY"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358491FA244
	for <linux-doc@vger.kernel.org>; Sat, 21 Dec 2024 15:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734795030; cv=none; b=cGfCiHa4jTN+7VMiUrlNlnsESivTC2qwY2Jqk0oMU5vS5K/yfvytCba5QF/DEtVFYwjQsupEoid5d/UNHiO4nVbPw7XuJK3f4ZVPOABy+F59ezyjjntoseiku8jvnD/r1iBdhPA/m1ghC6U76/pqPCeT+qvtR1nGa9zyj1uJKBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734795030; c=relaxed/simple;
	bh=vYUXML0zqvV7raX4anR4OhMRY8/SE3exY+OvG3U1Mdc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XsZ0qPrFopHZIq3xM97dvoF3fAEXrrNQbYZLMNYIleMBL5uVLebITdep/tdZnFqY4hLXvqvCrY989xa9iUHOmdH+KlW8A7vjIkvNFRThVpSRQ3eD8b+J6dcbdV88qJ0Z7B8rwfoiGw38KZcio6UANtdwVPoPcj4cHLU+c52Kvb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gzeEyYrY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734795027;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=F0VhgHyYLlMxgv1xwC4J5EeYD2lgquIC4u4kKFeQ5vg=;
	b=gzeEyYrY9nBAeaBxbGaf79qhJ/w43nYcThs0obJ6T0EYouCiJVVaxfHvbofHlzU63AcBCD
	A6Qs+YufDpeNZn7WMnTkyQREdr2H/PnoktVcmZ+fxhIijpalJu1v3zjwKeqOlU0JjO8Imy
	iCLSQ2t3D1Wed6zoQulzJm+y0WNETTQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-168-6H5WDGiLPc2Vfo1GRu3J-Q-1; Sat, 21 Dec 2024 10:30:25 -0500
X-MC-Unique: 6H5WDGiLPc2Vfo1GRu3J-Q-1
X-Mimecast-MFC-AGG-ID: 6H5WDGiLPc2Vfo1GRu3J-Q
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4361eb83f46so21762895e9.3
        for <linux-doc@vger.kernel.org>; Sat, 21 Dec 2024 07:30:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734795024; x=1735399824;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=F0VhgHyYLlMxgv1xwC4J5EeYD2lgquIC4u4kKFeQ5vg=;
        b=QNPEnT3fW/2/ng6vubsdq+XBBnXFeLD/EO4Egi0Si0L1p4/iyToGRNefs/d6Dqc66G
         3TbdgVsxb+Wxmijj/lalxcsyyl8oO0xBIwkPQGGYaGkrV3i+FqcGqBeARyoQ3T2jd6Tv
         3AOO4hWJO2NHHen2P+TqsF/DxPph8ntlhilv4Y9Xk4XAyqtniAFLU8jXphbbbtJCbtOM
         rhJ/FFf6bJ7wFetLWrO2FU3iuZAASOP5uQa4CW4Z83U25hmPhuCKhbfdIgoKvkkEC/6p
         MCFeRleIWlW27NKmtz3UPtLfcyX3TIgPW/aT1x4ALuCCuWDuOUn8qNWlS4RKE6So6ewb
         QyOA==
X-Gm-Message-State: AOJu0YzlPFYHVAd1kUreVKNi8ffs4Rd/NeMGosw4xYih4HXf8qz7THf4
	fGh5bd/mnYpvp/MRZyvgy8SiNVSVWz+MR4gblbZhxVDLLWzlR0Bo68scuaY8YBq4kP34lm8/bEc
	s/o54X9Gjx0Rln/3d+fG48b9KGxG2o4A/Dju1rG2WYitB5Ut/HtcpN/uY/w==
X-Gm-Gg: ASbGnctuEq+IeXutMAJvEppu6yIG9KhzIuIO2MZjBBZK+sOdLdktyJR62FGGp9TlURA
	S2MoIzhqbMpP4nIu6leDSBcgw56moWlo4F+raVOtEAFvrvFbMohSHkNkmmc1Of3iJOFNi7/jAWV
	6BxugXCaZa3h00YA40K178yVoJ3f1/FZyCcEGIluPjwV7M8WQkw6+eYIX1J1ZGGh94wA4o398Ac
	qDYfFlnvtfrLDOxNLYQ3xgHxUIUfg1BPxSGG4kJcsT9vgYA3hM9h4FskMg7UEQTbv3UL/KYPEIw
	PbLuCgDmHIk3Cq26WKrGUJ6EUu4Hjc7XLW2kuG9oy+xu0TWBJR8qjMjz90y5GbV8h39az/rilrI
	UOYOE7H9d
X-Received: by 2002:a05:6000:188e:b0:386:3327:9d07 with SMTP id ffacd0b85a97d-38a223ff350mr6047735f8f.54.1734795024481;
        Sat, 21 Dec 2024 07:30:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEWX2iVqMHhGPmB89UgFg1Tn2AeeYo7Utwo6Z8s6ZVQXawGejFass05esanNdIaD8+DsbKoYQ==
X-Received: by 2002:a05:6000:188e:b0:386:3327:9d07 with SMTP id ffacd0b85a97d-38a223ff350mr6047718f8f.54.1734795024074;
        Sat, 21 Dec 2024 07:30:24 -0800 (PST)
Received: from ?IPV6:2003:cb:c70e:d000:4622:73e7:6184:8f0d? (p200300cbc70ed000462273e761848f0d.dip0.t-ipconnect.de. [2003:cb:c70e:d000:4622:73e7:6184:8f0d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8a6e19sm6705451f8f.100.2024.12.21.07.30.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Dec 2024 07:30:23 -0800 (PST)
Message-ID: <5e958aaa-b1ac-4512-a592-0e1612032861@redhat.com>
Date: Sat, 21 Dec 2024 16:30:21 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] mm: add build-time option for hotplug memory default
 online type
To: Gregory Price <gourry@gourry.net>, linux-mm@kvack.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, kernel-team@meta.com, corbet@lwn.net,
 osalvador@suse.de, akpm@linux-foundation.org, chenhuacai@kernel.org,
 kernel@xen0n.name, gregkh@linuxfoundation.org, rafael@kernel.org
References: <20241220210709.300066-1-gourry@gourry.net>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20241220210709.300066-1-gourry@gourry.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


>   
> -config MEMORY_HOTPLUG_DEFAULT_ONLINE
> -	bool "Online the newly added memory blocks by default"
> -	depends on MEMORY_HOTPLUG
> +choice
> +	prompt "Memory Hotplug Default Online Type"
> +	default MHP_DEFAULT_ONLINE_TYPE_OFFLINE
>   	help
> +	  Default memory type for driver managed hotplug memory.

We should call it "hotplugged memory" consistently, which it is from a 
pure core-mm perspective ("add memory").

"Driver managed" reminds too much about add_memory_driver_managed(), 
which is only one case. Maybe just drop the "e.g., page tables" from the 
examples below.

> +
>   	  This option sets the default policy setting for memory hotplug
>   	  onlining policy (/sys/devices/system/memory/auto_online_blocks) which
>   	  determines what happens to newly added memory regions. Policy setting
>   	  can always be changed at runtime.
> +
> +	  The default is 'offline'.
> +
> +	  Select offline to defer onlining to drivers and user policy.
> +	  Select auto to let the kernel choose what zones to utilize.
> +	  Select online_kernel to generally allow kernel usage of this memory.
> +	  Select online_movable to generally disallow kernel usage of this memory.
> +
> +	  Example kernel usage would be page structs and page tables.
> +

>   	  See Documentation/admin-guide/mm/memory-hotplug.rst for more information.
>   
> -	  Say Y here if you want all hot-plugged memory blocks to appear in
> -	  'online' state by default.
> -	  Say N here if you want the default policy to keep all hot-plugged
> -	  memory blocks in 'offline' state.
> +config MHP_DEFAULT_ONLINE_TYPE_OFFLINE
> +	bool "offline"
> +	help
> +	  Driver managed memory will not be onlined by default.

"Hotplugged memory"

 > +	  Choose this for systems with drivers and user policy that> +	 
handle onlining of hotplug memory policy.
 > +> +config MHP_DEFAULT_ONLINE_TYPE_ONLINE_AUTO
> +	bool "auto"
> +	help
> +	  Select this if you want the kernel to automatically online
 > +	  memory into the zone it thinks is reasonable. This memory

hotplugged memory

> +	  may be utilized for kernel data (e.g. page tables).
> +
> +config MHP_DEFAULT_ONLINE_TYPE_ONLINE_KERNEL
> +	bool "kernel"
> +	help
> +	  Select this if you want the kernel to automatically online
> +	  hotplug memory into a zone capable of being used for kernel
> +	  data (e.g. page tables). This typically means ZONE_NORMAL.
> +
> +config MHP_DEFAULT_ONLINE_TYPE_ONLINE_MOVABLE
> +	bool "movable"
> +	help
> +	  Select this if you want the kernel to automatically online
> +	  hotplug memory into ZONE_MOVABLE. This memory will generally
> +	  not be utilized for kernel data (e.g. page tables).
> +
> +	  This should only be used when the admin knows sufficient
> +	  ZONE_NORMAL memory is available to describe hotplug memory,
> +	  otherwise hotplug memory may fail to online. For example,
> +	  sufficient kernel-capable memory (ZONE_NORMAL) must be
> +	  available to allocate page structs to describe ZONE_MOVABLE.
> +
> +endchoice
>   
>   config MEMORY_HOTREMOVE
>   	bool "Allow for memory hot remove"
> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> index 3b6f93962481..e3655f07dd6e 100644
> --- a/mm/memory_hotplug.c
> +++ b/mm/memory_hotplug.c
> @@ -219,11 +219,30 @@ void put_online_mems(void)
>   
>   bool movable_node_enabled = false;
>   
> -#ifndef CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE
> -int mhp_default_online_type = MMOP_OFFLINE;
> -#else
> -int mhp_default_online_type = MMOP_ONLINE;
> -#endif
> +static int mhp_default_online_type = -1;
> +int mhp_get_default_online_type(void)
> +{
> +	if (mhp_default_online_type >= 0)
> +		return mhp_default_online_type;
> +
> +	if (IS_ENABLED(CONFIG_MHP_DEFAULT_ONLINE_TYPE_OFFLINE))
> +		mhp_default_online_type = MMOP_OFFLINE;
> +	else if (IS_ENABLED(CONFIG_MHP_DEFAULT_ONLINE_TYPE_ONLINE_AUTO))
> +		mhp_default_online_type = MMOP_ONLINE;
> +	else if (IS_ENABLED(CONFIG_MHP_DEFAULT_ONLINE_TYPE_ONLINE_KERNEL))
> +		mhp_default_online_type = MMOP_ONLINE_KERNEL;
> +	else if (IS_ENABLED(CONFIG_MHP_DEFAULT_ONLINE_TYPE_ONLINE_MOVABLE))
> +		mhp_default_online_type = MMOP_ONLINE_MOVABLE;
> +	else
> +		mhp_default_online_type = MMOP_OFFLINE;

What would be nice is if we could use the symbols from Kconfig, to then 
only do

mhp_default_online_type = CONFIG_MHP_DEFAULT_ONLINE_TYPE;

But as far as I know, that's not possible.


Thanks!

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb


