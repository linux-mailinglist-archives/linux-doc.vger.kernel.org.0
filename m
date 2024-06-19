Return-Path: <linux-doc+bounces-18981-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB2090F9EC
	for <lists+linux-doc@lfdr.de>; Thu, 20 Jun 2024 01:57:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 092E71F217A6
	for <lists+linux-doc@lfdr.de>; Wed, 19 Jun 2024 23:57:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A17815DBD1;
	Wed, 19 Jun 2024 23:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="X/6KfJ3e"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AFD415CD6B
	for <linux-doc@vger.kernel.org>; Wed, 19 Jun 2024 23:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718841453; cv=none; b=k8WsllJLH7tpFSulaHNT/s3U8/QrJcAiYVVp4zG4tAzke28++sD4IMSlRMk7Ou/4mCaU9/BR9pUcFUIXMzOr6OuRzgjQonZLy5cUbJMVCA9aPFcbvi55yGi5AuG7a5HNsvKKsfI1GcZ0DRMU3pt6cZo0nkOqMQGeCa5TJQo/8/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718841453; c=relaxed/simple;
	bh=AcYcvjjFWiKhiKAl88lWRz1HvD4LxurkZU44w/pWvNk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XwZh+WbnMEdiEqEfjGf+th4io0dW56orNmrVWpLcRlcsckhi8ISdxyZTqxEhb1fq2N+McWSb/w7P1feucDOmHqtOeIv0vXIKYtD5xDKwoBNcK8XuoTUhccY3e7JcPqE7bLxwGteyhkNYrFGcxZSh8O5+15H2+/M78HZaH2Pk140=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=X/6KfJ3e; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1f9bf484d9fso4345175ad.1
        for <linux-doc@vger.kernel.org>; Wed, 19 Jun 2024 16:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718841450; x=1719446250; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PelCoZIE6iF05n1jOzSStOEaV77ZcPwwfY9j6HR1NNo=;
        b=X/6KfJ3ehFhqRTL3+6Ls3D4ll1wdMg9XzbcocSsw3KcMOJVfD9vRz6+H8tTfb28KYi
         ZqOa1JIeZHV3NpN0iwTX6A12n43qIy7KVMuJK8n60xSDTe0qp9HAOfkWf/EaLSBmmqMU
         PMlq8JOkqybaLbuHQU5RO7EbYLJrR7fjx+W+xcu9Jxgky4jsy9m9dACJ1mOyGPFrh8jJ
         BlQ8wA8HWYkpA+anOxGO2gfpPKWcq23CqxJnrmU63ujblsRQ5OK33ua3nCiN/S5nb0X5
         ZeK9O6AGodywz5i1d0DLhe+gOIZP4hkqLu+hqE0c+kBXlu3iamWwsNNRNiEbgDuuIz70
         gM6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718841450; x=1719446250;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PelCoZIE6iF05n1jOzSStOEaV77ZcPwwfY9j6HR1NNo=;
        b=kaa5yP3BqAq+1MEz5JO2tp0WWC8rznRrq9tS2RxdAVZ2smkETR1+9/qrTef6toAY9R
         8OQ52j87fJnctx5w2eXY0UHGe+2vHvVHEYaFQa+ZzNMa0pDDcJjkdyGArtF8+H7kipik
         ZRkTAYbEZnZm7gHooJta2BwH4xEBaDi8g6NPBxeV+sgVA2U+PQfE29qlvsSZ1OSYWKvm
         sCKPxlcd5EqChBjYQIEZYLiVEwCi1dr3HEDdNzHu8/i1FOElodDzZeDMCJ7YUuMuXXm9
         m1aLHXmpnVRRMgYedxh0pXRUnvvD7g/jIDJTi8AL5stB4tUjRNSAnWkSRNQdcP6XJuXE
         8g7w==
X-Forwarded-Encrypted: i=1; AJvYcCUxa3i56hq76LIlorS4ElgvPPsTFvP8Hub9LhOB5X2UIY14C1dWc7tkPmpqIE7xeQBfm+1kosGxMv0Nox9VsvyTjxHG7z30x9Jn
X-Gm-Message-State: AOJu0YwO6zwq8azqZiAk76ShR1n+hwK0ACGCCH54BXw0dexzPII+oxlG
	NyqGVHDnlrByGlDCgkBDJpyPOp2V+K+K5pEemngr8pFFfMVv6ez2jqnnoqjT2W4=
X-Google-Smtp-Source: AGHT+IGKiOHqo/xkEw31TNBwetx6wfNgMA1oKjo5fAWCMWu+48/TKV0DOjQRPhYoUq0jsmdx6frb+A==
X-Received: by 2002:a17:903:8c6:b0:1f8:50df:548e with SMTP id d9443c01a7336-1f98b28eff9mr98856635ad.33.1718841450144;
        Wed, 19 Jun 2024 16:57:30 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e70ae6sm123620745ad.71.2024.06.19.16.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 16:57:29 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 19 Jun 2024 16:57:15 -0700
Subject: [PATCH v3 02/13] dt-bindings: cpus: add a thead vlen register
 length property
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240619-xtheadvector-v3-2-bff39eb9668e@rivosinc.com>
References: <20240619-xtheadvector-v3-0-bff39eb9668e@rivosinc.com>
In-Reply-To: <20240619-xtheadvector-v3-0-bff39eb9668e@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Evan Green <evan@rivosinc.com>, Andy Chiu <andy.chiu@sifive.com>, 
 Jessica Clarke <jrtc27@jrtc27.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718841444; l=1911;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=AcYcvjjFWiKhiKAl88lWRz1HvD4LxurkZU44w/pWvNk=;
 b=A9QBmc/bNcCzD9U62u8M5LqntgqiVYoO6pMKw58e5Ka8p8moOEMLez3mAwOBcj9EOCElapzC7
 Eek8Z+Nk9vABMXPKzFBZzvHdV3ycLm/UMw8VYhvueinEAk91PEb9I0/
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

Add a property analogous to the vlenb CSR so that software can detect
the vector length of each CPU prior to it being brought online.
Currently software has to assume that the vector length read from the
boot CPU applies to all possible CPUs. On T-Head CPUs implementing
pre-ratification vector, reading the th.vlenb CSR may produce an illegal
instruction trap, so this property is required on such systems.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index d87dd50f1a4b..a6bbbf658977 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -26,6 +26,18 @@ description: |
 allOf:
   - $ref: /schemas/cpu.yaml#
   - $ref: extensions.yaml
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - thead,c906
+                - thead,c910
+                - thead,c920
+    then:
+      properties:
+        thead,vlenb: false
 
 properties:
   compatible:
@@ -94,6 +106,13 @@ properties:
     description:
       The blocksize in bytes for the Zicboz cache operations.
 
+  thead,vlenb:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      VLEN/8, the vector register length in bytes. This property is required on
+      thead systems where the vector register length is not identical on all harts, or
+      the vlenb CSR is not available.
+
   # RISC-V has multiple properties for cache op block sizes as the sizes
   # differ between individual CBO extensions
   cache-op-block-size: false

-- 
2.34.1


