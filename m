Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9513132D0CC
	for <lists+linux-doc@lfdr.de>; Thu,  4 Mar 2021 11:34:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238558AbhCDKcC (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 4 Mar 2021 05:32:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238568AbhCDKbo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 4 Mar 2021 05:31:44 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BA6EC06178A
        for <linux-doc@vger.kernel.org>; Thu,  4 Mar 2021 02:30:16 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id w203-20020a1c49d40000b029010c706d0642so4269848wma.0
        for <linux-doc@vger.kernel.org>; Thu, 04 Mar 2021 02:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5N+MBnaBVQGCO/pRFImYa4+XMDd5iqbeG7mNtUIosOw=;
        b=gHpN5klU7JQxNonCvCtMPp1igK591qAoysgQeeGZdcjlrws6Bp58/0R1uU1wAPHPEh
         12xujkbkBQ1YDhyNQPmjh9HvqXy+74U4WRbaRhbKa/j9spySctNtmDhDu2ssrfIUj2sX
         NNcV2f1gfs1RyJR9h3pwB8jqsghUh/THuhF8/V6pvQO+adFFB9wQ25RF4xdFJueJOYtq
         HraM02Ebds+0qONLE4N8lxu770LXGqZWtdZ5uY5sYZeAy/ces5SNSbDE+OHklyyXD1UA
         a9vtBKQ6eclmRKm/jQ03RWVL4TTkp1ptuaxrpRJLn306h6FWQRxDlvPetAhRxdpL3FDn
         OGzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5N+MBnaBVQGCO/pRFImYa4+XMDd5iqbeG7mNtUIosOw=;
        b=OfkLJTnHeMEiAERubHMTbfOEnx3Hu2OcfyjSpmtXU+FeQ0rRMGv4IfrMnspE22CMVi
         wn57UGpPuRsvvJoxFfP0TDKW1ck/KxA1Issrv/ttuxHIga4lsG4zhXmdwCVx7qk330Wn
         CTr2I3bN4ijVnSDtTEPrOC7wAO9hkXmlb198NmlQJcp16YGxJ33ZrmWkrIud1i1+GAam
         a9x43inQf8Lu4zNAbdD4zbHmlv0y9NppU8LX+JCNJ/dwgm4f0fdonus6OJ/J+lvMMsx5
         4cRnyhUYc5zylt8Z9qr9dSb1bjSb2DWaqW1RHVoGYBaqns4bhYsUbY+B0qbX9zcvrzWi
         VE4g==
X-Gm-Message-State: AOAM531fGmVXyVgnne5j8snBNR0PJ5cMU7YA+JTE47ON2Bt4+vwfEwvv
        PfGh8rhZjQyuY/WL7Lz88w0vug==
X-Google-Smtp-Source: ABdhPJxGsvjrc2QvO6hHXj4n4kIhldbkPug4Ob8YItFemOynzGAlYw814WIwxJ8ZYo+M3I49ZbV27w==
X-Received: by 2002:a05:600c:3550:: with SMTP id i16mr3222940wmq.170.1614853814702;
        Thu, 04 Mar 2021 02:30:14 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id f7sm35501854wre.78.2021.03.04.02.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Mar 2021 02:30:14 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Joel Becker <jlbec@evilplan.org>, Christoph Hellwig <hch@lst.de>,
        Shuah Khan <shuah@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Kent Gibson <warthog618@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 10/12] selftests: gpio: provide a helper for reading chip info
Date:   Thu,  4 Mar 2021 11:24:50 +0100
Message-Id: <20210304102452.21726-11-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20210304102452.21726-1-brgl@bgdev.pl>
References: <20210304102452.21726-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Add a simple program that allows to retrieve chip properties from the
GPIO character device. This will be used in gpio-sim selftests.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 tools/testing/selftests/gpio/.gitignore       |  1 +
 tools/testing/selftests/gpio/Makefile         |  2 +-
 tools/testing/selftests/gpio/gpio-chip-info.c | 57 +++++++++++++++++++
 3 files changed, 59 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/gpio/gpio-chip-info.c

diff --git a/tools/testing/selftests/gpio/.gitignore b/tools/testing/selftests/gpio/.gitignore
index a4969f7ee020..4ea4f58dab1a 100644
--- a/tools/testing/selftests/gpio/.gitignore
+++ b/tools/testing/selftests/gpio/.gitignore
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
 gpio-mockup-cdev
+gpio-chip-info
diff --git a/tools/testing/selftests/gpio/Makefile b/tools/testing/selftests/gpio/Makefile
index 39f2bbe8dd3d..84b48547f94c 100644
--- a/tools/testing/selftests/gpio/Makefile
+++ b/tools/testing/selftests/gpio/Makefile
@@ -2,6 +2,6 @@
 
 TEST_PROGS := gpio-mockup.sh
 TEST_FILES := gpio-mockup-sysfs.sh
-TEST_GEN_PROGS_EXTENDED := gpio-mockup-cdev
+TEST_GEN_PROGS_EXTENDED := gpio-mockup-cdev gpio-chip-info
 
 include ../lib.mk
diff --git a/tools/testing/selftests/gpio/gpio-chip-info.c b/tools/testing/selftests/gpio/gpio-chip-info.c
new file mode 100644
index 000000000000..4d26fa7c254a
--- /dev/null
+++ b/tools/testing/selftests/gpio/gpio-chip-info.c
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * GPIO character device helper for reading chip information.
+ *
+ * Copyright (C) 2021 Bartosz Golaszewski <bgolaszewski@baylibre.com>
+ */
+
+#include <fcntl.h>
+#include <linux/gpio.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/ioctl.h>
+#include <sys/types.h>
+
+static void print_usage(void)
+{
+	printf("usage:\n");
+	printf("  gpio-chip-info <chip path> [name|label|num-lines]\n");
+}
+
+int main(int argc, char **argv)
+{
+	struct gpiochip_info info;
+	int fd, ret;
+
+	if (argc !=3) {
+		print_usage();
+		return EXIT_FAILURE;
+	}
+
+	fd = open(argv[1], O_RDWR);
+	if (fd < 0) {
+		perror("unable to open the GPIO chip");
+		return EXIT_FAILURE;
+	}
+
+	memset(&info, 0, sizeof(info));
+	ret = ioctl(fd, GPIO_GET_CHIPINFO_IOCTL, &info);
+	if (ret) {
+		perror("chip info ioctl failed");
+		return EXIT_FAILURE;
+	}
+
+	if (strcmp(argv[2], "name") == 0) {
+		printf("%s\n", info.name);
+	} else if (strcmp(argv[2], "label") == 0) {
+		printf("%s\n", info.label);
+	} else if (strcmp(argv[2], "num-lines") == 0) {
+		printf("%u\n", info.lines);
+	} else {
+		fprintf(stderr, "unknown command: %s\n", argv[2]);
+		return EXIT_FAILURE;
+	}
+
+	return EXIT_SUCCESS;
+}
-- 
2.29.1

