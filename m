Return-Path: <linux-doc+bounces-38763-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75571A3CF34
	for <lists+linux-doc@lfdr.de>; Thu, 20 Feb 2025 03:12:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F6DF167078
	for <lists+linux-doc@lfdr.de>; Thu, 20 Feb 2025 02:12:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85C771E5B9F;
	Thu, 20 Feb 2025 02:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="O8lEYp+B"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BF11E3DD3
	for <linux-doc@vger.kernel.org>; Thu, 20 Feb 2025 02:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740017377; cv=none; b=jQYLcC5SnvMucev1RiN96c3fJcryVs1eH5Witgsg570sJnUdJBp5ftFEVAT20ONh71drwPPQJyc2QdKo2LovjENwLcjKMNQqGaDWnhEsbp6DPLYz6p+le8XbmBIp5KxyG/xo2vF796v+vNHUh5DIxM43lrZTAxKCXKuux9doG04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740017377; c=relaxed/simple;
	bh=xktwRXpJMJv986Qo4eDPxj726JXR+3eKG4eS+/XdbOE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=IZhOHkoXcdi8eV86ekBVIB6nfIHuS4tj1u3yZAHyvSVHN1Nt4rhMS/olol2tLl+VQuB9vSRLpfQEhzJpbkSPv0TIgPr3H2fdAYorpZTBLWqnkeeeW3ATPTj/jEMFmepcXisaAbY5WFEAUkIx/IB6ZhsPQPQUlcRtjPiGKaKyFQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=O8lEYp+B; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2fc43be27f8so1486863a91.1
        for <linux-doc@vger.kernel.org>; Wed, 19 Feb 2025 18:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740017374; x=1740622174; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ouoTtMMhd3rb00vY+DSWvls3bj0wfOCkxx6qaQ7XOwM=;
        b=O8lEYp+B+GVf5CBtc+j9zd8esl5qp9PbFOIlFXkgRUQrAGZZrELqla2NTPg2aK3emc
         sl3cy3BV5y91hr5LK3qG+VwHZwZ2d4PjgEuHdJ1NGrU5WZ07DfNEmLdF6izUbgNRSiH+
         0YEb/8yk+ZX8vKRG5Dimu7PlTeE6MPmgMxqvqWlhwum6FXBiPgS0DFvTK9raF9wguRHu
         1KbRNK0uKflT++GpxkxUaRep2pIYBQbr6A9L6xvl1dI7LngmEsmYYE2Z8hbWmR6xEp9m
         WtCI4gzjWX14ITRR8T/v0SDRP5fH/YhfbxFwKkPGmqMrS8cTNR9F5y16RwsDTHJqYXV1
         r3wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740017374; x=1740622174;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ouoTtMMhd3rb00vY+DSWvls3bj0wfOCkxx6qaQ7XOwM=;
        b=Wt3FuJds88lhAapwxKt1Kpsemv1p/3PXqAkK530w00jJDm6l1lZpHM/XkNeEpCFb/I
         P5hC1f1M9R6WZe7Y5AKG/6QtdktkJ1okdG/lChkFLVo94e7SfJYbhC/GL2mZxQY8BC0D
         r614U0RKVpxo19JIOUSkoOQbNpBWEZPwKypxHgLgpbAbpv2ZxC7FnfvApzvkYc3uhaXe
         H5rMMejrJh1JfKwmYt0HQ+E5McJPU1uGlEI9eD1raGUxeoSULUps5v+A8fIEuYMDertE
         kFY4yROmQ6Qy55L/4Cpji1cJ3XWcE1P7wKrhILmGW8Gz25da8SxUX9olNlqGOIM+5uo2
         CKEQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/cxC//FF+tAkWW4CrkJkxHwBhlg+5nZMvaC83FPlBfL98+70NWCL8lHnXnLOGJese/xGbpb36l6Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgEGeeS28TSux5e4fkuHzTJ3kP2dkCnTTl/Kfd3DsEc2oZpJFV
	5ZO+7vdugpJxcMz60Lex7vU+i9IZSTO7mGuJy8P8B79wsx4ch5LB0NJS37LuvTmGdN9RSfa+Xn5
	hCoKumT4DBNqljD8t3/QyHA==
X-Google-Smtp-Source: AGHT+IE63Y1j485C5r+SG910yHgU7D0EniRUvxRKp0z0ZOdOvF2csyUI5aFQVIvnQkQW3zk2gmV0Mv7QAnOs+6jCLQ==
X-Received: from pjc8.prod.google.com ([2002:a17:90b:2f48:b0:2eb:12d7:fedd])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:5202:b0:2fc:3264:3657 with SMTP id 98e67ed59e1d1-2fcb56f6d59mr11204857a91.0.1740017374316;
 Wed, 19 Feb 2025 18:09:34 -0800 (PST)
Date: Thu, 20 Feb 2025 02:09:13 +0000
In-Reply-To: <20250220020914.895431-1-almasrymina@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250220020914.895431-1-almasrymina@google.com>
X-Mailer: git-send-email 2.48.1.601.g30ceb7b040-goog
Message-ID: <20250220020914.895431-9-almasrymina@google.com>
Subject: [PATCH net-next v4 8/9] net: check for driver support in netmem TX
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, virtualization@lists.linux.dev, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org
Cc: Mina Almasry <almasrymina@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Donald Hunter <donald.hunter@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Jeroen de Borst <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>, 
	Shailend Chand <shailend@google.com>, Kuniyuki Iwashima <kuniyu@amazon.com>, 
	Willem de Bruijn <willemb@google.com>, David Ahern <dsahern@kernel.org>, 
	Neal Cardwell <ncardwell@google.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	"=?UTF-8?q?Eugenio=20P=C3=A9rez?=" <eperezma@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
	Stefano Garzarella <sgarzare@redhat.com>, Shuah Khan <shuah@kernel.org>, sdf@fomichev.me, 
	asml.silence@gmail.com, dw@davidwei.uk, Jamal Hadi Salim <jhs@mojatatu.com>, 
	Victor Nogueira <victor@mojatatu.com>, Pedro Tammela <pctammela@mojatatu.com>, 
	Samiullah Khawaja <skhawaja@google.com>
Content-Type: text/plain; charset="UTF-8"

We should not enable netmem TX for drivers that don't declare support.

Check for driver netmem TX support during devmem TX binding and fail if
the driver does not have the functionality.

Check for driver support in validate_xmit_skb as well.

Signed-off-by: Mina Almasry <almasrymina@google.com>

---

v4:
- New patch

---
 net/core/dev.c         | 3 +++
 net/core/netdev-genl.c | 7 +++++++
 2 files changed, 10 insertions(+)

diff --git a/net/core/dev.c b/net/core/dev.c
index ebc000b56828..f65a2b41a2c3 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -3850,6 +3850,9 @@ static struct sk_buff *validate_xmit_skb(struct sk_buff *skb, struct net_device
 
 	skb = validate_xmit_xfrm(skb, features, again);
 
+	if (!skb_frags_readable(skb) && !dev->netmem_tx)
+		goto out_kfree_skb;
+
 	return skb;
 
 out_kfree_skb:
diff --git a/net/core/netdev-genl.c b/net/core/netdev-genl.c
index 1faa2cf4057f..a154480a6e22 100644
--- a/net/core/netdev-genl.c
+++ b/net/core/netdev-genl.c
@@ -970,6 +970,13 @@ int netdev_nl_bind_tx_doit(struct sk_buff *skb, struct genl_info *info)
 		goto err_unlock;
 	}
 
+	if (!netdev->netmem_tx) {
+		err = -EOPNOTSUPP;
+		NL_SET_ERR_MSG(info->extack,
+			       "Driver does not support netmem TX");
+		goto err_unlock;
+	}
+
 	binding = net_devmem_bind_dmabuf(netdev, DMA_TO_DEVICE, dmabuf_fd,
 					 info->extack);
 	if (IS_ERR(binding)) {
-- 
2.48.1.601.g30ceb7b040-goog


