Return-Path: <linux-doc+bounces-90892-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 92N1NbAvIWpCAQEAu9opvQ
	(envelope-from <linux-doc+bounces-90892-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 04 Jun 2026 09:56:32 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDF263DCAD
	for <lists+linux-doc@lfdr.de>; Thu, 04 Jun 2026 09:56:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=huawei.com header.s=dkim header.b=fBAgDHAp;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-90892-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-90892-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=huawei.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 19756306131D
	for <lists+linux-doc@lfdr.de>; Thu,  4 Jun 2026 07:51:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5083E3ED135;
	Thu,  4 Jun 2026 07:50:24 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from canpmsgout11.his.huawei.com (canpmsgout11.his.huawei.com [113.46.200.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587613E557F;
	Thu,  4 Jun 2026 07:50:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780559424; cv=none; b=EH0YQxoPo9yye83TFzN+l1ZM8VdxwEA2hPJULY/Lg7Sk3aDsi+kbek/pyvwEIYJh0SB2jbtJdirA81xYnM5eSFS/WGdzIBgAN7CWimmWnu1Yy1AXd6P9YGGujIw+UXp5XN57QyXtfHgzCXEGPgem8IpowAuEAONrsT0/FQ1VV8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780559424; c=relaxed/simple;
	bh=eBl7APe5jVZi7hoPd7kvqsAHdY+d01qiMcr5hmb5kgE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GzqswCoMT4sdL3Y6lMEGmnTxcrbFJwlrpXllkQ3dcMB7igkPua+OUJ4cDsdWHcqYIZdLgmZi5NQVKpj2zSAG0fwPGPf49qCtGIhivrB/A0pXU/tgvUa5hdNdyjOM2J5N/fxa0MEUQdP8U+cBSVU5gyiyIyeIB939Sw667snXnuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=fBAgDHAp; arc=none smtp.client-ip=113.46.200.226
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=KCmlyUAoK/yHveusUi6OJxnEgjrVkZLbwQEppi6gKxM=;
	b=fBAgDHApSydyIm9IrNbVHVRassbBcy5cDEsGBBor5twX6mUu2BgcUTbf+dAisAqBMatksZCj6
	T5Q8LaP+ikQqELdVxa5dD3javmt8Ua9x06oCTU5IpnmL/MJApzaVAvdVIgu8VbXxRT7x4KNMdGs
	utWEFfXKdP4WPVlJzhkVXW4=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4gWGk416xVzKmTk;
	Thu,  4 Jun 2026 15:42:20 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 26D1940565;
	Thu,  4 Jun 2026 15:50:13 +0800 (CST)
Received: from kwepemn200012.china.huawei.com (7.202.194.135) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 4 Jun 2026 15:50:12 +0800
Received: from huawei.com (10.50.163.32) by kwepemn200012.china.huawei.com
 (7.202.194.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 4 Jun
 2026 15:50:11 +0800
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
Subject: [PATCH 06/10] perf hisi-ptt: Extract the raw data printing part
Date: Thu, 4 Jun 2026 15:50:01 +0800
Message-ID: <20260604075005.2219785-7-liusizhe5@huawei.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[huawei.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:bhelgaas@google.com,m:yangyccccc@gmail.com,m:jic23@kernel.org,m:john.g.garry@oracle.com,m:will@kernel.org,m:james.clark@linaro.org,m:mike.leach@arm.com,m:leo.yan@linux.dev,m:peterz@infradead.org,m:mingo@redhat.com,m:acme@kernel.org,m:namhyung@kernel.org,m:mark.rutland@arm.com,m:alexander.shishkin@linux.intel.com,m:jolsa@kernel.org,m:irogers@google.com,m:adrian.hunter@intel.com,m:wangyushan12@huawei.com,m:shenyang39@huawei.com,m:gaozhihao6@h-partners.com,m:yuzhichengcheng@h-partners.com,m:liyihang9@h-partners.com,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-perf-users@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-doc@vger.kernel.org,m:linuxarm@huawei.com,m:prime.zeng@hisilicon.com,m:fanghao11@huawei.com,m:wuyifan50@huawei.com,m:liusizhe5@huawei.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-90892-lists,linux-doc=lfdr.de];
	FORGED_SENDER(0.00)[liusizhe5@huawei.com,linux-doc@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[goodmis.org,kernel.org,efficios.com,lwn.net,linuxfoundation.org,google.com,gmail.com,oracle.com,linaro.org,arm.com,linux.dev,infradead.org,redhat.com,linux.intel.com,intel.com,huawei.com,h-partners.com];
	DKIM_TRACE(0.00)[huawei.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[37];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[liusizhe5@huawei.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[huawei.com:mid,huawei.com:dkim,huawei.com:from_mime,huawei.com:email,vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DCDF263DCAD

Extract the raw data printing part of the TLP header into
hisi_ptt_print_raw_record() for reuse by subsequent patches that
add field-level parsing of individual DW headers.

Signed-off-by: Sizhe Liu <liusizhe5@huawei.com>
---
 .../hisi-ptt-decoder/hisi-ptt-pkt-decoder.c   | 29 +++++++++----------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.c b/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.c
index 33804bcd0642..a5b66e0f7827 100644
--- a/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.c
+++ b/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.c
@@ -93,23 +93,31 @@ union hisi_ptt_field_data {
 	uint32_t value;
 };
 
-static void hisi_ptt_print_pkt(struct hisi_ptt_pkt_buf *pkt_buf,
-			       const char *desc)
+static void hisi_ptt_print_raw_record(size_t offset, uint32_t value)
 {
 	const char *color = PERF_COLOR_BLUE;
-	uint32_t value;
 	uint8_t byte;
 	int i;
 
-	value = le32_to_cpu(*(__le32 *)(pkt_buf->buf + pkt_buf->pos));
 	printf(".");
-	color_fprintf(stdout, color, "  %08zx: ", pkt_buf->pos);
+	color_fprintf(stdout, color, "  %08zx: ", offset);
 	for (i = 0; i < HISI_PTT_FIELD_LENGTH; i++) {
 		byte = (value >> (24 - i * 8)) & 0xFF;
 		color_fprintf(stdout, color, "%02x ", byte);
 	}
 	for (i = 0; i < HISI_PTT_MAX_SPACE_LEN; i++)
 		color_fprintf(stdout, color, "   ");
+}
+
+static void hisi_ptt_print_pkt(struct hisi_ptt_pkt_buf *pkt_buf,
+			       const char *desc)
+{
+	const char *color = PERF_COLOR_BLUE;
+	uint32_t value;
+
+	value = le32_to_cpu(*(__le32 *)(pkt_buf->buf + pkt_buf->pos));
+	hisi_ptt_print_raw_record(pkt_buf->pos, value);
+
 	color_fprintf(stdout, color, "  %s\n", desc);
 	pkt_buf->pos += HISI_PTT_FIELD_LENGTH;
 }
@@ -135,18 +143,9 @@ static void hisi_ptt_4dw_print_dw0(struct hisi_ptt_pkt_buf *pkt_buf)
 {
 	const char *color = PERF_COLOR_BLUE;
 	union hisi_ptt_field_data dw;
-	uint8_t byte;
-	int i;
 
 	dw.value = le32_to_cpu(*(__le32 *)(pkt_buf->buf + pkt_buf->pos));
-	printf(".");
-	color_fprintf(stdout, color, "  %08zx: ", pkt_buf->pos);
-	for (i = 0; i < HISI_PTT_FIELD_LENGTH; i++) {
-		byte = (dw.value >> (24 - i * 8)) & 0xFF;
-		color_fprintf(stdout, color, "%02x ", byte);
-	}
-	for (i = 0; i < HISI_PTT_MAX_SPACE_LEN; i++)
-		color_fprintf(stdout, color, "   ");
+	hisi_ptt_print_raw_record(pkt_buf->pos, dw.value);
 
 	color_fprintf(stdout, color,
 		      "  %s %x %s %x %s %x %s %x %s %x %s %x %s %x %s %x\n",
-- 
2.33.0


