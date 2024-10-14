Return-Path: <linux-doc+bounces-27439-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 33EBA99D728
	for <lists+linux-doc@lfdr.de>; Mon, 14 Oct 2024 21:17:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9A3A2B225E1
	for <lists+linux-doc@lfdr.de>; Mon, 14 Oct 2024 19:16:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43C641CB33E;
	Mon, 14 Oct 2024 19:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="atCsLEbG"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5831C3051
	for <linux-doc@vger.kernel.org>; Mon, 14 Oct 2024 19:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728933413; cv=none; b=rW64gMcwtkZ7OR0Ex23QI6TynzSxioZoOrLOReKLBI6jk/9gwXtyPmxwnbLz+QrYlZQZupbM9GdMduEVgdGWtDVJiykLWy9Yhxzx/9leuIVorvB1IduyW15XF5HBXaJO7Us846O3thQnS1w42TsmSQJ37psAaiVEz+m3Uvw2m4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728933413; c=relaxed/simple;
	bh=4dLSC1AqyzV3uC10Q3HwD5XOgaZY1SpinKQv+dE8wno=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GFSzmt0+vk+U4ftTcpEyOBPtSbHGuy3rI00CHj/9NyKr9ITH7va9a+Tj9y+hS/CVJz6ycnfC+CvzYvbI0Mw3co+yaC6CRno5ecw8JqEKbrIWNTEGlqx+s6R1HmVBcOfJ4uqI/KKG+4sWTa7wgtCKbwZxewQFiJPcxWJCOgnKpPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=atCsLEbG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728933410;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=sQIx8Zvd1bi6csR0yDCe7VkAynOD+MUuQmAi1iHX0fA=;
	b=atCsLEbG5K0KPyrsuMhHD0kB5z9oDNmvIxp+L4SrCKlYFQ8/NCviR0nWcU7lIsSt4PHCDV
	G7Gz71QXNNs0vh7SvemvFFDpTte+CCd+Q6MLLOAI8TbyyRVCeE1QF/fbVETC8S7l/bhi7F
	/QW8ErMxO0eYiqNoCvghlFtBAss/PmA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-623-cbBGvXZWMO6ECwunuDTbRg-1; Mon, 14 Oct 2024 15:16:49 -0400
X-MC-Unique: cbBGvXZWMO6ECwunuDTbRg-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-37d52ccc50eso1790629f8f.3
        for <linux-doc@vger.kernel.org>; Mon, 14 Oct 2024 12:16:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728933408; x=1729538208;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sQIx8Zvd1bi6csR0yDCe7VkAynOD+MUuQmAi1iHX0fA=;
        b=RprmEBcY0Ex5zmHUCAqS+Vk7qetMw2mOzVerk/5Js5FNODKRTrSJ6dw974wZ+xALmJ
         yDJLs/UZWaxyjKszHS51AkctSfzHAsaYA+CRxpyZ8djTWvhkCalMEY5opMwTR3rwbwMO
         8djaoCUM4GGlDMXIF+RR8uyM7u7spY/zxGRuyWyzaLPGW59AGIfdlkTSfFA1nvphmkPd
         aI1F/1/0gLeNnc3zdx2Vav3HMOdUfoMgWRlFNc2A9s0MqqCM4Z0/mwcJcUqlVLGzVXYo
         BShg175s1VoKczwoW+fiF9mJo7QorWWkuxp+D5jFlbq/eX5gdf54Gcm46q+L3FsTFXOO
         yZVA==
X-Forwarded-Encrypted: i=1; AJvYcCVmQGYqyksldfEhO7SYhGTzDqs005f73/GGLA5JwmXHb0TMC9sUucElaxp5rGi2yMBhPhXNtCE7oJw=@vger.kernel.org
X-Gm-Message-State: AOJu0YykbQ3uwrvF897k/C5jlaMVQ+PaT/h6ck+INwlzYOwjnf0HLGrh
	fa0LkO+adVojsuWnRu+w4KZF87+CYsEEYBSyZOHD7ubrjyOEzLrjeIw8DjuKfgxwZW5xkRtMvhb
	C/k1rx9c3b33xf9C7kO8iLaczu5+dXtMXQqXVnvTeUXV4Wv3PsswpijfdLw==
X-Received: by 2002:a5d:4348:0:b0:371:8319:4dbd with SMTP id ffacd0b85a97d-37d551e3d0cmr8006246f8f.17.1728933408028;
        Mon, 14 Oct 2024 12:16:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6sBThr6RdJ9UzUqBJZ/Z2oXOcyxnQX4PJcKNdIkMaURe8S9HvwixtiT1L8Zrvsmei+/RVow==
X-Received: by 2002:a5d:4348:0:b0:371:8319:4dbd with SMTP id ffacd0b85a97d-37d551e3d0cmr8006241f8f.17.1728933407562;
        Mon, 14 Oct 2024 12:16:47 -0700 (PDT)
Received: from ?IPV6:2003:cb:c71e:600:9fbb:f0bf:d958:5c70? (p200300cbc71e06009fbbf0bfd9585c70.dip0.t-ipconnect.de. [2003:cb:c71e:600:9fbb:f0bf:d958:5c70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b6cffa5sm12197664f8f.53.2024.10.14.12.16.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Oct 2024 12:16:47 -0700 (PDT)
Message-ID: <ebce486f-71a0-4196-b52a-a61d0403e384@redhat.com>
Date: Mon, 14 Oct 2024 21:16:45 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] virtio-mem: s390 support
To: Heiko Carstens <hca@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-s390@vger.kernel.org, virtualization@lists.linux.dev,
 linux-doc@vger.kernel.org, kvm@vger.kernel.org,
 Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Janosch Frank <frankja@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?=
 <eperezma@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 Jonathan Corbet <corbet@lwn.net>, Mario Casquero <mcasquer@redhat.com>
References: <20241014144622.876731-1-david@redhat.com>
 <20241014144622.876731-6-david@redhat.com>
 <20241014184824.10447-F-hca@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20241014184824.10447-F-hca@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14.10.24 20:48, Heiko Carstens wrote:
> On Mon, Oct 14, 2024 at 04:46:17PM +0200, David Hildenbrand wrote:
>> The special s390 kdump mode, whereby the 2nd kernel creates the ELF
>> core header, won't currently dump virtio-mem memory. The virtio-mem
>> driver has a special kdump mode, from where we can detect memory ranges
>> to dump. Based on this, support for dumping virtio-mem memory can be
>> added in the future fairly easily.
> 

Thanks for the review.

> Hm.. who will add this support? This looks like a showstopper to me.

The cover letter is clearer on that: "One remaining work item is kdump 
support for virtio-mem memory. This will be sent out separately once 
initial support landed."

I had a prototype, but need to spend some time to clean it up -- or find 
someone to hand it over to clean it up.

I have to chose wisely what I work on nowadays, and cannot spend that 
time if the basic support won't get ACKed.

> Who is supposed to debug crash dumps where memory parts are missing?

For many production use cases it certainly needs to exist.

But note that virtio-mem can be used with ZONE_MOVABLE, in which case 
mostly only user data (e.g., pagecache,anon) ends up on hotplugged 
memory, that would get excluded from makedumpfile in the default configs 
either way.

It's not uncommon to let kdump support be added later (e.g., AMD SNP 
variants).

-- 
Cheers,

David / dhildenb


