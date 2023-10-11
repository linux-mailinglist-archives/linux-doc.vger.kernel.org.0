Return-Path: <linux-doc+bounces-63-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C257C5198
	for <lists+linux-doc@lfdr.de>; Wed, 11 Oct 2023 13:19:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A46271C20F1A
	for <lists+linux-doc@lfdr.de>; Wed, 11 Oct 2023 11:19:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45BF71DFEA;
	Wed, 11 Oct 2023 11:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="WBq8ggfx"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9934B1E51A
	for <linux-doc@vger.kernel.org>; Wed, 11 Oct 2023 11:19:22 +0000 (UTC)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DED15A7
	for <linux-doc@vger.kernel.org>; Wed, 11 Oct 2023 04:19:18 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-40651b22977so11504615e9.1
        for <linux-doc@vger.kernel.org>; Wed, 11 Oct 2023 04:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697023157; x=1697627957; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eAZEvLYxGtlCREP0d8aetAY70GgHX4OI1AI4HHQY6l8=;
        b=WBq8ggfxp30QHg4C6ifpBEl57tD72Bbc0k0P/8EbmqyytjjXiuuQJ4oUl9Zf+J+ueH
         NHNRFPZiiA+jhHBX79pe2ydrTgNvqPgzFNQ4tvzLF1zYZnG0k2kKOobwYd+nAgdVNuFc
         BTEGHMonsr3Vl4j2mFbuQeTtqUJ7r6dDuWO/8seofD/vhCe6lua7Ht40fiDvY4BcF63W
         95WRcOjFZ3+rthO9leIfBrihlEc74reo7nv9IMgv1LqgmEpObryTkdNumbkEiFtSB/h8
         Oa/RMCvc76z76kSCP7HRW5Kywfy4HctKVfI3gRayvQdxbQcwahu0lyvBfI5fBEKWCFvd
         jxJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697023157; x=1697627957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eAZEvLYxGtlCREP0d8aetAY70GgHX4OI1AI4HHQY6l8=;
        b=IGAH7XM0UX/1H2hA0qpczMi0NZMVyw26lm9YeZDBTvMhRg5LF8PX+s3uxjpHdvStrT
         TaeKE915YPoPEdYzCQ4GLEIPQEiNL540sEJqI6+EaCsdmO8UrOeDppakvGJbma3d1tsS
         g3iQa2EcCfzwfZRvYY9Q8mplky41++F0ljDEHrt7SqQxOXXb7Nc2wVPxgtavPIBhZbrq
         LHTHnm7v5YkekG0dg/oCXNrw7wYvD+YG43x4k7EadTAxUHEXm3wZfljWkEuaqaOJtd/v
         HbK5a75mBt5O1X7K4sG64uvsfCGaBihWjc9rhPJowzJPkpn1AbXwQgTZKP3WcL9Y3Lss
         7HEg==
X-Gm-Message-State: AOJu0Yx7bSNZ1zrZBJs5TyGpAMwdOGdhHGSZZq7BILiETTSPmPwclecq
	uR2r7IzQlyqLeBYL7Tyhp9WPhd0unEpo2pNQiJuLtA==
X-Google-Smtp-Source: AGHT+IFeO3LKpkO7mA71iasUh75leFbZgOZf1t8PIqvet3lbVPCQJNAGclYSj5IFTDkC8itV0KwVdA==
X-Received: by 2002:a05:600c:1c0f:b0:405:4721:800 with SMTP id j15-20020a05600c1c0f00b0040547210800mr18701454wms.1.1697023156575;
        Wed, 11 Oct 2023 04:19:16 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:9134:b302:d8b:a200])
        by smtp.gmail.com with ESMTPSA id a4-20020a05600c224400b003fe2b081661sm18945715wmm.30.2023.10.11.04.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 04:19:16 -0700 (PDT)
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
	Conor Dooley <conor@kernel.org>
Subject: [PATCH v1 03/13] riscv: hwprobe: export Zv* ISA extensions
Date: Wed, 11 Oct 2023 13:14:28 +0200
Message-ID: <20231011111438.909552-4-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231011111438.909552-1-cleger@rivosinc.com>
References: <20231011111438.909552-1-cleger@rivosinc.com>
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

Export Zv* ISA extensions that were added in "RISC-V Cryptography
Extensions Volume II" specification[1] through hwprobe. This adds
support for the following instructions:

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

[1] https://drive.google.com/file/d/1gb9OLH-DhbCgWp7VwpPOVrrY6f3oSJLL/view

Signed-off-by: Clément Léger <cleger@rivosinc.com>
---
 Documentation/riscv/hwprobe.rst       | 48 +++++++++++++++++++++++++++
 arch/riscv/include/uapi/asm/hwprobe.h | 16 +++++++++
 arch/riscv/kernel/sys_riscv.c         | 19 +++++++++++
 3 files changed, 83 insertions(+)

diff --git a/Documentation/riscv/hwprobe.rst b/Documentation/riscv/hwprobe.rst
index a52996b22f75..edfed33669ea 100644
--- a/Documentation/riscv/hwprobe.rst
+++ b/Documentation/riscv/hwprobe.rst
@@ -77,6 +77,54 @@ The following keys are defined:
   * :c:macro:`RISCV_HWPROBE_EXT_ZBS`: The Zbs extension is supported, as defined
        in version 1.0 of the Bit-Manipulation ISA extensions.
 
+  * :c:macro:`RISCV_HWPROBE_EXT_ZVBB`: The Zvbb extension is supported as
+       defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZVBC`: The Zvbc extension is supported as
+       defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZVKB`: The Zvkb extension is supported as
+       defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZVKG`: The Zvkg extension is supported as
+       defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZVKN`: The Zvkn extension is supported as
+       defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZVKNC`: The Zvknc extension is supported as
+       defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZVKNED`: The Zvkned extension is supported as
+       defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZVKNG`: The Zvkng extension is supported as
+       defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZVKNHA`: The Zvknha extension is supported as
+       defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZVKNHB`: The Zvknhb extension is supported as
+       defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZVKS`: The Zvks extension is supported as
+       defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZVKSC`: The Zvksc extension is supported as
+       defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZVKSED`: The Zvksed extension is supported as
+       defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZVKSH`: The Zvksh extension is supported as
+       defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZVKSG`: The Zvksg extension is supported as
+       defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZVKT`: The Zvkt extension is supported as
+       defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
+
 * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains performance
   information about the selected set of processors.
 
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 006bfb48343d..d868eb431cd6 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -29,6 +29,22 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZBA		(1 << 3)
 #define		RISCV_HWPROBE_EXT_ZBB		(1 << 4)
 #define		RISCV_HWPROBE_EXT_ZBS		(1 << 5)
+#define		RISCV_HWPROBE_EXT_ZVBB		(1 << 6)
+#define		RISCV_HWPROBE_EXT_ZVBC		(1 << 7)
+#define		RISCV_HWPROBE_EXT_ZVKB		(1 << 8)
+#define		RISCV_HWPROBE_EXT_ZVKG		(1 << 9)
+#define		RISCV_HWPROBE_EXT_ZVKN		(1 << 10)
+#define		RISCV_HWPROBE_EXT_ZVKNC		(1 << 11)
+#define		RISCV_HWPROBE_EXT_ZVKNED	(1 << 12)
+#define		RISCV_HWPROBE_EXT_ZVKNG		(1 << 13)
+#define		RISCV_HWPROBE_EXT_ZVKNHA	(1 << 14)
+#define		RISCV_HWPROBE_EXT_ZVKNHB	(1 << 15)
+#define		RISCV_HWPROBE_EXT_ZVKS		(1 << 16)
+#define		RISCV_HWPROBE_EXT_ZVKSC		(1 << 17)
+#define		RISCV_HWPROBE_EXT_ZVKSED	(1 << 18)
+#define		RISCV_HWPROBE_EXT_ZVKSH		(1 << 19)
+#define		RISCV_HWPROBE_EXT_ZVKSG		(1 << 20)
+#define		RISCV_HWPROBE_EXT_ZVKT		(1 << 21)
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
 #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
index 5ce593ce07a4..4f5e51c192d5 100644
--- a/arch/riscv/kernel/sys_riscv.c
+++ b/arch/riscv/kernel/sys_riscv.c
@@ -156,6 +156,25 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 		CHECK_ISA_EXT(ZBA);
 		CHECK_ISA_EXT(ZBB);
 		CHECK_ISA_EXT(ZBS);
+
+		if (has_vector()) {
+			CHECK_ISA_EXT(ZVBB);
+			CHECK_ISA_EXT(ZVBC);
+			CHECK_ISA_EXT(ZVKB);
+			CHECK_ISA_EXT(ZVKG);
+			CHECK_ISA_EXT(ZVKN);
+			CHECK_ISA_EXT(ZVKNC);
+			CHECK_ISA_EXT(ZVKNED);
+			CHECK_ISA_EXT(ZVKNG);
+			CHECK_ISA_EXT(ZVKNHA);
+			CHECK_ISA_EXT(ZVKNHB);
+			CHECK_ISA_EXT(ZVKS);
+			CHECK_ISA_EXT(ZVKSC);
+			CHECK_ISA_EXT(ZVKSED);
+			CHECK_ISA_EXT(ZVKSH);
+			CHECK_ISA_EXT(ZVKSG);
+			CHECK_ISA_EXT(ZVKT);
+		}
 #undef CHECK_ISA_EXT
 	}
 
-- 
2.42.0


