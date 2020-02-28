Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD7ED172E3C
	for <lists+linux-doc@lfdr.de>; Fri, 28 Feb 2020 02:21:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730680AbgB1BVO (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 27 Feb 2020 20:21:14 -0500
Received: from mail-pg1-f202.google.com ([209.85.215.202]:40430 "EHLO
        mail-pg1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730668AbgB1BVM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 27 Feb 2020 20:21:12 -0500
Received: by mail-pg1-f202.google.com with SMTP id n7so733657pgt.7
        for <linux-doc@vger.kernel.org>; Thu, 27 Feb 2020 17:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=+RQb0O9/ANDgn7O27sRp5ZtZTpbReSUGwniCuF+Cbp4=;
        b=aVEeGKe22nuT+AY9XSYnyJt98FnHF4PfCk5p8sv4bJiC+R4AJxjBf/mXc0e0toX5Hu
         jvDqabQJ/NjX4KfjQQouS3ID09TUMXxfXSIlk5W3/evKbc4aCMG8eunt9sQsa7CKsz0Y
         jkm/o0h1C3+GMSMQzkbp6YSsrcwLYplOvfDnnDH/ex3TN6z/nKoaJUw5wJDpAPDPci1s
         q+RSfm7HbtJz4tOLR4sxBuird496AqZ6I8yrJx8BCEztWD//3DR2CZz85nDg5CK40aMW
         Sq7XNgHjZcqYet6A3zQF7GGH8LNmFN7REhzxNiJ0UKoWyWo+VIoizh9Ukk3X+1mp0T3c
         eENg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=+RQb0O9/ANDgn7O27sRp5ZtZTpbReSUGwniCuF+Cbp4=;
        b=r032fkHFQV2HkNV423/NNDLlzlTKDkgebouIfk2DZzHDfvrfKZyUfHtcqyoX8lrSFg
         msRV/KFF10nWIjZnMNF755ANq6CQCGCQr5iFeAHc0goiJ8HpU13CScvDhzXOEBttFuBB
         n9ug0nMYIjCQBqucqbJjcey6SHRDuQ25JsgWOX41nOFlvNTmOMIpElR9m+cePxwr/aOu
         M7EWjojz74meABSPom5kU977EFS8XlEHAJB9xBmlTh8a57+H40GXXZ7eQykdVyQa8oyc
         MkwSbWorR4iN00iqloeMsfnZSwEW2NM0u+Rz7WwmmAlVbw+TBjRMDeVKaoYVVfebGWRE
         cfRQ==
X-Gm-Message-State: APjAAAUFATJsgnajz354x40xQIyFa54kpIg++Rd7Q4FeP9p65QHVG9tO
        oOSMVfJxR7oXcqFj5afYE4LdoZaFuvZmbdSp2DrpIQ==
X-Google-Smtp-Source: APXvYqxQ1rOCCg5Gw3xbVsq9larNndZOz8N2rPlyFxHiMX0CbG1fYPY5L0MBjR5rVPDuE7TzH4FU4VdnMiw912h55MWbkQ==
X-Received: by 2002:a63:104a:: with SMTP id 10mr2052540pgq.276.1582852870640;
 Thu, 27 Feb 2020 17:21:10 -0800 (PST)
Date:   Thu, 27 Feb 2020 17:20:35 -0800
In-Reply-To: <20200228012036.15682-1-brendanhiggins@google.com>
Message-Id: <20200228012036.15682-7-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20200228012036.15682-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
Subject: [PATCH v3 6/7] kunit: Add 'kunit_shutdown' option
From:   Brendan Higgins <brendanhiggins@google.com>
To:     jdike@addtoit.com, richard@nod.at, anton.ivanov@cambridgegreys.com,
        arnd@arndb.de, keescook@chromium.org, skhan@linuxfoundation.org,
        alan.maguire@oracle.com, yzaikin@google.com, davidgow@google.com,
        akpm@linux-foundation.org, rppt@linux.ibm.com,
        frowand.list@gmail.com
Cc:     gregkh@linuxfoundation.org, sboyd@kernel.org, logang@deltatee.com,
        mcgrof@kernel.org, linux-um@lists.infradead.org,
        linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org,
        kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org,
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
index d99ae75ef72fa..6cf0697c788b6 100644
--- a/tools/testing/kunit/kunit_kernel.py
+++ b/tools/testing/kunit/kunit_kernel.py
@@ -145,7 +145,7 @@ class LinuxSourceTree(object):
 		return self.validate_config(build_dir)
 
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
2.25.1.481.gfbce0eb801-goog

