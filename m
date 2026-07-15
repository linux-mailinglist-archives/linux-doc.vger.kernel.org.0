Return-Path: <linux-doc+bounces-96860-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IQgFMnzTVmqgBgEAu9opvQ
	(envelope-from <linux-doc+bounces-96860-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 15 Jul 2026 02:25:32 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0A1759B03
	for <lists+linux-doc@lfdr.de>; Wed, 15 Jul 2026 02:25:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="EJsKE1/s";
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96860-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-96860-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1B9713152AE5
	for <lists+linux-doc@lfdr.de>; Wed, 15 Jul 2026 00:23:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F17529AAEA;
	Wed, 15 Jul 2026 00:23:52 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E2C326158C;
	Wed, 15 Jul 2026 00:23:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784075032; cv=none; b=N4iqYR9SpT4NIqsLEJ2BCOl8jw6dY5c/MX1Si3Qk193JPudflRybE6LsSP68hvNJglS7AEur0quRs24sxkE25RDSrwNLFgCvPy2iodGNYAg8rv5DP3vvN3cFPwqP2OAlEUpNIEg9Hq18njTe0y01tOmE59FscJdjvcCYw5OyR1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784075032; c=relaxed/simple;
	bh=aZiQSJwTBJSWxKbkX3vpeELVRct4/V+YDRIm9sOQ0+I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j04SJfq6dWIqjLl5JLXXR/V5JMintG7aev6jPoZ6xP8bDrRUBsXDvADG0jYPqV3AQ9JYgJpnGsvRys6QZlg48FtDBckHQ0GYlb79QVLlzT4CDZOzMPy0p1G03HrHqAZ7Ohy+BhD6S5UTz13LENoaEcFkJ0zWK+V1acHQGponSO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EJsKE1/s; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89A971F00ACF;
	Wed, 15 Jul 2026 00:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784075030;
	bh=zBlXOadNEPylDjXjqjxYjc2w9yWcyZsP/8r9fw02Ymg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=EJsKE1/s5WrINpi+SXkIoj4WLXfPRaiIDwBS5NF364SWawIYdz0iLUq0Iian4QwR0
	 X5UjtxYyrEDtNza8cBVAnkBYyS8276YwHswFTXK3P4l9Xw9vO4xfP7r1MqaCfUtAXQ
	 ClSv1yjkeNkVlWGvkoZ4bThWM3EA/3kiKnM7VF1ZrHb5E7CFyhuT0qtVAtFqtV55ox
	 6lVACj4oaVG5HLCqHACEyXVDwbnciKE4YlM0nhnDULthiSKYsF1oMwsbRjpygwExWB
	 UTtaMI1pkAg8eiB1xMK4KZ4FX0y8ichoRXwwAgy5YfNTDDX+z9hr6BOADT8mPZzqOP
	 dvCIbOsqpRBXQ==
From: Drew Fustini <fustini@kernel.org>
Date: Tue, 14 Jul 2026 17:23:29 -0700
Subject: [PATCH v5 7/8] dt-bindings: riscv: Add binding for CBQRI
 controllers
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-dfustini-atl-sc-cbqri-dt-v5-7-b0ae7e9c932e@kernel.org>
References: <20260714-dfustini-atl-sc-cbqri-dt-v5-0-b0ae7e9c932e@kernel.org>
In-Reply-To: <20260714-dfustini-atl-sc-cbqri-dt-v5-0-b0ae7e9c932e@kernel.org>
To: Adrien Ricciardi <aricciardi@baylibre.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, Atish Kumar Patra <atishp@rivosinc.com>, 
 Atish Patra <atish.patra@linux.dev>, Babu Moger <babu.moger@amd.com>, 
 Ben Horgan <ben.horgan@arm.com>, Borislav Petkov <bp@alien8.de>, 
 Chen Pei <cp0613@linux.alibaba.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 Dave Martin <Dave.Martin@arm.com>, Fenghua Yu <fenghuay@nvidia.com>, 
 Gong Shuai <gong.shuai@sanechips.com.cn>, Gong Shuai <gsh517@gmail.com>, 
 guo.wenjia23@zte.com.cn, James Morse <james.morse@arm.com>, 
 =?utf-8?q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, liu.qingtao2@zte.com.cn, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
 Peter Newman <peternewman@google.com>, 
 =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>, 
 Reinette Chatre <reinette.chatre@intel.com>, Rob Herring <robh@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Tony Luck <tony.luck@intel.com>, Vasudevan Srinivasan <vasu@rivosinc.com>, 
 Ved Shanbhogue <ved@rivosinc.com>, Weiwei Li <liwei1518@gmail.com>, 
 yunhui cui <cuiyunhui@bytedance.com>, 
 Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>, 
 Drew Fustini <fustini@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 x86@kernel.org, devicetree@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 linux-doc@vger.kernel.org
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4724; i=fustini@kernel.org;
 h=from:subject:message-id; bh=aZiQSJwTBJSWxKbkX3vpeELVRct4/V+YDRIm9sOQ0+I=;
 b=owGbwMvMwCV2+43O4ZsaG3kYT6slMWSFXRZ8yzC5fcau9tTNE2qNXtnIf7nk9sTa+8P0JyuZD
 937JvXudkcpC4MYF4OsmCLLpg95F5Z4hX5dMP/FNpg5rEwgQxi4OAVgIlf4GRk2Nci2b3ptccJ9
 vb++1zNu7ooHU+25w3jNdsoeq//BkRLL8D9k5YcXKnqFthm/vV9qfxMv4lnfsLxx8jXFUwz7/h2
 dvZ0JAA==
X-Developer-Key: i=fustini@kernel.org; a=openpgp;
 fpr=1B6F948213EA489734F3997035D5CD577C1E6010
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:aricciardi@baylibre.com,m:alex@ghiti.fr,m:atishp@rivosinc.com,m:atish.patra@linux.dev,m:babu.moger@amd.com,m:ben.horgan@arm.com,m:bp@alien8.de,m:cp0613@linux.alibaba.com,m:conor.dooley@microchip.com,m:conor+dt@kernel.org,m:dave.hansen@linux.intel.com,m:Dave.Martin@arm.com,m:fenghuay@nvidia.com,m:gong.shuai@sanechips.com.cn,m:gsh517@gmail.com,m:guo.wenjia23@zte.com.cn,m:james.morse@arm.com,m:mindal@semihalf.com,m:krzk+dt@kernel.org,m:liu.qingtao2@zte.com.cn,m:zhiwei_liu@linux.alibaba.com,m:palmer@dabbelt.com,m:pjw@kernel.org,m:peternewman@google.com,m:rkrcmar@ventanamicro.com,m:reinette.chatre@intel.com,m:robh@kernel.org,m:samuel.holland@sifive.com,m:bigeasy@linutronix.de,m:tony.luck@intel.com,m:vasu@rivosinc.com,m:ved@rivosinc.com,m:liwei1518@gmail.com,m:cuiyunhui@bytedance.com,m:zhangzhanpeng.jasper@bytedance.com,m:fustini@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:x86@kernel.org,m:devicetree@vger.kernel.org,m:linux-rt-de
 vel@lists.linux.dev,m:linux-doc@vger.kernel.org,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[fustini@kernel.org,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[42];
	FREEMAIL_TO(0.00)[baylibre.com,ghiti.fr,rivosinc.com,linux.dev,amd.com,arm.com,alien8.de,linux.alibaba.com,microchip.com,kernel.org,linux.intel.com,nvidia.com,sanechips.com.cn,gmail.com,zte.com.cn,semihalf.com,dabbelt.com,google.com,ventanamicro.com,intel.com,sifive.com,linutronix.de,bytedance.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-96860-lists,linux-doc=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fustini@kernel.org,linux-doc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bytedance.com:email,baylibre.com:email,devicetree.org:url,vger.kernel.org:from_smtp,infradead.org:email,microchip.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5F0A1759B03

Document the device tree binding for RISC-V CBQRI capacity and bandwidth
controllers. Each controller is named by a device-specific compatible
followed by the generic compatible. The binding also describes the
common riscv,cbqri-rcid and riscv,cbqri-mcid properties, and the
optional riscv,cbqri-cache phandle that links a capacity controller to
the cache whose capacity it allocates.

Assisted-by: Claude:claude-opus-4-8
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Co-developed-by: Adrien Ricciardi <aricciardi@baylibre.com>
Signed-off-by: Adrien Ricciardi <aricciardi@baylibre.com>
Signed-off-by: Drew Fustini <fustini@kernel.org>
---
 .../devicetree/bindings/riscv/riscv,cbqri.yaml     | 97 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 98 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/riscv,cbqri.yaml b/Documentation/devicetree/bindings/riscv/riscv,cbqri.yaml
new file mode 100644
index 000000000000..62d547a0cb96
--- /dev/null
+++ b/Documentation/devicetree/bindings/riscv/riscv,cbqri.yaml
@@ -0,0 +1,97 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/riscv/riscv,cbqri.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RISC-V Capacity and Bandwidth QoS Register Interface (CBQRI) controller
+
+description: |
+  The RISC-V CBQRI specification defines capacity-controller and
+  bandwidth-controller register blocks that allocate cache capacity and memory
+  bandwidth to resource-control IDs (RCIDs) and monitor usage per
+  monitoring-counter ID (MCID):
+  https://github.com/riscv-non-isa/riscv-cbqri/blob/main/riscv-cbqri.pdf
+
+  Allocation and monitoring share one register block, and a controller may
+  implement either or both. A driver discovers which at runtime from the
+  capabilities register, so the compatible names only the controller type. It
+  does not distinguish allocation-only, monitoring-only or combined
+  controllers, and no property declares monitoring support.
+
+maintainers:
+  - Drew Fustini <fustini@kernel.org>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - tenstorrent,ascalon-shared-cache-controller
+          - const: riscv,cbqri-capacity-controller
+      - items:
+          - {}
+          - const: riscv,cbqri-bandwidth-controller
+
+  reg:
+    maxItems: 1
+    description:
+      The CBQRI controller register block.
+
+  riscv,cbqri-rcid:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The maximum number of RCIDs the controller supports. RCIDs are the
+      resource-control IDs that allocation operations target.
+
+  riscv,cbqri-mcid:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The maximum number of MCIDs the controller supports. MCIDs are the
+      monitoring-counter IDs that usage-monitoring operations target. Present
+      on controllers that implement monitoring.
+
+  riscv,cbqri-cache:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the cache node whose capacity this controller allocates.
+      Applies to capacity controllers that back a CPU cache. The cache level
+      and the harts sharing it are taken from that node's cache topology.
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: tenstorrent,ascalon-shared-cache-controller
+    then:
+      required:
+        - riscv,cbqri-rcid
+        - riscv,cbqri-cache
+
+additionalProperties: false
+
+examples:
+  - |
+    l2_cache: l2-cache {
+        compatible = "cache";
+        cache-level = <2>;
+        cache-unified;
+        cache-size = <0xc00000>;
+        cache-sets = <512>;
+        cache-block-size = <64>;
+    };
+
+    qos-controller@a21a00c0 {
+        compatible = "tenstorrent,ascalon-shared-cache-controller",
+                     "riscv,cbqri-capacity-controller";
+        reg = <0xa21a00c0 0xf40>;
+        riscv,cbqri-rcid = <16>;
+        riscv,cbqri-cache = <&l2_cache>;
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index b9bded8d3dd6..7acdab42e9c5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23363,6 +23363,7 @@ M:	Drew Fustini <fustini@kernel.org>
 R:	yunhui cui <cuiyunhui@bytedance.com>
 L:	linux-riscv@lists.infradead.org
 S:	Supported
+F:	Documentation/devicetree/bindings/riscv/riscv,cbqri.yaml
 F:	arch/riscv/include/asm/qos.h
 F:	arch/riscv/include/asm/resctrl.h
 F:	arch/riscv/kernel/qos.c

-- 
2.43.0


