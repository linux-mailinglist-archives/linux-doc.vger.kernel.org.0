Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 399EC1B5144
	for <lists+linux-doc@lfdr.de>; Thu, 23 Apr 2020 02:27:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726287AbgDWA1B (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 22 Apr 2020 20:27:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726021AbgDWA1B (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 22 Apr 2020 20:27:01 -0400
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com [IPv6:2607:f8b0:4864:20::44a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E7E7C03C1AD
        for <linux-doc@vger.kernel.org>; Wed, 22 Apr 2020 17:27:01 -0700 (PDT)
Received: by mail-pf1-x44a.google.com with SMTP id 84so3665983pfx.20
        for <linux-doc@vger.kernel.org>; Wed, 22 Apr 2020 17:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to;
        bh=3cs6cpETnu5up7poODqqpjwIIIEEY9B/JJrROxUknZo=;
        b=UM9lf+UjXr7lQ4WhqVJUaEoeVlpkZXm8IVaaoCLCkjlU4nL3c9A30jdtNMATw5LU30
         ZN/uQt6iOFMRSjWe1mIyG0tfJLl07wwCa/9w/q7bnyzDQOzo62S+rW6YV9fc1x2yMaQy
         U26PJs1dTMsjpsMRYLOd5Y5Y2ITryXXyxPAZ8VA12ffUY6m57kgupwUGYHEqKj1oYPH0
         wF2hsOYFZU4zrR9uMbePQ9C1+He52kETBBM+OgoLJ2Lkf3j4fXoRvjjJxfFl+aP+ocyf
         H5+ezAemb1c/R0uR3+ZNDWcwGgvTWOQ2RA2jRQxlu+8ZJTVKxedPGoiN9dnLIV1O+TvS
         /04A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to;
        bh=3cs6cpETnu5up7poODqqpjwIIIEEY9B/JJrROxUknZo=;
        b=qKV3iAknIysySlEQLi+UeKS3EgzFdvKfngD0cMa3UuCG/QVG/EElBf3ygfV5ilSoJy
         mUwBJ1p4cEfs1J/2jFDag50s+vYKDPLOggrFnSY5TU54jP3JRsD70Vymc05LUS5VFpL7
         sJsoi9q/bR+pDT4f7TFYXNWJgGhD7Vhb2KURycnUPKzEpuMWQEIudwxu8AQk+qq/mEQQ
         DjwnWOxX9NcTtIBIurpp0++yrpbwJe7+WbK7qKApviRVQPk9xwP4+MuplgPInQd6DPmg
         GbBIGn+1DO0iXzY/RkimbxTixJHcZO+Yy8vViFVJQ0uvPM8bwzuLOps0ABJmzZ0hLXUa
         lu1A==
X-Gm-Message-State: AGi0PuYcFJB0FRJUtBJvOWb+lG0SPcsAdz8eSt6i43DMSh6s+IReHeLn
        F0YXDec5GgQJS5nnQjYSgsFbFtfm8wA=
X-Google-Smtp-Source: APiQypLEMPU3+WWUCkc7uWfkQ+0lZ7h9UwrP41CKaeCyB4zN/CtnLBODcu/h6ljeA8UPWl8LNoRxpWvc6W0=
X-Received: by 2002:a17:90a:b104:: with SMTP id z4mr1426983pjq.115.1587601620510;
 Wed, 22 Apr 2020 17:27:00 -0700 (PDT)
Date:   Wed, 22 Apr 2020 17:26:31 -0700
In-Reply-To: <20200423002632.224776-1-dancol@google.com>
Message-Id: <20200423002632.224776-2-dancol@google.com>
Mime-Version: 1.0
References: <20200423002632.224776-1-dancol@google.com>
X-Mailer: git-send-email 2.26.2.303.gf8c07b1a785-goog
Subject: [PATCH 1/2] Add UFFD_USER_MODE_ONLY
From:   Daniel Colascione <dancol@google.com>
To:     Jonathan Corbet <corbet@lwn.net>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Iurii Zaikin <yzaikin@google.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Mel Gorman <mgorman@techsingularity.net>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Peter Xu <peterx@redhat.com>,
        Daniel Colascione <dancol@google.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Jerome Glisse <jglisse@redhat.com>, Shaohua Li <shli@fb.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, timmurray@google.com,
        minchan@google.com, sspatil@google.com, lokeshgidra@google.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

userfaultfd handles page faults from both user and kernel code.  Add a
new UFFD_USER_MODE_ONLY flag for userfaultfd(2) that makes the
resulting userfaultfd object refuse to handle faults from kernel mode,
treating these faults as if SIGBUS were always raised, causing the
kernel code to fail with EFAULT.

A future patch adds a knob allowing administrators to give some
processes the ability to create userfaultfd file objects only if they
pass UFFD_USER_MODE_ONLY, reducing the likelihood that these processes
will exploit userfaultfd's ability to delay kernel page faults to open
timing windows for future exploits.

Signed-off-by: Daniel Colascione <dancol@google.com>
---
 fs/userfaultfd.c                 | 7 ++++++-
 include/uapi/linux/userfaultfd.h | 9 +++++++++
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/fs/userfaultfd.c b/fs/userfaultfd.c
index e39fdec8a0b0..21378abe8f7b 100644
--- a/fs/userfaultfd.c
+++ b/fs/userfaultfd.c
@@ -418,6 +418,9 @@ vm_fault_t handle_userfault(struct vm_fault *vmf, unsigned long reason)
 
 	if (ctx->features & UFFD_FEATURE_SIGBUS)
 		goto out;
+	if ((vmf->flags & FAULT_FLAG_USER) == 0 &&
+	    ctx->flags & UFFD_USER_MODE_ONLY)
+		goto out;
 
 	/*
 	 * If it's already released don't get it. This avoids to loop
@@ -2003,6 +2006,7 @@ static void init_once_userfaultfd_ctx(void *mem)
 
 SYSCALL_DEFINE1(userfaultfd, int, flags)
 {
+	static const int uffd_flags = UFFD_USER_MODE_ONLY;
 	struct userfaultfd_ctx *ctx;
 	int fd;
 
@@ -2012,10 +2016,11 @@ SYSCALL_DEFINE1(userfaultfd, int, flags)
 	BUG_ON(!current->mm);
 
 	/* Check the UFFD_* constants for consistency.  */
+	BUILD_BUG_ON(uffd_flags & UFFD_SHARED_FCNTL_FLAGS);
 	BUILD_BUG_ON(UFFD_CLOEXEC != O_CLOEXEC);
 	BUILD_BUG_ON(UFFD_NONBLOCK != O_NONBLOCK);
 
-	if (flags & ~UFFD_SHARED_FCNTL_FLAGS)
+	if (flags & ~(UFFD_SHARED_FCNTL_FLAGS | uffd_flags))
 		return -EINVAL;
 
 	ctx = kmem_cache_alloc(userfaultfd_ctx_cachep, GFP_KERNEL);
diff --git a/include/uapi/linux/userfaultfd.h b/include/uapi/linux/userfaultfd.h
index e7e98bde221f..5f2d88212f7c 100644
--- a/include/uapi/linux/userfaultfd.h
+++ b/include/uapi/linux/userfaultfd.h
@@ -257,4 +257,13 @@ struct uffdio_writeprotect {
 	__u64 mode;
 };
 
+/*
+ * Flags for the userfaultfd(2) system call itself.
+ */
+
+/*
+ * Create a userfaultfd that can handle page faults only in user mode.
+ */
+#define UFFD_USER_MODE_ONLY 1
+
 #endif /* _LINUX_USERFAULTFD_H */
-- 
2.26.2.303.gf8c07b1a785-goog

