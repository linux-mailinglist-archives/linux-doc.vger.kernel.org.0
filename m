Return-Path: <linux-doc+bounces-11610-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 285D4873F96
	for <lists+linux-doc@lfdr.de>; Wed,  6 Mar 2024 19:35:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA2D71F217B4
	for <lists+linux-doc@lfdr.de>; Wed,  6 Mar 2024 18:35:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A2AE151764;
	Wed,  6 Mar 2024 18:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="g1yq0Mbb"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7596D151768
	for <linux-doc@vger.kernel.org>; Wed,  6 Mar 2024 18:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709749560; cv=none; b=k/3uin7/u5wACiqq2WCvNGlSQ0hq5jWnQg/Lt8ZrZw1OYsTmqwYW9M+roRQs6b93+bLlbkT95XCLHulQ5SndQG37FnwD2rKyxWE1XKmvMbeesSKXGy/4AUrii74BJwVOV4x8Eg/eFiasNZTG/yHIHItdfGlrXcKKdou+3wi8VxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709749560; c=relaxed/simple;
	bh=uxI/5DSg9XeSqXLbgJXRQFHJh+zlT4SbF7vRrrDwsaA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YlGyCZoPPUSm3fxKBXh7tIYQ/eaJQZY1srZgKRylwmZZV7vI8BySPhvNw2fl0Ldc8ZgMjK6iNHUJwfYpCY4igIaNKm3p0RdOKF/ZLglsWqbGxaI/lWJGjtflHxF4OtUaR+lBq2ES89HltNk9EvSDPE1N+A/nsdh+Z+bxzj+Suh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=g1yq0Mbb; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-5ee22efe5eeso78747b3.3
        for <linux-doc@vger.kernel.org>; Wed, 06 Mar 2024 10:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709749557; x=1710354357; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/rQHM1U0nLVwxoqb6VDJGJRpri0atHFBD/ukIXSlku4=;
        b=g1yq0Mbb4dPcLb7aPyv4GMfoXu3HBGTgDNyOlXOcXLbHOnM7nc3E3+su88oKs92mJW
         71Fz6gGGENmxx3IJc1l1+hBbuHR8YDU7zGGb9lLxRHbpbg4TZlGj6RjGQfVixewrOCgR
         ejPRpQK9h17dq0G1e+zbnhzpkJMyPBKoA7s52FVH/uc6kdP0B5i2wqRP4kmNqNdVV+FJ
         BRKg8h0Fs9TdoMjwftd6/+/lpTq1iZyKCFmovv5uhfmVuhM49Q+Sk+Kh+ryk3q0xtRPp
         ZcPFvDk1js5ynpAhujat8yn6okT/E9VHSpmEwmq76SIrw4uMqGBT/lqoppGRmd4wFClz
         SHbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709749557; x=1710354357;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/rQHM1U0nLVwxoqb6VDJGJRpri0atHFBD/ukIXSlku4=;
        b=pq+vax9pq7si+pyuM+c/m9yfS3ThgZqcesDCY2oIGHvZhwumRmuY++tzEY05uWhy7j
         M/Rn2tTIMAJe32ffpvYODVvwA6uaCg84VbMMNbzVf7+/wrzQf3zbiI9QTpe/1JHJsSix
         fHo7TGYyTdx+K4S1pFtg/etuFdqHDD1gDqqqba81DfhI7AMUgCjf3xqSq0Zxaw2B8VyI
         JaBTz8CTFgOarYGIjqSKIZ4Xphtd0E4gSQ1bMzxZ/0Hz9auHfZ5AoO3yeS8XyfMNdcMB
         VbuN2gnrFOIq5pxa/4aSj9rAeyl9etwoqEVX7IvovvpKDHwRlJOO8/312xBGICZUFHiH
         7yVw==
X-Forwarded-Encrypted: i=1; AJvYcCXqLeya5FNV5C5aUFBchpBfmp7C31VlfBWL1BDHlzQXcqxpLhjPi3G+eSj6XU+hwUZXEc5bB02roCHQ6TtVjiultvs9qNj/vVe8
X-Gm-Message-State: AOJu0Yyva0ropVqT430YyO4F6goKDWAINi9+sDJ6+VjR68COAkbYsJib
	sbdFxxHxMYDIxw2Pu9pkYf4ny1RupBBZQQomi7ihAJtScTYMHbPMNKCelDQWtfFAyswlxnqYYmu
	l6A==
X-Google-Smtp-Source: AGHT+IGylq2hXmjkk0zshnCen8YUvCWPBEs19UcrOnAI3PcEdGgYWrVUEFQJWagWIw3puXNNod8UwtNgR7M=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:201:85f0:e3db:db05:85e2])
 (user=surenb job=sendgmr) by 2002:a81:9b97:0:b0:609:3c53:d489 with SMTP id
 s145-20020a819b97000000b006093c53d489mr3279719ywg.3.1709749557600; Wed, 06
 Mar 2024 10:25:57 -0800 (PST)
Date: Wed,  6 Mar 2024 10:24:32 -0800
In-Reply-To: <20240306182440.2003814-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240306182440.2003814-1-surenb@google.com>
X-Mailer: git-send-email 2.44.0.278.ge034bb2e1d-goog
Message-ID: <20240306182440.2003814-35-surenb@google.com>
Subject: [PATCH v5 34/37] codetag: debug: mark codetags for reserved pages as empty
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: kent.overstreet@linux.dev, mhocko@suse.com, vbabka@suse.cz, 
	hannes@cmpxchg.org, roman.gushchin@linux.dev, mgorman@suse.de, 
	dave@stgolabs.net, willy@infradead.org, liam.howlett@oracle.com, 
	penguin-kernel@i-love.sakura.ne.jp, corbet@lwn.net, void@manifault.com, 
	peterz@infradead.org, juri.lelli@redhat.com, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, tglx@linutronix.de, mingo@redhat.com, 
	dave.hansen@linux.intel.com, x86@kernel.org, peterx@redhat.com, 
	david@redhat.com, axboe@kernel.dk, mcgrof@kernel.org, masahiroy@kernel.org, 
	nathan@kernel.org, dennis@kernel.org, jhubbard@nvidia.com, tj@kernel.org, 
	muchun.song@linux.dev, rppt@kernel.org, paulmck@kernel.org, 
	pasha.tatashin@soleen.com, yosryahmed@google.com, yuzhao@google.com, 
	dhowells@redhat.com, hughd@google.com, andreyknvl@gmail.com, 
	keescook@chromium.org, ndesaulniers@google.com, vvvvvv@google.com, 
	gregkh@linuxfoundation.org, ebiggers@google.com, ytcoode@gmail.com, 
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, bristot@redhat.com, vschneid@redhat.com, cl@linux.com, 
	penberg@kernel.org, iamjoonsoo.kim@lge.com, 42.hyeyoo@gmail.com, 
	glider@google.com, elver@google.com, dvyukov@google.com, shakeelb@google.com, 
	songmuchun@bytedance.com, jbaron@akamai.com, aliceryhl@google.com, 
	rientjes@google.com, minchan@google.com, kaleshsingh@google.com, 
	surenb@google.com, kernel-team@android.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-modules@vger.kernel.org, kasan-dev@googlegroups.com, 
	cgroups@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

To avoid debug warnings while freeing reserved pages which were not
allocated with usual allocators, mark their codetags as empty before
freeing.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
Reviewed-by: Kees Cook <keescook@chromium.org>
---
 include/linux/alloc_tag.h   |  1 +
 include/linux/mm.h          |  9 +++++++++
 include/linux/pgalloc_tag.h |  2 ++
 mm/mm_init.c                | 12 +++++++++++-
 4 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/include/linux/alloc_tag.h b/include/linux/alloc_tag.h
index c30e6c944353..100ddf66eb8e 100644
--- a/include/linux/alloc_tag.h
+++ b/include/linux/alloc_tag.h
@@ -46,6 +46,7 @@ static inline void set_codetag_empty(union codetag_ref *ref)
 #else /* CONFIG_MEM_ALLOC_PROFILING_DEBUG */
 
 static inline bool is_codetag_empty(union codetag_ref *ref) { return false; }
+static inline void set_codetag_empty(union codetag_ref *ref) {}
 
 #endif /* CONFIG_MEM_ALLOC_PROFILING_DEBUG */
 
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 699e850d143c..9d25d449e512 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -5,6 +5,7 @@
 #include <linux/errno.h>
 #include <linux/mmdebug.h>
 #include <linux/gfp.h>
+#include <linux/pgalloc_tag.h>
 #include <linux/bug.h>
 #include <linux/list.h>
 #include <linux/mmzone.h>
@@ -3118,6 +3119,14 @@ extern void reserve_bootmem_region(phys_addr_t start,
 /* Free the reserved page into the buddy system, so it gets managed. */
 static inline void free_reserved_page(struct page *page)
 {
+	if (mem_alloc_profiling_enabled()) {
+		union codetag_ref *ref = get_page_tag_ref(page);
+
+		if (ref) {
+			set_codetag_empty(ref);
+			put_page_tag_ref(ref);
+		}
+	}
 	ClearPageReserved(page);
 	init_page_count(page);
 	__free_page(page);
diff --git a/include/linux/pgalloc_tag.h b/include/linux/pgalloc_tag.h
index 59de43172cc2..01f256234e60 100644
--- a/include/linux/pgalloc_tag.h
+++ b/include/linux/pgalloc_tag.h
@@ -120,6 +120,8 @@ static inline void pgalloc_tag_sub_bytes(struct alloc_tag *tag, unsigned int ord
 
 #else /* CONFIG_MEM_ALLOC_PROFILING */
 
+static inline union codetag_ref *get_page_tag_ref(struct page *page) { return NULL; }
+static inline void put_page_tag_ref(union codetag_ref *ref) {}
 static inline void pgalloc_tag_add(struct page *page, struct task_struct *task,
 				   unsigned int order) {}
 static inline void pgalloc_tag_sub(struct page *page, unsigned int order) {}
diff --git a/mm/mm_init.c b/mm/mm_init.c
index 2fd9bf044a79..f45c2b32ba82 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -2567,7 +2567,6 @@ void __init set_dma_reserve(unsigned long new_dma_reserve)
 void __init memblock_free_pages(struct page *page, unsigned long pfn,
 							unsigned int order)
 {
-
 	if (IS_ENABLED(CONFIG_DEFERRED_STRUCT_PAGE_INIT)) {
 		int nid = early_pfn_to_nid(pfn);
 
@@ -2579,6 +2578,17 @@ void __init memblock_free_pages(struct page *page, unsigned long pfn,
 		/* KMSAN will take care of these pages. */
 		return;
 	}
+
+	/* pages were reserved and not allocated */
+	if (mem_alloc_profiling_enabled()) {
+		union codetag_ref *ref = get_page_tag_ref(page);
+
+		if (ref) {
+			set_codetag_empty(ref);
+			put_page_tag_ref(ref);
+		}
+	}
+
 	__free_pages_core(page, order);
 }
 
-- 
2.44.0.278.ge034bb2e1d-goog


