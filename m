Return-Path: <linux-doc+bounces-29938-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4E19BD3E7
	for <lists+linux-doc@lfdr.de>; Tue,  5 Nov 2024 18:59:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A7BB2840CA
	for <lists+linux-doc@lfdr.de>; Tue,  5 Nov 2024 17:59:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B76E41E8826;
	Tue,  5 Nov 2024 17:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="yUhpqV+n"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A551E6306
	for <linux-doc@vger.kernel.org>; Tue,  5 Nov 2024 17:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730829551; cv=none; b=b6O9iQLQ3QkNUrSaYyBW4A2+Dr8EyobrWZut4n/6HYK/Ao7SmHsPBJZIeVVHu4WIr1yWuHa63TKAiVn8Y0Cf8GyI7AdYk4nfwuU0EPX15X2eDzX6W+mrEjgxtDadqq9nDT7HE+CpTd3KIXQf7wQM8mnEhKpPAtLXwyusQ+sSKCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730829551; c=relaxed/simple;
	bh=o/S07rQA5LKC++ibvZP8+btEUdTChzX9PQxEcexB2Fc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QRgi+zIITaNa8F+HE9w4w/uRAPzdxMgleE42TxecdPl2YS6fm27xl7liv8o+trD9LQ6RL6ayUwVJtqdyJdq4l9mUN/St+0dW9nFtTOHtgB1nOBIrwPZW2TZwGRTF8zevVhMWttTlvYfuNGUK8bWGf0GAc+YJqbqgIaiTHpXyPPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=yUhpqV+n; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-37d51055097so3739071f8f.3
        for <linux-doc@vger.kernel.org>; Tue, 05 Nov 2024 09:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730829547; x=1731434347; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cYYwPmz/G4AVlx/yjCM3Cevdc1UJIzYaJNcdAVGLoTM=;
        b=yUhpqV+nXxZaMER0EZpXWOoKN9RIwuImlQxNVU7hw77/BtQ4r8I58ZKfFzCE7ikPKX
         +EL5rM0/XmPMp2R8aAtmSK6iWN6LsuDnCxsdIOPGc8LkDjwO9H9yqyRa7HmHZPPT/1Gv
         bmNwiWQ5RlkEhYHYQphKj5cfUAcyB9+3uay2xd7Qr4LZLlTBmI9Bfc7LNF63DGhv3FiY
         OxiTfealCA7MRAfIdJB0ozCVGLbBZm928ED3hAva94CKciYiyXzJDMUc5s229gNjNhVH
         IAUXiiw3uviF3Rn9/oBOAHf8Gy3AcdFjpmkYjqVFKkNORgakMlowj7bJmBzgMdeO+cy9
         fK2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730829547; x=1731434347;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cYYwPmz/G4AVlx/yjCM3Cevdc1UJIzYaJNcdAVGLoTM=;
        b=aIKFUQLHKoPeUbI/Dpwinfe2JZmj5CTPnnBeL6prbpeJ/wEzeyHPqxXofuyimZ0it1
         HGobR4VEz9op+Lm8dTcRR4a/9HDpLJrMOUl10pHOoZhyPnU/K8SEVO4RmONK7eBFl+4/
         sl83FGKlDfj0MB2PBb+ogYbkOJD0OozCa5lJnrdKc6T2Rp/U7qbXfq05qxT317RhxP1S
         pFlhAQdr8K23+q1dAdKuIYuv0FFEA7Hm5ekgmzSRSE6ke/oQWOQ4kbzc3+KdOzEGk41i
         mm2fHfgJlaiNX4/m0KKgmuaAczue1YGGFP4SATXcAduGwQYlg9nt9lCDUWQViW5vdxPW
         Yicw==
X-Forwarded-Encrypted: i=1; AJvYcCUWEyElp0OkvhM/huhDQb6LdrWGyNDCsTmlitzwgAH/dX7qLdr9jdh9ppR07quKseEp/XYD/VmLJ2A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlcxQliIwRhrSimqU4gYGBUw7HNd7GKWesypsxHtfkwz9XBxTO
	2yj+1OSVja9pBxtky09P0XVPTKcPr1IR649ixG+b6Vr/RJmIQmfqKcBlYpIVW04wQ4dFWt/XT5p
	s
X-Google-Smtp-Source: AGHT+IE25zC4eqQ6X5jlcca9JvDhL9cTo62Y8/Ni22/gumHeYIQDsBdSiTMBQDkr9GZdErmEGlPxEw==
X-Received: by 2002:a05:6000:188b:b0:37d:4c8f:2e1 with SMTP id ffacd0b85a97d-381c7a4c76amr10961922f8f.22.1730829546869;
        Tue, 05 Nov 2024 09:59:06 -0800 (PST)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:5b9b:df02:2761:7a57])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-381c113dd7fsm16959481f8f.70.2024.11.05.09.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 09:59:06 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Tue, 05 Nov 2024 18:58:39 +0100
Subject: [PATCH v4 2/7] hwmon: (pmbus/core) allow drivers to override
 WRITE_PROTECT
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241105-tps25990-v4-2-0e312ac70b62@baylibre.com>
References: <20241105-tps25990-v4-0-0e312ac70b62@baylibre.com>
In-Reply-To: <20241105-tps25990-v4-0-0e312ac70b62@baylibre.com>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Jonathan Corbet <corbet@lwn.net>, 
 Patrick Rudolph <patrick.rudolph@9elements.com>, 
 Naresh Solanki <naresh.solanki@9elements.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, 
 Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-i2c@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1166; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=o/S07rQA5LKC++ibvZP8+btEUdTChzX9PQxEcexB2Fc=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnKlziyU5VuYN5u7I6QgqGhZ8ra1bIhVFcODbjP
 PHsCrqyZn+JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZypc4gAKCRDm/A8cN/La
 hcaED/9tYQFT9ZLIrrU3Lezn+ZTE00hfX46jWTWOz68yb6noBO44loCXAYdt9ZlwhWT9ChCdVoL
 UcfopD7Ig3TwiRQV0MXXZcDrRav5Hk8vCd/OQbUYh9NOt2CMpIgHSyZnSBJkJNPIkOJ+JsB1iiN
 /vmJKV21Qery6AgmWIppQUBaMidxhCiZFML+autKjnG5ppY6OuIFjeUcfY23YBjNttDJOK4DH9t
 29myh0c7v9WUUYtj2Nv3PlbcjCKz8ik5TLLe2qTFQrtlO4tfzYSXQlhcKNwylZDroKDi24WMClr
 OQebZlBuQju5+cAkra0xbxGZT7BuBD6QipiaDLkI/pvX8ThccnWhHiAFnwuMYNkWfXIApA+TiJ1
 r1s4oU2ZPU6w/kF08WbfPcGqz+vpXRjSb8SeDTHWLkzWBUDeNvJRjA4oYMK5zFhj/B5zqTbGeVG
 gvjqU40HPnbzAXe8DCXqBAnDCX6noi6LInpC/DJfGstpyz+9Rm/Oat/Xwf50GBocAQm2Ow47KVF
 aF67fDMNmsMoRbOuqrKHUo8JIl0dNnufu3PCVTwCjwh8irunipdkEAYOEtMCUJvF5iqI6apx5Q+
 khWqE4IoIstnVnJO/24/TRdBtMTf/WMbdG31uc6bMlJEJYp5j0LExPvQLTET8/5MuGh+BAlFlBm
 zkj/Qt9e33/9VfA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Use _pmbus_read_byte_data() rather than calling smbus directly to check
the write protection status. This give a chance to device implementing
write protection differently to report back on the actual write protection
status.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/hwmon/pmbus/pmbus_core.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index ce7fd4ca9d89b0f0a02e6c99db391a7cfca924a8..085a4dc91d9bad3d2aacdd946b74a094ea9ae458 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -2719,9 +2719,7 @@ static int pmbus_init_common(struct i2c_client *client, struct pmbus_data *data,
 	 * limit registers need to be disabled.
 	 */
 	if (!(data->flags & PMBUS_NO_WRITE_PROTECT)) {
-		pmbus_wait(client);
-		ret = i2c_smbus_read_byte_data(client, PMBUS_WRITE_PROTECT);
-		pmbus_update_ts(client, false);
+		ret = _pmbus_read_byte_data(client, 0xff, PMBUS_WRITE_PROTECT);
 
 		if (ret > 0 && (ret & PB_WP_ANY))
 			data->flags |= PMBUS_WRITE_PROTECTED | PMBUS_SKIP_STATUS_CHECK;

-- 
2.45.2


