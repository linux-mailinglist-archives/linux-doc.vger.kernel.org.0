Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC5D76A26F8
	for <lists+linux-doc@lfdr.de>; Sat, 25 Feb 2023 04:34:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229482AbjBYDe2 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 24 Feb 2023 22:34:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbjBYDe2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 24 Feb 2023 22:34:28 -0500
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F9F2270C
        for <linux-doc@vger.kernel.org>; Fri, 24 Feb 2023 19:34:26 -0800 (PST)
Received: by mail-qt1-x829.google.com with SMTP id h16so1520278qta.8
        for <linux-doc@vger.kernel.org>; Fri, 24 Feb 2023 19:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lTPRVqT9c+Qejh0XjVuubW839LJl+9CnF91VITFhncA=;
        b=srM0xtNWyXhWb6lmCc+QAgMeBYieaOVdffjZpKGqtNVyWRv2ETLmIGPlyNUgLq5Asa
         OAMR5V68ZSa+zxLHJ3DOo5yVfY+AmAiKRu3RuDPsb9VI4aQunNjy3/o79t0Vo3dXdPDf
         D9SKPYhZu/33MVR6CYUlGVu4vOh6PdEFVM7No=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lTPRVqT9c+Qejh0XjVuubW839LJl+9CnF91VITFhncA=;
        b=XiuHmn8n1djP2q2QgkjQ/LkKeWBme0bZctU+p73tQmvxL6BoV9u385+h5iKTmeaw+w
         v0HTAco+VRdKfOA7KpJA/jWyNekqpsXe5gL84iMSBeAN3je9BL7LBmbgU0Kg+S9CFjKG
         9Fx9BCH59JClJPk1MJemvsH9ZefPNfqxOR1K5n1jo4EtFKZDJx2S99pKSSsf9yZ+riAd
         ylv10o8jLy2X3rWM3E8hHVwhfluJEvpQHblGiQufhl8GeX6R0aEaX065xclccYrIClCn
         JDnqgBELhgwxsLGwA3XC2b6kUZ66r+ZtBAp0d2UY2uV3hm6ND3tJdrOxA/I9Y5AnuUSQ
         PmYA==
X-Gm-Message-State: AO0yUKVbftOmJVAGmlKNvncr7zPHEzYlrikdELpE3xmVR9fqjE7iIemv
        cHvWsNpVXqnuh7WTNdMgVBkZRQ==
X-Google-Smtp-Source: AK7set8sBZgUP7fgQVLfptauUzyRNyh+EtmS+xyielupZECD18g64E7imQBNQfxaZyGoWJyDLNMFHw==
X-Received: by 2002:a05:622a:18f:b0:3b6:2f31:efc4 with SMTP id s15-20020a05622a018f00b003b62f31efc4mr17719729qtw.66.1677296065147;
        Fri, 24 Feb 2023 19:34:25 -0800 (PST)
Received: from joelboxx.c.googlers.com.com (129.239.188.35.bc.googleusercontent.com. [35.188.239.129])
        by smtp.gmail.com with ESMTPSA id p186-20020a3742c3000000b0074240840c25sm506403qka.108.2023.02.24.19.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 19:34:24 -0800 (PST)
From:   "Joel Fernandes (Google)" <joel@joelfernandes.org>
To:     linux-kernel@vger.kernel.org
Cc:     "Joel Fernandes (Google)" <joel@joelfernandes.org>,
        Frederic Weisbecker <frederic@kernel.org>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        linux-doc@vger.kernel.org, "Paul E. McKenney" <paulmck@kernel.org>,
        rcu@vger.kernel.org
Subject: [PATCH RFC v2] rcu: Add a minimum time for marking boot as completed
Date:   Sat, 25 Feb 2023 03:34:21 +0000
Message-Id: <20230225033421.3323164-1-joel@joelfernandes.org>
X-Mailer: git-send-email 2.39.2.637.g21b0678d19-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLACK autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On many systems, a great deal of boot happens after the kernel thinks the boot
has completed. It is difficult to determine if the system has really booted
from the kernel side. Some features like lazy-RCU can risk slowing down boot
time if, say, a callback has been added that the boot synchronously depends on.

Further, it is better to boot systems which pass 'rcu_normal_after_boot' to
stay expedited for as long as the system is still booting.

For these reasons, this commit adds a config option
'CONFIG_RCU_BOOT_END_DELAY' and a boot parameter rcupdate.boot_end_delay.

By default, this value is 20s. A system designer can choose to specify a value
here to keep RCU from marking boot completion.  The boot sequence will not be
marked ended until at least boot_end_delay milliseconds have passed.

Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
---
v1->v2:
	Update some comments and description.

 .../admin-guide/kernel-parameters.txt         |  4 +++
 cc_list                                       |  7 ++++++
 kernel/rcu/Kconfig                            | 12 +++++++++
 kernel/rcu/update.c                           | 25 +++++++++++++++++--
 4 files changed, 46 insertions(+), 2 deletions(-)
 create mode 100644 cc_list

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 2429b5e3184b..0943139fdf01 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -5085,6 +5085,10 @@
 	rcutorture.verbose= [KNL]
 			Enable additional printk() statements.
 
+	rcupdate.boot_end_delay= [KNL]
+			Minimum time that must elapse before the boot
+			sequence can be marked as completed.
+
 	rcupdate.rcu_cpu_stall_ftrace_dump= [KNL]
 			Dump ftrace buffer after reporting RCU CPU
 			stall warning.
diff --git a/kernel/rcu/Kconfig b/kernel/rcu/Kconfig
index 9071182b1284..0d77006a948f 100644
--- a/kernel/rcu/Kconfig
+++ b/kernel/rcu/Kconfig
@@ -217,6 +217,18 @@ config RCU_BOOST_DELAY
 
 	  Accept the default if unsure.
 
+config RCU_BOOT_END_DELAY
+	int "Minimum time before RCU may consider in-kernel boot as completed"
+	range 0 120000
+	default 20000
+	help
+	  This option specifies the minimum time in milliseconds from boot start
+	  before RCU believes boot has completed. The actual delay can be
+	  higher than this if the kernel takes a long time to initialize
+	  but it will never be smaller than this.
+
+	  Accept the default if unsure.
+
 config RCU_EXP_KTHREAD
 	bool "Perform RCU expedited work in a real-time kthread"
 	depends on RCU_BOOST && RCU_EXPERT
diff --git a/kernel/rcu/update.c b/kernel/rcu/update.c
index 19bf6fa3ee6a..cbdad7b46841 100644
--- a/kernel/rcu/update.c
+++ b/kernel/rcu/update.c
@@ -62,6 +62,10 @@ module_param(rcu_normal_after_boot, int, 0444);
 #endif
 #endif /* #ifndef CONFIG_TINY_RCU */
 
+/* Minimum time in ms until RCU can consider in-kernel boot as completed. */
+static int boot_end_delay = CONFIG_RCU_BOOT_END_DELAY;
+module_param(boot_end_delay, int, 0444);
+
 #ifdef CONFIG_DEBUG_LOCK_ALLOC
 /**
  * rcu_read_lock_held_common() - might we be in RCU-sched read-side critical section?
@@ -225,12 +229,29 @@ void rcu_unexpedite_gp(void)
 EXPORT_SYMBOL_GPL(rcu_unexpedite_gp);
 
 static bool rcu_boot_ended __read_mostly;
-
 /*
- * Inform RCU of the end of the in-kernel boot sequence.
+ * Inform RCU of the end of the in-kernel boot sequence. The boot sequence will
+ * not be marked ended until at least boot_end_delay milliseconds have passed.
  */
+void rcu_end_inkernel_boot(void);
+static void boot_rcu_work_fn(struct work_struct *work)
+{
+	rcu_end_inkernel_boot();
+}
+static DECLARE_DELAYED_WORK(boot_rcu_work, boot_rcu_work_fn);
+
 void rcu_end_inkernel_boot(void)
 {
+	if (boot_end_delay) {
+		u64 boot_ms = ktime_get_boot_fast_ns() / 1000000UL;
+
+		if (boot_ms < boot_end_delay) {
+			schedule_delayed_work(&boot_rcu_work,
+					boot_end_delay - boot_ms);
+			return;
+		}
+	}
+
 	rcu_unexpedite_gp();
 	rcu_async_relax();
 	if (rcu_normal_after_boot)
-- 
2.39.2.637.g21b0678d19-goog
