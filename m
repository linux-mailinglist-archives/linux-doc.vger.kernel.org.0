Return-Path: <linux-doc+bounces-16295-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CC55C8C3F13
	for <lists+linux-doc@lfdr.de>; Mon, 13 May 2024 12:39:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C1871F21DA4
	for <lists+linux-doc@lfdr.de>; Mon, 13 May 2024 10:39:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 754A614C5AA;
	Mon, 13 May 2024 10:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EpLAJD2u"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88421465AC;
	Mon, 13 May 2024 10:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715596717; cv=none; b=L7sUGmLPep5IH8KuZIOYHmCSEsLuDoqlUDUG9pKK8HsDo1iDxxa+dReTYv46Kr3Ne4FIhIOBN1usTXL1hh9xdkrn6CbpeVad9F3ksfmLjh0ZGlj07Bjq1xPuoN1kDwoyvMRKK94rG+yZYE5CP8H+L4KV9HbT3jwqsEMbCctX4nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715596717; c=relaxed/simple;
	bh=y5adxHXLHL8NZQh0tAHT3KFv1sn+kvC5uRh0rbKSfoQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=G0tKUNeLdz/os6VCYLbak7QwmovEna+HIqRcKjS+lU0YAwvLaDI2L6x+aMMI9zgx/KyG8WPyGc60za1ys1QLA1z/F4CxlLUcR4wduAMCA1Oj5WgO4X6x3yJiBDYeFrpp3GXTw/sYLHOr1rXVeWaGFcHxBxBO6KlUFCBU9IUlx/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EpLAJD2u; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715596716; x=1747132716;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=y5adxHXLHL8NZQh0tAHT3KFv1sn+kvC5uRh0rbKSfoQ=;
  b=EpLAJD2uI5b6i43gRbC3KOu7jWvVcEOCkR+Of190ZkLqwC2v7r4N6bZF
   8mv8OUaHbIJ3XqWx/Ezbc4DQOpX/23NtX/YxN7bpEB77TdUcgcD0qrcpM
   fd8Q6NOqNpoZYXo9Cn5tkemTP6Ss8R+Q9AO2e3pDUHSSxMqEEWZObfAUn
   cfrnmJPSnBC3e35sXmGVoKMK7CcQJoV74hma0KTJPQZ55VdqhpdqDk7zR
   4cZynOiU0BAfB9ltIBQzlxc2NtNmFBdAiCMWPBEERaJKlNjtT5EKbrFo+
   jOLLRQha7TX8FyKmHr+9ibeddiqIxKocb5OiRUqrvKkv2oOcILXc4kw/V
   Q==;
X-CSE-ConnectionGUID: MqjVmZXPScSg6XpYM1MGdA==
X-CSE-MsgGUID: iMwK1tzSTz2637jx+KZi1g==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="29038917"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; 
   d="scan'208";a="29038917"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 03:38:33 -0700
X-CSE-ConnectionGUID: S0EKDxP7Tjm3v9vAPSI90A==
X-CSE-MsgGUID: H59GIhOWQLO7T9GEWfPavQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; 
   d="scan'208";a="61481717"
Received: from inlubt0316.iind.intel.com ([10.191.20.213])
  by fmviesa001.fm.intel.com with ESMTP; 13 May 2024 03:38:27 -0700
From: lakshmi.sowjanya.d@intel.com
To: tglx@linutronix.de,
	jstultz@google.com,
	giometti@enneenne.com,
	corbet@lwn.net,
	linux-kernel@vger.kernel.org
Cc: x86@kernel.org,
	netdev@vger.kernel.org,
	linux-doc@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org,
	andriy.shevchenko@linux.intel.com,
	eddie.dong@intel.com,
	christopher.s.hall@intel.com,
	jesse.brandeburg@intel.com,
	davem@davemloft.net,
	alexandre.torgue@foss.st.com,
	joabreu@synopsys.com,
	mcoquelin.stm32@gmail.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	anthony.l.nguyen@intel.com,
	peter.hilber@opensynergy.com,
	pandith.n@intel.com,
	subramanian.mohan@intel.com,
	thejesh.reddy.t.r@intel.com,
	lakshmi.sowjanya.d@intel.com
Subject: [PATCH v8 02/12] x86/tsc: Update tsc/art values in the base clock structure
Date: Mon, 13 May 2024 16:08:03 +0530
Message-Id: <20240513103813.5666-3-lakshmi.sowjanya.d@intel.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240513103813.5666-1-lakshmi.sowjanya.d@intel.com>
References: <20240513103813.5666-1-lakshmi.sowjanya.d@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>

Add clocksource ID for x86 ART (Always Running Timer). The newly added
clocksource ID and conversion parameters are used to convert time in a
clocksource domain to base clock and vice versa.

Earlier code used architecture specific macros for the conversion, now
core code added hardware agnostic functions to convert the timestamp
using base clocksource structure. Update the base clock structure (ART)
for system clock based on TSC.

Co-developed-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Co-developed-by: Christopher S. Hall <christopher.s.hall@intel.com>
Signed-off-by: Christopher S. Hall <christopher.s.hall@intel.com>
Signed-off-by: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
---
 arch/x86/kernel/tsc.c           | 42 +++++++++++++++++++--------------
 include/linux/clocksource_ids.h |  1 +
 2 files changed, 25 insertions(+), 18 deletions(-)

diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index 5a69a49acc96..45bf2f6d0ffa 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -50,9 +50,9 @@ int tsc_clocksource_reliable;
 
 static int __read_mostly tsc_force_recalibrate;
 
-static u32 art_to_tsc_numerator;
-static u32 art_to_tsc_denominator;
-static u64 art_to_tsc_offset;
+static struct clocksource_base art_base_clk = {
+	.id    = CSID_X86_ART,
+};
 static bool have_art;
 
 struct cyc2ns {
@@ -1074,7 +1074,7 @@ core_initcall(cpufreq_register_tsc_scaling);
  */
 static void __init detect_art(void)
 {
-	unsigned int unused[2];
+	unsigned int unused;
 
 	if (boot_cpu_data.cpuid_level < ART_CPUID_LEAF)
 		return;
@@ -1089,13 +1089,14 @@ static void __init detect_art(void)
 	    tsc_async_resets)
 		return;
 
-	cpuid(ART_CPUID_LEAF, &art_to_tsc_denominator,
-	      &art_to_tsc_numerator, unused, unused+1);
+	cpuid(ART_CPUID_LEAF, &art_base_clk.denominator,
+	      &art_base_clk.numerator, &art_base_clk.freq_khz, &unused);
 
-	if (art_to_tsc_denominator < ART_MIN_DENOMINATOR)
+	art_base_clk.freq_khz /= KHZ;
+	if (art_base_clk.denominator < ART_MIN_DENOMINATOR)
 		return;
 
-	rdmsrl(MSR_IA32_TSC_ADJUST, art_to_tsc_offset);
+	rdmsrl(MSR_IA32_TSC_ADJUST, art_base_clk.offset);
 
 	/* Make this sticky over multiple CPU init calls */
 	setup_force_cpu_cap(X86_FEATURE_ART);
@@ -1303,13 +1304,13 @@ struct system_counterval_t convert_art_to_tsc(u64 art)
 {
 	u64 tmp, res, rem;
 
-	rem = do_div(art, art_to_tsc_denominator);
+	rem = do_div(art, art_base_clk.denominator);
 
-	res = art * art_to_tsc_numerator;
-	tmp = rem * art_to_tsc_numerator;
+	res = art * art_base_clk.numerator;
+	tmp = rem * art_base_clk.numerator;
 
-	do_div(tmp, art_to_tsc_denominator);
-	res += tmp + art_to_tsc_offset;
+	do_div(tmp, art_base_clk.denominator);
+	res += tmp + art_base_clk.offset;
 
 	return (struct system_counterval_t) {
 		.cs_id	= have_art ? CSID_X86_TSC : CSID_GENERIC,
@@ -1356,7 +1357,6 @@ struct system_counterval_t convert_art_ns_to_tsc(u64 art_ns)
 }
 EXPORT_SYMBOL(convert_art_ns_to_tsc);
 
-
 static void tsc_refine_calibration_work(struct work_struct *work);
 static DECLARE_DELAYED_WORK(tsc_irqwork, tsc_refine_calibration_work);
 /**
@@ -1458,8 +1458,10 @@ static void tsc_refine_calibration_work(struct work_struct *work)
 	if (tsc_unstable)
 		goto unreg;
 
-	if (boot_cpu_has(X86_FEATURE_ART))
+	if (boot_cpu_has(X86_FEATURE_ART)) {
 		have_art = true;
+		clocksource_tsc.base = &art_base_clk;
+	}
 	clocksource_register_khz(&clocksource_tsc, tsc_khz);
 unreg:
 	clocksource_unregister(&clocksource_tsc_early);
@@ -1484,8 +1486,10 @@ static int __init init_tsc_clocksource(void)
 	 * the refined calibration and directly register it as a clocksource.
 	 */
 	if (boot_cpu_has(X86_FEATURE_TSC_KNOWN_FREQ)) {
-		if (boot_cpu_has(X86_FEATURE_ART))
+		if (boot_cpu_has(X86_FEATURE_ART)) {
 			have_art = true;
+			clocksource_tsc.base = &art_base_clk;
+		}
 		clocksource_register_khz(&clocksource_tsc, tsc_khz);
 		clocksource_unregister(&clocksource_tsc_early);
 
@@ -1509,10 +1513,12 @@ static bool __init determine_cpu_tsc_frequencies(bool early)
 
 	if (early) {
 		cpu_khz = x86_platform.calibrate_cpu();
-		if (tsc_early_khz)
+		if (tsc_early_khz) {
 			tsc_khz = tsc_early_khz;
-		else
+		} else {
 			tsc_khz = x86_platform.calibrate_tsc();
+			clocksource_tsc.freq_khz = tsc_khz;
+		}
 	} else {
 		/* We should not be here with non-native cpu calibration */
 		WARN_ON(x86_platform.calibrate_cpu != native_calibrate_cpu);
diff --git a/include/linux/clocksource_ids.h b/include/linux/clocksource_ids.h
index a4fa3436940c..2bb4d8c2f1b0 100644
--- a/include/linux/clocksource_ids.h
+++ b/include/linux/clocksource_ids.h
@@ -9,6 +9,7 @@ enum clocksource_ids {
 	CSID_X86_TSC_EARLY,
 	CSID_X86_TSC,
 	CSID_X86_KVM_CLK,
+	CSID_X86_ART,
 	CSID_MAX,
 };
 
-- 
2.35.3


