Return-Path: <linux-doc+bounces-40602-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D886A5D5C1
	for <lists+linux-doc@lfdr.de>; Wed, 12 Mar 2025 06:55:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E0BD178832
	for <lists+linux-doc@lfdr.de>; Wed, 12 Mar 2025 05:55:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D88291E32B7;
	Wed, 12 Mar 2025 05:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="eXPobSs1"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544101DF968
	for <linux-doc@vger.kernel.org>; Wed, 12 Mar 2025 05:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741758944; cv=none; b=fBentmwT241jtHh5/VnvemleY4WO6wbSZ7QnVSXnGcm+oPQcvl8naYGBhs5pLIrTrKbcH4dtJxJ9BufB8kPiZ1+R6J6I5gH6/q9k2AYiIDCQsL4qlidim8IHnY2VoUlPsRWXjJSK1Gjd2VVHSJLvCPCkot67O4ohgnaNuZTLS1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741758944; c=relaxed/simple;
	bh=alhU20ihOlc5cJCMuHBajEc7EUqehBtkqo5iRv29oVg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sM3KouAxKiQvSg1Yy3xxYzZOgWj4qiHxICUK3pOQTAyLOLt3gOi6m8uI8xu1IiMEUUG3yyjNSP8sCHx+foDTPtE77BF5yRv/cpQcJxNDF6r82c2O0Y83+K4Qn4jUYL5Ul3A19LGGjzx1Z/xLkbknN8pguAXpQmR940Q2vbHLbtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=pass smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=eXPobSs1; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=daynix.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2feb91a25bdso9811103a91.1
        for <linux-doc@vger.kernel.org>; Tue, 11 Mar 2025 22:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1741758941; x=1742363741; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oSOfwAcbQA4fo8Ww+ZUfjP/u2KZyMzcNTNHmT2zLzAs=;
        b=eXPobSs1pPcY2kkGUDTkUJAz6sPvL59IHQKGYSwAdKIup4QyjLYMD3b9smPrN4YSR5
         +cejTYlr6XtbunhdGIME9KwDFaa0VKAwgMBHAWmmy3E6TLNrssg7dat/SBWkmS+qU2uI
         pv3St3becRp49oIv7FgZT2IPvvnTX8HvaKjBc+6ZT7vXI1Ggc1Cdw9JzOtj1PATClKmf
         zResMG/HZlIdbikSUHgeDPD7ASoiv6FZjEuBOi158kA966Gaa+s4JyA0lnkzsTrVRxlo
         s0GmGfBgIkmQ3qn8wW4bDdr2VyJn4pmqRb2zTENBVrXdmLcxct4AaY2dkChoruyUkhDQ
         TWJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741758941; x=1742363741;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oSOfwAcbQA4fo8Ww+ZUfjP/u2KZyMzcNTNHmT2zLzAs=;
        b=nA427OZDUZPB5/rPopsh9M+xLXRy1FxLPEeUMaROLyYDHqVC+egH1LWmBabWVHSPJs
         5nxOGhloMdrQUMi6woRs74EfiWtM4ZyJoYOJYPnvbX4yFyeY4sZpXPy+g38zxAPFWW1T
         D0ugNUEQY+PWmQIwT2DS/r8qzgw5+1qp3DseKPC0J9dntQvjhkokYL4oEf+LncuHS1dW
         HJvFKbLbcse02GmmYOFudfJwaPSvLuysDy8yek+6j7RASi7H0+yvD5ZKIghM9U18+UOi
         dUkKkRn/9BRSr7yhUYgIkVzBaJwVTRbaYz2bjtyjKHT3+vODMJQxTmjFdoRcEHf7QhRB
         SRuw==
X-Forwarded-Encrypted: i=1; AJvYcCUW7ycUMoojFD0y8dfpECKq7JtiAHilXRLCwraHX0qasuwNFPbrUX5xGU5G5UsAcV6YD02bAjP24h0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpZK5lr7RPn8RvRk1GOSkXBidyDNnzrndmXDaEDrQsdyHS0zBG
	YAJQlUiCMez31/6RWj1Y8d9X8Rk+gLWc7cW3LjV0DThMUBhBuLw2d589JV5FoYQ=
X-Gm-Gg: ASbGncttjLXCl0kTWF9vKPyCOr8a27zMnmoPsJAGQmQXDjF3RqHVPzMRvH2cQhLD5Vo
	OcKeB06QTst8PMEwD0SM1uS4PftORuZKWK5gGC0dD8lrUGr90hZvH+bJLH/I1NnP2yS38qnDrTM
	kTVROGv2Jmo1i+Qr9VJPNl3ppbtvrqxA1Xd0YRH0ezLuNpWBNqyYaglHpII/9POt2BmZ9xX9Joo
	H1YLurQZduljK2S0A0ykb6c78hk4m98ELvGhnENTZq3yIORli748rnD/EQnN+S0wLe8O3AWNhQ9
	S0uKwyuPrC0rIFL0nF2QZUSNfxgm8Rc3w2PqYLSEie0OqaayC9oybWKhRw==
X-Google-Smtp-Source: AGHT+IEnYwIq0Gmg9aXj/gdoHcpx7iSAd8arSmzyKfzCe7K3tIJUhpfLuzs4l56U190AWHzReGvYOg==
X-Received: by 2002:a17:90b:48cc:b0:2ee:d371:3227 with SMTP id 98e67ed59e1d1-300ff104f1emr9530678a91.17.1741758941650;
        Tue, 11 Mar 2025 22:55:41 -0700 (PDT)
Received: from [157.82.205.237] ([157.82.205.237])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301190bbd78sm748839a91.39.2025.03.11.22.55.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Mar 2025 22:55:41 -0700 (PDT)
Message-ID: <39c059c9-fe67-46e4-8c81-854a3de8d726@daynix.com>
Date: Wed, 12 Mar 2025 14:55:36 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v9 3/6] tun: Introduce virtio-net hash feature
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
 Stephen Hemminger <stephen@networkplumber.org>, gur.stavi@huawei.com,
 Lei Yang <leiyang@redhat.com>, Simon Horman <horms@kernel.org>
References: <20250307-rss-v9-0-df76624025eb@daynix.com>
 <20250307-rss-v9-3-df76624025eb@daynix.com>
 <CACGkMEsNHba=PY5UQoH1zdGQRiHC8FugMG1nkXqOj1TBdOQrww@mail.gmail.com>
 <7978dfd5-8499-44f3-9c30-e53a01449281@daynix.com>
 <CACGkMEsR4_RreDbYQSEk5Cr29_26WNUYheWCQBjyMNUn=1eS2Q@mail.gmail.com>
 <5e67a0a6-f613-4b0a-b64e-67f649e45c3e@daynix.com>
 <CACGkMEv83iR0vU00XGOGonL1fkd=K1b-shCcNb1K8yJ9O+0BDQ@mail.gmail.com>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <CACGkMEv83iR0vU00XGOGonL1fkd=K1b-shCcNb1K8yJ9O+0BDQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2025/03/12 11:59, Jason Wang wrote:
> On Tue, Mar 11, 2025 at 2:17 PM Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>>
>> On 2025/03/11 9:38, Jason Wang wrote:
>>> On Mon, Mar 10, 2025 at 3:45 PM Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>>>>
>>>> On 2025/03/10 12:55, Jason Wang wrote:
>>>>> On Fri, Mar 7, 2025 at 7:01 PM Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>>>>>>
>>>>>> Hash reporting
>>>>>> ==============
>>>>>>
>>>>>> Allow the guest to reuse the hash value to make receive steering
>>>>>> consistent between the host and guest, and to save hash computation.
>>>>>>
>>>>>> RSS
>>>>>> ===
>>>>>>
>>>>>> RSS is a receive steering algorithm that can be negotiated to use with
>>>>>> virtio_net. Conventionally the hash calculation was done by the VMM.
>>>>>> However, computing the hash after the queue was chosen defeats the
>>>>>> purpose of RSS.
>>>>>>
>>>>>> Another approach is to use eBPF steering program. This approach has
>>>>>> another downside: it cannot report the calculated hash due to the
>>>>>> restrictive nature of eBPF steering program.
>>>>>>
>>>>>> Introduce the code to perform RSS to the kernel in order to overcome
>>>>>> thse challenges. An alternative solution is to extend the eBPF steering
>>>>>> program so that it will be able to report to the userspace, but I didn't
>>>>>> opt for it because extending the current mechanism of eBPF steering
>>>>>> program as is because it relies on legacy context rewriting, and
>>>>>> introducing kfunc-based eBPF will result in non-UAPI dependency while
>>>>>> the other relevant virtualization APIs such as KVM and vhost_net are
>>>>>> UAPIs.
>>>>>>
>>>>>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>>>>>> Tested-by: Lei Yang <leiyang@redhat.com>
>>>>>> ---
>>>>>>     Documentation/networking/tuntap.rst |   7 ++
>>>>>>     drivers/net/Kconfig                 |   1 +
>>>>>>     drivers/net/tap.c                   |  68 ++++++++++++++-
>>>>>>     drivers/net/tun.c                   |  98 +++++++++++++++++-----
>>>>>>     drivers/net/tun_vnet.h              | 159 ++++++++++++++++++++++++++++++++++--
>>>>>>     include/linux/if_tap.h              |   2 +
>>>>>>     include/linux/skbuff.h              |   3 +
>>>>>>     include/uapi/linux/if_tun.h         |  75 +++++++++++++++++
>>>>>>     net/core/skbuff.c                   |   4 +
>>>>>>     9 files changed, 386 insertions(+), 31 deletions(-)
>>>>>>
> 
> [...]
> 
>>>>> Let's has a consistent name for this and the uapi to be consistent
>>>>> with TUNSETIFF/TUNGETIFF. Probably TUNSETVNETHASH and
>>>>> tun_vnet_ioctl_gethash().
>>>>
>>>> They have different semantics so they should have different names.
>>>> TUNGETIFF reports the value currently set while TUNGETVNETHASHCAP
>>>> reports the value that can be set later.
>>>
>>> I'm not sure I will get here. I meant a symmetric name
>>>
>>> TUNSETVNETHASH and TUNVETVNETHASH.
>>
>> TUNGETVNETHASHCAP does not correspond to TUNGETIFF. The correspondence
>> of ioctl names is as follows:
>> TUNGETFEATURES - TUNGETVNETHASHCAP
> 
> TUNGETFEATURES returns the value set from TUNSETIFF. This differs from
> TUNGETVNETHASHCAP semantic which just return the capabilities.
> 
> +static inline long tun_vnet_ioctl_gethashcap(void __user *argp)
> +{
> +       static const struct tun_vnet_hash cap = {
> +               .flags = TUN_VNET_HASH_REPORT | TUN_VNET_HASH_RSS,
> +               .types = VIRTIO_NET_SUPPORTED_HASH_TYPES
> +       };
> +
> +       return copy_to_user(argp, &cap, sizeof(cap)) ? -EFAULT : 0;
> +}
> 
> TUNGETFEATURES doesn't' help too much for non-persist TAP as userspace
> knows what value it set before.
> 
>> TUNSETIFF - TUNSETVNETHASH
>> TUNGETIFF - no corresponding ioctl for the virtio-net hash features
> 
> And this sounds odd and a hint for a incomplete uAPI as userspace
> needs to know knowing what can set before doing TUNSETVNETHASH.

You are confused with TUNGETFEATURES and TUNGETIFF. Below is the code 
that implements TUNGETFEATURES:
if (cmd == TUNGETFEATURES) {
	/* Currently this just means: "what IFF flags are valid?".
	 * This is needed because we never checked for invalid flags on
	 * TUNSETIFF.
	 */
	return put_user(IFF_TUN | IFF_TAP | IFF_NO_CARRIER |
			TUN_FEATURES, (unsigned int __user*)argp);
} else if (cmd == TUNSETQUEUE) {

Regards,
Akihiko Odaki

> 
>>
>> Regards,
>> Akihiko Odaki
>>
> 
> Thanks
> 


