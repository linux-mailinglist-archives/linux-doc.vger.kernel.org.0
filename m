Return-Path: <linux-doc+bounces-74500-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iB22ErA7e2mNCgIAu9opvQ
	(envelope-from <linux-doc+bounces-74500-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 29 Jan 2026 11:51:28 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A86AFAF276
	for <lists+linux-doc@lfdr.de>; Thu, 29 Jan 2026 11:51:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD455307B724
	for <lists+linux-doc@lfdr.de>; Thu, 29 Jan 2026 10:37:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 357C0389444;
	Thu, 29 Jan 2026 10:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fQM+6KFN"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E6038886F
	for <linux-doc@vger.kernel.org>; Thu, 29 Jan 2026 10:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769682944; cv=none; b=h8g9vCJJTV67cAG2rPdCOwAK1b2re7GWGLP9f4vzVsMVi/A3IjZTWC0HzswODWFwXiJlrTfemVqwKyW3vpZL3yYximMsa9iJQpAT4fwo+U4O0YXJqRppAaSHzLaYc6s5INbH7Anm48ol9oIbXdr9OTerS6T04d9x5PWtjbqk308=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769682944; c=relaxed/simple;
	bh=kWozlliMREgPF6YIV89573NA3c8VlkGSeiXliAHVyyg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jG4VzLjixZMe9LrXFmL5YkOltsrCh/DLXld6YOcbTkAOZyD6FozO4puYvHEQegT/LRiCBUZLkF/+YQDLMeBlx3dba2NkCOlDW8EYFNWtGEVcIvLBpEYeca6VvpEmMSQmsiIpqyf6KvC8Ioc+g5noAkoh6Y2rml+1JKuJKh97UB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fQM+6KFN; arc=none smtp.client-ip=209.85.216.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f68.google.com with SMTP id 98e67ed59e1d1-3532aa9a77eso365983a91.0
        for <linux-doc@vger.kernel.org>; Thu, 29 Jan 2026 02:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769682942; x=1770287742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tfoxd/ejIA68qoIgzgIEC3EuLOs13hAOpSNjixMOs8E=;
        b=fQM+6KFN+/wtnwYWIj10gH1d1jm+DwnQTsMJ8cRU4fI7MueGVH18mQ7wyduPXofbYw
         g2W9r5OZY8g0Ri/to1s/Vx8FBsVv2DOmcNUefN1olIBAs61NspiGuTS3IH+z+OFkIM3F
         KmeQRxHAGQ1kNoiitEAuE++FSNtOoaZrvt1aYsaW1tKFzxa890A+l9iZcXKR28uEjepj
         v0XYumoDMRBcqbUo599mdlHwUSffD140qpTG/I/3B8Gu5VtgKEUp9wXqImezxI1wzVd/
         jS8uDsTFlEzKdj8AuQND7O6LyiDszRgOJ1iR6iJBS3EWuqoEl1XXOu97T/wJuVkiooOe
         H/Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769682942; x=1770287742;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tfoxd/ejIA68qoIgzgIEC3EuLOs13hAOpSNjixMOs8E=;
        b=L0n0hnKUMfSBLNuDrw2js+w04GHHl3vYUZe1hKrV4KwdCbXnWn5ufQhs432wIGl7J4
         1OTCkybViwn3MgRX4w9y9XvLD7c7aWqHu45fzRcUCVHjohJRE2wD9tJcOV1erKTRSsv9
         5ppAfFjXbkl65xwjUMMDIDRDASwf7GMjy6YfVrUd5FVCS94HNPJYAc6YkOllWmCGM+z2
         fyL5HB8d5zrXxf3h5xhCCbIcG5ot/OvrdQcNYITc71xMS7VJnILBzKIBUTswssgc4w4/
         nIvBzxAX29V5EOgb0z9rA6/1YpRtesM35uY7Px0vZmh6GK5CXSPTZGupnKhV3k2BcX9R
         X6IA==
X-Forwarded-Encrypted: i=1; AJvYcCVa6KCOHYG08wczv1cSDLs7WFo5w0tYNPJp8C4i7LQlew8JUQW6LOvAKpPsTap07f7PccujTfxKrsE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRrvw7gTJmbHlAU4zh+AQIQzwVYxQ/aULNI867X8agiokzXsdU
	sz2QIo2EtTdapAXssHLhqZhi3vPabd8xS9rpJRnLnYdO+m5CPONqx4cMNS/afS1jEiU=
X-Gm-Gg: AZuq6aLaTXfyBIdHHjidVmqK8OAitRSUMiLXsIdik8e2AdoFMAlQQwf8XRhnm3+w815
	6hTVvVdZgE6V1o5d72pO0p2ff3BjVqWC0BUwAc0h8tSTRck2jTo2/CWoLKnPKu9xNrjzNxLk9kQ
	++eTpBsVjiiUwwG6QBApbws7ay/yBS05c+LPmlBfKCFPgElXK30XPiLXo4p3RkUaI2wMoPINkm+
	uGoH/rcFHYFwbUmfuexXnf9aXPv/6seAduq6aFiRJqNdxf5IE/uaqZaalIR8MxxVpgVx0SnjGr+
	kw3IV9NiqVAKGPNwokEbsjI5E45xFaKj+IcVdMBqFTHB6ifqxpmxG6RlOygZl0QGuLqZ54Tf/3o
	zW6BV8Ptcaixw4i8Nfw+vj2Wkm/KE6/2flN9x2x95OLn3FZF/vwAiGMeQRnHZjmsVubqLN4Qvqy
	zRrhg88ke6rAavwr0DVQ==
X-Received: by 2002:a17:90b:1fce:b0:33b:bed8:891c with SMTP id 98e67ed59e1d1-353fed7583dmr8442405a91.23.1769682941739;
        Thu, 29 Jan 2026 02:35:41 -0800 (PST)
Received: from fedora ([2401:4900:88b9:bf38:c14f:4b45:ff2f:89f7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3540f2f24ccsm6245461a91.8.2026.01.29.02.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 02:35:41 -0800 (PST)
From: harshdaniel66356@gmail.com
To: gregkh@linuxfoundation.org
Cc: devel@driverdev.osuosl.org,
	linux-doc@vger.kernel.org,
	Harsh Daniel <harshdaniel66356@gmail.com>
Subject: [PATCH] dt-bindings: media: Add bindings for dim2 compatible strings Add device tree bindings for the compatible strings used in the staging/most/dim2 driver to resolve checkpatch warnings: - fsl,imx6q-mlb150 - renesas,mlp and renesas,rcar-gen3-mlp - xlnx,axi4-os62420_3pin-1.00.a and xlnx,axi4-os62420_6pin-1.00.a These bindings document the MediaLB DIM2 module found in Freescale i.MX6Q, Renesas R-Car, and Xilinx FPGA platforms.
Date: Thu, 29 Jan 2026 16:04:26 +0530
Message-ID: <20260129103426.113005-1-harshdaniel66356@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.34 / 15.00];
	LONG_SUBJ(3.00)[431];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[driverdev.osuosl.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-74500-lists,linux-doc=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshdaniel66356@gmail.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,218e000:email]
X-Rspamd-Queue-Id: A86AFAF276
X-Rspamd-Action: no action

From: Harsh Daniel <harshdaniel66356@gmail.com>

Signed-off-by: Harsh Daniel <harshdaniel66356@gmail.com>
---
 .../bindings/media/fsl,imx6q-mlb150.yaml      | 73 +++++++++++++++++++
 .../bindings/media/renesas,mlp.yaml           | 65 +++++++++++++++++
 .../media/xilinx/xlnx,axi4-os62420.yaml       | 60 +++++++++++++++
 3 files changed, 198 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/fsl,imx6q-mlb150.yaml
 create mode 100644 Documentation/devicetree/bindings/media/renesas,mlp.yaml
 create mode 100644 Documentation/devicetree/bindings/media/xilinx/xlnx,axi4-os62420.yaml

diff --git a/Documentation/devicetree/bindings/media/fsl,imx6q-mlb150.yaml b/Documentation/devicetree/bindings/media/fsl,imx6q-mlb150.yaml
new file mode 100644
index 000000000000..2d0aab3d2286
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/fsl,imx6q-mlb150.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/fsl,imx6q-mlb150.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX6Q MediaLB DIM2 Controller
+
+maintainers:
+  - Andrey Shvetsov <andrey.shvetsov@k2l.de>
+
+description: |
+  MediaLB DIM2 module found in Freescale i.MX6Q SoCs.
+
+properties:
+  compatible:
+    const: fsl,imx6q-mlb150
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: MediaLB Interrupt
+      - description: AHB0 Interrupt
+
+  clocks:
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    minItems: 1
+    maxItems: 2
+    items:
+      - const: mlb
+      - const: pll8_mlb
+
+  microchip,clock-speed:
+    $ref: /schemas/types.yaml#/definitions/string
+    enum:
+      - 256fs
+      - 512fs
+      - 1024fs
+      - 2048fs
+      - 3072fs
+      - 4096fs
+      - 6144fs
+      - 8192fs
+    description: DIM2 clock speed.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - microchip,clock-speed
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    mlb@218e000 {
+        compatible = "fsl,imx6q-mlb150";
+        reg = <0x0218e000 0x4000>;
+        interrupts = <0 150 IRQ_TYPE_LEVEL_HIGH>,
+                     <0 151 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clks 1>, <&clks 2>;
+        clock-names = "mlb", "pll8_mlb";
+        microchip,clock-speed = "2048fs";
+    };
diff --git a/Documentation/devicetree/bindings/media/renesas,mlp.yaml b/Documentation/devicetree/bindings/media/renesas,mlp.yaml
new file mode 100644
index 000000000000..1b87f0de11f8
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/renesas,mlp.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/renesas,mlp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas MediaLB DIM2 Controller
+
+maintainers:
+  - Andrey Shvetsov <andrey.shvetsov@k2l.de>
+
+description: |
+  MediaLB DIM2 module found in Renesas R-Car Gen2 and Gen3 SoCs.
+
+properties:
+  compatible:
+    enum:
+      - renesas,mlp
+      - renesas,rcar-gen3-mlp
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: MediaLB Interrupt
+      - description: AHB0 Interrupt
+
+  clocks:
+    maxItems: 1
+
+  microchip,clock-speed:
+    $ref: /schemas/types.yaml#/definitions/string
+    enum:
+      - 256fs
+      - 512fs
+      - 1024fs
+      - 2048fs
+      - 3072fs
+      - 4096fs
+      - 6144fs
+      - 8192fs
+    description: DIM2 clock speed.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - microchip,clock-speed
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    
+    mlp@e6050000 {
+        compatible = "renesas,mlp";
+        reg = <0xe6050000 0x1000>;
+        interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&cpg 123>;
+        microchip,clock-speed = "2048fs";
+    };
diff --git a/Documentation/devicetree/bindings/media/xilinx/xlnx,axi4-os62420.yaml b/Documentation/devicetree/bindings/media/xilinx/xlnx,axi4-os62420.yaml
new file mode 100644
index 000000000000..25884a56027e
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/xilinx/xlnx,axi4-os62420.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/xilinx/xlnx,axi4-os62420.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Xilinx MediaLB DIM2 Controller
+
+maintainers:
+  - Andrey Shvetsov <andrey.shvetsov@k2l.de>
+
+description: |
+  MediaLB DIM2 module found in Xilinx FPGAs.
+
+properties:
+  compatible:
+    enum:
+      - xlnx,axi4-os62420_3pin-1.00.a
+      - xlnx,axi4-os62420_6pin-1.00.a
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: MediaLB Interrupt
+      - description: AHB0 Interrupt
+
+  microchip,clock-speed:
+    $ref: /schemas/types.yaml#/definitions/string
+    enum:
+      - 256fs
+      - 512fs
+      - 1024fs
+      - 2048fs
+      - 3072fs
+      - 4096fs
+      - 6144fs
+      - 8192fs
+    description: DIM2 clock speed.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - microchip,clock-speed
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    
+    dim2@e6050000 {
+        compatible = "xlnx,axi4-os62420_3pin-1.00.a";
+        reg = <0x43c00000 0x10000>;
+        interrupts = <0 144 IRQ_TYPE_LEVEL_HIGH>,
+                     <0 145 IRQ_TYPE_LEVEL_HIGH>;
+        microchip,clock-speed = "2048fs";
+    };
-- 
2.52.0


