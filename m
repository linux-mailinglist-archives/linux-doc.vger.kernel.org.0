Return-Path: <linux-doc+bounces-40591-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A54BA5D371
	for <lists+linux-doc@lfdr.de>; Wed, 12 Mar 2025 01:00:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C9DD0189DD0F
	for <lists+linux-doc@lfdr.de>; Wed, 12 Mar 2025 00:00:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAEA31F03EF;
	Wed, 12 Mar 2025 00:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="YJxpfA6O"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397A01E7C16
	for <linux-doc@vger.kernel.org>; Wed, 12 Mar 2025 00:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741737621; cv=none; b=BuE8SH3EIR6uH4ntwfyc1kzqrGE0+DpfN0p+Mrm7e8z8Z9Us/ViqAil7aUgeprmQo6dDAiUbIv39iVVzPnjPMz1+Gr18ggnKdulgmg+4JHcASco0Q7mQDjZPRX0MSbAPOqyvk/fi6v+DsnROVW9EtyloA3XhU15sGaUYMuanAlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741737621; c=relaxed/simple;
	bh=LzSGWoUrmA9F7GdxXElYNI9zttTk0B3+Dt7+nD6DobY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mYcw5o7iKTt9qX5D+pDbKr0OHdwm74Bxtm9LvhcPK7IbYJszoEAoqlz6iBfmDm4BNuNl38lO/gfBGibTMQ0d490hsanRzWCRUFhxfC7xGXT+Bf3WlIUGKHoLeCKQPWuwpTPYF4wIBhCIYVwFlo+YQovA8PIdb6krLASB1PKW9/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=YJxpfA6O; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7272a839f3dso1402065a34.3
        for <linux-doc@vger.kernel.org>; Tue, 11 Mar 2025 17:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1741737618; x=1742342418; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7L/tvJCTiuEQ7q495gZao+1PMe6JjH/RxapbsOLxMlM=;
        b=YJxpfA6ODb0fE537yi1evrBnocaLJlIu5MQgCy/eT4fltwPQu9CgcA1lIUtOF3CmVR
         dgdFP1hv+JrVogAk8XZGhhsXyNtOM2NgPxBaPq0+7QRrBhHCiKiuSCWQBv5bCiFDIBrl
         AVgEX5C3F1x4fAK1M+o+EOVfJ3fsjF764t8W8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741737618; x=1742342418;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7L/tvJCTiuEQ7q495gZao+1PMe6JjH/RxapbsOLxMlM=;
        b=Hf0NddTrxrQVvTyU1yp2iQX9GkX1IEvC0rttxlqfoLrRXuUg0oiG6a/ja8Qy85TUJS
         DKMGzUPZa0rfXV8ls1hreQqS87Z4NO5vx89kQHqwhLEdfJUkAjrV8SfGIF/TKyTBgHKm
         JLUv1RLl8gG1bzQYGNK4tCA7oUyoCcbvHoz0HmQK66iSpfMLMMap2bIYE+ofnGdhkbuh
         sQeTkU3XSWJ4iSPBXmvzn/2E4BWjj1nPo1UXKJQm3LTXLnRp78C76zcIm8K6br3OGTGs
         0shPAfPyt6ba/vhnVc11OFL/fxPN0bL1oP2y9yGS2/BkNWPqV9a6l6bgjWQ/HfDi2bec
         wYaA==
X-Forwarded-Encrypted: i=1; AJvYcCWRzxvnNTGa066fHCBtVeK+eT74kLtU7h498htkRiPRoALzOqUHKxOZbyiRrl6k+ueaSBXQW8Xsjcc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQHrONfavtcAep3YNt2WsX0yTU32966gEHfUqKXU41CbQzHqni
	Zq78Jg+T9dG4UXknMgN85NTZFE+mwUdRk5/GObZFEXMJ27A1kyusVmHNQUpnPA==
X-Gm-Gg: ASbGnctemVvcZEWf6aYSlDFeP9m4+4o48kYvnDTnOINq0K064rm/LN9hpdCaU9uCu6a
	KXeqkqezoIGUGmQI6nG2SAu+PZAgqGATekkdrHZZahpsJgB9MTtq5s8c43B/1BemRt4W97ESO9F
	60ybEk/En+EtH8VALy9b0Q6NFuTQ8o7ul/bCzIJt0CZ6j9RDKQr8qWTZxc9iAzjCu2Sb5KxG5pa
	SSQ/OHZcpc2tZ+aPtTmv+IZ+OLvKBPHLKiIbQQN2859bjaNb/jRlQMpAEnfur5mE1ag0PvYaYnH
	u1NXZM3BumnwnMB7Jn5AFlg52H6uK2JgGkBl4NDQG8tR3luI/ceyRq17nfG+rfVxl0lzbMkCJe/
	DKTqSx44spSrOYA==
X-Google-Smtp-Source: AGHT+IH8+DQmUpgMOetDvZc19e+qs53cnjmVRH4SEyeU5jv8b9vCklQxjRT6Gf6qE603U+ZssGc7/A==
X-Received: by 2002:a05:6830:3693:b0:72b:938e:31cb with SMTP id 46e09a7af769-72b9b4a42f6mr3225979a34.7.1741737618123;
        Tue, 11 Mar 2025 17:00:18 -0700 (PDT)
Received: from [10.69.79.211] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-72b7c8e98dasm1543776a34.56.2025.03.11.17.00.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Mar 2025 17:00:17 -0700 (PDT)
Message-ID: <cf6a5ec7-b7cf-4ac6-91ed-5543477d4e30@broadcom.com>
Date: Tue, 11 Mar 2025 17:00:15 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] swiotlb: Introduce DMA_ATTR_SKIP_DEVICE_SYNC
To: Florian Fainelli <florian.fainelli@broadcom.com>,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org
Cc: bcm-kernel-feedback-list@broadcom.com, Jonathan Corbet <corbet@lwn.net>,
 Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Petr Tesarik <petr@tesarici.cz>, Michael Kelley <mhklinux@outlook.com>,
 Lukas Bulwahn <lukas.bulwahn@redhat.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>, Eder Zulian <ezulian@redhat.com>,
 Sean Anderson <sean.anderson@linux.dev>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 "open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>,
 "open list:TRACING" <linux-trace-kernel@vger.kernel.org>
References: <20250115194659.618438-1-florian.fainelli@broadcom.com>
 <9582878b-1ce7-4fc4-9b45-b72bba722f49@arm.com>
 <ecf3d8db-8533-4b0d-ab49-3543a766fd99@broadcom.com>
Content-Language: en-US
From: Justin Chen <justin.chen@broadcom.com>
In-Reply-To: <ecf3d8db-8533-4b0d-ab49-3543a766fd99@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 1/15/25 2:16 PM, Florian Fainelli wrote:
> On 1/15/25 12:12, Robin Murphy wrote:
>> On 2025-01-15 7:46 pm, Florian Fainelli wrote:
>>> From: Justin Chen <justin.chen@broadcom.com>
>>>
>>> Network device driver's receive path typically do the following:
>>>
>>> - dma_map_single(.., DMA_FROM_DEVICE)
>>> - dma_sync_single_for_cpu() to allow the CPU to inspect packet
>>>    descriptors
>>> - dma_unmap_single(.., DMA_FROM_DEVICE) when releasing the buffer
>>>
>>> Each of those operations incurs a copy from the original buffer to the
>>> TLB buffer, even if the device is known to be writing full buffers.
>>>
>>> Add a DMA_ATTR_SKIP_DEVICE_SYNC flag which can be set by device drivers
>>> to skip the copy at dma_map_single() to speed up the RX path when the
>>> device is known to be doing full buffer writes.
>>>
>>> This has been seen to provide a 20% speedup for Wi-Fi RX throughput
>>> testing.
>>>
>>> Signed-off-by: Justin Chen <justin.chen@broadcom.com>
>>> [florian: commit message, add DMA-API attribute flag]
>>> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
>>> ---
>>>   Documentation/core-api/dma-attributes.rst | 9 +++++++++
>>>   Documentation/core-api/swiotlb.rst        | 4 +++-
>>>   include/linux/dma-mapping.h               | 6 ++++++
>>>   include/trace/events/dma.h                | 3 ++-
>>>   kernel/dma/swiotlb.c                      | 8 ++++++++
>>>   5 files changed, 28 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/Documentation/core-api/dma-attributes.rst b/ 
>>> Documentation/core-api/dma-attributes.rst
>>> index 1887d92e8e92..ccd9c1891200 100644
>>> --- a/Documentation/core-api/dma-attributes.rst
>>> +++ b/Documentation/core-api/dma-attributes.rst
>>> @@ -130,3 +130,12 @@ accesses to DMA buffers in both privileged 
>>> "supervisor" and unprivileged
>>>   subsystem that the buffer is fully accessible at the elevated 
>>> privilege
>>>   level (and ideally inaccessible or at least read-only at the
>>>   lesser-privileged levels).
>>> +
>>> +DMA_ATTR_SKIP_DEVICE_SYNC
>>> +-------------------------
>>> +
>>> +Device drivers can set DMA_ATTR_SKIP_DEVICE_SYNC in order to avoid 
>>> doing a copy
>>> +from the original buffer to the TLB buffer for dma_map_single() with a
>>> +DMA_FROM_DEVICE direction. This can be used to save an extra copy in 
>>> a device
>>> +driver's data path when using swiotlb bounce buffering.
>>> +
>>> diff --git a/Documentation/core-api/swiotlb.rst b/Documentation/core- 
>>> api/swiotlb.rst
>>> index 9e0fe027dd3b..3bc1f9ba67b2 100644
>>> --- a/Documentation/core-api/swiotlb.rst
>>> +++ b/Documentation/core-api/swiotlb.rst
>>> @@ -67,7 +67,9 @@ to the driver for programming into the device. If a 
>>> DMA operation specifies
>>>   multiple memory buffer segments, a separate bounce buffer must be 
>>> allocated for
>>>   each segment. swiotlb_tbl_map_single() always does a "sync" 
>>> operation (i.e., a
>>>   CPU copy) to initialize the bounce buffer to match the contents of 
>>> the original
>>> -buffer.
>>> +buffer, except if DMA_ATTR_SKIP_DEVICE_SYNC is specified and the 
>>> direction is
>>> +DMA_FROM_DEVICE. This is a performance optimization that may not be 
>>> suitable for
>>> +all platforms.
>>>   swiotlb_tbl_unmap_single() does the reverse. If the DMA operation 
>>> might have
>>>   updated the bounce buffer memory and DMA_ATTR_SKIP_CPU_SYNC is not 
>>> set, the
>>> diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
>>> index b79925b1c433..bfdaa65f8e9d 100644
>>> --- a/include/linux/dma-mapping.h
>>> +++ b/include/linux/dma-mapping.h
>>> @@ -58,6 +58,12 @@
>>>    */
>>>   #define DMA_ATTR_PRIVILEGED        (1UL << 9)
>>> +/*
>>> + * DMA_ATTR_SKIP_DEVICE_SYNC: used to indicate that the buffer does 
>>> not need to
>>> + * be synchronized to the device.
>>> + */
>>> +#define DMA_ATTR_SKIP_DEVICE_SYNC    (1UL << 10)
>>> +
>>>   /*
>>>    * A dma_addr_t can hold any valid DMA or bus address for the 
>>> platform.  It can
>>>    * be given to a device to use as a DMA source or target.  It is 
>>> specific to a
>>> diff --git a/include/trace/events/dma.h b/include/trace/events/dma.h
>>> index d8ddc27b6a7c..6eb8fd7e3515 100644
>>> --- a/include/trace/events/dma.h
>>> +++ b/include/trace/events/dma.h
>>> @@ -31,7 +31,8 @@ TRACE_DEFINE_ENUM(DMA_NONE);
>>>           { DMA_ATTR_FORCE_CONTIGUOUS, "FORCE_CONTIGUOUS" }, \
>>>           { DMA_ATTR_ALLOC_SINGLE_PAGES, "ALLOC_SINGLE_PAGES" }, \
>>>           { DMA_ATTR_NO_WARN, "NO_WARN" }, \
>>> -        { DMA_ATTR_PRIVILEGED, "PRIVILEGED" })
>>> +        { DMA_ATTR_PRIVILEGED, "PRIVILEGED" }, \
>>> +        { DMA_ATTR_SKIP_DEVICE_SYNC, "SKIP_DEVICE_SYNC" })
>>>   DECLARE_EVENT_CLASS(dma_map,
>>>       TP_PROTO(struct device *dev, phys_addr_t phys_addr, dma_addr_t 
>>> dma_addr,
>>> diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
>>> index abcf3fa63a56..8dab89bf5e33 100644
>>> --- a/kernel/dma/swiotlb.c
>>> +++ b/kernel/dma/swiotlb.c
>>> @@ -1435,8 +1435,16 @@ phys_addr_t swiotlb_tbl_map_single(struct 
>>> device *dev, phys_addr_t orig_addr,
>>>        * the original data, even if it's garbage, is necessary to match
>>>        * hardware behavior.  Use of swiotlb is supposed to be 
>>> transparent,
>>>        * i.e. swiotlb must not corrupt memory by clobbering unwritten 
>>> bytes.
>>> +     *
>>> +     * Setting DMA_ATTR_SKIP_DEVICE_SYNC will negate the behavior 
>>> described
>>> +     * before and avoid the copy from the original buffer to the TLB
>>> +     * buffer.
>>>        */
>>> +    if (dir == DMA_FROM_DEVICE && (attrs & DMA_ATTR_SKIP_DEVICE_SYNC))
>>> +        goto out;
>>
>> Nope, we still need to initialise the SWIOTLB slot with *something*, 
>> or we're just reintroducing the same data leakage issue again. The 
>> whole deal with that was that the caller *did* expect the entire 
>> buffer to be written, but the device had an error, and thus the 
>> subsequent unmap bounced out whatever data was in SWIOTLB before.
> 
> Do you know how common that assumption is within drivers? Could that 
> behavior been hidden behind a flag, sort of like what is being done here?
> 
>>
>> A memset is hopefully at least a bit faster than a copy, so maybe 
>> there is still some life in this idea, but the semantic is not "skip 
>> sync", it's "I'm OK with this entire buffer getting scribbled even my 
>> device ends up never touching it".
> 
> Sure, let me test with a memset(), any suggestion on a name that carries 
> better semantics, I do agree that "skip sync" is not quite descriptive 
> enough.

I ran some more test and see minimal improvement from memset. I ran an 
isolated test of using one 4k page buffer.

Average time per RX packet:
NO SWIOTLB: 2.111 us
SWIOTLB without bounce: 4.937 us
SWIOTLB with bounce: 6.631 us
SWIOTLB with memset: 6.506 us

I understand this introduces potential data leakage, but the 25% 
improvement is quite significant. The percentage will increase with 
bigger buffers. Is there anyway we can find a compromise here? What if 
we hid this behind the swiotlb flag?

@@ -176,8 +176,9 @@ setup_io_tlb_npages(char *str)
                 swiotlb_force_bounce = true;
         else if (!strcmp(str, "noforce"))
                 swiotlb_force_disable = true;
+       else if (!strcmp(str, "leakDMAbuffer"))
+               swiotlb_leak_dma_buffer = true;

Thanks,
Justin



