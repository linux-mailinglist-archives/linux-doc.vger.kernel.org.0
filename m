Return-Path: <linux-doc+bounces-92717-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kUKGOhBjM2otAAYAu9opvQ
	(envelope-from <linux-doc+bounces-92717-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 18 Jun 2026 05:16:32 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BEE869D47F
	for <lists+linux-doc@lfdr.de>; Thu, 18 Jun 2026 05:16:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=SKV3MOor;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92717-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-92717-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A446F30D4146
	for <lists+linux-doc@lfdr.de>; Thu, 18 Jun 2026 03:12:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54F5E32E757;
	Thu, 18 Jun 2026 03:12:30 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B31F334C1C
	for <linux-doc@vger.kernel.org>; Thu, 18 Jun 2026 03:12:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781752350; cv=none; b=oStqiNds8+VDid9gjkxImJe+eIG02lh/e47ozD/7+AwhJtdy9hDXIT22YDlmAEIx+lD816TGHlQm2sX1zE6iHR0Vr3dhhiqkL05vDOY92+BAMSMSP56BcKAoDCmuANXafxiMQ1B4xnNKn+VNPsOp05+6gS77FcLwmE5mXBvTy9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781752350; c=relaxed/simple;
	bh=CGVA/ZVSxDQwk3QuV1O5/oZqn1YqVi8jf66NBKmDl2E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ei7E3U4WlMTI2npYtIeP8/LYakSeJOm1Ouj4/3yah8OONO3ITN7But854+/zi/FRgzsIeqm3TvHmUn0fUOCT2A3Mw3+8dy3jMwVrZbtU+LtMEGlKLl5qJGYr3Pb9NPcx+A1OTbLFLKsQuxCNhxFQs/qbBwL2oOHzVNVsjgdpiUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SKV3MOor; arc=none smtp.client-ip=209.85.214.169
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2c40397e746so2965935ad.3
        for <linux-doc@vger.kernel.org>; Wed, 17 Jun 2026 20:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781752348; x=1782357148; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jSeuXyNGDp0AEfOTbyJ0TXed/qE2r/+QX9gKv1aP6Yc=;
        b=SKV3MOorcrjwv4HA9Mg8Ix23s1nMLV28lvCxj2kIbssmS4bXrK2jSPDkwBifo5gJw7
         wSKtcC8O9qdpYPadAeq/CTzZhC6LkcTE3gIdRSduX1+t1i+lG+71BZl3fUb4CKTtzDWu
         8hkvlCYTlj7XEKRbAhGc2dt5stId3Dq7VEqoC8GKcwb5/HaZ49r5iZ8Waus7OzN9O+Kw
         dxh0g1eYs7ay1/x9E3KZeSOD7WgAz27Uh/QAoGmi3scboQdvwuoki4eTEbJJz272YcuY
         SXP0ltz7A6aPr8F+OKocWKUQpUTnS3y9XkuNTbhsZqrcD6+AqjermA3T32B6w1jGxp6e
         5zcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781752348; x=1782357148;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jSeuXyNGDp0AEfOTbyJ0TXed/qE2r/+QX9gKv1aP6Yc=;
        b=CAWblMGazaYBXUT2F2eJZiBWCt/kUbqFYPZDjdRajLgYUYWyykwsbxXaaidSAYY9Sa
         iQlIZw8/+NhQDyfa6Rz62+OMIDWCpUAUM6OkD4QoC99SUtEBprbpTi7N2PzNk/GTVEbV
         BU1Xo1Pgu4T/1GRFnITfF4yeGAhoiSMNOI2ytfRvRIDX0i9tiviiKoVwCttLtyp9HYvH
         q38L9e9oJcrUZjuKj+iMjH2q+62Sl1Vfh3howl5wTbf5IhI0Xm3o1PNsB9zfQzzCUWYc
         JPzTEnx2Dm+tb3dXHPUmFsNyZzlbaxs4cJE8acYCnDhpQv6XRGLCczDtqTOE4pvZY2GQ
         MEXQ==
X-Forwarded-Encrypted: i=1; AFNElJ/cBSx5OrztNpIId0EE7TYe6V6TyQXjYkI+UFD/mfhmtF/gQ+5e3iv8OVKghn2KDrSfTFn52JEN6xs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7zatEsocstt9m05ajkEvrn6BvGPVfRudjQQ/kvpxwf4Gv0R64
	r1kku9G0G/pu8/EVzzi5dcTOYlEVq11LFt8v8lhJuAdMNE+yEFVdWav5
X-Gm-Gg: AfdE7cmMl1Gv1XqQEZvevYyKzi/w/RLJvUVdHKKXyp6obZI1L+vVbpVJ2BT3M2+A1JM
	Wt6xrM1MVM/4PPkF1q/NYBOBOcE1et5RvoVq2N2pnU09A/HjUu133S5xHaWoA6HzOI8sX/lThUx
	V78Exvxf5RBFwWOsxgeRGrnECInoxggkKq0GDaAJvf+Pw2sAWqbbnYRJXbRFPq/OIEbNfGL/oBs
	O8N/klM0BVZVxnBmgrAwqsH5tMrHySB7SBeo/j43tQxGA2XfhbXeG17GcUHHE6GaYdl5gGVcj69
	R3N9wT6iTB0CXdxagWhhoZS5shMRK06N8bhuYs82ioqcnSP0Sy2UvDsFFelLlnyTkRor9inIKy7
	tL9Kz1gByxkO597FrMDoKVNuMhGtWF45VgwfKKsxhRPmAMYbBDyuMEbxgKzYwbCkpJ/DEKjGp9g
	t9UTRkDRHCmgQ=
X-Received: by 2002:a17:903:19ce:b0:2bf:128d:f7ff with SMTP id d9443c01a7336-2c6f34327c6mr5866785ad.16.1781752348483;
        Wed, 17 Jun 2026 20:12:28 -0700 (PDT)
Received: from [127.0.1.1] ([138.199.21.246])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c6a403b242sm60152975ad.31.2026.06.17.20.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 20:12:28 -0700 (PDT)
From: Jing Wu <realwujing@gmail.com>
Date: Thu, 18 Jun 2026 11:11:21 +0800
Subject: [PATCH v3 10/13] sched: Guard sched_tick_start/stop against
 uninitialized tick_work_cpu
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-wujing-dhm-v3-10-28f1a4d83b68@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-92717-lists,linux-doc=lfdr.de];
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
X-Rspamd-Queue-Id: 4BEE869D47F

sched_tick_start() and sched_tick_stop() are called during CPU hotplug
for CPUs not in the HK_TYPE_KERNEL_NOISE set.  They dereference
tick_work_cpu, which is allocated by sched_tick_offload_init() and only
called from housekeeping_init() when nohz_full= is present at boot.

When the DHM subsystem first-enables HK_TYPE_KERNEL_NOISE at runtime via
housekeeping_update_types(), tick_work_cpu remains NULL because
sched_tick_offload_init() is __init-only and cannot be re-invoked.  A
subsequent CPU offline/online cycle for an isolated CPU triggers
WARN_ON_ONCE(!tick_work_cpu) followed by a NULL-pointer dereference in
per_cpu_ptr(tick_work_cpu, cpu), crashing the kernel.

Since nohz_full= was not active at boot, tick_nohz_full_running remains
false and the tick-offload infrastructure is never activated; isolated
CPUs continue to receive their own ticks.  Guard both helpers with an
additional !tick_work_cpu check so they become no-ops in this case.

Signed-off-by: Jing Wu <realwujing@gmail.com>
Signed-off-by: Qiliang Yuan <yuanql9@chinatelecom.cn>
---
 kernel/sched/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 371b509d92164..df004e3efca70 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -5778,7 +5778,7 @@ static void sched_tick_start(int cpu)
 	int os;
 	struct tick_work *twork;
 
-	if (housekeeping_cpu(cpu, HK_TYPE_KERNEL_NOISE))
+	if (housekeeping_cpu(cpu, HK_TYPE_KERNEL_NOISE) || !tick_work_cpu)
 		return;
 
 	WARN_ON_ONCE(!tick_work_cpu);
@@ -5799,7 +5799,7 @@ static void sched_tick_stop(int cpu)
 	struct tick_work *twork;
 	int os;
 
-	if (housekeeping_cpu(cpu, HK_TYPE_KERNEL_NOISE))
+	if (housekeeping_cpu(cpu, HK_TYPE_KERNEL_NOISE) || !tick_work_cpu)
 		return;
 
 	WARN_ON_ONCE(!tick_work_cpu);

-- 
2.43.0


