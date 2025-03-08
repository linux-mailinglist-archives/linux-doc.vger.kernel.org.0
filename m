Return-Path: <linux-doc+bounces-40282-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A66F2A57EDB
	for <lists+linux-doc@lfdr.de>; Sat,  8 Mar 2025 22:42:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 104A87A493F
	for <lists+linux-doc@lfdr.de>; Sat,  8 Mar 2025 21:41:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96528215F64;
	Sat,  8 Mar 2025 21:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XG/xgi4y"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BD221577D
	for <linux-doc@vger.kernel.org>; Sat,  8 Mar 2025 21:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741470060; cv=none; b=AkbPbBCZo6AHJ5nTc9UWONTmfwKLH+gD1mi4+cD9e+f1WIrtH221gI5mTUoBkqX0ewYt3P100Thb15BNnBmj42o8C03Q18PG2LHmrbvv/qQB9dR+kr/g0VFGxVrwtxmxYQHcEg/zVpQjYQNmzsBpQnzGSytHD1iSLWH0IAEP25g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741470060; c=relaxed/simple;
	bh=EuanlU0YhzPMsh9Fv+D25HTrf6PC7vW/kt0OFwlSXtk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=j5oD6xAa9ZIP7qN/+lQL/KSZZgW34QT6LGOs51iMkHPHwgdKlC9UrUTYRdsqZnkzGu1o9tETSRFJxVWNheqqkGxH58qfYyuwDsIQ1Ke7zcqlEypqpBGOhfY41wiRpiBCY/xG6ydPRdWBiFM0XHrf7ZsNkTNR3n4+RE2407J/EkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XG/xgi4y; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ff5f3be6e6so5145213a91.1
        for <linux-doc@vger.kernel.org>; Sat, 08 Mar 2025 13:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741470057; x=1742074857; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=RTUfOwUIRZvDZQegq2DBALS/SAbHr71GuK4ayNmHc88=;
        b=XG/xgi4y4fL7naALjEseVPvEJnxmpVv0pNSO99bmVCSwKyB5J6HApOheHJUcEAjX9t
         vv1TbdUQhxBEObVQ+KYiMgdPLtNnsJ3NVemP4CAZYV4y+wvMsQOpzEbHTYR0S5JqWRxD
         ahuYnXgQ1Z01pijvkZK4hCeQ1FtGVJ/bkrVBCMuB/pj6gY/Ij9934oYFpGbdLfpJJm9d
         3157cjtuaGL9DXcACxMtPl94tK+OcRvHdFoLwaSHnRpSbLZAYyjCQCVBT2J78zYldD5z
         EYu+J8ut5Dw/ofn9Odf/v2iHHWXCUW4ZH7MRSLnPwHQAFYn/18XmKE/OXtNQxkM+A7LA
         yeww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741470057; x=1742074857;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RTUfOwUIRZvDZQegq2DBALS/SAbHr71GuK4ayNmHc88=;
        b=BsmY1jDwGLsepkXw5uBnjj6Zx5wX0sgwdOVFfgbeMuCWVRySLxWuMJPKUYsej5ICyg
         OSBuRVdiK7rXezop4lIVY7GwTlsqrnoCS1KxcX2hlhKb4oYjTgGOl4R0vxWihUlM9VQM
         p0NWn22viYAoW4G698b1Rg/wpgOFEs5IUcDzvEGRgm50BGJTPUR98o8nZ7jVte3ir8zR
         ZfyLkNhX1T3JsVvz/rnkBDQqhA2kNSK34chf1FDDsqpuT+vizx1E0rhAwlfQajTsIwxS
         F3ChzqVZLItHpGUnkGLppct43c8+Bwr+Imnn3kUmorRpL2J4e9UJ19VSOT5tcPXRp/1n
         zmyA==
X-Forwarded-Encrypted: i=1; AJvYcCUQ8dKx6bWu+SUWPaT8ZqI+SAT8FfbBV/ztlvSFhgmT6e8HKTr/7gTpLbmNTYEz6naYR05CXBglB+E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUD6wzMP9jW1Mrz1ET/hoQmBuocHU4AwyX/CglqnF/UlldimIT
	0UsjgrCr5MPsIDmVoL5lCRayHeISYxWJ7PiW7pYWcYnelzVMVpDs/ZvSnapsmB7MSrxYMC8bZQa
	zrbJqJ0sHIBXdjd5EiSjE6w==
X-Google-Smtp-Source: AGHT+IF+qJji92vVM7ENVK7QLbTkaQ8pyPqqTNc3UyFPjNmAEVOG0LmWKiODB/VGhC+7g3NuChwnLxDZaZOw+TV4OQ==
X-Received: from pjbsv15.prod.google.com ([2002:a17:90b:538f:b0:2fa:a101:743])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:1c05:b0:2ee:a583:e616 with SMTP id 98e67ed59e1d1-2ff7ce6d543mr14055421a91.9.1741470057178;
 Sat, 08 Mar 2025 13:40:57 -0800 (PST)
Date: Sat,  8 Mar 2025 21:40:42 +0000
In-Reply-To: <20250308214045.1160445-1-almasrymina@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250308214045.1160445-1-almasrymina@google.com>
X-Mailer: git-send-email 2.49.0.rc0.332.g42c0ae87b1-goog
Message-ID: <20250308214045.1160445-7-almasrymina@google.com>
Subject: [PATCH net-next v7 6/9] net: enable driver support for netmem TX
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, kvm@vger.kernel.org, 
	virtualization@lists.linux.dev, linux-kselftest@vger.kernel.org
Cc: Mina Almasry <almasrymina@google.com>, Donald Hunter <donald.hunter@gmail.com>, 
	Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Jeroen de Borst <jeroendb@google.com>, Harshitha Ramamurthy <hramamurthy@google.com>, 
	Kuniyuki Iwashima <kuniyu@amazon.com>, Willem de Bruijn <willemb@google.com>, David Ahern <dsahern@kernel.org>, 
	Neal Cardwell <ncardwell@google.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
	Stefano Garzarella <sgarzare@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	"=?UTF-8?q?Eugenio=20P=C3=A9rez?=" <eperezma@redhat.com>, Shuah Khan <shuah@kernel.org>, sdf@fomichev.me, 
	asml.silence@gmail.com, dw@davidwei.uk, Jamal Hadi Salim <jhs@mojatatu.com>, 
	Victor Nogueira <victor@mojatatu.com>, Pedro Tammela <pctammela@mojatatu.com>, 
	Samiullah Khawaja <skhawaja@google.com>
Content-Type: text/plain; charset="UTF-8"

Drivers need to make sure not to pass netmem dma-addrs to the
dma-mapping API in order to support netmem TX.

Add helpers and netmem_dma_*() helpers that enables special handling of
netmem dma-addrs that drivers can use.

Document in netmem.rst what drivers need to do to support netmem TX.

Signed-off-by: Mina Almasry <almasrymina@google.com>
Acked-by: Stanislav Fomichev <sdf@fomichev.me>

---

v5:
- Fix netmet TX documentation (Stan).

v4:
- New patch
---
 .../networking/net_cachelines/net_device.rst  |  1 +
 Documentation/networking/netdev-features.rst  |  5 ++++
 Documentation/networking/netmem.rst           | 23 +++++++++++++++++--
 include/linux/netdevice.h                     |  2 ++
 include/net/netmem.h                          | 20 ++++++++++++++++
 5 files changed, 49 insertions(+), 2 deletions(-)

diff --git a/Documentation/networking/net_cachelines/net_device.rst b/Documentation/networking/net_cachelines/net_device.rst
index 6327e689e8a8..8c0334851b45 100644
--- a/Documentation/networking/net_cachelines/net_device.rst
+++ b/Documentation/networking/net_cachelines/net_device.rst
@@ -10,6 +10,7 @@ Type                                Name                        fastpath_tx_acce
 =================================== =========================== =================== =================== ===================================================================================
 unsigned_long:32                    priv_flags                  read_mostly                             __dev_queue_xmit(tx)
 unsigned_long:1                     lltx                        read_mostly                             HARD_TX_LOCK,HARD_TX_TRYLOCK,HARD_TX_UNLOCK(tx)
+unsigned long:1			    netmem_tx:1;	        read_mostly
 char                                name[16]
 struct netdev_name_node*            name_node
 struct dev_ifalias*                 ifalias
diff --git a/Documentation/networking/netdev-features.rst b/Documentation/networking/netdev-features.rst
index 5014f7cc1398..02bd7536fc0c 100644
--- a/Documentation/networking/netdev-features.rst
+++ b/Documentation/networking/netdev-features.rst
@@ -188,3 +188,8 @@ Redundancy) frames from one port to another in hardware.
 This should be set for devices which duplicate outgoing HSR (High-availability
 Seamless Redundancy) or PRP (Parallel Redundancy Protocol) tags automatically
 frames in hardware.
+
+* netmem-tx
+
+This should be set for devices which support netmem TX. See
+Documentation/networking/netmem.rst
diff --git a/Documentation/networking/netmem.rst b/Documentation/networking/netmem.rst
index 7de21ddb5412..b63aded46337 100644
--- a/Documentation/networking/netmem.rst
+++ b/Documentation/networking/netmem.rst
@@ -19,8 +19,8 @@ Benefits of Netmem :
 * Simplified Development: Drivers interact with a consistent API,
   regardless of the underlying memory implementation.
 
-Driver Requirements
-===================
+Driver RX Requirements
+======================
 
 1. The driver must support page_pool.
 
@@ -77,3 +77,22 @@ Driver Requirements
    that purpose, but be mindful that some netmem types might have longer
    circulation times, such as when userspace holds a reference in zerocopy
    scenarios.
+
+Driver TX Requirements
+======================
+
+1. The Driver must not pass the netmem dma_addr to any of the dma-mapping APIs
+   directly. This is because netmem dma_addrs may come from a source like
+   dma-buf that is not compatible with the dma-mapping APIs.
+
+   Helpers like netmem_dma_unmap_page_attrs() & netmem_dma_unmap_addr_set()
+   should be used in lieu of dma_unmap_page[_attrs](), dma_unmap_addr_set().
+   The netmem variants will handle netmem dma_addrs correctly regardless of the
+   source, delegating to the dma-mapping APIs when appropriate.
+
+   Not all dma-mapping APIs have netmem equivalents at the moment. If your
+   driver relies on a missing netmem API, feel free to add and propose to
+   netdev@, or reach out to the maintainers and/or almasrymina@google.com for
+   help adding the netmem API.
+
+2. Driver should declare support by setting `netdev->netmem_tx = true`
diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index 9a297757df7e..ee8aa020eb3c 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -1771,6 +1771,7 @@ enum netdev_reg_state {
  *	@lltx:		device supports lockless Tx. Deprecated for real HW
  *			drivers. Mainly used by logical interfaces, such as
  *			bonding and tunnels
+ *	@netmem_tx:	device support netmem_tx.
  *
  *	@name:	This is the first field of the "visible" part of this structure
  *		(i.e. as seen by users in the "Space.c" file).  It is the name
@@ -2088,6 +2089,7 @@ struct net_device {
 	struct_group(priv_flags_fast,
 		unsigned long		priv_flags:32;
 		unsigned long		lltx:1;
+		unsigned long		netmem_tx:1;
 	);
 	const struct net_device_ops *netdev_ops;
 	const struct header_ops *header_ops;
diff --git a/include/net/netmem.h b/include/net/netmem.h
index e8afe6b654aa..068b6e1760dc 100644
--- a/include/net/netmem.h
+++ b/include/net/netmem.h
@@ -8,6 +8,7 @@
 #ifndef _NET_NETMEM_H
 #define _NET_NETMEM_H
 
+#include <linux/dma-mapping.h>
 #include <linux/mm.h>
 #include <net/net_debug.h>
 
@@ -280,4 +281,23 @@ static inline unsigned long netmem_get_dma_addr(netmem_ref netmem)
 void get_netmem(netmem_ref netmem);
 void put_netmem(netmem_ref netmem);
 
+#define netmem_dma_unmap_addr_set(NETMEM, PTR, ADDR_NAME, VAL)   \
+	do {                                                     \
+		if (!netmem_is_net_iov(NETMEM))                  \
+			dma_unmap_addr_set(PTR, ADDR_NAME, VAL); \
+		else                                             \
+			dma_unmap_addr_set(PTR, ADDR_NAME, 0);   \
+	} while (0)
+
+static inline void netmem_dma_unmap_page_attrs(struct device *dev,
+					       dma_addr_t addr, size_t size,
+					       enum dma_data_direction dir,
+					       unsigned long attrs)
+{
+	if (!addr)
+		return;
+
+	dma_unmap_page_attrs(dev, addr, size, dir, attrs);
+}
+
 #endif /* _NET_NETMEM_H */
-- 
2.49.0.rc0.332.g42c0ae87b1-goog


