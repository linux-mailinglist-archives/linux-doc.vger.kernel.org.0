Return-Path: <linux-doc+bounces-13758-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 308D789E372
	for <lists+linux-doc@lfdr.de>; Tue,  9 Apr 2024 21:28:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E13472848A1
	for <lists+linux-doc@lfdr.de>; Tue,  9 Apr 2024 19:28:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DABA8158A21;
	Tue,  9 Apr 2024 19:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V6rnAD5+"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F936158A27
	for <linux-doc@vger.kernel.org>; Tue,  9 Apr 2024 19:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712690754; cv=none; b=AJi4Q4twAw3qLxMGz3VEHjC5apD0AC9+S9PtfoaHinpYZi8OM5Bv310tMCNuDg9A3KuqYe3BQQc4YnAHLaIjJuXnR+6ZB2+4idZ9v/2zridXqr4bGAoOAT9P6F+qMaADV0+izr/r62bhhdW+cTWgwalbbBZ2GuCEYtn7F/Kxo4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712690754; c=relaxed/simple;
	bh=Rq0Sd4YiurfGdBcBbt0nVkWNo0X3AhfDegChcctLqBs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AThTtkCGGg0+azUh1tG2kTnhU9OFqLd4C8+wvo4LTc/5NCeCJH4tob/F9T54gmSvIcaKYcKcu5Fk+AgLMNW/e2fxx/Uds6LTDPBpGfPqK7ynb10iNZq4SRltFlC9adtiDST8sY5Yq9tt6f/bypzdgZ8vOSGfb1oA0c2+eEj/2YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=V6rnAD5+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712690752;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IN3zVkAYwXXWogoRwDYvxGTLC4K4Gwg+xwqZ7vjK29g=;
	b=V6rnAD5+tj8OwlMbs50UfN2fdNft8oH3YzTJvLt2sWYmsRVHZlu8VkQX0z5PR6LvwwAxUl
	cOUd+G0/CgPJHaDdoFHxiTtfwOMUlkNHg/OKCi3eLwV9aBHuQziDQ5kuTHqSUpFE4mJmjK
	f498NPYK2TCFsDF71f8JjDTh1PPaZLA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-512-p7aYNzngOOiEyTZuHcjUMg-1; Tue, 09 Apr 2024 15:25:44 -0400
X-MC-Unique: p7aYNzngOOiEyTZuHcjUMg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A0997830E7B;
	Tue,  9 Apr 2024 19:25:43 +0000 (UTC)
Received: from t14s.redhat.com (unknown [10.39.192.106])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AD0CF419FA38;
	Tue,  9 Apr 2024 19:25:33 +0000 (UTC)
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
Subject: [PATCH v1 11/18] mm/migrate: use folio_likely_mapped_shared() in add_page_for_migration()
Date: Tue,  9 Apr 2024 21:22:54 +0200
Message-ID: <20240409192301.907377-12-david@redhat.com>
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
absolutely necessary. In add_page_for_migration(), we actually want to
check if the folio is mapped shared, to reject such folios. So let's
use folio_likely_mapped_shared() instead.

For small folios, fully mapped THP, and hugetlb folios, there is no change.
For partially mapped, shared THP, we should now do a better job at
rejecting such folios.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/migrate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/migrate.c b/mm/migrate.c
index 285072bca29c..d87ce32645d4 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -2140,7 +2140,7 @@ static int add_page_for_migration(struct mm_struct *mm, const void __user *p,
 		goto out_putfolio;
 
 	err = -EACCES;
-	if (page_mapcount(page) > 1 && !migrate_all)
+	if (folio_likely_mapped_shared(folio) && !migrate_all)
 		goto out_putfolio;
 
 	err = -EBUSY;
-- 
2.44.0


