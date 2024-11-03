Return-Path: <linux-doc+bounces-29721-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE259BA60D
	for <lists+linux-doc@lfdr.de>; Sun,  3 Nov 2024 15:55:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 816C62810C0
	for <lists+linux-doc@lfdr.de>; Sun,  3 Nov 2024 14:55:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E0A6180021;
	Sun,  3 Nov 2024 14:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="ptuzgnkT"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87CFFBE6C
	for <linux-doc@vger.kernel.org>; Sun,  3 Nov 2024 14:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730645704; cv=none; b=dUrZTBjyy2PjciebRi9KQDuKzvvfxinXWzW6cUzYqouf6JLjQhA6D1ADuFIL7Ln5e4KzxC3siy717/ul01Q7gxwcxyLLjOln+gAhTKiJdPTxCK5NRyXIkx/rz6Gltk9Lv3Wu9qN2aeDnk4kpwQZrUSrVOU//WsxkRhG1CWtqxoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730645704; c=relaxed/simple;
	bh=t/Q7smNje9JU7iFN5RPMXqy/JACg1F/f1IIsKrIvTkw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=klwR+N7yrEoi/Es1DSThkXL63oIijZHOtietH6G9NLDpAHHhDBxZN7+n600qA+tVb4U8w/jn91h1+GzBH/YGZNVnlC/VH5UFCT4FOI88zGT6i5dMLZp1NaSl1MEF8S8wNDlzOTbOST3fLHkBL5Y6XW088qIFEWteclu5shLxtJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=ptuzgnkT; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-37d6a2aa748so1882539f8f.1
        for <linux-doc@vger.kernel.org>; Sun, 03 Nov 2024 06:55:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1730645700; x=1731250500; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j2RpMtAPESbZvfWQgyCWL6emNu2SZ3U7eDtJoRXd/Zk=;
        b=ptuzgnkTeLtzI7466k6koYfupE2e5Ft7sLDqL9Zd57GMdT6Ku31E8Q5ThO3A7iYsVe
         kCEAz7b9axVgGoPZdy9NYXv588ae1pcNOBDkcrILQvDdBOJllkYqgKpI6g3s5zsN6REM
         vdCluoAyqunccqpe3bZlNcCp4SOtMzKrG0xbOCBpnO49AYxjvdXLT+q6DL2CTcLJxF4J
         moRGqt7J8xpPf1iv89O9x1GpkUMdBOI1eHmoVEHttZYTo4Su30fvrB5f5PCtE5QOEJGl
         2a6C6v95rdROFjWW+9O54vcANImCY1Jhcj/uS3DB9xSAmCkBB0cRv8gO0KG/EaaTH84J
         1Jzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730645700; x=1731250500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j2RpMtAPESbZvfWQgyCWL6emNu2SZ3U7eDtJoRXd/Zk=;
        b=aXZeCG4htfxjdwaz4GJSmd4+62iHPCyQExaijehwzsXHwLnopUjPGKRWArqXBM5eYR
         Uc98GvjIrQ05iFebOkzrdj4C/EGI7VdVqcWO6xYHOTZsq2A+1jhjPcdR87a9CpIO1L9q
         BI/DqiVBWr/V9l5aDDJ8A9ctpzpRr3VnYE+p8iI6Edv/rRcE0b1NuZYdyzrrmVDNhMdj
         46GeLUJvBgaMlGVyWwPUGh9V2giaU5MDhmxQ4ZrENDrJ3cEBWuZu/CjkttQf/dDe+jOP
         3Olx3203qzmWDBNCv8sdRa4T3bFCh/Q8Tp+ThiRIrHzfILjH9pxUG8L9yzgBBsjE45zn
         sOew==
X-Forwarded-Encrypted: i=1; AJvYcCX+A6U2julBajNstqgqcdoqNFKZziC42lEnldk2znuiptfv4IBRoTQYxZtuhFEOL9V2oW7AVqwL5JA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaoHeTckFtGiJ1DiLaLIHwzPgP91Y8VVGDBXP40WoH5b7cC1iO
	G4urSoWMZhmRiSHIVKnY2KvfgBAbmxQTtxA89c7U98cTy1TnFbVSexU+6q+T7A8=
X-Google-Smtp-Source: AGHT+IEoz3UUuA4gFnje/hBBB1Z82zuI7puFcHPYtiCXU5cLSTtZW75S2vlz7SH9FLr/9gF8I3PV6g==
X-Received: by 2002:a5d:584b:0:b0:37d:4a2d:6948 with SMTP id ffacd0b85a97d-381c7a5f380mr7629990f8f.33.1730645699563;
        Sun, 03 Nov 2024 06:54:59 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (lfbn-lyo-1-472-36.w2-7.abo.wanadoo.fr. [2.7.62.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10d4342sm10785612f8f.32.2024.11.03.06.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2024 06:54:59 -0800 (PST)
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
Subject: [PATCH v6 03/13] riscv: Implement cmpxchg32/64() using Zacas
Date: Sun,  3 Nov 2024 15:51:43 +0100
Message-Id: <20241103145153.105097-4-alexghiti@rivosinc.com>
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

This adds runtime support for Zacas in cmpxchg operations.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/Kconfig               | 16 +++++++++++
 arch/riscv/Makefile              |  3 ++
 arch/riscv/include/asm/cmpxchg.h | 48 +++++++++++++++++++++-----------
 3 files changed, 50 insertions(+), 17 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 62545946ecf4..3542efe3088b 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -632,6 +632,22 @@ config RISCV_ISA_ZAWRS
 	  use of these instructions in the kernel when the Zawrs extension is
 	  detected at boot.
 
+config TOOLCHAIN_HAS_ZACAS
+	bool
+	default y
+	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zacas)
+	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zacas)
+	depends on AS_HAS_OPTION_ARCH
+
+config RISCV_ISA_ZACAS
+	bool "Zacas extension support for atomic CAS"
+	depends on TOOLCHAIN_HAS_ZACAS
+	depends on RISCV_ALTERNATIVE
+	default y
+	help
+	  Enable the use of the Zacas ISA-extension to implement kernel atomic
+	  cmpxchg operations when it is detected at boot.
+
 	  If you don't know what to do here, say Y.
 
 config TOOLCHAIN_HAS_ZBB
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index d469db9f46f4..3700a1574413 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -82,6 +82,9 @@ else
 riscv-march-$(CONFIG_TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI) := $(riscv-march-y)_zicsr_zifencei
 endif
 
+# Check if the toolchain supports Zacas
+riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZACAS) := $(riscv-march-y)_zacas
+
 # Remove F,D,V from isa string for all. Keep extensions between "fd" and "v" by
 # matching non-v and non-multi-letter extensions out with the filter ([^v_]*)
 KBUILD_CFLAGS += -march=$(shell echo $(riscv-march-y) | sed -E 's/(rv32ima|rv64ima)fd([^v_]*)v?/\1\2/')
diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index ac1d7df898ef..39c1daf39f6a 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -12,6 +12,7 @@
 #include <asm/fence.h>
 #include <asm/hwcap.h>
 #include <asm/insn-def.h>
+#include <asm/cpufeature-macros.h>
 
 #define __arch_xchg_masked(sc_sfx, prepend, append, r, p, n)		\
 ({									\
@@ -137,24 +138,37 @@
 	r = (__typeof__(*(p)))((__retx & __mask) >> __s);		\
 })
 
-#define __arch_cmpxchg(lr_sfx, sc_sfx, prepend, append, r, p, co, o, n)	\
+#define __arch_cmpxchg(lr_sfx, sc_cas_sfx, prepend, append, r, p, co, o, n)	\
 ({									\
-	register unsigned int __rc;					\
+	if (IS_ENABLED(CONFIG_RISCV_ISA_ZACAS) &&			\
+	    riscv_has_extension_unlikely(RISCV_ISA_EXT_ZACAS)) {	\
+		r = o;							\
 									\
-	__asm__ __volatile__ (						\
-		prepend							\
-		"0:	lr" lr_sfx " %0, %2\n"				\
-		"	bne  %0, %z3, 1f\n"				\
-		"	sc" sc_sfx " %1, %z4, %2\n"			\
-		"	bnez %1, 0b\n"					\
-		append							\
-		"1:\n"							\
-		: "=&r" (r), "=&r" (__rc), "+A" (*(p))			\
-		: "rJ" (co o), "rJ" (n)					\
-		: "memory");						\
+		__asm__ __volatile__ (					\
+			prepend						\
+			"	amocas" sc_cas_sfx " %0, %z2, %1\n"	\
+			append						\
+			: "+&r" (r), "+A" (*(p))			\
+			: "rJ" (n)					\
+			: "memory");					\
+	} else {							\
+		register unsigned int __rc;				\
+									\
+		__asm__ __volatile__ (					\
+			prepend						\
+			"0:	lr" lr_sfx " %0, %2\n"			\
+			"	bne  %0, %z3, 1f\n"			\
+			"	sc" sc_cas_sfx " %1, %z4, %2\n"		\
+			"	bnez %1, 0b\n"				\
+			append						\
+			"1:\n"						\
+			: "=&r" (r), "=&r" (__rc), "+A" (*(p))		\
+			: "rJ" (co o), "rJ" (n)				\
+			: "memory");					\
+	}								\
 })
 
-#define _arch_cmpxchg(ptr, old, new, sc_sfx, prepend, append)		\
+#define _arch_cmpxchg(ptr, old, new, sc_cas_sfx, prepend, append)	\
 ({									\
 	__typeof__(ptr) __ptr = (ptr);					\
 	__typeof__(*(__ptr)) __old = (old);				\
@@ -164,15 +178,15 @@
 	switch (sizeof(*__ptr)) {					\
 	case 1:								\
 	case 2:								\
-		__arch_cmpxchg_masked(sc_sfx, prepend, append,		\
+		__arch_cmpxchg_masked(sc_cas_sfx, prepend, append,	\
 					__ret, __ptr, __old, __new);	\
 		break;							\
 	case 4:								\
-		__arch_cmpxchg(".w", ".w" sc_sfx, prepend, append,	\
+		__arch_cmpxchg(".w", ".w" sc_cas_sfx, prepend, append,	\
 				__ret, __ptr, (long), __old, __new);	\
 		break;							\
 	case 8:								\
-		__arch_cmpxchg(".d", ".d" sc_sfx, prepend, append,	\
+		__arch_cmpxchg(".d", ".d" sc_cas_sfx, prepend, append,	\
 				__ret, __ptr, /**/, __old, __new);	\
 		break;							\
 	default:							\
-- 
2.39.2


