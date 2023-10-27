Return-Path: <linux-doc+bounces-1253-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D014C7D8D7F
	for <lists+linux-doc@lfdr.de>; Fri, 27 Oct 2023 05:39:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35FAA282226
	for <lists+linux-doc@lfdr.de>; Fri, 27 Oct 2023 03:39:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2DB14420;
	Fri, 27 Oct 2023 03:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="AuoT6Ymr"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7D13FDC
	for <linux-doc@vger.kernel.org>; Fri, 27 Oct 2023 03:39:08 +0000 (UTC)
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 596CC1A1
	for <linux-doc@vger.kernel.org>; Thu, 26 Oct 2023 20:39:07 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-565e54cb93aso1315554a12.3
        for <linux-doc@vger.kernel.org>; Thu, 26 Oct 2023 20:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1698377947; x=1698982747; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tMjhw76FECkOO5zRdU6IjOHgP+3TMOQK2mZ19zJdvuE=;
        b=AuoT6Ymrit+ZplwF9h5pZgz5X2ydjFt5NqEFhn5MYDY6PFkj4TMwjfLxY/hqZRqWJL
         n+QeVjvAwwIMabb8Aof754791skcrsrIgCTxK5ZO+hn1PXRY7hhhhveeEtDOjyrk5zxn
         cwucZRpdPKVx3VcrxovDJnbLg0Y3Xe02GJPoiUiyi1D5zU+DY6WRDNUxm77DlBlnIK52
         4RYDp/SKZ8O7jkKsUB7R4EpQjmXoP+yEm5gN97k878r/SkQebOdzl3bRAfvfOrqQ0Egd
         uorpPXUIZLygh/M1AVJY1Aq+EDMZUOljrEckiyiI7T53fJlpeNKuMQ187ycHOFN2bF4M
         7RAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698377947; x=1698982747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tMjhw76FECkOO5zRdU6IjOHgP+3TMOQK2mZ19zJdvuE=;
        b=Fcsvc6mqx1olf6IFZF9aNm2SW8hhOTU/LHoSB6C4NijkjiqpU0CZe+vPks4n6i79yG
         8Eq2unFqPhTh8q7EpMG+2dvzGdB7Tvq7mFfSQG1Wz+07mVz/oIxdofb25OyoKJf2iuVM
         fAgXIqj6U452BAC0RxV1bNYmoMjXnFS2Mk/4qviKUJxNV6GTnnf3j87W/pk95tffHdRA
         Nw3kR1xErQcFf4Q504PoU8BlEhYM9g9nwc34Np2fTseA32FLxsTQagT4FJjOZ3QOoDw/
         Kj4q0AnInZLDSqAfd5UaktvQFZyefep88En3/WQELzUsXPWs8HAdI9GFgXmKp37qpoAz
         TSMw==
X-Gm-Message-State: AOJu0YziH4Sr4SoEsqCG2m2brb0Git0tCVzUkW1PzpcUUGdPWHRu3+kG
	i+MAL6n8kyjWVlWuST/YFHNfKw==
X-Google-Smtp-Source: AGHT+IE+9o1D6mC/tBfbhMEHSHxO+4OKy9VNzv+o8iR1rqr4G54ZqAEfL4OOVueaw3fQnMy76xQeKg==
X-Received: by 2002:a05:6a21:3d89:b0:17b:3cd6:b1bc with SMTP id bj9-20020a056a213d8900b0017b3cd6b1bcmr1812360pzc.14.1698377946837;
        Thu, 26 Oct 2023 20:39:06 -0700 (PDT)
Received: from GL4FX4PXWL.bytedance.net ([203.208.189.7])
        by smtp.gmail.com with ESMTPSA id ms19-20020a17090b235300b00267d9f4d340sm2345676pjb.44.2023.10.26.20.38.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Oct 2023 20:39:06 -0700 (PDT)
From: Peng Zhang <zhangpeng.00@bytedance.com>
To: Liam.Howlett@oracle.com,
	corbet@lwn.net,
	akpm@linux-foundation.org,
	willy@infradead.org,
	brauner@kernel.org,
	surenb@google.com,
	michael.christie@oracle.com,
	mjguzik@gmail.com,
	mathieu.desnoyers@efficios.com,
	npiggin@gmail.com,
	peterz@infradead.org,
	oliver.sang@intel.com,
	mst@redhat.com
Cc: zhangpeng.00@bytedance.com,
	maple-tree@lists.infradead.org,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH v7 01/10] maple_tree: Add mt_free_one() and mt_attr() helpers
Date: Fri, 27 Oct 2023 11:38:36 +0800
Message-Id: <20231027033845.90608-2-zhangpeng.00@bytedance.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20231027033845.90608-1-zhangpeng.00@bytedance.com>
References: <20231027033845.90608-1-zhangpeng.00@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add two helpers:
1. mt_free_one(), used to free a maple node.
2. mt_attr(), used to obtain the attributes of maple tree.

Signed-off-by: Peng Zhang <zhangpeng.00@bytedance.com>
Reviewed-by: Liam R. Howlett <Liam.Howlett@oracle.com>
---
 lib/maple_tree.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/lib/maple_tree.c b/lib/maple_tree.c
index bb24d84a4922..ca7039633844 100644
--- a/lib/maple_tree.c
+++ b/lib/maple_tree.c
@@ -165,6 +165,11 @@ static inline int mt_alloc_bulk(gfp_t gfp, size_t size, void **nodes)
 	return kmem_cache_alloc_bulk(maple_node_cache, gfp, size, nodes);
 }
 
+static inline void mt_free_one(struct maple_node *node)
+{
+	kmem_cache_free(maple_node_cache, node);
+}
+
 static inline void mt_free_bulk(size_t size, void __rcu **nodes)
 {
 	kmem_cache_free_bulk(maple_node_cache, size, (void **)nodes);
@@ -205,6 +210,11 @@ static unsigned int mas_mt_height(struct ma_state *mas)
 	return mt_height(mas->tree);
 }
 
+static inline unsigned int mt_attr(struct maple_tree *mt)
+{
+	return mt->ma_flags & ~MT_FLAGS_HEIGHT_MASK;
+}
+
 static inline enum maple_type mte_node_type(const struct maple_enode *entry)
 {
 	return ((unsigned long)entry >> MAPLE_NODE_TYPE_SHIFT) &
@@ -5573,7 +5583,7 @@ void mas_destroy(struct ma_state *mas)
 			mt_free_bulk(count, (void __rcu **)&node->slot[1]);
 			total -= count;
 		}
-		kmem_cache_free(maple_node_cache, node);
+		mt_free_one(ma_mnode_ptr(node));
 		total--;
 	}
 
-- 
2.20.1


