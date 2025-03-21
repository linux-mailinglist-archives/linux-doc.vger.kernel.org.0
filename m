Return-Path: <linux-doc+bounces-41564-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0EBA6C5C2
	for <lists+linux-doc@lfdr.de>; Fri, 21 Mar 2025 23:18:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2DA831B62397
	for <lists+linux-doc@lfdr.de>; Fri, 21 Mar 2025 22:16:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 634E223536E;
	Fri, 21 Mar 2025 22:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yGwrJnrw"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A070723497B
	for <linux-doc@vger.kernel.org>; Fri, 21 Mar 2025 22:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742595330; cv=none; b=Z0ASLNQnrweHlC85hOcl8x3XVNOlsYIttHhf23ov8LvHUEXzZ2++4qkBoXJWvw9TDxWGyRD3UGgK/9C5FVMp6kouTnVlrbaJxBqua9ZS76BWfdvIQnxZOcq0v7Igwvd686aSYTeUufiZM5lSb0gpx44lrWBPDiXIc8p9NIp6oIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742595330; c=relaxed/simple;
	bh=BCN5JQqGHPfZWzsKH88CAQez5y3gRKn+dXSiBfdgsw0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f8nWP/pnvLj4fnc0+F0GTWbCYTu2AguMZzX7gi/2rTx9zleavP24X7YJQs7jFBi7DuSqzDo7J5h5jTIiuJvbuMLbP4eaW5gINRyiUnY1WBOyU98d6ZXQ1cX29kpVg9Dr/6BQaCEhjiSfnpUh4o22v3oPoKkRKfecQqP4ecYGyC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yGwrJnrw; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2264c9d0295so67925ad.0
        for <linux-doc@vger.kernel.org>; Fri, 21 Mar 2025 15:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742595328; x=1743200128; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hz7SI+MRITJdDDcuu+iapQr7TxDqFp3vr+TXoSWWGCE=;
        b=yGwrJnrws2TIW3WCiFSxSiW6Pn6RwuwNoYEqwQcBBG7kAkt4qFmivjkPzEJH4wleZX
         ByZdWBJw30nvL0XpIOT0XM7P52U6W286S2YiIQX/PvQcvcu3XcNZIGbQx3Bkb55iTHX3
         MQbnzR9JR6Shu6TQTJmhoRbby1Z8QLNUQg0tGT2Zz3qIfyIt899AEde6OkJJ1Q081c2B
         hl1vHRnjZV57Qy9/yQFUdMDKD8/QqJw7+NHfOgI0ly/jeQ9uOs8j2dBqDk64N9Fs/SHe
         +6Z5NgcgvfZ9Qq4Rbad/h1qAETS9vCDuvE4t8x0kDJu6cnn/Io3SBNFIV/VOBWThm52z
         1JIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742595328; x=1743200128;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hz7SI+MRITJdDDcuu+iapQr7TxDqFp3vr+TXoSWWGCE=;
        b=jy+Mx0UkqqKh67UkL3Dzc2OxCwlQ4W5pOdHNLsHqNtH7d5OMntL4PV9Rvp+///Paee
         Q6IsJiXZUcy51ixnlSQ8hr08ekSjGATybv6Hp8G65VtnEe8Jac/nOFhcnGyba/pVJiK2
         GkRCmi5MVc8VfuVdoAxzYQtvdsxMq5qKarnq8Kfc0pRfab6NT/eZbDXmsb979bJ+A9QK
         j8/rZkrz5/JeVLSb1yupTZrox0yepdCeNTKmiiXFtiUAs9wdWWBFalHskrdGXybj7kWF
         Lxd9q/0IyRazYXrkRx92O2W2ntZ+dt3mJ4aY83wQmzevBMTmi1q80AaZNwF8HweYoyW4
         SaHw==
X-Forwarded-Encrypted: i=1; AJvYcCVI7+uAJYxRffHYnLg+FmrzQ9FWRG/jKQp2ukd5AE3A9riRS++OeFtyFjqg95ZUm2hOJyrRHe7YaAE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yymzs9G/k95v3glx9OarbBGZ6O1FAo5uSXegjifaabQ8Y6GK2Sx
	N/HjaRoTFlWDJPbnwt1hTk77zuXHSQsQBZOyojYd78Fkskmbk/645ZzyMsOWBKRqJEkIPE8MdDY
	sE65Pb9X5pAPDsju95OHlw3wHcNhLSa3BUahk
X-Gm-Gg: ASbGncvVPALfmlCoL0APoV82W6kCwL8UsMP2NQsxx4HztgBEx7ChojlQyvLieck/6ht
	cME5atpbb3j7XkGp2+M98cX2dsy8OVJvi/BcMLdQJAsH2GPFYTV/HxZjgtXtnm/JFxJx97/M4KB
	9NxRvvjm9UO1Jj8St7VQcUp8WpfVTkUY6S66IiyOD/sAbO0G5F9z08CmM=
X-Google-Smtp-Source: AGHT+IGBoa3JmICUjXYWbIuZG1QnxGwt2v2Pxt/ddhpOPWc2le0JOM4R9EEoSgO2H5EsypXp8nLSfXGBeIbvxdvRzAY=
X-Received: by 2002:a17:902:d4cf:b0:215:f0c6:4dbf with SMTP id
 d9443c01a7336-227982bd0e7mr778235ad.14.1742595327611; Fri, 21 Mar 2025
 15:15:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250308214045.1160445-1-almasrymina@google.com>
 <20250308214045.1160445-5-almasrymina@google.com> <5de5943b-5527-49f6-a454-b3c7358cff56@redhat.com>
In-Reply-To: <5de5943b-5527-49f6-a454-b3c7358cff56@redhat.com>
From: Mina Almasry <almasrymina@google.com>
Date: Fri, 21 Mar 2025 15:15:14 -0700
X-Gm-Features: AQ5f1Jp_bSaJYceldtfK0dIdQEXx63Idm2vF7CtmSVJ_E1ycJl8iObtXRhrS3vg
Message-ID: <CAHS8izNfyfVhMj0wBvP0qa=7E4xL+eo9wn_Fi4o2PT8piwACWA@mail.gmail.com>
Subject: Re: [PATCH net-next v7 4/9] net: devmem: Implement TX path
To: Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, kvm@vger.kernel.org, 
	virtualization@lists.linux.dev, linux-kselftest@vger.kernel.org, 
	Kuniyuki Iwashima <kuniyu@amazon.com>, Donald Hunter <donald.hunter@gmail.com>, 
	Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Jeroen de Borst <jeroendb@google.com>, 
	Harshitha Ramamurthy <hramamurthy@google.com>, Willem de Bruijn <willemb@google.com>, 
	David Ahern <dsahern@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, sdf@fomichev.me, asml.silence@gmail.com, dw@davidwei.uk, 
	Jamal Hadi Salim <jhs@mojatatu.com>, Victor Nogueira <victor@mojatatu.com>, 
	Pedro Tammela <pctammela@mojatatu.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Kaiyuan Zhang <kaiyuanz@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 18, 2025 at 1:53=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> Adding Kuniyuki.
>
> On 3/8/25 10:40 PM, Mina Almasry wrote:
> > @@ -931,10 +932,67 @@ int netdev_nl_bind_rx_doit(struct sk_buff *skb, s=
truct genl_info *info)
> >       return err;
> >  }
> >
> > -/* stub */
> >  int netdev_nl_bind_tx_doit(struct sk_buff *skb, struct genl_info *info=
)
> >  {
> > -     return 0;
> > +     struct net_devmem_dmabuf_binding *binding;
> > +     struct list_head *sock_binding_list;
> > +     struct net_device *netdev;
> > +     u32 ifindex, dmabuf_fd;
> > +     struct sk_buff *rsp;
> > +     int err =3D 0;
> > +     void *hdr;
> > +
> > +     if (GENL_REQ_ATTR_CHECK(info, NETDEV_A_DEV_IFINDEX) ||
> > +         GENL_REQ_ATTR_CHECK(info, NETDEV_A_DMABUF_FD))
> > +             return -EINVAL;
> > +
> > +     ifindex =3D nla_get_u32(info->attrs[NETDEV_A_DEV_IFINDEX]);
> > +     dmabuf_fd =3D nla_get_u32(info->attrs[NETDEV_A_DMABUF_FD]);
> > +
> > +     sock_binding_list =3D genl_sk_priv_get(&netdev_nl_family,
> > +                                          NETLINK_CB(skb).sk);
> > +     if (IS_ERR(sock_binding_list))
> > +             return PTR_ERR(sock_binding_list);
> > +
> > +     rsp =3D genlmsg_new(GENLMSG_DEFAULT_SIZE, GFP_KERNEL);
> > +     if (!rsp)
> > +             return -ENOMEM;
> > +
> > +     hdr =3D genlmsg_iput(rsp, info);
> > +     if (!hdr) {
> > +             err =3D -EMSGSIZE;
> > +             goto err_genlmsg_free;
> > +     }
> > +
> > +     rtnl_lock();
>
> The above could possibly be a rtnl_net_lock(), right?
>
> (not strictily related to this series) The same for the existing
> rtnl_lock() call in netdev-genl.c, right?
>

Actually I think this can follow the example set in commit
1d22d3060b9b ("net: drop rtnl_lock for queue_mgmt operations") and
take the netdev_get_by_index_lock().


--=20
Thanks,
Mina

