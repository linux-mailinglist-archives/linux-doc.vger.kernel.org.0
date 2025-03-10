Return-Path: <linux-doc+bounces-40313-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE5FA58B09
	for <lists+linux-doc@lfdr.de>; Mon, 10 Mar 2025 05:03:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C43FB3AB50A
	for <lists+linux-doc@lfdr.de>; Mon, 10 Mar 2025 04:03:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3264D1B85CC;
	Mon, 10 Mar 2025 04:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DfTTKFVa"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5D41F61C
	for <linux-doc@vger.kernel.org>; Mon, 10 Mar 2025 04:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741579433; cv=none; b=NZGX7n3l/4deUo+IcahKXuD0NxfDLBvXN1sZ3KLywMEdZnUppF5HCS0h3t9eMhupw6jDj7qw44w56wKZJDILuH38e00CqWEEcgBTNU747Xr+psBBXxzcSvp5ObUW6BNrfyTa/muxpu9PYe8dpEvSJiFtoIRM84L8yaN4M3mBji8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741579433; c=relaxed/simple;
	bh=aHOy1ecN9jlAaMS2M7dcU9gCxoht3SCiGLgSPyDZ63k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oxlHdmWGOrWW30FQFpixljgCfx4it8yYqX3/53wdWWthCqEZdeRaLcXrHCHKA3JDFcxlLgngQHBaJ187nAkLUKPj8Cp8TqwnXLKV45xtoolN2c8lh8pFZ0IAn7KHz/8YyYULQKnq73jx00i/Csw6KNITcse7QehGl2SpIkWVvjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DfTTKFVa; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741579430;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KgUpYDCvfAICXWh2Ym5jayuE/HfSSdl1/NY4QdmfsrM=;
	b=DfTTKFVaMfNTYVEolhXdbmgRd0nuBNKM2JGmJ1imuxeflvIeF1VeEjL2heSYuZWo5Ym4k+
	ifOknskryfB6hA34Q4fo2tsy2yWfIOb34GcG72bwUwaCzg1dnhs1NV56C87OtA2dKX96DT
	KoAGp1ddatvrElDmTrM+M7sz3+TNIig=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-356-coUnbDGhO8GimqGzePWRTw-1; Mon, 10 Mar 2025 00:03:48 -0400
X-MC-Unique: coUnbDGhO8GimqGzePWRTw-1
X-Mimecast-MFC-AGG-ID: coUnbDGhO8GimqGzePWRTw_1741579428
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-523f5e21251so2552864e0c.2
        for <linux-doc@vger.kernel.org>; Sun, 09 Mar 2025 21:03:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741579428; x=1742184228;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KgUpYDCvfAICXWh2Ym5jayuE/HfSSdl1/NY4QdmfsrM=;
        b=HcSGrCHe6lWbvfeoewHHMB6Gwnjl0SSfIE5iiMQ9IuHTo7GRSO1BsWtsWKYnuo7OFt
         yGPTHXqyFtXwba0AOjIQ4vfHI9OItRDKU73E23IKwu3jbG/ML7plsfJIaf683ff76vE8
         WTwHKelQbvzzGGW9lzShLP6cHT4n30E1/CzDy0ckODCIRLdpn+RB+EwvW8k9gRVr1X3g
         Ymcihd4VPK5kx54g7NbCgCXVqbuzAZ/AlYkK2bvIMbMSOVmYSV3JBL4cW5V3gsG2i7ma
         Mc3LN7S6t9EiJckl/ublRB85yESKSZQGGKi9WKjFxrJc4ZqIHrq5Id4NCKnIVc2B7ch6
         KCBg==
X-Forwarded-Encrypted: i=1; AJvYcCXrzWgj8tiCcp+IBxtaJN2OqJcuIO7c1C3E+L6fjQbADosT5vw8R4anj+Y3ScpcI79Cv2AydziskX8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIP1ZBuXhjE0nOmZ7rfL8iEJZo0LDqjOyhPuL4Yl8oKGMlEG6q
	xMZ8KyiJHHEKGf/jaUc7e8TOiE3uTGM7VkHXOG+yw6gQ0r/3h1Il84x/3NcFKoLA2Pj08QLqvMM
	/zhBxVml/6cHfKplMQXSJA6fAqOQr4NHU57NVT8yaf8nc5ezaQ+lpF2JTygDW2KSZGVUKdqOvcc
	AYmS3GqMIZXPh/FHyWQxIYxq5yvUhbwqlF
X-Gm-Gg: ASbGnct33ULAedkntxHm74MP9kqB01eCogjZKz+Rm6xdWmgfHigi4oCsOkVK01zPdJj
	uWjl8gITUfE2M1YcqVhlrwlvbFXgSxzIbr+oGhkajYwQK7de3WS0Tam/5TPYSSqWhphT9mZKDNQ
	==
X-Received: by 2002:a05:6102:1625:b0:4bb:c24b:b658 with SMTP id ada2fe7eead31-4c30a6ce291mr6889401137.18.1741579428323;
        Sun, 09 Mar 2025 21:03:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWEExs57zlYjvHiKjt0sJdXJFbwo2Zs0LPOPlolmp1grxhBOdO/jBTdI674OxaLt6FioYXJto0Ve0T2qHTIms=
X-Received: by 2002:a05:6102:1625:b0:4bb:c24b:b658 with SMTP id
 ada2fe7eead31-4c30a6ce291mr6889393137.18.1741579427853; Sun, 09 Mar 2025
 21:03:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250307-rss-v9-0-df76624025eb@daynix.com> <20250307-rss-v9-5-df76624025eb@daynix.com>
In-Reply-To: <20250307-rss-v9-5-df76624025eb@daynix.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 10 Mar 2025 12:03:35 +0800
X-Gm-Features: AQ5f1JpUIYkO2z7JqKfhDMFz04EDw9VRlQFOeI99RHje5MrLTIGs-yAN3N8PypE
Message-ID: <CACGkMEuTwd4+DP1Cb+ZgJtxTiJj4N_NMPHiKusd8a4Tn3+B_3A@mail.gmail.com>
Subject: Re: [PATCH net-next v9 5/6] selftest: tun: Add tests for virtio-net hashing
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, kvm@vger.kernel.org, 
	virtualization@lists.linux-foundation.org, linux-kselftest@vger.kernel.org, 
	Yuri Benditovich <yuri.benditovich@daynix.com>, Andrew Melnychenko <andrew@daynix.com>, 
	Stephen Hemminger <stephen@networkplumber.org>, gur.stavi@huawei.com, 
	Lei Yang <leiyang@redhat.com>, Simon Horman <horms@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 7, 2025 at 7:02=E2=80=AFPM Akihiko Odaki <akihiko.odaki@daynix.=
com> wrote:
>
> The added tests confirm tun can perform RSS and hash reporting, and
> reject invalid configurations for them.

Let's be more verbose here. E.g what's the network topology used here.

>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> Tested-by: Lei Yang <leiyang@redhat.com>
> ---
>  tools/testing/selftests/net/Makefile |   2 +-
>  tools/testing/selftests/net/tun.c    | 584 +++++++++++++++++++++++++++++=
+++++-
>  2 files changed, 576 insertions(+), 10 deletions(-)
>
> diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftes=
ts/net/Makefile
> index 73ee88d6b043004be23b444de667a1d99a6045de..9772f691a9a011d99212df324=
63cdb930cf0a1a0 100644
> --- a/tools/testing/selftests/net/Makefile
> +++ b/tools/testing/selftests/net/Makefile
> @@ -123,6 +123,6 @@ $(OUTPUT)/reuseport_bpf_numa: LDLIBS +=3D -lnuma
>  $(OUTPUT)/tcp_mmap: LDLIBS +=3D -lpthread -lcrypto
>  $(OUTPUT)/tcp_inq: LDLIBS +=3D -lpthread
>  $(OUTPUT)/bind_bhash: LDLIBS +=3D -lpthread
> -$(OUTPUT)/io_uring_zerocopy_tx: CFLAGS +=3D -I../../../include/
> +$(OUTPUT)/io_uring_zerocopy_tx $(OUTPUT)/tun: CFLAGS +=3D -I../../../inc=
lude/
>
>  include bpf.mk
> diff --git a/tools/testing/selftests/net/tun.c b/tools/testing/selftests/=
net/tun.c
> index 463dd98f2b80b1bdcb398cee43c834e7dc5cf784..acadeea7194eaea9416a605b4=
7f99f7a5f1f80cd 100644
> --- a/tools/testing/selftests/net/tun.c
> +++ b/tools/testing/selftests/net/tun.c
> @@ -2,21 +2,38 @@
>
>  #define _GNU_SOURCE
>
> +#include <endian.h>
>  #include <errno.h>
>  #include <fcntl.h>
> +#include <sched.h>

Is this needed?

> +#include <stddef.h>
>  #include <stdio.h>
>  #include <stdlib.h>
>  #include <string.h>
>  #include <unistd.h>
> -#include <linux/if.h>
> +#include <net/if.h>
> +#include <netinet/ip.h>
> +#include <sys/ioctl.h>
> +#include <sys/socket.h>
> +#include <linux/compiler.h>
> +#include <linux/icmp.h>
> +#include <linux/if_arp.h>
>  #include <linux/if_tun.h>
> +#include <linux/ipv6.h>
>  #include <linux/netlink.h>
>  #include <linux/rtnetlink.h>
> -#include <sys/ioctl.h>
> -#include <sys/socket.h>
> +#include <linux/sockios.h>
> +#include <linux/tcp.h>
> +#include <linux/udp.h>
> +#include <linux/virtio_net.h>
>
>  #include "../kselftest_harness.h"
>
> +#define TUN_HWADDR_SOURCE { 0x02, 0x00, 0x00, 0x00, 0x00, 0x00 }
> +#define TUN_HWADDR_DEST { 0x02, 0x00, 0x00, 0x00, 0x00, 0x01 }
> +#define TUN_IPADDR_SOURCE htonl((172 << 24) | (17 << 16) | 0)
> +#define TUN_IPADDR_DEST htonl((172 << 24) | (17 << 16) | 1)
> +
>  static int tun_attach(int fd, char *dev)
>  {
>         struct ifreq ifr;
> @@ -39,7 +56,7 @@ static int tun_detach(int fd, char *dev)
>         return ioctl(fd, TUNSETQUEUE, (void *) &ifr);
>  }
>
> -static int tun_alloc(char *dev)
> +static int tun_alloc(char *dev, short flags)
>  {
>         struct ifreq ifr;
>         int fd, err;
> @@ -52,7 +69,8 @@ static int tun_alloc(char *dev)
>
>         memset(&ifr, 0, sizeof(ifr));
>         strcpy(ifr.ifr_name, dev);
> -       ifr.ifr_flags =3D IFF_TAP | IFF_NAPI | IFF_MULTI_QUEUE;
> +       ifr.ifr_flags =3D flags | IFF_TAP | IFF_NAPI | IFF_NO_PI |
> +                       IFF_MULTI_QUEUE;
>
>         err =3D ioctl(fd, TUNSETIFF, (void *) &ifr);
>         if (err < 0) {
> @@ -64,6 +82,40 @@ static int tun_alloc(char *dev)
>         return fd;
>  }
>
> +static bool tun_add_to_bridge(int local_fd, const char *name)
> +{

I wonder if a packet socket is more convenient here.

Thanks


