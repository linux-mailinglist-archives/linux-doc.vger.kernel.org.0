Return-Path: <linux-doc+bounces-33007-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 719AC9F4A8E
	for <lists+linux-doc@lfdr.de>; Tue, 17 Dec 2024 13:03:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0487D18821C0
	for <lists+linux-doc@lfdr.de>; Tue, 17 Dec 2024 12:03:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05BF61EBFF8;
	Tue, 17 Dec 2024 12:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="YfqcEIwm"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68B51EF088
	for <linux-doc@vger.kernel.org>; Tue, 17 Dec 2024 12:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734436997; cv=none; b=HcsrCqh3VRmIAhiPLFS7/7WuU8xo5Jfwv4raTSdChEUo5osoK9N6ujiLWxoI7rzWQnaSoOL/etIflsfhYVlj11isULL/i9aKi82fRQKU8wCcEgRK4Fwu/AJCCthXvCugSkswX8Y3GE0k6fB/Z/6Ydj5fY86AG1E7umJWmuOEsZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734436997; c=relaxed/simple;
	bh=S14vnVnc/fHQHKXW5slUzsZdoihyLcHDMxn1DG/uwEs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nk6RWf0OIwsI7bibm7QFAdc7IPOEAPfiChtM1BQH7kHQ3BrrXKuKbfYt25VDXXsbhtQHL2uAIwOman00saMjh9s7lUGNcKe5kyHfy8qPhhHviqULrGo+kkPMME4Bo4hs4B3TKbpjFiniG1EceYl+Z56ZfWiZPW5//4fQqe+3dik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=YfqcEIwm; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=53FiL+fg5vipjUeGKedYSfF0y/LWWvOlhrUnYbkgse0=; b=YfqcEI
	wmvMynPiGSoOM5VfoZ4zq7BfvD0ZM6Q55GH54UA0vWuqNsY4Toj9bWQFjbvO7rKy
	1fdMqxyI4rFnCtcSGH5n9Z848InLKBZi5HL999Atfx/cH9Ff8LyQYdPpDAlcjFqq
	PrhtZvch7wnToNR/pNcOWs+OXqlMlSHyVR0m5Rt0q7gfXlG2kdw89epZVWFUHODP
	PNWK22p6i6DhaO12QBOzYxbGUD5TUIYiqaGLZA0TOwsdHEuYtZwgoDqcBJGeVHm5
	P6y4jw8fjoKL81HjaFJGlPAdOMUtP7AqsEnap7Yx0uACjARB2xbFihnm9PpslVLl
	tRXLy7n9KBin5HEg==
Received: (qmail 4062975 invoked from network); 17 Dec 2024 13:03:10 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Dec 2024 13:03:10 +0100
X-UD-Smtp-Session: l3s3148p1@BPq0FHYp5MEgAwDPXwAQAA/MfjDm1Sk8
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH 2/2] hwmon: (lm75) Add NXP P3T1755 support
Date: Tue, 17 Dec 2024 13:03:06 +0100
Message-ID: <20241217120304.32950-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241217120304.32950-4-wsa+renesas@sang-engineering.com>
References: <20241217120304.32950-4-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tested with the P3T1755 soldered additionally to the P3T1085UK-ARD
shield and connected to a Renesas RZ/G3S SMARC board.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 Documentation/hwmon/lm75.rst |  6 ++++--
 drivers/hwmon/lm75.c         | 13 +++++++++++++
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/Documentation/hwmon/lm75.rst b/Documentation/hwmon/lm75.rst
index 6adab608dd05..9877ddbbf7c8 100644
--- a/Documentation/hwmon/lm75.rst
+++ b/Documentation/hwmon/lm75.rst
@@ -121,9 +121,9 @@ Supported chips:
 
          https://www.ti.com/product/TMP1075
 
-  * NXP LM75B, PCT2075
+  * NXP LM75B, P3T1755, PCT2075
 
-    Prefix: 'lm75b', 'pct2075'
+    Prefix: 'lm75b', 'p3t1755', 'pct2075'
 
     Addresses scanned: none
 
@@ -131,6 +131,8 @@ Supported chips:
 
 	       https://www.nxp.com/documents/data_sheet/LM75B.pdf
 
+               https://www.nxp.com/docs/en/data-sheet/P3T1755.pdf
+
                https://www.nxp.com/docs/en/data-sheet/PCT2075.pdf
 
   * AMS OSRAM AS6200
diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
index 2c2205aec7d4..a8f95bef68cb 100644
--- a/drivers/hwmon/lm75.c
+++ b/drivers/hwmon/lm75.c
@@ -38,6 +38,7 @@ enum lm75_type {		/* keep sorted in alphabetical order */
 	max6626,
 	max31725,
 	mcp980x,
+	p3t1755,
 	pct2075,
 	stds75,
 	stlm75,
@@ -222,6 +223,13 @@ static const struct lm75_params device_params[] = {
 		.default_resolution = 9,
 		.default_sample_time = MSEC_PER_SEC / 18,
 	},
+	[p3t1755] = {
+		.clr_mask = 1 << 1 | 1 << 7,	/* disable SMBAlert and one-shot */
+		.default_resolution = 12,
+		.default_sample_time = 55,
+		.num_sample_times = 4,
+		.sample_times = (unsigned int []){ 28, 55, 110, 220 },
+	},
 	[pct2075] = {
 		.default_resolution = 11,
 		.default_sample_time = MSEC_PER_SEC / 10,
@@ -734,6 +742,7 @@ static const struct i2c_device_id lm75_ids[] = {
 	{ "max31725", max31725, },
 	{ "max31726", max31725, },
 	{ "mcp980x", mcp980x, },
+	{ "p3t1755", p3t1755, },
 	{ "pct2075", pct2075, },
 	{ "stds75", stds75, },
 	{ "stlm75", stlm75, },
@@ -813,6 +822,10 @@ static const struct of_device_id __maybe_unused lm75_of_match[] = {
 		.compatible = "maxim,mcp980x",
 		.data = (void *)mcp980x
 	},
+	{
+		.compatible = "nxp,p3t1755",
+		.data = (void *)p3t1755
+	},
 	{
 		.compatible = "nxp,pct2075",
 		.data = (void *)pct2075
-- 
2.45.2


