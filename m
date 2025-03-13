Return-Path: <linux-doc+bounces-40663-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 594A1A5E942
	for <lists+linux-doc@lfdr.de>; Thu, 13 Mar 2025 02:16:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D007E189B1FB
	for <lists+linux-doc@lfdr.de>; Thu, 13 Mar 2025 01:16:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8570F81ACA;
	Thu, 13 Mar 2025 01:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MOZvcPWq"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D442C190
	for <linux-doc@vger.kernel.org>; Thu, 13 Mar 2025 01:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741828579; cv=none; b=XU/qKlhqGPQyk301EiiTEVB0pN6O3nZkr6k1A8d6XPRpJ790wzaLvj3gsyrM1QP/Ls3wvEZ28YugNBJLVjoOIT/CjMnwMsZ0zMXYHvsSHgd0w0TMck6jgogJONifgdaUqCu3kf9Y2hcVnmC/7jjTJPTjqVgjxp99Jzl8cV9LZS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741828579; c=relaxed/simple;
	bh=721uMLq5LFnuXA+9nIjHO+clfJHeej0JcN7/Aa5K9B4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qgjCONz5xzfI6ONsxAh42XXNySLWz+ehMc9Ag2L3ys3QoedgmCb33hcdQP+NkFg2TL3zSdNSq4qbakFXxrDqAKzEoaHl60YiMFFwYWOE/FE0TGKNPs5mKQDfX8YFetkOvhdo4Jbd+RSUZCWgFuJ6YiYQ/3h9oLrrffXvaUZXZBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MOZvcPWq; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741828576;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AogDjbH4EuWFnB9nW79HasahXRM+mCBIQhmErtsSbO8=;
	b=MOZvcPWqp0YVsx6usrPOlpXqK0Nh3E4zM/0kPocbo0eCzHN0co+PCrNyQQqc7BHgqYJ0i/
	yNhzajENNEjZCZS1A3waDL8P+XtMATQK37IXvRSjY3asKbDR4fZCIHj4VA0Jjhd9P2gQTY
	z0NVxVXj7D4fcoLf6IcNFrTo6pXXl68=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-67-KL_0MFI2MDO6otRbl7yb-g-1; Wed, 12 Mar 2025 21:16:14 -0400
X-MC-Unique: KL_0MFI2MDO6otRbl7yb-g-1
X-Mimecast-MFC-AGG-ID: KL_0MFI2MDO6otRbl7yb-g_1741828573
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5e5edf8a509so316935a12.1
        for <linux-doc@vger.kernel.org>; Wed, 12 Mar 2025 18:16:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741828573; x=1742433373;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AogDjbH4EuWFnB9nW79HasahXRM+mCBIQhmErtsSbO8=;
        b=Fc1b0+LfwXHIEe3C1DEV6c6LcZOtBXC7L/x9i7fgJOsExtUUFcauwj7NspUYgpIWpV
         1aV9V1kN6MlX2jyMJzEI2aIDWlfSUjtSZcWT+bLUKaB43lRgJUR+RxbZxqjFdRianeed
         oi5+R4mHnapU4co5czGTYupq3bMom3vTGS6f/3FG3sM4XTRXuNLJLdga5EVJ4NRWutX6
         pDYNVUeLX7a7EookxO7K3tHqSA5WCA+gbp/yKAL2NTd1mBr08AXOw2pPynBOxyZPAvUP
         Vec3arnnrcwqXj98Bx7t8mzEbcKCTg1LP2Xc67vkGV60UcSu1mJk6GfE/O+JpLda3Zk0
         xk9A==
X-Forwarded-Encrypted: i=1; AJvYcCWyQlGvu30z72IxHrdLdgUNhc1XpAFW4RvmqrDDpaj+F5WK6EasyW7uJ7tCZhYblaUnVyWeLQEt+YQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVr27bE1hIIsHDeXhYvuEkh1WbsO/3rq0ySt0UHAuLUlbUhG/P
	DWR96wno+myBPs6kFPqNQp1oqqlGJTyrsPAlYQyR0+dGBEdahYq/Xf2AkrVaTlRTne7Qc4qufPN
	ltLULuOrqNQ7di+yvge24i9V93PuYGkJ1lqQIv56HHu1SZXC3oyzjbj4Zp+0vei6RrzidujY1ZH
	V7muh84bfmCeYd6mI3DeKca9G4Ze8HDDQK
X-Gm-Gg: ASbGncs5HA+27BgyorvW6XTuhSAcQSVXUAaPK+5i/FiOHEeL7AQOX+c9DPDqI8Gak+3
	B2st53IY7zgqqQik9EpB5Po5cwb/FzkjfOJfQ8wZZWsdF0QIDrbc/SYjYqgmrwV3Q5fEJHEMxmQ
	==
X-Received: by 2002:a05:6402:26d2:b0:5e7:c408:7b02 with SMTP id 4fb4d7f45d1cf-5e7c4087bb4mr4445106a12.24.1741828573088;
        Wed, 12 Mar 2025 18:16:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsqrjx1jU33odwiOgIHpXyVpWnebktUx1CiaLawfB32JjJhcFs07A39GAWg4iQJxP627Dr4vKNGHjojQEG5uo=
X-Received: by 2002:a05:6402:26d2:b0:5e7:c408:7b02 with SMTP id
 4fb4d7f45d1cf-5e7c4087bb4mr4445075a12.24.1741828572706; Wed, 12 Mar 2025
 18:16:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250307-rss-v9-0-df76624025eb@daynix.com>
In-Reply-To: <20250307-rss-v9-0-df76624025eb@daynix.com>
From: Lei Yang <leiyang@redhat.com>
Date: Thu, 13 Mar 2025 09:15:36 +0800
X-Gm-Features: AQ5f1JplCJM-om_OaGqMtL3AEdit82ixIY48vsrcWfisxBqhfRPtd2ySurX_Fnw
Message-ID: <CAPpAL=yQAqo=8xC2-HwnSK0MhmBiDoAKUYYKieQYjpAV=DLpng@mail.gmail.com>
Subject: Re: [PATCH net-next v9 0/6] tun: Introduce virtio-net hashing feature
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
	Jason Wang <jasowang@redhat.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, kvm@vger.kernel.org, 
	virtualization@lists.linux-foundation.org, linux-kselftest@vger.kernel.org, 
	Yuri Benditovich <yuri.benditovich@daynix.com>, Andrew Melnychenko <andrew@daynix.com>, 
	Stephen Hemminger <stephen@networkplumber.org>, gur.stavi@huawei.com, 
	Simon Horman <horms@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

QE tested this series of patches's v9 with virtio-net regression
tests, everything works fine.

Tested-by: Lei Yang <leiyang@redhat.com>

On Fri, Mar 7, 2025 at 7:01=E2=80=AFPM Akihiko Odaki <akihiko.odaki@daynix.=
com> wrote:
>
> virtio-net have two usage of hashes: one is RSS and another is hash
> reporting. Conventionally the hash calculation was done by the VMM.
> However, computing the hash after the queue was chosen defeats the
> purpose of RSS.
>
> Another approach is to use eBPF steering program. This approach has
> another downside: it cannot report the calculated hash due to the
> restrictive nature of eBPF.
>
> Introduce the code to compute hashes to the kernel in order to overcome
> thse challenges.
>
> An alternative solution is to extend the eBPF steering program so that it
> will be able to report to the userspace, but it is based on context
> rewrites, which is in feature freeze. We can adopt kfuncs, but they will
> not be UAPIs. We opt to ioctl to align with other relevant UAPIs (KVM
> and vhost_net).
>
> The patches for QEMU to use this new feature was submitted as RFC and
> is available at:
> https://patchew.org/QEMU/20240915-hash-v3-0-79cb08d28647@daynix.com/
>
> This work was presented at LPC 2024:
> https://lpc.events/event/18/contributions/1963/
>
> V1 -> V2:
>   Changed to introduce a new BPF program type.
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
> Changes in v9:
> - Added a missing return statement in patch
>   "tun: Introduce virtio-net hash feature".
> - Link to v8: https://lore.kernel.org/r/20250306-rss-v8-0-7ab4f56ff423@da=
ynix.com
>
> Changes in v8:
> - Disabled IPv6 to eliminate noises in tests.
> - Added a branch in tap to avoid unnecessary dissection when hash
>   reporting is disabled.
> - Removed unnecessary rtnl_lock().
> - Extracted code to handle new ioctls into separate functions to avoid
>   adding extra NULL checks to the code handling other ioctls.
> - Introduced variable named "fd" to __tun_chr_ioctl().
> - s/-/=3D/g in a patch message to avoid confusing Git.
> - Link to v7: https://lore.kernel.org/r/20250228-rss-v7-0-844205cbbdd6@da=
ynix.com
>
> Changes in v7:
> - Ensured to set hash_report to VIRTIO_NET_HASH_REPORT_NONE for
>   VHOST_NET_F_VIRTIO_NET_HDR.
> - s/4/sizeof(u32)/ in patch "virtio_net: Add functions for hashing".
> - Added tap_skb_cb type.
> - Rebased.
> - Link to v6: https://lore.kernel.org/r/20250109-rss-v6-0-b1c90ad708f6@da=
ynix.com
>
> Changes in v6:
> - Extracted changes to fill vnet header holes into another series.
> - Squashed patches "skbuff: Introduce SKB_EXT_TUN_VNET_HASH", "tun:
>   Introduce virtio-net hash reporting feature", and "tun: Introduce
>   virtio-net RSS" into patch "tun: Introduce virtio-net hash feature".
> - Dropped the RFC tag.
> - Link to v5: https://lore.kernel.org/r/20241008-rss-v5-0-f3cf68df005d@da=
ynix.com
>
> Changes in v5:
> - Fixed a compilation error with CONFIG_TUN_VNET_CROSS_LE.
> - Optimized the calculation of the hash value according to:
>   https://git.dpdk.org/dpdk/commit/?id=3D3fb1ea032bd6ff8317af5dac9af901f1=
f324cab4
> - Added patch "tun: Unify vnet implementation".
> - Dropped patch "tap: Pad virtio header with zero".
> - Added patch "selftest: tun: Test vnet ioctls without device".
> - Reworked selftests to skip for older kernels.
> - Documented the case when the underlying device is deleted and packets
>   have queue_mapping set by TC.
> - Reordered test harness arguments.
> - Added code to handle fragmented packets.
> - Link to v4: https://lore.kernel.org/r/20240924-rss-v4-0-84e932ec0e6c@da=
ynix.com
>
> Changes in v4:
> - Moved tun_vnet_hash_ext to if_tun.h.
> - Renamed virtio_net_toeplitz() to virtio_net_toeplitz_calc().
> - Replaced htons() with cpu_to_be16().
> - Changed virtio_net_hash_rss() to return void.
> - Reordered variable declarations in virtio_net_hash_rss().
> - Removed virtio_net_hdr_v1_hash_from_skb().
> - Updated messages of "tap: Pad virtio header with zero" and
>   "tun: Pad virtio header with zero".
> - Fixed vnet_hash allocation size.
> - Ensured to free vnet_hash when destructing tun_struct.
> - Link to v3: https://lore.kernel.org/r/20240915-rss-v3-0-c630015db082@da=
ynix.com
>
> Changes in v3:
> - Reverted back to add ioctl.
> - Split patch "tun: Introduce virtio-net hashing feature" into
>   "tun: Introduce virtio-net hash reporting feature" and
>   "tun: Introduce virtio-net RSS".
> - Changed to reuse hash values computed for automq instead of performing
>   RSS hashing when hash reporting is requested but RSS is not.
> - Extracted relevant data from struct tun_struct to keep it minimal.
> - Added kernel-doc.
> - Changed to allow calling TUNGETVNETHASHCAP before TUNSETIFF.
> - Initialized num_buffers with 1.
> - Added a test case for unclassified packets.
> - Fixed error handling in tests.
> - Changed tests to verify that the queue index will not overflow.
> - Rebased.
> - Link to v2: https://lore.kernel.org/r/20231015141644.260646-1-akihiko.o=
daki@daynix.com
>
> ---
> Akihiko Odaki (6):
>       virtio_net: Add functions for hashing
>       net: flow_dissector: Export flow_keys_dissector_symmetric
>       tun: Introduce virtio-net hash feature
>       selftest: tun: Test vnet ioctls without device
>       selftest: tun: Add tests for virtio-net hashing
>       vhost/net: Support VIRTIO_NET_F_HASH_REPORT
>
>  Documentation/networking/tuntap.rst  |   7 +
>  drivers/net/Kconfig                  |   1 +
>  drivers/net/tap.c                    |  68 +++-
>  drivers/net/tun.c                    |  98 +++++-
>  drivers/net/tun_vnet.h               | 159 ++++++++-
>  drivers/vhost/net.c                  |  49 +--
>  include/linux/if_tap.h               |   2 +
>  include/linux/skbuff.h               |   3 +
>  include/linux/virtio_net.h           | 188 ++++++++++
>  include/net/flow_dissector.h         |   1 +
>  include/uapi/linux/if_tun.h          |  75 ++++
>  net/core/flow_dissector.c            |   3 +-
>  net/core/skbuff.c                    |   4 +
>  tools/testing/selftests/net/Makefile |   2 +-
>  tools/testing/selftests/net/tun.c    | 656 +++++++++++++++++++++++++++++=
+++++-
>  15 files changed, 1255 insertions(+), 61 deletions(-)
> ---
> base-commit: dd83757f6e686a2188997cb58b5975f744bb7786
> change-id: 20240403-rss-e737d89efa77
> prerequisite-change-id: 20241230-tun-66e10a49b0c7:v6
> prerequisite-patch-id: 871dc5f146fb6b0e3ec8612971a8e8190472c0fb
> prerequisite-patch-id: 2797ed249d32590321f088373d4055ff3f430a0e
> prerequisite-patch-id: ea3370c72d4904e2f0536ec76ba5d26784c0cede
> prerequisite-patch-id: 837e4cf5d6b451424f9b1639455e83a260c4440d
> prerequisite-patch-id: ea701076f57819e844f5a35efe5cbc5712d3080d
> prerequisite-patch-id: 701646fb43ad04cc64dd2bf13c150ccbe6f828ce
> prerequisite-patch-id: 53176dae0c003f5b6c114d43f936cf7140d31bb5
> prerequisite-change-id: 20250116-buffers-96e14bf023fc:v2
> prerequisite-patch-id: 25fd4f99d4236a05a5ef16ab79f3e85ee57e21cc
>
> Best regards,
> --
> Akihiko Odaki <akihiko.odaki@daynix.com>
>


