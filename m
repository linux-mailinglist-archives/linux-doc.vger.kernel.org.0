Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68D4931900B
	for <lists+linux-doc@lfdr.de>; Thu, 11 Feb 2021 17:34:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229886AbhBKQcZ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 11 Feb 2021 11:32:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231933AbhBKQaO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 11 Feb 2021 11:30:14 -0500
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34074C061BC3
        for <linux-doc@vger.kernel.org>; Thu, 11 Feb 2021 08:24:52 -0800 (PST)
Received: by mail-qt1-x82a.google.com with SMTP id n28so4528463qtv.12
        for <linux-doc@vger.kernel.org>; Thu, 11 Feb 2021 08:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=9bnQ1cYpKSogma2d9jSskcM/kWG+ieYizroT/wf+fYw=;
        b=WODa48jsTpc63QHw5FszzREapyzJwNIdi4zMwsb/OF7Vb+YxOJ0hgIKn7IK8jh3rym
         rust/hchPAkbOJ2y4p3gyYc38ZFO4i/1CMQ0oJRJlc/R8VELWxey2akgNx6IW1dn9nU+
         ZHnf8rVuYFTRMLLLWPMQR3+2tgmc4FtFbEHnit1IbshBgMWHiK59ewUELVJtd/zqxMKi
         BCOm3l+ZJMvOFuKcnepN/dZ8cEs688MbXhURh9J1/AsWlXCH5ha2VXczrlbCZiNa4n7+
         sZcOF5MDwfA0WtB9t1t8d4hZB0TqRlRqNnWbd5xfnnzoodp7RkPajrTt/hln5oa1/jrE
         bKpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9bnQ1cYpKSogma2d9jSskcM/kWG+ieYizroT/wf+fYw=;
        b=ZA2Zycr2O1RHuoM8/jYBvAeebSP0KOI5yNdqXfG+N2I4X4LDF+SLkfmehRXi7E+WC3
         EM39VQYNN5j0QjSbpbtuAqcV+T3RhE+KTUO/9ahdIT1OAus2WX6ggmEcDRoeGrEfbip+
         3QLzTn/WGqBkefSiFsssSKfIEhMK6AmaO+2cmQKpDYz0k5l50xIvhyDyuY+KOxOWK6+n
         JrkFf4W01s28qAMIMm9f33epN4HwVGMiQwAJ/7OiXBPjGApobDGiFmOi8avD7bKG2WUy
         i6K9OD5FCq2ZrvaK6wRAlZpn+AER81wEcfyh0rGhsrnNGB3jIk1Idf97gbeba4rk8V+A
         V+sg==
X-Gm-Message-State: AOAM5300I+1dZMD0MQoS9L7gUPfK+f0mfN9dbLhL2mXlmku1Ae2PKAVb
        bIC46CdBy5Y79JUmdZJXqpgOZg==
X-Google-Smtp-Source: ABdhPJy3eGGMIemPLPgSZwktYxTenY9EXBH97dFyVr2r62SSQtPmI6++kaHQQFngIxNVazgPeun67g==
X-Received: by 2002:ac8:a0a:: with SMTP id b10mr6251281qti.72.1613060691438;
        Thu, 11 Feb 2021 08:24:51 -0800 (PST)
Received: from localhost.localdomain (c-73-69-118-222.hsd1.nh.comcast.net. [73.69.118.222])
        by smtp.gmail.com with ESMTPSA id i23sm3831778qtq.42.2021.02.11.08.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Feb 2021 08:24:50 -0800 (PST)
From:   Pavel Tatashin <pasha.tatashin@soleen.com>
To:     pasha.tatashin@soleen.com, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, akpm@linux-foundation.org, vbabka@suse.cz,
        mhocko@suse.com, david@redhat.com, osalvador@suse.de,
        dan.j.williams@intel.com, sashal@kernel.org,
        tyhicks@linux.microsoft.com, iamjoonsoo.kim@lge.com,
        mike.kravetz@oracle.com, rostedt@goodmis.org, mingo@redhat.com,
        jgg@ziepe.ca, peterz@infradead.org, mgorman@suse.de,
        willy@infradead.org, rientjes@google.com, jhubbard@nvidia.com,
        linux-doc@vger.kernel.org, ira.weiny@intel.com,
        linux-kselftest@vger.kernel.org, jmorris@namei.org
Subject: [PATCH v10 14/14] selftests/vm: gup_test: test faulting in kernel, and verify pinnable pages
Date:   Thu, 11 Feb 2021 11:24:27 -0500
Message-Id: <20210211162427.618913-15-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210211162427.618913-1-pasha.tatashin@soleen.com>
References: <20210211162427.618913-1-pasha.tatashin@soleen.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

When pages are pinned they can be faulted in userland and migrated, and
they can be faulted right in kernel without migration.

In either case, the pinned pages must end-up being pinnable (not movable).

Add a new test to gup_test, to help verify that the gup/pup
(get_user_pages() / pin_user_pages()) behavior with respect to pinnable
and movable pages is reasonable and correct. Specifically, provide a
way to:

1) Verify that only "pinnable" pages are pinned. This is checked
automatically for you.

2) Verify that gup/pup performance is reasonable. This requires
comparing benchmarks between doing gup/pup on pages that have been
pre-faulted in from user space, vs. doing gup/pup on pages that are not
faulted in until gup/pup time (via FOLL_TOUCH). This decision is
controlled with the new -z command line option.

Signed-off-by: Pavel Tatashin <pasha.tatashin@soleen.com>
Reviewed-by: John Hubbard <jhubbard@nvidia.com>
---
 mm/gup_test.c                         |  6 ++++++
 tools/testing/selftests/vm/gup_test.c | 23 +++++++++++++++++++----
 2 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/mm/gup_test.c b/mm/gup_test.c
index a6ed1c877679..d974dec19e1c 100644
--- a/mm/gup_test.c
+++ b/mm/gup_test.c
@@ -52,6 +52,12 @@ static void verify_dma_pinned(unsigned int cmd, struct page **pages,
 
 				dump_page(page, "gup_test failure");
 				break;
+			} else if (cmd == PIN_LONGTERM_BENCHMARK &&
+				WARN(!is_pinnable_page(page),
+				     "pages[%lu] is NOT pinnable but pinned\n",
+				     i)) {
+				dump_page(page, "gup_test failure");
+				break;
 			}
 		}
 		break;
diff --git a/tools/testing/selftests/vm/gup_test.c b/tools/testing/selftests/vm/gup_test.c
index 943cc2608dc2..1e662d59c502 100644
--- a/tools/testing/selftests/vm/gup_test.c
+++ b/tools/testing/selftests/vm/gup_test.c
@@ -13,6 +13,7 @@
 
 /* Just the flags we need, copied from mm.h: */
 #define FOLL_WRITE	0x01	/* check pte is writable */
+#define FOLL_TOUCH	0x02	/* mark page accessed */
 
 static char *cmd_to_str(unsigned long cmd)
 {
@@ -39,11 +40,11 @@ int main(int argc, char **argv)
 	unsigned long size = 128 * MB;
 	int i, fd, filed, opt, nr_pages = 1, thp = -1, repeats = 1, write = 1;
 	unsigned long cmd = GUP_FAST_BENCHMARK;
-	int flags = MAP_PRIVATE;
+	int flags = MAP_PRIVATE, touch = 0;
 	char *file = "/dev/zero";
 	char *p;
 
-	while ((opt = getopt(argc, argv, "m:r:n:F:f:abctTLUuwWSHp")) != -1) {
+	while ((opt = getopt(argc, argv, "m:r:n:F:f:abctTLUuwWSHpz")) != -1) {
 		switch (opt) {
 		case 'a':
 			cmd = PIN_FAST_BENCHMARK;
@@ -110,6 +111,10 @@ int main(int argc, char **argv)
 		case 'H':
 			flags |= (MAP_HUGETLB | MAP_ANONYMOUS);
 			break;
+		case 'z':
+			/* fault pages in gup, do not fault in userland */
+			touch = 1;
+			break;
 		default:
 			return -1;
 		}
@@ -167,8 +172,18 @@ int main(int argc, char **argv)
 	else if (thp == 0)
 		madvise(p, size, MADV_NOHUGEPAGE);
 
-	for (; (unsigned long)p < gup.addr + size; p += PAGE_SIZE)
-		p[0] = 0;
+	/*
+	 * FOLL_TOUCH, in gup_test, is used as an either/or case: either
+	 * fault pages in from the kernel via FOLL_TOUCH, or fault them
+	 * in here, from user space. This allows comparison of performance
+	 * between those two cases.
+	 */
+	if (touch) {
+		gup.gup_flags |= FOLL_TOUCH;
+	} else {
+		for (; (unsigned long)p < gup.addr + size; p += PAGE_SIZE)
+			p[0] = 0;
+	}
 
 	/* Only report timing information on the *_BENCHMARK commands: */
 	if ((cmd == PIN_FAST_BENCHMARK) || (cmd == GUP_FAST_BENCHMARK) ||
-- 
2.25.1

