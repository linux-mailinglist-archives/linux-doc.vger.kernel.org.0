Return-Path: <linux-doc+bounces-36012-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 56026A1ACED
	for <lists+linux-doc@lfdr.de>; Thu, 23 Jan 2025 23:55:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 540AE7A584B
	for <lists+linux-doc@lfdr.de>; Thu, 23 Jan 2025 22:55:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A19C61D5173;
	Thu, 23 Jan 2025 22:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="VXKDLoIJ"
X-Original-To: linux-doc@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6581E0B91;
	Thu, 23 Jan 2025 22:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737672872; cv=pass; b=C6Ry8oAZos5xNYVq2e7+T61oiGK0hZqzoIYr4E9Ejn90caY/odw+G3OORX1Azfcm389YGxQYXWTluVBxIsSgpRRXJdETmiPyaPNWUz8uHQFO/gnQ4bKl0CGPUDXWR8pjJaj/iZXy7JVlABCq9EVOeUHFp8MbLWedVZkKT3WOXIU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737672872; c=relaxed/simple;
	bh=qhLPQrPjCb63bWSxcdtX/+opkGTy0oHWAlQ/x43Blvo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r7nTZjISD3iiVr3lAvRoGnyT2PP/i3a2asaga/VaBd8Qs6PGkF3e7SWzRFwij+KVOsz1biJ0DIZe+U4hW4JkO/VsiDC/CZPepE1AAtalbuiiGjKAWA7u4oTOuRT0my16+OLcI96//qSHlj1T4eddvZ3P6Zyj9vkHZNJgdbvTUnE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=VXKDLoIJ; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1737672843; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=EMMlfx7/xH+PEH3f08jCMzorGzG+Tb6HDODWX9XN5+TnAMTwj6dtJ7NdLBkAeEPMtEOLX2222nlg6m9+b28lbT+buqS8m4wM2FLeonEm0aqy3HkLRLHP8Gp235SdwECBBXYK02liTa3KIEEFAdaS96g9T/pWzqeCmcJyI6mFayg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1737672843; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=KFOUw++dizLGwK/6QWFx9YW7apnArTlQh1uIfAIlvD8=; 
	b=Z/bIC/fzGGWmlJGqhcHGEjpH7t55uw9oynY/9cTjsCfZTSJsZZKjHQtG06hHQzWSKnron28nSQwsa9+HY8fQp7cnDNkLW1AMq3ehDGwYoop9AMNogOMFJkdOtgMKHQSMq+3CaYDQ0DtDGbsNCPpXSVAfhHelK0UwdoeFemZJ/GM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1737672843;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=KFOUw++dizLGwK/6QWFx9YW7apnArTlQh1uIfAIlvD8=;
	b=VXKDLoIJ7yyAXb9pJ8tCYuwINClMAOFE8jxBHHYMXqtBPppWiCMNqI+RY2PsJL3A
	T5Do2XMZePsGOjP5LcIBM91jYXHmWVvSeaU8PDkM5ralppu6XMGptbhILVvhe7vq45B
	2gUFAZ3iPtYNOGfQcMuXPT1UZpGsWRFjOiPePexI=
Received: by mx.zohomail.com with SMTPS id 1737672839518335.73426000744485;
	Thu, 23 Jan 2025 14:53:59 -0800 (PST)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>
Cc: kernel@collabora.com,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
	Mihail Atanassov <mihail.atanassov@arm.com>
Subject: [PATCH v9 3/5] drm/panthor: Expose size of driver internal BO's over fdinfo
Date: Thu, 23 Jan 2025 22:53:00 +0000
Message-ID: <20250123225325.3271764-4-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250123225325.3271764-1-adrian.larumbe@collabora.com>
References: <20250123225325.3271764-1-adrian.larumbe@collabora.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This will display the sizes of kenrel BO's bound to an open file, which are
otherwise not exposed to UM through a handle.

The sizes recorded are as follows:
 - Per group: suspend buffer, protm-suspend buffer, syncobjcs
 - Per queue: ringbuffer, profiling slots, firmware interface
 - For all heaps in all heap pools across all VM's bound to an open file,
 record size of all heap chuks, and for each pool the gpu_context BO too.

This does not record the size of FW regions, as these aren't bound to a
specific open file and remain active through the whole life of the driver.

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Reviewed-by: Mihail Atanassov <mihail.atanassov@arm.com>
Reviewed-by: Steven Price <steven.price@arm.com>
Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_drv.c   | 14 +++++++
 drivers/gpu/drm/panthor/panthor_heap.c  | 26 ++++++++++++
 drivers/gpu/drm/panthor/panthor_heap.h  |  2 +
 drivers/gpu/drm/panthor/panthor_mmu.c   | 36 ++++++++++++++++
 drivers/gpu/drm/panthor/panthor_mmu.h   |  3 ++
 drivers/gpu/drm/panthor/panthor_sched.c | 56 ++++++++++++++++++++++++-
 drivers/gpu/drm/panthor/panthor_sched.h |  3 ++
 7 files changed, 139 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index ac7e53f6e3f0..d5f98598d8d7 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -1457,12 +1457,26 @@ static void panthor_gpu_show_fdinfo(struct panthor_device *ptdev,
 	drm_printf(p, "drm-curfreq-panthor:\t%lu Hz\n", ptdev->current_frequency);
 }
 
+static void panthor_show_internal_memory_stats(struct drm_printer *p, struct drm_file *file)
+{
+	char *drv_name = file->minor->dev->driver->name;
+	struct panthor_file *pfile = file->driver_priv;
+	struct drm_memory_stats stats = {0};
+
+	panthor_fdinfo_gather_group_mem_info(pfile, &stats);
+	panthor_vm_heaps_sizes(pfile, &stats);
+
+	drm_fdinfo_print_size(p, drv_name, "resident", "memory", stats.resident);
+	drm_fdinfo_print_size(p, drv_name, "active", "memory", stats.active);
+}
+
 static void panthor_show_fdinfo(struct drm_printer *p, struct drm_file *file)
 {
 	struct drm_device *dev = file->minor->dev;
 	struct panthor_device *ptdev = container_of(dev, struct panthor_device, base);
 
 	panthor_gpu_show_fdinfo(ptdev, file->driver_priv, p);
+	panthor_show_internal_memory_stats(p, file);
 
 	drm_show_memory_stats(p, file);
 }
diff --git a/drivers/gpu/drm/panthor/panthor_heap.c b/drivers/gpu/drm/panthor/panthor_heap.c
index 3796a9eb22af..db0285ce5812 100644
--- a/drivers/gpu/drm/panthor/panthor_heap.c
+++ b/drivers/gpu/drm/panthor/panthor_heap.c
@@ -603,3 +603,29 @@ void panthor_heap_pool_destroy(struct panthor_heap_pool *pool)
 
 	panthor_heap_pool_put(pool);
 }
+
+/**
+ * panthor_heap_pool_size() - Calculate size of all chunks across all heaps in a pool
+ * @pool: Pool whose total chunk size to calculate.
+ *
+ * This function adds the size of all heap chunks across all heaps in the
+ * argument pool. It also adds the size of the gpu contexts kernel bo.
+ * It is meant to be used by fdinfo for displaying the size of internal
+ * driver BO's that aren't exposed to userspace through a GEM handle.
+ *
+ */
+size_t panthor_heap_pool_size(struct panthor_heap_pool *pool)
+{
+	struct panthor_heap *heap;
+	unsigned long i;
+	size_t size = 0;
+
+	down_read(&pool->lock);
+	xa_for_each(&pool->xa, i, heap)
+		size += heap->chunk_size * heap->chunk_count;
+	up_read(&pool->lock);
+
+	size += pool->gpu_contexts->obj->size;
+
+	return size;
+}
diff --git a/drivers/gpu/drm/panthor/panthor_heap.h b/drivers/gpu/drm/panthor/panthor_heap.h
index 25a5f2bba445..e3358d4e8edb 100644
--- a/drivers/gpu/drm/panthor/panthor_heap.h
+++ b/drivers/gpu/drm/panthor/panthor_heap.h
@@ -27,6 +27,8 @@ struct panthor_heap_pool *
 panthor_heap_pool_get(struct panthor_heap_pool *pool);
 void panthor_heap_pool_put(struct panthor_heap_pool *pool);
 
+size_t panthor_heap_pool_size(struct panthor_heap_pool *pool);
+
 int panthor_heap_grow(struct panthor_heap_pool *pool,
 		      u64 heap_gpu_va,
 		      u32 renderpasses_in_flight,
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index c3f0b0225cf9..762ebf46f71a 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -1941,6 +1941,42 @@ struct panthor_heap_pool *panthor_vm_get_heap_pool(struct panthor_vm *vm, bool c
 	return pool;
 }
 
+/**
+ * panthor_vm_heaps_sizes() - Calculate size of all heap chunks across all
+ * heaps over all the heap pools in a VM
+ * @pfile: File.
+ * @stats: Memory stats to be updated.
+ *
+ * Calculate all heap chunk sizes in all heap pools bound to a VM. If the VM
+ * is active, record the size as active as well.
+ */
+void panthor_vm_heaps_sizes(struct panthor_file *pfile, struct drm_memory_stats *stats)
+{
+	struct panthor_vm *vm;
+	unsigned long i;
+
+	if (!pfile->vms)
+		return;
+
+	xa_lock(&pfile->vms->xa);
+	xa_for_each(&pfile->vms->xa, i, vm) {
+		size_t size;
+
+		mutex_lock(&vm->heaps.lock);
+		if (!vm->heaps.pool) {
+			mutex_unlock(&vm->heaps.lock);
+			continue;
+		}
+		size = panthor_heap_pool_size(vm->heaps.pool);
+		mutex_unlock(&vm->heaps.lock);
+
+		stats->resident += size;
+		if (vm->as.id >= 0)
+			stats->active += size;
+	}
+	xa_unlock(&pfile->vms->xa);
+}
+
 static u64 mair_to_memattr(u64 mair, bool coherent)
 {
 	u64 memattr = 0;
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.h b/drivers/gpu/drm/panthor/panthor_mmu.h
index 8d21e83d8aba..fc274637114e 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.h
+++ b/drivers/gpu/drm/panthor/panthor_mmu.h
@@ -9,6 +9,7 @@
 
 struct drm_exec;
 struct drm_sched_job;
+struct drm_memory_stats;
 struct panthor_gem_object;
 struct panthor_heap_pool;
 struct panthor_vm;
@@ -37,6 +38,8 @@ int panthor_vm_flush_all(struct panthor_vm *vm);
 struct panthor_heap_pool *
 panthor_vm_get_heap_pool(struct panthor_vm *vm, bool create);
 
+void panthor_vm_heaps_sizes(struct panthor_file *pfile, struct drm_memory_stats *stats);
+
 struct panthor_vm *panthor_vm_get(struct panthor_vm *vm);
 void panthor_vm_put(struct panthor_vm *vm);
 struct panthor_vm *panthor_vm_create(struct panthor_device *ptdev, bool for_mcu,
diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index ef4bec7ff9c7..e6c08a694e41 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -618,7 +618,7 @@ struct panthor_group {
 	 */
 	struct panthor_kernel_bo *syncobjs;
 
-	/** @fdinfo: Per-file total cycle and timestamp values reference. */
+	/** @fdinfo: Per-file info exposed through /proc/<process>/fdinfo */
 	struct {
 		/** @data: Total sampled values for jobs in queues from this group. */
 		struct panthor_gpu_usage data;
@@ -628,6 +628,9 @@ struct panthor_group {
 		 * and job post-completion processing function
 		 */
 		struct mutex lock;
+
+		/** @fdinfo.kbo_sizes: Aggregate size of private kernel BO's held by the group. */
+		size_t kbo_sizes;
 	} fdinfo;
 
 	/** @state: Group state. */
@@ -3365,6 +3368,29 @@ group_create_queue(struct panthor_group *group,
 	return ERR_PTR(ret);
 }
 
+static void add_group_kbo_sizes(struct panthor_device *ptdev,
+				struct panthor_group *group)
+{
+	struct panthor_queue *queue;
+	int i;
+
+	if (drm_WARN_ON(&ptdev->base, IS_ERR_OR_NULL(group)))
+		return;
+	if (drm_WARN_ON(&ptdev->base, ptdev != group->ptdev))
+		return;
+
+	group->fdinfo.kbo_sizes += group->suspend_buf->obj->size;
+	group->fdinfo.kbo_sizes += group->protm_suspend_buf->obj->size;
+	group->fdinfo.kbo_sizes += group->syncobjs->obj->size;
+
+	for (i = 0; i < group->queue_count; i++) {
+		queue =	group->queues[i];
+		group->fdinfo.kbo_sizes += queue->ringbuf->obj->size;
+		group->fdinfo.kbo_sizes += queue->iface.mem->obj->size;
+		group->fdinfo.kbo_sizes += queue->profiling.slots->obj->size;
+	}
+}
+
 #define MAX_GROUPS_PER_POOL		128
 
 int panthor_group_create(struct panthor_file *pfile,
@@ -3489,6 +3515,7 @@ int panthor_group_create(struct panthor_file *pfile,
 	}
 	mutex_unlock(&sched->reset.lock);
 
+	add_group_kbo_sizes(group->ptdev, group);
 	mutex_init(&group->fdinfo.lock);
 
 	return gid;
@@ -3606,6 +3633,33 @@ void panthor_group_pool_destroy(struct panthor_file *pfile)
 	pfile->groups = NULL;
 }
 
+/**
+ * panthor_group_kbo_sizes() - Retrieve aggregate size of all private kernel BO's
+ * belonging to all the groups owned by an open Panthor file
+ * @pfile: File.
+ * @stats: Memory statistics to be updated.
+ *
+ */
+void
+panthor_fdinfo_gather_group_mem_info(struct panthor_file *pfile,
+				     struct drm_memory_stats *stats)
+{
+	struct panthor_group_pool *gpool = pfile->groups;
+	struct panthor_group *group;
+	unsigned long i;
+
+	if (IS_ERR_OR_NULL(gpool))
+		return;
+
+	xa_lock(&gpool->xa);
+	xa_for_each(&gpool->xa, i, group) {
+		stats->resident += group->fdinfo.kbo_sizes;
+		if (group->csg_id >= 0)
+			stats->active += group->fdinfo.kbo_sizes;
+	}
+	xa_unlock(&gpool->xa);
+}
+
 static void job_release(struct kref *ref)
 {
 	struct panthor_job *job = container_of(ref, struct panthor_job, refcount);
diff --git a/drivers/gpu/drm/panthor/panthor_sched.h b/drivers/gpu/drm/panthor/panthor_sched.h
index 5ae6b4bde7c5..e650a445cf50 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.h
+++ b/drivers/gpu/drm/panthor/panthor_sched.h
@@ -9,6 +9,7 @@ struct dma_fence;
 struct drm_file;
 struct drm_gem_object;
 struct drm_sched_job;
+struct drm_memory_stats;
 struct drm_panthor_group_create;
 struct drm_panthor_queue_create;
 struct drm_panthor_group_get_state;
@@ -36,6 +37,8 @@ void panthor_job_update_resvs(struct drm_exec *exec, struct drm_sched_job *job);
 
 int panthor_group_pool_create(struct panthor_file *pfile);
 void panthor_group_pool_destroy(struct panthor_file *pfile);
+void panthor_fdinfo_gather_group_mem_info(struct panthor_file *pfile,
+					  struct drm_memory_stats *stats);
 
 int panthor_sched_init(struct panthor_device *ptdev);
 void panthor_sched_unplug(struct panthor_device *ptdev);
-- 
2.47.1


