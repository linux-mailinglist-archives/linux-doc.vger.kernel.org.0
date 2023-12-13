Return-Path: <linux-doc+bounces-4506-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B6980A04F
	for <lists+linux-doc@lfdr.de>; Fri,  8 Dec 2023 11:10:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2AB98281934
	for <lists+linux-doc@lfdr.de>; Fri,  8 Dec 2023 10:10:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 090E412E64;
	Fri,  8 Dec 2023 10:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="N3QOUT7B"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BC1A171F
	for <linux-doc@vger.kernel.org>; Fri,  8 Dec 2023 02:10:07 -0800 (PST)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-5d1ed4b268dso23673127b3.0
        for <linux-doc@vger.kernel.org>; Fri, 08 Dec 2023 02:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702030206; x=1702635006; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=d4MXXH5cbPxzFQMx+eKCBMLxcs0KvqjK2kPkW0nLFkA=;
        b=N3QOUT7B/2U9w0TIVO9Yaxwm3671HaMgZ5oIpgtryVcoN3WkcNoYKTtnOI/8Yxc/qS
         U47kE6h/WP1McWitCqImdtG/mllGttk+w1GHfaqTqVTI/VC8E7GNlYbhFkGSYX0/lwDR
         3GA8FyMeONKItTIF73tIWVsYTL2bNQYW4bf5NNbvypkq5vjMbT9N1OYZWQzRi2EJTUGl
         RDW3qwuYb/D3PuCaWMpsXbAO78OkAFZVk80ygFkvRLUnRKgoaCJnv6o4e1rRIT8ylUDw
         3A5mR86qCWGY9JMuRW0jWkdnGp+nO0j78t0YjclCV3zIZSilVfCEEaKQoffj4qlmBWC7
         J/lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702030206; x=1702635006;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d4MXXH5cbPxzFQMx+eKCBMLxcs0KvqjK2kPkW0nLFkA=;
        b=XMF8sT4tLl2gSEwK5LAUCd+QXSNhyLVJKD3yRvJScFoKQTn9M1ckmm8iqbZN8N4QBT
         akghpfW551VMVYKmZL4fi6921yfUI3ICzINb/El1QEfpSyZHbs5NS47h1f4uj+q+hrYK
         ppl/sV12pM5AWfbSPRmL79MYuckMKj3EzNCn+9jDGkDnwJpfPZs9IFhf+YOh4tv6r4Ff
         N1P8mwyWw/L4+JWxrQYFxDng4ifS30lMGYZuN83m4UVKGgwz3JLhFhrybOk8KDcf3azG
         rxQNyH4LpfCefHL2kzuH87fzvOA7XuFHsG7I0T5Gd3HRfFhDPg5t183U9xL93B7qeYtF
         DWtg==
X-Gm-Message-State: AOJu0YxYpTZiQhiqcS5qhyjMah3SkCQ2CEmw5/E2hrnVvzV4E9Uo72eg
	BRpAIDTil9vnv/37h8VqRiLPSTwelMszjw==
X-Google-Smtp-Source: AGHT+IGRCKchlwDieJP65LzkIospb19LMxwfhEMGz5PddR5fY3t/b8MjzABJjvWV9MENqxn3YYZ6m3IfVjrfog==
X-Received: from slicestar.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:20a1])
 (user=davidgow job=sendgmr) by 2002:a81:be18:0:b0:5d4:27ab:83c with SMTP id
 i24-20020a81be18000000b005d427ab083cmr58978ywn.1.1702030206337; Fri, 08 Dec
 2023 02:10:06 -0800 (PST)
Date: Fri, 08 Dec 2023 18:09:32 +0800
In-Reply-To: <20231208-kunit_bus-v2-0-e95905d9b325@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20231208-kunit_bus-v2-0-e95905d9b325@google.com>
X-Mailer: b4 0.13-dev-099c9
Message-ID: <20231208-kunit_bus-v2-4-e95905d9b325@google.com>
Subject: [PATCH v2 4/4] ASoC: topology: Replace fake root_device with
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


