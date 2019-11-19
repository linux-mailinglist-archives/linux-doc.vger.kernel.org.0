Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52B93102FF8
	for <lists+linux-doc@lfdr.de>; Wed, 20 Nov 2019 00:19:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727524AbfKSXTe (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 19 Nov 2019 18:19:34 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:45661 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727494AbfKSXTe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Nov 2019 18:19:34 -0500
Received: by mail-wr1-f68.google.com with SMTP id z10so25914948wrs.12
        for <linux-doc@vger.kernel.org>; Tue, 19 Nov 2019 15:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=JevRR6kCA7l6643u68sHramg9RjfiNUP7MzI98gX9Bo=;
        b=HYNhBvizKr+VDGUxReFRgCqXefyylR5cn0wZLcfez7XAUDl6Y6/J1XWmyD/RIvIH9N
         V+uLWlTVDIF2wyRGtgIQE5KPDs0WieEIK1PRTKikQVqQvREKrzqKO+wBq7vkumc020Yn
         joysHiPDSHJpKRf9Zj0/6fOMTwYlsiHSLWS9h6prt12zd9lCE+BRb6WBLlC/41yYpQGn
         d5CJSqm4D3QSVUDrGUAiKLzjLlINHUizTaVsjfZGwM529xHZ4h2zAULMh2Jpre572jj3
         Sd5kxacn8H5GMtEhtRQZLI1/aTC/5DKYhphVu/Igihyr3cWEyhOedZb03SiHFrxlP+hC
         D8Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=JevRR6kCA7l6643u68sHramg9RjfiNUP7MzI98gX9Bo=;
        b=r5iGzE4aCWaFCLgARhZ8vT6i8VqV+ppfDTkGSUdwVKUE7+GO7NJTd3qWZQlemJiKxD
         B+ueixRRajipJphyQ0LISsHjOKsv3tFnX4+o00fzlVcHQKs+ce6EdLbFEUygUHdTD1+V
         dgkbvBnInH6WvRdkk9P1zSD8+YDaMJiE7XZnjx3SBIT5mop94XhQmIGgNWRen8f6OTao
         4gXlR8riHmJxH4mIYWR4bZkabZ6QcT+lrsyIP5kgbaIub91H6SaPCVwhi6SnysHxe+Pc
         Y8laXSYNKidsYq4JCgFv3dWCJbB/bJHeCvsXvZkRBFWqiV+z+pOQjY0I6OOcLcLGa+X4
         houQ==
X-Gm-Message-State: APjAAAV7wQ2ru4sQccTKYC5xAzo++KW6OYNpVuzkYV149JNUBpJwkY9p
        8LiJTb5cGcVJU3HzUCjlEVRwlQ==
X-Google-Smtp-Source: APXvYqwpoNvt3f/A2vZps21NXwzQCjBn/pa4b23bn20sAMZA86U+YMYi0HXqG+s2L9OG0wH2bIqmxg==
X-Received: by 2002:adf:dc0a:: with SMTP id t10mr39083088wri.138.1574205571901;
        Tue, 19 Nov 2019 15:19:31 -0800 (PST)
Received: from linaro.org ([2a00:23c5:6815:3901:a19d:4139:292b:19a0])
        by smtp.gmail.com with ESMTPSA id m15sm15746717wrj.52.2019.11.19.15.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2019 15:19:31 -0800 (PST)
From:   Mike Leach <mike.leach@linaro.org>
To:     mike.leach@linaro.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org
Cc:     mathieu.poirier@linaro.org, suzuki.poulose@arm.com
Subject: [PATCH v5 12/14] dt-bindings: hisilicon: Add CTI bindings for hi-6220
Date:   Tue, 19 Nov 2019 23:19:10 +0000
Message-Id: <20191119231912.12768-13-mike.leach@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191119231912.12768-1-mike.leach@linaro.org>
References: <20191119231912.12768-1-mike.leach@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Adds in CTI device tree information for the Hikey620 board.

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Tested-by: Leo Yan <leo.yan@linaro.org>
Signed-off-by: Mike Leach <mike.leach@linaro.org>
---
 .../boot/dts/hisilicon/hi6220-coresight.dtsi  | 130 ++++++++++++++++--
 1 file changed, 122 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/hisilicon/hi6220-coresight.dtsi b/arch/arm64/boot/dts/hisilicon/hi6220-coresight.dtsi
index 651771a73ed6..806f0526f18f 100644
--- a/arch/arm64/boot/dts/hisilicon/hi6220-coresight.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi6220-coresight.dtsi
@@ -213,7 +213,7 @@
 			};
 		};
 
-		etm@f659c000 {
+		etm0: etm@f659c000 {
 			compatible = "arm,coresight-etm4x", "arm,primecell";
 			reg = <0 0xf659c000 0 0x1000>;
 
@@ -232,7 +232,7 @@
 			};
 		};
 
-		etm@f659d000 {
+		etm1: etm@f659d000 {
 			compatible = "arm,coresight-etm4x", "arm,primecell";
 			reg = <0 0xf659d000 0 0x1000>;
 
@@ -251,7 +251,7 @@
 			};
 		};
 
-		etm@f659e000 {
+		etm2: etm@f659e000 {
 			compatible = "arm,coresight-etm4x", "arm,primecell";
 			reg = <0 0xf659e000 0 0x1000>;
 
@@ -270,7 +270,7 @@
 			};
 		};
 
-		etm@f659f000 {
+		etm3: etm@f659f000 {
 			compatible = "arm,coresight-etm4x", "arm,primecell";
 			reg = <0 0xf659f000 0 0x1000>;
 
@@ -289,7 +289,7 @@
 			};
 		};
 
-		etm@f65dc000 {
+		etm4: etm@f65dc000 {
 			compatible = "arm,coresight-etm4x", "arm,primecell";
 			reg = <0 0xf65dc000 0 0x1000>;
 
@@ -308,7 +308,7 @@
 			};
 		};
 
-		etm@f65dd000 {
+		etm5: etm@f65dd000 {
 			compatible = "arm,coresight-etm4x", "arm,primecell";
 			reg = <0 0xf65dd000 0 0x1000>;
 
@@ -327,7 +327,7 @@
 			};
 		};
 
-		etm@f65de000 {
+		etm6: etm@f65de000 {
 			compatible = "arm,coresight-etm4x", "arm,primecell";
 			reg = <0 0xf65de000 0 0x1000>;
 
@@ -346,7 +346,7 @@
 			};
 		};
 
-		etm@f65df000 {
+		etm7: etm@f65df000 {
 			compatible = "arm,coresight-etm4x", "arm,primecell";
 			reg = <0 0xf65df000 0 0x1000>;
 
@@ -364,5 +364,119 @@
 				};
 			};
 		};
+
+		/* System CTIs */
+		/* CTI 0 - TMC and TPIU connections */
+		cti@f6403000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0 0xf6403000 0 0x1000>;
+
+			clocks = <&acpu_sctrl HI6220_ACPU_SFT_AT_S>;
+			clock-names = "apb_pclk";
+		};
+
+		/* CTI - CPU-0 */
+		cti@f6598000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0 0xf6598000 0 0x1000>;
+
+			clocks = <&acpu_sctrl HI6220_ACPU_SFT_AT_S>;
+			clock-names = "apb_pclk";
+
+			arm,cti-v8-arch;
+			cpu = <&cpu0>;
+			arm,cs-dev-assoc = <&etm0>;
+		};
+
+		/* CTI - CPU-1 */
+		cti@f6599000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0 0xf6599000 0 0x1000>;
+
+			clocks = <&acpu_sctrl HI6220_ACPU_SFT_AT_S>;
+			clock-names = "apb_pclk";
+
+			arm,cti-v8-arch;
+			cpu = <&cpu1>;
+			arm,cs-dev-assoc = <&etm1>;
+		};
+
+		/* CTI - CPU-2 */
+		cti@f659a000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0 0xf659a000 0 0x1000>;
+
+			clocks = <&acpu_sctrl HI6220_ACPU_SFT_AT_S>;
+			clock-names = "apb_pclk";
+
+			arm,cti-v8-arch;
+			cpu = <&cpu2>;
+			arm,cs-dev-assoc = <&etm2>;
+		};
+
+		/* CTI - CPU-3 */
+		cti@f659b000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0 0xf659b000 0 0x1000>;
+
+			clocks = <&acpu_sctrl HI6220_ACPU_SFT_AT_S>;
+			clock-names = "apb_pclk";
+
+			arm,cti-v8-arch;
+			cpu = <&cpu3>;
+			arm,cs-dev-assoc = <&etm3>;
+		};
+
+		/* CTI - CPU-4 */
+		cti@f65d8000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0 0xf65d8000 0 0x1000>;
+
+			clocks = <&acpu_sctrl HI6220_ACPU_SFT_AT_S>;
+			clock-names = "apb_pclk";
+
+			arm,cti-v8-arch;
+			cpu = <&cpu4>;
+			arm,cs-dev-assoc = <&etm4>;
+		};
+
+		/* CTI - CPU-5 */
+		cti@f65d9000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0 0xf65d9000 0 0x1000>;
+
+			clocks = <&acpu_sctrl HI6220_ACPU_SFT_AT_S>;
+			clock-names = "apb_pclk";
+
+			arm,cti-v8-arch;
+			cpu = <&cpu5>;
+			arm,cs-dev-assoc = <&etm5>;
+		};
+
+		/* CTI - CPU-6 */
+		cti@f65da000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0 0xf65da000 0 0x1000>;
+
+			clocks = <&acpu_sctrl HI6220_ACPU_SFT_AT_S>;
+			clock-names = "apb_pclk";
+
+			arm,cti-v8-arch;
+			cpu = <&cpu6>;
+			arm,cs-dev-assoc = <&etm6>;
+		};
+
+		/* CTI - CPU-7 */
+		cti@f65db000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0 0xf65db000 0 0x1000>;
+
+			clocks = <&acpu_sctrl HI6220_ACPU_SFT_AT_S>;
+			clock-names = "apb_pclk";
+
+			arm,cti-v8-arch;
+			cpu = <&cpu7>;
+			arm,cs-dev-assoc = <&etm7>;
+		};
 	};
 };
-- 
2.17.1

