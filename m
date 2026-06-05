Return-Path: <linux-doc+bounces-91042-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id b/uSCwdvImq4XAEAu9opvQ
	(envelope-from <linux-doc+bounces-91042-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 05 Jun 2026 08:39:03 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B49E764594E
	for <lists+linux-doc@lfdr.de>; Fri, 05 Jun 2026 08:39:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=163.com header.s=s110527 header.b=g2U8A9g2;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91042-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-91042-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=163.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 893A1305354A
	for <lists+linux-doc@lfdr.de>; Fri,  5 Jun 2026 06:32:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F2B140B6F9;
	Fri,  5 Jun 2026 06:31:57 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59FF9407592;
	Fri,  5 Jun 2026 06:31:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780641117; cv=none; b=kbkJCKWRTDfyhrA+iRz6nv1cqnGmRP97pBJZwc0/uTvq98UaBeg8FIZ2a64TEXJCj3VaWr9KyGIgVWH0Y/PKzC/ZfR6214gd11qWnQwOsWQvgxRR0lDNGvXkTSuDB7uHwuOS2aQSv6UY8sHSJontu+UD00PzyVubsdvq9Bxy9BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780641117; c=relaxed/simple;
	bh=hKtJBj6NbpM+g6kmjkW4KSom4gFoNvlMbMdPkKuqkbg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dn3rW1/+jUdYnFcwieJs8ctlWZhjBv6Zj6O+/znG6w2Nn58DRyq1Vbd26nW+FS/8DlpOfCLw4cBHjcblzhl6XGwci4VSoC+Rz6/W4mqmagtCtVX1ZHkdXOBee8mg+eY+sKRJKeiglVd5ZVKdZ4oMHe7EI5skLpZ/x1luFyA13qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=g2U8A9g2; arc=none smtp.client-ip=117.135.210.5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=PQ
	iPGhl1R3XE1rfbgWoU/FE0wGrBbGWg/k63y7WgUeQ=; b=g2U8A9g2S2tEs91pqU
	RYd9y9qFCXAkJktT5ZkS+iQArE6fTTJmyxvOXxnV1HKugnkUuW3qlWMboeL2QmoM
	zwjI83at4KiDakmDUtQIEHTUU0ScXoSMrNFKw5Clf+hjz9GaH3hJ6TLRfXkHsTiW
	he0wUCOF/Io+eGTzID9o+JgGM=
Received: from ZM.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wDnl3AjbSJqJU+5BQ--.9698S3;
	Fri, 05 Jun 2026 14:31:06 +0800 (CST)
From: Ziming Zhu <zmzhu0630@163.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Ziming Zhu <ziming.zhu@silergycorp.com>
Subject: [PATCH v2 1/3] dt-bindings: hwmon: pmbus: Add bindings for Silergy SQ24860
Date: Fri,  5 Jun 2026 14:30:40 +0800
Message-Id: <20260605063042.91776-2-zmzhu0630@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260605063042.91776-1-zmzhu0630@163.com>
References: <20260605063042.91776-1-zmzhu0630@163.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnl3AjbSJqJU+5BQ--.9698S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxJr18KF18uF15Xr4kWFy3Arb_yoW8Kw1DpF
	Z5uF9rJr48XryxWw47GFykZ3W5Zr1kAa1j9r9xJw1SyF98XFsYvrZIkrW5XF1UCr10yFy3
	ZFWqyryxt3s7Cr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07je-erUUUUU=
X-CM-SenderInfo: x2p2x3aqwtiqqrwthudrp/xtbCwAyJgmoibSzT1wAA3K
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-91042-lists,linux-doc=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[zmzhu0630@163.com,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux@roeck-us.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-hwmon@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:ziming.zhu@silergycorp.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[163.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zmzhu0630@163.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[163.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,silergycorp.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B49E764594E

From: Ziming Zhu <ziming.zhu@silergycorp.com>

Add devicetree binding documentation for the Silergy SQ24860 eFuse.

The device is a PMBus hardware monitoring device which reports voltage,
current, power, and temperature telemetry. The board-specific IMON
resistor value is described with silergy,rimon-micro-ohms.

Signed-off-by: Ziming Zhu <ziming.zhu@silergycorp.com>
---
 .../bindings/hwmon/pmbus/silergy,sq24860.yaml | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/silergy,sq24860.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/silergy,sq24860.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/silergy,sq24860.yaml
new file mode 100644
index 000000000000..03ef82c11e1a
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/silergy,sq24860.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+
+$id: http://devicetree.org/schemas/hwmon/pmbus/silergy,sq24860.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Silergy SQ24860 eFuse
+
+maintainers:
+  - Ziming Zhu <ziming.zhu@silergycorp.com>
+
+description:
+  The Silergy SQ24860 is an integrated, high-current circuit protection and
+  power management device with PMBus interface.
+
+properties:
+  compatible:
+    const: silergy,sq24860
+
+  reg:
+    maxItems: 1
+
+  silergy,rimon-micro-ohms:
+    description:
+      Micro-ohms value of the resistance installed between the IMON pin and
+      the ground reference.
+
+  interrupts:
+    description: PMBus SMBAlert interrupt.
+    maxItems: 1
+
+  regulators:
+    type: object
+    description:
+      List of regulators provided by this controller.
+
+    properties:
+      vout:
+        $ref: /schemas/regulator/regulator.yaml#
+        type: object
+        unevaluatedProperties: false
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - silergy,rimon-micro-ohms
+
+additionalProperties: false
+
+examples:
+  - |
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        hw-monitor@40 {
+            compatible = "silergy,sq24860";
+            reg = <0x40>;
+
+            interrupt-parent = <&gpio>;
+            interrupts = <42 8>;
+            silergy,rimon-micro-ohms = <1600000000>;
+
+            regulators {
+                cpu0_vout: vout {
+                    regulator-name = "main_cpu0";
+                };
+            };
+        };
+    };
-- 
2.25.1


