Return-Path: <linux-doc+bounces-32898-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C47D29F39D2
	for <lists+linux-doc@lfdr.de>; Mon, 16 Dec 2024 20:28:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4819C16D091
	for <lists+linux-doc@lfdr.de>; Mon, 16 Dec 2024 19:28:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D3E020DD43;
	Mon, 16 Dec 2024 19:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lb8b9bsR"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8652D20D508
	for <linux-doc@vger.kernel.org>; Mon, 16 Dec 2024 19:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734377096; cv=none; b=lMjBTgSU1XZbGW9LQTyJCvMeAi9VzwOVFxP79iYWLegsgLQVW1GW9LKTBFhxdHtMYJS1tUEdhTQW9HO37E9WbvnBIEWp6mZYziJ1aua2yWaXWxxjka3LKz7EaT8DxVIjcoCfbh3t9pRi9EsISFE69rL6C0TjO0lIFDS03URpjMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734377096; c=relaxed/simple;
	bh=YIeTsEP14iiWPIza2sclDillMZs5APtjXO1N31t+pkg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CQdVErf4N3uOBSaDysCUvBJjzyxWe7629sLkXiBG+4JocHDTlKRO7zSEINCIZbTMpiDO5O8o/CQimX9srPnT8Kb6LJxXPI1ySRPo0JqbjEPnaD4h8irXcliFQemNvgBOCxMrOH25J4+zmcXiRCEDfl7Ey9+hQOYLiQp+SiQbJZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lb8b9bsR; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-72907f58023so4605104b3a.3
        for <linux-doc@vger.kernel.org>; Mon, 16 Dec 2024 11:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734377094; x=1734981894; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kODX23DYVFRUazWZEBIanW7JFjEXStT07MxX5tftr1k=;
        b=lb8b9bsRMRTI5evgj/WcqIhZYXRJheqZxxpIwISNDf3hiDHzJ2x5XVEx7E8FIwLPal
         nLj/9B+nZx7IR6bEhArh9Hn1k1Un9eUH+7lANf+olQN2fDzp+cWYgzOGuJSz1oInwmR/
         fcxA3NCXdfkW0ikth6tPMAMMQyWAXIu23aLYFkqW30dnQ8R3fuyVqJ5oy00EEv2P+0+Q
         D9yZu0yqxHKDi/WeNs/xCyhvmYKZwloxqdyAsbTfi7iGVh2qtAMCQ9xrm0HimGXNxasG
         ZCwsKBYH7T0MG13DZK6gXsLS6fbwgKCXutRYC4MtsvMJ8FFkP4aUFwGffx2zU3V45TQg
         I2Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734377094; x=1734981894;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kODX23DYVFRUazWZEBIanW7JFjEXStT07MxX5tftr1k=;
        b=drCsbkPawowsH3yzt67vh5vw8o8xEVDO0wNMbOHBdUQwJNX+VsrqLGmyaQEyWyQWcV
         59x1zvI4NnrpHFZhKNX8IbyGLo+G4MvdeYKfeF8DuFAN5ljVrIpfE4XTIEbfFJOmeGtP
         0vrSXuxb1nWdekQTl4qZBtqfTJA7+vuoOuT232UFl8f4OlF2b3cLS9BWXr++i+3o19z2
         xwgZMENs+bpXK2VzkZ9S7S8p03nCIfcR3V6co7KzbUZRzCxzVkTzCH3AXu834PzI+mdb
         f0X70OXhm17YRZ/rmG0EkIqAGOBHRJK1L/SkFfbIkzKjGDlCaVw0qXNU7mus0SrxUwcE
         +eBA==
X-Forwarded-Encrypted: i=1; AJvYcCXw4aMo9de8pX/l32ML2Mp0wbxgW5jkGqqE+hKzla8+FY2RHUBB4Wzi+tj6fJV6rYJ+/sDNo6x4qF4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8ojb/VDuhnJJAhauiWXOioTAKMPqn527hJ9dJDKnAggw24y6c
	3WGUFv6gntv/2kmln5Ejcl2BkNqk9pb96hGzbIy53qCulWv5h2I3GeGhuAq/Vpb7EHLJ5Bg1cLk
	+Gg==
X-Google-Smtp-Source: AGHT+IFs6nvWjzM1OoknSdPIN0ghPnyqI6YPL5avZzhKMYnwXQrh2jvp6FsUbYnz6o+KIo68RndWt2pA8Qg=
X-Received: from pfjg1.prod.google.com ([2002:a05:6a00:b81:b0:725:8ee5:e458])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2995:b0:725:eacf:cfda
 with SMTP id d2e1a72fcca58-7290c25ae78mr18948341b3a.17.1734377093879; Mon, 16
 Dec 2024 11:24:53 -0800 (PST)
Date: Mon, 16 Dec 2024 11:24:18 -0800
In-Reply-To: <20241216192419.2970941-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241216192419.2970941-1-surenb@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241216192419.2970941-16-surenb@google.com>
Subject: [PATCH v6 15/16] mm: make vma cache SLAB_TYPESAFE_BY_RCU
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: peterz@infradead.org, willy@infradead.org, liam.howlett@oracle.com, 
	lorenzo.stoakes@oracle.com, mhocko@suse.com, vbabka@suse.cz, 
	hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com, 
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com, 
	oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org, 
	dhowells@redhat.com, hdanton@sina.com, hughd@google.com, 
	lokeshgidra@google.com, minchan@google.com, jannh@google.com, 
	shakeel.butt@linux.dev, souravpanda@google.com, pasha.tatashin@soleen.com, 
	klarasmodin@gmail.com, corbet@lwn.net, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	surenb@google.com
Content-Type: text/plain; charset="UTF-8"

To enable SLAB_TYPESAFE_BY_RCU for vma cache we need to ensure that
object reuse before RCU grace period is over will be detected by
lock_vma_under_rcu(). Current checks are sufficient as long as vma
is detached before it is freed. Implement this guarantee by calling
vma_ensure_detached() before vma is freed and make vm_area_cachep
SLAB_TYPESAFE_BY_RCU. This will facilitate vm_area_struct reuse and
will minimize the number of call_rcu() calls.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 include/linux/mm.h               |  2 --
 include/linux/mm_types.h         | 10 +++++++---
 include/linux/slab.h             |  6 ------
 kernel/fork.c                    | 34 ++++++++++----------------------
 mm/mmap.c                        |  8 +++++++-
 mm/vma.c                         | 15 +++-----------
 mm/vma.h                         |  2 +-
 tools/testing/vma/vma_internal.h |  7 +------
 8 files changed, 29 insertions(+), 55 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index bfd01ae07660..da773302af70 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -258,8 +258,6 @@ void setup_initial_init_mm(void *start_code, void *end_code,
 struct vm_area_struct *vm_area_alloc(struct mm_struct *);
 struct vm_area_struct *vm_area_dup(struct vm_area_struct *);
 void vm_area_free(struct vm_area_struct *);
-/* Use only if VMA has no other users */
-void __vm_area_free(struct vm_area_struct *vma);
 
 #ifndef CONFIG_MMU
 extern struct rb_root nommu_region_tree;
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 803f718c007c..a720f7383dd8 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -544,6 +544,12 @@ static inline void *folio_get_private(struct folio *folio)
 
 typedef unsigned long vm_flags_t;
 
+/*
+ * freeptr_t represents a SLUB freelist pointer, which might be encoded
+ * and not dereferenceable if CONFIG_SLAB_FREELIST_HARDENED is enabled.
+ */
+typedef struct { unsigned long v; } freeptr_t;
+
 /*
  * A region containing a mapping of a non-memory backed file under NOMMU
  * conditions.  These are held in a global tree and are pinned by the VMAs that
@@ -658,9 +664,7 @@ struct vm_area_struct {
 			unsigned long vm_start;
 			unsigned long vm_end;
 		};
-#ifdef CONFIG_PER_VMA_LOCK
-		struct rcu_head vm_rcu;	/* Used for deferred freeing. */
-#endif
+		freeptr_t vm_freeptr; /* Pointer used by SLAB_TYPESAFE_BY_RCU */
 	};
 
 	/*
diff --git a/include/linux/slab.h b/include/linux/slab.h
index 10a971c2bde3..681b685b6c4e 100644
--- a/include/linux/slab.h
+++ b/include/linux/slab.h
@@ -234,12 +234,6 @@ enum _slab_flag_bits {
 #define SLAB_NO_OBJ_EXT		__SLAB_FLAG_UNUSED
 #endif
 
-/*
- * freeptr_t represents a SLUB freelist pointer, which might be encoded
- * and not dereferenceable if CONFIG_SLAB_FREELIST_HARDENED is enabled.
- */
-typedef struct { unsigned long v; } freeptr_t;
-
 /*
  * ZERO_SIZE_PTR will be returned for zero sized kmalloc requests.
  *
diff --git a/kernel/fork.c b/kernel/fork.c
index f1ddfc7b3b48..7affb9245f64 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -471,36 +471,16 @@ struct vm_area_struct *vm_area_dup(struct vm_area_struct *orig)
 	return new;
 }
 
-void __vm_area_free(struct vm_area_struct *vma)
+void vm_area_free(struct vm_area_struct *vma)
 {
 #ifdef CONFIG_PER_VMA_LOCK
-	/* The vma should be detached while being destroyed. */
-	VM_BUG_ON_VMA(!is_vma_detached(vma), vma);
+	vma_ensure_detached(vma);
 #endif
 	vma_numab_state_free(vma);
 	free_anon_vma_name(vma);
 	kmem_cache_free(vm_area_cachep, vma);
 }
 
-#ifdef CONFIG_PER_VMA_LOCK
-static void vm_area_free_rcu_cb(struct rcu_head *head)
-{
-	struct vm_area_struct *vma = container_of(head, struct vm_area_struct,
-						  vm_rcu);
-
-	__vm_area_free(vma);
-}
-#endif
-
-void vm_area_free(struct vm_area_struct *vma)
-{
-#ifdef CONFIG_PER_VMA_LOCK
-	call_rcu(&vma->vm_rcu, vm_area_free_rcu_cb);
-#else
-	__vm_area_free(vma);
-#endif
-}
-
 static void account_kernel_stack(struct task_struct *tsk, int account)
 {
 	if (IS_ENABLED(CONFIG_VMAP_STACK)) {
@@ -3147,6 +3127,11 @@ void __init mm_cache_init(void)
 
 void __init proc_caches_init(void)
 {
+	struct kmem_cache_args args = {
+		.use_freeptr_offset = true,
+		.freeptr_offset = offsetof(struct vm_area_struct, vm_freeptr),
+	};
+
 	sighand_cachep = kmem_cache_create("sighand_cache",
 			sizeof(struct sighand_struct), 0,
 			SLAB_HWCACHE_ALIGN|SLAB_PANIC|SLAB_TYPESAFE_BY_RCU|
@@ -3163,8 +3148,9 @@ void __init proc_caches_init(void)
 			sizeof(struct fs_struct), 0,
 			SLAB_HWCACHE_ALIGN|SLAB_PANIC|SLAB_ACCOUNT,
 			NULL);
-	vm_area_cachep = KMEM_CACHE(vm_area_struct,
-			SLAB_HWCACHE_ALIGN|SLAB_NO_MERGE|SLAB_PANIC|
+	vm_area_cachep = kmem_cache_create("vm_area_struct",
+			sizeof(struct vm_area_struct), &args,
+			SLAB_HWCACHE_ALIGN|SLAB_PANIC|SLAB_TYPESAFE_BY_RCU|
 			SLAB_ACCOUNT);
 	mmap_init();
 	nsproxy_cache_init();
diff --git a/mm/mmap.c b/mm/mmap.c
index df9154b15ef9..c848f6d645e9 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -1284,7 +1284,13 @@ void exit_mmap(struct mm_struct *mm)
 	do {
 		if (vma->vm_flags & VM_ACCOUNT)
 			nr_accounted += vma_pages(vma);
-		remove_vma(vma, /* unreachable = */ true);
+#ifdef CONFIG_PER_VMA_LOCK
+		if (!is_vma_detached(vma)) {
+			vma_start_write(vma);
+			vma_mark_detached(vma);
+		}
+#endif
+		remove_vma(vma);
 		count++;
 		cond_resched();
 		vma = vma_next(&vmi);
diff --git a/mm/vma.c b/mm/vma.c
index 0436a7d21e01..1b46b92b2d4d 100644
--- a/mm/vma.c
+++ b/mm/vma.c
@@ -406,23 +406,14 @@ static bool can_vma_merge_right(struct vma_merge_struct *vmg,
 /*
  * Close a vm structure and free it.
  */
-void remove_vma(struct vm_area_struct *vma, bool unreachable)
+void remove_vma(struct vm_area_struct *vma)
 {
 	might_sleep();
 	vma_close(vma);
 	if (vma->vm_file)
 		fput(vma->vm_file);
 	mpol_put(vma_policy(vma));
-	if (unreachable) {
-#ifdef CONFIG_PER_VMA_LOCK
-		if (!is_vma_detached(vma)) {
-			vma_start_write(vma);
-			vma_mark_detached(vma);
-		}
-#endif
-		__vm_area_free(vma);
-	} else
-		vm_area_free(vma);
+	vm_area_free(vma);
 }
 
 /*
@@ -1206,7 +1197,7 @@ static void vms_complete_munmap_vmas(struct vma_munmap_struct *vms,
 	/* Remove and clean up vmas */
 	mas_set(mas_detach, 0);
 	mas_for_each(mas_detach, vma, ULONG_MAX)
-		remove_vma(vma, /* unreachable = */ false);
+		remove_vma(vma);
 
 	vm_unacct_memory(vms->nr_accounted);
 	validate_mm(mm);
diff --git a/mm/vma.h b/mm/vma.h
index 24636a2b0acf..3e6c14a748c2 100644
--- a/mm/vma.h
+++ b/mm/vma.h
@@ -170,7 +170,7 @@ int do_vmi_munmap(struct vma_iterator *vmi, struct mm_struct *mm,
 		  unsigned long start, size_t len, struct list_head *uf,
 		  bool unlock);
 
-void remove_vma(struct vm_area_struct *vma, bool unreachable);
+void remove_vma(struct vm_area_struct *vma);
 
 void unmap_region(struct ma_state *mas, struct vm_area_struct *vma,
 		struct vm_area_struct *prev, struct vm_area_struct *next);
diff --git a/tools/testing/vma/vma_internal.h b/tools/testing/vma/vma_internal.h
index ac0a59906fea..3342cad87ece 100644
--- a/tools/testing/vma/vma_internal.h
+++ b/tools/testing/vma/vma_internal.h
@@ -700,14 +700,9 @@ static inline void mpol_put(struct mempolicy *)
 {
 }
 
-static inline void __vm_area_free(struct vm_area_struct *vma)
-{
-	free(vma);
-}
-
 static inline void vm_area_free(struct vm_area_struct *vma)
 {
-	__vm_area_free(vma);
+	free(vma);
 }
 
 static inline void lru_add_drain(void)
-- 
2.47.1.613.gc27f4b7a9f-goog


