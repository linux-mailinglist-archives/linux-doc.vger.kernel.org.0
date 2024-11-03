Return-Path: <linux-doc+bounces-29723-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DF27D9BA613
	for <lists+linux-doc@lfdr.de>; Sun,  3 Nov 2024 15:57:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E6B8281C03
	for <lists+linux-doc@lfdr.de>; Sun,  3 Nov 2024 14:57:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CCACBE6C;
	Sun,  3 Nov 2024 14:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="L3Z0HiY2"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E665B70820
	for <linux-doc@vger.kernel.org>; Sun,  3 Nov 2024 14:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730645826; cv=none; b=IsGfbYEcpTFrCb5Vd8HUJTWSwu28EggCb7ciXCm/7nbPHlXcTHCFzyVZoA6HS0+56zFi7GEMzkCcxC8ErBIT558gGUHDQAuKHFNjwayfGwDKW+QL/nvyScdQIwjYMxUJC89RioO6fWNW8GvEplu29y0ruW4YtNSTi26bUcH/yQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730645826; c=relaxed/simple;
	bh=87PCTNWJatXkOfxYdKhtjQ3mAAxm4VRDVMIU9aR65aw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=U2dvCrig1oSGmPnBOGPD8s7BgvmyS3Kjx+zt2RoSJWiGGJJb80JlEukd0m3V/XfqHlRYllvFLxNPcQFWkMqRY36Xm9zNLK1c0iskvEnoJu/mqen5j2/bNoEWiJ4yBcnXZUOQX30EmepfMgIzVywyF6fe5eYy73uJq3XXK9xxw5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=L3Z0HiY2; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-37d447de11dso2752388f8f.1
        for <linux-doc@vger.kernel.org>; Sun, 03 Nov 2024 06:57:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1730645822; x=1731250622; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LcjpaetCkzwKl6qLE/ePzZTB5CzyEYuJ8vIVpAvXySA=;
        b=L3Z0HiY2sXHGtPV6rqYourdnsce2lOJlNFPe4X9SBn8TVni0f2AJbR3F5hekkSo0L3
         IngJeCjaKcBNpxZeMaifcIhAfFjROBZYqrj6PQkntp581sN4MWyTCDZqukooxkCdHgAK
         Bk6PiLOCtnGkwQbNLGcbvfPNhZRfdZxWVOKVxeSGq1tQV//qO2luIxEP4bjAxGRFMHiL
         QiOg93aLB/3bSKAZY7j+9dCtCJbtwwsURIoW2sC6wtqqEWlDqMnngk2u9WgQ7pVHHFmC
         WDFCbfsXyLE1veWxQSvdlcPaIn1lKpgacYIgG2eIETwUdo9/82L95KhKypZIOTCLaPh2
         QtYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730645822; x=1731250622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LcjpaetCkzwKl6qLE/ePzZTB5CzyEYuJ8vIVpAvXySA=;
        b=fGgWu3JjDFjniGWYuWbzLKNY7TpjV57w8khmwpIL8qUYgL2KNrkEAiLMzDd31z/62E
         LHAtB+8CwHiQ55Ze5yBs3zn20G52v5wN7T1ce5j3KlaFsr0Wcl1C0ltq3JiD6FV0wprH
         TaqYYj97bmrOm3lfkM/9SblhX6PJWn1Vrnt6h7V92SUhxfjycXc5gRGzvdkkk5l4G7dX
         li4P3dQKmRZsVdVjyjc8vie/IRzesEQTiCBEkFDZgOhKInaQg0wyw31dCWlpMfK/JuHe
         0fQhiBiBhM4VL/rDuhxpf9Mas1vtU13C240DU8Vf8ExwYyOxhhxSEQCpS6VSGiHB5h1H
         /6uQ==
X-Forwarded-Encrypted: i=1; AJvYcCWz4sbv1nOdBuuNZhBBgXWk1FLAasZ2RPJnwmB3s1GNh2iAH7vhrPllQxSBeR3qjILGu6ah2k9+VCY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5fx6i5VSCOb694KYi34lnlrDkWQ6g6D0rIJ1SPFt7dnAW/VqC
	oiUpP4X00bXwRrckd8c0H/e0hhuSqigzJezxm5D2PMTapn8ou/qJh2geolSVHFVSvrwbi3KfFHa
	E
X-Google-Smtp-Source: AGHT+IEk9gKHRdbGlFKX3OCkRNc0X43TINOjb8HRMwojR0fr3EGR3rRYNjyJ35dWqeTb53PfklFgKw==
X-Received: by 2002:a05:6000:2805:b0:37d:5173:7a54 with SMTP id ffacd0b85a97d-381bea27660mr7207035f8f.52.1730645822142;
        Sun, 03 Nov 2024 06:57:02 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (lfbn-lyo-1-472-36.w2-7.abo.wanadoo.fr. [2.7.62.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c1168afcsm10825859f8f.91.2024.11.03.06.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2024 06:57:01 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Andrea Parri <parri.andrea@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v6 05/13] riscv: Implement cmpxchg8/16() using Zabha
Date: Sun,  3 Nov 2024 15:51:45 +0100
Message-Id: <20241103145153.105097-6-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241103145153.105097-1-alexghiti@rivosinc.com>
References: <20241103145153.105097-1-alexghiti@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds runtime support for Zabha in cmpxchg8/16() operations.

Note that in the absence of Zacas support in the toolchain, CAS
instructions from Zabha won't be used.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/Kconfig               | 18 ++++++++
 arch/riscv/Makefile              |  3 ++
 arch/riscv/include/asm/cmpxchg.h | 78 ++++++++++++++++++++------------
 arch/riscv/include/asm/hwcap.h   |  1 +
 arch/riscv/kernel/cpufeature.c   |  1 +
 5 files changed, 72 insertions(+), 29 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 3542efe3088b..668be90a42e4 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -632,6 +632,24 @@ config RISCV_ISA_ZAWRS
 	  use of these instructions in the kernel when the Zawrs extension is
 	  detected at boot.
 
+config TOOLCHAIN_HAS_ZABHA
+	bool
+	default y
+	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zabha)
+	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zabha)
+	depends on AS_HAS_OPTION_ARCH
+
+config RISCV_ISA_ZABHA
+	bool "Zabha extension support for atomic byte/halfword operations"
+	depends on TOOLCHAIN_HAS_ZABHA
+	depends on RISCV_ALTERNATIVE
+	default y
+	help
+	  Enable the use of the Zabha ISA-extension to implement kernel
+	  byte/halfword atomic memory operations when it is detected at boot.
+
+	  If you don't know what to do here, say Y.
+
 config TOOLCHAIN_HAS_ZACAS
 	bool
 	default y
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 3700a1574413..9fe1ee740dda 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -85,6 +85,9 @@ endif
 # Check if the toolchain supports Zacas
 riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZACAS) := $(riscv-march-y)_zacas
 
+# Check if the toolchain supports Zabha
+riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZABHA) := $(riscv-march-y)_zabha
+
 # Remove F,D,V from isa string for all. Keep extensions between "fd" and "v" by
 # matching non-v and non-multi-letter extensions out with the filter ([^v_]*)
 KBUILD_CFLAGS += -march=$(shell echo $(riscv-march-y) | sed -E 's/(rv32ima|rv64ima)fd([^v_]*)v?/\1\2/')
diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index 39c1daf39f6a..1f4cd12e4664 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -108,34 +108,49 @@
  * indicated by comparing RETURN with OLD.
  */
 
-#define __arch_cmpxchg_masked(sc_sfx, prepend, append, r, p, o, n)	\
-({									\
-	u32 *__ptr32b = (u32 *)((ulong)(p) & ~0x3);			\
-	ulong __s = ((ulong)(p) & (0x4 - sizeof(*p))) * BITS_PER_BYTE;	\
-	ulong __mask = GENMASK(((sizeof(*p)) * BITS_PER_BYTE) - 1, 0)	\
-			<< __s;						\
-	ulong __newx = (ulong)(n) << __s;				\
-	ulong __oldx = (ulong)(o) << __s;				\
-	ulong __retx;							\
-	ulong __rc;							\
-									\
-	__asm__ __volatile__ (						\
-		prepend							\
-		"0:	lr.w %0, %2\n"					\
-		"	and  %1, %0, %z5\n"				\
-		"	bne  %1, %z3, 1f\n"				\
-		"	and  %1, %0, %z6\n"				\
-		"	or   %1, %1, %z4\n"				\
-		"	sc.w" sc_sfx " %1, %1, %2\n"			\
-		"	bnez %1, 0b\n"					\
-		append							\
-		"1:\n"							\
-		: "=&r" (__retx), "=&r" (__rc), "+A" (*(__ptr32b))	\
-		: "rJ" ((long)__oldx), "rJ" (__newx),			\
-		  "rJ" (__mask), "rJ" (~__mask)				\
-		: "memory");						\
-									\
-	r = (__typeof__(*(p)))((__retx & __mask) >> __s);		\
+#define __arch_cmpxchg_masked(sc_sfx, cas_sfx, prepend, append, r, p, o, n)	\
+({										\
+	if (IS_ENABLED(CONFIG_RISCV_ISA_ZABHA) &&				\
+	    IS_ENABLED(CONFIG_RISCV_ISA_ZACAS) &&				\
+	    riscv_has_extension_unlikely(RISCV_ISA_EXT_ZABHA) &&		\
+	    riscv_has_extension_unlikely(RISCV_ISA_EXT_ZACAS)) {		\
+		r = o;								\
+										\
+		__asm__ __volatile__ (						\
+			prepend							\
+			"	amocas" cas_sfx " %0, %z2, %1\n"		\
+			append							\
+			: "+&r" (r), "+A" (*(p))				\
+			: "rJ" (n)						\
+			: "memory");						\
+	} else {								\
+		u32 *__ptr32b = (u32 *)((ulong)(p) & ~0x3);			\
+		ulong __s = ((ulong)(p) & (0x4 - sizeof(*p))) * BITS_PER_BYTE;	\
+		ulong __mask = GENMASK(((sizeof(*p)) * BITS_PER_BYTE) - 1, 0)	\
+			       << __s;						\
+		ulong __newx = (ulong)(n) << __s;				\
+		ulong __oldx = (ulong)(o) << __s;				\
+		ulong __retx;							\
+		ulong __rc;							\
+										\
+		__asm__ __volatile__ (						\
+			prepend							\
+			"0:	lr.w %0, %2\n"					\
+			"	and  %1, %0, %z5\n"				\
+			"	bne  %1, %z3, 1f\n"				\
+			"	and  %1, %0, %z6\n"				\
+			"	or   %1, %1, %z4\n"				\
+			"	sc.w" sc_sfx " %1, %1, %2\n"			\
+			"	bnez %1, 0b\n"					\
+			append							\
+			"1:\n"							\
+			: "=&r" (__retx), "=&r" (__rc), "+A" (*(__ptr32b))	\
+			: "rJ" ((long)__oldx), "rJ" (__newx),			\
+			  "rJ" (__mask), "rJ" (~__mask)				\
+			: "memory");						\
+										\
+		r = (__typeof__(*(p)))((__retx & __mask) >> __s);		\
+	}									\
 })
 
 #define __arch_cmpxchg(lr_sfx, sc_cas_sfx, prepend, append, r, p, co, o, n)	\
@@ -177,8 +192,13 @@
 									\
 	switch (sizeof(*__ptr)) {					\
 	case 1:								\
+		__arch_cmpxchg_masked(sc_cas_sfx, ".b" sc_cas_sfx,	\
+					prepend, append,		\
+					__ret, __ptr, __old, __new);    \
+		break;							\
 	case 2:								\
-		__arch_cmpxchg_masked(sc_cas_sfx, prepend, append,	\
+		__arch_cmpxchg_masked(sc_cas_sfx, ".h" sc_cas_sfx,	\
+					prepend, append,		\
 					__ret, __ptr, __old, __new);	\
 		break;							\
 	case 4:								\
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 46d9de54179e..74bcb0e2bd1f 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -93,6 +93,7 @@
 #define RISCV_ISA_EXT_ZCMOP		84
 #define RISCV_ISA_EXT_ZAWRS		85
 #define RISCV_ISA_EXT_SVVPTC		86
+#define RISCV_ISA_EXT_ZABHA		87
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 3a8eeaa9310c..5e743d8d34f5 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -322,6 +322,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
 	__RISCV_ISA_EXT_DATA(zihpm, RISCV_ISA_EXT_ZIHPM),
 	__RISCV_ISA_EXT_DATA(zimop, RISCV_ISA_EXT_ZIMOP),
+	__RISCV_ISA_EXT_DATA(zabha, RISCV_ISA_EXT_ZABHA),
 	__RISCV_ISA_EXT_DATA(zacas, RISCV_ISA_EXT_ZACAS),
 	__RISCV_ISA_EXT_DATA(zawrs, RISCV_ISA_EXT_ZAWRS),
 	__RISCV_ISA_EXT_DATA(zfa, RISCV_ISA_EXT_ZFA),
-- 
2.39.2


