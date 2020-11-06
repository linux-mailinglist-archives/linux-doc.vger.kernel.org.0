Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A95A2A8C76
	for <lists+linux-doc@lfdr.de>; Fri,  6 Nov 2020 03:11:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726162AbgKFCLa (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 5 Nov 2020 21:11:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725977AbgKFCLa (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 5 Nov 2020 21:11:30 -0500
Received: from mail-qv1-xf4a.google.com (mail-qv1-xf4a.google.com [IPv6:2607:f8b0:4864:20::f4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11BB0C0613CF
        for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2020 18:11:30 -0800 (PST)
Received: by mail-qv1-xf4a.google.com with SMTP id m15so2086341qvx.2
        for <linux-doc@vger.kernel.org>; Thu, 05 Nov 2020 18:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=T1ssYQnlZfXYg4a9CrE5sQuW0tqmDafqmdVBZ8OGyYk=;
        b=TcY9DZhY0raayijWagcNzm4ZuafclgG6HVA/Sz1qQnQJQOIfbQHvvL7RNmX+9P4UtB
         oU5bGzkYPf4vBagfhZ2H/5dyyrnXt2KXH8nnnG2AAxOAKVFlIPmODwO7U/oeJDRH6+p2
         2hsqKwA3RN+85OY3avD3vLPbAHTg8vq3LucXtnw688M7egI3PZ/CkuxKILVTw58owe1l
         MSo5HTPx4dp7XvFGzTLI2u4EM2xDdWyBkvnLzI1lar1APXh0aZ2ah+upKTkO85OeywV3
         g1Medy/bw7NowmvGMbavBgzcDTJ7aBszMcbHGS8Ho/CWoztR11RpNPqQ+yW6AJJvdKBO
         8mYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=T1ssYQnlZfXYg4a9CrE5sQuW0tqmDafqmdVBZ8OGyYk=;
        b=m8Fqu9yZmj8UX3kKgGGjpa8YfmzWyoyrKkDMipY5yDjFwV0AG7ckBjw62n+11S11Qx
         rM7EZ4YxxnTn+JccwoBwxInVFpL2yZtTKqnUTJPwprdxAFe914DPPCCZmvTM+mpHD5IM
         f2iSBvjSG9SGTMEr4wpUeMyzgQWinJ8FpYuyjOSFEEBq8v3IE0DBuOW2mJ6QU6QApuT9
         0+dsGzX4cmHEJ54LPDqToEI1tdMOHIs4+pgBJpCxUDwweVi8/5avpTt9fPgbFspx0R+A
         0HLB6UYnl5rgRTep63FebCMSRMeifwT7ULjQ0hA6smZEnw8662E01//7n3qRJxFPa40Z
         Cfog==
X-Gm-Message-State: AOAM532ry56DVN5ySyi9JQATy/W/ywIxVq2keMgmGdQMuqTthMJe55po
        gakrcblhvAjURIzC5YFcH0Mb2pQPCaAD
X-Google-Smtp-Source: ABdhPJxOvwIwaEbk6c5IHG3124uPZYpsU4BroVZh94M50Q/ggQeD+jmPu/TwzfSqVPCNKiKIMes8VimzH0Y+
Sender: "amistry via sendgmr" <amistry@nandos.syd.corp.google.com>
X-Received: from nandos.syd.corp.google.com ([2401:fa00:9:14:725a:fff:fe46:72ab])
 (user=amistry job=sendgmr) by 2002:a0c:8e4f:: with SMTP id
 w15mr665237qvb.42.1604628689164; Thu, 05 Nov 2020 18:11:29 -0800 (PST)
Date:   Fri,  6 Nov 2020 13:10:43 +1100
Message-Id: <20201106131015.v2.1.I7782b0cedb705384a634cfd8898eb7523562da99@changeid>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.1.341.ge80a0c044ae-goog
Subject: [PATCH v2] proc: Provide details on indirect branch speculation
From:   Anand K Mistry <amistry@google.com>
To:     linux-fsdevel@vger.kernel.org
Cc:     asteinhauser@google.com, sfr@canb.auug.org.au, rppt@kernel.org,
        joelaf@google.com, tglx@linutronix.de,
        Anand K Mistry <amistry@google.com>,
        Alexey Dobriyan <adobriyan@gmail.com>,
        Alexey Gladkov <gladkov.alexey@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Michal Hocko <mhocko@suse.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Similar to speculation store bypass, show information about the indirect
branch speculation mode of a task in /proc/$pid/status.

Signed-off-by: Anand K Mistry <amistry@google.com>
---

Changes in v2:
- Remove underscores from field name to workaround documentation issue

 Documentation/filesystems/proc.rst |  2 ++
 fs/proc/array.c                    | 28 ++++++++++++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/Documentation/filesystems/proc.rst b/Documentation/filesystems/proc.rst
index 533c79e8d2cd..531edaf07924 100644
--- a/Documentation/filesystems/proc.rst
+++ b/Documentation/filesystems/proc.rst
@@ -210,6 +210,7 @@ read the file /proc/PID/status::
   NoNewPrivs:     0
   Seccomp:        0
   Speculation_Store_Bypass:       thread vulnerable
+  SpeculationIndirectBranch:      conditional enabled
   voluntary_ctxt_switches:        0
   nonvoluntary_ctxt_switches:     1
 
@@ -292,6 +293,7 @@ It's slow but very precise.
  NoNewPrivs                  no_new_privs, like prctl(PR_GET_NO_NEW_PRIV, ...)
  Seccomp                     seccomp mode, like prctl(PR_GET_SECCOMP, ...)
  Speculation_Store_Bypass    speculative store bypass mitigation status
+ SpeculationIndirectBranch   indirect branch speculation mode
  Cpus_allowed                mask of CPUs on which this process may run
  Cpus_allowed_list           Same as previous, but in "list format"
  Mems_allowed                mask of memory nodes allowed to this process
diff --git a/fs/proc/array.c b/fs/proc/array.c
index 65ec2029fa80..014c1859554d 100644
--- a/fs/proc/array.c
+++ b/fs/proc/array.c
@@ -368,6 +368,34 @@ static inline void task_seccomp(struct seq_file *m, struct task_struct *p)
 		seq_puts(m, "vulnerable");
 		break;
 	}
+
+	seq_puts(m, "\nSpeculationIndirectBranch:\t");
+	switch (arch_prctl_spec_ctrl_get(p, PR_SPEC_INDIRECT_BRANCH)) {
+	case -EINVAL:
+		seq_puts(m, "unsupported");
+		break;
+	case PR_SPEC_NOT_AFFECTED:
+		seq_puts(m, "not affected");
+		break;
+	case PR_SPEC_PRCTL | PR_SPEC_FORCE_DISABLE:
+		seq_puts(m, "conditional force disabled");
+		break;
+	case PR_SPEC_PRCTL | PR_SPEC_DISABLE:
+		seq_puts(m, "conditional disabled");
+		break;
+	case PR_SPEC_PRCTL | PR_SPEC_ENABLE:
+		seq_puts(m, "conditional enabled");
+		break;
+	case PR_SPEC_ENABLE:
+		seq_puts(m, "always enabled");
+		break;
+	case PR_SPEC_DISABLE:
+		seq_puts(m, "always disabled");
+		break;
+	default:
+		seq_puts(m, "unknown");
+		break;
+	}
 	seq_putc(m, '\n');
 }
 
-- 
2.29.1.341.ge80a0c044ae-goog

