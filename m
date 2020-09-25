Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50B67278672
	for <lists+linux-doc@lfdr.de>; Fri, 25 Sep 2020 13:56:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728373AbgIYL4M (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 25 Sep 2020 07:56:12 -0400
Received: from mx2.suse.de ([195.135.220.15]:45604 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728118AbgIYL4I (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 25 Sep 2020 07:56:08 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 286F6AF3F;
        Fri, 25 Sep 2020 11:56:06 +0000 (UTC)
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     sumit.semwal@linaro.org, christian.koenig@amd.com, afd@ti.com,
        corbet@lwn.net, benjamin.gaignard@linaro.org, lmark@codeaurora.org,
        labbott@redhat.com, Brian.Starkey@arm.com, john.stultz@linaro.org,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        airlied@linux.ie, daniel@ffwll.ch, l.stach@pengutronix.de,
        linux+etnaviv@armlinux.org.uk, christian.gmeiner@gmail.com,
        jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
        rodrigo.vivi@intel.com, thierry.reding@gmail.com,
        jonathanh@nvidia.com, pawel@osciak.com, m.szyprowski@samsung.com,
        kyungmin.park@samsung.com, tfiga@chromium.org, mchehab@kernel.org,
        matthew.auld@intel.com, robin.murphy@arm.com,
        thomas.hellstrom@intel.com, sam@ravnborg.org, kraxel@redhat.com,
        arnd@arndb.de, gregkh@linuxfoundation.org
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org,
        etnaviv@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        linux-tegra@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH v3 3/4] dma-buf: Use struct dma_buf_map in dma_buf_vunmap() interfaces
Date:   Fri, 25 Sep 2020 13:56:00 +0200
Message-Id: <20200925115601.23955-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200925115601.23955-1-tzimmermann@suse.de>
References: <20200925115601.23955-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch updates dma_buf_vunmap() and dma-buf's vunmap callback to
use struct dma_buf_map. The interfaces used to receive a buffer address.
This address is now given in an instance of the structure.

Users of the functions are updated accordingly. This is only an interface
change. It is currently expected that dma-buf memory can be accessed with
system memory load/store operations.

v2:
	* include dma-buf-heaps and i915 selftests (kernel test robot)
	* initialize cma_obj before using it in drm_gem_cma_free_object()
	  (kernel test robot)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Sumit Semwal <sumit.semwal@linaro.org>
Acked-by: Christian König <christian.koenig@amd.com>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/dma-buf/dma-buf.c                     |  8 ++---
 drivers/dma-buf/heaps/heap-helpers.c          |  2 +-
 drivers/gpu/drm/drm_gem_cma_helper.c          |  9 +++---
 drivers/gpu/drm/drm_gem_shmem_helper.c        |  3 +-
 drivers/gpu/drm/drm_prime.c                   |  6 ++--
 drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c   |  5 +--
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |  2 +-
 .../drm/i915/gem/selftests/i915_gem_dmabuf.c  |  6 ++--
 .../gpu/drm/i915/gem/selftests/mock_dmabuf.c  |  4 +--
 drivers/gpu/drm/tegra/gem.c                   |  5 +--
 .../common/videobuf2/videobuf2-dma-contig.c   |  3 +-
 .../media/common/videobuf2/videobuf2-dma-sg.c |  3 +-
 .../common/videobuf2/videobuf2-vmalloc.c      |  6 ++--
 include/drm/drm_prime.h                       |  2 +-
 include/linux/dma-buf-map.h                   | 32 +++++++++++++++++--
 include/linux/dma-buf.h                       |  4 +--
 16 files changed, 66 insertions(+), 34 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 61bd24d21b38..a6ba4d598f0e 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -1236,21 +1236,21 @@ EXPORT_SYMBOL_GPL(dma_buf_vmap);
 /**
  * dma_buf_vunmap - Unmap a vmap obtained by dma_buf_vmap.
  * @dmabuf:	[in]	buffer to vunmap
- * @vaddr:	[in]	vmap to vunmap
+ * @map:	[in]	vmap pointer to vunmap
  */
-void dma_buf_vunmap(struct dma_buf *dmabuf, void *vaddr)
+void dma_buf_vunmap(struct dma_buf *dmabuf, struct dma_buf_map *map)
 {
 	if (WARN_ON(!dmabuf))
 		return;
 
 	BUG_ON(dma_buf_map_is_null(&dmabuf->vmap_ptr));
 	BUG_ON(dmabuf->vmapping_counter == 0);
-	BUG_ON(!dma_buf_map_is_vaddr(&dmabuf->vmap_ptr, vaddr));
+	BUG_ON(!dma_buf_map_is_equal(&dmabuf->vmap_ptr, map));
 
 	mutex_lock(&dmabuf->lock);
 	if (--dmabuf->vmapping_counter == 0) {
 		if (dmabuf->ops->vunmap)
-			dmabuf->ops->vunmap(dmabuf, vaddr);
+			dmabuf->ops->vunmap(dmabuf, map);
 		dma_buf_map_clear(&dmabuf->vmap_ptr);
 	}
 	mutex_unlock(&dmabuf->lock);
diff --git a/drivers/dma-buf/heaps/heap-helpers.c b/drivers/dma-buf/heaps/heap-helpers.c
index aeb9e100f339..fcf4ce3e2cbb 100644
--- a/drivers/dma-buf/heaps/heap-helpers.c
+++ b/drivers/dma-buf/heaps/heap-helpers.c
@@ -251,7 +251,7 @@ static int dma_heap_dma_buf_vmap(struct dma_buf *dmabuf, struct dma_buf_map *map
 	return 0;
 }
 
-static void dma_heap_dma_buf_vunmap(struct dma_buf *dmabuf, void *vaddr)
+static void dma_heap_dma_buf_vunmap(struct dma_buf *dmabuf, struct dma_buf_map *map)
 {
 	struct heap_helper_buffer *buffer = dmabuf->priv;
 
diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/drm_gem_cma_helper.c
index 19670b05ead5..2165633c9b9e 100644
--- a/drivers/gpu/drm/drm_gem_cma_helper.c
+++ b/drivers/gpu/drm/drm_gem_cma_helper.c
@@ -175,13 +175,12 @@ drm_gem_cma_create_with_handle(struct drm_file *file_priv,
  */
 void drm_gem_cma_free_object(struct drm_gem_object *gem_obj)
 {
-	struct drm_gem_cma_object *cma_obj;
-
-	cma_obj = to_drm_gem_cma_obj(gem_obj);
+	struct drm_gem_cma_object *cma_obj = to_drm_gem_cma_obj(gem_obj);
+	struct dma_buf_map map = DMA_BUF_MAP_INIT_VADDR(cma_obj->vaddr);
 
 	if (gem_obj->import_attach) {
 		if (cma_obj->vaddr)
-			dma_buf_vunmap(gem_obj->import_attach->dmabuf, cma_obj->vaddr);
+			dma_buf_vunmap(gem_obj->import_attach->dmabuf, &map);
 		drm_prime_gem_destroy(gem_obj, cma_obj->sgt);
 	} else if (cma_obj->vaddr) {
 		dma_free_wc(gem_obj->dev->dev, cma_obj->base.size,
@@ -628,7 +627,7 @@ drm_gem_cma_prime_import_sg_table_vmap(struct drm_device *dev,
 
 	obj = drm_gem_cma_prime_import_sg_table(dev, attach, sgt);
 	if (IS_ERR(obj)) {
-		dma_buf_vunmap(attach->dmabuf, map.vaddr);
+		dma_buf_vunmap(attach->dmabuf, &map);
 		return obj;
 	}
 
diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 6328cfbb828e..fb11df7aced5 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -337,6 +337,7 @@ EXPORT_SYMBOL(drm_gem_shmem_vmap);
 static void drm_gem_shmem_vunmap_locked(struct drm_gem_shmem_object *shmem)
 {
 	struct drm_gem_object *obj = &shmem->base;
+	struct dma_buf_map map = DMA_BUF_MAP_INIT_VADDR(shmem->vaddr);
 
 	if (WARN_ON_ONCE(!shmem->vmap_use_count))
 		return;
@@ -345,7 +346,7 @@ static void drm_gem_shmem_vunmap_locked(struct drm_gem_shmem_object *shmem)
 		return;
 
 	if (obj->import_attach)
-		dma_buf_vunmap(obj->import_attach->dmabuf, shmem->vaddr);
+		dma_buf_vunmap(obj->import_attach->dmabuf, &map);
 	else
 		vunmap(shmem->vaddr);
 
diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 42d081c43bc8..89e2a2496734 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -688,16 +688,16 @@ EXPORT_SYMBOL(drm_gem_dmabuf_vmap);
 /**
  * drm_gem_dmabuf_vunmap - dma_buf vunmap implementation for GEM
  * @dma_buf: buffer to be unmapped
- * @vaddr: the virtual address of the buffer
+ * @map: the virtual address of the buffer
  *
  * Releases a kernel virtual mapping. This can be used as the
  * &dma_buf_ops.vunmap callback. Calls into &drm_gem_object_funcs.vunmap for device specific handling.
  */
-void drm_gem_dmabuf_vunmap(struct dma_buf *dma_buf, void *vaddr)
+void drm_gem_dmabuf_vunmap(struct dma_buf *dma_buf, struct dma_buf_map *map)
 {
 	struct drm_gem_object *obj = dma_buf->priv;
 
-	drm_gem_vunmap(obj, vaddr);
+	drm_gem_vunmap(obj, map->vaddr);
 }
 EXPORT_SYMBOL(drm_gem_dmabuf_vunmap);
 
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
index 80a9fc143bbb..135fbff6fecf 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
@@ -70,9 +70,10 @@ void etnaviv_gem_prime_unpin(struct drm_gem_object *obj)
 
 static void etnaviv_gem_prime_release(struct etnaviv_gem_object *etnaviv_obj)
 {
+	struct dma_buf_map map = DMA_BUF_MAP_INIT_VADDR(etnaviv_obj->vaddr);
+
 	if (etnaviv_obj->vaddr)
-		dma_buf_vunmap(etnaviv_obj->base.import_attach->dmabuf,
-			       etnaviv_obj->vaddr);
+		dma_buf_vunmap(etnaviv_obj->base.import_attach->dmabuf, &map);
 
 	/* Don't drop the pages for imported dmabuf, as they are not
 	 * ours, just free the array we allocated:
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
index 6ee8f2cfd8c1..0dd477e56573 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
@@ -91,7 +91,7 @@ static int i915_gem_dmabuf_vmap(struct dma_buf *dma_buf, struct dma_buf_map *map
 	return 0;
 }
 
-static void i915_gem_dmabuf_vunmap(struct dma_buf *dma_buf, void *vaddr)
+static void i915_gem_dmabuf_vunmap(struct dma_buf *dma_buf, struct dma_buf_map *map)
 {
 	struct drm_i915_gem_object *obj = dma_buf_to_obj(dma_buf);
 
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
index f79ebc5329b7..0b4d19729e1f 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
@@ -152,7 +152,7 @@ static int igt_dmabuf_import(void *arg)
 
 	err = 0;
 out_dma_map:
-	dma_buf_vunmap(dmabuf, dma_map);
+	dma_buf_vunmap(dmabuf, &map);
 out_obj:
 	i915_gem_object_put(obj);
 out_dmabuf:
@@ -182,7 +182,7 @@ static int igt_dmabuf_import_ownership(void *arg)
 	}
 
 	memset(ptr, 0xc5, PAGE_SIZE);
-	dma_buf_vunmap(dmabuf, ptr);
+	dma_buf_vunmap(dmabuf, &map);
 
 	obj = to_intel_bo(i915_gem_prime_import(&i915->drm, dmabuf));
 	if (IS_ERR(obj)) {
@@ -250,7 +250,7 @@ static int igt_dmabuf_export_vmap(void *arg)
 	memset(ptr, 0xc5, dmabuf->size);
 
 	err = 0;
-	dma_buf_vunmap(dmabuf, ptr);
+	dma_buf_vunmap(dmabuf, &map);
 out:
 	dma_buf_put(dmabuf);
 	return err;
diff --git a/drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.c b/drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.c
index becd9fb95d58..2855d11c7a51 100644
--- a/drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.c
@@ -74,11 +74,11 @@ static int mock_dmabuf_vmap(struct dma_buf *dma_buf, struct dma_buf_map *map)
 	return 0;
 }
 
-static void mock_dmabuf_vunmap(struct dma_buf *dma_buf, void *vaddr)
+static void mock_dmabuf_vunmap(struct dma_buf *dma_buf, struct dma_buf_map *map)
 {
 	struct mock_dmabuf *mock = to_mock(dma_buf);
 
-	vm_unmap_ram(vaddr, mock->npages);
+	vm_unmap_ram(map->vaddr, mock->npages);
 }
 
 static int mock_dmabuf_mmap(struct dma_buf *dma_buf, struct vm_area_struct *vma)
diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index cd497edad850..26af8daa9a16 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -149,11 +149,12 @@ static void *tegra_bo_mmap(struct host1x_bo *bo)
 static void tegra_bo_munmap(struct host1x_bo *bo, void *addr)
 {
 	struct tegra_bo *obj = host1x_to_tegra_bo(bo);
+	struct dma_buf_map map = DMA_BUF_MAP_INIT_VADDR(addr);
 
 	if (obj->vaddr)
 		return;
 	else if (obj->gem.import_attach)
-		dma_buf_vunmap(obj->gem.import_attach->dmabuf, addr);
+		dma_buf_vunmap(obj->gem.import_attach->dmabuf, &map);
 	else
 		vunmap(addr);
 }
@@ -656,7 +657,7 @@ static int tegra_gem_prime_vmap(struct dma_buf *buf, struct dma_buf_map *map)
 	return 0;
 }
 
-static void tegra_gem_prime_vunmap(struct dma_buf *buf, void *vaddr)
+static void tegra_gem_prime_vunmap(struct dma_buf *buf, struct dma_buf_map *map)
 {
 }
 
diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
index 11428287bdf3..a1eb8279b113 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
@@ -648,6 +648,7 @@ static void vb2_dc_unmap_dmabuf(void *mem_priv)
 {
 	struct vb2_dc_buf *buf = mem_priv;
 	struct sg_table *sgt = buf->dma_sgt;
+	struct dma_buf_map map = DMA_BUF_MAP_INIT_VADDR(buf->vaddr);
 
 	if (WARN_ON(!buf->db_attach)) {
 		pr_err("trying to unpin a not attached buffer\n");
@@ -660,7 +661,7 @@ static void vb2_dc_unmap_dmabuf(void *mem_priv)
 	}
 
 	if (buf->vaddr) {
-		dma_buf_vunmap(buf->db_attach->dmabuf, buf->vaddr);
+		dma_buf_vunmap(buf->db_attach->dmabuf, &map);
 		buf->vaddr = NULL;
 	}
 	dma_buf_unmap_attachment(buf->db_attach, sgt, buf->dma_dir);
diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
index c51170e9c1b9..d5157e903e27 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
@@ -580,6 +580,7 @@ static void vb2_dma_sg_unmap_dmabuf(void *mem_priv)
 {
 	struct vb2_dma_sg_buf *buf = mem_priv;
 	struct sg_table *sgt = buf->dma_sgt;
+	struct dma_buf_map map = DMA_BUF_MAP_INIT_VADDR(buf->vaddr);
 
 	if (WARN_ON(!buf->db_attach)) {
 		pr_err("trying to unpin a not attached buffer\n");
@@ -592,7 +593,7 @@ static void vb2_dma_sg_unmap_dmabuf(void *mem_priv)
 	}
 
 	if (buf->vaddr) {
-		dma_buf_vunmap(buf->db_attach->dmabuf, buf->vaddr);
+		dma_buf_vunmap(buf->db_attach->dmabuf, &map);
 		buf->vaddr = NULL;
 	}
 	dma_buf_unmap_attachment(buf->db_attach, sgt, buf->dma_dir);
diff --git a/drivers/media/common/videobuf2/videobuf2-vmalloc.c b/drivers/media/common/videobuf2/videobuf2-vmalloc.c
index 7b68e2379c65..11ba0eb1315b 100644
--- a/drivers/media/common/videobuf2/videobuf2-vmalloc.c
+++ b/drivers/media/common/videobuf2/videobuf2-vmalloc.c
@@ -390,17 +390,19 @@ static int vb2_vmalloc_map_dmabuf(void *mem_priv)
 static void vb2_vmalloc_unmap_dmabuf(void *mem_priv)
 {
 	struct vb2_vmalloc_buf *buf = mem_priv;
+	struct dma_buf_map map = DMA_BUF_MAP_INIT_VADDR(buf->vaddr);
 
-	dma_buf_vunmap(buf->dbuf, buf->vaddr);
+	dma_buf_vunmap(buf->dbuf, &map);
 	buf->vaddr = NULL;
 }
 
 static void vb2_vmalloc_detach_dmabuf(void *mem_priv)
 {
 	struct vb2_vmalloc_buf *buf = mem_priv;
+	struct dma_buf_map map = DMA_BUF_MAP_INIT_VADDR(buf->vaddr);
 
 	if (buf->vaddr)
-		dma_buf_vunmap(buf->dbuf, buf->vaddr);
+		dma_buf_vunmap(buf->dbuf, &map);
 
 	kfree(buf);
 }
diff --git a/include/drm/drm_prime.h b/include/drm/drm_prime.h
index 5125f84c28f6..0991a47a1567 100644
--- a/include/drm/drm_prime.h
+++ b/include/drm/drm_prime.h
@@ -84,7 +84,7 @@ void drm_gem_unmap_dma_buf(struct dma_buf_attachment *attach,
 			   struct sg_table *sgt,
 			   enum dma_data_direction dir);
 int drm_gem_dmabuf_vmap(struct dma_buf *dma_buf, struct dma_buf_map *map);
-void drm_gem_dmabuf_vunmap(struct dma_buf *dma_buf, void *vaddr);
+void drm_gem_dmabuf_vunmap(struct dma_buf *dma_buf, struct dma_buf_map *map);
 
 int drm_gem_prime_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma);
 int drm_gem_dmabuf_mmap(struct dma_buf *dma_buf, struct vm_area_struct *vma);
diff --git a/include/linux/dma-buf-map.h b/include/linux/dma-buf-map.h
index 5ae732d373eb..c173a4abf4ba 100644
--- a/include/linux/dma-buf-map.h
+++ b/include/linux/dma-buf-map.h
@@ -23,6 +23,16 @@ struct dma_buf_map {
 	bool is_iomem;
 };
 
+/**
+ * DMA_BUF_MAP_INIT_VADDR - Initializes struct dma_buf_map to an address in system memory
+ * @vaddr:	A system-memory address
+ */
+#define DMA_BUF_MAP_INIT_VADDR(vaddr_) \
+	{ \
+		.vaddr = (vaddr_), \
+		.is_iomem = false, \
+	}
+
 /**
  * dma_buf_map_set_vaddr - Sets a dma-buf mapping structure to an address in system memory
  * @map:	The dma-buf mapping structure
@@ -36,10 +46,26 @@ static inline void dma_buf_map_set_vaddr(struct dma_buf_map *map, void *vaddr)
 	map->is_iomem = false;
 }
 
-/* API transition helper */
-static inline bool dma_buf_map_is_vaddr(const struct dma_buf_map *map, const void *vaddr)
+/**
+ * dma_buf_map_is_equal - Compares two dma-buf mapping structures for equality
+ * @lhs:	The dma-buf mapping structure
+ * @rhs:	A dma-buf mapping structure to compare with
+ *
+ * Two dma-buf mapping structures are equal if they both refer to the same type of memory
+ * and to the same address within that memory.
+ *
+ * Returns:
+ * True is both structures are equal, or false otherwise.
+ */
+static inline bool dma_buf_map_is_equal(const struct dma_buf_map *lhs,
+					const struct dma_buf_map *rhs)
 {
-	return !map->is_iomem && (map->vaddr == vaddr);
+	if (lhs->is_iomem != rhs->is_iomem)
+		return false;
+	else if (lhs->is_iomem)
+		return lhs->vaddr_iomem == rhs->vaddr_iomem;
+	else
+		return lhs->vaddr == rhs->vaddr;
 }
 
 /**
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index 7237997cfa38..cf77cc15f4ba 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -267,7 +267,7 @@ struct dma_buf_ops {
 	int (*mmap)(struct dma_buf *, struct vm_area_struct *vma);
 
 	int (*vmap)(struct dma_buf *dmabuf, struct dma_buf_map *map);
-	void (*vunmap)(struct dma_buf *, void *vaddr);
+	void (*vunmap)(struct dma_buf *dmabuf, struct dma_buf_map *map);
 };
 
 /**
@@ -504,5 +504,5 @@ int dma_buf_end_cpu_access(struct dma_buf *dma_buf,
 int dma_buf_mmap(struct dma_buf *, struct vm_area_struct *,
 		 unsigned long);
 int dma_buf_vmap(struct dma_buf *dmabuf, struct dma_buf_map *map);
-void dma_buf_vunmap(struct dma_buf *dmabuf, void *vaddr);
+void dma_buf_vunmap(struct dma_buf *dmabuf, struct dma_buf_map *map);
 #endif /* __DMA_BUF_H__ */
-- 
2.28.0

