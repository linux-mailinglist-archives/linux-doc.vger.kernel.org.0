Return-Path: <linux-doc+bounces-94387-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qnntIyYkRWrl7goAu9opvQ
	(envelope-from <linux-doc+bounces-94387-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 01 Jul 2026 16:28:54 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 02EF56EEBE5
	for <lists+linux-doc@lfdr.de>; Wed, 01 Jul 2026 16:28:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ibm.com header.s=pp1 header.b=EPhLRGPy;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94387-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-94387-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ibm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7F4F6314A53D
	for <lists+linux-doc@lfdr.de>; Wed,  1 Jul 2026 14:21:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D7D434405B;
	Wed,  1 Jul 2026 14:20:26 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE69933F8DC;
	Wed,  1 Jul 2026 14:20:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782915626; cv=none; b=GxmdaFGfsOoM1fPjsKKXKNG3mynIocz4OVsm+vLm9LO04yIk2TJ0w/94YT4PAY3f8AZnUmDltaPXhqAiymQAj6ZtG7lQe/hmWDn+tIAq9RoL1OxnPOgi3eYx0HAkih26xBIgrV5qBr23mejmzlW2CzJj9n1sIY/+m4epqZrLTzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782915626; c=relaxed/simple;
	bh=P89zDqT0u75Gvci3kfovt5fGP3cJXV/hF8o9S2BU3/4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tptjwz+G5miE1HXq84xrItj3fxEAgGJrXCpc8BoFNx8VCB3CCE3IAKsoJdpLHFNcGe4QhQhNdV/1JEvXIWrLvZlIjfgzppL9uajRhggtHR/qxzZ94GVuh6B1ZtqP6VjtUK4WdKE3xzklNGgxF2T+vBQIqwIQjBHb+BiSQ9B+Ii4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=EPhLRGPy; arc=none smtp.client-ip=148.163.158.5
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661AILPZ494370;
	Wed, 1 Jul 2026 14:20:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=Ks2MkHjo3rrKva+xR
	FBR62UpV0gEykX8kkNK4APUdcY=; b=EPhLRGPyYxQJocu2FHFd+7+KSJxL9D476
	uYG4mRWqWIoLiEgoz7BcyGfuKZ0+qY6CdQ3LBbuUk8B5fDVWH88p81wXFkpvy7SX
	l+PUiPHJ0jbs1K+zBE0UzW+O6Z3/zlquMQ+mW5fF1ylSvBaoGTwflILeK9MHkwUK
	WK27b2P3+NqTj4EP/sOJKgz+LZZRT0GPrqe8SJ+guTR4Ukw6pxKd5PK0TNVROTuW
	WeNtjXJInP/7NjrPRDS6cFqV42rV33zdkqw3pSQxLQoa3cB4+0erXTE1NmYroro7
	pw5pN22gSKhXarbtfANUC2QA2K1FmHWY8Ft8QFO1GyscJQqvWQbSQ==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4f26rf4h8h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 14:20:06 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 661EJaJx027955;
	Wed, 1 Jul 2026 14:20:05 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4f2ruqfub9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 14:20:05 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 661EK20Z27001586
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 1 Jul 2026 14:20:02 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DE0DC20049;
	Wed,  1 Jul 2026 14:20:01 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3B87D20040;
	Wed,  1 Jul 2026 14:19:48 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.67.14.28])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  1 Jul 2026 14:19:47 +0000 (GMT)
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
Subject: [PATCH v6 12/23] virt: Introduce steal monitor driver
Date: Wed,  1 Jul 2026 19:46:43 +0530
Message-ID: <20260701141654.500125-13-sshegde@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=a4kAM0SF c=1 sm=1 tr=0 ts=6a452217 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=V8glGbnc2Ofi9Qvn3v5h:22 a=VnNF1IyMAAAA:8 a=tbi7dcW0GDkor9mk7j8A:9
X-Proofpoint-ORIG-GUID: 0L9d1DATtL3aG2zxErwWs2I_Mr6-Vn9O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE1MCBTYWx0ZWRfX68hkzBAmW+HQ
 HkJZVOpr9VU8r96vOqQSEZDAZLPhxS+dnkrFDnjUXboDtvMDjeF3nOXkEtHn0SNjmS77Uwy8Vel
 KjaYEV3CEbAGs4ejpnXQHPaJZmYx2eVy3Xv9WMt72ZxMRzfwBAiKWsCsqYe9h+YD9aRxZ6LmDwR
 /5vVDb4kvF708gYvgjug4Hnl+Ln48yYXJC0D5HgtJmRRo5iXS9BqzOqgL6ukRkfMvxGCTp/kpn7
 /n5mO5dOWcGW4cfj8l5wDA6VPwFf5UHsOE2cXsnQk8tdK3O9zFsXDf1Fsa/25+dVm61y46d47Xr
 sqZv03nV+5lrrRLzqxWrFkw1XqgR/vTQSdkADdePzTN6BGwmpEuliawsNhrv0Xq2Wlg+nVsJOu0
 6zFkTBQYaQSQV9ZjrgQwNyKl548k42hZhPaOVFbq/dZR4K+G7skK2DosxuRa/7AS05unzTs2Ooa
 3uMRaOBxzduno9iwtdg==
X-Proofpoint-GUID: rK4Y49NUX6tEZrKu_E-TzYhtXStpuNw7
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE1MCBTYWx0ZWRfX8QAUB2jXjWC2
 sK5XwIiIIVnOrxvv6ctCqakvYPPX5+xNpoCMobQBi6ZQRaQqQWHqDDbg57N7O51E/vJTSCaB6yJ
 IaS5lbT50QD0rMisYFe1JHUrkqWpL3U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[linux.ibm.com,kernel.org,linuxfoundation.org,redhat.com,google.com,goodmis.org,arm.com,sina.com,bitbyteword.org,nvidia.com,gmail.com,infradead.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[sshegde@linux.ibm.com,linux-doc@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-94387-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linux.ibm.com:mid,linux.ibm.com:from_mime];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 02EF56EEBE5

Introduce a new driver in virt named steal_monitor. This driver
will compute the steal time and drive the policy decisions of preferred
CPU state.

More on it can be found in the Documentation/driver-api/steal-monitor.rst
Introduce the skeleton code first.

There is no new kconfig. It depends on CONFIG_PREFERRED_CPU.
- If CONFIG_PREFERRED_CPU=y, it gets compiled as a module. It is not
  loaded by default.
- If CONFIG_PREFERRED_CPU=n, module isn't compiled.

File layout of the driver is designed with having arch specific
files in the future.

- sm_core.c - contains main driver code. This includes the periodic
  work function and take action on steal time.
- defaults.c - contains the default implementation defined with __weak
  symbols.
- sm_core.h - header file which includes data structure.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 drivers/virt/Makefile                |  1 +
 drivers/virt/steal_monitor/Makefile  | 14 ++++++++++++
 drivers/virt/steal_monitor/sm_core.c | 33 ++++++++++++++++++++++++++++
 drivers/virt/steal_monitor/sm_core.h | 11 ++++++++++
 4 files changed, 59 insertions(+)
 create mode 100644 drivers/virt/steal_monitor/Makefile
 create mode 100644 drivers/virt/steal_monitor/sm_core.c
 create mode 100644 drivers/virt/steal_monitor/sm_core.h

diff --git a/drivers/virt/Makefile b/drivers/virt/Makefile
index f29901bd7820..aff715cea42d 100644
--- a/drivers/virt/Makefile
+++ b/drivers/virt/Makefile
@@ -9,4 +9,5 @@ obj-y				+= vboxguest/
 
 obj-$(CONFIG_NITRO_ENCLAVES)	+= nitro_enclaves/
 obj-$(CONFIG_ACRN_HSM)		+= acrn/
+obj-$(CONFIG_PREFERRED_CPU)	+= steal_monitor/
 obj-y				+= coco/
diff --git a/drivers/virt/steal_monitor/Makefile b/drivers/virt/steal_monitor/Makefile
new file mode 100644
index 000000000000..24cee55342ce
--- /dev/null
+++ b/drivers/virt/steal_monitor/Makefile
@@ -0,0 +1,14 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Steal time monitor to alter preferred CPU state.
+#
+# Arch can implement strong function definitions and override the
+# default by adding them in arch specific file. It must ensure
+# that preferred is always subset of active.
+#
+# It is always compiled as module if CONFIG_PREFERRED_CPU=y
+# One has to enable the module.
+#
+obj-$(subst y,m,$(CONFIG_PREFERRED_CPU)) += steal_monitor.o
+
+steal_monitor-y := sm_core.o
diff --git a/drivers/virt/steal_monitor/sm_core.c b/drivers/virt/steal_monitor/sm_core.c
new file mode 100644
index 000000000000..e320559c6576
--- /dev/null
+++ b/drivers/virt/steal_monitor/sm_core.c
@@ -0,0 +1,33 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Steal time Monitor.
+ *
+ * Periodically compute steal time. Based on the thresholds either
+ * reduce/increase the preferred CPUs which can be made use
+ * by the workload to avoid vCPU preemption to an extent possible.
+ *
+ * Available as module with CONFIG_PREFERRED_CPU=y
+ *
+ * Copyright (C) 2026 IBM
+ * Author: Shrikanth Hegde <sshegde@linux.ibm.com>
+ */
+
+#include "sm_core.h"
+
+static int __init steal_monitor_init(void)
+{
+	pr_info("steal_monitor is enabled\n");
+	return 0;
+}
+
+static void __exit steal_monitor_exit(void)
+{
+	pr_info("steal_monitor is disabled\n");
+}
+
+module_init(steal_monitor_init);
+module_exit(steal_monitor_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("IBM Corporation");
+MODULE_DESCRIPTION("Virtualization Steal Time Monitor");
diff --git a/drivers/virt/steal_monitor/sm_core.h b/drivers/virt/steal_monitor/sm_core.h
new file mode 100644
index 000000000000..684a258526e1
--- /dev/null
+++ b/drivers/virt/steal_monitor/sm_core.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __VIRT_STEAL_CORE_H
+#define __VIRT_STEAL_CORE_H
+
+#include <linux/types.h>
+
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/init.h>
+
+#endif /* __VIRT_STEAL_CORE_H */
-- 
2.47.3


