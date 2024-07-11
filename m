Return-Path: <linux-doc+bounces-20535-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E0F92EF6C
	for <lists+linux-doc@lfdr.de>; Thu, 11 Jul 2024 21:16:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6CDF5285C7C
	for <lists+linux-doc@lfdr.de>; Thu, 11 Jul 2024 19:16:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B3DE1EA85;
	Thu, 11 Jul 2024 19:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="shR8Z7tw"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47B416D4D0
	for <linux-doc@vger.kernel.org>; Thu, 11 Jul 2024 19:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720725359; cv=none; b=ITDo0DQzLDzqXnftKPtMo7d5pAjb45Xo1a7KlVPCCPv4weTQqqbTPrg7XsdAPgsP7GIUVrUiMM4otwIgmpogDI/Lxxg85liRibjF0nPNzSbecyymM88Ku8OSWSl66a7t5nWkQ5ZWsWPbt5ThJz9P07zLr27Fa/7BVEdI6Q25VUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720725359; c=relaxed/simple;
	bh=gfHiONb+cHJIVTqfB/9PNM4sr78jejHlJxtoIigQzJE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QeUKd9lHVUwqq7Lv9RRs8La5cLrz5WoKTzgFeKzBxQK7dQcj9pdi+ELGcU3iswIs2opx3zlOABrEVO3nDVcqkEBXpugg26gGp6OQirVvzm0eupjYdYM8xCD0YGMpH8ULzyycIgBEafFQ2ZmMStLu51EXMzWTpgrTcka5lmNAaBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=shR8Z7tw; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7035b717880so1045577a34.1
        for <linux-doc@vger.kernel.org>; Thu, 11 Jul 2024 12:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1720725356; x=1721330156; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DXl8ONeqJDCtJjXFOdFbBuLWW4pS+f6rPe69JfJPHDY=;
        b=shR8Z7twutTDFOCdjLvQhuqQvaOqZGgCpdwT5r9xzhfvHHVnTw7wxVuB3zVYxEujV+
         FzW9jGI/W3XKo4j7ShCBCHRinmYuHvfX/yZ4LA5RdBGn7QQa+wOFmzVP4MAd2wklMf+p
         2LmmrhQqzqZkr+mI6RvSlnvs9j1ob7mI3Vlcyhkf8Q6DKRLboXtnPjzX6vRfCvmO9Brk
         y2jwJdDfIYigrQuSYRC4RZkEMviKrN3kerW7s33Y/HoGhjBEvmuJER0Ye/mxadDMA8w/
         lI/3d+EoEbU5Y93m7TeVi9niHkZsQdRLmUTcS7TYZOknjpkpk/ktqUwGn5CR0t/V6l8q
         ItqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720725356; x=1721330156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DXl8ONeqJDCtJjXFOdFbBuLWW4pS+f6rPe69JfJPHDY=;
        b=DOmiQOUr+IMRw1+83CXPIeqOc5x68Yz9XdxOXvFl9WXb3cZLBEQ4agXbKg2x+pDX6J
         HxYjZD75Y/cDBAayyWHl+EPnNZMXbU+RxQplLRrJXBCj0BxyNNuMGURxdEJXa0zo68s9
         UaZnL488wgNLsSeIZVP1VQoxgGxCqT57ldI+eiRk9eCxnh3dDjLnF+eoEHHlhGeLK0XH
         JVvbNdxAJU60PQGZENsXMkkoygPb8OWa/GiZEcaq4KlevyETGF2VddxzECpqhG37SWw1
         YsASi69kipsG74mFGowajELy0Jo9v+xUPAB1BSn/9O3k6viywRM63iblUOBe0zmqol9u
         GNwg==
X-Forwarded-Encrypted: i=1; AJvYcCWXnLdfD4/FjWGnS6SVDUR3ZW92JyVQ+23VYnAYPVObH48iy5g+eNbFnjgFsygYqMChTMsPdfdzwpCkYoKoeYFAd344jme8GUOX
X-Gm-Message-State: AOJu0YwhYHHv+87+z2Uppk1alRNSVhdfuCDmfVm88q67lNfdR0puwKcv
	VR8EzEyaS6yX9mhO255Zfsd2XROpgTfmoHqp2Nlo0Tu2e/OCIAkkYGDfn3KsDfA=
X-Google-Smtp-Source: AGHT+IFGBzIS69PrcU1224cquu79zc+Im3Rapec/YVgIdzE9YQciBWM9pLTqaUBNywANmN9AxdffWg==
X-Received: by 2002:a05:6870:a70d:b0:255:43c:dd22 with SMTP id 586e51a60fabf-26052d6b533mr224007fac.21.1720725355847;
        Thu, 11 Jul 2024 12:15:55 -0700 (PDT)
Received: from localhost.localdomain (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25eaa083bbcsm1826670fac.26.2024.07.11.12.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 12:15:55 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	Michael Hennerich <michael.hennerich@analog.com>,
	=?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 1/3] dt-bindings: iio: adc: add AD4695 and similar ADCs
Date: Thu, 11 Jul 2024 14:15:41 -0500
Message-ID: <20240711-iio-adc-ad4695-v4-1-c31621113b57@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240711-iio-adc-ad4695-v4-0-c31621113b57@baylibre.com>
References: <20240711-iio-adc-ad4695-v4-0-c31621113b57@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.14.0
Content-Transfer-Encoding: 8bit

Add device tree bindings for AD4695 and similar ADCs.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: David Lechner <dlechner@baylibre.com>
---

Note, this may trigger a DT build warning "common-mode-channel: missing
type definition" if the builder doesn't include the recently added
common-mode-channel property [1]. This should be safe to ignore (passes
make dt_binding_check locally).

[1] https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git/commit/?h=testing&id=d86deaec1c5b0fb60c3619e8d2ae7a1d722fd2ad

v4 changes:
* Picked up Conor's reviewed-by tag.

v3 changes:
* Change interrupts to be per pin instead of per signal.
* Drop diff-channels and single-channel properties.
* Odd numbered pins added to common-mode-channel property enum.
* REFGND and COM values changes to avoid confusion with pin numbers.
* Add inX-supply properties for odd numbed input pins.

v2 changes:
* Drop *-wlcsp compatible strings
* Don't use fallback compatible strings
* Reword supply descriptions
* Use standard channel properties instead of adi,pin-pairing
* Fix unnecessary | character
* Fix missing blank line
* Add header file with common mode channel macros
---
 .../devicetree/bindings/iio/adc/adi,ad4695.yaml    | 256 +++++++++++++++++++++
 MAINTAINERS                                        |  10 +
 include/dt-bindings/iio/adi,ad4695.h               |   9 +
 3 files changed, 275 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad4695.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad4695.yaml
new file mode 100644
index 000000000000..a2e824e26691
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/adi,ad4695.yaml
@@ -0,0 +1,256 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/adc/adi,ad4695.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices Easy Drive Multiplexed SAR Analog to Digital Converters
+
+maintainers:
+  - Michael Hennerich <Michael.Hennerich@analog.com>
+  - Nuno Sá <nuno.sa@analog.com>
+
+description: |
+  A family of similar multi-channel analog to digital converters with SPI bus.
+
+  * https://www.analog.com/en/products/ad4695.html
+  * https://www.analog.com/en/products/ad4696.html
+  * https://www.analog.com/en/products/ad4697.html
+  * https://www.analog.com/en/products/ad4698.html
+
+$ref: /schemas/spi/spi-peripheral-props.yaml#
+
+properties:
+  compatible:
+    enum:
+      - adi,ad4695
+      - adi,ad4696
+      - adi,ad4697
+      - adi,ad4698
+
+  reg:
+    maxItems: 1
+
+  spi-max-frequency:
+    maximum: 80000000
+
+  spi-cpol: true
+  spi-cpha: true
+
+  spi-rx-bus-width:
+    minimum: 1
+    maximum: 4
+
+  avdd-supply:
+    description: Analog power supply.
+
+  vio-supply:
+    description: I/O pin power supply.
+
+  ldo-in-supply:
+    description: Internal LDO Input. Mutually exclusive with vdd-supply.
+
+  vdd-supply:
+    description: Core power supply. Mutually exclusive with ldo-in-supply.
+
+  ref-supply:
+    description:
+      External reference voltage. Mutually exclusive with refin-supply.
+
+  refin-supply:
+    description:
+      Internal reference buffer input. Mutually exclusive with ref-supply.
+
+  com-supply:
+    description: Common voltage supply for pseudo-differential analog inputs.
+
+  adi,no-ref-current-limit:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      When this flag is present, the REF Overvoltage Reduced Current protection
+      is disabled.
+
+  adi,no-ref-high-z:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Enable this flag if the ref-supply requires Reference Input High-Z Mode
+      to be disabled for proper operation.
+
+  cnv-gpios:
+    description: The Convert Input (CNV). If omitted, CNV is tied to SPI CS.
+    maxItems: 1
+
+  reset-gpios:
+    description: The Reset Input (RESET). Should be configured GPIO_ACTIVE_LOW.
+    maxItems: 1
+
+  interrupts:
+    minItems: 1
+    items:
+      - description: Signal coming from the BSY_ALT_GP0 pin (ALERT or BUSY).
+      - description: Signal coming from the GP2 pin (ALERT).
+      - description: Signal coming from the GP3 pin (BUSY).
+
+  interrupt-names:
+    minItems: 1
+    items:
+      - const: gp0
+      - const: gp2
+      - const: gp3
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+    description: |
+      The first cell is the GPn number: 0 to 3.
+      The second cell takes standard GPIO flags.
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^in(?:[13579]|1[135])-supply$":
+    description:
+      Optional voltage supply for odd numbered channels when they are used as
+      the negative input for a pseudo-differential channel.
+
+  "^channel@[0-9a-f]$":
+    type: object
+    $ref: adc.yaml
+    unevaluatedProperties: false
+    description:
+      Describes each individual channel. In addition the properties defined
+      below, bipolar from adc.yaml is also supported.
+
+    properties:
+      reg:
+        maximum: 15
+
+      common-mode-channel:
+        description:
+          Describes the common mode channel for single channels. 0xFF is REFGND
+          and OxFE is COM. Macros are available for these values in
+          dt-bindings/iio/adi,ad4695.h. Values 1 to 15 correspond to INx inputs.
+          Only odd numbered INx inputs can be used as common mode channels.
+        items:
+          enum: [1, 3, 5, 7, 9, 11, 13, 15, 0xFE, 0xFF]
+        default: 0xFF
+
+      adi,no-high-z:
+        $ref: /schemas/types.yaml#/definitions/flag
+        description:
+          Enable this flag if the input pin requires the Analog Input High-Z
+          Mode to be disabled for proper operation.
+
+    required:
+      - reg
+
+    allOf:
+      # bipolar mode can't be used with REFGND
+      - if:
+          properties:
+            common-mode-channel:
+              const: 0xFF
+        then:
+          properties:
+            bipolar: false
+
+required:
+  - compatible
+  - reg
+  - avdd-supply
+  - vio-supply
+
+allOf:
+  - oneOf:
+      - required:
+          - ldo-in-supply
+      - required:
+          - vdd-supply
+
+  - oneOf:
+      - required:
+          - ref-supply
+      - required:
+          - refin-supply
+
+  # the internal reference buffer always requires high-z mode
+  - if:
+      required:
+        - refin-supply
+    then:
+      properties:
+        adi,no-ref-high-z: false
+
+  # limit channels for 8-channel chips
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - adi,ad4697
+              - adi,ad4698
+    then:
+      patternProperties:
+        "^in(?:9|1[135])-supply$": false
+        "^channel@[0-7]$":
+          properties:
+            reg:
+              maximum: 7
+            common-mode-channel:
+              items:
+                enum: [1, 3, 5, 7, 0xFE, 0xFF]
+        "^channel@[8-9a-f]$": false
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/iio/adi,ad4695.h>
+
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        adc@0 {
+            compatible = "adi,ad4695";
+            reg = <0>;
+            spi-cpol;
+            spi-cpha;
+            spi-max-frequency = <80000000>;
+            avdd-supply = <&power_supply>;
+            ldo-in-supply = <&power_supply>;
+            vio-supply = <&io_supply>;
+            refin-supply = <&supply_5V>;
+            com-supply = <&supply_2V5>;
+            in3-supply = <&supply_2V5>;
+            reset-gpios = <&gpio 1 GPIO_ACTIVE_LOW>;
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            /* Pseudo-differential channel between IN0 and REFGND. */
+            channel@0 {
+                reg = <0>;
+            };
+
+            /* Pseudo-differential channel between IN1 and COM. */
+            channel@1 {
+                reg = <1>;
+                common-mode-channel = <AD4695_COMMON_MODE_COM>;
+                bipolar;
+            };
+
+            /* Pseudo-differential channel between IN2 and IN3. */
+            channel@2 {
+                reg = <2>;
+                common-mode-channel = <3>;
+                bipolar;
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 06ecfa64a39a..4aea2efd307d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1208,6 +1208,16 @@ F:	Documentation/ABI/testing/sysfs-bus-iio-adc-ad4130
 F:	Documentation/devicetree/bindings/iio/adc/adi,ad4130.yaml
 F:	drivers/iio/adc/ad4130.c
 
+ANALOG DEVICES INC AD4695 DRIVER
+M:	Michael Hennerich <michael.hennerich@analog.com>
+M:	Nuno Sá <nuno.sa@analog.com>
+R:	David Lechner <dlechner@baylibre.com>
+L:	linux-iio@vger.kernel.org
+S:	Supported
+W:	https://ez.analog.com/linux-software-drivers
+F:	Documentation/devicetree/bindings/iio/adc/adi,ad4695.yaml
+F:	include/dt-bindings/iio/adi,ad4695.h
+
 ANALOG DEVICES INC AD7091R DRIVER
 M:	Marcelo Schmitt <marcelo.schmitt@analog.com>
 L:	linux-iio@vger.kernel.org
diff --git a/include/dt-bindings/iio/adi,ad4695.h b/include/dt-bindings/iio/adi,ad4695.h
new file mode 100644
index 000000000000..9fbef542bf67
--- /dev/null
+++ b/include/dt-bindings/iio/adi,ad4695.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef _DT_BINDINGS_ADI_AD4695_H
+#define _DT_BINDINGS_ADI_AD4695_H
+
+#define AD4695_COMMON_MODE_REFGND	0xFF
+#define AD4695_COMMON_MODE_COM		0xFE
+
+#endif /* _DT_BINDINGS_ADI_AD4695_H */

-- 
2.43.0


