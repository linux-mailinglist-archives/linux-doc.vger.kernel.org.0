Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5507102FF2
	for <lists+linux-doc@lfdr.de>; Wed, 20 Nov 2019 00:19:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727521AbfKSXTc (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 19 Nov 2019 18:19:32 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:42554 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727494AbfKSXTb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Nov 2019 18:19:31 -0500
Received: by mail-wr1-f68.google.com with SMTP id a15so25925884wrf.9
        for <linux-doc@vger.kernel.org>; Tue, 19 Nov 2019 15:19:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=CY9BzC4lO/psiiWDvfyoZ5PZxvDdzpF24ejbtK1oew8=;
        b=whICS7lbVl4iQygx4TtWkKmLoxTN22cvmLgeTEL6i0Wk5kEJR5srSsIvGyO8Vffh7f
         zWfGkuDM43I1mSSB4W7r9MEvitCrB6Lis5kGdwfTTvt586EjueWoTnMVLZ9g/gbiKnee
         rlXbwBXefr0T3UkywMVmoZaThvQoKy7h5IT5anGG4CgND6KuX5dGIhzM3WUIhqpJWvpH
         /8d5GAxJX7EHczVlCT3bBL0gRgpRS4wTL2c6jhFAT8IWTibax6CoVHUw0AtbumAKtxXj
         E6t2CUzztNbrgzVg0FK9XrXcHrP5ROYhgELsCROYzp/OzXJJkiCLuMwNR+ejiaNMG7Fg
         MGDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=CY9BzC4lO/psiiWDvfyoZ5PZxvDdzpF24ejbtK1oew8=;
        b=uTC1uh8xHJqrklda2ygzvKuo/4V9vt5iKlpSQ81dKcZPcwdRUitu+SpjGPBQcaO3Mf
         d7/pD/FMIzMdPd3LeyWNPIB1YwGMMnAFbpaqA+GcOSVRCkUAn2usgqYL8uHz6PiWkgN7
         WzSqYtmzjFom6ZakSCbfkYsLXVqiu2A9+rJMWjv9aZA/hfSUTlEOa4cV2jFi6o7TtFOO
         Ir8eQzVupoEkwTbykOMVj/tviXWiXR+5jNTSAaLoNdBrPQRDupJDbLqA3OL+bkhSQ2+o
         0plf69a91+7kRYqBuQJGXaIkBk1dIwCnl/8mBT4Xy/B7xTfSLDzhVMSa5pF9PsmNgsEN
         zMCw==
X-Gm-Message-State: APjAAAXwlyQnFTzS4YOHytThfgw87y14ERzNTBKFuJwHHOX/ypX5rP3f
        Aor1gYl3t6q1jeac3yOKdiw89w==
X-Google-Smtp-Source: APXvYqyNzLbvJ4OlsG32U7Lnk0xF5OdDAXiURRrNOmbEyBLWk7UCA6MQ2hD34Esh6BlQUv2sLWKTWg==
X-Received: by 2002:adf:9d87:: with SMTP id p7mr39530588wre.11.1574205569880;
        Tue, 19 Nov 2019 15:19:29 -0800 (PST)
Received: from linaro.org ([2a00:23c5:6815:3901:a19d:4139:292b:19a0])
        by smtp.gmail.com with ESMTPSA id m15sm15746717wrj.52.2019.11.19.15.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2019 15:19:29 -0800 (PST)
From:   Mike Leach <mike.leach@linaro.org>
To:     mike.leach@linaro.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org
Cc:     mathieu.poirier@linaro.org, suzuki.poulose@arm.com
Subject: [PATCH v5 10/14] dt-bindings: qcom: Add CTI options for qcom msm8916
Date:   Tue, 19 Nov 2019 23:19:08 +0000
Message-Id: <20191119231912.12768-11-mike.leach@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191119231912.12768-1-mike.leach@linaro.org>
References: <20191119231912.12768-1-mike.leach@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Adds system and CPU bound CTI definitions for Qualcom msm8916 platform
(Dragonboard DB410C).
System CTIs 2-11 are omitted as no information available at present.

Signed-off-by: Mike Leach <mike.leach@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 85 +++++++++++++++++++++++++--
 1 file changed, 81 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 5ea9fb8f2f87..9589fc2cba22 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/reset/qcom,gcc-msm8916.h>
 #include <dt-bindings/clock/qcom,rpmcc.h>
 #include <dt-bindings/thermal/thermal.h>
+#include <dt-bindings/arm/coresight-cti-dt.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -1357,7 +1358,7 @@
 			cpu = <&CPU3>;
 		};
 
-		etm@85c000 {
+		etm0: etm@85c000 {
 			compatible = "arm,coresight-etm4x", "arm,primecell";
 			reg = <0x85c000 0x1000>;
 
@@ -1375,7 +1376,7 @@
 			};
 		};
 
-		etm@85d000 {
+		etm1: etm@85d000 {
 			compatible = "arm,coresight-etm4x", "arm,primecell";
 			reg = <0x85d000 0x1000>;
 
@@ -1393,7 +1394,7 @@
 			};
 		};
 
-		etm@85e000 {
+		etm2: etm@85e000 {
 			compatible = "arm,coresight-etm4x", "arm,primecell";
 			reg = <0x85e000 0x1000>;
 
@@ -1411,7 +1412,7 @@
 			};
 		};
 
-		etm@85f000 {
+		etm3: etm@85f000 {
 			compatible = "arm,coresight-etm4x", "arm,primecell";
 			reg = <0x85f000 0x1000>;
 
@@ -1429,6 +1430,82 @@
 			};
 		};
 
+		/* System CTIs */
+		/* CTI 0 - TMC connections */
+		cti@810000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x810000 0x1000>;
+
+			clocks = <&rpmcc RPM_QDSS_CLK>;
+			clock-names = "apb_pclk";
+		};
+
+		/* CTI 1 - TPIU connections */
+		cti@811000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x811000 0x1000>;
+
+			clocks = <&rpmcc RPM_QDSS_CLK>;
+			clock-names = "apb_pclk";
+		};
+
+		/* CTIs 2-11 - no information - not instantiated */
+
+		/* Core CTIs; CTIs 12-15 */
+		/* CTI - CPU-0 */
+		cti@858000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x858000 0x1000>;
+
+			clocks = <&rpmcc RPM_QDSS_CLK>;
+			clock-names = "apb_pclk";
+
+			arm,cti-v8-arch;
+			cpu = <&CPU0>;
+			arm,cs-dev-assoc = <&etm0>;
+
+		};
+
+		/* CTI - CPU-1 */
+		cti@859000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x859000 0x1000>;
+
+			clocks = <&rpmcc RPM_QDSS_CLK>;
+			clock-names = "apb_pclk";
+
+			arm,cti-v8-arch;
+			cpu = <&CPU1>;
+			arm,cs-dev-assoc = <&etm1>;
+		};
+
+		/* CTI - CPU-2 */
+		cti@85a000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x85a000 0x1000>;
+
+			clocks = <&rpmcc RPM_QDSS_CLK>;
+			clock-names = "apb_pclk";
+
+			arm,cti-v8-arch;
+			cpu = <&CPU2>;
+			arm,cs-dev-assoc = <&etm2>;
+		};
+
+		/* CTI - CPU-3 */
+		cti@85b000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x85b000 0x1000>;
+
+			clocks = <&rpmcc RPM_QDSS_CLK>;
+			clock-names = "apb_pclk";
+
+			arm,cti-v8-arch;
+			cpu = <&CPU3>;
+			arm,cs-dev-assoc = <&etm3>;
+		};
+
+
 		venus: video-codec@1d00000 {
 			compatible = "qcom,msm8916-venus";
 			reg = <0x01d00000 0xff000>;
-- 
2.17.1

