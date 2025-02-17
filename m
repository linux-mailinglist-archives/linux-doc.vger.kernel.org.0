Return-Path: <linux-doc+bounces-38273-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E11FA379F4
	for <lists+linux-doc@lfdr.de>; Mon, 17 Feb 2025 03:57:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1690A16648D
	for <lists+linux-doc@lfdr.de>; Mon, 17 Feb 2025 02:57:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84FF81494CC;
	Mon, 17 Feb 2025 02:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BC++iy6h"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A5EC8FE
	for <linux-doc@vger.kernel.org>; Mon, 17 Feb 2025 02:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739761055; cv=none; b=IaRvhYsUowi+05AiVpbKyGkzne9ZbldfnTOJwAmGzyLbFhPEf29Y6H2mGpfl8Hujdyt1pBFToLdgQhvNBBtasDgAN0oPQwnSJwbseABwsD6oPeA/+TIWKdxupnra617VTwyLwjcNLS4TQ4bOV7hhRZC/V0AewRY22TGbaSeGUGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739761055; c=relaxed/simple;
	bh=tK9aQDDzfCQLNRUw+2WbCovmkYY2oxiY2yzy3q3Ip3M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NcsS+OaDqF3wDtnRn1CwsH3bJtd6lu3GQR8fAO+s1pSDzaLYapwXcZatNlUmdIzuZTSIpWBiKKdO4yXw/HLtAprZ7mScAp0+SX/8aPzuwuwqqDHy9rJd2CxhmncItxTXcG3QTTSdQTXc/BInTasmW+R+NFWD4reW2/TdxDO5s+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BC++iy6h; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739761052;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XL1MJI2qQRyDzxhhPjfCSyHWJpUSYQmJdBFY+jqfMOQ=;
	b=BC++iy6h2w4UHZFnXXtik21zffi1bOHoXPF4lbwKKZK/2gS04L+kUEWVihpUQ5+JFM+W1i
	izfpEEKduzwFsiYao++TKE5ZbNBwDpKIDqmFKlPBi08QySFa84cL+UuhVmL5q4wIipNaGU
	mdcP3TP7k1TyoI95+wN/x/HxQWSoaQM=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646-LVI9vwjIM4Kmsq9WscYmBQ-1; Sun, 16 Feb 2025 21:57:31 -0500
X-MC-Unique: LVI9vwjIM4Kmsq9WscYmBQ-1
X-Mimecast-MFC-AGG-ID: LVI9vwjIM4Kmsq9WscYmBQ_1739761050
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2fbff6426f5so8003028a91.3
        for <linux-doc@vger.kernel.org>; Sun, 16 Feb 2025 18:57:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739761050; x=1740365850;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XL1MJI2qQRyDzxhhPjfCSyHWJpUSYQmJdBFY+jqfMOQ=;
        b=NyUVicWrLgn+GVQ/evO3c/V1vUvW/BxYaSzGQ68LilqUQzH0sYb5s5G6fQG3Rggb4f
         RaY4VfdP45jHF3cN/kjkfsTsFIGldJ1pt+J1DIzSb2MfQb1aTwYwq247SNd5SsMTui+K
         k+xq5X0tf+rciN3bnqsJyq+xIBWbcUNgoRDrYNr95SSyls0ox/LMeY6FTyaMKVBbMVOJ
         Rgx1VWvDuI7PvC3fpOBK1UYRMLNiVX0ZPs+9H7W0+BNNUA8S28v6sf5CN+SkO8CjAtsQ
         l9OXxqocgxoehloQxe72aI0deppsi2nkI//v2SmzD+SwbrGFWLwn1RnRVoChg+wM/5+i
         2lMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWE4SYtf+ZuYUG4K61Aao0vs4D34BBwj8vh+eCLa+XyZNbYvsIOwExA1HvageU5MU4ofRuytja27w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxigAPBJOXSVABQrQP0BY2MNPJqC2bNH4LzssrzlFgMPAmgtW7J
	luagz07XRqB1LmMeW2AP1ebzGNaA9VNPp1VwPuPtKhR4q6dui1Z3HVJ2aD0lfmWjJRbGS6hLiA/
	fxX/YaBcVLHZsEtgS7BZzJty/HNv0uvQPRXHmHJnVEZ8/HPotxb49yKULqX1OLU/ozJwSLjVFbc
	Z0zzA1fBwVNRp9gArFhaNXJbL1V4Hr1ZPR
X-Gm-Gg: ASbGncugYtKp19ORaRK84pzOvFzonUqFEknMHoOgpMZQ/iywfoGKgBy4q73EvP3xrgZ
	RnEtq73+3OhxDZ1Q8Yw1F6GYiC1I0XTn27D7huRWqxaE3YbGyYQauNQlE5J0GFqk=
X-Received: by 2002:a05:6a00:198c:b0:732:2484:e0ce with SMTP id d2e1a72fcca58-732618c1cf1mr11783601b3a.17.1739761049860;
        Sun, 16 Feb 2025 18:57:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGVQWLmp+QSkutFPeteGs2zCw24E66CumblkrzQWDUWooZ2u41pKGG968ScoLFCi/Lnb1NyBTA6Z6e9dHmLbEA=
X-Received: by 2002:a05:6a00:198c:b0:732:2484:e0ce with SMTP id
 d2e1a72fcca58-732618c1cf1mr11783572b3a.17.1739761049201; Sun, 16 Feb 2025
 18:57:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250213-buffers-v1-1-ec4a0821957a@daynix.com>
 <20250213020702-mutt-send-email-mst@kernel.org> <0fa16c0e-8002-4320-b7d3-d3d36f80008c@daynix.com>
 <20250213103636-mutt-send-email-mst@kernel.org> <33369e7d-4c43-407a-92fd-373a8a7b2160@daynix.com>
In-Reply-To: <33369e7d-4c43-407a-92fd-373a8a7b2160@daynix.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 17 Feb 2025 10:57:17 +0800
X-Gm-Features: AWEUYZmrHEftswhiFfbnVsQcr0_qVHSX-ifAC11RiQWuyoYd9I2p8DCAZlwdITA
Message-ID: <CACGkMEtFK-UO8vJbNTogvTpiP2XFDBrB6B2frFJrUfqgjzApyA@mail.gmail.com>
Subject: Re: [PATCH net-next] tun: Pad virtio headers
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, kvm@vger.kernel.org, 
	virtualization@lists.linux-foundation.org, linux-kselftest@vger.kernel.org, 
	Yuri Benditovich <yuri.benditovich@daynix.com>, Andrew Melnychenko <andrew@daynix.com>, 
	Stephen Hemminger <stephen@networkplumber.org>, gur.stavi@huawei.com, devel@daynix.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 15, 2025 at 1:25=E2=80=AFPM Akihiko Odaki <akihiko.odaki@daynix=
.com> wrote:
>
> On 2025/02/14 0:43, Michael S. Tsirkin wrote:
> > On Thu, Feb 13, 2025 at 06:23:55PM +0900, Akihiko Odaki wrote:
> >> On 2025/02/13 16:18, Michael S. Tsirkin wrote:
> >>>
> >>> Commit log needs some work.
> >>>
> >>> So my understanding is, this patch does not do much functionally,
> >>> but makes adding the hash feature easier. OK.
> >>>
> >>> On Thu, Feb 13, 2025 at 03:54:06PM +0900, Akihiko Odaki wrote:
> >>>> tun used to simply advance iov_iter when it needs to pad virtio head=
er,
> >>>> which leaves the garbage in the buffer as is. This is especially
> >>>> problematic
> >>>
> >>> I think you mean "this will become especially problematic"
> >>>
> >>>> when tun starts to allow enabling the hash reporting
> >>>> feature; even if the feature is enabled, the packet may lack a hash
> >>>> value and may contain a hole in the virtio header because the packet
> >>>> arrived before the feature gets enabled or does not contain the
> >>>> header fields to be hashed. If the hole is not filled with zero, it =
is
> >>>> impossible to tell if the packet lacks a hash value.
> >>>>
> >>>> In theory, a user of tun can fill the buffer with zero before callin=
g
> >>>> read() to avoid such a problem, but leaving the garbage in the buffe=
r is
> >>>> awkward anyway so fill the buffer in tun.
> >>>
> >>>
> >>> What is missing here is description of what the patch does.
> >>> I think it is
> >>> "Replace advancing the iterator with writing zeros".
> >>>
> >>> There could be performance cost to the dirtying extra cache lines, th=
ough.
> >>> Could you try checking that please?
> >>
> >> It will not dirty extra cache lines; an explanation follows later. Bec=
ause
> >> of that, any benchmark are likely to show only noises, but if you have=
 an
> >> idea of workloads that should be tested, please tell me.
> >
> > pktgen usually
>
> I tried it but it didn't give meaningful results so I may be doing
> wrong. It didn't show an obvious performance regression at least. I ran
> the following procedure:
>
> 1. create a veth pair
> 2. connect it to macvtap
> 3. run Fedora 41 on QEMU with vhost=3Don
> 4. run samples/pktgen/pktgen_sample01_simple.sh for the other end of veth
> 5. observe the rx packet rate of macvtap with ifstat for 60 seconds
>
> ifstat showed that it received:
> 532K packets / 60 seconds without this patch
> 578K packets / 60 seconds with this patch

The pps seems to be too poor.

If you want to test, I would suggest to use:

pktgen on the host with DPDK testpmd + virtio user:

https://doc.dpdk.org/guides/howto/virtio_user_as_exception_path.html

Thanks

>
> This is 8.6 % uplift, not degradation. I guess it's just a noise.
>
> Below are actual commands I ran:
>
> The commands I set up the veth pair and macvtap is as follows:
>
> ip link add veth_host type veth peer name veth_guest
> ip link set veth_host up
> ip link set veth_guest up
> ip link add link macvtap0 link veth_guest type macvtap
> ip link set macvtap0 address 02:00:00:01:00:00 mtu 1486 up
> ip address add 10.0.2.0 dev veth_host
> ip route add 10.0.2.1 dev veth_host
>
> The command for the pktgen is:
> samples/pktgen/pktgen_sample01_simple.sh -i veth_host -d 10.0.2.1 -m
> 02:00:00:01:00:00 -n 0
>
> After I started pktgen, I ran: ifstat -d 60 macvtap0
> I waited 60 seconds, and observed the rx rate with: ifstat -as macvtap0
>
> >
> >
> >
> >>>
> >>> I think we should mention the risks of the patch, too.
> >>> Maybe:
> >>>
> >>>     Also in theory, a user might have initialized the buffer
> >>>     to some non-zero value, expecting tun to skip writing it.
> >>>     As this was never a documented feature, this seems unlikely.
> >>>>
> >>>>
> >>>> The specification also says the device MUST set num_buffers to 1 whe=
n
> >>>> the field is present so set it when the specified header size is big
> >>>> enough to contain the field.
> >>>
> >>> This part I dislike. tun has no idea what the number of buffers is.
> >>> Why 1 specifically?
> >>
> >> That's a valid point. I rewrote the commit log to clarify, but perhaps=
 we
> >> can drop the code to set the num_buffers as "[PATCH] vhost/net: Set
> >> num_buffers for virtio 1.0" already landed.
> >
> >
> > I think I'd prefer that second option. it allows userspace
> > to reliably detect the new behaviour, by setting the value
> > to !=3D 0.
>
> I'll leave num_buffers zero in the next version.
>
> >
> >
> >>
> >> Below is the rewritten commit log, which incorporates your suggestions=
 and
> >> is extended to cover the performance implication and reason the num_bu=
ffers
> >> initialization:
> >>
> >> tun simply advances iov_iter when it needs to pad virtio header,
> >> which leaves the garbage in the buffer as is. This will become
> >> especially problematic when tun starts to allow enabling the hash
> >> reporting feature; even if the feature is enabled, the packet may lack=
 a
> >> hash value and may contain a hole in the virtio header because the
> >> packet arrived before the feature gets enabled or does not contain the
> >> header fields to be hashed. If the hole is not filled with zero, it is
> >> impossible to tell if the packet lacks a hash value.
> >>
> >> In theory, a user of tun can fill the buffer with zero before calling
> >> read() to avoid such a problem, but leaving the garbage in the buffer =
is
> >> awkward anyway so replace advancing the iterator with writing zeros.
> >>
> >> A user might have initialized the buffer to some non-zero value,
> >> expecting tun to skip writing it. As this was never a documented
> >> feature, this seems unlikely. Neither is there a non-zero value that c=
an
> >> be determined and set before receiving the packet; the only exception
> >> is the num_buffers field, which is expected to be 1 for version 1 when
> >> VIRTIO_NET_F_HASH_REPORT is not negotiated.
> >
> > you need mergeable buffers instead i presume.
> >
> >> This field is specifically
> >> set to 1 instead of 0.
> >>
> >> The overhead of filling the hole in the header is negligible as the
> >> entire header is already placed on the cache when a header size define=
d
> >
> >
> > what does this mean?
>
> The current specification says the header size is 20 bytes or less. tun
> already makes all cache lines where the header will be written dirty for
> such a header size so we are not making another cache line dirty.
>
> >
> >> in the current specification is used even if the cache line is small
> >> (16 bytes for example).
> >>
> >> Below are the header sizes possible with the current specification:
> >> a) 10 bytes if the legacy interface is used
> >> b) 12 bytes if the modern interface is used
> >> c) 20 bytes if VIRTIO_NET_F_HASH_REPORT is negotiated
> >>
> >> a) and b) obviously fit in a cache line. c) uses one extra cache line,
> >> but the cache line also contains the first 12 bytes of the packet so
> >> it is always placed on the cache.
> >
> >
> > Hmm. But it could be clean so shared. write makes it dirty and so
> > not shared.
>
> The packet is not just located after the header in the buffer but tun
> writes the packet there. It makes the cache line dirty even without this
> change.
>
> >
>


