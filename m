Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B8DC47388B
	for <lists+linux-doc@lfdr.de>; Tue, 14 Dec 2021 00:30:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242103AbhLMXai (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 13 Dec 2021 18:30:38 -0500
Received: from smtp5-g21.free.fr ([212.27.42.5]:16930 "EHLO smtp5-g21.free.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242095AbhLMXah (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 13 Dec 2021 18:30:37 -0500
Received: from localhost.localdomain (unknown [88.120.44.86])
        by smtp5-g21.free.fr (Postfix) with ESMTP id B2A2C5FF93;
        Tue, 14 Dec 2021 00:30:36 +0100 (CET)
From:   Yann Dirson <ydirson@free.fr>
To:     amd-gfx@lists.freedesktop.org
Cc:     Alex Deucher <alexander.deucher@amd.com>,
        Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
        linux-doc@vger.kernel.org, Yann Dirson <ydirson@free.fr>
Subject: [PATCH v3 3/4] amdgpu: fix some kernel-doc markup
Date:   Tue, 14 Dec 2021 00:30:29 +0100
Message-Id: <20211213233030.6719-4-ydirson@free.fr>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211213233030.6719-1-ydirson@free.fr>
References: <20211213233030.6719-1-ydirson@free.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Those are not today pulled by the sphinx doc, but better be ready.

Signed-off-by: Yann Dirson <ydirson@free.fr>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c        | 6 +++---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 4224be241338..155215c7b7dc 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -551,11 +551,11 @@ void amdgpu_device_wreg(struct amdgpu_device *adev,
 	trace_amdgpu_device_wreg(adev->pdev->device, reg, v);
 }
 
-/*
+/**
  * amdgpu_mm_wreg_mmio_rlc -  write register either with mmio or with RLC path if in range
  *
  * this function is invoked only the debugfs register access
- * */
+ */
 void amdgpu_mm_wreg_mmio_rlc(struct amdgpu_device *adev,
 			     uint32_t reg, uint32_t v)
 {
@@ -1101,7 +1101,7 @@ static void amdgpu_device_wb_fini(struct amdgpu_device *adev)
 }
 
 /**
- * amdgpu_device_wb_init- Init Writeback driver info and allocate memory
+ * amdgpu_device_wb_init - Init Writeback driver info and allocate memory
  *
  * @adev: amdgpu_device pointer
  *
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index e65214db904c..18335b6154fa 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -624,7 +624,7 @@ static void dm_dcn_vertical_interrupt0_high_irq(void *interrupt_params)
 #endif /* CONFIG_DRM_AMD_SECURE_DISPLAY */
 
 /**
- * dmub_aux_setconfig_reply_callback - Callback for AUX or SET_CONFIG command.
+ * dmub_aux_setconfig_callback - Callback for AUX or SET_CONFIG command.
  * @adev: amdgpu_device pointer
  * @notify: dmub notification structure
  *
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index bb65f41d1a59..c98e402eab0c 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -50,9 +50,9 @@
 
 #define AMDGPU_DMUB_NOTIFICATION_MAX 5
 
-/**
+/*
  * DMUB Async to Sync Mechanism Status
- **/
+ */
 #define DMUB_ASYNC_TO_SYNC_ACCESS_FAIL 1
 #define DMUB_ASYNC_TO_SYNC_ACCESS_TIMEOUT 2
 #define DMUB_ASYNC_TO_SYNC_ACCESS_SUCCESS 3
-- 
2.31.1

