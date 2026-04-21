Return-Path: <linux-doc+bounces-83933-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8EFzHmPq5mlx1wEAu9opvQ
	(envelope-from <linux-doc+bounces-83933-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 21 Apr 2026 05:09:23 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED29435C25
	for <lists+linux-doc@lfdr.de>; Tue, 21 Apr 2026 05:09:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1B01A30131E4
	for <lists+linux-doc@lfdr.de>; Tue, 21 Apr 2026 03:06:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48FFD377004;
	Tue, 21 Apr 2026 03:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HwR/h+dt"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE1AB36EAA2
	for <linux-doc@vger.kernel.org>; Tue, 21 Apr 2026 03:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776740787; cv=none; b=FWprX5BtmmTVTv7LbOAbOEFsGWjYykZ7FeYJYC1UZjhaJrXqOO4uChv0Mjx6D8raRnM7rpwNX9d+2rM9sl3JlB7SAfSVyakzfXMp+wlpQF8xXrDQCwLrQyNwYFYMjfNDFF3w39E2Mml8obXLn/8psENU45dk8RnZKluKwMN1by4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776740787; c=relaxed/simple;
	bh=NizBy5F5iqz3lIlv4/HGfGfpmqCFIGJCsc8UXnSMbdo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ScwTwkQz6Gb5PjAsdKgrKkEBeCcIdboilEqXGL81koDQbBpldpQ9RYhonUz9GTMzB8uVQ/PPiE/VbX3ZtikWcgHs/GgsU8fxBoQl9AlViYBGruP765s0jsxY/olGHuiUw35D1/YgrYjqPHBIWkYB5E/wVhzUhTmLnk8eLXouz2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HwR/h+dt; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776740785;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=COchuuNtaUwzp4yU7u6iY7uNboUt1slktmJkiZmVfdo=;
	b=HwR/h+dt3mi4bGvYFRguxi2y3t6dXbrAKJn3fHmrmNv3FYwwuUgcgzUha7EfeINXwFOP5u
	VNhOaoMgA2HwhibJ73aiOCVKsrg2+UJR2DY3/w6u15zuiaTIMoKSm3oXhy2oyfm2fYkBtC
	UIiQZ5MS9oabovMi9gz7ONcUrcSZIUc=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-343-Ht1zoOtzOmaoJByl8D1ezg-1; Mon,
 20 Apr 2026 23:06:21 -0400
X-MC-Unique: Ht1zoOtzOmaoJByl8D1ezg-1
X-Mimecast-MFC-AGG-ID: Ht1zoOtzOmaoJByl8D1ezg_1776740776
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EEC4219560B2;
	Tue, 21 Apr 2026 03:06:15 +0000 (UTC)
Received: from llong-thinkpadp16vgen1.westford.csb (unknown [10.22.65.81])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id ED1DE19560B7;
	Tue, 21 Apr 2026 03:06:08 +0000 (UTC)
From: Waiman Long <longman@redhat.com>
To: Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	Long Li <longli@microsoft.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Frederic Weisbecker <frederic@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Boqun Feng <boqun@kernel.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang@linux.dev>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Chen Ridong <chenridong@huaweicloud.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>
Cc: cgroups@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-hyperv@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	rcu@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Costa Shulyupin <cshulyup@redhat.com>,
	Qiliang Yuan <realwujing@gmail.com>,
	Waiman Long <longman@redhat.com>
Subject: [PATCH 11/23] hrtimer: Use RCU to protect access of HK_TYPE_TIMER cpumask
Date: Mon, 20 Apr 2026 23:03:39 -0400
Message-ID: <20260421030351.281436-12-longman@redhat.com>
In-Reply-To: <20260421030351.281436-1-longman@redhat.com>
References: <20260421030351.281436-1-longman@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,cmpxchg.org,suse.com,lwn.net,linuxfoundation.org,arm.com,microsoft.com,roeck-us.net,nvidia.com,joshtriplett.org,gmail.com,goodmis.org,efficios.com,linux.dev,linutronix.de,huaweicloud.com,infradead.org,redhat.com,linaro.org,google.com,suse.de,amd.com,davemloft.net];
	TAGGED_FROM(0.00)[bounces-83933-lists,linux-doc=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,redhat.com,gmail.com];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[longman@redhat.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_GT_50(0.00)[53];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6ED29435C25
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

As HK_TYPE_TIMER cpumask is going to be changeable at run time, use
RCU to protect access to the cpumask.

The access of HK_TYPE_TIMER cpumask within hrtimers_cpu_dying() is
protected as interrupt is disabled and all the other CPUs are stopped
when this function is invoked as part of the CPU tear down process.

Signed-off-by: Waiman Long <longman@redhat.com>
---
 kernel/time/hrtimer.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/kernel/time/hrtimer.c b/kernel/time/hrtimer.c
index 000fb6ba7d74..85495400a193 100644
--- a/kernel/time/hrtimer.c
+++ b/kernel/time/hrtimer.c
@@ -242,8 +242,10 @@ static bool hrtimer_suitable_target(struct hrtimer *timer, struct hrtimer_clock_
 static inline struct hrtimer_cpu_base *get_target_base(struct hrtimer_cpu_base *base, bool pinned)
 {
 	if (!hrtimer_base_is_online(base)) {
-		int cpu = cpumask_any_and(cpu_online_mask, housekeeping_cpumask(HK_TYPE_TIMER));
+		int cpu;
 
+		guard(rcu)();
+		cpu = cpumask_any_and(cpu_online_mask, housekeeping_cpumask(HK_TYPE_TIMER));
 		return &per_cpu(hrtimer_bases, cpu);
 	}
 
-- 
2.53.0


