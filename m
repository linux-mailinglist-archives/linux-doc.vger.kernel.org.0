Return-Path: <linux-doc+bounces-25928-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC4598935E
	for <lists+linux-doc@lfdr.de>; Sun, 29 Sep 2024 09:11:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84A1E285D89
	for <lists+linux-doc@lfdr.de>; Sun, 29 Sep 2024 07:11:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59EE910A0E;
	Sun, 29 Sep 2024 07:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="lH5SQ1u3"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E6A135A69
	for <linux-doc@vger.kernel.org>; Sun, 29 Sep 2024 07:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727593855; cv=none; b=OIQgp3GKXOODjDYmPrKb8whvESNTbyKip60gEwZ/80v5COK7B4kIVrejBlzZa/cu+pNVnKiftttTIFABqt4YvwZZYcc7ohomOw2C2kIHRQnPEevt0Sfwp58/KLcS8FHa6kCVpyn6aWuqvRTpWlhPViCMQFIsiClr36R/UfzT33s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727593855; c=relaxed/simple;
	bh=n4Jy/g4Eh6+BSVVGvl01aw6en9RlnVRu3g0HXU8COnc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NIr376RyrNa832FHw3vGdRQINjAA7+mdY5/SgWVD92fb8Rcf5yi0c89sbzD6CWxWQow/Xqc1wQTGOKcnhfzIBY5iiRqHand0asK4DJhvvFZtr7V+nRmn6acYqjaS7qbVnVk0E0dXs2MLwnLl1fmKf5oHLzovSfG2kL+a2T1kRKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=none smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=lH5SQ1u3; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=daynix.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-7db637d1e4eso2609775a12.2
        for <linux-doc@vger.kernel.org>; Sun, 29 Sep 2024 00:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1727593853; x=1728198653; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wupXfiTFRgbbCCMXc+w3GmGZhuh2PGEq/8NKT31sCcc=;
        b=lH5SQ1u3H+QhpHmcIbUuQdBBmCtOCKG3bZbvt+aUo4LUny7tHnubZu1hhHoIgmJzI6
         6SUWkb3PtRXZ/UsqDhMgT6kgMNUBhq6jZYS7ks+cQuIyXZgMzpN+W1ONEyfIHHK/eqVT
         F10TO1N3TXHgnts3vk3vFsJkUR8++cvRCRg3De7U6E8cru3qlL+wORqJX4BBd+KcCgwj
         2SEQCTz3+SECmvUfQA2LWVFuOUhiy4DGFAl0XbSNVU4lABaoWfsz1wQ/arEMTfvRfNdk
         flOOasikzJXONwTtskHjfXnQxDPSxP3vAyIuz2ldv35mSLsuXr+H3iCxGejFD8ymlqVe
         4H6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727593853; x=1728198653;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wupXfiTFRgbbCCMXc+w3GmGZhuh2PGEq/8NKT31sCcc=;
        b=HHkrb/cAvv52d4GCffJvTWRTmcAbFQSVlzg7giG4jHWc/Rr37gzl1hxAesOII1A0oL
         YyAj6E7HKtXNBBJHiuwr1BX0xHe+668Y7RiH01eHfBTeX1PIMS/jcshp7XwqbdhO/P79
         /vCpH5zjujiU1PmrkOCMfEn9DvNs7jC+rrhShE1ATwXXbiV8TapVNseE4zU6aiHX97HV
         CYs9oQ/l/o6hm8BpZOrCeHqqDXh5j2H7zh8BovqVIdlUgwxx7bYkjE2nirZMpQ8ZODgI
         UtMdXGinlo9gDIzPCyWyhRgYiHzN4CsWM3H5CJI3PrnmHtSzW/070HPtzQQdfEbhhdvJ
         doWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrwEy1+pc5wGXBIpXNs3/Ku0RVs1eK7gur6vBsbPxhkLMuKQYkw9OZ6daos4Shb7Wqz1R73jeAuyk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHKNPZ8NU0mvVwBoiPs56nq+dxJDw/BVTywOtImFk0wjUKjQYI
	5Nz275CfJ2c71KO1632gRjk9NDfm5X1XQxRfb+oFkNq0Yx43s5PUqNZYa6JQDnA=
X-Google-Smtp-Source: AGHT+IGrcYY05To+/yLZrdZKHUuaT4lGmCtj4wsgyrCWwclUUaolM2+fnTgp4t6z/cgOYbzvWvn9bg==
X-Received: by 2002:a17:90a:ad91:b0:2d4:924:8891 with SMTP id 98e67ed59e1d1-2e0b8ede168mr9323964a91.38.1727593852980;
        Sun, 29 Sep 2024 00:10:52 -0700 (PDT)
Received: from [157.82.207.107] ([157.82.207.107])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e0b6c7942csm5324497a91.16.2024.09.29.00.10.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Sep 2024 00:10:52 -0700 (PDT)
Message-ID: <447dca19-58c5-4c01-b60e-cfe5e601961a@daynix.com>
Date: Sun, 29 Sep 2024 16:10:47 +0900
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
 <6c101c08-4364-4211-a883-cb206d57303d@daynix.com>
 <CACGkMEtscr17UOufUtyPp1OvALL8LcycpbRp6CyVMF=jYzAjAA@mail.gmail.com>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <CACGkMEtscr17UOufUtyPp1OvALL8LcycpbRp6CyVMF=jYzAjAA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2024/09/29 11:07, Jason Wang wrote:
> On Fri, Sep 27, 2024 at 3:51 PM Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>>
>> On 2024/09/27 13:31, Jason Wang wrote:
>>> On Fri, Sep 27, 2024 at 10:11 AM Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>>>>
>>>> On 2024/09/25 12:30, Jason Wang wrote:
>>>>> On Tue, Sep 24, 2024 at 5:01 PM Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>>>>>>
>>>>>> virtio-net have two usage of hashes: one is RSS and another is hash
>>>>>> reporting. Conventionally the hash calculation was done by the VMM.
>>>>>> However, computing the hash after the queue was chosen defeats the
>>>>>> purpose of RSS.
>>>>>>
>>>>>> Another approach is to use eBPF steering program. This approach has
>>>>>> another downside: it cannot report the calculated hash due to the
>>>>>> restrictive nature of eBPF.
>>>>>>
>>>>>> Introduce the code to compute hashes to the kernel in order to overcome
>>>>>> thse challenges.
>>>>>>
>>>>>> An alternative solution is to extend the eBPF steering program so that it
>>>>>> will be able to report to the userspace, but it is based on context
>>>>>> rewrites, which is in feature freeze. We can adopt kfuncs, but they will
>>>>>> not be UAPIs. We opt to ioctl to align with other relevant UAPIs (KVM
>>>>>> and vhost_net).
>>>>>>
>>>>>
>>>>> I wonder if we could clone the skb and reuse some to store the hash,
>>>>> then the steering eBPF program can access these fields without
>>>>> introducing full RSS in the kernel?
>>>>
>>>> I don't get how cloning the skb can solve the issue.
>>>>
>>>> We can certainly implement Toeplitz function in the kernel or even with
>>>> tc-bpf to store a hash value that can be used for eBPF steering program
>>>> and virtio hash reporting. However we don't have a means of storing a
>>>> hash type, which is specific to virtio hash reporting and lacks a
>>>> corresponding skb field.
>>>
>>> I may miss something but looking at sk_filter_is_valid_access(). It
>>> looks to me we can make use of skb->cb[0..4]?
>>
>> I didn't opt to using cb. Below is the rationale:
>>
>> cb is for tail call so it means we reuse the field for a different
>> purpose. The context rewrite allows adding a field without increasing
>> the size of the underlying storage (the real sk_buff) so we should add a
>> new field instead of reusing an existing field to avoid confusion.
>>
>> We are however no longer allowed to add a new field. In my
>> understanding, this is because it is an UAPI, and eBPF maintainers found
>> it is difficult to maintain its stability.
>>
>> Reusing cb for hash reporting is a workaround to avoid having a new
>> field, but it does not solve the underlying problem (i.e., keeping eBPF
>> as stable as UAPI is unreasonably hard). In my opinion, adding an ioctl
>> is a reasonable option to keep the API as stable as other virtualization
>> UAPIs while respecting the underlying intention of the context rewrite
>> feature freeze.
> 
> Fair enough.
> 
> Btw, I remember DPDK implements tuntap RSS via eBPF as well (probably
> via cls or other). It might worth to see if anything we miss here.

Thanks for the information. I wonder why they used cls instead of 
steering program. Perhaps it may be due to compatibility with macvtap 
and ipvtap, which don't steering program.

Their RSS implementation looks cleaner so I will improve my RSS 
implementation accordingly.

Regards,
Akihiko Odaki

