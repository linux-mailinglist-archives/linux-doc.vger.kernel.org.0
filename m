Return-Path: <linux-doc+bounces-2022-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D33A7E62F4
	for <lists+linux-doc@lfdr.de>; Thu,  9 Nov 2023 05:51:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9CBE51C204BF
	for <lists+linux-doc@lfdr.de>; Thu,  9 Nov 2023 04:51:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 833BF568C;
	Thu,  9 Nov 2023 04:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EXyZekbi"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9415D612B;
	Thu,  9 Nov 2023 04:51:00 +0000 (UTC)
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C113226B7;
	Wed,  8 Nov 2023 20:50:59 -0800 (PST)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-59b5484fbe6so5584647b3.1;
        Wed, 08 Nov 2023 20:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699505459; x=1700110259; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j5vJPcD48+bxbre1kkp0PA8tIiFQNKj+piao73jdBfw=;
        b=EXyZekbiPSdXBZaeJYC/f8GS7hPMUCNTlMp2TEW3e6jeJ68Kyk2R47eff0qxwudkPR
         r5OVOa0Q8cWCMr29RvmuNHSwqbvr3R/05Uy+pENUkuOcV7W4tEUspoe7HdS7bF9vOr0B
         JeU/ZdJwK0SzQnmff8fTKzqkWThgk3lW3z1Rh/0x2BJhbemGE1q+MYTlIKN6cTvBqKgm
         l1E/nNJXvFAnTYe0Olfcdy1ekgeO2fStrPiEL8YovaHoD85dtxjyRngCqKtD55rbiW3G
         45IzllfIZUZg6VetA1RQJvOCgHKhpFl0vQikzqpi7wB/kMiClnh/dZDj1Hmd2m2ZcX+z
         Z4yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699505459; x=1700110259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j5vJPcD48+bxbre1kkp0PA8tIiFQNKj+piao73jdBfw=;
        b=oc+2abttnicd8v70hD1Tw9wHuMARrjCuFzW9nGbEePhbVvkZKVERHTQlOJAoGOrJop
         jgI54PfUbOSOiX9vJfpTsWyfoNJVFwvDrn+Cf1MXNo+Od6kgYMJbJ7daZKDkWlp+wqPS
         kK9HYAPHu7gknTtHFUdk+J9c02VPH9tqZJlbZ9iTEh5va93A1PkffmHLPEfwE6LhrsWQ
         ID1ilG6bbT0x32zmB9BxioGKhDdrmioGC4G0sXNByZrb5HerZ8dWrKnkMOTVdSgRQbt2
         zJM6ASb+/SdJx7DfmrJKG1AfN2d3dLhJ62kTehql4Kf1XTJtXRIf3KZ9TG5Qcvtn1Gf+
         3Vxg==
X-Gm-Message-State: AOJu0YwRAqAL5rJd5s8Qse26zO1fZyF5Usx8BJqybVbFHDqF2145ldrr
	B00keO9SoHxNFr5dOXqflHY=
X-Google-Smtp-Source: AGHT+IFhLdZqCbaifBTt8MZA/g4VSNeGMJNCpiIZuzTRqeZp4XKmGcMNpQIktiDxERJXcpF4byejUg==
X-Received: by 2002:a0d:d8d4:0:b0:5a8:1727:cab4 with SMTP id a203-20020a0dd8d4000000b005a81727cab4mr3818387ywe.5.1699505458641;
        Wed, 08 Nov 2023 20:50:58 -0800 (PST)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id q189-20020a6343c6000000b005bcebc93d7asm3869035pga.47.2023.11.08.20.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 20:50:58 -0800 (PST)
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
Subject: [PATCH v2 1/2] dt-bindings: hwmon: Add mps mp5990 driver bindings
Date: Thu,  9 Nov 2023 12:48:42 +0800
Message-Id: <20231109044844.614007-2-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231109044844.614007-1-peteryin.openbmc@gmail.com>
References: <20231109044844.614007-1-peteryin.openbmc@gmail.com>
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
 .../devicetree/bindings/hwmon/mps,mp5990.yaml | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/mps,mp5990.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/mps,mp5990.yaml b/Documentation/devicetree/bindings/hwmon/mps,mp5990.yaml
new file mode 100644
index 000000000000..bfd0cf7d3470
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/mps,mp5990.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/mps,mp5990.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Monolithic Power Systems Devices MP5990 Hot-Swap Controller
+
+maintainers:
+  - Peter Yin <peteryin.openbmc@gmail.com>
+
+description: |
+  Monolithic Power Systems Devices MP5990 Hot-Swap Controller
+
+  Datasheets:
+  https://www.monolithicpower.com/en/mp5990.html
+
+properties:
+  compatible:
+    const: mps,mp5990
+
+  reg:
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


