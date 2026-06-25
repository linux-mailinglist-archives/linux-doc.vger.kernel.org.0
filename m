Return-Path: <linux-doc+bounces-93526-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FdoMHMUkPWoxxwgAu9opvQ
	(envelope-from <linux-doc+bounces-93526-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jun 2026 14:53:25 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C83326C5C6D
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jun 2026 14:53:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ibm.com header.s=pp1 header.b=ICmkDoV7;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93526-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-93526-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ibm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D67D30FB363
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jun 2026 12:48:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D0063E172A;
	Thu, 25 Jun 2026 12:48:36 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698E83DDDBE;
	Thu, 25 Jun 2026 12:48:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782391716; cv=none; b=DAgba2AS/Ji/w4vwmO4fzhNYqAG8G30I7VhNb2zuIL3F0CqnuvPHz922rLfHt7r0O6vK7sj3vdFWVCDOhGPoXgANiePTH8CUpsbVxdPAWXWxUuDLWrtUqyuHjCB43RRQmPb/0CShI/e7ZdvcugJwe42UdERO6JnoQXiFFY+w65o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782391716; c=relaxed/simple;
	bh=PJG/CAHduTLSu7kZKPCw6sTHRfvv1QhGHFr9ycFKTO8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p2X+mfj9XXKxJYRvetGELuj5OR89tWvhfVxu8MpyD6dNo3dnSoYyln9/kpRbDnbd+kVXHkNxjpXYWpYNRWbWMU6YBtMx/EkiPFN05MRIEJym7DMVFVKQfGMk0pgadLcVKSPFNeYobdHHqrZPtv2ny/uTOIL+ZQbtw5EMWmKW29g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=ICmkDoV7; arc=none smtp.client-ip=148.163.156.1
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P3mOJI3040919;
	Thu, 25 Jun 2026 12:48:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=+FcXdv5mBNjxohXTU
	OzoP59Q//aM2j83bhrLygunbJs=; b=ICmkDoV71GjliFVhB+N5plmVHGw7E4x/p
	CCo++L2gw3WDsQHWUOkY4BlOA23T/vfsJLvBnwqZxY7JSuOHm60lDQnaeHqfe25K
	q5HDej/O0Xswiy2Nd75gglOwgDNQgKeI+GxdGVl/EqxPgoaqsYWYNjfjOT9skO/G
	1f8ggetv1Y60t9hZnHX/oJPieyoLNCxzPzQsuuAAQHXKwje0D4zsEegVc5fwyJIi
	4vvhJa/V7OEAMX0D7kSwLYTKpyRb2mMgd4lhUKWEb6W2BVZhMNmGGkGxbefAS6pW
	MpuhVMyPhc6r4SPoxoo5kjvWAyStW/Eh8m/I7D5W2v6I7FjkqnV1g==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ewjc3svv9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 12:48:16 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 65PCYcWH002258;
	Thu, 25 Jun 2026 12:48:15 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4ex7vywusv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 12:48:15 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 65PCmCHk17301762
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 25 Jun 2026 12:48:12 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0516A20040;
	Thu, 25 Jun 2026 12:48:12 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E020E20043;
	Thu, 25 Jun 2026 12:48:03 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.20.6])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 25 Jun 2026 12:48:03 +0000 (GMT)
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
Subject: [PATCH v5 08/24] sched/fair: load balance only among preferred CPUs
Date: Thu, 25 Jun 2026 18:16:32 +0530
Message-ID: <20260625124648.802832-9-sshegde@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=X4Ni7mTe c=1 sm=1 tr=0 ts=6a3d2391 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VnNF1IyMAAAA:8 a=5ICBfrR2l7P1yX5hQRsA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDExMCBTYWx0ZWRfXwGpN604sncuc
 7ghlMeH6e3gSBbFiA7VGCxxRcegLkONEJ58TMiCdB4xyw8BAI20u4wad3oFtueao3IayXq7Jxs6
 wUz0Y4cZ42Nt8xHV0ZktzKtJX9Yo4Qw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDExMCBTYWx0ZWRfX895vlcDJ9PKG
 G613+FS3u/7AlaqSGSG701Mk4K6JAXk0yeNQya26LLTrIvgLumkkKH9X3u7ujSEnVia2UJ6mSh2
 eUw9iXep7adjjkyTrs94n5+F81/wYyGdZeeLU63E6xctjGYUOg84Sw7Aohon6fYLs+g1MsNYahC
 XEW+TBcu8QzkcBTdXvdY5xtyrCJGDXPFV5OOkao+/nDiQMPJfkGGKH3L2Wb5efErjcv5nVWO7MH
 M8AKUKAyhnSLn0V94jXC4QVorb9lFRU9I5tHJxlkpvhTBWgtG7keWU5NV0ZWzgXS+wxuIRxh2GY
 dNEHkt+F498hRxvMtjJr+YMCuwWqGgCcR+lZgd9JNqzB7TowFqx79DaX+aWKYymzpnfjcKAz6f4
 NBKDZrlf1fduTNYmEE35sjxX0aZ1A6xZVoSzz7+8ZVdoKxNQ+UaeUMI8JiT+sK6hM1+gRPZrV5N
 m5Y99J+cC2axofRFusw==
X-Proofpoint-ORIG-GUID: QyWcO4AWMQV3mMgZIicumcBp-Sz6eLNi
X-Proofpoint-GUID: iaQXZf-nY5cKjg1SDKufp2ANa00OkZuz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
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
	TAGGED_FROM(0.00)[bounces-93526-lists,linux-doc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,linux.ibm.com:mid,linux.ibm.com:from_mime];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C83326C5C6D

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
v4->v5:
- Remove previous cpumask_and (K Prateek Nayak)

 kernel/sched/fair.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index d78467ec6ee1..44a0d9736b67 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -13289,7 +13289,8 @@ static int sched_balance_rq(int this_cpu, struct rq *this_rq,
 	};
 	bool need_unlock = false;
 
-	cpumask_and(cpus, sched_domain_span(sd), cpu_active_mask);
+	/* Spread load among preferred CPUs */
+	cpumask_and(cpus, sched_domain_span(sd), cpu_preferred_mask);
 
 	schedstat_inc(sd->lb_count[idle]);
 
-- 
2.47.3


