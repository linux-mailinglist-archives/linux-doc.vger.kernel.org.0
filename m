Return-Path: <linux-doc+bounces-5190-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B7981429E
	for <lists+linux-doc@lfdr.de>; Fri, 15 Dec 2023 08:40:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C8D321C2230B
	for <lists+linux-doc@lfdr.de>; Fri, 15 Dec 2023 07:40:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1A981772E;
	Fri, 15 Dec 2023 07:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YWaT0kCC"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF2314F95
	for <linux-doc@vger.kernel.org>; Fri, 15 Dec 2023 07:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--davidgow.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-5ddd64f83a4so2411787b3.0
        for <linux-doc@vger.kernel.org>; Thu, 14 Dec 2023 23:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702625977; x=1703230777; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DEdD2ZFpDj7jGQ6MNzamPllkdSHgzBRafHvZdTTxiEM=;
        b=YWaT0kCCSY2z+sO8smD4w8l2PGHMn86TtY3Td6m8YY3iVeR9q6aRwoVGL3Awm+5jmM
         5s0Sl/nD7k92EuuWBQhfDhzPykdqmZXQF1LsHMZwKHIRqtyqS9ucDxGwhZRDCtQTePbI
         qeT2aiG3fGm54Vn9w/ZIBqCRM2scNyMxNTZHWERaJq38LrbnUmjKkWYoIVM1ZeXBODoo
         nht4AVQZLxpZ7y2NAQicw4mQ7aPkO8SF73Js5tDTiNV7/R7XV5ATbKW8wPTsIzwSBVD3
         AU7vUTDjSR7cMWzu0XL3yGKsGimpsOKcmve6n83hGIX0KOfe5vm3q7ieXYOQcBsmK2lP
         NT/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702625977; x=1703230777;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DEdD2ZFpDj7jGQ6MNzamPllkdSHgzBRafHvZdTTxiEM=;
        b=C/0UFGb5RB7l6+93LLPBXuf9im+dCQqvyrD6dZtVfjcZ7Rjj+4OEJBvBxkyYNyv+b6
         /Q/C5O4VLRRY7xdniTcVStA7uh9dlLv9P3cqOymN+dlCdy79Gmm6LWfaLggHKSdA9qwZ
         +U945+G4moH/uQMu2ch/Mpuqv5qmCwS54SlIPBkcf7suqDn10nowHLYdKTJvoCEeIyaq
         y9+yB9wmt5yNPOBm/iaY5+JquKhtiQ5jgltXCCW7ZClim0pE1l1/97BqDrqApy4dcZ50
         ZCiLnNb0Hf+zxE+RngqSYovGd4pB+pOCRaf9YFg1t2D5JlwgIKOdVaSrHXr2yVJXCwYv
         MjiA==
X-Gm-Message-State: AOJu0YyiKqjbzNTpyuWFSl8Tx9qssDvElAfoxTz6IFQ6aGF5pQICuLKv
	Ce01nFT0xJ1oG4E980lS22ywWAM5O0F2cQ==
X-Google-Smtp-Source: AGHT+IGuliGc1x7ZG0hmVGtlZI8HEIuCYqjmpfGoxBzPzTU8nz0wyUB0pw1fP4D1TpgUQwqGYAf5edyyW5sP3A==
X-Received: from slicestar.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:20a1])
 (user=davidgow job=sendgmr) by 2002:a05:690c:e0b:b0:5d3:b449:e58e with SMTP
 id cp11-20020a05690c0e0b00b005d3b449e58emr127478ywb.6.1702625977034; Thu, 14
 Dec 2023 23:39:37 -0800 (PST)
Date: Fri, 15 Dec 2023 15:39:12 +0800
In-Reply-To: <20231215-kunit_bus-v4-0-4f5160e2f95e@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20231215-kunit_bus-v4-0-4f5160e2f95e@google.com>
X-Mailer: b4 0.13-dev-099c9
Message-ID: <20231215-kunit_bus-v4-5-4f5160e2f95e@google.com>
Subject: [PATCH v4 5/5] drm/tests: Switch to kunit devices
From: davidgow@google.com
To: Rae Moar <rmoar@google.com>, Brendan Higgins <brendan.higgins@linux.dev>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matti Vaittinen <mazziesaccount@gmail.com>, 
	Stephen Boyd <sboyd@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	Jonathan Corbet <corbet@lwn.net>, Kees Cook <keescook@chromium.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Maxime Ripard <mripard@kernel.org>
Cc: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-sound@vger.kernel.org, 
	David Gow <davidgow@google.com>, Maxime Ripard <mripard@kernel.org>
Content-Type: text/plain; charset="utf-8"

From: Maxime Ripard <mripard@kernel.org>

Kunit recently gained helpers to create test managed devices. This means
that we no longer have to roll our own helpers in KMS and we can reuse
them.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Tested-by: David Gow <davidgow@google.com>
Signed-off-by: David Gow <davidgow@google.com>
---
 drivers/gpu/drm/tests/drm_kunit_helpers.c | 66 ++-----------------------------
 1 file changed, 3 insertions(+), 63 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.c b/drivers/gpu/drm/tests/drm_kunit_helpers.c
index c251e6b34de0..ca4f8e4c5d5d 100644
--- a/drivers/gpu/drm/tests/drm_kunit_helpers.c
+++ b/drivers/gpu/drm/tests/drm_kunit_helpers.c
@@ -5,6 +5,7 @@
 #include <drm/drm_kunit_helpers.h>
 #include <drm/drm_managed.h>
 
+#include <kunit/device.h>
 #include <kunit/resource.h>
 
 #include <linux/device.h>
@@ -15,28 +16,6 @@
 static const struct drm_mode_config_funcs drm_mode_config_funcs = {
 };
 
-static int fake_probe(struct platform_device *pdev)
-{
-	return 0;
-}
-
-static struct platform_driver fake_platform_driver = {
-	.probe	= fake_probe,
-	.driver = {
-		.name	= KUNIT_DEVICE_NAME,
-	},
-};
-
-KUNIT_DEFINE_ACTION_WRAPPER(kunit_action_platform_driver_unregister,
-			    platform_driver_unregister,
-			    struct platform_driver *);
-KUNIT_DEFINE_ACTION_WRAPPER(kunit_action_platform_device_put,
-			    platform_device_put,
-			    struct platform_device *);
-KUNIT_DEFINE_ACTION_WRAPPER(kunit_action_platform_device_del,
-			    platform_device_del,
-			    struct platform_device *);
-
 /**
  * drm_kunit_helper_alloc_device - Allocate a mock device for a KUnit test
  * @test: The test context object
@@ -54,34 +33,7 @@ KUNIT_DEFINE_ACTION_WRAPPER(kunit_action_platform_device_del,
  */
 struct device *drm_kunit_helper_alloc_device(struct kunit *test)
 {
-	struct platform_device *pdev;
-	int ret;
-
-	ret = platform_driver_register(&fake_platform_driver);
-	KUNIT_ASSERT_EQ(test, ret, 0);
-
-	ret = kunit_add_action_or_reset(test,
-					kunit_action_platform_driver_unregister,
-					&fake_platform_driver);
-	KUNIT_ASSERT_EQ(test, ret, 0);
-
-	pdev = platform_device_alloc(KUNIT_DEVICE_NAME, PLATFORM_DEVID_NONE);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, pdev);
-
-	ret = kunit_add_action_or_reset(test,
-					kunit_action_platform_device_put,
-					pdev);
-	KUNIT_ASSERT_EQ(test, ret, 0);
-
-	ret = platform_device_add(pdev);
-	KUNIT_ASSERT_EQ(test, ret, 0);
-
-	ret = kunit_add_action_or_reset(test,
-					kunit_action_platform_device_del,
-					pdev);
-	KUNIT_ASSERT_EQ(test, ret, 0);
-
-	return &pdev->dev;
+	return kunit_device_register(test, KUNIT_DEVICE_NAME);
 }
 EXPORT_SYMBOL_GPL(drm_kunit_helper_alloc_device);
 
@@ -94,19 +46,7 @@ EXPORT_SYMBOL_GPL(drm_kunit_helper_alloc_device);
  */
 void drm_kunit_helper_free_device(struct kunit *test, struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-
-	kunit_release_action(test,
-			     kunit_action_platform_device_del,
-			     pdev);
-
-	kunit_release_action(test,
-			     kunit_action_platform_device_put,
-			     pdev);
-
-	kunit_release_action(test,
-			     kunit_action_platform_driver_unregister,
-			     &fake_platform_driver);
+	kunit_device_unregister(test, dev);
 }
 EXPORT_SYMBOL_GPL(drm_kunit_helper_free_device);
 

-- 
2.43.0.472.g3155946c3a-goog


