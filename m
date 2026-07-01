Return-Path: <linux-doc+bounces-94393-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RnZ6FgYlRWoV7woAu9opvQ
	(envelope-from <linux-doc+bounces-94393-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 01 Jul 2026 16:32:38 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C3F6EEC8A
	for <lists+linux-doc@lfdr.de>; Wed, 01 Jul 2026 16:32:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ibm.com header.s=pp1 header.b=OpIajhbx;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94393-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-doc+bounces-94393-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ibm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E0AC430B3DF8
	for <lists+linux-doc@lfdr.de>; Wed,  1 Jul 2026 14:24:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 880D3345729;
	Wed,  1 Jul 2026 14:21:59 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE5B3438A0;
	Wed,  1 Jul 2026 14:21:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782915719; cv=none; b=E1mh5gOaGxtECFGA7p9hgGSFmUQ9nh1VUy5g3JbCmzTRZwDBVkEM9SZE0OSuAYYRDlJsPs0zZDMMJZ9w18nHxqY9NjgnWO8PdFXGJYkwbAYTa3hWsBEusiiyqR33vLHBvR5dou+SfXuS9a2QYMRkRGFSAbJm5Tm7Qx8NHlIe3Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782915719; c=relaxed/simple;
	bh=Dydur4+VkucwUij0RBv340FPAxQ/Fw/wUlWyghF+amw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cNugbZo3+Tz10nI57ZQDb7eVQvPyEjXkrFEZqkaoOKvdQ411aK5v8cfuIEPKVPqsy9YFR5L0QRjj91nfz/jWqDiF177HSgCYL/gXnjZtazoIXtdososch/FqcVrFPR+oy6KUwOf9U1E3CyBe6wcIvDR6Wck4ExGmzoD53LJth+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=OpIajhbx; arc=none smtp.client-ip=148.163.156.1
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661AIMlf550937;
	Wed, 1 Jul 2026 14:21:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=UrshEYOTTlnnHtKZU
	0jBMW0kSamkcMZe3zaSdLTyGok=; b=OpIajhbxG6/gAU/QGBxFiPImJH7nfJYZg
	w11gMDHPFwfgM3S/x8xgxyad7py2Y+MxhOJd3ryjt/baVDONx7WCw+7k1qECZPK9
	hgfsaEoAENUFXQ42AcCq12D1Gt9uIpz0SLGre4U3UACQrSpFaSnRE3jLAZo/NYgj
	bQxGfxExycS2KxaUk93uzSXF0FxD1Exg9MN2l3w0G0J8uVud/hQda1sqXWTDgdRM
	WWW8sb+s7ew3kqEpY3GvvLurynCwz2o12jeRVDUWV7s8DR+srSReuKjcv0K2A7xL
	l6qdLFCkW+cnGL9Dx9ZJ3iu93iVckKmZ0rhMxaETnBl2AWECfphIA==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4f26n5vyfx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 14:21:33 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 661EJfDo027990;
	Wed, 1 Jul 2026 14:21:31 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4f2ruqfug0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 14:21:31 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 661ELSLN47579626
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 1 Jul 2026 14:21:28 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 05BBE20049;
	Wed,  1 Jul 2026 14:21:28 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7B08620040;
	Wed,  1 Jul 2026 14:21:14 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.67.14.28])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  1 Jul 2026 14:21:14 +0000 (GMT)
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
Subject: [PATCH v6 18/23] virt/steal_monitor: Provide default method to inc/dec preferred CPUs
Date: Wed,  1 Jul 2026 19:46:49 +0530
Message-ID: <20260701141654.500125-19-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701141654.500125-1-sshegde@linux.ibm.com>
References: <20260701141654.500125-1-sshegde@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE1MCBTYWx0ZWRfX2pEx29xsHtz5
 CnZAseHk+wJEqfMPwKYIHjZY0IrVX3fMUIBPd5Tl3Hpj211H686jmmAbspO5FPkKLiCMNI/djJn
 ZwyPX/MT1nlMM2gT7+JNs/E7Z4d/6lQj2pkm73fREEsV0kKX8TG4z2gGUoAiTsZYE3zUbiSPxyh
 pHRSSbbdCxn1In4yKIPGguGOLXXZqSwSBb75qF2tH5Ssk2ADNKDuGtsalIlN5/hyn5M1FGmwVZj
 dCYqunJiE/p+OWpvDoAQ59oJA+pSEUIwQwfGP9vtX7NWzUuRZczPTRnZiYkDf8ooVeJWqg/PDyZ
 DlNzJ5lDvufOiCGW9PTk9nLCUEsjWnb0PM4q6ZJzGcoelo9IuQk2vMPAXThvHKnyuh/rTZx9kGN
 4MzmuYkBU32ljaRW+RCqAU/+QDwylehNSJd7IecB3CuMvcnKTUOVjX3PtV9xdjGCp967BAjkaDA
 Pu6fNTvL3YYfPal+rJw==
X-Authority-Analysis: v=2.4 cv=V45NF+ni c=1 sm=1 tr=0 ts=6a45226d cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=U7nrCbtTmkRpXpFmAIza:22 a=VnNF1IyMAAAA:8 a=GMWBCIuhrSpXcCQBz54A:9
X-Proofpoint-ORIG-GUID: Xfyn5K2DpIMJgxMnGWAOvoU3-DOmLEYM
X-Proofpoint-GUID: thutCY0WiL9Q7fO8k3Kgk_FfjmTE_Tcq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE1MCBTYWx0ZWRfX7bNZXruAxhQV
 i9H+A7mIhWmAhKb1YzkFC2wzJIN2eZEiRSdqV7pg87ZomWkpxSwx6RgwEYuljRKj9TO6hQ515zl
 ztkvfJvjo6DB1slnd7khc2zIxInY+cU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010150
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[linux.ibm.com,kernel.org,linuxfoundation.org,redhat.com,google.com,goodmis.org,arm.com,sina.com,bitbyteword.org,nvidia.com,gmail.com,infradead.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[sshegde@linux.ibm.com,linux-doc@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-94393-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid,linux.ibm.com:from_mime,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 14C3F6EEC8A

These methods will be used by the steal_monitor core in subsequent
patches. Default implementation are likely good enough for most archs.

decrease_preferred_cpus() - Called when there is high steal time. It needs
to decide which CPUs to mark as non-preferred and set that state.
increase_preferred_cpus() - Called when there is low steal time. It needs
to decide which CPUs to mark as preferred and set that state.

Default Implementations:
decrease_preferred_cpus()
- Get first housekeeping CPU and its core mask. Mark it as
  protected core. This helps to keep at least one core as preferred.
  This is to be safe under non-normal cases.
- Find the last CPU outside of this protected core mask. (target CPU)
  This works for cases where one may specify nohz_full= for last set of
  CPUs as well.
- If no such CPU exits, then only housekeeping core remains. Bail out.
- Based on that target CPU, get its sibling and mark them as
  non-preferred. If they are nohz_full, enable the tick.
  push mechanism relies on sched_tick.

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

Note: This doesn't do any NUMA splicing to keep the code simpler and
minimal overhead. current code expects CPUs spread unformly
across NUMA nodes.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
v5->v6:
- Make it work for all cases when nohz_full= may be specified.

 drivers/virt/steal_monitor/defaults.c | 74 +++++++++++++++++++++++++++
 drivers/virt/steal_monitor/sm_core.h  |  2 +
 2 files changed, 76 insertions(+)

diff --git a/drivers/virt/steal_monitor/defaults.c b/drivers/virt/steal_monitor/defaults.c
index 6681f9938f6a..4e2e5b233948 100644
--- a/drivers/virt/steal_monitor/defaults.c
+++ b/drivers/virt/steal_monitor/defaults.c
@@ -26,3 +26,77 @@ u64 __weak get_system_steal_time(void)
 
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
+	int tmp_cpu, first_hk_cpu;
+	const struct cpumask *first_hk_core;
+	int target_cpu = nr_cpu_ids;
+
+	guard(cpus_read_lock)();
+
+	first_hk_cpu = cpumask_first_and(housekeeping_cpumask(HK_TYPE_KERNEL_NOISE),
+					 cpu_active_mask);
+
+	if (first_hk_cpu >= nr_cpu_ids)
+		return;
+
+	first_hk_core = get_core_mask(first_hk_cpu);
+
+	/* Always leave first housekeeping core as preferred. */
+	for_each_cpu_andnot(tmp_cpu, cpu_preferred_mask, first_hk_core)
+		target_cpu = tmp_cpu;
+
+	/* Only the first housekeeping core remains */
+	if (target_cpu >= nr_cpu_ids)
+		return;
+
+	/*
+	 * set tick bit for nohz_full CPU to push the task out. Once the tasks
+	 * are pushed out, bit will be cleared if there are no tasks.
+	 */
+
+	for_each_cpu_and(tmp_cpu, get_core_mask(target_cpu), cpu_active_mask) {
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
index 634c9f5a2610..030f6236c38e 100644
--- a/drivers/virt/steal_monitor/sm_core.h
+++ b/drivers/virt/steal_monitor/sm_core.h
@@ -26,5 +26,7 @@ struct steal_monitor {
 extern struct steal_monitor sm_core_ctx;
 
 u64 get_system_steal_time(void);
+void increase_preferred_cpus(struct steal_monitor *ctx);
+void decrease_preferred_cpus(struct steal_monitor *ctx);
 
 #endif /* __VIRT_STEAL_CORE_H */
-- 
2.47.3


