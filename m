Return-Path: <linux-doc+bounces-37679-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 82790A2FB75
	for <lists+linux-doc@lfdr.de>; Mon, 10 Feb 2025 22:10:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4BA063A346B
	for <lists+linux-doc@lfdr.de>; Mon, 10 Feb 2025 21:10:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91DC524C671;
	Mon, 10 Feb 2025 21:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HYcKkZRy"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E876D1F754E
	for <linux-doc@vger.kernel.org>; Mon, 10 Feb 2025 21:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739221805; cv=none; b=dlRX9qdrrKuRn39V8VIlFaGNMh3WRxACGjOTy3GEZaALWVBVi0zOEriVxXvVUgzLtxfBJ81Xji8JnVphSxJ/NMuG9B8vAewgKk0FUExNCFPj2XmsnXGIErWPs0CZ1IWWmTi+sAjOltpm5Wr3bTGyX5Uy+A5IdsNJnkToVkS40XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739221805; c=relaxed/simple;
	bh=KJLfGH4r6zCwTj9etgMAbr9xZH0AFU/ISuULlewI/hw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nMLYbUzZgiyw4taT44fzzJQAGfYv0hJ2KuoH+p+K+wmYwy3Vgb6DRyI7Ef8D7qKFBeHVZnYwdTlj7NvjRh/xzbh2GQTwRPefKeTFKNFN3wYEIViAB4JOnp6yC2j9Pyz/DDV/+LV92Py2UUFbMep+/6kiWU9Gjj2xCCAlnNOGkkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HYcKkZRy; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-21f032484d4so40405ad.0
        for <linux-doc@vger.kernel.org>; Mon, 10 Feb 2025 13:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739221803; x=1739826603; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BpOwhdLpPNB8gZcJrWR5hgdVmgWAHMy1UaC6q1qkDqE=;
        b=HYcKkZRyQNKbVx5G/iwtKV89LIVijVFII4qPK0wy3zDORkhMDGygEqD/YBhOAtvnT1
         GV/kjK1wIsO2P8sPSY4FJwAqMDBjJ4LG08ZeLL+DUdaigstRLaqUHcHQIeJxlatAaK4L
         sQER6fsn69HGUfKskHN/i2ouFn4yneqyRN5j5hhe2qI1D6s7vWClVEnV/Wso/TMcUGuL
         Jk/w7JmDavqm+0HL9Ci19TTMwchyO1QmkpLP3yMFGlXKNWyzwj3x9/PB4gUJt6vODNuM
         GzaubUQQEcQRZz6Fnog04MpnrpH24dPINOl/v6dt40MLih8J7dLPTmNwNNexHNXtSBuo
         O3IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739221803; x=1739826603;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BpOwhdLpPNB8gZcJrWR5hgdVmgWAHMy1UaC6q1qkDqE=;
        b=a8nFibAHwy0kDCXTJiO8R8wSzlWg2iVCIKMK8t6iTxaaFzlErTLc9bQTI6T0Z04QfP
         smSycxfqR4z/A7D0plVzvYVzjMmwY/cCEP7ChPBoJPjncwwvWEBHZoXunNQp9XwzswT2
         tGavAqdzwP+aUKzcLMmkzOikZ5REw1YsVKBdDBNTKleE6OQfkiEm52KgSyAavjZEffBA
         6lVUTvgMYgsRrRCaf2cwIcnjG3etjWXewOJpPrc6Tu0N8kCXBOucBmq/j5rvF/yDldQa
         WsZx1tgU30R/im1oiu30UvpLEQ3WxQbifutk7t3eP7GqpZtlE2ooZmr6aqo5P85JmuKM
         4oHw==
X-Forwarded-Encrypted: i=1; AJvYcCWRjlXsPUdvixEV7GL7MuoHPbdGJx3hNXV4RiiiXKOg9EVnjNWC7WHuBIot8WUz+JunFSQSMfaG6Ks=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5px8CJp5avFx+m380+rCvmAQxIi7QHokjxic3AqV0Oy+G7E63
	gdYyO1gnYBIoaIbDWNrm2zpSa1IGJm5sdT+ixP+LXAaAAF7x7qF7YFci7ROjuGc6cAn7UHQzLl4
	4LZcBuW0bKmGnb+sZJaYVAdYka1F9C0URfWBE
X-Gm-Gg: ASbGnctryta7TWzMFNpWnK2LUNs+mFdcVlEGoXZ7uvrqTyBxhAO/oB4N38+Nma9WwRY
	oHgM3C8UxaIMnq9iKA7TF0s5xo96HBa2dZFwdTJ5Lyattrw2pzR/iO4hUPvcAyZdP9f7aaRs6
X-Google-Smtp-Source: AGHT+IHi+uVLv++ClIB5TNGxSvvd8P8hJcj6QNPCjz84MeycHAppY5tmh3RbNn2a2dnjMuITjeslPW3wgJ9FwpR0OB4=
X-Received: by 2002:a17:902:7c8a:b0:21f:631c:7fc9 with SMTP id
 d9443c01a7336-21fb80c64a8mr630465ad.0.1739221802714; Mon, 10 Feb 2025
 13:10:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203223916.1064540-1-almasrymina@google.com>
 <20250203223916.1064540-6-almasrymina@google.com> <abc22620-d509-4b12-80ac-0c36b08b36d9@gmail.com>
In-Reply-To: <abc22620-d509-4b12-80ac-0c36b08b36d9@gmail.com>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 10 Feb 2025 13:09:50 -0800
X-Gm-Features: AWEUYZlmH-9dq3h0n7ypL1723AKovUOyGvCt-k8ZJ20f-dbsLO-5Bruftf8RSss
Message-ID: <CAHS8izNOqaFe_40gFh09vdBz6-deWdeGu9Aky-e7E+Wu2qtfdw@mail.gmail.com>
Subject: Re: [PATCH net-next v3 5/6] net: devmem: Implement TX path
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, kvm@vger.kernel.org, 
	virtualization@lists.linux.dev, linux-kselftest@vger.kernel.org, 
	Donald Hunter <donald.hunter@gmail.com>, Jakub Kicinski <kuba@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Neal Cardwell <ncardwell@google.com>, 
	David Ahern <dsahern@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	sdf@fomichev.me, dw@davidwei.uk, Jamal Hadi Salim <jhs@mojatatu.com>, 
	Victor Nogueira <victor@mojatatu.com>, Pedro Tammela <pctammela@mojatatu.com>, 
	Samiullah Khawaja <skhawaja@google.com>, Kaiyuan Zhang <kaiyuanz@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 5, 2025 at 4:20=E2=80=AFAM Pavel Begunkov <asml.silence@gmail.c=
om> wrote:
>
> On 2/3/25 22:39, Mina Almasry wrote:
> ...
> > diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
> > index bb2b751d274a..3ff8f568c382 100644
> > --- a/include/linux/skbuff.h
> > +++ b/include/linux/skbuff.h
> > @@ -1711,9 +1711,12 @@ struct ubuf_info *msg_zerocopy_realloc(struct so=
ck *sk, size_t size,
> ...
> >   int zerocopy_fill_skb_from_iter(struct sk_buff *skb,
> >                               struct iov_iter *from, size_t length);
> > @@ -1721,12 +1724,14 @@ int zerocopy_fill_skb_from_iter(struct sk_buff =
*skb,
> >   static inline int skb_zerocopy_iter_dgram(struct sk_buff *skb,
> >                                         struct msghdr *msg, int len)
> >   {
> > -     return __zerocopy_sg_from_iter(msg, skb->sk, skb, &msg->msg_iter,=
 len);
> > +     return __zerocopy_sg_from_iter(msg, skb->sk, skb, &msg->msg_iter,=
 len,
> > +                                    NULL);
>
> Instead of propagating it all the way down and carving a new path, why
> not reuse the existing infra? You already hook into where ubuf is
> allocated, you can stash the binding in there. And

It looks like it's not possible to increase the side of ubuf_info at
all, otherwise the BUILD_BUG_ON in msg_zerocopy_alloc() fires.

It's asserting that sizeof(ubuf_info_msgzc) <=3D sizeof(skb->cb), and
I'm guessing increasing skb->cb size is not really the way to go.

What I may be able to do here is stash the binding somewhere in
ubuf_info_msgzc via union with fields we don't need for devmem, and/or
stashing the binding in ubuf_info_ops (very hacky). Neither approach
seems ideal, but the former may work and may be cleaner.

I'll take a deeper look here. I had looked before and concluded that
we're piggybacking devmem TX on MSG_ZEROCOPY path, because we need
almost all of the functionality there (no copying, send complete
notifications, etc), with one minor change in the skb filling. I had
concluded that if MSG_ZEROCOPY was never updated to use the existing
infra, then it's appropriate for devmem TX piggybacking on top of it
to follow that. I would not want to get into a refactor of
MSG_ZEROCOPY for no real reason.

But I'll take a deeper look here and see if I can make something
slightly cleaner work.

> zerocopy_fill_skb_from_devmem can implement ->sg_from_iter,
> see __zerocopy_sg_from_iter().
>
> ...
> > diff --git a/net/core/datagram.c b/net/core/datagram.c
> > index f0693707aece..c989606ff58d 100644
> > --- a/net/core/datagram.c
> > +++ b/net/core/datagram.c
> > @@ -63,6 +63,8 @@
> > +static int
> > +zerocopy_fill_skb_from_devmem(struct sk_buff *skb, struct iov_iter *fr=
om,
> > +                           int length,
> > +                           struct net_devmem_dmabuf_binding *binding)
> > +{
> > +     int i =3D skb_shinfo(skb)->nr_frags;
> > +     size_t virt_addr, size, off;
> > +     struct net_iov *niov;
> > +
> > +     while (length && iov_iter_count(from)) {
> > +             if (i =3D=3D MAX_SKB_FRAGS)
> > +                     return -EMSGSIZE;
> > +
> > +             virt_addr =3D (size_t)iter_iov_addr(from);
>
> Unless I missed it somewhere it needs to check that the iter
> is iovec based.
>

How do we end up here with an iterator that is not iovec based? Is the
user able to trigger that somehow and I missed it?

--=20
Thanks,
Mina

