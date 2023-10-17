Return-Path: <linux-doc+bounces-422-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FFE7CC436
	for <lists+linux-doc@lfdr.de>; Tue, 17 Oct 2023 15:15:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1F7C8B21191
	for <lists+linux-doc@lfdr.de>; Tue, 17 Oct 2023 13:15:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D6C043699;
	Tue, 17 Oct 2023 13:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="3OAPtVaP"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93AD742BFC
	for <linux-doc@vger.kernel.org>; Tue, 17 Oct 2023 13:15:35 +0000 (UTC)
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED396F2
	for <linux-doc@vger.kernel.org>; Tue, 17 Oct 2023 06:15:33 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2c519eab81fso3998041fa.1
        for <linux-doc@vger.kernel.org>; Tue, 17 Oct 2023 06:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697548532; x=1698153332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kAwzEIcm8h808xpQc++6VSntDVwJ3qhe3e6hBMESJ6w=;
        b=3OAPtVaPDwxeYj2/Vaywhdl5nKRxznfJRIMCbal1tcUXD3yvxyYlj/8HrBcuwQuPMs
         K5/kVwRimwnr2xeEAeaz0d4P1p6FfwQFxEB1CzyytWhk63vAJtT/PErQPEXeLNV3c7tk
         RR604JV1bZ3AfuG/nqlLEgxqrks6ZqnKmoL4h4BFWiLc2vkL4bFBZUXR6CZ834OhTFrh
         OQt6FsHTiPujAxsxgDv1SiPHth60PUP0QKRVjUi2RLL6rkIJDHtqBPX4Yd9IXff2slaI
         OlUu37Bpkayp0cu33WtEt6DSK0aydC+gH3lcKaeGnWRCb8Aen07wIMQVMfAeUFQcldcz
         RakA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697548532; x=1698153332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kAwzEIcm8h808xpQc++6VSntDVwJ3qhe3e6hBMESJ6w=;
        b=R2Z/LAzTBVTYi9B2CrmLVSCPhLiz+ARlvauMfOuOz4ljYZHWgdT4RGPFvOyXNz1rlZ
         z37wCZ6Ga2pktqK2FBLbzE6iPFX+f8mh5BDzdQJ4TrPIoc4ROgKxNhzp/UwI1yFHksy2
         5s7Q9TYjxX9rLksYHCvT8NUe24ha+dyTN4wMACr/PYrzCaPyq5nQqOmidR6/0l0bgQTa
         YheTNCVWpyILtaONgFMu8cGojEacd6AqlyD7OOYeBiegRhPx98N7qeBJWwNRgP7+EWz2
         rbE8HKVq/qgf88AZyo/qlv1fTsWb6Xn0edrKOmVox1xJv716uHeC6NzvMFvu8pRdpj6+
         77OA==
X-Gm-Message-State: AOJu0YzWoVxbienKQv51mqD2jY7Kjn2J9pzT/oHoAnZNtq33kkka2A9H
	MfeL3uFp1+HnwTtuihqBNyjaBQ==
X-Google-Smtp-Source: AGHT+IGxxGT0VowoXWq2hMZVGHzajiExaL8hl8rlDGCoUwUk37mS3jSgd+MAJBx5cI6dDHr6c+N8Sg==
X-Received: by 2002:a2e:b5ad:0:b0:2c5:36e:31bf with SMTP id f13-20020a2eb5ad000000b002c5036e31bfmr1328347ljn.5.1697548531317;
        Tue, 17 Oct 2023 06:15:31 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:96:820c:ecf7:a817])
        by smtp.gmail.com with ESMTPSA id fj7-20020a05600c0c8700b0040772138bb7sm9873393wmb.2.2023.10.17.06.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 06:15:30 -0700 (PDT)
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
	Samuel Ortiz <sameo@rivosinc.com>
Subject: [PATCH v2 05/19] riscv: add ISA extension parsing for vector crypto extensions
Date: Tue, 17 Oct 2023 15:14:42 +0200
Message-ID: <20231017131456.2053396-6-cleger@rivosinc.com>
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
	DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Add parsing of some Zv* vector crypto ISA extensions that are mentioned
in "RISC-V Cryptography Extensions Volume II" [1]. These ISA extensions
are the following:

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
---
 arch/riscv/include/asm/hwcap.h | 10 ++++++
 arch/riscv/kernel/cpufeature.c | 56 ++++++++++++++++++++++++++++++++++
 2 files changed, 66 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index ab80d822c847..a2fac23b0cc0 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -69,6 +69,16 @@
 #define RISCV_ISA_EXT_ZKSED		51
 #define RISCV_ISA_EXT_ZKSH		52
 #define RISCV_ISA_EXT_ZKT		53
+#define RISCV_ISA_EXT_ZVBB		54
+#define RISCV_ISA_EXT_ZVBC		55
+#define RISCV_ISA_EXT_ZVKB		56
+#define RISCV_ISA_EXT_ZVKG		57
+#define RISCV_ISA_EXT_ZVKNED		58
+#define RISCV_ISA_EXT_ZVKNHA		59
+#define RISCV_ISA_EXT_ZVKNHB		60
+#define RISCV_ISA_EXT_ZVKSED		61
+#define RISCV_ISA_EXT_ZVKSH		62
+#define RISCV_ISA_EXT_ZVKT		63
 
 #define RISCV_ISA_EXT_MAX		64
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index d3682fdfd9f1..8cf0b8b442ae 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -144,6 +144,46 @@ static const unsigned int riscv_zks_bundled_exts[] = {
 	RISCV_ISA_EXT_ZKSH
 };
 
+#define RISCV_ISA_EXT_ZVKN	\
+	RISCV_ISA_EXT_ZVKNED,	\
+	RISCV_ISA_EXT_ZVKNHB,	\
+	RISCV_ISA_EXT_ZVKB,	\
+	RISCV_ISA_EXT_ZVKT
+
+static const unsigned int riscv_zvkn_bundled_exts[] = {
+	RISCV_ISA_EXT_ZVKN
+};
+
+static const unsigned int riscv_zvknc_bundled_exts[] = {
+	RISCV_ISA_EXT_ZVKN,
+	RISCV_ISA_EXT_ZVBC,
+};
+
+static const unsigned int riscv_zvkng_bundled_exts[] = {
+	RISCV_ISA_EXT_ZVKN,
+	RISCV_ISA_EXT_ZVKG,
+};
+
+#define RISCV_ISA_EXT_ZVKS	\
+	RISCV_ISA_EXT_ZVKSED,	\
+	RISCV_ISA_EXT_ZVKSH,	\
+	RISCV_ISA_EXT_ZVKB,	\
+	RISCV_ISA_EXT_ZVKT
+
+static const unsigned int riscv_zvks_bundled_exts[] = {
+	RISCV_ISA_EXT_ZVKS
+};
+
+static const unsigned int riscv_zvksc_bundled_exts[] = {
+	RISCV_ISA_EXT_ZVKS,
+	RISCV_ISA_EXT_ZVBC,
+};
+
+static const unsigned int riscv_zvksg_bundled_exts[] = {
+	RISCV_ISA_EXT_ZVKS,
+	RISCV_ISA_EXT_ZVKG,
+};
+
 /*
  * The canonical order of ISA extension names in the ISA string is defined in
  * chapter 27 of the unprivileged specification.
@@ -221,6 +261,22 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(zkt, RISCV_ISA_EXT_ZKT),
 	__RISCV_ISA_EXT_DATA(zksed, RISCV_ISA_EXT_ZKSED),
 	__RISCV_ISA_EXT_DATA(zksh, RISCV_ISA_EXT_ZKSH),
+	__RISCV_ISA_EXT_DATA(zvbb, RISCV_ISA_EXT_ZVBB),
+	__RISCV_ISA_EXT_DATA(zvbc, RISCV_ISA_EXT_ZVBC),
+	__RISCV_ISA_EXT_DATA(zvkb, RISCV_ISA_EXT_ZVKB),
+	__RISCV_ISA_EXT_DATA(zvkg, RISCV_ISA_EXT_ZVKG),
+	__RISCV_ISA_EXT_BUNDLE(zvkn, riscv_zvkn_bundled_exts),
+	__RISCV_ISA_EXT_BUNDLE(zvknc, riscv_zvknc_bundled_exts),
+	__RISCV_ISA_EXT_DATA(zvkned, RISCV_ISA_EXT_ZVKNED),
+	__RISCV_ISA_EXT_BUNDLE(zvkng, riscv_zvkng_bundled_exts),
+	__RISCV_ISA_EXT_DATA(zvknha, RISCV_ISA_EXT_ZVKNHA),
+	__RISCV_ISA_EXT_DATA(zvknhb, RISCV_ISA_EXT_ZVKNHB),
+	__RISCV_ISA_EXT_BUNDLE(zvks, riscv_zvks_bundled_exts),
+	__RISCV_ISA_EXT_BUNDLE(zvksc, riscv_zvksc_bundled_exts),
+	__RISCV_ISA_EXT_DATA(zvksed, RISCV_ISA_EXT_ZVKSED),
+	__RISCV_ISA_EXT_DATA(zvksh, RISCV_ISA_EXT_ZVKSH),
+	__RISCV_ISA_EXT_BUNDLE(zvksg, riscv_zvksg_bundled_exts),
+	__RISCV_ISA_EXT_DATA(zvkt, RISCV_ISA_EXT_ZVKT),
 	__RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
 	__RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
 	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
-- 
2.42.0


