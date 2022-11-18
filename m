Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0E8C62E9C5
	for <lists+linux-doc@lfdr.de>; Fri, 18 Nov 2022 00:43:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235112AbiKQXnn (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 17 Nov 2022 18:43:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240125AbiKQXng (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 17 Nov 2022 18:43:36 -0500
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73817B1F8
        for <linux-doc@vger.kernel.org>; Thu, 17 Nov 2022 15:43:32 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id b185so3286526pfb.9
        for <linux-doc@vger.kernel.org>; Thu, 17 Nov 2022 15:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xfJil3q4xneaphG+dBltmhf3iJIzvXDIW+JWkiHPnUY=;
        b=EIZNUa8F4WGrYp2tv1yKcZu0GTfzafGhT2L2DQkMVoO4piZ/rKuOgsgZvDgSG/Igd1
         wdittd188cOqUku2QHG/wUBisTrq6vaHN9O6aNHqdPFeMwEYWiC4fNriciImpLYtTrqb
         4kg2geAt6OwKUf+9fH/CfZXCZKRQplGj1+3eU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xfJil3q4xneaphG+dBltmhf3iJIzvXDIW+JWkiHPnUY=;
        b=mEID0UQLsoJaI+s6+X3uOfh/XT7qylRKYJOevb8V6Fmu/+Y3UrOCtUV8fGd6OfXBfk
         tfsTrYeYrTG6khqJyVxTDxzW4hpSgFT4EGvhBd1Tlfc2I0XqcmVgS4SIDOjnDhL9aEXg
         wOIvTh4kixQ8deSOvFbB4T2EQeu33MqAixDStPRBru4QXXKtsrQAE9mdweXPTv9KaQ23
         U+9muxZtPTDRq6eKNV92dkyf9qyiUhSHWI4/s/DF2AMrtNeLa/N5abMqKIf32IyoGnPA
         2GH9c8y5Jww/2EZqyzKhf5hqkCdgn0or23HaDy97d7ZA7IrWNbbHi8jva3V7o/CbBvol
         RctA==
X-Gm-Message-State: ANoB5plS/PGPHmGfU9xFxjKmQWKPIO1mnbhu6xhFWnEA75A5e2pJuh0x
        qTGifHS1Ota2mODxsJkYTnyeow==
X-Google-Smtp-Source: AA0mqf5RO0ohseJml0kMyZM8RW9bK2+ylkMpWRDRMToNKb5PFD/LTCbb2FYz53AgDtfV+G084ldgog==
X-Received: by 2002:a63:114b:0:b0:46a:e00b:ada0 with SMTP id 11-20020a63114b000000b0046ae00bada0mr4211444pgr.409.1668728611983;
        Thu, 17 Nov 2022 15:43:31 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id h72-20020a62834b000000b0056bd1bf4243sm1738916pfe.53.2022.11.17.15.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 15:43:31 -0800 (PST)
From:   Kees Cook <keescook@chromium.org>
To:     Jann Horn <jannh@google.com>
Cc:     Kees Cook <keescook@chromium.org>,
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
        linux-doc@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>,
        Seth Jenkins <sethjenkins@google.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Linus Torvalds <torvalds@linuxfoundation.org>,
        Andy Lutomirski <luto@kernel.org>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Dmitry Vyukov <dvyukov@google.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ben Segall <bsegall@google.com>,
        Daniel Bristot de Oliveira <bristot@redhat.com>,
        Valentin Schneider <vschneid@redhat.com>,
        Andrey Ryabinin <ryabinin.a.a@gmail.com>,
        Alexander Potapenko <glider@google.com>,
        Andrey Konovalov <andreyknvl@gmail.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        David Gow <davidgow@google.com>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Laurent Dufour <ldufour@linux.ibm.com>,
        Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org,
        kasan-dev@googlegroups.com, linux-mm@kvack.org,
        linux-hardening@vger.kernel.org
Subject: [PATCH v3 5/6] panic: Introduce warn_limit
Date:   Thu, 17 Nov 2022 15:43:25 -0800
Message-Id: <20221117234328.594699-5-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221117233838.give.484-kees@kernel.org>
References: <20221117233838.give.484-kees@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2740; h=from:subject; bh=UAp3/gSn5HSib4EzfW5wRRKF+FGTDjoMEFBYjvCvDcw=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBjdscd1GA/3PLtD3N4H7SsA34PTW3nka1IngIvEXYO EYIpEOyJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCY3bHHQAKCRCJcvTf3G3AJvptEA CdGFz8DSNbF4RMjKrrJk88mEDkxWYDqPKgqX4mCBz5IHyHLYf59wVt93MA2s9+Y5dISuBzWnk9orB4 qfArFrJPEPZY2IBBUlcPeCEho6xpwbHRntreRWX2Sn3lBbclKlgm+lVQ4FTgRavIV0cJjI0qMAutZF FAOyJnKFEYiRADA34tk5jIW4ubWsNHHNSG3AjwA0jb9PVui0Wy9LqrbJj0EJD9bkuR/7WGPavbMUEg ntUcsuYQDfvqUgW6Ywm+NK7jv4NozevnPZ7AVR7JCAdexGnbZsuZSeeal58/st/wu+XrpcUVhLcQ5q 8dapczcaRwqnG01Y1bbClamjnwPLMwL60GNMluInTigO4LEXvrEh9pUIjhTIXeIq9QAqDRxjifFRMu bCTr8sX6wOsDtkOizBKxqRBSgCsNFG4CFJbDcxGi5ZJNmOeFwyaJxfQbAWOUq+JZUKZ5FA51HfTDoN 4WjzLeqQ1jqeVDmfPJ0NgZD1rNVWBPpEPRaOmkukaDQyyOeA5Fbh7vfLGUGFMgs3m3NngBdna8YG19 Bv6YBosdV/NmTETybYC0gITxiJPHbKV1dx0B+ZNAbQ9wm1FfG+41bCdpnicHfdZwQGkISK1KSkk6cP 1VQADkQ9vKmG7cMXRQDydqjmg7PmKftmrXjELJoAwbLHqmZ85HDIfmjxDQKg==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

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
---
 Documentation/admin-guide/sysctl/kernel.rst |  9 +++++++++
 kernel/panic.c                              | 14 ++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
index 09f3fb2f8585..c385d5319cdf 100644
--- a/Documentation/admin-guide/sysctl/kernel.rst
+++ b/Documentation/admin-guide/sysctl/kernel.rst
@@ -1508,6 +1508,15 @@ entry will default to 2 instead of 0.
 2 Unprivileged calls to ``bpf()`` are disabled
 = =============================================================
 
+
+warn_limit
+==========
+
+Number of kernel warnings after which the kernel should panic when
+``panic_on_warn`` is not set. Setting this to 0 or 1 has the same effect
+as setting ``panic_on_warn=1``.
+
+
 watchdog
 ========
 
diff --git a/kernel/panic.c b/kernel/panic.c
index cfa354322d5f..e5aab27496d7 100644
--- a/kernel/panic.c
+++ b/kernel/panic.c
@@ -58,6 +58,7 @@ bool crash_kexec_post_notifiers;
 int panic_on_warn __read_mostly;
 unsigned long panic_on_taint;
 bool panic_on_taint_nousertaint = false;
+static unsigned int warn_limit __read_mostly = 10000;
 
 int panic_timeout = CONFIG_PANIC_TIMEOUT;
 EXPORT_SYMBOL_GPL(panic_timeout);
@@ -88,6 +89,13 @@ static struct ctl_table kern_panic_table[] = {
 		.extra2         = SYSCTL_ONE,
 	},
 #endif
+	{
+		.procname       = "warn_limit",
+		.data           = &warn_limit,
+		.maxlen         = sizeof(warn_limit),
+		.mode           = 0644,
+		.proc_handler   = proc_douintvec,
+	},
 	{ }
 };
 
@@ -203,8 +211,14 @@ static void panic_print_sys_info(bool console_flush)
 
 void check_panic_on_warn(const char *origin)
 {
+	static atomic_t warn_count = ATOMIC_INIT(0);
+
 	if (panic_on_warn)
 		panic("%s: panic_on_warn set ...\n", origin);
+
+	if (atomic_inc_return(&warn_count) >= READ_ONCE(warn_limit))
+		panic("%s: system warned too often (kernel.warn_limit is %d)",
+		      warn_limit);
 }
 
 /**
-- 
2.34.1

