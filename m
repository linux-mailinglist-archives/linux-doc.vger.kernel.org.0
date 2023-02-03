Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C704F688BC8
	for <lists+linux-doc@lfdr.de>; Fri,  3 Feb 2023 01:28:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233260AbjBCA2W (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 2 Feb 2023 19:28:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233179AbjBCA2Q (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 2 Feb 2023 19:28:16 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4808F5957C;
        Thu,  2 Feb 2023 16:28:13 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D25D9B828D3;
        Fri,  3 Feb 2023 00:28:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E26E4C433A0;
        Fri,  3 Feb 2023 00:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675384090;
        bh=wDzo53Dl0UDwP01U6Ffmf8hrLpT0FCIt+byjVDuB7aY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XUqDnwbBweoECDuUEqj0BesHFC74KJgLi/pjWmtYMybTl1bK7tEkLOGXUiqClZ1BU
         QOtlGoF9Jq+d4m9S9IPN00+L7wIsucDH6DTBJfQ5fiMX2s9XSEEaZjsKCAJWhXVSaC
         XFiG/aii3oZ7FiAKTetmAD4yEWYZPXRvesJH9gJCmkZlpvcOXft/oq2uzPho/gqAqn
         KI6Elm2Fntx+0TY2YLDPMxjcr2GjSDGONEZZ8ktF0OAdtwE9rn+G4AZI7Z3ZV6vceA
         8Kw3ObMAgGcOrvtB4enDZOOqWn75pU/F1cA104+VMkiTXarY3t9GFwL4rZrfWpLBZJ
         KU/O8Xbc5OCZA==
From:   Eric Biggers <ebiggers@kernel.org>
To:     stable@vger.kernel.org
Cc:     Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
        Kees Cook <keescook@chromium.org>,
        SeongJae Park <sj@kernel.org>,
        Seth Jenkins <sethjenkins@google.com>,
        Jann Horn <jannh@google.com>,
        "Eric W . Biederman" <ebiederm@xmission.com>,
        linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        "Jason A. Donenfeld" <Jason@zx2c4.com>,
        Eric Biggers <ebiggers@google.com>,
        Huang Ying <ying.huang@intel.com>,
        Petr Mladek <pmladek@suse.com>,
        tangmeng <tangmeng@uniontech.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        linux-doc@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>
Subject: [PATCH 4.19 v2 12/15] panic: Introduce warn_limit
Date:   Thu,  2 Feb 2023 16:27:14 -0800
Message-Id: <20230203002717.49198-13-ebiggers@kernel.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230203002717.49198-1-ebiggers@kernel.org>
References: <20230203002717.49198-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Kees Cook <keescook@chromium.org>

commit 9fc9e278a5c0b708eeffaf47d6eb0c82aa74ed78 upstream.

Like oops_limit, add warn_limit for limiting the number of warnings when
panic_on_warn is not set.

Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Eric Biggers <ebiggers@google.com>
Cc: Huang Ying <ying.huang@intel.com>
Cc: Petr Mladek <pmladek@suse.com>
Cc: tangmeng <tangmeng@uniontech.com>
Cc: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-doc@vger.kernel.org
Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>
Signed-off-by: Kees Cook <keescook@chromium.org>
Link: https://lore.kernel.org/r/20221117234328.594699-5-keescook@chromium.org
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 Documentation/sysctl/kernel.txt | 10 ++++++++++
 kernel/panic.c                  | 27 +++++++++++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/Documentation/sysctl/kernel.txt b/Documentation/sysctl/kernel.txt
index e1d375df4f286..c8d3dbda3c1e2 100644
--- a/Documentation/sysctl/kernel.txt
+++ b/Documentation/sysctl/kernel.txt
@@ -97,6 +97,7 @@ show up in /proc/sys/kernel:
 - threads-max
 - unprivileged_bpf_disabled
 - unknown_nmi_panic
+- warn_limit
 - watchdog
 - watchdog_thresh
 - version
@@ -1114,6 +1115,15 @@ example.  If a system hangs up, try pressing the NMI switch.
 
 ==============================================================
 
+warn_limit:
+
+Number of kernel warnings after which the kernel should panic when
+``panic_on_warn`` is not set. Setting this to 0 disables checking
+the warning count. Setting this to 1 has the same effect as setting
+``panic_on_warn=1``. The default value is 0.
+
+==============================================================
+
 watchdog:
 
 This parameter can be used to disable or enable the soft lockup detector
diff --git a/kernel/panic.c b/kernel/panic.c
index 08b8adc55b2bf..d1a5360262f04 100644
--- a/kernel/panic.c
+++ b/kernel/panic.c
@@ -42,6 +42,7 @@ static int pause_on_oops_flag;
 static DEFINE_SPINLOCK(pause_on_oops_lock);
 bool crash_kexec_post_notifiers;
 int panic_on_warn __read_mostly;
+static unsigned int warn_limit __read_mostly;
 
 int panic_timeout = CONFIG_PANIC_TIMEOUT;
 EXPORT_SYMBOL_GPL(panic_timeout);
@@ -50,6 +51,26 @@ ATOMIC_NOTIFIER_HEAD(panic_notifier_list);
 
 EXPORT_SYMBOL(panic_notifier_list);
 
+#ifdef CONFIG_SYSCTL
+static struct ctl_table kern_panic_table[] = {
+	{
+		.procname       = "warn_limit",
+		.data           = &warn_limit,
+		.maxlen         = sizeof(warn_limit),
+		.mode           = 0644,
+		.proc_handler   = proc_douintvec,
+	},
+	{ }
+};
+
+static __init int kernel_panic_sysctls_init(void)
+{
+	register_sysctl_init("kernel", kern_panic_table);
+	return 0;
+}
+late_initcall(kernel_panic_sysctls_init);
+#endif
+
 static long no_blink(int state)
 {
 	return 0;
@@ -127,8 +148,14 @@ EXPORT_SYMBOL(nmi_panic);
 
 void check_panic_on_warn(const char *origin)
 {
+	static atomic_t warn_count = ATOMIC_INIT(0);
+
 	if (panic_on_warn)
 		panic("%s: panic_on_warn set ...\n", origin);
+
+	if (atomic_inc_return(&warn_count) >= READ_ONCE(warn_limit) && warn_limit)
+		panic("%s: system warned too often (kernel.warn_limit is %d)",
+		      origin, warn_limit);
 }
 
 /**
-- 
2.39.1

