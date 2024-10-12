Return-Path: <linux-doc+bounces-27316-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F334199B32F
	for <lists+linux-doc@lfdr.de>; Sat, 12 Oct 2024 12:57:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 208DB1C2245A
	for <lists+linux-doc@lfdr.de>; Sat, 12 Oct 2024 10:57:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1204155315;
	Sat, 12 Oct 2024 10:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="CSeLt16K"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C1D1547ED
	for <linux-doc@vger.kernel.org>; Sat, 12 Oct 2024 10:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728730650; cv=none; b=SH5YlQsIsUD79lUGzMByo21EbHIQcjtkU/KfG+Zb0kyhU6AwGVGDFFIxAviJpaknf05e9LQDj9nmY7SQWZj0c+QQtNIrg/A3iyiWc+5LmQCV85p/XPQezC4Pd+IMLrkmyMQRyn3WmvKjFzoGAHm8/zYKfv0zBn1w9EsUnhyTqWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728730650; c=relaxed/simple;
	bh=yzj48cWj4L8LiQC5ox1BGXI/Tjjq1Nx6uec3CrMVcKI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Hj7dZyyWaL/ho9e0okIksgxIJEhl5iYN9INw455aAFZu1CMeB5fvjKUK6xsKEXCrX6KUq13+f8nn4meIYb481HiCzXQ0f1gYQjMJG5t6qJVuyXHqLMsECBZ5wCPFtVzDl1XeRGzFwHoBeaSdHwjO7uyBTzMldMeATfeVioJ6Q/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=none smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=CSeLt16K; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=daynix.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-71e02249621so2294473b3a.1
        for <linux-doc@vger.kernel.org>; Sat, 12 Oct 2024 03:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1728730648; x=1729335448; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RQHS9P9S9IhAfq2pHjdIrMEoP4ui2SXVS05dgp3eWDo=;
        b=CSeLt16KDtXf38VTmxWsiaFLnugXTgimirMnF9N8sJe5GkzloTe+Cf2vHLD/+aTL3/
         jsYZjwPHHeORE8nXdtkqDJmjwzhBQ8Vo2ESaQGb4lg/z6XYjXSqrk9a9r8xdJnPEKeHu
         oAs2XGtt3uDAd9xGGQIvAlhmIEl51dgY4MCz6uTwGtyejn7w1eehw2/2Zc6hHT9YUK0y
         zQL0NkzuObzhHwzwzsfCiahehxbzWJ8nHn1zWa1BhRnChTSau1gK81t2YlxnEE+/Mwx8
         txJMD0M59MeuoRP5soEe/L+6zeOpBGCa47wkL0A/pWzorP2KXjci/My5fYT9f8dAAxLv
         3roA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728730648; x=1729335448;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RQHS9P9S9IhAfq2pHjdIrMEoP4ui2SXVS05dgp3eWDo=;
        b=oAfspVZGanhwl0/qUK8IJqMDHaDi/7LDj12SJsj5EQdwjuU2cNa/qybMYJuKk83s3C
         xeYnJR1S5lM0aqqsLDJtJ8ik29cZedzZenQz0ZbJrj/zTMHcYKM1UIoUey3+99xjQaS5
         w2o0K5HtX9xT0UGbyKEWV+jtzvmJ2KF+KBp50s+jFySTcdgdSKJigxgt0ueDdYDY1Fh5
         hvt4L5W3MmJ8d+oDIzbdMUlKwWClI+ZbkK0SczBUGOd6x1pRofO1VGmKaJWnmY9z9P+n
         gaqQ3M+q/YUmABRI2SUkoRfq+yOZy5cI4NucZryyp8+TiGaK7eWWVnFwVLRIRg+nWaVp
         9Yqg==
X-Forwarded-Encrypted: i=1; AJvYcCXJxrGL5SH9d4bMJ/NBYnQlznPZ3aKAG4nkdvFdpqXXCctAEKl40CwclPza+3XfgW9FYw0uqbC9yfE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5NEbYOVps0vwUZ02RM/HwIShDZEyu+pf/X4yX8dBaYfEnRob6
	0heUm9pkp7KAFxucu+wdbzGARVlgqAE63pRYuECuefmBllSewqfsWthHJIZLyfQ=
X-Google-Smtp-Source: AGHT+IFekv1Jof5V0rzE74khJL3aujdAI4lCz36fIxAEe87tyEoPh3HrVVeYVj30VhB4bKJv7WvZZQ==
X-Received: by 2002:a05:6a20:e617:b0:1d8:aade:dae8 with SMTP id adf61e73a8af0-1d8c96c477bmr3811262637.49.1728730648461;
        Sat, 12 Oct 2024 03:57:28 -0700 (PDT)
Received: from [157.82.207.107] ([157.82.207.107])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7ea6ed5f6d0sm676332a12.53.2024.10.12.03.57.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Oct 2024 03:57:28 -0700 (PDT)
Message-ID: <f4501f54-875a-4c46-9e77-802bd81f4230@daynix.com>
Date: Sat, 12 Oct 2024 19:57:22 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v5 04/10] tun: Unify vnet implementation
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, Jason Wang <jasowang@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Xuan Zhuo
 <xuanzhuo@linux.alibaba.com>, Shuah Khan <shuah@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, kvm@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-kselftest@vger.kernel.org,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Andrew Melnychenko <andrew@daynix.com>,
 Stephen Hemminger <stephen@networkplumber.org>, gur.stavi@huawei.com
References: <20241008-rss-v5-0-f3cf68df005d@daynix.com>
 <20241008-rss-v5-4-f3cf68df005d@daynix.com>
 <67068b632d2d2_1cca3129484@willemb.c.googlers.com.notmuch>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <67068b632d2d2_1cca3129484@willemb.c.googlers.com.notmuch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2024/10/09 22:55, Willem de Bruijn wrote:
> Akihiko Odaki wrote:
>> Both tun and tap exposes the same set of virtio-net-related features.
>> Unify their implementations to ease future changes.
>>
>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>> ---
>>   MAINTAINERS            |   1 +
>>   drivers/net/tap.c      | 172 ++++++----------------------------------
>>   drivers/net/tun.c      | 208 ++++++++-----------------------------------------
>>   drivers/net/tun_vnet.h | 181 ++++++++++++++++++++++++++++++++++++++++++
> 
> Same point: should not be in a header.
> 
> Also: I've looked into deduplicating code between the various tun, tap
> and packet socket code as well.
> 
> In general it's a good idea. The main counter arguments is that such a
> break in continuity also breaks backporting fixes to stable. So the
> benefit must outweight that cost.
> 
> In this case, the benefits in terms of LoC are rather modest. Not sure
> it's worth it.
> 
> Even more importantly: are the two code paths that you deduplicate
> exactly identical? Often in the past the two subtly diverged over
> time, e.g., due to new features added only to one of the two.

I find extracting the virtio_net-related code into functions is 
beneficial. For example, tun_get_user() is a big function and extracting 
the virtio_net-related code into tun_vnet_hdr_get() will ease 
understanding tun_get_user() when you are not interested in virtio_net. 
If virtio_net is your interest, you can look at this group of functions 
to figure out how they interact with each other.

Currently, the extracted code is almost identical for tun and tap so 
they can share it. We can copy the code back (but keep functions as 
semantic units) if they diverge in the future.

> 
> If so, call out any behavioral changes to either as a result of
> deduplicating explicitly.

This adds an error message for GSO failure, which was missing for tap. I 
will note that in the next version.

