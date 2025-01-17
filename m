Return-Path: <linux-doc+bounces-35571-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 491E2A14DAC
	for <lists+linux-doc@lfdr.de>; Fri, 17 Jan 2025 11:35:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC3C03A8CB8
	for <lists+linux-doc@lfdr.de>; Fri, 17 Jan 2025 10:35:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AB261FCF7C;
	Fri, 17 Jan 2025 10:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="P6RxKjc+"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD581F9EA0
	for <linux-doc@vger.kernel.org>; Fri, 17 Jan 2025 10:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737110129; cv=none; b=TiQkmfr639pUlG7vm6vyFiAWdrqWJnnWjo15wgzQ4NgALt0ifg+ChhNTJqj9I7flpYJR/S369C1DPhgMH5tb0igs5OGX4JmITYT3eAKS9dp3G+hqIkWBKhRMmyFUE44iLQr6NIp61cabNSsHprmEEZ/9ogpuut9QMW5/OIzgVRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737110129; c=relaxed/simple;
	bh=70bfaT34dxfacCnCOxEBqaLDOi2/f294fVDQPUnDUSM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=qcKFhOFp0QeA2cxAdQbye31aB0lLeVCxV3E4K73e38FFVf7WYjzRJLxHG7fef9PDKxD6p3Q97sw65PO85F18Aq/RWGmiNzHYQRGMQqtneWywn7RfK8m14Uar4RKwiduumBiYf3ivwdTqSCdSUZDMsnXrW98LHt5MdhP5Ne9YI8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=pass smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=P6RxKjc+; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=daynix.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-21675fd60feso42959475ad.2
        for <linux-doc@vger.kernel.org>; Fri, 17 Jan 2025 02:35:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1737110126; x=1737714926; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1s3j+Lo8FohUApnn9jxJmXSbe+FtIPWK2NNPguyY5ds=;
        b=P6RxKjc+Fvu+48J+Mgoj+P8aOkuqRlMij+k5AS9ELVIjMH2zLxK3uhS13pQt4yC0+0
         SomVAFK9Y8lOX+rGAfJ+8QWuuaqdOiMCj58MXIAMLQkMhlTJqEnVSQm54EYFUyf3JXFO
         iFpdKCmikfvAxOlwTASDIo3/nLsTSERDHlJTrf/qyFfOlZg+1D9C8cN/cZJVQRoeO/HN
         8svSpUy0Sv7EkTGsfCES7GE+q0zLb6hvRw7J9GuoDEwhWFqK18Oo75KTb/B2Dj2lhvLl
         uLAsgFpsmqrYJTAZLa4r0xKU7tcKBO7o3jBCYpu69EoOjnRCmiJqR8o/fFBHtxL73jH8
         bRsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737110126; x=1737714926;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1s3j+Lo8FohUApnn9jxJmXSbe+FtIPWK2NNPguyY5ds=;
        b=T/WvR8Mh73XeXkdZLs2wHLqbe5pqA/WHLM4nDPNmQ5PqDxg4oPMyXcSG6ndQ/znGmM
         or8XYt/vbs2FAdMeW3WV3MOhI1XC0mvgQMs8T6PLc4IQ1WhDnQqdy3iDoDdfT58ujVJm
         EDDqVjGzXHH3DSP2Pq/t5E/jJFnXhUse+DD7ZDzZ42BrGR/GdU51wKBLr/AMtqIPQj9W
         zKuylcWJn+vx3914T2gMA9pwWSLr26L1wNmPhYNwK+eieaO3TTELLcub9mMAXe3wEp2K
         AnY9l+5NiYa83alWTIZstGye49U1XBEcBNJZig3WAoQSh5wa4DXUAKXB9E4a9OdnOvRU
         Nm2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUGkwBrhcuCEXIIdX4THb/Ix8Sw9lC+ATWPnytpSGwQ68WQ86JlhG9iopuB/jA3ER6JlF/gRmfAwz0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs1e5wNgbBh/+q764yHqLeKd7w5hHMZBgNHgTDTBZ1m1+sLwjF
	WvlPdcL3RPuv5X6GUE1U6udiYSPq7xp2HJDUvBvrTYIQt7v+c/07FI4Ppu017IE=
X-Gm-Gg: ASbGncuLmQkNAgB2O5DftAPJUVxmRg0pfLbLG3tkAQmu1X3nj+KQzLMFdIrO9fx2km1
	CL7BABaKWvMclirW920jUFkeb5uWPK2XWJ953+tfaCtJLhA7du8B0ye/1ZRqJeWYYoawF+Op3nU
	AsnbPVTAjcia0HJbH9cRpQXHGYHY2cQXedd+3qArnlxC31GLKeVfkBy73KiRCwGo9VD4YSgRXhu
	8H7xfDtp9O+LLlG2SSsYCDrE1zH5dE6O1WwMXHn4IeZxOX97w9MNs70mRkk9zq/6/0=
X-Google-Smtp-Source: AGHT+IGPzLz6S37k0uPz0pnAPaNjl5ykAtTRRDNMCEBSSX1EJykbz5I62peVJ/pXXng63XBSAbFQiQ==
X-Received: by 2002:a05:6a21:788b:b0:1e1:9bea:659e with SMTP id adf61e73a8af0-1eb215d4c46mr3415218637.35.1737110125973;
        Fri, 17 Jan 2025 02:35:25 -0800 (PST)
Received: from [157.82.203.37] ([157.82.203.37])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dab81754csm1564334b3a.63.2025.01.17.02.35.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jan 2025 02:35:25 -0800 (PST)
Message-ID: <51f0c6ba-21bc-4fef-a906-5d83ab29b7ff@daynix.com>
Date: Fri, 17 Jan 2025 19:35:19 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3 9/9] tap: Use tun's vnet-related code
To: Jason Wang <jasowang@redhat.com>
References: <20250116-tun-v3-0-c6b2871e97f7@daynix.com>
 <20250116-tun-v3-9-c6b2871e97f7@daynix.com>
 <678a21a9388ae_3e503c294f4@willemb.c.googlers.com.notmuch>
Content-Language: en-US
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Shuah Khan <shuah@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, kvm@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-kselftest@vger.kernel.org,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Andrew Melnychenko <andrew@daynix.com>,
 Stephen Hemminger <stephen@networkplumber.org>, gur.stavi@huawei.com,
 devel@daynix.com
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <678a21a9388ae_3e503c294f4@willemb.c.googlers.com.notmuch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025/01/17 18:23, Willem de Bruijn wrote:
> Akihiko Odaki wrote:
>> tun and tap implements the same vnet-related features so reuse the code.
>>
>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>> ---
>>   drivers/net/Kconfig    |   1 +
>>   drivers/net/Makefile   |   6 +-
>>   drivers/net/tap.c      | 152 +++++--------------------------------------------
>>   drivers/net/tun_vnet.c |   5 ++
>>   4 files changed, 24 insertions(+), 140 deletions(-)
>>
>> diff --git a/drivers/net/Kconfig b/drivers/net/Kconfig
>> index 1fd5acdc73c6..c420418473fc 100644
>> --- a/drivers/net/Kconfig
>> +++ b/drivers/net/Kconfig
>> @@ -395,6 +395,7 @@ config TUN
>>   	tristate "Universal TUN/TAP device driver support"
>>   	depends on INET
>>   	select CRC32
>> +	select TAP
>>   	help
>>   	  TUN/TAP provides packet reception and transmission for user space
>>   	  programs.  It can be viewed as a simple Point-to-Point or Ethernet
>> diff --git a/drivers/net/Makefile b/drivers/net/Makefile
>> index bb8eb3053772..2275309a97ee 100644
>> --- a/drivers/net/Makefile
>> +++ b/drivers/net/Makefile
>> @@ -29,9 +29,9 @@ obj-y += mdio/
>>   obj-y += pcs/
>>   obj-$(CONFIG_RIONET) += rionet.o
>>   obj-$(CONFIG_NET_TEAM) += team/
>> -obj-$(CONFIG_TUN) += tun-drv.o
>> -tun-drv-y := tun.o tun_vnet.o
>> -obj-$(CONFIG_TAP) += tap.o
>> +obj-$(CONFIG_TUN) += tun.o
> 
> Is reversing the previous changes to tun.ko intentional?
> 
> Perhaps the previous approach with a new CONFIG_TUN_VNET is preferable
> over this. In particular over making TUN select TAP, a new dependency.

Jason, you also commented about CONFIG_TUN_VNET for the previous 
version. Do you prefer the old approach, or the new one? (Or if you have 
another idea, please tell me.)

> 
>> +obj-$(CONFIG_TAP) += tap-drv.o
>> +tap-drv-y := tap.o tun_vnet.o
>>   obj-$(CONFIG_VETH) += veth.o
>>   obj-$(CONFIG_VIRTIO_NET) += virtio_net.o
>>   obj-$(CONFIG_VXLAN) += vxlan/


