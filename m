Return-Path: <linux-doc+bounces-40603-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 814B3A5D5CA
	for <lists+linux-doc@lfdr.de>; Wed, 12 Mar 2025 06:59:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2222C189B875
	for <lists+linux-doc@lfdr.de>; Wed, 12 Mar 2025 05:59:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05A911E22FA;
	Wed, 12 Mar 2025 05:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="o5OuM1a7"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702991E0DBA
	for <linux-doc@vger.kernel.org>; Wed, 12 Mar 2025 05:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741759185; cv=none; b=Nlb2d01brUT/MqebwkriiRbSfs8RAP4TDIHWJxXffC6RwiLC78NfTMIPTB1DZ4Fg6TlPab9cBpTvi4etbbPsJutexC0RUvyrmoE84hwIgTRcRMYGJ9CzdQbNg7LJ/JLHVO3hSMY1tDF8tltQ5Mz+3L/N/fRHlJHY7evagnCHbPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741759185; c=relaxed/simple;
	bh=R7tuHjNoroVMo9h2O5mHayl7xY5IH0gYVy1+W3i+UMM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m5P+MU0wV7D7DzvPvA9P1e9tk1f0HiQGRIKxGBeHpxH+1TBIwOSTX9lflXI4VLWoZn4WHAnqfxPVkUKzIoaKlk/RCbePpcXKN2QzA3X8vYw4pkVFB5ZPJWRv2x/1aXidTxriJdTSGc1z8THAoIk7AbJ8OAjIx10XyCkFCNQTFr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=pass smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=o5OuM1a7; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=daynix.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22359001f1aso148980165ad.3
        for <linux-doc@vger.kernel.org>; Tue, 11 Mar 2025 22:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1741759183; x=1742363983; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CZESZje65E8gcTEnwSqTnH4kGbDuL6yGOWt5IOmRc30=;
        b=o5OuM1a7MsxUaa/+Kj3bg6yjWWmMRwpGf06ilI1R46thRszBmt0NH1WmBS3yVYkhLe
         XANaURsDOkS48zqsILYuEDQws7yeZqC7JwEofk5b7EIgJOt8LCIJ8zCQ7dUzFJikFjpC
         O+gKcpr8zJCsjyOKdJ00ikdaF210BQvkF2UkVLjsnL7T0WwZvF5+9KeQ4Ck4iGr9W9lT
         AYZ2XLYqShATzJ093rXavMpyWmjYKx723dxqk/pGVVY+80P4fX++jQPLWQPujw6oShPk
         17bfIC3TvTLE47SgrKVWBsunUc5p9CNL3JQiigZtSWLFFyjX12gspYRn/mZxz7PokQ91
         g7Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741759183; x=1742363983;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CZESZje65E8gcTEnwSqTnH4kGbDuL6yGOWt5IOmRc30=;
        b=GkkGQ6b6FMNU3NjvMFMqLuW5UBPGFBidgusdUtnX3Yai+ZMY7y6MS8YG86OB8Y2tfJ
         cFV8W3TLwFa+AJYKMwOPSfWzcKL1mdxlFW0oi36/c92GYQBcKLy1tugANJSwHqiV+iy1
         QWxBIy3+/g/XkviQw9sTFL/xXfxFjH7WsdpPJYbJ/h0L815GsNhdJ/Z/djksh3YyU3Ra
         L93pWePCyhlKCIt9TWlMJZdyoFLGGsqgpF11WG9adND77QLktCfmI9XJLZc40c6kz/c8
         A/gPltTTxgBe5NtPahNMsPrVjhMFgh+AbUMD8K3qvcok1QD2dgj3cqcIA0QuKS7rry+q
         HShw==
X-Forwarded-Encrypted: i=1; AJvYcCXNNRGnMRboiWgxhdQrkL3wkBUnR77/InmmNfxbDunigPRxsfqmP27djGC9Ea5hwo7pp3zUfkltKbM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5Feeb1HPE+6tKz+is3XdeAzex+8ybShxDGb1lAqhvlPu3crkR
	DDqkYMCQlOR9EshFljT+pV6quMiHGx0aZH8lbi/9bTgQEsKnTDnoa+pIXAUa9iM=
X-Gm-Gg: ASbGncv0JTUBWcXL8YsE7W7yBoM//tCOTcw7nKQb/TJq81biw3VK+Ku4bdwLENa5yQN
	NP8t9BKeDbsbT0NogH42+LjxfnWuODH4wcTCOeh5ihMyym0NAxLMo/PYPrvvbsGALTaSEI9Uiv7
	TPrNHSiH5QPNgaNzM4IHWsvEeuBp9uReeWv3zycvarO5RUzmkVZQqKfmI3WFlsfarFSZjkosbii
	7DQsiNUAyo41lE7+tYeExWkdZM5xd4raNRHhjtcC7IL/J7YPQiCoJCOE67wgCQC8frgDlMVRlvz
	rbYFRgZ4Tp9n315HFoXMQF3AFGlyXNlOi3UyR+i7vLx3f1nd/HAnk3cMvQ==
X-Google-Smtp-Source: AGHT+IHNxn8E8ipTo8o+6AGn7pM/bGpbwkMrzPK64AMoQJ3BPQiT3yi57XUpV2Dk7/oIOt6/kYhYhQ==
X-Received: by 2002:a17:902:f541:b0:224:c76:5e57 with SMTP id d9443c01a7336-22428ab7665mr257241305ad.39.1741759183662;
        Tue, 11 Mar 2025 22:59:43 -0700 (PDT)
Received: from [157.82.205.237] ([157.82.205.237])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109e848csm107914775ad.63.2025.03.11.22.59.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Mar 2025 22:59:43 -0700 (PDT)
Message-ID: <77c21953-b850-4962-8673-6effb593d819@daynix.com>
Date: Wed, 12 Mar 2025 14:59:36 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v9 6/6] vhost/net: Support
 VIRTIO_NET_F_HASH_REPORT
To: Jason Wang <jasowang@redhat.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Xuan Zhuo
 <xuanzhuo@linux.alibaba.com>, Shuah Khan <shuah@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, kvm@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-kselftest@vger.kernel.org,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Andrew Melnychenko <andrew@daynix.com>,
 Stephen Hemminger <stephen@networkplumber.org>, gur.stavi@huawei.com,
 Lei Yang <leiyang@redhat.com>, Simon Horman <horms@kernel.org>
References: <20250307-rss-v9-0-df76624025eb@daynix.com>
 <20250307-rss-v9-6-df76624025eb@daynix.com>
 <CACGkMEuccQ6ah-aZ3tcW1VRuetEoPA_NaLxLT+9fb0uAab8Agg@mail.gmail.com>
 <2e550452-a716-4c3f-9d5a-3882d2c9912a@daynix.com>
 <CACGkMEu9tynRgTh__3p_vSqOekSirbVgS90rd5dUiJru9oV1eg@mail.gmail.com>
 <1dd2417a-3246-44b0-b4ba-feadfd6f794e@daynix.com>
 <CACGkMEthfj0KJvOHhnc_ww7iqtmhHUy9f9EGOoR-n0OwHOBrvQ@mail.gmail.com>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <CACGkMEthfj0KJvOHhnc_ww7iqtmhHUy9f9EGOoR-n0OwHOBrvQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2025/03/12 12:36, Jason Wang wrote:
> On Tue, Mar 11, 2025 at 2:24 PM Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>>
>> On 2025/03/11 9:42, Jason Wang wrote:
>>> On Mon, Mar 10, 2025 at 3:04 PM Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>>>>
>>>> On 2025/03/10 13:43, Jason Wang wrote:
>>>>> On Fri, Mar 7, 2025 at 7:02 PM Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>>>>>>
>>>>>> VIRTIO_NET_F_HASH_REPORT allows to report hash values calculated on the
>>>>>> host. When VHOST_NET_F_VIRTIO_NET_HDR is employed, it will report no
>>>>>> hash values (i.e., the hash_report member is always set to
>>>>>> VIRTIO_NET_HASH_REPORT_NONE). Otherwise, the values reported by the
>>>>>> underlying socket will be reported.
>>>>>>
>>>>>> VIRTIO_NET_F_HASH_REPORT requires VIRTIO_F_VERSION_1.
>>>>>>
>>>>>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>>>>>> Tested-by: Lei Yang <leiyang@redhat.com>
>>>>>> ---
>>>>>>     drivers/vhost/net.c | 49 +++++++++++++++++++++++++++++--------------------
>>>>>>     1 file changed, 29 insertions(+), 20 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/vhost/net.c b/drivers/vhost/net.c
>>>>>> index b9b9e9d40951856d881d77ac74331d914473cd56..16b241b44f89820a42c302f3586ea6bb5e0d4289 100644
>>>>>> --- a/drivers/vhost/net.c
>>>>>> +++ b/drivers/vhost/net.c
>>>>>> @@ -73,6 +73,7 @@ enum {
>>>>>>            VHOST_NET_FEATURES = VHOST_FEATURES |
>>>>>>                             (1ULL << VHOST_NET_F_VIRTIO_NET_HDR) |
>>>>>>                             (1ULL << VIRTIO_NET_F_MRG_RXBUF) |
>>>>>> +                        (1ULL << VIRTIO_NET_F_HASH_REPORT) |
>>>>>>                             (1ULL << VIRTIO_F_ACCESS_PLATFORM) |
>>>>>>                             (1ULL << VIRTIO_F_RING_RESET)
>>>>>>     };
>>>>>> @@ -1097,9 +1098,11 @@ static void handle_rx(struct vhost_net *net)
>>>>>>                    .msg_controllen = 0,
>>>>>>                    .msg_flags = MSG_DONTWAIT,
>>>>>>            };
>>>>>> -       struct virtio_net_hdr hdr = {
>>>>>> -               .flags = 0,
>>>>>> -               .gso_type = VIRTIO_NET_HDR_GSO_NONE
>>>>>> +       struct virtio_net_hdr_v1_hash hdr = {
>>>>>> +               .hdr = {
>>>>>> +                       .flags = 0,
>>>>>> +                       .gso_type = VIRTIO_NET_HDR_GSO_NONE
>>>>>> +               }
>>>>>>            };
>>>>>>            size_t total_len = 0;
>>>>>>            int err, mergeable;
>>>>>> @@ -1110,7 +1113,6 @@ static void handle_rx(struct vhost_net *net)
>>>>>>            bool set_num_buffers;
>>>>>>            struct socket *sock;
>>>>>>            struct iov_iter fixup;
>>>>>> -       __virtio16 num_buffers;
>>>>>>            int recv_pkts = 0;
>>>>>>
>>>>>>            mutex_lock_nested(&vq->mutex, VHOST_NET_VQ_RX);
>>>>>> @@ -1191,30 +1193,30 @@ static void handle_rx(struct vhost_net *net)
>>>>>>                            vhost_discard_vq_desc(vq, headcount);
>>>>>>                            continue;
>>>>>>                    }
>>>>>> +               hdr.hdr.num_buffers = cpu_to_vhost16(vq, headcount);
>>>>>>                    /* Supply virtio_net_hdr if VHOST_NET_F_VIRTIO_NET_HDR */
>>>>>>                    if (unlikely(vhost_hlen)) {
>>>>>> -                       if (copy_to_iter(&hdr, sizeof(hdr),
>>>>>> -                                        &fixup) != sizeof(hdr)) {
>>>>>> +                       if (copy_to_iter(&hdr, vhost_hlen,
>>>>>> +                                        &fixup) != vhost_hlen) {
>>>>>>                                    vq_err(vq, "Unable to write vnet_hdr "
>>>>>>                                           "at addr %p\n", vq->iov->iov_base);
>>>>>>                                    goto out;
>>>>>
>>>>> Is this an "issue" specific to RSS/HASH? If it's not, we need a separate patch.
>>>>>
>>>>> Honestly, I'm not sure if it's too late to fix this.
>>>>
>>>> There is nothing wrong with the current implementation.
>>>
>>> Note that I meant the vhost_hlen part, and the current code is tricky.
>>>
>>> The comment said:
>>>
>>> """
>>> /* Supply virtio_net_hdr if VHOST_NET_F_VIRTIO_NET_HDR */
>>> """
>>>
>>> So it tries to only offer virtio_net_hdr even if vhost_hlen is the set
>>> to mrg_rxbuf len.
>>>
>>> And this patch changes this behaviour.
>>
>> mrg_rxbuf only adds the num_buffers field, which is always set for
>> mrg_rxbuf.
>>
>> The num_buffers was not set for VIRTIO_F_VERSION_1 in the past, but this
>> was also fixed with commit a3b9c053d82a ("vhost/net: Set num_buffers for
>> virtio 1.0")
>>
>> So there is no behavioral change for existing features with this patch.
> 
> I meant this part.
> 
>>>>> +                       if (copy_to_iter(&hdr, vhost_hlen,
>>>>> +                                        &fixup) != vhost_hlen) {
> 
> We should copy only sizeof(hdr) instead of vhost_hlen.> > Anything I miss?

sizeof(hdr) will be greater than vhost_hlen when neither 
VIRTIO_NET_F_MRG_RXBUF or VIRTIO_F_VERSION_1 is negotiated.

Regards,
Akihiko Odaki

> 
> Thanks
> 
>>
>> Regards,
>> Akihiko Odaki
>>
>>>
>>> Thanks
>>>
>>>> The current
>>>> implementation fills the header with zero except num_buffers, which it
>>>> fills some real value. This functionality is working fine with
>>>> VIRTIO_NET_F_MRG_RXBUF and VIRTIO_F_VERSION_1, which change the header size.
>>>>
>>>> Now I'm adding VIRTIO_NET_F_HASH_REPORT and it adds the hash_report
>>>> field, which also needs to be initialized with zero, so I'm making sure
>>>> vhost_net will also initialize it.
>>>>
>>>> Regards,
>>>> Akihiko Odaki
>>>>
>>>>>
>>>>> Others look fine.
>>>>>
>>>>> Thanks
>>>>>
>>>>
>>>
>>
> 


