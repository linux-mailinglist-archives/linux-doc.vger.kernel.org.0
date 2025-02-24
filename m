Return-Path: <linux-doc+bounces-39236-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C9BA428CD
	for <lists+linux-doc@lfdr.de>; Mon, 24 Feb 2025 18:05:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A1084208D1
	for <lists+linux-doc@lfdr.de>; Mon, 24 Feb 2025 17:00:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A348F267B0E;
	Mon, 24 Feb 2025 16:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dRSajZLm"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A853C267717
	for <linux-doc@vger.kernel.org>; Mon, 24 Feb 2025 16:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740416205; cv=none; b=WYqjE/cdEaqpKqJQyNf72fIKByKBJCsuWT1XLs/oBvJDt84e2tnpA1Qz6bZxGR/J9ZVIa9JORK53tNR3rj+TWlXi3id/TH4aZFZXBTFyuHPzxQOuXKFQen9n8cKiCoaMhB3m77FcP6cYivSRVxDP7MPZpE2TN2SWv1Vq+P96JNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740416205; c=relaxed/simple;
	bh=COc9LSVS2gNAFQnh4IzvB8A8xKf1CalXjCi6/SHso4I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dvxrBr4wILnby3u+wgiNnCb7tzcjl9+jv1eh5mSeANThbTT95A9xb676XHqEejj0fkBlqy7uElT+zyADMyHUo5vJU3oC9EYNGc5y3QmcyIj67p1+tgRKV/ivwK1Vv0Zc3ZZAkjBzqk5G1DzW5CI3D6FIsoMvrMFoDALR7pojBu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dRSajZLm; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740416202;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I7/ovFwFtUshRpZfEG8TPamCJVjib0AvdCdidGnTX/0=;
	b=dRSajZLm3uhGVWHd2KdDMqyQv/A0ok46glRUpHb8ZOKjg53qJ/qYSuQOhGOQ7IAuPlicIO
	zAyTwvbi2oJpQM6aWOuQw75OjOCAmeBh0WMM0najEYfbccFp8N9rMfopIsn+iRQKvXkxtI
	iVYVzYkbXeMpUAvS9tRwLqXpDg6Vd/I=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-319-wd1G4llbPla0khNSwKjFLA-1; Mon, 24 Feb 2025 11:56:41 -0500
X-MC-Unique: wd1G4llbPla0khNSwKjFLA-1
X-Mimecast-MFC-AGG-ID: wd1G4llbPla0khNSwKjFLA_1740416200
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-38f34b3f9f1so3474962f8f.0
        for <linux-doc@vger.kernel.org>; Mon, 24 Feb 2025 08:56:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740416200; x=1741021000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I7/ovFwFtUshRpZfEG8TPamCJVjib0AvdCdidGnTX/0=;
        b=PpLX9la1CfdXNhoCn8zk2mS/psioQuGPw60Z61lCzu/1Gj4CdMsnuSDoriZWU42NiK
         S2VsmYioOx7N4bw+seaoFywes+N7fQ6uTwCXFhlCnXwuit9WPSfniRuQ0BS2VztWuggd
         hr+jbJyVDh1NDuSsud5RnphKf+ER2Ftm6vGSWXqEF2yomx3rY7FF8qw7K7zmY3dCcUzG
         ejmUeiTxgg4lOCw8aaqj9fKOVPqDpbhEFuRL9ETYAw7xDPFP+8mrVeh+/XiUPJ0LUb91
         9pv3a52F8f5+PMdKscWDH4DHlztcQW7F7Jq1cGyOHeJw5UE6AO4RwpWCO5FJBTepsy6v
         eiAA==
X-Gm-Message-State: AOJu0YxWpmbhVitdu/M8P5QZzpDfeRZvfZxFoQJNzFvJx8RQrGwOCDbQ
	RKdfZMjGFNGwXTIBb3ZzZkPu0Khln+8k3ybElrh3L1G4AUBeOoEkqBM+6iE6kCjJoB1anko28WI
	HsNdZZJxjpPFbKEpvE0ASUSmb9rcdm89IafYn362xjBc/Ul78LT0ojLs9dA==
X-Gm-Gg: ASbGncvOZZjnX/jTb3IxpT3iHsB+XwFbtMkICRH6Y+ruba7cLoxncspyYAHgVM/MXyK
	Z5XngYTpB6Ch++VhUFcnALAwPfaVOpBn1j4wS3wQYqtDqjSLo9mxq4FE0l2e8PsLbSWm/gBJG+0
	J62whagZyK0XBdhGtPKbC1g31MaboRpqnIh6wIcDKmELNpMiVSwlXxhvquUHCW5ryz9vd9LJiEM
	McmRKJ4xWo+npo+cdZtqQ/JWo3Mei0fP+A9o9FOHufR41YXTb+kJvasybKHt3wKn4lg+pE+DM8J
	aUKG00koMxH7/30DU9Xd5gVGZF55VVflhJDmBZnbHg==
X-Received: by 2002:a5d:588d:0:b0:38f:330a:acbc with SMTP id ffacd0b85a97d-38f6f0c743bmr12449953f8f.54.1740416200254;
        Mon, 24 Feb 2025 08:56:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFfMgOxaCcP3QUPAwnlgJXjUNV21VqnGE//pcrHn7Js38XBMUq8lKiO2xorUlCAe/uWbu52qQ==
X-Received: by 2002:a5d:588d:0:b0:38f:330a:acbc with SMTP id ffacd0b85a97d-38f6f0c743bmr12449918f8f.54.1740416199872;
        Mon, 24 Feb 2025 08:56:39 -0800 (PST)
Received: from localhost (p4ff234b6.dip0.t-ipconnect.de. [79.242.52.182])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-38f259f8121sm31621452f8f.88.2025.02.24.08.56.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 08:56:39 -0800 (PST)
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
Subject: [PATCH v2 16/20] fs/proc/page: remove per-page mapcount dependency for /proc/kpagecount (CONFIG_NO_PAGE_MAPCOUNT)
Date: Mon, 24 Feb 2025 17:55:58 +0100
Message-ID: <20250224165603.1434404-17-david@redhat.com>
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

Let's implement an alternative when per-page mapcounts in large folios
are no longer maintained -- soon with CONFIG_NO_PAGE_MAPCOUNT.

For large folios, we'll return the per-page average mapcount within the
folio, except when the average is 0 but the folio is mapped: then we
return 1.

For hugetlb folios and for large folios that are fully mapped
into all address spaces, there is no change.

As an alternative, we could simply return 0 for non-hugetlb large folios,
or disable this legacy interface with CONFIG_NO_PAGE_MAPCOUNT.

But the information exposed by this interface can still be valuable, and
frequently we deal with fully-mapped large folios where the average
corresponds to the actual page mapcount. So we'll leave it like this for
now and document the new behavior.

Note: this interface is likely not very relevant for performance. If
ever required, we could try doing a rather expensive rmap walk to collect
precisely how often this folio page is mapped.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 Documentation/admin-guide/mm/pagemap.rst |  7 +++++-
 fs/proc/internal.h                       | 31 ++++++++++++++++++++++++
 fs/proc/page.c                           | 19 ++++++++++++---
 3 files changed, 53 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/mm/pagemap.rst b/Documentation/admin-guide/mm/pagemap.rst
index caba0f52dd36c..49590306c61a0 100644
--- a/Documentation/admin-guide/mm/pagemap.rst
+++ b/Documentation/admin-guide/mm/pagemap.rst
@@ -42,7 +42,12 @@ There are four components to pagemap:
    skip over unmapped regions.
 
  * ``/proc/kpagecount``.  This file contains a 64-bit count of the number of
-   times each page is mapped, indexed by PFN.
+   times each page is mapped, indexed by PFN. Some kernel configurations do
+   not track the precise number of times a page part of a larger allocation
+   (e.g., THP) is mapped. In these configurations, the average number of
+   mappings per page in this larger allocation is returned instead. However,
+   if any page of the large allocation is mapped, the returned value will
+   be at least 1.
 
 The page-types tool in the tools/mm directory can be used to query the
 number of times a page is mapped.
diff --git a/fs/proc/internal.h b/fs/proc/internal.h
index 1695509370b88..16aa1fd260771 100644
--- a/fs/proc/internal.h
+++ b/fs/proc/internal.h
@@ -174,6 +174,37 @@ static inline int folio_precise_page_mapcount(struct folio *folio,
 	return mapcount;
 }
 
+/**
+ * folio_average_page_mapcount() - Average number of mappings per page in this
+ *				   folio
+ * @folio: The folio.
+ *
+ * The average number of present user page table entries that reference each
+ * page in this folio as tracked via the RMAP: either referenced directly
+ * (PTE) or as part of a larger area that covers this page (e.g., PMD).
+ *
+ * Returns: The average number of mappings per page in this folio. 0 for
+ * folios that are not mapped to user space or are not tracked via the RMAP
+ * (e.g., shared zeropage).
+ */
+static inline int folio_average_page_mapcount(struct folio *folio)
+{
+	int mapcount, entire_mapcount;
+	unsigned int adjust;
+
+	if (!folio_test_large(folio))
+		return atomic_read(&folio->_mapcount) + 1;
+
+	mapcount = folio_large_mapcount(folio);
+	entire_mapcount = folio_entire_mapcount(folio);
+	if (mapcount <= entire_mapcount)
+		return entire_mapcount;
+	mapcount -= entire_mapcount;
+
+	adjust = folio_large_nr_pages(folio) / 2;
+	return ((mapcount + adjust) >> folio_large_order(folio)) +
+		entire_mapcount;
+}
 /*
  * array.c
  */
diff --git a/fs/proc/page.c b/fs/proc/page.c
index a55f5acefa974..4d3290cc69667 100644
--- a/fs/proc/page.c
+++ b/fs/proc/page.c
@@ -67,9 +67,22 @@ static ssize_t kpagecount_read(struct file *file, char __user *buf,
 		 * memmaps that were actually initialized.
 		 */
 		page = pfn_to_online_page(pfn);
-		if (page)
-			mapcount = folio_precise_page_mapcount(page_folio(page),
-							       page);
+		if (page) {
+			struct folio *folio = page_folio(page);
+
+			if (IS_ENABLED(CONFIG_PAGE_MAPCOUNT)) {
+				mapcount = folio_precise_page_mapcount(folio, page);
+			} else {
+				/*
+				 * Indicate the per-page average, but at least "1" for
+				 * mapped folios.
+				 */
+				mapcount = folio_average_page_mapcount(folio);
+				if (!mapcount && folio_test_large(folio) &&
+				    folio_mapped(folio))
+					mapcount = 1;
+			}
+		}
 
 		if (put_user(mapcount, out)) {
 			ret = -EFAULT;
-- 
2.48.1


