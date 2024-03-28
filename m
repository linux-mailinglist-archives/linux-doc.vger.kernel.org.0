Return-Path: <linux-doc+bounces-12477-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D5E885E3E
	for <lists+linux-doc@lfdr.de>; Thu, 21 Mar 2024 17:45:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 251D41C20340
	for <lists+linux-doc@lfdr.de>; Thu, 21 Mar 2024 16:45:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 359F113A255;
	Thu, 21 Mar 2024 16:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="H/nZHpnq"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917B6139581
	for <linux-doc@vger.kernel.org>; Thu, 21 Mar 2024 16:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711039077; cv=none; b=OwRhgeFLtwJ0XPjOOnwauF5kH8GR56athx3NQL64yLVyqWHG9xc01wbtf6ettXFexblpHRKYMPwTmic1WJYhr6RDMWrFhb7VESWmjIr3ZwoHukJIX3+hCs55GfSzZRaYeslXzPdiIeeEqxPKa0xkeVbwisCKC6KDJs86z0I02Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711039077; c=relaxed/simple;
	bh=q3rjzWyhmG5cuSNHeqibvv4qQMuWF17WVodXZAuRHsE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BVN6cMQN69soF//354Nk8S2UEMyGkNrlB9QAq4svJLg9faSr1KEdOkPcINN1bnQ1Uq1ngV7NPAXncGjh4lMDYrYcYhmKCM/Xop4T0zCoakxl+gisDRGiU43okzHJ6e8s1S0F9zNM+hkqbxrSQMyHuawGxz6SldpPSyroeYQEmF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=H/nZHpnq; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-dd944567b6cso1545028276.2
        for <linux-doc@vger.kernel.org>; Thu, 21 Mar 2024 09:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711039074; x=1711643874; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/zyX0GCVbwAVqAn+thP4TQZbJ1DZ8xPrkSKdxK+srAs=;
        b=H/nZHpnqnh56xgMrLxTP7kIlE7MiJsmMHgNm1xlFsNrulPEvtmLpDd/AIg1Txm8ByW
         lJ/eOl/B5agvQIwBRDLo9KZ0VefLTkr+qyBkEUKkn30RwzIKzrqpIbE45N/RhEfiuLje
         ywvjWuCgNyGsKyHt15KVIZX2HR37MdCmAySvdRlGsrr0q+zP+ASFFIYoQMcRwmKRhEAl
         3pmKPWdTOOktySV1o3I7GQF9odLyePM7rT5Xqk+7rSDMXWaM4vE8NkSTGrj/LX2LbrYw
         NrwwbwExWXAs4BqV6P2OjhOTaqNL0NgTBci8BnP/OvN8Aa6vwyXmm1y9/xnlgBhqAXFp
         h/xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711039074; x=1711643874;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/zyX0GCVbwAVqAn+thP4TQZbJ1DZ8xPrkSKdxK+srAs=;
        b=kfG1/QxIcRTODTVLDaseCLGTrX0YwgwdWPq3/rd8+IHsbe0L3kdhf53DCdFx9oqAnv
         15f0xqP7jzm/6ptm7oIQy8+quXtph927FoZQCEJE9ENETIuVWD/UaW1EqI38633fBjWn
         Tbjlh8BlHUSYsqYmW2QSVNNhwRscQ/Jocm8CKclTxtRy2vpkb4OMUNDDPeiQo272w6Bg
         u3GH0/ZdnCF+Fxv5K0gkrUBg5ptU7ckgjb7+DFFnKXzmrrGS9l+qhs4EiJGgE6GoZIc8
         4dm3IqVrDYIC9GzdR+OrKKziqECRTstiJz5vloHPx0K2TgnX4itLjFQS5tS9SN0ulCaf
         2Z3A==
X-Forwarded-Encrypted: i=1; AJvYcCUmgj4jav8D5KxfzKtVDW5sOOoO6NXKawaTasbmDpTx4lPT2aV+Q3mAXBUGv4P4Bq/582LfwXD1887hcSmFFaUG+x5pgAVk2jr/
X-Gm-Message-State: AOJu0YyMJrrvqIwwS/ilNgKHISbnrH2EpKOcCTAsZeo15jtDlFd8qkRS
	WnsjKGv9oPq8Rj0B+bPH6v0Yb50QTM+HvxcTq7OTQKNs9gG0NvXAo4yHLXuuQjWIMddVLw9mfWU
	sjw==
X-Google-Smtp-Source: AGHT+IGl7/sqfjKOff0ZjNp0/9geWcByH3EbVIixPqUdOWI6lFEA8KUqGJXoRB+ynXILrSpbs71KJ/Vx4lo=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:201:a489:6433:be5d:e639])
 (user=surenb job=sendgmr) by 2002:a05:6902:218c:b0:dcc:4785:b51e with SMTP id
 dl12-20020a056902218c00b00dcc4785b51emr980431ybb.12.1711039073381; Thu, 21
 Mar 2024 09:37:53 -0700 (PDT)
Date: Thu, 21 Mar 2024 09:36:42 -0700
In-Reply-To: <20240321163705.3067592-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240321163705.3067592-1-surenb@google.com>
X-Mailer: git-send-email 2.44.0.291.gc1ea87d7ee-goog
Message-ID: <20240321163705.3067592-21-surenb@google.com>
Subject: [PATCH v6 20/37] mm: fix non-compound multi-order memory accounting
 in __free_pages
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
	glider@google.com, elver@google.com, dvyukov@google.com, 
	songmuchun@bytedance.com, jbaron@akamai.com, aliceryhl@google.com, 
	rientjes@google.com, minchan@google.com, kaleshsingh@google.com, 
	surenb@google.com, kernel-team@android.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-modules@vger.kernel.org, kasan-dev@googlegroups.com, 
	cgroups@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

When a non-compound multi-order page is freed, it is possible that a
speculative reference keeps the page pinned. In this case we free all
pages except for the first page, which will be freed later by the last
put_page(). However the page passed to put_page() is indistinguishable
from an order-0 page, so it cannot do the accounting, just as it cannot
free the subsequent pages.  Do the accounting here, where we free the
pages.

Reported-by: Vlastimil Babka <vbabka@suse.cz>
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 include/linux/pgalloc_tag.h | 24 ++++++++++++++++++++++++
 mm/page_alloc.c             |  5 ++++-
 2 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/include/linux/pgalloc_tag.h b/include/linux/pgalloc_tag.h
index 093edf98c3d7..50d212330bbb 100644
--- a/include/linux/pgalloc_tag.h
+++ b/include/linux/pgalloc_tag.h
@@ -96,12 +96,36 @@ static inline void pgalloc_tag_split(struct page *page, unsigned int nr)
 	page_ext_put(page_ext);
 }
 
+static inline struct alloc_tag *pgalloc_tag_get(struct page *page)
+{
+	struct alloc_tag *tag = NULL;
+
+	if (mem_alloc_profiling_enabled()) {
+		union codetag_ref *ref = get_page_tag_ref(page);
+
+		alloc_tag_sub_check(ref);
+		if (ref && ref->ct)
+			tag = ct_to_alloc_tag(ref->ct);
+		put_page_tag_ref(ref);
+	}
+
+	return tag;
+}
+
+static inline void pgalloc_tag_sub_pages(struct alloc_tag *tag, unsigned int nr)
+{
+	if (mem_alloc_profiling_enabled() && tag)
+		this_cpu_sub(tag->counters->bytes, PAGE_SIZE * nr);
+}
+
 #else /* CONFIG_MEM_ALLOC_PROFILING */
 
 static inline void pgalloc_tag_add(struct page *page, struct task_struct *task,
 				   unsigned int nr) {}
 static inline void pgalloc_tag_sub(struct page *page, unsigned int nr) {}
 static inline void pgalloc_tag_split(struct page *page, unsigned int nr) {}
+static inline struct alloc_tag *pgalloc_tag_get(struct page *page) { return NULL; }
+static inline void pgalloc_tag_sub_pages(struct alloc_tag *tag, unsigned int nr) {}
 
 #endif /* CONFIG_MEM_ALLOC_PROFILING */
 
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index fd1cc5b80a56..00e0ae4cbf2d 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -4700,12 +4700,15 @@ void __free_pages(struct page *page, unsigned int order)
 {
 	/* get PageHead before we drop reference */
 	int head = PageHead(page);
+	struct alloc_tag *tag = pgalloc_tag_get(page);
 
 	if (put_page_testzero(page))
 		free_the_page(page, order);
-	else if (!head)
+	else if (!head) {
+		pgalloc_tag_sub_pages(tag, (1 << order) - 1);
 		while (order-- > 0)
 			free_the_page(page + (1 << order), order);
+	}
 }
 EXPORT_SYMBOL(__free_pages);
 
-- 
2.44.0.291.gc1ea87d7ee-goog


