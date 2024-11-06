Return-Path: <linux-doc+bounces-30026-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D4A9BDEB8
	for <lists+linux-doc@lfdr.de>; Wed,  6 Nov 2024 07:18:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D71F0285BA8
	for <lists+linux-doc@lfdr.de>; Wed,  6 Nov 2024 06:18:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31F3317B4FC;
	Wed,  6 Nov 2024 06:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b="k26eFjfO"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55981192B6B
	for <linux-doc@vger.kernel.org>; Wed,  6 Nov 2024 06:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730873905; cv=none; b=EGjVj0Fl9RD4LJ3IT7WW6SB7fYBrQiw1XPzpGtSyYu2AMdRGnRnRWVKplGmnY+sqGdllbg1jCfrMXjxuFdwhW967mHnOu3h4KPW5W2ERWMY8gEeOJSQSJdCF1Mev5Rs85ofqTtE7+WRAVFwOYoLN1Afnf0yOswXzfgNVXDwn5vI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730873905; c=relaxed/simple;
	bh=w+XHq9w7Bz9O2dHFT5zj8vUvIOCoNUqwqvDDMjf/3u0=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jQ8FBTLxDhRpBvkZxjJrBScSvlrXeb6T6gaCVRqUMpbzAEPruAdjnASfFnN1XZhT6egkHx+oalwS/GuqjOyurWaofTJPW/0WfshT6luCE60she8pL19wmWBEs3LeImkMecXSfdiiKVhaOCC37kERTp6bzkkxDPkkjKG9alq1llU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk; spf=pass smtp.mailfrom=remote-tech.co.uk; dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b=k26eFjfO; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=remote-tech.co.uk
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5c9404c0d50so7547148a12.3
        for <linux-doc@vger.kernel.org>; Tue, 05 Nov 2024 22:18:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=remote-tech-co-uk.20230601.gappssmtp.com; s=20230601; t=1730873902; x=1731478702; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zHi7Lp38jT8FmPt7TMK4PF42l87ejDv0GI3ZM6aDB/0=;
        b=k26eFjfOXSZJzH0CGSVlqHcOczgctV2x/O3PQaAm4AKSzj2LKoKjkwUb3JkyaB2EAW
         txz2gxsGP9BzaKV2WEhsmlhBLCodcukcD3qx8iKwHB6z98dZwXpcMXkvGUbZZr2LX9xS
         ON4pR2+qatpTJ4pjKR3BxbwpUqZmLBsj4vgRu32OgsqzUOtbtg8J6sGK8Lm7YBkn2qoD
         aafh9OWcvZi30EgfrWELgSGotcgg/QVNPFjwXkUESYsRYdcz0siZpsMwomJNVKTXKTBx
         mhsLlhkPOrBvAmYlc3KXFx3dPiOwYVOt1Z4JLEtxfY3eMWn5V0s0MKb0piozM1786oWr
         6zXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730873902; x=1731478702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zHi7Lp38jT8FmPt7TMK4PF42l87ejDv0GI3ZM6aDB/0=;
        b=fsWcaOdQnNa/+h41jEFqHaw9mRK2G50SKt/DwBgpDYGM6L9cTCkbH+sYVw2Ki8SrMZ
         avMMSnO98HZmbbE+efTQ7wVXosJ8U4rexkwTnaEBejxHMbFHbOUL1T0uGLDPF4Ha/0P0
         6OxX5qJGe+5W+VQQpZ+h/2QIU3mNUeiCrpr0qq/zH8y1dHVm0AMx+NsSdm8niOn/UzW3
         S8M6RBpVQRMank1P6IYPZ5uCT3FLkOWRCyOXa7fi4fUa6A/eq0VUyxoOCBNfDJqGwUvX
         iLGRHTwu8uGhbCukp2BkFKAAHOLEMjG5vjGNukLIBi2bUzOclP/P5yed4sS0/1BG5PJ6
         ThMw==
X-Forwarded-Encrypted: i=1; AJvYcCVyTD3EWg6/Ng4zVDBF3lkl8EnD7gfbl16grJ6sn046TW+Mj/v+AjMt/n1qhdGYA4SsG+mgQxHFow4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6w3abO0IypwDS6KmY2mz6lhUHczPyNSCsn/A6uqTa4XHJ1yKY
	fz/GazQ01WvWRcXk0qC7YDTWIGehM97Da3RBoDOqXtL55U7Zx2zBk+8pRx97MQhw4Om4mBplRLg
	Uw6GuNK4tNSp1MMhREHHPEr2oudZPeR+hm8toVurg66EDEvgceL+6X34PrGYXDZqX5YcH+GR+kj
	7wOZCnlB3jV+JBGIDfI6dvFxc=
X-Google-Smtp-Source: AGHT+IEvauvbIcdk/auONxb/0Op8p4Q/d+ZwECWBvxyMYvWi4k33l5h9kT3lkSNfqa2WgLCbhk+6ow==
X-Received: by 2002:a17:907:7e8e:b0:a99:e939:d69e with SMTP id a640c23a62f3a-a9de61d1a8cmr3138392066b.51.1730873901592;
        Tue, 05 Nov 2024 22:18:21 -0800 (PST)
Received: from localhost.localdomain ([178.27.36.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb17cecccsm232360866b.102.2024.11.05.22.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 22:18:20 -0800 (PST)
From: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH 2/3] [PATCH v4] dt-bindings: leds: Add LED1202 LED Controller
Date: Wed,  6 Nov 2024 06:18:08 +0000
Message-Id: <20241106061812.6819-2-vicentiu.galanopulo@remote-tech.co.uk>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241106061812.6819-1-vicentiu.galanopulo@remote-tech.co.uk>
References: <20241106061812.6819-1-vicentiu.galanopulo@remote-tech.co.uk>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The LED1202 is a 12-channel low quiescent current LED driver with:
  * Supply range from 2.6 V to 5 V
  * 20 mA current capability per channel
  * 1.8 V compatible I2C control interface
  * 8-bit analog dimming individual control
  * 12-bit local PWM resolution
  * 8 programmable patterns

If the led node is present in the controller then the channel is
set to active.

v1: https://lore.kernel.org/lkml/ZnCnnQfwuRueCIQ0@admins-Air/T/
v2: https://lore.kernel.org/all/ZniNdGgKyUMV-hjq@admins-Air/T/
v3: https://lore.kernel.org/all/ZniNdGgKyUMV-hjq@admins-Air/T/

Signed-off-by: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>

---
Changes in v4:
  - remove label property, use devm_led_classdev_register_ext instead
  - use as base patch the v3
Changes in v3:
  - remove active property
Changes in v2:
  - renamed label to remove color from it
  - add color property for each node
  - add function and function-enumerator property for each node
---
 .../devicetree/bindings/leds/st,led1202.yaml  | 132 ++++++++++++++++++
 1 file changed, 132 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/st,led1202.yaml

diff --git a/Documentation/devicetree/bindings/leds/st,led1202.yaml b/Documentation/devicetree/bindings/leds/st,led1202.yaml
new file mode 100644
index 000000000000..7e49e6464d41
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/st,led1202.yaml
@@ -0,0 +1,132 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/st,led1202.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ST LED1202 LED controllers
+
+maintainers:
+  - Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
+
+description: |
+  The LED1202 is a 12-channel low quiescent current LED controller
+  programmable via I2C; The output current can be adjusted separately
+  for each channel by 8-bit analog and 12-bit digital dimming control.
+  Datasheet available at
+  https://www.st.com/en/power-management/led1202.html
+
+properties:
+  compatible:
+    const: st,led1202
+
+  reg:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+    
+patternProperties:
+  "^led@[0-9a-f]$":
+    type: object
+    $ref: common.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        minimum: 0
+        maximum: 11
+
+    required:
+      - reg
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/leds/common.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        led-controller@58 {
+            compatible = "st,led1202";
+            reg = <0x58>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            led@0 {
+                reg = <0x0>;
+                function = LED_FUNCTION_STATUS;
+                color = <LED_COLOR_ID_RED>;
+                function-enumerator = <1>;
+            };
+
+            led@1 {
+                reg = <0x1>;
+                function = LED_FUNCTION_STATUS;
+                color = <LED_COLOR_ID_GREEN>;
+                function-enumerator = <2>;
+            };
+
+            led@2 {
+                reg = <0x2>;
+                function = LED_FUNCTION_STATUS;
+                color = <LED_COLOR_ID_BLUE>;
+                function-enumerator = <3>;
+            };
+
+            led@3 {
+                reg = <0x3>;
+                function = LED_FUNCTION_STATUS;
+                color = <LED_COLOR_ID_RED>;
+                function-enumerator = <4>;
+            };
+
+            led@4 {
+                reg = <0x4>;
+                function = LED_FUNCTION_STATUS;
+                color = <LED_COLOR_ID_GREEN>;
+                function-enumerator = <5>;
+            };
+
+            led@5 {
+                reg = <0x5>;
+                function = LED_FUNCTION_STATUS;
+                color = <LED_COLOR_ID_BLUE>;
+                function-enumerator = <6>;
+            };
+
+            led@6 {
+                reg = <0x6>;
+                function = LED_FUNCTION_STATUS;
+                color = <LED_COLOR_ID_RED>;
+                function-enumerator = <7>;
+            };
+
+            led@7 {
+                reg = <0x7>;
+                function = LED_FUNCTION_STATUS;
+                color = <LED_COLOR_ID_GREEN>;
+                function-enumerator = <8>;
+            };
+
+            led@8 {
+                reg = <0x8>;
+                function = LED_FUNCTION_STATUS;
+                color = <LED_COLOR_ID_BLUE>;
+                function-enumerator = <9>;
+            };
+        };
+    };
+...
-- 
2.25.1


