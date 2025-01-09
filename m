Return-Path: <linux-doc+bounces-34523-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE94A06F33
	for <lists+linux-doc@lfdr.de>; Thu,  9 Jan 2025 08:42:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 43ACB1619CE
	for <lists+linux-doc@lfdr.de>; Thu,  9 Jan 2025 07:42:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A95BF21480C;
	Thu,  9 Jan 2025 07:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="yI5QcCUO"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14EAD1714D7
	for <linux-doc@vger.kernel.org>; Thu,  9 Jan 2025 07:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736408518; cv=none; b=SiWnsft3SNgUCgfBjuDnu0tMDfAZ8LQlCGhnfI/jDVAohIEibMtxRritnOaMBAhmmJaN08PAUbUU8InwYMk25SPnmkMcw86oSOR9qUyX0Ms2yLwfngdVFcN1311pb03KY48BDTIxpdWYBXSZY0kwuppZ3Xgg+D1hlCHoRjQA74M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736408518; c=relaxed/simple;
	bh=Pl+1xEqrW1IF0EiFRc252FTvX3vzsbZHF/HiOa6V3hI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y3TEzPzbyHK/iUVT2FrwJn+bgRUR/hVPjqmsBAobknorx660PSd5zLN1oGB7i1OPOIH4M9E/fQbTKpYUwc8VN/jIYqGRMNyFRvoKkBVUiEwo8GWsHolU2PyjtIsVhUm2jWkS/e5PwvZXC1inpL/8bSMfi9Wo7JV9wAmislTmNoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=pass smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=yI5QcCUO; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=daynix.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-216395e151bso7338485ad.0
        for <linux-doc@vger.kernel.org>; Wed, 08 Jan 2025 23:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1736408516; x=1737013316; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zujq2FV01D6C2KPe0/EF8xmEzpLBI/t0RD3pI7VCDdo=;
        b=yI5QcCUOTfFkCRIKaIrEraVpL5GKdr70Cbw2jy9TqWfvH1hbeqhewj9IZbX+3l5SUf
         KX0TXLjr6qMoQkinOHj9WqGYDJrszYPCBzrhYESbrvuq3t6Kl9E4KY0hqz9/edqLPpD+
         IM1ItO6u96gnCEr+FOh4jbMp2XBjwZiza2auO91abI+WEuniKN6SN6mj28oX/kN3ogNs
         O1/1NKGsMMmVR2K30TpKU/y+FG8GGJj02QmHFDGUcuBzrWp1C7gu84fZCSIQHxuxilUD
         0H3NeKDMwS7SJUJL48M8qUBjdHG/PDRdgydug4BAtwNo60jMOPxm1/4QQ9COGTPuL2IF
         SgwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736408516; x=1737013316;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zujq2FV01D6C2KPe0/EF8xmEzpLBI/t0RD3pI7VCDdo=;
        b=olEBUmVR8onJ+DbdZd0YGORgUjF6N4AJQUdLg9YUGWn5Hn1XWHaRL5cOmazR6aLBSJ
         lxNZDp7gEfR6oxjxsLi4HpMlkoRsw598IcwB3GosB3aCwETQT6xweVPTMUSSZ07g+7H2
         p2gAaDTcIHkAR7+7IlzcBpikVQcD7hwErd4GfCHn5zVTNLTofslP+hCgsP0Fz1gRNagd
         hwjDcLxYQcloAoiITyqmQT263unGISrR/8dO7BcNbJL2D0kYFx0b3i2b8r0o7xVhmmSq
         tsS9qeYPUcb1m5flLeKl04T3ZRjz+7V0Mo4xaPsdiNPdpQQTsIhKrfah41lFOrZjWRmj
         rx9A==
X-Forwarded-Encrypted: i=1; AJvYcCWAhucMkd5al7/L40GOCGbITBj/nTl8fGZiKGweH60ZD5gp3PfwV7jr2HOs/OgOwmKi0y3auHVDMuQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxamTEIdgQZftntNIKBnDymJP4R9bl5JYGvPhl7yAEFDSqldQfU
	OMSQUZ1MmBmUsJVAL9/WBG3wjhnQwxBjiHaaEsfZyDDQcdxAJO3QAitV+HJ4K4Q=
X-Gm-Gg: ASbGncsdI4b+2Wx4byfFM5wPEiw5ecExLPz3lLvW6tsnuh/CmT2OkhPZR7Fuv/BxPhN
	jrXwYnMZTn5a8p0COfnqzmC/I1lRHD0HPd9X3kfGn37CUDCo6T4b2Xhrf1TX5CrsIv2rCRrQAyw
	SmDp5hngFADcW6wTj8n4BYagj2BCzPqHhAEsQ6GIygLLLiE0bPJlvQM7NHGCxrPYBdv1PAE/m1/
	8LZ1ZM/ExQ4A29+917SXJBelxUc5UxMsCVDmOIP9q0dl4LoFp7++tFDA1/3SxQW7/w=
X-Google-Smtp-Source: AGHT+IHoQ1/i8R8+7m2WyjiW1QZh9ruYZdAVL4zxUuyhPIV5VRkeFn1oW3Ykol5jTRSqrVxVwBQ5DQ==
X-Received: by 2002:a17:902:eccf:b0:215:a808:61cf with SMTP id d9443c01a7336-21a8d6ca6bbmr42525445ad.25.1736408516440;
        Wed, 08 Jan 2025 23:41:56 -0800 (PST)
Received: from [157.82.203.37] ([157.82.203.37])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9d44a0sm338516125ad.165.2025.01.08.23.41.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 23:41:56 -0800 (PST)
Message-ID: <571a2d61-5fbe-4e49-b4d1-6bf0c7604a57@daynix.com>
Date: Thu, 9 Jan 2025 16:41:50 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] tun: Pad virtio header with zero
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
References: <20250109-tun-v2-0-388d7d5a287a@daynix.com>
 <20250109-tun-v2-2-388d7d5a287a@daynix.com>
 <20250109023056-mutt-send-email-mst@kernel.org>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20250109023056-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025/01/09 16:31, Michael S. Tsirkin wrote:
> On Thu, Jan 09, 2025 at 03:58:44PM +0900, Akihiko Odaki wrote:
>> tun used to simply advance iov_iter when it needs to pad virtio header,
>> which leaves the garbage in the buffer as is. This is especially
>> problematic when tun starts to allow enabling the hash reporting
>> feature; even if the feature is enabled, the packet may lack a hash
>> value and may contain a hole in the virtio header because the packet
>> arrived before the feature gets enabled or does not contain the
>> header fields to be hashed. If the hole is not filled with zero, it is
>> impossible to tell if the packet lacks a hash value.
>>
>> In theory, a user of tun can fill the buffer with zero before calling
>> read() to avoid such a problem, but leaving the garbage in the buffer is
>> awkward anyway so fill the buffer in tun.
>>
>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> 
> But if the user did it, you have just overwritten his value,
> did you not?

Yes. but that means the user expects some part of buffer is not filled 
after read() or recvmsg(). I'm a bit worried that not filling the buffer 
may break assumptions others (especially the filesystem and socket 
infrastructures in the kernel) may have.

If we are really confident that it will not cause problems, this 
behavior can be opt-in based on a flag or we can just write some 
documentation warning userspace programmers to initialize the buffer.

> 
>> ---
>>   drivers/net/tun_vnet.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/net/tun_vnet.c b/drivers/net/tun_vnet.c
>> index fe842df9e9ef..ffb2186facd3 100644
>> --- a/drivers/net/tun_vnet.c
>> +++ b/drivers/net/tun_vnet.c
>> @@ -138,7 +138,8 @@ int tun_vnet_hdr_put(int sz, struct iov_iter *iter,
>>   	if (copy_to_iter(hdr, sizeof(*hdr), iter) != sizeof(*hdr))
>>   		return -EFAULT;
>>   
>> -	iov_iter_advance(iter, sz - sizeof(*hdr));
>> +	if (iov_iter_zero(sz - sizeof(*hdr), iter) != sz - sizeof(*hdr))
>> +		return -EFAULT;
>>   
>>   	return 0;
>>   }
>>
>> -- 
>> 2.47.1
> 


