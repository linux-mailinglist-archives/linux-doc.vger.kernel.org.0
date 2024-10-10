Return-Path: <linux-doc+bounces-27028-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 257EC997BC0
	for <lists+linux-doc@lfdr.de>; Thu, 10 Oct 2024 06:21:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9BDE0285A62
	for <lists+linux-doc@lfdr.de>; Thu, 10 Oct 2024 04:21:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C51919D8BC;
	Thu, 10 Oct 2024 04:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="h73FDZI8"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E3B820334
	for <linux-doc@vger.kernel.org>; Thu, 10 Oct 2024 04:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728534072; cv=none; b=NtXw8A7ysho5VRkc7DyhBcXJBtJ3/ajDVQKXNLM5Yegkxxuy/1u8s8XWy6JEzQ9TI3G73LxGWirvZffm5fduqwHw0ImpCLy6y/vu0Z5hIt1kHmwJmVEzuUUuDU4CvCy3IfaF1c9AqU5I4gD66yJZv0gNzltBkXfTwnY9MfsRn+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728534072; c=relaxed/simple;
	bh=bPEY407b1mxDInoX7xZ2kjMSardJMi/Qo0GVtu1QSqA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uYxOmxZijy1j4nSEsR4ct6L28BqwLzJec6Zppi0IzS3tOZ9gKWjeO25ULYlgrPZjA9x8OOteOIFuhV2B61v/GRuztnb2T44OWvc/6xBR0Ljhd94WdlqVJEjxskZx6WdeWX3+ZvNmVvP3ZJ12X/3dmosKSt4K7QVDEC9P91fSn7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=h73FDZI8; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5c8967dd2c7so535537a12.1
        for <linux-doc@vger.kernel.org>; Wed, 09 Oct 2024 21:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728534069; x=1729138869; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uBnxQhZMdJCucTfdJwBzEhkfmmeJb+9H/zZTu+WT3LU=;
        b=h73FDZI85UboFhitzqOVQ7K9GUGF12iNQjXmhKkOjM4sBa98JtxoReTjLuqrzqO7yw
         0OxuYmAlWlsus6ktLJYVG+apFnzPhzgrTla41U6y9M+JTmg4KLZ+/vOiSCRSSihMPcO2
         +MBGTnv3QslSv0UTfIjYPcSnnh5sr5awmW8tzyLZAxlbQv//agCReYoeBdWbXN6dSpyB
         hI46WlBeQ/gyP3stEpCn3o82FoojVjZOH7EbuCB5mQwOVKkDimj6uHBwLet88178BSCE
         7e66aCG6RMAUnGQ8OVQm3SpQZd9h5stwPP7XiKzi5bqQ0trK2mq70B4kQrMnLlTWTPaw
         cOGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728534069; x=1729138869;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uBnxQhZMdJCucTfdJwBzEhkfmmeJb+9H/zZTu+WT3LU=;
        b=rUizMsZByvWS3yeiv7lUIU5UOEpMNxt2ffKTa/g2CYFWYJ1Hp1uO126oUQ05Lhkxuq
         XZPcm22+py3nrqAOySa4Odfv5cI6GAV51rstoqsmxfgvdVAlRhPZWKIIigw4hvXn+xYr
         h7715z+1HfLUsODp0LmU5TyCGoRUvFR8Ex1vUZ6roRml8dnj838KMzIkkZFdgBcJM7wH
         TNuEuhqIEJmffMyULw1/L99uxpxTX8CIMvfzn5mpQGYhVtJowvXsQKEVx4jlrKZmzRfC
         dTOVfEx/NAPqXBb4OVIwKgy53Bg9bgzteb3I2hwn4Izc5ZP8ycUn/uPcQJ7Nepb1+rw6
         upjQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5+yjTGBv7GCGSE7fdrIWXKk3DzHksgDjJSF4Bhcfs0pIbWiLMpvAfiQpNvAo/n3A/f+fCvvoBHf8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxnXH6Rrk8qdbRvoVF8TRNT8bP3HwCf55etRoKp23LuMA4TdJ5
	8j5M2/SQrb4SXivgbuK6+ktbO0sPkfU1OIJd/ZoJmeZIjluTcbsufFbwBpziJoMhBG2I/VX2d3P
	5k23i6ECEydaQTibPjVQ8MlybbyjJCsEd2GCE
X-Google-Smtp-Source: AGHT+IHTSg4j1DAEQNe89B9nEE0IWfnxBpuKfKV7CzxjHLtLxpkWkjce0nZGVNvYmtnMLjOJ8ReIDN4AoXvY55N/KbE=
X-Received: by 2002:a05:6402:2713:b0:5c9:89f:9a with SMTP id
 4fb4d7f45d1cf-5c91d689be7mr3247885a12.32.1728534068353; Wed, 09 Oct 2024
 21:21:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241009005525.13651-1-jdamato@fastly.com> <20241009005525.13651-6-jdamato@fastly.com>
In-Reply-To: <20241009005525.13651-6-jdamato@fastly.com>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 10 Oct 2024 06:20:57 +0200
Message-ID: <CANn89iKytfwyax_d+7U8Xw-Wvj5z1d7xoi4LNhmUQphDiborDQ@mail.gmail.com>
Subject: Re: [net-next v5 5/9] net: napi: Add napi_config
To: Joe Damato <jdamato@fastly.com>
Cc: netdev@vger.kernel.org, mkarsten@uwaterloo.ca, skhawaja@google.com, 
	sdf@fomichev.me, bjorn@rivosinc.com, amritha.nambiar@intel.com, 
	sridhar.samudrala@intel.com, willemdebruijn.kernel@gmail.com, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Jiri Pirko <jiri@resnulli.us>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Kory Maincent <kory.maincent@bootlin.com>, Johannes Berg <johannes.berg@intel.com>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 9, 2024 at 2:56=E2=80=AFAM Joe Damato <jdamato@fastly.com> wrot=
e:
>
> Add a persistent NAPI config area for NAPI configuration to the core.
> Drivers opt-in to setting the persistent config for a NAPI by passing an
> index when calling netif_napi_add_config.
>
> napi_config is allocated in alloc_netdev_mqs, freed in free_netdev
> (after the NAPIs are deleted).
>
> Drivers which call netif_napi_add_config will have persistent per-NAPI
> settings: NAPI IDs, gro_flush_timeout, and defer_hard_irq settings.
>
> Per-NAPI settings are saved in napi_disable and restored in napi_enable.
>
> Co-developed-by: Martin Karsten <mkarsten@uwaterloo.ca>
> Signed-off-by: Martin Karsten <mkarsten@uwaterloo.ca>
> Signed-off-by: Joe Damato <jdamato@fastly.com>
> ---
>  .../networking/net_cachelines/net_device.rst  |  1 +
>  include/linux/netdevice.h                     | 36 ++++++++-
>  net/core/dev.c                                | 79 +++++++++++++++++--
>  net/core/dev.h                                | 12 +++
>  4 files changed, 118 insertions(+), 10 deletions(-)
>
> diff --git a/Documentation/networking/net_cachelines/net_device.rst b/Doc=
umentation/networking/net_cachelines/net_device.rst
> index 3ab663b6cf16..9d86720cb722 100644
> --- a/Documentation/networking/net_cachelines/net_device.rst
> +++ b/Documentation/networking/net_cachelines/net_device.rst
> @@ -183,5 +183,6 @@ struct_dpll_pin*                    dpll_pin
>  struct hlist_head                   page_pools
>  struct dim_irq_moder*               irq_moder
>  u64                                 max_pacing_offload_horizon
> +struct_napi_config*                 napi_config
>  unsigned_long                       gro_flush_timeout
>  u32                                 napi_defer_hard_irqs
> diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
> index 4239a4a9d295..b65a901ab4e7 100644
> --- a/include/linux/netdevice.h
> +++ b/include/linux/netdevice.h
> @@ -342,6 +342,15 @@ struct gro_list {
>   */
>  #define GRO_HASH_BUCKETS       8
>
> +/*
> + * Structure for per-NAPI config
> + */
> +struct napi_config {
> +       u64 gro_flush_timeout;
> +       u32 defer_hard_irqs;
> +       unsigned int napi_id;
> +};
> +
>  /*
>   * Structure for NAPI scheduling similar to tasklet but with weighting
>   */
> @@ -379,6 +388,8 @@ struct napi_struct {
>         struct list_head        dev_list;
>         struct hlist_node       napi_hash_node;
>         int                     irq;
> +       int                     index;
> +       struct napi_config      *config;
>  };
>
>  enum {
> @@ -1860,9 +1871,6 @@ enum netdev_reg_state {
>   *                             allocated at register_netdev() time
>   *     @real_num_rx_queues:    Number of RX queues currently active in d=
evice
>   *     @xdp_prog:              XDP sockets filter program pointer
> - *     @gro_flush_timeout:     timeout for GRO layer in NAPI
> - *     @napi_defer_hard_irqs:  If not zero, provides a counter that woul=
d
> - *                             allow to avoid NIC hard IRQ, on busy queu=
es.
>   *
>   *     @rx_handler:            handler for received packets
>   *     @rx_handler_data:       XXX: need comments on this one
> @@ -2012,6 +2020,11 @@ enum netdev_reg_state {
>   *                where the clock is recovered.
>   *
>   *     @max_pacing_offload_horizon: max EDT offload horizon in nsec.
> + *     @napi_config: An array of napi_config structures containing per-N=
API
> + *                   settings.
> + *     @gro_flush_timeout:     timeout for GRO layer in NAPI
> + *     @napi_defer_hard_irqs:  If not zero, provides a counter that woul=
d
> + *                             allow to avoid NIC hard IRQ, on busy queu=
es.
>   *
>   *     FIXME: cleanup struct net_device such that network protocol info
>   *     moves out.
> @@ -2405,6 +2418,7 @@ struct net_device {
>         struct dim_irq_moder    *irq_moder;
>
>         u64                     max_pacing_offload_horizon;
> +       struct napi_config      *napi_config;
>         unsigned long           gro_flush_timeout;
>         u32                     napi_defer_hard_irqs;
>
> @@ -2657,6 +2671,22 @@ netif_napi_add_tx_weight(struct net_device *dev,
>         netif_napi_add_weight(dev, napi, poll, weight);
>  }
>
> +/**
> + * netif_napi_add_config - initialize a NAPI context with persistent con=
fig
> + * @dev: network device
> + * @napi: NAPI context
> + * @poll: polling function
> + * @index: the NAPI index
> + */
> +static inline void
> +netif_napi_add_config(struct net_device *dev, struct napi_struct *napi,
> +                     int (*poll)(struct napi_struct *, int), int index)
> +{
> +       napi->index =3D index;
> +       napi->config =3D &dev->napi_config[index];
> +       netif_napi_add_weight(dev, napi, poll, NAPI_POLL_WEIGHT);
> +}
> +
>  /**
>   * netif_napi_add_tx() - initialize a NAPI context to be used for Tx onl=
y
>   * @dev:  network device
> diff --git a/net/core/dev.c b/net/core/dev.c
> index fca2295f4d95..bd87232f7b37 100644
> --- a/net/core/dev.c
> +++ b/net/core/dev.c
> @@ -6503,6 +6503,22 @@ EXPORT_SYMBOL(napi_busy_loop);
>
>  #endif /* CONFIG_NET_RX_BUSY_POLL */
>
> +static void __napi_hash_add_with_id(struct napi_struct *napi,
> +                                   unsigned int napi_id)
> +{
> +       napi->napi_id =3D napi_id;
> +       hlist_add_head_rcu(&napi->napi_hash_node,
> +                          &napi_hash[napi->napi_id % HASH_SIZE(napi_hash=
)]);
> +}
> +
> +static void napi_hash_add_with_id(struct napi_struct *napi,
> +                                 unsigned int napi_id)
> +{
> +       spin_lock(&napi_hash_lock);
> +       __napi_hash_add_with_id(napi, napi_id);

Hmmm... there is no check if 'napi_id' is already used and hashed.

I would add

WARN_ON_ONCE(napi_by_id(napi_id));

> +       spin_unlock(&napi_hash_lock);
> +}
> +
>  static void napi_hash_add(struct napi_struct *napi)
>  {
>         if (test_bit(NAPI_STATE_NO_BUSY_POLL, &napi->state))
> @@ -6515,10 +6531,8 @@ static void napi_hash_add(struct napi_struct *napi=
)
>                 if (unlikely(++napi_gen_id < MIN_NAPI_ID))
>                         napi_gen_id =3D MIN_NAPI_ID;
>         } while (napi_by_id(napi_gen_id));
> -       napi->napi_id =3D napi_gen_id;
>
> -       hlist_add_head_rcu(&napi->napi_hash_node,
> -                          &napi_hash[napi->napi_id % HASH_SIZE(napi_hash=
)]);
> +       __napi_hash_add_with_id(napi, napi_gen_id);
>
>         spin_unlock(&napi_hash_lock);
>  }
>

