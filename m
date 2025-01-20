Return-Path: <linux-doc+bounces-35649-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BF5A16639
	for <lists+linux-doc@lfdr.de>; Mon, 20 Jan 2025 05:58:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 953B53AA852
	for <lists+linux-doc@lfdr.de>; Mon, 20 Jan 2025 04:58:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22CE715666D;
	Mon, 20 Jan 2025 04:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="1whu3BnK"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8374015534D
	for <linux-doc@vger.kernel.org>; Mon, 20 Jan 2025 04:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737349088; cv=none; b=jwjlY8DOa6h0GqHPkUSK4jYDMbAJ+ask6oU8qHa+EaL5RlfSJPQEppTlT21SELUfmlOIWhtzsdv8QSdT/cKmDu8RtSV3tbVvZyTWbh1Jjx4T1jUlaE05FJFZ2zkqG8mI2cXSGpp8cFBMvSKAp04iqy+atV8qNPqyNIUwyCzj6m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737349088; c=relaxed/simple;
	bh=JBhx4FBRzKbzrz2Al5pNMHO5F3JgbgRL5B/gVFGVg/0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q3oTJlykwVy0GiOJZAlbM8A6YPM5Dv8s5lvp7R3T/YqWAH/LxiXxufpe2dKkS9DficW1VxM7oLxA9rLZqxBUnI0Gkb4PdS/Nb44xdViMzgEu5O6raQhhFseeUmuAQxAnZ+3lJL5zhz09b0Vk7+nsanR9zo0wFdk8xTWWtB6rfHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=pass smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=1whu3BnK; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=daynix.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2165cb60719so68077465ad.0
        for <linux-doc@vger.kernel.org>; Sun, 19 Jan 2025 20:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1737349085; x=1737953885; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q4oIihNr6GZKGbnqtazZfNL+Wdu+eK7TRKf6H4jFUt4=;
        b=1whu3BnKNwtvtqezELWKQt0hPy+FN+eYxFnvphEYfi8qsgYC7W5bmfPPeQAFhfje9v
         CbaxUnTt6ZJUMsN9QS2shX24wJG64A76ZVHipVlxgXyEAgvl2W/LCo8UaIbMIpcWZ0X5
         Ht6uaEyQYqQOsJy/RhVomU6JHqfZ9tvSSRWxgAfHN7lvUluRmH0VrqL7ULtJ/cg3AKhm
         jweriYhaI57MWQQL1HLbdLdrvzjT1mJJE3knFLDLbBqku7AWN5eVh22I363rpyLfcFWm
         yJcgtQoFIZXlMUwvua1s94+1pI0FzQy1IXT0XLOlcY4cXT0mISggZP6IZFZ1k01USb2L
         TWVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737349085; x=1737953885;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q4oIihNr6GZKGbnqtazZfNL+Wdu+eK7TRKf6H4jFUt4=;
        b=A3a/DGkXnv+mnBYul/dOliPm0lR824axmfCs8FHcTB+Lju7snZfjEkLc4lgBQWgv/p
         E2lUsGNVq+ipC1kwhvSUd5sUwUS8QMcgvllrE+X5D87xhsPKKyRSzRd5gVIPKJ38JpQO
         vrdQhGhNAdQsFsrDc/RBFjVr4uEw1yqs/TRXQGly6uHDtju/RDnkFsxxEwGbkYOEXXXI
         pIsQb3qcRq7XAOBROo/SrMqkxv2ExW0QjDPrS+unCXo0rr/xCqlz8FB3Y4NjbWDK/aAa
         fU2nyOi7D8poWp9EFEMQ9h/9hHDojnWqxz5A1R0LjNLDfPDwfOAmUnTu5OzmsvB8vEo2
         VfLA==
X-Forwarded-Encrypted: i=1; AJvYcCVdw/y+ve7vQ+iUPu8iB2UnAfTzVHYYByOYGedec7lAo7iPSC+vf4lYz0aNBK6N8/veyNb2FmkLlAI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJhyJBs0CIFf3d/ZIvGb65b/4i0UYoXDivoVQ848Ourkpo8E78
	H2QMK6XP6sfagbGDcCekVF2gVzcSI6OfZbAVsBVNaP8E/EIpsr3pGN7Zfvil6QM=
X-Gm-Gg: ASbGncutzOQKR8N5+khMxWzJ1WgubA/4r+AZ9t/pAOtqwrYcTf6ZszjoCmjsVveynkK
	u5+Sq+VfmFG5TPQESEIpSFQQ2dg8EpEs2ry2liQLRFj9m33ctiJz5wgCsx6rP20L+0kS5rwmzOQ
	0k1o2YZnt43slPKB+NDilW4aR1h8ag+m+XB0RWTTRRvZXr5f7DqAMXZh71mjTl6u28duD7FX/AZ
	MwFH8q0F13h86EJWsBn/wp/KfVf06gJSBrUfpgAWKRsjuL1V6DJtIYWGMhx/5poyQjd3xlFxfhc
	Y7AS
X-Google-Smtp-Source: AGHT+IE8MzXrgaBKBfP61PbTUvr8PgxgGWYeOWK4EEWyIPyWkez8gj6KrIAnQzmUFU9EFnwQTPVCzw==
X-Received: by 2002:a05:6a20:914e:b0:1e1:70ab:b369 with SMTP id adf61e73a8af0-1eb214983dfmr16605568637.13.1737349085531;
        Sun, 19 Jan 2025 20:58:05 -0800 (PST)
Received: from [157.82.203.37] ([157.82.203.37])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dab817529sm6251103b3a.67.2025.01.19.20.58.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jan 2025 20:58:05 -0800 (PST)
Message-ID: <8052733d-3e79-4fd5-9bea-9d3724820bb8@daynix.com>
Date: Mon, 20 Jan 2025 13:57:59 +0900
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
 <cc79bef1-c24e-448d-bc20-f8302e341b2c@daynix.com>
 <CACGkMEsJUb3ZLm3rLuaayDAS4kf-vbY03wL4M9j1K+Z=a4BDig@mail.gmail.com>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <CACGkMEsJUb3ZLm3rLuaayDAS4kf-vbY03wL4M9j1K+Z=a4BDig@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2025/01/20 9:40, Jason Wang wrote:
> On Thu, Jan 16, 2025 at 1:30 PM Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>>
>> On 2025/01/16 10:06, Jason Wang wrote:
>>> On Wed, Jan 15, 2025 at 1:07 PM Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>>>>
>>>> On 2025/01/13 12:04, Jason Wang wrote:
>>>>> On Fri, Jan 10, 2025 at 7:12 PM Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>>>>>>
>>>>>> On 2025/01/10 19:23, Michael S. Tsirkin wrote:
>>>>>>> On Fri, Jan 10, 2025 at 11:27:13AM +0800, Jason Wang wrote:
>>>>>>>> On Thu, Jan 9, 2025 at 2:59 PM Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>>>>>>>>>
>>>>>>>>> The specification says the device MUST set num_buffers to 1 if
>>>>>>>>> VIRTIO_NET_F_MRG_RXBUF has not been negotiated.
>>>>>>>>
>>>>>>>> Have we agreed on how to fix the spec or not?
>>>>>>>>
>>>>>>>> As I replied in the spec patch, if we just remove this "MUST", it
>>>>>>>> looks like we are all fine?
>>>>>>>>
>>>>>>>> Thanks
>>>>>>>
>>>>>>> We should replace MUST with SHOULD but it is not all fine,
>>>>>>> ignoring SHOULD is a quality of implementation issue.
>>>>>>>
>>>>>
>>>>> So is this something that the driver should notice?
>>>>>
>>>>>>
>>>>>> Should we really replace it? It would mean that a driver conformant with
>>>>>> the current specification may not be compatible with a device conformant
>>>>>> with the future specification.
>>>>>
>>>>> I don't get this. We are talking about devices and we want to relax so
>>>>> it should compatibile.
>>>>
>>>>
>>>> The problem is:
>>>> 1) On the device side, the num_buffers can be left uninitialized due to bugs
>>>> 2) On the driver side, the specification allows assuming the num_buffers
>>>> is set to one.
>>>>
>>>> Relaxing the device requirement will replace "due to bugs" with
>>>> "according to the specification" in 1). It still contradicts with 2) so
>>>> does not fix compatibility.
>>>
>>> Just to clarify I meant we can simply remove the following:
>>>
>>> """
>>> The device MUST use only a single descriptor if VIRTIO_NET_F_MRG_RXBUF
>>> was not negotiated. Note: This means that num_buffers will always be 1
>>> if VIRTIO_NET_F_MRG_RXBUF is not negotiated.
>>> """
>>>
>>> And
>>>
>>> """
>>> If VIRTIO_NET_F_MRG_RXBUF has not been negotiated, the device MUST set
>>> num_buffers to 1.
>>> """
>>>
>>> This seems easier as it reflects the fact where some devices don't set
>>> it. And it eases the transitional device as it doesn't need to have
>>> any special care.
>>
>> That can potentially break existing drivers that are compliant with the
>> current and assumes the num_buffers is set to 1.
> 
> Those drivers are already 'broken'. Aren't they?

The drivers are not broken, but vhost_net is. The driver works fine as 
long as it's used with a device compliant with the specification. If we 
relax the device requirement in the future specification, the drivers 
may not work with devices compliant with the revised specification.

Regards,
Akihiko Odaki

> 
> Thanks
> 
>>
>> Regards,
>> Akihiko Odaki
>>
>>>
>>> Then we don't need any driver normative so I don't see any conflict.
>>>
>>> Michael suggests we use "SHOULD", but if this is something that the
>>> driver needs to be aware of I don't know how "SHOULD" can help a lot
>>> or not.
>>>
>>>>
>>>> Instead, we should make the driver requirement stricter to change 2).
>>>> That is what "[PATCH v3] virtio-net: Ignore num_buffers when unused" does:
>>>> https://lore.kernel.org/r/20250110-reserved-v3-1-2ade0a5d2090@daynix.com
>>>>
>>>>>
>>>>>>
>>>>>> We are going to fix all implementations known to buggy (QEMU and Linux)
>>>>>> anyway so I think it's just fine to leave that part of specification as is.
>>>>>
>>>>> I don't think we can fix it all.
>>>>
>>>> It essentially only requires storing 16 bits. There are details we need
>>>> to work out, but it should be possible to fix.
>>>
>>> I meant it's not realistic to fix all the hypervisors. Note that
>>> modern devices have been implemented for about a decade so we may have
>>> too many versions of various hypervisors. (E.g DPDK seems to stick
>>> with the same behaviour of the current kernel).
>>   > >>
>>>> Regards,
>>>> Akihiko Odaki
>>>>
>>>
>>> Thanks
>>>
>>
> 


