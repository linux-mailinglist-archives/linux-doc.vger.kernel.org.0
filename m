Return-Path: <linux-doc+bounces-61654-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED9AB99AC5
	for <lists+linux-doc@lfdr.de>; Wed, 24 Sep 2025 13:52:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 48BC3322F49
	for <lists+linux-doc@lfdr.de>; Wed, 24 Sep 2025 11:52:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 745AF302748;
	Wed, 24 Sep 2025 11:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DfHfbDgL"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4FE5301716
	for <linux-doc@vger.kernel.org>; Wed, 24 Sep 2025 11:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758714715; cv=none; b=lg8Cv7wQvFHLu1ZN2ewLSe15JG9ae4a08/8OaPzyS10OnNGixHwRdC+mJVdcNVEWJit8rmSAZ7/CSw2Z2HXsvsgH0WHr9Xw7h7QGIX7sOvMRQV//UNQ9Wwra5Z14PxA7d5wRr7+5a9SBJxk3LIvX/slz48h3rByLEgpsaNw5SBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758714715; c=relaxed/simple;
	bh=jXVtZ6lSnaquGQDEy0MV0UKEBAEZnx3Lv2rnYbpvrA0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SJi5irxs1ppJ8Ne2iVLSLOZNmUuJxFgIFSo46wPBzBi5SEYw1m5JjDL8VdBXMlaaWVT/VdYdF/AB9Z0DD/Lqz3ebeCgcnMuyHBcAknbXkmBH1D0CblNjagz1nXGhggbsQ/V678kRA7djLmV04P2WwiAwDjjWjb01AfG0N/JvMQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DfHfbDgL; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-77f68fae1a8so967668b3a.1
        for <linux-doc@vger.kernel.org>; Wed, 24 Sep 2025 04:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758714709; x=1759319509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R1KSy0afhoo56zSKFToL0Rdd0rZ5LRpSk38GpQKE8pg=;
        b=DfHfbDgLV4ZBha5t6gQyH6Z6HtoJbUC/SlhISEprByp358kRbswsG4Jm1wEKBNIpuG
         gTUVsR1qbFjCI/MV3v1Lxvt8DV8/iQOPv9LkjR6U98qIcb8NsaHOexQSm+URUf1PQLR+
         M/ljuYjCx2Ad31uiJ33RY2LvxoU/1qiLpXCj13EBgtNzCD1l0/M9dzwH2ZdumIYLrdzX
         hgw3wKbHrBWYBWZgY4CXJR4+9dHAU9GmLNAm40/8jkq76jsG4RbcGTzDsa0ndzy0e/ST
         /ekQ4LFWq+cD/APMNuS7Ry2xup4l4TSmdq7s8V+bwORSfEPKF78xACfrzpaCINDvQrSA
         BrCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758714709; x=1759319509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R1KSy0afhoo56zSKFToL0Rdd0rZ5LRpSk38GpQKE8pg=;
        b=Gz6Pgn+JXXq9USsC44i1tJNCz8tgihbJCx0RSYTpVgSQl9J5A4TH8LqaXwZgOkLt5y
         t2WBT+o8E/BBbr9ZLRsh8/nBf15VXDV66NAe/axmn0C0/U40Kv0GHnftFFlOQ8E1yF0P
         TuhU/2gniw23uL6LuvoDUkD2nwqADfZXL4+9Mku9rZFnIeSNt969LBx00boymkv3W5C3
         BUHWsKB8tmD6m+Qlb7WQk2/ZodTNR5AcGTkmvi9TZQGI1G0s8ldtnTSb4yZnSt2xY86W
         ZqC5+49tFDSTHUsZ3HT7jQ8O5GlD9DLWGNWNWE/aHSSlzF26ETiMUUFUmwMmWWgbuIVB
         nCvg==
X-Forwarded-Encrypted: i=1; AJvYcCU/LckRnLFaVf8kJp6XfYs8qYepPds8PdMprJhvXuB0ufLwhj1LQELUz3BwFNnSbrsCM4+i+u+ij+w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZQmI2h6rjo+utu4pKEWvd11qllVWqV0IwHxOtJKP5aqwFPO/Y
	TUAwwt1Cg01PqnUyg3ql3e2UwanI7vMMF+Bh0fUFgh+6AXn+UowdFbCy
X-Gm-Gg: ASbGncuUdJ7wYL353ABABC/c8TOYyiMwlosHreVRg4WhozSpYsbT+phjezDZU9WZbX3
	lrvU40trVhHLAomR5CVggSqJGxQhJOjqnz2n+xUfIyY9Z6NgPhWHZsMzugl3vxlpIYEZLYvuilT
	55TeGMUx0t/ldVL+1SM6wJVIbHkTdi91jPJJdBQuBB86WEfXsTf1EBWLAOugpUB5plPWEIpM5++
	DtaWZq4Zc86YUxVbGmLnQbhFQ1p3ddkT2nmd06cyxm5/MyGZtOjBOWrz+fuqX5cNXx/94NaVZ/W
	Cx6XX9gzpNFudkQHUThO3qeLa4xALf4VxTkos13pMw7fCE8xZF31DygKcwChF9YbAqXxRDSn/h8
	avgLb4nEkVe5Aab+/UvJC8mm+23dK8UftqTSB
X-Google-Smtp-Source: AGHT+IFQ5u0/9s5WpxjOT+F0EeKSWL8MVQatB4w+7WUjpnJ2Ax15auMJ/gX34AgvPJn/yfLcWN7oSA==
X-Received: by 2002:a05:6a21:3286:b0:2df:8271:f08d with SMTP id adf61e73a8af0-2df8271fb8dmr2764157637.2.1758714708983;
        Wed, 24 Sep 2025 04:51:48 -0700 (PDT)
Received: from localhost ([23.142.224.65])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f5f9a45dfsm3248137b3a.7.2025.09.24.04.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 04:51:48 -0700 (PDT)
From: Jinchao Wang <wangjinchao600@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	Alexander Potapenko <glider@google.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Kees Cook <kees@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Rong Xu <xur@google.com>,
	Naveen N Rao <naveen@kernel.org>,
	David Kaplan <david.kaplan@amd.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Nam Cao <namcao@linutronix.de>,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-mm@kvack.org,
	llvm@lists.linux.dev,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	kasan-dev@googlegroups.com,
	"David S. Miller" <davem@davemloft.net>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-trace-kernel@vger.kernel.org
Cc: Jinchao Wang <wangjinchao600@gmail.com>
Subject: [PATCH v5 04/23] mm/ksw: add build system support
Date: Wed, 24 Sep 2025 19:50:47 +0800
Message-ID: <20250924115124.194940-5-wangjinchao600@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250924115124.194940-1-wangjinchao600@gmail.com>
References: <20250924115124.194940-1-wangjinchao600@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Kconfig and Makefile infrastructure.

The implementation is located under `mm/kstackwatch/`.

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
---
 mm/Kconfig.debug             |  8 ++++++++
 mm/Makefile                  |  1 +
 mm/kstackwatch/Makefile      |  2 ++
 mm/kstackwatch/kernel.c      | 23 +++++++++++++++++++++++
 mm/kstackwatch/kstackwatch.h |  5 +++++
 mm/kstackwatch/stack.c       |  1 +
 mm/kstackwatch/watch.c       |  1 +
 7 files changed, 41 insertions(+)
 create mode 100644 mm/kstackwatch/Makefile
 create mode 100644 mm/kstackwatch/kernel.c
 create mode 100644 mm/kstackwatch/kstackwatch.h
 create mode 100644 mm/kstackwatch/stack.c
 create mode 100644 mm/kstackwatch/watch.c

diff --git a/mm/Kconfig.debug b/mm/Kconfig.debug
index 32b65073d0cc..89be351c0be5 100644
--- a/mm/Kconfig.debug
+++ b/mm/Kconfig.debug
@@ -309,3 +309,11 @@ config PER_VMA_LOCK_STATS
 	  overhead in the page fault path.
 
 	  If in doubt, say N.
+
+config KSTACK_WATCH
+	bool "Kernel Stack Watch"
+	depends on HAVE_HW_BREAKPOINT && KPROBES && FPROBE && STACKTRACE
+	help
+	  A lightweight real-time debugging tool to detect stack corrupting.
+
+	  If unsure, say N.
diff --git a/mm/Makefile b/mm/Makefile
index ef54aa615d9d..665c9f2bf987 100644
--- a/mm/Makefile
+++ b/mm/Makefile
@@ -92,6 +92,7 @@ obj-$(CONFIG_PAGE_POISONING) += page_poison.o
 obj-$(CONFIG_KASAN)	+= kasan/
 obj-$(CONFIG_KFENCE) += kfence/
 obj-$(CONFIG_KMSAN)	+= kmsan/
+obj-$(CONFIG_KSTACK_WATCH)	+= kstackwatch/
 obj-$(CONFIG_FAILSLAB) += failslab.o
 obj-$(CONFIG_FAIL_PAGE_ALLOC) += fail_page_alloc.o
 obj-$(CONFIG_MEMTEST)		+= memtest.o
diff --git a/mm/kstackwatch/Makefile b/mm/kstackwatch/Makefile
new file mode 100644
index 000000000000..84a46cb9a766
--- /dev/null
+++ b/mm/kstackwatch/Makefile
@@ -0,0 +1,2 @@
+obj-$(CONFIG_KSTACK_WATCH)	+= kstackwatch.o
+kstackwatch-y := kernel.o stack.o watch.o
diff --git a/mm/kstackwatch/kernel.c b/mm/kstackwatch/kernel.c
new file mode 100644
index 000000000000..78f1d019225f
--- /dev/null
+++ b/mm/kstackwatch/kernel.c
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: GPL-2.0
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/module.h>
+
+static int __init kstackwatch_init(void)
+{
+	pr_info("module loaded\n");
+	return 0;
+}
+
+static void __exit kstackwatch_exit(void)
+{
+	pr_info("module unloaded\n");
+}
+
+module_init(kstackwatch_init);
+module_exit(kstackwatch_exit);
+
+MODULE_AUTHOR("Jinchao Wang");
+MODULE_DESCRIPTION("Kernel Stack Watch");
+MODULE_LICENSE("GPL");
+
diff --git a/mm/kstackwatch/kstackwatch.h b/mm/kstackwatch/kstackwatch.h
new file mode 100644
index 000000000000..0273ef478a26
--- /dev/null
+++ b/mm/kstackwatch/kstackwatch.h
@@ -0,0 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _KSTACKWATCH_H
+#define _KSTACKWATCH_H
+
+#endif /* _KSTACKWATCH_H */
diff --git a/mm/kstackwatch/stack.c b/mm/kstackwatch/stack.c
new file mode 100644
index 000000000000..cec594032515
--- /dev/null
+++ b/mm/kstackwatch/stack.c
@@ -0,0 +1 @@
+// SPDX-License-Identifier: GPL-2.0
diff --git a/mm/kstackwatch/watch.c b/mm/kstackwatch/watch.c
new file mode 100644
index 000000000000..cec594032515
--- /dev/null
+++ b/mm/kstackwatch/watch.c
@@ -0,0 +1 @@
+// SPDX-License-Identifier: GPL-2.0
-- 
2.43.0


