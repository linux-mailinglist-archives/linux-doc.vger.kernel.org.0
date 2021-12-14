Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5295047388E
	for <lists+linux-doc@lfdr.de>; Tue, 14 Dec 2021 00:30:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242469AbhLMXak (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 13 Dec 2021 18:30:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242230AbhLMXaj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 13 Dec 2021 18:30:39 -0500
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BEEDC061574
        for <linux-doc@vger.kernel.org>; Mon, 13 Dec 2021 15:30:39 -0800 (PST)
Received: from localhost.localdomain (unknown [88.120.44.86])
        by smtp5-g21.free.fr (Postfix) with ESMTP id BFA0A5FF95;
        Tue, 14 Dec 2021 00:30:36 +0100 (CET)
From:   Yann Dirson <ydirson@free.fr>
To:     amd-gfx@lists.freedesktop.org
Cc:     Alex Deucher <alexander.deucher@amd.com>,
        Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
        linux-doc@vger.kernel.org, Yann Dirson <ydirson@free.fr>
Subject: [PATCH v3 4/4] amdgpu: fix some comment typos
Date:   Tue, 14 Dec 2021 00:30:30 +0100
Message-Id: <20211213233030.6719-5-ydirson@free.fr>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211213233030.6719-1-ydirson@free.fr>
References: <20211213233030.6719-1-ydirson@free.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Signed-off-by: Yann Dirson <ydirson@free.fr>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 2 +-
 drivers/gpu/drm/amd/amdgpu/soc15.c     | 2 +-
 include/uapi/drm/amdgpu_drm.h          | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 0e7dc23f78e7..b23cb463b106 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -53,7 +53,7 @@
  * can be mapped as snooped (cached system pages) or unsnooped
  * (uncached system pages).
  * Each VM has an ID associated with it and there is a page table
- * associated with each VMID.  When execting a command buffer,
+ * associated with each VMID.  When executing a command buffer,
  * the kernel tells the the ring what VMID to use for that command
  * buffer.  VMIDs are allocated dynamically as commands are submitted.
  * The userspace drivers maintain their own address space and the kernel
diff --git a/drivers/gpu/drm/amd/amdgpu/soc15.c b/drivers/gpu/drm/amd/amdgpu/soc15.c
index a06c4944ed37..0fc1747e4a70 100644
--- a/drivers/gpu/drm/amd/amdgpu/soc15.c
+++ b/drivers/gpu/drm/amd/amdgpu/soc15.c
@@ -744,7 +744,7 @@ static void soc15_reg_base_init(struct amdgpu_device *adev)
 		vega10_reg_base_init(adev);
 		break;
 	case CHIP_RENOIR:
-		/* It's safe to do ip discovery here for Renior,
+		/* It's safe to do ip discovery here for Renoir,
 		 * it doesn't support SRIOV. */
 		if (amdgpu_discovery) {
 			r = amdgpu_discovery_reg_base_init(adev);
diff --git a/include/uapi/drm/amdgpu_drm.h b/include/uapi/drm/amdgpu_drm.h
index 26e45fc5eb1a..0b94ec7b73e7 100644
--- a/include/uapi/drm/amdgpu_drm.h
+++ b/include/uapi/drm/amdgpu_drm.h
@@ -80,7 +80,7 @@ extern "C" {
  *
  * %AMDGPU_GEM_DOMAIN_GTT	GPU accessible system memory, mapped into the
  * GPU's virtual address space via gart. Gart memory linearizes non-contiguous
- * pages of system memory, allows GPU access system memory in a linezrized
+ * pages of system memory, allows GPU access system memory in a linearized
  * fashion.
  *
  * %AMDGPU_GEM_DOMAIN_VRAM	Local video memory. For APUs, it is memory
-- 
2.31.1

