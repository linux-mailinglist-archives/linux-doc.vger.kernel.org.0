Return-Path: <linux-doc+bounces-32279-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FF89E9CED
	for <lists+linux-doc@lfdr.de>; Mon,  9 Dec 2024 18:23:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C0051888150
	for <lists+linux-doc@lfdr.de>; Mon,  9 Dec 2024 17:23:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 363901ACECC;
	Mon,  9 Dec 2024 17:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vNwLd3QY"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B45153BEE
	for <linux-doc@vger.kernel.org>; Mon,  9 Dec 2024 17:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733764996; cv=none; b=KtAjDWgdYFgWI7ThIfWfyAyQJZ7y94lKNe0qxCeAtFeyVusu053+xbf55El+aga7bwerewLHyIkmdeMHzXVPQqXbxk438Vg8NzSUrUS0QR9O7SO5RBVvC5kok9E2pGZUn2LOUclfzNvEyKXa0Yh+9gglaf5hj0mhu5R0nnvQf7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733764996; c=relaxed/simple;
	bh=lQfAFg7vJgxi9OjV7bauJ/1kar4rQKjYUxhdr7gNz1k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=r2pm3SIzhdkenK3QLCs0xmHTsayfyF4IyC8RRcXSEgzJ80Mqeo2Y4Qb3SOvX339KSbabdKAqKxB4asfchl5Dqi2SL86PcQrOIVmUnne05HFtNd9bRu8+UWS4jQ0sDZbJmWSCkDsUB6TJCdnZuQUn7Zx6kBlrzVO6lb+XqAphTIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vNwLd3QY; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-21638389f63so15101595ad.1
        for <linux-doc@vger.kernel.org>; Mon, 09 Dec 2024 09:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733764994; x=1734369794; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nE0FAhiHaVprqthAMs1Dt/qkIqw0SXPDfEZZnxfWrQY=;
        b=vNwLd3QYoxul29btk5FKhqRyB4Su2Sha5BCLBu/N4LN3YA2Eoyf3Yw2WYuC/rL3RkJ
         G7L7hbFmqW3SadjRXiEcxK9bVuoT0EXom5qcyAVuIVN5zRQFZrrBnbcrN8FFogyH7qG7
         A79Rf1bppg2K6E+R118lVTxUI15GDIcUH3ErKPx/n2FFNUv/KjXmsfwIIQnnYXcHbji3
         gs9xGdWmoTuTAZ6wjlqTqaMFWJw90scVBXH2l9bo5nARvpPdwbz7vLFhW85zzZ0OF8oD
         b1PTPZg4ZuIQQLnCy81wBqLpsT4iT0oYm8K7aNkJNhaAEhcB2KYIyysGxO+pEZM9jhs2
         w/WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733764994; x=1734369794;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nE0FAhiHaVprqthAMs1Dt/qkIqw0SXPDfEZZnxfWrQY=;
        b=RCAqq66+HYwE9tTEmxkzJgeasRsvRIaSZWIZDnyW/dRGKuVC2oOBzkYydWQlFdXLMW
         dwHDW51m5PpcWju5L+wqxZvBfa5i9qUsWdKSJeV6Ng6LYyL4h72xUrSxdAxtzMb2g8uZ
         zIiW4dewrR26ASPqvBqh4Az4g1PXMU9vyK2PstQCUyrtHyMht51c2ZmkJ5t6LymsBoKG
         WVmp1z5u0y05kF1TnfqnGZMzXUj9AXcFZdSB/i52DJzOk4q1X7YULXoWmaVCFG2L0G3/
         tf348h/Im0YEPfF8vq/YUpb2f8yJivG3PeSuG8cHsiLEapXcEo5G2/tva3xaThsH331h
         sa6g==
X-Forwarded-Encrypted: i=1; AJvYcCU9MDmCmD3k+RgMkf2r7H/DcAKKru2XvF7wprNKudXXrTvxQqkixmaZpPIctiseY+Zfj2RW/SyBOyk=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt+O6IZ4Z65ZNADA0MD0b2/3vzLLsjtuLsDAteTzuThWat9H4q
	CjCpI7pEEjP/uYX6gIDw71Z0j/Uk9uOFERry1J4nYBWDRX2uXW3y+pP6bi77+uAuIoT0+FxUy6g
	ByICmtR7pHuinwfvXFBs5Ng==
X-Google-Smtp-Source: AGHT+IFCo5TbvvYzh/ha90pLeOQqK6P9Tb30kFFDIMqZP/IEwwYWLejUgQjCQbcWae6bZ1ydijSIcF6G8vl7/+Coag==
X-Received: from pljj21.prod.google.com ([2002:a17:902:c3d5:b0:212:4d11:70f5])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:c40d:b0:215:e98c:c5c1 with SMTP id d9443c01a7336-21614d5f937mr203578225ad.30.1733764993940;
 Mon, 09 Dec 2024 09:23:13 -0800 (PST)
Date: Mon,  9 Dec 2024 17:23:05 +0000
In-Reply-To: <20241209172308.1212819-1-almasrymina@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241209172308.1212819-1-almasrymina@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241209172308.1212819-3-almasrymina@google.com>
Subject: [PATCH net-next v3 2/5] net: page_pool: create page_pool_alloc_netmem
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, 
	Mina Almasry <almasrymina@google.com>, Pavel Begunkov <asml.silence@gmail.com>, 
	Kaiyuan Zhang <kaiyuanz@google.com>, Willem de Bruijn <willemb@google.com>, 
	Samiullah Khawaja <skhawaja@google.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
	Stanislav Fomichev <sdf@fomichev.me>
Content-Type: text/plain; charset="UTF-8"

Create page_pool_alloc_netmem to be the mirror of page_pool_alloc.

This enables drivers that want currently use page_pool_alloc to
transition to netmem by converting the call sites to
page_pool_alloc_netmem.

Signed-off-by: Mina Almasry <almasrymina@google.com>
Acked-by: Stanislav Fomichev <sdf@fomichev.me>
---
 include/net/page_pool/helpers.h | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/include/net/page_pool/helpers.h b/include/net/page_pool/helpers.h
index 793e6fd78bc5..8e548ff3044c 100644
--- a/include/net/page_pool/helpers.h
+++ b/include/net/page_pool/helpers.h
@@ -116,22 +116,22 @@ static inline struct page *page_pool_dev_alloc_frag(struct page_pool *pool,
 	return page_pool_alloc_frag(pool, offset, size, gfp);
 }
 
-static inline struct page *page_pool_alloc(struct page_pool *pool,
-					   unsigned int *offset,
-					   unsigned int *size, gfp_t gfp)
+static inline netmem_ref page_pool_alloc_netmem(struct page_pool *pool,
+						unsigned int *offset,
+						unsigned int *size, gfp_t gfp)
 {
 	unsigned int max_size = PAGE_SIZE << pool->p.order;
-	struct page *page;
+	netmem_ref netmem;
 
 	if ((*size << 1) > max_size) {
 		*size = max_size;
 		*offset = 0;
-		return page_pool_alloc_pages(pool, gfp);
+		return page_pool_alloc_netmems(pool, gfp);
 	}
 
-	page = page_pool_alloc_frag(pool, offset, *size, gfp);
-	if (unlikely(!page))
-		return NULL;
+	netmem = page_pool_alloc_frag_netmem(pool, offset, *size, gfp);
+	if (unlikely(!netmem))
+		return 0;
 
 	/* There is very likely not enough space for another fragment, so append
 	 * the remaining size to the current fragment to avoid truesize
@@ -142,7 +142,14 @@ static inline struct page *page_pool_alloc(struct page_pool *pool,
 		pool->frag_offset = max_size;
 	}
 
-	return page;
+	return netmem;
+}
+
+static inline struct page *page_pool_alloc(struct page_pool *pool,
+					   unsigned int *offset,
+					   unsigned int *size, gfp_t gfp)
+{
+	return netmem_to_page(page_pool_alloc_netmem(pool, offset, size, gfp));
 }
 
 /**
-- 
2.47.0.338.g60cca15819-goog


