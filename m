Return-Path: <linux-doc+bounces-55064-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D57B1A43B
	for <lists+linux-doc@lfdr.de>; Mon,  4 Aug 2025 16:13:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 00EBE1633EE
	for <lists+linux-doc@lfdr.de>; Mon,  4 Aug 2025 14:12:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10C4B2749E0;
	Mon,  4 Aug 2025 14:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MREqGzNo"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-il1-f202.google.com (mail-il1-f202.google.com [209.85.166.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4231D273814
	for <linux-doc@vger.kernel.org>; Mon,  4 Aug 2025 14:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754316690; cv=none; b=F2XaDTCsLP7ahU5XNGgLlBTZug4Z+8EpZzeCBwZ+eHyxvT/EK906v0wCRDCDM6pbaAZ5IHkjTd4sD2uvfsECxiWoRsZuD7gkwrzp126+HqAwY7L5KlMrmi5ytsHBwqWiveHfyMtB739o4vHOmcY/a9cefdc2ezkrZk5Vnkyg4eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754316690; c=relaxed/simple;
	bh=YA8fLpF/xBHkvyNlZQN1ZRlWkRh2g/iLtt0L44z96mY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dvSNn7SiNMac+MlLyuRxlJfPSZJIutOxWFcanhXv6TUA2X9bvgo8XudLZW0jjRTrSA/0ws3gtTKC9jE6KNwqiz+Sra1JShdxAP8qDFycg+WGWCJrAIU8+YMZGAa41vo/VQ7y6aDyUP6GXS4JNJDHqAnLpzAPAE8eTQ/sYCUX4WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MREqGzNo; arc=none smtp.client-ip=209.85.166.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com
Received: by mail-il1-f202.google.com with SMTP id e9e14a558f8ab-3e3d7e44a9cso43881415ab.1
        for <linux-doc@vger.kernel.org>; Mon, 04 Aug 2025 07:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754316687; x=1754921487; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mUwp8SUltYm3fAva2JNxiE1Ag8liv6zV6/FE55B/TvA=;
        b=MREqGzNoj1OxRDdoIlw3f6IZaVR6Riz0XfrD0vBjz8B1Y7W8MyJpqxdDUwV6NyiBK0
         Gm7I1+C9evlJdkie9LP2O2WRRvjnxe5E83CTSfgedVFUs+byUuhjTXQ9thYwBOSXR5De
         gW5OspcAbRlgrH9i9aBzFkHlprdrQt0+C7lk/1gj57yHGy9elb82YVwQPAGT0P0sU13D
         dAlIO62RmxZqCkXD1pIYTInODcyH0AiBI7jMxYKG9Mq5FuSGQgXWIuE2+d751z5YW5gw
         smapheuyl4YPvgHaltjn0GYdwkeW0xZ9xmdzP4j223k+NCof3L+0/huxSRxj+suC+f/B
         SC2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754316687; x=1754921487;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mUwp8SUltYm3fAva2JNxiE1Ag8liv6zV6/FE55B/TvA=;
        b=uNH35g/bpu6UQ1mrurI7HR2EX+v7vdyFyE+SF4pTFKa8++LM9ucFS5vyhETsqdtm7A
         MV0zJUQBWAB4ZSc2exeB+6VRtsZbbWrmGpxD0whnc42O6X14Qiij8WoXGqWwJ3aDoxUv
         878OmO1oSJ6r+7j8AzESZ4pLnRQOdATp7f/jScVonNWp63p9a5PVeotxcBI6d+b+B9z9
         MfSRc3vBdkKT+Q/E7i+R6fYhShBhxqYJlsMF/cn+ksVHIvwyc8apftbVdmzo3yIkvdKD
         a8j/U+PW8+oKS2jmtyNfzvE1KWVsfyfgP9hybwJeZfkYJ8bBk5r2suum3uR9DL+RwqfB
         NPDw==
X-Forwarded-Encrypted: i=1; AJvYcCUGJW+c1opvF6uonwzT1mVi0jluQ4OhzO0/QFgmt71j0Gtpr9KBG/aqCpdKJrGo57zBLbdrk4k7Iyw=@vger.kernel.org
X-Gm-Message-State: AOJu0YykZ4Z/8vb4Cm99N8ApCnP24zd07OvZpfc+UhiNAnXZ7M1lnoIq
	1bmr2CvKwkWHh+8HUj64fYEFLym+xJksukUU7QRRtLgb9Gd49ONh42RnrPYyuGt7aMxBPTVc4dz
	ldm9jexoZCg==
X-Google-Smtp-Source: AGHT+IGHisvUCxNFCk/rh543tDzp/qr8GKURFBHfw7awAkPF6bV8B3PQ9TIarjbrhL5VIXBGFZ2fNzAiNyGd
X-Received: from ilbed8.prod.google.com ([2002:a05:6e02:4808:b0:3e3:ec97:e375])
 (user=jdenose job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6e02:3b82:b0:3e2:83aa:1375
 with SMTP id e9e14a558f8ab-3e41615baf9mr169741475ab.14.1754316687442; Mon, 04
 Aug 2025 07:11:27 -0700 (PDT)
Date: Mon, 04 Aug 2025 14:11:23 +0000
In-Reply-To: <20250804-support-forcepads-v2-0-138ca980261d@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250804-support-forcepads-v2-0-138ca980261d@google.com>
X-Mailer: b4 0.14.2
Message-ID: <20250804-support-forcepads-v2-8-138ca980261d@google.com>
Subject: [PATCH v2 08/11] HID: haptic: add functions handling events
From: Jonathan Denose <jdenose@google.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Henrik Rydberg <rydberg@bitmath.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Angela Czubak <aczubak@google.com>, 
	"Sean O'Brien" <seobrien@google.com>, Jonathan Denose <jdenose@google.com>
Content-Type: text/plain; charset="utf-8"

From: Angela Czubak <aczubak@google.com>

Implement hid_haptic_handle_press_release() which generates haptic feedback
as well as saves the pressed state of the haptic device.
Add functions to increase and reset the state of the pressure detected by
the device.

Signed-off-by: Angela Czubak <aczubak@google.com>
Co-developed-by: Jonathan Denose <jdenose@google.com>
Signed-off-by: Jonathan Denose <jdenose@google.com>
---
 drivers/hid/hid-haptic.c | 20 +++++++++++++++++++-
 drivers/hid/hid-haptic.h |  4 ++++
 2 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-haptic.c b/drivers/hid/hid-haptic.c
index 923b685f0e1e81b7f95567b11209af264c522373..760dd1d70583489c07e199943ebba361d347bfa4 100644
--- a/drivers/hid/hid-haptic.c
+++ b/drivers/hid/hid-haptic.c
@@ -50,8 +50,13 @@ EXPORT_SYMBOL_GPL(hid_haptic_feature_mapping);
 bool hid_haptic_check_pressure_unit(struct hid_haptic_device *haptic,
 				    struct hid_input *hi, struct hid_field *field)
 {
-	if (field->unit == HID_UNIT_GRAM || field->unit == HID_UNIT_NEWTON)
+	if (field->unit == HID_UNIT_GRAM || field->unit == HID_UNIT_NEWTON) {
+		haptic->force_logical_minimum = field->logical_minimum;
+		haptic->force_physical_minimum = field->physical_minimum;
+		haptic->force_resolution = input_abs_get_res(hi->input,
+							     ABS_MT_PRESSURE);
 		return true;
+	}
 	return false;
 }
 EXPORT_SYMBOL_GPL(hid_haptic_check_pressure_unit);
@@ -508,3 +513,16 @@ int hid_haptic_init(struct hid_device *hdev,
 	return ret;
 }
 EXPORT_SYMBOL_GPL(hid_haptic_init);
+
+void hid_haptic_pressure_reset(struct hid_haptic_device *haptic)
+{
+	haptic->pressure_sum = 0;
+}
+EXPORT_SYMBOL_GPL(hid_haptic_pressure_reset);
+
+void hid_haptic_pressure_increase(struct hid_haptic_device *haptic,
+				 __s32 pressure)
+{
+	haptic->pressure_sum += pressure;
+}
+EXPORT_SYMBOL_GPL(hid_haptic_pressure_increase);
diff --git a/drivers/hid/hid-haptic.h b/drivers/hid/hid-haptic.h
index 9aa910579d09206a2a882a5f708efd8620428f78..0a34b0c6d706a985630962acc41f7a8eb73cd343 100644
--- a/drivers/hid/hid-haptic.h
+++ b/drivers/hid/hid-haptic.h
@@ -73,3 +73,7 @@ int hid_haptic_input_configured(struct hid_device *hdev,
 				struct hid_haptic_device *haptic,
 				struct hid_input *hi);
 int hid_haptic_init(struct hid_device *hdev, struct hid_haptic_device **haptic_ptr);
+void hid_haptic_handle_press_release(struct hid_haptic_device *haptic);
+void hid_haptic_pressure_reset(struct hid_haptic_device *haptic);
+void hid_haptic_pressure_increase(struct hid_haptic_device *haptic,
+				  __s32 pressure);

-- 
2.50.1.565.gc32cd1483b-goog


