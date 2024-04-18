Return-Path: <linux-doc+bounces-14541-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5238A9A09
	for <lists+linux-doc@lfdr.de>; Thu, 18 Apr 2024 14:44:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C99FA1F21BB6
	for <lists+linux-doc@lfdr.de>; Thu, 18 Apr 2024 12:44:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 641F515FA60;
	Thu, 18 Apr 2024 12:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="2zNrumNW"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6E814882C
	for <linux-doc@vger.kernel.org>; Thu, 18 Apr 2024 12:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713444238; cv=none; b=RzANFvV7Os560rz4WKswkY+eFUjdaUXycSc77vBBw4LCL3KiIazaRA5WNMtPnu20TqYdaFUhCuN23zlvKsJ3B7T/GnkUng/Q1AzYY5nGXo4eKclSz/yiTDxyshVWJrqy7nbPwUNdAuOlt1Fst64yjbSFfb+cz228oeut+svWk6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713444238; c=relaxed/simple;
	bh=keUOTcQpJ+9Spm7ZO1wTme35teQ5D7BlxcLl00vQb1s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hRZIbexrJbdV8KKsmr67m2WLk0z3j6KhnNXI+ahKgbtouqSGRPpLoKdhhp31yir9I0BO3RK/9j/2J2sY/N3/xjUjFT1U0W0IskPj5MxsSo+pA2BjTl2/tCOy9fLmJjzIiigGuK9+I5NFsuKPF+KSWfoT6tntPDZ5rakT9aVDZaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=2zNrumNW; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-346407b8c9aso222923f8f.0
        for <linux-doc@vger.kernel.org>; Thu, 18 Apr 2024 05:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713444235; x=1714049035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zrjU6l9W7DikYIaMYJG/SdZ2oUTcGtwCnDHe7Ekc7IE=;
        b=2zNrumNWxQWNhSEDA3BqSlQilsh7yLZQ9sMPLJTdL10wRRSJCJ2YKL1Ua8ePsJnwCe
         csUNqMEtEnX5kOfXu9TjBCAhYce9No9hJ/qKIMsUZj/nHoRz0xvNEtFUAsM+CnAmiKVD
         JjmLVjoJ5k50Rgi3rDs5tprdOQgVeMyOe05qCYkUT6tPBPYS567NYUn3qqZ3vjlf/0XJ
         vuECuSqUrQKfX89j21oipCASHFXsorpxKGST2JPaTJIb+chzySvpq8SCIi6i9EFQwKf9
         BjGuyw4PxWG2EcKOU4o0KfDXNDeSUKjXSx+VdcfPrt1cTYfu0dQuA1gQxGOu6Wz6Uuyk
         XokA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713444235; x=1714049035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zrjU6l9W7DikYIaMYJG/SdZ2oUTcGtwCnDHe7Ekc7IE=;
        b=pYxEjLF5UlZlyn1OQ1c02gaMRLUPNOpTbFLpAUJ1q8vFC1wcF+UlQ0V67PSxgkMQOF
         TwKpcbRDUGLUzW5S9vE2YV1N3hX0c70P//+IvJp1CGG/RJJiOrFnxShzyKUm6goHh2yI
         c6lu6vMbhITpFJLXlQ1NZb3E2PvcA3Mmtun7+TtR68+K/OBZR4FfcbdgU4aOHtiNj+13
         C5i7C4Zt8FXkWvBE68OYvbFIAq2O7qzlBBK9Xfr+wHWqy8lq7TbxJvGlUCzMbLJh4mZI
         zJGWQf0gNUHBCJk1mNCCWhfAbuEff7pmyO8BJZrXvMMq335+xAnFRU38qQYnVjKD2i+R
         hzKA==
X-Forwarded-Encrypted: i=1; AJvYcCXVkwyz4Zp4NWb3woM2WCxta9ultkgbL4sh82hoIWRUIP0+G6TFX9GUp1xjgEtT49Jo+lwW8nHfQlA8CVVdYxCRDBq/GVC/Zf8e
X-Gm-Message-State: AOJu0YwLaHAqwNiwLIrsrvpp20VgD3o1x9SAIgPH8eFO9XpoHjRE8rDU
	zOptweXyh5FulVcxoCxZOQC6UFKIRIq/GGmyzAhEAuA24K/KrmKcAP6oav8Nb2I=
X-Google-Smtp-Source: AGHT+IFFx4DMJCN/eGlinw4D8WxSb2s5Led6zbc0ypunbHRPKVqfx9J88kY5VuS8nvJuPPTEq99jAg==
X-Received: by 2002:a05:600c:55d7:b0:418:ef65:4b5f with SMTP id jq23-20020a05600c55d700b00418ef654b5fmr805438wmb.3.1713444235113;
        Thu, 18 Apr 2024 05:43:55 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:7b64:4d1d:16d8:e38b])
        by smtp.gmail.com with ESMTPSA id bi18-20020a05600c3d9200b00418d5b16fa2sm3373412wmb.30.2024.04.18.05.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 05:43:54 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Anup Patel <anup@brainfault.org>,
	Shuah Khan <shuah@kernel.org>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Atish Patra <atishp@atishpatra.org>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v2 01/12] dt-bindings: riscv: add Zca, Zcf, Zcd and Zcb ISA extension description
Date: Thu, 18 Apr 2024 14:42:24 +0200
Message-ID: <20240418124300.1387978-2-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240418124300.1387978-1-cleger@rivosinc.com>
References: <20240418124300.1387978-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add description for Zca, Zcf, Zcd and Zcb extensions which are part the
Zc* standard extensions for code size reduction. Additional validation
rules are added since Zcb depends on Zca, Zcf, depends on Zca and F, Zcd
depends on Zca and D and finally, Zcf can not be present on rv64.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
---
 .../devicetree/bindings/riscv/extensions.yaml | 78 +++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 616370318a66..db7daf22b863 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -220,6 +220,38 @@ properties:
             instructions as ratified at commit 6d33919 ("Merge pull request #158
             from hirooih/clmul-fix-loop-end-condition") of riscv-bitmanip.
 
+        - const: zca
+          description: |
+            The Zca extension part of Zc* standard extensions for code size
+            reduction, as ratified in commit 8be3419c1c0 ("Zcf doesn't exist on
+            RV64 as it contains no instructions") of riscv-code-size-reduction,
+            merged in the riscv-isa-manual by commit dbc79cf28a2 ("Initial seed
+            of zc.adoc to src tree.").
+
+        - const: zcb
+          description: |
+            The Zcb extension part of Zc* standard extensions for code size
+            reduction, as ratified in commit 8be3419c1c0 ("Zcf doesn't exist on
+            RV64 as it contains no instructions") of riscv-code-size-reduction,
+            merged in the riscv-isa-manual by commit dbc79cf28a2 ("Initial seed
+            of zc.adoc to src tree.").
+
+        - const: zcd
+          description: |
+            The Zcd extension part of Zc* standard extensions for code size
+            reduction, as ratified in commit 8be3419c1c0 ("Zcf doesn't exist on
+            RV64 as it contains no instructions") of riscv-code-size-reduction,
+            merged in the riscv-isa-manual by commit dbc79cf28a2 ("Initial seed
+            of zc.adoc to src tree.").
+
+        - const: zcf
+          description: |
+            The Zcf extension part of Zc* standard extensions for code size
+            reduction, as ratified in commit 8be3419c1c0 ("Zcf doesn't exist on
+            RV64 as it contains no instructions") of riscv-code-size-reduction,
+            merged in the riscv-isa-manual by commit dbc79cf28a2 ("Initial seed
+            of zc.adoc to src tree.").
+
         - const: zfa
           description:
             The standard Zfa extension for additional floating point
@@ -489,5 +521,51 @@ properties:
             Registers in the AX45MP datasheet.
             https://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-5.0.0-Datasheet.pdf
 
+    allOf:
+      # Zcb depends on Zca
+      - if:
+          contains:
+            const: zcb
+        then:
+          contains:
+            const: zca
+      # Zcd depends on Zca and D
+      - if:
+          contains:
+            const: zcd
+        then:
+          allOf:
+            - contains:
+                const: zca
+            - contains:
+                const: d
+      # Zcf depends on Zca and F
+      - if:
+          contains:
+            const: zcf
+        then:
+          allOf:
+            - contains:
+                const: zca
+            - contains:
+                const: f
+
+allOf:
+  # Zcf extension does not exists on rv64
+  - if:
+      properties:
+        riscv,isa-extensions:
+          contains:
+            const: zcf
+        riscv,isa-base:
+          contains:
+            const: rv64i
+    then:
+      properties:
+        riscv,isa-extensions:
+          not:
+            contains:
+              const: zcf
+
 additionalProperties: true
 ...
-- 
2.43.0


