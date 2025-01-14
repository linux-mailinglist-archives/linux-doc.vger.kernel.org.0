Return-Path: <linux-doc+bounces-35246-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E2154A10DE8
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jan 2025 18:35:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F1CBE188571D
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jan 2025 17:35:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADACD1F942B;
	Tue, 14 Jan 2025 17:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="EU0hqfd/"
X-Original-To: linux-doc@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988621F9F41;
	Tue, 14 Jan 2025 17:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736876116; cv=pass; b=OtjSkl4/ANghGCzcdkp0i18WiNxbli9x39GkiaUTm4ANXHacGgC9A0wu9tF9YRtwSC4daaAE/ZQ3It9SinXXkemmVEc6AyUotZNIObrfeMPebH7Xyy0lZZTCCf14EQ6r74hEZgc6zHCOBT94jtOUrdaJBI0gko2mcjlAJKii8Rg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736876116; c=relaxed/simple;
	bh=SRyR1lTi0fdi7lLt1Lmr7UtrJXF/A//CLzLF893JPaw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZVA4MIocS00oXUHTjyCFd15aPMMoregQHsZyVZDct9aEm4U94zkgzcXbCpxl9uWIFN+cLB8e640ijhLu6FMcWsZquN05xPZGJZ/5Lg2DG5hJLrHeXmM74uOU4Z+CHH+FMEukDLArgCSfqdgtdJmOeKmfoe4XGb6B82oWQ4/fQwo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=EU0hqfd/; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1736876087; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=H7OivoI/SipRBUTsgYL/of42wyR12G7U3LrNSwkbmQvlUG1b3mRwvO2tsMOl61X5zjYDK9yb8ACKoqchZ4FfGkzVrFsvQbRjtWUdsKX8k0Jk0O5I6YMyfNEL04FiH7UN6b5wMjJmiXN5PEHPUxjJ/sjnbdFXTDSpP3LCeNHTOic=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1736876087; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ZAXQpuXSZN/ctkTFce5m+vU2f3neLtHUY2SSWlPZauY=; 
	b=kV/UPybeyYcxfFj2iNcLg84vyc+s8fAX2RpuHUAo2LzYp6FdginiswFsgJf7rR1t932/ckQKUGgbVZH/SmZg5Lc+LCb4mVhO1aoKpNChR79yQoKYGx+5cZGZXiWW05YQ2p4BnvMLOjMkOZwHY77GKbR5DS1ppv+Iy8iaFFvydog=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1736876087;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=ZAXQpuXSZN/ctkTFce5m+vU2f3neLtHUY2SSWlPZauY=;
	b=EU0hqfd/oaXITmf7i/72ZxEoq7AC4AEfKkSayTha5fKkEwsmi4aNir6Rip8CcEff
	hnTXRizqnkADDqXRt7RoToniaglDdoi6AZmIkzVJwk/aiDVxE8rF+fj4+/kDXON1TFl
	h7iS1ggmLc2lCQrXePkvIkTD+fiAbWA80OgobVks=
Received: by mx.zohomail.com with SMTPS id 1736876084803649.8736693140232;
	Tue, 14 Jan 2025 09:34:44 -0800 (PST)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jonathan Corbet <corbet@lwn.net>
Cc: kernel@collabora.com,
	=?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Liviu Dudau <liviu.dudau@arm.com>,
	Mihail Atanassov <mihail.atanassov@arm.com>,
	Steven Price <steven.price@arm.com>
Subject: [PATCH v8 3/4] drm/panthor: Expose size of driver internal BO's over fdinfo
Date: Tue, 14 Jan 2025 17:34:02 +0000
Message-ID: <20250114173406.3060248-4-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250114173406.3060248-1-adrian.larumbe@collabora.com>
References: <20250114173406.3060248-1-adrian.larumbe@collabora.com>
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
 drivers/gpu/drm/panthor/panthor_heap.c  | 26 +++++++++++++
 drivers/gpu/drm/panthor/panthor_heap.h  |  2 +
 drivers/gpu/drm/panthor/panthor_mmu.c   | 34 +++++++++++++++++
 drivers/gpu/drm/panthor/panthor_mmu.h   |  3 ++
 drivers/gpu/drm/panthor/panthor_sched.c | 51 ++++++++++++++++++++++++-
 drivers/gpu/drm/panthor/panthor_sched.h |  2 +
 7 files changed, 131 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index ac7e53f6e3f0..b75a9251f578 100644
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
+	panthor_group_kbo_sizes(pfile, &stats);
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
index c3f0b0225cf9..b43073010b7f 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -1941,6 +1941,40 @@ struct panthor_heap_pool *panthor_vm_get_heap_pool(struct panthor_vm *vm, bool c
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
index ef4bec7ff9c7..75b788c580a7 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -618,7 +618,7 @@ struct panthor_group {
 	 */
 	struct panthor_kernel_bo *syncobjs;
 
-	/** @fdinfo: Per-file total cycle and timestamp values reference. */
+	/** @fdinfo: Per-group total cycle and timestamp values and kernel BO sizes. */
 	struct {
 		/** @data: Total sampled values for jobs in queues from this group. */
 		struct panthor_gpu_usage data;
@@ -628,6 +628,9 @@ struct panthor_group {
 		 * and job post-completion processing function
 		 */
 		struct mutex lock;
+
+		/** @kbo_sizes: Aggregate size of private kernel BO's held by the group. */
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
@@ -3606,6 +3633,28 @@ void panthor_group_pool_destroy(struct panthor_file *pfile)
 	pfile->groups = NULL;
 }
 
+/**
+ * panthor_group_kbo_sizes() - Retrieve aggregate size of all private kernel BO's
+ * belonging to all the groups owned by an open Panthor file
+ * @pfile: File.
+ * @stats: Memory statistics to be updated.
+ *
+ */
+void panthor_group_kbo_sizes(struct panthor_file *pfile, struct drm_memory_stats *stats)
+{
+	struct panthor_group_pool *gpool = pfile->groups;
+	struct panthor_group *group;
+	unsigned long i;
+
+	if (IS_ERR_OR_NULL(gpool))
+		return;
+	xa_for_each(&gpool->xa, i, group) {
+		stats->resident += group->fdinfo.kbo_sizes;
+		if (group->csg_id >= 0)
+			stats->active += group->fdinfo.kbo_sizes;
+	}
+}
+
 static void job_release(struct kref *ref)
 {
 	struct panthor_job *job = container_of(ref, struct panthor_job, refcount);
diff --git a/drivers/gpu/drm/panthor/panthor_sched.h b/drivers/gpu/drm/panthor/panthor_sched.h
index 5ae6b4bde7c5..bfe26b26a15b 100644
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
@@ -36,6 +37,7 @@ void panthor_job_update_resvs(struct drm_exec *exec, struct drm_sched_job *job);
 
 int panthor_group_pool_create(struct panthor_file *pfile);
 void panthor_group_pool_destroy(struct panthor_file *pfile);
+void panthor_group_kbo_sizes(struct panthor_file *pfile, struct drm_memory_stats *stats);
 
 int panthor_sched_init(struct panthor_device *ptdev);
 void panthor_sched_unplug(struct panthor_device *ptdev);
-- 
2.47.1


