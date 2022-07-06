Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E91B568CFF
	for <lists+linux-doc@lfdr.de>; Wed,  6 Jul 2022 17:33:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233885AbiGFPcj (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 6 Jul 2022 11:32:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233974AbiGFPcS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 6 Jul 2022 11:32:18 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5CEF27B1C;
        Wed,  6 Jul 2022 08:31:40 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 90B2AB81D93;
        Wed,  6 Jul 2022 15:31:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57252C3411C;
        Wed,  6 Jul 2022 15:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657121498;
        bh=SuF4v3Uz5uTNz8Vjlm3/PnuewX3rlJ5M1kikWnOZ87c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Kap7Dbsl3MImUUIbDe1lCtBNYHHFd5b7xtKE2uIXQAPy3ESeTbE4qdIyV45IBslLy
         48ViL1ffYzMf4OUcfPj3OlS6q7zj6dmCvLTrtnxPaxiaOoNfHrXE5ITCCfwboJOCrw
         W0dTDrJgUsRuZYREmVcxwvNhWnDdof0hLt5OIqXYhOEbMBJjM3+qDZqka71fbawSys
         Yg8MKrGDo75c9OLXnogHJrA4ZrVk4Ku9l6XbDs4/i2LosQeAKl9DSVLCCuPh3RQqZU
         ++oyXirPeWxDyteKR1smzCUulXOU0PvtjiEUMlO6jU2dgnQRmred6Um2e3U55R6ZoH
         ysWOxEWZSvR6w==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Javier Martinez Canillas <javierm@redhat.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Sasha Levin <sashal@kernel.org>, corbet@lwn.net,
        tzimmermann@suse.de, bp@suse.de, gregkh@linuxfoundation.org,
        linux-doc@vger.kernel.org
Subject: [PATCH AUTOSEL 5.18 16/22] firmware: sysfb: Add sysfb_disable() helper function
Date:   Wed,  6 Jul 2022 11:30:34 -0400
Message-Id: <20220706153041.1597639-16-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220706153041.1597639-1-sashal@kernel.org>
References: <20220706153041.1597639-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Javier Martinez Canillas <javierm@redhat.com>

[ Upstream commit bde376e9de3c0bc55eedc8956b0f114c05531595 ]

This can be used by subsystems to unregister a platform device registered
by sysfb and also to disable future platform device registration in sysfb.

Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Link: https://patchwork.freedesktop.org/patch/msgid/20220607182338.344270-3-javierm@redhat.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../driver-api/firmware/other_interfaces.rst  |  6 +++
 drivers/firmware/sysfb.c                      | 54 ++++++++++++++++---
 include/linux/sysfb.h                         | 12 +++++
 3 files changed, 66 insertions(+), 6 deletions(-)

diff --git a/Documentation/driver-api/firmware/other_interfaces.rst b/Documentation/driver-api/firmware/other_interfaces.rst
index b81794e0cfbb..06ac89adaafb 100644
--- a/Documentation/driver-api/firmware/other_interfaces.rst
+++ b/Documentation/driver-api/firmware/other_interfaces.rst
@@ -13,6 +13,12 @@ EDD Interfaces
 .. kernel-doc:: drivers/firmware/edd.c
    :internal:
 
+Generic System Framebuffers Interface
+-------------------------------------
+
+.. kernel-doc:: drivers/firmware/sysfb.c
+   :export:
+
 Intel Stratix10 SoC Service Layer
 ---------------------------------
 Some features of the Intel Stratix10 SoC require a level of privilege
diff --git a/drivers/firmware/sysfb.c b/drivers/firmware/sysfb.c
index b032f40a92de..1f276f108cc9 100644
--- a/drivers/firmware/sysfb.c
+++ b/drivers/firmware/sysfb.c
@@ -34,21 +34,59 @@
 #include <linux/screen_info.h>
 #include <linux/sysfb.h>
 
+static struct platform_device *pd;
+static DEFINE_MUTEX(disable_lock);
+static bool disabled;
+
+static bool sysfb_unregister(void)
+{
+	if (IS_ERR_OR_NULL(pd))
+		return false;
+
+	platform_device_unregister(pd);
+	pd = NULL;
+
+	return true;
+}
+
+/**
+ * sysfb_disable() - disable the Generic System Framebuffers support
+ *
+ * This disables the registration of system framebuffer devices that match the
+ * generic drivers that make use of the system framebuffer set up by firmware.
+ *
+ * It also unregisters a device if this was already registered by sysfb_init().
+ *
+ * Context: The function can sleep. A @disable_lock mutex is acquired to serialize
+ *          against sysfb_init(), that registers a system framebuffer device.
+ */
+void sysfb_disable(void)
+{
+	mutex_lock(&disable_lock);
+	sysfb_unregister();
+	disabled = true;
+	mutex_unlock(&disable_lock);
+}
+EXPORT_SYMBOL_GPL(sysfb_disable);
+
 static __init int sysfb_init(void)
 {
 	struct screen_info *si = &screen_info;
 	struct simplefb_platform_data mode;
-	struct platform_device *pd;
 	const char *name;
 	bool compatible;
-	int ret;
+	int ret = 0;
+
+	mutex_lock(&disable_lock);
+	if (disabled)
+		goto unlock_mutex;
 
 	/* try to create a simple-framebuffer device */
 	compatible = sysfb_parse_mode(si, &mode);
 	if (compatible) {
 		pd = sysfb_create_simplefb(si, &mode);
 		if (!IS_ERR(pd))
-			return 0;
+			goto unlock_mutex;
 	}
 
 	/* if the FB is incompatible, create a legacy framebuffer device */
@@ -60,8 +98,10 @@ static __init int sysfb_init(void)
 		name = "platform-framebuffer";
 
 	pd = platform_device_alloc(name, 0);
-	if (!pd)
-		return -ENOMEM;
+	if (!pd) {
+		ret = -ENOMEM;
+		goto unlock_mutex;
+	}
 
 	sysfb_apply_efi_quirks(pd);
 
@@ -73,9 +113,11 @@ static __init int sysfb_init(void)
 	if (ret)
 		goto err;
 
-	return 0;
+	goto unlock_mutex;
 err:
 	platform_device_put(pd);
+unlock_mutex:
+	mutex_unlock(&disable_lock);
 	return ret;
 }
 
diff --git a/include/linux/sysfb.h b/include/linux/sysfb.h
index 708152e9037b..8ba8b5be5567 100644
--- a/include/linux/sysfb.h
+++ b/include/linux/sysfb.h
@@ -55,6 +55,18 @@ struct efifb_dmi_info {
 	int flags;
 };
 
+#ifdef CONFIG_SYSFB
+
+void sysfb_disable(void);
+
+#else /* CONFIG_SYSFB */
+
+static inline void sysfb_disable(void)
+{
+}
+
+#endif /* CONFIG_SYSFB */
+
 #ifdef CONFIG_EFI
 
 extern struct efifb_dmi_info efifb_dmi_list[];
-- 
2.35.1

