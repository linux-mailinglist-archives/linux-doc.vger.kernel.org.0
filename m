Return-Path: <linux-doc+bounces-1763-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB987E30EC
	for <lists+linux-doc@lfdr.de>; Tue,  7 Nov 2023 00:15:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 766F91C20850
	for <lists+linux-doc@lfdr.de>; Mon,  6 Nov 2023 23:15:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 537202F506;
	Mon,  6 Nov 2023 23:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eOlx0ANA"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C162F500
	for <linux-doc@vger.kernel.org>; Mon,  6 Nov 2023 23:15:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13DB9C433CB;
	Mon,  6 Nov 2023 23:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699312538;
	bh=CQftki3DvzX8brNioo1ToSG+EvqONpL4CCoMgbWUAJY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eOlx0ANABdC/o0n9517D2kMIcUti/IFZmbxTEJc1hvUhpbaMtpbKFCu+FlSAhRg+U
	 VpXd4s+OZhdkX/CXwqfykHqrAsU3pfg7/TxvHXW6F6KS2ViXrudA8Q1rwOQ5m9hf9S
	 qF3eCUKa9aG3h6edUJ0jDlZCEZ2C5p5Em/F8l0rW51tGlCd39ar9YkH6JkX1w1A+VB
	 /9HdsasEF0RCh5ZUdxTC5Ttze8Q8R8raLU7g36m8k6+25bvzLb0RlU2rGkjgUhIE6Y
	 50k1HWtDH4IIBC6BGOWBPQIrnTA/Xy2BruxpAd4QLekmJVOhC28vJwnLZHcdkP6WJJ
	 7k5VVSppuiF7A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Rik van Riel <riel@surriel.com>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Imran Khan <imran.f.khan@oracle.com>,
	Leonardo Bras <leobras@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Valentin Schneider <vschneid@redhat.com>,
	Juergen Gross <jgross@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Sasha Levin <sashal@kernel.org>,
	tj@kernel.org,
	bp@alien8.de,
	rostedt@goodmis.org,
	linux-doc@vger.kernel.org
Subject: [PATCH AUTOSEL 6.5 10/13] smp,csd: Throw an error if a CSD lock is stuck for too long
Date: Mon,  6 Nov 2023 18:15:03 -0500
Message-ID: <20231106231514.3735077-10-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231106231514.3735077-1-sashal@kernel.org>
References: <20231106231514.3735077-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.5.10
Content-Transfer-Encoding: 8bit

From: Rik van Riel <riel@surriel.com>

[ Upstream commit 94b3f0b5af2c7af69e3d6e0cdd9b0ea535f22186 ]

The CSD lock seems to get stuck in 2 "modes". When it gets stuck
temporarily, it usually gets released in a few seconds, and sometimes
up to one or two minutes.

If the CSD lock stays stuck for more than several minutes, it never
seems to get unstuck, and gradually more and more things in the system
end up also getting stuck.

In the latter case, we should just give up, so the system can dump out
a little more information about what went wrong, and, with panic_on_oops
and a kdump kernel loaded, dump a whole bunch more information about what
might have gone wrong.  In addition, there is an smp.panic_on_ipistall
kernel boot parameter that by default retains the old behavior, but when
set enables the panic after the CSD lock has been stuck for more than
the specified number of milliseconds, as in 300,000 for five minutes.

[ paulmck: Apply Imran Khan feedback. ]
[ paulmck: Apply Leonardo Bras feedback. ]

Link: https://lore.kernel.org/lkml/bc7cc8b0-f587-4451-8bcd-0daae627bcc7@paulmck-laptop/
Signed-off-by: Rik van Riel <riel@surriel.com>
Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
Reviewed-by: Imran Khan <imran.f.khan@oracle.com>
Reviewed-by: Leonardo Bras <leobras@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Valentin Schneider <vschneid@redhat.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 Documentation/admin-guide/kernel-parameters.txt |  7 +++++++
 kernel/smp.c                                    | 13 ++++++++++++-
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 23ebe34ff901e..b951b4c2808f1 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -5781,6 +5781,13 @@
 			This feature may be more efficiently disabled
 			using the csdlock_debug- kernel parameter.
 
+	smp.panic_on_ipistall= [KNL]
+			If a csd_lock_timeout extends for more than
+			the specified number of milliseconds, panic the
+			system.  By default, let CSD-lock acquisition
+			take as long as they take.  Specifying 300,000
+			for this value provides a 5-minute timeout.
+
 	smsc-ircc2.nopnp	[HW] Don't use PNP to discover SMC devices
 	smsc-ircc2.ircc_cfg=	[HW] Device configuration I/O port
 	smsc-ircc2.ircc_sir=	[HW] SIR base I/O port
diff --git a/kernel/smp.c b/kernel/smp.c
index 385179dae360e..0a9a3262f7822 100644
--- a/kernel/smp.c
+++ b/kernel/smp.c
@@ -168,6 +168,8 @@ static DEFINE_PER_CPU(void *, cur_csd_info);
 
 static ulong csd_lock_timeout = 5000;  /* CSD lock timeout in milliseconds. */
 module_param(csd_lock_timeout, ulong, 0444);
+static int panic_on_ipistall;  /* CSD panic timeout in milliseconds, 300000 for five minutes. */
+module_param(panic_on_ipistall, int, 0444);
 
 static atomic_t csd_bug_count = ATOMIC_INIT(0);
 
@@ -228,6 +230,7 @@ static bool csd_lock_wait_toolong(struct __call_single_data *csd, u64 ts0, u64 *
 	}
 
 	ts2 = sched_clock();
+	/* How long since we last checked for a stuck CSD lock.*/
 	ts_delta = ts2 - *ts1;
 	if (likely(ts_delta <= csd_lock_timeout_ns || csd_lock_timeout_ns == 0))
 		return false;
@@ -241,9 +244,17 @@ static bool csd_lock_wait_toolong(struct __call_single_data *csd, u64 ts0, u64 *
 	else
 		cpux = cpu;
 	cpu_cur_csd = smp_load_acquire(&per_cpu(cur_csd, cpux)); /* Before func and info. */
+	/* How long since this CSD lock was stuck. */
+	ts_delta = ts2 - ts0;
 	pr_alert("csd: %s non-responsive CSD lock (#%d) on CPU#%d, waiting %llu ns for CPU#%02d %pS(%ps).\n",
-		 firsttime ? "Detected" : "Continued", *bug_id, raw_smp_processor_id(), ts2 - ts0,
+		 firsttime ? "Detected" : "Continued", *bug_id, raw_smp_processor_id(), ts_delta,
 		 cpu, csd->func, csd->info);
+	/*
+	 * If the CSD lock is still stuck after 5 minutes, it is unlikely
+	 * to become unstuck. Use a signed comparison to avoid triggering
+	 * on underflows when the TSC is out of sync between sockets.
+	 */
+	BUG_ON(panic_on_ipistall > 0 && (s64)ts_delta > ((s64)panic_on_ipistall * NSEC_PER_MSEC));
 	if (cpu_cur_csd && csd != cpu_cur_csd) {
 		pr_alert("\tcsd: CSD lock (#%d) handling prior %pS(%ps) request.\n",
 			 *bug_id, READ_ONCE(per_cpu(cur_csd_func, cpux)),
-- 
2.42.0


