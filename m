Return-Path: <linux-doc+bounces-39077-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 76241A40B32
	for <lists+linux-doc@lfdr.de>; Sat, 22 Feb 2025 20:16:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2B1587A3AE5
	for <lists+linux-doc@lfdr.de>; Sat, 22 Feb 2025 19:15:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A0442135DE;
	Sat, 22 Feb 2025 19:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TkdB5niS"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D841212F8F
	for <linux-doc@vger.kernel.org>; Sat, 22 Feb 2025 19:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740251726; cv=none; b=QeA+W5/AAXThI+y7bdXjFfa1KN3xMUCrHj9oZtu5kR3gaswYkLefU5XIjDp/LYXr7s641lb7e1WaFWu1/sa47I0WqAHwh3iyWP/2M2oNM7/RIsliamuOFIQQXYXl/jTmJJ6HKsho3TAKNhgg3ALEZDCBwR2c6lqdqr87OJqt67A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740251726; c=relaxed/simple;
	bh=gkFfOfu9WKr9FRA5K4klVB4y4vYEdazePHQP6t2RXWM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Goetq87Y4vfK9T/XW6rWHCCz28yBKIWp/E7E+lJ7YEhpmktbgy9H6lpjZHHvW/G3t5A8BVpzp4Z6Ti5IJxx7kj9+N8aVQySQab0IYFb/MSSVjD3f/JEaSTBRNuxdDUOdfWiXOvMc913s0f4xSAEGE6lG6siO+Nn58wfUB/i5m+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TkdB5niS; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2fc1a4c150bso6218592a91.2
        for <linux-doc@vger.kernel.org>; Sat, 22 Feb 2025 11:15:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740251723; x=1740856523; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4+uD/U2vycUjudt2AEI4HSs62q3AICmDnc2uCCI12W0=;
        b=TkdB5niSeZ3CB92Hub+N3OBSk3Bqf6fQEEDHDHoN+mfevcyHhAEtcNBhs4+1veBD8w
         jgj8V4SEwjlp/m+fjwLwx3uzpinbZYpkk/vwwyFT4GRTzk2oKEsO+h/MEgflVgsQIb/p
         6q9WKZC6M+do20e+e+yvejMjVl5KRxT9a6KJw4U2RHcVicejuWyYgWIAPoROPy3uPwsi
         GJJoL6BTIY3DXY3C/oaF6S38bcK2BWLdXHNn5xphmNZlm4YQE0c99F3fwWSLJdeAXGZ2
         Dpic3ckpnyV/evw4yG7C0u6EwCQ4RAWmwFf+9PPnp2G415/HWQN7XCg5wTJdCpoDVauX
         5yww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740251723; x=1740856523;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4+uD/U2vycUjudt2AEI4HSs62q3AICmDnc2uCCI12W0=;
        b=Y/U/cKpHKtu4vAiMSILMZuz9RWTGRzyeTirNGvruTlCHt89UGRt1f3r6DpeYmJR8p5
         /lc/P1Gpg5N6at0AwvKXuBbSZfhFxg8Dj2YWGz2oiu1sqSUraUYlGpWsApksgc6fMLG2
         jJmBgtn+zswpQG4GwLd0noniU0q0MPGSl/GNex4fr0KlD0Y6wZl/pryB3Vqps2u4OIX9
         BSQCUY9v0ApAl67Xe2FSWawx50f6PNj7ICAnYWgbBhdPzuUtimmqIwNoCd/9faNeZnh6
         7jaLM2xd1Lagmbee+7EB0KZ6pnxNVoT1NErv48TJ7Zr3SxPdLJ6jWKqAxNkD1/Y/n8+H
         YztQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmYhPsopJVlerN5Xm2kB3J/eh9eojQzJs4NoJ0Zl1ePh9H9wI84SylOfflfV+UWarTQXJBrKRScuE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0q17tZVjX3ONjyaZsMg5tZ0zB3norZk5SDmF1ILoci39QKSnO
	GG72fQzZ39ECUuWyeAjUMcUFGkAGlFGdXg8Tv0r33D0Ex0PeOXm90iRi7AaGMzGWJXphxMy6M8w
	HWcY/U4MZ0WV5SXBSn+TgCw==
X-Google-Smtp-Source: AGHT+IE7XiVmXUXukuSBBLpyvBO/788RzbPT/XMlnfm7Hb5OdS2UTsI8RXz5o7RCEpNhWS4Hqe/8fBalyM3FmRuqgw==
X-Received: from pgmr22.prod.google.com ([2002:a63:2056:0:b0:ad5:4a28:559a])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:7011:b0:1ee:d7fa:5d8f with SMTP id adf61e73a8af0-1eef3d5a9dfmr14749939637.27.1740251723639;
 Sat, 22 Feb 2025 11:15:23 -0800 (PST)
Date: Sat, 22 Feb 2025 19:15:10 +0000
In-Reply-To: <20250222191517.743530-1-almasrymina@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250222191517.743530-1-almasrymina@google.com>
X-Mailer: git-send-email 2.48.1.601.g30ceb7b040-goog
Message-ID: <20250222191517.743530-3-almasrymina@google.com>
Subject: [PATCH net-next v5 2/9] net: devmem: TCP tx netlink api
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, virtualization@lists.linux.dev, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org
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
index 36f1152bfac3..e560b05eb528 100644
--- a/Documentation/netlink/specs/netdev.yaml
+++ b/Documentation/netlink/specs/netdev.yaml
@@ -743,6 +743,18 @@ operations:
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
index 7600bf62dbdf..7eb9571786b8 100644
--- a/include/uapi/linux/netdev.h
+++ b/include/uapi/linux/netdev.h
@@ -219,6 +219,7 @@ enum {
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
index 2b774183d31c..6e5f2de4d947 100644
--- a/net/core/netdev-genl.c
+++ b/net/core/netdev-genl.c
@@ -931,6 +931,12 @@ int netdev_nl_bind_rx_doit(struct sk_buff *skb, struct genl_info *info)
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
index 7600bf62dbdf..7eb9571786b8 100644
--- a/tools/include/uapi/linux/netdev.h
+++ b/tools/include/uapi/linux/netdev.h
@@ -219,6 +219,7 @@ enum {
 	NETDEV_CMD_QSTATS_GET,
 	NETDEV_CMD_BIND_RX,
 	NETDEV_CMD_NAPI_SET,
+	NETDEV_CMD_BIND_TX,
 
 	__NETDEV_CMD_MAX,
 	NETDEV_CMD_MAX = (__NETDEV_CMD_MAX - 1)
-- 
2.48.1.601.g30ceb7b040-goog


