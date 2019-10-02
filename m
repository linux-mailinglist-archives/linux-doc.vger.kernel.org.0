Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9828C8938
	for <lists+linux-doc@lfdr.de>; Wed,  2 Oct 2019 15:05:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727499AbfJBNFJ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 2 Oct 2019 09:05:09 -0400
Received: from mail-eopbgr80051.outbound.protection.outlook.com ([40.107.8.51]:20989
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727399AbfJBNFI (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 2 Oct 2019 09:05:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BSf+rW0ax1RemBPnnktLnig3Q1DbAMYNY3aazyHMJ0XWjVjsBmGm/yNDVcJbLj8jwToMwwF/6/RdWqmZH7rzv3bLk4tDC0RLoc3tm4EF9UMmQpsGtXXc7ifRl5dlqitVVYrHf151Pr19UhqfLRXIYb1WsG3SnWBYrUU4hZYcjBzMuWsPGawg8TU3jVl3Rdobz3C0eUveAOKTEhV8FTJPbbSslCovlJjHLdbkIWqZg4iTkYYs0oPZIVAmQgezc+HpB+9f6Or+h7t1YDJ6b1VlVLdAbNnZsWiLZe5ksTxKubNpZrd3iXYaUpJikqYS7Kl5qfK0qxeCeYsb+T91NuE5Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r4pXt2e4qv3Gh5kNmg9sjnWtdv4OzTWJZw/BecsqhoY=;
 b=V5//Rdqm9uBJWteyH+xLCYmbh+CYmMvRnb64w/mUxa6sL6RtnGbpIabJlgsRZz1cQC4Xshqa0lHrlOi31a6cdJlHys8Go0/QMbucXTci6JBJCvK/6iXqus4/pfAXhbycvws5KuDklV8+1J9E/WWv/Im0du51ivP3J5OZ/MSoi7IIjmnS9y8tpS14NwGf0L0WbnE/8+ekdNFLWaANKxoHJbz/yL91wva6KpZ6Pknv3upXvGhgCUN+Ejf3bYp0DQpI3APFYgbkqriG+CCijOBz4NSvBfYmtpjXEhh2CWL7fcGakxzxjrCrKzPU34PG1bGgP002PyZJucQdKBf2LLmmsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r4pXt2e4qv3Gh5kNmg9sjnWtdv4OzTWJZw/BecsqhoY=;
 b=KMDrKRWvWWsWyhjKC0Jt6KotimXj20PumwLMt2Oz0f6epWsotkhFkFlxDg8BA15Saq5BN5hegpmp77zn5xyYLjMkCo8hLk/st0m+rNX8SD6s40GE+717J4R2ab154kdfUyo19dwPTO46tJZkOJhYQhCLxIREr5oBPW9zhFDbaFs=
Received: from VI1PR0402MB2863.eurprd04.prod.outlook.com (10.175.20.18) by
 VI1PR0402MB3918.eurprd04.prod.outlook.com (52.134.17.31) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.15; Wed, 2 Oct 2019 13:04:47 +0000
Received: from VI1PR0402MB2863.eurprd04.prod.outlook.com
 ([fe80::fd33:c447:3cab:c36]) by VI1PR0402MB2863.eurprd04.prod.outlook.com
 ([fe80::fd33:c447:3cab:c36%7]) with mapi id 15.20.2305.023; Wed, 2 Oct 2019
 13:04:47 +0000
From:   Stefan-gabriel Mirea <stefan-gabriel.mirea@nxp.com>
To:     "corbet@lwn.net" <corbet@lwn.net>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
        "will@kernel.org" <will@kernel.org>
CC:     "jslaby@suse.com" <jslaby@suse.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Cosmin Stefan Stoica <cosmin.stoica@nxp.com>,
        Dan Nica <dan.nica@nxp.com>,
        Larisa Ileana Grigore <larisa.grigore@nxp.com>
Subject: [PATCH v5 4/5] arm64: dts: fsl: Add device tree for S32V234-EVB
Thread-Topic: [PATCH v5 4/5] arm64: dts: fsl: Add device tree for S32V234-EVB
Thread-Index: AQHVeSH13ei8gudWtU2BYmtDnHFg0w==
Date:   Wed, 2 Oct 2019 13:04:44 +0000
Message-ID: <20191002130425.28905-5-stefan-gabriel.mirea@nxp.com>
References: <20191002130425.28905-1-stefan-gabriel.mirea@nxp.com>
In-Reply-To: <20191002130425.28905-1-stefan-gabriel.mirea@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.22.0
x-clientproxiedby: PR0P264CA0194.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1f::14) To VI1PR0402MB2863.eurprd04.prod.outlook.com
 (2603:10a6:800:af::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=stefan-gabriel.mirea@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [86.120.240.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bedcf53a-20d0-4e78-b9b9-08d747391858
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: VI1PR0402MB3918:|VI1PR0402MB3918:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR0402MB3918E0F18642C08D87D2905BDF9C0@VI1PR0402MB3918.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-forefront-prvs: 0178184651
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(366004)(39860400002)(136003)(396003)(376002)(346002)(189003)(199004)(102836004)(2201001)(5660300002)(26005)(478600001)(6666004)(76176011)(486006)(386003)(14454004)(50226002)(8676002)(8936002)(81156014)(305945005)(81166006)(6506007)(7736002)(7416002)(64756008)(6436002)(66556008)(66446008)(476003)(66066001)(2906002)(11346002)(2616005)(66476007)(6486002)(66946007)(25786009)(52116002)(2501003)(186003)(14444005)(256004)(446003)(6512007)(6116002)(3846002)(36756003)(71190400001)(71200400001)(4326008)(1076003)(86362001)(54906003)(99286004)(110136005)(316002);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR0402MB3918;H:VI1PR0402MB2863.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +rtNbrk5w92EeaEhzofzc90E2x7mRB6d91OL3WZDOlsjABE2HYeJEI0iywbBAVgCvDAbipXKplpk9gH048PqM3gG1u7KypHQaZO4NCAoNf8R2wLOkUj/mUEtVuhfTPMkPApGpPUjF4yNUUKowN1kemY+8WMcVVoEICtTKz6TzWNd6+vCl6ss6955gC3w8NAIvpNfTvZnwr7ZEiyYL3vgtjfY7A+prrBmt4lUlhtL1aHg7kL64sB30d6EEmGfTE9odRtIEzwdtpK1bdqEJaGx7nimBA+ME18WouGrwYbF0odkXSblZYtqcIwPw0YWh9Ns9hbEIYRMNoZ7Owg3z6zbU10kCK4fjfBKDdSOYv8C5Kp5VZlSeFLouXodiYs0bDpqpzYIrlHcJ35r2UjT8UdbXosMKikTbQPzwA0ePxFzU+k=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bedcf53a-20d0-4e78-b9b9-08d747391858
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2019 13:04:44.5499
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8eP/mt7yI0/B571LsQHMHNgPpIDnfmQ7t/fNDbJcVQ1EzxZdBFYion1Ge2g07ui/M78gre5H3s8j6jWZOO2FvyS/H16yinwhfyRNlKf/K9M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3918
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Stoica Cosmin-Stefan <cosmin.stoica@nxp.com>

Add initial version of device tree for S32V234-EVB, including nodes for the
4 Cortex-A53 cores, AIPS bus with UART modules, ARM architected timer and
Generic Interrupt Controller (GIC).

Keep SoC level separate from board level to let future boards with this SoC
share common properties, while the dts files will keep board-dependent
properties.

Signed-off-by: Stoica Cosmin-Stefan <cosmin.stoica@nxp.com>
Signed-off-by: Mihaela Martinas <Mihaela.Martinas@freescale.com>
Signed-off-by: Dan Nica <dan.nica@nxp.com>
Signed-off-by: Larisa Grigore <Larisa.Grigore@nxp.com>
Signed-off-by: Phu Luu An <phu.luuan@nxp.com>
Signed-off-by: Stefan-Gabriel Mirea <stefan-gabriel.mirea@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |   2 +
 arch/arm64/boot/dts/freescale/s32v234-evb.dts |  25 ++++
 arch/arm64/boot/dts/freescale/s32v234.dtsi    | 139 ++++++++++++++++++
 3 files changed, 166 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/s32v234-evb.dts
 create mode 100644 arch/arm64/boot/dts/freescale/s32v234.dtsi

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/f=
reescale/Makefile
index 93fce8f0c66d..730209adb2bc 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -32,3 +32,5 @@ dtb-$(CONFIG_ARCH_MXC) +=3D imx8mq-zii-ultra-rmb3.dtb
 dtb-$(CONFIG_ARCH_MXC) +=3D imx8mq-zii-ultra-zest.dtb
 dtb-$(CONFIG_ARCH_MXC) +=3D imx8qxp-ai_ml.dtb
 dtb-$(CONFIG_ARCH_MXC) +=3D imx8qxp-mek.dtb
+
+dtb-$(CONFIG_ARCH_S32) +=3D s32v234-evb.dtb
diff --git a/arch/arm64/boot/dts/freescale/s32v234-evb.dts b/arch/arm64/boo=
t/dts/freescale/s32v234-evb.dts
new file mode 100644
index 000000000000..4b802518cefc
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/s32v234-evb.dts
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright 2015-2016 Freescale Semiconductor, Inc.
+ * Copyright 2016-2017 NXP
+ */
+
+/dts-v1/;
+#include "s32v234.dtsi"
+
+/ {
+	model =3D "NXP S32V234-EVB2 Board";
+	compatible =3D "fsl,s32v234-evb", "fsl,s32v234";
+
+	chosen {
+		stdout-path =3D "serial0:115200n8";
+	};
+};
+
+&uart0 {
+	status =3D "okay";
+};
+
+&uart1 {
+	status =3D "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/s32v234.dtsi b/arch/arm64/boot/d=
ts/freescale/s32v234.dtsi
new file mode 100644
index 000000000000..37225191ccbf
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/s32v234.dtsi
@@ -0,0 +1,139 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright 2015-2016 Freescale Semiconductor, Inc.
+ * Copyright 2016-2018 NXP
+ */
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/memreserve/ 0x80000000 0x00010000;
+
+/ {
+	compatible =3D "fsl,s32v234";
+	interrupt-parent =3D <&gic>;
+	#address-cells =3D <2>;
+	#size-cells =3D <2>;
+
+	aliases {
+		serial0 =3D &uart0;
+		serial1 =3D &uart1;
+	};
+
+	cpus {
+		#address-cells =3D <2>;
+		#size-cells =3D <0>;
+
+		cpu0: cpu@0 {
+			device_type =3D "cpu";
+			compatible =3D "arm,cortex-a53";
+			reg =3D <0x0 0x0>;
+			enable-method =3D "spin-table";
+			cpu-release-addr =3D <0x0 0x80000000>;
+			next-level-cache =3D <&cluster0_l2_cache>;
+		};
+
+		cpu1: cpu@1 {
+			device_type =3D "cpu";
+			compatible =3D "arm,cortex-a53";
+			reg =3D <0x0 0x1>;
+			enable-method =3D "spin-table";
+			cpu-release-addr =3D <0x0 0x80000000>;
+			next-level-cache =3D <&cluster0_l2_cache>;
+		};
+
+		cpu2: cpu@100 {
+			device_type =3D "cpu";
+			compatible =3D "arm,cortex-a53";
+			reg =3D <0x0 0x100>;
+			enable-method =3D "spin-table";
+			cpu-release-addr =3D <0x0 0x80000000>;
+			next-level-cache =3D <&cluster1_l2_cache>;
+		};
+
+		cpu3: cpu@101 {
+			device_type =3D "cpu";
+			compatible =3D "arm,cortex-a53";
+			reg =3D <0x0 0x101>;
+			enable-method =3D "spin-table";
+			cpu-release-addr =3D <0x0 0x80000000>;
+			next-level-cache =3D <&cluster1_l2_cache>;
+		};
+
+		cluster0_l2_cache: l2-cache0 {
+			compatible =3D "cache";
+		};
+
+		cluster1_l2_cache: l2-cache1 {
+			compatible =3D "cache";
+		};
+	};
+
+	timer {
+		compatible =3D "arm,armv8-timer";
+		interrupts =3D <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) |
+					  IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) |
+					  IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) |
+					  IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) |
+					  IRQ_TYPE_LEVEL_LOW)>;
+		/* clock-frequency might be modified by u-boot, depending on the
+		 * chip version.
+		 */
+		clock-frequency =3D <10000000>;
+	};
+
+	gic: interrupt-controller@7d001000 {
+		compatible =3D "arm,cortex-a15-gic", "arm,cortex-a9-gic";
+		#interrupt-cells =3D <3>;
+		#address-cells =3D <0>;
+		interrupt-controller;
+		reg =3D <0 0x7d001000 0 0x1000>,
+		      <0 0x7d002000 0 0x2000>,
+		      <0 0x7d004000 0 0x2000>,
+		      <0 0x7d006000 0 0x2000>;
+		interrupts =3D <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) |
+					 IRQ_TYPE_LEVEL_HIGH)>;
+	};
+
+	soc {
+		#address-cells =3D <2>;
+		#size-cells =3D <2>;
+		compatible =3D "simple-bus";
+		interrupt-parent =3D <&gic>;
+		ranges;
+
+		aips0: aips-bus@40000000 {
+			compatible =3D "simple-bus";
+			#address-cells =3D <2>;
+			#size-cells =3D <2>;
+			interrupt-parent =3D <&gic>;
+			reg =3D <0x0 0x40000000 0x0 0x7D000>;
+			ranges;
+
+			uart0: serial@40053000 {
+				compatible =3D "fsl,s32v234-linflexuart";
+				reg =3D <0x0 0x40053000 0x0 0x1000>;
+				interrupts =3D <GIC_SPI 59 IRQ_TYPE_EDGE_RISING>;
+				status =3D "disabled";
+			};
+		};
+
+		aips1: aips-bus@40080000 {
+			compatible =3D "simple-bus";
+			#address-cells =3D <2>;
+			#size-cells =3D <2>;
+			interrupt-parent =3D <&gic>;
+			reg =3D <0x0 0x40080000 0x0 0x70000>;
+			ranges;
+
+			uart1: serial@400bc000 {
+				compatible =3D "fsl,s32v234-linflexuart";
+				reg =3D <0x0 0x400bc000 0x0 0x1000>;
+				interrupts =3D <GIC_SPI 60 IRQ_TYPE_EDGE_RISING>;
+				status =3D "disabled";
+			};
+		};
+	};
+};
--=20
2.22.0

