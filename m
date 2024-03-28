Return-Path: <linux-doc+bounces-12485-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0E9885E7C
	for <lists+linux-doc@lfdr.de>; Thu, 21 Mar 2024 17:49:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8F90CB21777
	for <lists+linux-doc@lfdr.de>; Thu, 21 Mar 2024 16:49:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D32F71420D2;
	Thu, 21 Mar 2024 16:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pug3BjJ+"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987E413DBBF
	for <linux-doc@vger.kernel.org>; Thu, 21 Mar 2024 16:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711039094; cv=none; b=iEC+W++6v+WChOHUyDhmqo8ed3aEnXDoup4xmHUhUkTJIcBmglbwQfOUrIEi/ew9xX/b2JdTH+zbUQExy28zxQG5+q1g72XlBdEFPLL8EyRZNVmudw3b4LecYI9mwnfeiTT8qw2Wr9y1ETod4ADcuZDnxSUG++gqPRxSDDAMIKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711039094; c=relaxed/simple;
	bh=5ajV2iI74MCcJvdY3e41StjfOvcO/AanK2/O3Zac0KU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZQbxSGzEiQEKZfivQC6GYktCukRLmMSuyT8+JtdX8t0rxspfx4F73ph+xouhMgd3XKgGdx5GEK9kmY4GjxYwUuumTvhV/nVBfOx4nzXu3NBYywBeNK/uvqvc3tDggKA1lEKubRuVEb0uWob4zVC/Hn0qyjCMbEtcDKMiVlvdicY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pug3BjJ+; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-dc64b659a9cso1797725276.3
        for <linux-doc@vger.kernel.org>; Thu, 21 Mar 2024 09:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711039091; x=1711643891; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=krRMCxbEdPvR0gpNvdmt+1GzNi+HHBvoijzlHbN4rmY=;
        b=pug3BjJ+V1Rng7W/ozJY8wGrvo+b2YITJ8EnhZ/boP7Sqog7MupqCVHMt7XQ4YKQJy
         CEr4Bq+h8ob1sduSeQnVlrS8nng5lqLBbeD0NKfFVjk2AJl4AOYRFusRaqwFxMClSxjV
         SNUS7QjNstnv5CUr+ku2CHIE+DiMK2pqofwi5AbV0IFQdK8Q8bS4Q6j4pEyMbaHrm9y7
         nLb6pd6qYALuwqEM1aHRLdDdw0yoMzTtohp95md0NrYc29toJQqmoPSVtteaHdnikrf1
         JwWbYdDsOaSkx9YQrRNC45g3j6zNHOvZQ8LQpZ9YoIG4zsB/Wjw3KMqeIgiRz09Fp99h
         2gdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711039091; x=1711643891;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=krRMCxbEdPvR0gpNvdmt+1GzNi+HHBvoijzlHbN4rmY=;
        b=k8lQvDrOhcaXX24CdKPQkhNV67ziQplUxzaACrc+91jKfZISo+oAs8Ka/JRJEatoG8
         jjmLZViEvTzf16U91PxE+v8eJrkYZisC7SoPPq1dECrpCdvMqUTatwMxWcEhZu0gswDY
         MKAq6BzME3OS8FRu1rSZoFhfIO/lHIzcgaMhKV8eLK4KJP+hgAG79iY4M6mzXpKhU533
         OnQ1Mm8VgXiycAhmwRZ5pj5M3Tx7w/+q4jJC1ZZsyCcH4kBSLj3knUGJmLxmUBE3GxRt
         qiVlWDNDfkTk+ouLPhQgVfGjXYgd0ODi0dLIs9/Ezgvq8ASsnF4R+436aTxLTZdpHf2e
         WIJA==
X-Forwarded-Encrypted: i=1; AJvYcCXieZXx3lZ3B+LzFdXCQR5Od+38i3F0smvlvRFN3oWHY2qHk7UTmpw8jaIuvxFZySekng8NO4knpXO09qyhaa3N46NMdDV/CM2L
X-Gm-Message-State: AOJu0Yy8Dl1EHOGQwGhc7L8q3bw1umkd4ujalbwSbJs8c7OQgtmV8/ca
	tDrCF4bQtuc9gC3nA7Cq4GNd7Hykbx4GOfCg+kl5tZZyVd2tuKEvuMQJCO3KwaFr1UEUbbp1iJ5
	aTg==
X-Google-Smtp-Source: AGHT+IGHRX7538S2HF/3oOa1sNnpVXnzB+i3nUjYB81n0AdHPc2tfmh7wCvtVRvHYQ8dsZZZ2KX9wsSWPB4=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:201:a489:6433:be5d:e639])
 (user=surenb job=sendgmr) by 2002:a05:6902:2506:b0:dd1:390a:51e8 with SMTP id
 dt6-20020a056902250600b00dd1390a51e8mr2395872ybb.10.1711039090742; Thu, 21
 Mar 2024 09:38:10 -0700 (PDT)
Date: Thu, 21 Mar 2024 09:36:50 -0700
In-Reply-To: <20240321163705.3067592-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240321163705.3067592-1-surenb@google.com>
X-Mailer: git-send-email 2.44.0.291.gc1ea87d7ee-goog
Message-ID: <20240321163705.3067592-29-surenb@google.com>
Subject: [PATCH v6 28/37] mm: percpu: Add codetag reference into pcpuobj_ext
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

From: Kent Overstreet <kent.overstreet@linux.dev>

To store codetag for every per-cpu allocation, a codetag reference is
embedded into pcpuobj_ext when CONFIG_MEM_ALLOC_PROFILING=y. Hooks to
use the newly introduced codetag are added.

Signed-off-by: Kent Overstreet <kent.overstreet@linux.dev>
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 mm/percpu-internal.h | 11 +++++++++--
 mm/percpu.c          | 26 ++++++++++++++++++++++++++
 2 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/mm/percpu-internal.h b/mm/percpu-internal.h
index e62d582f4bf3..7e42f0ca3b7b 100644
--- a/mm/percpu-internal.h
+++ b/mm/percpu-internal.h
@@ -36,9 +36,12 @@ struct pcpuobj_ext {
 #ifdef CONFIG_MEMCG_KMEM
 	struct obj_cgroup	*cgroup;
 #endif
+#ifdef CONFIG_MEM_ALLOC_PROFILING
+	union codetag_ref	tag;
+#endif
 };
 
-#ifdef CONFIG_MEMCG_KMEM
+#if defined(CONFIG_MEMCG_KMEM) || defined(CONFIG_MEM_ALLOC_PROFILING)
 #define NEED_PCPUOBJ_EXT
 #endif
 
@@ -86,7 +89,11 @@ struct pcpu_chunk {
 
 static inline bool need_pcpuobj_ext(void)
 {
-	return !mem_cgroup_kmem_disabled();
+	if (IS_ENABLED(CONFIG_MEM_ALLOC_PROFILING))
+		return true;
+	if (!mem_cgroup_kmem_disabled())
+		return true;
+	return false;
 }
 
 extern spinlock_t pcpu_lock;
diff --git a/mm/percpu.c b/mm/percpu.c
index 2e5edaad9cc3..90e9e4004ac9 100644
--- a/mm/percpu.c
+++ b/mm/percpu.c
@@ -1699,6 +1699,32 @@ static void pcpu_memcg_free_hook(struct pcpu_chunk *chunk, int off, size_t size)
 }
 #endif /* CONFIG_MEMCG_KMEM */
 
+#ifdef CONFIG_MEM_ALLOC_PROFILING
+static void pcpu_alloc_tag_alloc_hook(struct pcpu_chunk *chunk, int off,
+				      size_t size)
+{
+	if (mem_alloc_profiling_enabled() && likely(chunk->obj_exts)) {
+		alloc_tag_add(&chunk->obj_exts[off >> PCPU_MIN_ALLOC_SHIFT].tag,
+			      current->alloc_tag, size);
+	}
+}
+
+static void pcpu_alloc_tag_free_hook(struct pcpu_chunk *chunk, int off, size_t size)
+{
+	if (mem_alloc_profiling_enabled() && likely(chunk->obj_exts))
+		alloc_tag_sub(&chunk->obj_exts[off >> PCPU_MIN_ALLOC_SHIFT].tag, size);
+}
+#else
+static void pcpu_alloc_tag_alloc_hook(struct pcpu_chunk *chunk, int off,
+				      size_t size)
+{
+}
+
+static void pcpu_alloc_tag_free_hook(struct pcpu_chunk *chunk, int off, size_t size)
+{
+}
+#endif
+
 /**
  * pcpu_alloc - the percpu allocator
  * @size: size of area to allocate in bytes
-- 
2.44.0.291.gc1ea87d7ee-goog


