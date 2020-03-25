Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB417191F74
	for <lists+linux-doc@lfdr.de>; Wed, 25 Mar 2020 03:50:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727316AbgCYCu3 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 24 Mar 2020 22:50:29 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17817 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727280AbgCYCu3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 24 Mar 2020 22:50:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1585103595;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=From:To:Cc:Message-ID:Subject:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type;
        bh=q3522WmCMcchsrcIlYC+4bPpCWTc6GzKb+1Lr0erI0g=;
        b=aow0CiwG/hBJpTXuR4X2GcdsbXYILhWzbR25pZEkKL1dnOVaDH2BRyez6/6r2dd2
        GjGJmQMVISsaLIHz0qfSOU8kCoB0KQMx+2rbtyEPtJLbhSVAONkI3SkFlJ/VTIJkPCT
        907zcU85fxxghl04s5c2HjtqFr3yGfNUyXzMVASQ=
Received: from localhost.localdomain (39.155.141.144 [39.155.141.144]) by mx.zoho.com.cn
        with SMTPS id 1585103593296580.9934269828649; Wed, 25 Mar 2020 10:33:13 +0800 (CST)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Rob Herring <robh@kernel.org>, Huacai Chen <chenhc@lemote.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Paul Cercueil <paul@crapouillou.net>,
        John Crispin <john@phrozen.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        "David S. Miller" <davem@davemloft.net>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Andi Kleen <ak@linux.intel.com>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Yinglu Yang <yangyinglu@loongson.cn>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        Allison Randal <allison@lohutok.net>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Paul Burton <paulburton@kernel.org>,
        Manuel Lauss <manuel.lauss@gmail.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Matt Redfearn <matt.redfearn@mips.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-ide@vger.kernel.org
Message-ID: <20200325022916.106641-6-jiaxun.yang@flygoat.com>
Subject: [PATCH v7 03/12] dt-bindings: interrupt-controller: Add Loongson LIOINTC
Date:   Wed, 25 Mar 2020 10:28:21 +0800
X-Mailer: git-send-email 2.26.0.rc2
In-Reply-To: <20200325022916.106641-1-jiaxun.yang@flygoat.com>
References: <20200325022916.106641-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoCNMailClient: External
Content-Type: text/plain; charset=utf8
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Document Loongson I/O Interrupt controller.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Co-developed-by: Huacai Chen <chenhc@lemote.com>
Signed-off-by: Huacai Chen <chenhc@lemote.com>
---
 .../loongson,liointc.yaml                     | 93 +++++++++++++++++++
 1 file changed, 93 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/=
loongson,liointc.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/loongso=
n,liointc.yaml b/Documentation/devicetree/bindings/interrupt-controller/loo=
ngson,liointc.yaml
new file mode 100644
index 000000000000..9c6b91fee477
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/loongson,lioin=
tc.yaml
@@ -0,0 +1,93 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/interrupt-controller/loongson,liointc.=
yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Loongson Local I/O Interrupt Controller
+
+maintainers:
+  - Jiaxun Yang <jiaxun.yang@flygoat.com>
+
+description: |
+  This interrupt controller is found in the Loongson-3 family of chips as =
the primary
+  package interrupt controller which can route local I/O interrupt to inte=
rrupt lines
+  of cores.
+
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - const: loongson,liointc-1.0
+      - const: loongson,liointc-1.0a
+
+  reg:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  interrupts:
+    description:
+      Interrupt source of the CPU interrupts.
+    minItems: 1
+    maxItems: 4
+
+  interrupt-names:
+    description: List of names for the parent interrupts.
+    items:
+      - const: int0
+      - const: int1
+      - const: int2
+      - const: int3
+    minItems: 1
+    maxItems: 4
+
+  '#interrupt-cells':
+    const: 2
+
+  'loongson,parent_int_map':
+    description: |
+      This property points how the children interrupts will be mapped into=
 CPU
+      interrupt lines. Each cell refers to a parent interrupt line from 0 =
to 3
+      and each bit in the cell refers to a children interrupt fron 0 to 31=
.
+      If a CPU interrupt line didn't connected with liointc, then keep it'=
s
+      cell with zero.
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32-array
+      - items:
+          minItems: 4
+          maxItems: 4
+
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-controller
+  - '#interrupt-cells'
+  - 'loongson,parent_int_map'
+
+
+examples:
+  - |
+    iointc: interrupt-controller@3ff01400 {
+      compatible =3D "loongson,liointc-1.0";
+      reg =3D <0x3ff01400 0x64>;
+
+      interrupt-controller;
+      #interrupt-cells =3D <2>;
+
+      interrupt-parent =3D <&cpuintc>;
+      interrupts =3D <2>, <3>;
+      interrupt-names =3D "int0", "int1";
+
+      loongson,parent_int_map =3D <0xf0ffffff>, /* int0 */
+                                <0x0f000000>, /* int1 */
+                                <0x00000000>, /* int2 */
+                                <0x00000000>; /* int3 */
+
+    };
+
+...
--=20
2.26.0.rc2


