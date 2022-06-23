Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5B53557FF4
	for <lists+linux-doc@lfdr.de>; Thu, 23 Jun 2022 18:35:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232324AbiFWQd5 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 23 Jun 2022 12:33:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232124AbiFWQdz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 23 Jun 2022 12:33:55 -0400
Received: from mail.pr-group.ru (mail.pr-group.ru [178.18.215.3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C9233A732;
        Thu, 23 Jun 2022 09:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
        d=metrotek.ru; s=mail;
        h=from:subject:date:message-id:to:cc:mime-version:content-transfer-encoding:
         in-reply-to:references;
        bh=2+zzbSMI3tysA99V0Sf0sGgVUQ14m6F8zgKrwbt63TA=;
        b=mQxmVUk+a6pQ2bH7dj0EddPKMcuZ9hlTrn4InCvZVG2LUg5KRNA4OeR7DAAPGV26wKLKh0rN/w4XR
         mlKwVds23yVHtIMBmz51yhqa+SM0z2BL3VdVcRiQqrI/+BmG9imD9mtgqslqKTrceawNPd+Ad3tBbw
         jgHwLSHnKyj9apTPLmN7M25JD2uq5JG7qFDCFo0Eg4h2J9xXrv9NYsOBR1W14/519s0XHl8bW+dRei
         1U1t4Zv2S8rGgq9H/Nv/rnRWSjjDmzpFn1BSUNKyt6qZ+XGnXYGCtp7YB+ZE1E9wOyNdzVKyylOhpK
         V3v/z/uIQVz873ohYbulttEf/HzW/FQ==
X-Kerio-Anti-Spam:  Build: [Engines: 2.16.3.1424, Stamp: 3], Multi: [Enabled, t: (0.000008,0.008403)], BW: [Enabled, t: (0.000020,0.000001)], RTDA: [Enabled, t: (0.112047), Hit: No, Details: v2.40.0; Id: 15.52k7on.1g68mj0lv.2ljae; mclb], total: 0(700)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Level: 
X-Footer: bWV0cm90ZWsucnU=
Received: from h-e2.ddg ([85.143.252.66])
        (authenticated user i.bornyakov@metrotek.ru)
        by mail.pr-group.ru with ESMTPSA
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits));
        Thu, 23 Jun 2022 19:33:37 +0300
From:   Ivan Bornyakov <i.bornyakov@metrotek.ru>
To:     mdf@kernel.org, hao.wu@intel.com, yilun.xu@intel.com,
        trix@redhat.com, corbet@lwn.net
Cc:     Ivan Bornyakov <i.bornyakov@metrotek.ru>,
        conor.dooley@microchip.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-fpga@vger.kernel.org,
        linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, system@metrotek.ru,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v22 4/5] dt-bindings: fpga: add binding doc for microchip-spi fpga mgr
Date:   Thu, 23 Jun 2022 19:32:47 +0300
Message-Id: <20220623163248.3672-5-i.bornyakov@metrotek.ru>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220623163248.3672-1-i.bornyakov@metrotek.ru>
References: <20220623163248.3672-1-i.bornyakov@metrotek.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add Device Tree Binding doc for Microchip Polarfire FPGA Manager using
slave SPI to load .dat formatted bitstream image.

Signed-off-by: Ivan Bornyakov <i.bornyakov@metrotek.ru>
Reviewed-by: Rob Herring <robh@kernel.org>
Acked-by: Xu Yilun <yilun.xu@intel.com>
---
 .../fpga/microchip,mpf-spi-fpga-mgr.yaml      | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fpga/microchip,mpf-spi-fpga-mgr.yaml

diff --git a/Documentation/devicetree/bindings/fpga/microchip,mpf-spi-fpga-mgr.yaml b/Documentation/devicetree/bindings/fpga/microchip,mpf-spi-fpga-mgr.yaml
new file mode 100644
index 000000000000..aee45cb15592
--- /dev/null
+++ b/Documentation/devicetree/bindings/fpga/microchip,mpf-spi-fpga-mgr.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/fpga/microchip,mpf-spi-fpga-mgr.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip Polarfire FPGA manager.
+
+maintainers:
+  - Ivan Bornyakov <i.bornyakov@metrotek.ru>
+
+description:
+  Device Tree Bindings for Microchip Polarfire FPGA Manager using slave SPI to
+  load the bitstream in .dat format.
+
+properties:
+  compatible:
+    enum:
+      - microchip,mpf-spi-fpga-mgr
+
+  reg:
+    description: SPI chip select
+    maxItems: 1
+
+  spi-max-frequency: true
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    spi {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            fpga_mgr@0 {
+                    compatible = "microchip,mpf-spi-fpga-mgr";
+                    spi-max-frequency = <20000000>;
+                    reg = <0>;
+            };
+    };
-- 
2.36.1


