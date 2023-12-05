Return-Path: <linux-doc+bounces-4031-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 957CB804B24
	for <lists+linux-doc@lfdr.de>; Tue,  5 Dec 2023 08:32:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4AF9E2816E2
	for <lists+linux-doc@lfdr.de>; Tue,  5 Dec 2023 07:32:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EE37179A9;
	Tue,  5 Dec 2023 07:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ODWFWSuE"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC617127
	for <linux-doc@vger.kernel.org>; Mon,  4 Dec 2023 23:32:00 -0800 (PST)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-daee86e2d70so4536834276.0
        for <linux-doc@vger.kernel.org>; Mon, 04 Dec 2023 23:32:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701761520; x=1702366320; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=K0zdW7CBKdTcyZ6NkC3IZ70G/WJIHzJoU6Zyjp/hyXw=;
        b=ODWFWSuEFkV8GCsHmRatZGcony01v/uW8FqEAWHZ6v9DKNcJr7LGwv6RREzSth54Ij
         0tfb8D/Yqk1dy4XES+mC+pN1hzucQVSEC9EOKMcy/fxjQWqNvBxTlrsBBdTmUqe4+BcV
         23Gnvl2glpk7aWBBBKV3CcfznbCgyqtAF6kecf22J5aL9mSFLJnZxzbvnm88zivJP3Xe
         utUwuAIb000bpYgKsIoQTqrexGfTygbx3GIu8xqVFNjGrQ3fftlD3K+8Lh/1JjeQwZPM
         DpLH1qS04Or6194+Zs/o3+dYTeFTyJgJOE9Pv3GmrqU9H7CCms4burSVn3G3KME2vDuM
         wlVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701761520; x=1702366320;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K0zdW7CBKdTcyZ6NkC3IZ70G/WJIHzJoU6Zyjp/hyXw=;
        b=MdFa7wwgxrR5mzmbfiw1obOcHCDJX51P5fJ9xLAjEAfARRoWYeBWNwd1uquycORjCi
         8Rvsx6ntgfGhSaVpNHyYMjoOzw8XLECEQBCuXaTBYn0jaTGkT+23Pcm1UiAzAK/4Uss0
         3IN6CZ4U9CfyrHbjZ2Q/sp9MkS4ybw6AIRpxytXY/4KF3ccYNxVXQAZYQhTt/LZGxIWI
         0xGvV69g6hEFCkqJ46e4EbENRI7xQiW0gfin9MVz5jYAeaA9aq3/1yA23cEAcLZ/CHxY
         oDwxPZjS5PrnqIf0IieoSt91k2va1Wd9Jat75zvz+GbjzSmjIsx5hw16ysW3bhSKb4Wx
         4yYA==
X-Gm-Message-State: AOJu0Yy/VsmTpYp3GdFPvrNBEwsWqcg7t50H0LlYt5fWUzCxwCSlV3j9
	3y7OlJmymJxrhEndyZufTP2tahUGWChcnw==
X-Google-Smtp-Source: AGHT+IFoVz0OcZkIRG5/Sf50+3F5qfsDJpbbL6ah305RE6J1zf52P+Ky7oV+UR+nfZA3THFYH0yVogxgbzcb5g==
X-Received: from slicestar.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:20a1])
 (user=davidgow job=sendgmr) by 2002:a25:d04c:0:b0:db5:4b1d:c63c with SMTP id
 h73-20020a25d04c000000b00db54b1dc63cmr312842ybg.11.1701761520168; Mon, 04 Dec
 2023 23:32:00 -0800 (PST)
Date: Tue, 05 Dec 2023 15:31:34 +0800
In-Reply-To: <20231205-kunit_bus-v1-0-635036d3bc13@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20231205-kunit_bus-v1-0-635036d3bc13@google.com>
X-Mailer: b4 0.13-dev-099c9
Message-ID: <20231205-kunit_bus-v1-2-635036d3bc13@google.com>
Subject: [PATCH 2/4] fortify: test: Use kunit_device
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

Signed-off-by: David Gow <davidgow@google.com>
---
 lib/fortify_kunit.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/lib/fortify_kunit.c b/lib/fortify_kunit.c
index c8c33cbaae9e..f7a1fce8849b 100644
--- a/lib/fortify_kunit.c
+++ b/lib/fortify_kunit.c
@@ -16,6 +16,7 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <kunit/test.h>
+#include <kunit/device.h>
 #include <linux/device.h>
 #include <linux/slab.h>
 #include <linux/string.h>
@@ -269,7 +270,7 @@ DEFINE_ALLOC_SIZE_TEST_PAIR(kvmalloc)
 	size_t len;							\
 									\
 	/* Create dummy device for devm_kmalloc()-family tests. */	\
-	dev = root_device_register(dev_name);				\
+	dev = kunit_device_register(test, dev_name);			\
 	KUNIT_ASSERT_FALSE_MSG(test, IS_ERR(dev),			\
 			       "Cannot register test device\n");	\
 									\
@@ -303,7 +304,7 @@ DEFINE_ALLOC_SIZE_TEST_PAIR(kvmalloc)
 	checker(len, devm_kmemdup(dev, "Ohai", len, gfp),		\
 		devm_kfree(dev, p));					\
 									\
-	device_unregister(dev);						\
+	kunit_device_unregister(test, dev);				\
 } while (0)
 DEFINE_ALLOC_SIZE_TEST_PAIR(devm_kmalloc)
 

-- 
2.43.0.rc2.451.g8631bc7472-goog


