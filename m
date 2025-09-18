Return-Path: <linux-doc+bounces-55143-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 390ECB1B36C
	for <lists+linux-doc@lfdr.de>; Tue,  5 Aug 2025 14:29:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 61A7217963A
	for <lists+linux-doc@lfdr.de>; Tue,  5 Aug 2025 12:29:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B85A1B4F2C;
	Tue,  5 Aug 2025 12:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HUp6Xxkp"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB94713E02D
	for <linux-doc@vger.kernel.org>; Tue,  5 Aug 2025 12:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754396965; cv=none; b=h4e3KxCehP/ZubQZzeCt60EBe4nFGkPjLOb5Lh/LdCZ0OQJSrk19F+KsSSdw7t9eva06uCkipRdoCsN/ca5aT+D9qZhnXj3mfMRTxtKoeCRqsU3bJKVgCF5ov9UnKlJrDEVna1uI9qZerKaXPiMiQq9v8RQSpKAidCQVEZY9kgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754396965; c=relaxed/simple;
	bh=8RVxGAhGBsjJPl5Q1Po8aSiVOxUXyKuAww3RAbIZ1A4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pgE9r+vXvwsl7/dx01X9YCXNSql/lKc5sOtzo3E88No2fET3t3bixnsIbzd+ct4EwHZd8GU6rR3SxC6Nx7zvwV0woTu/OAmjvw0bVuXbHPz4lwTYtSWBmwvQjv2p0J9M1N5NtFH5kUo1f8293/gukrEgs4HP5j2+kQYDoId4pe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HUp6Xxkp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754396962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=0PUsESmGMc+I+/9P1CUuXeKO/V0uem/5Yunali6bEt8=;
	b=HUp6XxkpmaZ6zZnGDh2gkjPq5ps81KWprfjuEy+K0z5zhdQWd/TrGcCNw8SdDeERjN3I+4
	r2PZq43+xORrzpKQSbJdiTd2zPP+wwx/Jea8lttT7U8v4HfBqEVeUyEUKMwKWbypCBbZl2
	Aw1icbD3o9eUChqsJMD07C45WK9ZCyU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-320-j8lp1djgPdy5DZ_LcSiRRg-1; Tue, 05 Aug 2025 08:29:21 -0400
X-MC-Unique: j8lp1djgPdy5DZ_LcSiRRg-1
X-Mimecast-MFC-AGG-ID: j8lp1djgPdy5DZ_LcSiRRg_1754396960
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-459d3abb2b5so9181075e9.3
        for <linux-doc@vger.kernel.org>; Tue, 05 Aug 2025 05:29:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754396960; x=1755001760;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0PUsESmGMc+I+/9P1CUuXeKO/V0uem/5Yunali6bEt8=;
        b=gJkIRo8BinJKgEkpFSN3+HkGsaJ3AQq624OndqACvbZ2CbVsSl+EWsERJNlUg+XT8e
         LmesPzLyZdZzJyNXAPe38BrtqtBvu2OMox4t4TtaKNsVhQJd04VUSX0lMIpnBoREb11t
         OuDRprEEOUvKwmUV/GqPYADuaUN9C32tAfzNQ0zUsMpBV/nPFGjGEhaKg7a0lsh6yFn+
         ZiRKcNesL1X8iK5YCY79Qwce9q0vIyYLiBnTzorrI+luhWensQh15uHo/530EJpcVoGm
         YDIZyn8MjDgVSD/D/4anywRnQ7BuTYQekxi/nLnX9uyGQy2Uje07+jVTMwXHwnNj0NcZ
         4PiA==
X-Forwarded-Encrypted: i=1; AJvYcCUfvYFN7bTg+KDRBvy81vLUAOVsJio1tEOEjrZzrBgTDjclZL9r6W1JjSYSkOSFbxZz2PsQXndXDGM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy37wPcwV3uotiYBsrSEzoRCWGLP1ErqNhKErtXZxM/ZnIQ+L3c
	2+KXhxa3QoaNsyiMR7zur8ICKnbLRX/l6N1BO0sbjd313kpi61SkGTTIQ3w+R1XMggJqP5s6Un4
	TfRNWHtSDm9XT0jJYjOinlnZrEdUjFJJyY7xTfGm/SJDHL9kt/+QXsZ3fAmvkvQ==
X-Gm-Gg: ASbGnctj1FuLNsvWM5XBgpCPKj3w05Crtn9zYsRjOAKg0dZ6WfmcL1SAWohfZ5fRQu6
	8xd0Xofg1dFn9eadDbiCjjB3c2Lm83YE57BD6TUgjZwjHfgNlwi75T7b+y3rKvx2Gcfc6SMl6DA
	Gtz3aXNDqkZ8ctWGzdJRGuAEwlvylIJR6oFCF/W9fq0VrT1rSUXFiXgM6a91cE/GZlUyDl22FOK
	iZTXPMMpTMfznMUrrSe4e99mAw1sX9PB4gZfBIYQC446iO5HBrcYOQnQZP2qAx0mj7r92sRApL4
	8dlGcObytn/eSw12hhVXAe6/M054aQqztvP6evIUfg1tnvAnAzp3vmidd8h+EoKgVAbhagUjV4G
	MP+gBXrmsKJ1X6LeR4GNyEB/3kgV4wP66dSTU2KcszGCDGipT9b4IikZEn9ZNKQbfgCQ=
X-Received: by 2002:a05:600c:8b37:b0:43c:ea1a:720a with SMTP id 5b1f17b1804b1-458b69c80bamr106556485e9.1.1754396960235;
        Tue, 05 Aug 2025 05:29:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCYX+oIAWm7P6J9L9FL13e5nv15VWteMneKcFbKtrf1zfS9R9mzwxH7mkHE3dPyFpu0k1T0Q==
X-Received: by 2002:a05:600c:8b37:b0:43c:ea1a:720a with SMTP id 5b1f17b1804b1-458b69c80bamr106556235e9.1.1754396959808;
        Tue, 05 Aug 2025 05:29:19 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f2b:b200:607d:d3d2:3271:1be0? (p200300d82f2bb200607dd3d232711be0.dip0.t-ipconnect.de. [2003:d8:2f2b:b200:607d:d3d2:3271:1be0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459db13fc9fsm75518385e9.7.2025.08.05.05.29.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Aug 2025 05:29:19 -0700 (PDT)
Message-ID: <ff285199-5f29-44b8-81df-891196eeca3d@redhat.com>
Date: Tue, 5 Aug 2025 14:29:17 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] selftests: prctl: introduce tests for disabling
 THPs except for madvise
To: Usama Arif <usamaarif642@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org
Cc: linux-fsdevel@vger.kernel.org, corbet@lwn.net, rppt@kernel.org,
 surenb@google.com, mhocko@suse.com, hannes@cmpxchg.org, baohua@kernel.org,
 shakeel.butt@linux.dev, riel@surriel.com, ziy@nvidia.com,
 laoar.shao@gmail.com, dev.jain@arm.com, baolin.wang@linux.alibaba.com,
 npache@redhat.com, lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
 ryan.roberts@arm.com, vbabka@suse.cz, jannh@google.com,
 Arnd Bergmann <arnd@arndb.de>, sj@kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, kernel-team@meta.com
References: <20250804154317.1648084-1-usamaarif642@gmail.com>
 <20250804154317.1648084-7-usamaarif642@gmail.com>
 <9bcb1dee-314e-4366-9bad-88a47d516c79@redhat.com>
 <5dc09930-e137-47ba-a98f-416d3319c8be@gmail.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 g3eXuA==
Organization: Red Hat
In-Reply-To: <5dc09930-e137-47ba-a98f-416d3319c8be@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 05.08.25 14:19, Usama Arif wrote:
> 
> 
> On 05/08/2025 11:36, David Hildenbrand wrote:
>> On 04.08.25 17:40, Usama Arif wrote:
>>> The test will set the global system THP setting to never, madvise
>>> or always depending on the fixture variant and the 2M setting to
>>> inherit before it starts (and reset to original at teardown)
>>>
>>> This tests if the process can:
>>> - successfully set and get the policy to disable THPs expect for madvise.
>>> - get hugepages only on MADV_HUGE and MADV_COLLAPSE if the global policy
>>>     is madvise/always and only with MADV_COLLAPSE if the global policy is
>>>     never.
>>> - successfully reset the policy of the process.
>>> - after reset, only get hugepages with:
>>>     - MADV_COLLAPSE when policy is set to never.
>>>     - MADV_HUGE and MADV_COLLAPSE when policy is set to madvise.
>>>     - always when policy is set to "always".
>>> - repeat the above tests in a forked process to make sure  the policy is
>>>     carried across forks.
>>>
>>> Signed-off-by: Usama Arif <usamaarif642@gmail.com>
>>> ---
>>
>> [...]
>>
>>> +FIXTURE_VARIANT(prctl_thp_disable_except_madvise)
>>> +{
>>> +    enum thp_enabled thp_policy;
>>> +};
>>> +
>>> +FIXTURE_VARIANT_ADD(prctl_thp_disable_except_madvise, never)
>>> +{
>>> +    .thp_policy = THP_NEVER,
>>> +};
>>> +
>>> +FIXTURE_VARIANT_ADD(prctl_thp_disable_except_madvise, madvise)
>>> +{
>>> +    .thp_policy = THP_MADVISE,
>>> +};
>>> +
>>> +FIXTURE_VARIANT_ADD(prctl_thp_disable_except_madvise, always)
>>> +{
>>> +    .thp_policy = THP_ALWAYS,
>>> +};
>>> +
>>> +FIXTURE_SETUP(prctl_thp_disable_except_madvise)
>>> +{
>>> +    if (!thp_available())
>>> +        SKIP(return, "Transparent Hugepages not available\n");
>>> +
>>> +    self->pmdsize = read_pmd_pagesize();
>>> +    if (!self->pmdsize)
>>> +        SKIP(return, "Unable to read PMD size\n");
>>
>> Should we test here if the kernel knows PR_THP_DISABLE_EXCEPT_ADVISED, and if not, skip?
>>
>> Might be as simple as trying issuing two prctl, and making sure the first disabling attempt doesn't fail. If so, SKIP.
>>
>> Nothing else jumped at me. Can you include a test run result in the patch description?
>>
> 
> Instead of 2 prctls, I think doing just the below should be enough:
> 
> diff --git a/tools/testing/selftests/mm/prctl_thp_disable.c b/tools/testing/selftests/mm/prctl_thp_disable.c
> index 93cedaa59854..da28bc4441ed 100644
> --- a/tools/testing/selftests/mm/prctl_thp_disable.c
> +++ b/tools/testing/selftests/mm/prctl_thp_disable.c
> @@ -236,6 +236,9 @@ FIXTURE_SETUP(prctl_thp_disable_except_madvise)
>          if (!self->pmdsize)
>                  SKIP(return, "Unable to read PMD size\n");
>   
> +       if (prctl(PR_SET_THP_DISABLE, 1, PR_THP_DISABLE_EXCEPT_ADVISED, NULL, NULL))
> +               SKIP(return, "Unable to set PR_THP_DISABLE_EXCEPT_ADVISED\n");
> +
>          thp_save_settings();
>          thp_read_settings(&self->settings);
>          self->settings.thp_enabled = variant->thp_policy;

Then probably best to remove the

ASSERT_EQ(prctl(PR_SET_THP_DISABLE, 1, PR_THP_DISABLE_EXCEPT_ADVISED, 
NULL, NULL), 0);

 From both test functions?

You can consider doing the same in patch #5.

-- 
Cheers,

David / dhildenb


