Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17F6357A53A
	for <lists+linux-doc@lfdr.de>; Tue, 19 Jul 2022 19:28:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239251AbiGSR2P (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 19 Jul 2022 13:28:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239371AbiGSR2G (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Jul 2022 13:28:06 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7FDF4E86A;
        Tue, 19 Jul 2022 10:28:01 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4694A61551;
        Tue, 19 Jul 2022 17:28:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11E95C36AE7;
        Tue, 19 Jul 2022 17:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658251680;
        bh=tFQeIFcFJY3lIF68AI4Lr4svxai5erbmpSh5Zi8+S+4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kpvLgN/3eI28chYUTM1GGL4W1QW+AbX0r6Z9dKoM76xAJYOLStL+FqZ0rhOThyeG7
         4LpZ3pdNEPWDyG4iyL3A/3uSNTpCfECf2cxw3X4jQEIYyu/e6HNt15m97lmIiCiB5X
         U6d2yLfpGTIWOucY5r8NTYKCXX6sYwchK1tBZsGovGf0wz3eubLkqbziE1CCQRwHxs
         cFBCD/LjJ00l9K6ocSd0Un+YnJLoLX60xui6OlQ3DWJWVvog0DzW0orZrzZ3HdoWqD
         myB0aR/LXqa2Sj2zXXuf1VkEd/KoyrTOnIOnCRG39MefTZ0Sg/D4AKFMlVcnIGRslv
         OuROf76WAPuJw==
From:   Daniel Bristot de Oliveira <bristot@kernel.org>
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Daniel Bristot de Oliveira <bristot@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Ingo Molnar <mingo@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Peter Zijlstra <peterz@infradead.org>,
        Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Marco Elver <elver@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Gabriele Paoloni <gpaoloni@redhat.com>,
        Juri Lelli <juri.lelli@redhat.com>,
        Clark Williams <williams@redhat.com>,
        Tao Zhou <tao.zhou@linux.dev>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-trace-devel@vger.kernel.org
Subject: [PATCH V6 05/16] rv/include: Add instrumentation helper functions
Date:   Tue, 19 Jul 2022 19:27:10 +0200
Message-Id: <9175dee31f1bf17ba35ae0d39451c7960ea95b24.1658244826.git.bristot@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1658244826.git.bristot@kernel.org>
References: <cover.1658244826.git.bristot@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Instrumentation helper functions to facilitate the instrumentation of
auto-generated RV monitors create by dot2k.

Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marco Elver <elver@google.com>
Cc: Dmitry Vyukov <dvyukov@google.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: Gabriele Paoloni <gpaoloni@redhat.com>
Cc: Juri Lelli <juri.lelli@redhat.com>
Cc: Clark Williams <williams@redhat.com>
Cc: Tao Zhou <tao.zhou@linux.dev>
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-trace-devel@vger.kernel.org
Signed-off-by: Daniel Bristot de Oliveira <bristot@kernel.org>
---
 include/rv/instrumentation.h | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 include/rv/instrumentation.h

diff --git a/include/rv/instrumentation.h b/include/rv/instrumentation.h
new file mode 100644
index 000000000000..d4e7a02ede1a
--- /dev/null
+++ b/include/rv/instrumentation.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2019-2022 Red Hat, Inc. Daniel Bristot de Oliveira <bristot@kernel.org>
+ *
+ * Helper functions to facilitate the instrumentation of auto-generated
+ * RV monitors create by dot2k.
+ *
+ * The dot2k tool is available at tools/verification/dot2/
+ */
+
+#include <linux/ftrace.h>
+
+/*
+ * rv_attach_trace_probe - check and attach a handler function to a tracepoint
+ */
+#define rv_attach_trace_probe(monitor, tp, rv_handler)					\
+	do {										\
+		check_trace_callback_type_##tp(rv_handler);				\
+		WARN_ONCE(register_trace_##tp(rv_handler, NULL),			\
+				"fail attaching " #monitor " " #tp "handler");		\
+	} while (0)
+
+/*
+ * rv_detach_trace_probe - detach a handler function to a tracepoint
+ */
+#define rv_detach_trace_probe(monitor, tp, rv_handler)					\
+	do {										\
+		unregister_trace_##tp(rv_handler, NULL);				\
+	} while (0)
-- 
2.35.1

