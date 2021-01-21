Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 994732FEC3A
	for <lists+linux-doc@lfdr.de>; Thu, 21 Jan 2021 14:48:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728218AbhAUNrm (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 21 Jan 2021 08:47:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729212AbhAUNpW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 21 Jan 2021 08:45:22 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DE75C0613C1
        for <linux-doc@vger.kernel.org>; Thu, 21 Jan 2021 05:44:42 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id s11so2526540edd.5
        for <linux-doc@vger.kernel.org>; Thu, 21 Jan 2021 05:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=M3W0oGnqVx8sZXTH4B/8UbtQ0KbCZpqf+zZKCBCuHVA=;
        b=NhqMXLkK9ZCnJF+OAdzuMV/V0Cxz1WeCrswp/hbFEE4WdzkO1vjW/CHtLiTt8/6Zwx
         8zxorKBYllOyPIS0JbykVhnCyh5rRMl40zhBrSZYt2QUQsZ5oyXXDzUZpnUhSEdUurYm
         xRTVJd2yHwlMeOrLOgosTusd6xN9ho99nx+tB655Tmr1Y8uto52RAG5BV+p5EWVlVAp6
         dlBKLkhqAEP2qhKRBqt5tki0hWm3Gzv/12QLSp7oaqflIJTqBaVan3ROSKZPfmylJO8H
         +kqRSDS+zsFUkybdKGtd0/CmJGgCbjeNghBTEyD851by0YfnTNYsdmFoeGRqyIUq22FV
         XOvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=M3W0oGnqVx8sZXTH4B/8UbtQ0KbCZpqf+zZKCBCuHVA=;
        b=HVFR59ULHNGo5qmZxSf6qNE8OznI51EHrCnRZdc9jJMoyOKjLI1Ncl3z9xF0zHsvQm
         51hr38b0lIiiPhw/YSt0Lxu2IuxVRWpX1MZDJTnnlKSSIhq+U+f3Or7Z6ue8TCLQzf2G
         bT4RDjq+Tn2+zbuvHQkcsdn55+zO6igDIkA9a4cxAn7rED+O96qJHtVP5no28aOEVzFt
         mkoLipNRHYMG5NgLvNS6JGD59lmFjckYgnnTG8IBerRII+vKGUv+b2xmYWCbhr0pf6jc
         ESHXXK4Fe3MX8susB1cVaX1p6raJ77/MudqnLnfXq7THMJyVGKD7TY6CkCOBFEO/M5+A
         GUDg==
X-Gm-Message-State: AOAM532aOtP2PCo3VABncX/sDdokVE78CmBURLoIC84aPXOgBn5GrBQJ
        Bg5pSR18pDzJyP5iW4Iy+31HGw==
X-Google-Smtp-Source: ABdhPJxzh7fdy0hjbeRujkeb2zjTAnYR6ILI5AnRB6OEZ73CFwsCetWprX2FMc4SYrSxpd9w7FPJsQ==
X-Received: by 2002:a05:6402:8cd:: with SMTP id d13mr7982151edz.335.1611236680889;
        Thu, 21 Jan 2021 05:44:40 -0800 (PST)
Received: from localhost.localdomain (dh207-99-51.xnet.hr. [88.207.99.51])
        by smtp.googlemail.com with ESMTPSA id j18sm2246376ejv.18.2021.01.21.05.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 05:44:40 -0800 (PST)
From:   Robert Marko <robert.marko@sartura.hr>
To:     jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, corbet@lwn.net,
        linux-doc@vger.kernel.org
Cc:     Robert Marko <robert.marko@sartura.hr>,
        Luka Perkov <luka.perkov@sartura.hr>
Subject: [PATCH v5 1/3] dt-bindings: hwmon: Add TI TPS23861 bindings
Date:   Thu, 21 Jan 2021 14:44:32 +0100
Message-Id: <20210121134434.2782405-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Document bindings for the Texas Instruments TPS23861 driver.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Cc: Luka Perkov <luka.perkov@sartura.hr>
---
Changes in v5:
* Drop uint32 reference

Changes in v4:
* Correct shunt binding

 .../bindings/hwmon/ti,tps23861.yaml           | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/ti,tps23861.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/ti,tps23861.yaml b/Documentation/devicetree/bindings/hwmon/ti,tps23861.yaml
new file mode 100644
index 000000000000..3bc8e73dfbf0
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/ti,tps23861.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+
+$id: http://devicetree.org/schemas/hwmon/ti,tps23861.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI TPS23861 PoE PSE
+
+maintainers:
+  - Robert Marko <robert.marko@sartura.hr>
+
+description: |
+  The TPS23861 is a IEEE 802.3at Quad Port Power-over-Ethernet PSE Controller.
+
+  Datasheets:
+  https://www.ti.com/lit/gpn/tps23861
+
+
+properties:
+  compatible:
+    enum:
+      - ti,tps23861
+
+  reg:
+    maxItems: 1
+
+  shunt-resistor-micro-ohms:
+    description: The value of curent sense resistor in microohms.
+    default: 255000
+    minimum: 250000
+    maximum: 255000
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          tps23861@30 {
+              compatible = "ti,tps23861";
+              reg = <0x30>;
+              shunt-resistor-micro-ohms = <255000>;
+          };
+    };
-- 
2.29.2

