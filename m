Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FBB3AFB1B
	for <lists+linux-doc@lfdr.de>; Wed, 11 Sep 2019 13:09:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726781AbfIKLJV (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 11 Sep 2019 07:09:21 -0400
Received: from mx2.suse.de ([195.135.220.15]:33756 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727422AbfIKLJV (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 11 Sep 2019 07:09:21 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 36E16AF84;
        Wed, 11 Sep 2019 11:09:19 +0000 (UTC)
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     daniel@ffwll.ch, kraxel@redhat.com, airlied@linux.ie,
        corbet@lwn.net, z.liuxinliang@hisilicon.com, zourongrong@gmail.com,
        kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
        hdegoede@redhat.com, sam@ravnborg.org, yc_chen@aspeedtech.com
Cc:     dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 3/4] drm/vram: Unexport internal functions of VRAM MM
Date:   Wed, 11 Sep 2019 13:09:09 +0200
Message-Id: <20190911110910.30698-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190911110910.30698-1-tzimmermann@suse.de>
References: <20190911110910.30698-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The init, cleanup and mmap functions of VRAM MM are only used internally.
Remove them from the public interface.

v2:
	* update for debugfs support

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/drm_gem_vram_helper.c | 38 ++++-----------------------
 include/drm/drm_gem_vram_helper.h     |  6 -----
 2 files changed, 5 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index c87fed608ffa..1a05e2a97b93 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -889,19 +889,8 @@ int drm_vram_mm_debugfs_init(struct drm_minor *minor)
 }
 EXPORT_SYMBOL(drm_vram_mm_debugfs_init);
 
-/**
- * drm_vram_mm_init() - Initialize an instance of VRAM MM.
- * @vmm:	the VRAM MM instance to initialize
- * @dev:	the DRM device
- * @vram_base:	the base address of the video memory
- * @vram_size:	the size of the video memory in bytes
- *
- * Returns:
- * 0 on success, or
- * a negative error code otherwise.
- */
-int drm_vram_mm_init(struct drm_vram_mm *vmm, struct drm_device *dev,
-		     uint64_t vram_base, size_t vram_size)
+static int drm_vram_mm_init(struct drm_vram_mm *vmm, struct drm_device *dev,
+			    uint64_t vram_base, size_t vram_size)
 {
 	int ret;
 
@@ -920,34 +909,17 @@ int drm_vram_mm_init(struct drm_vram_mm *vmm, struct drm_device *dev,
 
 	return 0;
 }
-EXPORT_SYMBOL(drm_vram_mm_init);
 
-/**
- * drm_vram_mm_cleanup() - Cleans up an initialized instance of VRAM MM.
- * @vmm:	the VRAM MM instance to clean up
- */
-void drm_vram_mm_cleanup(struct drm_vram_mm *vmm)
+static void drm_vram_mm_cleanup(struct drm_vram_mm *vmm)
 {
 	ttm_bo_device_release(&vmm->bdev);
 }
-EXPORT_SYMBOL(drm_vram_mm_cleanup);
 
-/**
- * drm_vram_mm_mmap() - Helper for implementing &struct file_operations.mmap()
- * @filp:	the mapping's file structure
- * @vma:	the mapping's memory area
- * @vmm:	the VRAM MM instance
- *
- * Returns:
- * 0 on success, or
- * a negative error code otherwise.
- */
-int drm_vram_mm_mmap(struct file *filp, struct vm_area_struct *vma,
-		     struct drm_vram_mm *vmm)
+static int drm_vram_mm_mmap(struct file *filp, struct vm_area_struct *vma,
+			    struct drm_vram_mm *vmm)
 {
 	return ttm_bo_mmap(filp, vma, &vmm->bdev);
 }
-EXPORT_SYMBOL(drm_vram_mm_mmap);
 
 /*
  * Helpers for integration with struct drm_device
diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vram_helper.h
index fd978e0c9542..9aaef4f8c327 100644
--- a/include/drm/drm_gem_vram_helper.h
+++ b/include/drm/drm_gem_vram_helper.h
@@ -171,12 +171,6 @@ static inline struct drm_vram_mm *drm_vram_mm_of_bdev(
 }
 
 int drm_vram_mm_debugfs_init(struct drm_minor *minor);
-int drm_vram_mm_init(struct drm_vram_mm *vmm, struct drm_device *dev,
-		     uint64_t vram_base, size_t vram_size);
-void drm_vram_mm_cleanup(struct drm_vram_mm *vmm);
-
-int drm_vram_mm_mmap(struct file *filp, struct vm_area_struct *vma,
-		     struct drm_vram_mm *vmm);
 
 /*
  * Helpers for integration with struct drm_device
-- 
2.23.0

