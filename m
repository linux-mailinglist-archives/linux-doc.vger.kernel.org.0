Return-Path: <linux-doc+bounces-40456-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7AFA5B481
	for <lists+linux-doc@lfdr.de>; Tue, 11 Mar 2025 01:40:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D3FD83AF6EB
	for <lists+linux-doc@lfdr.de>; Tue, 11 Mar 2025 00:40:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DAC31F94D;
	Tue, 11 Mar 2025 00:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OeDT/I6I"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0FA378F5E
	for <linux-doc@vger.kernel.org>; Tue, 11 Mar 2025 00:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741653633; cv=none; b=eHCUArCGaUWhaLl397+je6owMvo4LNU62sROijOoZlkCg7siYcXbBo6sFmPfD+9v/Fgq+LqoKilyvHmvdGLNtR36Xe/Dz4xqONeNsvS9rYLRNesw/rfeclSoEYssiEnyIKs9HGHuwU650aZ1Aeg7DxbEhM3ri2uPJkF4bYAp8pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741653633; c=relaxed/simple;
	bh=dyw753/H6BTUrRf3jQI1iojuAfN0WdNF+kraI3CjYVI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rFAMFdiHgeoRlIsXjUSOlHUWRr2nuWUrHSdcmgBIveSXoCu5anq9by/3pgucA75t4RcjBfG55eUkXbrZrH4hYHX0XdcuZDDexXE8xVIuws6JTEvf9sLL3UqW3VLa3+SmV8ZPD8y/Oss3eKSFUAFYJpLQOT2PsgykkFII4ogVhUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OeDT/I6I; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741653626;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nPFnFp1VkXPuK1wBnfwovz6gQVIIRqPSnwN9UsbsTOA=;
	b=OeDT/I6IhoEhZa5RmSa5zq19OSOVtSOTqKEeKud8LqC6eHU8BH8RnotD3J1BgXBNAHW+3x
	gOR7XqOH6iCuq+VtpsrBotGzjcOLnzTbRfWKmRawjpXBFSOK+LhQ0V+m0JjuVc2U+rR7lR
	0JikXVSrBYPVaJoyFUYJn1RXwhobx/U=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-299-m3cMLzJkM1mczJUYjAEvig-1; Mon, 10 Mar 2025 20:40:25 -0400
X-MC-Unique: m3cMLzJkM1mczJUYjAEvig-1
X-Mimecast-MFC-AGG-ID: m3cMLzJkM1mczJUYjAEvig_1741653624
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2ff581215a0so13731391a91.0
        for <linux-doc@vger.kernel.org>; Mon, 10 Mar 2025 17:40:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741653624; x=1742258424;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nPFnFp1VkXPuK1wBnfwovz6gQVIIRqPSnwN9UsbsTOA=;
        b=JlR/aewehgJ6wTMK3s3reSbizLo2mwwB+M+JtWm5aTv4hT8J+Ept8QMlp7x8HBcR6N
         RlUAaKeAlEDuHEPx06nrku78BuaV2cld9V5JgYQ2Zy0+qW/kcDmNfUBH+HsTt7ttE9GS
         /TVUB5cm/0jZpYU+TXiqPX+gEnqj8W1g7A+Ys5z2cI70kJy/X7CL7wzjv6G59AxAGiu9
         kjFJd8DrRtlnYdThJ1ZHYQwKt6jUhMc4iEJOEMANXKz9M5usOeJ0tRf1LIowPOPNRBui
         5WgwyO+jPPa9CH9YLkYys4Q6mjSXSBQXwWF4rIg/eY+UQGbInNr2+leTbVnHStqlzXbg
         xU7w==
X-Forwarded-Encrypted: i=1; AJvYcCUUKCWtnqm9UazHf7567IaLZ8KgTUQnYWtePxtTue/tIlQYwfaAuyOxNZlz4RXRrbKx8jgzQW9lRx8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHOtPqhzE+IJiUYvAb97eGgyzr4aQYcIFXd6o7Wf7UO01IteM9
	yrzhtqOE2e1qeWXexBN7BOvIufC8P69QnfAGsxEgmbpiuM5puqcrkPv1pP1C8UEjg0HOKT+EYR/
	RcnWGPVIbR76x6DwAohZQjGzzfNklmqM/RP5IELmICG2/ulk62Nf/UhJwm0Z2ChNxNqAaYru/GQ
	5mrwAhtwscG8AgvmX1DjXXNBj8g9l/DBCc
X-Gm-Gg: ASbGncvjOHv+duw+wFrjuHcihDqI/4q8ChwLWMFvMNHqrtBZzhNv/rzpNJTjDWjnU/B
	i29XbUY3RsxrIe/qpCZXnw0YDJa8gX4a+oR3zYDzgft73h4kz8Am7Rqyur1d2wmjpWGYMOQ==
X-Received: by 2002:a17:90b:4d8c:b0:2ee:b8ac:73b0 with SMTP id 98e67ed59e1d1-2ff7ce47c06mr25678688a91.2.1741653623969;
        Mon, 10 Mar 2025 17:40:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCTIxNW5KVnhioASoe6KuDcaNU+MoVXuWjH8X5aO/fiowwzFcttBDg5Qj2LCfTQUSRsi5colKFgqeeGjkAv4Y=
X-Received: by 2002:a17:90b:4d8c:b0:2ee:b8ac:73b0 with SMTP id
 98e67ed59e1d1-2ff7ce47c06mr25678644a91.2.1741653623483; Mon, 10 Mar 2025
 17:40:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250307-rss-v9-0-df76624025eb@daynix.com> <20250307-rss-v9-3-df76624025eb@daynix.com>
 <CACGkMEsNHba=PY5UQoH1zdGQRiHC8FugMG1nkXqOj1TBdOQrww@mail.gmail.com> <5d81246c-1e69-4301-ae6f-63838733672d@daynix.com>
In-Reply-To: <5d81246c-1e69-4301-ae6f-63838733672d@daynix.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 11 Mar 2025 08:40:11 +0800
X-Gm-Features: AQ5f1Jrq56wv3c7Sji25V2t3viqORzyfR5RJXtNkfnP10Huk8xi4r-Xv7AC1mUA
Message-ID: <CACGkMEv0ehQJPUzkJTkX0=bsSULdRdtgxOpjCJ+56Xh6RAQJYA@mail.gmail.com>
Subject: Re: [PATCH net-next v9 3/6] tun: Introduce virtio-net hash feature
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

On Mon, Mar 10, 2025 at 3:59=E2=80=AFPM Akihiko Odaki <akihiko.odaki@daynix=
.com> wrote:
>
> On 2025/03/10 12:55, Jason Wang wrote:
> > On Fri, Mar 7, 2025 at 7:01=E2=80=AFPM Akihiko Odaki <akihiko.odaki@day=
nix.com> wrote:
> >>
> >> Hash reporting
> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>
> >> Allow the guest to reuse the hash value to make receive steering
> >> consistent between the host and guest, and to save hash computation.
> >>
> >> RSS
> >> =3D=3D=3D
> >>
> >> RSS is a receive steering algorithm that can be negotiated to use with
> >> virtio_net. Conventionally the hash calculation was done by the VMM.
> >> However, computing the hash after the queue was chosen defeats the
> >> purpose of RSS.
> >>
> >> Another approach is to use eBPF steering program. This approach has
> >> another downside: it cannot report the calculated hash due to the
> >> restrictive nature of eBPF steering program.
> >>
> >> Introduce the code to perform RSS to the kernel in order to overcome
> >> thse challenges. An alternative solution is to extend the eBPF steerin=
g
> >> program so that it will be able to report to the userspace, but I didn=
't
> >> opt for it because extending the current mechanism of eBPF steering
> >> program as is because it relies on legacy context rewriting, and
> >> introducing kfunc-based eBPF will result in non-UAPI dependency while
> >> the other relevant virtualization APIs such as KVM and vhost_net are
> >> UAPIs.
> >>
> >> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> >> Tested-by: Lei Yang <leiyang@redhat.com>
> >> ---
> >>   Documentation/networking/tuntap.rst |   7 ++
> >>   drivers/net/Kconfig                 |   1 +
> >>   drivers/net/tap.c                   |  68 ++++++++++++++-
> >>   drivers/net/tun.c                   |  98 +++++++++++++++++-----
> >>   drivers/net/tun_vnet.h              | 159 ++++++++++++++++++++++++++=
++++++++--
> >>   include/linux/if_tap.h              |   2 +
> >>   include/linux/skbuff.h              |   3 +
> >>   include/uapi/linux/if_tun.h         |  75 +++++++++++++++++
> >>   net/core/skbuff.c                   |   4 +
> >>   9 files changed, 386 insertions(+), 31 deletions(-)
> >>
> >> diff --git a/Documentation/networking/tuntap.rst b/Documentation/netwo=
rking/tuntap.rst
> >> index 4d7087f727be5e37dfbf5066a9e9c872cc98898d..86b4ae8caa8ad062c1e558=
920be42ce0d4217465 100644
> >> --- a/Documentation/networking/tuntap.rst
> >> +++ b/Documentation/networking/tuntap.rst
> >> @@ -206,6 +206,13 @@ enable is true we enable it, otherwise we disable=
 it::
> >>         return ioctl(fd, TUNSETQUEUE, (void *)&ifr);
> >>     }
> >>

[...]

> >>
> >> diff --git a/drivers/net/tun_vnet.h b/drivers/net/tun_vnet.h
> >> index 58b9ac7a5fc4084c789fe94fe36b5f8631bf1fa4..8e7d51fb0b4742cef56e7c=
5ad778b156cc654bed 100644
> >> --- a/drivers/net/tun_vnet.h
> >> +++ b/drivers/net/tun_vnet.h
> >> @@ -6,6 +6,16 @@
> >>   #define TUN_VNET_LE     0x80000000
> >>   #define TUN_VNET_BE     0x40000000
> >>
> >> +typedef struct virtio_net_hash *(*tun_vnet_hash_add)(struct sk_buff *=
);
> >> +typedef const struct virtio_net_hash *(*tun_vnet_hash_find)(const str=
uct sk_buff *);
> >> +
> >> +struct tun_vnet_hash_container {
> >> +       struct tun_vnet_hash common;
> >
> > I'd rename this as hash.
>
> Everything in this structure is about hash. "common" represents its
> feature well.
>
> I see a few alternative options though I don't prefer them either; they
> make the code verbose and I don't think they are worthwhile:
> 1. Rename tun_vnet_hash to tun_vnet_hash_common.
> 2. Prefix the other fields with "hash_" for consistency.

Or use different structures, one for hash_report another is for rss.

>
> >
> >> +       struct tun_vnet_hash_rss rss;
> >> +       u32 rss_key[VIRTIO_NET_RSS_MAX_KEY_SIZE];
> >> +       u16 rss_indirection_table[];
> >> +};
> >
> > Besides the separated ioctl, I'd split this structure into rss and
> > hash part as well.

Like this.

Thanks


