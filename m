Return-Path: <linux-doc+bounces-424-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0207CC43E
	for <lists+linux-doc@lfdr.de>; Tue, 17 Oct 2023 15:15:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C8A78B213B4
	for <lists+linux-doc@lfdr.de>; Tue, 17 Oct 2023 13:15:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0062E436A7;
	Tue, 17 Oct 2023 13:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="yQIORvDr"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9828542C1D
	for <linux-doc@vger.kernel.org>; Tue, 17 Oct 2023 13:15:37 +0000 (UTC)
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2847103
	for <linux-doc@vger.kernel.org>; Tue, 17 Oct 2023 06:15:35 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2c52407516bso3494241fa.1
        for <linux-doc@vger.kernel.org>; Tue, 17 Oct 2023 06:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697548534; x=1698153334; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gPGVtTxEoI+EJFM/rO8bytg8A5BuyDNrPQqlXh09110=;
        b=yQIORvDrXztvFM8kTpl0NZ863xfT0dgOfj3OtVJ8CdGam+buW/xAAquxcCZWRBnGNJ
         0Ocvg4QeYlhfzR7g857Wx0doIUq/9p0l7YOeRIN6OpoFavORUWYDB8+aTPBDf8oI/Kpw
         oSvFMPhQnfP34gNzvNhhloQ1FyikmaOaR0mGFZPObKfN3qcIvMHr+PY+zjwII1qUjh5M
         6XXWt1JG0SsV9tQmSFIQMv4BZ7Z8za6HM+fG6Qdd8heQP8VwU2kSTybnWGw6r33xijmw
         miQyU851airCXzfHkLlpu7e6xtrq89Wa6FAD+npwW1vkuTg+ZqENAK9xK9N1lzfmeKfc
         3M+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697548534; x=1698153334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gPGVtTxEoI+EJFM/rO8bytg8A5BuyDNrPQqlXh09110=;
        b=VmoNGUtmfFKtUUDN08MzOZsGnz9NRzMWQ77nuQ8+Ie5aMNOeVx+mKAF35a9IaIXnxR
         i8FYgJ4UVLLw96sUC5W78D/1V3pFps4ygMr4Cw7T0tMpv71xco++eFzwnnPLWzACh/iD
         6cSQO5ghlLDoJ2xpVIPgyNeqq2A786QSSC/wk9+CcQSdQHRf2GwddZOgEQnscJqnw1iq
         z7GUmCus9DoThcgbLBpUvhG79Sho7Cn36LdFxRIb0yiccTGJu0xINi7++cm0lIyVT4NW
         annJ+pfb8RzuWdj7tRcGntxmrHoRWSO3Nv3RtEkyXl2/oY7UiB8R5eZDOoHJGxrBnqXY
         tszw==
X-Gm-Message-State: AOJu0YxNBwS30QGTDbydS7MOm1bzW9it+ESoeaMPS/24MAe+oEIS1qb0
	mtocXJTgGGTlFTuhmeZDOTiBLw==
X-Google-Smtp-Source: AGHT+IG89Ezhs/hr39tiGoIN9T+MSH1jYS4TrNXC4XsGbKsSNFsBrnTzxaL5mt1ZXNIpzObkb7JElA==
X-Received: by 2002:a2e:b553:0:b0:2c5:2407:4d0c with SMTP id a19-20020a2eb553000000b002c524074d0cmr1474854ljn.2.1697548533314;
        Tue, 17 Oct 2023 06:15:33 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:96:820c:ecf7:a817])
        by smtp.gmail.com with ESMTPSA id fj7-20020a05600c0c8700b0040772138bb7sm9873393wmb.2.2023.10.17.06.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 06:15:32 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Jones <ajones@ventanamicro.com>,
	Evan Green <evan@rivosinc.com>,
	Conor Dooley <conor@kernel.org>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 07/19] dt-bindings: riscv: add vector crypto ISA extensions description
Date: Tue, 17 Oct 2023 15:14:44 +0200
Message-ID: <20231017131456.2053396-8-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231017131456.2053396-1-cleger@rivosinc.com>
References: <20231017131456.2053396-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Add Zv* vector crypto extensions that were added in "RISC-V Cryptography
Extensions Volume II" specificationi[1]:

- Zvbb: Vector Basic Bit-manipulation
- Zvbc: Vector Carryless Multiplication
- Zvkb: Vector Cryptography Bit-manipulation
- Zvkg: Vector GCM/GMAC.
- Zvkned: NIST Suite: Vector AES Block Cipher
- Zvknh[ab]: NIST Suite: Vector SHA-2 Secure Hash
- Zvksed: ShangMi Suite: SM4 Block Cipher
- Zvksh: ShangMi Suite: SM3 Secure Hash
- Zvkn: NIST Algorithm Suite
- Zvknc: NIST Algorithm Suite with carryless multiply
- Zvkng: NIST Algorithm Suite with GCM.
- Zvks: ShangMi Algorithm Suite
- Zvksc: ShangMi Algorithm Suite with carryless multiplication
- Zvksg: ShangMi Algorithm Suite with GCM.
- Zvkt: Vector Data-Independent Execution Latency.

Link: https://drive.google.com/file/d/1gb9OLH-DhbCgWp7VwpPOVrrY6f3oSJLL/view [1]
Signed-off-by: Clément Léger <cleger@rivosinc.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/riscv/extensions.yaml | 96 +++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 96ed3d22d3c4..93beb9872900 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -323,5 +323,101 @@ properties:
             in commit 2e5236 ("Ztso is now ratified.") of the
             riscv-isa-manual.
 
+        - const: zvbb
+          description:
+            The standard Zvbb extension for vectored basic bit-manipulation
+            instructions, as ratified in commit 56ed795 ("Update
+            riscv-crypto-spec-vector.adoc") of riscv-crypto.
+
+        - const: zvbc
+          description:
+            The standard Zvbc extension for vectored carryless multiplication
+            instructions, as ratified in commit 56ed795 ("Update
+            riscv-crypto-spec-vector.adoc") of riscv-crypto.
+
+        - const: zvkb
+          description:
+            The standard Zvkb extension for vector cryptography bit-manipulation
+            instructions, as ratified in commit 56ed795 ("Update
+            riscv-crypto-spec-vector.adoc") of riscv-crypto.
+
+        - const: zvkg
+          description:
+            The standard Zvkg extension for vector GCM/GMAC instructions, as
+            ratified in commit 56ed795 ("Update riscv-crypto-spec-vector.adoc")
+            of riscv-crypto.
+
+        - const: zvkn
+          description:
+            The standard Zvkn extension for NIST algorithm suite instructions, as
+            ratified in commit 56ed795 ("Update riscv-crypto-spec-vector.adoc")
+            of riscv-crypto.
+
+        - const: zvknc
+          description:
+            The standard Zvknc extension for NIST algorithm suite with carryless
+            multiply instructions, as ratified in commit 56ed795 ("Update
+            riscv-crypto-spec-vector.adoc") of riscv-crypto.
+
+        - const: zvkned
+          description:
+            The standard Zvkned extension for Vector AES block cipher
+            instructions, as ratified in commit 56ed795 ("Update
+            riscv-crypto-spec-vector.adoc") of riscv-crypto.
+
+        - const: zvkng
+          description:
+            The standard Zvkng extension for NIST algorithm suite with GCM
+            instructions, as ratified in commit 56ed795 ("Update
+            riscv-crypto-spec-vector.adoc") of riscv-crypto.
+
+        - const: zvknha
+          description: |
+            The standard Zvknha extension for NIST suite: vector SHA-2 secure,
+            hash (SHA-256 only) instructions, as ratified in commit
+            56ed795 ("Update riscv-crypto-spec-vector.adoc") of riscv-crypto.
+
+        - const: zvknhb
+          description: |
+            The standard Zvknhb extension for NIST suite: vector SHA-2 secure,
+            hash (SHA-256 and SHA-512) instructions, as ratified in commit
+            56ed795 ("Update riscv-crypto-spec-vector.adoc") of riscv-crypto.
+
+        - const: zvks
+          description:
+            The standard Zvks extension for ShangMi algorithm suite
+            instructions, as ratified in commit 56ed795 ("Update
+            riscv-crypto-spec-vector.adoc") of riscv-crypto.
+
+        - const: zvksc
+          description:
+            The standard Zvksc extension for ShangMi algorithm suite with
+            carryless multiplication instructions, as ratified in commit 56ed795
+            ("Update riscv-crypto-spec-vector.adoc") of riscv-crypto.
+
+        - const: zvksed
+          description: |
+            The standard Zvksed extension for ShangMi suite: SM4 block cipher
+            instructions, as ratified in commit 56ed795 ("Update
+            riscv-crypto-spec-vector.adoc") of riscv-crypto.
+
+        - const: zvksh
+          description: |
+            The standard Zvksh extension for ShangMi suite: SM3 secure hash
+            instructions, as ratified in commit 56ed795 ("Update
+            riscv-crypto-spec-vector.adoc") of riscv-crypto.
+
+        - const: zvksg
+          description:
+            The standard Zvksg extension for ShangMi algorithm suite with GCM
+            instructions, as ratified in commit 56ed795 ("Update
+            riscv-crypto-spec-vector.adoc") of riscv-crypto.
+
+        - const: zvkt
+          description:
+            The standard Zvkt extension for vector data-independent execution
+            latency, as ratified in commit 56ed795 ("Update
+            riscv-crypto-spec-vector.adoc") of riscv-crypto.
+
 additionalProperties: true
 ...
-- 
2.42.0


