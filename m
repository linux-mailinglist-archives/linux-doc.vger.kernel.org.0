Return-Path: <linux-doc+bounces-52041-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4CACAF90A1
	for <lists+linux-doc@lfdr.de>; Fri,  4 Jul 2025 12:33:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B3EA545B5E
	for <lists+linux-doc@lfdr.de>; Fri,  4 Jul 2025 10:32:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9C5B2F4313;
	Fri,  4 Jul 2025 10:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="esL/z+PL"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227962FE309
	for <linux-doc@vger.kernel.org>; Fri,  4 Jul 2025 10:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751624812; cv=none; b=C0uqvGs2zJDDzPffbXMOQ1I5Chjguf477JTTn91qaVPVlgPYKolVsLTY/JfK2jKtU66C80iIZ9rAV2wr3m8GA2TVhqPLlkINnFXlwBC/hNAKyi3maYkTQvEVnsdDYo921HxUl4i8hRKZ33iGb4w1TyKhutc8jxXs8HaAcs5ljx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751624812; c=relaxed/simple;
	bh=9t4RJIUzQtVpC+ufH2qeXROpTaW+ImBuVkRcsBTUgQk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q338QyqG88d/yo/9ZTZ3shsh0imJNTL0D2qhcVldkFCfuwi0UUwYvT+de2Mh11ab4k192JkalQhK9sDDmAdY6Dab9ek5szdOQV9EYf/dbLbkabX9BioWkYxxJn9BD2wHk6H7Ls6SjefZANso/WN00m0C+HQMmtFC9ImapJKu9OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=esL/z+PL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751624810;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mQ0XfChfbxm2lnvJaf8puphZG2XMtd7Fe0eRXg0ZpMo=;
	b=esL/z+PLls6K2fyxFk0u3ZVkF6qmNw7CaXXHTlLxQifRt4sPsATBRwhw4Nxg07yg0u8rGC
	x7nj6lOsIsFzlcF7IB3XO05P3YdeoCdslyHBlN1y1ix2pxoLnKP0IB9wU42hdWm0/rf7W7
	rJ1+VaDkjmQukxeCGROb6yu1OZEPAYQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-1tPmAZRCPW2zOFkSjocJ_g-1; Fri, 04 Jul 2025 06:26:49 -0400
X-MC-Unique: 1tPmAZRCPW2zOFkSjocJ_g-1
X-Mimecast-MFC-AGG-ID: 1tPmAZRCPW2zOFkSjocJ_g_1751624808
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-45320bfc18dso3890505e9.1
        for <linux-doc@vger.kernel.org>; Fri, 04 Jul 2025 03:26:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751624808; x=1752229608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mQ0XfChfbxm2lnvJaf8puphZG2XMtd7Fe0eRXg0ZpMo=;
        b=SvbwBtGGkpUkJyV0FUoe5IXhukSJQkFuEdgH7LHslHFzsMWg/hV0pxyfhG2mr90pgM
         /zdb7jsLRXB0n2BphjlL9OCCwp6jXxtRID+Phm6K6D69OkMGDHRp5pULUHxiDkPVO8hY
         78X5GjwrrMTZNVl9DSmmoxedBdD528hHlY+419fdFYoxgmQqjMwi6l10BVgyEV0NZOaJ
         E0AnWXaSoTggSaHeBehgigdHwB65eksbkI+DKpbTohNddS7PECj6aVI/liLeP7ETuESq
         6SGfaPgx0IAojB6rXJe+ZC4GoofJ3XiZRwIJE0GKQh2kb3dea0KIZy0cqFwzfx+dY08Y
         T9aQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+ifflOlIszu6ojsUt8TGLzGEerQ9GponohnV9HmirwfriFASt730IedjGQFf470SLwIS7EASsyV4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw35P7ji/UzJtKc8fXFnYV37C+6D83U7GqqpTpj2iZNconB5XaZ
	e6YHwYPsNoaaAbqtBlC/LbZdp0nk+CoucwtQbcM+Nzmp4VqutpHW21HbQx/+ZZO2/LTgm6o2Mzv
	obEcO0/DZEC7IggY2Q2UJWdCgfXfQX/E9XrixvaCO4bwOuV7od2SLovdVri2z7w==
X-Gm-Gg: ASbGnctwQ8GuhOrxz+QsYmusLAkGru4TG6v85A5l6TGAY+fEiSylsuInkLB95FTZKLe
	j+wUdfVSHX2DkFLVEM6JE6tUWp4Q7ZZVpMqVHAyBzJm7LIGe7ZBdfQjAR+8SPt8NwbGsBXJOgcl
	8nVMg34p3Vfd+Tf2w3aiwxcTKC6yji+dx1JONdaNjKaYaF7KAIXfS+YFoGeSSwM7XxF8lW/fnaw
	sGOnYnn3SzfgXHnQZEpZp7HcARLvNGJFsw31Fdk1uN5TN/5HI/FnhgT1mnxYX3gM+1PefEH/Ucc
	F9YZDcFMfXF1+du15DoQpZ8flpEC8+6v2IP2e1+T4oH6uBhbmbEZfUQ6dnYKKaAxXf3jehxixKD
	iczmw9g==
X-Received: by 2002:a05:600c:8219:b0:442:f4a3:a2c0 with SMTP id 5b1f17b1804b1-454b30c46ecmr22270105e9.13.1751624807916;
        Fri, 04 Jul 2025 03:26:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFDbvyyEAOAh2zTRSLUq2RLyWuJqmjCfdM4cRksQAqvl8abasokMK1aTRkGvgAfFTh32vAJjQ==
X-Received: by 2002:a05:600c:8219:b0:442:f4a3:a2c0 with SMTP id 5b1f17b1804b1-454b30c46ecmr22269355e9.13.1751624807380;
        Fri, 04 Jul 2025 03:26:47 -0700 (PDT)
Received: from localhost (p200300d82f2c5500098823f9faa07232.dip0.t-ipconnect.de. [2003:d8:2f2c:5500:988:23f9:faa0:7232])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b471b9671asm2135708f8f.53.2025.07.04.03.26.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 03:26:46 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	virtualization@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Jerrin Shaji George <jerrin.shaji-george@broadcom.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Zi Yan <ziy@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>,
	Rakie Kim <rakie.kim@sk.com>,
	Byungchul Park <byungchul@sk.com>,
	Gregory Price <gourry@gourry.net>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Minchan Kim <minchan@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Brendan Jackman <jackmanb@google.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>,
	Peter Xu <peterx@redhat.com>,
	Xu Xin <xu.xin16@zte.com.cn>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Miaohe Lin <linmiaohe@huawei.com>,
	Naoya Horiguchi <nao.horiguchi@gmail.com>,
	Oscar Salvador <osalvador@suse.de>,
	Rik van Riel <riel@surriel.com>,
	Harry Yoo <harry.yoo@oracle.com>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	Shakeel Butt <shakeel.butt@linux.dev>
Subject: [PATCH v2 28/29] mm/balloon_compaction: "movable_ops" doc updates
Date: Fri,  4 Jul 2025 12:25:22 +0200
Message-ID: <20250704102524.326966-29-david@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250704102524.326966-1-david@redhat.com>
References: <20250704102524.326966-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Let's bring the docs up-to-date. Setting PG_movable_ops + page->private
very likely still requires to be performed under documented locks:
it's complicated.

We will rework this in the future, as we will try avoiding using the
page lock.

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/balloon_compaction.h | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/include/linux/balloon_compaction.h b/include/linux/balloon_compaction.h
index b222b0737c466..2fecfead91d26 100644
--- a/include/linux/balloon_compaction.h
+++ b/include/linux/balloon_compaction.h
@@ -4,12 +4,13 @@
  *
  * Common interface definitions for making balloon pages movable by compaction.
  *
- * Balloon page migration makes use of the general non-lru movable page
+ * Balloon page migration makes use of the general "movable_ops page migration"
  * feature.
  *
  * page->private is used to reference the responsible balloon device.
- * page->mapping is used in context of non-lru page migration to reference
- * the address space operations for page isolation/migration/compaction.
+ * That these pages have movable_ops, and which movable_ops apply,
+ * is derived from the page type (PageOffline()) combined with the
+ * PG_movable_ops flag (PageMovableOps()).
  *
  * As the page isolation scanning step a compaction thread does is a lockless
  * procedure (from a page standpoint), it might bring some racy situations while
@@ -17,12 +18,10 @@
  * and safely perform balloon's page compaction and migration we must, always,
  * ensure following these simple rules:
  *
- *   i. when updating a balloon's page ->mapping element, strictly do it under
- *      the following lock order, independently of the far superior
- *      locking scheme (lru_lock, balloon_lock):
+ *   i. Setting the PG_movable_ops flag and page->private with the following
+ *	lock order
  *	    +-page_lock(page);
  *	      +--spin_lock_irq(&b_dev_info->pages_lock);
- *	            ... page->mapping updates here ...
  *
  *  ii. isolation or dequeueing procedure must remove the page from balloon
  *      device page list under b_dev_info->pages_lock.
-- 
2.49.0


