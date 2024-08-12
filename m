Return-Path: <linux-doc+bounces-22671-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0261294F819
	for <lists+linux-doc@lfdr.de>; Mon, 12 Aug 2024 22:19:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 84C431F22B3E
	for <lists+linux-doc@lfdr.de>; Mon, 12 Aug 2024 20:19:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63ECA194A51;
	Mon, 12 Aug 2024 20:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="gexMGifY"
X-Original-To: linux-doc@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9E9183CA5;
	Mon, 12 Aug 2024 20:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723493946; cv=none; b=VVMeoglnuTHwJJjlsCERfX3b8s+6dA00uHcIGPrBQEoirjMAitlYocHJnS/Ako8cn+xRWv0SeTRU7uX2EQdIErrolwYN71uAso6PYIaq3fALJeEvPe5AGQVigLWQxGJeyHgCYOUUAZtCoNu8xbtCZG1rwP6S8UfL35PgeFQCIFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723493946; c=relaxed/simple;
	bh=bHgOhr6or/SwGLEdEV9JOQYT34N0Gx3xsfkrcrMNeq4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=snycBPKspR5OPf90MRGLWSVQCgB/NIWovQqv098Y1tNmHWARLx3tvqybYdeQIgYJe6T2W0GlPD1yj7PlmMBx5I2BHZhOOeoi93TpSve0waxzHpJ7/Xii02bSfE4mlYUPT95C+l+9MOP9p3oBmqwwekEmjaJXzms75wKWgUR7Aow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=gexMGifY; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1723493938;
	bh=bHgOhr6or/SwGLEdEV9JOQYT34N0Gx3xsfkrcrMNeq4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gexMGifYe4MS3CyRTEPcPRaJ40Uf9RvD2BsFsUE9ogq1LiEYEYDU0TsPuYqKMyOB/
	 zRVJL31SLUyGAC7h9+W9R8DZHqX8M4BnP3ZOTyzC3SJRvU92z2pRmQvagRfAUrVS7d
	 7+6tT7ffQdZe8THe8JrnuXRAshC25gI7qTuv5IeQ=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 12 Aug 2024 22:18:30 +0200
Subject: [PATCH v4 1/3] drm: Add panel backlight quirks
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240812-amdgpu-min-backlight-quirk-v4-1-56a63ff897b7@weissschuh.net>
References: <20240812-amdgpu-min-backlight-quirk-v4-0-56a63ff897b7@weissschuh.net>
In-Reply-To: <20240812-amdgpu-min-backlight-quirk-v4-0-56a63ff897b7@weissschuh.net>
To: Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
 Mario Limonciello <mario.limonciello@amd.com>, 
 Matt Hartley <matt.hartley@gmail.com>, Kieran Levin <ktl@framework.net>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, Xinhui Pan <Xinhui.Pan@amd.com>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Dustin Howett <dustin@howett.net>, 
 linux-doc@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723493938; l=4897;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=bHgOhr6or/SwGLEdEV9JOQYT34N0Gx3xsfkrcrMNeq4=;
 b=OvUCCXJEvFEfiLy9TekOirXYrgAax/+xC4CXyIZIwC0tlNAxn+ARJLaNrvBrQeSebqSZ3yuxN
 DJcg2+Bel8qBQzKk9lWjnwj2ZKwxdzScYvQ1yHrGLdMgcNPhV33Oy49
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Panels using a PWM-controlled backlight source without an do not have a
standard way to communicate their valid PWM ranges.
On x86 the ranges are read from ACPI through driver-specific tables.
The built-in ranges are not necessarily correct, or may grow stale if an
older device can be retrofitted with newer panels.

Add a quirk infrastructure with which the minimum valid backlight value
can be maintained as part of the kernel.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 Documentation/gpu/drm-kms-helpers.rst        |  3 ++
 drivers/gpu/drm/Kconfig                      |  4 ++
 drivers/gpu/drm/Makefile                     |  1 +
 drivers/gpu/drm/drm_panel_backlight_quirks.c | 69 ++++++++++++++++++++++++++++
 include/drm/drm_utils.h                      |  3 ++
 5 files changed, 80 insertions(+)

diff --git a/Documentation/gpu/drm-kms-helpers.rst b/Documentation/gpu/drm-kms-helpers.rst
index 8435e8621cc0..a26989500129 100644
--- a/Documentation/gpu/drm-kms-helpers.rst
+++ b/Documentation/gpu/drm-kms-helpers.rst
@@ -230,6 +230,9 @@ Panel Helper Reference
 .. kernel-doc:: drivers/gpu/drm/drm_panel_orientation_quirks.c
    :export:
 
+.. kernel-doc:: drivers/gpu/drm/drm_panel_backlight_quirks.c
+   :export:
+
 Panel Self Refresh Helper Reference
 ===================================
 
diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 6b2c6b91f962..9ebb8cdb535e 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -454,6 +454,10 @@ config DRM_HYPERV
 config DRM_EXPORT_FOR_TESTS
 	bool
 
+# Separate option as not all DRM drivers use it
+config DRM_PANEL_BACKLIGHT_QUIRKS
+	tristate
+
 config DRM_LIB_RANDOM
 	bool
 	default n
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 68cc9258ffc4..adf85999aee2 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -92,6 +92,7 @@ drm-$(CONFIG_DRM_PANIC) += drm_panic.o
 obj-$(CONFIG_DRM)	+= drm.o
 
 obj-$(CONFIG_DRM_PANEL_ORIENTATION_QUIRKS) += drm_panel_orientation_quirks.o
+obj-$(CONFIG_DRM_PANEL_BACKLIGHT_QUIRKS) += drm_panel_backlight_quirks.o
 
 #
 # Memory-management helpers
diff --git a/drivers/gpu/drm/drm_panel_backlight_quirks.c b/drivers/gpu/drm/drm_panel_backlight_quirks.c
new file mode 100644
index 000000000000..a88e77db97c5
--- /dev/null
+++ b/drivers/gpu/drm/drm_panel_backlight_quirks.c
@@ -0,0 +1,69 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/array_size.h>
+#include <linux/dmi.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <drm/drm_utils.h>
+
+struct drm_panel_min_backlight_quirk {
+	struct {
+		enum dmi_field field;
+		const char * const value;
+	} dmi_match;
+	struct drm_edid_ident ident;
+	u8 min_brightness;
+};
+
+static const struct drm_panel_min_backlight_quirk drm_panel_min_backlight_quirks[] = {
+};
+
+static bool drm_panel_min_backlight_quirk_matches(const struct drm_panel_min_backlight_quirk *quirk,
+						  const struct drm_edid *edid)
+{
+	if (!dmi_match(quirk->dmi_match.field, quirk->dmi_match.value))
+		return false;
+
+	if (!drm_edid_match(edid, &quirk->ident))
+		return false;
+
+	return true;
+}
+
+/**
+ * drm_get_panel_min_brightness_quirk - Get minimum supported brightness level for a panel.
+ * @edid: EDID of the panel to check
+ *
+ * This function checks for platform specific (e.g. DMI based) quirks
+ * providing info on the minimum backlight brightness for systems where this
+ * cannot be probed correctly from the hard-/firm-ware.
+ *
+ * Returns:
+ * A negative error value or
+ * an override value in the range [0, 255] representing 0-100% to be scaled to
+ * the drivers target range.
+ */
+int drm_get_panel_min_brightness_quirk(const struct drm_edid *edid)
+{
+	const struct drm_panel_min_backlight_quirk *quirk;
+	size_t i;
+
+	if (!IS_ENABLED(CONFIG_DMI))
+		return -ENODATA;
+
+	if (!edid)
+		return -EINVAL;
+
+	for (i = 0; i < ARRAY_SIZE(drm_panel_min_backlight_quirks); i++) {
+		quirk = &drm_panel_min_backlight_quirks[i];
+
+		if (drm_panel_min_backlight_quirk_matches(quirk, edid))
+			return quirk->min_brightness;
+	}
+
+	return -ENODATA;
+}
+EXPORT_SYMBOL(drm_get_panel_min_brightness_quirk);
+
+MODULE_DESCRIPTION("Quirks for panel backlight overrides");
+MODULE_LICENSE("GPL");
diff --git a/include/drm/drm_utils.h b/include/drm/drm_utils.h
index 70775748d243..267711028dd4 100644
--- a/include/drm/drm_utils.h
+++ b/include/drm/drm_utils.h
@@ -11,9 +11,12 @@
 #define __DRM_UTILS_H__
 
 #include <linux/types.h>
+#include <drm/drm_edid.h>
 
 int drm_get_panel_orientation_quirk(int width, int height);
 
+int drm_get_panel_min_brightness_quirk(const struct drm_edid *edid);
+
 signed long drm_timeout_abs_to_jiffies(int64_t timeout_nsec);
 
 #endif

-- 
2.46.0


