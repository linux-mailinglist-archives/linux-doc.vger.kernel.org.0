Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0256C9B6C8
	for <lists+linux-doc@lfdr.de>; Fri, 23 Aug 2019 21:12:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406092AbfHWTL4 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 23 Aug 2019 15:11:56 -0400
Received: from mail-eopbgr20069.outbound.protection.outlook.com ([40.107.2.69]:31678
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2406076AbfHWTLx (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 23 Aug 2019 15:11:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B7CLI3NMU1slEPii/eIjb4jGR4H+SklLu9jjbAlYBU9L9/ejAyZNw8ECz0ecO36XwSOdmCbZ57VblWmseKX4QozMiQ4KAQ4ryIF4wzyVUwHn4NPf2H9QQ9c5MtW97FYxp7yo/9UZJn2CMdNpjf/yY1bcL6kWfc7tYUM8BAFP52EWOK4Rs/RY++p91gQ8XdwMTNbuzR3n5tcwMKHfqtT8q56NBIv3ZlODwhXVOmQmWSneRQrpv8WZ1B52uX+dRZzVwxnBBWNO7v+96x+JTF9koyiqv8BK6GvwaNqWJHDhmG4sXDKCAnQducQ+8kDtfftU+HYq8l3uHGCRm0S41K4Emg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1v5yqDiISTlA2F8Aexoql/kgiFwELffIJz/31AiBZ6w=;
 b=QMZpxwCvfbdQF1l3xIh98EWJM3pu9Xi+Ppm0uNqUqZNtTddWTYMsQxBTb4SHQfn/UALqRAo7Dunc8RnnrxJmA+04vEW69v6BRt4mGpgldsrIpo/AxuZTpW5OGT/6kcmL88tmmsWf3533pG+jpeuKjBeXukS3LyjKMpzNchlsYDTrLIcGGKl4TaDYBK5bV7xXn71brWD71OwMNK4npCNYV7md/OhYfvR96aSPf8LRPCTNdZKDwyYnEJ+MPcFROHdvqzEjn7D6AYCS1POuR9bLr1zdYpz40xWjJPr0PhZfoL6vknFxz9OgYukgqPFVk3r+gK+sanxyx0wtaeUUjfRUVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1v5yqDiISTlA2F8Aexoql/kgiFwELffIJz/31AiBZ6w=;
 b=pfr95zYqCnleA96uQJtQaRY0hARbmj4jfS/i34vp6ZRDpbKpbI+Z56h9yfNqdb1qD9SCYvGSlUFUe8wWFuyUbs0cdlcJQiGF5F8ALjsEUcHd/I6uTMyOpacQ6tGRQRXLmwv+1MdRsmTbZM285pBGFliE0r8Ce+tleEBNZBzO/uQ=
Received: from VI1PR0402MB2863.eurprd04.prod.outlook.com (10.175.20.18) by
 VI1PR0402MB2717.eurprd04.prod.outlook.com (10.175.22.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Fri, 23 Aug 2019 19:11:37 +0000
Received: from VI1PR0402MB2863.eurprd04.prod.outlook.com
 ([fe80::7de6:ea4b:9b5d:d023]) by VI1PR0402MB2863.eurprd04.prod.outlook.com
 ([fe80::7de6:ea4b:9b5d:d023%7]) with mapi id 15.20.2178.020; Fri, 23 Aug 2019
 19:11:37 +0000
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
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v3 4/7] serial: fsl_linflexuart: Be consistent with the name
Thread-Topic: [PATCH v3 4/7] serial: fsl_linflexuart: Be consistent with the
 name
Thread-Index: AQHVWeaVuHBRh8HThUOMI4A6VVjTVw==
Date:   Fri, 23 Aug 2019 19:11:37 +0000
Message-ID: <20190823191115.18490-5-stefan-gabriel.mirea@nxp.com>
References: <20190823191115.18490-1-stefan-gabriel.mirea@nxp.com>
In-Reply-To: <20190823191115.18490-1-stefan-gabriel.mirea@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.22.0
x-clientproxiedby: AM5PR0402CA0007.eurprd04.prod.outlook.com
 (2603:10a6:203:90::17) To VI1PR0402MB2863.eurprd04.prod.outlook.com
 (2603:10a6:800:af::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=stefan-gabriel.mirea@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [212.146.100.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 840414ff-99f0-4a3d-aa21-08d727fdb847
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:VI1PR0402MB2717;
x-ms-traffictypediagnostic: VI1PR0402MB2717:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR0402MB27179E1DEF78D641C9245FC8DFA40@VI1PR0402MB2717.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0138CD935C
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(136003)(376002)(39860400002)(366004)(396003)(346002)(189003)(199004)(446003)(476003)(2501003)(66446008)(76176011)(6436002)(6486002)(386003)(6506007)(50226002)(81156014)(256004)(86362001)(66946007)(64756008)(66556008)(66476007)(66066001)(186003)(8936002)(6512007)(25786009)(81166006)(36756003)(478600001)(52116002)(8676002)(14454004)(102836004)(6116002)(5660300002)(486006)(26005)(2201001)(71200400001)(53936002)(71190400001)(1076003)(316002)(110136005)(7416002)(54906003)(4326008)(99286004)(7736002)(305945005)(6636002)(3846002)(11346002)(2616005)(2906002);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR0402MB2717;H:VI1PR0402MB2863.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: dOeyd8ouoUCfUVHe/PVPZVPJEV5+1jH5YXj7nwbwJTaXEIux+wY10YezF44b5OF7YKT3+OW7ToTtqqvER/LHy1YTh13+K/Z2cqoj6N4cbEzB6lB9iYSPNmPraSWa8+V/guDFxTDMvhUU2AqHzT7U5V3UYczz02ts4Kbb+eoFyGwzMQLp1SQdYEIpv6dWJq1WvnHWsCURSxCn3E6sk7zE2qaQ0lcgSHUlAJM5Zc7ItRqEtZ76vuGqL2DODvG2GKSxloTK0PK7l0Kir5s71u6GZzMfDVgTMIIGrogn30Bt3dRMhgYZDKQmd40e4eN1sQIxFrsRCnlagZ2lxVs/p3sCDaWXNqZmaWXBnCbZvdGWYc6aTRYDXM7ph0QQK+o1Bggw2ts13nQ8mHf9yD/ZTBrGc69yBqKkSfM19u4oGLi63qM=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 840414ff-99f0-4a3d-aa21-08d727fdb847
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2019 19:11:37.0347
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AAeV7B/3T882DYT2Uql0cjiedaSZQZXMobDn2SpbB6+9k5vaERv+vfzN9kgboa8+nhQFI7nm46FODgkokWNiS8sAfa3tpW3uIfpEfxvi3Bo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2717
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

For consistency reasons, spell the controller name as "LINFlexD" in
comments and documentation.

Signed-off-by: Stefan-Gabriel Mirea <stefan-gabriel.mirea@nxp.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 2 +-
 drivers/tty/serial/Kconfig                      | 8 ++++----
 drivers/tty/serial/fsl_linflexuart.c            | 4 ++--
 include/uapi/linux/serial_core.h                | 4 ++--
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentatio=
n/admin-guide/kernel-parameters.txt
index 4d545732aadc..81773425fb31 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1091,7 +1091,7 @@
 			mapped with the correct attributes.
=20
 		linflex,<addr>
-			Use early console provided by Freescale LinFlex UART
+			Use early console provided by Freescale LINFlexD UART
 			serial driver for NXP S32V234 SoCs. A valid base
 			address must be provided, and the serial port must
 			already be setup and configured.
diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
index b4fa2f7c96bd..3039c1ff68a9 100644
--- a/drivers/tty/serial/Kconfig
+++ b/drivers/tty/serial/Kconfig
@@ -1453,18 +1453,18 @@ config SERIAL_FSL_LPUART_CONSOLE
 	  you can make it the console by answering Y to this option.
=20
 config SERIAL_FSL_LINFLEXUART
-	tristate "Freescale linflexuart serial port support"
+	tristate "Freescale LINFlexD UART serial port support"
 	select SERIAL_CORE
 	help
-	  Support for the on-chip linflexuart on some Freescale SOCs.
+	  Support for the on-chip LINFlexD UART on some Freescale SOCs.
=20
 config SERIAL_FSL_LINFLEXUART_CONSOLE
-	bool "Console on Freescale linflexuart serial port"
+	bool "Console on Freescale LINFlexD UART serial port"
 	depends on SERIAL_FSL_LINFLEXUART=3Dy
 	select SERIAL_CORE_CONSOLE
 	select SERIAL_EARLYCON
 	help
-	  If you have enabled the linflexuart serial port on the Freescale
+	  If you have enabled the LINFlexD UART serial port on the Freescale
 	  SoCs, you can make it the console by answering Y to this option.
=20
 config SERIAL_CONEXANT_DIGICOLOR
diff --git a/drivers/tty/serial/fsl_linflexuart.c b/drivers/tty/serial/fsl_=
linflexuart.c
index e54c65830e5e..b5889f8d80cb 100644
--- a/drivers/tty/serial/fsl_linflexuart.c
+++ b/drivers/tty/serial/fsl_linflexuart.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * Freescale linflexuart serial port driver
+ * Freescale LINFlexD UART serial port driver
  *
  * Copyright 2012-2016 Freescale Semiconductor, Inc.
  * Copyright 2017-2018 NXP
@@ -938,5 +938,5 @@ static void __exit linflex_serial_exit(void)
 module_init(linflex_serial_init);
 module_exit(linflex_serial_exit);
=20
-MODULE_DESCRIPTION("Freescale linflex serial port driver");
+MODULE_DESCRIPTION("Freescale LINFlexD serial port driver");
 MODULE_LICENSE("GPL v2");
diff --git a/include/uapi/linux/serial_core.h b/include/uapi/linux/serial_c=
ore.h
index f9e829416dcc..33bd9c411a31 100644
--- a/include/uapi/linux/serial_core.h
+++ b/include/uapi/linux/serial_core.h
@@ -296,7 +296,7 @@
 /* Sunix UART */
 #define PORT_SUNIX	121
=20
-/* Freescale Linflex UART */
-#define PORT_LINFLEXUART	121
+/* Freescale LINFlexD UART */
+#define PORT_LINFLEXUART	122
=20
 #endif /* _UAPILINUX_SERIAL_CORE_H */
--=20
2.22.0

