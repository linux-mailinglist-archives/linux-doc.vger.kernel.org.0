Return-Path: <linux-doc+bounces-962-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E19B47D52AE
	for <lists+linux-doc@lfdr.de>; Tue, 24 Oct 2023 15:48:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D108B1C20BB0
	for <lists+linux-doc@lfdr.de>; Tue, 24 Oct 2023 13:48:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B8FF2B5F3;
	Tue, 24 Oct 2023 13:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LTGRqr23"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE928341A6
	for <linux-doc@vger.kernel.org>; Tue, 24 Oct 2023 13:47:36 +0000 (UTC)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FE7C1BDB
	for <linux-doc@vger.kernel.org>; Tue, 24 Oct 2023 06:47:27 -0700 (PDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-5a8ebc70d33so55473417b3.1
        for <linux-doc@vger.kernel.org>; Tue, 24 Oct 2023 06:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698155246; x=1698760046; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zhzOhwHQcxJuZ74GpFe9sYgSfMOEl4CWCuHOL/zyxyA=;
        b=LTGRqr23GKhxcA936hbAdR0QYqb1rrH3OeGhcHCLNGBQlRhtbSBk6bF/K6O8kSes0t
         tlWoCICmJVmTC+r9JvEgDShF0eHFub0fNpwBOiyo5BKL2+PXGPjkXuUMSEOaxS0KWJNx
         WWOH1EYFtQgFKO/RUWUOE+X0OmJQ8UpoaPBPukzaJRxX3QkdyQ2nETpuxagwoB9vifGP
         yyjrBHvnV9KsIw2545gjzUZHoj3zdjrNkVJEpRVOq5TU3BFKt4BjI3v26/ggFpUrC1ej
         9SWEdUrtPhdwDM+MN9byluamoHrTFMHtcdBjJQ22G7WXFAg1EM5Mo2Sdkg7Zw6kM2lt4
         fWmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698155246; x=1698760046;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zhzOhwHQcxJuZ74GpFe9sYgSfMOEl4CWCuHOL/zyxyA=;
        b=jm8WrQ7nBL1Yf+fpDPLkC+P+7fgOQTBnpkCcesa5d9rtwOBsl/jAk6r5fBUqb77A7W
         a3+DduvTk0CZhFCk8JIq8tpl7P6bsvakRZVcC5JZgKc40DJoIHHO+FZEpFn4W1MThMT3
         Qco1rk5QwSD1sq1L1ovWEzWFNcR+wFnP5qG0FFf71qcfb0649HpKkLUPWp/ICeiOPGvf
         v1a3Wjq8T8YuQ2gQ0dYAEVSeV1gXfgAS03l3rlg+MZ1Fjt7pVoCvGgGJR5ESPdpJ7dQ+
         c8nBKUm8wACd0IcM0dBTVB/LnxAm1wFqE/EJcAACBbrnXvkxUOi+Yk9L87gQvM4Q7LEn
         rF9A==
X-Gm-Message-State: AOJu0Ywe2/sQ1spbFfD73MMYg0NaDwEVePdX+WhZyky+xLJJ5+X/eAAO
	6w0ATV0zvDfjFuKY7jKfnQ25DTrFNu8=
X-Google-Smtp-Source: AGHT+IGqbReHwIMnajbCAyyRpg4FWyctkHXB3WgJzXU7P7J0pPMsKbVadURacVWEffWX34fNon1x9kvs7DE=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:201:45ba:3318:d7a5:336a])
 (user=surenb job=sendgmr) by 2002:a25:42c9:0:b0:d9a:bce6:acf3 with SMTP id
 p192-20020a2542c9000000b00d9abce6acf3mr225566yba.0.1698155245951; Tue, 24 Oct
 2023 06:47:25 -0700 (PDT)
Date: Tue, 24 Oct 2023 06:46:17 -0700
In-Reply-To: <20231024134637.3120277-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20231024134637.3120277-1-surenb@google.com>
X-Mailer: git-send-email 2.42.0.758.gaed0368e0e-goog
Message-ID: <20231024134637.3120277-21-surenb@google.com>
Subject: [PATCH v2 20/39] mm: create new codetag references during page splitting
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: kent.overstreet@linux.dev, mhocko@suse.com, vbabka@suse.cz, 
	hannes@cmpxchg.org, roman.gushchin@linux.dev, mgorman@suse.de, 
	dave@stgolabs.net, willy@infradead.org, liam.howlett@oracle.com, 
	corbet@lwn.net, void@manifault.com, peterz@infradead.org, 
	juri.lelli@redhat.com, ldufour@linux.ibm.com, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, tglx@linutronix.de, mingo@redhat.com, 
	dave.hansen@linux.intel.com, x86@kernel.org, peterx@redhat.com, 
	david@redhat.com, axboe@kernel.dk, mcgrof@kernel.org, masahiroy@kernel.org, 
	nathan@kernel.org, dennis@kernel.org, tj@kernel.org, muchun.song@linux.dev, 
	rppt@kernel.org, paulmck@kernel.org, pasha.tatashin@soleen.com, 
	yosryahmed@google.com, yuzhao@google.com, dhowells@redhat.com, 
	hughd@google.com, andreyknvl@gmail.com, keescook@chromium.org, 
	ndesaulniers@google.com, vvvvvv@google.com, gregkh@linuxfoundation.org, 
	ebiggers@google.com, ytcoode@gmail.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	bristot@redhat.com, vschneid@redhat.com, cl@linux.com, penberg@kernel.org, 
	iamjoonsoo.kim@lge.com, 42.hyeyoo@gmail.com, glider@google.com, 
	elver@google.com, dvyukov@google.com, shakeelb@google.com, 
	songmuchun@bytedance.com, jbaron@akamai.com, rientjes@google.com, 
	minchan@google.com, kaleshsingh@google.com, surenb@google.com, 
	kernel-team@android.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-modules@vger.kernel.org, kasan-dev@googlegroups.com, 
	cgroups@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

When a high-order page is split into smaller ones, each newly split
page should get its codetag. The original codetag is reused for these
pages but it's recorded as 0-byte allocation because original codetag
already accounts for the original high-order allocated page.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 include/linux/pgalloc_tag.h | 30 ++++++++++++++++++++++++++++++
 mm/huge_memory.c            |  2 ++
 mm/page_alloc.c             |  2 ++
 3 files changed, 34 insertions(+)

diff --git a/include/linux/pgalloc_tag.h b/include/linux/pgalloc_tag.h
index a060c26eb449..0174aff5e871 100644
--- a/include/linux/pgalloc_tag.h
+++ b/include/linux/pgalloc_tag.h
@@ -62,11 +62,41 @@ static inline void pgalloc_tag_sub(struct page *page, unsigned int order)
 	}
 }
 
+static inline void pgalloc_tag_split(struct page *page, unsigned int nr)
+{
+	int i;
+	struct page_ext *page_ext;
+	union codetag_ref *ref;
+	struct alloc_tag *tag;
+
+	if (!mem_alloc_profiling_enabled())
+		return;
+
+	page_ext = page_ext_get(page);
+	if (unlikely(!page_ext))
+		return;
+
+	ref = codetag_ref_from_page_ext(page_ext);
+	if (!ref->ct)
+		goto out;
+
+	tag = ct_to_alloc_tag(ref->ct);
+	page_ext = page_ext_next(page_ext);
+	for (i = 1; i < nr; i++) {
+		/* New reference with 0 bytes accounted */
+		alloc_tag_add(codetag_ref_from_page_ext(page_ext), tag, 0);
+		page_ext = page_ext_next(page_ext);
+	}
+out:
+	page_ext_put(page_ext);
+}
+
 #else /* CONFIG_MEM_ALLOC_PROFILING */
 
 static inline void pgalloc_tag_add(struct page *page, struct task_struct *task,
 				   unsigned int order) {}
 static inline void pgalloc_tag_sub(struct page *page, unsigned int order) {}
+static inline void pgalloc_tag_split(struct page *page, unsigned int nr) {}
 
 #endif /* CONFIG_MEM_ALLOC_PROFILING */
 
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 064fbd90822b..392b6907d875 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -37,6 +37,7 @@
 #include <linux/page_owner.h>
 #include <linux/sched/sysctl.h>
 #include <linux/memory-tiers.h>
+#include <linux/pgalloc_tag.h>
 
 #include <asm/tlb.h>
 #include <asm/pgalloc.h>
@@ -2545,6 +2546,7 @@ static void __split_huge_page(struct page *page, struct list_head *list,
 	/* Caller disabled irqs, so they are still disabled here */
 
 	split_page_owner(head, nr);
+	pgalloc_tag_split(head, nr);
 
 	/* See comment in __split_huge_page_tail() */
 	if (PageAnon(head)) {
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 63dc2f8c7901..c4f0cd127e14 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -2540,6 +2540,7 @@ void split_page(struct page *page, unsigned int order)
 	for (i = 1; i < (1 << order); i++)
 		set_page_refcounted(page + i);
 	split_page_owner(page, 1 << order);
+	pgalloc_tag_split(page, 1 << order);
 	split_page_memcg(page, 1 << order);
 }
 EXPORT_SYMBOL_GPL(split_page);
@@ -4669,6 +4670,7 @@ static void *make_alloc_exact(unsigned long addr, unsigned int order,
 		struct page *last = page + nr;
 
 		split_page_owner(page, 1 << order);
+		pgalloc_tag_split(page, 1 << order);
 		split_page_memcg(page, 1 << order);
 		while (page < --last)
 			set_page_refcounted(last);
-- 
2.42.0.758.gaed0368e0e-goog


