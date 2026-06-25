Return-Path: <linux-doc+bounces-93540-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /o5QD6AlPWpzxwgAu9opvQ
	(envelope-from <linux-doc+bounces-93540-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jun 2026 14:57:04 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B456C5CEE
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jun 2026 14:57:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ibm.com header.s=pp1 header.b="nqYgrj/2";
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93540-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-93540-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ibm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ADB233170209
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jun 2026 12:50:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7C0F3E3D94;
	Thu, 25 Jun 2026 12:50:13 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335F43E0087;
	Thu, 25 Jun 2026 12:50:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782391813; cv=none; b=mYXjN720g9tZ0ydAGPtF71lJM8bl36R4Mhv2MIUXr/zOWf2NXO/13yQTYKeA+srJPF/MQkRwMPcXpbB0rhUulty+brwqZgactXB5vuypr939mxRAjCMvmOUQHW9eU1iwg32yyu+bEa5+OR35IzqSt5NsFYgOc8NhDgP1c4XZu7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782391813; c=relaxed/simple;
	bh=7RWCNfvbzPdwY2lzNWCC+FPW6Vi7QRrXK1dP++oFNeI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ctm/k1LHS4e2ECFJ+aAhZxsFqQhw7M4ooNMOUKl7HDAlYvrxRAbf/MkNEaimL9p6dzSL7xi5WnQ3C8el57kH1ahiA+uiCb8UrG+RP677iOVbehDPbVBo7JaHmFeLXTeR0/jAp1RHrnKy2EjPYM99cDOcsZT2N0B0SLSbwSQSCW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=nqYgrj/2; arc=none smtp.client-ip=148.163.158.5
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P3mgiV2927460;
	Thu, 25 Jun 2026 12:49:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=CU18J+WJ67NAr1jCj
	sscSGFVxcfLRvtIUGZP3h6HHJw=; b=nqYgrj/2p3x+hcKkbBAAlC0dNoDcQXSKA
	q1nRB4g0N1bOPsdIUPGNXKQobGEAUczZ2BgWoyvD4d/kIdrrxb08fOqb62AEnjGM
	+k8a3tBSe3ht99vX/x+1eTbDNT1zssXDyW+Wimd9EoHq7itKWcryfE9zWCokDnm5
	K04edfWvu8J7Te8kkhEIvysNR1OYPcZsaa8d2vgE61oE+Zg+OySAq6CoGIhRalNf
	ggLeas0QJW9bfqXwzuwtDHNZAG1IGpTb+gzffVW/0XseRN76VhR1haAQ3BQ9db14
	GjV9p4HiXdPU5hE4Syn+4Zk26eTJVrSPLtCQ/7r8Def964MmZEpRw==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ewg9j1t6m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 12:49:56 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 65PCnmXJ031108;
	Thu, 25 Jun 2026 12:49:55 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4ex66ke5vm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 12:49:55 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 65PCnphn47579534
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 25 Jun 2026 12:49:51 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5145820043;
	Thu, 25 Jun 2026 12:49:51 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 93B9E20040;
	Thu, 25 Jun 2026 12:49:43 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.20.6])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 25 Jun 2026 12:49:43 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: linux-kernel@vger.kernel.org, mingo@kernel.org, peterz@infradead.org,
        juri.lelli@redhat.com, vincent.guittot@linaro.org,
        yury.norov@gmail.com, kprateek.nayak@amd.com, iii@linux.ibm.com,
        corbet@lwn.net
Cc: sshegde@linux.ibm.com, tglx@kernel.org, gregkh@linuxfoundation.org,
        pbonzini@redhat.com, seanjc@google.com, vschneid@redhat.com,
        huschle@linux.ibm.com, rostedt@goodmis.org, dietmar.eggemann@arm.com,
        maddy@linux.ibm.com, srikar@linux.ibm.com, hdanton@sina.com,
        chleroy@kernel.org, vineeth@bitbyteword.org, frederic@kernel.org,
        arighi@nvidia.com, pauld@redhat.com, christian.loehle@arm.com,
        tj@kernel.org, tommaso.cucinotta@gmail.com, maz@kernel.org,
        rafael@kernel.org, rdunlap@infradead.org, kernellwp@gmail.com,
        linux-doc@vger.kernel.org
Subject: [PATCH v5 20/24] virt/steal_monitor: Provide default method to inc/dec preferred CPUs
Date: Thu, 25 Jun 2026 18:16:44 +0530
Message-ID: <20260625124648.802832-21-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260625124648.802832-1-sshegde@linux.ibm.com>
References: <20260625124648.802832-1-sshegde@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: mBVSeUIOomdeTeeXz5KplfTPmPA8Cbjs
X-Proofpoint-GUID: LUge49qv1VIhv1hML_Ng7pM-xSVD92Z3
X-Authority-Analysis: v=2.4 cv=Y4XIdBeN c=1 sm=1 tr=0 ts=6a3d23f4 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VnNF1IyMAAAA:8 a=Zi32pPCfsXcElmCxYJ0A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDExMCBTYWx0ZWRfX62n1fLsqBAMo
 HRMjLCn5Jp59YdviYDxRtnqzz5wg5QanulC7QRoxedj2/Vyd9PwlGAT8797STrFR09lJXfWBvbB
 7iabTkZfY61H0DlAUQVlF5qPiHMy7TOnUFmD2hXTneG+1/Nv1rsJJ2d4Tc5//j6RGaDc7rONfYu
 t0slQvBGvmYOpm9pMemE49dGMcm2QPswFUEQbazOEpnmjX180VgLRmnYKwu8HB5uF360yRY/YkD
 r3bwWCmuKyTF0D520c4g5Cele5va9ciWKAkiOOClvO3DfXzJ0MHEhPlUjaZspO8eY0ThxWcB7b8
 jjzE8ao83wuQa0XCmUMHZQhtzWFGOFdWZa+C+VIwkBWFbcWS84Y82RSDEYTYyjsXCndK8xogXsv
 xCkElbgzj5oORfcdgzKW6BNNeb6HscCXQONgMYrafauTLmD7g+r/wndtAfOHmOksPF/2OB9gnBe
 2rXxWnA2iB2rDhByAQw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDExMCBTYWx0ZWRfXzDZ+7uSAGU0O
 mAT2G/HgfHwTUvfNYSzj7LJs2f8MVr8bH50JyhZEUUCjpFI7D0dHYspvyy9JgjIcDi8kD/8kNZE
 T/2ftAgF+Rusv/KxGfLGosfVvxzh73E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250110
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[linux.ibm.com,kernel.org,linuxfoundation.org,redhat.com,google.com,goodmis.org,arm.com,sina.com,bitbyteword.org,nvidia.com,gmail.com,infradead.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[sshegde@linux.ibm.com,linux-doc@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-93540-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:mingo@kernel.org,m:peterz@infradead.org,m:juri.lelli@redhat.com,m:vincent.guittot@linaro.org,m:yury.norov@gmail.com,m:kprateek.nayak@amd.com,m:iii@linux.ibm.com,m:corbet@lwn.net,m:sshegde@linux.ibm.com,m:tglx@kernel.org,m:gregkh@linuxfoundation.org,m:pbonzini@redhat.com,m:seanjc@google.com,m:vschneid@redhat.com,m:huschle@linux.ibm.com,m:rostedt@goodmis.org,m:dietmar.eggemann@arm.com,m:maddy@linux.ibm.com,m:srikar@linux.ibm.com,m:hdanton@sina.com,m:chleroy@kernel.org,m:vineeth@bitbyteword.org,m:frederic@kernel.org,m:arighi@nvidia.com,m:pauld@redhat.com,m:christian.loehle@arm.com,m:tj@kernel.org,m:tommaso.cucinotta@gmail.com,m:maz@kernel.org,m:rafael@kernel.org,m:rdunlap@infradead.org,m:kernellwp@gmail.com,m:linux-doc@vger.kernel.org,m:yurynorov@gmail.com,m:tommasocucinotta@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[vger.kernel.org,kernel.org,infradead.org,redhat.com,linaro.org,gmail.com,amd.com,linux.ibm.com,lwn.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[34];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sshegde@linux.ibm.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	TO_DN_NONE(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linux.ibm.com:mid,linux.ibm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 99B456C5CEE

These methods will be used by the steal_monitor core in subsequent
patches. Default implementation are likely good enough for most archs.

decrease_preferred_cpus() - Called when there is high steal time. It needs
to decide which CPUs to mark as non-preferred and set that state.
increase_preferred_cpus() - Called when there is low steal time. It needs
to decide which CPUs to mark as preferred and set that state.

Default Implementations:
decrease_preferred_cpus()
- Get the last CPU in cpu_preferred_mask.
- Check if that last CPU belong to first housekeeping core. If so there
  is nothing to do. This helps to keep at least one core as preferred.
  This is to be safe under non-normal cases.
- If it is not first housekeeping core, get its sibling and mark them as
  non-preferred. If they are nohz_full, enable the tick. push mechanism
  relies on sched_tick.

increase_preferred_cpus()
- Get the first active non-preferred CPUs. This likely is the last
  set of CPUs being marked as non-preferred.
- If there is no such CPU, i.e preferred is same as active. Nothing
  todo further.
- If not, get the siblings of that core and mark them as preferred.
  Note that clearing the tick isn't needed as that would be handled via
  sched_can_stop_tick.

Using core instead of individual CPUs give better numbers as SMT is
quite common and some hypervisor such as powerVM does core scheduling.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
v4->v5:
- Modified for steal_monitor

 drivers/virt/steal_monitor/defaults.c | 68 +++++++++++++++++++++++++++
 drivers/virt/steal_monitor/sm_core.h  |  4 ++
 2 files changed, 72 insertions(+)

diff --git a/drivers/virt/steal_monitor/defaults.c b/drivers/virt/steal_monitor/defaults.c
index 17f57afacbe6..90ede838491f 100644
--- a/drivers/virt/steal_monitor/defaults.c
+++ b/drivers/virt/steal_monitor/defaults.c
@@ -25,3 +25,71 @@ u64 __weak get_system_steal_time(void)
 
 	return total_steal;
 }
+
+/*
+ * Default implementation of decrementing the preferred CPUs based on steal
+ * time. This is simple logic and decrease the preferred CPUs by 1 core.
+ * It takes out the last core in the active & preferred.
+ *
+ * Ensure at least one housekeeping core is always kept as preferred
+ *
+ * Could be overwritten by arch specific handling. Arch must ensure
+ * preferred is always subset of active.
+ */
+
+#define get_core_mask(cpu) topology_sibling_cpumask(cpu)
+
+void __weak decrease_preferred_cpus(struct steal_monitor *ctx)
+{
+	int last_cpu, tmp_cpu;
+	int first_hk_cpu;
+
+	guard(cpus_read_lock)();
+
+	last_cpu = cpumask_last(cpu_preferred_mask);
+	first_hk_cpu = cpumask_first_and(housekeeping_cpumask(HK_TYPE_KERNEL_NOISE),
+					 cpu_active_mask);
+	/*
+	 * If the core belongs to the first housekeeping CPUs, no action is
+	 * taken. This leaves at least one core preferred always.
+	 * This ensures at least some CPUs are available to run.
+	 */
+	if (cpumask_equal(get_core_mask(last_cpu), get_core_mask(first_hk_cpu)))
+		return;
+
+	/*
+	 * set tick bit for nohz_full CPU to push the task out. Once the tasks
+	 * are pushed out, bit will be cleared if there are no tasks.
+	 */
+
+	for_each_cpu_and(tmp_cpu, get_core_mask(last_cpu), cpu_active_mask) {
+		set_cpu_preferred(tmp_cpu, false);
+		if (tick_nohz_full_cpu(tmp_cpu))
+			tick_nohz_dep_set_cpu(tmp_cpu, TICK_DEP_BIT_SCHED);
+	}
+}
+
+/*
+ * Default implementation of incrementing preferred CPUs based on steal
+ * time. This is simple logic and increases the preferred CPUs by 1 core.
+ * It adds the first core in active & !preferred
+ *
+ * Nothing to do if active == preferred
+ *
+ * Could be overwritten by arch specific handling. Arch must ensure
+ * preferred is subset of active.
+ */
+void __weak increase_preferred_cpus(struct steal_monitor *ctx)
+{
+	int first_cpu, tmp_cpu;
+
+	guard(cpus_read_lock)();
+
+	first_cpu = cpumask_first_andnot(cpu_active_mask, cpu_preferred_mask);
+	/* All CPUs are preferred. Nothing to increase further */
+	if (first_cpu >= nr_cpu_ids)
+		return;
+
+	for_each_cpu_and(tmp_cpu, get_core_mask(first_cpu), cpu_active_mask)
+		set_cpu_preferred(tmp_cpu, true);
+}
diff --git a/drivers/virt/steal_monitor/sm_core.h b/drivers/virt/steal_monitor/sm_core.h
index e09745a2b813..1857d6a9a295 100644
--- a/drivers/virt/steal_monitor/sm_core.h
+++ b/drivers/virt/steal_monitor/sm_core.h
@@ -10,6 +10,8 @@
 #include <linux/cpumask.h>
 #include <linux/workqueue.h>
 #include <linux/kernel_stat.h>
+#include <linux/tick.h>
+#include <linux/sched/isolation.h>
 
 struct steal_monitor {
 	struct delayed_work	work;
@@ -24,4 +26,6 @@ struct steal_monitor {
 extern struct steal_monitor sm_core_ctx;
 
 u64 get_system_steal_time(void);
+void increase_preferred_cpus(struct steal_monitor *ctx);
+void decrease_preferred_cpus(struct steal_monitor *ctx);
 #endif /* __VIRT_STEAL_CORE_H */
-- 
2.47.3


