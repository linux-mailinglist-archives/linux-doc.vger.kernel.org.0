Return-Path: <linux-doc+bounces-3783-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD9D800FDF
	for <lists+linux-doc@lfdr.de>; Fri,  1 Dec 2023 17:17:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0EC76B20F50
	for <lists+linux-doc@lfdr.de>; Fri,  1 Dec 2023 16:17:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9714A4C3D6;
	Fri,  1 Dec 2023 16:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DQ3YFnHo"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4976A1712
	for <linux-doc@vger.kernel.org>; Fri,  1 Dec 2023 08:17:02 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-332ddd8e0bdso2238412f8f.0
        for <linux-doc@vger.kernel.org>; Fri, 01 Dec 2023 08:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701447421; x=1702052221; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XSKzabyf617fM1KjEqCfZfHlIw32BDDg2adJnGl6QJ8=;
        b=DQ3YFnHounWAqRoT31a5f8sVryNO0uLYEC2wE8ZUzQOYOPszbJfX/sqHsyoEhw4tOp
         pl/JcCzJZfhLx8yy0SQKRx3bKjmPYFW7gUr9skm+xEMYbAeUTp9fQo5ViDq64Ga1kVaT
         mLx9kY/PWRB/IoPUQZV16xa9OYNbsT9XGakS2jxDpNJ7991GKHlcRfjLG00N7inK3O6k
         RL8Z4zxOMljn++e1LEnOPkbCTOQRK1PrD/xtWIeKb+L6irEEDz/6B+Ya9MiQ800fRQSQ
         LqlTDpFk8n+bUCj6djNyiUzE+Na5dHYVIuO6I5lk7d0RNPso5C9QODkdIcCSmS5TLPMk
         Mb5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701447421; x=1702052221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XSKzabyf617fM1KjEqCfZfHlIw32BDDg2adJnGl6QJ8=;
        b=DS2mHZlWEBnGjFafW5vCuT/VZrGFCwLc8O5EoY8uPd1WlDeo4Zb+Ybpqb157dybgWr
         PaXho53LuMo8Q2tfiMuMHddLtfYao9Ayl3u56AgQag5bOD+vIRre1d/A/ttpVcE4kwMx
         30UNfUBK5Xrapduy6+rQEZyh3jxNNxt9MVBF3kxJpwytqRMFilK9QiuMQyZp4hjlJMMZ
         awtNgW3kXrYOoZuuJxuFIH5tTBBE8op2DlAiihg3UGzS6JSpuObMaJXa9okvbLwsKGvh
         pvx7lX4Gt4z0YVkCcpb3BQZ4STQTIhwOxISBTWX965ItMdhkMuWuVGYT61GfzS7zZGB7
         BNNA==
X-Gm-Message-State: AOJu0YzE4xda+LOJiDNrEbwNWrwFj7KoTbM9jFXH17/lgDGpq0+Cssel
	ASOqEbHCGMDLfuHGyHxmZ4ydTg==
X-Google-Smtp-Source: AGHT+IHjqFYkByXc9Gb3pcb1OogPS3f1+e4xDX/ps+5Ye1VAGcstpN9qt433fzLCKLTPnd9WoPHO1g==
X-Received: by 2002:a05:600c:1615:b0:40b:5e56:7b5c with SMTP id m21-20020a05600c161500b0040b5e567b5cmr764423wmn.165.1701447420729;
        Fri, 01 Dec 2023 08:17:00 -0800 (PST)
Received: from vingu-book.. ([2a01:e0a:f:6020:6db5:f04:fbd5:88e1])
        by smtp.gmail.com with ESMTPSA id l27-20020a05600c1d1b00b003feae747ff2sm9591398wms.35.2023.12.01.08.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 08:16:58 -0800 (PST)
From: Vincent Guittot <vincent.guittot@linaro.org>
To: mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	bristot@redhat.com,
	vschneid@redhat.com,
	corbet@lwn.net,
	alexs@kernel.org,
	siyanteng@loongson.cn,
	qyousef@layalina.io,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: lukasz.luba@arm.com,
	hongyan.xia2@arm.com,
	yizhou.tang@shopee.com,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH v2 1/2] sched/fair: Remove SCHED_FEAT(UTIL_EST_FASTUP, true)
Date: Fri,  1 Dec 2023 17:16:51 +0100
Message-Id: <20231201161652.1241695-2-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231201161652.1241695-1-vincent.guittot@linaro.org>
References: <20231201161652.1241695-1-vincent.guittot@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

sched_feat(UTIL_EST_FASTUP) has been added to easily disable the feature
in order to check for possibly related regressions. After 3 years, it has
never been used and no regression has been reported. Let remove it
and make fast increase a permanent behavior.

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
Reviewed-and-tested-by: Lukasz Luba <lukasz.luba@arm.com>
Reviewed-by: Dietmar Eggemann <dietmar.eggemann@arm.com>
Reviewed-by: Hongyan Xia <hongyan.xia2@arm.com>
Reviewed-by: Tang Yizhou <yizhou.tang@shopee.com>
---
 Documentation/scheduler/schedutil.rst                    | 7 +++----
 Documentation/translations/zh_CN/scheduler/schedutil.rst | 7 +++----
 kernel/sched/fair.c                                      | 8 +++-----
 kernel/sched/features.h                                  | 1 -
 4 files changed, 9 insertions(+), 14 deletions(-)

diff --git a/Documentation/scheduler/schedutil.rst b/Documentation/scheduler/schedutil.rst
index 32c7d69fc86c..803fba8fc714 100644
--- a/Documentation/scheduler/schedutil.rst
+++ b/Documentation/scheduler/schedutil.rst
@@ -90,8 +90,8 @@ For more detail see:
  - Documentation/scheduler/sched-capacity.rst:"1. CPU Capacity + 2. Task utilization"
 
 
-UTIL_EST / UTIL_EST_FASTUP
-==========================
+UTIL_EST
+========
 
 Because periodic tasks have their averages decayed while they sleep, even
 though when running their expected utilization will be the same, they suffer a
@@ -99,8 +99,7 @@ though when running their expected utilization will be the same, they suffer a
 
 To alleviate this (a default enabled option) UTIL_EST drives an Infinite
 Impulse Response (IIR) EWMA with the 'running' value on dequeue -- when it is
-highest. A further default enabled option UTIL_EST_FASTUP modifies the IIR
-filter to instantly increase and only decay on decrease.
+highest. UTIL_EST filters to instantly increase and only decay on decrease.
 
 A further runqueue wide sum (of runnable tasks) is maintained of:
 
diff --git a/Documentation/translations/zh_CN/scheduler/schedutil.rst b/Documentation/translations/zh_CN/scheduler/schedutil.rst
index d1ea68007520..7c8d87f21c42 100644
--- a/Documentation/translations/zh_CN/scheduler/schedutil.rst
+++ b/Documentation/translations/zh_CN/scheduler/schedutil.rst
@@ -89,16 +89,15 @@ r_cpu被定义为当前CPU的最高性能水平与系统中任何其它CPU的最
  - Documentation/translations/zh_CN/scheduler/sched-capacity.rst:"1. CPU Capacity + 2. Task utilization"
 
 
-UTIL_EST / UTIL_EST_FASTUP
-==========================
+UTIL_EST
+========
 
 由于周期性任务的平均数在睡眠时会衰减，而在运行时其预期利用率会和睡眠前相同，
 因此它们在再次运行后会面临（DVFS）的上涨。
 
 为了缓解这个问题，（一个默认使能的编译选项）UTIL_EST驱动一个无限脉冲响应
 （Infinite Impulse Response，IIR）的EWMA，“运行”值在出队时是最高的。
-另一个默认使能的编译选项UTIL_EST_FASTUP修改了IIR滤波器，使其允许立即增加，
-仅在利用率下降时衰减。
+UTIL_EST滤波使其在遇到更高值时立刻增加，而遇到低值时会缓慢衰减。
 
 进一步，运行队列的（可运行任务的）利用率之和由下式计算：
 
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index bcea3d55d95d..e94d65da8d66 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -4870,11 +4870,9 @@ static inline void util_est_update(struct cfs_rq *cfs_rq,
 	 * to smooth utilization decreases.
 	 */
 	ue.enqueued = task_util(p);
-	if (sched_feat(UTIL_EST_FASTUP)) {
-		if (ue.ewma < ue.enqueued) {
-			ue.ewma = ue.enqueued;
-			goto done;
-		}
+	if (ue.ewma < ue.enqueued) {
+		ue.ewma = ue.enqueued;
+		goto done;
 	}
 
 	/*
diff --git a/kernel/sched/features.h b/kernel/sched/features.h
index a3ddf84de430..143f55df890b 100644
--- a/kernel/sched/features.h
+++ b/kernel/sched/features.h
@@ -83,7 +83,6 @@ SCHED_FEAT(WA_BIAS, true)
  * UtilEstimation. Use estimated CPU utilization.
  */
 SCHED_FEAT(UTIL_EST, true)
-SCHED_FEAT(UTIL_EST_FASTUP, true)
 
 SCHED_FEAT(LATENCY_WARN, false)
 
-- 
2.34.1


