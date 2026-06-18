Return-Path: <linux-doc+bounces-92716-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iBdoLO1iM2oqAAYAu9opvQ
	(envelope-from <linux-doc+bounces-92716-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 18 Jun 2026 05:15:57 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3026869D474
	for <lists+linux-doc@lfdr.de>; Thu, 18 Jun 2026 05:15:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=PHAmH5IP;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92716-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-92716-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 270AA30BDF3A
	for <lists+linux-doc@lfdr.de>; Thu, 18 Jun 2026 03:12:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 429E833CEB0;
	Thu, 18 Jun 2026 03:12:25 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B1533B6D9
	for <linux-doc@vger.kernel.org>; Thu, 18 Jun 2026 03:12:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781752345; cv=none; b=eQIacNXU1WReBHmq5EzSc8kl+2SqvaH17Xplh1mcD6DGEBxeXovwiFPej4SUnOo+zySLIoJiv3ttQe9Ue50YtJ/+zm9GBufC4E015Wn2bIn2mSMiey3lemkbiqh+QCnS4vN8hQfBWmLCNGMt2EIrStIhuBZtyp1ND1EUXfg/hxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781752345; c=relaxed/simple;
	bh=SZOR3Po26I5px5IWl3qao5Q198zBGy4no+Y9jQCKPSI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YsQtCnefML9A/pg4n8mXY4xgKIcuPd3ij5R2JJG4K1oJN+MlarBkT1lsVqJb7W5esJGEPukXVwQH+B1xpDT5+EVJTYcghd55oh/cLBps8A7J7yWxWwXUUDBWZMl2E6EatIR4KrBPf4o4ASeQFAwkpVclZDxG0PqCIuhclTBWRd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PHAmH5IP; arc=none smtp.client-ip=209.85.214.173
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2c0c3546924so4129205ad.3
        for <linux-doc@vger.kernel.org>; Wed, 17 Jun 2026 20:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781752342; x=1782357142; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GTFQPj89QbzgFs0dMZHtOVwajXrW91e6WK1jm8uL+Eg=;
        b=PHAmH5IPLrZV/EG6wS1qTEkI8DsVC2qRHijBIoPG3bGf1q3aI6OaG8IstQ5gFY71XG
         12fAD4RRLw00mD/USJ0d/0FKlgopsQ1jjimgtHGVHW9GugaUGexPgRn0+OnXlEgCQpjM
         Mc4K8w9N79gZTqi0th0g4YJ9lLFmWuSv03IeKxSmZHHmeIfKJNcoH7kfsDp8jdureFKM
         pQT0KP1oL17uD3r0omav7WTSTnxzVfC3w3LsYpY3uvEmuFbcNnj+Co9FEPlEpNhzLtJA
         C/W0QhGHNrDB67BAbRYD4wXkhS5aovYwUpBeAadRGLCO6nEdUFmZNtJjnjj+c6kXiDg3
         YVtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781752342; x=1782357142;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GTFQPj89QbzgFs0dMZHtOVwajXrW91e6WK1jm8uL+Eg=;
        b=OHVQn+HBYa/P72sgrNVZViKELB3FJSYOb/oZLPJTT6W3/2pEoknBmzFUNVY85fqlM2
         YPuyc95QgvSfIR3UMLMUzqQ+2Ji+g1ImbCAa1mMGXwEhVg0Zxs/ub+tqqv/8Lb4kDj4P
         Ki83wzut6ybMs+ZLTGpFPdqpXz02Javq6UR4eUnlIcgGgjdCTG9JIdJCw/n4URL9SVqu
         gCNj4rmtweJ27yZ6hcR2XwHtwvESL/0cOfy4vQwvPn6ZY77faZbsUmtt4+F1tHdAVrGd
         xOF047u8/XmItCeRh/Fn+8oPMX0cjFFRokgoVjYPlT+bKwpky+Pm02QuyYABUA3PY1oF
         1GQg==
X-Forwarded-Encrypted: i=1; AFNElJ+Mcb5g9afzM0Kd074ut8ESsDHHaE3IDgke77jKEEjIfNLGyJVXyB/QOdvTc2ogRV8GwxXhkzftqh4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfqTny6bzii7+HnV4rn/SkPbMKIvPwQmENwmih22mT2tQnq6nC
	vGjEy1JnH0Tl+jdlnbIs+Zmm2Py922erzL91mO/mMLP98OOvvytZMIzr
X-Gm-Gg: AfdE7ck2UaApMhu3Kwr/X3blCQvyl9CDlEMn2ptd0O9Q3SGpHcOxmGg0qtZM6qdjJHX
	zq44RBSUJdiTYhSV2ogsv1GRAfzyK+SQ1hG4n2mgKKuvGqPwm0svuBzmnwwCXxVk307BYoRWnna
	wspy/IX6ZdyyKZiKOM460aHaNs4LLfAe+M7BsQgNx1+s/kk9RddO4xsXX9T5NwtTrWqOu6tkRVY
	gh1xnTTl9RZtjyD+neKcJ/7JYU1yj22K9j86+iSZ8VVKUHR1u5WWSry9Jn7NMd8Jw1CY6eEdOPJ
	rRrLEIICyNqwheXxw0B2Pfi7Ixz+TdAvEi9xG+Wq4oKV/Lb1oWUcA7AqWGiNh7b/ZWd0VGNrCvx
	4lFIOLV43Rwho0B2/4csn0wiLvCjodBvqcO22yZXAMKEXsaHZnWc2bgd83tloRo7UE/k+wn+Ceu
	tKTJlco0lDiP8=
X-Received: by 2002:a17:902:e54b:b0:2bc:b80f:6782 with SMTP id d9443c01a7336-2c6e484a87fmr17591495ad.11.1781752342087;
        Wed, 17 Jun 2026 20:12:22 -0700 (PDT)
Received: from [127.0.1.1] ([138.199.21.246])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c6a403b242sm60152975ad.31.2026.06.17.20.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 20:12:21 -0700 (PDT)
From: Jing Wu <realwujing@gmail.com>
Date: Thu, 18 Jun 2026 11:11:20 +0800
Subject: [PATCH v3 09/13] watchdog/lockup_detector: Register housekeeping
 callback for kernel-noise
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-wujing-dhm-v3-9-28f1a4d83b68@gmail.com>
References: <20260618-wujing-dhm-v3-0-28f1a4d83b68@gmail.com>
In-Reply-To: <20260618-wujing-dhm-v3-0-28f1a4d83b68@gmail.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
 Juri Lelli <juri.lelli@redhat.com>, 
 Vincent Guittot <vincent.guittot@linaro.org>, 
 Dietmar Eggemann <dietmar.eggemann@arm.com>, 
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, 
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, 
 "Paul E. McKenney" <paulmck@kernel.org>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
 Joel Fernandes <joelagnelf@nvidia.com>, 
 Josh Triplett <josh@joshtriplett.org>, Boqun Feng <boqun@kernel.org>, 
 Uladzislau Rezki <urezki@gmail.com>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang@linux.dev>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, Tejun Heo <tj@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Shuah Khan <shuah@kernel.org>, Thomas Gleixner <tglx@kernel.org>
Cc: linux-kernel@vger.kernel.org, rcu@vger.kernel.org, 
 cgroups@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Jing Wu <realwujing@gmail.com>, 
 Qiliang Yuan <yuanql9@chinatelecom.cn>
X-Mailer: b4 0.13.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mingo@redhat.com,m:peterz@infradead.org,m:juri.lelli@redhat.com,m:vincent.guittot@linaro.org,m:dietmar.eggemann@arm.com,m:rostedt@goodmis.org,m:bsegall@google.com,m:mgorman@suse.de,m:vschneid@redhat.com,m:paulmck@kernel.org,m:frederic@kernel.org,m:neeraj.upadhyay@kernel.org,m:joelagnelf@nvidia.com,m:josh@joshtriplett.org,m:boqun@kernel.org,m:urezki@gmail.com,m:mathieu.desnoyers@efficios.com,m:jiangshanlai@gmail.com,m:qiang.zhang@linux.dev,m:anna-maria@linutronix.de,m:tj@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:shuah@kernel.org,m:tglx@kernel.org,m:linux-kernel@vger.kernel.org,m:rcu@vger.kernel.org,m:cgroups@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:realwujing@gmail.com,m:yuanql9@chinatelecom.cn,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-92716-lists,linux-doc=lfdr.de];
	FREEMAIL_TO(0.00)[redhat.com,infradead.org,linaro.org,arm.com,goodmis.org,google.com,suse.de,kernel.org,nvidia.com,joshtriplett.org,gmail.com,efficios.com,linux.dev,linutronix.de,lwn.net,linuxfoundation.org];
	FORGED_SENDER(0.00)[realwujing@gmail.com,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,chinatelecom.cn];
	RCPT_COUNT_TWELVE(0.00)[32];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[realwujing@gmail.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,chinatelecom.cn:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3026869D474

Initialize watchdog_cpumask from HK_TYPE_KERNEL_NOISE rather than
HK_TYPE_TIMER at boot, so the initial mask already reflects any CPUs
excluded by nohz_full= on the kernel command line.

Register a housekeeping_cbs so watchdog_cpumask stays in sync with
HK_TYPE_KERNEL_NOISE when isolation boundaries change at runtime via
cpuset isolated partitions.  The apply() callback copies the new
housekeeping mask into watchdog_cpumask and triggers
__lockup_detector_reconfigure() to restart watchdog threads on the
updated CPU set.

When nohz_full= is absent at boot, tick_nohz_full_running remains
false and DHM isolated partitions do not activate tick suppression.
In that case watchdog_hk_apply() is a no-op: there is no need to
reconfigure the watchdog CPU set because the full nohz_full
infrastructure was never initialized.

Signed-off-by: Jing Wu <realwujing@gmail.com>
Signed-off-by: Qiliang Yuan <yuanql9@chinatelecom.cn>
---
 kernel/watchdog.c | 56 ++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 55 insertions(+), 1 deletion(-)

diff --git a/kernel/watchdog.c b/kernel/watchdog.c
index 87dd5e0f6968d..998ad94da4cb9 100644
--- a/kernel/watchdog.c
+++ b/kernel/watchdog.c
@@ -1389,7 +1389,7 @@ void __init lockup_detector_init(void)
 		pr_info("Disabling watchdog on nohz_full cores by default\n");
 
 	cpumask_copy(&watchdog_cpumask,
-		     housekeeping_cpumask(HK_TYPE_TIMER));
+		     housekeeping_cpumask(HK_TYPE_KERNEL_NOISE));
 
 	if (!watchdog_hardlockup_probe())
 		watchdog_hardlockup_available = true;
@@ -1398,3 +1398,57 @@ void __init lockup_detector_init(void)
 
 	lockup_detector_setup();
 }
+
+/*
+ * Watchdog housekeeping callback: resync watchdog_cpumask with
+ * HK_TYPE_KERNEL_NOISE when isolation boundaries change at runtime.
+ */
+#ifdef CONFIG_CPU_ISOLATION
+static void watchdog_hk_apply(enum hk_type type)
+{
+	const struct cpumask *hk;
+
+	/*
+	 * When nohz_full= was not given at boot, tick_nohz_full_running
+	 * remains false and the full nohz_full infrastructure was never
+	 * initialised.  DHM isolated partitions do not activate tick
+	 * suppression in that case, so there is no need to reconfigure the
+	 * watchdog CPU set.
+	 */
+#ifdef CONFIG_NO_HZ_FULL
+	if (!READ_ONCE(tick_nohz_full_running))
+		return;
+#endif
+
+	hk = housekeeping_cpumask(HK_TYPE_KERNEL_NOISE);
+	if (mutex_trylock(&watchdog_mutex)) {
+		cpumask_copy(&watchdog_cpumask, hk);
+		__lockup_detector_reconfigure(false);
+		mutex_unlock(&watchdog_mutex);
+	}
+}
+
+static int watchdog_hk_validate(enum hk_type type,
+				const struct cpumask *cur_mask,
+				const struct cpumask *new_mask)
+{
+	return 0;
+}
+
+static struct housekeeping_cbs watchdog_hk_cbs = {
+	.name		= "watchdog",
+	.pre_validate	= watchdog_hk_validate,
+	.apply		= watchdog_hk_apply,
+};
+
+static int __init watchdog_hk_init(void)
+{
+	int ret;
+
+	ret = housekeeping_register_cbs(HK_TYPE_KERNEL_NOISE, &watchdog_hk_cbs);
+	if (ret)
+		pr_debug("watchdog: hk callback registration skipped (%d)\n", ret);
+	return 0;
+}
+late_initcall(watchdog_hk_init);
+#endif

-- 
2.43.0


