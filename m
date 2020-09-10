Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15DE3265091
	for <lists+linux-doc@lfdr.de>; Thu, 10 Sep 2020 22:22:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726951AbgIJUWX (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 10 Sep 2020 16:22:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726837AbgIJUVe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 Sep 2020 16:21:34 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BD8BC06179B
        for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2020 13:21:19 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id t14so4883876pgl.10
        for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2020 13:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=i8Xslrycj3wZ0DMCYzlf3YsQvnbbwZR8oamVvMIeqd8=;
        b=N4ZcvLionYWpbEK4gXbRvbCv+cTM7NTQkjTbl0t2d2YCT5Z4d+Pb1z8TvbVJH3NLQu
         pGdG+OrRpe7FlA0k0vXQGINZGk4uSXR4KYfpS8yuHC0joRvBUjoVnIeUFSsCA/gsUHG4
         bFvqJk8qJ7J0u2QmvU3MrRgUt8CMZ24ZyDXQs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i8Xslrycj3wZ0DMCYzlf3YsQvnbbwZR8oamVvMIeqd8=;
        b=LyHHjyK1Twf9UxFM9sozKzjbVs8ct1hcw23nmeV/reidPwxFzANXMHB8pvtenpN/od
         j2qOVoSRcTeyxIreaT42ARntkA3iTjjQyiGKE8d7nHjEcN9T7OgEc6RcVURn5WunNTF+
         qoOXl0ciDUFB9WFYU/ybiX2vsTrhjIqSu//NUJ5HzWWYKsKTtDjiUMbScn6GyIAg8/O5
         XbUUrn0IADG6UQSsRvVhrRJoZJtLq7cBW+h60GNFEGcSxY9fm+mdClv4GEOsZZeqxqet
         twHXIaWbH+jFIXwEn0BpDwMvZ5U1LkhCqF7ZlquSOouN5RyO8QU56nGPWRD13X+cj+wM
         SW3A==
X-Gm-Message-State: AOAM5313+Baw+vO98rOmYlPhHvN9mo4EvnGHa84ot4SJBNXhPguwS3Ac
        8gRI+kYQ8OijZc3xU3XsNtPEJg==
X-Google-Smtp-Source: ABdhPJxSVZUjjKCu/Z5pQSZqImDe/VdPv6+D1mXG7RzqnqfYRqC3IutbHGDwngQP/fzV/pFV1UOO8w==
X-Received: by 2002:a62:5f02:0:b029:13c:1611:6536 with SMTP id t2-20020a625f020000b029013c16116536mr6870569pfb.8.1599769278853;
        Thu, 10 Sep 2020 13:21:18 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id h1sm2709801pji.52.2020.09.10.13.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 13:21:16 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     kernel-hardening@lists.openwall.com
Cc:     Kees Cook <keescook@chromium.org>, John Wood <john.wood@gmx.com>,
        Matthew Wilcox <willy@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Iurii Zaikin <yzaikin@google.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-security-module@vger.kernel.org
Subject: [RFC PATCH 3/6] security/fbfam: Use the api to manage statistics
Date:   Thu, 10 Sep 2020 13:21:04 -0700
Message-Id: <20200910202107.3799376-4-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200910202107.3799376-1-keescook@chromium.org>
References: <20200910202107.3799376-1-keescook@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: John Wood <john.wood@gmx.com>

Use the previous defined api to manage statistics calling it accordingly
when a task forks, calls execve or exits.

Signed-off-by: John Wood <john.wood@gmx.com>
---
 fs/exec.c     | 2 ++
 kernel/exit.c | 2 ++
 kernel/fork.c | 4 ++++
 3 files changed, 8 insertions(+)

diff --git a/fs/exec.c b/fs/exec.c
index a91003e28eaa..b30118674d32 100644
--- a/fs/exec.c
+++ b/fs/exec.c
@@ -71,6 +71,7 @@
 #include "internal.h"
 
 #include <trace/events/sched.h>
+#include <fbfam/fbfam.h>
 
 static int bprm_creds_from_file(struct linux_binprm *bprm);
 
@@ -1940,6 +1941,7 @@ static int bprm_execve(struct linux_binprm *bprm,
 	task_numa_free(current, false);
 	if (displaced)
 		put_files_struct(displaced);
+	fbfam_execve();
 	return retval;
 
 out:
diff --git a/kernel/exit.c b/kernel/exit.c
index 733e80f334e7..39a6139dcf31 100644
--- a/kernel/exit.c
+++ b/kernel/exit.c
@@ -67,6 +67,7 @@
 #include <linux/uaccess.h>
 #include <asm/unistd.h>
 #include <asm/mmu_context.h>
+#include <fbfam/fbfam.h>
 
 static void __unhash_process(struct task_struct *p, bool group_dead)
 {
@@ -852,6 +853,7 @@ void __noreturn do_exit(long code)
 		__this_cpu_add(dirty_throttle_leaks, tsk->nr_dirtied);
 	exit_rcu();
 	exit_tasks_rcu_finish();
+	fbfam_exit();
 
 	lockdep_free_task(tsk);
 	do_task_dead();
diff --git a/kernel/fork.c b/kernel/fork.c
index 49677d668de4..c933838450a8 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -107,6 +107,8 @@
 #define CREATE_TRACE_POINTS
 #include <trace/events/task.h>
 
+#include <fbfam/fbfam.h>
+
 /*
  * Minimum number of threads to boot the kernel
  */
@@ -941,6 +943,8 @@ static struct task_struct *dup_task_struct(struct task_struct *orig, int node)
 #ifdef CONFIG_MEMCG
 	tsk->active_memcg = NULL;
 #endif
+
+	fbfam_fork(tsk);
 	return tsk;
 
 free_stack:
-- 
2.25.1

