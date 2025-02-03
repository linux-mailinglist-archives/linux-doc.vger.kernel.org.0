Return-Path: <linux-doc+bounces-36710-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C297A266E1
	for <lists+linux-doc@lfdr.de>; Mon,  3 Feb 2025 23:40:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2B7907A2E72
	for <lists+linux-doc@lfdr.de>; Mon,  3 Feb 2025 22:39:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E48B211A2E;
	Mon,  3 Feb 2025 22:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="O1t8gFJx"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B052116EB
	for <linux-doc@vger.kernel.org>; Mon,  3 Feb 2025 22:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738622365; cv=none; b=UBAPLyRUKvQnGeuYogjsxOl2LH+X4GMU2me9F4okvbti5Fv6y3JQuO7d/7gOcOes0gGbczkRC8Cr5N10uSNXn48cuWIFRKkcb/NiDLbM+DPPpgYItuCv+lD0RZvCOe8rMMcgzowqPTm5IGHdno5N8CRPBmSAG8KSnJGw/exa8ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738622365; c=relaxed/simple;
	bh=yALvHvPZ06XHv8lSBAulVCm+vGbBL+K++sbCUEtN9RI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Jiy+4Sjcxkyp3ZLRq0cefHeffuZGJfbgqXzb3iXWC/+0t2utejaw8+gkqaPQPB+354+nnVTXM25IvpSk5cpSEKSaADl2EcO90HZUsbkDvDyuOC9dmVO4OwGpAeUBzKqoiSdhRjBm2ENb1tuO1k1Y2Mhfs6AiD03CtiZDPfdc+RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=O1t8gFJx; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2ee5616e986so13751278a91.2
        for <linux-doc@vger.kernel.org>; Mon, 03 Feb 2025 14:39:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738622363; x=1739227163; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=XpaVlDvetL7z/kA++uxshgtjRqWTMmKZzr7CrXSNsGU=;
        b=O1t8gFJxWHXbJshEom2KpZELhLSDr082QdCOFdY7T2nkNV0pBUwYUGOf4ErDGFC2CC
         BChcVfUFxnGL9czFF26RPPKjxvN3BZjYjHtjXa/PRRAXvNw6AZo2EMCoZCu0HYMokats
         Wvtpng2mfqOlwUF3r+exswH1neB72+QIlOTnD7qe1fjN3XzY/GANIuR68iMd2MZEj9km
         VHxyL8QrVFdAXboK+dyeJ7vtfT9eitxGldW/SNYe3mdgJjKjnF53Atrhj5F3K4PdG9DP
         a6IhxvszQNHj+i7thxEtN/RBKSL5JlmFJWuvd7ZGE4BgJjbO3Ak6E1UMoU+juuz6JNfV
         mxLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738622363; x=1739227163;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XpaVlDvetL7z/kA++uxshgtjRqWTMmKZzr7CrXSNsGU=;
        b=i8T3WF2Pf7l7tjUco4tdDRYHCbacJq81NlS/8qtsm7/udqoPsuVVEXNstWK3lwcmt1
         ObUGxQEFQJrhCwYjQUhW4zvPIiIw53wkrMmDjq/waBFmI/6Ti9B5obQdAQmdRnkgZnHl
         znq03lRei1W1a3Y6iGPDpJQr8Dw1XEu8qS6r9JSraJmUQ/V1EoPTWlVHJE9j5JCPv5D/
         ycWoiX1lz9zO9kDEu7dyBr1chjaa29JklVh4vc0Qk1peJuZjEdLFerEQHa0pPvDzL7oc
         wQq5S35YaJQlwjzAufcX73oJkkFyCsVWMTw+Gf1Io4fkBenoCSv1FPi+wHYifXLxEMoh
         s+NQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLF97GKkutbLbN3+l/QkqcAv075t6dg5Uv2PwM1PpefdSrwhmdoHpfFHhC2/U6A/erfA/9Bbc3juQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh5pLdc1SnBfsr1TKRuLSd7/T8Y8QEnxj0wksLLOvVKBYwV27b
	4kz8GD03Texq2nXPcMLeZtJoSza2CsJmS8XMBDMedsNA46FvaTHxlByG1jyGSrS1j3ABvIgJ/wb
	4n7kBPtWCV0joLVCsK8Gdyg==
X-Google-Smtp-Source: AGHT+IHFrrUGIUMZPQVWORflbnoiwG8EF+LwGiuHsHmsbKPYPdBL0OXUy8C/28kCzgcGFB8+h6vXLwmDicd/+JIqDg==
X-Received: from pfbll11.prod.google.com ([2002:a05:6a00:728b:b0:728:b8e3:9934])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:b93:b0:1e1:bdae:e054 with SMTP id adf61e73a8af0-1ed7a643882mr39519231637.25.1738622362684;
 Mon, 03 Feb 2025 14:39:22 -0800 (PST)
Date: Mon,  3 Feb 2025 22:39:13 +0000
In-Reply-To: <20250203223916.1064540-1-almasrymina@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250203223916.1064540-1-almasrymina@google.com>
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Message-ID: <20250203223916.1064540-4-almasrymina@google.com>
Subject: [PATCH net-next v3 3/6] net: add get_netmem/put_netmem support
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, kvm@vger.kernel.org, 
	virtualization@lists.linux.dev, linux-kselftest@vger.kernel.org
Cc: Mina Almasry <almasrymina@google.com>, Donald Hunter <donald.hunter@gmail.com>, 
	Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Neal Cardwell <ncardwell@google.com>, David Ahern <dsahern@kernel.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	"=?UTF-8?q?Eugenio=20P=C3=A9rez?=" <eperezma@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
	Stefano Garzarella <sgarzare@redhat.com>, Shuah Khan <shuah@kernel.org>, sdf@fomichev.me, 
	asml.silence@gmail.com, dw@davidwei.uk, Jamal Hadi Salim <jhs@mojatatu.com>, 
	Victor Nogueira <victor@mojatatu.com>, Pedro Tammela <pctammela@mojatatu.com>, 
	Samiullah Khawaja <skhawaja@google.com>
Content-Type: text/plain; charset="UTF-8"

Currently net_iovs support only pp ref counts, and do not support a
page ref equivalent.

This is fine for the RX path as net_iovs are used exclusively with the
pp and only pp refcounting is needed there. The TX path however does not
use pp ref counts, thus, support for get_page/put_page equivalent is
needed for netmem.

Support get_netmem/put_netmem. Check the type of the netmem before
passing it to page or net_iov specific code to obtain a page ref
equivalent.

For dmabuf net_iovs, we obtain a ref on the underlying binding. This
ensures the entire binding doesn't disappear until all the net_iovs have
been put_netmem'ed. We do not need to track the refcount of individual
dmabuf net_iovs as we don't allocate/free them from a pool similar to
what the buddy allocator does for pages.

This code is written to be extensible by other net_iov implementers.
get_netmem/put_netmem will check the type of the netmem and route it to
the correct helper:

pages -> [get|put]_page()
dmabuf net_iovs -> net_devmem_[get|put]_net_iov()
new net_iovs ->	new helpers

Signed-off-by: Mina Almasry <almasrymina@google.com>


---

v2:
- Add comment on top of refcount_t ref explaining the usage in the XT
  path.
- Fix missing definition of net_devmem_dmabuf_binding_put in this patch.
---
 include/linux/skbuff_ref.h |  4 ++--
 include/net/netmem.h       |  3 +++
 net/core/devmem.c          | 10 ++++++++++
 net/core/devmem.h          | 20 ++++++++++++++++++++
 net/core/skbuff.c          | 30 ++++++++++++++++++++++++++++++
 5 files changed, 65 insertions(+), 2 deletions(-)

diff --git a/include/linux/skbuff_ref.h b/include/linux/skbuff_ref.h
index 0f3c58007488..9e49372ef1a0 100644
--- a/include/linux/skbuff_ref.h
+++ b/include/linux/skbuff_ref.h
@@ -17,7 +17,7 @@
  */
 static inline void __skb_frag_ref(skb_frag_t *frag)
 {
-	get_page(skb_frag_page(frag));
+	get_netmem(skb_frag_netmem(frag));
 }
 
 /**
@@ -40,7 +40,7 @@ static inline void skb_page_unref(netmem_ref netmem, bool recycle)
 	if (recycle && napi_pp_put_page(netmem))
 		return;
 #endif
-	put_page(netmem_to_page(netmem));
+	put_netmem(netmem);
 }
 
 /**
diff --git a/include/net/netmem.h b/include/net/netmem.h
index 1b58faa4f20f..d30f31878a09 100644
--- a/include/net/netmem.h
+++ b/include/net/netmem.h
@@ -245,4 +245,7 @@ static inline unsigned long netmem_get_dma_addr(netmem_ref netmem)
 	return __netmem_clear_lsb(netmem)->dma_addr;
 }
 
+void get_netmem(netmem_ref netmem);
+void put_netmem(netmem_ref netmem);
+
 #endif /* _NET_NETMEM_H */
diff --git a/net/core/devmem.c b/net/core/devmem.c
index 3bba3f018df0..20985a570662 100644
--- a/net/core/devmem.c
+++ b/net/core/devmem.c
@@ -333,6 +333,16 @@ void dev_dmabuf_uninstall(struct net_device *dev)
 	}
 }
 
+void net_devmem_get_net_iov(struct net_iov *niov)
+{
+	net_devmem_dmabuf_binding_get(niov->owner->binding);
+}
+
+void net_devmem_put_net_iov(struct net_iov *niov)
+{
+	net_devmem_dmabuf_binding_put(niov->owner->binding);
+}
+
 /*** "Dmabuf devmem memory provider" ***/
 
 int mp_dmabuf_devmem_init(struct page_pool *pool)
diff --git a/net/core/devmem.h b/net/core/devmem.h
index 76099ef9c482..8b51caff5a0e 100644
--- a/net/core/devmem.h
+++ b/net/core/devmem.h
@@ -27,6 +27,10 @@ struct net_devmem_dmabuf_binding {
 	 * The binding undos itself and unmaps the underlying dmabuf once all
 	 * those refs are dropped and the binding is no longer desired or in
 	 * use.
+	 *
+	 * net_devmem_get_net_iov() on dmabuf net_iovs will increment this
+	 * reference, making sure that the binding remains alive until all the
+	 * net_iovs are no longer used.
 	 */
 	refcount_t ref;
 
@@ -119,6 +123,9 @@ net_devmem_dmabuf_binding_put(struct net_devmem_dmabuf_binding *binding)
 	__net_devmem_dmabuf_binding_free(binding);
 }
 
+void net_devmem_get_net_iov(struct net_iov *niov);
+void net_devmem_put_net_iov(struct net_iov *niov);
+
 struct net_iov *
 net_devmem_alloc_dmabuf(struct net_devmem_dmabuf_binding *binding);
 void net_devmem_free_dmabuf(struct net_iov *ppiov);
@@ -126,6 +133,19 @@ void net_devmem_free_dmabuf(struct net_iov *ppiov);
 #else
 struct net_devmem_dmabuf_binding;
 
+static inline void
+net_devmem_dmabuf_binding_put(struct net_devmem_dmabuf_binding *binding)
+{
+}
+
+static inline void net_devmem_get_net_iov(struct net_iov *niov)
+{
+}
+
+static inline void net_devmem_put_net_iov(struct net_iov *niov)
+{
+}
+
 static inline void
 __net_devmem_dmabuf_binding_free(struct net_devmem_dmabuf_binding *binding)
 {
diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index a441613a1e6c..815245d5c36b 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -88,6 +88,7 @@
 #include <linux/textsearch.h>
 
 #include "dev.h"
+#include "devmem.h"
 #include "netmem_priv.h"
 #include "sock_destructor.h"
 
@@ -7290,3 +7291,32 @@ bool csum_and_copy_from_iter_full(void *addr, size_t bytes,
 	return false;
 }
 EXPORT_SYMBOL(csum_and_copy_from_iter_full);
+
+void get_netmem(netmem_ref netmem)
+{
+	if (netmem_is_net_iov(netmem)) {
+		/* Assume any net_iov is devmem and route it to
+		 * net_devmem_get_net_iov. As new net_iov types are added they
+		 * need to be checked here.
+		 */
+		net_devmem_get_net_iov(netmem_to_net_iov(netmem));
+		return;
+	}
+	get_page(netmem_to_page(netmem));
+}
+EXPORT_SYMBOL(get_netmem);
+
+void put_netmem(netmem_ref netmem)
+{
+	if (netmem_is_net_iov(netmem)) {
+		/* Assume any net_iov is devmem and route it to
+		 * net_devmem_put_net_iov. As new net_iov types are added they
+		 * need to be checked here.
+		 */
+		net_devmem_put_net_iov(netmem_to_net_iov(netmem));
+		return;
+	}
+
+	put_page(netmem_to_page(netmem));
+}
+EXPORT_SYMBOL(put_netmem);
-- 
2.48.1.362.g079036d154-goog


