Return-Path: <linux-doc+bounces-12700-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D32988BD72
	for <lists+linux-doc@lfdr.de>; Tue, 26 Mar 2024 10:16:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59D891C29A30
	for <lists+linux-doc@lfdr.de>; Tue, 26 Mar 2024 09:16:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C497C482E2;
	Tue, 26 Mar 2024 09:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gn/Uzx1A"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A769B524D0
	for <linux-doc@vger.kernel.org>; Tue, 26 Mar 2024 09:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711444586; cv=none; b=W/SbyXiGkGXqoI3yMwiRAyPtHlE0ROu9VpFFVHmtk3WjI8GSQVzbdo0+ITrOH2KaZpYuX+U7i0wbzOY4UXNaHhSTGCtY+qkqBgM/nqYsUGEkIu4Gu4VeSWY2dDlz+HQ3iGu5yUfeQWcTMjJW2oEETogIqrmMpQcguLz6MvxeJ+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711444586; c=relaxed/simple;
	bh=i0D1IBTob5kwT5WOYydIpPSm6Qn958At0dw1K+wykiA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Mv6JnnT4w2AJYY6Rxf3H8DwusBD/3xyoc0ldzMIpQ7vF5nkgsRCVuID7QInreOpqwpECZspHopzI/vIzsg+R9M//JV6FnoaYhYFLFN5f5NIzRNX/uKd3AQxS1P6CD4U6H7SjOLoah3qRS1T18O8zSM9tfWIAGt196eR8WZUAFEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gn/Uzx1A; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4148c5de23fso6404025e9.1
        for <linux-doc@vger.kernel.org>; Tue, 26 Mar 2024 02:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711444582; x=1712049382; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ncvV5tywoT0mg3neUWKgBj7OJB0wlJy/Q6vGL+2Nulc=;
        b=gn/Uzx1A5rgMPv6Q6DO7Y60IVaP9G3O6xu+nTm+tnQ+hZH7H4TIx3owHMAHzg4Xf75
         CTNn9GF6zOWkCYN5tCLHVxrlg9fCupduA7tmx227j+JhDv1UfbKTtuOvBj8/JB90oN5N
         Y1MBklc60qwxAaJ1Pu61a4fZX+x0hIuKwjH6dlZ+zRrCffMIUfl5FIeYpOAb6ScXN+xa
         mo6+WYiYVn0YAHlYhBAQwTnIh8lmAdJSUIo7DfunoD7NY14RotT/lI8WESpTgONBNF0d
         PA3spoITe3q0t5WNhYcoBhXwlfNRnRfWHhFNUSZm9BlePQe2k+BPtlCY8n5Ds+r4Edv2
         8E1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711444582; x=1712049382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ncvV5tywoT0mg3neUWKgBj7OJB0wlJy/Q6vGL+2Nulc=;
        b=Fq6He2piBp2T0E2uh4lJsFSq7EI0yU1cBWZPs6x5K0YSiQBYXOroVo9efzuXJzCzru
         uhG8jrdJnMnzkaoC6+Z+tyZERS9+YMZceilBDaxYn/caFVfzCT+PMbWqtEmpVi2wh+ui
         L9iZyYHNkKFpCOU49GuHfGAhjbipTgjgkIUiIzCTaPYOhS5O1fCdjWTGoeHXM6EapwiP
         vGCeJSh7J/J9IsCQVa4KVm33/7IWXN8jBRTa1RkCycyy8EenjOjx3EcAVOQeFrnsU+cm
         DhMWZpmHtwr3zkqFD6wZWe4PIMrK1sBBZfOiR2X34UmTdCxAbL9J2EFLtODp3Evk/zM/
         3laA==
X-Forwarded-Encrypted: i=1; AJvYcCWVtrfwsHNvpuUCGApN+60+23eHnknkvvSG2RlmrisakeNSSd6zI9NncYAe1wn9IHULY3BP6EPUcm20jVP59RRUg2iJmRqXdOEa
X-Gm-Message-State: AOJu0YxrFWTNVjEc37Yx0L7u6EREgH3UA9GxgYbeuB2mH/Dje4qFIaP0
	hZxYgYP8a2YaplsfHC9cetjKkMWtxuEjFcGK68SuH0g9Vx+nq6bPqwTPxtigAsQ=
X-Google-Smtp-Source: AGHT+IHKsTV0/LeDcmgiX3ak5nNVWUf2SsQEWgiXqkLcxsRGl+qMU2ykVdAX8JRk7vEVobwjN1tF0g==
X-Received: by 2002:a05:600c:4f04:b0:414:887e:6806 with SMTP id l4-20020a05600c4f0400b00414887e6806mr4263661wmq.10.1711444582050;
        Tue, 26 Mar 2024 02:16:22 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:f:6020:e6b6:c92e:43ff:71d7])
        by smtp.gmail.com with ESMTPSA id m15-20020adffe4f000000b0033e5c54d0d9sm11647606wrs.38.2024.03.26.02.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 02:16:21 -0700 (PDT)
From: Vincent Guittot <vincent.guittot@linaro.org>
To: linux@armlinux.org.uk,
	catalin.marinas@arm.com,
	will@kernel.org,
	sudeep.holla@arm.com,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	agross@kernel.org,
	andersson@kernel.org,
	konrad.dybcio@linaro.org,
	mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	bristot@redhat.com,
	vschneid@redhat.com,
	lukasz.luba@arm.com,
	rui.zhang@intel.com,
	mhiramat@kernel.org,
	daniel.lezcano@linaro.org,
	amit.kachhap@gmail.com,
	corbet@lwn.net,
	gregkh@linuxfoundation.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
	Qais Yousef <qyousef@layalina.io>
Subject: [PATCH v6 1/5] cpufreq: Add a cpufreq pressure feedback for the scheduler
Date: Tue, 26 Mar 2024 10:16:12 +0100
Message-Id: <20240326091616.3696851-2-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240326091616.3696851-1-vincent.guittot@linaro.org>
References: <20240326091616.3696851-1-vincent.guittot@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Provide to the scheduler a feedback about the temporary max available
capacity. Unlike arch_update_thermal_pressure, this doesn't need to be
filtered as the pressure will happen for dozens ms or more.

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
Acked-by: Rafael J. Wysocki <rafael@kernel.org>
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Reviewed-by: Qais Yousef <qyousef@layalina.io>
Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>
Tested-by: Lukasz Luba <lukasz.luba@arm.com>
---
 drivers/cpufreq/cpufreq.c | 36 ++++++++++++++++++++++++++++++++++++
 include/linux/cpufreq.h   | 10 ++++++++++
 2 files changed, 46 insertions(+)

diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index 66e10a19d76a..1de8bd105934 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -2582,6 +2582,40 @@ int cpufreq_get_policy(struct cpufreq_policy *policy, unsigned int cpu)
 }
 EXPORT_SYMBOL(cpufreq_get_policy);
 
+DEFINE_PER_CPU(unsigned long, cpufreq_pressure);
+
+/**
+ * cpufreq_update_pressure() - Update cpufreq pressure for CPUs
+ * @policy: cpufreq policy of the CPUs.
+ *
+ * Update the value of cpufreq pressure for all @cpus in the policy.
+ */
+static void cpufreq_update_pressure(struct cpufreq_policy *policy)
+{
+	unsigned long max_capacity, capped_freq, pressure;
+	u32 max_freq;
+	int cpu;
+
+	cpu = cpumask_first(policy->related_cpus);
+	max_freq = arch_scale_freq_ref(cpu);
+	capped_freq = policy->max;
+
+	/*
+	 * Handle properly the boost frequencies, which should simply clean
+	 * the cpufreq pressure value.
+	 */
+	if (max_freq <= capped_freq) {
+		pressure = 0;
+	} else {
+		max_capacity = arch_scale_cpu_capacity(cpu);
+		pressure = max_capacity -
+			   mult_frac(max_capacity, capped_freq, max_freq);
+	}
+
+	for_each_cpu(cpu, policy->related_cpus)
+		WRITE_ONCE(per_cpu(cpufreq_pressure, cpu), pressure);
+}
+
 /**
  * cpufreq_set_policy - Modify cpufreq policy parameters.
  * @policy: Policy object to modify.
@@ -2637,6 +2671,8 @@ static int cpufreq_set_policy(struct cpufreq_policy *policy,
 	policy->max = __resolve_freq(policy, policy->max, CPUFREQ_RELATION_H);
 	trace_cpu_frequency_limits(policy);
 
+	cpufreq_update_pressure(policy);
+
 	policy->cached_target_freq = UINT_MAX;
 
 	pr_debug("new min and max freqs are %u - %u kHz\n",
diff --git a/include/linux/cpufreq.h b/include/linux/cpufreq.h
index 9956afb9acc2..20f7e98ee8af 100644
--- a/include/linux/cpufreq.h
+++ b/include/linux/cpufreq.h
@@ -241,6 +241,12 @@ struct kobject *get_governor_parent_kobj(struct cpufreq_policy *policy);
 void cpufreq_enable_fast_switch(struct cpufreq_policy *policy);
 void cpufreq_disable_fast_switch(struct cpufreq_policy *policy);
 bool has_target_index(void);
+
+DECLARE_PER_CPU(unsigned long, cpufreq_pressure);
+static inline unsigned long cpufreq_get_pressure(int cpu)
+{
+	return READ_ONCE(per_cpu(cpufreq_pressure, cpu));
+}
 #else
 static inline unsigned int cpufreq_get(unsigned int cpu)
 {
@@ -264,6 +270,10 @@ static inline bool cpufreq_supports_freq_invariance(void)
 }
 static inline void disable_cpufreq(void) { }
 static inline void cpufreq_update_limits(unsigned int cpu) { }
+static inline unsigned long cpufreq_get_pressure(int cpu)
+{
+	return 0;
+}
 #endif
 
 #ifdef CONFIG_CPU_FREQ_STAT
-- 
2.34.1


