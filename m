Return-Path: <linux-doc+bounces-9929-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47741858C54
	for <lists+linux-doc@lfdr.de>; Sat, 17 Feb 2024 02:04:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C3701C2165B
	for <lists+linux-doc@lfdr.de>; Sat, 17 Feb 2024 01:04:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9E6D2C848;
	Sat, 17 Feb 2024 00:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="0MN9RtQT"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB12F288D7
	for <linux-doc@vger.kernel.org>; Sat, 17 Feb 2024 00:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708131533; cv=none; b=E1SHMp+dF2vH92yqZCjnjBHvyJ2HlSZc7fCCsJ8mSlJSFuGlmU/R7L2I5SpehsK4utfJo41oLy/EdWnMZMV4TtMVt6m4//sbBxC28SaJxArf0i6B4rompQUvIBWk5smcJnkRxIkW5wZuX5JJGVMjJWddMY4h0HuBrTxcwJLi45E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708131533; c=relaxed/simple;
	bh=zyrel2UEjab5KGKGlyHEwcdtqQdF9BiXIzrE57+AEEg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DdRE/kaCNiM6us6+08AxryWCj/alov42irjJKfrtxDhmXM+TsOB8kmhWmryAy4WM96vvuWig0wZPsmiUQ/S3lNKclYoFRnfO0GfCCGlz1b9C6wnPLAXAHxAE7seUk+SyByMgnTbsuG9+Gaob/9VT5s/RIEru7dfqksLpQBWP0W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=0MN9RtQT; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3c0471954faso2030202b6e.2
        for <linux-doc@vger.kernel.org>; Fri, 16 Feb 2024 16:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1708131531; x=1708736331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wzekTDmDm0BHWDBhHgdtQywPCZoHi4eTbi4rsPTxLsk=;
        b=0MN9RtQTj4GZ7u5AkDMDGD3MBC/++0bGYZkCns7aNbSaVVweYAj7nPmNcy0ZkMifF5
         1IpliEMOwcqCP3X5Spta0idPSk/LxzLS05uRqhmxSa4LlonvEOrBDEDD3OMvzQr0jtiL
         Kddke+AkYsBOKIA8JR2gkeXUAEZuXsjvupIaSVb0K48MBMADPDTABD4WZWwTHMp1WWNo
         UQ8SuSZuqJ/RlRyc8PkJnd2cM0qjDKdVmJvS5+8TfVHDfjySGyyqNOSDqMaJD6XJ4vSa
         89q4Tj5RL5RTcZThdYxQfCcTpalNzdZOCe0oc/9Cs2akJJPLeCh2Vgc7jZ6ne++vn0x4
         /TUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708131531; x=1708736331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wzekTDmDm0BHWDBhHgdtQywPCZoHi4eTbi4rsPTxLsk=;
        b=R6Z03qk9LbYzc2quW64CbCmnbPOAmJ1KLLeSu8SUaUk1clSeTNgj/OsWWa+FeDvwW9
         JEcTdGAc9jsAW/OAch4B/1Eht0Mv/bKJyMdV+VbZ+j2ydI3m38bV7kshTGkQkSJn+bcY
         KHvS9Le2Ny8jLLfocNkOgcfv7/AI4ksGI4ThHxsz+Pa4OXGzlFVsYC3Q8Mt+F7QZ05kP
         Dsko4jXVxHSxhh3Jmz1VslalWj6oYD3iX4UgViJCLSS8E6FzxzPy9zw2i3xakDoWadjV
         Syqbs7dEfs6dz7VsHa2dzb7OMpSrWNTx7ZTVlhjCDh0MItYcQKs2jCya9Xo/brizZleS
         XaZA==
X-Forwarded-Encrypted: i=1; AJvYcCU1x+zxoV+kvs7gpLUguZglYsbACHRpny0vm4DZpsSGZhPZMz5hlhLwxFhV0/g0N6J/Z5fUxXU7hW6CO2Xbh1F8452HBTHbovLJ
X-Gm-Message-State: AOJu0Yy9t/8krXWnOziVBIQJX1m0ZECTgc99cR7zOBVzz/zjrfTsTqk9
	jADRpWriSG/ktmb5WEMA6u8VQrjot5rKD0wHALc4/rp5/4pfErGAdBSC2khAJAA=
X-Google-Smtp-Source: AGHT+IFh5z2qRfi3D9IkKas86nFROYWU3mPjDzUuW4T2X7wbUeQ8t61ZPYIlkMzVMiWXNbGIgenNww==
X-Received: by 2002:a05:6808:4d0:b0:3c1:347f:39d1 with SMTP id a16-20020a05680804d000b003c1347f39d1mr6306573oie.22.1708131530901;
        Fri, 16 Feb 2024 16:58:50 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d188-20020a6336c5000000b005dc89957e06sm487655pga.71.2024.02.16.16.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 16:58:50 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Atish Patra <atishp@atishpatra.org>,
	Christian Brauner <brauner@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Conor Dooley <conor@kernel.org>,
	devicetree@vger.kernel.org,
	Evan Green <evan@rivosinc.com>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Ian Rogers <irogers@google.com>,
	Ingo Molnar <mingo@redhat.com>,
	James Clark <james.clark@arm.com>,
	Jing Zhang <renyu.zj@linux.alibaba.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ji Sheng Teoh <jisheng.teoh@starfivetech.com>,
	John Garry <john.g.garry@oracle.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Kan Liang <kan.liang@linux.intel.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	linux-doc@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Rob Herring <robh+dt@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Weilin Wang <weilin.wang@intel.com>,
	Will Deacon <will@kernel.org>,
	kaiwenxue1@gmail.com,
	Yang Jihong <yangjihong1@huawei.com>
Subject: [PATCH RFC 14/20] RISC-V: perf: Use config2 for event to counter mapping
Date: Fri, 16 Feb 2024 16:57:32 -0800
Message-Id: <20240217005738.3744121-15-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240217005738.3744121-1-atishp@rivosinc.com>
References: <20240217005738.3744121-1-atishp@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The counter restriction specified in the json file is passed to
the drivers via config2 paarameter in perf attributes. This allows
any platform vendor to define their custom mapping between event and
hpmcounters without any rules defined in the ISA.

However, the cycle and instruction counters are fixed (0 and 2
respectively) by the ISA. The platform vendor must specify this
in the json file if intended to be used while profiling. Otherwise,
they can just specify the alternate hpmcounters that may monitor
and/or sample the cycle/instruction counts.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 drivers/perf/riscv_pmu_dev.c   | 36 +++++++++++++++++++++++-----------
 include/linux/perf/riscv_pmu.h |  2 ++
 2 files changed, 27 insertions(+), 11 deletions(-)

diff --git a/drivers/perf/riscv_pmu_dev.c b/drivers/perf/riscv_pmu_dev.c
index 0cdad0dafb71..5bad4131e920 100644
--- a/drivers/perf/riscv_pmu_dev.c
+++ b/drivers/perf/riscv_pmu_dev.c
@@ -49,6 +49,7 @@ static ssize_t __maybe_unused rvpmu_format_show(struct device *dev,
 	RVPMU_ATTR_ENTRY(_name, rvpmu_format_show, (char *)_config)
 
 PMU_FORMAT_ATTR(firmware, "config:63");
+PMU_FORMAT_ATTR(counterid_mask, "config2:0-31");
 
 static DEFINE_STATIC_KEY_FALSE(riscv_pmu_sbi_available);
 static DEFINE_STATIC_KEY_FALSE(riscv_pmu_cdeleg_available);
@@ -74,6 +75,7 @@ static const struct attribute_group *riscv_sbi_pmu_attr_groups[] = {
 static struct attribute *riscv_cdeleg_pmu_formats_attr[] = {
 	RVPMU_FORMAT_ATTR_ENTRY(event, RVPMU_CDELEG_PMU_FORMAT_ATTR),
 	&format_attr_firmware.attr,
+	&format_attr_counterid_mask.attr,
 	NULL,
 };
 
@@ -974,23 +976,39 @@ static int rvpmu_deleg_find_ctrs(void)
 	return num_hw_ctr;
 }
 
+/* The json file must correctly specify counter 0 or counter 2 is available
+ * in the counter lists for cycle/instret events. Otherwise, the drivers have
+ * no way to figure out if a fixed counter must be used and pick a programmable
+ * counter if available.
+ */
 static int get_deleg_fixed_hw_idx(struct cpu_hw_events *cpuc, struct perf_event *event)
 {
-	return -EINVAL;
+	if (!event->attr.config2)
+		return -EINVAL;
+
+	if (event->attr.config2 & RISCV_PMU_CYCLE_FIXED_CTR_MASK)
+		return 0; /* CY counter */
+	else if (event->attr.config2 & RISCV_PMU_INSTRUCTION_FIXED_CTR_MASK)
+		return 2; /* IR counter */
+	else
+		return -EINVAL;
 }
 
 static int get_deleg_next_hpm_hw_idx(struct cpu_hw_events *cpuc, struct perf_event *event)
 {
 	unsigned long hw_ctr_mask = 0;
 
-	/*
-	 * TODO: Treat every hpmcounter can monitor every event for now.
-	 * The event to counter mapping should come from the json file.
-	 * The mapping should also tell if sampling is supported or not.
-	 */
-
 	/* Select only hpmcounters */
 	hw_ctr_mask = cmask & (~0x7);
+
+	/*
+	 * Mask off the counters that can't monitor this event (specified via json)
+	 * The counter mask for this event is set in config2 via the property 'Counter'
+	 * in the json file or manual configuration of config2. If the config2 is not set, it
+	 * is assumed all the available hpmcounters can monitor this event.
+	 */
+	if (event->attr.config2)
+		hw_ctr_mask = hw_ctr_mask & event->attr.config2;
 	hw_ctr_mask &= ~(cpuc->used_hw_ctrs[0]);
 	return __ffs(hw_ctr_mask);
 }
@@ -1020,10 +1038,6 @@ static int rvpmu_deleg_ctr_get_idx(struct perf_event *event)
 	uint64_t priv_filter;
 	int idx;
 
-	/*
-	 * TODO: We should not rely on SBI Perf encoding to check if the event
-	 * is a fixed one or not.
-	 */
 	if (!is_sampling_event(event)) {
 		idx = get_deleg_fixed_hw_idx(cpuc, event);
 		if (idx == 0 || idx == 2) {
diff --git a/include/linux/perf/riscv_pmu.h b/include/linux/perf/riscv_pmu.h
index f878369fecc8..425edd6685a9 100644
--- a/include/linux/perf/riscv_pmu.h
+++ b/include/linux/perf/riscv_pmu.h
@@ -30,6 +30,8 @@
 #define RISCV_PMU_CONFIG1_GUEST_EVENTS 0x1
 
 #define RISCV_PMU_DELEG_RAW_EVENT_MASK GENMASK_ULL(55, 0)
+#define RISCV_PMU_CYCLE_FIXED_CTR_MASK 0x01
+#define RISCV_PMU_INSTRUCTION_FIXED_CTR_MASK 0x04
 
 struct cpu_hw_events {
 	/* currently enabled events */
-- 
2.34.1


