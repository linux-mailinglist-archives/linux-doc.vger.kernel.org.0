Return-Path: <linux-doc+bounces-34763-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EA820A08CCA
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jan 2025 10:49:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E7181688CC
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jan 2025 09:49:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29E7E20B7F9;
	Fri, 10 Jan 2025 09:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="KhKUUmvS"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE2920ADD9
	for <linux-doc@vger.kernel.org>; Fri, 10 Jan 2025 09:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736502485; cv=none; b=uI/2HM4fYzmfHoxFdczGnGPVOS1gdCZc5TInBZNekHICNiYEd/FviTYADL+ZmxG/b4F15E3FDK948i0N5pWm10pCl3OuH2AFor45NlY/1uaqo8794Bdk6IhQE+ikHHOOLDF3UQkDXbKPGLAmXV4XZBC/6q8Jwcifl7FtCOcDC/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736502485; c=relaxed/simple;
	bh=kVRbfJjqPGz8mIX7HYr5rAjUJTIc7wg/ASHsghAXszw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=oeDAJ/ttiqOMm4x/atR907Y8xzcMzFr6x1waOqmqhEIk1r/nCcasZPM8dKnUTy4wC5dkQGIXc9c93cJ88hYStCNhOPrOHBQySwwqv4fimE/SeSLRepzNEnDyHGltkyG311wcNgXzyZObI7NIzaT8SDpxk8P93brQD2f8ttsdLik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=pass smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=KhKUUmvS; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=daynix.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2162c0f6a39so51845325ad.0
        for <linux-doc@vger.kernel.org>; Fri, 10 Jan 2025 01:48:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1736502483; x=1737107283; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=32Vr4Gt1G1myfrpAERq6AqxVOpF64+scMP61EbgQiWY=;
        b=KhKUUmvSNnIsRuykpmg5oIG3LsDRZYWxhZlb8W5Y/NscKj6mBRqDvVezPr0kZs2hEk
         SfgNrsDdakX8JelJlPc2k1axQb33aiz2I5rqfH9DwjbeJIsY0Y0KdOKuIdwLv7bFyXDI
         xA2Jier5VQgpTBaIeWTrGjgFTJGqCASVNCmseO9gehJzAa7rA+93QUUbNwSTfSa66KTY
         DwtpqFCBlrO/MBDlZ8TfKY7jYIXUy57fD1WpjPOjRsjT55QZxazx0chlxzTKLVy+Lh1W
         Jt9Or55j4pbduwenjytpVbKZsHApqCH/5GLCeZEjL9KGtZ4vCpps1r0RVkHX+P12sh0N
         DIiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736502483; x=1737107283;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=32Vr4Gt1G1myfrpAERq6AqxVOpF64+scMP61EbgQiWY=;
        b=HQXdyd4S5Lnin1ZC+unwAyIE7qwGTO+iPvgZc296UDfw2vEuqvsaenJz12SXog4ZEI
         nnuYiE+s/QSr2hjFjaCFB8eY0vGo2n2vyT4BY5NF/+cWZNYXPMJajKXkzayXwHqfXPTD
         UjSU7GZ7K2AkHEi+wMw6H6Eg9+PS5CdejmjPmGx1ViaBVYcelLV3Mi9TDL4ZMGzUfO7e
         m2Kpw/V9AZORAoHeP2fBEEQJXrbsiBZfyZOyCeQDvjzMqKEK6XFkKV8SF6WoDhAQYA98
         l3i1w//NQMN7N+VnyJiMebEHFUAqnLjBz9H0/VDAvLBiFe6XpPwYLdSLWB07yeXpr81W
         CNnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqBLcJEZQOKNDXuaCggykN1YPeUT44PbYHDLkCEykkItZzlXTjM4HprlydvlchMAk4tV66vy7OMk8=@vger.kernel.org
X-Gm-Message-State: AOJu0YztPAv80qifI7junw80fw0vMsGa+jALVjdQgMTDx5JjmnUFgtGU
	fSh0am3pN8xAXOvO9OOYMIhVhmBoNAOsqZmJdquRd2LzyDwjoqpMc2zG9qKsR38=
X-Gm-Gg: ASbGncsTDkkDlPs6GqOVvogDH7iLGUh7vO/vTYqTj71ZA40UcyRBwqbzv57d6ObxCI+
	SPwa3lJiz7oPxeF7i7aKNXAZvdtDFxIEZulKGJzZQSkTSrUzqkqcYtZWCZ/vuH0okq1KGbAZIL7
	AW0hJWAnXA0dbs5fkl9gfC3xLChjqinRO+QVZKRZrUVPhERy+T/nz8M6LEZHVeGOdk4WCRQN6Il
	rDUYAeYFHDYqVNZQEjM5JcvWxUMyhgPgBD/gyWdPsv9CFBS//dMmSGhvMfDCYQQA1w=
X-Google-Smtp-Source: AGHT+IG4bZICCGUJL8IFrqqswdhSk8TqvGQUJNKkxBrtJDASy/wZzUeIl0i4xzyDL1lhN+MfLWTweA==
X-Received: by 2002:a17:90a:d448:b0:2ee:c30f:33c9 with SMTP id 98e67ed59e1d1-2f55838d0eamr8537569a91.14.1736502482736;
        Fri, 10 Jan 2025 01:48:02 -0800 (PST)
Received: from [157.82.203.37] ([157.82.203.37])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f12f94asm10822555ad.72.2025.01.10.01.47.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2025 01:48:02 -0800 (PST)
Message-ID: <b645e3e3-b42a-4d7a-b5f1-8f8fd9eff0ee@daynix.com>
Date: Fri, 10 Jan 2025 18:47:56 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/6] selftest: tun: Add tests for virtio-net hashing
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
References: <20250109-rss-v6-0-b1c90ad708f6@daynix.com>
 <20250109-rss-v6-5-b1c90ad708f6@daynix.com>
 <677fdee2b56d_362bc129446@willemb.c.googlers.com.notmuch>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <677fdee2b56d_362bc129446@willemb.c.googlers.com.notmuch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025/01/09 23:36, Willem de Bruijn wrote:
> Akihiko Odaki wrote:
>> The added tests confirm tun can perform RSS and hash reporting, and
>> reject invalid configurations for them.
>>
>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>> ---
>>   tools/testing/selftests/net/Makefile |   2 +-
>>   tools/testing/selftests/net/tun.c    | 558 ++++++++++++++++++++++++++++++++++-
>>   2 files changed, 551 insertions(+), 9 deletions(-)
>>
>> diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
>> index cb2fc601de66..92762ce3ebd4 100644
>> --- a/tools/testing/selftests/net/Makefile
>> +++ b/tools/testing/selftests/net/Makefile
>> @@ -121,6 +121,6 @@ $(OUTPUT)/reuseport_bpf_numa: LDLIBS += -lnuma
>>   $(OUTPUT)/tcp_mmap: LDLIBS += -lpthread -lcrypto
>>   $(OUTPUT)/tcp_inq: LDLIBS += -lpthread
>>   $(OUTPUT)/bind_bhash: LDLIBS += -lpthread
>> -$(OUTPUT)/io_uring_zerocopy_tx: CFLAGS += -I../../../include/
>> +$(OUTPUT)/io_uring_zerocopy_tx $(OUTPUT)/tun: CFLAGS += -I../../../include/
>>   
>>   include bpf.mk
>> diff --git a/tools/testing/selftests/net/tun.c b/tools/testing/selftests/net/tun.c
>> index 463dd98f2b80..9424d897e341 100644
>> --- a/tools/testing/selftests/net/tun.c
>> +++ b/tools/testing/selftests/net/tun.c
>> @@ -2,21 +2,37 @@
>>   
>>   #define _GNU_SOURCE
>>   
>> +#include <endian.h>
>>   #include <errno.h>
>>   #include <fcntl.h>
>> +#include <stddef.h>
>>   #include <stdio.h>
>>   #include <stdlib.h>
>>   #include <string.h>
>>   #include <unistd.h>
>> -#include <linux/if.h>
>> +#include <net/if.h>
>> +#include <netinet/ip.h>
>> +#include <sys/ioctl.h>
>> +#include <sys/socket.h>
>> +#include <linux/compiler.h>
>> +#include <linux/icmp.h>
>> +#include <linux/if_arp.h>
>>   #include <linux/if_tun.h>
>> +#include <linux/ipv6.h>
>>   #include <linux/netlink.h>
>>   #include <linux/rtnetlink.h>
>> -#include <sys/ioctl.h>
>> -#include <sys/socket.h>
>> +#include <linux/sockios.h>
>> +#include <linux/tcp.h>
>> +#include <linux/udp.h>
>> +#include <linux/virtio_net.h>
> 
> Are all these include changes strictly needed? Iff so, might as well
> fix ordering to be alphabetical (lexicographic).
>    

Yes. I placed header files in linux/ after the other header files 
because include/uapi/linux/libc-compat.h requires libc header files to 
be placed before linux/ ones.

