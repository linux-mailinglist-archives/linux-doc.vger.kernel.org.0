Return-Path: <linux-doc+bounces-27597-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A08EC99F437
	for <lists+linux-doc@lfdr.de>; Tue, 15 Oct 2024 19:39:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2BE7C1F23405
	for <lists+linux-doc@lfdr.de>; Tue, 15 Oct 2024 17:39:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC0361F6690;
	Tue, 15 Oct 2024 17:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=davidwei-uk.20230601.gappssmtp.com header.i=@davidwei-uk.20230601.gappssmtp.com header.b="L5ETL0u5"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641661F9EAB
	for <linux-doc@vger.kernel.org>; Tue, 15 Oct 2024 17:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729013943; cv=none; b=TanYg/Wm9RR/4TPCrJXYIONWd0lgusPOrP+IxmSeIhEcJ4VwVkd3/A4o0L0PiqJd+g9HbcJdkEgyonxVKzm5Ku3WishU/dP+UAjdTWurNRUxBgLpa4O2OGZjcgZIVUYyHoXAdDD+y1sMpZ8fN1YxwSanAL0aHzrZsdLHhgZoGy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729013943; c=relaxed/simple;
	bh=8KwyqMOmLo4SxYfVKdmt9gYI2/uiOj7DUZQWeYswkbg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ouHtWztjIpnZ++BDlkmh3NlfJ42D/ZacwiB8Wluy/gLwQ1sA6LV++gshHqzATVfFUI5Ke2FgCNg2uXILMR6XqwzjwKr58lhRXKdK1VvJcTH0DGYqh0DROGXCqI9gXArVQijqAnEyXesGc3JQW3dtf+NtCPAnk4olopnLa9MlamI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=davidwei.uk; spf=none smtp.mailfrom=davidwei.uk; dkim=pass (2048-bit key) header.d=davidwei-uk.20230601.gappssmtp.com header.i=@davidwei-uk.20230601.gappssmtp.com header.b=L5ETL0u5; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=davidwei.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=davidwei.uk
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-20c77459558so44901355ad.0
        for <linux-doc@vger.kernel.org>; Tue, 15 Oct 2024 10:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=davidwei-uk.20230601.gappssmtp.com; s=20230601; t=1729013942; x=1729618742; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RdlpaUWFvMW2v66J5pFWc2YPVVbI9jU70yW4FJmKLWE=;
        b=L5ETL0u5Sb8hAd7pUqF4VF0V9Z/O/mbeN4aGip4ICgnOg6RIFcEHaRnTBf7jcEMhRV
         i3xUXZJeNG70evU0nW2wlfSHx+sD3tZIg3xGlaniStnqf8kyrQIfGVcjLuk6WRBjjhJo
         WYbiNL7MIbSocJ29n6WdJT5q9H2NF1Afe0Lbqoqj7y3iUzGeQ1TchnclRiiWZ5Q+oknX
         gXPiyETJKltGV7UwCR2U+zhcAU009oSsJSRNV1GkFJjNE8GrKHRZBhhtwC8n/GNJJNi7
         UHLImw2sFm6hQHAOAiHhslwt/OIhsChZDKtE5gKNWDQM025KkCmJpZgI40mqTXFFF2cw
         0UaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729013942; x=1729618742;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RdlpaUWFvMW2v66J5pFWc2YPVVbI9jU70yW4FJmKLWE=;
        b=fdMFSoVWvUBQHIr7b5KPDPJiys3pxaqyk2qs9zDnCHl6KasGF7C5eX+o9KhBwDE+g9
         hO7WnLlNhA9YuYzer7xNIS9W50nA5wiSu8HQs0UUuf+B9lO+WlsGSi5NAX9k7jW5NQW7
         EaBw3I6xt1nw5aMAL2gDow9cGz0chcd7LxE49YRR1jv2b1k39wWE424ryJfj7+GSWQKs
         wkqhDS8nQAzZvP0MEVy3ENqvfV3QpZjnLt2bQPVWzjPA0QCY+Rb5f9s9HJfkeRVaHXW6
         xEonYTPRGZIiSOCp5dNQkz1nJ5/ZDb3/IQ4fszei0D7LE74DxhBNvIidllY4AqBb1hUD
         lHkA==
X-Forwarded-Encrypted: i=1; AJvYcCU+eN2hcM4NBLpLbDd08WEE/1d8i6Sd3CKyXWCytCInBfAEMen1VMIPnZD2zMxx37nkB+UE3ekfyb8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7SGmJMerbD3XZChjiJUGB98vyjnFeyh3NXPqrJxe7mvAT+5CI
	S4tlYBGQQrQpdOtTD0AKVu/1RCZ1AaIFu6mBCwDNdvEn82p9EGRvMqMvmZnBvQo=
X-Google-Smtp-Source: AGHT+IGr0FretKvW6zqzuSTI4XbC99E2I700DSVx/IyFupQ8XwlbP5UPTx1n1ra4XCG+02mziUhTaw==
X-Received: by 2002:a17:903:8c5:b0:20c:a97d:cc5c with SMTP id d9443c01a7336-20ca97dcf51mr204094065ad.6.1729013941693;
        Tue, 15 Oct 2024 10:39:01 -0700 (PDT)
Received: from ?IPV6:2a03:83e0:1256:1:80c:c984:f4f1:951f? ([2620:10d:c090:500::7:a048])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20d17f844f7sm14652905ad.60.2024.10.15.10.38.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Oct 2024 10:39:00 -0700 (PDT)
Message-ID: <592f06dd-cfc1-4e4b-acf9-350e9747d624@davidwei.uk>
Date: Tue, 15 Oct 2024 10:38:56 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 7/7] bnxt_en: add support for device memory
 tcp
Content-Language: en-GB
To: Pavel Begunkov <asml.silence@gmail.com>,
 Mina Almasry <almasrymina@google.com>, Jason Gunthorpe <jgg@ziepe.ca>
Cc: Leon Romanovsky <leonro@nvidia.com>, Jakub Kicinski <kuba@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Samiullah Khawaja <skhawaja@google.com>, Taehee Yoo <ap420073@gmail.com>,
 davem@davemloft.net, pabeni@redhat.com, edumazet@google.com,
 netdev@vger.kernel.org, linux-doc@vger.kernel.org, donald.hunter@gmail.com,
 corbet@lwn.net, michael.chan@broadcom.com, kory.maincent@bootlin.com,
 andrew@lunn.ch, maxime.chevallier@bootlin.com, danieller@nvidia.com,
 hengqi@linux.alibaba.com, ecree.xilinx@gmail.com,
 przemyslaw.kitszel@intel.com, hkallweit1@gmail.com, ahmed.zaki@intel.com,
 paul.greenwalt@intel.com, rrameshbabu@nvidia.com, idosch@nvidia.com,
 kaiyuanz@google.com, willemb@google.com, aleksander.lobakin@intel.com,
 sridhar.samudrala@intel.com, bcreeley@amd.com, David Wei <dw@davidwei.uk>
References: <20241003160620.1521626-1-ap420073@gmail.com>
 <20241003160620.1521626-8-ap420073@gmail.com>
 <CAHS8izO-7pPk7xyY4JdyaY4hZpd7zerbjhGanRvaTk+OOsvY0A@mail.gmail.com>
 <CAMArcTU61G=fexf-RJDSW_sGp9dZCkJsJKC=yjg79RS9Ugjuxw@mail.gmail.com>
 <20241008125023.7fbc1f64@kernel.org>
 <CAMArcTWVrQ7KWPt+c0u7X=jvBd2VZGVLwjWYCjMYhWZTymMRTg@mail.gmail.com>
 <20241009170102.1980ed1d@kernel.org>
 <CAHS8izMwd__+RkW-Nj3r3uG4gmocJa6QEqeHChzNXux1cbSS=w@mail.gmail.com>
 <20241010183440.29751370@kernel.org>
 <CAHS8izPuWkSmp4VCTYm93JB9fEJyUTztcT5u3UMX4b8ADWZGrA@mail.gmail.com>
 <20241011234227.GB1825128@ziepe.ca>
 <CAHS8izNzK4=6AMdACfn9LWqH9GifCL1vVxH1y2DmF9mFZbB72g@mail.gmail.com>
 <75b16ab0-07c0-41d8-9285-0511a10629f7@gmail.com>
From: David Wei <dw@davidwei.uk>
In-Reply-To: <75b16ab0-07c0-41d8-9285-0511a10629f7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 2024-10-15 07:29, Pavel Begunkov wrote:
> On 10/14/24 23:38, Mina Almasry wrote:
>> On Sat, Oct 12, 2024 at 2:42 AM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>>>
>>> On Fri, Oct 11, 2024 at 10:33:43AM -0700, Mina Almasry wrote:
>>>> On Thu, Oct 10, 2024 at 6:34 PM Jakub Kicinski <kuba@kernel.org> wrote:
>>>>>
>>>>> On Thu, 10 Oct 2024 10:44:38 -0700 Mina Almasry wrote:
>>>>>>>> I haven't thought the failure of PP_FLAG_DMA_SYNC_DEV
>>>>>>>> for dmabuf may be wrong.
>>>>>>>> I think device memory TCP is not related to this flag.
>>>>>>>> So device memory TCP core API should not return failure when
>>>>>>>> PP_FLAG_DMA_SYNC_DEV flag is set.
>>>>>>>> How about removing this condition check code in device memory TCP core?
>>>>>>>
>>>>>>> I think we need to invert the check..
>>>>>>> Mina, WDYT?
>>>>>>
>>>>>> On a closer look, my feeling is similar to Taehee,
>>>>>> PP_FLAG_DMA_SYNC_DEV should be orthogonal to memory providers. The
>>>>>> memory providers allocate the memory and provide the dma-addr, but
>>>>>> need not dma-sync the dma-addr, right? The driver can sync the
>>>>>> dma-addr if it wants and the driver can delegate the syncing to the pp
>>>>>> via PP_FLAG_DMA_SYNC_DEV if it wants. AFAICT I think the check should
>>>>>> be removed, not inverted, but I could be missing something.
>>>>>
>>>>> I don't know much about dmabuf but it hinges on the question whether
>>>>> doing DMA sync for device on a dmabuf address is :
>>>>>   - a good thing
>>>>>   - a noop
>>>>>   - a bad thing
>>>>>
>>>>> If it's a good thing or a noop - agreed.
>>>>>
>>>>> Similar question for the sync for CPU.
>>>>>
>>>>> I agree that intuitively it should be all fine. But the fact that dmabuf
>>>>> has a bespoke API for accessing the memory by the CPU makes me worried
>>>>> that there may be assumptions about these addresses not getting
>>>>> randomly fed into the normal DMA API..
>>>>
>>>> Sorry I'm also a bit unsure what is the right thing to do here. The
>>>> code that we've been running in GVE does a dma-sync for cpu
>>>> unconditionally on RX for dma-buf and non-dmabuf dma-addrs and we
>>>> haven't been seeing issues. It never does dma-sync for device.
>>>>
>>>> My first question is why is dma-sync for device needed on RX path at
>>>> all for some drivers in the first place? For incoming (non-dmabuf)
>>>> data, the data is written by the device and read by the cpu, so sync
>>>> for cpu is really what's needed. Is the sync for device for XDP? Or is
>>>> it that buffers should be dma-syncd for device before they are
>>>> re-posted to the NIC?
>>>>
>>>> Christian/Jason, sorry quick question: are
>>>> dma_sync_single_for_{device|cpu} needed or wanted when the dma-addrs
>>>> come from a dma-buf? Or these dma-addrs to be treated like any other
>>>> with the normal dma_sync_for_{device|cpu} rules?
>>>
>>> Um, I think because dma-buf hacks things up and generates illegal
>>> scatterlist entries with weird dma_map_resource() addresses for the
>>> typical P2P case the dma sync API should not be used on those things.
>>>
>>> However, there is no way to know if the dma-buf has does this, and
>>> there are valid case where the scatterlist is not ill formed and the
>>> sync is necessary.
>>>
>>> We are getting soo close to being able to start fixing these API
>>> issues in dmabuf, I hope next cylce we can begin.. Fingers crossed.
>>>
>>>  From a CPU architecture perspective you do not need to cache flush PCI
>>> MMIO BAR memory, and perhaps doing so be might be problematic on some
>>> arches (???). But you do need to flush normal cachable CPU memory if
>>> that is in the DMA buf.
>>>
>>
>> Thanks Jason. In that case I agree with Jakub we should take in his change here:
>>
>> https://lore.kernel.org/netdev/20241009170102.1980ed1d@kernel.org/
>>
>> With this change the driver would delegate dma_sync_for_device to the
>> page_pool, and the page_pool will skip it altogether for the dma-buf
>> memory provider.
> 
> Requiring ->dma_map should be common to all providers as page pool
> shouldn't be dipping to net_iovs figuring out how to map them. However,
> looking at this discussion seems that the ->dma_sync concern is devmem
> specific and should be discarded by pp providers using dmabufs, i.e. in
> devmem.c:mp_dmabuf_devmem_init().

Yes, that's my preference as well, see my earlier reply.

> 

