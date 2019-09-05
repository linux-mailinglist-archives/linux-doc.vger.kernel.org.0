Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C2DAAA233
	for <lists+linux-doc@lfdr.de>; Thu,  5 Sep 2019 13:59:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388860AbfIEL6t (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 5 Sep 2019 07:58:49 -0400
Received: from mail-eopbgr80057.outbound.protection.outlook.com ([40.107.8.57]:16451
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388280AbfIEL6r (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 5 Sep 2019 07:58:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RNgfmir48nvUxNTcEtJ4NprbJ54DCNMlUMn9nf4qk7vW8hIRuU9VPxHeSxkMV+1vQ3OGtEq/Whfy+FB9j81zLHBeIZKEVJOWp2Owvxm/4uhS9wiOC53KmagksgIFn2slLnNzh9XIMCkd9+4BSI4NfNOIqoF1PWxP19jDNiUrXqVGOaSPhlhEBbMDoI2D9D9srEEXcoreXkmHpc3pG1N1DJ3DIVPr6/hQseNG9ornNV5syS/YFCxQRKPlktGleBPrdULaMnLXzY2DD6aDaTOUole5E7MQfrt8upuAMlnPqw80ZSqqwvH1zX3pLruoSF6YTF9heJbBIOQHJFJWHwJ26g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hbG55g7dR59B88ck8YW7qOGYW6n4kUPluVbQVJtn6QM=;
 b=nVHo5HZJ7ixodOslgp8REoX2fWnJVk3gu8DitMNF3JQRf3mnaLgpaN0uYLD9roHi+UahIZG0GU44Y26m5Y3gGKnJKGECeQtxIq8LdkeF16Fy19E7UpN50QHbcVa22FkhlqlN762lSGiaNdhKQ+Aqr+ByO1NKfWDPPQRcXvD6u6AVt9mZkiITq4GNL8IkOhlzNCOB+sslb7CkqnQRZV3c15AoF64GYYjhpfqjq3L34B/NdUXSmCJUrLc5C6OU1OPjvTzIqOjveMySvx5/GN5gS1BtLjBiDId0ae/EGxiE8Z30VU4e/kCz5pWzjnpzb+cIhH5YKQgDsBd3BXCU7Dvegw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hbG55g7dR59B88ck8YW7qOGYW6n4kUPluVbQVJtn6QM=;
 b=juawRj4gtQexHQGt9j2MczI3eXL/3312Mjk3vvGZA8tjLnPhTAhGxvrQLzZOqDmOxZt4cqsHg3q4p9JJS+c2m/zefo0dpr9VxsEr3RV/Ay/Mpx5pxOZZO2Ck9cQkwQXOv9gP8su2Y2vf2WP9FfFKaOsr+3vUtDvvOGsYA+Hs+Cg=
Received: from VI1PR0402MB2863.eurprd04.prod.outlook.com (10.175.20.18) by
 VI1PR0402MB3805.eurprd04.prod.outlook.com (52.134.16.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.18; Thu, 5 Sep 2019 11:58:38 +0000
Received: from VI1PR0402MB2863.eurprd04.prod.outlook.com
 ([fe80::19cd:9f82:31ce:fbbb]) by VI1PR0402MB2863.eurprd04.prod.outlook.com
 ([fe80::19cd:9f82:31ce:fbbb%8]) with mapi id 15.20.2220.022; Thu, 5 Sep 2019
 11:58:38 +0000
From:   Stefan-gabriel Mirea <stefan-gabriel.mirea@nxp.com>
To:     "corbet@lwn.net" <corbet@lwn.net>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
        "will@kernel.org" <will@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Leo Li <leoyang.li@nxp.com>
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
Subject: [PATCH v4 4/6] arm64: dts: fsl: Add device tree for S32V234-EVB
Thread-Topic: [PATCH v4 4/6] arm64: dts: fsl: Add device tree for S32V234-EVB
Thread-Index: AQHVY+FAt88cC75yBUCk0p7bQ45ouA==
Date:   Thu, 5 Sep 2019 11:58:37 +0000
Message-ID: <20190905115803.19565-5-stefan-gabriel.mirea@nxp.com>
References: <20190905115803.19565-1-stefan-gabriel.mirea@nxp.com>
In-Reply-To: <20190905115803.19565-1-stefan-gabriel.mirea@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.22.0
x-clientproxiedby: AM6P193CA0005.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:3e::18) To VI1PR0402MB2863.eurprd04.prod.outlook.com
 (2603:10a6:800:af::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=stefan-gabriel.mirea@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [212.146.100.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4e1325b0-5fbc-4e1b-b998-08d731f862df
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:VI1PR0402MB3805;
x-ms-traffictypediagnostic: VI1PR0402MB3805:|VI1PR0402MB3805:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR0402MB38056D446EE9A95524E016F6DFBB0@VI1PR0402MB3805.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-forefront-prvs: 015114592F
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(346002)(39860400002)(366004)(396003)(376002)(136003)(199004)(189003)(476003)(81156014)(81166006)(446003)(2616005)(486006)(71190400001)(11346002)(6436002)(1076003)(54906003)(71200400001)(110136005)(53936002)(8676002)(7416002)(102836004)(478600001)(36756003)(14454004)(6512007)(25786009)(2501003)(2201001)(86362001)(256004)(66556008)(64756008)(66446008)(186003)(66946007)(26005)(4326008)(3846002)(7736002)(316002)(6506007)(52116002)(99286004)(8936002)(76176011)(2906002)(305945005)(6486002)(14444005)(5660300002)(50226002)(66066001)(6116002)(66476007)(6636002)(386003);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR0402MB3805;H:VI1PR0402MB2863.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: cR1oyeeZG/jPT/xJWmwmVQSv1t8cTBDVI7WWT5Ns0amA2Kc6pCiR4lvaeoUf1DMJ1dsKVfmxpDu5YNuCUfeUrp90A0qb4zW+OvBxpLuRcau+b+J5jwyq1MZVXp55vrU+paMEwxbD33qkR1OAndTfKQVnWP+GpTOxwLIQIWZQOot/UvBsmHBqiCKcEfrPMMqZknJrqL3cE4LHU9M0tjCS0XuKM5FNT80usVKVH7L461maMM2VEE9FmMsM5Kms5uCsASairUYqnSfZ1nps4I3nBVXSNYC+qpgWSbh+tQabkJ8vDhT7QejXjTY1MvTwtRuOz5T7vJdo5eSMbEjXJuSdFy26idOdeturZefODlwgphvLLUAf7Cy5vE1PXzyK2vK1DLWYklXFuZvdzRiQpgxdxMHDKYceqGahYTmWVcQrvSA=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e1325b0-5fbc-4e1b-b998-08d731f862df
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2019 11:58:38.0612
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uZNikT4EHGYDLXuq6+DWsTd3SWktVFSGuq67cm0kneks+mdMk/4cH4khMTxkIUEit1A+3s58ME3GKAnL3Cz0Hf0OyXsELCYtv3yO6jq+XXU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3805
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
index c043aca66572..9aff21324146 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -26,3 +26,5 @@ dtb-$(CONFIG_ARCH_MXC) +=3D imx8mq-librem5-devkit.dtb
 dtb-$(CONFIG_ARCH_MXC) +=3D imx8mq-zii-ultra-rmb3.dtb
 dtb-$(CONFIG_ARCH_MXC) +=3D imx8mq-zii-ultra-zest.dtb
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

