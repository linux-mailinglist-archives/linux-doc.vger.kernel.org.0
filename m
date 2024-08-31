Return-Path: <linux-doc+bounces-24253-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE9A966DCA
	for <lists+linux-doc@lfdr.de>; Sat, 31 Aug 2024 02:44:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9023F1C216C4
	for <lists+linux-doc@lfdr.de>; Sat, 31 Aug 2024 00:44:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 288D537708;
	Sat, 31 Aug 2024 00:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EfwV8im2"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA8522612
	for <linux-doc@vger.kernel.org>; Sat, 31 Aug 2024 00:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725065014; cv=none; b=hDceUkUDFUnX8Pq43NTBp/PYOMSL1HhjWapX+ONVT8N35Jxi2fv/sCEs3hRs0XQ83RWoySqr8KBo912c+SbNNwdEgZT3uD8jhgnzCie2KyJ/6HKuFWJLMOaPl6x6rjdAQfOc086HSZc25mb3mTonUwMU+dJxdDZxQsvjeWQ/PX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725065014; c=relaxed/simple;
	bh=w5RuDqPv5rvK1tcR6LRpJEXOMyuCc76qZ/ErvoupbGw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZOWiFb7G2zkPnGBoXvPvk9EVIaO69k/kKJ+0Kb+wuOQzxcHvIMmfHgOvpxB9P3Jx1dV1CoaanzS7UTZgOp99MgZnUWd1N+knS0eMScVUNgqpC6506FHUA8gx3n00Eo0DE7dQfVYuCqMOuLCIS9bMbV5/rNVLgPtD+Mt42qI04z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EfwV8im2; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6d3aa5a6715so28659377b3.2
        for <linux-doc@vger.kernel.org>; Fri, 30 Aug 2024 17:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725065010; x=1725669810; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=SPsEhcMOBNHkoRP+dE+c2ouSgpLWKznnjXqaGgh0L3g=;
        b=EfwV8im27c/fbmjCuPShjQZUTCyGCrONFYAEjsoB0L23kddNEv+4JqZT7fifooIp/F
         cPWQL2hN6LF1/S/yoBeJ687NjaNrHYALw44wfSmig8ogmDfEPCRO0bLNZ/NUAfwBdJ1U
         PgXDWGRqVF/ahESpT2OSHxZGKJK51wG5jc8Fq5NUDLwXklEParUAP+gU2F//1DXAOI56
         mkEcBSWZK5k2KwkyARd8WRq2TITcvHW6nZAIge9b8MWC0qtwf4CVHw5C7GIOoFtNMwB2
         2Aq7Ye3QOS//GKdOMxzN0nMrmpBmpYt0ge+TerYqf5EpiQa7xIF25nw7BIaZWktrCjfu
         K9gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725065010; x=1725669810;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SPsEhcMOBNHkoRP+dE+c2ouSgpLWKznnjXqaGgh0L3g=;
        b=tNMhcK+kPSZ0oCb0rEZCXve5ZzDfXKSvPnbzAMAxbsoLQQ1StKvPVPbBbwVIMHdJid
         6lzBrkCEWcm1ZJFQSj4k9e3kn6l4t+6mydBmfAKucx3U9ywouLQkqemqLH0a9vbqC+BR
         wnrq53fAcuA+W3lNZJ0kjvh9uUQeopTIqy3GhZpBQ8idd9zXdhW3vpKL8zqCqu4/nuJy
         T96l8zS3WHh97/I0Y5kWrfbZH3ICcWlfEPVVigHynlYDK+Z1X2z96O63fbQ5Uxs7jyMc
         8yIh67Dz0tpkDYu0Ln8Xmmh0AEcx9/tietyteE7I4V6M6oRe8XTYejJf06pJ5NYN0C6L
         bJzw==
X-Forwarded-Encrypted: i=1; AJvYcCWOhI1aE75vukqi5Aq2D/n58J4ajfnx4KoEvRT18PlDtSBejO43vw9ZY6nlXE+Ws5Ppnwf+e5mu1to=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBmTpT3uOhLM2fr1IHZ4V4T0q1TJyFq8rNg4Mg1ehbbULciK0c
	pgYdvErFvLpgYb6njbG0YeBGspNBbojCIdSZ2MCkNwGMNFCsOKzO0eLJ2O2bnMYBEhAeDuuAxHt
	B9KEKFp3Ff5RXEvj72zXY+Q==
X-Google-Smtp-Source: AGHT+IExLKA/WuEj64lWpm3GfmhCMlDgrQkLH3kCViC7zyNP0YVC0+jlo63IhVC0FND18WtuyQDn/hZn2vCdRjXnPQ==
X-Received: from almasrymina.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:4bc5])
 (user=almasrymina job=sendgmr) by 2002:a05:690c:6d8b:b0:6be:9d4a:f097 with
 SMTP id 00721157ae682-6d40fc1ee69mr1566627b3.7.1725065009897; Fri, 30 Aug
 2024 17:43:29 -0700 (PDT)
Date: Sat, 31 Aug 2024 00:43:04 +0000
In-Reply-To: <20240831004313.3713467-1-almasrymina@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240831004313.3713467-1-almasrymina@google.com>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
Message-ID: <20240831004313.3713467-5-almasrymina@google.com>
Subject: [PATCH net-next v24 04/13] netdev: netdevice devmem allocator
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Cc: Mina Almasry <almasrymina@google.com>, Donald Hunter <donald.hunter@gmail.com>, 
	Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Richard Henderson <richard.henderson@linaro.org>, 
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, 
	Andreas Larsson <andreas@gaisler.com>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Arnd Bergmann <arnd@arndb.de>, Steffen Klassert <steffen.klassert@secunet.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, David Ahern <dsahern@kernel.org>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
	"=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?=" <bjorn@kernel.org>, Magnus Karlsson <magnus.karlsson@intel.com>, 
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, Jonathan Lemon <jonathan.lemon@gmail.com>, 
	Shuah Khan <shuah@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, Pavel Begunkov <asml.silence@gmail.com>, 
	David Wei <dw@davidwei.uk>, Jason Gunthorpe <jgg@ziepe.ca>, Yunsheng Lin <linyunsheng@huawei.com>, 
	Shailend Chand <shailend@google.com>, Harshitha Ramamurthy <hramamurthy@google.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Jeroen de Borst <jeroendb@google.com>, 
	Praveen Kaligineedi <pkaligineedi@google.com>, Bagas Sanjaya <bagasdotme@gmail.com>, 
	Christoph Hellwig <hch@infradead.org>, Nikolay Aleksandrov <razor@blackwall.org>, Taehee Yoo <ap420073@gmail.com>, 
	Willem de Bruijn <willemb@google.com>, Kaiyuan Zhang <kaiyuanz@google.com>
Content-Type: text/plain; charset="UTF-8"

Implement netdev devmem allocator. The allocator takes a given struct
netdev_dmabuf_binding as input and allocates net_iov from that
binding.

The allocation simply delegates to the binding's genpool for the
allocation logic and wraps the returned memory region in a net_iov
struct.

Signed-off-by: Willem de Bruijn <willemb@google.com>
Signed-off-by: Kaiyuan Zhang <kaiyuanz@google.com>
Signed-off-by: Mina Almasry <almasrymina@google.com>
Reviewed-by: Pavel Begunkov <asml.silence@gmail.com>
Reviewed-by: Jakub Kicinski <kuba@kernel.org>

---

v23:
- WARN_ON when we don't see the dma_addr in the gen_pool (Jakub)

v20:
- Removed dma_addr field in dmabuf_genpool_chunk_owner not used in this
  patch (moved to later patch where it's used).

v19:
- Don't reset dma_addr on allocation/free (Jakub)

v17:
- Don't acquire a binding ref for every allocation (Jakub).

v11:
- Fix extraneous inline directive (Paolo)

v8:
- Rename netdev_dmabuf_binding -> net_devmem_dmabuf_binding to avoid
  patch-by-patch build error.
- Move niov->pp_magic/pp/pp_ref_counter usage to later patch to avoid
  patch-by-patch build error.

v7:
- netdev_ -> net_devmem_* naming (Yunsheng).

v6:
- Add comment on net_iov_dma_addr to explain why we don't use
  niov->dma_addr (Pavel)
- Refactor new functions into net/core/devmem.c (Pavel)

v1:
- Rename devmem -> dmabuf (David).

---
 include/net/devmem.h | 13 +++++++++++++
 include/net/netmem.h | 17 +++++++++++++++++
 net/core/devmem.c    | 41 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 71 insertions(+)

diff --git a/include/net/devmem.h b/include/net/devmem.h
index 3e406b6bfcf3..d315028c1499 100644
--- a/include/net/devmem.h
+++ b/include/net/devmem.h
@@ -73,7 +73,20 @@ int net_devmem_bind_dmabuf_to_queue(struct net_device *dev, u32 rxq_idx,
 				    struct net_devmem_dmabuf_binding *binding,
 				    struct netlink_ext_ack *extack);
 void dev_dmabuf_uninstall(struct net_device *dev);
+struct net_iov *
+net_devmem_alloc_dmabuf(struct net_devmem_dmabuf_binding *binding);
+void net_devmem_free_dmabuf(struct net_iov *ppiov);
 #else
+static inline struct net_iov *
+net_devmem_alloc_dmabuf(struct net_devmem_dmabuf_binding *binding)
+{
+	return NULL;
+}
+
+static inline void net_devmem_free_dmabuf(struct net_iov *ppiov)
+{
+}
+
 static inline void
 __net_devmem_dmabuf_binding_free(struct net_devmem_dmabuf_binding *binding)
 {
diff --git a/include/net/netmem.h b/include/net/netmem.h
index 41e96c2f94b5..0fbc0999091a 100644
--- a/include/net/netmem.h
+++ b/include/net/netmem.h
@@ -16,6 +16,23 @@ struct net_iov {
 	struct dmabuf_genpool_chunk_owner *owner;
 };
 
+static inline struct dmabuf_genpool_chunk_owner *
+net_iov_owner(const struct net_iov *niov)
+{
+	return niov->owner;
+}
+
+static inline unsigned int net_iov_idx(const struct net_iov *niov)
+{
+	return niov - net_iov_owner(niov)->niovs;
+}
+
+static inline struct net_devmem_dmabuf_binding *
+net_iov_binding(const struct net_iov *niov)
+{
+	return net_iov_owner(niov)->binding;
+}
+
 /* netmem */
 
 /**
diff --git a/net/core/devmem.c b/net/core/devmem.c
index 3b8fa6a50147..ad222d108d37 100644
--- a/net/core/devmem.c
+++ b/net/core/devmem.c
@@ -33,6 +33,14 @@ static void net_devmem_dmabuf_free_chunk_owner(struct gen_pool *genpool,
 	kfree(owner);
 }
 
+static dma_addr_t net_devmem_get_dma_addr(const struct net_iov *niov)
+{
+	struct dmabuf_genpool_chunk_owner *owner = net_iov_owner(niov);
+
+	return owner->base_dma_addr +
+	       ((dma_addr_t)net_iov_idx(niov) << PAGE_SHIFT);
+}
+
 void __net_devmem_dmabuf_binding_free(struct net_devmem_dmabuf_binding *binding)
 {
 	size_t size, avail;
@@ -55,6 +63,39 @@ void __net_devmem_dmabuf_binding_free(struct net_devmem_dmabuf_binding *binding)
 	kfree(binding);
 }
 
+struct net_iov *
+net_devmem_alloc_dmabuf(struct net_devmem_dmabuf_binding *binding)
+{
+	struct dmabuf_genpool_chunk_owner *owner;
+	unsigned long dma_addr;
+	struct net_iov *niov;
+	ssize_t offset;
+	ssize_t index;
+
+	dma_addr = gen_pool_alloc_owner(binding->chunk_pool, PAGE_SIZE,
+					(void **)&owner);
+	if (!dma_addr)
+		return NULL;
+
+	offset = dma_addr - owner->base_dma_addr;
+	index = offset / PAGE_SIZE;
+	niov = &owner->niovs[index];
+
+	return niov;
+}
+
+void net_devmem_free_dmabuf(struct net_iov *niov)
+{
+	struct net_devmem_dmabuf_binding *binding = net_iov_binding(niov);
+	unsigned long dma_addr = net_devmem_get_dma_addr(niov);
+
+	if (WARN_ON(!gen_pool_has_addr(binding->chunk_pool, dma_addr,
+				       PAGE_SIZE)))
+		return;
+
+	gen_pool_free(binding->chunk_pool, dma_addr, PAGE_SIZE);
+}
+
 void net_devmem_unbind_dmabuf(struct net_devmem_dmabuf_binding *binding)
 {
 	struct netdev_rx_queue *rxq;
-- 
2.46.0.469.g59c65b2a67-goog


