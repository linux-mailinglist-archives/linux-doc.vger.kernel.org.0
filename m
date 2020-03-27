Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70764196159
	for <lists+linux-doc@lfdr.de>; Fri, 27 Mar 2020 23:42:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727703AbgC0WmN (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 27 Mar 2020 18:42:13 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:43325 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727585AbgC0WmN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 27 Mar 2020 18:42:13 -0400
Received: from mail-qv1-f70.google.com ([209.85.219.70])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <gpiccoli@canonical.com>)
        id 1jHxfE-0001G2-Jd
        for linux-doc@vger.kernel.org; Fri, 27 Mar 2020 22:41:20 +0000
Received: by mail-qv1-f70.google.com with SMTP id f9so1636984qvt.14
        for <linux-doc@vger.kernel.org>; Fri, 27 Mar 2020 15:41:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WYptB1jwZhNbtl0E2BMrFXsPVgmLkUSZ/p3r2QlCVdM=;
        b=hC85pT6q5waYGtvhsSTki+p7LIkd9mUctVsgZItMhXMzQc6hybm67ip1Q/Xu7YdQw/
         Ge+FL3o0CI9VppBgqWY3DNpjuE7lDgRvyxErp3eEQz1NnZYyWW+oLvAE2Tk2/R4XdIFt
         pO8x8hhseqHvc5qCaoFvKq01+E46YRMjlKY0vQhA+L23NnPKw1r+crhpC3xlGJM9GtnX
         gn7mZIA6o5E7Tb9Fvv3giMSpU00QJipdiC5v+AKRsIcfvdRj/jUE1xRt+n8O4peTjgeo
         esPbht178UQU6QrXMav8EgwqkvDaChlqObuJ6l3+lC1sI/AynpH36SIykM8eie/k4wNi
         jmpQ==
X-Gm-Message-State: ANhLgQ0r24EDrPtaRDRNlnoWl0Ox8OGusn+AM8hLnA7xrrL6YITS4WU/
        mQxsK/+4xe9yxNkgpQu1299kHdZ4glS8+sndgVsygKkskG1NwK26+ABqG0uy7Xr4xE0n04mZFzM
        FxPLQ1+F37O2bW/v1MkC8KVJiy1NbpgYg96lsQQ==
X-Received: by 2002:a37:d8a:: with SMTP id 132mr1685545qkn.270.1585348879542;
        Fri, 27 Mar 2020 15:41:19 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtjMtOe9MPgoLyvQBJZW0ZKggklCIj8NUUP8TFzGEWeTvYd/ZjNltBbt+D+oGfZ1N/lirkisg==
X-Received: by 2002:a37:d8a:: with SMTP id 132mr1685531qkn.270.1585348879219;
        Fri, 27 Mar 2020 15:41:19 -0700 (PDT)
Received: from localhost (189-47-87-73.dsl.telesp.net.br. [189.47.87.73])
        by smtp.gmail.com with ESMTPSA id h5sm4729651qkc.118.2020.03.27.15.41.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Mar 2020 15:41:18 -0700 (PDT)
From:   "Guilherme G. Piccoli" <gpiccoli@canonical.com>
To:     linux-kernel@vger.kernel.org, akpm@linux-foundation.org
Cc:     linux-api@vger.kernel.org, linux-doc@vger.kernel.org,
        mcgrof@kernel.org, keescook@chromium.org, yzaikin@google.com,
        tglx@linutronix.de, vbabka@suse.cz, rdunlap@infradead.org,
        willy@infradead.org, gpiccoli@canonical.com, kernel@gpiccoli.net
Subject: [PATCH V3] panic: Add sysctl to dump all CPUs backtraces on oops event
Date:   Fri, 27 Mar 2020 19:41:16 -0300
Message-Id: <20200327224116.21030-1-gpiccoli@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Usually when kernel reach an oops condition, it's a point of no return;
in case not enough debug information is available in the kernel splat,
one of the last resorts would be to collect a kernel crash dump and
analyze it. The problem with this approach is that in order to collect
the dump, a panic is required (to kexec-load the crash kernel). When
in an environment of multiple virtual machines, users may prefer to
try living with the oops, at least until being able to properly
shutdown their VMs / finish their important tasks.

This patch implements a way to collect a bit more debug details when an
oops event is reached, by printing all the CPUs backtraces through the
usage of NMIs (on architectures that support that). The sysctl added
(and documented) here was called "oops_all_cpu_backtrace", and when
set will (as the name suggests) dump all CPUs backtraces.

Far from ideal, this may be the last option though for users that for
some reason cannot panic on oops. Most of times oopses are clear enough
to indicate the kernel portion that must be investigated, but in virtual
environments it's possible to observe hypervisor/KVM issues that could
lead to oopses shown in other guests CPUs (like virtual APIC crashes).
This patch hence aims to help debug such complex issues without
resorting to kdump.

Reviewed-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Guilherme G. Piccoli <gpiccoli@canonical.com>
---

V3: Added the reviewed-by tag from Kees (thanks!) and following the
suggestion from Vlastimil (in other patch), removed the kernel parameter
since soon we (hopefully) will have a generic approach to set sysctls via
kernel parameters[0] - thanks Vlastimil, great idea!

Thanks,

Guilherme

[0] lore.kernel.org/lkml/20200326181606.7027-1-vbabka@suse.cz/T


 Documentation/admin-guide/sysctl/kernel.rst | 17 +++++++++++++++++
 include/linux/kernel.h                      |  6 ++++++
 kernel/panic.c                              | 11 +++++++++++
 kernel/sysctl.c                             | 11 +++++++++++
 4 files changed, 45 insertions(+)

diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
index 8b4ff69d2348..8660001d3a3e 100644
--- a/Documentation/admin-guide/sysctl/kernel.rst
+++ b/Documentation/admin-guide/sysctl/kernel.rst
@@ -57,6 +57,7 @@ show up in /proc/sys/kernel:
 - msgmnb
 - msgmni
 - nmi_watchdog
+- oops_all_cpu_backtrace
 - osrelease
 - ostype
 - overflowgid
@@ -572,6 +573,22 @@ numa_balancing_scan_size_mb is how many megabytes worth of pages are
 scanned for a given scan.
 
 
+oops_all_cpu_backtrace:
+================
+
+If this option is set, the kernel will send an NMI to all CPUs to dump
+their backtraces when an oops event occurs. It should be used as a last
+resort in case a panic cannot be triggered (to protect VMs running, for
+example) or kdump can't be collected. This file shows up if CONFIG_SMP
+is enabled.
+
+0: Won't show all CPUs backtraces when an oops is detected.
+This is the default behavior.
+
+1: Will non-maskably interrupt all CPUs and dump their backtraces when
+an oops event is detected.
+
+
 osrelease, ostype & version:
 ============================
 
diff --git a/include/linux/kernel.h b/include/linux/kernel.h
index 0d9db2a14f44..6cd00257b572 100644
--- a/include/linux/kernel.h
+++ b/include/linux/kernel.h
@@ -513,6 +513,12 @@ static inline u32 int_sqrt64(u64 x)
 }
 #endif
 
+#ifdef CONFIG_SMP
+extern unsigned int sysctl_oops_all_cpu_backtrace;
+#else
+#define sysctl_oops_all_cpu_backtrace 0
+#endif /* CONFIG_SMP */
+
 extern void bust_spinlocks(int yes);
 extern int oops_in_progress;		/* If set, an oops, panic(), BUG() or die() is in progress */
 extern int panic_timeout;
diff --git a/kernel/panic.c b/kernel/panic.c
index b69ee9e76cb2..ec6d7d788ce7 100644
--- a/kernel/panic.c
+++ b/kernel/panic.c
@@ -36,6 +36,14 @@
 #define PANIC_TIMER_STEP 100
 #define PANIC_BLINK_SPD 18
 
+#ifdef CONFIG_SMP
+/*
+ * Should we dump all CPUs backtraces in an oops event?
+ * Defaults to 0, can be changed via sysctl.
+ */
+unsigned int __read_mostly sysctl_oops_all_cpu_backtrace;
+#endif /* CONFIG_SMP */
+
 int panic_on_oops = CONFIG_PANIC_ON_OOPS_VALUE;
 static unsigned long tainted_mask =
 	IS_ENABLED(CONFIG_GCC_PLUGIN_RANDSTRUCT) ? (1 << TAINT_RANDSTRUCT) : 0;
@@ -515,6 +523,9 @@ void oops_enter(void)
 	/* can't trust the integrity of the kernel anymore: */
 	debug_locks_off();
 	do_oops_enter_exit();
+
+	if (sysctl_oops_all_cpu_backtrace)
+		trigger_all_cpu_backtrace();
 }
 
 /*
diff --git a/kernel/sysctl.c b/kernel/sysctl.c
index 238f268de486..1ac31d9d5b7e 100644
--- a/kernel/sysctl.c
+++ b/kernel/sysctl.c
@@ -813,6 +813,17 @@ static struct ctl_table kern_table[] = {
 		.proc_handler	= proc_dointvec,
 	},
 #endif
+#ifdef CONFIG_SMP
+	{
+		.procname	= "oops_all_cpu_backtrace",
+		.data		= &sysctl_oops_all_cpu_backtrace,
+		.maxlen		= sizeof(int),
+		.mode		= 0644,
+		.proc_handler	= proc_dointvec_minmax,
+		.extra1		= SYSCTL_ZERO,
+		.extra2		= SYSCTL_ONE,
+	},
+#endif /* CONFIG_SMP */
 	{
 		.procname	= "pid_max",
 		.data		= &pid_max,
-- 
2.25.1

