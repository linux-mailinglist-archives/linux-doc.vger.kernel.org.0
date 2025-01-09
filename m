Return-Path: <linux-doc+bounces-34570-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A064DA07445
	for <lists+linux-doc@lfdr.de>; Thu,  9 Jan 2025 12:11:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD2BE188A64E
	for <lists+linux-doc@lfdr.de>; Thu,  9 Jan 2025 11:11:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BFE42163AF;
	Thu,  9 Jan 2025 11:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="XWRQ2O4p"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C159521638C
	for <linux-doc@vger.kernel.org>; Thu,  9 Jan 2025 11:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736421049; cv=none; b=fPs437bjpOUMrZxygsdfIfnO+cJ9PJ/MZssi7r7j7wv1kkM2WppUFMfESlvYh3R94g4Yl9VtIYd30262Rm3iRPVK9hRhzAu036IbVe0OnnPITLpwcyy1GBnMh3IciSEy6CBbHBivxoNITsc1std43kRgx79WKyCOBq355cBf0b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736421049; c=relaxed/simple;
	bh=OBb7WnRDA/eExZU7D3/aK8uhImmdl6QUV+d3JW/hSbc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZN1gPrkGxKVFoQR/Xg8nOq36phBrMgDAkVTzT10JVH0ObgvZBn+PiwzkPnzDrHbGT3n1CKTkvpnkCWarTu4fTknlyEL3NSL6qR7QILECEraKy0itZqWDKNDqE/HIOvwbE/R1GD9i9GwwhQm+m5+JCiRVYk3LRnAa9aA/YJDmYlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=pass smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=XWRQ2O4p; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=daynix.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-219f8263ae0so11696995ad.0
        for <linux-doc@vger.kernel.org>; Thu, 09 Jan 2025 03:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1736421047; x=1737025847; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZR674zUgyjyCfLgZwJdeM+9L7LlWuveDZzXkvs31rv4=;
        b=XWRQ2O4plA9t6m646yZ4ahESwYI2HrblY6gZmd0BRpcgA3fnFoZVy9klw4V4XKZUUj
         6ogh2gzmEUuxpkIOenVkRjoKN8VZpeNRQjb8BoLaKCX/YneBl98NNEyVzcxuzlcPZE6T
         MsW4ziZzXqpj74b5Jd0+oh6rhPO/bDRfSNZDL3EtAh38Wg1yLOC0IoA46cyibr19GyyT
         UvAVnDfvsdUkAkqHvXd5yUuqvAWA1+8/9C28BFkiS1/siSgjuvjQhtrEs7BTwbUlVfP/
         fVosdTRL/Iky5Ctw+pHUtYiKC29Prq4m38YPQz7mmUI4ug6Sou4U99kX/HDt9neou8EC
         +Kxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736421047; x=1737025847;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZR674zUgyjyCfLgZwJdeM+9L7LlWuveDZzXkvs31rv4=;
        b=sAgCgfonsBq42sPoCqZuxc8rU+tnk5BoRrDWevvP6TYLtKTxqwFzGirEr6DbP2ba3E
         rDrFcflsp0Y26BOKO/SizBFN8pnJiJyBn8JW3LNK6X6SeCx3OPeKadfQd48CrKtRGk5x
         2VnnBbQvc1m/8K2eWGwuwrVzCdWiCWFssAiUxLrNcj6W8UXiuMMBigEiuqLjoM3gl840
         dSdqcj6V79L9uOFLPtE8ESSR+0gPIP+3Y3xjIvJ1P0bdzZRfQDRzwyFmnOiwylKfAacl
         qnN7i9f0ZPSYk+ZGiyzEegmZ7duhbpjX/o6CldQEw1wIihk6nijATFMaECtwQBgUIO5X
         Ri/A==
X-Forwarded-Encrypted: i=1; AJvYcCU+yL3MA2ATRza5fGu68MDb+gGZU8vLBfFdsK+4nnzN5np7SxurvWFku58StFzmKSwD7w/gCirjbO0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTcfwVydkJIgsYEctoVLOWKCHmbZPtPtVuKQkBYqsGz+ZHaJOs
	fvuQt55pQGtpnYjXveLjE7nHxJ12m19GD40BM8WJFoLCzzeLmTUNoFlKbtN//hk=
X-Gm-Gg: ASbGncvk71fmgYe530AMqGssOIBnwPqWpF509/678wq6/gR8MSi3zk/OX9IznJXdUXf
	mxhCXA7UBhoYmGdgyEQ9VxrYp5dD72W3MH2cRt15PHAmAuibM8vufuZKRAqdT8P8ugcF86tbseB
	Psz6TMXR6k6gYzHFKxLxcq9vtcuGacbG3KX39VOQM4KmgiziMmO8sFHtXhp6sYeI+Ct6UbzBt0y
	Ctw5sYaLS1zzNJHfTF1KswJ50JOAjX9qWvL5o6FlbDYF7J/gurIp2DYAe8SHrtFld0=
X-Google-Smtp-Source: AGHT+IErb9LUclnkXFQGn0vJiPxbHdGenSK/alc5p9FV2tY+1eSNLiHiCoCuCfOfmQGgoqtm3g0RKA==
X-Received: by 2002:a17:902:db09:b0:216:5556:8b46 with SMTP id d9443c01a7336-21a83fd96e7mr91665305ad.49.1736421047119;
        Thu, 09 Jan 2025 03:10:47 -0800 (PST)
Received: from [157.82.203.37] ([157.82.203.37])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a91744428sm10194715ad.60.2025.01.09.03.10.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2025 03:10:46 -0800 (PST)
Message-ID: <293ce6ac-4bf8-4b26-9291-023b7e101572@daynix.com>
Date: Thu, 9 Jan 2025 20:10:41 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] tun: Set num_buffers for virtio 1.0
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
 <20250109-tun-v2-3-388d7d5a287a@daynix.com>
 <20250109023144-mutt-send-email-mst@kernel.org>
 <20250109023829-mutt-send-email-mst@kernel.org>
 <ad580d7b-2bd1-401e-bb7b-b67ec943918f@daynix.com>
 <20250109055425-mutt-send-email-mst@kernel.org>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20250109055425-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025/01/09 19:54, Michael S. Tsirkin wrote:
> On Thu, Jan 09, 2025 at 06:38:10PM +0900, Akihiko Odaki wrote:
>> On 2025/01/09 16:40, Michael S. Tsirkin wrote:
>>> On Thu, Jan 09, 2025 at 02:32:25AM -0500, Michael S. Tsirkin wrote:
>>>> On Thu, Jan 09, 2025 at 03:58:45PM +0900, Akihiko Odaki wrote:
>>>>> The specification says the device MUST set num_buffers to 1 if
>>>>> VIRTIO_NET_F_MRG_RXBUF has not been negotiated.
>>>>>
>>>>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>>>>
>>>>
>>>> How do we know this is v1 and not v0? Confused.
>>>
>>> Ah I got it, you assume userspace will over-write it
>>> if VIRTIO_NET_F_MRG_RXBUF is set.
>>> If we are leaving this up to userspace, why not let it do
>>> it always?
>>
>> tun may be used with vhost_net, which does not set the field.
> 
> I'd fix that in vhost net.

Let's see what filesystem and networking people will say for the earlier 
patch. We can fix num_buffers for free if the earlier patch is getting 
merged. We will need to come up with another solution otherwise.

> 
> 
>>>
>>>>> ---
>>>>>    drivers/net/tap.c      |  2 +-
>>>>>    drivers/net/tun.c      |  6 ++++--
>>>>>    drivers/net/tun_vnet.c | 14 +++++++++-----
>>>>>    drivers/net/tun_vnet.h |  4 ++--
>>>>>    4 files changed, 16 insertions(+), 10 deletions(-)
>>>>>
>>>>> diff --git a/drivers/net/tap.c b/drivers/net/tap.c
>>>>> index 60804855510b..fe9554ee5b8b 100644
>>>>> --- a/drivers/net/tap.c
>>>>> +++ b/drivers/net/tap.c
>>>>> @@ -713,7 +713,7 @@ static ssize_t tap_put_user(struct tap_queue *q,
>>>>>    	int total;
>>>>>    	if (q->flags & IFF_VNET_HDR) {
>>>>> -		struct virtio_net_hdr vnet_hdr;
>>>>> +		struct virtio_net_hdr_v1 vnet_hdr;
>>>>>    		vnet_hdr_len = READ_ONCE(q->vnet_hdr_sz);
>>>>> diff --git a/drivers/net/tun.c b/drivers/net/tun.c
>>>>> index dbf0dee92e93..f211d0580887 100644
>>>>> --- a/drivers/net/tun.c
>>>>> +++ b/drivers/net/tun.c
>>>>> @@ -1991,7 +1991,9 @@ static ssize_t tun_put_user_xdp(struct tun_struct *tun,
>>>>>    	size_t total;
>>>>>    	if (tun->flags & IFF_VNET_HDR) {
>>>>> -		struct virtio_net_hdr gso = { 0 };
>>>>> +		struct virtio_net_hdr_v1 gso = {
>>>>> +			.num_buffers = __virtio16_to_cpu(true, 1)
>>>>> +		};
>>>>>    		vnet_hdr_sz = READ_ONCE(tun->vnet_hdr_sz);
>>>>>    		ret = tun_vnet_hdr_put(vnet_hdr_sz, iter, &gso);
>>>>> @@ -2044,7 +2046,7 @@ static ssize_t tun_put_user(struct tun_struct *tun,
>>>>>    	}
>>>>>    	if (vnet_hdr_sz) {
>>>>> -		struct virtio_net_hdr gso;
>>>>> +		struct virtio_net_hdr_v1 gso;
>>>>>    		ret = tun_vnet_hdr_from_skb(tun->flags, tun->dev, skb, &gso);
>>>>>    		if (ret < 0)
>>>>> diff --git a/drivers/net/tun_vnet.c b/drivers/net/tun_vnet.c
>>>>> index ffb2186facd3..a7a7989fae56 100644
>>>>> --- a/drivers/net/tun_vnet.c
>>>>> +++ b/drivers/net/tun_vnet.c
>>>>> @@ -130,15 +130,17 @@ int tun_vnet_hdr_get(int sz, unsigned int flags, struct iov_iter *from,
>>>>>    EXPORT_SYMBOL_GPL(tun_vnet_hdr_get);
>>>>>    int tun_vnet_hdr_put(int sz, struct iov_iter *iter,
>>>>> -		     const struct virtio_net_hdr *hdr)
>>>>> +		     const struct virtio_net_hdr_v1 *hdr)
>>>>>    {
>>>>> +	int content_sz = MIN(sizeof(*hdr), sz);
>>>>> +
>>>>>    	if (iov_iter_count(iter) < sz)
>>>>>    		return -EINVAL;
>>>>> -	if (copy_to_iter(hdr, sizeof(*hdr), iter) != sizeof(*hdr))
>>>>> +	if (copy_to_iter(hdr, content_sz, iter) != content_sz)
>>>>>    		return -EFAULT;
>>>>> -	if (iov_iter_zero(sz - sizeof(*hdr), iter) != sz - sizeof(*hdr))
>>>>> +	if (iov_iter_zero(sz - content_sz, iter) != sz - content_sz)
>>>>>    		return -EFAULT;
>>>>>    	return 0;
>>>>> @@ -154,11 +156,11 @@ EXPORT_SYMBOL_GPL(tun_vnet_hdr_to_skb);
>>>>>    int tun_vnet_hdr_from_skb(unsigned int flags, const struct net_device *dev,
>>>>>    			  const struct sk_buff *skb,
>>>>> -			  struct virtio_net_hdr *hdr)
>>>>> +			  struct virtio_net_hdr_v1 *hdr)
>>>>>    {
>>>>>    	int vlan_hlen = skb_vlan_tag_present(skb) ? VLAN_HLEN : 0;
>>>>> -	if (virtio_net_hdr_from_skb(skb, hdr,
>>>>> +	if (virtio_net_hdr_from_skb(skb, (struct virtio_net_hdr *)hdr,
>>>>>    				    tun_vnet_is_little_endian(flags), true,
>>>>>    				    vlan_hlen)) {
>>>>>    		struct skb_shared_info *sinfo = skb_shinfo(skb);
>>>>> @@ -176,6 +178,8 @@ int tun_vnet_hdr_from_skb(unsigned int flags, const struct net_device *dev,
>>>>>    		return -EINVAL;
>>>>>    	}
>>>>> +	hdr->num_buffers = 1;
>>>>> +
>>>>>    	return 0;
>>>>>    }
>>>>>    EXPORT_SYMBOL_GPL(tun_vnet_hdr_from_skb);
>>>>> diff --git a/drivers/net/tun_vnet.h b/drivers/net/tun_vnet.h
>>>>> index 2dfdbe92bb24..d8fd94094227 100644
>>>>> --- a/drivers/net/tun_vnet.h
>>>>> +++ b/drivers/net/tun_vnet.h
>>>>> @@ -12,13 +12,13 @@ int tun_vnet_hdr_get(int sz, unsigned int flags, struct iov_iter *from,
>>>>>    		     struct virtio_net_hdr *hdr);
>>>>>    int tun_vnet_hdr_put(int sz, struct iov_iter *iter,
>>>>> -		     const struct virtio_net_hdr *hdr);
>>>>> +		     const struct virtio_net_hdr_v1 *hdr);
>>>>>    int tun_vnet_hdr_to_skb(unsigned int flags, struct sk_buff *skb,
>>>>>    			const struct virtio_net_hdr *hdr);
>>>>>    int tun_vnet_hdr_from_skb(unsigned int flags, const struct net_device *dev,
>>>>>    			  const struct sk_buff *skb,
>>>>> -			  struct virtio_net_hdr *hdr);
>>>>> +			  struct virtio_net_hdr_v1 *hdr);
>>>>>    #endif /* TUN_VNET_H */
>>>>>
>>>>> -- 
>>>>> 2.47.1
>>>
> 


