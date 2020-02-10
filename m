Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E6F11584FB
	for <lists+linux-doc@lfdr.de>; Mon, 10 Feb 2020 22:40:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727056AbgBJVkE (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 10 Feb 2020 16:40:04 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:39343 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727575AbgBJVkE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 10 Feb 2020 16:40:04 -0500
Received: by mail-wm1-f68.google.com with SMTP id c84so950648wme.4
        for <linux-doc@vger.kernel.org>; Mon, 10 Feb 2020 13:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=C1WY7m7LZykVt5uJs3pBqs/4NQKr7Ot6cOn9UjLkSJM=;
        b=m595dQRGCxQ2u1fqafnlK1isvgOXjuOK0l1YeRCmEj/cI7AepSdtOBx7DD9hML0QkY
         xBx31A5vdqNkk7kpLz2N+0pqvSSmEomEt6LsZM3N/G+dqzU9xA9+YyjUiCEI+/Q96+hE
         163z38xlu4D5R/8ypttpnbU1QbbZdAjBvfFE4HRM0j9queioaJW9pv8OoJAovbbGIVH7
         a5WaMiBg2tUsv/CZDBoBI75mPYSFxU3fDtH4KoQQz7B8nXCPkMOt69IvVj7jeWLvXWm7
         HTxO8ruYjBPTix13y7P3V26UvoAoOCn3ubhB+dKb7uqMSZLx1h14r66rY/ppD+zqR6CN
         m9Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=C1WY7m7LZykVt5uJs3pBqs/4NQKr7Ot6cOn9UjLkSJM=;
        b=HZnLVI7kpaBUmQ7FfBEmrV8L390EEH/PpJGFpiQdkLigEwMEhIjdSDBpoTYZ8qM1pd
         GwakzcqQ+ODFBZboI4vWNvlisX3ndJqbkv8BGRaxBjFubXPRdY7ZTa+e3yJRYWhUvzXI
         Muwp/j3qz1F8jGY7si10XLFGKkCZt1JnFhc7ZQkKruZRoz1GFOtfDBZmSEcX+lOS/AUU
         RUD8ALmtUN5didt0wudhonrG6W5AxViDAnSVvY25E+FN3Xxtlgyg+X5iyRDScx3rAhxc
         WvVpOky+LhKlqcIA8360M0OZpbr5lrFnHK6l69G9ggCad7CPeNyu1Zlk2KL/cGADDLiV
         x3XQ==
X-Gm-Message-State: APjAAAUWqxQgb7ZphYCl972naJM5a9F3mKfOEP8t7bmjGihK0nKAcTJI
        DRM40rZkz/n5x7G8b0I8I8bQpw==
X-Google-Smtp-Source: APXvYqzXmPFVDvYGGO1lCbsNxXyqlxO/kA1C/Zdq1de/H66qIAbSiiNtf3Ha+C06PxLj3o/ajaSvhw==
X-Received: by 2002:a1c:67c3:: with SMTP id b186mr1016506wmc.36.1581370802162;
        Mon, 10 Feb 2020 13:40:02 -0800 (PST)
Received: from linaro.org ([2a00:23c5:6815:3901:a1cf:b00b:5683:ed40])
        by smtp.gmail.com with ESMTPSA id u14sm2118582wrm.51.2020.02.10.13.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2020 13:40:01 -0800 (PST)
From:   Mike Leach <mike.leach@linaro.org>
To:     mike.leach@linaro.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, coresight@lists.linaro.org,
        linux-doc@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, mathieu.poirier@linaro.org,
        suzuki.poulose@arm.com, robh+dt@kernel.org, maxime@cerno.tech,
        liviu.dudau@arm.com, sudeep.holla@arm.com,
        lorenzo.pieralisi@arm.com, agross@kernel.org, corbet@lwn.net
Subject: [PATCH v9 10/15] dt-bindings: qcom: Add CTI options for qcom msm8916
Date:   Mon, 10 Feb 2020 21:39:19 +0000
Message-Id: <20200210213924.20037-11-mike.leach@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200210213924.20037-1-mike.leach@linaro.org>
References: <20200210213924.20037-1-mike.leach@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Adds system and CPU bound CTI definitions for Qualcom msm8916 platform
(Dragonboard DB410C).
System CTIs 2-11 are omitted as no information available at present.

Signed-off-by: Mike Leach <mike.leach@linaro.org>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 85 +++++++++++++++++++++++++--
 1 file changed, 81 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 9f31064f2374..d13b5fb5c4d6 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/reset/qcom,gcc-msm8916.h>
 #include <dt-bindings/clock/qcom,rpmcc.h>
 #include <dt-bindings/thermal/thermal.h>
+#include <dt-bindings/arm/coresight-cti-dt.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -1409,7 +1410,7 @@
 			cpu = <&CPU3>;
 		};
 
-		etm@85c000 {
+		etm0: etm@85c000 {
 			compatible = "arm,coresight-etm4x", "arm,primecell";
 			reg = <0x85c000 0x1000>;
 
@@ -1427,7 +1428,7 @@
 			};
 		};
 
-		etm@85d000 {
+		etm1: etm@85d000 {
 			compatible = "arm,coresight-etm4x", "arm,primecell";
 			reg = <0x85d000 0x1000>;
 
@@ -1445,7 +1446,7 @@
 			};
 		};
 
-		etm@85e000 {
+		etm2: etm@85e000 {
 			compatible = "arm,coresight-etm4x", "arm,primecell";
 			reg = <0x85e000 0x1000>;
 
@@ -1463,7 +1464,7 @@
 			};
 		};
 
-		etm@85f000 {
+		etm3: etm@85f000 {
 			compatible = "arm,coresight-etm4x", "arm,primecell";
 			reg = <0x85f000 0x1000>;
 
@@ -1481,6 +1482,82 @@
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
+			compatible = "arm,coresight-cti-v8-arch", "arm,coresight-cti",
+				     "arm,primecell";
+			reg = <0x858000 0x1000>;
+
+			clocks = <&rpmcc RPM_QDSS_CLK>;
+			clock-names = "apb_pclk";
+
+			cpu = <&CPU0>;
+			arm,cs-dev-assoc = <&etm0>;
+
+		};
+
+		/* CTI - CPU-1 */
+		cti@859000 {
+			compatible = "arm,coresight-cti-v8-arch", "arm,coresight-cti",
+				     "arm,primecell";
+			reg = <0x859000 0x1000>;
+
+			clocks = <&rpmcc RPM_QDSS_CLK>;
+			clock-names = "apb_pclk";
+
+			cpu = <&CPU1>;
+			arm,cs-dev-assoc = <&etm1>;
+		};
+
+		/* CTI - CPU-2 */
+		cti@85a000 {
+			compatible = "arm,coresight-cti-v8-arch", "arm,coresight-cti",
+				     "arm,primecell";
+			reg = <0x85a000 0x1000>;
+
+			clocks = <&rpmcc RPM_QDSS_CLK>;
+			clock-names = "apb_pclk";
+
+			cpu = <&CPU2>;
+			arm,cs-dev-assoc = <&etm2>;
+		};
+
+		/* CTI - CPU-3 */
+		cti@85b000 {
+			compatible = "arm,coresight-cti-v8-arch", "arm,coresight-cti",
+				     "arm,primecell";
+			reg = <0x85b000 0x1000>;
+
+			clocks = <&rpmcc RPM_QDSS_CLK>;
+			clock-names = "apb_pclk";
+
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

