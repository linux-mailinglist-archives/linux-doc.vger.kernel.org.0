Return-Path: <linux-doc+bounces-36219-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C21DA20241
	for <lists+linux-doc@lfdr.de>; Tue, 28 Jan 2025 01:07:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C8EB4165A27
	for <lists+linux-doc@lfdr.de>; Tue, 28 Jan 2025 00:07:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB89215C140;
	Tue, 28 Jan 2025 00:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="j3QyAzEY"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF56B2F4A
	for <linux-doc@vger.kernel.org>; Tue, 28 Jan 2025 00:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738022797; cv=none; b=JVKARv27OTF2MwmOk70Fv6BuYeuFzUKiA9dPe8+4PZMV3mD9l8+BbrbIdi89yDS1vXo32tT3ndCeW8+cwCBLDouBkP+BCLzi0d2mDybsQPA9/3m0uj72nCcxpM63D/oyuFIq0yjd2eEbVIR+iUZSSf3dmEfckcCbgEKPWQTEjQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738022797; c=relaxed/simple;
	bh=vIYGlQQLzAw46r0Z3bDzT2a7FcE9eES5fcBOVr9hdHg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rTG9HvJOeDUGj6Kt/ZDyNAzG8JYDOaysp2TPkZqX0LAJehLcOfkI/XBoq4iR9SY4kiyupaJeTf7y2dX0g7xnZtKhRaaoWMq8oJnBfBcu8MW4ynIOejPEoWzI8WCoLALi5jQk876EKxyHrxljsozwnKjBgZ//0UOPEy98DRtv/o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=j3QyAzEY; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-215740b7fb8so59275ad.0
        for <linux-doc@vger.kernel.org>; Mon, 27 Jan 2025 16:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738022795; x=1738627595; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GTwUA9HGZNHUf+5UwlxxWdcBSpL25QR1010NZd1Op4g=;
        b=j3QyAzEYHiXDCtJ/sK3ZIfjxcd/MCDLVElgd2dLDaptXArB0dPptI2JC3DNBQirRCo
         usu9FyVk/OgxzpI+Z79RpoANbbrn/4emDX5RrwdeFRjTiaDMj+lXcm9DF4So+Xnnk2Y6
         dKuc7yj5PhqRZIgFlgVp35YCwhfjC31IlCOHs9RKYlMCHf4E7Fiv3UQg4gJefpnyoF9u
         h/Ka2bxzzCLF8Vb06uLE9R/rvAgYSDa4codFyblpm3GAxPZbVVro9GaEtTPWUtjlA+gf
         qFEQERrQg1XqL1fREnbImlFyvObTXAu/eRlrGqSGBYDBCzv53r9npJW7BgvNMRoUwiJ7
         zKow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738022795; x=1738627595;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GTwUA9HGZNHUf+5UwlxxWdcBSpL25QR1010NZd1Op4g=;
        b=Z8cXaayLnZXd3URDNjDR/1JgdO++xq3sV8TmXnkdsnJOHG7gYFojvpRIPlHMdfb9Dq
         Pcy/Tbc3ffkDmzUEqSVg/3mJZdsCkNVfpmTpRi2mFsapXdrmh7CuWhNiS3o1v+86Uy2X
         YvTHpwGpj1dDvfTo6NMsnH68MyFXZhw0q6sfwxXRg3rBla6CgwoiansyNp1Fio45vsyE
         IZ8B9XfbIeG+V2RzNGloEd4fPZPhNgWXMJ0A/U7pmIommjAYX+t+lgc2/0zcoY88vO+e
         iyZhgAg4XM6PTxQDvZQFoO2omO3Rusb/25z1pPeHf1BTD9Jqi4xQfO/JXffiJDJOhLhL
         Ot0w==
X-Forwarded-Encrypted: i=1; AJvYcCXjXgKjE/TLdyob9w/KzefPTKdjuVLKpaH19yQ6aUrsGXOYdEaw9K9dJgEQgSac8kN8F8qP+q5svG4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMEocWuta+s6jf3aE2P/UpgMQyITIth0mOsMG62yNx0ifyUGni
	lkfCGHAsU3qRjWKOmmwUUn04FEbDI9autFTZI44XHBo+B0e2g2u1dzzsqu0m++fB57g7bZDT88r
	6hqtziP9IbpSQW3O5TfniLLTMiKm03uOGIAPr
X-Gm-Gg: ASbGncvUZKOm2K93W4PLl/gCfw3Xk2q/w/5FzGirLl2Rksao//hD378scgPeyZWpAvO
	wfrGxOV19ex7+PkpzvSw8h2W+s8Knt7+DZt7nXHPUzgdor8CWMk4kh9Rqw+edcNtXOIZgLxfpY1
	b5V+M8D7ztZEOYEYwa
X-Google-Smtp-Source: AGHT+IEWittEpcVawCqb4np7OonpS+GnwzcxguFzBAVLnrbtfgn1c98rhrepzx2DgXmMJ6SbfguY6ZjS+dEcRIpKwRw=
X-Received: by 2002:a17:903:2984:b0:21c:e45:338 with SMTP id
 d9443c01a7336-21dce200af0mr482205ad.1.1738022794647; Mon, 27 Jan 2025
 16:06:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241221004236.2629280-1-almasrymina@google.com>
 <20241221004236.2629280-6-almasrymina@google.com> <676dd022d1388_1d346b2947@willemb.c.googlers.com.notmuch>
In-Reply-To: <676dd022d1388_1d346b2947@willemb.c.googlers.com.notmuch>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 27 Jan 2025 16:06:21 -0800
X-Gm-Features: AWEUYZnxo-6ZVhmi6iBgygbjpRKTRKCgXG5DlMCN1ewQwSYGdgpaX28wNMX5igU
Message-ID: <CAHS8izNzbEi_Dn+hDohF9Go=et7kts-BnmEpq=Znpot7o7B5wA@mail.gmail.com>
Subject: Re: [PATCH RFC net-next v1 5/5] net: devmem: Implement TX path
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, virtualization@lists.linux.dev, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Donald Hunter <donald.hunter@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, David Ahern <dsahern@kernel.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Kaiyuan Zhang <kaiyuanz@google.com>, Pavel Begunkov <asml.silence@gmail.com>, 
	Willem de Bruijn <willemb@google.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Joe Damato <jdamato@fastly.com>, dw@davidwei.uk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Willem, sorry for the late reply, some holiday vacations and other
priorities pulled me away from this a bit. I'm getting ready to post
RFC V2, so answering some questions ahead of when I do that.

On Thu, Dec 26, 2024 at 1:52=E2=80=AFPM Willem de Bruijn
<willemdebruijn.kernel@gmail.com> wrote:
...
> > +static int zerocopy_fill_skb_from_devmem(struct sk_buff *skb,
> > +                                      struct msghdr *msg,
> > +                                      struct iov_iter *from, int lengt=
h)
> > +{
> > +     int i =3D skb_shinfo(skb)->nr_frags;
> > +     int orig_length =3D length;
> > +     netmem_ref netmem;
> > +     size_t size;
> > +
> > +     while (length && iov_iter_count(from)) {
> > +             if (i =3D=3D MAX_SKB_FRAGS)
> > +                     return -EMSGSIZE;
> > +
> > +             size =3D min_t(size_t, iter_iov_len(from), length);
> > +             if (!size)
> > +                     return -EFAULT;
>
> On error, should caller skb_zerocopy_iter_stream rewind from, rather
> than (or as well as) msg->msg_iter?

Ah, so this was confusing, because there were 2 iterators to keep
track off, (a) binding->tx_iter, which is `from` and (b)
msg->msg_iter.

Stan suggested removing binding->tx_iter entirely, so that we're back
to using only 1 iterator, which is msg->msg_iter. That does simplify
the code greatly, and I think addresses this comment as well, because
there will be no need to make sure from is advanced/reverted with
msg->msg_iter.

> > +
> > +             netmem =3D net_iov_to_netmem(iter_iov(from)->iov_base);
> > +             get_netmem(netmem);
> > +             skb_add_rx_frag_netmem(skb, i, netmem, from->iov_offset, =
size,
> > +                                    PAGE_SIZE);
> > +
> > +             iov_iter_advance(from, size);
> > +             length -=3D size;
> > +             i++;
> > +     }
> > +
> > +     iov_iter_advance(&msg->msg_iter, orig_length);
>
> What does this do if sendmsg is called with NULL as buffer?

So even if iov_base =3D=3D NULL, the iterator is created anyhow. The
iterator will be from addresses 0 -> iov_len.

In the next iteration, I've applied Stan's suggestion to use iov_base
as the offset into the dma-buf to send from. I think it ends up being
a much cleaner UAPI, but let me know what you think.

...

> >  struct net_iov *
> >  net_devmem_alloc_dmabuf(struct net_devmem_dmabuf_binding *binding)
> > @@ -109,6 +112,13 @@ void net_devmem_unbind_dmabuf(struct net_devmem_dm=
abuf_binding *binding)
> >       unsigned long xa_idx;
> >       unsigned int rxq_idx;
> >
> > +     xa_erase(&net_devmem_dmabuf_bindings, binding->id);
> > +
> > +     /* Ensure no tx net_devmem_lookup_dmabuf() are in flight after th=
e
> > +      * erase.
> > +      */
> > +     synchronize_net();
> > +
>
> What precisely does this protect?
>
> synchronize_net() ensures no packet is in flight inside an rcu
> readside section. But a packet can still be in flight, such as posted
> to the device or queued in a qdisc.
>

The TX data path does a net_devmem_lookup_dmabuf() to lookup the
dmabuf_id provided by the user.

But that dmabuf_id may be unbind'd via net_devmem_unbind_dmabuf () by
the user at any time, so some synchronization is needed to make sure
we don't do a send from a dmabuf that is being freed in another
thread.

The synchronization in this patch is such that the lookup path obtains
a reference under rcu lock, and the unbind control path makes sure to
wait a full RCU grace period before dropping reference via
net_devmem_dmabuf_binding_put(). net_devmem_dmabuf_binding_put() will
trigger freeing the binding if the refcount hits zero.

...

> > +struct net_devmem_dmabuf_binding *
> > +net_devmem_get_sockc_binding(struct sock *sk, struct sockcm_cookie *so=
ckc)
> > +{
> > +     struct net_devmem_dmabuf_binding *binding;
> > +     int err =3D 0;
> > +
> > +     binding =3D net_devmem_lookup_dmabuf(sockc->dmabuf_id);
>
> This lookup is from global xarray net_devmem_dmabuf_bindings.
>
> Is there a check that the socket is sending out through the device
> to which this dmabuf was bound with netlink? Should there be?
> (e.g., SO_BINDTODEVICE).
>

Yes, I think it may be an issue if the user triggers a send from a
different netdevice, because indeed when we bind a dmabuf we bind it
to a specific netdevice.

One option is as you say to require TX sockets to be bound and to
check that we're bound to the correct netdev. I also wonder if I can
make this work without SO_BINDTODEVICE, by querying the netdev the
sock is currently trying to send out on and doing a check in the
tcp_sendmsg. I'm not sure if this is possible but I'll give it a look.

--
Thanks,
Mina

