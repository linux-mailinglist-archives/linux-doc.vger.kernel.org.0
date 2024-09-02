Return-Path: <linux-doc+bounces-24292-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E8354967E96
	for <lists+linux-doc@lfdr.de>; Mon,  2 Sep 2024 06:42:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 54E89B21738
	for <lists+linux-doc@lfdr.de>; Mon,  2 Sep 2024 04:42:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 029D415FA92;
	Mon,  2 Sep 2024 04:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EU19C1Gk"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C90015573A
	for <linux-doc@vger.kernel.org>; Mon,  2 Sep 2024 04:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725252104; cv=none; b=Ju47YF0y11snA8JDFNgzxbeP86waF7GjlUcuA61ZE5hxOGSOBxsnXP4pea6GxeA8lUp7np2hJ8Uj5aDsJP4qGTLJdmT57u7J6HmlBLnB8NPTIcGJi4LHjPMoIYLCH+1PS0r6Hi/SnRkaBLLpGcs2CGWzrfL+CJWWS5E2cs8vheg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725252104; c=relaxed/simple;
	bh=Rhk63JfhtTaFNKYYhJhXrWW/4atvFHUKwZPMdC92TXw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VWnQTebivDdr9ZAtFxRHuYECUE86/ftTX9qZwfBFMB28OmIv26slQhr73OF1GGbAz395c99nrkTLsngxuEztabiZJNBpXsiF48p3xfymL3XXn0PgreFE7PL/tSbzgh0AjQe0pFy7no++rC/Eq4Ne9J0gO3aQIlK9EewKxBxV1Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EU19C1Gk; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6d470831e3aso50888117b3.3
        for <linux-doc@vger.kernel.org>; Sun, 01 Sep 2024 21:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725252100; x=1725856900; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Nlt0d2kKMzLV8FpvC+sskMXVjz4TJlE3ZyIfZQBAJUA=;
        b=EU19C1GkZYfto3rmE/KOMuBGkJ+BgoMXANAGGFThodvFXae5qmFoyEnmUGXinaBZ9A
         4ejpY/qMA0RF0smVdrtwHlMie/iDZrXZ9kJ4eDIkN12n9vR3XODNkxeTmZzQKTGxjIcB
         eB69HMiYgPF2biz0X8lCjYL4DGdMoZWRQjosMfVRJensx+gDG78pK6S17uUOHVuJmQlx
         Swp0cu2M9NHh+dGix/4+XDVTxLjOA94swQtnb6wrzHTrswCeTMl5flanEp04xZTGeiuX
         XUEhHa0kCoq0MfKhgXLJBPLEn4zlwRKpoPWsBGezJWAwA02Gmd94hygpP5weszBHewNK
         6XAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725252100; x=1725856900;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nlt0d2kKMzLV8FpvC+sskMXVjz4TJlE3ZyIfZQBAJUA=;
        b=ZtJ0HrvPUA/IGuKCzh4qamudRDKcQYXeteQGbNmyl2BUI8LAptIOS2TB9ZWMUpe2qD
         l5ojhhNMQMbayyx1SNnbJ7xs3JSbVkTiQAEL/JrQj5HssphMTupheHgQyKl5qKxTSqgE
         ed/TH79agCR3g9UXQG7ZL1nHlXtnxsLLgt5XT0jhXrJUPBVrOuN0BP6lRvFr1Hs/TO/6
         rvpuSzCfSdgc+R+RyAsp28RYXkt24Q279tuENLk2QbS0SveFRtDd9MawzrvaCUfQcPLP
         yr6tkLu/nUZNl0ZAL1IScSzgy4ohV+YDGHFHjoPCccJ5f74TLlDo/thRKKtAsVEfxAKn
         DUdg==
X-Forwarded-Encrypted: i=1; AJvYcCWaSJyiBdWtn7R+VC/JfmUAGpaE+EUt32a8K965tJYhLiOmnrkiB6TW00wioE9hfFR/dBPAFiQ0mzg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMoU1okkbbE5s6UQa8H+Oe6X232bhjSzy6fUl3GoyBYysQVA1x
	dAbhdit/YP76aBvhaEu8XagjL0FL0n28Uchy59m0TEqv64tFH7pdAXfN1V9KSPtreuBJ2FC0SuG
	9nA==
X-Google-Smtp-Source: AGHT+IHSPd8nZJZH/UC+NYWl2T7llxAohdiabcKHZvTC/kXLRpqPrIn5YCFkqt976gAwR4y0XtmrRfdj/lI=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:201:7343:ecd2:aed:5b8f])
 (user=surenb job=sendgmr) by 2002:a05:690c:6309:b0:691:41f5:7f42 with SMTP id
 00721157ae682-6d40f340f7dmr6255217b3.4.1725252100605; Sun, 01 Sep 2024
 21:41:40 -0700 (PDT)
Date: Sun,  1 Sep 2024 21:41:26 -0700
In-Reply-To: <20240902044128.664075-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240902044128.664075-1-surenb@google.com>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
Message-ID: <20240902044128.664075-5-surenb@google.com>
Subject: [PATCH v2 4/6] alloc_tag: introduce pgalloc_tag_ref to abstract page
 tag references
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: kent.overstreet@linux.dev, corbet@lwn.net, arnd@arndb.de, 
	mcgrof@kernel.org, rppt@kernel.org, paulmck@kernel.org, thuth@redhat.com, 
	tglx@linutronix.de, bp@alien8.de, xiongwei.song@windriver.com, 
	ardb@kernel.org, david@redhat.com, vbabka@suse.cz, mhocko@suse.com, 
	hannes@cmpxchg.org, roman.gushchin@linux.dev, dave@stgolabs.net, 
	willy@infradead.org, liam.howlett@oracle.com, pasha.tatashin@soleen.com, 
	souravpanda@google.com, keescook@chromium.org, dennis@kernel.org, 
	jhubbard@nvidia.com, yuzhao@google.com, vvvvvv@google.com, 
	rostedt@goodmis.org, iamjoonsoo.kim@lge.com, rientjes@google.com, 
	minchan@google.com, kaleshsingh@google.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	linux-modules@vger.kernel.org, kernel-team@android.com, surenb@google.com
Content-Type: text/plain; charset="UTF-8"

To simplify later changes to page tag references, introduce new
pgalloc_tag_ref and pgtag_ref_handle types. This allows easy
replacement of page_ext as a storage of page allocation tags

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 include/linux/pgalloc_tag.h | 144 +++++++++++++++++++++++-------------
 lib/alloc_tag.c             |   3 +-
 2 files changed, 95 insertions(+), 52 deletions(-)

diff --git a/include/linux/pgalloc_tag.h b/include/linux/pgalloc_tag.h
index 244a328dff62..c76b629d0206 100644
--- a/include/linux/pgalloc_tag.h
+++ b/include/linux/pgalloc_tag.h
@@ -9,48 +9,76 @@
 
 #ifdef CONFIG_MEM_ALLOC_PROFILING
 
+typedef union codetag_ref	pgalloc_tag_ref;
+
+static inline void read_pgref(pgalloc_tag_ref *pgref, union codetag_ref *ref)
+{
+	ref->ct = pgref->ct;
+}
+
+static inline void write_pgref(pgalloc_tag_ref *pgref, union codetag_ref *ref)
+{
+	pgref->ct = ref->ct;
+}
 #include <linux/page_ext.h>
 
 extern struct page_ext_operations page_alloc_tagging_ops;
 
-static inline union codetag_ref *codetag_ref_from_page_ext(struct page_ext *page_ext)
+static inline pgalloc_tag_ref *pgref_from_page_ext(struct page_ext *page_ext)
 {
-	return (union codetag_ref *)page_ext_data(page_ext, &page_alloc_tagging_ops);
+	return (pgalloc_tag_ref *)page_ext_data(page_ext, &page_alloc_tagging_ops);
 }
 
-static inline struct page_ext *page_ext_from_codetag_ref(union codetag_ref *ref)
+static inline struct page_ext *page_ext_from_pgref(pgalloc_tag_ref *pgref)
 {
-	return (void *)ref - page_alloc_tagging_ops.offset;
+	return (void *)pgref - page_alloc_tagging_ops.offset;
 }
 
+typedef pgalloc_tag_ref	*pgtag_ref_handle;
+
 /* Should be called only if mem_alloc_profiling_enabled() */
-static inline union codetag_ref *get_page_tag_ref(struct page *page)
+static inline pgtag_ref_handle get_page_tag_ref(struct page *page, union codetag_ref *ref)
 {
 	if (page) {
 		struct page_ext *page_ext = page_ext_get(page);
 
-		if (page_ext)
-			return codetag_ref_from_page_ext(page_ext);
+		if (page_ext) {
+			pgalloc_tag_ref *pgref = pgref_from_page_ext(page_ext);
+
+			read_pgref(pgref, ref);
+			return pgref;
+		}
 	}
 	return NULL;
 }
 
-static inline void put_page_tag_ref(union codetag_ref *ref)
+static inline void put_page_tag_ref(pgtag_ref_handle pgref)
 {
-	if (WARN_ON(!ref))
+	if (WARN_ON(!pgref))
 		return;
 
-	page_ext_put(page_ext_from_codetag_ref(ref));
+	page_ext_put(page_ext_from_pgref(pgref));
+}
+
+static inline void update_page_tag_ref(pgtag_ref_handle pgref, union codetag_ref *ref)
+{
+	if (WARN_ON(!pgref || !ref))
+		return;
+
+	write_pgref(pgref, ref);
 }
 
 static inline void clear_page_tag_ref(struct page *page)
 {
 	if (mem_alloc_profiling_enabled()) {
-		union codetag_ref *ref = get_page_tag_ref(page);
-
-		if (ref) {
-			set_codetag_empty(ref);
-			put_page_tag_ref(ref);
+		pgtag_ref_handle handle;
+		union codetag_ref ref;
+
+		handle = get_page_tag_ref(page, &ref);
+		if (handle) {
+			set_codetag_empty(&ref);
+			update_page_tag_ref(handle, &ref);
+			put_page_tag_ref(handle);
 		}
 	}
 }
@@ -59,11 +87,14 @@ static inline void pgalloc_tag_add(struct page *page, struct task_struct *task,
 				   unsigned int nr)
 {
 	if (mem_alloc_profiling_enabled()) {
-		union codetag_ref *ref = get_page_tag_ref(page);
-
-		if (ref) {
-			alloc_tag_add(ref, task->alloc_tag, PAGE_SIZE * nr);
-			put_page_tag_ref(ref);
+		pgtag_ref_handle handle;
+		union codetag_ref ref;
+
+		handle = get_page_tag_ref(page, &ref);
+		if (handle) {
+			alloc_tag_add(&ref, task->alloc_tag, PAGE_SIZE * nr);
+			update_page_tag_ref(handle, &ref);
+			put_page_tag_ref(handle);
 		}
 	}
 }
@@ -71,53 +102,58 @@ static inline void pgalloc_tag_add(struct page *page, struct task_struct *task,
 static inline void pgalloc_tag_sub(struct page *page, unsigned int nr)
 {
 	if (mem_alloc_profiling_enabled()) {
-		union codetag_ref *ref = get_page_tag_ref(page);
-
-		if (ref) {
-			alloc_tag_sub(ref, PAGE_SIZE * nr);
-			put_page_tag_ref(ref);
+		pgtag_ref_handle handle;
+		union codetag_ref ref;
+
+		handle = get_page_tag_ref(page, &ref);
+		if (handle) {
+			alloc_tag_sub(&ref, PAGE_SIZE * nr);
+			update_page_tag_ref(handle, &ref);
+			put_page_tag_ref(handle);
 		}
 	}
 }
 
 static inline void pgalloc_tag_split(struct page *page, unsigned int nr)
 {
-	int i;
-	struct page_ext *first_page_ext;
-	struct page_ext *page_ext;
-	union codetag_ref *ref;
+	pgtag_ref_handle first_pgref;
+	union codetag_ref first_ref;
 	struct alloc_tag *tag;
+	int i;
 
 	if (!mem_alloc_profiling_enabled())
 		return;
 
-	first_page_ext = page_ext = page_ext_get(page);
-	if (unlikely(!page_ext))
+	first_pgref = get_page_tag_ref(page, &first_ref);
+	if (unlikely(!first_pgref))
 		return;
 
-	ref = codetag_ref_from_page_ext(page_ext);
-	if (!ref->ct)
+	if (!first_ref.ct)
 		goto out;
 
-	tag = ct_to_alloc_tag(ref->ct);
-	page_ext = page_ext_next(page_ext);
+	tag = ct_to_alloc_tag(first_ref.ct);
 	for (i = 1; i < nr; i++) {
-		/* Set new reference to point to the original tag */
-		ref = codetag_ref_from_page_ext(page_ext);
-		alloc_tag_add_check(ref, tag);
-		if (ref) {
-			ref->ct = &tag->ct;
+		pgtag_ref_handle handle;
+		union codetag_ref ref;
+
+		page++;
+		handle = get_page_tag_ref(page, &ref);
+		if (handle) {
+			/* Set new reference to point to the original tag */
+			alloc_tag_add_check(&ref, tag);
+			ref.ct = &tag->ct;
 			/*
 			 * We need in increment the call counter every time we split a
 			 * large allocation into smaller ones because when we free each
 			 * part the counter will be decremented.
 			 */
 			this_cpu_inc(tag->counters->calls);
+			update_page_tag_ref(handle, &ref);
+			put_page_tag_ref(handle);
 		}
-		page_ext = page_ext_next(page_ext);
 	}
 out:
-	page_ext_put(first_page_ext);
+	put_page_tag_ref(first_pgref);
 }
 
 static inline struct alloc_tag *pgalloc_tag_get(struct page *page)
@@ -125,13 +161,15 @@ static inline struct alloc_tag *pgalloc_tag_get(struct page *page)
 	struct alloc_tag *tag = NULL;
 
 	if (mem_alloc_profiling_enabled()) {
-		union codetag_ref *ref = get_page_tag_ref(page);
-
-		alloc_tag_sub_check(ref);
-		if (ref) {
-			if (ref->ct)
-				tag = ct_to_alloc_tag(ref->ct);
-			put_page_tag_ref(ref);
+		pgtag_ref_handle handle;
+		union codetag_ref ref;
+
+		handle = get_page_tag_ref(page, &ref);
+		if (handle) {
+			alloc_tag_sub_check(&ref);
+			if (ref.ct)
+				tag = ct_to_alloc_tag(ref.ct);
+			put_page_tag_ref(handle);
 		}
 	}
 
@@ -146,8 +184,12 @@ static inline void pgalloc_tag_sub_pages(struct alloc_tag *tag, unsigned int nr)
 
 #else /* CONFIG_MEM_ALLOC_PROFILING */
 
-static inline union codetag_ref *get_page_tag_ref(struct page *page) { return NULL; }
-static inline void put_page_tag_ref(union codetag_ref *ref) {}
+typedef void	*pgtag_ref_handle;
+
+static inline pgtag_ref_handle
+get_page_tag_ref(struct page *page, union codetag_ref *ref) { return NULL; }
+static inline void put_page_tag_ref(pgtag_ref_handle handle) {}
+static inline void update_page_tag_ref(pgtag_ref_handle handle, union codetag_ref *ref) {}
 static inline void clear_page_tag_ref(struct page *page) {}
 static inline void pgalloc_tag_add(struct page *page, struct task_struct *task,
 				   unsigned int nr) {}
diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
index 19ef02a18611..53bd3236d30b 100644
--- a/lib/alloc_tag.c
+++ b/lib/alloc_tag.c
@@ -5,6 +5,7 @@
 #include <linux/gfp.h>
 #include <linux/module.h>
 #include <linux/page_ext.h>
+#include <linux/pgalloc_tag.h>
 #include <linux/proc_fs.h>
 #include <linux/seq_buf.h>
 #include <linux/seq_file.h>
@@ -436,7 +437,7 @@ static __init void init_page_alloc_tagging(void)
 }
 
 struct page_ext_operations page_alloc_tagging_ops = {
-	.size = sizeof(union codetag_ref),
+	.size = sizeof(pgalloc_tag_ref),
 	.need = need_page_alloc_tagging,
 	.init = init_page_alloc_tagging,
 };
-- 
2.46.0.469.g59c65b2a67-goog


