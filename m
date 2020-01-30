Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE46014E607
	for <lists+linux-doc@lfdr.de>; Fri, 31 Jan 2020 00:09:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727772AbgA3XIz (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 30 Jan 2020 18:08:55 -0500
Received: from mail-pg1-f202.google.com ([209.85.215.202]:35824 "EHLO
        mail-pg1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727770AbgA3XIp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 30 Jan 2020 18:08:45 -0500
Received: by mail-pg1-f202.google.com with SMTP id 2so2774293pgd.2
        for <linux-doc@vger.kernel.org>; Thu, 30 Jan 2020 15:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=VLqpq28FQRNQIVptajpFe63XhXFy0jhE9mXehwRafIA=;
        b=jz7FW5QU7Lk7TNOglAB0pQLHAXY15yKO+wUPozFqMZXyMlBLlb6/X5oUjtRgVLQoX5
         leNaWs2uAAoWweShkRCnuCM8GAhGpe2U/pdwmZFC+YZY/8Y3bg4lXRQnLBrq6XdKHZpq
         14wtOnyDqjspPfbK9+mSK/qcSo7QHDPN7wzK/oM2+WSP7brw45o+sfHNjF0eG3KuuTgW
         KusUu8QrBJB2TWX08qxa06d8cbGlCHz7UsUiBq3VON2Kv3zJqZNO22MMFKt7LbzxkzPu
         IBzxyH5QZSUj3GDAGOAYnHSNvOPpyEQnauUuT5CHnuMeqvdkZRAEQJo9Slwod8umeU91
         UIWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=VLqpq28FQRNQIVptajpFe63XhXFy0jhE9mXehwRafIA=;
        b=WkdZqem2JguYMOprk9SLFPrIbhiQl1OOcVbud+RJkSMstzoZkm1Z87jGMrsaWtblDa
         Xa6cp0THAD6qcTnyHq3WEQ3srp8YFZ58EiD3hh54Nk0oHf2Zb+uSVGjig+5y99iOSqNQ
         auOJHJDLO3aQf7Za3KvCO+2fYEuM+Szc8WKs/aKcny20FUPIF+KydRu+1UqVur6ZJ5EC
         fEpYF4CQuzFUntKs7UVuzhS426s3ABJU+U9z8vEFkMgR7HEe9rma5y158UIwEkeKzXl9
         2VzkCWJt8eB3dSy3r3fUs4G53GlWzcLrmY4htOv7n5d2z7kxsBNqueWu01xHDS8gwHT5
         A/sg==
X-Gm-Message-State: APjAAAXetwoUNgg6VMYhfciusdLUdfJ1f+s3cEIVaeS0VqvK8+NIRBKL
        OK93+B5v8yW4J5xf5YPWhdWiARJCAI4lzu+DGUykfQ==
X-Google-Smtp-Source: APXvYqzBqNRIyEKJeeJ3vuVUa5lujbAxG836k8LFK157Mt4Z9zRai9oKPPjbAb0UbTVrzR42WihyGzrGGGpxul8Euvoifw==
X-Received: by 2002:a63:1119:: with SMTP id g25mr7065313pgl.359.1580425724082;
 Thu, 30 Jan 2020 15:08:44 -0800 (PST)
Date:   Thu, 30 Jan 2020 15:08:11 -0800
In-Reply-To: <20200130230812.142642-1-brendanhiggins@google.com>
Message-Id: <20200130230812.142642-7-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20200130230812.142642-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
Subject: [PATCH v2 6/7] kunit: Add 'kunit_shutdown' option
From:   Brendan Higgins <brendanhiggins@google.com>
To:     jdike@addtoit.com, richard@nod.at, anton.ivanov@cambridgegreys.com,
        arnd@arndb.de, keescook@chromium.org, skhan@linuxfoundation.org,
        alan.maguire@oracle.com, yzaikin@google.com, davidgow@google.com,
        akpm@linux-foundation.org, rppt@linux.ibm.com,
        frowand.list@gmail.com
Cc:     gregkh@linuxfoundation.org, sboyd@kernel.org, logang@deltatee.com,
        mcgrof@kernel.org, knut.omang@oracle.com,
        linux-um@lists.infradead.org, linux-arch@vger.kernel.org,
        linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        Brendan Higgins <brendanhiggins@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: David Gow <davidgow@google.com>

Add a new kernel command-line option, 'kunit_shutdown', which allows the
user to specify that the kernel poweroff, halt, or reboot after
completing all KUnit tests; this is very handy for running KUnit tests
on UML or a VM so that the UML/VM process exits cleanly immediately
after running all tests without needing a special initramfs.

Signed-off-by: David Gow <davidgow@google.com>
Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
Reviewed-by: Stephen Boyd <sboyd@kernel.org>
---
 lib/kunit/executor.c                | 20 ++++++++++++++++++++
 tools/testing/kunit/kunit_kernel.py |  2 +-
 tools/testing/kunit/kunit_parser.py |  2 +-
 3 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/lib/kunit/executor.c b/lib/kunit/executor.c
index 7fd16feff157e..a93821116ccec 100644
--- a/lib/kunit/executor.c
+++ b/lib/kunit/executor.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 
+#include <linux/reboot.h>
 #include <kunit/test.h>
 
 /*
@@ -11,6 +12,23 @@ extern struct kunit_suite * const * const __kunit_suites_end[];
 
 #if IS_BUILTIN(CONFIG_KUNIT)
 
+static char *kunit_shutdown;
+core_param(kunit_shutdown, kunit_shutdown, charp, 0644);
+
+static void kunit_handle_shutdown(void)
+{
+	if (!kunit_shutdown)
+		return;
+
+	if (!strcmp(kunit_shutdown, "poweroff"))
+		kernel_power_off();
+	else if (!strcmp(kunit_shutdown, "halt"))
+		kernel_halt();
+	else if (!strcmp(kunit_shutdown, "reboot"))
+		kernel_restart(NULL);
+
+}
+
 static void kunit_print_tap_header(void)
 {
 	struct kunit_suite * const * const *suites, * const *subsuite;
@@ -42,6 +60,8 @@ int kunit_run_all_tests(void)
 		}
 	}
 
+	kunit_handle_shutdown();
+
 	if (has_test_failed)
 		return -EFAULT;
 
diff --git a/tools/testing/kunit/kunit_kernel.py b/tools/testing/kunit/kunit_kernel.py
index cc5d844ecca13..43314aa537d30 100644
--- a/tools/testing/kunit/kunit_kernel.py
+++ b/tools/testing/kunit/kunit_kernel.py
@@ -141,7 +141,7 @@ class LinuxSourceTree(object):
 		return True
 
 	def run_kernel(self, args=[], timeout=None, build_dir=''):
-		args.extend(['mem=256M'])
+		args.extend(['mem=256M', 'kunit_shutdown=halt'])
 		process = self._ops.linux_bin(args, timeout, build_dir)
 		with open(os.path.join(build_dir, 'test.log'), 'w') as f:
 			for line in process.stdout:
diff --git a/tools/testing/kunit/kunit_parser.py b/tools/testing/kunit/kunit_parser.py
index 78b3bdd03b1e4..633811dd9bce8 100644
--- a/tools/testing/kunit/kunit_parser.py
+++ b/tools/testing/kunit/kunit_parser.py
@@ -48,7 +48,7 @@ class TestStatus(Enum):
 	FAILURE_TO_PARSE_TESTS = auto()
 
 kunit_start_re = re.compile(r'^TAP version [0-9]+$')
-kunit_end_re = re.compile('List of all partitions:')
+kunit_end_re = re.compile(r'reboot: System halted')
 
 def isolate_kunit_output(kernel_output):
 	started = False
-- 
2.25.0.341.g760bfbb309-goog

