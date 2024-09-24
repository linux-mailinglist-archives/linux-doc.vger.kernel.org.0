Return-Path: <linux-doc+bounces-25583-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD72984141
	for <lists+linux-doc@lfdr.de>; Tue, 24 Sep 2024 10:58:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 83F851F23F03
	for <lists+linux-doc@lfdr.de>; Tue, 24 Sep 2024 08:58:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3B54450EE;
	Tue, 24 Sep 2024 08:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="p3qKhODx"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C73153801
	for <linux-doc@vger.kernel.org>; Tue, 24 Sep 2024 08:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727168275; cv=none; b=EPr5hbEN8XV/be3MtYkRNHyqmc4zChrfZ9ADW7xBTnjrIQzuCpyPjm7txNi2ssrpSFmE6ur/7mACyvEL8uN65LZZ1Jqkpd0/4t3ZaTUvB4FoMZ4i0x7nZ5w3vtstgZpq6BiBeNqh074xzhi5WnM0FydItBlHmscJ65j/mwJkFcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727168275; c=relaxed/simple;
	bh=mh04sjaOPih7MOeQI3jPmPtO86AVGGEQ3PtVai8zZMo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=T2uxEqDXlpSHieqlDK6M0WzKCHx47ixSthFA3jcu85mcDBB9HpthkO9PUp13vsomJARSbltmM2yBUZtRob9rtPVCw2Z5DrhC8oDSD6ulAcYgnpclf9beWCSxYJr9mI5C8LyhFYbfpQzYtwk/Vw6VpndXmb3vUdRoZj8ZjCCRgz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=none smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=p3qKhODx; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=daynix.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a90188ae58eso665177666b.1
        for <linux-doc@vger.kernel.org>; Tue, 24 Sep 2024 01:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1727168272; x=1727773072; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7dl3VbOeQEPqA+/iXHawLuvaqLpuId6udz2mYLPwgmE=;
        b=p3qKhODxt4kABgl0ErQqYgC0sEgD+fV1QeBYDmJ+7fg5b27rGSFxtXRYXp7rbb7KqC
         JYf3wDXfQP9bH7cHACqrMk3QH6ja8xwbyH6TLtRKm/UjgPdwsf78cC/FSXvXjbROf/D9
         JY6d955BqIpr93csYB3IJHdePCizw9pwmDEVhagmuHyrT4sORBcF+5RCriDJVFdtDIv5
         g9zZT5+cA6u8fB+M1sWyrTHaPsgmQZZAyiqM3qbxdo1PzQTwW2mhjWAbLMa+fpXgBYzX
         KrBRLYkp4QLw7LykpJXgpfqxkQAn7GE5DeOLJ59wOZSXgtDJIrin7HmATtkkMlrvXlrG
         1oig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727168272; x=1727773072;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7dl3VbOeQEPqA+/iXHawLuvaqLpuId6udz2mYLPwgmE=;
        b=RbJNw3s6OUZbTDh2W4CBNI5SoGak8mHZgPzoJ2YQiqNI3ynqkgFHMa0XR80YWeytFm
         /sTDdVmm2TUZewsnIJ3lQnbfihejwmu3I6gWYjYEp4Oq+Ru873sLqM/jGNTZrxZxG7CH
         +vQW+SF8ZHozMn2r1zKAqMLRX73cYzq7apZdp91Ow1ZJTWOnPX6D+ZdcVWspAMWFqBAl
         QOLJTXpoFOLaUkQCslCK+X6stS+XGaWEA+e4aOp6anilJRgS33ZBAMfja4a9LnxBWTMw
         99fqUucNuqsS4uEKAkeqlr5jb2bS5fVt6C6Jfsop+T+XjgYEveXjPQDaXLKyDTXcF+A8
         cdtA==
X-Forwarded-Encrypted: i=1; AJvYcCW88zYgQtad5Lg+s4YIfy1nuztx+4tnI+kuR9RioK1gGdWSZJIguQlKeIQH/gZxfdHxYCQV736GBus=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjnlF5W1I5hChK7YPQVxixYQG4ycJ4fzuaD9fPJwUqBeCBBBIg
	/x6DKF2v8Eu530LMJwIUUeGHf+Qiq4AGcd+XBxSmE++zrkJNrx5ijKQn1Noe0T8=
X-Google-Smtp-Source: AGHT+IGvBs7UGJ8azIbhKgkW3DXwBRfi2TYtP3TyQvaO4rt/p1iqkfXXvt9HpsTnFXiuDAZIfLYj4Q==
X-Received: by 2002:a17:907:1c29:b0:a8d:483f:5199 with SMTP id a640c23a62f3a-a90d59994d7mr1368886566b.58.1727168271803;
        Tue, 24 Sep 2024 01:57:51 -0700 (PDT)
Received: from [10.241.20.238] ([193.32.29.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9392f4fb94sm58762266b.58.2024.09.24.01.57.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Sep 2024 01:57:51 -0700 (PDT)
Message-ID: <cc2bc65b-d75a-4232-a0bd-9c759aba8aba@daynix.com>
Date: Tue, 24 Sep 2024 10:57:49 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 7/9] tun: Introduce virtio-net RSS
From: Akihiko Odaki <akihiko.odaki@daynix.com>
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
 Andrew Melnychenko <andrew@daynix.com>
References: <20240915-rss-v3-0-c630015db082@daynix.com>
 <20240915-rss-v3-7-c630015db082@daynix.com>
 <66ead59563da7_29b98629486@willemb.c.googlers.com.notmuch>
 <694a8f81-616e-47d0-8185-5b73626c4109@daynix.com>
Content-Language: en-US
In-Reply-To: <694a8f81-616e-47d0-8185-5b73626c4109@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2024/09/24 10:56, Akihiko Odaki wrote:
> On 2024/09/18 15:28, Willem de Bruijn wrote:
>> Akihiko Odaki wrote:
>>> RSS is a receive steering algorithm that can be negotiated to use with
>>> virtio_net. Conventionally the hash calculation was done by the VMM.
>>> However, computing the hash after the queue was chosen defeats the
>>> purpose of RSS.
>>>
>>> Another approach is to use eBPF steering program. This approach has
>>> another downside: it cannot report the calculated hash due to the
>>> restrictive nature of eBPF steering program.
>>>
>>> Introduce the code to perform RSS to the kernel in order to overcome
>>> thse challenges. An alternative solution is to extend the eBPF steering
>>> program so that it will be able to report to the userspace, but I didn't
>>> opt for it because extending the current mechanism of eBPF steering
>>> program as is because it relies on legacy context rewriting, and
>>> introducing kfunc-based eBPF will result in non-UAPI dependency while
>>> the other relevant virtualization APIs such as KVM and vhost_net are
>>> UAPIs.
>>>
>>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>>> ---
>>>   drivers/net/tun.c           | 119 
>>> +++++++++++++++++++++++++++++++++++++++-----
>>>   include/uapi/linux/if_tun.h |  27 ++++++++++
>>>   2 files changed, 133 insertions(+), 13 deletions(-)
>>>
>>> diff --git a/drivers/net/tun.c b/drivers/net/tun.c
>>> index b8fcd71becac..5a429b391144 100644
>>> --- a/drivers/net/tun.c
>>> +++ b/drivers/net/tun.c
>>> @@ -175,6 +175,9 @@ struct tun_prog {
>>>   struct tun_vnet_hash_container {
>>>       struct tun_vnet_hash common;
>>> +    struct tun_vnet_hash_rss rss;
>>> +    __be32 rss_key[VIRTIO_NET_RSS_MAX_KEY_SIZE];
>>> +    u16 rss_indirection_table[];
>>>   };
>>>   /* Since the socket were moved to tun_file, to preserve the 
>>> behavior of persist
>>> @@ -227,7 +230,7 @@ struct veth {
>>>   };
>>>   static const struct tun_vnet_hash tun_vnet_hash_cap = {
>>> -    .flags = TUN_VNET_HASH_REPORT,
>>> +    .flags = TUN_VNET_HASH_REPORT | TUN_VNET_HASH_RSS,
>>>       .types = VIRTIO_NET_SUPPORTED_HASH_TYPES
>>>   };
>>> @@ -591,6 +594,36 @@ static u16 tun_ebpf_select_queue(struct 
>>> tun_struct *tun, struct sk_buff *skb)
>>>       return ret % numqueues;
>>>   }
>>> +static u16 tun_vnet_rss_select_queue(struct tun_struct *tun,
>>> +                     struct sk_buff *skb,
>>> +                     const struct tun_vnet_hash_container *vnet_hash)
>>> +{
>>> +    struct tun_vnet_hash_ext *ext;
>>> +    struct virtio_net_hash hash;
>>> +    u32 numqueues = READ_ONCE(tun->numqueues);
>>> +    u16 txq, index;
>>> +
>>> +    if (!numqueues)
>>> +        return 0;
>>> +
>>> +    if (!virtio_net_hash_rss(skb, vnet_hash->common.types, 
>>> vnet_hash->rss_key,
>>> +                 &hash))
>>> +        return vnet_hash->rss.unclassified_queue % numqueues;
>>> +
>>> +    if (vnet_hash->common.flags & TUN_VNET_HASH_REPORT) {
>>> +        ext = skb_ext_add(skb, SKB_EXT_TUN_VNET_HASH);
>>> +        if (ext) {
>>> +            ext->value = hash.value;
>>> +            ext->report = hash.report;
>>> +        }
>>> +    }
>>> +
>>> +    index = hash.value & vnet_hash->rss.indirection_table_mask;
>>> +    txq = READ_ONCE(vnet_hash->rss_indirection_table[index]);
>>> +
>>> +    return txq % numqueues;
>>> +}
>>> +
>>>   static u16 tun_select_queue(struct net_device *dev, struct sk_buff 
>>> *skb,
>>>                   struct net_device *sb_dev)
>>>   {
>>> @@ -603,7 +636,10 @@ static u16 tun_select_queue(struct net_device 
>>> *dev, struct sk_buff *skb,
>>>       } else {
>>>           struct tun_vnet_hash_container *vnet_hash = 
>>> rcu_dereference(tun->vnet_hash);
>>> -        ret = tun_automq_select_queue(tun, skb, vnet_hash);
>>> +        if (vnet_hash && (vnet_hash->common.flags & TUN_VNET_HASH_RSS))
>>> +            ret = tun_vnet_rss_select_queue(tun, skb, vnet_hash);
>>> +        else
>>> +            ret = tun_automq_select_queue(tun, skb, vnet_hash);
>>>       }
>>>       rcu_read_unlock();
>>> @@ -3085,13 +3121,9 @@ static int tun_set_queue(struct file *file, 
>>> struct ifreq *ifr)
>>>   }
>>>   static int tun_set_ebpf(struct tun_struct *tun, struct tun_prog 
>>> __rcu **prog_p,
>>> -            void __user *data)
>>> +            int fd)
>>>   {
>>>       struct bpf_prog *prog;
>>> -    int fd;
>>> -
>>> -    if (copy_from_user(&fd, data, sizeof(fd)))
>>> -        return -EFAULT;
>>>       if (fd == -1) {
>>>           prog = NULL;
>>> @@ -3157,6 +3189,7 @@ static long __tun_chr_ioctl(struct file *file, 
>>> unsigned int cmd,
>>>       int ifindex;
>>>       int sndbuf;
>>>       int vnet_hdr_sz;
>>> +    int fd;
>>>       int le;
>>>       int ret;
>>>       bool do_notify = false;
>>> @@ -3460,11 +3493,27 @@ static long __tun_chr_ioctl(struct file 
>>> *file, unsigned int cmd,
>>>           break;
>>>       case TUNSETSTEERINGEBPF:
>>> -        ret = tun_set_ebpf(tun, &tun->steering_prog, argp);
>>> +        if (get_user(fd, (int __user *)argp)) {
>>> +            ret = -EFAULT;
>>> +            break;
>>> +        }
>>> +
>>> +        vnet_hash = rtnl_dereference(tun->vnet_hash);
>>> +        if (fd != -1 && vnet_hash && (vnet_hash->common.flags & 
>>> TUN_VNET_HASH_RSS)) {
>>> +            ret = -EBUSY;
>>> +            break;
>>> +        }
>>> +
>>> +        ret = tun_set_ebpf(tun, &tun->steering_prog, fd);
>>>           break;
>>>       case TUNSETFILTEREBPF:
>>> -        ret = tun_set_ebpf(tun, &tun->filter_prog, argp);
>>> +        if (get_user(fd, (int __user *)argp)) {
>>> +            ret = -EFAULT;
>>> +            break;
>>> +        }
>>> +
>>> +        ret = tun_set_ebpf(tun, &tun->filter_prog, fd);
>>>           break;
>>>       case TUNSETCARRIER:
>>> @@ -3496,10 +3545,54 @@ static long __tun_chr_ioctl(struct file 
>>> *file, unsigned int cmd,
>>>               break;
>>>           }
>>> -        vnet_hash = kmalloc(sizeof(vnet_hash->common), GFP_KERNEL);
>>> -        if (!vnet_hash) {
>>> -            ret = -ENOMEM;
>>> -            break;
>>> +        if (vnet_hash_common.flags & TUN_VNET_HASH_RSS) {
>>> +            struct tun_vnet_hash_rss rss;
>>> +            size_t indirection_table_size;
>>> +            size_t key_size;
>>> +            size_t size;
>>> +
>>> +            if (tun->steering_prog) {
>>> +                ret = -EBUSY;
>>> +                break;
>>> +            }
>>> +
>>> +            if (copy_from_user(&rss, argp, sizeof(rss))) {
>>> +                ret = -EFAULT;
>>> +                break;
>>> +            }
>>> +            argp = (struct tun_vnet_hash_rss __user *)argp + 1;
>>> +
>>> +            indirection_table_size = 
>>> ((size_t)rss.indirection_table_mask + 1) * 2;
>>
>> Why make uapi a mask rather than a length?
> 
> It follows the virtio specification. It is actually used as a mask in 
> tun_vnet_rss_select_queue().
> 
>>
>> Also is there a upper length bounds sanity check for this input from
>> userspace?
> 
> No, but the maximum size is limited to 128 bytes because the 
> indirection_table_mask is 16-bit and it indexes an array of 16-bit 
> integers.

Not 128 bytes but 128 KiB.

> 
>>
>>> +            key_size = 
>>> virtio_net_hash_key_length(vnet_hash_common.types);
>>> +            size = sizeof(*vnet_hash) + indirection_table_size + 
>>> key_size;
>>
>> key_size is included in sizeof(*vnet_hash), always
>> VIRTIO_NET_RSS_MAX_KEY_SIZE.
> 
> I will fix this by replacing it with:
> struct_size(vnet_hash, rss_indirection_table,
>              (size_t)rss.indirection_table_mask + 1)
> 
> Regards,
> Akihiko Odaki
> 
>>> +
>>> +            vnet_hash = kmalloc(size, GFP_KERNEL);
>>> +            if (!vnet_hash) {
>>> +                ret = -ENOMEM;
>>> +                break;
>>> +            }
>>> +
>>> +            if (copy_from_user(vnet_hash->rss_indirection_table,
>>> +                       argp, indirection_table_size)) {
>>> +                kfree(vnet_hash);
>>> +                ret = -EFAULT;
>>> +                break;
>>> +            }
>>> +            argp = (u16 __user *)argp + rss.indirection_table_mask + 1;
>>> +
>>> +            if (copy_from_user(vnet_hash->rss_key, argp, key_size)) {
>>> +                kfree(vnet_hash);
>>> +                ret = -EFAULT;
>>> +                break;
>>> +            }
>>> +
>>> +            vnet_hash->rss = rss;
>>> +        } else {
>>> +            vnet_hash = kmalloc(sizeof(vnet_hash->common), GFP_KERNEL);
>>> +            if (!vnet_hash) {
>>> +                ret = -ENOMEM;
>>> +                break;
>>> +            }
>>>           }
>>>           vnet_hash->common = vnet_hash_common;
>>> diff --git a/include/uapi/linux/if_tun.h b/include/uapi/linux/if_tun.h
>>> index 1561e8ce0a0a..1c130409db5d 100644
>>> --- a/include/uapi/linux/if_tun.h
>>> +++ b/include/uapi/linux/if_tun.h
>>> @@ -75,6 +75,14 @@
>>>    *
>>>    * The argument is a pointer to &struct tun_vnet_hash.
>>>    *
>>> + * The argument is a pointer to the compound of the following in 
>>> order if
>>> + * %TUN_VNET_HASH_RSS is set:
>>> + *
>>> + * 1. &struct tun_vnet_hash
>>> + * 2. &struct tun_vnet_hash_rss
>>> + * 3. Indirection table
>>> + * 4. Key
>>> + *
>>>    * %TUNSETVNETHDRSZ ioctl must be called with a number greater than 
>>> or equal to
>>>    * the size of &struct virtio_net_hdr_v1_hash before calling this 
>>> ioctl with
>>>    * %TUN_VNET_HASH_REPORT.
>>> @@ -144,6 +152,13 @@ struct tun_filter {
>>>    */
>>>   #define TUN_VNET_HASH_REPORT    0x0001
>>> +/**
>>> + * define TUN_VNET_HASH_RSS - Request virtio_net RSS
>>> + *
>>> + * This is mutually exclusive with eBPF steering program.
>>> + */
>>> +#define TUN_VNET_HASH_RSS    0x0002
>>> +
>>>   /**
>>>    * struct tun_vnet_hash - virtio_net hashing configuration
>>>    * @flags:
>>> @@ -159,4 +174,16 @@ struct tun_vnet_hash {
>>>       __u32 types;
>>>   };
>>> +/**
>>> + * struct tun_vnet_hash_rss - virtio_net RSS configuration
>>> + * @indirection_table_mask:
>>> + *        Bitmask to be applied to the indirection table index
>>> + * @unclassified_queue:
>>> + *        The index of the queue to place unclassified packets in
>>> + */
>>> +struct tun_vnet_hash_rss {
>>> +    __u16 indirection_table_mask;
>>> +    __u16 unclassified_queue;
>>> +};
>>> +
>>>   #endif /* _UAPI__IF_TUN_H */
>>>
>>> -- 
>>> 2.46.0
>>>
>>
>>

