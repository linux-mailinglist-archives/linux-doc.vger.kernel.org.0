Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79DECAD999
	for <lists+linux-doc@lfdr.de>; Mon,  9 Sep 2019 15:05:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729240AbfIINFA (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 9 Sep 2019 09:05:00 -0400
Received: from mx2.suse.de ([195.135.220.15]:38498 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729184AbfIINFA (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 9 Sep 2019 09:05:00 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id EAB86ADDD;
        Mon,  9 Sep 2019 13:04:56 +0000 (UTC)
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     daniel@ffwll.ch, kraxel@redhat.com, airlied@linux.ie,
        corbet@lwn.net, z.liuxinliang@hisilicon.com, zourongrong@gmail.com,
        kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
        hdegoede@redhat.com, sam@ravnborg.org, yc_chen@aspeedtech.com
Cc:     dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 2/4] drm/vram: Have VRAM MM call GEM VRAM functions directly
Date:   Mon,  9 Sep 2019 15:04:51 +0200
Message-Id: <20190909130453.6718-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190909130453.6718-1-tzimmermann@suse.de>
References: <20190909130453.6718-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

VRAM MM and GEM VRAM buffer objects are only used with each other;
connected via 3 function pointers. Simplifiy this code by making the
memory manager call the rsp. functions from the BOs directly; and
remove the functions from he BO's public interface.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_ttm.c               |   2 +-
 drivers/gpu/drm/bochs/bochs_mm.c            |   3 +-
 drivers/gpu/drm/drm_gem_vram_helper.c       | 119 ++++++--------------
 drivers/gpu/drm/drm_vram_helper_common.c    |   8 +-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c |   2 +-
 drivers/gpu/drm/mgag200/mgag200_ttm.c       |   3 +-
 drivers/gpu/drm/vboxvideo/vbox_ttm.c        |   3 +-
 include/drm/drm_gem_vram_helper.h           |  24 +---
 include/drm/drm_vram_mm_helper.h            |  32 ------
 9 files changed, 44 insertions(+), 152 deletions(-)
 delete mode 100644 include/drm/drm_vram_mm_helper.h

diff --git a/drivers/gpu/drm/ast/ast_ttm.c b/drivers/gpu/drm/ast/ast_ttm.c
index 08ba0a917593..fad34106083a 100644
--- a/drivers/gpu/drm/ast/ast_ttm.c
+++ b/drivers/gpu/drm/ast/ast_ttm.c
@@ -41,7 +41,7 @@ int ast_mm_init(struct ast_private *ast)
 
 	vmm = drm_vram_helper_alloc_mm(
 		dev, pci_resource_start(dev->pdev, 0),
-		ast->vram_size, &drm_gem_vram_mm_funcs);
+		ast->vram_size);
 	if (IS_ERR(vmm)) {
 		ret = PTR_ERR(vmm);
 		DRM_ERROR("Error initializing VRAM MM; %d\n", ret);
diff --git a/drivers/gpu/drm/bochs/bochs_mm.c b/drivers/gpu/drm/bochs/bochs_mm.c
index 8f9bb886f7ad..1b74f530b07c 100644
--- a/drivers/gpu/drm/bochs/bochs_mm.c
+++ b/drivers/gpu/drm/bochs/bochs_mm.c
@@ -11,8 +11,7 @@ int bochs_mm_init(struct bochs_device *bochs)
 	struct drm_vram_mm *vmm;
 
 	vmm = drm_vram_helper_alloc_mm(bochs->dev, bochs->fb_base,
-				       bochs->fb_size,
-				       &drm_gem_vram_mm_funcs);
+				       bochs->fb_size);
 	return PTR_ERR_OR_ZERO(vmm);
 }
 
diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index 202f74453580..ed1ffbec5d02 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -5,7 +5,6 @@
 #include <drm/drm_file.h>
 #include <drm/drm_mode.h>
 #include <drm/drm_prime.h>
-#include <drm/drm_vram_mm_helper.h>
 #include <drm/ttm/ttm_page_alloc.h>
 
 static const struct drm_gem_object_funcs drm_gem_vram_object_funcs;
@@ -462,68 +461,25 @@ static bool drm_is_gem_vram(struct ttm_buffer_object *bo)
 	return (bo->destroy == ttm_buffer_object_destroy);
 }
 
-/**
- * drm_gem_vram_bo_driver_evict_flags() - \
-	Implements &struct ttm_bo_driver.evict_flags
- * @bo:	TTM buffer object. Refers to &struct drm_gem_vram_object.bo
- * @pl:	TTM placement information.
- */
-void drm_gem_vram_bo_driver_evict_flags(struct ttm_buffer_object *bo,
-					struct ttm_placement *pl)
+static void drm_gem_vram_bo_driver_evict_flags(struct drm_gem_vram_object *gbo,
+					       struct ttm_placement *pl)
 {
-	struct drm_gem_vram_object *gbo;
-
-	/* TTM may pass BOs that are not GEM VRAM BOs. */
-	if (!drm_is_gem_vram(bo))
-		return;
-
-	gbo = drm_gem_vram_of_bo(bo);
 	drm_gem_vram_placement(gbo, TTM_PL_FLAG_SYSTEM);
 	*pl = gbo->placement;
 }
-EXPORT_SYMBOL(drm_gem_vram_bo_driver_evict_flags);
 
-/**
- * drm_gem_vram_bo_driver_verify_access() - \
-	Implements &struct ttm_bo_driver.verify_access
- * @bo:		TTM buffer object. Refers to &struct drm_gem_vram_object.bo
- * @filp:	File pointer.
- *
- * Returns:
- * 0 on success, or
- * a negative errno code otherwise.
- */
-int drm_gem_vram_bo_driver_verify_access(struct ttm_buffer_object *bo,
-					 struct file *filp)
+static int drm_gem_vram_bo_driver_verify_access(struct drm_gem_vram_object *gbo,
+						struct file *filp)
 {
-	struct drm_gem_vram_object *gbo = drm_gem_vram_of_bo(bo);
-
 	return drm_vma_node_verify_access(&gbo->bo.base.vma_node,
 					  filp->private_data);
 }
-EXPORT_SYMBOL(drm_gem_vram_bo_driver_verify_access);
 
-/**
- * drm_gem_vram_bo_driver_move_notify() -
- *	Implements &struct ttm_bo_driver.move_notify
- * @bo:		TTM buffer object. Refers to &struct drm_gem_vram_object.bo
- * @evict:	True, if the BO is being evicted from graphics memory;
- *		false otherwise.
- * @new_mem:	New memory region, or NULL on destruction
- */
-void drm_gem_vram_bo_driver_move_notify(struct ttm_buffer_object *bo,
-					bool evict,
-					struct ttm_mem_reg *new_mem)
+static void drm_gem_vram_bo_driver_move_notify(struct drm_gem_vram_object *gbo,
+					       bool evict,
+					       struct ttm_mem_reg *new_mem)
 {
-	struct drm_gem_vram_object *gbo;
-	struct ttm_bo_kmap_obj *kmap;
-
-	/* TTM may pass BOs that are not GEM VRAM BOs. */
-	if (!drm_is_gem_vram(bo))
-		return;
-
-	gbo = drm_gem_vram_of_bo(bo);
-	kmap = &gbo->kmap;
+	struct ttm_bo_kmap_obj *kmap = &gbo->kmap;
 
 	if (WARN_ON_ONCE(gbo->kmap_use_count))
 		return;
@@ -533,21 +489,6 @@ void drm_gem_vram_bo_driver_move_notify(struct ttm_buffer_object *bo,
 	ttm_bo_kunmap(kmap);
 	kmap->virtual = NULL;
 }
-EXPORT_SYMBOL(drm_gem_vram_bo_driver_move_notify);
-
-/*
- * drm_gem_vram_mm_funcs - Functions for &struct drm_vram_mm
- *
- * Most users of @struct drm_gem_vram_object will also use
- * @struct drm_vram_mm. This instance of &struct drm_vram_mm_funcs
- * can be used to connect both.
- */
-const struct drm_vram_mm_funcs drm_gem_vram_mm_funcs = {
-	.evict_flags = drm_gem_vram_bo_driver_evict_flags,
-	.verify_access = drm_gem_vram_bo_driver_verify_access,
-	.move_notify = drm_gem_vram_bo_driver_move_notify,
-};
-EXPORT_SYMBOL(drm_gem_vram_mm_funcs);
 
 /*
  * Helpers for struct drm_gem_object_funcs
@@ -812,31 +753,44 @@ static int bo_driver_init_mem_type(struct ttm_bo_device *bdev, uint32_t type,
 static void bo_driver_evict_flags(struct ttm_buffer_object *bo,
 				  struct ttm_placement *placement)
 {
-	struct drm_vram_mm *vmm = drm_vram_mm_of_bdev(bo->bdev);
+	struct drm_gem_vram_object *gbo;
 
-	if (vmm->funcs && vmm->funcs->evict_flags)
-		vmm->funcs->evict_flags(bo, placement);
+	/* TTM may pass BOs that are not GEM VRAM BOs. */
+	if (!drm_is_gem_vram(bo))
+		return;
+
+	gbo = drm_gem_vram_of_bo(bo);
+
+	drm_gem_vram_bo_driver_evict_flags(gbo, placement);
 }
 
 static int bo_driver_verify_access(struct ttm_buffer_object *bo,
 				   struct file *filp)
 {
-	struct drm_vram_mm *vmm = drm_vram_mm_of_bdev(bo->bdev);
+	struct drm_gem_vram_object *gbo;
 
-	if (!vmm->funcs || !vmm->funcs->verify_access)
-		return 0;
-	return vmm->funcs->verify_access(bo, filp);
+	/* TTM may pass BOs that are not GEM VRAM BOs. */
+	if (!drm_is_gem_vram(bo))
+		return -EINVAL;
+
+	gbo = drm_gem_vram_of_bo(bo);
+
+	return drm_gem_vram_bo_driver_verify_access(gbo, filp);
 }
 
 static void bo_driver_move_notify(struct ttm_buffer_object *bo,
 				  bool evict,
 				  struct ttm_mem_reg *new_mem)
 {
-	struct drm_vram_mm *vmm = drm_vram_mm_of_bdev(bo->bdev);
+	struct drm_gem_vram_object *gbo;
 
-	if (!vmm->funcs || !vmm->funcs->move_notify)
+	/* TTM may pass BOs that are not GEM VRAM BOs. */
+	if (!drm_is_gem_vram(bo))
 		return;
-	vmm->funcs->move_notify(bo, evict, new_mem);
+
+	gbo = drm_gem_vram_of_bo(bo);
+
+	drm_gem_vram_bo_driver_move_notify(gbo, evict, new_mem);
 }
 
 static int bo_driver_io_mem_reserve(struct ttm_bo_device *bdev,
@@ -896,21 +850,18 @@ static struct ttm_bo_driver bo_driver = {
  * @dev:	the DRM device
  * @vram_base:	the base address of the video memory
  * @vram_size:	the size of the video memory in bytes
- * @funcs:	callback functions for buffer objects
  *
  * Returns:
  * 0 on success, or
  * a negative error code otherwise.
  */
 int drm_vram_mm_init(struct drm_vram_mm *vmm, struct drm_device *dev,
-		     uint64_t vram_base, size_t vram_size,
-		     const struct drm_vram_mm_funcs *funcs)
+		     uint64_t vram_base, size_t vram_size)
 {
 	int ret;
 
 	vmm->vram_base = vram_base;
 	vmm->vram_size = vram_size;
-	vmm->funcs = funcs;
 
 	ret = ttm_bo_device_init(&vmm->bdev, &bo_driver,
 				 dev->anon_inode->i_mapping,
@@ -963,15 +914,13 @@ EXPORT_SYMBOL(drm_vram_mm_mmap);
  * @dev:	the DRM device
  * @vram_base:	the base address of the video memory
  * @vram_size:	the size of the video memory in bytes
- * @funcs:	callback functions for buffer objects
  *
  * Returns:
  * The new instance of &struct drm_vram_mm on success, or
  * an ERR_PTR()-encoded errno code otherwise.
  */
 struct drm_vram_mm *drm_vram_helper_alloc_mm(
-	struct drm_device *dev, uint64_t vram_base, size_t vram_size,
-	const struct drm_vram_mm_funcs *funcs)
+	struct drm_device *dev, uint64_t vram_base, size_t vram_size)
 {
 	int ret;
 
@@ -982,7 +931,7 @@ struct drm_vram_mm *drm_vram_helper_alloc_mm(
 	if (!dev->vram_mm)
 		return ERR_PTR(-ENOMEM);
 
-	ret = drm_vram_mm_init(dev->vram_mm, dev, vram_base, vram_size, funcs);
+	ret = drm_vram_mm_init(dev->vram_mm, dev, vram_base, vram_size);
 	if (ret)
 		goto err_kfree;
 
diff --git a/drivers/gpu/drm/drm_vram_helper_common.c b/drivers/gpu/drm/drm_vram_helper_common.c
index e9c9f9a80ba3..2000d9b33fd5 100644
--- a/drivers/gpu/drm/drm_vram_helper_common.c
+++ b/drivers/gpu/drm/drm_vram_helper_common.c
@@ -7,9 +7,8 @@
  *
  * This library provides &struct drm_gem_vram_object (GEM VRAM), a GEM
  * buffer object that is backed by video RAM. It can be used for
- * framebuffer devices with dedicated memory. The video RAM can be
- * managed with &struct drm_vram_mm (VRAM MM). Both data structures are
- * supposed to be used together, but can also be used individually.
+ * framebuffer devices with dedicated memory. The video RAM is managed
+ * by &struct drm_vram_mm (VRAM MM).
  *
  * With the GEM interface userspace applications create, manage and destroy
  * graphics buffers, such as an on-screen framebuffer. GEM does not provide
@@ -50,8 +49,7 @@
  *		// setup device, vram base and size
  *		// ...
  *
- *		ret = drm_vram_helper_alloc_mm(dev, vram_base, vram_size,
- *					       &drm_gem_vram_mm_funcs);
+ *		ret = drm_vram_helper_alloc_mm(dev, vram_base, vram_size);
  *		if (ret)
  *			return ret;
  *		return 0;
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c
index 5d52cd748603..21b684eab5c9 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c
@@ -28,7 +28,7 @@ int hibmc_mm_init(struct hibmc_drm_private *hibmc)
 
 	vmm = drm_vram_helper_alloc_mm(dev,
 				       pci_resource_start(dev->pdev, 0),
-				       hibmc->fb_size, &drm_gem_vram_mm_funcs);
+				       hibmc->fb_size);
 	if (IS_ERR(vmm)) {
 		ret = PTR_ERR(vmm);
 		DRM_ERROR("Error initializing VRAM MM; %d\n", ret);
diff --git a/drivers/gpu/drm/mgag200/mgag200_ttm.c b/drivers/gpu/drm/mgag200/mgag200_ttm.c
index 73a6b848601c..69c81ebf3745 100644
--- a/drivers/gpu/drm/mgag200/mgag200_ttm.c
+++ b/drivers/gpu/drm/mgag200/mgag200_ttm.c
@@ -37,8 +37,7 @@ int mgag200_mm_init(struct mga_device *mdev)
 	struct drm_device *dev = mdev->dev;
 
 	vmm = drm_vram_helper_alloc_mm(dev, pci_resource_start(dev->pdev, 0),
-				       mdev->mc.vram_size,
-				       &drm_gem_vram_mm_funcs);
+				       mdev->mc.vram_size);
 	if (IS_ERR(vmm)) {
 		ret = PTR_ERR(vmm);
 		DRM_ERROR("Error initializing VRAM MM; %d\n", ret);
diff --git a/drivers/gpu/drm/vboxvideo/vbox_ttm.c b/drivers/gpu/drm/vboxvideo/vbox_ttm.c
index b82595a9ed0f..976423d0c3cc 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_ttm.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_ttm.c
@@ -17,8 +17,7 @@ int vbox_mm_init(struct vbox_private *vbox)
 	struct drm_device *dev = &vbox->ddev;
 
 	vmm = drm_vram_helper_alloc_mm(dev, pci_resource_start(dev->pdev, 0),
-				       vbox->available_vram_size,
-				       &drm_gem_vram_mm_funcs);
+				       vbox->available_vram_size);
 	if (IS_ERR(vmm)) {
 		ret = PTR_ERR(vmm);
 		DRM_ERROR("Error initializing VRAM MM; %d\n", ret);
diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vram_helper.h
index af7450851c09..52e3f2aff490 100644
--- a/include/drm/drm_gem_vram_helper.h
+++ b/include/drm/drm_gem_vram_helper.h
@@ -109,22 +109,6 @@ int drm_gem_vram_fill_create_dumb(struct drm_file *file,
 				  bool interruptible,
 				  struct drm_mode_create_dumb *args);
 
-/*
- * Helpers for struct ttm_bo_driver
- */
-
-void drm_gem_vram_bo_driver_evict_flags(struct ttm_buffer_object *bo,
-					struct ttm_placement *pl);
-
-void drm_gem_vram_bo_driver_move_notify(struct ttm_buffer_object *bo,
-					bool evict,
-					struct ttm_mem_reg *new_mem);
-
-int drm_gem_vram_bo_driver_verify_access(struct ttm_buffer_object *bo,
-					 struct file *filp);
-
-extern const struct drm_vram_mm_funcs drm_gem_vram_mm_funcs;
-
 /*
  * Helpers for struct drm_driver
  */
@@ -169,8 +153,6 @@ struct drm_vram_mm {
 	size_t vram_size;
 
 	struct ttm_bo_device bdev;
-
-	const struct drm_vram_mm_funcs *funcs;
 };
 
 /**
@@ -188,8 +170,7 @@ static inline struct drm_vram_mm *drm_vram_mm_of_bdev(
 }
 
 int drm_vram_mm_init(struct drm_vram_mm *vmm, struct drm_device *dev,
-		     uint64_t vram_base, size_t vram_size,
-		     const struct drm_vram_mm_funcs *funcs);
+		     uint64_t vram_base, size_t vram_size);
 void drm_vram_mm_cleanup(struct drm_vram_mm *vmm);
 
 int drm_vram_mm_mmap(struct file *filp, struct vm_area_struct *vma,
@@ -200,8 +181,7 @@ int drm_vram_mm_mmap(struct file *filp, struct vm_area_struct *vma,
  */
 
 struct drm_vram_mm *drm_vram_helper_alloc_mm(
-	struct drm_device *dev, uint64_t vram_base, size_t vram_size,
-	const struct drm_vram_mm_funcs *funcs);
+	struct drm_device *dev, uint64_t vram_base, size_t vram_size);
 void drm_vram_helper_release_mm(struct drm_device *dev);
 
 /*
diff --git a/include/drm/drm_vram_mm_helper.h b/include/drm/drm_vram_mm_helper.h
deleted file mode 100644
index e3b79e13e106..000000000000
--- a/include/drm/drm_vram_mm_helper.h
+++ /dev/null
@@ -1,32 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-
-#ifndef DRM_VRAM_MM_HELPER_H
-#define DRM_VRAM_MM_HELPER_H
-
-#include <drm/drm_file.h>
-#include <drm/drm_ioctl.h>
-#include <drm/ttm/ttm_bo_driver.h>
-
-struct drm_device;
-
-/**
- * struct drm_vram_mm_funcs - Callback functions for &struct drm_vram_mm
- * @evict_flags:	Provides an implementation for struct \
-	&ttm_bo_driver.evict_flags
- * @verify_access:	Provides an implementation for \
-	struct &ttm_bo_driver.verify_access
- * @move_notify:	Provides an implementation for
- *			struct &ttm_bo_driver.move_notify
- *
- * These callback function integrate VRAM MM with TTM buffer objects. New
- * functions can be added if necessary.
- */
-struct drm_vram_mm_funcs {
-	void (*evict_flags)(struct ttm_buffer_object *bo,
-			    struct ttm_placement *placement);
-	int (*verify_access)(struct ttm_buffer_object *bo, struct file *filp);
-	void (*move_notify)(struct ttm_buffer_object *bo, bool evict,
-			    struct ttm_mem_reg *new_mem);
-};
-
-#endif
-- 
2.23.0

