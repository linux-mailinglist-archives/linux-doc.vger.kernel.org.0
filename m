Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 729FF6AB49D
	for <lists+linux-doc@lfdr.de>; Mon,  6 Mar 2023 03:24:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229570AbjCFCYm (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 5 Mar 2023 21:24:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229557AbjCFCYl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 5 Mar 2023 21:24:41 -0500
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com [IPv6:2607:f8b0:4864:20::c2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7FE8C65B;
        Sun,  5 Mar 2023 18:24:39 -0800 (PST)
Received: by mail-oo1-xc2a.google.com with SMTP id c184-20020a4a4fc1000000b005250b2dc0easo1331245oob.2;
        Sun, 05 Mar 2023 18:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678069479;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8eB/UF/tlnbbeXcEuRN7hzjSgFcNNFvN1jX/T+t9+LU=;
        b=WBZs6FLMVU1TdZ4/W6g84EtE99Lh48VXmrZqpDGEv5g+aQStqPVJIgsX++oyq9PvXr
         1NfXSs0P2EXFaR5gWewLUFb9xDMrf5ld7YxJ/q0uER49ybdQ55CvTkTVDEt2VjPCK+Gv
         LNjbe2YaJI1hFwKdB+ynRLlwOrSWlZC9Yn8LC2vbQS79jB0g6Ll8cBnhCizmVYqn7Oko
         kd223JyMRMC9w6F1SWzwqCM3Yvz5tfdnGCOjY5CqcecnJDK2zm+PlWgqusI66q0ADWj1
         0hPbbroAqmeEUAvYMEDTpABJAMGeUfGnCGKsStrF7lEbtqs6+s6/W53Y03P9zTUjxm6o
         LTrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678069479;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8eB/UF/tlnbbeXcEuRN7hzjSgFcNNFvN1jX/T+t9+LU=;
        b=LL+70MHWUUY0jbkmuOQTGRln8lfxnQO/RNfQ0EAHW2cxbyhzEjGxo/XWC3pYjQgyQJ
         +KJkR3efr2Cg1EEAPmziNl/ItqA/6EaqgbeoNuDg0X1AVNR+ECM5mJH+MVwzHZFm+qdS
         nSQdGThSbrN9bruJlSyfhikMwQPzCGoi4lWk8AyFAC5XAq6bpdKA/a8DhWAhqzqqdbuQ
         fxaxRcM2FNMOySVeAu5XZHSLq58CjjPDShzzzDQZ1GkneRRzFPSjy5Mmd6H1qMJREvSx
         gMiTyYTJAheLBfLrNGWQLx+RhqtCgS1/ZfC0ScXwXEYUgYgFXLXMAVn/955OTISvmXoX
         wwuw==
X-Gm-Message-State: AO0yUKW6Lt4LudgTziXJpvDnSrRF0rTDWS79M/M1k/KcvyTOUTNW4hoU
        AuB+0XNQsKpH7kAkPICzPAc=
X-Google-Smtp-Source: AK7set9GAIBy44XY3fRiSMdEnYc7lHYuY37gI0ek4gAaxZ7X+6Kx7JIPTxXFJE0tPhHTrYqjK2lWkg==
X-Received: by 2002:a4a:b149:0:b0:525:4e79:8715 with SMTP id e9-20020a4ab149000000b005254e798715mr4367199ooo.8.1678069479081;
        Sun, 05 Mar 2023 18:24:39 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:63:8ae3:4d1f:9fc2:9fe6:c88e])
        by smtp.gmail.com with ESMTPSA id k124-20020aca3d82000000b00383e12e20c5sm3491557oia.24.2023.03.05.18.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Mar 2023 18:24:38 -0800 (PST)
From:   David Tadokoro <davidbtadokoro@gmail.com>
To:     alexander.deucher@amd.com, christian.koenig@amd.com,
        Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, corbet@lwn.net, harry.wentland@amd.com,
        sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com
Cc:     David Tadokoro <davidbtadokoro@usp.br>,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amd/display: add prefix to amdgpu_dm_plane.h functions
Date:   Sun,  5 Mar 2023 23:24:27 -0300
Message-Id: <20230306022427.437022-1-davidbtadokoro@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_FILL_THIS_FORM_SHORT
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: David Tadokoro <davidbtadokoro@usp.br>

The amdgpu_dm_plane.h functions didn't have names that indicated where
they were declared.

To better filter results in debug tools like ftrace, prefix these
functions with 'amdgpu_dm_plane_'.

Note that we may want to make this same change in other files like
amdgpu_dm_crtc.h.

Signed-off-by: David Tadokoro <davidbtadokoro@usp.br>
---
 .../gpu/amdgpu/display/display-manager.rst    |  2 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 14 ++++++-------
 .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 20 +++++++++----------
 .../amd/display/amdgpu_dm/amdgpu_dm_plane.h   | 12 +++++------
 4 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/Documentation/gpu/amdgpu/display/display-manager.rst b/Documentation/gpu/amdgpu/display/display-manager.rst
index b7abb18cfc82..be2651ecdd7f 100644
--- a/Documentation/gpu/amdgpu/display/display-manager.rst
+++ b/Documentation/gpu/amdgpu/display/display-manager.rst
@@ -173,7 +173,7 @@ The alpha blending equation is configured from DRM to DC interface by the
 following path:
 
 1. When updating a :c:type:`drm_plane_state <drm_plane_state>`, DM calls
-   :c:type:`fill_blending_from_plane_state()` that maps
+   :c:type:`amdgpu_dm_plane_fill_blending_from_plane_state()` that maps
    :c:type:`drm_plane_state <drm_plane_state>` attributes to
    :c:type:`dc_plane_info <dc_plane_info>` struct to be handled in the
    OS-agnostic component (DC).
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 4217ebe6391b..f7111acd45cc 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -2923,7 +2923,7 @@ const struct amdgpu_ip_block_version dm_ip_block =
 
 static const struct drm_mode_config_funcs amdgpu_dm_mode_funcs = {
 	.fb_create = amdgpu_display_user_framebuffer_create,
-	.get_format_info = amd_get_format_info,
+	.get_format_info = amdgpu_dm_plane_get_format_info,
 	.output_poll_changed = drm_fb_helper_output_poll_changed,
 	.atomic_check = amdgpu_dm_atomic_check,
 	.atomic_commit = drm_atomic_helper_commit,
@@ -4948,7 +4948,7 @@ fill_dc_plane_info_and_addr(struct amdgpu_device *adev,
 	if (ret)
 		return ret;
 
-	ret = fill_plane_buffer_attributes(adev, afb, plane_info->format,
+	ret = amdgpu_dm_plane_fill_plane_buffer_attributes(adev, afb, plane_info->format,
 					   plane_info->rotation, tiling_flags,
 					   &plane_info->tiling_info,
 					   &plane_info->plane_size,
@@ -4957,7 +4957,7 @@ fill_dc_plane_info_and_addr(struct amdgpu_device *adev,
 	if (ret)
 		return ret;
 
-	fill_blending_from_plane_state(
+	amdgpu_dm_plane_fill_blending_from_plane_state(
 		plane_state, &plane_info->per_pixel_alpha, &plane_info->pre_multiplied_alpha,
 		&plane_info->global_alpha, &plane_info->global_alpha_value);
 
@@ -4976,7 +4976,7 @@ static int fill_dc_plane_attributes(struct amdgpu_device *adev,
 	int ret;
 	bool force_disable_dcc = false;
 
-	ret = fill_dc_scaling_info(adev, plane_state, &scaling_info);
+	ret = amdgpu_dm_plane_fill_dc_scaling_info(adev, plane_state, &scaling_info);
 	if (ret)
 		return ret;
 
@@ -7882,7 +7882,7 @@ static void amdgpu_dm_commit_cursors(struct drm_atomic_state *state)
 	 */
 	for_each_old_plane_in_state(state, plane, old_plane_state, i)
 		if (plane->type == DRM_PLANE_TYPE_CURSOR)
-			handle_cursor_update(plane, old_plane_state);
+			amdgpu_dm_plane_handle_cursor_update(plane, old_plane_state);
 }
 
 static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
@@ -7967,7 +7967,7 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 			bundle->surface_updates[planes_count].gamut_remap_matrix = &dc_plane->gamut_remap_matrix;
 		}
 
-		fill_dc_scaling_info(dm->adev, new_plane_state,
+		amdgpu_dm_plane_fill_dc_scaling_info(dm->adev, new_plane_state,
 				     &bundle->scaling_infos[planes_count]);
 
 		bundle->surface_updates[planes_count].scaling_info =
@@ -9634,7 +9634,7 @@ static int dm_update_plane_state(struct dc *dc,
 		if (!needs_reset)
 			return 0;
 
-		ret = dm_plane_helper_check_state(new_plane_state, new_crtc_state);
+		ret = amdgpu_dm_plane_helper_check_state(new_plane_state, new_crtc_state);
 		if (ret)
 			return ret;
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index 28fb1f02591a..dc23c788cdba 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -90,12 +90,12 @@ enum dm_micro_swizzle {
 	MICRO_SWIZZLE_R = 3
 };
 
-const struct drm_format_info *amd_get_format_info(const struct drm_mode_fb_cmd2 *cmd)
+const struct drm_format_info *amdgpu_dm_plane_get_format_info(const struct drm_mode_fb_cmd2 *cmd)
 {
 	return amdgpu_lookup_format_info(cmd->pixel_format, cmd->modifier[0]);
 }
 
-void fill_blending_from_plane_state(const struct drm_plane_state *plane_state,
+void amdgpu_dm_plane_fill_blending_from_plane_state(const struct drm_plane_state *plane_state,
 			       bool *per_pixel_alpha, bool *pre_multiplied_alpha,
 			       bool *global_alpha, int *global_alpha_value)
 {
@@ -759,7 +759,7 @@ static int attach_color_mgmt_properties(struct amdgpu_display_manager *dm, struc
 }
 #endif
 
-int fill_plane_buffer_attributes(struct amdgpu_device *adev,
+int amdgpu_dm_plane_fill_plane_buffer_attributes(struct amdgpu_device *adev,
 			     const struct amdgpu_framebuffer *afb,
 			     const enum surface_pixel_format format,
 			     const enum dc_rotation_angle rotation,
@@ -918,7 +918,7 @@ static int dm_plane_helper_prepare_fb(struct drm_plane *plane,
 			dm_plane_state_new->dc_state;
 		bool force_disable_dcc = !plane_state->dcc.enable;
 
-		fill_plane_buffer_attributes(
+		amdgpu_dm_plane_fill_plane_buffer_attributes(
 			adev, afb, plane_state->format, plane_state->rotation,
 			afb->tiling_flags,
 			&plane_state->tiling_info, &plane_state->plane_size,
@@ -999,7 +999,7 @@ static void get_min_max_dc_plane_scaling(struct drm_device *dev,
 		*min_downscale = 1000;
 }
 
-int dm_plane_helper_check_state(struct drm_plane_state *state,
+int amdgpu_dm_plane_helper_check_state(struct drm_plane_state *state,
 				       struct drm_crtc_state *new_crtc_state)
 {
 	struct drm_framebuffer *fb = state->fb;
@@ -1053,7 +1053,7 @@ int dm_plane_helper_check_state(struct drm_plane_state *state,
 		state, new_crtc_state, min_scale, max_scale, true, true);
 }
 
-int fill_dc_scaling_info(struct amdgpu_device *adev,
+int amdgpu_dm_plane_fill_dc_scaling_info(struct amdgpu_device *adev,
 				const struct drm_plane_state *state,
 				struct dc_scaling_info *scaling_info)
 {
@@ -1161,11 +1161,11 @@ static int dm_plane_atomic_check(struct drm_plane *plane,
 	if (!new_crtc_state)
 		return -EINVAL;
 
-	ret = dm_plane_helper_check_state(new_plane_state, new_crtc_state);
+	ret = amdgpu_dm_plane_helper_check_state(new_plane_state, new_crtc_state);
 	if (ret)
 		return ret;
 
-	ret = fill_dc_scaling_info(adev, new_plane_state, &scaling_info);
+	ret = amdgpu_dm_plane_fill_dc_scaling_info(adev, new_plane_state, &scaling_info);
 	if (ret)
 		return ret;
 
@@ -1229,7 +1229,7 @@ static int get_cursor_position(struct drm_plane *plane, struct drm_crtc *crtc,
 	return 0;
 }
 
-void handle_cursor_update(struct drm_plane *plane,
+void amdgpu_dm_plane_handle_cursor_update(struct drm_plane *plane,
 				 struct drm_plane_state *old_plane_state)
 {
 	struct amdgpu_device *adev = drm_to_adev(plane->dev);
@@ -1314,7 +1314,7 @@ static void dm_plane_atomic_async_update(struct drm_plane *plane,
 	plane->state->crtc_w = new_state->crtc_w;
 	plane->state->crtc_h = new_state->crtc_h;
 
-	handle_cursor_update(plane, old_state);
+	amdgpu_dm_plane_handle_cursor_update(plane, old_state);
 }
 
 static const struct drm_plane_helper_funcs dm_plane_helper_funcs = {
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.h
index a4bee8528a51..930f1572f898 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.h
@@ -29,17 +29,17 @@
 
 #include "dc.h"
 
-void handle_cursor_update(struct drm_plane *plane,
+void amdgpu_dm_plane_handle_cursor_update(struct drm_plane *plane,
 			  struct drm_plane_state *old_plane_state);
 
-int fill_dc_scaling_info(struct amdgpu_device *adev,
+int amdgpu_dm_plane_fill_dc_scaling_info(struct amdgpu_device *adev,
 			 const struct drm_plane_state *state,
 			 struct dc_scaling_info *scaling_info);
 
-int dm_plane_helper_check_state(struct drm_plane_state *state,
+int amdgpu_dm_plane_helper_check_state(struct drm_plane_state *state,
 				struct drm_crtc_state *new_crtc_state);
 
-int fill_plane_buffer_attributes(struct amdgpu_device *adev,
+int amdgpu_dm_plane_fill_plane_buffer_attributes(struct amdgpu_device *adev,
 				 const struct amdgpu_framebuffer *afb,
 				 const enum surface_pixel_format format,
 				 const enum dc_rotation_angle rotation,
@@ -56,9 +56,9 @@ int amdgpu_dm_plane_init(struct amdgpu_display_manager *dm,
 			 unsigned long possible_crtcs,
 			 const struct dc_plane_cap *plane_cap);
 
-const struct drm_format_info *amd_get_format_info(const struct drm_mode_fb_cmd2 *cmd);
+const struct drm_format_info *amdgpu_dm_plane_get_format_info(const struct drm_mode_fb_cmd2 *cmd);
 
-void fill_blending_from_plane_state(const struct drm_plane_state *plane_state,
+void amdgpu_dm_plane_fill_blending_from_plane_state(const struct drm_plane_state *plane_state,
 				    bool *per_pixel_alpha, bool *pre_multiplied_alpha,
 				    bool *global_alpha, int *global_alpha_value);
 
-- 
2.39.2

