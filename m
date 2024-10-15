Return-Path: <linux-doc+bounces-27532-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F6899E246
	for <lists+linux-doc@lfdr.de>; Tue, 15 Oct 2024 11:09:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DBF082840DB
	for <lists+linux-doc@lfdr.de>; Tue, 15 Oct 2024 09:09:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E3541D12FE;
	Tue, 15 Oct 2024 09:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="v1uG+uOb"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3441D0B91
	for <linux-doc@vger.kernel.org>; Tue, 15 Oct 2024 09:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728983351; cv=none; b=W1ZV9pC4/i/u83TRf5woksfJ0ocT5KBF+J6LeakNigF5k0knSZ9uD7bWRseOmP1lNsMteP4zU03wZksaWHFsaSzrKF4+5xu/1Qo/KJyWsRSK/E5VTFdz3CFFmlAXNdbQ7KeXkQRUpI7RgRA5EEWEVReF3cXBHbUVXF4VcR+8Jjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728983351; c=relaxed/simple;
	bh=4dh88fpXjWM2OkXXxXiBrZ3khkFNnpHj68cspok1yCQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lelqjuTjD3oxkROXUjqL3iQjMHL0fhr3kmHjhO1woJ/IRxFIa9vls8V/A0tIZEwZ6L/m/IEiuVXvbd9yAY3UbGpcCGHGVS40IbDj4KfMnJEwWeVXZ16Q2mSw4tTxiyl/2I47p4mpgO+Mye2CZp35NWEzCfDS7ZktDWDyi20g8Nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=v1uG+uOb; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-430ee5c9570so60279895e9.3
        for <linux-doc@vger.kernel.org>; Tue, 15 Oct 2024 02:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1728983347; x=1729588147; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X4aYmJuLHLzqYiMUL6guFj8BGFqJEWSohxxnej/Omg0=;
        b=v1uG+uObJu3IZcR6YJNdrLbqPhyizsIclt9SzLyJh2cZ7lPU57aYVajd9dVndzOP2N
         4FA/pTfX2TKSILTy4sFDvXpQj3pD2mbtFdbhlR7oXiun5JGEwlTwcQGs19TgZELYZtmc
         9EYWQwCnP/S48rUZU7vwx3MHHgi8OR3gvIIPGUcXDuqelKj8bx8FOhwd9aXFWaN0WZWY
         bHaPyt0UBEqg/JRTQQfMwwOZB/6BAxsjrFPtjxlJlnOjomM7mo0rpFexU/vsD6IiuaFj
         8Fg6zfSTTa1Je3EY5nCRan6KM2SoUF4Lp88OSTzvGeOsYP9JZg4/SaM9kDxquUtfIJ0N
         l4Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728983347; x=1729588147;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X4aYmJuLHLzqYiMUL6guFj8BGFqJEWSohxxnej/Omg0=;
        b=GZZZHU2JSB1djKGVbui85mwzuPGz1mHx92B1yY8sD8xRtEalrYv0g4xo49k67YkpnZ
         qUe8cVech4rBllQtmmWM5ahD8xz11T49neF0U1CrcPT3dkT/HJouHXADsza4PTC2EPFy
         linwtVkc2UuwzWdC/tsiKIxfvAKOjFysiMKhkZrbqpvY2A34bF49o9YTuDzR87ITgY88
         +0Tnv/BOkacAvlH24xSsasY4KA4rTjrWkDcKZ/ZV182wpmtejTB4xXQTaKTHdmbwe2qF
         sJrR4gZ6IVzto6qbMEgE4n7gJ3UpZa4yaVeLGSiMttYoBPYrRRnSsv9wrg/D/ZL9+Gcb
         ZDKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBAZiepOjfXMlxjLwiWZagHVOgIqQCzH+O7UX08iejI8BrtA7h+Iv23ui95L2LIBjZP89Py8aQhdc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJClFvQGgftaL1yq5clMj8IoNJz+VI0OwaWyn9VvViIdC75eqU
	QZ/F/slNP0Nyu0+ht0KSQKkBTySHNz3UH3VQhXElfdkwOQlKmGpAwsGZtjneO+s=
X-Google-Smtp-Source: AGHT+IGxNNQhVbtGbCkgXPmG3o6BbJ/J81pJA5d4mXr1AJozq0VK+SfWfQmL++k8I6rL/CKCWrwDLg==
X-Received: by 2002:a05:600c:1d0b:b0:42b:ac3d:3abc with SMTP id 5b1f17b1804b1-43125607986mr137958365e9.24.1728983347147;
        Tue, 15 Oct 2024 02:09:07 -0700 (PDT)
Received: from [192.168.1.64] (2a02-842a-d52e-6101-6fd0-06c4-5d68-f0a5.rev.sfr.net. [2a02:842a:d52e:6101:6fd0:6c4:5d68:f0a5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fc123dasm1012882f8f.94.2024.10.15.02.09.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 02:09:06 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
Date: Tue, 15 Oct 2024 11:09:06 +0200
Subject: [PATCH RFC 1/4] dt-bindings: iio: adc: ad7380: add adaq4370-4 and
 adaq4380-4 compatible parts
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241015-ad7380-add-adaq4380-4-support-v1-1-d2e1a95fb248@baylibre.com>
References: <20241015-ad7380-add-adaq4380-4-support-v1-0-d2e1a95fb248@baylibre.com>
In-Reply-To: <20241015-ad7380-add-adaq4380-4-support-v1-0-d2e1a95fb248@baylibre.com>
To: Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 David Lechner <dlechner@baylibre.com>, Jonathan Cameron <jic23@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Julien Stephan <jstephan@baylibre.com>
X-Mailer: b4 0.14.1

adaq4370-4 (2MSPS) and adaq4380-4 (4MSPS) are quad-channel precision data
acquisition signal chain μModule solutions compatible with the ad738x
family, with the following differences:

- configurable gain in front of each 4 adc
- internal reference is 3V derived from refin-supply (5V)
- additional supplies

To configure the gain a new patternProperties is added to describe each
channel. It is restricted to adaq devices.

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 .../devicetree/bindings/iio/adc/adi,ad7380.yaml    | 117 +++++++++++++++++++++
 1 file changed, 117 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7380.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad7380.yaml
index 74d82721637c..3007d8e39684 100644
--- a/Documentation/devicetree/bindings/iio/adc/adi,ad7380.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7380.yaml
@@ -25,6 +25,8 @@ description: |
   * https://www.analog.com/en/products/ad7386-4.html
   * https://www.analog.com/en/products/ad7387-4.html
   * https://www.analog.com/en/products/ad7388-4.html
+  * https://www.analog.com/en/products/adaq4370-4.html
+  * https://www.analog.com/en/products/adaq4380-4.html
 
 
 $ref: /schemas/spi/spi-peripheral-props.yaml#
@@ -46,6 +48,8 @@ properties:
       - adi,ad7386-4
       - adi,ad7387-4
       - adi,ad7388-4
+      - adi,adaq4370-4
+      - adi,adaq4380-4
 
   reg:
     maxItems: 1
@@ -59,6 +63,9 @@ properties:
   vlogic-supply: true
   refio-supply: true
   refin-supply: true
+  vs-p-supply: true
+  vs-n-supply: true
+  ldo-supply: true
 
   aina-supply:
     description:
@@ -86,12 +93,43 @@ properties:
       specify the ALERT interrupt.
     maxItems: 1
 
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
 required:
   - compatible
   - reg
   - vcc-supply
   - vlogic-supply
 
+patternProperties:
+  "^channel@([0-3])$":
+    $ref: adc.yaml
+    type: object
+
+    properties:
+      reg:
+        description:
+          The channel number. From 0 to 3 corresponding to channels A,B,C,D
+        items:
+          minimum: 0
+          maximum: 3
+
+      adi,gain-milli:
+        description:
+          The hardware gain applied to the ADC input (in milli units).
+          If not present, default to 1000 (no actual gain applied).
+        $ref: /schemas/types.yaml#/definitions/uint32
+        default: 1000
+
+    required:
+      - reg
+
+    additionalProperties: false
+
 unevaluatedProperties: false
 
 allOf:
@@ -128,7 +166,21 @@ allOf:
         ainc-supply: false
         aind-supply: false
 
+  # Using channel to declare gain property only applies to adaq devices
+  - if:
+      properties:
+        compatible:
+          not:
+            contains:
+              enum:
+                - adi,adaq4370-4
+                - adi,adaq4380-4
+    then:
+      patternProperties:
+        "^channel@([0-3])$": false
+
   # ad7380-4 uses refin-supply as external reference.
+  # adaq devices use internal reference only, derived from refin-supply
   # All other chips from ad738x family use refio as optional external reference.
   # When refio-supply is omitted, internal reference is used.
   - if:
@@ -136,6 +188,8 @@ allOf:
         compatible:
           enum:
             - adi,ad7380-4
+            - adi,adaq4370-4
+            - adi,adaq4380-4
     then:
       properties:
         refio-supply: false
@@ -145,6 +199,24 @@ allOf:
       properties:
         refin-supply: false
 
+  # adaq devices need more supplies
+  - if:
+      properties:
+        compatible:
+          enum:
+            - adi,adaq4370-4
+            - adi,adaq4380-4
+    then:
+      required:
+        - vs-p-supply
+        - vs-n-supply
+        - ldo-supply
+    else:
+      properties:
+        vs-p-supply: false
+        vs-n-supply: false
+        ldo-supply: false
+
 examples:
   - |
     #include <dt-bindings/interrupt-controller/irq.h>
@@ -169,3 +241,48 @@ examples:
             refio-supply = <&supply_2_5V>;
         };
     };
+
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        adc@0 {
+            compatible = "adi,adaq4380-4";
+            reg = <0>;
+
+            spi-cpol;
+            spi-cpha;
+            spi-max-frequency = <80000000>;
+
+            interrupts = <27 IRQ_TYPE_EDGE_FALLING>;
+            interrupt-parent = <&gpio0>;
+
+            vcc-supply = <&supply_3_3V>;
+            vlogic-supply = <&supply_3_3V>;
+            refin-supply = <&supply_5V>;
+            vs-p-supply = <&supply_5V>;
+            vs-n-supply = <&supply_0V>;
+            ldo-supply = <&supply_5V>;
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            channel@0 {
+                reg = <0>;
+                adi,gain-milli = <300>;
+            };
+
+            channel@2 {
+                reg = <2>;
+                adi,gain-milli = <600>;
+            };
+
+            channel@3 {
+                reg = <3>;
+                adi,gain-milli = <1000>;
+            };
+        };
+    };

-- 
2.46.0


