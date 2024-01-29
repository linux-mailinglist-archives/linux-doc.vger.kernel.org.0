Return-Path: <linux-doc+bounces-7737-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B96BD840AE6
	for <lists+linux-doc@lfdr.de>; Mon, 29 Jan 2024 17:10:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 704A828C48E
	for <lists+linux-doc@lfdr.de>; Mon, 29 Jan 2024 16:10:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D470D155A30;
	Mon, 29 Jan 2024 16:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="zKTwSDIB"
X-Original-To: linux-doc@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF531552F0;
	Mon, 29 Jan 2024 16:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706544652; cv=none; b=V1HaFtSLjInPidJpDDXck7nrftxY3YyfFTqAYAU/Ag7Bx0lOp6jcRNZMqZDfZOzliPV/23wpxNaHCrG6se0HCFNrfY2timpmTxEAm78VpLFAdtWGLCT0rRgo6pqL2h/yvCg2954q3628dYsyf3ujzcmrXdpDbhG0SSUEchAeZdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706544652; c=relaxed/simple;
	bh=ZdJGndHJg1Gr94HiGpRLJwT1aZwNTGAaTzRFB72GWBM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=deboujxyntpTXzT/uao9TeZn0yAq7KvsobyydMXUtji9qzb1uSrRjMqDWbnooWY0Rc3W2EItn/LUjJLqzt51V+7VMPXxf4O10p8aLlU7ppLnC4zUkUOMhQ6dOciWDAo9asxso0pW9zio6m8cdWddaYOVLjm2yEkoipoxxc3f0ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=zKTwSDIB; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40TEl4Um021517;
	Mon, 29 Jan 2024 11:10:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=
	from:date:subject:mime-version:content-type
	:content-transfer-encoding:message-id:references:in-reply-to:to
	:cc; s=DKIM; bh=pd7LbYy7+I7PAfZoMd54gQ1GOcjvb1vidNUDn2YaKEg=; b=
	zKTwSDIBm0FRVPyZxxQ4U3lJFXPMV2NyDCxlub1QNGxr5368e/xDPscx1l3/8Yyf
	sQdGievr+8Js6j0AOqH/H7KLYg0WBOiQ5r2NfWuSIgFqTgq3LlbFG9zXWarLa+ai
	12o1VDmIQaB6WeyJGogJG4Zr5E3MLiHegrMy9IXF1sxqMm3BB+ouH9bgl7rijywW
	cS2GkpOiOMhelv8BJyVDXtIMj66KJVNwuf2xGWcm4d92lrmXSxcchLxTHENFTAzx
	r5cOqXBkdcccYk2vSDCePOiYB8lQiHWTZEDMoS943CdXlgBWJpa8zDNjOJR1nVFQ
	XmKyiV967LlAxeOp1HJaMg==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 3vxe398afm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jan 2024 11:10:26 -0500 (EST)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 40TGAPKg040997
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 29 Jan 2024 11:10:25 -0500
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Mon, 29 Jan
 2024 11:10:24 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Mon, 29 Jan 2024 11:10:24 -0500
Received: from [127.0.0.1] ([10.44.3.54])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 40TGA9Cg002356;
	Mon, 29 Jan 2024 11:10:19 -0500
From: Nuno Sa <nuno.sa@analog.com>
Date: Mon, 29 Jan 2024 17:13:23 +0100
Subject: [PATCH RESEND v4 1/3] dt-bindings: hwmon: Add LTC4282 bindings
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240129-b4-ltc4282-support-v4-1-fe75798164cc@analog.com>
References: <20240129-b4-ltc4282-support-v4-0-fe75798164cc@analog.com>
In-Reply-To: <20240129-b4-ltc4282-support-v4-0-fe75798164cc@analog.com>
To: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-doc@vger.kernel.org>
CC: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
        Rob
 Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1706544807; l=6554;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=ZdJGndHJg1Gr94HiGpRLJwT1aZwNTGAaTzRFB72GWBM=;
 b=VBjQT3h9JEwzF4IHW30QCM9AD8XpFv0cKgUtQteaCQd1bWbz6YBZPxE8R9WxpZ4fKunw+rPt0
 dt46ZG1tTBhBaIKxpvA/RLmdjGD0YiDyQpQfOJcJeJ3Z/G5j28tc3zY
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: ckHiErGGs98E3bOxMoV_RzdzscfvH6Nv
X-Proofpoint-ORIG-GUID: ckHiErGGs98E3bOxMoV_RzdzscfvH6Nv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-29_10,2024-01-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 mlxlogscore=999 priorityscore=1501 impostorscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401290118

Add bindings for the LTC4282 High Current Hot Swap Controller with I2C
Compatible Monitoring.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Nuno Sa <nuno.sa@analog.com>
---
 .../devicetree/bindings/hwmon/adi,ltc4282.yaml     | 159 +++++++++++++++++++++
 MAINTAINERS                                        |   6 +
 2 files changed, 165 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/adi,ltc4282.yaml b/Documentation/devicetree/bindings/hwmon/adi,ltc4282.yaml
new file mode 100644
index 000000000000..4854b95a93e3
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/adi,ltc4282.yaml
@@ -0,0 +1,159 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/adi,ltc4282.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices LTC4282 I2C High Current Hot Swap Controller over I2C
+
+maintainers:
+  - Nuno Sa <nuno.sa@analog.com>
+
+description: |
+  Analog Devices LTC4282 I2C High Current Hot Swap Controller over I2C.
+
+  https://www.analog.com/media/en/technical-documentation/data-sheets/ltc4282.pdf
+
+properties:
+  compatible:
+    enum:
+      - adi,ltc4282
+
+  reg:
+    maxItems: 1
+
+  vdd-supply: true
+
+  clocks:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 0
+
+  adi,rsense-nano-ohms:
+    description: Value of the sense resistor.
+
+  adi,vin-mode-microvolt:
+    description:
+      Selects operating range for the Undervoltage, Overvoltage and Foldback
+      pins. Also for the ADC. Should be set to the nominal input voltage.
+    enum: [3300000, 5000000, 12000000, 24000000]
+    default: 12000000
+
+  adi,fet-bad-timeout-ms:
+    description:
+      From the moment a FET bad conditions is present, this property selects the
+      wait time/timeout for a FET-bad fault to be signaled. Setting this to 0,
+      disables FET bad faults to be reported.
+    default: 255
+    maximum: 255
+
+  adi,overvoltage-dividers:
+    description: |
+      Select which dividers to use for VDD Overvoltage detection. Note that
+      when the internal dividers are used the threshold is referenced to VDD.
+      The percentages in the datasheet are misleading since the actual values
+      to look for are in the "Absolute Maximum Ratings" table in the
+      "Comparator Inputs" section. In there there's a line for each of the 5%,
+      10% and 15% settings with the actual min, typical and max tolerances.
+    $ref: /schemas/types.yaml#/definitions/string
+    enum: [external, vdd_5_percent, vdd_10_percent, vdd_15_percent]
+    default: external
+
+  adi,undervoltage-dividers:
+    description: |
+      Select which dividers to use for VDD Overvoltage detection. Note that
+      when the internal dividers are used the threshold is referenced to VDD.
+      The percentages in the datasheet are misleading since the actual values
+      to look for are in the "Absolute Maximum Ratings" table in the
+      "Comparator Inputs" section. In there there's a line for each of the 5%,
+      10% and 15% settings with the actual min, typical and max tolerances.
+    $ref: /schemas/types.yaml#/definitions/string
+    enum: [external, vdd_5_percent, vdd_10_percent, vdd_15_percent]
+    default: external
+
+  adi,current-limit-sense-microvolt:
+    description:
+      The current limit sense voltage of the chip is adjustable between
+      12.5mV and 34.4mV in 3.1mV steps. This effectively limits the current
+      on the load.
+    enum: [12500, 15625, 18750, 21875, 25000, 28125, 31250, 34375]
+    default: 25000
+
+  adi,overcurrent-retry:
+    description:
+      If set, enables the chip to auto-retry 256 timer cycles after an
+      Overcurrent fault.
+    type: boolean
+
+  adi,overvoltage-retry-disable:
+    description:
+      If set, disables the chip to auto-retry 50ms after an Overvoltage fault.
+      It's enabled by default.
+    type: boolean
+
+  adi,undervoltage-retry-disable:
+    description:
+      If set, disables the chip to auto-retry 50ms after an Undervoltage fault.
+      It's enabled by default.
+    type: boolean
+
+  adi,fault-log-enable:
+    description:
+      If set, enables the FAULT_LOG and ADC_ALERT_LOG registers to be written
+      to the EEPROM when a fault bit transitions high and hence, will be
+      available after a power cycle (the chip loads the contents of
+      the EE_FAULT_LOG register - the one in EEPROM - into FAULT_LOG at boot).
+    type: boolean
+
+  adi,gpio1-mode:
+    description: Defines the function of the Pin. It can indicate that power is
+      good (PULL the pin low when power is not good) or that power is bad (Go
+      into high-z when power is not good).
+    $ref: /schemas/types.yaml#/definitions/string
+    enum: [power_bad, power_good]
+    default: power_good
+
+  adi,gpio2-mode:
+    description: Defines the function of the Pin. It can be set as the input for
+      the ADC or indicating that the MOSFET is in stress (dissipating power).
+    $ref: /schemas/types.yaml#/definitions/string
+    enum: [adc_input, stress_fet]
+    default: adc_input
+
+  adi,gpio3-monitor-enable:
+    description: If set, gpio3 is set as input for the ADC instead of gpio2.
+    type: boolean
+
+allOf:
+  - if:
+      required:
+        - adi,gpio3-monitor-enable
+    then:
+      properties:
+        adi,gpio2-mode:
+          const: stress_fet
+
+required:
+  - compatible
+  - reg
+  - adi,rsense-nano-ohms
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        hwmon@50 {
+            compatible = "adi,ltc4282";
+            reg = <0x50>;
+            adi,rsense-nano-ohms = <500>;
+
+            adi,gpio1-mode = "power_good";
+            adi,gpio2-mode = "adc_input";
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 5e7239cb40ea..3c5f7ae166f0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12759,6 +12759,12 @@ S:	Maintained
 F:	Documentation/hwmon/ltc4261.rst
 F:	drivers/hwmon/ltc4261.c
 
+LTC4282 HARDWARE MONITOR DRIVER
+M:	Nuno Sa <nuno.sa@analog.com>
+L:	linux-hwmon@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/hwmon/adi,ltc4282.yaml
+
 LTC4286 HARDWARE MONITOR DRIVER
 M:	Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
 L:	linux-i2c@vger.kernel.org

-- 
2.43.0


