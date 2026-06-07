Return-Path: <linux-doc+bounces-91263-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id M7HdBbkCJmo4QgIAu9opvQ
	(envelope-from <linux-doc+bounces-91263-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 08 Jun 2026 01:46:01 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 87029651F0A
	for <lists+linux-doc@lfdr.de>; Mon, 08 Jun 2026 01:46:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=I3LDUBy+;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91263-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-91263-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2BDFF300F797
	for <lists+linux-doc@lfdr.de>; Sun,  7 Jun 2026 23:45:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 927D0337107;
	Sun,  7 Jun 2026 23:45:23 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D56333A03A
	for <linux-doc@vger.kernel.org>; Sun,  7 Jun 2026 23:45:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780875923; cv=none; b=UFwZyqMBOhm6sp0nBwu9NqP2adbugT6e1f6DY4sUTLAnxObMJiiOvJ5FMgvdig0Xh8mzLnWhjxWfmutXMKssZXF4EwPjRNvPosN96lVfSqC7xERiTJUwJpVgPxMirIcN0OczQoD3yQobSwTrJnQiuSrfdIsKaz5GaWpX+1YOygk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780875923; c=relaxed/simple;
	bh=J+az5RicRenEneEDG27NK4Kvad9Qms6Iox6ODxzmpTU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fPpFQK8iuOYKw5yFoc+6lOoa5Zgd4Plt8xM8dtZD7X/C6/ddWEZbb5tSLns3dZoH6KagRVnlhIG/7z+Fbl9D/oal4ZhCrZLIhzeEviY1/9eV5XnujcaerMn1NL8/xB+IF9XrozgbBb88KaRLPeWRdTIp8n/sJlexCnIY0ese1gE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I3LDUBy+; arc=none smtp.client-ip=209.85.210.179
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8422524cb38so1130401b3a.0
        for <linux-doc@vger.kernel.org>; Sun, 07 Jun 2026 16:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780875921; x=1781480721; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Moxyp6VJ7Jh2y4csvP0jcOZ0gGOtSLLwcv7kOefBRHI=;
        b=I3LDUBy+dwT5F4MV21F4/qE3Up91ZVyXpULmZ9tYyLoabjXA0hR9xHhQbv3Wt9jk3f
         97r8eP4h1e3KWIZbhLqmiYBicIKA89kbMEyVT7miwXqQh3guAxyWWS6KgW3lsriPoMS6
         yMErxXb0IgNL06qo5zIALfl1mOPoxflsmqq3XKBrNLLQHEJtCY2Vqtkcx26WzK2phKII
         3TUtNj/iAYttvecv6Ufm4RRlzztkISzsgcB6RID1ngXHhk9shh0SbU2kcDDSAyoVjq8F
         MDLlIMouS0Nw3ZYeTD8PT7P6Ccl9zqZ8NdJ9GhWHCA20Fx4lM8b5D772ua26jVduWWDq
         i2kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780875921; x=1781480721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Moxyp6VJ7Jh2y4csvP0jcOZ0gGOtSLLwcv7kOefBRHI=;
        b=AQgyGKlzQyX0BNWiJSVRNajVt6Ctw2MILMee+NtjOoXA7zTD0B47f+Pdho2iD/QzZf
         S4UGvNTaRiUBz9ynRwZk3kpb87uJ0w2mYS4S+msNKdx0+RVPBT0TRAS1N3dom7az6PBc
         BithDkcgQJhKd3JTrjFVdBHeFUoBFU4BeceKiPIe8PHFXRYkYh3xz8+16Kdz6Lm9KGnl
         xEVsIT2MazZlp1yxvzZ0u73gf6UKmC4BtxoV/HLh+9LAK4R/zWnk45OLgoKt/jfHgBEy
         oTfZBLpNtUgip/+3AGlnwzlJXL3pb7p8yJqrKczuZKKgblEwtDHnb+BaJWbk4A9HzhkG
         bPoQ==
X-Forwarded-Encrypted: i=1; AFNElJ//qDteCdFfM1sMr0v2WvwHwygMQKS8MfGZvQNvn0sVjeFQjQEI6Lu9Sv3lLYDhN3wWBEG2n/ynl5g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2RIkEp8qBJhx7E9nBkakAP3oLXA/bsBX5FQZ00lR1QLLN9Viv
	AN/syLakB/jwcBpUDylPlryiRYc+UHLFUA3TjHacqSiFSskSMkrh35oh
X-Gm-Gg: Acq92OH9xCveUlqFF9DD509BOP8tCrsqS2F5llWne3SjwRi5+3l85NLOPWyb2F6zxvW
	WnC1FWSvdhUb9kZ8hFHWXb+YbjIkF83T/l+Kfc7+ymwN5JVVLDujo429wNTKzyQL6FKir/TaSk5
	RPbAYyjem7GfUFg8611NuodJLNz15oWMqJOYed7EYoPYulFJCYYUbpfaTuxeZEnvJeHy1KqiPQ0
	jcptHyYe9UpQmPoHID6U6M9U4E2q9UsvsjfOWhUk+YVFt+YXPRdr1Q2cwNWssj2EjeSWrFSto8y
	ucgJ2eOMHhjLPEDlexjKPJ5cdotoGMhhr65LRHzTbTzcx3nem1b17Mi8oipSL40WQYecL5H61P8
	ujM7CCbq2cPFNR3nKYBKl0zo+w1wQ8tBZqUKhwAZMSBrArtIQwOT+6Odw1LYlsMx4SunLIaWWXz
	kyB2RjzeytElJtvEgmG1V+RbOqi51oFERarFUPH2CK4qyA0VolKJRVKxLB8itDSesFfuclmz2H8
	z5gCPGRLy4SFZODVJsWSSmxLhcIraXmJGuWnNHDSIAV5Drl
X-Received: by 2002:a05:6a00:4390:b0:842:6a3b:60ea with SMTP id d2e1a72fcca58-842b0fbbb03mr13296464b3a.40.1780875921415;
        Sun, 07 Jun 2026 16:45:21 -0700 (PDT)
Received: from DESKTOP-G3E0OSP.localdomain ([112.172.255.242])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828d6bd1sm19257732b3a.44.2026.06.07.16.45.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 16:45:21 -0700 (PDT)
From: Jinseob Kim <kimjinseob88@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	linux-iio@vger.kernel.org
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH RFC v4 3/6] iio: osf: add protocol decoding
Date: Mon,  8 Jun 2026 08:43:40 +0900
Message-ID: <20260607234343.22109-4-kimjinseob88@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260607234343.22109-1-kimjinseob88@gmail.com>
References: <20260607234343.22109-1-kimjinseob88@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-91263-lists,linux-doc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[kimjinseob88@gmail.com,linux-doc@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jic23@kernel.org,m:linux-iio@vger.kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andriy.shevchenko@intel.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kimjinseob88@gmail.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 87029651F0A

Use a FourCC-style wire magic comparison.

Document signed little-endian sample handling.

Signed-off-by: Jinseob Kim <kimjinseob88@gmail.com>
---
 drivers/iio/opensensorfusion/osf_protocol.c | 4 +++-
 drivers/iio/opensensorfusion/osf_protocol.h | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/opensensorfusion/osf_protocol.c b/drivers/iio/opensensorfusion/osf_protocol.c
index ed91d3dd5..5bee545f3 100644
--- a/drivers/iio/opensensorfusion/osf_protocol.c
+++ b/drivers/iio/opensensorfusion/osf_protocol.c
@@ -11,6 +11,7 @@
 
 #define OSF_CRC32_INIT		GENMASK(31, 0)
 #define OSF_CRC32_XOROUT	GENMASK(31, 0)
+#define OSF_FRAME_MAGIC		0x3046534f /* "OSF0" little-endian */
 
 static bool osf_sensor_type_valid(u16 sensor_type)
 {
@@ -38,7 +39,7 @@ int osf_protocol_decode_frame(const u8 *buf, size_t len,
 	if (len < OSF_FRAME_MIN_LEN)
 		return -EMSGSIZE;
 
-	if (buf[0] != 'O' || buf[1] != 'S' || buf[2] != 'F' || buf[3] != '0')
+	if (get_unaligned_le32(buf) != OSF_FRAME_MAGIC)
 		return -EPROTO;
 
 	major = buf[4];
@@ -136,6 +137,7 @@ int osf_protocol_sensor_sample_value(const struct osf_sensor_sample *sample,
 	if (index >= sample->channel_count)
 		return -ERANGE;
 
+	/* Samples are little-endian two's-complement signed values. */
 	*value = (s32)get_unaligned_le32(sample->samples + index * sizeof(s32));
 
 	return 0;
diff --git a/drivers/iio/opensensorfusion/osf_protocol.h b/drivers/iio/opensensorfusion/osf_protocol.h
index 4b6fb131a..c62c2c254 100644
--- a/drivers/iio/opensensorfusion/osf_protocol.h
+++ b/drivers/iio/opensensorfusion/osf_protocol.h
@@ -2,6 +2,7 @@
 #ifndef _OSF_PROTOCOL_H
 #define _OSF_PROTOCOL_H
 
+#include <linux/bits.h>
 #include <linux/types.h>
 
 #define OSF_PROTOCOL_MAJOR		0
@@ -14,7 +15,7 @@
 #define OSF_DEVICE_STATUS_LEN		20
 #define OSF_CAP_REPORT_BASE_LEN		4
 #define OSF_CAP_SENSOR_ENTRY_LEN		20
-#define OSF_CAPABILITY_FLAGS_MASK	0x00000003U
+#define OSF_CAPABILITY_FLAGS_MASK	GENMASK(1, 0)
 
 enum osf_message_type {
 	OSF_MSG_SENSOR_SAMPLE		= 0x0001,
@@ -44,6 +45,7 @@ struct osf_frame {
 	u64 sequence;
 	u64 timestamp_us;
 	u32 flags;
+	/* payload points into the caller-owned frame buffer. */
 	const u8 *payload;
 	u32 crc;
 };
-- 
2.43.0


