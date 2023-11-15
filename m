Return-Path: <linux-doc+bounces-1680-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 30EF97DFF92
	for <lists+linux-doc@lfdr.de>; Fri,  3 Nov 2023 09:05:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 61A1F1C2034D
	for <lists+linux-doc@lfdr.de>; Fri,  3 Nov 2023 08:05:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4F5279CF;
	Fri,  3 Nov 2023 08:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BUZMq2hp"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8008A2D600;
	Fri,  3 Nov 2023 08:04:56 +0000 (UTC)
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCBABD42;
	Fri,  3 Nov 2023 01:04:51 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-6b5af4662b7so1764223b3a.3;
        Fri, 03 Nov 2023 01:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698998691; x=1699603491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V8o7NIVsvFjoN1IBcJ9gHST23hC/srd4GUV+1AFgork=;
        b=BUZMq2hpWAjDVjRxMnilrZ9EUdJHidAj6QzwqMdPxqcTLiZ8U2WNc7Lz0XSujJX6ZP
         Nc39h6rliipFGiel285vAYPJTr/adNwlDr35YmXfVUdU7hVgjKOxyVeQ/ZvDh+XrOm8x
         QZdow8LdtnRwUQxm/orZfDs24MvYI/6VvLqAz8FqZ8SmLqVA622IM8YXmYlEpoeTidYd
         PqiITFYSutyLw7esICxZL4CC28JIaQlcISZfjQmIQvHJd4HQ4fRUSJmFKLQmq78bfKuw
         UrYAdO0+ZsU4J3W1Jmc4i25hHnWugvEsvh5kxmvIvh9pYBo6R0OcVh3Unq6rIXtIMxWt
         Uauw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698998691; x=1699603491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V8o7NIVsvFjoN1IBcJ9gHST23hC/srd4GUV+1AFgork=;
        b=ZdGAHLqMFbm0h7y1h/TxpFKqL3Na1X6p/4oxwppK4CIx8gd2YWtrMd50C1tBKHnCqv
         gNYlPylZd7hjH/vvYOM6vxQJRZY12WtuLjaZKqZrR2mMaYLTsFx7QT97h7RX7ENEcFXq
         23UhO0nAais3a12jjVoK69v80lo7QQNaqrWDiXytMe0D0oLLgxvA1KDVyROKhSjs5qVP
         kg5sdzKfF06IXw0w7BbR4dF3PFWoQoKyHZ2vPmMqsGlOvqHUDtSVqa5rACy/2Bn/FvZR
         gkbF+R/M3Q+VQSYCTvwtb1Ou0o4RCG/Ji4+BQyjb4t9scBZTZQ26QkHMZlHK9h/d6Bwn
         MPjQ==
X-Gm-Message-State: AOJu0YwzWD81Hk+j14FgS17L5GGuO1fgDVuexIcM3Fqs1kz0apMrLFxK
	iryGAS5sJDO+0w7O9J1qwz4=
X-Google-Smtp-Source: AGHT+IGHcOsomwU0+lxHyL/U3Etoy6sODvXrPBey27Szl3Sc8WMv3OZCAwZX7IBMT+grKteABJvGkA==
X-Received: by 2002:a05:6a20:3941:b0:181:8654:8279 with SMTP id r1-20020a056a20394100b0018186548279mr5059009pzg.47.1698998691363;
        Fri, 03 Nov 2023 01:04:51 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id l1-20020a17090a72c100b002790ded9c6dsm834378pjk.31.2023.11.03.01.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Nov 2023 01:04:50 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: patrick@stwcx.xyz,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Peter Yin <peteryin.openbmc@gmail.com>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v1 1/2] dt-bindings: hwmon: Add mps mp5990 driver bindings
Date: Fri,  3 Nov 2023 16:01:26 +0800
Message-Id: <20231103080128.1204218-2-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231103080128.1204218-1-peteryin.openbmc@gmail.com>
References: <20231103080128.1204218-1-peteryin.openbmc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a device tree bindings for mp5990 device.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 .../devicetree/bindings/hwmon/mps,mp5990.yaml | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/mps,mp5990.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/mps,mp5990.yaml b/Documentation/devicetree/bindings/hwmon/mps,mp5990.yaml
new file mode 100644
index 000000000000..7533d69f1922
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/mps,mp5990.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/mps,mp5990.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices MP5990 HSC Controller
+
+maintainers:
+  - Peter Yin <peteryin.openbmc@gmail.com>
+
+description: |
+  Analog Devices MP5990 HSC Controller
+
+  Datasheets:
+  https://www.monolithicpower.com/en/mp5990.html
+
+properties:
+  compatible:
+    enum:
+      - mps,mp5990
+
+  reg:
+    description: I2C address of slave device.
+    maxItems: 1
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
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        power-sensor@20 {
+            reg = <0x20>;
+            compatible = "mps,mp5990";
+        };
+    };
-- 
2.25.1


