Return-Path: <linux-doc+bounces-33663-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BDCBD9FCC47
	for <lists+linux-doc@lfdr.de>; Thu, 26 Dec 2024 18:10:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 877B6188130E
	for <lists+linux-doc@lfdr.de>; Thu, 26 Dec 2024 17:10:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02AA41DA0E3;
	Thu, 26 Dec 2024 17:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cpBdz4iR"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26BC1D9595
	for <linux-doc@vger.kernel.org>; Thu, 26 Dec 2024 17:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735232860; cv=none; b=RGt48drWr1Mi3jdoqUbDL5tgGGSzRkWgguJmXYEmiZsEbPML4nu7rDiTUrXlfyTn1thLXarY21yKusYp7XsXL73cJbZV+cKZnaoPeWN7gbmwv1glWl9IPpCZXRjK0J8Gd2htEGSUCZbOa0iP01d7V565F6814wqeAo3YxPOwJV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735232860; c=relaxed/simple;
	bh=5w+63U9MfQ/w0WDtsRcDNSm/jts5O33pMe9QLmR3m2Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mCUyjPE2uqPOHrznFxz2BPTPbe4MYfotzXzomwOwQjWPJ/xXkW5lM6g0l5rSCSTLWIvpNHopq16nChpz3OEOT9TX30IauA0T61BtlifMiTAwrOzp7e05wPAOjc96z2OiW1SP3jhkZbdjNZt0HmdWUjoHNWkYR1bEr4ESGDEGvZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cpBdz4iR; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2161d185f04so60644845ad.3
        for <linux-doc@vger.kernel.org>; Thu, 26 Dec 2024 09:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1735232858; x=1735837658; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=89s7s8pRCE/F5saH3vOD8dpykpc0sY2Jizt1/i2JaEM=;
        b=cpBdz4iRSYS5YXAiaxX62ElIw+rW467PhJGd8Qz3whfNoHE4cQq9ZOO07wkWPGxqno
         +pRq5cKhG8FDRYR8Zor/MhBxY2Ux0oEwgMxAVLkT0tANA6loh7Db0RISz4BP82q4EV8s
         uvlNJuUNrbFxRaHQdCucIEL7HJWx6UgnDxNMEq3rY8A15Ky8rpl85X+leBwZkYo+kvn9
         hwYu6r3SP68wxv+YHPkJvVycnhi6lXLposn85SIryswxL22LRD/dFhLk/b4Yz/znwqMS
         DLOZZX4OFwA3eUUJUZEZ+bZ+Kj8rXiY6MnFCfVPpKk4C3TVIH3AGEaSxABngHhCgPkNM
         9AZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735232858; x=1735837658;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=89s7s8pRCE/F5saH3vOD8dpykpc0sY2Jizt1/i2JaEM=;
        b=RRT1hSWFXXUuwHIQde06IwknLCZDjGWxczZXhC3AQwKvl6DfJR1gid5GF0HIt/B0lL
         zJhJykUXEZYDObdB3LKZon76cFW7/wbKcguhf12xR3nQn+qFna3z74Q6qCKpq40ENd+a
         wZOu4joHn6xkpHvlqr8xMQNvHxczYqQnhzCU/bq0hpaW3oyjMaGKPqlzNmLj1gnszcm+
         Ir3k/7oSmG9IOYw/sAHtlv2Jjf2/LhXzNFIVwnonMy5Mi1nnGWXtKiGPSdmvVmQJ+Dli
         O77V3QNrQABgSshfkjci5UzdYgBxVOg6NaQXENQeSXhT4F+fP/GbmxQeY5lqRMG24R8G
         otYA==
X-Forwarded-Encrypted: i=1; AJvYcCXN3vMQLRiy7nZXHqlpwp1LEx1jcoLx47DFfEVWVQIE8j2r0QvTPvWBCiNv6Mfe2Tf3fVwGzjT9e6k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXF9j4kKDkpJnHl1tPI4uymiEI5KsFTgB4Qy4ndGh3l4oMON9b
	2JiaOpUFPxLQP39/nHEjs4QjWb42THWFfd3N/DWOr2fQXjdYGwye6gCSuCrY0Xz4hKxtmLGknUO
	msw==
X-Google-Smtp-Source: AGHT+IE7Mk8eNe/JaivV7kGqKUrjWDMa+rKOhzyI+abJe9i8/UdhXPRKG981mQLisrrX+gPM4LihSIFuh4U=
X-Received: from pgbbi9.prod.google.com ([2002:a05:6a02:249:b0:7fd:5835:26d1])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:6a25:b0:1d9:6c9c:75ea
 with SMTP id adf61e73a8af0-1e5e0448930mr37740524637.5.1735232858088; Thu, 26
 Dec 2024 09:07:38 -0800 (PST)
Date: Thu, 26 Dec 2024 09:07:04 -0800
In-Reply-To: <20241226170710.1159679-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241226170710.1159679-1-surenb@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241226170710.1159679-13-surenb@google.com>
Subject: [PATCH v7 12/17] mm: replace vm_lock and detached flag with a
 reference count
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

rw_semaphore is a sizable structure of 40 bytes and consumes
considerable space for each vm_area_struct. However vma_lock has
two important specifics which can be used to replace rw_semaphore
with a simpler structure:
1. Readers never wait. They try to take the vma_lock and fall back to
mmap_lock if that fails.
2. Only one writer at a time will ever try to write-lock a vma_lock
because writers first take mmap_lock in write mode.
Because of these requirements, full rw_semaphore functionality is not
needed and we can replace rw_semaphore and the vma->detached flag with
a refcount (vm_refcnt).
When vma is in detached state, vm_refcnt is 0 and only a call to
vma_mark_attached() can take it out of this state. Note that unlike
before, now we enforce both vma_mark_attached() and vma_mark_detached()
to be done only after vma has been write-locked. vma_mark_attached()
changes vm_refcnt to 1 to indicate that it has been attached to the vma
tree. When a reader takes read lock, it increments vm_refcnt, unless the
top usable bit of vm_refcnt (0x40000000) is set, indicating presence of
a writer. When writer takes write lock, it both increments vm_refcnt and
sets the top usable bit to indicate its presence. If there are readers,
writer will wait using newly introduced mm->vma_writer_wait. Since all
writers take mmap_lock in write mode first, there can be only one writer
at a time. The last reader to release the lock will signal the writer
to wake up.
refcount might overflow if there are many competing readers, in which case
read-locking will fail. Readers are expected to handle such failures.

Suggested-by: Peter Zijlstra <peterz@infradead.org>
Suggested-by: Matthew Wilcox <willy@infradead.org>
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 include/linux/mm.h               | 100 +++++++++++++++++++++----------
 include/linux/mm_types.h         |  22 ++++---
 kernel/fork.c                    |  13 ++--
 mm/init-mm.c                     |   1 +
 mm/memory.c                      |  68 +++++++++++++++++----
 tools/testing/vma/linux/atomic.h |   5 ++
 tools/testing/vma/vma_internal.h |  66 +++++++++++---------
 7 files changed, 185 insertions(+), 90 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index ea4c4228b125..99f4720d7e51 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -32,6 +32,7 @@
 #include <linux/memremap.h>
 #include <linux/slab.h>
 #include <linux/cacheinfo.h>
+#include <linux/rcuwait.h>
 
 struct mempolicy;
 struct anon_vma;
@@ -697,12 +698,34 @@ static inline void vma_numab_state_free(struct vm_area_struct *vma) {}
 #endif /* CONFIG_NUMA_BALANCING */
 
 #ifdef CONFIG_PER_VMA_LOCK
-static inline void vma_lock_init(struct vm_area_struct *vma)
+static inline void vma_lockdep_init(struct vm_area_struct *vma)
 {
-	init_rwsem(&vma->vm_lock.lock);
+#ifdef CONFIG_DEBUG_LOCK_ALLOC
+	static struct lock_class_key lockdep_key;
+
+	lockdep_init_map(&vma->vmlock_dep_map, "vm_lock", &lockdep_key, 0);
+#endif
+}
+
+static inline void vma_init_lock(struct vm_area_struct *vma, bool reset_refcnt)
+{
+	if (reset_refcnt)
+		refcount_set(&vma->vm_refcnt, 0);
 	vma->vm_lock_seq = UINT_MAX;
 }
 
+static inline void vma_refcount_put(struct vm_area_struct *vma)
+{
+	int refcnt;
+
+	if (!__refcount_dec_and_test(&vma->vm_refcnt, &refcnt)) {
+		rwsem_release(&vma->vmlock_dep_map, _RET_IP_);
+
+		if (refcnt & VMA_LOCK_OFFSET)
+			rcuwait_wake_up(&vma->vm_mm->vma_writer_wait);
+	}
+}
+
 /*
  * Try to read-lock a vma. The function is allowed to occasionally yield false
  * locked result to avoid performance overhead, in which case we fall back to
@@ -710,6 +733,8 @@ static inline void vma_lock_init(struct vm_area_struct *vma)
  */
 static inline bool vma_start_read(struct vm_area_struct *vma)
 {
+	int oldcnt;
+
 	/*
 	 * Check before locking. A race might cause false locked result.
 	 * We can use READ_ONCE() for the mm_lock_seq here, and don't need
@@ -720,13 +745,20 @@ static inline bool vma_start_read(struct vm_area_struct *vma)
 	if (READ_ONCE(vma->vm_lock_seq) == READ_ONCE(vma->vm_mm->mm_lock_seq.sequence))
 		return false;
 
-	if (unlikely(down_read_trylock(&vma->vm_lock.lock) == 0))
+
+	rwsem_acquire_read(&vma->vmlock_dep_map, 0, 0, _RET_IP_);
+	/* Limit at VMA_REF_LIMIT to leave one count for a writer */
+	if (unlikely(!__refcount_inc_not_zero_limited(&vma->vm_refcnt, &oldcnt,
+						      VMA_REF_LIMIT))) {
+		rwsem_release(&vma->vmlock_dep_map, _RET_IP_);
 		return false;
+	}
+	lock_acquired(&vma->vmlock_dep_map, _RET_IP_);
 
 	/*
-	 * Overflow might produce false locked result.
+	 * Overflow of vm_lock_seq/mm_lock_seq might produce false locked result.
 	 * False unlocked result is impossible because we modify and check
-	 * vma->vm_lock_seq under vma->vm_lock protection and mm->mm_lock_seq
+	 * vma->vm_lock_seq under vma->vm_refcnt protection and mm->mm_lock_seq
 	 * modification invalidates all existing locks.
 	 *
 	 * We must use ACQUIRE semantics for the mm_lock_seq so that if we are
@@ -734,10 +766,12 @@ static inline bool vma_start_read(struct vm_area_struct *vma)
 	 * after it has been unlocked.
 	 * This pairs with RELEASE semantics in vma_end_write_all().
 	 */
-	if (unlikely(vma->vm_lock_seq == raw_read_seqcount(&vma->vm_mm->mm_lock_seq))) {
-		up_read(&vma->vm_lock.lock);
+	if (unlikely(oldcnt & VMA_LOCK_OFFSET ||
+		     vma->vm_lock_seq == raw_read_seqcount(&vma->vm_mm->mm_lock_seq))) {
+		vma_refcount_put(vma);
 		return false;
 	}
+
 	return true;
 }
 
@@ -749,8 +783,17 @@ static inline bool vma_start_read(struct vm_area_struct *vma)
  */
 static inline bool vma_start_read_locked_nested(struct vm_area_struct *vma, int subclass)
 {
+	int oldcnt;
+
 	mmap_assert_locked(vma->vm_mm);
-	down_read_nested(&vma->vm_lock.lock, subclass);
+	rwsem_acquire_read(&vma->vmlock_dep_map, subclass, 0, _RET_IP_);
+	/* Limit at VMA_REF_LIMIT to leave one count for a writer */
+	if (unlikely(!__refcount_inc_not_zero_limited(&vma->vm_refcnt, &oldcnt,
+						      VMA_REF_LIMIT))) {
+		rwsem_release(&vma->vmlock_dep_map, _RET_IP_);
+		return false;
+	}
+	lock_acquired(&vma->vmlock_dep_map, _RET_IP_);
 	return true;
 }
 
@@ -762,15 +805,13 @@ static inline bool vma_start_read_locked_nested(struct vm_area_struct *vma, int
  */
 static inline bool vma_start_read_locked(struct vm_area_struct *vma)
 {
-	mmap_assert_locked(vma->vm_mm);
-	down_read(&vma->vm_lock.lock);
-	return true;
+	return vma_start_read_locked_nested(vma, 0);
 }
 
 static inline void vma_end_read(struct vm_area_struct *vma)
 {
 	rcu_read_lock(); /* keeps vma alive till the end of up_read */
-	up_read(&vma->vm_lock.lock);
+	vma_refcount_put(vma);
 	rcu_read_unlock();
 }
 
@@ -813,36 +854,33 @@ static inline void vma_assert_write_locked(struct vm_area_struct *vma)
 
 static inline void vma_assert_locked(struct vm_area_struct *vma)
 {
-	if (!rwsem_is_locked(&vma->vm_lock.lock))
+	if (refcount_read(&vma->vm_refcnt) <= 1)
 		vma_assert_write_locked(vma);
 }
 
+/*
+ * WARNING: to avoid racing with vma_mark_attached()/vma_mark_detached(), these
+ * assertions should be made either under mmap_write_lock or when the object
+ * has been isolated under mmap_write_lock, ensuring no competing writers.
+ */
 static inline void vma_assert_attached(struct vm_area_struct *vma)
 {
-	VM_BUG_ON_VMA(vma->detached, vma);
+	VM_BUG_ON_VMA(!refcount_read(&vma->vm_refcnt), vma);
 }
 
 static inline void vma_assert_detached(struct vm_area_struct *vma)
 {
-	VM_BUG_ON_VMA(!vma->detached, vma);
+	VM_BUG_ON_VMA(refcount_read(&vma->vm_refcnt), vma);
 }
 
 static inline void vma_mark_attached(struct vm_area_struct *vma)
 {
-	vma->detached = false;
-}
-
-static inline void vma_mark_detached(struct vm_area_struct *vma)
-{
-	/* When detaching vma should be write-locked */
 	vma_assert_write_locked(vma);
-	vma->detached = true;
+	vma_assert_detached(vma);
+	refcount_set(&vma->vm_refcnt, 1);
 }
 
-static inline bool is_vma_detached(struct vm_area_struct *vma)
-{
-	return vma->detached;
-}
+void vma_mark_detached(struct vm_area_struct *vma);
 
 static inline void release_fault_lock(struct vm_fault *vmf)
 {
@@ -865,7 +903,8 @@ struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
 
 #else /* CONFIG_PER_VMA_LOCK */
 
-static inline void vma_lock_init(struct vm_area_struct *vma) {}
+static inline void vma_lockdep_init(struct vm_area_struct *vma) {}
+static inline void vma_init_lock(struct vm_area_struct *vma, bool reset_refcnt) {}
 static inline bool vma_start_read(struct vm_area_struct *vma)
 		{ return false; }
 static inline void vma_end_read(struct vm_area_struct *vma) {}
@@ -908,12 +947,9 @@ static inline void vma_init(struct vm_area_struct *vma, struct mm_struct *mm)
 	vma->vm_mm = mm;
 	vma->vm_ops = &vma_dummy_vm_ops;
 	INIT_LIST_HEAD(&vma->anon_vma_chain);
-#ifdef CONFIG_PER_VMA_LOCK
-	/* vma is not locked, can't use vma_mark_detached() */
-	vma->detached = true;
-#endif
 	vma_numab_state_init(vma);
-	vma_lock_init(vma);
+	vma_lockdep_init(vma);
+	vma_init_lock(vma, false);
 }
 
 /* Use when VMA is not part of the VMA tree and needs no locking */
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 6573d95f1d1e..b5312421dec6 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -19,6 +19,7 @@
 #include <linux/workqueue.h>
 #include <linux/seqlock.h>
 #include <linux/percpu_counter.h>
+#include <linux/types.h>
 
 #include <asm/mmu.h>
 
@@ -629,9 +630,8 @@ static inline struct anon_vma_name *anon_vma_name_alloc(const char *name)
 }
 #endif
 
-struct vma_lock {
-	struct rw_semaphore lock;
-};
+#define VMA_LOCK_OFFSET	0x40000000
+#define VMA_REF_LIMIT	(VMA_LOCK_OFFSET - 2)
 
 struct vma_numab_state {
 	/*
@@ -709,19 +709,13 @@ struct vm_area_struct {
 	};
 
 #ifdef CONFIG_PER_VMA_LOCK
-	/*
-	 * Flag to indicate areas detached from the mm->mm_mt tree.
-	 * Unstable RCU readers are allowed to read this.
-	 */
-	bool detached;
-
 	/*
 	 * Can only be written (using WRITE_ONCE()) while holding both:
 	 *  - mmap_lock (in write mode)
-	 *  - vm_lock->lock (in write mode)
+	 *  - vm_refcnt bit at VMA_LOCK_OFFSET is set
 	 * Can be read reliably while holding one of:
 	 *  - mmap_lock (in read or write mode)
-	 *  - vm_lock->lock (in read or write mode)
+	 *  - vm_refcnt bit at VMA_LOCK_OFFSET is set or vm_refcnt > 1
 	 * Can be read unreliably (using READ_ONCE()) for pessimistic bailout
 	 * while holding nothing (except RCU to keep the VMA struct allocated).
 	 *
@@ -784,7 +778,10 @@ struct vm_area_struct {
 	struct vm_userfaultfd_ctx vm_userfaultfd_ctx;
 #ifdef CONFIG_PER_VMA_LOCK
 	/* Unstable RCU readers are allowed to read this. */
-	struct vma_lock vm_lock ____cacheline_aligned_in_smp;
+	refcount_t vm_refcnt ____cacheline_aligned_in_smp;
+#ifdef CONFIG_DEBUG_LOCK_ALLOC
+	struct lockdep_map vmlock_dep_map;
+#endif
 #endif
 } __randomize_layout;
 
@@ -919,6 +916,7 @@ struct mm_struct {
 					  * by mmlist_lock
 					  */
 #ifdef CONFIG_PER_VMA_LOCK
+		struct rcuwait vma_writer_wait;
 		/*
 		 * This field has lock-like semantics, meaning it is sometimes
 		 * accessed with ACQUIRE/RELEASE semantics.
diff --git a/kernel/fork.c b/kernel/fork.c
index d4c75428ccaf..7a0800d48112 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -463,12 +463,8 @@ struct vm_area_struct *vm_area_dup(struct vm_area_struct *orig)
 	 * will be reinitialized.
 	 */
 	data_race(memcpy(new, orig, sizeof(*new)));
-	vma_lock_init(new);
+	vma_init_lock(new, true);
 	INIT_LIST_HEAD(&new->anon_vma_chain);
-#ifdef CONFIG_PER_VMA_LOCK
-	/* vma is not locked, can't use vma_mark_detached() */
-	new->detached = true;
-#endif
 	vma_numab_state_init(new);
 	dup_anon_vma_name(orig, new);
 
@@ -477,6 +473,8 @@ struct vm_area_struct *vm_area_dup(struct vm_area_struct *orig)
 
 void __vm_area_free(struct vm_area_struct *vma)
 {
+	/* The vma should be detached while being destroyed. */
+	vma_assert_detached(vma);
 	vma_numab_state_free(vma);
 	free_anon_vma_name(vma);
 	kmem_cache_free(vm_area_cachep, vma);
@@ -488,8 +486,6 @@ static void vm_area_free_rcu_cb(struct rcu_head *head)
 	struct vm_area_struct *vma = container_of(head, struct vm_area_struct,
 						  vm_rcu);
 
-	/* The vma should not be locked while being destroyed. */
-	VM_BUG_ON_VMA(rwsem_is_locked(&vma->vm_lock.lock), vma);
 	__vm_area_free(vma);
 }
 #endif
@@ -1223,6 +1219,9 @@ static inline void mmap_init_lock(struct mm_struct *mm)
 {
 	init_rwsem(&mm->mmap_lock);
 	mm_lock_seqcount_init(mm);
+#ifdef CONFIG_PER_VMA_LOCK
+	rcuwait_init(&mm->vma_writer_wait);
+#endif
 }
 
 static struct mm_struct *mm_init(struct mm_struct *mm, struct task_struct *p,
diff --git a/mm/init-mm.c b/mm/init-mm.c
index 6af3ad675930..4600e7605cab 100644
--- a/mm/init-mm.c
+++ b/mm/init-mm.c
@@ -40,6 +40,7 @@ struct mm_struct init_mm = {
 	.arg_lock	=  __SPIN_LOCK_UNLOCKED(init_mm.arg_lock),
 	.mmlist		= LIST_HEAD_INIT(init_mm.mmlist),
 #ifdef CONFIG_PER_VMA_LOCK
+	.vma_writer_wait = __RCUWAIT_INITIALIZER(init_mm.vma_writer_wait),
 	.mm_lock_seq	= SEQCNT_ZERO(init_mm.mm_lock_seq),
 #endif
 	.user_ns	= &init_user_ns,
diff --git a/mm/memory.c b/mm/memory.c
index 236fdecd44d6..2def47b5dff0 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -6328,9 +6328,39 @@ struct vm_area_struct *lock_mm_and_find_vma(struct mm_struct *mm,
 #endif
 
 #ifdef CONFIG_PER_VMA_LOCK
+static inline bool __vma_enter_locked(struct vm_area_struct *vma, unsigned int tgt_refcnt)
+{
+	/*
+	 * If vma is detached then only vma_mark_attached() can raise the
+	 * vm_refcnt. mmap_write_lock prevents racing with vma_mark_attached().
+	 */
+	if (!refcount_inc_not_zero(&vma->vm_refcnt))
+		return false;
+
+	rwsem_acquire(&vma->vmlock_dep_map, 0, 0, _RET_IP_);
+	/* vma is attached, set the writer present bit */
+	refcount_add(VMA_LOCK_OFFSET, &vma->vm_refcnt);
+	rcuwait_wait_event(&vma->vm_mm->vma_writer_wait,
+		   refcount_read(&vma->vm_refcnt) == tgt_refcnt,
+		   TASK_UNINTERRUPTIBLE);
+	lock_acquired(&vma->vmlock_dep_map, _RET_IP_);
+
+	return true;
+}
+
+static inline void __vma_exit_locked(struct vm_area_struct *vma, bool *detached)
+{
+	*detached = refcount_sub_and_test(VMA_LOCK_OFFSET + 1, &vma->vm_refcnt);
+	rwsem_release(&vma->vmlock_dep_map, _RET_IP_);
+}
+
 void __vma_start_write(struct vm_area_struct *vma, unsigned int mm_lock_seq)
 {
-	down_write(&vma->vm_lock.lock);
+	bool locked;
+
+	/* Wait until refcnt is (VMA_LOCK_OFFSET + 2) => attached with no readers */
+	locked = __vma_enter_locked(vma, VMA_LOCK_OFFSET + 2);
+
 	/*
 	 * We should use WRITE_ONCE() here because we can have concurrent reads
 	 * from the early lockless pessimistic check in vma_start_read().
@@ -6338,10 +6368,36 @@ void __vma_start_write(struct vm_area_struct *vma, unsigned int mm_lock_seq)
 	 * we should use WRITE_ONCE() for cleanliness and to keep KCSAN happy.
 	 */
 	WRITE_ONCE(vma->vm_lock_seq, mm_lock_seq);
-	up_write(&vma->vm_lock.lock);
+
+	if (locked) {
+		bool detached;
+
+		__vma_exit_locked(vma, &detached);
+		VM_BUG_ON_VMA(detached, vma); /* vma should remain attached */
+	}
 }
 EXPORT_SYMBOL_GPL(__vma_start_write);
 
+void vma_mark_detached(struct vm_area_struct *vma)
+{
+	vma_assert_write_locked(vma);
+	vma_assert_attached(vma);
+
+	/* We are the only writer, so no need to use vma_refcount_put(). */
+	if (unlikely(!refcount_dec_and_test(&vma->vm_refcnt))) {
+		/*
+		 * Wait until refcnt is (VMA_LOCK_OFFSET + 1) => detached with
+		 * no readers
+		 */
+		if (__vma_enter_locked(vma, VMA_LOCK_OFFSET + 1)) {
+			bool detached;
+
+			__vma_exit_locked(vma, &detached);
+			VM_BUG_ON_VMA(!detached, vma);
+		}
+	}
+}
+
 /*
  * Lookup and lock a VMA under RCU protection. Returned VMA is guaranteed to be
  * stable and not isolated. If the VMA is not found or is being modified the
@@ -6354,7 +6410,6 @@ struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
 	struct vm_area_struct *vma;
 
 	rcu_read_lock();
-retry:
 	vma = mas_walk(&mas);
 	if (!vma)
 		goto inval;
@@ -6362,13 +6417,6 @@ struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
 	if (!vma_start_read(vma))
 		goto inval;
 
-	/* Check if the VMA got isolated after we found it */
-	if (is_vma_detached(vma)) {
-		vma_end_read(vma);
-		count_vm_vma_lock_event(VMA_LOCK_MISS);
-		/* The area was replaced with another one */
-		goto retry;
-	}
 	/*
 	 * At this point, we have a stable reference to a VMA: The VMA is
 	 * locked and we know it hasn't already been isolated.
diff --git a/tools/testing/vma/linux/atomic.h b/tools/testing/vma/linux/atomic.h
index e01f66f98982..2e2021553196 100644
--- a/tools/testing/vma/linux/atomic.h
+++ b/tools/testing/vma/linux/atomic.h
@@ -9,4 +9,9 @@
 #define atomic_set(x, y) do {} while (0)
 #define U8_MAX UCHAR_MAX
 
+#ifndef atomic_cmpxchg_relaxed
+#define  atomic_cmpxchg_relaxed		uatomic_cmpxchg
+#define  atomic_cmpxchg_release         uatomic_cmpxchg
+#endif /* atomic_cmpxchg_relaxed */
+
 #endif	/* _LINUX_ATOMIC_H */
diff --git a/tools/testing/vma/vma_internal.h b/tools/testing/vma/vma_internal.h
index 2a624f9304da..1e8cd2f013fa 100644
--- a/tools/testing/vma/vma_internal.h
+++ b/tools/testing/vma/vma_internal.h
@@ -25,7 +25,7 @@
 #include <linux/maple_tree.h>
 #include <linux/mm.h>
 #include <linux/rbtree.h>
-#include <linux/rwsem.h>
+#include <linux/refcount.h>
 
 extern unsigned long stack_guard_gap;
 #ifdef CONFIG_MMU
@@ -132,10 +132,6 @@ typedef __bitwise unsigned int vm_fault_t;
  */
 #define pr_warn_once pr_err
 
-typedef struct refcount_struct {
-	atomic_t refs;
-} refcount_t;
-
 struct kref {
 	refcount_t refcount;
 };
@@ -228,15 +224,12 @@ struct mm_struct {
 	unsigned long def_flags;
 };
 
-struct vma_lock {
-	struct rw_semaphore lock;
-};
-
-
 struct file {
 	struct address_space	*f_mapping;
 };
 
+#define VMA_LOCK_OFFSET	0x40000000
+
 struct vm_area_struct {
 	/* The first cache line has the info for VMA tree walking. */
 
@@ -264,16 +257,13 @@ struct vm_area_struct {
 	};
 
 #ifdef CONFIG_PER_VMA_LOCK
-	/* Flag to indicate areas detached from the mm->mm_mt tree */
-	bool detached;
-
 	/*
 	 * Can only be written (using WRITE_ONCE()) while holding both:
 	 *  - mmap_lock (in write mode)
-	 *  - vm_lock.lock (in write mode)
+	 *  - vm_refcnt bit at VMA_LOCK_OFFSET is set
 	 * Can be read reliably while holding one of:
 	 *  - mmap_lock (in read or write mode)
-	 *  - vm_lock.lock (in read or write mode)
+	 *  - vm_refcnt bit at VMA_LOCK_OFFSET is set or vm_refcnt > 1
 	 * Can be read unreliably (using READ_ONCE()) for pessimistic bailout
 	 * while holding nothing (except RCU to keep the VMA struct allocated).
 	 *
@@ -282,7 +272,6 @@ struct vm_area_struct {
 	 * slowpath.
 	 */
 	unsigned int vm_lock_seq;
-	struct vma_lock vm_lock;
 #endif
 
 	/*
@@ -335,6 +324,10 @@ struct vm_area_struct {
 	struct vma_numab_state *numab_state;	/* NUMA Balancing state */
 #endif
 	struct vm_userfaultfd_ctx vm_userfaultfd_ctx;
+#ifdef CONFIG_PER_VMA_LOCK
+	/* Unstable RCU readers are allowed to read this. */
+	refcount_t vm_refcnt;
+#endif
 } __randomize_layout;
 
 struct vm_fault {};
@@ -459,23 +452,41 @@ static inline struct vm_area_struct *vma_next(struct vma_iterator *vmi)
 	return mas_find(&vmi->mas, ULONG_MAX);
 }
 
-static inline void vma_lock_init(struct vm_area_struct *vma)
+/*
+ * WARNING: to avoid racing with vma_mark_attached()/vma_mark_detached(), these
+ * assertions should be made either under mmap_write_lock or when the object
+ * has been isolated under mmap_write_lock, ensuring no competing writers.
+ */
+static inline void vma_assert_attached(struct vm_area_struct *vma)
 {
-	init_rwsem(&vma->vm_lock.lock);
-	vma->vm_lock_seq = UINT_MAX;
+	VM_BUG_ON_VMA(!refcount_read(&vma->vm_refcnt), vma);
 }
 
-static inline void vma_mark_attached(struct vm_area_struct *vma)
+static inline void vma_assert_detached(struct vm_area_struct *vma)
 {
-	vma->detached = false;
+	VM_BUG_ON_VMA(refcount_read(&vma->vm_refcnt), vma);
 }
 
 static inline void vma_assert_write_locked(struct vm_area_struct *);
+static inline void vma_mark_attached(struct vm_area_struct *vma)
+{
+	vma_assert_write_locked(vma);
+	vma_assert_detached(vma);
+	refcount_set(&vma->vm_refcnt, 1);
+}
+
 static inline void vma_mark_detached(struct vm_area_struct *vma)
 {
-	/* When detaching vma should be write-locked */
 	vma_assert_write_locked(vma);
-	vma->detached = true;
+	vma_assert_attached(vma);
+
+	/* We are the only writer, so no need to use vma_refcount_put(). */
+	if (unlikely(!refcount_dec_and_test(&vma->vm_refcnt))) {
+		/*
+		 * Reader must have temporarily raised vm_refcnt but it will
+		 * drop it without using the vma since vma is write-locked.
+		 */
+	}
 }
 
 extern const struct vm_operations_struct vma_dummy_vm_ops;
@@ -488,9 +499,7 @@ static inline void vma_init(struct vm_area_struct *vma, struct mm_struct *mm)
 	vma->vm_mm = mm;
 	vma->vm_ops = &vma_dummy_vm_ops;
 	INIT_LIST_HEAD(&vma->anon_vma_chain);
-	/* vma is not locked, can't use vma_mark_detached() */
-	vma->detached = true;
-	vma_lock_init(vma);
+	vma->vm_lock_seq = UINT_MAX;
 }
 
 static inline struct vm_area_struct *vm_area_alloc(struct mm_struct *mm)
@@ -513,10 +522,9 @@ static inline struct vm_area_struct *vm_area_dup(struct vm_area_struct *orig)
 		return NULL;
 
 	memcpy(new, orig, sizeof(*new));
-	vma_lock_init(new);
+	refcount_set(&new->vm_refcnt, 0);
+	new->vm_lock_seq = UINT_MAX;
 	INIT_LIST_HEAD(&new->anon_vma_chain);
-	/* vma is not locked, can't use vma_mark_detached() */
-	new->detached = true;
 
 	return new;
 }
-- 
2.47.1.613.gc27f4b7a9f-goog


