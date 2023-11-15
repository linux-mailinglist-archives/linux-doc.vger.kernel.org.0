Return-Path: <linux-doc+bounces-1818-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3397E3A69
	for <lists+linux-doc@lfdr.de>; Tue,  7 Nov 2023 11:56:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 44DC0B20C2D
	for <lists+linux-doc@lfdr.de>; Tue,  7 Nov 2023 10:56:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70DFD2C85C;
	Tue,  7 Nov 2023 10:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="C8Rq769i"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8462C859
	for <linux-doc@vger.kernel.org>; Tue,  7 Nov 2023 10:56:10 +0000 (UTC)
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E868A126
	for <linux-doc@vger.kernel.org>; Tue,  7 Nov 2023 02:56:06 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-32f8246103cso1245175f8f.1
        for <linux-doc@vger.kernel.org>; Tue, 07 Nov 2023 02:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699354565; x=1699959365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n2QJAM1NTLzbssZcNNT+NMVix19aOXjDu6owokPhRTA=;
        b=C8Rq769iIY634ARSfudO4OYIEk+Q6KHiYBYSzfpMvGzVdQA4kLfUHO3FYx2NHivrBe
         psQvz7dWsCJuWDe1fOa8xtlCy1IQI+zrh/r/J3v7BE5Ph/smaDJbwckgQacZ3laNCOVw
         amk2bvUpO136ruD5mlgsXMk8HTMwBxAc35OOGQHQLHkgfF3TpaxkK0oSDf8a8721vNRX
         arJdD4EVCWDae6SO9Y5gLivcIlipMzmMtfBWLvuE/pMKkdxXlPQ2StCJmKVmlZcPBlug
         c2ECKv2jl5BtzZtvkfwa+SRc/sDX+jRMZXoj2eqmFelzD/wAZDyEk8O9h7cZKLJLZ5T6
         cZYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699354565; x=1699959365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n2QJAM1NTLzbssZcNNT+NMVix19aOXjDu6owokPhRTA=;
        b=QnZh8l0b3B5L4Cj9ukvfZqByRaXfQz2KzYC2+3jPWqrwQCNoaNGlCSESv3BWVDg51M
         spKCPdk/RAVQUkYhTnSMj4O04rD19DQKfiG/ejal3oLCYCniyoCcUBwOSpRoQYbteFak
         0maU/fX9SVKaz+CypWQebPfuXdd4R38WxLY+Jx+/BswJcgTFvUYufXjbWpNAgvm/leWQ
         vqQY9TSd5mdNM0lRQt4SXyEW1Yk6VB0mx0HPz7j1lCVy77X7wW4u4fxbAc4WHZ3nzh+d
         6cg+nnXOzDIWyUKt135FCGRoa+8JV/I+O2s+BQwUX2lGrZKP0qMzBriAPjWbu+HvKCVX
         sZ0g==
X-Gm-Message-State: AOJu0Yyqkaol89+/rxcr96fMmSwjCqwmjbtJgocItXP+ef6OqmPDB9Aj
	LHs07C4eVvQLxWmgTZHR1KI9Gg==
X-Google-Smtp-Source: AGHT+IEvK4516vk3XLxXezj4Z/70DNzO/HNov8XwzTHQc2CtYhog8FQf/viaaqr3v8HfCYx/WX8PeA==
X-Received: by 2002:a05:600c:418a:b0:3fe:d637:7b25 with SMTP id p10-20020a05600c418a00b003fed6377b25mr25010263wmh.0.1699354565264;
        Tue, 07 Nov 2023 02:56:05 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:7db3:bdd9:4cab:2ee3])
        by smtp.gmail.com with ESMTPSA id n30-20020a05600c501e00b00405442edc69sm15396853wmr.14.2023.11.07.02.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 02:56:04 -0800 (PST)
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
Subject: [PATCH v3 04/20] riscv: hwprobe: add support for scalar crypto ISA extensions
Date: Tue,  7 Nov 2023 11:55:40 +0100
Message-ID: <20231107105556.517187-5-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231107105556.517187-1-cleger@rivosinc.com>
References: <20231107105556.517187-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Export the following scalar crypto extensions through hwprobe:

- Zbkb
- Zbkc
- Zbkx
- Zknd
- Zkne
- Zknh
- Zksed
- Zksh
- Zkt

Signed-off-by: Clément Léger <cleger@rivosinc.com>
---
 Documentation/arch/riscv/hwprobe.rst  | 27 +++++++++++++++++++++++++++
 arch/riscv/include/uapi/asm/hwprobe.h |  9 +++++++++
 arch/riscv/kernel/sys_riscv.c         |  9 +++++++++
 3 files changed, 45 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index ecc0307c107e..b020b2d35a99 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -80,6 +80,33 @@ The following keys are defined:
   * :c:macro:`RISCV_HWPROBE_EXT_ZBC` The Zbc extension is supported, as defined
        in version 1.0 of the Bit-Manipulation ISA extensions.
 
+  * :c:macro:`RISCV_HWPROBE_EXT_ZBKB` The Zbkb extension is supported, as
+       defined in version 1.0 of the Scalar Crypto ISA extensions.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZBKC` The Zbkc extension is supported, as
+       defined in version 1.0 of the Scalar Crypto ISA extensions.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZBKX` The Zbkx extension is supported, as
+       defined in version 1.0 of the Scalar Crypto ISA extensions.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZKND` The Zknd extension is supported, as
+       defined in version 1.0 of the Scalar Crypto ISA extensions.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZKNE` The Zkne extension is supported, as
+       defined in version 1.0 of the Scalar Crypto ISA extensions.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZKNH` The Zknh extension is supported, as
+       defined in version 1.0 of the Scalar Crypto ISA extensions.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZKSED` The Zksed extension is supported, as
+       defined in version 1.0 of the Scalar Crypto ISA extensions.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZKSH` The Zksh extension is supported, as
+       defined in version 1.0 of the Scalar Crypto ISA extensions.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZKT` The Zkt extension is supported, as defined
+       in version 1.0 of the Scalar Crypto ISA extensions.
+
 * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains performance
   information about the selected set of processors.
 
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index dcef5c33c009..10bf543de3ce 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -30,6 +30,15 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZBB		(1 << 4)
 #define		RISCV_HWPROBE_EXT_ZBS		(1 << 5)
 #define		RISCV_HWPROBE_EXT_ZBC		(1 << 6)
+#define		RISCV_HWPROBE_EXT_ZBKB		(1 << 7)
+#define		RISCV_HWPROBE_EXT_ZBKC		(1 << 8)
+#define		RISCV_HWPROBE_EXT_ZBKX		(1 << 9)
+#define		RISCV_HWPROBE_EXT_ZKND		(1 << 10)
+#define		RISCV_HWPROBE_EXT_ZKNE		(1 << 11)
+#define		RISCV_HWPROBE_EXT_ZKNH		(1 << 12)
+#define		RISCV_HWPROBE_EXT_ZKSED		(1 << 13)
+#define		RISCV_HWPROBE_EXT_ZKSH		(1 << 14)
+#define		RISCV_HWPROBE_EXT_ZKT		(1 << 15)
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
 #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
index 382cd71129c6..bb44592707a5 100644
--- a/arch/riscv/kernel/sys_riscv.c
+++ b/arch/riscv/kernel/sys_riscv.c
@@ -163,6 +163,15 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 		CHECK_ISA_EXT(ZBB);
 		CHECK_ISA_EXT(ZBS);
 		CHECK_ISA_EXT(ZBC);
+		CHECK_ISA_EXT(ZBKB);
+		CHECK_ISA_EXT(ZBKC);
+		CHECK_ISA_EXT(ZBKX);
+		CHECK_ISA_EXT(ZKND);
+		CHECK_ISA_EXT(ZKNE);
+		CHECK_ISA_EXT(ZKNH);
+		CHECK_ISA_EXT(ZKSED);
+		CHECK_ISA_EXT(ZKSH);
+		CHECK_ISA_EXT(ZKT);
 #undef CHECK_ISA_EXT
 	}
 
-- 
2.42.0


