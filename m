Return-Path: <linux-doc+bounces-37632-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF28A2F8FE
	for <lists+linux-doc@lfdr.de>; Mon, 10 Feb 2025 20:40:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C6FFD1881D57
	for <lists+linux-doc@lfdr.de>; Mon, 10 Feb 2025 19:40:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40D6225B686;
	Mon, 10 Feb 2025 19:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MIOy/ALU"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52FB525A358
	for <linux-doc@vger.kernel.org>; Mon, 10 Feb 2025 19:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739216324; cv=none; b=spyVCnxa7QYisjWekHh7rx3fv2fBN7blWVxWP87s8M+n9CoZiYUBgnwl3MjTqK5HB6Ol1zXDGXsjFTNXBdCz7F2g/fmnIMakLL9K/meRr5aPKqTGDhi2QbZdapny4x4TgMg9MTEWjmVnx2L8NHmA7XqpfOMSuU+TyN8FWK/y9Bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739216324; c=relaxed/simple;
	bh=XECEsYRumwDXs38xfqw/DSW1eeDdoyEKYX/zmrQ3FPo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U3djR/ugXjov3RS6MQQFrvd7oQy6hVD3bEjzYAeLp9bnaaqXkf+y1p2xzfuzZS8LCrGZHJy0RDhiFdko6rLSPrG87Z0eNzSbQ+s1PCcsDgUE1/350NBygQHxF4hzo5NikfDU+6SkwWz0Zj+jyl3n3Qjd1KCZXCXFecYwGX0Gn5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MIOy/ALU; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739216321;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b7jLfJ9vH0eUU1vYEXZ3dUW5UEIvFQqjIYltl+lFPPU=;
	b=MIOy/ALUKYGAj9ZOQIO+yvIS6yeCU1a3sY3yvsaIHW4s7LuhFwTMnVjgBSKJ+2T0wLcWzj
	2q5XNuLqUyzpMH1vhsNNHzuShdC8jxni/+Ev5spAUgoFjlfAzp/s6xlQK2RrINS7mGYYgH
	T0KOmCxPpn2z7mu7n4BL4kfGmtzgM/4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-538-NG_h_dcVMNKn0imNPn2g0w-1; Mon, 10 Feb 2025 14:38:39 -0500
X-MC-Unique: NG_h_dcVMNKn0imNPn2g0w-1
X-Mimecast-MFC-AGG-ID: NG_h_dcVMNKn0imNPn2g0w
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4394c489babso2566965e9.1
        for <linux-doc@vger.kernel.org>; Mon, 10 Feb 2025 11:38:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739216318; x=1739821118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b7jLfJ9vH0eUU1vYEXZ3dUW5UEIvFQqjIYltl+lFPPU=;
        b=kOI7FFFM9p36s3TNvvFq+fmkmtwdUjjEzjMuMjIY7z0YWbeCWe+IvToKECe60C4sLO
         QC+qb+6qAmsP+rwjvFE1Nsmr5UK+46vZQgLYmZGqv726Ibixe+c4w4YLqfOB+/034QiB
         T+h/uzd9An9ZO5Ss/4W2w7mBGUQjJ/AVEw43lGtRh5VQtMR6entvwvpyUSHV9RrJ/iVY
         F9gTqHLXoOhQcp09J4V8qanettcIPtYK6MB5t7QNa9kT8yhlHqaKv4w4TgIBjQtLCfxa
         oIhQD6w1NCXTPFBp/K90OQQkcvQJYRhcZfEBJ7oQKlidsMhlim8Oy26AT4oVv7QJ+8bX
         jwpA==
X-Gm-Message-State: AOJu0YymE4QYEzgswgmaypJZQg3sjPhrsjZ6hmU/f0DGr0tq51t9GeBK
	J0MDQBwuM4oQoAWnmnN/YwCAuyz6289dYT7OMxpTPT0qTuB5YyXp+SCucXwsApKUzjvTGIPDbft
	KK6LANb7b6O4HN8sjNZZe2qetuGcqlWAJJOrDm+nZnimiGihXBV+NOnQf4Q==
X-Gm-Gg: ASbGncvBfkXHpL+68Ruc9J3KPk1TCLICV0ysdnyNXeglJFXnOR1DAd4G/r+50MEw8Zb
	7vZHjKQGWLVPvsZX4gmYXOYpbBB/ffuDbLMlrbkSAJfpotit9YInvKXWag69V3EbCD0dDD61nXp
	vDJEdjyKwP8gHkTlUCNRrHxEy+tWPvhT2kFNfw6mzpYhW8a6VrbGpoRwWUUHDklQiYwDFzfK66h
	AUzxwW0SB5dKFGBpyT8abK/6gHCuPVht8flup2jUOskJBLp6vVdJbWk6iB39MRkr5XmDATX5hqy
	9dj0iJV3zsV5lCGxIV3O6ZRWDuzkL0Gxwz27/8YpjnZL8XX8gR/UTTCI1OFJnWVv+g==
X-Received: by 2002:a05:600c:4f90:b0:434:a7e7:a1ca with SMTP id 5b1f17b1804b1-439249b04f8mr116077625e9.20.1739216318632;
        Mon, 10 Feb 2025 11:38:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHdlczuWpIJN55C/ZdLw7mis7jMK/FKd714PEZJ/2b6DQtULEf1bpuI2yab2McnQRseLHdLgg==
X-Received: by 2002:a05:600c:4f90:b0:434:a7e7:a1ca with SMTP id 5b1f17b1804b1-439249b04f8mr116077285e9.20.1739216318299;
        Mon, 10 Feb 2025 11:38:38 -0800 (PST)
Received: from localhost (p200300cbc734b80012c465cd348aaee6.dip0.t-ipconnect.de. [2003:cb:c734:b800:12c4:65cd:348a:aee6])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4391da96502sm158809495e9.1.2025.02.10.11.38.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 11:38:37 -0800 (PST)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org,
	nouveau@lists.freedesktop.org,
	linux-trace-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	damon@lists.linux.dev,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	=?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Karol Herbst <kherbst@redhat.com>,
	Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	SeongJae Park <sj@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Jann Horn <jannh@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Peter Xu <peterx@redhat.com>,
	Alistair Popple <apopple@nvidia.com>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: [PATCH v2 09/17] mm/ksm: handle device-exclusive entries correctly in write_protect_page()
Date: Mon, 10 Feb 2025 20:37:51 +0100
Message-ID: <20250210193801.781278-10-david@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250210193801.781278-1-david@redhat.com>
References: <20250210193801.781278-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ever since commit b756a3b5e7ea ("mm: device exclusive memory access")
we can return with a device-exclusive entry from page_vma_mapped_walk().

write_protect_page() is not prepared for that, so teach it about these
PFN swap PTEs. Note that device-private entries are so far not
applicable on that path, because GUP would never have returned such
folios (conversion to device-private happens by page migration, not
in-place conversion of the PTE).

There is a race between performing the folio_walk (which fails on
non-present PTEs) and locking the folio to look it up using
page_vma_mapped_walk() again, so this is likely a fix (unless something
else could prevent that race, but it doesn't look like). In the
future it could be handled if ever required, for now just give up and
ignore them like folio_walk would.

Fixes: b756a3b5e7ea ("mm: device exclusive memory access")
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/ksm.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/mm/ksm.c b/mm/ksm.c
index 8be2b144fefd6..8583fb91ef136 100644
--- a/mm/ksm.c
+++ b/mm/ksm.c
@@ -1270,8 +1270,15 @@ static int write_protect_page(struct vm_area_struct *vma, struct folio *folio,
 	if (WARN_ONCE(!pvmw.pte, "Unexpected PMD mapping?"))
 		goto out_unlock;
 
-	anon_exclusive = PageAnonExclusive(&folio->page);
 	entry = ptep_get(pvmw.pte);
+	/*
+	 * Handle PFN swap PTEs, such as device-exclusive ones, that actually
+	 * map pages: give up just like the next folio_walk would.
+	 */
+	if (unlikely(!pte_present(entry)))
+		goto out_unlock;
+
+	anon_exclusive = PageAnonExclusive(&folio->page);
 	if (pte_write(entry) || pte_dirty(entry) ||
 	    anon_exclusive || mm_tlb_flush_pending(mm)) {
 		swapped = folio_test_swapcache(folio);
-- 
2.48.1


