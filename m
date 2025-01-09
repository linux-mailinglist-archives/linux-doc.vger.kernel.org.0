Return-Path: <linux-doc+bounces-34531-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5725A0719C
	for <lists+linux-doc@lfdr.de>; Thu,  9 Jan 2025 10:37:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D9268165E85
	for <lists+linux-doc@lfdr.de>; Thu,  9 Jan 2025 09:37:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07E262153CE;
	Thu,  9 Jan 2025 09:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="URXqYp9L"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A0F2153CB
	for <linux-doc@vger.kernel.org>; Thu,  9 Jan 2025 09:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736415423; cv=none; b=hI3AIWrT+CyxAKcQdsqkwq+UhrBS52dlKxJuqFW7OsqWT0vott8gwQGDd1DjJdsSFh2sNuDxil6nUHoLsr3ImlC8Z8uOdsvsZ5qHqtDk11AD4qO6KF6thRokeIB5c9nHs5C4X5b0lsTd5W5Psc4lEFF9JrDnsr09XQt4/MQgI9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736415423; c=relaxed/simple;
	bh=/Y7vshFyp+S1ZNQo5QoPrTX6A5Pvuo7WfnstfrwZxZI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XzyaBvIceK3YsHKvyCC68b/QmB6KKZeYkiR7mY5NtDViMRj+DRU6EtG3yFE4WNUCsAibz9cAa6EBnaCfvz6wz57Jt6rJsFeiBvYHKIkjBwapyqflCEkHPchuTgQsRp38HplfR/5Z1YMI3oqHlfaHCXA7U6LAxp/AnI4vbY0dugY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=pass smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=URXqYp9L; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=daynix.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-21644aca3a0so13233755ad.3
        for <linux-doc@vger.kernel.org>; Thu, 09 Jan 2025 01:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1736415420; x=1737020220; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XcSbx1LF493qhjKry/nZNlaGERbQhtYPTAQgAOWQyVg=;
        b=URXqYp9LJnEWi/WJgrOpmKW2PJ+7wHscm3opYsrG+hIK3Ikuz0ZbAd21gFLG4thsj9
         o5wtEmuuL9YxRLA/6cyacKVEPSg3jiqpDp8WeMPDK9bszK0d1BQ9pcjT8LmyPYcpZzJg
         BBrbCwRok37Bkb06Nq7gfIsWQit+B51/tmLpf3rB7yWN+8dzQ10TCmx6pvOkYEVcGqsX
         JeZ/C/AjuZCKWUWOhRzwDEhM3zUC9muX/8gaLZupF2uOD/lBSY/ExbTPmwxDkLFJR05p
         zlNEwHW1oVirqcj6rimIA7SH/hq5YXmFyZDErfKMDxNhuFGcY5y3JNJLJ1Ffkwek/bSe
         25Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736415420; x=1737020220;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XcSbx1LF493qhjKry/nZNlaGERbQhtYPTAQgAOWQyVg=;
        b=M1xjhxMlSQi+Vtz0wnbSylxHGMLcq2dkKPfEGTmf/31He131iAKUDp8wYdGyZzFBue
         1Fjltn9lj2sKIM4rmeTRcH2nmx5zeqf31MMxTDrsATFkQWV7tMX0icfPA0dTo6IEocQt
         tKLu9Pf8TaD4slBlfPFpUC3sRoQdwNz8ltA5AD0iuiE4LBznqlBEdhLST/RrDZ6IUt5F
         gVyGrqTSxKAd9ygTvHYMQQC0Eg2kX7jjrDDg35cR1uuvBURKlNMP+vumoR5rgxLZ7Ll9
         t2DteFydmN0Obi5//QaBpdzm5ce9mbApY0cAV3iod7VLBj1X2c8JGg1X6ui8jxFvasEM
         a2iw==
X-Forwarded-Encrypted: i=1; AJvYcCV2AIKeL2/KO+16HYe5G5kIW0mJiIh0bjH7XD7O+zEXunI10ynx54mLHtM9kq8mKSKHlIkGi93dbtg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkUYL0f2Dbc0s7+Hm49o97qrdhYmIlu4SXmjXRKhCBIuPS/oQv
	VqECGYh5a7KzYpGqyVQwmRHzckGmu0qRN1O6OohuLid1nWLE7kr2P3VLGyeUa64=
X-Gm-Gg: ASbGncsSuTCMNocowmi++8z2XJATxwOdbccLvg56Nx/Lx6hFNaq3d879N4TWL/Xjgfs
	aa4f9UjKycCeVnSLkvCjFvWaC5MN0t/eDry0+VvpYXxd07W8tnbvpLpnRp3370Ew8obLLvQG7fg
	zHBTf1Er1ctuSV/Nhfk1R58mFU7ktIQSGH4shlW0GtBeAUlwyQkSn6JwjWq2bJQOv0QW+jvOhE7
	B3J7g1f5dr7j/X9t6t6DHx+8sqMr/MxGAxfkMjN3lbRbbig7gteh4eY2rRCcuZwuR4=
X-Google-Smtp-Source: AGHT+IGojiWk/1gT/7D4/Bn9x5ciCyKBW6DXVbq8kH6J+vNptBrJUgGdPyWUs9OwXpei8EJsrIl0sg==
X-Received: by 2002:a05:6a20:8411:b0:1e1:a434:2964 with SMTP id adf61e73a8af0-1e88cf63b7bmr10109548637.2.1736415420397;
        Thu, 09 Jan 2025 01:37:00 -0800 (PST)
Received: from [157.82.203.37] ([157.82.203.37])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8dbab4sm36620666b3a.94.2025.01.09.01.36.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2025 01:36:59 -0800 (PST)
Message-ID: <6f33c048-81ad-4d15-872d-187e965e6d79@daynix.com>
Date: Thu, 9 Jan 2025 18:36:52 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] tun: Pad virtio header with zero
To: "Michael S. Tsirkin" <mst@redhat.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 netdev@vger.kernel.org
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
 <571a2d61-5fbe-4e49-b4d1-6bf0c7604a57@daynix.com>
 <20250109024247-mutt-send-email-mst@kernel.org>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20250109024247-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025/01/09 16:43, Michael S. Tsirkin wrote:
> On Thu, Jan 09, 2025 at 04:41:50PM +0900, Akihiko Odaki wrote:
>> On 2025/01/09 16:31, Michael S. Tsirkin wrote:
>>> On Thu, Jan 09, 2025 at 03:58:44PM +0900, Akihiko Odaki wrote:
>>>> tun used to simply advance iov_iter when it needs to pad virtio header,
>>>> which leaves the garbage in the buffer as is. This is especially
>>>> problematic when tun starts to allow enabling the hash reporting
>>>> feature; even if the feature is enabled, the packet may lack a hash
>>>> value and may contain a hole in the virtio header because the packet
>>>> arrived before the feature gets enabled or does not contain the
>>>> header fields to be hashed. If the hole is not filled with zero, it is
>>>> impossible to tell if the packet lacks a hash value.
>>>>
>>>> In theory, a user of tun can fill the buffer with zero before calling
>>>> read() to avoid such a problem, but leaving the garbage in the buffer is
>>>> awkward anyway so fill the buffer in tun.
>>>>
>>>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>>>
>>> But if the user did it, you have just overwritten his value,
>>> did you not?
>>
>> Yes. but that means the user expects some part of buffer is not filled after
>> read() or recvmsg(). I'm a bit worried that not filling the buffer may break
>> assumptions others (especially the filesystem and socket infrastructures in
>> the kernel) may have.
>>
>> If we are really confident that it will not cause problems, this behavior
>> can be opt-in based on a flag or we can just write some documentation
>> warning userspace programmers to initialize the buffer.
> 
> It's been like this for years, I'd say we wait until we know there's a problem?

Perhaps we can just leave it as is. Let me ask filesystem and networking 
people:

Is it OK to leave some part of buffer uninitialized with read_iter() or 
recvmsg()?

> 
>>>
>>>> ---
>>>>    drivers/net/tun_vnet.c | 3 ++-
>>>>    1 file changed, 2 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/net/tun_vnet.c b/drivers/net/tun_vnet.c
>>>> index fe842df9e9ef..ffb2186facd3 100644
>>>> --- a/drivers/net/tun_vnet.c
>>>> +++ b/drivers/net/tun_vnet.c
>>>> @@ -138,7 +138,8 @@ int tun_vnet_hdr_put(int sz, struct iov_iter *iter,
>>>>    	if (copy_to_iter(hdr, sizeof(*hdr), iter) != sizeof(*hdr))
>>>>    		return -EFAULT;
>>>> -	iov_iter_advance(iter, sz - sizeof(*hdr));
>>>> +	if (iov_iter_zero(sz - sizeof(*hdr), iter) != sz - sizeof(*hdr))
>>>> +		return -EFAULT;
>>>>    	return 0;
>>>>    }
>>>>
>>>> -- 
>>>> 2.47.1
>>>
> 


