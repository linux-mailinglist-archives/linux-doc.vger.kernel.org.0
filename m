Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30B9D4975A
	for <lists+linux-doc@lfdr.de>; Tue, 18 Jun 2019 04:17:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726088AbfFRCQ5 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 17 Jun 2019 22:16:57 -0400
Received: from inva020.nxp.com ([92.121.34.13]:37808 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726047AbfFRCQ5 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 17 Jun 2019 22:16:57 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id CAC3D1A0DD0;
        Tue, 18 Jun 2019 04:16:55 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 342261A001B;
        Tue, 18 Jun 2019 04:16:40 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 66FB9402A0;
        Tue, 18 Jun 2019 10:16:26 +0800 (SGT)
From:   Anson.Huang@nxp.com
To:     robh+dt@kernel.org, mark.rutland@arm.com, corbet@lwn.net,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, catalin.marinas@arm.com, will.deacon@arm.com,
        rui.zhang@intel.com, edubezval@gmail.com,
        daniel.lezcano@linaro.org, aisheng.dong@nxp.com,
        ulf.hansson@linaro.org, peng.fan@nxp.com,
        mchehab+samsung@kernel.org, linux@roeck-us.net,
        daniel.baluta@nxp.com, maxime.ripard@bootlin.com,
        horms+renesas@verge.net.au, olof@lixom.net,
        jagan@amarulasolutions.com, bjorn.andersson@linaro.org,
        leonard.crestez@nxp.com, dinguyen@kernel.org,
        enric.balletbo@collabora.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH V15 1/5] dt-bindings: fsl: scu: add thermal binding
Date:   Tue, 18 Jun 2019 10:18:16 +0800
Message-Id: <20190618021820.14885-1-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Anson Huang <Anson.Huang@nxp.com>

NXP i.MX8QXP is an ARMv8 SoC with a Cortex-M4 core inside as
system controller, the system controller is in charge of system
power, clock and thermal sensors etc. management, Linux kernel
has to communicate with system controller via MU (message unit)
IPC to get temperature from thermal sensors, this patch adds
binding doc for i.MX system controller thermal driver.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>
---
No change.
---
 .../devicetree/bindings/arm/freescale/fsl,scu.txt        | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
index a575e42..fc3844e 100644
--- a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
+++ b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
@@ -155,6 +155,17 @@ Required properties:
 Optional properties:
 - timeout-sec: contains the watchdog timeout in seconds.
 
+Thermal bindings based on SCU Message Protocol
+------------------------------------------------------------
+
+Required properties:
+- compatible:			Should be :
+				  "fsl,imx8qxp-sc-thermal"
+				followed by "fsl,imx-sc-thermal";
+
+- #thermal-sensor-cells:	See Documentation/devicetree/bindings/thermal/thermal.txt
+				for a description.
+
 Example (imx8qxp):
 -------------
 aliases {
@@ -222,6 +233,11 @@ firmware {
 			compatible = "fsl,imx8qxp-sc-wdt", "fsl,imx-sc-wdt";
 			timeout-sec = <60>;
 		};
+
+		tsens: thermal-sensor {
+			compatible = "fsl,imx8qxp-sc-thermal", "fsl,imx-sc-thermal";
+			#thermal-sensor-cells = <1>;
+		};
 	};
 };
 
-- 
2.7.4

