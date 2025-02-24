Return-Path: <linux-doc+bounces-39222-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ED35EA4288C
	for <lists+linux-doc@lfdr.de>; Mon, 24 Feb 2025 17:58:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 46B563B49F4
	for <lists+linux-doc@lfdr.de>; Mon, 24 Feb 2025 16:56:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79F04264A8B;
	Mon, 24 Feb 2025 16:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZhH06oWl"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E789E2641F6
	for <linux-doc@vger.kernel.org>; Mon, 24 Feb 2025 16:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740416176; cv=none; b=lJ4RskcmvJXSxP1sm4yiAN8D94VzAVqBOxjGMxEAqKua5maWQGwMo+UTFm7WtXsParkApqM1/cG8OB7bM5T+15D7346hNkdEg9zJQCR+wWphLsswiE1EwR3R6bbOKqFFUzOLzrs1lIJXQJyQGtbVDcuCwcwY6svgOXRwh2HVtmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740416176; c=relaxed/simple;
	bh=+NZ/1EFzSZLxmiTEzceGSJVCP7MjSwgxhuOimjZWqPI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q9DDIFrtuzTmlb/B3789IO7x1QfJ25kxjj+E68qitQ9PqE3fTzmM7jb/z8cAE3n/LxQ4FPKZzUN12XnTYylJZrUSA0mLrhSlA9A26Q5rGHodWYKyOASaylofZl7+oJYr5GYwj3HAC/fgiZIAzbGh22XqGhbB77orvvm4q1OZ8Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZhH06oWl; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740416173;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uW/SnbGZfnRd/ZrL3KWYJ9GZqWtDH7XgQk5JORWTALU=;
	b=ZhH06oWlzAdPP+fbULUpx1LGopAE7DTH79Dd4GNG9WqS817eeuxV7R038KP7atLUWjex4Z
	9oE3HegwjSvKLTDYCgGg/uRLAu+w3rMk3tUwamK7jIhk5EAqUFNmiswQQdQIkotv52Vr1p
	5VSZpH5yKgBeN86WU5rLOeXObM6V8Lc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-206-smFM9SunOH-LRLEbTUpr6w-1; Mon, 24 Feb 2025 11:56:11 -0500
X-MC-Unique: smFM9SunOH-LRLEbTUpr6w-1
X-Mimecast-MFC-AGG-ID: smFM9SunOH-LRLEbTUpr6w_1740416170
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4399a5afc95so19851615e9.3
        for <linux-doc@vger.kernel.org>; Mon, 24 Feb 2025 08:56:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740416170; x=1741020970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uW/SnbGZfnRd/ZrL3KWYJ9GZqWtDH7XgQk5JORWTALU=;
        b=VdPJDznwKnpdl6qx78cyUk2cQWD9wJfk+/4P+Ag8Wfc3EHDp94cprRt8aZDP1sMgno
         zhOmN9bU4SrUuIn2Ff2l0p5WRHE47Xe4JnicPOPS6xJ70FbVOm8sJ+NzqMBcuuargDMy
         9sy8UWoAUVymYcf0YfPnIDY1XlMQtpEDIMv4okK6mwLaoQf7WTZJhdk/MLncPZO9tAG2
         b428o9BgkxdEF5woo1I3Nl+zdni18nWK9Vz6Bpz3wHHVQA46on6SBVXBfHKwXwz/+qrb
         E0s9AxK7xIT656NKHpNepbpXlnMuFXv5BLBFFJGR2mieRnRqSqX4APrjssm285QVq+Qu
         oQBg==
X-Gm-Message-State: AOJu0YxlZnrTyeoi1lSjz2OJ/x0CTZzYcIshiMQTypHsSLg0U8my/zzj
	rG5mjI6Blefnur1HTM1/xtzcTrL2csNleIMhvdjrd4V7/PgLk73if2/Ft/RUQz9qqloHBP5dd32
	1nP56OJfkkWjSasew62JnqWwHmxZJ5jcMszeCqP9JTTYMfXlPmp9D28oR5w==
X-Gm-Gg: ASbGncuZ2TvQI/kSdyOSzHwJ/sR/HvXIDkNlZJHirngKR6f0mEeQmMfhFuJcmqLwNhC
	mGRTtmL8fEXaUUodAhocl+jIV+8/BztM1FdMUVFAY6akh/UcUAo01iNpuuK91MpmiX+YLQBqh6l
	UdMcIZ5VpcXdmYL3NwTRTLV98TnCerhpe1BPbFgEY3J8A4OQtM79utxuuJyoyVd+1kwsd0S1QAC
	W8Tuf0wzNDulXwqSn/2UmpTuZO+WJh47UmBi0Hp/56fRnlOMcWFoSQTJtK7WvdUUS+lHayofDa4
	db9AYoekDpXq29xqst8615MXVYowK56pi/bipKfArQ==
X-Received: by 2002:a05:600c:34c2:b0:439:9828:c447 with SMTP id 5b1f17b1804b1-439aecf1426mr121409325e9.17.1740416169805;
        Mon, 24 Feb 2025 08:56:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFMOxvVak9cDaBV2o8+q98fYh3JQOIg7zVYXNoNjPQAK1ZeuqEa4rOOZBLfaDjBIQaJ00l68A==
X-Received: by 2002:a05:600c:34c2:b0:439:9828:c447 with SMTP id 5b1f17b1804b1-439aecf1426mr121408975e9.17.1740416169419;
        Mon, 24 Feb 2025 08:56:09 -0800 (PST)
Received: from localhost (p4ff234b6.dip0.t-ipconnect.de. [79.242.52.182])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-439b02f3eaesm111237045e9.24.2025.02.24.08.56.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 08:56:08 -0800 (PST)
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
	Jann Horn <jannh@google.com>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Subject: [PATCH v2 02/20] mm: factor out large folio handling from folio_nr_pages() into folio_large_nr_pages()
Date: Mon, 24 Feb 2025 17:55:44 +0100
Message-ID: <20250224165603.1434404-3-david@redhat.com>
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

Let's factor it out into a simple helper function. This helper will
also come in handy when working with code where we know that our
folio is large.

While at it, let's consistently return a "long" value from all these
similar functions. Note that we cannot use "unsigned int" (even though
_folio_nr_pages is of that type), because it would break some callers
that do stuff like "-folio_nr_pages()". Both "int" or "unsigned long"
would work as well.

Maybe in the future we'll have the nr_pages readily available for all
large folios, maybe even for small folios, or maybe for none.

Reviewed-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/mm.h | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index d00214e22a174..7c5a8fd29cfcd 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1199,6 +1199,18 @@ static inline unsigned int folio_large_order(const struct folio *folio)
 	return folio->_flags_1 & 0xff;
 }
 
+#ifdef CONFIG_64BIT
+static inline long folio_large_nr_pages(const struct folio *folio)
+{
+	return folio->_folio_nr_pages;
+}
+#else
+static inline long folio_large_nr_pages(const struct folio *folio)
+{
+	return 1L << folio_large_order(folio);
+}
+#endif
+
 /*
  * compound_order() can be called without holding a reference, which means
  * that niceties like page_folio() don't work.  These callers should be
@@ -2141,11 +2153,7 @@ static inline long folio_nr_pages(const struct folio *folio)
 {
 	if (!folio_test_large(folio))
 		return 1;
-#ifdef CONFIG_64BIT
-	return folio->_folio_nr_pages;
-#else
-	return 1L << folio_large_order(folio);
-#endif
+	return folio_large_nr_pages(folio);
 }
 
 /* Only hugetlbfs can allocate folios larger than MAX_ORDER */
@@ -2160,24 +2168,20 @@ static inline long folio_nr_pages(const struct folio *folio)
  * page.  compound_nr() can be called on a tail page, and is defined to
  * return 1 in that case.
  */
-static inline unsigned long compound_nr(struct page *page)
+static inline long compound_nr(struct page *page)
 {
 	struct folio *folio = (struct folio *)page;
 
 	if (!test_bit(PG_head, &folio->flags))
 		return 1;
-#ifdef CONFIG_64BIT
-	return folio->_folio_nr_pages;
-#else
-	return 1L << folio_large_order(folio);
-#endif
+	return folio_large_nr_pages(folio);
 }
 
 /**
  * thp_nr_pages - The number of regular pages in this huge page.
  * @page: The head page of a huge page.
  */
-static inline int thp_nr_pages(struct page *page)
+static inline long thp_nr_pages(struct page *page)
 {
 	return folio_nr_pages((struct folio *)page);
 }
-- 
2.48.1


