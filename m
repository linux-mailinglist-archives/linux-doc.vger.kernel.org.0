Return-Path: <linux-doc+bounces-13759-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ADAF89E377
	for <lists+linux-doc@lfdr.de>; Tue,  9 Apr 2024 21:28:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DEEEC1F2491B
	for <lists+linux-doc@lfdr.de>; Tue,  9 Apr 2024 19:28:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2CA3158A3D;
	Tue,  9 Apr 2024 19:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iYRvvh+a"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9E1158215
	for <linux-doc@vger.kernel.org>; Tue,  9 Apr 2024 19:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712690765; cv=none; b=YKSbBcRhIAUthCbc5RznBGwh2O12rz1yvB6pTX2EFWfGEykecTPams8FeGetlRp/mwQ7/GTyCUNbz5BePpkLzql6omL0a6filu9RDUChpGePQjjNRoY12kvKF5M3KD3YzdBjXzE8YY8GE7kVEHXmG/9z46/NW9WT9vf/oG+fZVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712690765; c=relaxed/simple;
	bh=B9VW3LrHsx1zgfIxNNfkZUFwrAR512abN6D1CTPxM7s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XjBqnVLR7Ub5j5JXMMFRUGb5Y7bjMQZoDTHZli2+5A9vQEWH/fpQWNGSrbAZ9HRvuHT8NAzk7S6JL4odFCYpNbJdxVg0kturLY74sbSCs5NCXhpw3uLb4hgKRLqsDmm+QLC1xg0SqQRfBrGnsmX1sG856IaMuPjBtoNaR80kVZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iYRvvh+a; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712690763;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oja6emUhi7xfrQgd9sof78Ea2rpQTjm332kNskpFfoE=;
	b=iYRvvh+aR+Wo3PgxJ5QvLZ6FtdZnasCw9LNrGp+2MndRxtroz2TNwkrIDMWXjD+UWNFcAJ
	95mJHavtD1GIw3+Pgt8e9HaVVoD5e2xIB+rBK4us9V9Yd9N6ZuGT9HwRka0G+2IbFRR+Mp
	KurYzGnJkjmjM/B3seqUpVT8snPQ/Mo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-216-euyj5-iiOp6e2NecV838wQ-1; Tue, 09 Apr 2024 15:25:57 -0400
X-MC-Unique: euyj5-iiOp6e2NecV838wQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 262C9800198;
	Tue,  9 Apr 2024 19:25:56 +0000 (UTC)
Received: from t14s.redhat.com (unknown [10.39.192.106])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0B6EB40B497D;
	Tue,  9 Apr 2024 19:25:43 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	cgroups@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Peter Xu <peterx@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Yin Fengwei <fengwei.yin@intel.com>,
	Yang Shi <shy828301@gmail.com>,
	Zi Yan <ziy@nvidia.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Hugh Dickins <hughd@google.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Chris Zankel <chris@zankel.net>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Muchun Song <muchun.song@linux.dev>,
	Miaohe Lin <linmiaohe@huawei.com>,
	Naoya Horiguchi <naoya.horiguchi@nec.com>,
	Richard Chang <richardycc@google.com>
Subject: [PATCH v1 12/18] sh/mm/cache: use folio_mapped() in copy_from_user_page()
Date: Tue,  9 Apr 2024 21:22:55 +0200
Message-ID: <20240409192301.907377-13-david@redhat.com>
In-Reply-To: <20240409192301.907377-1-david@redhat.com>
References: <20240409192301.907377-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2

We want to limit the use of page_mapcount() to the places where it is
absolutely necessary.

We're already using folio_mapped in copy_user_highpage() and
copy_to_user_page() for a similar purpose so ... let's also simply use
it for copy_from_user_page().

There is no change for small folios. Likely we won't stumble over many
large folios on sh in that code either way.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/sh/mm/cache.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/sh/mm/cache.c b/arch/sh/mm/cache.c
index 9bcaa5619eab..d8be352e14d2 100644
--- a/arch/sh/mm/cache.c
+++ b/arch/sh/mm/cache.c
@@ -84,7 +84,7 @@ void copy_from_user_page(struct vm_area_struct *vma, struct page *page,
 {
 	struct folio *folio = page_folio(page);
 
-	if (boot_cpu_data.dcache.n_aliases && page_mapcount(page) &&
+	if (boot_cpu_data.dcache.n_aliases && folio_mapped(folio) &&
 	    test_bit(PG_dcache_clean, &folio->flags)) {
 		void *vfrom = kmap_coherent(page, vaddr) + (vaddr & ~PAGE_MASK);
 		memcpy(dst, vfrom, len);
-- 
2.44.0


