Return-Path: <linux-doc+bounces-25475-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E05397D8AC
	for <lists+linux-doc@lfdr.de>; Fri, 20 Sep 2024 18:56:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E92C9B21CDD
	for <lists+linux-doc@lfdr.de>; Fri, 20 Sep 2024 16:56:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F02B18308D;
	Fri, 20 Sep 2024 16:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="0mHsWZaI"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516B1181310
	for <linux-doc@vger.kernel.org>; Fri, 20 Sep 2024 16:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726851405; cv=none; b=Y9qEWwAWmjvj8KnGP9GzzbQg5YVGcAxSdaChAxi8sBWY2cYPwTKHj2ZB9GOL2lE+uAA1tDBYhci1XJxQuucfBB+ptsCcthRcU1GXukiPv3g5mbQduSkwSBRkGY0zG0BydarOGdt+Oul1yQXkOY0nm3RGLf20wRWD7O59apdQb0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726851405; c=relaxed/simple;
	bh=nxe3bIXN89F9dHDYwRgVlJarGFig5lhOLs3Ek1wlg04=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E7ipFOCYirtvB49E5U4Wo7GvX4FZY252WvcTgysH2s7ATbS80rRK6vCUoPgrltS+2l26ePVuLepR4qIoOFS5hP/v0dA/hYwtjogINopY0l6Pp3JKhmm96ifA4iBaFKgjo7Dkgya++Jvgii/i2s+cuzfzMdcHQmDfAny8scIadcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=0mHsWZaI; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-378e5d4a80eso1650741f8f.0
        for <linux-doc@vger.kernel.org>; Fri, 20 Sep 2024 09:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1726851401; x=1727456201; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8TOqGOus+/DfL5mi4lAUgadC20uYV44UD6+sgPwKSng=;
        b=0mHsWZaIK8LKlcFgqR6/2xJj12Z1ore1vh9fjsVxet9SZWmzdqQzYPYBSAHcc9qBjD
         Ic3M8nb+0BZkRQLZtNMnCTvdfOdc/qmudaoi6bb0coE32HS8VxDpJiIK1bN+Val4+yd8
         bWdQfYnIf/mCiZBBOagGrb7Tis6SD9kLDuHjZ4oMOttyvslaNv7jfhiYeWz2KOU7V/6I
         LLKrdpiXs0hXEgT698YCs/GLEjh9O1GqtlD7aKumZvF/hdgwyVecbZ4tR1a2ZrIlKg9g
         VmWoN7ZFtvZ3a6CJ/+Z6oyj6A0Ep0wqFMUXB3SJF/JVcYDoQF9Zn4oLnbad6BwX4DsDT
         YOPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726851401; x=1727456201;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8TOqGOus+/DfL5mi4lAUgadC20uYV44UD6+sgPwKSng=;
        b=HMKdCt/sFgYKT1NjpLuGCrvunK1Hifucsz64N+/C440L4v6RyxW1wVbazX09kgUjAC
         O4VPOiM07BJ27y3wd2JQokkh3lemxF8O28CJcaCgAGNGpnaazsiF298N9EIp8WMPPEQe
         Jm49zwoO59OUnHIH7n+jIRPdo46n++VXIkv+7KJDEtZWMHYIvmn9akMkj50UWH1PxTC5
         rYQtqBjNtG45abko33kHyPIqL5Vllz98zfd50Tt5j1UiTCpYwG3L2kQp7lz9vo1mPQhF
         HRk4V2VURNR3LR3OPRw/puYWOn+18I2Ym9nhcigXCFTe/9zPqeTfYCusp5KZzHdgJCZN
         MsBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgn2CbdZix2EF70dvT/c4Ve0nauqYJmDi8s42hMGc31BG9E88zzwRuiboL6Dff1s+6JTs4JSlhCK8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxY41duyd9tIEmSEn8VWk4z31w6+xL57GQQ0uR+LK66+WkMcVl8
	IhJbFXCiuUal3SFBOs5enS1Z6FVrdZ7CVwqjDTpWx8cVfH7mrqlHe7EhfjxKtm0=
X-Google-Smtp-Source: AGHT+IFttVJoArnneXwv88ZWzXUlfdFSTX3akKsFIhgdYV7ZxHvnByGtleg9cGiCtJY7qBU0OfI/aw==
X-Received: by 2002:a5d:6752:0:b0:371:7e46:68cb with SMTP id ffacd0b85a97d-37a42380d9dmr1951442f8f.50.1726851401493;
        Fri, 20 Sep 2024 09:56:41 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:8e69:83a7:a29a:ba83])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-42e6c718e40sm97430135e9.1.2024.09.20.09.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 09:56:41 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 20 Sep 2024 18:56:12 +0200
Subject: [PATCH v2 1/3] dt-bindings: hwmon: pmbus: add ti tps25990 support
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240920-tps25990-v2-1-f3e39bce5173@baylibre.com>
References: <20240920-tps25990-v2-0-f3e39bce5173@baylibre.com>
In-Reply-To: <20240920-tps25990-v2-0-f3e39bce5173@baylibre.com>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, 
 Jonathan Corbet <corbet@lwn.net>, 
 Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>, 
 Naresh Solanki <naresh.solanki@9elements.com>, 
 Patrick Rudolph <patrick.rudolph@9elements.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-i2c@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2570; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=nxe3bIXN89F9dHDYwRgVlJarGFig5lhOLs3Ek1wlg04=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBm7alFWv3t0ARoCyw9ZNlcGGLAUU212y/x3vKIk
 Uua6x+dhgOJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZu2pRQAKCRDm/A8cN/La
 hS9jEACLJzvpKDGir66Hf5BG6qGk0l32W2tEI99+Dd256SFxIwLAsKnx3t8TcYIF+flcKq8bz07
 94Rx4ZGsjpwK7D3XB3hRzaI9YWPcwicFFnqLef57JNV1skYQXZOGNSJOUn92aumMrI3HhF/kgyG
 9J0w6rlK6jzpiq3ROwmgFmb5yhLv+bCXhKyJ/Sp53mK093EqVg6W02oUgJdx8Zb256htqSe2KXI
 pBVT/mrpxx41NH34rkaLmixQUT5N8meZ+Ri5Kg/DIi3iL+lJxp+klUVOVm7kC0HAmW8HhPO0C0g
 AqGMyErKQK16NMOyPF3yimOOSd/LfvUBlpOh88w4/5kiUOR+AK7l15cfrMnq+k4lXgYxk310oTG
 pvZt5Bu024aWAgptTP2EqeFpuwUkhZ0YpSUZXl29+gcw8Ggi4wG6xJEvlK/I3v5PauB2g2Sc6Ym
 TwcbgasJoAuscZXV1o41Tj69jEIM+aK9GX8/VAFCxREHdKV5j++Z1kHXODebyWZbLWxOAdVj2hv
 pfQ8ILxZJz68A2zIMlwTU4gA0D7Zzc0OVtrkXKihfxlKTL9CVOCqwpgZrtu7gpV+BruTZT6hlV6
 F2DTAQxviJM+4s10ZC8VtrVsfzoCJ3QXt6Z7179iOqwQZviDV4EgpLhGuPQbbepF1P5Y5gbsZO+
 RvddaMrXRjFT/sw==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Add DT binding for the Texas Instruments TPS25990 eFuse

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../bindings/hwmon/pmbus/ti,tps25990.yaml          | 83 ++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml
new file mode 100644
index 000000000000..f4115870e450
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+
+$id: http://devicetree.org/schemas/hwmon/pmbus/ti,tps25990.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments TPS25990 Stackable eFuse
+
+maintainers:
+  - Jerome Brunet <jbrunet@baylibre.com>
+
+description:
+  The TI TPS25990 is an integrated, high-current circuit
+  protection and power management device with PMBUS interface
+
+properties:
+  compatible:
+    const: ti,tps25990
+
+  reg:
+    maxItems: 1
+
+  ti,rimon-micro-ohms:
+    description:
+      micro Ohms value of the resistance installed between the Imon pin
+      and the ground reference.
+
+  interrupts:
+    description: PMBUS SMB Alert Interrupt.
+    maxItems: 1
+
+  regulators:
+    type: object
+    description:
+      list of regulators provided by this controller.
+
+    properties:
+      vout:
+        $ref: /schemas/regulator/regulator.yaml#
+        type: object
+        unevaluatedProperties: false
+
+      gpdac1:
+        $ref: /schemas/regulator/regulator.yaml#
+        type: object
+        unevaluatedProperties: false
+
+      gpdac2:
+        $ref: /schemas/regulator/regulator.yaml#
+        type: object
+        unevaluatedProperties: false
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - ti,rimon-micro-ohms
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        hw-monitor@46 {
+            compatible = "ti,tps25990";
+            reg = <0x46>;
+
+            interrupt-parent = <&gpio>;
+            interrupts = <42 IRQ_TYPE_LEVEL_LOW>;
+            ti,rimon-micro-ohms = <1370000000>;
+
+            regulators {
+                cpu0_vout: vout {
+                    regulator-name = "main_cpu0";
+                };
+            };
+        };
+    };

-- 
2.45.2


