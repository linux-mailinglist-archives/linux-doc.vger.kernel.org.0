Return-Path: <linux-doc+bounces-4505-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B398080A04D
	for <lists+linux-doc@lfdr.de>; Fri,  8 Dec 2023 11:10:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E54931C20D5B
	for <lists+linux-doc@lfdr.de>; Fri,  8 Dec 2023 10:10:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2B3A12B9D;
	Fri,  8 Dec 2023 10:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ia4PYyzt"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40DB91724
	for <linux-doc@vger.kernel.org>; Fri,  8 Dec 2023 02:10:02 -0800 (PST)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-5deda822167so2011257b3.1
        for <linux-doc@vger.kernel.org>; Fri, 08 Dec 2023 02:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702030201; x=1702635001; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=NkRyaEIclzm+ShIMyVUbqREgKKajNjynsQ0mobEpXzk=;
        b=Ia4PYyztigFmTktxZsK+SONpo6VUAt6QnxvhqOpLXF33toW7VSD3bVOBWvnjBHTItz
         1BiqSNITOd2BrYnyFCj+/YrVNw2lxIHD3FphQaJB2jhaf0Fa18PtGV7e70TwLAwuho+e
         9y6HwVXMdCuCn+zRNlHmqWpEuJEDComnl23WQvbPM/Zu5x7Dyhue5mPGDd3xfa9MG4/V
         40wNVnsHkktXzmXNVCaLBWL5IN3/3YcN69mbdi93FklJ52rnrxTijOmZJc2q7RFXEir3
         kexo8LGk8Ub+r3m7fg8+n861bs3PUZH8aSiVLqBhgd9lCIpX1uu4vbM/owGhXb8AjKIM
         KsqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702030201; x=1702635001;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NkRyaEIclzm+ShIMyVUbqREgKKajNjynsQ0mobEpXzk=;
        b=DR4hzppxd7xsiOn1mQ6B+Xwm38cBC+hCBi/hP2K5LLKcV/AFc3j7aVbiF5n5x9Sc5g
         4+FYu82/jCCK1ooKA9miCXMIZpI5sMUTv+0sKiXL7lJbfJCz0zjiqNsrDIOw6PxVNHPV
         lzFSFyTG1cPuEv5n5Wo6CCHSxSdU2rkUmbnPCOyYXVJGtEItFbLsp8VkTW2DNathsbuO
         nQLayOKGNgtJgEtRpS2AxIKWt8D9NJ49iGifPLwWGLp57KHHRAeaWTnViHliSHLTio50
         miKcqCmk2mJEim1SNNlvHrnjCOEuO0roiaGE27xNtKxtcVzBo2YpXzY2HxuaiM2T2KxQ
         Om2Q==
X-Gm-Message-State: AOJu0YzAWfXCAproRmODFmSGBvQzKyGJUhLutugUq1hMC76E4qWa8ctQ
	udIIoXKXry8VNrdKt4HEfx9KRHLyYKyCHQ==
X-Google-Smtp-Source: AGHT+IHGF3yZf9WJj2lWCzBA+Zp1ww/Jd0TaRJ+ZbfD0tlPqmjYoZLAo7qIUoj8IifBSVJ/CH0LnfRQUmCKMLQ==
X-Received: from slicestar.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:20a1])
 (user=davidgow job=sendgmr) by 2002:a05:690c:3146:b0:5d7:4619:82dd with SMTP
 id fc6-20020a05690c314600b005d7461982ddmr53175ywb.6.1702030201444; Fri, 08
 Dec 2023 02:10:01 -0800 (PST)
Date: Fri, 08 Dec 2023 18:09:31 +0800
In-Reply-To: <20231208-kunit_bus-v2-0-e95905d9b325@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20231208-kunit_bus-v2-0-e95905d9b325@google.com>
X-Mailer: b4 0.13-dev-099c9
Message-ID: <20231208-kunit_bus-v2-3-e95905d9b325@google.com>
Subject: [PATCH v2 3/4] overflow: Replace fake root_device with kunit_device
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

Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>
Signed-off-by: David Gow <davidgow@google.com>
---
 lib/overflow_kunit.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/lib/overflow_kunit.c b/lib/overflow_kunit.c
index 34db0b3aa502..c527f6b75789 100644
--- a/lib/overflow_kunit.c
+++ b/lib/overflow_kunit.c
@@ -6,6 +6,7 @@
  */
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#include <kunit/device.h>
 #include <kunit/test.h>
 #include <linux/device.h>
 #include <linux/kernel.h>
@@ -618,7 +619,7 @@ static void overflow_allocation_test(struct kunit *test)
 } while (0)
 
 	/* Create dummy device for devm_kmalloc()-family tests. */
-	dev = root_device_register(device_name);
+	dev = kunit_device_register(test, device_name);
 	KUNIT_ASSERT_FALSE_MSG(test, IS_ERR(dev),
 			       "Cannot register test device\n");
 
@@ -634,8 +635,6 @@ static void overflow_allocation_test(struct kunit *test)
 	check_allocation_overflow(devm_kmalloc);
 	check_allocation_overflow(devm_kzalloc);
 
-	device_unregister(dev);
-
 	kunit_info(test, "%d allocation overflow tests finished\n", count);
 #undef check_allocation_overflow
 }

-- 
2.43.0.472.g3155946c3a-goog


