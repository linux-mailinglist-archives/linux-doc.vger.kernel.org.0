Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37113702FD8
	for <lists+linux-doc@lfdr.de>; Mon, 15 May 2023 16:31:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241508AbjEOObS (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 15 May 2023 10:31:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241549AbjEOObK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 15 May 2023 10:31:10 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BE1230E1;
        Mon, 15 May 2023 07:31:00 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1aad5245632so91353845ad.3;
        Mon, 15 May 2023 07:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684161059; x=1686753059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I9CjL0Fz9cdjrYojcQZBZLwYXaiNihqTcbd8qG9seGA=;
        b=dgtUxZeVXB995aTs+oGdCgBpO+sm9tG5yeOT96p+XwYDxLx2/bbDv/Lp4pxSQ6yZuo
         F6eUBWuS3ktsKAPcm+61eILC7m/P09QJSdHY8XB4SCKcmoy5GBfDPF4jReACnoF22cJj
         4FOMf1pjQurmq/eEGa9aKe6jPvWpbbpuUaTyLlBaDpoqnHwe9JzVn5uKz/V6K6was21H
         kWiqTTGqgLPzrB+bLxcspYw9QvhAdhj4uLtoPjf2dNNY7qGpjcMSWjDmtewdZR9sXf52
         K57sodEWgPPCYnc3Co6sE4lq+o/BI/bm8EYtgRVPKAr5GABRu4G1k8DlwJVPPABPiF2a
         icbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684161059; x=1686753059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I9CjL0Fz9cdjrYojcQZBZLwYXaiNihqTcbd8qG9seGA=;
        b=YCMRhQTe15H8bBjOuC39CSkHHpV24tGXyWmWm3JFUnh2FniCto9QqU+7RCpCZvq374
         opsdCq5X5pqi2/dgBx5weev2UrG1CzTXemp4Y+ArpXuXFJIr0oxMzm0O2yW+oBuS1hX/
         wCx41sOd6neEkWj13cNC1wi0YHE4tFMt+ziyOgP7YQ6dGtsl9XEQrJTgcEPpUgs2zajj
         Y2hOAMh3fGsKc2jDmKc0W7Muj3N7v43KG5YebVRFwztL92blhEXbj6/S+z6xGWSzIZ/+
         YRQcDhGRT9AgR9kH2lrmTbGP/tYjpfp+JoYC98XsSFCUvJaahGq73+6Wv9GYmykZaXUS
         4+Jw==
X-Gm-Message-State: AC+VfDxytHdyOEsFpECwD0S7yUInYuPGSQZp6pwWeRvbDw7Ct8WGT+OG
        ThcCgbO83Rq5Ff0vG4yEW+E=
X-Google-Smtp-Source: ACHHUZ6FzYOsMsVGCB45TdZ+LSnw5dZKVjNgPSdXbnfw7jIRmFN4CK/sFLfySLGXFSHX/uzPyHSbqA==
X-Received: by 2002:a17:902:a516:b0:1ab:1355:1a45 with SMTP id s22-20020a170902a51600b001ab13551a45mr32077289plq.30.1684161058891;
        Mon, 15 May 2023 07:30:58 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
        by smtp.gmail.com with ESMTPSA id d23-20020a170902729700b001a216d44440sm13607640pll.200.2023.05.15.07.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 May 2023 07:30:58 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Christopher Healy <healych@amazon.com>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Rob Clark <robdclark@chromium.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org (open list:DOCUMENTATION),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 5/9] drm: Add fdinfo memory stats
Date:   Mon, 15 May 2023 07:30:12 -0700
Message-Id: <20230515143023.801167-6-robdclark@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230515143023.801167-1-robdclark@gmail.com>
References: <20230515143023.801167-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Add support to dump GEM stats to fdinfo.

v2: Fix typos, change size units to match docs, use div_u64
v3: Do it in core
v4: more kerneldoc
v5: doc fixes
v6: Actually use u64, bit more comment docs

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Acked-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 Documentation/gpu/drm-usage-stats.rst | 54 +++++++++++----
 drivers/gpu/drm/drm_file.c            | 99 ++++++++++++++++++++++++++-
 include/drm/drm_file.h                | 28 ++++++++
 include/drm/drm_gem.h                 | 32 +++++++++
 4 files changed, 200 insertions(+), 13 deletions(-)

diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
index 552195fb1ea3..d012eb56885e 100644
--- a/Documentation/gpu/drm-usage-stats.rst
+++ b/Documentation/gpu/drm-usage-stats.rst
@@ -45,37 +45,43 @@ Mandatory fully standardised keys
 ---------------------------------
 
 - drm-driver: <str>
 
 String shall contain the name this driver registered as via the respective
 `struct drm_driver` data structure.
 
 Optional fully standardised keys
 --------------------------------
 
+Identification
+^^^^^^^^^^^^^^
+
 - drm-pdev: <aaaa:bb.cc.d>
 
 For PCI devices this should contain the PCI slot address of the device in
 question.
 
 - drm-client-id: <uint>
 
 Unique value relating to the open DRM file descriptor used to distinguish
 duplicated and shared file descriptors. Conceptually the value should map 1:1
 to the in kernel representation of `struct drm_file` instances.
 
 Uniqueness of the value shall be either globally unique, or unique within the
 scope of each device, in which case `drm-pdev` shall be present as well.
 
 Userspace should make sure to not double account any usage statistics by using
 the above described criteria in order to associate data to individual clients.
 
+Utilization
+^^^^^^^^^^^
+
 - drm-engine-<str>: <uint> ns
 
 GPUs usually contain multiple execution engines. Each shall be given a stable
 and unique name (str), with possible values documented in the driver specific
 documentation.
 
 Value shall be in specified time units which the respective GPU engine spent
 busy executing workloads belonging to this client.
 
 Values are not required to be constantly monotonic if it makes the driver
@@ -86,32 +92,20 @@ value until a monotonic update is seen.
 
 - drm-engine-capacity-<str>: <uint>
 
 Engine identifier string must be the same as the one specified in the
 drm-engine-<str> tag and shall contain a greater than zero number in case the
 exported engine corresponds to a group of identical hardware engines.
 
 In the absence of this tag parser shall assume capacity of one. Zero capacity
 is not allowed.
 
-- drm-memory-<str>: <uint> [KiB|MiB]
-
-Each possible memory type which can be used to store buffer objects by the
-GPU in question shall be given a stable and unique name to be returned as the
-string here.
-
-Value shall reflect the amount of storage currently consumed by the buffer
-object belong to this client, in the respective memory region.
-
-Default unit shall be bytes with optional unit specifiers of 'KiB' or 'MiB'
-indicating kibi- or mebi-bytes.
-
 - drm-cycles-<str>: <uint>
 
 Engine identifier string must be the same as the one specified in the
 drm-engine-<str> tag and shall contain the number of busy cycles for the given
 engine.
 
 Values are not required to be constantly monotonic if it makes the driver
 implementation easier, but are required to catch up with the previously reported
 larger value within a reasonable period. Upon observing a value lower than what
 was previously read, userspace is expected to stay with that larger previous
@@ -119,20 +113,56 @@ value until a monotonic update is seen.
 
 - drm-maxfreq-<str>: <uint> [Hz|MHz|KHz]
 
 Engine identifier string must be the same as the one specified in the
 drm-engine-<str> tag and shall contain the maximum frequency for the given
 engine.  Taken together with drm-cycles-<str>, this can be used to calculate
 percentage utilization of the engine, whereas drm-engine-<str> only reflects
 time active without considering what frequency the engine is operating as a
 percentage of it's maximum frequency.
 
+Memory
+^^^^^^
+
+- drm-memory-<region>: <uint> [KiB|MiB]
+
+Each possible memory type which can be used to store buffer objects by the
+GPU in question shall be given a stable and unique name to be returned as the
+string here.  The name "memory" is reserved to refer to normal system memory.
+
+Value shall reflect the amount of storage currently consumed by the buffer
+objects belong to this client, in the respective memory region.
+
+Default unit shall be bytes with optional unit specifiers of 'KiB' or 'MiB'
+indicating kibi- or mebi-bytes.
+
+- drm-shared-<region>: <uint> [KiB|MiB]
+
+The total size of buffers that are shared with another file (ie. have more
+than a single handle).
+
+- drm-total-<region>: <uint> [KiB|MiB]
+
+The total size of buffers that including shared and private memory.
+
+- drm-resident-<region>: <uint> [KiB|MiB]
+
+The total size of buffers that are resident in the specified region.
+
+- drm-purgeable-<region>: <uint> [KiB|MiB]
+
+The total size of buffers that are purgeable.
+
+- drm-active-<region>: <uint> [KiB|MiB]
+
+The total size of buffers that are active on one or more engines.
+
 Implementation Details
 ======================
 
 Drivers should use drm_show_fdinfo() in their `struct file_operations`, and
 implement &drm_driver.show_fdinfo if they wish to provide any stats which
 are not provided by drm_show_fdinfo().  But even driver specific stats should
 be documented above and where possible, aligned with other drivers.
 
 Driver specific implementations
 -------------------------------
diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index 6d5bdd684ae2..739d9b7ab9ec 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -35,20 +35,21 @@
 #include <linux/dma-fence.h>
 #include <linux/file.h>
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/poll.h>
 #include <linux/slab.h>
 
 #include <drm/drm_client.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
+#include <drm/drm_gem.h>
 #include <drm/drm_print.h>
 
 #include "drm_crtc_internal.h"
 #include "drm_internal.h"
 #include "drm_legacy.h"
 
 /* from BKL pushdown */
 DEFINE_MUTEX(drm_global_mutex);
 
 bool drm_dev_needs_global_mutex(struct drm_device *dev)
@@ -864,23 +865,119 @@ EXPORT_SYMBOL(drm_send_event_locked);
 void drm_send_event(struct drm_device *dev, struct drm_pending_event *e)
 {
 	unsigned long irqflags;
 
 	spin_lock_irqsave(&dev->event_lock, irqflags);
 	drm_send_event_helper(dev, e, 0);
 	spin_unlock_irqrestore(&dev->event_lock, irqflags);
 }
 EXPORT_SYMBOL(drm_send_event);
 
+static void print_size(struct drm_printer *p, const char *stat,
+		       const char *region, u64 sz)
+{
+	const char *units[] = {"", " KiB", " MiB"};
+	unsigned u;
+
+	for (u = 0; u < ARRAY_SIZE(units) - 1; u++) {
+		if (sz < SZ_1K)
+			break;
+		sz = div_u64(sz, SZ_1K);
+	}
+
+	drm_printf(p, "drm-%s-%s:\t%llu%s\n", stat, region, sz, units[u]);
+}
+
+/**
+ * drm_print_memory_stats - A helper to print memory stats
+ * @p: The printer to print output to
+ * @stats: The collected memory stats
+ * @supported_status: Bitmask of optional stats which are available
+ * @region: The memory region
+ *
+ */
+void drm_print_memory_stats(struct drm_printer *p,
+			    const struct drm_memory_stats *stats,
+			    enum drm_gem_object_status supported_status,
+			    const char *region)
+{
+	print_size(p, "total", region, stats->private + stats->shared);
+	print_size(p, "shared", region, stats->shared);
+	print_size(p, "active", region, stats->active);
+
+	if (supported_status & DRM_GEM_OBJECT_RESIDENT)
+		print_size(p, "resident", region, stats->resident);
+
+	if (supported_status & DRM_GEM_OBJECT_PURGEABLE)
+		print_size(p, "purgeable", region, stats->purgeable);
+}
+EXPORT_SYMBOL(drm_print_memory_stats);
+
+/**
+ * drm_show_memory_stats - Helper to collect and show standard fdinfo memory stats
+ * @p: the printer to print output to
+ * @file: the DRM file
+ *
+ * Helper to iterate over GEM objects with a handle allocated in the specified
+ * file.
+ */
+void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file)
+{
+	struct drm_gem_object *obj;
+	struct drm_memory_stats status = {};
+	enum drm_gem_object_status supported_status;
+	int id;
+
+	spin_lock(&file->table_lock);
+	idr_for_each_entry (&file->object_idr, obj, id) {
+		enum drm_gem_object_status s = 0;
+
+		if (obj->funcs && obj->funcs->status) {
+			s = obj->funcs->status(obj);
+			supported_status = DRM_GEM_OBJECT_RESIDENT |
+					DRM_GEM_OBJECT_PURGEABLE;
+		}
+
+		if (obj->handle_count > 1) {
+			status.shared += obj->size;
+		} else {
+			status.private += obj->size;
+		}
+
+		if (s & DRM_GEM_OBJECT_RESIDENT) {
+			status.resident += obj->size;
+		} else {
+			/* If already purged or not yet backed by pages, don't
+			 * count it as purgeable:
+			 */
+			s &= ~DRM_GEM_OBJECT_PURGEABLE;
+		}
+
+		if (!dma_resv_test_signaled(obj->resv, dma_resv_usage_rw(true))) {
+			status.active += obj->size;
+
+			/* If still active, don't count as purgeable: */
+			s &= ~DRM_GEM_OBJECT_PURGEABLE;
+		}
+
+		if (s & DRM_GEM_OBJECT_PURGEABLE)
+			status.purgeable += obj->size;
+	}
+	spin_unlock(&file->table_lock);
+
+	drm_print_memory_stats(p, &status, supported_status, "memory");
+}
+EXPORT_SYMBOL(drm_show_memory_stats);
+
 /**
  * drm_show_fdinfo - helper for drm file fops
- * @seq_file: output stream
+ * @m: output stream
  * @f: the device file instance
  *
  * Helper to implement fdinfo, for userspace to query usage stats, etc, of a
  * process using the GPU.  See also &drm_driver.show_fdinfo.
  *
  * For text output format description please see Documentation/gpu/drm-usage-stats.rst
  */
 void drm_show_fdinfo(struct seq_file *m, struct file *f)
 {
 	struct drm_file *file = f->private_data;
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index 6de6d0e9c634..5f5c156903d2 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -34,20 +34,21 @@
 #include <linux/completion.h>
 #include <linux/idr.h>
 
 #include <uapi/drm/drm.h>
 
 #include <drm/drm_prime.h>
 
 struct dma_fence;
 struct drm_file;
 struct drm_device;
+struct drm_printer;
 struct device;
 struct file;
 
 /*
  * FIXME: Not sure we want to have drm_minor here in the end, but to avoid
  * header include loops we need it here for now.
  */
 
 /* Note that the order of this enum is ABI (it determines
  * /dev/dri/renderD* numbers).
@@ -433,15 +434,42 @@ int drm_event_reserve_init(struct drm_device *dev,
 			   struct drm_file *file_priv,
 			   struct drm_pending_event *p,
 			   struct drm_event *e);
 void drm_event_cancel_free(struct drm_device *dev,
 			   struct drm_pending_event *p);
 void drm_send_event_locked(struct drm_device *dev, struct drm_pending_event *e);
 void drm_send_event(struct drm_device *dev, struct drm_pending_event *e);
 void drm_send_event_timestamp_locked(struct drm_device *dev,
 				     struct drm_pending_event *e,
 				     ktime_t timestamp);
+
+/**
+ * struct drm_memory_stats - GEM object stats associated
+ * @shared: Total size of GEM objects shared between processes
+ * @private: Total size of GEM objects
+ * @resident: Total size of GEM objects backing pages
+ * @purgeable: Total size of GEM objects that can be purged (resident and not active)
+ * @active: Total size of GEM objects active on one or more engines
+ *
+ * Used by drm_print_memory_stats()
+ */
+struct drm_memory_stats {
+	u64 shared;
+	u64 private;
+	u64 resident;
+	u64 purgeable;
+	u64 active;
+};
+
+enum drm_gem_object_status;
+
+void drm_print_memory_stats(struct drm_printer *p,
+			    const struct drm_memory_stats *stats,
+			    enum drm_gem_object_status supported_status,
+			    const char *region);
+
+void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file);
 void drm_show_fdinfo(struct seq_file *m, struct file *f);
 
 struct file *mock_drm_getfile(struct drm_minor *minor, unsigned int flags);
 
 #endif /* _DRM_FILE_H_ */
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index 189fd618ca65..1df035ae7981 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -35,20 +35,39 @@
  */
 
 #include <linux/kref.h>
 #include <linux/dma-resv.h>
 
 #include <drm/drm_vma_manager.h>
 
 struct iosys_map;
 struct drm_gem_object;
 
+/**
+ * enum drm_gem_object_status - bitmask of object state for fdinfo reporting
+ * @DRM_GEM_OBJECT_RESIDENT: object is resident in memory (ie. not unpinned)
+ * @DRM_GEM_OBJECT_PURGEABLE: object marked as purgeable by userspace
+ *
+ * Bitmask of status used for fdinfo memory stats, see &drm_gem_object_funcs.status
+ * and drm_show_fdinfo().  Note that an object can DRM_GEM_OBJECT_PURGEABLE if
+ * it still active or not resident, in which case drm_show_fdinfo() will not
+ * account for it as purgeable.  So drivers do not need to check if the buffer
+ * is idle and resident to return this bit.  (Ie. userspace can mark a buffer
+ * as purgeable even while it is still busy on the GPU.. it does not _actually_
+ * become puregeable until it becomes idle.  The status gem object func does
+ * not need to consider this.)
+ */
+enum drm_gem_object_status {
+	DRM_GEM_OBJECT_RESIDENT  = BIT(0),
+	DRM_GEM_OBJECT_PURGEABLE = BIT(1),
+};
+
 /**
  * struct drm_gem_object_funcs - GEM object functions
  */
 struct drm_gem_object_funcs {
 	/**
 	 * @free:
 	 *
 	 * Deconstructor for drm_gem_objects.
 	 *
 	 * This callback is mandatory.
@@ -167,20 +186,33 @@ struct drm_gem_object_funcs {
 	/**
 	 * @evict:
 	 *
 	 * Evicts gem object out from memory. Used by the drm_gem_object_evict()
 	 * helper. Returns 0 on success, -errno otherwise.
 	 *
 	 * This callback is optional.
 	 */
 	int (*evict)(struct drm_gem_object *obj);
 
+	/**
+	 * @status:
+	 *
+	 * The optional status callback can return additional object state
+	 * which determines which stats the object is counted against.  The
+	 * callback is called under table_lock.  Racing against object status
+	 * change is "harmless", and the callback can expect to not race
+	 * against object destruction.
+	 *
+	 * Called by drm_show_memory_stats().
+	 */
+	enum drm_gem_object_status (*status)(struct drm_gem_object *obj);
+
 	/**
 	 * @vm_ops:
 	 *
 	 * Virtual memory operations used with mmap.
 	 *
 	 * This is optional but necessary for mmap support.
 	 */
 	const struct vm_operations_struct *vm_ops;
 };
 
-- 
2.40.1

