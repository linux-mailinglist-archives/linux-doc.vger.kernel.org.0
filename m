Return-Path: <linux-doc+bounces-20888-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3AE9336F1
	for <lists+linux-doc@lfdr.de>; Wed, 17 Jul 2024 08:25:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5DCD41F23185
	for <lists+linux-doc@lfdr.de>; Wed, 17 Jul 2024 06:25:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23E0213AF2;
	Wed, 17 Jul 2024 06:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="Z8u7SVU+"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2946E12B6C
	for <linux-doc@vger.kernel.org>; Wed, 17 Jul 2024 06:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721197510; cv=none; b=pqG8/V9grrBtu3GLJ1/f7G3pR+PkIONY2zZHc8SZPOqEdgoSMBlr6D2sU5CwytETmFDonaY62ms1yEtSncv3FNgEIpGdvOEOhTlJz6xdTSsglf6Ox73/vJPT01vJJi6r65IUbiITE/bT58Jrqz0d84NTfId8N7+xOZQuJOBCk7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721197510; c=relaxed/simple;
	bh=3zBJRLkrzJHSNuZAH1F+78p9BTEz4I4epc4BJVRS110=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Y28/YP4h+v4r9kjKFofVfe8bVslGdWSnsFkaHrRoli8C9Gd37hrEkJZ3OzOUaTq0CaNduTAUCUuXhm8CRJX49c34dyjnWrfOyDpxs6TAGqE0yamiq0FkLPTu/eBQKuxzLpliGrquC4LETsO1751buHU7fU4QrfnU3wu4+Qq0VDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=Z8u7SVU+; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-42660b8dd27so43722045e9.3
        for <linux-doc@vger.kernel.org>; Tue, 16 Jul 2024 23:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721197506; x=1721802306; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xQbGd0qu6ssbesu7Zjwn0myIi2A+oWSgEr0KZDNP1pQ=;
        b=Z8u7SVU+9/ifkGY9+pBpuJd2k664kK38R+eCRwtf6S/rd+EPbFXqEBedrvmhJp5qra
         n5o05/9r3FuV64FAW4Byt/h4o1BlK5gM1mk0aC/OkNwbVJxiSdBP7bQwF690a/TegAOQ
         KVkuBRVPSat0xrc0f/4uRpsggwcfpvhetqds7GtGu90gzexZMOfpT2Fs5GchfFb2Z6RE
         CnwBqMGYmCPizMz5PR6VZGsIcrmsWri38usivn2PRriBnRPhEhmYSP7b0b0Ttz2PkOdR
         Iy6NGVm2E4Claushy76Q6NvyR9LtDR9gzIkuZmJ0t/2O3giWlcxJ/INUbh+tYMq1yVS7
         s1zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721197506; x=1721802306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xQbGd0qu6ssbesu7Zjwn0myIi2A+oWSgEr0KZDNP1pQ=;
        b=c0WMbpdJNqGPc/eO11CTiSv/8aTEqz6gwo538WyPAJHEDoF8xFIi96+nJH8DMC+T1/
         cQHlDrafQFiu55XCGt9xGJEKhhkKdHRkzEIQOGNkcNo0RPzKOy3JBEIgSFw0BpQex/6O
         2/X7FkqAubwjoA7y8flFJ+bXzf/pb6ofI7aIX4PC9T85c0GaYTHTwDbZF/ZNQKoFC1iU
         fK7jtVytgVgpTUBkkyxHr83qttLF7+1VVQVyk2LwdxxhjFlTOJTfg10GG2JkrSDyA3xV
         /9bioY8SXhHcyHgrfqcqf+uNaj+lr8MAlR0qBSzwGANKZANM3JD2+f0ic24rfkT9aJlA
         tRqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcII778vltORxK4R2PHBvccB/5U3ipChagUZNCj86R35jl0iJ2GkK5NB+VILO0TwK+D1ZmpuYpxFyTk70ZBV/KV83+DZ5kfG6n
X-Gm-Message-State: AOJu0YwQsMdpFjAJ1B6yfNOR59tviqrRvZSqDdkNKSE2qMnRFhD1u4ky
	EhrmUGisWBGf8OrxYj6JFGaC2CCzGVvZBNeLdJCQZztF0ARQd0d3jIExvauL5Uw=
X-Google-Smtp-Source: AGHT+IEFDv6V5tFWhauDPHJiZCgq6FMlgRvbm1hC+8pd4MPLkSbI6qpbIzPF0VaZZ69mfVtEYemITg==
X-Received: by 2002:a05:600c:4eca:b0:426:549c:294c with SMTP id 5b1f17b1804b1-427c2d06e43mr5639015e9.35.1721197506505;
        Tue, 16 Jul 2024 23:25:06 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427a5ef4617sm155918965e9.41.2024.07.16.23.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 23:25:06 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v3 05/11] riscv: Implement arch_cmpxchg128() using Zacas
Date: Wed, 17 Jul 2024 08:19:51 +0200
Message-Id: <20240717061957.140712-6-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240717061957.140712-1-alexghiti@rivosinc.com>
References: <20240717061957.140712-1-alexghiti@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that Zacas is supported in the kernel, let's use the double word
atomic version of amocas to improve the SLUB allocator.

Note that we have to select fixed registers, otherwise gcc fails to pick
even registers and then produces a reserved encoding which fails to
assemble.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/Kconfig               |  1 +
 arch/riscv/include/asm/cmpxchg.h | 39 ++++++++++++++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index d3b0f92f92da..0bbaec0444d0 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -104,6 +104,7 @@ config RISCV
 	select GENERIC_VDSO_TIME_NS if HAVE_GENERIC_VDSO
 	select HARDIRQS_SW_RESEND
 	select HAS_IOPORT if MMU
+	select HAVE_ALIGNED_STRUCT_PAGE
 	select HAVE_ARCH_AUDITSYSCALL
 	select HAVE_ARCH_HUGE_VMALLOC if HAVE_ARCH_HUGE_VMAP
 	select HAVE_ARCH_HUGE_VMAP if MMU && 64BIT
diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index 97b24da38897..608d98522557 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -289,4 +289,43 @@ end:;									\
 	arch_cmpxchg_release((ptr), (o), (n));				\
 })
 
+#ifdef CONFIG_RISCV_ISA_ZACAS
+
+#define system_has_cmpxchg128()						\
+			riscv_has_extension_unlikely(RISCV_ISA_EXT_ZACAS)
+
+union __u128_halves {
+	u128 full;
+	struct {
+		u64 low, high;
+	};
+};
+
+#define __arch_cmpxchg128(p, o, n, cas_sfx)					\
+({										\
+	__typeof__(*(p)) __o = (o);						\
+	union __u128_halves __hn = { .full = (n) };				\
+	union __u128_halves __ho = { .full = (__o) };				\
+	register unsigned long x6 asm ("x6") = __hn.low;			\
+	register unsigned long x7 asm ("x7") = __hn.high;			\
+	register unsigned long x28 asm ("x28") = __ho.low;			\
+	register unsigned long x29 asm ("x29") = __ho.high;			\
+										\
+	__asm__ __volatile__ (							\
+		"	amocas.q" cas_sfx " %0, %z3, %2"			\
+		: "+&r" (x28), "+&r" (x29), "+A" (*(p))				\
+		: "rJ" (x6), "rJ" (x7)						\
+		: "memory");							\
+										\
+	((u128)x29 << 64) | x28;						\
+})
+
+#define arch_cmpxchg128(ptr, o, n)						\
+	__arch_cmpxchg128((ptr), (o), (n), ".aqrl")
+
+#define arch_cmpxchg128_local(ptr, o, n)					\
+	__arch_cmpxchg128((ptr), (o), (n), "")
+
+#endif /* CONFIG_RISCV_ISA_ZACAS */
+
 #endif /* _ASM_RISCV_CMPXCHG_H */
-- 
2.39.2


