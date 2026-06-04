Return-Path: <linux-doc+bounces-90884-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3kmSDBEwIWpYAQEAu9opvQ
	(envelope-from <linux-doc+bounces-90884-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 04 Jun 2026 09:58:09 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C422863DCD3
	for <lists+linux-doc@lfdr.de>; Thu, 04 Jun 2026 09:58:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=huawei.com header.s=dkim header.b=rYmGZPSE;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-90884-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-90884-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=huawei.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1C60A304E41D
	for <lists+linux-doc@lfdr.de>; Thu,  4 Jun 2026 07:50:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26EE53DFC7D;
	Thu,  4 Jun 2026 07:50:16 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from canpmsgout12.his.huawei.com (canpmsgout12.his.huawei.com [113.46.200.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356DBCA45;
	Thu,  4 Jun 2026 07:50:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780559415; cv=none; b=BdE6hChZtjbtPqoq+NA+CMuAYJDaEcVloZnhlQLYU4Whyj4K6VnrlF/odq0zvOFCMc7K0ZEZkc8hN+/a6ZbS6ok4LOMCpFyTvW0+CvLxJVyUkLx4CGbKGDgzX1xBwMtRdq5pGNVzN9YcCb4srhrtNlWOSMZI9vW//QZ5wMn7ZLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780559415; c=relaxed/simple;
	bh=Xi6jLInEcETVU5w4SaocDXndF2bqdv5LK+f5Mt49hbc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n1kZLLcQW1NigutFDqr+ynIF9TVt5E37zkjHsj4oEXBWteWIvbDUnqErJNiTnrrXwM5YJ16DTv5elx8yeC8EmPl0P3rGc6lI4BH5Vg8ih9lxkirvnpX6vaokO8GKGZ5DDV/aWK0KowE8ZaCP7P/Mt47Tq/SANpLxYDrYs1PyYMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=rYmGZPSE; arc=none smtp.client-ip=113.46.200.227
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=b539C+AawPNqTUMTRaV+ozcrDgitM+hGFWLgyJ7L8wc=;
	b=rYmGZPSEvc1o55e0ayzpTaHAV3hJcI8qHt0pXiNu26au/R27FzaE4egOodIf4xP/fpjWAXTAr
	USf31VnVXyQvuClXD+dFpSFLdgEtX31GohzHk2bxQQORsnKynDljKsAZatZMsWIJ4izGpRa9ZPG
	d+n0A4aVfZ6Uz86n8yjI1Io=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4gWGk13jKbznTbR;
	Thu,  4 Jun 2026 15:42:17 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 1D86B4055B;
	Thu,  4 Jun 2026 15:50:10 +0800 (CST)
Received: from kwepemn200012.china.huawei.com (7.202.194.135) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 4 Jun 2026 15:50:09 +0800
Received: from huawei.com (10.50.163.32) by kwepemn200012.china.huawei.com
 (7.202.194.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 4 Jun
 2026 15:50:08 +0800
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
Subject: [PATCH 03/10] perf hisi-ptt: Rename hisi_ptt_4dw union for reuse
Date: Thu, 4 Jun 2026 15:49:58 +0800
Message-ID: <20260604075005.2219785-4-liusizhe5@huawei.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[huawei.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:bhelgaas@google.com,m:yangyccccc@gmail.com,m:jic23@kernel.org,m:john.g.garry@oracle.com,m:will@kernel.org,m:james.clark@linaro.org,m:mike.leach@arm.com,m:leo.yan@linux.dev,m:peterz@infradead.org,m:mingo@redhat.com,m:acme@kernel.org,m:namhyung@kernel.org,m:mark.rutland@arm.com,m:alexander.shishkin@linux.intel.com,m:jolsa@kernel.org,m:irogers@google.com,m:adrian.hunter@intel.com,m:wangyushan12@huawei.com,m:shenyang39@huawei.com,m:gaozhihao6@h-partners.com,m:yuzhichengcheng@h-partners.com,m:liyihang9@h-partners.com,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-perf-users@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-doc@vger.kernel.org,m:linuxarm@huawei.com,m:prime.zeng@hisilicon.com,m:fanghao11@huawei.com,m:wuyifan50@huawei.com,m:liusizhe5@huawei.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-90884-lists,linux-doc=lfdr.de];
	FORGED_SENDER(0.00)[liusizhe5@huawei.com,linux-doc@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[goodmis.org,kernel.org,efficios.com,lwn.net,linuxfoundation.org,google.com,gmail.com,oracle.com,linaro.org,arm.com,linux.dev,infradead.org,redhat.com,linux.intel.com,intel.com,huawei.com,h-partners.com];
	DKIM_TRACE(0.00)[huawei.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: C422863DCD3

Rename union hisi_ptt_4dw to hisi_ptt_field_data so that it can hold
bit field layouts for different DW headers. Add the struct member name
dw0_4dw to indicate that the inner struct is for 4DW format DW0.

Signed-off-by: Sizhe Liu <liusizhe5@huawei.com>
---
 .../hisi-ptt-decoder/hisi-ptt-pkt-decoder.c    | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.c b/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.c
index 67024f18ebbb..5daae2eaf435 100644
--- a/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.c
+++ b/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.c
@@ -74,7 +74,8 @@ static const char * const hisi_ptt_4dw_pkt_field_name[] = {
 	[HISI_PTT_4DW_HEAD3]	= "Header DW3",
 };
 
-union hisi_ptt_4dw {
+union hisi_ptt_field_data {
+	/* Header DW0 for 4DW format */
 	struct {
 		uint32_t time : 11;
 		uint32_t len : 10;
@@ -84,7 +85,7 @@ union hisi_ptt_4dw {
 		uint32_t t9 : 1;
 		uint32_t type : 5;
 		uint32_t format : 2;
-	};
+	} dw0_4dw;
 	uint32_t value;
 };
 
@@ -128,15 +129,15 @@ static int hisi_ptt_8dw_pkt_desc(const unsigned char *buf, int pos)
 static void hisi_ptt_4dw_print_dw0(const unsigned char *buf, int pos)
 {
 	const char *color = PERF_COLOR_BLUE;
-	union hisi_ptt_4dw dw0;
+	union hisi_ptt_field_data dw;
 	uint8_t byte;
 	int i;
 
-	dw0.value = le32_to_cpu(*(__le32 *)(buf + pos));
+	dw.value = le32_to_cpu(*(__le32 *)(buf + pos));
 	printf(".");
 	color_fprintf(stdout, color, "  %08x: ", pos);
 	for (i = 0; i < HISI_PTT_FIELD_LENGTH; i++) {
-		byte = (dw0.value >> (24 - i * 8)) & 0xFF;
+		byte = (dw.value >> (24 - i * 8)) & 0xFF;
 		color_fprintf(stdout, color, "%02x ", byte);
 	}
 	for (i = 0; i < HISI_PTT_MAX_SPACE_LEN; i++)
@@ -144,9 +145,10 @@ static void hisi_ptt_4dw_print_dw0(const unsigned char *buf, int pos)
 
 	color_fprintf(stdout, color,
 		      "  %s %x %s %x %s %x %s %x %s %x %s %x %s %x %s %x\n",
-		      "Format", dw0.format, "Type", dw0.type, "T9", dw0.t9,
-		      "T8", dw0.t8, "TH", dw0.th, "SO", dw0.so, "Length",
-		      dw0.len, "Time", dw0.time);
+		      "Format", dw.dw0_4dw.format, "Type", dw.dw0_4dw.type,
+		      "T9", dw.dw0_4dw.t9, "T8", dw.dw0_4dw.t8,
+		      "TH", dw.dw0_4dw.th, "SO", dw.dw0_4dw.so,
+		      "Length", dw.dw0_4dw.len, "Time", dw.dw0_4dw.time);
 }
 
 static int hisi_ptt_4dw_pkt_desc(const unsigned char *buf, int pos)
-- 
2.33.0


