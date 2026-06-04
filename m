Return-Path: <linux-doc+bounces-90885-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wKmDEMMvIWpKAQEAu9opvQ
	(envelope-from <linux-doc+bounces-90885-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 04 Jun 2026 09:56:51 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A4363DCBF
	for <lists+linux-doc@lfdr.de>; Thu, 04 Jun 2026 09:56:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=huawei.com header.s=dkim header.b=knSCBs2Q;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-90885-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-90885-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=huawei.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C3EFD307D318
	for <lists+linux-doc@lfdr.de>; Thu,  4 Jun 2026 07:50:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D59DD3E009C;
	Thu,  4 Jun 2026 07:50:16 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from canpmsgout12.his.huawei.com (canpmsgout12.his.huawei.com [113.46.200.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1BD713D886;
	Thu,  4 Jun 2026 07:50:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780559416; cv=none; b=FQHRriEHa6cgg+OrIcVaXK3zLC+9xyMDc0BAMdeV+eQ+HnJzGTTK3LxS5stAhhGOZ2OWu70/mVWE1NFdr32JsnJ9r/Shtwy/PKrnsSNdCImU1A82uvXGcet8VmFzbu+Le58tAOic/fWqQCPq0nhghf0uCr0xhjCUeOkV6bpe/sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780559416; c=relaxed/simple;
	bh=7ygI4Q9f2BRqbBfETY59Y6aBCjkFRgbKUqQZNV40UrU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dMhEuj6ZLUSKX+ICJ9Ma+mRI3oqruTMSBP0ugUeMgLYEQF6qEZCFRNBuc7f6YTGHSJIuzxPakl5dCNEOk9Zel+Gf4CwOlUrVIPxJ/cX1VUZFrw187VItVcgEHfY15bbOUSeDq6aMohc+cty9IuuvSMbbK5zbGGzs/2+FhRLqVKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=knSCBs2Q; arc=none smtp.client-ip=113.46.200.227
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Ato99urV+TJI9keJXJxq4w1QU/DPwW65iRUxfGjeLIg=;
	b=knSCBs2QrywHvIxahoy+tlt1DC5xIp19y612n7v380yC5+Djn/8DqZmAY0yc2ZarA3P5BXXds
	5MNCI0LSYI7kd2W6fBhxeYbEL5IrMBRQoiv/j2D0gM373E2Hzzb9CLLxGlSZXxU6YKWyBYitJjn
	zw89k4odiC86Mx0vzw2VyWo=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4gWGk33RWBznTZ3;
	Thu,  4 Jun 2026 15:42:19 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 1086840565;
	Thu,  4 Jun 2026 15:50:12 +0800 (CST)
Received: from kwepemn200012.china.huawei.com (7.202.194.135) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 4 Jun 2026 15:50:11 +0800
Received: from huawei.com (10.50.163.32) by kwepemn200012.china.huawei.com
 (7.202.194.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 4 Jun
 2026 15:50:10 +0800
From: Sizhe Liu <liusizhe5@huawei.com>
To: <rostedt@goodmis.org>, <mhiramat@kernel.org>,
	<mathieu.desnoyers@efficios.com>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <bhelgaas@google.com>, <yangyccccc@gmail.com>,
	<jic23@kernel.org>, <john.g.garry@oracle.com>, <will@kernel.org>,
	<james.clark@linaro.org>, <mike.leach@arm.com>, <leo.yan@linux.dev>,
	<peterz@infradead.org>, <mingo@redhat.com>, <acme@kernel.org>,
	<namhyung@kernel.org>, <mark.rutland@arm.com>,
	<alexander.shishkin@linux.intel.com>, <jolsa@kernel.org>,
	<irogers@google.com>, <adrian.hunter@intel.com>, <wangyushan12@huawei.com>,
	<shenyang39@huawei.com>, <gaozhihao6@h-partners.com>,
	<yuzhichengcheng@h-partners.com>, <liyihang9@h-partners.com>
CC: <linux-kernel@vger.kernel.org>, <linux-pci@vger.kernel.org>,
	<linux-perf-users@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-doc@vger.kernel.org>, <linuxarm@huawei.com>,
	<prime.zeng@hisilicon.com>, <fanghao11@huawei.com>, <wuyifan50@huawei.com>,
	<liusizhe5@huawei.com>
Subject: [PATCH 05/10] perf hisi-ptt: Complete the field names for 4DW and 8DW packets
Date: Thu, 4 Jun 2026 15:50:00 +0800
Message-ID: <20260604075005.2219785-6-liusizhe5@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20260604075005.2219785-1-liusizhe5@huawei.com>
References: <20260604075005.2219785-1-liusizhe5@huawei.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemn200012.china.huawei.com (7.202.194.135)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[huawei.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[huawei.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:bhelgaas@google.com,m:yangyccccc@gmail.com,m:jic23@kernel.org,m:john.g.garry@oracle.com,m:will@kernel.org,m:james.clark@linaro.org,m:mike.leach@arm.com,m:leo.yan@linux.dev,m:peterz@infradead.org,m:mingo@redhat.com,m:acme@kernel.org,m:namhyung@kernel.org,m:mark.rutland@arm.com,m:alexander.shishkin@linux.intel.com,m:jolsa@kernel.org,m:irogers@google.com,m:adrian.hunter@intel.com,m:wangyushan12@huawei.com,m:shenyang39@huawei.com,m:gaozhihao6@h-partners.com,m:yuzhichengcheng@h-partners.com,m:liyihang9@h-partners.com,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-perf-users@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-doc@vger.kernel.org,m:linuxarm@huawei.com,m:prime.zeng@hisilicon.com,m:fanghao11@huawei.com,m:wuyifan50@huawei.com,m:liusizhe5@huawei.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-90885-lists,linux-doc=lfdr.de];
	FORGED_SENDER(0.00)[liusizhe5@huawei.com,linux-doc@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[goodmis.org,kernel.org,efficios.com,lwn.net,linuxfoundation.org,google.com,gmail.com,oracle.com,linaro.org,arm.com,linux.dev,infradead.org,redhat.com,linux.intel.com,intel.com,huawei.com,h-partners.com];
	DKIM_TRACE(0.00)[huawei.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[37];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[liusizhe5@huawei.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[huawei.com:mid,huawei.com:dkim,huawei.com:from_mime,huawei.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 92A4363DCBF

Add the missing HISI_PTT_4DW_HEAD0 entry to the 4DW field name table
and add the HISI_PTT_8DW_CHK_AND_RSV0/HISI_PTT_8DW_RSV1 entries to
the 8DW field name table so that all DW indices have corresponding
names.
Replace the variable in the printing loop with enum members.

8DW format is like:
bits [                 31:11                 ][       10:0       ]
     |---------------------------------------|-------------------|
 DW0 [                0x1fffff               ][ Reserved (0x7ff) ]
 DW1 [                       Prefix                              ]
 DW2 [                     Header DW0                            ]
 DW3 [                     Header DW1                            ]
 DW4 [                     Header DW2                            ]
 DW5 [                     Header DW3                            ]
 DW6 [                   Reserved (0x0)                          ]
 DW7 [                        Time                               ]

Signed-off-by: Sizhe Liu <liusizhe5@huawei.com>
---
 .../hisi-ptt-decoder/hisi-ptt-pkt-decoder.c   | 21 +++++++++++--------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.c b/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.c
index 201ca948c4fb..33804bcd0642 100644
--- a/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.c
+++ b/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.c
@@ -53,6 +53,7 @@ enum hisi_ptt_8dw_pkt_field_type {
 };
 
 enum hisi_ptt_4dw_pkt_field_type {
+	HISI_PTT_4DW_HEAD0,
 	HISI_PTT_4DW_HEAD1,
 	HISI_PTT_4DW_HEAD2,
 	HISI_PTT_4DW_HEAD3,
@@ -60,15 +61,18 @@ enum hisi_ptt_4dw_pkt_field_type {
 };
 
 static const char * const hisi_ptt_8dw_pkt_field_name[] = {
-	[HISI_PTT_8DW_PREFIX]	= "Prefix",
-	[HISI_PTT_8DW_HEAD0]	= "Header DW0",
-	[HISI_PTT_8DW_HEAD1]	= "Header DW1",
-	[HISI_PTT_8DW_HEAD2]	= "Header DW2",
-	[HISI_PTT_8DW_HEAD3]	= "Header DW3",
-	[HISI_PTT_8DW_TIME]	= "Time"
+	[HISI_PTT_8DW_CHK_AND_RSV0]	= "CHK & RSV0",
+	[HISI_PTT_8DW_PREFIX]		= "Prefix",
+	[HISI_PTT_8DW_HEAD0]		= "Header DW0",
+	[HISI_PTT_8DW_HEAD1]		= "Header DW1",
+	[HISI_PTT_8DW_HEAD2]		= "Header DW2",
+	[HISI_PTT_8DW_HEAD3]		= "Header DW3",
+	[HISI_PTT_8DW_RSV1]		= "RSV1",
+	[HISI_PTT_8DW_TIME]		= "Time"
 };
 
 static const char * const hisi_ptt_4dw_pkt_field_name[] = {
+	[HISI_PTT_4DW_HEAD0]	= "Header DW0",
 	[HISI_PTT_4DW_HEAD1]	= "Header DW1",
 	[HISI_PTT_4DW_HEAD2]	= "Header DW2",
 	[HISI_PTT_4DW_HEAD3]	= "Header DW3",
@@ -114,7 +118,7 @@ static int hisi_ptt_8dw_pkt_desc(struct hisi_ptt_pkt_buf *pkt_buf)
 {
 	int i;
 
-	for (i = 0; i < HISI_PTT_8DW_TYPE_MAX; i++) {
+	for (i = HISI_PTT_8DW_CHK_AND_RSV0; i < HISI_PTT_8DW_TYPE_MAX; i++) {
 		/* Do not show 8DW check field and reserved fields */
 		if (i == HISI_PTT_8DW_CHK_AND_RSV0 || i == HISI_PTT_8DW_RSV1) {
 			pkt_buf->pos += HISI_PTT_FIELD_LENGTH;
@@ -160,9 +164,8 @@ static int hisi_ptt_4dw_pkt_desc(struct hisi_ptt_pkt_buf *pkt_buf)
 
 	hisi_ptt_4dw_print_dw0(pkt_buf);
 
-	for (i = 0; i < HISI_PTT_4DW_TYPE_MAX; i++) {
+	for (i = HISI_PTT_4DW_HEAD1; i < HISI_PTT_4DW_TYPE_MAX; i++)
 		hisi_ptt_print_pkt(pkt_buf, hisi_ptt_4dw_pkt_field_name[i]);
-	}
 
 	return hisi_ptt_pkt_size[HISI_PTT_4DW_PKT];
 }
-- 
2.33.0


