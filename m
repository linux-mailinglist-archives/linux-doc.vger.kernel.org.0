Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87A712FAFB3
	for <lists+linux-doc@lfdr.de>; Tue, 19 Jan 2021 05:56:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387723AbhASEpd (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 18 Jan 2021 23:45:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387848AbhASEme (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 18 Jan 2021 23:42:34 -0500
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76F83C061385
        for <linux-doc@vger.kernel.org>; Mon, 18 Jan 2021 20:39:45 -0800 (PST)
Received: by mail-qk1-x72b.google.com with SMTP id 19so20787943qkm.8
        for <linux-doc@vger.kernel.org>; Mon, 18 Jan 2021 20:39:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=GrD5c9rl+nII4dP015r3zSdw7qVCON9D7TFIA6KRom8=;
        b=bFnhOEN6Qv2S/HqctXkiMhHJAVkoPKQS8sMyCEJOO0o3KfR8IjIjYLkN83MQ/Nvvt9
         OpB6h9A6EB6v9xtqZXbEachoM82WqY3pZcrSAWEPAUzFJBaV51jCmA0+kM1AkfI63QEp
         /VC9wUe6Epd+99hD3btoHOUJ+M5r/Jyqn7dKw9dbu8J026YxMIn3TMIjH7A/dtbQFAKa
         ZFWMODdfzRuMjZMRaWIT/TLXUGpJvv6Ud3SPVRCuj5ShWVfpnbKqugHOvKsGZ3fVkTDJ
         mh3FGaj4jqVjV0L95goZ8j7ea/wRSJ2mhgh0rCagBleHX4d1fT/8fL26PSvCYO9uAkBX
         YQRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GrD5c9rl+nII4dP015r3zSdw7qVCON9D7TFIA6KRom8=;
        b=Yr8+W1QID2JpPC483Hc0x80JfbOsTzFzUz+kg6R1ZPgw8yxQGTpLHlSZk0Ha+zJ4Jf
         oSiQKQpZNOusS3Y/lFaQkiENY6OaiKlybetKH68a4OLXjSQGP33R13q07sLR8rf5dgRT
         gwzJnGgecVUILlJE+eh/5qr3W7Q+NxTanD4Rd3s+w93+8m1MMDhK+KhqKl7v1inoU7oh
         GqCAAQkOd6ccp7sKlpyJk3L2507P5B80VKuk1bhWswbL7103Ukts3Zloj1IsONWbQzhH
         0nxS9GV83JFYV9nHQpmy9ZRFDX56W43AVPjvuI2ovp6vm1dqwvEKc231rLmhoDQy7WEk
         /5bw==
X-Gm-Message-State: AOAM5302kpH/iaKxORjWZbG+yvlIGY/MSvcaxLX3kQ+m3nwejKkVNwZy
        SYguiPWBwjHcMZmu1ZeNE6xEbQ==
X-Google-Smtp-Source: ABdhPJzIJnuNSk1VeOUOLD2b3+EgzyuqPhHZjyj95Mv5V3QwSOIYNgtx5B7jN8TQadRhwc3DX6/ONw==
X-Received: by 2002:a05:620a:46:: with SMTP id t6mr2751756qkt.108.1611031184638;
        Mon, 18 Jan 2021 20:39:44 -0800 (PST)
Received: from localhost.localdomain (c-73-69-118-222.hsd1.nh.comcast.net. [73.69.118.222])
        by smtp.gmail.com with ESMTPSA id z20sm11934536qkz.37.2021.01.18.20.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jan 2021 20:39:44 -0800 (PST)
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
        linux-kselftest@vger.kernel.org
Subject: [PATCH v5 14/14] selftests/vm: test faulting in kernel, and verify pinnable pages
Date:   Mon, 18 Jan 2021 23:39:20 -0500
Message-Id: <20210119043920.155044-15-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210119043920.155044-1-pasha.tatashin@soleen.com>
References: <20210119043920.155044-1-pasha.tatashin@soleen.com>
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
and movable pages is reasonable and correct. Specifically, provide a way
to:

1) Verify that only "pinnable" pages are pinned. This is checked
automatically for you.

2) Verify that gup/pup performance is reasonable. This requires
comparing benchmarks between doing gup/pup on pages that have been
pre-faulted in from user space, vs. doing gup/pup on pages that are not
faulted in until gup/pup time (via FOLL_TOUCH). This decision is
controlled with the new -z command line option.

Signed-off-by: Pavel Tatashin <pasha.tatashin@soleen.com>
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

