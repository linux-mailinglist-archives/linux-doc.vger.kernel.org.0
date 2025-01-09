Return-Path: <linux-doc+bounces-34468-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23704A06B1D
	for <lists+linux-doc@lfdr.de>; Thu,  9 Jan 2025 03:33:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C26B43A78D8
	for <lists+linux-doc@lfdr.de>; Thu,  9 Jan 2025 02:33:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 654BB192D7E;
	Thu,  9 Jan 2025 02:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qetqbmdV"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F04D191F7A
	for <linux-doc@vger.kernel.org>; Thu,  9 Jan 2025 02:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736389863; cv=none; b=qMmQwfuSf+ryovnV64gReaMfKgy6VTrFtnAF8C3n1QMHcmb2gj7UJeD63vz+WbKrfUkisfWdoav6dLLgcUWV/5CW16pIixTzQHEXTwPbOuKzqNDkcxj6MH5Ui4kOstzmoGet+T36If87ZifIVR19/g6CjoX59yPAnKP1F2/KrPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736389863; c=relaxed/simple;
	bh=SY7iRzQYJiHBMNEZVoHlBESwQFa6PVAoTFrxpenkE5w=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=URl6q6Xe+FLF2r3uJWVAgiOHaRC6NeOrrWrHi0243iJUzNhP8pgP6STIZoXCTmXf4vwl6AmezT6BwuFkRpCHQ5dyIAXZWFXXeSjJxKTMjie0gi3MTKqu6XMffDawucW0vqCxWXm7V5RYgrse4TNIfz1MWi/QeUzH5ir7fFOuV14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qetqbmdV; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2ef9da03117so1183862a91.1
        for <linux-doc@vger.kernel.org>; Wed, 08 Jan 2025 18:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736389861; x=1736994661; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0mp5dFwezEdO/jOng82s8ZxmFNIgL5tGd8iP4GBRZps=;
        b=qetqbmdVP5elQFBK7edEZrUSzlU2llvEdjfilzZaPaEDNDrgqDiVP9CUV5pDy2txnE
         DA3PobND3kJ/3G5+NyRmzUOQ1U5NJ4vtHZPe5C+9zHcXI5MAAAIGAlV/1I9k7uZoG+b9
         aeE+19fGN7qM2GPSlnk7LHhQyJGQ4qmm+w6WpcRSCta5KJd3WFusjQ80lXhgtLMd/wr7
         yjBb53cV6RtsfczfcmY5zPQgFpYV4caBZ283tmRZ2dM1sRD+myOS9npINEQJ8xwU8ldZ
         TawOCoZXaT1vyZaFEMm5KGc7xJbqsrkiqgRdlmhGehov/AqZx1n+dHVcit5As/fCeLoc
         uEJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736389861; x=1736994661;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0mp5dFwezEdO/jOng82s8ZxmFNIgL5tGd8iP4GBRZps=;
        b=CbBA3Bcl6k8M18OiRm5ZcOIygyUnjLVQ0bR8lBXCaFQZOSU1u/8ML8jIU1J/9xy9mL
         HkiqhLVi2U7ol29Kp26UkANUfaoA9c3+IdjJKEcTxzzMvm1zyyXW9xvkc+0pGi0jmE11
         SnX7WHC0dP1prHLUHTCWQL/Y6L2kURenA6AAhNM366gu4+fxOKPyvDJdNGZE9BvwSMJ1
         Ug26cq0LC3JWIiPPLEJGANGlKx2HpK6cBYvZzPTSGzMj9Rk+xbyGAk/1i9Ze51HG/1b2
         rKIF7EWyh0OxlnYY4NJnpOen3qi7KtY83h6W7K/bPnLCbvu/6A1639DqSntZlIT5gNUA
         PMsw==
X-Forwarded-Encrypted: i=1; AJvYcCXocQa0nEa6Sv+n5h52i+17isea2PzVU2k1qHOCZ8wnonZYJNE3bX1siscDYshVieP4elIhq9BYjSM=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywn6kAKHeJSgcbUmVslwvEBFIsxuhTB0lS5ieYDIJ7bEYFa/eoI
	RQIeBGGFfNOBdR8q/zpfyQY9JxqpcApB59Zgy4n/PnySk2cOMBc6/7KP5c2lFLOEZo3Smajx1Zo
	M2A==
X-Google-Smtp-Source: AGHT+IEZRV1/vQ9FjpK7xNQnInX31Kc2+w8+X4QP91iZvzjqZarVksUTQcCfVUNTQlhwPAY/KfocNKNXlgE=
X-Received: from pjbsz8.prod.google.com ([2002:a17:90b:2d48:b0:2e9:38ea:ca0f])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2747:b0:2f2:a664:df1a
 with SMTP id 98e67ed59e1d1-2f548e9c9bcmr7618672a91.2.1736389860840; Wed, 08
 Jan 2025 18:31:00 -0800 (PST)
Date: Wed,  8 Jan 2025 18:30:24 -0800
In-Reply-To: <20250109023025.2242447-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250109023025.2242447-1-surenb@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250109023025.2242447-16-surenb@google.com>
Subject: [PATCH v8 15/16] mm: make vma cache SLAB_TYPESAFE_BY_RCU
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
	klarasmodin@gmail.com, richard.weiyang@gmail.com, corbet@lwn.net, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com, surenb@google.com
Content-Type: text/plain; charset="UTF-8"

To enable SLAB_TYPESAFE_BY_RCU for vma cache we need to ensure that
object reuse before RCU grace period is over will be detected by
lock_vma_under_rcu().
Current checks are sufficient as long as vma is detached before it is
freed. The only place this is not currently happening is in exit_mmap().
Add the missing vma_mark_detached() in exit_mmap().
Another issue which might trick lock_vma_under_rcu() during vma reuse
is vm_area_dup(), which copies the entire content of the vma into a new
one, overriding new vma's vm_refcnt and temporarily making it appear as
attached. This might trick a racing lock_vma_under_rcu() to operate on
a reused vma if it found the vma before it got reused. To prevent this
situation, we should ensure that vm_refcnt stays at detached state (0)
when it is copied and advances to attached state only after it is added
into the vma tree. Introduce vma_copy() which preserves new vma's
vm_refcnt and use it in vm_area_dup(). Since all vmas are in detached
state with no current readers when they are freed, lock_vma_under_rcu()
will not be able to take vm_refcnt after vma got detached even if vma
is reused.
Finally, make vm_area_cachep SLAB_TYPESAFE_BY_RCU. This will facilitate
vm_area_struct reuse and will minimize the number of call_rcu() calls.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 include/linux/mm.h               |  2 -
 include/linux/mm_types.h         | 10 +++--
 include/linux/slab.h             |  6 ---
 kernel/fork.c                    | 72 ++++++++++++++++++++------------
 mm/mmap.c                        |  3 +-
 mm/vma.c                         | 11 ++---
 mm/vma.h                         |  2 +-
 tools/testing/vma/vma_internal.h |  7 +---
 8 files changed, 59 insertions(+), 54 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 1d6b1563b956..a674558e4c05 100644
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
index 2d83d79d1899..93bfcd0c1fde 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -582,6 +582,12 @@ static inline void *folio_get_private(struct folio *folio)
 
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
@@ -695,9 +701,7 @@ struct vm_area_struct {
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
index 9d9275783cf8..770b973a099c 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -449,6 +449,41 @@ struct vm_area_struct *vm_area_alloc(struct mm_struct *mm)
 	return vma;
 }
 
+static void vma_copy(const struct vm_area_struct *src, struct vm_area_struct *dest)
+{
+	dest->vm_mm = src->vm_mm;
+	dest->vm_ops = src->vm_ops;
+	dest->vm_start = src->vm_start;
+	dest->vm_end = src->vm_end;
+	dest->anon_vma = src->anon_vma;
+	dest->vm_pgoff = src->vm_pgoff;
+	dest->vm_file = src->vm_file;
+	dest->vm_private_data = src->vm_private_data;
+	vm_flags_init(dest, src->vm_flags);
+	memcpy(&dest->vm_page_prot, &src->vm_page_prot,
+	       sizeof(dest->vm_page_prot));
+	/*
+	 * src->shared.rb may be modified concurrently, but the clone
+	 * will be reinitialized.
+	 */
+	data_race(memcpy(&dest->shared, &src->shared, sizeof(dest->shared)));
+	memcpy(&dest->vm_userfaultfd_ctx, &src->vm_userfaultfd_ctx,
+	       sizeof(dest->vm_userfaultfd_ctx));
+#ifdef CONFIG_ANON_VMA_NAME
+	dest->anon_name = src->anon_name;
+#endif
+#ifdef CONFIG_SWAP
+	memcpy(&dest->swap_readahead_info, &src->swap_readahead_info,
+	       sizeof(dest->swap_readahead_info));
+#endif
+#ifndef CONFIG_MMU
+	dest->vm_region = src->vm_region;
+#endif
+#ifdef CONFIG_NUMA
+	dest->vm_policy = src->vm_policy;
+#endif
+}
+
 struct vm_area_struct *vm_area_dup(struct vm_area_struct *orig)
 {
 	struct vm_area_struct *new = kmem_cache_alloc(vm_area_cachep, GFP_KERNEL);
@@ -458,11 +493,7 @@ struct vm_area_struct *vm_area_dup(struct vm_area_struct *orig)
 
 	ASSERT_EXCLUSIVE_WRITER(orig->vm_flags);
 	ASSERT_EXCLUSIVE_WRITER(orig->vm_file);
-	/*
-	 * orig->shared.rb may be modified concurrently, but the clone
-	 * will be reinitialized.
-	 */
-	data_race(memcpy(new, orig, sizeof(*new)));
+	vma_copy(orig, new);
 	vma_lock_init(new, true);
 	INIT_LIST_HEAD(&new->anon_vma_chain);
 	vma_numab_state_init(new);
@@ -471,7 +502,7 @@ struct vm_area_struct *vm_area_dup(struct vm_area_struct *orig)
 	return new;
 }
 
-void __vm_area_free(struct vm_area_struct *vma)
+void vm_area_free(struct vm_area_struct *vma)
 {
 	/* The vma should be detached while being destroyed. */
 	vma_assert_detached(vma);
@@ -480,25 +511,6 @@ void __vm_area_free(struct vm_area_struct *vma)
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
@@ -3144,6 +3156,11 @@ void __init mm_cache_init(void)
 
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
@@ -3160,8 +3177,9 @@ void __init proc_caches_init(void)
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
index cda01071c7b1..7aa36216ecc0 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -1305,7 +1305,8 @@ void exit_mmap(struct mm_struct *mm)
 	do {
 		if (vma->vm_flags & VM_ACCOUNT)
 			nr_accounted += vma_pages(vma);
-		remove_vma(vma, /* unreachable = */ true);
+		vma_mark_detached(vma);
+		remove_vma(vma);
 		count++;
 		cond_resched();
 		vma = vma_next(&vmi);
diff --git a/mm/vma.c b/mm/vma.c
index 93ff42ac2002..0a5158d611e3 100644
--- a/mm/vma.c
+++ b/mm/vma.c
@@ -406,19 +406,14 @@ static bool can_vma_merge_right(struct vma_merge_struct *vmg,
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
-		vma_mark_detached(vma);
-		__vm_area_free(vma);
-	} else {
-		vm_area_free(vma);
-	}
+	vm_area_free(vma);
 }
 
 /*
@@ -1201,7 +1196,7 @@ static void vms_complete_munmap_vmas(struct vma_munmap_struct *vms,
 	/* Remove and clean up vmas */
 	mas_set(mas_detach, 0);
 	mas_for_each(mas_detach, vma, ULONG_MAX)
-		remove_vma(vma, /* unreachable = */ false);
+		remove_vma(vma);
 
 	vm_unacct_memory(vms->nr_accounted);
 	validate_mm(mm);
diff --git a/mm/vma.h b/mm/vma.h
index 63dd38d5230c..f51005b95b39 100644
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
index 2ce032943861..49a85ce0d45a 100644
--- a/tools/testing/vma/vma_internal.h
+++ b/tools/testing/vma/vma_internal.h
@@ -697,14 +697,9 @@ static inline void mpol_put(struct mempolicy *)
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


