Return-Path: <linux-doc+bounces-38193-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 49392A36C22
	for <lists+linux-doc@lfdr.de>; Sat, 15 Feb 2025 06:25:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 033811700F5
	for <lists+linux-doc@lfdr.de>; Sat, 15 Feb 2025 05:25:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DBBB18D634;
	Sat, 15 Feb 2025 05:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="gMpSEcWQ"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB77E2F4A
	for <linux-doc@vger.kernel.org>; Sat, 15 Feb 2025 05:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739597152; cv=none; b=eFLGZIS/kIYYRh9Wm7E6bUXKM6biqYofq9Aghr1OoQCCifSJJAzOXuhXoebUJKKLdc+EGL73TuASP4N1oGA4IaD+7CPSuT2e2O+vGXkEu83ycR2J9w7uiEFefUOpAVrqAC9iCujcR+lV0ho+Rco5PTrTGK8/WEhasZfZP6UBJC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739597152; c=relaxed/simple;
	bh=VV+l8d+1n+08ClHRmUVgF76ttKMZE66r+ZpH/00G9uc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H+PTBO9cDzYLruALysErQut9mFXva6AcDLZ3OIOndTeFw+bZEUhNUuL0QXLUumhko/U0TITG/Ip+MnT/yKbGf9dEXICTqlq7LoVjYyV8lRFuICQD7WOylYbYtzOM1kYAXQ2AX6PT6unRFqu6J/v0AQxTu+GUaZAv1Ryi/C6DNos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=pass smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=gMpSEcWQ; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=daynix.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2fa7465baceso5619191a91.0
        for <linux-doc@vger.kernel.org>; Fri, 14 Feb 2025 21:25:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1739597150; x=1740201950; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XxY7vGS9+sp+67hq8HwIoIWr2h+HOWIWq4GD0wmBmZk=;
        b=gMpSEcWQs8LO17Y29tnedGU96wjnQi2CHriTIBqgZ49ggMpa8UGqWnYygkLTWMElwH
         x4OBJ6+habzJqTkngfwXF2Jcs1fEzC2mrHtm4yz+QSH1zI6sdNj56cPSFOwcVGTPLKau
         Y/wADc4iBy/Zx+7HPcEo+yQjaYgqGdx6BI+ZmztQVTjG8m00EvMR62zgVW7wK6188AyD
         n2Oq9+3Z5UK3U2cjbPBnXXRvOVmfJ/sjn6UHWkjqrGymsFM+dGHdejo4qlkGyNx9bSaS
         Ayd5wYpc+PdE2GP1SWKOtdAEX4mQ4+DDX2mIzy2q3WV4ztboCmkBuxFYcEWX9aeSEF4r
         33aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739597150; x=1740201950;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XxY7vGS9+sp+67hq8HwIoIWr2h+HOWIWq4GD0wmBmZk=;
        b=mfky3i2NyUPPtTa4X0SRtOSgG7zoSHOKOtDU/c6uInIFbC52JiDC1fIjEp1d8BxPq+
         JjlLPS3hGcFEVunBif6O+GapvaEHXOCUHxEPD9IAVdbwfEFW8jHzW4V2bszo5xMJOcxh
         NfjxmpiLNIjt5IesVmu2erUSu9Dq8lf8Pb+oyq5yrJ9B/bfsXdt9nrMY44vfSceW2EZU
         KB8BXPVxyfv4UC52Lfx5/q+vF5CWgfgppmn++5QL2mzYTT8YFIEugi6VsfabqVMV7cae
         l8dK9D9qFqWYSkLafFhR8KEoxhbcphI0N2++tmpCdg2t2VkQC+qNswdXHWFNyX+0gaFG
         oArg==
X-Forwarded-Encrypted: i=1; AJvYcCXeQPSWan6HLo4l2Uo2AW8JCodUeAOS0TEqd47bE3yhA5CMwzBgG6F6OozIrLvvjsWO+vZEdLQij/w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm/mOs0r5CIerNQ2Bsv1aJymeernLYrXOk37gvWSR6y4FVmjmF
	ta3QneqxFYd46/kYaU8VlT3Eh5dn3E+BRf87ny/T2UmDWV04dMJFZnKo7X3X+MA=
X-Gm-Gg: ASbGncus+yh6S7j8vE1iuBvaD+B71Vd2yJsqyaEp7yJYEnCP3dwva32chAYsL36/P4C
	y63BvDmBGq1sMA0OsE5cePsPYlUdKUFl8hy16bCcr4LOuD7JsUX9Xofg6/QqmvtiEzyaJT4smOx
	X+665OvPVVHXsed8cmYVWbKx6wGC/sEQPRJHkxi7i7vVWt6KM8qryv8iBw0znlfbpvUTB/E9c/n
	bgj5q5VYiaUgOnYh3lUfv8Mg3fu9C5knSp/9GoCO5pk+2dsurpL9Q4mQLokK+uITIWFIYJnnj7x
	4I3NW7xZdGY6mtAzphm6pGX3o/qx
X-Google-Smtp-Source: AGHT+IF0Ho+OQyKz7pL/2+lFsHaAxPAgp6x6Feql0sV5I17CS0qcSIyZZ0VUMZ3n4HSPZwVJQMxVpw==
X-Received: by 2002:a05:6a00:1388:b0:732:2710:956b with SMTP id d2e1a72fcca58-732618f1520mr3291584b3a.21.1739597149920;
        Fri, 14 Feb 2025 21:25:49 -0800 (PST)
Received: from [157.82.207.107] ([157.82.207.107])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-adc68bae3e2sm2281857a12.58.2025.02.14.21.25.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Feb 2025 21:25:49 -0800 (PST)
Message-ID: <33369e7d-4c43-407a-92fd-373a8a7b2160@daynix.com>
Date: Sat, 15 Feb 2025 14:25:42 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] tun: Pad virtio headers
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jason Wang <jasowang@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, kvm@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-kselftest@vger.kernel.org,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Andrew Melnychenko <andrew@daynix.com>,
 Stephen Hemminger <stephen@networkplumber.org>, gur.stavi@huawei.com,
 devel@daynix.com
References: <20250213-buffers-v1-1-ec4a0821957a@daynix.com>
 <20250213020702-mutt-send-email-mst@kernel.org>
 <0fa16c0e-8002-4320-b7d3-d3d36f80008c@daynix.com>
 <20250213103636-mutt-send-email-mst@kernel.org>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20250213103636-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025/02/14 0:43, Michael S. Tsirkin wrote:
> On Thu, Feb 13, 2025 at 06:23:55PM +0900, Akihiko Odaki wrote:
>> On 2025/02/13 16:18, Michael S. Tsirkin wrote:
>>>
>>> Commit log needs some work.
>>>
>>> So my understanding is, this patch does not do much functionally,
>>> but makes adding the hash feature easier. OK.
>>>
>>> On Thu, Feb 13, 2025 at 03:54:06PM +0900, Akihiko Odaki wrote:
>>>> tun used to simply advance iov_iter when it needs to pad virtio header,
>>>> which leaves the garbage in the buffer as is. This is especially
>>>> problematic
>>>
>>> I think you mean "this will become especially problematic"
>>>
>>>> when tun starts to allow enabling the hash reporting
>>>> feature; even if the feature is enabled, the packet may lack a hash
>>>> value and may contain a hole in the virtio header because the packet
>>>> arrived before the feature gets enabled or does not contain the
>>>> header fields to be hashed. If the hole is not filled with zero, it is
>>>> impossible to tell if the packet lacks a hash value.
>>>>
>>>> In theory, a user of tun can fill the buffer with zero before calling
>>>> read() to avoid such a problem, but leaving the garbage in the buffer is
>>>> awkward anyway so fill the buffer in tun.
>>>
>>>
>>> What is missing here is description of what the patch does.
>>> I think it is
>>> "Replace advancing the iterator with writing zeros".
>>>
>>> There could be performance cost to the dirtying extra cache lines, though.
>>> Could you try checking that please?
>>
>> It will not dirty extra cache lines; an explanation follows later. Because
>> of that, any benchmark are likely to show only noises, but if you have an
>> idea of workloads that should be tested, please tell me.
> 
> pktgen usually

I tried it but it didn't give meaningful results so I may be doing 
wrong. It didn't show an obvious performance regression at least. I ran 
the following procedure:

1. create a veth pair
2. connect it to macvtap
3. run Fedora 41 on QEMU with vhost=on
4. run samples/pktgen/pktgen_sample01_simple.sh for the other end of veth
5. observe the rx packet rate of macvtap with ifstat for 60 seconds

ifstat showed that it received:
532K packets / 60 seconds without this patch
578K packets / 60 seconds with this patch

This is 8.6 % uplift, not degradation. I guess it's just a noise.

Below are actual commands I ran:

The commands I set up the veth pair and macvtap is as follows:

ip link add veth_host type veth peer name veth_guest
ip link set veth_host up
ip link set veth_guest up
ip link add link macvtap0 link veth_guest type macvtap
ip link set macvtap0 address 02:00:00:01:00:00 mtu 1486 up
ip address add 10.0.2.0 dev veth_host
ip route add 10.0.2.1 dev veth_host

The command for the pktgen is:
samples/pktgen/pktgen_sample01_simple.sh -i veth_host -d 10.0.2.1 -m 
02:00:00:01:00:00 -n 0

After I started pktgen, I ran: ifstat -d 60 macvtap0
I waited 60 seconds, and observed the rx rate with: ifstat -as macvtap0

> 
> 
> 
>>>
>>> I think we should mention the risks of the patch, too.
>>> Maybe:
>>>
>>> 	Also in theory, a user might have initialized the buffer
>>> 	to some non-zero value, expecting tun to skip writing it.
>>> 	As this was never a documented feature, this seems unlikely.
>>>>
>>>>
>>>> The specification also says the device MUST set num_buffers to 1 when
>>>> the field is present so set it when the specified header size is big
>>>> enough to contain the field.
>>>
>>> This part I dislike. tun has no idea what the number of buffers is.
>>> Why 1 specifically?
>>
>> That's a valid point. I rewrote the commit log to clarify, but perhaps we
>> can drop the code to set the num_buffers as "[PATCH] vhost/net: Set
>> num_buffers for virtio 1.0" already landed.
> 
> 
> I think I'd prefer that second option. it allows userspace
> to reliably detect the new behaviour, by setting the value
> to != 0.

I'll leave num_buffers zero in the next version.

> 
> 
>>
>> Below is the rewritten commit log, which incorporates your suggestions and
>> is extended to cover the performance implication and reason the num_buffers
>> initialization:
>>
>> tun simply advances iov_iter when it needs to pad virtio header,
>> which leaves the garbage in the buffer as is. This will become
>> especially problematic when tun starts to allow enabling the hash
>> reporting feature; even if the feature is enabled, the packet may lack a
>> hash value and may contain a hole in the virtio header because the
>> packet arrived before the feature gets enabled or does not contain the
>> header fields to be hashed. If the hole is not filled with zero, it is
>> impossible to tell if the packet lacks a hash value.
>>
>> In theory, a user of tun can fill the buffer with zero before calling
>> read() to avoid such a problem, but leaving the garbage in the buffer is
>> awkward anyway so replace advancing the iterator with writing zeros.
>>
>> A user might have initialized the buffer to some non-zero value,
>> expecting tun to skip writing it. As this was never a documented
>> feature, this seems unlikely. Neither is there a non-zero value that can
>> be determined and set before receiving the packet; the only exception
>> is the num_buffers field, which is expected to be 1 for version 1 when
>> VIRTIO_NET_F_HASH_REPORT is not negotiated.
> 
> you need mergeable buffers instead i presume.
> 
>> This field is specifically
>> set to 1 instead of 0.
>>
>> The overhead of filling the hole in the header is negligible as the
>> entire header is already placed on the cache when a header size defined
> 
> 
> what does this mean?

The current specification says the header size is 20 bytes or less. tun 
already makes all cache lines where the header will be written dirty for 
such a header size so we are not making another cache line dirty.

> 
>> in the current specification is used even if the cache line is small
>> (16 bytes for example).
>>
>> Below are the header sizes possible with the current specification:
>> a) 10 bytes if the legacy interface is used
>> b) 12 bytes if the modern interface is used
>> c) 20 bytes if VIRTIO_NET_F_HASH_REPORT is negotiated
>>
>> a) and b) obviously fit in a cache line. c) uses one extra cache line,
>> but the cache line also contains the first 12 bytes of the packet so
>> it is always placed on the cache.
> 
> 
> Hmm. But it could be clean so shared. write makes it dirty and so
> not shared.

The packet is not just located after the header in the buffer but tun 
writes the packet there. It makes the cache line dirty even without this 
change.

> 


