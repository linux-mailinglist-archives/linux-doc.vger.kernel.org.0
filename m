Return-Path: <linux-doc+bounces-22742-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D15D950E9D
	for <lists+linux-doc@lfdr.de>; Tue, 13 Aug 2024 23:14:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AB1B3B20FC0
	for <lists+linux-doc@lfdr.de>; Tue, 13 Aug 2024 21:14:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27D481AAE10;
	Tue, 13 Aug 2024 21:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fFO/lJ9Z"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443281AB521
	for <linux-doc@vger.kernel.org>; Tue, 13 Aug 2024 21:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723583614; cv=none; b=K3ImEetcqAZAbyEE1kCmip+Kdr3mE1pHtJWwHW7uM9tsKZT5C8JZyBQk4erFoHle5IVcMCfD3UynPo+X2ubQbfJkMB6vu2j50drTLj0Hg6l21WPToMm0zPJkCTSy7BSwYd9fFeLgcq4YE/2ZuvWPR977uEEVGQBA/691TNYdee4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723583614; c=relaxed/simple;
	bh=7wMYYUEXHJcM3CZsCr4QyUwOaSaSIWB2cWyRAjiwA7M=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=h11tAxJXC5bZNsNCphyeNHy09F349OkYIqgVqEZTjLnnjLJ+H7RY3IbNa1bo4F6YVQJ7JgUOVvjSN+61EoMqRIhKhXtHK/CGBraNI0Au8aIuDxyhHE6pi94wMybxhYTn79zmk1xcA3QizFeAUoJkZtWcolyq7PnON02o7BkIrJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fFO/lJ9Z; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e0b3742b309so9965739276.1
        for <linux-doc@vger.kernel.org>; Tue, 13 Aug 2024 14:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723583607; x=1724188407; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pReH0PE9oeGpiCITTNC9APQoZ9JJ2biqbIokrL2YiRQ=;
        b=fFO/lJ9ZMY/lJMAInc86NvPf1UaqmoaNQ+hnY4frW0L/C01UnKWU0kgRmfXu8UPYtQ
         uK40LMD7eg7k6Ari13Dj/Y2MLBfYCO25slwdzLZQnHxmlpB2/L27h6TRhC+2wewQ4zwn
         iB4yu3BFYNgnIp/yaQVdvML+AVP9XMn/kbVd3E71dePFDtLMCHJ0llw2Kf7nYTvOx5Ha
         d5kaTIRUqKnSGBL3f7xg23/2QcBE6lyJ/w6vs06MOawfmwUtT2BaaFa/p2xV/ibEwTxv
         JxIfFFMJlmhheB2WwZkVUqFfKJ5xZkVtpWTcctVQ2pr1kre1uTgI5Bno5uOVTBetCY6y
         TsOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723583607; x=1724188407;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pReH0PE9oeGpiCITTNC9APQoZ9JJ2biqbIokrL2YiRQ=;
        b=c4d/avgmVK7vzA5+lwDjfQx1OWoymO646qTnCKUx0lO2fEqVJfMWFCIIJx/PYlQ8ia
         BpwDKhMgIxpqU1rgA2uUSq14diEWbv6jaMQynUunc2NzveTqCO0vgT4IMaXexM1oBUsx
         fIq25MjjZtkqnGFLp39qx6kdwtky0ib+c43NGPaJAxzm/cFIrKcpWeUDK47pXil16R4o
         ZHNnz3ezQ3kO/SGkTx+bhExSvUj+Ek59r+aTljzsl9LtNJehYfAYsu9Pft2zbp5w2qIT
         oVdXzuyW7ZhRFjfvRMHbcho8YaM4bF4GXsZ2b/ewbIkoMydYi6JgX7mHsaz4Lk1gXvwa
         RtOA==
X-Forwarded-Encrypted: i=1; AJvYcCWA3ouURbyMDOymhIMXPRIaCr179BqOQfgM6m8zq1eAAt60ZIgwzI6Nor0Gayfo1Kk2m/Rv+T79iXw3qT+5JQlZnF5Eafxbm3S3
X-Gm-Message-State: AOJu0YxaHmlksiHGsYp9d8UvA1LA9ERXfdMI9WGVzrFZzG/5jZc/eKkJ
	mADdpLYWm+4xD0PdJbVVPuJLrDbtkSM9SlLdEka23Kbgpghv0RHH2koSQWQUVxMtQfW0zOnOHAC
	9tb8Fcc8odMZE13KhJ2QB8g==
X-Google-Smtp-Source: AGHT+IGdJoog7C17gJZ3u9Mpmuua4ar/NqVjMJg9n8lbmms2x4B+H8pC3SjfeFBjN3NNb2AWH75VreoswTsb/e9XUw==
X-Received: from almasrymina.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:4bc5])
 (user=almasrymina job=sendgmr) by 2002:a25:c584:0:b0:e0b:a2a7:df77 with SMTP
 id 3f1490d57ef6-e1155a42e03mr1453276.2.1723583606874; Tue, 13 Aug 2024
 14:13:26 -0700 (PDT)
Date: Tue, 13 Aug 2024 21:13:06 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.46.0.76.ge559c4bf1a-goog
Message-ID: <20240813211317.3381180-5-almasrymina@google.com>
Subject: [PATCH net-next v19 04/13] netdev: netdevice devmem allocator
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	bpf@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Cc: Mina Almasry <almasrymina@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Donald Hunter <donald.hunter@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
	Matt Turner <mattst88@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, 
	Andreas Larsson <andreas@gaisler.com>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Arnd Bergmann <arnd@arndb.de>, Steffen Klassert <steffen.klassert@secunet.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, David Ahern <dsahern@kernel.org>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	John Fastabend <john.fastabend@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, Bagas Sanjaya <bagasdotme@gmail.com>, 
	Christoph Hellwig <hch@infradead.org>, Nikolay Aleksandrov <razor@blackwall.org>, Taehee Yoo <ap420073@gmail.com>, 
	Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Yunsheng Lin <linyunsheng@huawei.com>, Shailend Chand <shailend@google.com>, 
	Harshitha Ramamurthy <hramamurthy@google.com>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Jeroen de Borst <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>, 
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

---

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
 include/net/netmem.h | 18 ++++++++++++++++++
 net/core/devmem.c    | 38 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 69 insertions(+)

diff --git a/include/net/devmem.h b/include/net/devmem.h
index c7bd6a0a6b9e..2e7cc46d4d3c 100644
--- a/include/net/devmem.h
+++ b/include/net/devmem.h
@@ -69,7 +69,20 @@ void net_devmem_unbind_dmabuf(struct net_devmem_dmabuf_binding *binding);
 int net_devmem_bind_dmabuf_to_queue(struct net_device *dev, u32 rxq_idx,
 				    struct net_devmem_dmabuf_binding *binding);
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
index 41e96c2f94b5..664df8325ece 100644
--- a/include/net/netmem.h
+++ b/include/net/netmem.h
@@ -14,8 +14,26 @@
 
 struct net_iov {
 	struct dmabuf_genpool_chunk_owner *owner;
+	unsigned long dma_addr;
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
index 1b693424c17d..88d188149148 100644
--- a/net/core/devmem.c
+++ b/net/core/devmem.c
@@ -35,6 +35,14 @@ static void net_devmem_dmabuf_free_chunk_owner(struct gen_pool *genpool,
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
@@ -57,6 +65,36 @@ void __net_devmem_dmabuf_binding_free(struct net_devmem_dmabuf_binding *binding)
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
+	if (gen_pool_has_addr(binding->chunk_pool, dma_addr, PAGE_SIZE))
+		gen_pool_free(binding->chunk_pool, dma_addr, PAGE_SIZE);
+}
+
 void net_devmem_unbind_dmabuf(struct net_devmem_dmabuf_binding *binding)
 {
 	struct netdev_rx_queue *rxq;
-- 
2.46.0.76.ge559c4bf1a-goog


