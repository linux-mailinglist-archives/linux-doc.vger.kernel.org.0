Return-Path: <linux-doc+bounces-39237-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B0388A428B4
	for <lists+linux-doc@lfdr.de>; Mon, 24 Feb 2025 18:03:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B1A8188BC68
	for <lists+linux-doc@lfdr.de>; Mon, 24 Feb 2025 17:01:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEA0B267F55;
	Mon, 24 Feb 2025 16:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XdaJyw22"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D2E267B7A
	for <linux-doc@vger.kernel.org>; Mon, 24 Feb 2025 16:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740416208; cv=none; b=RWZIos7/j6BcoQlALJPg45Y7lxv6Vv/4ypr7C0aROYRbUqKKH6ZTJH1TI4fVllVdcQ8uJW3uHid81fHbb6lDbQb5Qfvkr0WJJXXOIChaNDYt14K2YXkqhp0FELMWXref/+e5A9DZVAO5kemr/Nh2G2ui/Chpv+UsVNupLRBbr5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740416208; c=relaxed/simple;
	bh=y7rnQn4atWG4y4XI5Y3ZUk4Khub4cSbzFIEKIR0LMHc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XkqpscOJtM332W+rP0oci+Bq0bGaNQvs4yyPiQ485629fF7WBq0Zk4/gbgzHO/qmwNiCZGC4lfLK6IhcYMYVwVbfp6ey3b9KVUAa7bRbJHKVZVSjf7YXszoMJS7dsySjIjDP4iXC/9cH9rz50VloFzAnWekkf/g5fFn1Kp1t9IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XdaJyw22; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740416205;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qrzeSAQepC6qjgZK5hS618fC1aWLshwTFA4Bvic/TRg=;
	b=XdaJyw22qn1YI1B67eVRlYv8jfBqTaRUSs5mAZw22xdTKf5jDI3Pj5Yy7Tme9K6NKvlleP
	OYZZRXvT+hB97Pb/rix9520a7IBVTcJLfv88Ty99dZLiBCgAAFldgih6BVa3d8WbxE/4HU
	ZDVlcNxTfCQ1ljj/MbMYxBjcTRS1FM8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-426-1bdIR3O4MNmUF7KcEWSEOA-1; Mon, 24 Feb 2025 11:56:43 -0500
X-MC-Unique: 1bdIR3O4MNmUF7KcEWSEOA-1
X-Mimecast-MFC-AGG-ID: 1bdIR3O4MNmUF7KcEWSEOA_1740416202
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-38f55ccb04bso3398233f8f.3
        for <linux-doc@vger.kernel.org>; Mon, 24 Feb 2025 08:56:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740416202; x=1741021002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qrzeSAQepC6qjgZK5hS618fC1aWLshwTFA4Bvic/TRg=;
        b=TwxOV02YVKvTRgRnCRRrcrerPnUTtkDWXikXX5EX8s5Mw0t/kv/3g8D7QRvv9Pq64C
         0C78W6LhRbTWpjyyzI/MYeyHexY3CtgjtfOnfpYNRx2eMivyzhXZ+KHQe6od1CqFUHMJ
         G8gfJzF/V3iJiz94FRChKQ8BCQHe9clDzealq8tvbhbS0ySS5XLNtpy2I8QdXQrpLEVK
         +rhS0cRe6uH0er9EN7690XZMb8+a+mR1S0DJBPm/hSXRE4wHcCvV34xQY23xYpxGMrFV
         TrEjtbvOKx2bEsGtKS0dk3sZhacctA1RAtjl6wEIBPEOnhEjqDyIXuk9ErJ12vt+V5O2
         FXFg==
X-Gm-Message-State: AOJu0YxLKCNTlxKklubaJWG+xnPibFRfSEOSDoL03TqHFVAAubMlc9K7
	44NzIk9QYhrP3IYlRW4VWwfAXB0ESF5797AhX5Jm3ebUty2WciS6A2ov6U/ziLFbzXHHQPA/QQs
	lUP8tjBE+0HiIMJW8hGoROzM0cUwzp0Ykx9Z461wSjo7eM2CAkY/fukRZOg==
X-Gm-Gg: ASbGnctT8CqKCQpGMcQ5I6k7mVh95kfiUGJCk6GaJMKrprrHekeeudCa/xCKeBUynNh
	W6Px3Qm1Kl7I74ujZxgHE9U1wu17nYj1t2XrTn1E/xGvzrySUyEyDII8nu3O26B6k2eJ52MAbkr
	MBSD3wHVCSfHg7GnLRZqe7TUwiEtaJGWS79vJOVhGwvgzMdpvV/u+Rgv4PsDYSZ3SMgZ9clwOqH
	ETpenPIub692jaHJ6VmRruzJE9ELYc/wA9jPHMUBxyDmX4QRhqmlb9A+i21gB5bEitCSAhg64kO
	Ccc42mwOMYaDY1z75TdNVG8BVCt0pRQpv4spGn8rVg==
X-Received: by 2002:a5d:588d:0:b0:38f:330a:acbc with SMTP id ffacd0b85a97d-38f6f0c743bmr12450077f8f.54.1740416202183;
        Mon, 24 Feb 2025 08:56:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHB6f6br0E5FryNlZozgeR2JsRbAfPcg+xWwWdf/YpxK+ukwffc3aXIkqUDyRFtyhNU8GNoFQ==
X-Received: by 2002:a5d:588d:0:b0:38f:330a:acbc with SMTP id ffacd0b85a97d-38f6f0c743bmr12450037f8f.54.1740416201773;
        Mon, 24 Feb 2025 08:56:41 -0800 (PST)
Received: from localhost (p4ff234b6.dip0.t-ipconnect.de. [79.242.52.182])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-38f259f8602sm32962279f8f.94.2025.02.24.08.56.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 08:56:41 -0800 (PST)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org,
	cgroups@vger.kernel.org,
	linux-mm@kvack.org,
	linux-fsdevel@vger.kernel.org,
	linux-api@vger.kernel.org,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Tejun Heo <tj@kernel.org>,
	Zefan Li <lizefan.x@bytedance.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Muchun Song <muchun.song@linux.dev>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Jann Horn <jannh@google.com>
Subject: [PATCH v2 17/20] fs/proc/task_mmu: remove per-page mapcount dependency for PM_MMAP_EXCLUSIVE (CONFIG_NO_PAGE_MAPCOUNT)
Date: Mon, 24 Feb 2025 17:55:59 +0100
Message-ID: <20250224165603.1434404-18-david@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250224165603.1434404-1-david@redhat.com>
References: <20250224165603.1434404-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Let's implement an alternative when per-page mapcounts in large folios are
no longer maintained -- soon with CONFIG_NO_PAGE_MAPCOUNT.

PM_MMAP_EXCLUSIVE will now be set if folio_likely_mapped_shared() is
true -- when the folio is considered "mapped shared", including when
it once was "mapped shared" but no longer is, as documented.

This might result in and under-indication of "exclusively mapped", which
is considered better than over-indicating it: under-estimating the USS
(Unique Set Size) is better than over-estimating it.

As an alternative, we could simply remove that flag with
CONFIG_NO_PAGE_MAPCOUNT completely, but there might be value to it. So,
let's keep it like that and document the behavior.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 Documentation/admin-guide/mm/pagemap.rst |  9 +++++++++
 fs/proc/task_mmu.c                       | 11 +++++++++--
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/mm/pagemap.rst b/Documentation/admin-guide/mm/pagemap.rst
index 49590306c61a0..131c86574c39a 100644
--- a/Documentation/admin-guide/mm/pagemap.rst
+++ b/Documentation/admin-guide/mm/pagemap.rst
@@ -37,6 +37,15 @@ There are four components to pagemap:
    precisely which pages are mapped (or in swap) and comparing mapped
    pages between processes.
 
+   Note that in some kernel configurations, all pages part of a larger
+   allocation (e.g., THP) might be considered "mapped shared" if the large
+   allocation is considered "mapped shared": if not all pages are exclusive to
+   the same process. Further, some kernel configurations might consider larger
+   allocations "mapped shared", if they were at one point considered
+   "mapped shared", even if they would now be considered "exclusively mapped".
+   Consequently, in these kernel configurations, bit 56 might be set although
+   the page is actually "exclusively mapped"
+
    Efficient users of this interface will use ``/proc/pid/maps`` to
    determine which areas of memory are actually mapped and llseek to
    skip over unmapped regions.
diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index 2bddcea65cbf1..80839bbf9657f 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -1651,6 +1651,13 @@ static int add_to_pagemap(pagemap_entry_t *pme, struct pagemapread *pm)
 	return 0;
 }
 
+static bool __folio_page_mapped_exclusively(struct folio *folio, struct page *page)
+{
+	if (IS_ENABLED(CONFIG_PAGE_MAPCOUNT))
+		return folio_precise_page_mapcount(folio, page) == 1;
+	return !folio_maybe_mapped_shared(folio);
+}
+
 static int pagemap_pte_hole(unsigned long start, unsigned long end,
 			    __always_unused int depth, struct mm_walk *walk)
 {
@@ -1739,7 +1746,7 @@ static pagemap_entry_t pte_to_pagemap_entry(struct pagemapread *pm,
 		if (!folio_test_anon(folio))
 			flags |= PM_FILE;
 		if ((flags & PM_PRESENT) &&
-		    folio_precise_page_mapcount(folio, page) == 1)
+		    __folio_page_mapped_exclusively(folio, page))
 			flags |= PM_MMAP_EXCLUSIVE;
 	}
 	if (vma->vm_flags & VM_SOFTDIRTY)
@@ -1814,7 +1821,7 @@ static int pagemap_pmd_range(pmd_t *pmdp, unsigned long addr, unsigned long end,
 			pagemap_entry_t pme;
 
 			if (folio && (flags & PM_PRESENT) &&
-			    folio_precise_page_mapcount(folio, page + idx) == 1)
+			    __folio_page_mapped_exclusively(folio, page))
 				cur_flags |= PM_MMAP_EXCLUSIVE;
 
 			pme = make_pme(frame, cur_flags);
-- 
2.48.1


