Return-Path: <linux-doc+bounces-25870-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD8B987FC3
	for <lists+linux-doc@lfdr.de>; Fri, 27 Sep 2024 09:51:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C928F284C7B
	for <lists+linux-doc@lfdr.de>; Fri, 27 Sep 2024 07:51:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F92E186E3E;
	Fri, 27 Sep 2024 07:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="jbpSondS"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F681649CC
	for <linux-doc@vger.kernel.org>; Fri, 27 Sep 2024 07:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727423461; cv=none; b=cIgLyBTqPgJDCibmVd5CQSvRZzrgT85V/J8Tno/hjZaiXG0SgVz9mDFDdPrvMDtvcEPhWmGqQtCLEQqm6QXNdcbRfEDH3JH9c/UReBQuDqaUZKNvuPx0HLi1Nqlivp9iHenVYlmFcxCv8GdN6GM84pLyJjhFPxmOXLisDEhTkLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727423461; c=relaxed/simple;
	bh=1XWbA421ewP3G2P/HXsU+35TLSJuYb8F5115d2JuIes=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EGvexbDNzgdYyYQFADDyMmD7zjNdd56VIrPclBBMGdT0/x+LhbowQmc9iK5gO4eatryfL2A73kO7LbOX+aqlQxQsRl7YknQ1sLQe0YwKzNB892yPaWqwZigi/Pd/51j6DjEr68SQsmRpuJij49ioY1wUuPaM6WxN+kyNIXISkZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=none smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=jbpSondS; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=daynix.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-719b17b2da1so1406937b3a.0
        for <linux-doc@vger.kernel.org>; Fri, 27 Sep 2024 00:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1727423459; x=1728028259; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9mrBjCEzDghLMu7q7zU/heNlCn+vyTex908H4IY9f3o=;
        b=jbpSondS9vHzeVvl0NRIjqQq1IbsSWUXsTkASEZx9sdChqY0OH9cHxOAqtYOElMyBE
         XZ22/xHwifVjf0OBUr3BSG4LCqZ36JYV7YozWHHIrQ8iKTgTWjJcfibNR9xJhnjgfOME
         PSFOtCRRgXCNBqO7H3ri9q/ZmsN6yunbC5m5eBBDc6Dkuvrc+OkVn9VYhvz+ItqAFO/E
         VP/YS+aLrqJhzFtyCzwoLwUcZDv3zyUSHJ25OpC4I9EyjpOvAMSfQ5zmZtclvluHLV4p
         FdXn+YmwATgLlL6wEzWu/88Dqv+9cZ74QBkiGpv2xxVMazO3ndFbnYVbaVyaNHlBjX5F
         rZNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727423459; x=1728028259;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9mrBjCEzDghLMu7q7zU/heNlCn+vyTex908H4IY9f3o=;
        b=Bax/gvK66an5Fd0r++9P/8ldBKZcBYL124rppMrDQ5bIsUt75gJ4hms312S2zAOAah
         LXKlwNF3jYxpgKvIb18l+N04Sda5lsDhdGGDaN3tWA0sdX0DrcS61tcgcnt0WUG1QwEN
         rJ4YI4ky26x4J6/Cw7Zt0aqt+OImfDgwtQxWw7gHBYtgYHq8/afcLM3kvQwcOKEqMDV7
         8qWE0PmkYOKDcX8BuEC8mnYHQ/4kD6hMxnJutbI8GM4K6yvHkNwQOrYya5HY5el/GWYf
         4eSJAM7ghiUNolinQbPT3sW8t9bQ5v/kU7DOGssR4CcMymqe9aCG71+m+lGAW5aF3t9Z
         HCnw==
X-Forwarded-Encrypted: i=1; AJvYcCVqdS+UMrkyG4iSxpDPZl/P1TDt0iHTABwMuJ5sfIMEdIFEYOIX8uI2fCKL5N34rLrFn4YfFpIwkhU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzS/AxuwEeeK8e9Giq7zfHJzmZp29jVBZZl1QtaSk1sOV390LeN
	NnT0o+Wps4hHESuMgAbJX+ScwdNEpfexhhj4QiIVEUAZxWmkTzStu9cCJgc21ts=
X-Google-Smtp-Source: AGHT+IHo6DRnQxWatrhP0ZF10f+nLGL64WMuTqlvD8bPjr4v7ZsMqd6qebmeuqkhoZIrakB8io6gqA==
X-Received: by 2002:a05:6a00:1806:b0:714:1a7c:b727 with SMTP id d2e1a72fcca58-71b25f36725mr3632502b3a.8.1727423459264;
        Fri, 27 Sep 2024 00:50:59 -0700 (PDT)
Received: from [157.82.207.107] ([157.82.207.107])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b2652bb69sm1009571b3a.150.2024.09.27.00.50.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Sep 2024 00:50:58 -0700 (PDT)
Message-ID: <6c101c08-4364-4211-a883-cb206d57303d@daynix.com>
Date: Fri, 27 Sep 2024 16:50:54 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v4 0/9] tun: Introduce virtio-net hashing feature
To: Jason Wang <jasowang@redhat.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Xuan Zhuo
 <xuanzhuo@linux.alibaba.com>, Shuah Khan <shuah@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, kvm@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-kselftest@vger.kernel.org,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Andrew Melnychenko <andrew@daynix.com>,
 Stephen Hemminger <stephen@networkplumber.org>, gur.stavi@huawei.com
References: <20240924-rss-v4-0-84e932ec0e6c@daynix.com>
 <CACGkMEvMuBe5=wQxZMns4R-oJtVOWGhKM3sXy8U6wSQX7c=iWQ@mail.gmail.com>
 <c3bc8d58-1f0e-4633-bb01-d646fcd03f54@daynix.com>
 <CACGkMEu3u=_=PWW-=XavJRduiHJuZwv11OrMZbnBNVn1fptRUw@mail.gmail.com>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <CACGkMEu3u=_=PWW-=XavJRduiHJuZwv11OrMZbnBNVn1fptRUw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2024/09/27 13:31, Jason Wang wrote:
> On Fri, Sep 27, 2024 at 10:11 AM Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>>
>> On 2024/09/25 12:30, Jason Wang wrote:
>>> On Tue, Sep 24, 2024 at 5:01 PM Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>>>>
>>>> virtio-net have two usage of hashes: one is RSS and another is hash
>>>> reporting. Conventionally the hash calculation was done by the VMM.
>>>> However, computing the hash after the queue was chosen defeats the
>>>> purpose of RSS.
>>>>
>>>> Another approach is to use eBPF steering program. This approach has
>>>> another downside: it cannot report the calculated hash due to the
>>>> restrictive nature of eBPF.
>>>>
>>>> Introduce the code to compute hashes to the kernel in order to overcome
>>>> thse challenges.
>>>>
>>>> An alternative solution is to extend the eBPF steering program so that it
>>>> will be able to report to the userspace, but it is based on context
>>>> rewrites, which is in feature freeze. We can adopt kfuncs, but they will
>>>> not be UAPIs. We opt to ioctl to align with other relevant UAPIs (KVM
>>>> and vhost_net).
>>>>
>>>
>>> I wonder if we could clone the skb and reuse some to store the hash,
>>> then the steering eBPF program can access these fields without
>>> introducing full RSS in the kernel?
>>
>> I don't get how cloning the skb can solve the issue.
>>
>> We can certainly implement Toeplitz function in the kernel or even with
>> tc-bpf to store a hash value that can be used for eBPF steering program
>> and virtio hash reporting. However we don't have a means of storing a
>> hash type, which is specific to virtio hash reporting and lacks a
>> corresponding skb field.
> 
> I may miss something but looking at sk_filter_is_valid_access(). It
> looks to me we can make use of skb->cb[0..4]?

I didn't opt to using cb. Below is the rationale:

cb is for tail call so it means we reuse the field for a different 
purpose. The context rewrite allows adding a field without increasing 
the size of the underlying storage (the real sk_buff) so we should add a 
new field instead of reusing an existing field to avoid confusion.

We are however no longer allowed to add a new field. In my 
understanding, this is because it is an UAPI, and eBPF maintainers found 
it is difficult to maintain its stability.

Reusing cb for hash reporting is a workaround to avoid having a new 
field, but it does not solve the underlying problem (i.e., keeping eBPF 
as stable as UAPI is unreasonably hard). In my opinion, adding an ioctl 
is a reasonable option to keep the API as stable as other virtualization 
UAPIs while respecting the underlying intention of the context rewrite 
feature freeze.

Regards,
Akihiko Odaki

