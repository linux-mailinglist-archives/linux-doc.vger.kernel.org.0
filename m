Return-Path: <linux-doc+bounces-16223-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 795998C2CF6
	for <lists+linux-doc@lfdr.de>; Sat, 11 May 2024 01:22:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E67771F2108F
	for <lists+linux-doc@lfdr.de>; Fri, 10 May 2024 23:22:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C66C1779B4;
	Fri, 10 May 2024 23:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="J1PReMeK"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB20D17556E
	for <linux-doc@vger.kernel.org>; Fri, 10 May 2024 23:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715383298; cv=none; b=cfLnQVfSPhAJXoaYgNZmax/gPIKN+Eb5Xi+fWi/F78Ag4L+ouM7gp0ogLfxCmxoPpRUdoM1Z58kqBSSrfhqxjJLGGKrKqToX2hSHKH3Bn6hyM1re23aI0yx1gEVcPgkYpn0mK/YsnnbmUI67H2T41LqZDUFk6bWcodunsG0Vyek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715383298; c=relaxed/simple;
	bh=0kA+CRNkKTBA6hSiOuG7oV2Ep3RdtN0eU0HRWoBGQOM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=blgMuV4ly1QpHIxgjM47SeUoDrYpkX8Efel1KUUCEVHCW8+lfnMmhrVQnJNxw4TofMW8PFHqAbPh0Iz17vCLP3wpCvwkkvP7mwFXwqANYVz/zuK+USgPMn/boljmnNKr2Iq7qPp0sSS27UrydYX+r9Fy/i1KAYlghG1lVj0OHEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=J1PReMeK; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6207c483342so42611667b3.1
        for <linux-doc@vger.kernel.org>; Fri, 10 May 2024 16:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715383295; x=1715988095; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=MdPPwqmw2OB2eps2P/fXT/DBVgNwUukZ4bhTdtZp228=;
        b=J1PReMeKqbcAnOocv+c4AjpbeBvfnkUX+c8r1WSgwHIi8fPFQF3d+I51ulR0AN+MW4
         153EMRg9rnxGrYpsUqOnUTdo2AXMlQAO8ZU1jAufYw0JoUy+QTSQqvIA7tSRCkIGwn/n
         gs5bIjFbCHLg96sZaP4zMb/Xr8H37EhC5tO/Qp9w1EjwKqdtjPFKZtdb+0yZxQ5U/ERc
         r+E4et9ANUtkMXvlra/s7kEG3vkOngby1QyKuyyE7df2/P2AhFZsUUsItJa8JuYgOa+5
         N+h4wl2ACGHbNUpA+eQ6MTUbZeKE2N6RSFoIH6CoENT+3DGvQbhrPWMJq4LBW/y4qkTw
         uzAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715383295; x=1715988095;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MdPPwqmw2OB2eps2P/fXT/DBVgNwUukZ4bhTdtZp228=;
        b=tNnxGsOiA4fDvcS1fyq3hYp9lr72bmwyxVewdSQUfxEJY4nt8FGG/VdhoIyUyAOynb
         pIkAgIWNVnwSTS0Sfx4qy/Xr17TIyfNxLayU9FAK4TVnwm8/qoauKnM/Sy66O93GdwFt
         I09HQ/J6T1GtaR37Ehe1fhXSK1TuttTItZhu2oM07nWYHOlJ/NcLwYh976rKsDGuVHTC
         j/khHAI6/fXIl8ptDZN1hviRZP+KvQs4wNM78O6NaB/1Aniq2dJyFk12iidrDgYwY54L
         aXBiTdXXGf9snAmpNhPI3Q12G7cFDdQrUcDVJjP+7IFZfIuVIwYRSY2D3Rl0lai0wx8m
         P7ew==
X-Forwarded-Encrypted: i=1; AJvYcCW5ppV8Byrg08cx01xiTCCogeOLSue7vRVWIfxZmlSwsOcD4VcQ8dtUXFdm8GKYb9fbmhDm8EjaxkvQi4+a4jvbqRDON8pGWFaW
X-Gm-Message-State: AOJu0Yyiu0VS/TbfO67iWt7Ax3T55xC8wlnHC9Hj8PIJze9MF9+C5bOY
	dyVIGXb4ZDw0zsk2Jk0CzkS7Xk2IZKBGD/e4UckYSoTucGvDBDoObAM7wekzPbJnTnHDND+a21C
	VeVoAKtXKQgnwefYgYGlEXA==
X-Google-Smtp-Source: AGHT+IHMXabhPnmA8ZNpFjS6LuGhr4/4Qtsxh1KKctSTjcGfvpS/yXd7v1SAm2EHkPFeDF0lY3JAnqUdXw/wbkGhCQ==
X-Received: from almasrymina.svl.corp.google.com ([2620:15c:2c4:200:3428:1b4e:e75a:d31b])
 (user=almasrymina job=sendgmr) by 2002:a05:690c:c9d:b0:618:8e4b:f49d with
 SMTP id 00721157ae682-622aff868c9mr10915787b3.4.1715383294779; Fri, 10 May
 2024 16:21:34 -0700 (PDT)
Date: Fri, 10 May 2024 16:21:12 -0700
In-Reply-To: <20240510232128.1105145-1-almasrymina@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240510232128.1105145-1-almasrymina@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240510232128.1105145-2-almasrymina@google.com>
Subject: [PATCH net-next v9 01/14] netdev: add netdev_rx_queue_restart()
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
	Praveen Kaligineedi <pkaligineedi@google.com>
Content-Type: text/plain; charset="UTF-8"

Add netdev_rx_queue_restart() function to netdev_rx_queue.h

Signed-off-by: David Wei <dw@davidwei.uk>
Signed-off-by: Mina Almasry <almasrymina@google.com>

---

v9: https://lore.kernel.org/all/20240502045410.3524155-4-dw@davidwei.uk/
(submitted by David).
- fixed SPDX license identifier (Simon).
- Rebased on top of merged queue API definition, and changed
  implementation to match that.
- Replace rtnl_lock() with rtnl_is_locked() to make it useable from my
  netlink code where rtnl is already locked.

---
 include/net/netdev_rx_queue.h |  3 ++
 net/core/Makefile             |  1 +
 net/core/netdev_rx_queue.c    | 74 +++++++++++++++++++++++++++++++++++
 3 files changed, 78 insertions(+)
 create mode 100644 net/core/netdev_rx_queue.c

diff --git a/include/net/netdev_rx_queue.h b/include/net/netdev_rx_queue.h
index aa1716fb0e53c..e78ca52d67fbf 100644
--- a/include/net/netdev_rx_queue.h
+++ b/include/net/netdev_rx_queue.h
@@ -54,4 +54,7 @@ get_netdev_rx_queue_index(struct netdev_rx_queue *queue)
 	return index;
 }
 #endif
+
+int netdev_rx_queue_restart(struct net_device *dev, unsigned int rxq);
+
 #endif
diff --git a/net/core/Makefile b/net/core/Makefile
index 62be9aef25285..f82232b358a2c 100644
--- a/net/core/Makefile
+++ b/net/core/Makefile
@@ -19,6 +19,7 @@ obj-$(CONFIG_NETDEV_ADDR_LIST_TEST) += dev_addr_lists_test.o
 
 obj-y += net-sysfs.o
 obj-y += hotdata.o
+obj-y += netdev_rx_queue.o
 obj-$(CONFIG_PAGE_POOL) += page_pool.o page_pool_user.o
 obj-$(CONFIG_PROC_FS) += net-procfs.o
 obj-$(CONFIG_NET_PKTGEN) += pktgen.o
diff --git a/net/core/netdev_rx_queue.c b/net/core/netdev_rx_queue.c
new file mode 100644
index 0000000000000..b3899358e5a9c
--- /dev/null
+++ b/net/core/netdev_rx_queue.c
@@ -0,0 +1,74 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include <linux/netdevice.h>
+#include <net/netdev_queues.h>
+#include <net/netdev_rx_queue.h>
+
+int netdev_rx_queue_restart(struct net_device *dev, unsigned int rxq_idx)
+{
+	void *new_mem, *old_mem;
+	int err;
+
+	if (!dev->queue_mgmt_ops->ndo_queue_stop ||
+	    !dev->queue_mgmt_ops->ndo_queue_mem_free ||
+	    !dev->queue_mgmt_ops->ndo_queue_mem_alloc ||
+	    !dev->queue_mgmt_ops->ndo_queue_start)
+		return -EOPNOTSUPP;
+
+	DEBUG_NET_WARN_ON_ONCE(!rtnl_is_locked());
+
+	new_mem = kvzalloc(dev->queue_mgmt_ops->ndo_queue_mem_size, GFP_KERNEL);
+	if (!new_mem)
+		return -ENOMEM;
+
+	old_mem = kvzalloc(dev->queue_mgmt_ops->ndo_queue_mem_size, GFP_KERNEL);
+	if (!old_mem) {
+		err = -ENOMEM;
+		goto err_free_new_mem;
+	}
+
+	err = dev->queue_mgmt_ops->ndo_queue_mem_alloc(dev, new_mem, rxq_idx);
+	if (err)
+		goto err_free_old_mem;
+
+	err = dev->queue_mgmt_ops->ndo_queue_stop(dev, old_mem, rxq_idx);
+	if (err)
+		goto err_free_new_queue_mem;
+
+	err = dev->queue_mgmt_ops->ndo_queue_start(dev, new_mem, rxq_idx);
+	if (err)
+		goto err_start_queue;
+
+	dev->queue_mgmt_ops->ndo_queue_mem_free(dev, old_mem);
+
+	kvfree(old_mem);
+	kvfree(new_mem);
+
+	return 0;
+
+err_start_queue:
+	/* Restarting the queue with old_mem should be successful as we haven't
+	 * changed any of the queue configuration, and there is not much we can
+	 * do to recover from a failure here.
+	 *
+	 * WARN if the we fail to recover the old rx queue, and at least free
+	 * old_mem so we don't also leak that.
+	 */
+	if (dev->queue_mgmt_ops->ndo_queue_start(dev, old_mem, rxq_idx)) {
+		WARN(1,
+		     "Failed to restart old queue in error path. RX queue %d may be unhealthy.",
+		     rxq_idx);
+		dev->queue_mgmt_ops->ndo_queue_mem_free(dev, &old_mem);
+	}
+
+err_free_new_queue_mem:
+	dev->queue_mgmt_ops->ndo_queue_mem_free(dev, new_mem);
+
+err_free_old_mem:
+	kvfree(old_mem);
+
+err_free_new_mem:
+	kvfree(new_mem);
+
+	return err;
+}
-- 
2.45.0.118.g7fe29c98d7-goog


