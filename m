Return-Path: <linux-doc+bounces-16237-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7A28C2D9D
	for <lists+linux-doc@lfdr.de>; Sat, 11 May 2024 01:30:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA1FD1F20E38
	for <lists+linux-doc@lfdr.de>; Fri, 10 May 2024 23:30:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2B6B13D25B;
	Fri, 10 May 2024 23:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="em2LkgXu"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oa1-f73.google.com (mail-oa1-f73.google.com [209.85.160.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5764F1F2
	for <linux-doc@vger.kernel.org>; Fri, 10 May 2024 23:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715383804; cv=none; b=up8rnn/B4XKYHBpzv6/Omd86LpvAZ6ARD+gGrBO7UslJQE+rR7lXcN/h7BWvx14kiHB+/+hTTCI/uh0VwHOJAM2xKUoxrvmFnStcI03Ex/+tamBQMA/Ds2aQ5HWFjMcH1Rfgkyaff/Hrz2KDKMuKQ842/GL1hkOsavQk72uV9bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715383804; c=relaxed/simple;
	bh=xdWY+KR9p0FLhp7gx5OoaDU0qowTs6U/msm/7fGUVY8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=r5RCApnHfIOjo5ebamZi9fLx9KDNP397VONB8xl0hv/MxceqhtsIS1ew/8WG360CUH4c5ANJPz3D1/FR1A+3RUnNrvEsZyAIay7HEwM7AefDapVdBzaBsYfCwHd3Tes2Z62dGGAfIngt1hO0DFIgKPixBc9uaT9XxcA+V5+CkPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=em2LkgXu; arc=none smtp.client-ip=209.85.160.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Received: by mail-oa1-f73.google.com with SMTP id 586e51a60fabf-23dd5283ca5so2774101fac.1
        for <linux-doc@vger.kernel.org>; Fri, 10 May 2024 16:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715383802; x=1715988602; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cIFstNeC3q4oijsFM3RKN1NWrYB3uLBgK62pDGvDUGc=;
        b=em2LkgXuXRNsbWmzg2kjXYSSuiqfOpjAADj1tMJBz5ZcHHAPJDWp78ZkpnxrK6BWcq
         /Fz4ittOcvw6RduWvYxGmf66uEAZ0klTmrd2tSc3NYsG+d63bXoSkzUwBrkOgPEv4yqG
         67B51la7D4yoPjp84nZ/vQ7ce3pYdT9L7AC5KJvm1S9R1C1LgfnFi9SY3PIbtLeh66ms
         kmk+OGk+gMj5k9YIMwEnNjdBJ5H9qGdnKpo50TiiY3YQDl+eWOa6RnUYKOYmwQ8Cl0AV
         yEyi9qaShkk8Le9CUeeapbkk/3+yDR1/Wck7K0ThU1rSCOIzmc3yDWe/G1b2uDMTrjOI
         hffg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715383802; x=1715988602;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cIFstNeC3q4oijsFM3RKN1NWrYB3uLBgK62pDGvDUGc=;
        b=EvGCoRXDrY6qb9ot7OQhPQRMEmOTvqEgvq2ZxCPhCWiQ2zwBvK1K+BBU8145YSgn6y
         faAxDiUSXJxBZnsbBO2wsezpYl7yYJuf5eJicMlCagynORRa+Bmq81oQFM+DkUUJcYfe
         xIenEvIZoH22f9iOHZk66Hq0oIIP7lZ+E2P6U6h+oKoFcTK+fR2u7h+AP0JokrVxSPMq
         MVd1Qa//iIzfXjSadZ9lLm9SpoSRGIfBPBnKkix484tDEOFObaDiyYwNxJoEQS7PQyR7
         VQKCGsTKkEMZ1/CSW2sAbVjUxDkne2fE8gcDrRXtLRF6zgRuBDidwolQa3XxIUUGkfxH
         cWfA==
X-Forwarded-Encrypted: i=1; AJvYcCUXyqjnHdzg4/TAmE4BQTCtnjr8HbM9+YRy9ZaiJGp3CaJcEBnH1ZCTnv5Xlp5lQu2d77wgzMwADYbp07NrR+xddQJrREwHlE2S
X-Gm-Message-State: AOJu0Yzve693GuaqBOvUOBBeiP6XIuZa4Rb6oFAAzd0QH4cqSL5mVTl7
	H1qkYP5KXgn/FlMzIYjfVXYQ7XtVD0i7Xvj6EGrcEXzlJvkU+9xgzesZyo9Vxg3eKf7weSHRxCQ
	cVgXhe/rFvBMphAXfqiO2Lw==
X-Google-Smtp-Source: AGHT+IFrc3bI3foVbausGan6NBITnYL6pdSmGDzjUj2i/pl14yjDYPvAtCSQjWtnD/i8zjBBRDIlHe/eew2c9slsjQ==
X-Received: from almasrymina.svl.corp.google.com ([2620:15c:2c4:200:3428:1b4e:e75a:d31b])
 (user=almasrymina job=sendgmr) by 2002:a05:6902:1004:b0:dbe:d0a9:2be3 with
 SMTP id 3f1490d57ef6-dee4e558e2dmr1178479276.3.1715383303176; Fri, 10 May
 2024 16:21:43 -0700 (PDT)
Date: Fri, 10 May 2024 16:21:16 -0700
In-Reply-To: <20240510232128.1105145-1-almasrymina@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240510232128.1105145-1-almasrymina@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240510232128.1105145-6-almasrymina@google.com>
Subject: [PATCH net-next v9 05/14] netdev: netdevice devmem allocator
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
	Arnd Bergmann <arnd@arndb.de>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Steffen Klassert <steffen.klassert@secunet.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, David Ahern <dsahern@kernel.org>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, Pavel Begunkov <asml.silence@gmail.com>, 
	David Wei <dw@davidwei.uk>, Jason Gunthorpe <jgg@ziepe.ca>, Yunsheng Lin <linyunsheng@huawei.com>, 
	Shailend Chand <shailend@google.com>, Harshitha Ramamurthy <hramamurthy@google.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Jeroen de Borst <jeroendb@google.com>, 
	Praveen Kaligineedi <pkaligineedi@google.com>, Willem de Bruijn <willemb@google.com>, 
	Kaiyuan Zhang <kaiyuanz@google.com>
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

---

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
 include/net/netmem.h | 40 ++++++++++++++++++++++++++++++++++++++++
 net/core/devmem.c    | 36 ++++++++++++++++++++++++++++++++++++
 3 files changed, 89 insertions(+)

diff --git a/include/net/devmem.h b/include/net/devmem.h
index fa03bdabdffd9..cd3186f5d1fbd 100644
--- a/include/net/devmem.h
+++ b/include/net/devmem.h
@@ -68,7 +68,20 @@ int net_devmem_bind_dmabuf(struct net_device *dev, unsigned int dmabuf_fd,
 void net_devmem_unbind_dmabuf(struct net_devmem_dmabuf_binding *binding);
 int net_devmem_bind_dmabuf_to_queue(struct net_device *dev, u32 rxq_idx,
 				    struct net_devmem_dmabuf_binding *binding);
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
index 72e932a1a9489..33014370a8858 100644
--- a/include/net/netmem.h
+++ b/include/net/netmem.h
@@ -14,8 +14,48 @@
 
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
+/* This returns the absolute dma_addr_t calculated from
+ * net_iov_owner(niov)->owner->base_dma_addr, not the page_pool-owned
+ * niov->dma_addr.
+ *
+ * The absolute dma_addr_t is a dma_addr_t that is always uncompressed.
+ *
+ * The page_pool-owner niov->dma_addr is the absolute dma_addr compressed into
+ * an unsigned long. Special handling is done when the unsigned long is 32-bit
+ * but the dma_addr_t is 64-bit.
+ *
+ * In general code looking for the dma_addr_t should use net_iov_dma_addr(),
+ * while page_pool code looking for the unsigned long dma_addr which mirrors
+ * the field in struct page should use niov->dma_addr.
+ */
+static inline dma_addr_t net_iov_dma_addr(const struct net_iov *niov)
+{
+	struct dmabuf_genpool_chunk_owner *owner = net_iov_owner(niov);
+
+	return owner->base_dma_addr +
+	       ((dma_addr_t)net_iov_idx(niov) << PAGE_SHIFT);
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
index d82f92d7cf9ce..1f90e23a81441 100644
--- a/net/core/devmem.c
+++ b/net/core/devmem.c
@@ -54,6 +54,42 @@ void __net_devmem_dmabuf_binding_free(struct net_devmem_dmabuf_binding *binding)
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
+	niov->dma_addr = 0;
+
+	net_devmem_dmabuf_binding_get(binding);
+
+	return niov;
+}
+
+void net_devmem_free_dmabuf(struct net_iov *niov)
+{
+	struct net_devmem_dmabuf_binding *binding = net_iov_binding(niov);
+	unsigned long dma_addr = net_iov_dma_addr(niov);
+
+	if (gen_pool_has_addr(binding->chunk_pool, dma_addr, PAGE_SIZE))
+		gen_pool_free(binding->chunk_pool, dma_addr, PAGE_SIZE);
+
+	net_devmem_dmabuf_binding_put(binding);
+}
+
 /* Protected by rtnl_lock() */
 static DEFINE_XARRAY_FLAGS(net_devmem_dmabuf_bindings, XA_FLAGS_ALLOC1);
 
-- 
2.45.0.118.g7fe29c98d7-goog


