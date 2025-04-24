Return-Path: <linux-doc+bounces-44241-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B35A9AF1D
	for <lists+linux-doc@lfdr.de>; Thu, 24 Apr 2025 15:34:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2710E17F4B2
	for <lists+linux-doc@lfdr.de>; Thu, 24 Apr 2025 13:34:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E667C1519BC;
	Thu, 24 Apr 2025 13:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="HffbYUUv"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45AF14D2B7
	for <linux-doc@vger.kernel.org>; Thu, 24 Apr 2025 13:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745501638; cv=none; b=aP2rGi+6Hk0Q8wYWe2I5FB4vrzSfFUKf7CMldiv22Q4O5sB6wcxMlZDFxUnf4qz+2GzDMWB866cOAmgcjqr1RNNFy1POYwgRYHRiu2i6ezlLGkMMUBHIGSzaPQ1mKQPJokxwyMtyeWuwbBCE9rWA+fTjcemfji7fE8XgSxJUNZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745501638; c=relaxed/simple;
	bh=PmojUCnrJqdi6ctPr2LDOJj4If88C0jCyODfzBPkVZw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hRqCAwzZVtBSRqwuihEUJ5DvFq/sYnDrB3JgX/QUab/FJRnjK6d0HnPelKzUx7KaciVtA9hcX7SNnlgZrKu6/xaTRvisbSbwIuvgzE2UfmFEhGQjSBP5NrQ/agXdJw1f+IGtSRZIBMALMEm8d+sduXOZmcwueNuBbOb8W6Ai4NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=pass smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=HffbYUUv; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inventec.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-309f3bf23b8so234392a91.3
        for <linux-doc@vger.kernel.org>; Thu, 24 Apr 2025 06:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1745501633; x=1746106433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xAd6NcWDbAEkgnYX5ETwh+0vWLsl9guxGLJqEAiLt0U=;
        b=HffbYUUvoCFOU/h1qQUwRgPCJYaEXF6WlbwroPu7WNatjmO+rR7vEKUAHsCGxrjaKa
         IP4REwSUPXNyfOih2HIZZ4ML1UNtSnmUi4X72GlVYngk5pfAYupFLZgWt8wSwFx7G3K3
         IMd8Rd1DN6wxLMnW09sP+pXJMcWd2uEoW6Ao5Mt953OrGLLnId8zjsWnDBM8KmVD9OVq
         xQdz1Dq83Hb96ZLT99TfzqjgOYJlCc6fNO7LYU5rFNlZXFJ4vMR+7QM/9wismHzvQ97k
         LJJ7QOvW6dpT469Hdsfljux+lYexR6E8fuHHd4QK1LHR3ZWeCG1j1+k2d91BfISS0RxD
         2IAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745501633; x=1746106433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xAd6NcWDbAEkgnYX5ETwh+0vWLsl9guxGLJqEAiLt0U=;
        b=bG3aTfMwxGKZsdfwT2gP2Cxv2hwdpS6m1+0CkaESS4zintyHTPj3fRJ7j7CZqun28U
         5S5JEAdMzO3U+NFMNCGUDZUgwUEWDY4FAya7bLx87IB3otnbMSFc3Ebk6Cs9hfY/LQHR
         FPFTNhUKJLCxfLFoVTmlJpHlfd7l2EMRwV1CzhUpWG50BZL84yCwS98yEmeeLiZL1pY4
         NoBwGwkGlOS2iq63vi2/Uafub2eZARNOkuCtAyt/C3jH5uq1uQ7uYQk5lt0ix3ebcs2h
         7EnwT5ntYH/v4WDIcsVK5r2gQ/Ht5bqvE0XqywUvN6UmxcPZ3/FbIxrhegZO5L4DKI1o
         MAcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlt74l9+25MnVx0bZEm7IW3Ar5iphdpIUDKOX0MCOElxjlXvEG6a/1gKaJeREV0M9hK6sYsnIzt3c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwekB7tebqfwZocQeMOxkOgw0aZHv/jrI/eVuTKM6KQZVv3L75U
	+ZgenIX5lQfOOFe43rxChoMoeUAZ4fJAAs6rb5isvvl7QhL7sUsqmUML5DmpwiA=
X-Gm-Gg: ASbGncsed8M4q0qykqNG/tNorgT8CEPRXoTuZ52eC+YiCaObAs0GQ80Gagg1kqJf+jW
	OPQJKOWj/x2stagfSkei8xXZwBP6e4i1vK+/AvN7xEljMov4xPji+1mtitnpfbGogYPApAFYx1E
	26Vl1LJVHKOLRWZwLf8X8YMMfEOUg789rH3kiTiDYurkC/0071G4GJyVlbzrvBnNXfrBxzMXwN6
	eiG03baxJ0TiY4twoPdQImH9jRgymVh9bHZ+pWDz9Xi343DEAXCfJrXa1A6WMi4kBjSe/SZSsbU
	L5CWzz2LmhAsVH2cGFjwmdTAMJV2LBKHB8Pv/K/c1Qxk9pPgecZSkkwInagxuYPQr7VPwt4Ak1f
	5WHOrvX/Qj/Sjr6AWHDrrDyqudfCxwfGpqA6m4tBBK9ICqjs/pJYeSbq0
X-Google-Smtp-Source: AGHT+IE5MxG2v6sAMsA9v4eeCn0OWfJW+7T9eGpMN/cvo+iq3Qr4O9mPR89K/lfCHHiHtXjigxiacQ==
X-Received: by 2002:a17:90b:2d10:b0:2f5:88bb:12f with SMTP id 98e67ed59e1d1-309ed28e9f7mr3454247a91.21.1745501632892;
        Thu, 24 Apr 2025 06:33:52 -0700 (PDT)
Received: from localhost.localdomain (60-248-18-139.hinet-ip.hinet.net. [60.248.18.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef0d5c72sm1321147a91.43.2025.04.24.06.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 06:33:52 -0700 (PDT)
From: Chiang Brian <chiang.brian@inventec.com>
X-Google-Original-From: Chiang Brian <chiang.brian@inventec.corp-partner.google.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Chiang Brian <chiang.brian@inventec.com>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/2] hwmon: (pmbus/tps53679) Add support for TPS53685
Date: Thu, 24 Apr 2025 21:25:37 +0800
Message-Id: <20250424132538.2004510-2-chiang.brian@inventec.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250424132538.2004510-1-chiang.brian@inventec.corp-partner.google.com>
References: <20250424132538.2004510-1-chiang.brian@inventec.corp-partner.google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chiang Brian <chiang.brian@inventec.com>

The TPS53685 is a fully AMD SVI3 compliant step down
controller with trans-inductor voltage regulator
(TLVR) topology support, dual channels, built-in
non-volatile memory (NVM), PMBus interface, and
full compatible with TI NexFET smart power
stages.
Add support for it to the tps53679 driver.

Signed-off-by: Chiang Brian <chiang.brian@inventec.com>
---
V5 -> V6:
	1. Add information about tps53685 into tps53679.rst
	2. Add additional flags when identifing the chip as tps53685
	3. Adjust length once returned device id is terminated by null character
V4 -> V5: 
	1. document the compatible of tps53685 into dt-bindings
	2. add the buffer length as argument for %*ph
	3. Add Changelog
V3 -> V4: 
	1. Add length comparison into the comparison of "id",or it may be true when 
	   the substring of "id" matches device id. 
	2. Restore `return 0;` in `tps53679_identify_chip()`
V2 -> V3:
	1. Remove the length comparsion in the comparison of "id".
V1 -> V2: 
	1. Modify subject and description to meet requirements
	2. Add "tps53685" into enum chips with numeric order
	3. Modify the content of marco "TPS53681_DEVICE_ID" from 0x81 to "\x81"
	   Add marco "TPS53685_DEVICE_ID" with content "TIShP"
	4. Modify the type of "id" from u16 to char* in `tps53679_identify_chip()`
	5. Modify the comparison of "id". It will be true if the string "id" matches 
	   device ID and compare with type char*,
	6. Add the length comparsion into the comparison of "id".
	7. Modify "len" as return code in `tps53679_identify_chip()`
	8. Output device error log with %*ph, instead of 0x%x\n" 
	9. Use existing tps53679_identify_multiphase() with argument 
	   "TPS53685_DEVICE_ID" in tps53685_identify() rather than creating one
	   tps53685_identify_multiphase()

 Documentation/hwmon/tps53679.rst |  8 +++++++
 drivers/hwmon/pmbus/tps53679.c   | 36 +++++++++++++++++++++++++++-----
 2 files changed, 39 insertions(+), 5 deletions(-)

diff --git a/Documentation/hwmon/tps53679.rst b/Documentation/hwmon/tps53679.rst
index 3b9561648c24..dd5e4a37375d 100644
--- a/Documentation/hwmon/tps53679.rst
+++ b/Documentation/hwmon/tps53679.rst
@@ -43,6 +43,14 @@ Supported chips:
 
     Datasheet: https://www.ti.com/lit/gpn/TPS53681
 
+  * Texas Instruments TPS53685
+
+    Prefix: 'tps53685'
+
+    Addresses scanned: -
+
+    Datasheet: https://www.ti.com/lit/gpn/TPS53685
+
   * Texas Instruments TPS53688
 
     Prefix: 'tps53688'
diff --git a/drivers/hwmon/pmbus/tps53679.c b/drivers/hwmon/pmbus/tps53679.c
index 63524dff5e75..01fefaef1688 100644
--- a/drivers/hwmon/pmbus/tps53679.c
+++ b/drivers/hwmon/pmbus/tps53679.c
@@ -16,7 +16,7 @@
 #include "pmbus.h"
 
 enum chips {
-	tps53647, tps53667, tps53676, tps53679, tps53681, tps53688
+	tps53647, tps53667, tps53676, tps53679, tps53681, tps53685, tps53688
 };
 
 #define TPS53647_PAGE_NUM		1
@@ -31,7 +31,8 @@ enum chips {
 #define TPS53679_PROT_VR13_5MV		0x07 /* VR13.0 mode, 5-mV DAC */
 #define TPS53679_PAGE_NUM		2
 
-#define TPS53681_DEVICE_ID		0x81
+#define TPS53681_DEVICE_ID     "\x81"
+#define TPS53685_DEVICE_ID     "TIShP"
 
 #define TPS53681_PMBUS_REVISION		0x33
 
@@ -86,10 +87,12 @@ static int tps53679_identify_phases(struct i2c_client *client,
 }
 
 static int tps53679_identify_chip(struct i2c_client *client,
-				  u8 revision, u16 id)
+				  u8 revision, char *id)
 {
 	u8 buf[I2C_SMBUS_BLOCK_MAX];
 	int ret;
+	int buf_len;
+	int id_len;
 
 	ret = pmbus_read_byte_data(client, 0, PMBUS_REVISION);
 	if (ret < 0)
@@ -102,8 +105,14 @@ static int tps53679_identify_chip(struct i2c_client *client,
 	ret = i2c_smbus_read_block_data(client, PMBUS_IC_DEVICE_ID, buf);
 	if (ret < 0)
 		return ret;
-	if (ret != 1 || buf[0] != id) {
-		dev_err(&client->dev, "Unexpected device ID 0x%x\n", buf[0]);
+
+	/* Adjust length if null terminator if present */
+	buf_len = (buf[ret - 1] != '\x00' ? ret : ret - 1);
+
+	id_len = strlen(id);
+
+	if (buf_len != id_len || strncmp(id, buf, id_len)) {
+		dev_err(&client->dev, "Unexpected device ID: %*ph\n", ret, buf);
 		return -ENODEV;
 	}
 	return 0;
@@ -138,6 +147,16 @@ static int tps53679_identify(struct i2c_client *client,
 	return tps53679_identify_mode(client, info);
 }
 
+static int tps53685_identify(struct i2c_client *client,
+				 struct pmbus_driver_info *info)
+{
+	info->func[1] |= PMBUS_HAVE_VIN | PMBUS_HAVE_IIN | PMBUS_HAVE_PIN |
+			 PMBUS_HAVE_STATUS_INPUT;
+	info->format[PSC_VOLTAGE_OUT] = linear;
+	return tps53679_identify_chip(client, TPS53681_PMBUS_REVISION,
+					   TPS53685_DEVICE_ID);
+}
+
 static int tps53681_identify(struct i2c_client *client,
 			     struct pmbus_driver_info *info)
 {
@@ -263,6 +282,10 @@ static int tps53679_probe(struct i2c_client *client)
 		info->identify = tps53681_identify;
 		info->read_word_data = tps53681_read_word_data;
 		break;
+	case tps53685:
+	    info->pages = TPS53679_PAGE_NUM;
+	    info->identify = tps53685_identify;
+		break;
 	default:
 		return -ENODEV;
 	}
@@ -277,6 +300,7 @@ static const struct i2c_device_id tps53679_id[] = {
 	{"tps53676", tps53676},
 	{"tps53679", tps53679},
 	{"tps53681", tps53681},
+	{"tps53685", tps53685},
 	{"tps53688", tps53688},
 	{}
 };
@@ -289,6 +313,7 @@ static const struct of_device_id __maybe_unused tps53679_of_match[] = {
 	{.compatible = "ti,tps53676", .data = (void *)tps53676},
 	{.compatible = "ti,tps53679", .data = (void *)tps53679},
 	{.compatible = "ti,tps53681", .data = (void *)tps53681},
+	{.compatible = "ti,tps53685", .data = (void *)tps53685},
 	{.compatible = "ti,tps53688", .data = (void *)tps53688},
 	{}
 };
-- 
2.43.0


