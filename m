Return-Path: <linux-doc+bounces-35420-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E455A13298
	for <lists+linux-doc@lfdr.de>; Thu, 16 Jan 2025 06:30:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 84E4D16862D
	for <lists+linux-doc@lfdr.de>; Thu, 16 Jan 2025 05:30:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5CAA156F41;
	Thu, 16 Jan 2025 05:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="Ct3biXum"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1311411EB
	for <linux-doc@vger.kernel.org>; Thu, 16 Jan 2025 05:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737005425; cv=none; b=Jqu6EpRQehfrTtU+iUH8mcJfihEdlT6I7jl0PXG9no5Yz8HguxFaEyYPuGB6rSnoFv24yyouijEOtFlhqhuSZ0LaboUIpDXIAECPmVc75FfzFijCTZRiGDU5NeCUX0OvBu3j6dyEVQFFTDpYlsNYF533mCWTiEWjRzJaUN0cSJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737005425; c=relaxed/simple;
	bh=5xQA7+rcyNu9tK/Yw0+0NEwKQ5hjxrD+NiJB5k0WJ3A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hIYwwEmtMCUz/y7ZnzEul/hXEBpqsah4KyoqQNadL2Rpwkx3xsLH4Kj5wE8hGxnFpsP6rFiJB0RHUkW0GerD+gfgjgzsPJTG2UCKmJyptROwwmpvi81zBoSTy+zjBaEG+WdJxojG8/OcdkI1Ub0xWkQmkRBcH15q5rkkW0mpn8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=pass smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=Ct3biXum; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=daynix.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-21654fdd5daso7840485ad.1
        for <linux-doc@vger.kernel.org>; Wed, 15 Jan 2025 21:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1737005423; x=1737610223; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t85mZgz2Rs3YU6wJKJ13zARpOEqd4Q3PLwsjti7bxDQ=;
        b=Ct3biXumbZ8x4r0PTptGSo33l1ZLQq70j+BXPuYlXDxxLJXQ4YcrYRh6tfR4fqabOO
         7IeiK5xCteU9Vy+4qe450Pnfr2Euqbt18+XnTorYKyKIYMkFT7SDvS8ncvLI+1eAQ3r5
         P+YXsb0U7hsQoWS+y+X+e7seAJulj40sCCXhTt1v04y6vy8MFGUGjBinqOnS2ZFZQ8oW
         6lcENAShZx40W+kYt2UJ/uHkL5krmNWY8/ycNeJJS8gIhXKrOrv95+U7o+hVCwTkMwOI
         prMxEBejHxG52OIxExbzNjDyU1H3jqMeCvhi4I94A35lsy2evEJ96aXm0KBcp1OfWQe1
         s6wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737005423; x=1737610223;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t85mZgz2Rs3YU6wJKJ13zARpOEqd4Q3PLwsjti7bxDQ=;
        b=giLk6lTjqWhQc7DawfjNQ/qyckXgxzPInYZ+gbUeXMCrxOIBWtwZWOULQ+pWzzCpwD
         7vEP+HWazBA7sunBAmIUJFb6Is9Ck0oiinFvvHAgVx8Ax8+kPoJKUQpeMg/syBWQK9Bb
         H2nHgZ6NtJY5LO89v4VLhQc/UdxiwutNGpC03yYMDcUvRyWQGqcy56sW2snptAmBsJ9c
         DvmPlASK/U8VLDMprbycj13emFyyjKeHlcyDctHfGH98+RWGwI7bWkO0RoTfQGHBi49Y
         NM/HMRb31uh59u2PTCGHytTOw/4906RYf0mnU4jxHyxajuMBHVZkhk9qLZgcUXI7qFcN
         Yn5g==
X-Forwarded-Encrypted: i=1; AJvYcCWf2/cipQ5gO0CVwIwzIpa68bnoBQtwsuKdboSdjYbsrzlagULjIQ9PX1eKJzh1kgQOwB01TLOQg2s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyV+e+5N9VGBCjVN+L4b9JOn6JX6kpbJ7EAdPpSE/qT1piHnNvy
	GJL+P9J1Kqhtc/TzugqpPz0EN5JjAN2pVa9oQjv0Rn/g/Jy/x34yNJwWQ+aLTng=
X-Gm-Gg: ASbGncvxwxh9ntSF+1MPiIYNqnPsEzFfNKCQ7inj8vukLcTjEa3XPsAik+rWGc5I3Nd
	SDfROzZYod27a78L7pYe5ERRxBBT0bsOfaCr2rYX5y405bXFvfvNZD5ZQqnKv/sEGGKJPi9pY/4
	GKO4Z6AA8WcgrdjTYLX045EzzM+aJzHggvvdxSbV77ipzqYfIUO1q0t50uzH43QV+u8/6jVkWX9
	KXd5s034sQpD1shNuDes59dzsKqQ5MGnzQiUGS0NdhuiZLDyUU4YLX2940c6bNlOzQ=
X-Google-Smtp-Source: AGHT+IEwP5ZyOaLIZ2+ZynbDYG6rMIezxsEt9Oeopwo0vGbe1vdYSLm0vMdAkgahtQxltszD6eVILA==
X-Received: by 2002:a17:902:ea0a:b0:216:682f:175 with SMTP id d9443c01a7336-21a840029a0mr517608085ad.49.1737005423363;
        Wed, 15 Jan 2025 21:30:23 -0800 (PST)
Received: from [157.82.203.37] ([157.82.203.37])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f217565sm90290735ad.125.2025.01.15.21.30.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2025 21:30:22 -0800 (PST)
Message-ID: <cc79bef1-c24e-448d-bc20-f8302e341b2c@daynix.com>
Date: Thu, 16 Jan 2025 14:30:16 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] tun: Set num_buffers for virtio 1.0
To: Jason Wang <jasowang@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Shuah Khan <shuah@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, kvm@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-kselftest@vger.kernel.org,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Andrew Melnychenko <andrew@daynix.com>,
 Stephen Hemminger <stephen@networkplumber.org>, gur.stavi@huawei.com,
 devel@daynix.com
References: <20250109-tun-v2-0-388d7d5a287a@daynix.com>
 <20250109-tun-v2-3-388d7d5a287a@daynix.com>
 <CACGkMEsm5DCb+n3NYeRjmq3rAANztZz5QmV8rbPNo+cH-=VzDQ@mail.gmail.com>
 <20250110052246-mutt-send-email-mst@kernel.org>
 <2e015ee6-8a3b-43fb-b119-e1921139c74b@daynix.com>
 <CACGkMEuiyfH-QitiiKJ__-8NiTjoOfc8Nx5BwLM-GOfPpVEitA@mail.gmail.com>
 <fcb301e8-c808-4e20-92dd-2e3b83998d18@daynix.com>
 <CACGkMEvBU3mLbW+-nOscriR-SeDvPSm1mtwwgznYFOocuao5MQ@mail.gmail.com>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <CACGkMEvBU3mLbW+-nOscriR-SeDvPSm1mtwwgznYFOocuao5MQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2025/01/16 10:06, Jason Wang wrote:
> On Wed, Jan 15, 2025 at 1:07 PM Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>>
>> On 2025/01/13 12:04, Jason Wang wrote:
>>> On Fri, Jan 10, 2025 at 7:12 PM Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>>>>
>>>> On 2025/01/10 19:23, Michael S. Tsirkin wrote:
>>>>> On Fri, Jan 10, 2025 at 11:27:13AM +0800, Jason Wang wrote:
>>>>>> On Thu, Jan 9, 2025 at 2:59 PM Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>>>>>>>
>>>>>>> The specification says the device MUST set num_buffers to 1 if
>>>>>>> VIRTIO_NET_F_MRG_RXBUF has not been negotiated.
>>>>>>
>>>>>> Have we agreed on how to fix the spec or not?
>>>>>>
>>>>>> As I replied in the spec patch, if we just remove this "MUST", it
>>>>>> looks like we are all fine?
>>>>>>
>>>>>> Thanks
>>>>>
>>>>> We should replace MUST with SHOULD but it is not all fine,
>>>>> ignoring SHOULD is a quality of implementation issue.
>>>>>
>>>
>>> So is this something that the driver should notice?
>>>
>>>>
>>>> Should we really replace it? It would mean that a driver conformant with
>>>> the current specification may not be compatible with a device conformant
>>>> with the future specification.
>>>
>>> I don't get this. We are talking about devices and we want to relax so
>>> it should compatibile.
>>
>>
>> The problem is:
>> 1) On the device side, the num_buffers can be left uninitialized due to bugs
>> 2) On the driver side, the specification allows assuming the num_buffers
>> is set to one.
>>
>> Relaxing the device requirement will replace "due to bugs" with
>> "according to the specification" in 1). It still contradicts with 2) so
>> does not fix compatibility.
> 
> Just to clarify I meant we can simply remove the following:
> 
> """
> The device MUST use only a single descriptor if VIRTIO_NET_F_MRG_RXBUF
> was not negotiated. Note: This means that num_buffers will always be 1
> if VIRTIO_NET_F_MRG_RXBUF is not negotiated.
> """
> 
> And
> 
> """
> If VIRTIO_NET_F_MRG_RXBUF has not been negotiated, the device MUST set
> num_buffers to 1.
> """
> 
> This seems easier as it reflects the fact where some devices don't set
> it. And it eases the transitional device as it doesn't need to have
> any special care.

That can potentially break existing drivers that are compliant with the 
current and assumes the num_buffers is set to 1.

Regards,
Akihiko Odaki

> 
> Then we don't need any driver normative so I don't see any conflict.
> 
> Michael suggests we use "SHOULD", but if this is something that the
> driver needs to be aware of I don't know how "SHOULD" can help a lot
> or not.
> 
>>
>> Instead, we should make the driver requirement stricter to change 2).
>> That is what "[PATCH v3] virtio-net: Ignore num_buffers when unused" does:
>> https://lore.kernel.org/r/20250110-reserved-v3-1-2ade0a5d2090@daynix.com
>>
>>>
>>>>
>>>> We are going to fix all implementations known to buggy (QEMU and Linux)
>>>> anyway so I think it's just fine to leave that part of specification as is.
>>>
>>> I don't think we can fix it all.
>>
>> It essentially only requires storing 16 bits. There are details we need
>> to work out, but it should be possible to fix.
> 
> I meant it's not realistic to fix all the hypervisors. Note that
> modern devices have been implemented for about a decade so we may have
> too many versions of various hypervisors. (E.g DPDK seems to stick
> with the same behaviour of the current kernel).
 > >>
>> Regards,
>> Akihiko Odaki
>>
> 
> Thanks
> 


