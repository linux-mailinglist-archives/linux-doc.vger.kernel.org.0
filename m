Return-Path: <linux-doc+bounces-11497-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 546D687294D
	for <lists+linux-doc@lfdr.de>; Tue,  5 Mar 2024 22:19:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D229DB2D4F4
	for <lists+linux-doc@lfdr.de>; Tue,  5 Mar 2024 21:17:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF22912C808;
	Tue,  5 Mar 2024 21:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="f+zkeIIL"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF47612BE8F
	for <linux-doc@vger.kernel.org>; Tue,  5 Mar 2024 21:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709673447; cv=none; b=h3PQWAuIjf1DRjMrYCNI1XZd3DtxqY3YBeCSwXdsFhoFM+QVoMnUprDVU4LmXBQsQ5yO921IoM8sD2mLIy7BiC/87o8esjlFMVeZH8yxla0lATbzlry5HeLg+aljZ1PHB0qu+0e77YDYKF/CsPTn53VexhMR0bWHEFTyUglaV/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709673447; c=relaxed/simple;
	bh=Zzs14TQDrBLvAr1o9JtK6vm+FLEBbfjXCr1LPciToqM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cElf1pZQKWVly4IfPCLWGDYVVZAERmT4SzP5WKabyZxlBARIqHoublBE/ghLKMiXNXfB44+vvIpaac5nKE6mLczNsZkjWutLxWYVl5TkgAaHoCru7Y4crWpY51Id3qFqIeV206LdSYdAD9U2xpgb2i2SkN2MC016Ojp4AiEjEVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=f+zkeIIL; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a456ab934eeso24003066b.0
        for <linux-doc@vger.kernel.org>; Tue, 05 Mar 2024 13:17:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709673443; x=1710278243; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LpvlKXjZceUyV7T13tDS41t/F1Xa1LPW/laeLkdBF1g=;
        b=f+zkeIIL3MaYM5PZ+7iWNhbUPnElC1PozZSc3vG7/g0+xAiXtxTX0jGzm4OkukjKj+
         Ewed6xKfesI0HEa5m7zQonRJ2pjlKxAUa8tBqiAUmr4RbgWi2/dbQKdauu2aIafD9DDi
         Ghu9no2/qlPRW04bDfIx95FhJamSFgtmIL62MzhYo/wY9BAVKY4ctX4UJOFKGmUvD4B2
         /dT+b0RVAl/VFXCxbdWtSXMiwW30ZHuxO/KNwghkR//2XF1E1t/OnGu0/kHEEYxV/ZFy
         lYYuIyAgsMf7/qlF0Gb3IkvynzO+FN+vnrHlmF9kii3ZWz5hNnSh52TkqTYMD+AfZJnH
         rP2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709673443; x=1710278243;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LpvlKXjZceUyV7T13tDS41t/F1Xa1LPW/laeLkdBF1g=;
        b=QMdrRWKqVQoNu3x1bHvjWYiDt7t2Fpc1XdXDFQFrVFMbrPoqY74qrNgYtG1XNb2/uN
         RS3gsTNS/CgjAHz/yDExGe0IQINv9laBBdwnVgU36dkpOZy46AM6s8N6urvnCkNGC5AE
         708lEGmg0Cuqr8fsI+S8R62tuBheAk/F1Z48CrbIwsrTVBdeKmUFxWHrFx6DTjgv+tFN
         2sJr25dORS+MPl8Iwupyg+n2n1mayUJcoBOC/TWAg2LsaYXP1+6M3MoARp845HKvXsXk
         y8tw3kd3w+vaJCASEiEllFuLOE+KsaT+DBDQA89Yws584xHKXR7UMFtkTokQHDrGLpJz
         YruQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7V2VIccQR+/BIBI5POFE4ogv+KafDp4bHMJjyXyGK7sRsrFblkAlEKkZdYqdvEWSMSAi0uoroxW6Eso34YJxyxnalDzNDH04F
X-Gm-Message-State: AOJu0Yywc4pyiHYpLrfBGo2mdrI4Ri5ae+R5uShuDmXIuHdalpN0vPIn
	20DzsrV8wH7RCNOLyeX+Mz3JFuEn14jSfcZfFgr3X8RnFPa/dpSE2bN/+a7jYMz1broGeB3kgYD
	++Js741ue1v6OyKeSwqzvMMa2Z/Au9re1rNlz
X-Google-Smtp-Source: AGHT+IHlC+vBw635Kt73+dsHbQtM7EL6jyFCQWoNIhJRg5JiyGmYfM2wu4YJxtfkn8eGdUtq4eym/8JfbCk0TV4RoFA=
X-Received: by 2002:a17:906:3c17:b0:a43:86f3:b00b with SMTP id
 h23-20020a1709063c1700b00a4386f3b00bmr8581734ejg.0.1709673442968; Tue, 05 Mar
 2024 13:17:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240305020153.2787423-1-almasrymina@google.com>
 <20240305020153.2787423-6-almasrymina@google.com> <da42cea9-c169-599e-f087-d38c419e3dab@huawei.com>
In-Reply-To: <da42cea9-c169-599e-f087-d38c419e3dab@huawei.com>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 5 Mar 2024 13:17:08 -0800
Message-ID: <CAHS8izM7GbvWHrH=h9q0oG0DMU649EjT1udNEW_8F-hGeC15EQ@mail.gmail.com>
Subject: Re: [RFC PATCH net-next v6 05/15] netdev: support binding dma-buf to netdevice
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Richard Henderson <richard.henderson@linaro.org>, 
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Andreas Larsson <andreas@gaisler.com>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Arnd Bergmann <arnd@arndb.de>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, David Ahern <dsahern@kernel.org>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Shailend Chand <shailend@google.com>, Harshitha Ramamurthy <hramamurthy@google.com>, 
	Shakeel Butt <shakeelb@google.com>, Jeroen de Borst <jeroendb@google.com>, 
	Praveen Kaligineedi <pkaligineedi@google.com>, Willem de Bruijn <willemb@google.com>, 
	Kaiyuan Zhang <kaiyuanz@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 5, 2024 at 4:55=E2=80=AFAM Yunsheng Lin <linyunsheng@huawei.com=
> wrote:
>
> On 2024/3/5 10:01, Mina Almasry wrote:
>
> ...
>
> >
> > The netdev_dmabuf_binding struct is refcounted, and releases its
> > resources only when all the refs are released.
> >
> > Signed-off-by: Willem de Bruijn <willemb@google.com>
> > Signed-off-by: Kaiyuan Zhang <kaiyuanz@google.com>
> > Signed-off-by: Mina Almasry <almasrymina@google.com>
> >
> > ---
> >
> > RFC v6:
> > - Validate rx queue index
> > - Refactor new functions into devmem.c (Pavel)
>
> It seems odd that the functions or stucts in a file called devmem.c
> are named after 'dmabuf' instead of 'devmem'.
>

So my intention with this naming that devmem.c contains all the
functions for all devmem tcp specific support. Currently the only
devmem we support is dmabuf. In the future, other devmem may be
supported and it can fit nicely in devmem.c. For example, if we want
to extend devmem TCP to support NVMe devices, we need to add support
for p2pdma, maybe, and we can add that support under the devmem.c
umbrella rather than add new files.

But I can rename to dmabuf.c if there is strong objection to the current na=
me.

> >
>
> ...
>
> > diff --git a/include/net/netmem.h b/include/net/netmem.h
> > index d8b810245c1d..72e932a1a948 100644
> > --- a/include/net/netmem.h
> > +++ b/include/net/netmem.h
> > @@ -8,6 +8,16 @@
> >  #ifndef _NET_NETMEM_H
> >  #define _NET_NETMEM_H
> >
> > +#include <net/devmem.h>
> > +
> > +/* net_iov */
> > +
> > +struct net_iov {
> > +     struct dmabuf_genpool_chunk_owner *owner;
> > +};
> > +
> > +/* netmem */
> > +
> >  /**
> >   * typedef netmem_ref - a nonexistent type marking a reference to gene=
ric
> >   * network memory.
> > diff --git a/net/core/Makefile b/net/core/Makefile
> > index 821aec06abf1..592f955c1241 100644
> > --- a/net/core/Makefile
> > +++ b/net/core/Makefile
> > @@ -13,7 +13,7 @@ obj-y                    +=3D dev.o dev_addr_lists.o =
dst.o netevent.o \
> >                       neighbour.o rtnetlink.o utils.o link_watch.o filt=
er.o \
> >                       sock_diag.o dev_ioctl.o tso.o sock_reuseport.o \
> >                       fib_notifier.o xdp.o flow_offload.o gro.o \
> > -                     netdev-genl.o netdev-genl-gen.o gso.o
> > +                     netdev-genl.o netdev-genl-gen.o gso.o devmem.o
> >
> >  obj-$(CONFIG_NETDEV_ADDR_LIST_TEST) +=3D dev_addr_lists_test.o
> >
> > diff --git a/net/core/dev.c b/net/core/dev.c
> > index fe054cbd41e9..bbea1b252529 100644
> > --- a/net/core/dev.c
> > +++ b/net/core/dev.c
> > @@ -155,6 +155,9 @@
> >  #include <net/netdev_rx_queue.h>
> >  #include <net/page_pool/types.h>
> >  #include <net/page_pool/helpers.h>
> > +#include <linux/genalloc.h>
> > +#include <linux/dma-buf.h>
> > +#include <net/devmem.h>
> >
> >  #include "dev.h"
> >  #include "net-sysfs.h"
> > diff --git a/net/core/devmem.c b/net/core/devmem.c
> > new file mode 100644
> > index 000000000000..779ad990971e
> > --- /dev/null
> > +++ b/net/core/devmem.c
> > @@ -0,0 +1,293 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + *      Devmem TCP
> > + *
> > + *      Authors:     Mina Almasry <almasrymina@google.com>
> > + *                   Willem de Bruijn <willemdebruijn.kernel@gmail.com=
>
> > + *                   Kaiyuan Zhang <kaiyuanz@google.com
> > + */
> > +
> > +#include <linux/types.h>
> > +#include <linux/mm.h>
> > +#include <linux/netdevice.h>
> > +#include <trace/events/page_pool.h>
> > +#include <net/netdev_rx_queue.h>
> > +#include <net/page_pool/types.h>
> > +#include <net/page_pool/helpers.h>
> > +#include <linux/genalloc.h>
> > +#include <linux/dma-buf.h>
> > +#include <net/devmem.h>
> > +
> > +/* Device memory support */
> > +
> > +#ifdef CONFIG_DMA_SHARED_BUFFER
>
> I still think it is worth adding its own config for devmem or dma-buf
> for networking, thinking about the embeded system.
>

FWIW Willem did weigh on this previously and said he prefers to have
it unguarded by a CONFIG, but I will submit to whatever the consensus
here. It shouldn't be a huge deal to add a CONFIG technically
speaking.

> > +static void netdev_dmabuf_free_chunk_owner(struct gen_pool *genpool,
> > +                                        struct gen_pool_chunk *chunk,
> > +                                        void *not_used)
>
> It seems odd to still keep the netdev_ prefix as it is not really related
> to netdev, perhaps use 'net_' or something better.
>

Yes, thanks for catching. I can change to net_devmem_ maybe or net_dmabuf_*=
.

> > +{
> > +     struct dmabuf_genpool_chunk_owner *owner =3D chunk->owner;
> > +
> > +     kvfree(owner->niovs);
> > +     kfree(owner);
> > +}
> > +
> > +void __netdev_dmabuf_binding_free(struct netdev_dmabuf_binding *bindin=
g)
> > +{
> > +     size_t size, avail;
> > +
> > +     gen_pool_for_each_chunk(binding->chunk_pool,
> > +                             netdev_dmabuf_free_chunk_owner, NULL);
> > +
> > +     size =3D gen_pool_size(binding->chunk_pool);
> > +     avail =3D gen_pool_avail(binding->chunk_pool);
> > +
> > +     if (!WARN(size !=3D avail, "can't destroy genpool. size=3D%lu, av=
ail=3D%lu",
> > +               size, avail))
> > +             gen_pool_destroy(binding->chunk_pool);
> > +
> > +     dma_buf_unmap_attachment(binding->attachment, binding->sgt,
> > +                              DMA_BIDIRECTIONAL);
>
> For now DMA_FROM_DEVICE seems enough as tx is not supported yet.
>

Yes, good catch. I suspect we want to reuse this code for TX path. But
for now, I'll test with DMA_FROM_DEVICE and if I see no issues I'll
apply this change.

> > +     dma_buf_detach(binding->dmabuf, binding->attachment);
> > +     dma_buf_put(binding->dmabuf);
> > +     xa_destroy(&binding->bound_rxq_list);
> > +     kfree(binding);
> > +}
> > +
> > +static int netdev_restart_rx_queue(struct net_device *dev, int rxq_idx=
)
> > +{
> > +     void *new_mem;
> > +     void *old_mem;
> > +     int err;
> > +
> > +     if (!dev || !dev->netdev_ops)
> > +             return -EINVAL;
> > +
> > +     if (!dev->netdev_ops->ndo_queue_stop ||
> > +         !dev->netdev_ops->ndo_queue_mem_free ||
> > +         !dev->netdev_ops->ndo_queue_mem_alloc ||
> > +         !dev->netdev_ops->ndo_queue_start)
> > +             return -EOPNOTSUPP;
> > +
> > +     new_mem =3D dev->netdev_ops->ndo_queue_mem_alloc(dev, rxq_idx);
> > +     if (!new_mem)
> > +             return -ENOMEM;
> > +
> > +     err =3D dev->netdev_ops->ndo_queue_stop(dev, rxq_idx, &old_mem);
> > +     if (err)
> > +             goto err_free_new_mem;
> > +
> > +     err =3D dev->netdev_ops->ndo_queue_start(dev, rxq_idx, new_mem);
> > +     if (err)
> > +             goto err_start_queue;
> > +
> > +     dev->netdev_ops->ndo_queue_mem_free(dev, old_mem);
> > +
> > +     return 0;
> > +
> > +err_start_queue:
> > +     dev->netdev_ops->ndo_queue_start(dev, rxq_idx, old_mem);
>
> It might worth mentioning why queue start with old_mem will always
> success here as the return value seems to be ignored here.
>

So the old queue, we stopped it, and if we fail to bring up the new
queue, then we want to start the old queue back up to get the queue
back to a workable state.

I don't see what we can do to recover if restarting the old queue
fails. Seems like it should be a requirement that the driver tries as
much as possible to keep the old queue restartable.

I can improve this by at least logging or warning if restarting the
old queue fails.

> > +
> > +err_free_new_mem:
> > +     dev->netdev_ops->ndo_queue_mem_free(dev, new_mem);
> > +
> > +     return err;
> > +}
> > +
> > +/* Protected by rtnl_lock() */
> > +static DEFINE_XARRAY_FLAGS(netdev_dmabuf_bindings, XA_FLAGS_ALLOC1);
> > +
> > +void netdev_unbind_dmabuf(struct netdev_dmabuf_binding *binding)
> > +{
> > +     struct netdev_rx_queue *rxq;
> > +     unsigned long xa_idx;
> > +     unsigned int rxq_idx;
> > +
> > +     if (!binding)
> > +             return;
> > +
> > +     if (binding->list.next)
> > +             list_del(&binding->list);
>
> The above does not seems to be a good pattern to delete a entry, is
> there any reason having a checking before the list_del()? seems like
> defensive programming?
>

I think I needed to apply this condition to handle the case where
netdev_unbind_dmabuf() is called when binding->list is not initialized
or is empty.

netdev_nl_bind_rx_doit() will call unbind to free a partially
allocated binding in error paths, so, netdev_unbind_dmabuf() may be
called with a partially initialized binding. This is why we check for
binding->list is initialized here and check that rxq->binding =3D=3D
binding below. The main point is that netdev_unbind_dmabuf() may be
asked to unbind a partially bound dmabuf due to error paths.

Maybe a comment here will test this better. I will double confirm the
check is needed for the error paths in netdev_nl_bind_rx_doit().

> > +
> > +     xa_for_each(&binding->bound_rxq_list, xa_idx, rxq) {
> > +             if (rxq->binding =3D=3D binding) {
>
> It seems like defensive programming here too?
>
> > +                     /* We hold the rtnl_lock while binding/unbinding
> > +                      * dma-buf, so we can't race with another thread =
that
> > +                      * is also modifying this value. However, the dri=
ver
> > +                      * may read this config while it's creating its
> > +                      * rx-queues. WRITE_ONCE() here to match the
> > +                      * READ_ONCE() in the driver.
> > +                      */
> > +                     WRITE_ONCE(rxq->binding, NULL);
> > +
> > +                     rxq_idx =3D get_netdev_rx_queue_index(rxq);
> > +
> > +                     netdev_restart_rx_queue(binding->dev, rxq_idx);
> > +             }
> > +     }
> > +
> > +     xa_erase(&netdev_dmabuf_bindings, binding->id);
> > +
> > +     netdev_dmabuf_binding_put(binding);
> > +}
> > +
>


--=20
Thanks,
Mina

