Return-Path: <linux-doc+bounces-33536-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE579F9D76
	for <lists+linux-doc@lfdr.de>; Sat, 21 Dec 2024 01:52:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8E05A189699B
	for <lists+linux-doc@lfdr.de>; Sat, 21 Dec 2024 00:52:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77A763BBF0;
	Sat, 21 Dec 2024 00:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TD6WIrMH"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96EE7B660
	for <linux-doc@vger.kernel.org>; Sat, 21 Dec 2024 00:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734742298; cv=none; b=ofIWRONOXS3Oq7pHBZ4/preq+K64lbZcH+kWIamUSfAOfTjSMzJuO+AMjMBLXJzTtOtD8cReBnClLYibDFYH8uatwoG33KaXdHaPGUrewWkiacnV8jVepfJPeiNNzRjl2sZo2Y4braGBIm6c1Mc1H+1NuhKTJdnCe9ZF3PYHhbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734742298; c=relaxed/simple;
	bh=Q4IYKRzUgikdQrLO/xeVDk1fFg7Nif3uP+CIswjEMhs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=d22dlid1AK6xQowOak7gocQhcnDA6ltazn8Dbrf3tSlZ/0nhfiwxDluYt3kFWU4wdmjnSgFRiC1+XET6W9ktGVB/BxouWQsmA8iO4DJ+9QGPzhGq8x3+AI0Jgmb7uPapcpXbvxcqrP5f2Iw85vzLJRpiZvJPcBWKISLYMaiFZNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TD6WIrMH; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-21655569152so21173115ad.2
        for <linux-doc@vger.kernel.org>; Fri, 20 Dec 2024 16:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734742296; x=1735347096; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1SuvBd87z8dQBsyZrB5o6nLF21oYWt912VciCuuXhAk=;
        b=TD6WIrMH/PSeZefcZH/xSj8V3zntcrPdAiHuasTxB3oG7xVCbZ7Rk7JxFi2D6wBXqo
         tvWgvXDv0t+k7ZI8mMCyaZ4TRgdPZOeFuwcfFcsYjNbjIZK3RVR5V+CWLcWH4K9j3DY/
         dzJP5PPR8lXeEho8ax3i8hHFiooOjj1/C4q/hPGGbPSNwA8ucPVrk9d7V5nx4Bm/lTbR
         SfavQTmWd6WqNOb56BTbSjOP+7EO4bGlU2iN6q4cG9eeIhvfJ805vV5bJhIBONUDmeXM
         CLkLkmGvB1X3wqRv9y1yOG9YY3vIFh72li1rLgXm+pkrjKqSX3u9Q47MdwKFtXsVOc9Y
         eUgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734742296; x=1735347096;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1SuvBd87z8dQBsyZrB5o6nLF21oYWt912VciCuuXhAk=;
        b=RiYFVxM6WXLIvYrGyggQL8CKSfYv9s3TYb/GqW3A8hI1RGRxq83+70Fve1hCPUh2o7
         znpd6OreSE4CBZnL4StvncLI6R7GXH2HlowSDR2HzSdIgOz3D+gqcEPZWvXYprAoRPpB
         2EYQJALgVkUCnKYoWr9u1DmgsyTIdLbESkZTHLs6VM0m4Cn8c+T72w6+7zx97aSj3MsF
         VpzMzNZvmxAwLukvkrXjvssWhFvJntPSVlcD3yUf6aqYRydIaWI+K5UoYyoo59Yeo1Kv
         oYi172xgGD+p/Qwr0+OT/uR5XDVE2Jut3nh6IwXLJrUYt+YLUJyTwfkoogfwm+8qYZKg
         DzXg==
X-Forwarded-Encrypted: i=1; AJvYcCUVf3tDbp+XjmnK7WfdcpjEJUrfIKquHbcK+OE3zsRrix6KiNfu2de+PL7x68zDd1/EY/nMqKCZS2s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9gb8jxyLwYqesvIm5hLzjppvwzl4/AyAIPbsKLqLZRsk872z6
	0VhtaNbycRtkExPzGppYe3qehNlCz12SXwqg2Gfj5TD3vefd6dJLLMvvLMQIP3o36my5Obc1KrU
	aZ1A91tGVwpdjIG0s/UQrQg==
X-Google-Smtp-Source: AGHT+IHjSak1jAgwlXPNoXP7dkl7+gaTr1FCoaGK/MjoAkKJUhx1FnZaoq8kHAbuzx5bYAxn+DO+wEw8pti8Saz7mQ==
X-Received: from plhc14.prod.google.com ([2002:a17:903:234e:b0:216:21cb:2dfe])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:ebc9:b0:212:fa3:f627 with SMTP id d9443c01a7336-219e6e9f9a2mr71116625ad.16.1734742295746;
 Fri, 20 Dec 2024 16:51:35 -0800 (PST)
Date: Sat, 21 Dec 2024 00:42:32 +0000
In-Reply-To: <20241221004236.2629280-1-almasrymina@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241221004236.2629280-1-almasrymina@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241221004236.2629280-2-almasrymina@google.com>
Subject: [PATCH RFC net-next v1 1/5] net: add devmem TCP TX documentation
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, virtualization@lists.linux.dev, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org
Cc: Mina Almasry <almasrymina@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Donald Hunter <donald.hunter@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Andrew Lunn <andrew+netdev@lunn.ch>, David Ahern <dsahern@kernel.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	"=?UTF-8?q?Eugenio=20P=C3=A9rez?=" <eperezma@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
	Stefano Garzarella <sgarzare@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Kaiyuan Zhang <kaiyuanz@google.com>, Pavel Begunkov <asml.silence@gmail.com>, 
	Willem de Bruijn <willemb@google.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Joe Damato <jdamato@fastly.com>, dw@davidwei.uk
Content-Type: text/plain; charset="UTF-8"

Add documentation outlining the usage and details of the devmem TCP TX
API.

Signed-off-by: Mina Almasry <almasrymina@google.com>
---
 Documentation/networking/devmem.rst | 140 +++++++++++++++++++++++++++-
 1 file changed, 136 insertions(+), 4 deletions(-)

diff --git a/Documentation/networking/devmem.rst b/Documentation/networking/devmem.rst
index d95363645331..9be01cd96ee2 100644
--- a/Documentation/networking/devmem.rst
+++ b/Documentation/networking/devmem.rst
@@ -62,15 +62,15 @@ More Info
     https://lore.kernel.org/netdev/20240831004313.3713467-1-almasrymina@google.com/
 
 
-Interface
-=========
+RX Interface
+============
 
 
 Example
 -------
 
-tools/testing/selftests/net/ncdevmem.c:do_server shows an example of setting up
-the RX path of this API.
+./tools/testing/selftests/drivers/net/hw/ncdevmem:do_server shows an example of
+setting up the RX path of this API.
 
 
 NIC Setup
@@ -235,6 +235,138 @@ can be less than the tokens provided by the user in case of:
 (a) an internal kernel leak bug.
 (b) the user passed more than 1024 frags.
 
+TX Interface
+============
+
+
+Example
+-------
+
+./tools/testing/selftests/drivers/net/hw/ncdevmem:do_client shows an example of
+setting up the TX path of this API.
+
+
+NIC Setup
+---------
+
+The user must bind a TX dmabuf to a given NIC using the netlink API::
+
+        struct netdev_bind_tx_req *req = NULL;
+        struct netdev_bind_tx_rsp *rsp = NULL;
+        struct ynl_error yerr;
+
+        *ys = ynl_sock_create(&ynl_netdev_family, &yerr);
+
+        req = netdev_bind_tx_req_alloc();
+        netdev_bind_tx_req_set_ifindex(req, ifindex);
+        netdev_bind_tx_req_set_fd(req, dmabuf_fd);
+
+        rsp = netdev_bind_tx(*ys, req);
+
+        tx_dmabuf_id = rsp->id;
+
+
+The netlink API returns a dmabuf_id: a unique ID that refers to this dmabuf
+that has been bound.
+
+The user can unbind the dmabuf from the netdevice by closing the netlink socket
+that established the binding. We do this so that the binding is automatically
+unbound even if the userspace process crashes.
+
+Note that any reasonably well-behaved dmabuf from any exporter should work with
+devmem TCP, even if the dmabuf is not actually backed by devmem. An example of
+this is udmabuf, which wraps user memory (non-devmem) in a dmabuf.
+
+Socket Setup
+------------
+
+The user application must use MSG_ZEROCOPY flag when sending devmem TCP. Devmem
+cannot be copied by the kernel, so the semantics of the devmem TX are similar
+to the semantics of MSG_ZEROCOPY.
+
+	ret = setsockopt(socket_fd, SOL_SOCKET, SO_ZEROCOPY, &opt, sizeof(opt));
+
+Sending data
+--------------
+
+Devmem data is sent using the SCM_DEVMEM_DMABUF cmsg.
+
+The user should create a msghdr with iov_base set to NULL and iov_len set to the
+number of bytes to be sent from the dmabuf.
+
+The user passes the dma-buf id via the dmabuf_tx_cmsg.dmabuf_id, and passes the
+offset into the dmabuf from where to start sending using the
+dmabuf_tx_cmsg.dmabuf_offset field::
+
+        char ctrl_data[CMSG_SPACE(sizeof(struct dmabuf_tx_cmsg))];
+        struct dmabuf_tx_cmsg ddmabuf;
+        struct msghdr msg = {};
+        struct cmsghdr *cmsg;
+        uint64_t off = 100;
+        struct iovec iov;
+
+	iov.iov_base = NULL;
+	iov.iov_len = line_size;
+
+	msg.msg_iov = &iov;
+	msg.msg_iovlen = 1;
+
+	msg.msg_control = ctrl_data;
+	msg.msg_controllen = sizeof(ctrl_data);
+
+	cmsg = CMSG_FIRSTHDR(&msg);
+	cmsg->cmsg_level = SOL_SOCKET;
+	cmsg->cmsg_type = SCM_DEVMEM_DMABUF;
+	cmsg->cmsg_len = CMSG_LEN(sizeof(struct dmabuf_tx_cmsg));
+
+	ddmabuf.dmabuf_id = tx_dmabuf_id;
+	ddmabuf.dmabuf_offset = off;
+
+	*((struct dmabuf_tx_cmsg *)CMSG_DATA(cmsg)) = ddmabuf;
+
+	ret = sendmsg(socket_fd, &msg, MSG_ZEROCOPY);
+
+Reusing TX dmabufs
+------------------
+
+Similar to MSG_ZEROCOPY with regular memory, the user should not modify the
+contents of the dma-buf while a send operation is in progress. This is because
+the kernel does not keep a copy of the dmabuf contents. Instead, the kernel
+will pin and send data from the buffer available to the userspace.
+
+Just as in MSG_ZEROCOPY, the kernel notifies the userspace of send completions
+using MSG_ERRQUEUE::
+
+        int64_t tstop = gettimeofday_ms() + waittime_ms;
+        char control[CMSG_SPACE(100)] = {};
+        struct sock_extended_err *serr;
+        struct msghdr msg = {};
+        struct cmsghdr *cm;
+        int retries = 10;
+        __u32 hi, lo;
+
+        msg.msg_control = control;
+        msg.msg_controllen = sizeof(control);
+
+        while (gettimeofday_ms() < tstop) {
+                if (!do_poll(fd)) continue;
+
+                ret = recvmsg(fd, &msg, MSG_ERRQUEUE);
+
+                for (cm = CMSG_FIRSTHDR(&msg); cm; cm = CMSG_NXTHDR(&msg, cm)) {
+                        serr = (void *)CMSG_DATA(cm);
+
+                        hi = serr->ee_data;
+                        lo = serr->ee_info;
+
+                        fprintf(stdout, "tx complete [%d,%d]\n", lo, hi);
+                }
+        }
+
+After the associated sendmsg has been completed, the dmabuf can be reused by
+the userspace.
+
+
 Implementation & Caveats
 ========================
 
-- 
2.47.1.613.gc27f4b7a9f-goog


