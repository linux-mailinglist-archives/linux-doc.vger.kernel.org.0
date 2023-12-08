Return-Path: <linux-doc+bounces-4544-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BF180ACF8
	for <lists+linux-doc@lfdr.de>; Fri,  8 Dec 2023 20:28:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D00C71F20B53
	for <lists+linux-doc@lfdr.de>; Fri,  8 Dec 2023 19:28:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 144544CB38;
	Fri,  8 Dec 2023 19:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wn+1Kwpq"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com [IPv6:2607:f8b0:4864:20::e34])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 424041712
	for <linux-doc@vger.kernel.org>; Fri,  8 Dec 2023 11:27:59 -0800 (PST)
Received: by mail-vs1-xe34.google.com with SMTP id ada2fe7eead31-466006f9fa5so395665137.3
        for <linux-doc@vger.kernel.org>; Fri, 08 Dec 2023 11:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702063678; x=1702668478; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l8NyCuiiYgH2NC+1+G5jDZqmw10slLAD5tJccxA3IOU=;
        b=wn+1KwpqOUvxlWkstW/oLVbPJnEIbHmb7s+/7bNNdsLzC5es3QyjG7Brk00hx3A6mh
         OIStZpmgQX/LMTKzWJqSZz4j0zw4pQUGBKsOQFf9DKFAVfSpdNo1H/KXlBmGtl2H0j+U
         9KwWuVdPoPr5D1mbz0YJDqfPoZgz2rYqKu2cZppU9/+B0WqEpFpkLZlrLJvpMc5JVKjw
         RlHM68qjUHN7ZsT+fZl55v0QgcUIRlyYMukcCCqMvenFm3i+rl6ShntIlQ8m4OHbPLw3
         PEjbCV7s9dQKS+JQ4ri+ztcXrYEzdoSCIpqUuO+J4s0aUh/43HpTTpthoYyVf5D440YC
         MKtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702063678; x=1702668478;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l8NyCuiiYgH2NC+1+G5jDZqmw10slLAD5tJccxA3IOU=;
        b=MY3FQCF8KMyNVZIuoQ2XqJezl8c+q3kQoezuPDd0NavKg3V6LDxM7SKxaYxjzxj0eL
         CnB4JHTJbKIPqmDIuI8E4iFaO7MQIFL+8Qf8vhraoIFJssD9riYwWm8huyooHqVG/LC6
         Pyi5B2ewYodmai7nC+LPbMmQ/5DUtiSp0+BxNmIhrOmYkJ1r6h4xrrPoWHoBs6Gyh8QQ
         260W4hpy/e8mGJ2Tmo9bUY7H6rytcjb+nBOj17F1fzdUtqIXhKO7qlh8hkzu1ZxelovI
         /I5G6E5Uq/+S2+u/9LDwO1dnuGNBbOEwWeSr70i40RwPzn6cbifqCqotBIB8x7C5BRIb
         DUfA==
X-Gm-Message-State: AOJu0Yx2YKx2HtZwhi3vbyVnxFjMCUuVh91FDF7XdCkd7DZhNdiMa7Ue
	bkr+3RAg49GUCV2KZVB1P0dg5osOJ7Roxh6LNIy1aA==
X-Google-Smtp-Source: AGHT+IEPi2qW+CNAMULh3I0uZLV+ENMhuoXZdBR03G3pdL5QZhSSzAfl9wtnjBaGr4ZrWdh/Qk9uo4kpcH6n9EBcDGQ=
X-Received: by 2002:a05:6102:6ca:b0:464:944d:44de with SMTP id
 m10-20020a05610206ca00b00464944d44demr731655vsg.27.1702063678195; Fri, 08 Dec
 2023 11:27:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231208005250.2910004-1-almasrymina@google.com>
 <20231208005250.2910004-8-almasrymina@google.com> <462da4bf-34f8-40c4-8772-9850b3127baf@kernel.org>
In-Reply-To: <462da4bf-34f8-40c4-8772-9850b3127baf@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Fri, 8 Dec 2023 11:27:47 -0800
Message-ID: <CAHS8izMysKCCoAoVK9KzQrfbtFfagaPMRYSUUjKTqJ-ZwJ53oA@mail.gmail.com>
Subject: Re: [net-next v1 07/16] netdev: netdevice devmem allocator
To: David Ahern <dsahern@kernel.org>
Cc: Shailend Chand <shailend@google.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	bpf@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Jeroen de Borst <jeroendb@google.com>, 
	Praveen Kaligineedi <pkaligineedi@google.com>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Yunsheng Lin <linyunsheng@huawei.com>, Harshitha Ramamurthy <hramamurthy@google.com>, 
	Shakeel Butt <shakeelb@google.com>, Willem de Bruijn <willemb@google.com>, 
	Kaiyuan Zhang <kaiyuanz@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 8, 2023 at 9:56=E2=80=AFAM David Ahern <dsahern@kernel.org> wro=
te:
>
> On 12/7/23 5:52 PM, Mina Almasry wrote:
> > diff --git a/net/core/dev.c b/net/core/dev.c
> > index b8c8be5a912e..30667e4c3b95 100644
> > --- a/net/core/dev.c
> > +++ b/net/core/dev.c
> > @@ -2120,6 +2120,41 @@ static int netdev_restart_rx_queue(struct net_de=
vice *dev, int rxq_idx)
> >       return err;
> >  }
> >
> > +struct page_pool_iov *netdev_alloc_dmabuf(struct netdev_dmabuf_binding=
 *binding)
> > +{
> > +     struct dmabuf_genpool_chunk_owner *owner;
> > +     struct page_pool_iov *ppiov;
> > +     unsigned long dma_addr;
> > +     ssize_t offset;
> > +     ssize_t index;
> > +
> > +     dma_addr =3D gen_pool_alloc_owner(binding->chunk_pool, PAGE_SIZE,
>
> Any reason not to allow allocation sizes other than PAGE_SIZE? e.g.,
> 2048 for smaller MTUs or 8192 for larger ones. It can be a property of
> page_pool and constant across allocations vs allowing different size for
> each allocation.

Only for simplicity. Supporting non-PAGE_SIZE is certainly possible,
but in my estimation it's a huge can of worms worthy of itss own
series. I find this series complicated to implement and review and
support as-is, and if reasonable I would like to punt that as a future
improvement.

At the minimum, I think the needed changes are:

1. The memory provider needs to report to the page pool the alloc size.
2. The page_pool needs to handle non-PAGE_SIZE memory regions.
3. The drivers need to handle non-PAGE_SIZE memory regions. Drivers
today handle fragged pages, but that is different because it's a
PAGE_SIZE region that is fragged. This is a non-PAGE_SIZE region in
the first place.
4. Any PAGE_SIZE assumptions in the entire net stack need to be removed.

At Google we mostly use page aligned MTUs so we're likely not that
interested in sub PAGE_SIZE allocations, but we are interested in n *
PAGE_SIZE allocations, but, I hope, in a separate followup effort.

--=20
Thanks,
Mina

