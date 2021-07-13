Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E59063C705D
	for <lists+linux-doc@lfdr.de>; Tue, 13 Jul 2021 14:34:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236297AbhGMMhM (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 13 Jul 2021 08:37:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236269AbhGMMhL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 13 Jul 2021 08:37:11 -0400
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EC45C0613E9;
        Tue, 13 Jul 2021 05:34:20 -0700 (PDT)
Received: by mail-qk1-x733.google.com with SMTP id q190so21402136qkd.2;
        Tue, 13 Jul 2021 05:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=pSeMtW8BpRbMXDYey50SBVUGrM7QO07Rk8/NIMU9w+U=;
        b=Q2y4oNMv0GdANtpzQJVravalvuoUborhUBnnjxvHZ29i+WUxp95RRPe/p0/LkRkfMb
         LlvmfuBDX2MhEUHHcszmwN9KIQIqEfu+db9CLzF1sF2opxKqGcUhgMBDWua2yIQIEXon
         JQbcScNS6Xtc95vHFNoRXkcTxj9S/XNY5S4H//CUQAOCcAgaYBp2XBTVsHmVYAVVKGu4
         ghf6IFlNbkfdgnls8Qgb74vWQp9Edlz8P4KTjLFmuzB/IbOzV2ZB9I34W00NcmJVdW7g
         YYfPAAlQzbr2V1rJGkL3Z9WoLCCi/NUdjGJPY30IXt2KPJJYy1radO45fiaTKF9N5aau
         x9Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=pSeMtW8BpRbMXDYey50SBVUGrM7QO07Rk8/NIMU9w+U=;
        b=JgwV0o40TOZfL1lkCMweKmMYdVynodsFHdkG4Kn/Oao95RFbhjW8yVdz1pEPJWIK0a
         363/BD5OfBAJp9IqpoHi3Ev+nPleci5ehSV5Qs6b+mht2xgwwTecZkRU+43xJ3jwMiC/
         AA6Virk8iULgx223B6pSnhUmj+1XaiWejtWGuX9F8tE99yXvGr37mEEGQ0krC4JNlauU
         yRDa2c/5eXJdi5paX9OfFPuhI/XXHKSNEtYzurZ3jdox/fGkx21AzVyUaXH5AT/M9IPa
         78Z+G2YHVKnPEbQ7o4NqZrdWvSPMiNFmhC/8V2eKtM9xR/xIl++KoM3qK6OiVcNuoJpp
         OpFQ==
X-Gm-Message-State: AOAM533Au0gADEVI1zc8/X+7ZlZLl3a6W1mjBbPKyFfs2ZEBesokzA7p
        HimLw2gmsu0VSWQCy42CX5c=
X-Google-Smtp-Source: ABdhPJwxI1D18TL3n2H+6he70xSJnt1u+DjgrNingA++jTEgaTvKGvaPp/uNKtPBfVSXIpEcFVkZfA==
X-Received: by 2002:a37:b0a:: with SMTP id 10mr3969330qkl.291.1626179659816;
        Tue, 13 Jul 2021 05:34:19 -0700 (PDT)
Received: from localhost.localdomain (ec2-35-169-212-159.compute-1.amazonaws.com. [35.169.212.159])
        by smtp.gmail.com with ESMTPSA id k14sm6849327qtm.18.2021.07.13.05.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jul 2021 05:34:19 -0700 (PDT)
From:   SeongJae Park <sj38.park@gmail.com>
To:     akpm@linux-foundation.org
Cc:     SeongJae Park <sjpark@amazon.de>, Jonathan.Cameron@Huawei.com,
        acme@kernel.org, alexander.shishkin@linux.intel.com,
        amit@kernel.org, benh@kernel.crashing.org,
        brendanhiggins@google.com, corbet@lwn.net, david@redhat.com,
        dwmw@amazon.com, elver@google.com, fan.du@intel.com,
        foersleo@amazon.de, greg@kroah.com, gthelen@google.com,
        guoju.fgj@alibaba-inc.com, jgowans@amazon.com, mgorman@suse.de,
        mheyne@amazon.de, minchan@kernel.org, mingo@redhat.com,
        namhyung@kernel.org, peterz@infradead.org, riel@surriel.com,
        rientjes@google.com, rostedt@goodmis.org, rppt@kernel.org,
        shakeelb@google.com, shuah@kernel.org, sieberf@amazon.com,
        sj38.park@gmail.com, snu@zelle79.org, vbabka@suse.cz,
        vdavydov.dev@gmail.com, zgf574564920@gmail.com,
        linux-damon@amazon.com, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v33 04/13] mm/idle_page_tracking: Make PG_idle reusable
Date:   Tue, 13 Jul 2021 12:33:47 +0000
Message-Id: <20210713123356.6924-5-sj38.park@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210713123356.6924-1-sj38.park@gmail.com>
References: <20210713123356.6924-1-sj38.park@gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: SeongJae Park <sjpark@amazon.de>

PG_idle and PG_young allow the two PTE Accessed bit users, Idle Page
Tracking and the reclaim logic concurrently work while not interfering
with each other.  That is, when they need to clear the Accessed bit,
they set PG_young to represent the previous state of the bit,
respectively.  And when they need to read the bit, if the bit is
cleared, they further read the PG_young to know whether the other has
cleared the bit meanwhile or not.

For yet another user of the PTE Accessed bit, we could add another page
flag, or extend the mechanism to use the flags. For the DAMON usecase,
however, we don't need to do that just yet.  IDLE_PAGE_TRACKING and
DAMON are mutually exclusive, so there's only ever going to be one user
of the current set of flags.

In this commit, we split out the CONFIG options to allow for the use of
PG_young and PG_idle outside of idle page tracking.

In the next commit, DAMON's reference implementation of the virtual
memory address space monitoring primitives will use it.

Signed-off-by: SeongJae Park <sjpark@amazon.de>
Reviewed-by: Shakeel Butt <shakeelb@google.com>
Reviewed-by: Fernand Sieber <sieberf@amazon.com>
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
index 5922031ffab6..5621d628914d 100644
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
@@ -439,7 +439,7 @@ PAGEFLAG_FALSE(HWPoison)
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
index 390270e00a1d..d428f0137c49 100644
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
index f5f4fddc67b1..0ef9e53cb9bd 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -742,10 +742,18 @@ config DEFERRED_STRUCT_PAGE_INIT
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
index 293b2685fc48..dfb91653d359 100644
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

