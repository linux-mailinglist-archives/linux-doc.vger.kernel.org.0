Return-Path: <linux-doc+bounces-5056-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0985812AB8
	for <lists+linux-doc@lfdr.de>; Thu, 14 Dec 2023 09:50:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C23851C20B2D
	for <lists+linux-doc@lfdr.de>; Thu, 14 Dec 2023 08:49:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BD9F249E7;
	Thu, 14 Dec 2023 08:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4ZX/fbYz"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40982116
	for <linux-doc@vger.kernel.org>; Thu, 14 Dec 2023 00:49:54 -0800 (PST)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-5d3911218b3so94364657b3.1
        for <linux-doc@vger.kernel.org>; Thu, 14 Dec 2023 00:49:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702543793; x=1703148593; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=d4MXXH5cbPxzFQMx+eKCBMLxcs0KvqjK2kPkW0nLFkA=;
        b=4ZX/fbYz+jcdNJSoUwRjqLWu4YDj+ejUob64+sziDztDZ7NKc5SO32YqEIGQxIRuvs
         h/Xk4VO7Qrt8JDiA4c4VSOSo0rTWndzgfvsSKTPpdduuM5J2/xnFmxOmW7J+6bUCoDRJ
         AHkp0b6Fr4JsWt2L935vdj4FA8b5hEBgCrZ+WKwMZzIej9mVBWkmLeQixYNo4vQzYxzd
         ND+xt1EPCa7zTfh4iuSQ7EZjx6ft/xH/2y9MSph9j6+I9zkqjuBdb1g5bGUm0y1uSeoc
         UQaRzqrTKMsSSV6bF9UxmB6mB6HqLdjAH9byk505Y3u/IHvl//1O75Tv2iKe5jKHDgsE
         5YNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702543793; x=1703148593;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d4MXXH5cbPxzFQMx+eKCBMLxcs0KvqjK2kPkW0nLFkA=;
        b=Dg9ApV5lrqdAWpLTtHKoVMsIFVEILsVc8df869lI2dTC1+ZPojYEojIb9IF93RbtQz
         qxrkw6RorHUC/LkcK39XLhZLg5Z8UC+wmls3A6gYGmrquh40hC/pJUtWIS0zvfnBDZYH
         beQaE1vdZ4Jv3Fe3TxvAtuaetyq3152pwzyqKr8HckMBil8JfTSHRY+dTBTa5KsqBWLy
         Gvnll6B/SmsSNYmrdkV4mJ56L1hutkhqK/0eNSEOCdMKfrClMhJM068VwhRfyqfmDHMJ
         Yy+IX2VVKeWLS/mZChXlwHxyMj+u4v95YGavTuEbQajw/l0OaGV2ISID8WIbiRMMKfjV
         Ix0Q==
X-Gm-Message-State: AOJu0YxMyrq1q5v6IFiafBL0r22S9M8BtYWI3ZS7uZHYuZT9o4k0hVqC
	2nAQEeWcwRUjEvXikHwQqrSXGYTSGVODAg==
X-Google-Smtp-Source: AGHT+IHr30dSfnuQG414WO6lj8hn4BjxkYtXxFaLuE2R5eCTYna2Zqi1wEGTk/LVoSMoUsnro/8J0oyQ0qKxDg==
X-Received: from slicestar.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:20a1])
 (user=davidgow job=sendgmr) by 2002:a05:690c:891:b0:5d7:a8b2:327 with SMTP id
 cd17-20020a05690c089100b005d7a8b20327mr112986ywb.7.1702543793391; Thu, 14 Dec
 2023 00:49:53 -0800 (PST)
Date: Thu, 14 Dec 2023 16:49:18 +0800
In-Reply-To: <20231214-kunit_bus-v3-0-7e9a287d3048@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20231214-kunit_bus-v3-0-7e9a287d3048@google.com>
X-Mailer: b4 0.13-dev-099c9
Message-ID: <20231214-kunit_bus-v3-4-7e9a287d3048@google.com>
Subject: [PATCH v3 4/5] ASoC: topology: Replace fake root_device with
 kunit_device in tests
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
	David Gow <davidgow@google.com>
Content-Type: text/plain; charset="utf-8"

Using struct root_device to create fake devices for tests is something
of a hack. The new struct kunit_device is meant for this purpose, so use
it instead.

Acked-by: Mark Brown <broonie@kernel.org>
Signed-off-by: David Gow <davidgow@google.com>
---
 sound/soc/soc-topology-test.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/sound/soc/soc-topology-test.c b/sound/soc/soc-topology-test.c
index 2cd3540cec04..70cbccc42a42 100644
--- a/sound/soc/soc-topology-test.c
+++ b/sound/soc/soc-topology-test.c
@@ -9,6 +9,7 @@
 #include <sound/core.h>
 #include <sound/soc.h>
 #include <sound/soc-topology.h>
+#include <kunit/device.h>
 #include <kunit/test.h>
 
 /* ===== HELPER FUNCTIONS =================================================== */
@@ -21,26 +22,19 @@
  */
 static struct device *test_dev;
 
-static struct device_driver test_drv = {
-	.name = "sound-soc-topology-test-driver",
-};
-
 static int snd_soc_tplg_test_init(struct kunit *test)
 {
-	test_dev = root_device_register("sound-soc-topology-test");
+	test_dev = kunit_device_register(test, "sound-soc-topology-test");
 	test_dev = get_device(test_dev);
 	if (!test_dev)
 		return -ENODEV;
 
-	test_dev->driver = &test_drv;
-
 	return 0;
 }
 
 static void snd_soc_tplg_test_exit(struct kunit *test)
 {
 	put_device(test_dev);
-	root_device_unregister(test_dev);
 }
 
 /*

-- 
2.43.0.472.g3155946c3a-goog


