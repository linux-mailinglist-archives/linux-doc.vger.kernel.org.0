Return-Path: <linux-doc+bounces-92710-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dUr0MghiM2rq/wUAu9opvQ
	(envelope-from <linux-doc+bounces-92710-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 18 Jun 2026 05:12:08 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DFF69D3AD
	for <lists+linux-doc@lfdr.de>; Thu, 18 Jun 2026 05:12:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=snYOpuep;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92710-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-92710-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8DCE930D32E1
	for <lists+linux-doc@lfdr.de>; Thu, 18 Jun 2026 03:11:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 292693321DE;
	Thu, 18 Jun 2026 03:11:46 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC29331EAC
	for <linux-doc@vger.kernel.org>; Thu, 18 Jun 2026 03:11:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781752306; cv=none; b=GFJXNjuRi5VaigR2/8+kL/jSxXpHW7UNIGpKcqqZBVwVE1nnaGJZwzU8embDH8JarJ/7zv60XX+XFlXErGLiaBPdCA71PKGDcH3bIK0PdKTyMFJsNDPxAc/2nkE+pIfQ6t+ukC/ecyMzIOOxgnpc8PVExavayFSXM/oSton+vJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781752306; c=relaxed/simple;
	bh=YCJVKs6GRsboN/yU+D9T5MpjnesbxxZmC8h0qZxZbQI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hWA2XiSwUrIsY9WOsG4P8LruQ1rFGNzPuGWDyPJSzX6tpcVejuupH+fa9aMe4CdcxtsJB4Cp1AQanYkA+Ye0D0/2TVDUpDv5rirOAlIJRTSd/sF8War+/a5UzpEV4z+yEGKZcKCa412jxg+z2QR2Aq99/ZMYee378f3xe9oDoww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=snYOpuep; arc=none smtp.client-ip=209.85.214.179
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2c0c3546924so4126465ad.3
        for <linux-doc@vger.kernel.org>; Wed, 17 Jun 2026 20:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781752304; x=1782357104; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8004pEbSIDGa1Ap5Bs3Wfq58HXT/Y9JfCOcV2ZZV6yI=;
        b=snYOpuep97JPsToZB0W4g+q370ip3Aj3uGEwrKAOGhSl8Iz3CJNqwGKO9CYLK8DcYS
         jZAPlE+khqKLi7t4hITH6mq/qljMvAyJL+g+paXOa/FBOpOgmjayosvtW+/npENk7oEz
         pWaTABQNWUSzM+XclOHGElKZOxGPjRNV9XrtzOp81HB9fMEahH3fqdtMdwb+V5+b0Cvw
         Ywy30/UFVZ/vhyoYPVV0T6HIYZI627suVm4Lp2FLtVRFG7nSWTlTKiTBoSckxB8lFuNh
         FQJsmltWJDjWYd3wyuGt+p4XM2wXxXZLASQsvaiyJ2JABufc15DqDY78F/3EgjHH7Lja
         SWgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781752304; x=1782357104;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8004pEbSIDGa1Ap5Bs3Wfq58HXT/Y9JfCOcV2ZZV6yI=;
        b=kHc1vqxOQVSMULMvEvpfEsPsScL797sbBq1jcwqCR0HsgoKwTdJ8QibRmVIpMXHhgq
         uuM02aSHZxwEY/ojkf0gR3+s1oY6JnbUcwd4wvOKrhb8WD+DKQCu1iSp1pZJ++WQLc75
         Ung5qZoPmx3wqJLSPXJH3q4Vthii0yjuHUkUKxdMBIqEtf3YwHdgK8LkEg1PAuhxQyGV
         gxwJccXSloFaAEhfk0r9nsyf/NHxBFx5l7uaEygsYWk42uoNHdqC4sgfNI2rIPXMA8db
         aPKEQeCtci2BPTUVaoYgqlMLnZo7jdHtXRzBqYXbnkZlk6dkD5ZHkFAHPsUWZEf6/cG6
         DL/w==
X-Forwarded-Encrypted: i=1; AFNElJ8UTlUbU+6eS4J/jKBZNA4s5zTT69RyUleZI12ld00ouh1QHnE5XRFJvmR2zyl84+6ccEtRoaXyyQ0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywcnd8j5jFDmKzdqwuo7yMfZqpmhvP3Q5a0ou4N6y9W0yirSW0i
	c8ywqobSLJ0QPL8X1mgUMCJCqp3s8k5mNzFfdRKJgdEk8+YQU2/+M3/r
X-Gm-Gg: AfdE7cnHS3XIL7PzsXbQirCLna9xXejhdgxTMWAK9NKOMMtv04Wt4m68Oq3SVz5xdJ0
	7H1efGeX+jnBWIn/nB9EMZnvZ/sQ+tBT8ttlc5zGoZmlp9AeKS5ZpMo5cf0Z9jc7REEggB+Kble
	I89TcMji5szp1PNUeSy4BzW4W768J2gCny718WazlUAqlKfnvnfjKfSAoozySl6ZhLrG/oSsflu
	DTw94AlcVTt0nAoQBLCQlyipl1SEG79C4ddeUU9DAk7OunpBT4xTTfGC78+gVLvJiFfmBzXP8qQ
	7HfYEJaBZV8SA3QJ89gholkT9xqY1CTsKqlHW+MksbyI33B2g+BsYpffmJmw7QaodI0kclmWiIY
	r/MGDN9ZVRd2muEKKg2W1I02LBE0WgGYifvwtaNV+6+2wtw/QeZ5sRFDkvky48w/jwlO5CPnAYm
	IPO68TfsA/U9s=
X-Received: by 2002:a17:902:e889:b0:2c1:150d:6db5 with SMTP id d9443c01a7336-2c6e4724551mr17521875ad.6.1781752304159;
        Wed, 17 Jun 2026 20:11:44 -0700 (PDT)
Received: from [127.0.1.1] ([138.199.21.246])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c6a403b242sm60152975ad.31.2026.06.17.20.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 20:11:43 -0700 (PDT)
From: Jing Wu <realwujing@gmail.com>
Date: Thu, 18 Jun 2026 11:11:14 +0800
Subject: [PATCH v3 03/13] sched/isolation: RCU-protect all housekeeping
 cpumask readers
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-wujing-dhm-v3-3-28f1a4d83b68@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mingo@redhat.com,m:peterz@infradead.org,m:juri.lelli@redhat.com,m:vincent.guittot@linaro.org,m:dietmar.eggemann@arm.com,m:rostedt@goodmis.org,m:bsegall@google.com,m:mgorman@suse.de,m:vschneid@redhat.com,m:paulmck@kernel.org,m:frederic@kernel.org,m:neeraj.upadhyay@kernel.org,m:joelagnelf@nvidia.com,m:josh@joshtriplett.org,m:boqun@kernel.org,m:urezki@gmail.com,m:mathieu.desnoyers@efficios.com,m:jiangshanlai@gmail.com,m:qiang.zhang@linux.dev,m:anna-maria@linutronix.de,m:tj@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:shuah@kernel.org,m:tglx@kernel.org,m:linux-kernel@vger.kernel.org,m:rcu@vger.kernel.org,m:cgroups@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:realwujing@gmail.com,m:yuanql9@chinatelecom.cn,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-92710-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,chinatelecom.cn:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 44DFF69D3AD

Extend housekeeping_dereference_check() to validate all runtime-mutable
types (HK_TYPE_DOMAIN, HK_TYPE_KERNEL_NOISE, HK_TYPE_MANAGED_IRQ), not
only HK_TYPE_DOMAIN.  Boot-only types (HK_TYPE_DOMAIN_BOOT) remain
unchecked.

Add housekeeping_cpumask_rcu() for callers that already hold an RCU
read lock.  This variant uses rcu_dereference() without the lockdep
annotation, avoiding false-positive lockdep warnings in RCU read-side
critical sections.

Use READ_ONCE() consistently when testing housekeeping.flags in paths
that may race with housekeeping_update_types().

Signed-off-by: Jing Wu <realwujing@gmail.com>
Signed-off-by: Qiliang Yuan <yuanql9@chinatelecom.cn>
---
 include/linux/sched/isolation.h |  6 +++++
 kernel/sched/isolation.c        | 57 +++++++++++++++++++++++++++++++----------
 2 files changed, 49 insertions(+), 14 deletions(-)

diff --git a/include/linux/sched/isolation.h b/include/linux/sched/isolation.h
index eecbcbe802bd0..ed6e1c6980131 100644
--- a/include/linux/sched/isolation.h
+++ b/include/linux/sched/isolation.h
@@ -40,6 +40,7 @@ enum hk_type {
 DECLARE_STATIC_KEY_FALSE(housekeeping_overridden);
 extern int housekeeping_any_cpu(enum hk_type type);
 extern const struct cpumask *housekeeping_cpumask(enum hk_type type);
+extern const struct cpumask *housekeeping_cpumask_rcu(enum hk_type type);
 extern bool housekeeping_enabled(enum hk_type type);
 extern void housekeeping_affine(struct task_struct *t, enum hk_type type);
 extern bool housekeeping_test_cpu(int cpu, enum hk_type type);
@@ -87,6 +88,11 @@ static inline const struct cpumask *housekeeping_cpumask(enum hk_type type)
 	return cpu_possible_mask;
 }
 
+static inline const struct cpumask *housekeeping_cpumask_rcu(enum hk_type type)
+{
+	return cpu_possible_mask;
+}
+
 static inline bool housekeeping_enabled(enum hk_type type)
 {
 	return false;
diff --git a/kernel/sched/isolation.c b/kernel/sched/isolation.c
index 4eca18cc5e8ce..3d5d3f12853c7 100644
--- a/kernel/sched/isolation.c
+++ b/kernel/sched/isolation.c
@@ -121,25 +121,40 @@ bool housekeeping_enabled(enum hk_type type)
 }
 EXPORT_SYMBOL_GPL(housekeeping_enabled);
 
+/*
+ * Types that can change at runtime via cpuset isolated partitions.
+ * Boot-only types (DOMAIN_BOOT) are always safe to read without lockdep.
+ */
+static bool housekeeping_type_can_change(enum hk_type type)
+{
+	switch (type) {
+	case HK_TYPE_DOMAIN:
+	case HK_TYPE_KERNEL_NOISE:
+	case HK_TYPE_MANAGED_IRQ:
+		return true;
+	default:
+		return false;
+	}
+}
+
 static bool housekeeping_dereference_check(enum hk_type type)
 {
-	if (IS_ENABLED(CONFIG_LOCKDEP) && type == HK_TYPE_DOMAIN) {
-		/* Cpuset isn't even writable yet? */
-		if (system_state <= SYSTEM_SCHEDULING)
-			return true;
+	if (!IS_ENABLED(CONFIG_LOCKDEP) || !housekeeping_type_can_change(type))
+		return true;
 
-		/* CPU hotplug write locked, so cpuset partition can't be overwritten */
-		if (IS_ENABLED(CONFIG_HOTPLUG_CPU) && lockdep_is_cpus_write_held())
-			return true;
+	/* Cpuset isn't even writable yet? */
+	if (system_state <= SYSTEM_SCHEDULING)
+		return true;
 
-		/* Cpuset lock held, partitions not writable */
-		if (IS_ENABLED(CONFIG_CPUSETS) && lockdep_is_cpuset_held())
-			return true;
+	/* CPU hotplug write locked, so cpuset partition can't be overwritten */
+	if (IS_ENABLED(CONFIG_HOTPLUG_CPU) && lockdep_is_cpus_write_held())
+		return true;
 
-		return false;
-	}
+	/* Cpuset lock held, partitions not writable */
+	if (IS_ENABLED(CONFIG_CPUSETS) && lockdep_is_cpuset_held())
+		return true;
 
-	return true;
+	return false;
 }
 
 static inline struct cpumask *housekeeping_cpumask_dereference(enum hk_type type)
@@ -162,12 +177,26 @@ const struct cpumask *housekeeping_cpumask(enum hk_type type)
 }
 EXPORT_SYMBOL_GPL(housekeeping_cpumask);
 
+const struct cpumask *housekeeping_cpumask_rcu(enum hk_type type)
+{
+	const struct cpumask *mask = NULL;
+
+	if (static_branch_unlikely(&housekeeping_overridden)) {
+		if (READ_ONCE(housekeeping.flags) & BIT(type))
+			mask = rcu_dereference(housekeeping.cpumasks[type]);
+	}
+	if (!mask)
+		mask = cpu_possible_mask;
+	return mask;
+}
+EXPORT_SYMBOL_GPL(housekeeping_cpumask_rcu);
+
 int housekeeping_any_cpu(enum hk_type type)
 {
 	int cpu;
 
 	if (static_branch_unlikely(&housekeeping_overridden)) {
-		if (housekeeping.flags & BIT(type)) {
+		if (READ_ONCE(housekeeping.flags) & BIT(type)) {
 			cpu = sched_numa_find_closest(housekeeping_cpumask(type), smp_processor_id());
 			if (cpu < nr_cpu_ids)
 				return cpu;

-- 
2.43.0


