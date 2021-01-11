Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A56B2F16D9
	for <lists+linux-doc@lfdr.de>; Mon, 11 Jan 2021 14:59:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388101AbhAKN6E (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 11 Jan 2021 08:58:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388097AbhAKN6E (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 11 Jan 2021 08:58:04 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9670EC061786
        for <linux-doc@vger.kernel.org>; Mon, 11 Jan 2021 05:57:17 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id x16so24829795ejj.7
        for <linux-doc@vger.kernel.org>; Mon, 11 Jan 2021 05:57:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VMiB/LmxKvao5gWQXAQVDppdL6DxCPyCpBp5kNdzT1c=;
        b=lBWNN2ux+2kukuAXA05YCcGPqggGYffm32fLEq36e+lNmfLFoV4YaMYwCAYUukCXGJ
         naKsUz7UjWeDhc+pPAlKEOcxjR9mye+kAeHTfmhUzjX8NJSQy5/sj1F16Lg5mGqcRCIu
         YWTi2pciXCaR82EUYqXg3WFAjX6FA4UXe049A3rYOOmTyj6WVJZelSEMqYtNDupsA31C
         j7emHgKndWBDUWXow3hs78+LWwTQcxZEMw7lmklRywu6Xt/ycFd97oX1MXKCGtXcbIe9
         fhrSNSidwDEsnp7IExAyir2i1c44Yl8bH8/HPkt323f4efUJC+tkiEw8fBPJO4NLkiwQ
         yGwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VMiB/LmxKvao5gWQXAQVDppdL6DxCPyCpBp5kNdzT1c=;
        b=ZmtopwiKFQuulwbHiDq56oRVYFZnA5Poxk2FgZuA/8QS7CGiFDnog8cYPrjoXaY0L1
         siFfay/rMYA9yBkXs3ywyeaQea8Ij0MQxS3D1IkG3RF9QGiU+AirKvUJE35SdSb53KKb
         VsZGSFM3O5zPosZKROM/o8Wh01LasGzO5c1kgjQvAOyKiBlFaZXraEUsMi5ntcEvMcwT
         oVtAoXHxR0OJhucabBwVqsefw8zlRNuRbAp0OQTXYuy6qPetn7qHTjmCpKuN4HImx9AW
         2+HmmPr46esF4wlGFidMyQUIAszmvS5O4GRcLWCioIHjFFOo3zC41mk/B/MgR2vvPxIF
         Tvvw==
X-Gm-Message-State: AOAM530A9QkQr4nENy/KA0XrEGBvwK9PBcsLtiUFZnxmRL1vZL9e1pNl
        g4NmOnl6Iflo35pY9MPBdb43+A==
X-Google-Smtp-Source: ABdhPJyC+FwGp040lq0f11Sf8bfqy9jwn7/aPAccw+ygtKjPGohABo8b+RtcMwUf+DMjDcx5ZI4lQQ==
X-Received: by 2002:a17:906:85cd:: with SMTP id i13mr10837332ejy.553.1610373436363;
        Mon, 11 Jan 2021 05:57:16 -0800 (PST)
Received: from localhost.localdomain (dh207-97-248.xnet.hr. [88.207.97.248])
        by smtp.googlemail.com with ESMTPSA id ak17sm7176408ejc.103.2021.01.11.05.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 05:57:15 -0800 (PST)
From:   Robert Marko <robert.marko@sartura.hr>
To:     jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, corbet@lwn.net,
        linux-doc@vger.kernel.org
Cc:     Robert Marko <robert.marko@sartura.hr>,
        Luka Perkov <luka.perkov@sartura.hr>
Subject: [PATCH v4 1/3] dt-bindings: hwmon: Add TI TPS23861 bindings
Date:   Mon, 11 Jan 2021 14:57:06 +0100
Message-Id: <20210111135708.3703175-1-robert.marko@sartura.hr>
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
Changes in v4:
* Correct shunt binding

 .../bindings/hwmon/ti,tps23861.yaml           | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/ti,tps23861.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/ti,tps23861.yaml b/Documentation/devicetree/bindings/hwmon/ti,tps23861.yaml
new file mode 100644
index 000000000000..891eee9489aa
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/ti,tps23861.yaml
@@ -0,0 +1,52 @@
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
+    $ref: /schemas/types.yaml#/definitions/uint32
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

