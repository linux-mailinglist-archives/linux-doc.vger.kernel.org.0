Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E718C1E24B2
	for <lists+linux-doc@lfdr.de>; Tue, 26 May 2020 16:58:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727978AbgEZO6V (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 26 May 2020 10:58:21 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:39282 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729849AbgEZO6V (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 26 May 2020 10:58:21 -0400
Received: by mail-pg1-f195.google.com with SMTP id w20so5160712pga.6
        for <linux-doc@vger.kernel.org>; Tue, 26 May 2020 07:58:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3I2sdug0etgqRHUdoxPJvhoiBePAC70+vSrOonIbSmY=;
        b=DnREPYFqK8swyD3IcAq65kInHHSej1BmsifR0Uj8/R9Bz00Vn6o80+vdHFMqYv9n0Y
         YKMpvn0+SW9Jc0XsUpgMhQmEKCphDX+j1Jb2WN65dWU5ueeev9S0chzBbSEtuDZA6ejw
         pqHvKjczrwoX2FIMMtJb67uCFw2GkRxeEdli2vOxzAaNnc3MpPknzyI7UNlri9M8mPGt
         FV5m833bohM4219c55VsBIWd8hSovjBXoW4Fmgw7U8ZDvCXBb+6za8b3geqYJtqCFuew
         Emry//gbNtkEbP5G3cgFtIsuebwbc6bqml+CwpXKBFmKtXUWrTlVHBGfk+nFcP9H/IsV
         zOAA==
X-Gm-Message-State: AOAM530/W8zhT3tLLEuYDhaduHtVqqzRvDj8rtthwwNMgNVT+Bkw54vn
        rteqkeThB2/1jE/wy6JTDwU=
X-Google-Smtp-Source: ABdhPJzJaYN4ntJJUBQLZkn2aHOjXkZz9n10k3zyXqZUK0b9WXONQmFoEwqdRvfl1NgbqhEfdzhC+Q==
X-Received: by 2002:aa7:96e7:: with SMTP id i7mr22201689pfq.114.1590505100798;
        Tue, 26 May 2020 07:58:20 -0700 (PDT)
Received: from 42.do-not-panic.com (42.do-not-panic.com. [157.230.128.187])
        by smtp.gmail.com with ESMTPSA id 1sm68426pje.26.2020.05.26.07.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2020 07:58:19 -0700 (PDT)
Received: by 42.do-not-panic.com (Postfix, from userid 1000)
        id 9DD6C40E7B; Tue, 26 May 2020 14:58:17 +0000 (UTC)
From:   Luis Chamberlain <mcgrof@kernel.org>
To:     jeyu@kernel.org, davem@davemloft.net, kuba@kernel.org
Cc:     michael.chan@broadcom.com, dchickles@marvell.com,
        sburla@marvell.com, fmanlunas@marvell.com, aelior@marvell.com,
        GR-everest-linux-l2@marvell.com, kvalo@codeaurora.org,
        johannes@sipsolutions.net, akpm@linux-foundation.org,
        arnd@arndb.de, rostedt@goodmis.org, mingo@redhat.com,
        aquini@redhat.com, cai@lca.pw, dyoung@redhat.com, bhe@redhat.com,
        peterz@infradead.org, tglx@linutronix.de, gpiccoli@canonical.com,
        pmladek@suse.com, tiwai@suse.de, schlad@suse.de,
        andriy.shevchenko@linux.intel.com, derosier@gmail.com,
        keescook@chromium.org, daniel.vetter@ffwll.ch, will@kernel.org,
        mchehab+samsung@kernel.org, vkoul@kernel.org,
        mchehab+huawei@kernel.org, robh@kernel.org, mhiramat@kernel.org,
        sfr@canb.auug.org.au, linux@dominikbrodowski.net,
        glider@google.com, paulmck@kernel.org, elver@google.com,
        bauerman@linux.ibm.com, yamada.masahiro@socionext.com,
        samitolvanen@google.com, yzaikin@google.com, dvyukov@google.com,
        rdunlap@infradead.org, corbet@lwn.net, dianders@chromium.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>
Subject: [PATCH v3 1/8] kernel.h: move taint and system state flags to uapi
Date:   Tue, 26 May 2020 14:58:08 +0000
Message-Id: <20200526145815.6415-2-mcgrof@kernel.org>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20200526145815.6415-1-mcgrof@kernel.org>
References: <20200526145815.6415-1-mcgrof@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The taint and system state flags will be used in a subsequent patch
exposing these to userspace, so move them to uapi. We keep the
TAINT_FLAGS_COUNT outside of uapi, as this value can change per release.

Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
---
 include/linux/kernel.h      | 34 +---------------------------------
 include/uapi/linux/kernel.h | 35 +++++++++++++++++++++++++++++++++++
 2 files changed, 36 insertions(+), 33 deletions(-)

diff --git a/include/linux/kernel.h b/include/linux/kernel.h
index 82d91547d122..337634363d00 100644
--- a/include/linux/kernel.h
+++ b/include/linux/kernel.h
@@ -569,40 +569,8 @@ extern unsigned long get_taint(void);
 extern int root_mountflags;
 
 extern bool early_boot_irqs_disabled;
+extern enum system_states  system_state;
 
-/*
- * Values used for system_state. Ordering of the states must not be changed
- * as code checks for <, <=, >, >= STATE.
- */
-extern enum system_states {
-	SYSTEM_BOOTING,
-	SYSTEM_SCHEDULING,
-	SYSTEM_RUNNING,
-	SYSTEM_HALT,
-	SYSTEM_POWER_OFF,
-	SYSTEM_RESTART,
-	SYSTEM_SUSPEND,
-} system_state;
-
-/* This cannot be an enum because some may be used in assembly source. */
-#define TAINT_PROPRIETARY_MODULE	0
-#define TAINT_FORCED_MODULE		1
-#define TAINT_CPU_OUT_OF_SPEC		2
-#define TAINT_FORCED_RMMOD		3
-#define TAINT_MACHINE_CHECK		4
-#define TAINT_BAD_PAGE			5
-#define TAINT_USER			6
-#define TAINT_DIE			7
-#define TAINT_OVERRIDDEN_ACPI_TABLE	8
-#define TAINT_WARN			9
-#define TAINT_CRAP			10
-#define TAINT_FIRMWARE_WORKAROUND	11
-#define TAINT_OOT_MODULE		12
-#define TAINT_UNSIGNED_MODULE		13
-#define TAINT_SOFTLOCKUP		14
-#define TAINT_LIVEPATCH			15
-#define TAINT_AUX			16
-#define TAINT_RANDSTRUCT		17
 #define TAINT_FLAGS_COUNT		18
 #define TAINT_FLAGS_MAX			((1UL << TAINT_FLAGS_COUNT) - 1)
 
diff --git a/include/uapi/linux/kernel.h b/include/uapi/linux/kernel.h
index 0ff8f7477847..4bbd4093eb64 100644
--- a/include/uapi/linux/kernel.h
+++ b/include/uapi/linux/kernel.h
@@ -12,4 +12,39 @@
 
 #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
 
+/*
+ * Values used for system_state. Ordering of the states must not be changed
+ * as code checks for <, <=, >, >= STATE.
+ */
+enum system_states {
+	SYSTEM_BOOTING,
+	SYSTEM_SCHEDULING,
+	SYSTEM_RUNNING,
+	SYSTEM_HALT,
+	SYSTEM_POWER_OFF,
+	SYSTEM_RESTART,
+	SYSTEM_SUSPEND,
+};
+
+/* This cannot be an enum because some may be used in assembly source. */
+#define TAINT_PROPRIETARY_MODULE	0
+#define TAINT_FORCED_MODULE		1
+#define TAINT_CPU_OUT_OF_SPEC		2
+#define TAINT_FORCED_RMMOD		3
+#define TAINT_MACHINE_CHECK		4
+#define TAINT_BAD_PAGE			5
+#define TAINT_USER			6
+#define TAINT_DIE			7
+#define TAINT_OVERRIDDEN_ACPI_TABLE	8
+#define TAINT_WARN			9
+#define TAINT_CRAP			10
+#define TAINT_FIRMWARE_WORKAROUND	11
+#define TAINT_OOT_MODULE		12
+#define TAINT_UNSIGNED_MODULE		13
+#define TAINT_SOFTLOCKUP		14
+#define TAINT_LIVEPATCH			15
+#define TAINT_AUX			16
+#define TAINT_RANDSTRUCT		17
+/* be sure to update TAINT_FLAGS_COUNT when extending this */
+
 #endif /* _UAPI_LINUX_KERNEL_H */
-- 
2.26.2

