Return-Path: <linux-doc+bounces-40277-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C07A57EC1
	for <lists+linux-doc@lfdr.de>; Sat,  8 Mar 2025 22:41:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 561897A3F2E
	for <lists+linux-doc@lfdr.de>; Sat,  8 Mar 2025 21:40:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 896DD212B3E;
	Sat,  8 Mar 2025 21:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xQ2uiICG"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BA9202F9A
	for <linux-doc@vger.kernel.org>; Sat,  8 Mar 2025 21:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741470051; cv=none; b=Tu+Dm7L/yipiCBFi6V0B+uqQ2POlhumjPvbvrklzD9q5cRx49Zt7bCbwEan3OxYjNab6RBLJMzlFe/bWiKzNs2zS8EbWhvX8/1kiHUjqH7DfPGmlvni65Z3ibgfLu2yW1mCzzbaPMt7gqgN2YUbFwBbRQnM9YJdN2e/Shofsgrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741470051; c=relaxed/simple;
	bh=1gKSJ1zhftBSMc9cuS8nUiycP8+YXffYCs0yXilMSBo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=g/X51Trh7THT+fG2veX8FirENxkaqg4NFAsDKXPH2n93lD6K0NDihMeZBVjiiiO03xGm+ihpcevWJQ92FQCVUkUEyKuoBlfu7xLGgFSYmkAS+aGpaWAyXMpAl9C2Gd3wjBzAmwJtEz3RFXBaDfm1usHLq+Kd47m2Zhn4xeNXWwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xQ2uiICG; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2ff7aecba07so3534040a91.2
        for <linux-doc@vger.kernel.org>; Sat, 08 Mar 2025 13:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741470049; x=1742074849; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tX6BmoNjuzIzQpeeDWDPAAnCBo+DQIywGklr81dGywI=;
        b=xQ2uiICG9X8jqkFh8qGewG1I0erAW8qDUyBKZg3VOhUkkDYrbeUZZlo4jJNofukfBN
         apkTcMxVMKow5Fw2hOZ5C/XoLl2eq2feHKoEClImlwLXTz6YoRD7Rg4VkTNxbjsOHY98
         Fl9BlAkh3xDdUk1E9hipKGd19rIb/O3CORtopeH6ZqJ6g3unGjHtdbj1IYI4BI/rchx4
         tQP6/s2UpQuGpuceL66VxVieyRvSSJTbaNnRl74AlE3iQKbKxUvado9Z1nwxnOimYpeH
         n9ytSLGTHh1snO0xZmSZAzivVqiRe/dW70stXB+wixWJNm47uctgoPkI9fDCLsAmIxCF
         Bx8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741470049; x=1742074849;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tX6BmoNjuzIzQpeeDWDPAAnCBo+DQIywGklr81dGywI=;
        b=lo5zCpPE7G6adPYpqn2U3USRrcyMdjjKkdkq9FxaQll96abIviof49rkCmunEUDwv1
         750jT+sUFefy3STsqzbWGkQ1NayDFVVMIeNXrtYp3CrKCdnWfQoehx7P3iHsw37Du6j3
         Xhg/yG1CDZ45gtpFpwIes5KFrmH9GRHTHYiPucJ8235egSzGrQgTpLs/CAOefDDYRoCV
         1WdiNHsPxn9QqyrGxkZCku3veBeaFTGHOWhkHjVdK+aBH2GGlM8ALrsYn/sMrh0S2lx1
         ov+WogvlnfnJaLoiWe6QTRXXlSNtnAiC68dLiA5WRigFWM1JAqx9OmTtRZvX1EYDxfAi
         cg3g==
X-Forwarded-Encrypted: i=1; AJvYcCWEgYUEtvA6F+u/QIJ1RK3wfL/HYDUL24f6pHWQEX+OYePqFY8ckip2f/f/K9Un4ozXo4abdWqs0B0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrR3GsaQYkhNVh5N2iChN+yXhy1HyWSDwEQLs9GGERku5l5zSv
	C1GW/k4egKUyeiETvIfTL/ZijerJ475auDLRL6/GFTuNOj5wBjtB7H43+HVPTOh3pWL4G9T3H0Q
	/BZM/9S9D2ftQNxLFntZpSw==
X-Google-Smtp-Source: AGHT+IGosKIoAKeyr/SG8ND6M+mWt52v5RM08qZWQV+Ah7+Pc16NBy99FOItw+U5mA3+iLTD73K+eFUwb0dExaCk+w==
X-Received: from pgbdo7.prod.google.com ([2002:a05:6a02:e87:b0:af3:27c:5603])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:7483:b0:1ee:d317:48e9 with SMTP id adf61e73a8af0-1f544ad8152mr15572734637.6.1741470048718;
 Sat, 08 Mar 2025 13:40:48 -0800 (PST)
Date: Sat,  8 Mar 2025 21:40:37 +0000
In-Reply-To: <20250308214045.1160445-1-almasrymina@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250308214045.1160445-1-almasrymina@google.com>
X-Mailer: git-send-email 2.49.0.rc0.332.g42c0ae87b1-goog
Message-ID: <20250308214045.1160445-2-almasrymina@google.com>
Subject: [PATCH net-next v7 1/9] netmem: add niov->type attribute to
 distinguish different net_iov types
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

Later patches in the series adds TX net_iovs where there is no pp
associated, so we can't rely on niov->pp->mp_ops to tell what is the
type of the net_iov.

Add a type enum to the net_iov which tells us the net_iov type.

Signed-off-by: Mina Almasry <almasrymina@google.com>

---

v7:
- New patch

---
 include/net/netmem.h | 15 ++++++++++++++-
 net/core/devmem.c    |  3 ++-
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/include/net/netmem.h b/include/net/netmem.h
index c61d5b21e7b4..16ef53ea713a 100644
--- a/include/net/netmem.h
+++ b/include/net/netmem.h
@@ -20,8 +20,21 @@ DECLARE_STATIC_KEY_FALSE(page_pool_mem_providers);
  */
 #define NET_IOV 0x01UL
 
+enum net_iov_type {
+	/* The unspecified type is temporary until the io_uring net_iovs being
+	 * worked on in parallel are migrated to specify their type, then this
+	 * can be deprecated.
+	 */
+	NET_IOV_UNSPECIFIED = 0,
+	NET_IOV_DMABUF,
+
+	/* Force size to unsigned long to make the NET_IOV_ASSERTS below pass.
+	 */
+	NET_IOV_MAX = ULONG_MAX,
+};
+
 struct net_iov {
-	unsigned long __unused_padding;
+	enum net_iov_type type;
 	unsigned long pp_magic;
 	struct page_pool *pp;
 	struct net_iov_area *owner;
diff --git a/net/core/devmem.c b/net/core/devmem.c
index 7c6e0b5b6acb..69c160ad3ebd 100644
--- a/net/core/devmem.c
+++ b/net/core/devmem.c
@@ -32,7 +32,7 @@ static const struct memory_provider_ops dmabuf_devmem_ops;
 
 bool net_is_devmem_iov(struct net_iov *niov)
 {
-	return niov->pp->mp_ops == &dmabuf_devmem_ops;
+	return niov->type == NET_IOV_DMABUF;
 }
 
 static void net_devmem_dmabuf_free_chunk_owner(struct gen_pool *genpool,
@@ -297,6 +297,7 @@ net_devmem_bind_dmabuf(struct net_device *dev, unsigned int dmabuf_fd,
 
 		for (i = 0; i < owner->area.num_niovs; i++) {
 			niov = &owner->area.niovs[i];
+			niov->type = NET_IOV_DMABUF;
 			niov->owner = &owner->area;
 			page_pool_set_dma_addr_netmem(net_iov_to_netmem(niov),
 						      net_devmem_get_dma_addr(niov));
-- 
2.49.0.rc0.332.g42c0ae87b1-goog


