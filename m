Return-Path: <linux-doc+bounces-89987-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0AzcMu5hGWrfvwgAu9opvQ
	(envelope-from <linux-doc+bounces-89987-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 29 May 2026 11:52:46 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DEF6003B8
	for <lists+linux-doc@lfdr.de>; Fri, 29 May 2026 11:52:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 23377306690D
	for <lists+linux-doc@lfdr.de>; Fri, 29 May 2026 09:52:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8E063CE4AC;
	Fri, 29 May 2026 09:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="l098FqpO"
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D7E43C5525;
	Fri, 29 May 2026 09:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780048318; cv=none; b=bPXlYKn+MzIJj1HULxURb9PE2qIYtvF7eiMQbsM4+p7pUqRnjZRLj/4kETKgBVExdNYCJtppTaERwGQEKFVn4J0qXnKAHmJSYu6HYFSya/H2WuGz3fNwkAAfP9ijk/HN8Ne8XFW3zmcGL1X0ceB/ANXXJjgRGuwncSQnjpxwLq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780048318; c=relaxed/simple;
	bh=G1ftAdKNVg9HYWt6/7QhaAQawKb5RYu0DeFnL5fEvGQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oPFdRNf9b+lcFCSig4+dgelk6jZ7T687H7C6iIDe1cT1zsYW5qbYR/arRS/Wdbi4iKWYvaB85gzciCiB8gEANQh1G/TMvaDMcI4rXLjw9XHWIoaxaMrMb6XXZxlq5v+RTTMinES3TtquwXL2myXe16DGgrT++LWpvFibZok8iRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=l098FqpO; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B913422D7;
	Fri, 29 May 2026 02:51:51 -0700 (PDT)
Received: from e134710.arm.com (e134710.arm.com [10.33.10.82])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5B4AE3F905;
	Fri, 29 May 2026 02:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780048316; bh=G1ftAdKNVg9HYWt6/7QhaAQawKb5RYu0DeFnL5fEvGQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=l098FqpO1fiETy/PtHT1VY75tQtwkAoOGNUItobgKu8uMq+/fOGXZe6ks1JsDmhnq
	 ozj3xwjuCol0qwfvZwqZknHvXKm0TGTTEKgadBYMLv3FiMnnvk0mKGC1cBz0INc3/j
	 4ZPPPW85NyTMKTlBLysWhmxEun0qdMHrs0zCRTkc=
From: Ahmed Tiba <ahmed.tiba@arm.com>
Date: Fri, 29 May 2026 10:50:49 +0100
Subject: [PATCH v5 09/10] dt-bindings: firmware: add arm,ras-cper
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260529-topics-ahmtib01-ras_ffh_arm_internal_review-v5-9-2e0500d42642@arm.com>
References: <20260529-topics-ahmtib01-ras_ffh_arm_internal_review-v5-0-2e0500d42642@arm.com>
In-Reply-To: <20260529-topics-ahmtib01-ras_ffh_arm_internal_review-v5-0-2e0500d42642@arm.com>
To: will@kernel.org, jic23@kernel.org, xueshuai@linux.alibaba.com, 
 saket.dumbre@intel.com, mchehab@kernel.org, dave@stgolabs.net, 
 djbw@kernel.org, bp@alien8.de, tony.luck@intel.com, guohanjun@huawei.com, 
 lenb@kernel.org, skhan@linuxfoundation.org, vishal.l.verma@intel.com, 
 rafael@kernel.org, corbet@lwn.net, ira.weiny@intel.com, 
 dave.jiang@intel.com, krzk+dt@kernel.org, robh@kernel.org, 
 catalin.marinas@arm.com, alison.schofield@intel.com, conor+dt@kernel.org
Cc: Ahmed Tiba <ahmed.tiba@arm.com>, linux-arm-kernel@lists.infradead.org, 
 Michael.Zhao2@arm.com, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-cxl@vger.kernel.org, 
 Dmitry.Lamerov@arm.com, devicetree@vger.kernel.org, 
 linux-acpi@vger.kernel.org, linux-edac@vger.kernel.org, 
 acpica-devel@lists.linux.dev
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780048269; l=2722;
 i=ahmed.tiba@arm.com; s=20260219; h=from:subject:message-id;
 bh=G1ftAdKNVg9HYWt6/7QhaAQawKb5RYu0DeFnL5fEvGQ=;
 b=yJnoEaUmwzQl3GmFCFEwHXg6/dKhep2MRU6opjCH8f3XDi0ulkMs3PFg4YBVOvW+ORW4wPgae
 Bw8FEWluc2uBIJBsJ+h84yM6yMvTO5SjzAEE7UjUgq1CLVikSYAZoDA
X-Developer-Key: i=ahmed.tiba@arm.com; a=ed25519;
 pk=xVOtd+Qklh/4tuM3tB+BEZD4jj5a6W59C3KCNX6v7OE=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[33];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-89987-lists,linux-doc=lfdr.de];
	DKIM_TRACE(0.00)[arm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ahmed.tiba@arm.com,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,intel.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,arm.com:email,arm.com:mid,arm.com:dkim,alien8.de:email]
X-Rspamd-Queue-Id: 85DEF6003B8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Describe the DeviceTree node that exposes the Arm firmware-first
CPER provider and hook the file into MAINTAINERS so the
binding has an owner.

Signed-off-by: Ahmed Tiba <ahmed.tiba@arm.com>
---
 .../devicetree/bindings/firmware/arm,ras-cper.yaml | 54 ++++++++++++++++++++++
 MAINTAINERS                                        |  5 ++
 2 files changed, 59 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/arm,ras-cper.yaml b/Documentation/devicetree/bindings/firmware/arm,ras-cper.yaml
new file mode 100644
index 000000000000..3d4de096093f
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/arm,ras-cper.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/firmware/arm,ras-cper.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Arm RAS CPER provider
+
+maintainers:
+  - Ahmed Tiba <ahmed.tiba@arm.com>
+
+description:
+  Arm Reliability, Availability and Serviceability (RAS) firmware can expose
+  a firmware-first CPER error source directly via DeviceTree. Firmware
+  provides the CPER Generic Error Status block and notifies the OS through
+  an interrupt.
+
+properties:
+  compatible:
+    const: arm,ras-cper
+
+  memory-region:
+    minItems: 1
+    items:
+      - description:
+          CPER Generic Error Status block exposed by firmware.
+      - description:
+          Optional firmware-owned ack buffer used on platforms
+          where firmware needs an explicit "ack" handshake before overwriting
+          the CPER buffer. Firmware watches bit 0 and expects the OS to set it
+          once the current status block has been consumed.
+
+  interrupts:
+    maxItems: 1
+    description:
+      Interrupt used to signal that a new status record is ready.
+
+required:
+  - compatible
+  - memory-region
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    error-handler {
+      compatible = "arm,ras-cper";
+      memory-region = <&ras_cper_buffer>, <&ras_cper_ack>;
+      interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 461a3eed6129..8a9714603a7d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22261,6 +22261,11 @@ M:	Alexandre Bounine <alex.bou9@gmail.com>
 S:	Maintained
 F:	drivers/rapidio/
 
+RAS ERROR STATUS
+M:	Ahmed Tiba <ahmed.tiba@arm.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/firmware/arm,ras-cper.yaml
+
 RAS INFRASTRUCTURE
 M:	Tony Luck <tony.luck@intel.com>
 M:	Borislav Petkov <bp@alien8.de>

-- 
2.43.0


