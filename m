Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 123BF35E16F
	for <lists+linux-doc@lfdr.de>; Tue, 13 Apr 2021 16:30:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238206AbhDMO3z (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 13 Apr 2021 10:29:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238666AbhDMO3u (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 13 Apr 2021 10:29:50 -0400
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47A55C06138E;
        Tue, 13 Apr 2021 07:29:30 -0700 (PDT)
Received: by mail-qt1-x830.google.com with SMTP id 1so12868055qtb.0;
        Tue, 13 Apr 2021 07:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=1s4UExNkWcqWU42UmfCT6cFm69beRjuQ2X8fnVWZ8C8=;
        b=MlJfAEbJuL9H4Lg27f5C0AXyv8Ing93OyFiG3NLLPNIa8+EKv2gIkgGeMEus/J1oT8
         2P37y+7FArUQrNOjwOpi2816fbBGbSS3LHjfCWLf+Bxu5DukeVjVjNUBzqsQDobyNaAq
         RNR+veEw8vFtyZDnu8MO9YuSWRXcmXWleICi0DFgZ1uaY7TWwTuMgbw+sP+Y0C8PIkMj
         MQ86G8NCBbna9IZuIGJe6P1BpwYHudJO8EsngMuc/6x4vR7UCzPKtzpTvEVZFXDCnvFL
         byauBCofCllG13jWp5K2PjjMPt4CkS32cNCEV2jSMkJxdlUv3qU0PRTRDnpdDjGytlje
         2/xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=1s4UExNkWcqWU42UmfCT6cFm69beRjuQ2X8fnVWZ8C8=;
        b=DWYJNBmHUfCB+dpaWUxoVMKSOq7cWg9jVQ0+zL1eoparjpVB/7RwiV5imADjq3MVeb
         Jtyx8mcLC8l908xQXKKTTaV+aITfp6NA2g+cFe2dxk7JNSfRfJ2+6AoWb77wtaZhwK5a
         3/Dldv62KO8kSlOEwDJxd5FLzTpJPs2pU32YR5ucAc+w1r5+XAituNGKrPQB+RjY7gvL
         FfVrpzWGdNv9oyKJP0U4BfflNjE9ICK96wG9i082qSVcjnwRmMjug/vINhYWkBlyzSZM
         d479cRGLnqMjlkB1q/5VK/1TjVGxZ9dKcIuxtSmDefrbmvaSAE0URJxrM+R5jFr8X6XT
         dFUA==
X-Gm-Message-State: AOAM533FqhFJXKrW36BmR3WQTcL6aOgb6KlYpQSgsZ/cXdar03kkmFb2
        K8oV43W59zEgvugdQZlmNpE=
X-Google-Smtp-Source: ABdhPJyQ59CF/FCoqtsTJoL8CT8L0yoCcQXbYBDnMI7rafDZ2Ftu3B3zfG30m1/Atcde3PpKOLvnzQ==
X-Received: by 2002:a05:622a:54a:: with SMTP id m10mr4256040qtx.298.1618324169411;
        Tue, 13 Apr 2021 07:29:29 -0700 (PDT)
Received: from localhost.localdomain (ec2-35-169-212-159.compute-1.amazonaws.com. [35.169.212.159])
        by smtp.gmail.com with ESMTPSA id 2sm6160911qko.134.2021.04.13.07.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 07:29:28 -0700 (PDT)
From:   SeongJae Park <sj38.park@gmail.com>
To:     akpm@linux-foundation.org
Cc:     SeongJae Park <sjpark@amazon.de>, Jonathan.Cameron@Huawei.com,
        acme@kernel.org, alexander.shishkin@linux.intel.com,
        amit@kernel.org, benh@kernel.crashing.org,
        brendanhiggins@google.com, corbet@lwn.net, david@redhat.com,
        dwmw@amazon.com, elver@google.com, fan.du@intel.com,
        foersleo@amazon.de, greg@kroah.com, gthelen@google.com,
        guoju.fgj@alibaba-inc.com, mgorman@suse.de, minchan@kernel.org,
        mingo@redhat.com, namhyung@kernel.org, peterz@infradead.org,
        riel@surriel.com, rientjes@google.com, rostedt@goodmis.org,
        rppt@kernel.org, shakeelb@google.com, shuah@kernel.org,
        sj38.park@gmail.com, snu@amazon.de, vbabka@suse.cz,
        vdavydov.dev@gmail.com, zgf574564920@gmail.com,
        linux-damon@amazon.com, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v28 04/13] mm/idle_page_tracking: Make PG_idle reusable
Date:   Tue, 13 Apr 2021 14:28:55 +0000
Message-Id: <20210413142904.556-5-sj38.park@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210413142904.556-1-sj38.park@gmail.com>
References: <20210413142904.556-1-sj38.park@gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: SeongJae Park <sjpark@amazon.de>

PG_idle and PG_young allow the two PTE Accessed bit users, Idle Page
Tracking and the reclaim logic concurrently work while don't interfere
each other.  That is, when they need to clear the Accessed bit, they set
PG_young to represent the previous state of the bit, respectively.  And
when they need to read the bit, if the bit is cleared, they further read
the PG_young to know whether the other has cleared the bit meanwhile or
not.

We could add another page flag and extend the mechanism to use the flag
if we need to add another concurrent PTE Accessed bit user subsystem.
However, the space is limited.  Meanwhile, if the new subsystem is
mutually exclusive with IDLE_PAGE_TRACKING or interfering with it is not
a real problem, it would be ok to simply reuse the PG_idle flag.
However, it's impossible because the flags are dependent on
IDLE_PAGE_TRACKING.

To allow such reuse of the flags, this commit separates the PG_young and
PG_idle flag logic from IDLE_PAGE_TRACKING and introduces new kernel
config, 'PAGE_IDLE_FLAG'.  Hence, a new subsystem would be able to reuse
PG_idle without depending on IDLE_PAGE_TRACKING.

In the next commit, DAMON's reference implementation of the virtual
memory address space monitoring primitives will use it.

Signed-off-by: SeongJae Park <sjpark@amazon.de>
Reviewed-by: Shakeel Butt <shakeelb@google.com>
---
 include/linux/page-flags.h     |  4 ++--
 include/linux/page_ext.h       |  2 +-
 include/linux/page_idle.h      |  6 +++---
 include/trace/events/mmflags.h |  2 +-
 mm/Kconfig                     |  8 ++++++++
 mm/page_ext.c                  | 12 +++++++++++-
 mm/page_idle.c                 | 10 ----------
 7 files changed, 26 insertions(+), 18 deletions(-)

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index 04a34c08e0a6..6be2c1e2fb48 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -131,7 +131,7 @@ enum pageflags {
 #ifdef CONFIG_MEMORY_FAILURE
 	PG_hwpoison,		/* hardware poisoned page. Don't touch */
 #endif
-#if defined(CONFIG_IDLE_PAGE_TRACKING) && defined(CONFIG_64BIT)
+#if defined(CONFIG_PAGE_IDLE_FLAG) && defined(CONFIG_64BIT)
 	PG_young,
 	PG_idle,
 #endif
@@ -436,7 +436,7 @@ PAGEFLAG_FALSE(HWPoison)
 #define __PG_HWPOISON 0
 #endif
 
-#if defined(CONFIG_IDLE_PAGE_TRACKING) && defined(CONFIG_64BIT)
+#if defined(CONFIG_PAGE_IDLE_FLAG) && defined(CONFIG_64BIT)
 TESTPAGEFLAG(Young, young, PF_ANY)
 SETPAGEFLAG(Young, young, PF_ANY)
 TESTCLEARFLAG(Young, young, PF_ANY)
diff --git a/include/linux/page_ext.h b/include/linux/page_ext.h
index aff81ba31bd8..fabb2e1e087f 100644
--- a/include/linux/page_ext.h
+++ b/include/linux/page_ext.h
@@ -19,7 +19,7 @@ struct page_ext_operations {
 enum page_ext_flags {
 	PAGE_EXT_OWNER,
 	PAGE_EXT_OWNER_ALLOCATED,
-#if defined(CONFIG_IDLE_PAGE_TRACKING) && !defined(CONFIG_64BIT)
+#if defined(CONFIG_PAGE_IDLE_FLAG) && !defined(CONFIG_64BIT)
 	PAGE_EXT_YOUNG,
 	PAGE_EXT_IDLE,
 #endif
diff --git a/include/linux/page_idle.h b/include/linux/page_idle.h
index 1e894d34bdce..d8a6aecf99cb 100644
--- a/include/linux/page_idle.h
+++ b/include/linux/page_idle.h
@@ -6,7 +6,7 @@
 #include <linux/page-flags.h>
 #include <linux/page_ext.h>
 
-#ifdef CONFIG_IDLE_PAGE_TRACKING
+#ifdef CONFIG_PAGE_IDLE_FLAG
 
 #ifdef CONFIG_64BIT
 static inline bool page_is_young(struct page *page)
@@ -106,7 +106,7 @@ static inline void clear_page_idle(struct page *page)
 }
 #endif /* CONFIG_64BIT */
 
-#else /* !CONFIG_IDLE_PAGE_TRACKING */
+#else /* !CONFIG_PAGE_IDLE_FLAG */
 
 static inline bool page_is_young(struct page *page)
 {
@@ -135,6 +135,6 @@ static inline void clear_page_idle(struct page *page)
 {
 }
 
-#endif /* CONFIG_IDLE_PAGE_TRACKING */
+#endif /* CONFIG_PAGE_IDLE_FLAG */
 
 #endif /* _LINUX_MM_PAGE_IDLE_H */
diff --git a/include/trace/events/mmflags.h b/include/trace/events/mmflags.h
index 629c7a0eaff2..ea434bbc2d2b 100644
--- a/include/trace/events/mmflags.h
+++ b/include/trace/events/mmflags.h
@@ -73,7 +73,7 @@
 #define IF_HAVE_PG_HWPOISON(flag,string)
 #endif
 
-#if defined(CONFIG_IDLE_PAGE_TRACKING) && defined(CONFIG_64BIT)
+#if defined(CONFIG_PAGE_IDLE_FLAG) && defined(CONFIG_64BIT)
 #define IF_HAVE_PG_IDLE(flag,string) ,{1UL << flag, string}
 #else
 #define IF_HAVE_PG_IDLE(flag,string)
diff --git a/mm/Kconfig b/mm/Kconfig
index 04b66c8df24a..7be2bc06b7d8 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -770,10 +770,18 @@ config DEFERRED_STRUCT_PAGE_INIT
 	  lifetime of the system until these kthreads finish the
 	  initialisation.
 
+config PAGE_IDLE_FLAG
+	bool "Add PG_idle and PG_young flags"
+	help
+	  This feature adds PG_idle and PG_young flags in 'struct page'.  PTE
+	  Accessed bit writers can set the state of the bit in the flags to let
+	  other PTE Accessed bit readers don't disturbed.
+
 config IDLE_PAGE_TRACKING
 	bool "Enable idle page tracking"
 	depends on SYSFS && MMU
 	select PAGE_EXTENSION if !64BIT
+	select PAGE_IDLE_FLAG
 	help
 	  This feature allows to estimate the amount of user pages that have
 	  not been touched during a given period of time. This information can
diff --git a/mm/page_ext.c b/mm/page_ext.c
index df6f74aac8e1..8e59da0f4367 100644
--- a/mm/page_ext.c
+++ b/mm/page_ext.c
@@ -58,11 +58,21 @@
  * can utilize this callback to initialize the state of it correctly.
  */
 
+#if defined(CONFIG_PAGE_IDLE_FLAG) && !defined(CONFIG_64BIT)
+static bool need_page_idle(void)
+{
+	return true;
+}
+struct page_ext_operations page_idle_ops = {
+	.need = need_page_idle,
+};
+#endif
+
 static struct page_ext_operations *page_ext_ops[] = {
 #ifdef CONFIG_PAGE_OWNER
 	&page_owner_ops,
 #endif
-#if defined(CONFIG_IDLE_PAGE_TRACKING) && !defined(CONFIG_64BIT)
+#if defined(CONFIG_PAGE_IDLE_FLAG) && !defined(CONFIG_64BIT)
 	&page_idle_ops,
 #endif
 };
diff --git a/mm/page_idle.c b/mm/page_idle.c
index 64e5344a992c..edead6a8a5f9 100644
--- a/mm/page_idle.c
+++ b/mm/page_idle.c
@@ -207,16 +207,6 @@ static const struct attribute_group page_idle_attr_group = {
 	.name = "page_idle",
 };
 
-#ifndef CONFIG_64BIT
-static bool need_page_idle(void)
-{
-	return true;
-}
-struct page_ext_operations page_idle_ops = {
-	.need = need_page_idle,
-};
-#endif
-
 static int __init page_idle_init(void)
 {
 	int err;
-- 
2.17.1

