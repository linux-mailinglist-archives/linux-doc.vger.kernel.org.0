Return-Path: <linux-doc+bounces-39228-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61978A428AA
	for <lists+linux-doc@lfdr.de>; Mon, 24 Feb 2025 18:02:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 006D516AD5A
	for <lists+linux-doc@lfdr.de>; Mon, 24 Feb 2025 16:58:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73FD92641C6;
	Mon, 24 Feb 2025 16:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jKgbasYB"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8B426619F
	for <linux-doc@vger.kernel.org>; Mon, 24 Feb 2025 16:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740416187; cv=none; b=SqrsIT+HtL5XTO2ZgWrVBcosYe7VEax4/mASKdnD3/DtoTLexDef1ibsVRn4Uhk8MFVOH8CUmp/9T9bTtMGDIT1dZd679dfF4wZC/TPatgx2TUOsfmMNbTq/eaqDX5q5HaFShpwvM7xgwjzmkd2PC4sHJb7bDi3aCLshN0TD6Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740416187; c=relaxed/simple;
	bh=jBMc/6KfiUuhsqx8U3JCMjpv5FKb+tGdfD4lU0RajKI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U1DcJ6Q3vIB0cZ30rDjCqYS7FcthiTPHtMuelUzt4Po/h8hTvDaOYeIAq/85BNlfpMGGSsXSrAHc6/f6bzRFUF4z/qU5P6IxgAkv7UYuLoLJaIn7c7b+ar0QzaHrsjN4pbUVSt0yGPB0biPKUIBQE4AxFBpp5YVS4SqfHrf7HWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jKgbasYB; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740416184;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lWnUBbJbNal4OtQP6KylSC1HMhJkWgV+LTGJMK3tR3E=;
	b=jKgbasYB02yaCJ73nPuVCeeVAphtL8YpC5H4XOWwKtenVzDrvTUTyFqKUe9uXJhFjT5WBX
	TqdsBWlqI++5GO8x5frdfGpYkxKrOKjO3uoimWASuYTwvOv4OYsKMnveTyxybBo58ZMsz4
	vi5jdc/VBOGS1bxCvpKQwbh9KrLUacw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-115-ihOG6Jo6OJu6LgUU2L3pjQ-1; Mon, 24 Feb 2025 11:56:23 -0500
X-MC-Unique: ihOG6Jo6OJu6LgUU2L3pjQ-1
X-Mimecast-MFC-AGG-ID: ihOG6Jo6OJu6LgUU2L3pjQ_1740416182
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-38f2c0aa6d6so2512219f8f.0
        for <linux-doc@vger.kernel.org>; Mon, 24 Feb 2025 08:56:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740416182; x=1741020982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lWnUBbJbNal4OtQP6KylSC1HMhJkWgV+LTGJMK3tR3E=;
        b=WiINhMdm49fGvuBqW8M4wCtRh91g2J8v6dhiLr9aA6NzTcmxibcEwIa1X28s6TJHrY
         QUFZDbOKDT9Nj7GRRfuZKzE2UoFpSYQEdwdK+GcrRtCObieeZNdxU5f5C/Q1gtTrXQ1b
         nV3mNbXpPeOo0gPlKDrhlz0tBMz1g9fnQAWmB9leSVOxG32r4oOnTY5G+Yy1RZKTpCu2
         ZEnyEuKE3YcET6tEuKoMulSpO7TIrVQeT2IloCQkNxjt1bxOmxH5bmseEtr+iMLJvqbP
         fE0JfYtzu1mzStIMCS9yUZ4um3q172XgozEWN/Wmv+B/30e970lMBcTXLmv17zrF569x
         /dqQ==
X-Gm-Message-State: AOJu0YwXK7iGF/DDjBh71/rQFqxwkjlzoYYL8FI2Z5tGRU7sf7GOZbUv
	o4NCEKQdzxxUjEprHNojI9K1IjEZJZmLvpYlEeW7K6kiTni5vRl4arY8JGqIZnJVpnjmSxAITAv
	aEkWydpSoF0/vo1GaFH/P1PA2MyhXIkDfzCcS/bprJL88jyZchW1BCEGq5A==
X-Gm-Gg: ASbGncv+kzgooDBieVBswwOICfn6oPTY3hhCFmJQSpDhaRsP0nOwv1OuzB2x+uspF+1
	PGznx0NqQnkysNL5C3ST/MiP73P4RWGa0X1VorW6Q2c446c6cJ+WR9AxfA/D1TSKGYf4IHSmYRd
	fcNrqAbYTZ1nofGoluD4Z5weufRRCCnvbBYw9VLaUBW6ozv9RRqxDCwCE9HOZX3rfNj/E2MO2oo
	grvAtotpBXofoQfQimjlYYqzk77BN6si2UxzYRzCG+t3eBC4/+BqPKfrzwpRcfAzP9hh2Vp0ZR0
	Aq0vx/e/VPZ6rDaIGWA6VX/XBl+2vUgEgSTZU4qHqQ==
X-Received: by 2002:a5d:6d82:0:b0:38a:4184:14ec with SMTP id ffacd0b85a97d-38f6f3c507amr11123612f8f.1.1740416182303;
        Mon, 24 Feb 2025 08:56:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHG35xVnH9LhIY4oSSBr3n8xfuxml7Goul51SSXyqtQOXZX4W9oDib+9PjJY2pvFXqp8djOQA==
X-Received: by 2002:a5d:6d82:0:b0:38a:4184:14ec with SMTP id ffacd0b85a97d-38f6f3c507amr11123573f8f.1.1740416181836;
        Mon, 24 Feb 2025 08:56:21 -0800 (PST)
Received: from localhost (p4ff234b6.dip0.t-ipconnect.de. [79.242.52.182])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-38f259f8115sm32604557f8f.92.2025.02.24.08.56.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 08:56:21 -0800 (PST)
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
Subject: [PATCH v2 08/20] mm/rmap: pass vma to __folio_add_rmap()
Date: Mon, 24 Feb 2025 17:55:50 +0100
Message-ID: <20250224165603.1434404-9-david@redhat.com>
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

We'll need access to the destination MM when modifying the mapcount
large folios next. So pass in the VMA.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/rmap.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/mm/rmap.c b/mm/rmap.c
index bcec8677f68df..8a7d023b02e0c 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1242,8 +1242,8 @@ int pfn_mkclean_range(unsigned long pfn, unsigned long nr_pages, pgoff_t pgoff,
 }
 
 static __always_inline unsigned int __folio_add_rmap(struct folio *folio,
-		struct page *page, int nr_pages, enum rmap_level level,
-		int *nr_pmdmapped)
+		struct page *page, int nr_pages, struct vm_area_struct *vma,
+		enum rmap_level level, int *nr_pmdmapped)
 {
 	atomic_t *mapped = &folio->_nr_pages_mapped;
 	const int orig_nr_pages = nr_pages;
@@ -1411,7 +1411,7 @@ static __always_inline void __folio_add_anon_rmap(struct folio *folio,
 
 	VM_WARN_ON_FOLIO(!folio_test_anon(folio), folio);
 
-	nr = __folio_add_rmap(folio, page, nr_pages, level, &nr_pmdmapped);
+	nr = __folio_add_rmap(folio, page, nr_pages, vma, level, &nr_pmdmapped);
 
 	if (likely(!folio_test_ksm(folio)))
 		__page_check_anon_rmap(folio, page, vma, address);
@@ -1582,7 +1582,7 @@ static __always_inline void __folio_add_file_rmap(struct folio *folio,
 
 	VM_WARN_ON_FOLIO(folio_test_anon(folio), folio);
 
-	nr = __folio_add_rmap(folio, page, nr_pages, level, &nr_pmdmapped);
+	nr = __folio_add_rmap(folio, page, nr_pages, vma, level, &nr_pmdmapped);
 	__folio_mod_stat(folio, nr, nr_pmdmapped);
 
 	/* See comments in folio_add_anon_rmap_*() */
-- 
2.48.1


