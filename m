Return-Path: <linux-doc+bounces-29500-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA419B8578
	for <lists+linux-doc@lfdr.de>; Thu, 31 Oct 2024 22:41:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C68D21F25282
	for <lists+linux-doc@lfdr.de>; Thu, 31 Oct 2024 21:41:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E42E1CCB30;
	Thu, 31 Oct 2024 21:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WbzH1DAX"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF171C9ECA
	for <linux-doc@vger.kernel.org>; Thu, 31 Oct 2024 21:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730410887; cv=none; b=Rl/RFx9Y1kOObV2D2Gw4qAzmHCIyZa8TjC74iiGNnnKwYHuQusY0gwm8EEbKNndXJwlNEEN4uUtdfpDkbKMoHdST2hjx5/UiF/eAMs2M9B+jCnrPjCIJh3lSyG6rFaac6tEHYyke7Fxwsx61XOXMra3F5ddNLgiX2sC+3hlNbLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730410887; c=relaxed/simple;
	bh=pPG5DR7tU5m6fxnN1y22SMUllbZm0Wi5JXNaJguSXTQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JuGJla9nKhjyCsNu5sQUNpO7PKvhGuyB22+1FEZx3V3MvPQRjJIE8Hfec6cDnxklViVGLlj1a10r/nIMhFA87bCzjS3wQAocbkFJxTDXsgv8KYC9b1aJ2W2epH41xavAhMQxnWA/4YLzcnWf9HCgflNv8alof1/TpNhquYYs/Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WbzH1DAX; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730410880;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=V9qGJfnpN/vTVlVkacjjN4O4qiIfHH6/DqVZDAH06eM=;
	b=WbzH1DAXsZJx6gdqiNlj3qHDRrekZPlyYV7L7+GlHnoZCJp1SrdQcxW3OVxNLZesWuQdcG
	hmg0vq+c80wlrr/MgjDd0YfwzGnOnxWPNU9O/1De0S7K1Nf08StV0Br1zUglYBAav2xsyh
	bB0tOpZ7UH7bPelmwtE2k3zPyH75Cc8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-362-raMgFj49NrSQgRIcw63EHA-1; Thu, 31 Oct 2024 17:41:19 -0400
X-MC-Unique: raMgFj49NrSQgRIcw63EHA-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4315d98a75fso9083275e9.2
        for <linux-doc@vger.kernel.org>; Thu, 31 Oct 2024 14:41:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730410878; x=1731015678;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=V9qGJfnpN/vTVlVkacjjN4O4qiIfHH6/DqVZDAH06eM=;
        b=b53C4FAS6KH4VzkwxV6vkxTgnDURV2vSCgfdkmuq2NEZ1WuALLUYanVgCx0KDCRAeV
         Q0tnIyRdQ/gOg9EsP2Ct0V3vHDVqMrbEaXR8Y0BFx9KVREQTgQGMCPOszF3ljj9lH5zS
         ArloQl6HK5gUr/VbzW7z9h3+DcAMC7j9mSlvL2UqVROO6XjEe3u9vNZmosF2zGf4o8ZK
         FWvMyLa99cW21hWtXsK+xzTvZkuma2kvmNOUfC8IwLf2BsPiEzfsw6avFCaHefy4ZDGx
         arlc28Nk1sngI6Zki/G1y+HLTYXoec94b3qtWRJ/erQ2NmdQUvPUj4v+CZ9hiO6vf4W0
         Tw5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVJqbRWlsROzav777oNy67/ZiWKdXWX/SZ0OERem2k/0BPkUEdlBmJXqbsXBEacBSadgM0fxD/FXcQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywpjtusl+pshauq6AGQKHT+0fX+BGpBbtL2ioRHlCW6lwR95XRl
	LcuSNg6BpSdhqNEaY+cs74NIODr8Ehlzx6gs+6FXsLPu/Hg9KsOOitP/Rg86KVL+lbeUGP5VQ3g
	LG3Jp64RhjEcW83hrpGfU6mD0cX+Vofms1Gd6KhC8ORk6Wpkz4VHzNyEtyw==
X-Received: by 2002:a05:600c:1c03:b0:42c:af2a:dcf4 with SMTP id 5b1f17b1804b1-4319ad141admr155838625e9.27.1730410877696;
        Thu, 31 Oct 2024 14:41:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgYJ10fn9ESbtPdeY06XEy8OXmxVaFJq+0h5FOBwp7ViWvcQ1J3QhNm3ZTRU5cp7NnKCHnKQ==
X-Received: by 2002:a05:600c:1c03:b0:42c:af2a:dcf4 with SMTP id 5b1f17b1804b1-4319ad141admr155838355e9.27.1730410877318;
        Thu, 31 Oct 2024 14:41:17 -0700 (PDT)
Received: from ?IPV6:2003:cb:c70a:ed00:7ddf:1ea9:4f7a:91fe? (p200300cbc70aed007ddf1ea94f7a91fe.dip0.t-ipconnect.de. [2003:cb:c70a:ed00:7ddf:1ea9:4f7a:91fe])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd9a99d3sm69456625e9.38.2024.10.31.14.41.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Oct 2024 14:41:16 -0700 (PDT)
Message-ID: <148489cc-50cd-42a5-b813-969c6c61ff1e@redhat.com>
Date: Thu, 31 Oct 2024 22:41:15 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] Documentation: s390-diag.rst: make diag500 a
 generic KVM hypercall
To: Eric Farman <farman@linux.ibm.com>, linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, linux-s390@vger.kernel.org,
 virtualization@lists.linux.dev, linux-doc@vger.kernel.org,
 kvm@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Janosch Frank <frankja@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?=
 <eperezma@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 Jonathan Corbet <corbet@lwn.net>
References: <20241025141453.1210600-1-david@redhat.com>
 <20241025141453.1210600-2-david@redhat.com>
 <7aa84534df1a6637bebd60e628500f6dbad47c05.camel@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <7aa84534df1a6637bebd60e628500f6dbad47c05.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31.10.24 15:56, Eric Farman wrote:
> On Fri, 2024-10-25 at 16:14 +0200, David Hildenbrand wrote:
>> Let's make it a generic KVM hypercall, allowing other subfunctions to
>> be more independent of virtio.
>>
>> While at it, document that unsupported/unimplemented subfunctions result
>> in a SPECIFICATION exception.
>>
>> This is a preparation for documenting a new hypercall.
> 
> s/hypercall/subfunction/ ?

Indeed, thanks! I assume this can be fixed up when applying, unless I 
have to resend for other reasons.

> 
>>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>   Documentation/virt/kvm/s390/s390-diag.rst | 18 +++++++++++-------
>>   1 file changed, 11 insertions(+), 7 deletions(-)
> 
> Reviewed-by: Eric Farman <farman@linux.ibm.com>
> 

Thanks!

-- 
Cheers,

David / dhildenb


