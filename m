Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1687D416BF6
	for <lists+linux-doc@lfdr.de>; Fri, 24 Sep 2021 08:45:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244474AbhIXGp5 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 24 Sep 2021 02:45:57 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:36035 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S244408AbhIXGpr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 24 Sep 2021 02:45:47 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id 4413858107C;
        Fri, 24 Sep 2021 02:44:14 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 24 Sep 2021 02:44:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=from
        :to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=tQ7fPMA+k/ful
        DlgZN6bcVcmaKq9X2y5rvMhwSoX/o0=; b=Zjst53zsynbvx1z5/4T4LviMKVeKW
        vSC+kRVtIHeybzjgB+cm9w/lvtMJGgdtROr2NWXXaYUEIs5m8VZMR9kDBLWCb2gz
        MFhR6iVtu+rcoyNVbmz4uu3Ayknb7wVMUz9vkv9TH9nav7ZYmmfCR4lUH1zgErso
        QHdmTZSaACSwYGlLlZLuNUcUsQBqTy/+TVrv7jkYPUVX1Of7LONV+MS5P1dMxQ6P
        MZbmwLOaWgFbUBJotmads7AjYL6rgrxlZArQLFHIanrJUv7D5XqZA7jhOkSLi7zC
        R5upFM9rZq7BMbrvegw08bqzfv6gF5Dj81g33DEqB4o0vB7IhkC8YCkdA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=tQ7fPMA+k/fulDlgZN6bcVcmaKq9X2y5rvMhwSoX/o0=; b=W2Ye1ny1
        QKoj5Jt/dQhTo7C4XzB6salMQJKiE5nauB7UXTWM64IoHf23jukyusjXfHpU0UM4
        llYAmIGZwbEBm8skIP9icUjOebCsovkiCFX8dA52riG0AqXZjJlP0xkb4SVziPSn
        UFpoKae70R3SYDv3UxgHGMXun6YORySUTpV+vLccihm9hvyhZhPHQCxRlmVC87+t
        fbglziisIhXleHOUrC0rzcV7K+HPr9pizny1T1krt3ItE5q4ji8csSCtYWjcy+ol
        cRMV7tgPM/hMvSNp6ctH/gyP72K/CABo4P1WnJJS1gpmVueF8wdXlPnc/6aJ1noc
        DBy/8E8KfbnVDw==
X-ME-Sender: <xms:vnNNYbm1jTKs7Aq4lrklHXINIeSeRLMVmHYY5hFEiSAiHciMcGt0dw>
    <xme:vnNNYe2xHBR2nJtoo5BnzWtF5H9rcumwVV4sE4SLezR4v4LjOfiyneWUI7QSUVp2a
    zs3bL-fhj5E3ioRWg>
X-ME-Received: <xmr:vnNNYRoI79uipGk4KcbIZOmj9fZmstWB5tThEvmnN5W86obaXW2SqLdUaWfcVoA0J-Fl>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejtddguddtlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpefhvghrnhgrnhguohcutfgrmhhoshcuoehgrhgvvghnfhho
    ohesuhelvddrvghuqeenucggtffrrghtthgvrhhnpeekleekjedtheejheekfefggeevvd
    fgueegffeuveduhfehueegkeeijedvvdejfeenucevlhhushhtvghrufhiiigvpedvnecu
    rfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvvghnfhhoohesuhelvddrvghu
X-ME-Proxy: <xmx:vnNNYTk76a6ZLVjhh6gKZzP5H-5Q18_LjJjoUVoA6mLzjacZeuGiYg>
    <xmx:vnNNYZ0xU0ceU1JsVlJFYEegl8M5k7kQlGclYluwM8v821xLhEcSuQ>
    <xmx:vnNNYSvKoYAP4UuwwGMZAjiokCsah3Axt5kw-MbFzDvmnfhS4ZgYhQ>
    <xmx:vnNNYTycl45hqojThniP9QUh6zcO1m2T4GpgbYF0Si5YDM7dgt9rqQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Sep 2021 02:44:11 -0400 (EDT)
From:   Fernando Ramos <greenfoo@u92.eu>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-kernel@vger.kernel.org, sean@poorly.run,
        linux-doc@vger.kernel.org, amd-gfx@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v2 14/17] drm/gma500: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
Date:   Fri, 24 Sep 2021 08:43:21 +0200
Message-Id: <20210924064324.229457-15-greenfoo@u92.eu>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210924064324.229457-1-greenfoo@u92.eu>
References: <20210924064324.229457-1-greenfoo@u92.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

As requested in Documentation/gpu/todo.rst, replace driver calls to
drm_modeset_lock_all() with DRM_MODESET_LOCK_ALL_BEGIN() and
DRM_MODESET_LOCK_ALL_END()

Signed-off-by: Fernando Ramos <greenfoo@u92.eu>
---
 drivers/gpu/drm/gma500/psb_device.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/gma500/psb_device.c b/drivers/gpu/drm/gma500/psb_device.c
index 951725a0f7a3..98d06736dbaa 100644
--- a/drivers/gpu/drm/gma500/psb_device.c
+++ b/drivers/gpu/drm/gma500/psb_device.c
@@ -8,6 +8,7 @@
 #include <linux/backlight.h>
 
 #include <drm/drm.h>
+#include <drm/drm_drv.h>
 
 #include "gma_device.h"
 #include "intel_bios.h"
@@ -169,8 +170,10 @@ static int psb_save_display_registers(struct drm_device *dev)
 {
 	struct drm_psb_private *dev_priv = dev->dev_private;
 	struct drm_crtc *crtc;
+	struct drm_modeset_acquire_ctx ctx;
 	struct gma_connector *connector;
 	struct psb_state *regs = &dev_priv->regs.psb;
+	int ret;
 
 	/* Display arbitration control + watermarks */
 	regs->saveDSPARB = PSB_RVDC32(DSPARB);
@@ -183,7 +186,7 @@ static int psb_save_display_registers(struct drm_device *dev)
 	regs->saveCHICKENBIT = PSB_RVDC32(DSPCHICKENBIT);
 
 	/* Save crtc and output state */
-	drm_modeset_lock_all(dev);
+	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
 	list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
 		if (drm_helper_crtc_in_use(crtc))
 			dev_priv->ops->save_crtc(crtc);
@@ -193,8 +196,9 @@ static int psb_save_display_registers(struct drm_device *dev)
 		if (connector->save)
 			connector->save(&connector->base);
 
-	drm_modeset_unlock_all(dev);
-	return 0;
+	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
+
+	return ret;
 }
 
 /**
@@ -207,8 +211,10 @@ static int psb_restore_display_registers(struct drm_device *dev)
 {
 	struct drm_psb_private *dev_priv = dev->dev_private;
 	struct drm_crtc *crtc;
+	struct drm_modeset_acquire_ctx ctx;
 	struct gma_connector *connector;
 	struct psb_state *regs = &dev_priv->regs.psb;
+	int ret;
 
 	/* Display arbitration + watermarks */
 	PSB_WVDC32(regs->saveDSPARB, DSPARB);
@@ -223,7 +229,7 @@ static int psb_restore_display_registers(struct drm_device *dev)
 	/*make sure VGA plane is off. it initializes to on after reset!*/
 	PSB_WVDC32(0x80000000, VGACNTRL);
 
-	drm_modeset_lock_all(dev);
+	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
 	list_for_each_entry(crtc, &dev->mode_config.crtc_list, head)
 		if (drm_helper_crtc_in_use(crtc))
 			dev_priv->ops->restore_crtc(crtc);
@@ -232,8 +238,8 @@ static int psb_restore_display_registers(struct drm_device *dev)
 		if (connector->restore)
 			connector->restore(&connector->base);
 
-	drm_modeset_unlock_all(dev);
-	return 0;
+	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
+	return ret;
 }
 
 static int psb_power_down(struct drm_device *dev)
-- 
2.33.0

