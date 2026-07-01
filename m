Return-Path: <linux-doc+bounces-94380-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9PX7KqslRWo77woAu9opvQ
	(envelope-from <linux-doc+bounces-94380-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 01 Jul 2026 16:35:23 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A28AD6EED07
	for <lists+linux-doc@lfdr.de>; Wed, 01 Jul 2026 16:35:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ibm.com header.s=pp1 header.b=fFHzDH2t;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94380-lists+linux-doc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-doc+bounces-94380-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ibm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 218C930779C7
	for <lists+linux-doc@lfdr.de>; Wed,  1 Jul 2026 14:20:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E6B3342539;
	Wed,  1 Jul 2026 14:19:02 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3133A341062;
	Wed,  1 Jul 2026 14:19:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782915542; cv=none; b=WbWhG6izROOi4qm7tugGQ7Q/PqUrVB24NfhII7K20HbYL7hJKR/eNPoDSXflk1jzshuGGtCoCs3P52n7GPZTMiofp2sFu19Eb028X/ZXkhAPgMhJ6cYyifXMjfkJOp+voMvLuOGzM0PPiRbvlTiB80jFD2YSiTQwwTc2ms7Md6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782915542; c=relaxed/simple;
	bh=pn+3WjIPG+7ViZW/AZz7ySbvUxTpMlxAauZA6qykL4Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jxcMjkBzsa+NHwP7Bvh/sK7VjurFdcKcBh87V1tb4/lafY0xzYHNU+8FBtoCcSi3nl+ZiuejdD8I9viiFLv3zvEGWIeOZM9SnqE7si/FJLlGuZLd8l4RdMMB1pjtc356OIpGVuM/PY4rw8aY2McWP5ZZgxHh76VDeN7TUWfgIIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=fFHzDH2t; arc=none smtp.client-ip=148.163.156.1
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661AIJB0609031;
	Wed, 1 Jul 2026 14:18:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=UXV/eSKGa5aQtijEl
	3e+jl1h4lTtv39SC8x0cPC2feY=; b=fFHzDH2t0l7vix0OCbXZPNfNlKxSXzR3d
	cK+mr3WMCiFmjw/hL4jdKKTCGYf6hsICasZcJRr493ZuxJPB6sw3+HGj6TDVGdG5
	9kgh9Vu9hNWX8NBXivbnAKycnnnNAVaNJWrTDdkBW9UEHXiPFsjB8rbUH9oV4SlF
	GKVM0g4+DQIZ1gvsu04UBic8Qud8Qt6GVK+Bht69rZSc0OPQF03aDhDq56wYHS5D
	4yQ65OJ4KXIcmKA1m8q+CNPquregbHaVIAaYkS69znxIiMaPlO95jGiH82oBFVwt
	x0lkgJA+xcsiCHMnU2Ch50q2N3yx/nvg+W7djWsNAvClUrrtKwsXQ==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4f26pe5052-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 14:18:43 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 661E4gUE021406;
	Wed, 1 Jul 2026 14:18:42 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4f2s7w7qu0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 14:18:42 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 661EIbqH16843178
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 1 Jul 2026 14:18:38 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CBFAD20040;
	Wed,  1 Jul 2026 14:18:37 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B12CC2004D;
	Wed,  1 Jul 2026 14:18:24 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.67.14.28])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  1 Jul 2026 14:18:24 +0000 (GMT)
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
Subject: [PATCH v6 06/23] sched/fair: Load balance only among preferred CPUs
Date: Wed,  1 Jul 2026 19:46:37 +0530
Message-ID: <20260701141654.500125-7-sshegde@linux.ibm.com>
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
X-Proofpoint-GUID: Q_wBDq13sEbeR9TRfbHNfzjtPc9PlIvZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE1MCBTYWx0ZWRfX0dSzlZTmHaMU
 Ib+6Fs86r+R6z8WDaI5HcVbq+hk6U8CJ8onPqZh5O60l0SlM7src6RBYTlPv7c4IZEkjjnKQC7H
 FJBGq7s4JQhbN/i+FYyNmRNU5UahjBs=
X-Authority-Analysis: v=2.4 cv=edsNubEH c=1 sm=1 tr=0 ts=6a4521c4 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VnNF1IyMAAAA:8 a=5ICBfrR2l7P1yX5hQRsA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE1MCBTYWx0ZWRfX22AYtszHWYVi
 ZCifvINGEE148qg4j7bbJRiYs9jLf3mnzEnwNVHQcvO4IeBKe4QXD4QSwyPsTCvPtGrDqTLz0hB
 kdW1IGKAkzjR0p4wIPZWF/AMqisQoE4hV4PDUr4SMeYM5ZYpkZFZk+/eglSi7df2eRrpWN9XUv4
 wID/awMZJjH1wNOLLo5/1v7pnKAmg49Vjom+mMO5pQyypwzG71JT5wHVGoMQgTT0oVTYvmiYavC
 1SCouqecb8cEVbHsbWOrF2/X+hL4PQHzH1agDbDEZuZZTXk//kChgyAEdE33Wj1HZdoMBArCdMO
 WDUetgDKHZ9si4F0hbHZmfgP/x12GL8sAdEEQ/Ez24VWfDfCIyPEtTTFvwAJqWV8AlkjHAimUJ0
 GGYuqWlqjHcUF3oGwTboeStw2lSb6jK68EIZrJ8oJ1Q++P2HbJHfc9vm3qvOQkN3IYP6x/tNPNO
 ScVEnnrYT34X5iDZ30Q==
X-Proofpoint-ORIG-GUID: 163oTwniMVyMkM8qD1NYSlos8OqDfngN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0 bulkscore=0
 spamscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[linux.ibm.com,kernel.org,linuxfoundation.org,redhat.com,google.com,goodmis.org,arm.com,sina.com,bitbyteword.org,nvidia.com,gmail.com,infradead.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[sshegde@linux.ibm.com,linux-doc@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-94380-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid,linux.ibm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A28AD6EED07

Consider only preferred CPUs for load balance.

With this, load balance will end up choosing a preferred CPUs for pull.
This makes it not fight against the push task mechanism which happens
at tick. Also, this stops active balance to happen on non-preferred CPU
pulling the load.

This means there is no load balancing if the task is pinned only to
non-preferred CPUs. They will continue to run where they were previously
running before the CPUs was marked as non-preferred.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 kernel/sched/fair.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index ce05acf52d35..9b2931b559d6 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -13391,7 +13391,8 @@ static int sched_balance_rq(int this_cpu, struct rq *this_rq,
 	};
 	bool need_unlock = false;
 
-	cpumask_and(cpus, sched_domain_span(sd), cpu_active_mask);
+	/* Spread load among preferred CPUs */
+	cpumask_and(cpus, sched_domain_span(sd), cpu_preferred_mask);
 
 	schedstat_inc(sd->lb_count[idle]);
 
-- 
2.47.3


