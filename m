Return-Path: <linux-doc+bounces-36711-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 301C8A266E8
	for <lists+linux-doc@lfdr.de>; Mon,  3 Feb 2025 23:40:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA04B3A588E
	for <lists+linux-doc@lfdr.de>; Mon,  3 Feb 2025 22:40:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50F0D212B37;
	Mon,  3 Feb 2025 22:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gyZSljAV"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74BA2101BD
	for <linux-doc@vger.kernel.org>; Mon,  3 Feb 2025 22:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738622367; cv=none; b=pei4tDbKk09asEvQxvdBCNHuougIgN4e8h/JFOqyrgBVTGmIjodUZ5yY8RXB/76/PWLAa9/7fiFW508jyV/1k93TxU0d6rbLjKveK8UY5wRfZqPy0pgDcm68NpW7h755YvS2/ZJYoo7B5P6DaGfkLlm/XCdE13sjo1jb1tBsUCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738622367; c=relaxed/simple;
	bh=E9ctK/poFQ58gKtoNoX5ieGA/joniFMVp8KL024oVgY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Q3ErrtTXF5E1uv6LF9j2uKbuCf0KxhJqGpq2gODpl+euwv9/WDwByi4fqxEbW+VGIRrJjzDytvOW4rlgx668pCOx6fPeO58ab9eP0HcM0UQqxfXbw5QBw7ik+v2UBooCIqxd1lS2l/tvJ+Xf/mLpn9w4okTMSqQKuyCNdie8HkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gyZSljAV; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2166f9f52fbso161412745ad.2
        for <linux-doc@vger.kernel.org>; Mon, 03 Feb 2025 14:39:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738622364; x=1739227164; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9QoG1IX3VKf0iSgQmXqfz0x8dnartqdM80wF5XjRoPo=;
        b=gyZSljAV8RRBQg2VmpeBkPGWruA7F5yiFn/atKqnxZP0PJG/ZEE0ZnTKqd8ytUWVRr
         pNVEwN/2kFnRQTMkZrOCngeSOd1EGnJw1CDFEjyJOUbq+GNrHr4M/hlrC5LOB2YLhjO4
         L2o2CXgv7o+k5GsFxvOb5+QPIeni9NLnnDOdwfJrvm3SChzroXP0/MYgEr5EE0SeH14J
         g3JdUY5/YjUJTov8VRMFRt6Lp7ZxEPwyuT4FhJP6uW1sM5B2dlJ/9AdIwI2zK0KitZZE
         a3b3FeoQq90NWKoOFOqTN4gYb7vnfeuDRiAEPiO4ebad34Fo7FUbqpL3oLk5vS+LSed/
         7lTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738622364; x=1739227164;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9QoG1IX3VKf0iSgQmXqfz0x8dnartqdM80wF5XjRoPo=;
        b=prtfrTLK2VsJYokX6KxM8FCfkKic/+9u1P5AgRJXBuZcGqQgGbOYKaTM/Hx4s6o2Dj
         x9hDscBsSM79W6M1WKxffibSl+ZHjsH3KtwQC3c/FsvTWQfKHAgQJDgtEKXNa+yRhnA7
         rZcJxqIVRNBF077wOly/3KihRhXjeoFcXbQh4O5WPpW1cL7CqH+xnjhOKe/UkCqdeo2l
         6PHDlnq8LHPvEqeNezDfrMwpK/vRGxu56bc4DzVIhJqWjLHhdyw4/X5T76Z6Q4BtSiLf
         s+lHltsmR4k54ETIhBlXv2EEfOPtRG77zhO5Cn6I0azmzHmYHhARsmRB72Duafa3YtuH
         wcMg==
X-Forwarded-Encrypted: i=1; AJvYcCUYZY+s6oayL6zDC60MQewDw8ivkPSM4IC0d55uImoDcur1d73T76yaIdRLlQNwDfRglevSNT/UU38=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSwjDAdyKlYLN2F6Vismi7K0piabSIva6AVgznuViLQxvKi0wu
	Wulcyr6QjYdF47B86NF6NXclWVDt6wSyGvKGXjkTD60x9Vmq7rJDT1Q2r6zY19/FsRk99BOYLvd
	DEve4wTABXzDY0wU7ZVUu+A==
X-Google-Smtp-Source: AGHT+IGd9E1uzoDNwwzafdy0csHGORrkGiyiT6++YmdgkD7II8siJy6QkaN+wMaIlrdg6BZIw6g7aZw11tgOGPqaUQ==
X-Received: from plgv14.prod.google.com ([2002:a17:902:e8ce:b0:21a:7e04:7006])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:1c5:b0:210:f706:dc4b with SMTP id d9443c01a7336-21dd7c653b7mr322527705ad.13.1738622364115;
 Mon, 03 Feb 2025 14:39:24 -0800 (PST)
Date: Mon,  3 Feb 2025 22:39:14 +0000
In-Reply-To: <20250203223916.1064540-1-almasrymina@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250203223916.1064540-1-almasrymina@google.com>
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Message-ID: <20250203223916.1064540-5-almasrymina@google.com>
Subject: [PATCH net-next v3 4/6] net: devmem: TCP tx netlink api
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

From: Stanislav Fomichev <sdf@fomichev.me>

Add bind-tx netlink call to attach dmabuf for TX; queue is not
required, only ifindex and dmabuf fd for attachment.

Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
Signed-off-by: Mina Almasry <almasrymina@google.com>


---

v3:
- Fix ynl-regen.sh error (Simon).
---
 Documentation/netlink/specs/netdev.yaml | 12 ++++++++++++
 include/uapi/linux/netdev.h             |  1 +
 net/core/netdev-genl-gen.c              | 13 +++++++++++++
 net/core/netdev-genl-gen.h              |  1 +
 net/core/netdev-genl.c                  |  6 ++++++
 tools/include/uapi/linux/netdev.h       |  1 +
 6 files changed, 34 insertions(+)

diff --git a/Documentation/netlink/specs/netdev.yaml b/Documentation/netlink/specs/netdev.yaml
index cbb544bd6c84..93f4333e7bc6 100644
--- a/Documentation/netlink/specs/netdev.yaml
+++ b/Documentation/netlink/specs/netdev.yaml
@@ -711,6 +711,18 @@ operations:
             - defer-hard-irqs
             - gro-flush-timeout
             - irq-suspend-timeout
+    -
+      name: bind-tx
+      doc: Bind dmabuf to netdev for TX
+      attribute-set: dmabuf
+      do:
+        request:
+          attributes:
+            - ifindex
+            - fd
+        reply:
+          attributes:
+            - id
 
 kernel-family:
   headers: [ "linux/list.h"]
diff --git a/include/uapi/linux/netdev.h b/include/uapi/linux/netdev.h
index e4be227d3ad6..04364ef5edbe 100644
--- a/include/uapi/linux/netdev.h
+++ b/include/uapi/linux/netdev.h
@@ -203,6 +203,7 @@ enum {
 	NETDEV_CMD_QSTATS_GET,
 	NETDEV_CMD_BIND_RX,
 	NETDEV_CMD_NAPI_SET,
+	NETDEV_CMD_BIND_TX,
 
 	__NETDEV_CMD_MAX,
 	NETDEV_CMD_MAX = (__NETDEV_CMD_MAX - 1)
diff --git a/net/core/netdev-genl-gen.c b/net/core/netdev-genl-gen.c
index 996ac6a449eb..f27608d6301c 100644
--- a/net/core/netdev-genl-gen.c
+++ b/net/core/netdev-genl-gen.c
@@ -99,6 +99,12 @@ static const struct nla_policy netdev_napi_set_nl_policy[NETDEV_A_NAPI_IRQ_SUSPE
 	[NETDEV_A_NAPI_IRQ_SUSPEND_TIMEOUT] = { .type = NLA_UINT, },
 };
 
+/* NETDEV_CMD_BIND_TX - do */
+static const struct nla_policy netdev_bind_tx_nl_policy[NETDEV_A_DMABUF_FD + 1] = {
+	[NETDEV_A_DMABUF_IFINDEX] = NLA_POLICY_MIN(NLA_U32, 1),
+	[NETDEV_A_DMABUF_FD] = { .type = NLA_U32, },
+};
+
 /* Ops table for netdev */
 static const struct genl_split_ops netdev_nl_ops[] = {
 	{
@@ -190,6 +196,13 @@ static const struct genl_split_ops netdev_nl_ops[] = {
 		.maxattr	= NETDEV_A_NAPI_IRQ_SUSPEND_TIMEOUT,
 		.flags		= GENL_ADMIN_PERM | GENL_CMD_CAP_DO,
 	},
+	{
+		.cmd		= NETDEV_CMD_BIND_TX,
+		.doit		= netdev_nl_bind_tx_doit,
+		.policy		= netdev_bind_tx_nl_policy,
+		.maxattr	= NETDEV_A_DMABUF_FD,
+		.flags		= GENL_CMD_CAP_DO,
+	},
 };
 
 static const struct genl_multicast_group netdev_nl_mcgrps[] = {
diff --git a/net/core/netdev-genl-gen.h b/net/core/netdev-genl-gen.h
index e09dd7539ff2..c1fed66e92b9 100644
--- a/net/core/netdev-genl-gen.h
+++ b/net/core/netdev-genl-gen.h
@@ -34,6 +34,7 @@ int netdev_nl_qstats_get_dumpit(struct sk_buff *skb,
 				struct netlink_callback *cb);
 int netdev_nl_bind_rx_doit(struct sk_buff *skb, struct genl_info *info);
 int netdev_nl_napi_set_doit(struct sk_buff *skb, struct genl_info *info);
+int netdev_nl_bind_tx_doit(struct sk_buff *skb, struct genl_info *info);
 
 enum {
 	NETDEV_NLGRP_MGMT,
diff --git a/net/core/netdev-genl.c b/net/core/netdev-genl.c
index 715f85c6b62e..0e41699df419 100644
--- a/net/core/netdev-genl.c
+++ b/net/core/netdev-genl.c
@@ -911,6 +911,12 @@ int netdev_nl_bind_rx_doit(struct sk_buff *skb, struct genl_info *info)
 	return err;
 }
 
+/* stub */
+int netdev_nl_bind_tx_doit(struct sk_buff *skb, struct genl_info *info)
+{
+	return 0;
+}
+
 void netdev_nl_sock_priv_init(struct list_head *priv)
 {
 	INIT_LIST_HEAD(priv);
diff --git a/tools/include/uapi/linux/netdev.h b/tools/include/uapi/linux/netdev.h
index e4be227d3ad6..04364ef5edbe 100644
--- a/tools/include/uapi/linux/netdev.h
+++ b/tools/include/uapi/linux/netdev.h
@@ -203,6 +203,7 @@ enum {
 	NETDEV_CMD_QSTATS_GET,
 	NETDEV_CMD_BIND_RX,
 	NETDEV_CMD_NAPI_SET,
+	NETDEV_CMD_BIND_TX,
 
 	__NETDEV_CMD_MAX,
 	NETDEV_CMD_MAX = (__NETDEV_CMD_MAX - 1)
-- 
2.48.1.362.g079036d154-goog


