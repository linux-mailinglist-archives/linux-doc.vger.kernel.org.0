Return-Path: <linux-doc+bounces-12704-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F148888BD81
	for <lists+linux-doc@lfdr.de>; Tue, 26 Mar 2024 10:18:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0FB529E1DC
	for <lists+linux-doc@lfdr.de>; Tue, 26 Mar 2024 09:18:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B42D6CDC4;
	Tue, 26 Mar 2024 09:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bTTWmi/x"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B7B6BB4C
	for <linux-doc@vger.kernel.org>; Tue, 26 Mar 2024 09:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711444592; cv=none; b=QvPf8b2oxeTNGGTp3JbG4cUSf7745GKu14iPZbsRkwKyvY2sP6XiQBjZfhnOtdT6CGV7KIrlKfcSQ8jHzmJjuHfPbbuIry5Oo8HQoS8uQAsLbk1xAI7MUDcV7F9mQTS5ZOhfUrEqgh5MkSs1EbSrc96dm4RdsihaknJJMHiBEi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711444592; c=relaxed/simple;
	bh=+A3pGDGHlCvfB06rHbYDp02nhAm4PpLDNZT/uPMVXIU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kONPGBXagFTAToLtkeiWHgAjs1kBpVWgAMebsb7g5EdNNlWPOtxdC3Ro7qeR1Dpazhqbxy1PebvRwKO8yjksWCCpva9XlPk1tviB72cBuimU+fXmDpW+P398STf+s2GYjIAxwMySA4oKBeS1iYMCjzN9D4V/kZ/8osmBf3tBofE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bTTWmi/x; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2d476d7972aso84505631fa.1
        for <linux-doc@vger.kernel.org>; Tue, 26 Mar 2024 02:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711444588; x=1712049388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tEa7sTPJSW6I5rKhiraqApmqO1PEw1EfsKWWuLtpUqA=;
        b=bTTWmi/xLUQ4ndFAtr6g1N2PagOQT7+4+FkdOJjBPR5XjAV4OPtuTcQ56z0gcXRGBX
         YhpvsMupuiTPF08VAsgjzFVc787wZVo0MktpZBM5w4S+lyeiSNgBYC8fojJncFyx6LUe
         cBRidTkcWmXYk6hhgAlhT8doYgC4eWf74Zm6yptko9fxXRBSoCwcfKcuIQS3z6GtI9+1
         Kr1iycsH/uKNxa8eQHYWuS2SGpUAjxuGH2t99hMS3h1MH4ZNlOklR2PFCT4PHYF9IxbQ
         8QzXeH3h8V1dqBIS+CGvfNHi2obgzUhcneMGZv5zXz9lwGl1c3uGw/JuJMRyxNRLxzBc
         5bWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711444588; x=1712049388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tEa7sTPJSW6I5rKhiraqApmqO1PEw1EfsKWWuLtpUqA=;
        b=Js58VBbA84UDIxg3oKmDKopXNwUqSrYOF68qk6Y4A6k8X2I7CnqcNnPs9XioNBF+9e
         ec5AJzVRi/AHwuKsOr6X2cjN0gzTFyKy3mX5s7U290WWqb1PB3CSb1NEzdt9QGpW/1WE
         cZ7pTQrZPXZBahsvurUb5Bf4nQjp4s216uNqZf4OZkVnKUCDglc9zBvkZ8krHEZKePYG
         oUOaW0udb9M/i7TKNW+t7Iny2m4JZicAnBVzga539UneqpdxfFxybk0TgzjgIsKnKeRG
         pXxiQ3GCKdYG+zRKmZgMEqPjF3+C3mWkajMlmdb6HCqjXW5qh0E0PZKisP336YvF/4S1
         l/Kg==
X-Forwarded-Encrypted: i=1; AJvYcCU8a2NiG2dDlJh84m73HOCsrT1lMp9ArLw7tOVErpZF0roEezL+msBGa4oGtkJtWvFuuBdv5+/t2+NHV/G5Bu4oupChShbExa2R
X-Gm-Message-State: AOJu0YzQZD1T4ZWtlU6JhklC8f1FetWzMq6TkBh20ARzwxJ9OPG+ojYQ
	bRID4utM9NS1X67h3acUbokTO3Ctmepg0z6oOoVTnRi82HxkQCFG0ff1qG44JQg=
X-Google-Smtp-Source: AGHT+IGGf2jXiDAnhlOkuMEI4imxOyrO3PVUvWqnMnUfZ8UI9s9IA++rAw1HPl8cghXzf2aqmiMA6w==
X-Received: by 2002:a2e:88d0:0:b0:2d2:206a:2f2a with SMTP id a16-20020a2e88d0000000b002d2206a2f2amr6919353ljk.17.1711444588320;
        Tue, 26 Mar 2024 02:16:28 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:f:6020:e6b6:c92e:43ff:71d7])
        by smtp.gmail.com with ESMTPSA id m15-20020adffe4f000000b0033e5c54d0d9sm11647606wrs.38.2024.03.26.02.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 02:16:27 -0700 (PDT)
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
Subject: [PATCH v6 5/5] sched/pelt: Remove shift of thermal clock
Date: Tue, 26 Mar 2024 10:16:16 +0100
Message-Id: <20240326091616.3696851-6-vincent.guittot@linaro.org>
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

The optional shift of the clock used by thermal/hw load avg has been
introduced to handle case where the signal was not always a high frequency
hw signal. Now that cpufreq provides a signal for firmware and
SW pressure, we can remove this exception and always keep this PELT signal
aligned with other signals.
Mark sysctl_sched_migration_cost boot parameter as deprecated

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
Reviewed-by: Qais Yousef <qyousef@layalina.io>
Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>
Tested-by: Lukasz Luba <lukasz.luba@arm.com>
---
 .../admin-guide/kernel-parameters.txt          |  1 +
 kernel/sched/core.c                            |  2 +-
 kernel/sched/fair.c                            | 10 ++--------
 kernel/sched/sched.h                           | 18 ------------------
 4 files changed, 4 insertions(+), 27 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index bb884c14b2f6..3f390cc5f77e 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -5807,6 +5807,7 @@
 			but is useful for debugging and performance tuning.
 
 	sched_thermal_decay_shift=
+			[Deprecated]
 			[KNL, SMP] Set a decay shift for scheduler thermal
 			pressure signal. Thermal pressure signal follows the
 			default decay period of other scheduler pelt
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 67a8302c3131..1a914388144a 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -5680,7 +5680,7 @@ void sched_tick(void)
 
 	update_rq_clock(rq);
 	hw_pressure = arch_scale_hw_pressure(cpu_of(rq));
-	update_hw_load_avg(rq_clock_hw(rq), rq, hw_pressure);
+	update_hw_load_avg(rq_clock_task(rq), rq, hw_pressure);
 	curr->sched_class->task_tick(rq, curr, 0);
 	if (sched_feat(LATENCY_WARN))
 		resched_latency = cpu_resched_latency(rq);
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 2cdc4c242afe..3ac17b20350a 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -78,15 +78,9 @@ static unsigned int normalized_sysctl_sched_base_slice	= 750000ULL;
 
 const_debug unsigned int sysctl_sched_migration_cost	= 500000UL;
 
-int sched_hw_decay_shift;
 static int __init setup_sched_thermal_decay_shift(char *str)
 {
-	int _shift = 0;
-
-	if (kstrtoint(str, 0, &_shift))
-		pr_warn("Unable to set scheduler thermal pressure decay shift parameter\n");
-
-	sched_hw_decay_shift = clamp(_shift, 0, 10);
+	pr_warn("Ignoring the deprecated sched_thermal_decay_shift= option\n");
 	return 1;
 }
 __setup("sched_thermal_decay_shift=", setup_sched_thermal_decay_shift);
@@ -9371,7 +9365,7 @@ static bool __update_blocked_others(struct rq *rq, bool *done)
 
 	decayed = update_rt_rq_load_avg(now, rq, curr_class == &rt_sched_class) |
 		  update_dl_rq_load_avg(now, rq, curr_class == &dl_sched_class) |
-		  update_hw_load_avg(rq_clock_hw(rq), rq, hw_pressure) |
+		  update_hw_load_avg(now, rq, hw_pressure) |
 		  update_irq_load_avg(rq, 0);
 
 	if (others_have_blocked(rq))
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 5d73d4612e58..35a05f95af3a 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -1543,24 +1543,6 @@ static inline u64 rq_clock_task(struct rq *rq)
 	return rq->clock_task;
 }
 
-/**
- * By default the decay is the default pelt decay period.
- * The decay shift can change the decay period in
- * multiples of 32.
- *  Decay shift		Decay period(ms)
- *	0			32
- *	1			64
- *	2			128
- *	3			256
- *	4			512
- */
-extern int sched_hw_decay_shift;
-
-static inline u64 rq_clock_hw(struct rq *rq)
-{
-	return rq_clock_task(rq) >> sched_hw_decay_shift;
-}
-
 static inline void rq_clock_skip_update(struct rq *rq)
 {
 	lockdep_assert_rq_held(rq);
-- 
2.34.1


