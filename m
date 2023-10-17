Return-Path: <linux-doc+bounces-393-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 187077CBA11
	for <lists+linux-doc@lfdr.de>; Tue, 17 Oct 2023 07:25:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A89852816A5
	for <lists+linux-doc@lfdr.de>; Tue, 17 Oct 2023 05:25:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24994C123;
	Tue, 17 Oct 2023 05:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BUrl9gV6"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C7CC122
	for <linux-doc@vger.kernel.org>; Tue, 17 Oct 2023 05:25:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41C5D10DD;
	Mon, 16 Oct 2023 22:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697520315; x=1729056315;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=zZsZ6JtO9YdL4Vld6agzB3/nEAv9fTcA8dq0o18MW2g=;
  b=BUrl9gV65NscXhHRrpQkdwbJB368xbk72nFvkteUnVRSpVT5lW83MLEn
   pLoFtjzNH2XG2kj71JpG8EPgCplkef89h6mleAD0kfTxzCcHb6WYdbx3w
   b/n/oGu5u4w+aV81WRJ4e2N0Gb9VVYk6a3PJApATabtGi5WJv3ZGJ7Xdb
   2O9HHeAaXLTLHGRsIepc+2J4sp7xlIIg2l9ibaSfP/sTQJHgCSold4LqY
   OdfMhjJWv5o66LdZI61gIoEA+cOpJ5uc7xbJypeCUZlwiXjKM/ii2IzNQ
   Swiaum5sbOKUOdixg5OWUK8vqpD7LLbWti3RUkSz9c9C9avVUY5njKm1V
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="388561752"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="388561752"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 22:25:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="1087357996"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="1087357996"
Received: from inlubt0316.iind.intel.com ([10.191.20.213])
  by fmsmga005.fm.intel.com with ESMTP; 16 Oct 2023 22:25:10 -0700
From: lakshmi.sowjanya.d@intel.com
To: tglx@linutronix.de,
	jstultz@google.com,
	giometti@enneenne.com,
	corbet@lwn.net,
	linux-kernel@vger.kernel.org
Cc: x86@kernel.org,
	linux-doc@vger.kernel.org,
	andriy.shevchenko@linux.intel.com,
	eddie.dong@intel.com,
	christopher.s.hall@intel.com,
	pandith.n@intel.com,
	mallikarjunappa.sangannavar@intel.com,
	thejesh.reddy.t.r@intel.com,
	lakshmi.sowjanya.d@intel.com
Subject: [PATCH v1 3/6] x86/tsc: Check if the current clock source is related to ART(Always Running Timer)
Date: Tue, 17 Oct 2023 10:54:54 +0530
Message-Id: <20231017052457.25287-4-lakshmi.sowjanya.d@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231017052457.25287-1-lakshmi.sowjanya.d@intel.com>
References: <20231017052457.25287-1-lakshmi.sowjanya.d@intel.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>

From: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>

Add interface 'is_current_clocksource_art_related()' in tsc.c to check
if the current clock source is ART related.
Add helper function 'is_current_clocksource(clock)' in timekeeping.c to
check if the provided clock matches the current clock source.

Co-developed-by: Christopher Hall <christopher.s.hall@intel.com>
Signed-off-by: Christopher Hall <christopher.s.hall@intel.com>
Signed-off-by: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
---
 arch/x86/include/asm/tsc.h  |  1 +
 arch/x86/kernel/tsc.c       | 12 ++++++++++++
 include/linux/timekeeping.h |  2 ++
 kernel/time/timekeeping.c   | 15 +++++++++++++++
 4 files changed, 30 insertions(+)

diff --git a/arch/x86/include/asm/tsc.h b/arch/x86/include/asm/tsc.h
index f5cff8d4f61e..cdfe34e55cf3 100644
--- a/arch/x86/include/asm/tsc.h
+++ b/arch/x86/include/asm/tsc.h
@@ -32,6 +32,7 @@ static inline cycles_t get_cycles(void)
 extern int convert_tsc_to_art(const struct system_counterval_t *tsc, u64 *art);
 extern struct system_counterval_t convert_art_to_tsc(u64 art);
 extern struct system_counterval_t convert_art_ns_to_tsc(u64 art_ns);
+extern bool is_current_clocksource_art_related(void);
 
 extern void tsc_early_init(void);
 extern void tsc_init(void);
diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index 92b800015d8f..2d6b1b5b5b3e 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -16,6 +16,7 @@
 #include <linux/timex.h>
 #include <linux/static_key.h>
 #include <linux/static_call.h>
+#include <linux/timekeeping.h>
 
 #include <asm/hpet.h>
 #include <asm/timer.h>
@@ -1295,6 +1296,17 @@ int unsynchronized_tsc(void)
 	return 0;
 }
 
+/*
+ * Checks if the current clocksource is ART related clocksource
+ *
+ * Return: 1 on success, 0 on failure.
+ */
+bool is_current_clocksource_art_related(void)
+{
+	return is_current_clocksource(art_related_clocksource);
+}
+EXPORT_SYMBOL_GPL(is_current_clocksource_art_related);
+
 /*
  * Converts input TSC to the corresponding ART value using conversion
  * factors discovered by detect_art().
diff --git a/include/linux/timekeeping.h b/include/linux/timekeeping.h
index e5eb6699d691..9bf7970b3b2f 100644
--- a/include/linux/timekeeping.h
+++ b/include/linux/timekeeping.h
@@ -292,6 +292,8 @@ extern int get_device_system_crosststamp(
 extern int ktime_convert_real_to_system_counter(ktime_t sys_realtime,
 						struct system_counterval_t *ret);
 
+extern bool is_current_clocksource(struct clocksource *clock);
+
 /*
  * Simultaneously snapshot realtime and monotonic raw clocks
  */
diff --git a/kernel/time/timekeeping.c b/kernel/time/timekeeping.c
index ff6a4c7387ee..986089d36ba5 100644
--- a/kernel/time/timekeeping.c
+++ b/kernel/time/timekeeping.c
@@ -1357,6 +1357,21 @@ int ktime_convert_real_to_system_counter(ktime_t sys_realtime,
 }
 EXPORT_SYMBOL_GPL(ktime_convert_real_to_system_counter);
 
+/**
+ * is_current_clocksource - Checks if the supplied clock source matches with the
+ * MONOTONIC clock.
+ *
+ * @clock: pointer to the clocksource to be checked
+ *
+ * Return: true if the clocks match, false otherwise.
+ */
+bool is_current_clocksource(struct clocksource *clock)
+{
+	struct tk_read_base *tkr = &tk_core.timekeeper.tkr_mono;
+	return clock == READ_ONCE(tkr->clock);
+}
+EXPORT_SYMBOL_GPL(is_current_clocksource);
+
 /**
  * do_settimeofday64 - Sets the time of day.
  * @ts:     pointer to the timespec64 variable containing the new time
-- 
2.17.1


