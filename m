Return-Path: <linux-doc+bounces-90886-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WYHoArguIWrzAAEAu9opvQ
	(envelope-from <linux-doc+bounces-90886-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 04 Jun 2026 09:52:24 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC6063DC35
	for <lists+linux-doc@lfdr.de>; Thu, 04 Jun 2026 09:52:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=huawei.com header.s=dkim header.b=ZB2LJn4Y;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-90886-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-90886-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=huawei.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1C8CD3028483
	for <lists+linux-doc@lfdr.de>; Thu,  4 Jun 2026 07:50:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D9E93E022D;
	Thu,  4 Jun 2026 07:50:17 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from canpmsgout07.his.huawei.com (canpmsgout07.his.huawei.com [113.46.200.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB82B369D7A;
	Thu,  4 Jun 2026 07:50:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780559416; cv=none; b=WocybAeNzNeYSXSYOskf0l7XHjSUp/KkcmN2CSB0WdjjOKImi4Lc5lysu3CorwCUVagb5upuKG4hbq9WvtIuI0+Dp2xVjZ+QtPFLTXQJ4xpg4yHA/tpFIUA11zMf4ZqBZF/NhcpLYjKZ1qlzwFhi48BBRsv6aho63lqtI7xNUQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780559416; c=relaxed/simple;
	bh=D1yC5i7+02JAjldctHFsWB5ABSgISt5vlM1Tm6yIzfQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c7s247aajNaPjrgytlgPcOoLMD6pJ2D8n3pSKhLefT+DIDrYAWxCIFC272Io7FQVCOqmGjItYwy+gj/YLCryB6cC0rZsdkKmJ/Ii8JPkFBm1ztujLm5TnQqYtbnozXjyUgJWTGNG2XHZqSU3gk4hlOmSDgLBpvp1JxbnCGVRoeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=ZB2LJn4Y; arc=none smtp.client-ip=113.46.200.222
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=55jJZ4b6FSuLirTwSnzlWie3FXn/0XRNBJg5K5NHKg4=;
	b=ZB2LJn4YFeV80oHV762/e+OONkYFYD1eOfWhFoUtuv1IkW/vatj2/qd0acsc3xthVj0/QNOti
	5MYR0y+k2+dcgryJqQ6f5AeZqz7cLeynIY4/o0LICpEb45m963U6aBuNoMU2c9BHiqt4OOLffKH
	nT6kqwBLAiBLgyCSSG/bUB8=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4gWGk46r9PzLlTV;
	Thu,  4 Jun 2026 15:42:20 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 196634055B;
	Thu,  4 Jun 2026 15:50:11 +0800 (CST)
Received: from kwepemn200012.china.huawei.com (7.202.194.135) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 4 Jun 2026 15:50:10 +0800
Received: from huawei.com (10.50.163.32) by kwepemn200012.china.huawei.com
 (7.202.194.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 4 Jun
 2026 15:50:09 +0800
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
Subject: [PATCH 04/10] perf hisi-ptt: Abstract trace data buf and offset
Date: Thu, 4 Jun 2026 15:49:59 +0800
Message-ID: <20260604075005.2219785-5-liusizhe5@huawei.com>
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
	TAGGED_FROM(0.00)[bounces-90886-lists,linux-doc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,huawei.com:mid,huawei.com:dkim,huawei.com:from_mime,huawei.com:email];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0DC6063DC35

Abstract the base address, current offset, length and packet type of
analysing trace data into structure hisi_ptt_pkt_buf and move the step
of current offset into the corresponding function.

Signed-off-by: Sizhe Liu <liusizhe5@huawei.com>
---
 .../hisi-ptt-decoder/hisi-ptt-pkt-decoder.c   | 39 ++++++++++---------
 .../hisi-ptt-decoder/hisi-ptt-pkt-decoder.h   |  9 ++++-
 tools/perf/util/hisi-ptt.c                    | 20 ++++------
 3 files changed, 36 insertions(+), 32 deletions(-)

diff --git a/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.c b/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.c
index 5daae2eaf435..201ca948c4fb 100644
--- a/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.c
+++ b/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.c
@@ -89,16 +89,17 @@ union hisi_ptt_field_data {
 	uint32_t value;
 };
 
-static void hisi_ptt_print_pkt(const unsigned char *buf, int pos, const char *desc)
+static void hisi_ptt_print_pkt(struct hisi_ptt_pkt_buf *pkt_buf,
+			       const char *desc)
 {
 	const char *color = PERF_COLOR_BLUE;
 	uint32_t value;
 	uint8_t byte;
 	int i;
 
-	value = le32_to_cpu(*(__le32 *)(buf + pos));
+	value = le32_to_cpu(*(__le32 *)(pkt_buf->buf + pkt_buf->pos));
 	printf(".");
-	color_fprintf(stdout, color, "  %08x: ", pos);
+	color_fprintf(stdout, color, "  %08zx: ", pkt_buf->pos);
 	for (i = 0; i < HISI_PTT_FIELD_LENGTH; i++) {
 		byte = (value >> (24 - i * 8)) & 0xFF;
 		color_fprintf(stdout, color, "%02x ", byte);
@@ -106,36 +107,36 @@ static void hisi_ptt_print_pkt(const unsigned char *buf, int pos, const char *de
 	for (i = 0; i < HISI_PTT_MAX_SPACE_LEN; i++)
 		color_fprintf(stdout, color, "   ");
 	color_fprintf(stdout, color, "  %s\n", desc);
+	pkt_buf->pos += HISI_PTT_FIELD_LENGTH;
 }
 
-static int hisi_ptt_8dw_pkt_desc(const unsigned char *buf, int pos)
+static int hisi_ptt_8dw_pkt_desc(struct hisi_ptt_pkt_buf *pkt_buf)
 {
 	int i;
 
 	for (i = 0; i < HISI_PTT_8DW_TYPE_MAX; i++) {
 		/* Do not show 8DW check field and reserved fields */
 		if (i == HISI_PTT_8DW_CHK_AND_RSV0 || i == HISI_PTT_8DW_RSV1) {
-			pos += HISI_PTT_FIELD_LENGTH;
+			pkt_buf->pos += HISI_PTT_FIELD_LENGTH;
 			continue;
 		}
 
-		hisi_ptt_print_pkt(buf, pos, hisi_ptt_8dw_pkt_field_name[i]);
-		pos += HISI_PTT_FIELD_LENGTH;
+		hisi_ptt_print_pkt(pkt_buf, hisi_ptt_8dw_pkt_field_name[i]);
 	}
 
 	return hisi_ptt_pkt_size[HISI_PTT_8DW_PKT];
 }
 
-static void hisi_ptt_4dw_print_dw0(const unsigned char *buf, int pos)
+static void hisi_ptt_4dw_print_dw0(struct hisi_ptt_pkt_buf *pkt_buf)
 {
 	const char *color = PERF_COLOR_BLUE;
 	union hisi_ptt_field_data dw;
 	uint8_t byte;
 	int i;
 
-	dw.value = le32_to_cpu(*(__le32 *)(buf + pos));
+	dw.value = le32_to_cpu(*(__le32 *)(pkt_buf->buf + pkt_buf->pos));
 	printf(".");
-	color_fprintf(stdout, color, "  %08x: ", pos);
+	color_fprintf(stdout, color, "  %08zx: ", pkt_buf->pos);
 	for (i = 0; i < HISI_PTT_FIELD_LENGTH; i++) {
 		byte = (dw.value >> (24 - i * 8)) & 0xFF;
 		color_fprintf(stdout, color, "%02x ", byte);
@@ -149,27 +150,27 @@ static void hisi_ptt_4dw_print_dw0(const unsigned char *buf, int pos)
 		      "T9", dw.dw0_4dw.t9, "T8", dw.dw0_4dw.t8,
 		      "TH", dw.dw0_4dw.th, "SO", dw.dw0_4dw.so,
 		      "Length", dw.dw0_4dw.len, "Time", dw.dw0_4dw.time);
+
+	pkt_buf->pos += HISI_PTT_FIELD_LENGTH;
 }
 
-static int hisi_ptt_4dw_pkt_desc(const unsigned char *buf, int pos)
+static int hisi_ptt_4dw_pkt_desc(struct hisi_ptt_pkt_buf *pkt_buf)
 {
 	int i;
 
-	hisi_ptt_4dw_print_dw0(buf, pos);
-	pos += HISI_PTT_FIELD_LENGTH;
+	hisi_ptt_4dw_print_dw0(pkt_buf);
 
 	for (i = 0; i < HISI_PTT_4DW_TYPE_MAX; i++) {
-		hisi_ptt_print_pkt(buf, pos, hisi_ptt_4dw_pkt_field_name[i]);
-		pos += HISI_PTT_FIELD_LENGTH;
+		hisi_ptt_print_pkt(pkt_buf, hisi_ptt_4dw_pkt_field_name[i]);
 	}
 
 	return hisi_ptt_pkt_size[HISI_PTT_4DW_PKT];
 }
 
-int hisi_ptt_pkt_desc(const unsigned char *buf, int pos, enum hisi_ptt_pkt_type type)
+int hisi_ptt_pkt_desc(struct hisi_ptt_pkt_buf *pkt_buf)
 {
-	if (type == HISI_PTT_8DW_PKT)
-		return hisi_ptt_8dw_pkt_desc(buf, pos);
+	if (pkt_buf->pkt_type == HISI_PTT_8DW_PKT)
+		return hisi_ptt_8dw_pkt_desc(pkt_buf);
 
-	return hisi_ptt_4dw_pkt_desc(buf, pos);
+	return hisi_ptt_4dw_pkt_desc(pkt_buf);
 }
diff --git a/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.h b/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.h
index 6772b16b817b..316f24f01068 100644
--- a/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.h
+++ b/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.h
@@ -26,6 +26,13 @@ static int hisi_ptt_pkt_size[] = {
 	[HISI_PTT_8DW_PKT]	= 32,
 };
 
-int hisi_ptt_pkt_desc(const unsigned char *buf, int pos, enum hisi_ptt_pkt_type type);
+struct hisi_ptt_pkt_buf {
+	const unsigned char *buf;
+	size_t pos;
+	size_t len;
+	enum hisi_ptt_pkt_type pkt_type;
+};
+
+int hisi_ptt_pkt_desc(struct hisi_ptt_pkt_buf *pkt_buf);
 
 #endif
diff --git a/tools/perf/util/hisi-ptt.c b/tools/perf/util/hisi-ptt.c
index e4cc4785f744..4efda3f3e5f9 100644
--- a/tools/perf/util/hisi-ptt.c
+++ b/tools/perf/util/hisi-ptt.c
@@ -49,22 +49,18 @@ static void hisi_ptt_dump(struct hisi_ptt *ptt __maybe_unused,
 			  unsigned char *buf, size_t len)
 {
 	const char *color = PERF_COLOR_BLUE;
-	enum hisi_ptt_pkt_type type;
-	size_t pos = 0;
-	int pkt_len;
+	struct hisi_ptt_pkt_buf pkt_buf;
 
-	type = hisi_ptt_check_packet_type(buf);
-	len = round_down(len, hisi_ptt_pkt_size[type]);
+	pkt_buf.buf = buf;
+	pkt_buf.pos = 0;
+	pkt_buf.pkt_type = hisi_ptt_check_packet_type(buf);
+	pkt_buf.len = round_down(len, hisi_ptt_pkt_size[pkt_buf.pkt_type]);
 	color_fprintf(stdout, color, ". ... HISI PTT data: size %zu bytes\n",
-		      len);
+		      pkt_buf.len);
 
-	while (len > 0) {
-		pkt_len = hisi_ptt_pkt_desc(buf, pos, type);
-		if (!pkt_len)
+	while (pkt_buf.pos < pkt_buf.len) {
+		if (!hisi_ptt_pkt_desc(&pkt_buf))
 			color_fprintf(stdout, color, " Bad packet!\n");
-
-		pos += pkt_len;
-		len -= pkt_len;
 	}
 }
 
-- 
2.33.0


