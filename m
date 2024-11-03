Return-Path: <linux-doc+bounces-29725-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA809BA61F
	for <lists+linux-doc@lfdr.de>; Sun,  3 Nov 2024 15:59:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CE23CB2095A
	for <lists+linux-doc@lfdr.de>; Sun,  3 Nov 2024 14:59:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6175017C234;
	Sun,  3 Nov 2024 14:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="W9s4dmif"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE35D156875
	for <linux-doc@vger.kernel.org>; Sun,  3 Nov 2024 14:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730645948; cv=none; b=AVLp6lupJ0A6cDOjoKVdzZgfWBJfYOsi0+Kelee3f5p64cNlnacN7NfwpHZGK2FUspcjRtjwUT2wl8hXJyrBgWawW+Kbd4hAR7CbU1rdmFtCFbfI7U3hB66ANBsop4w96GXfgvsdkIErRomsj+YyqhKiKy9ocrRnQbcJzbak08M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730645948; c=relaxed/simple;
	bh=owSN92DfUo1jaGZz+2Ukq4uBNlzp0f+9tLQB0G3n0sE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZKygVXIwmsytwVLEP5vjib61gwDoHUHs6b+H8EzAnu5Sq8TP6rLmQzpdPqavCkGDFp0lgqqZdUUKBbUCjbB32UMI6/idLPdIOcelYz69p1OPjAdM1q8pbQoFTL3o99qxUFbaWdFhBr7/tNJ5X0wWctw5PlnTh00U5CxAoul7XKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=W9s4dmif; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43155afca99so25796665e9.1
        for <linux-doc@vger.kernel.org>; Sun, 03 Nov 2024 06:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1730645945; x=1731250745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2YMddV/TixlRcMkBqzVFy3RqDe67DeCntBmj39JunYc=;
        b=W9s4dmifzYl8kc3GW3buR4m0AoaYA23sXD6nTU/09kuDlJXP/EA2Y6yVCffn9aE44v
         8esJryubesuCvNO58QQmuS3C8wRkWyPYMzXwwANy5vQCFSG1gqbxzLzYVwBxhpy3DI6y
         eBHGnu8Q37yWK/4GAdyB7HpdwapbRGEsEnG1Hb0LcrVpfKtp/vEj9eNzmR7xajmhnhs9
         aN9jFYESNGYXjQpd3vGuduhOogDweWqI2Ce8jHBUiRb6hSC0DQ/AwQiumgiQ/pN7coMN
         DaCoadJlgTyql7cU0IcqZQmBF8LMNk68nDc7L9jbbEnSAB+tt20cGMnAg0LZHU2+XMN3
         Yw9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730645945; x=1731250745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2YMddV/TixlRcMkBqzVFy3RqDe67DeCntBmj39JunYc=;
        b=SOmxFthHK5DFWVU60TMYJ46cp2ADb5MYwbqiI3iV6aR9h2paX5ZTX6fJDRBzPRM2/o
         HFareCPPHFSnrlR3NeaQAb3NDu4vDTSdqqVsHRrwE+sBHjBgXjQxT2F08a2DgD9Zh8v7
         sXG3q4seVrAkUVwB8A/Wd8GFwDUwyUmmQYm0eU4/0JmRpjpH5OX/AIXB3OoMRQ6NaJnl
         hphhm+hZbglxd7Z+fgy9s5RcS0IPIuehjPvSXRO/xhIulgBZxCCR5dElTcaxvRWA4mn1
         l7cvZP1h65vLIYYug4XYhW3Iqmuw/04Es1t9vi+nLWq7y7tFZlv+yPwanOvk/wgJjUm6
         BiLQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3mzpL/P/sIvUZiBMU7woM5Mk68eHwhoIgnzhgO/yLYt7tFhItIWdiJS/bwESq6wz9nbj/mQFba5Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmnlgenGxZ80PgDPZyX4XVdfoaisJzzJqWRJwhoB8RqjYU/e4o
	YWI2TZHJN4y/4scgwulD93+xp/HAuIqYL+rVOXd4+vD5xgDdMeD5zJ3gUZQJ+H8=
X-Google-Smtp-Source: AGHT+IEwAhzLmFndg4dtG6o7eex1DY00zUsKhGi9VFC31IF8dEpvf7rYFDq+11tOCJeycg1G7RqbUQ==
X-Received: by 2002:a5d:5a8c:0:b0:381:d133:d541 with SMTP id ffacd0b85a97d-381d133d9cdmr3234403f8f.11.1730645945038;
        Sun, 03 Nov 2024 06:59:05 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (lfbn-lyo-1-472-36.w2-7.abo.wanadoo.fr. [2.7.62.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d6852d9sm126046165e9.37.2024.11.03.06.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2024 06:59:04 -0800 (PST)
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
Subject: [PATCH v6 07/13] riscv: Implement arch_cmpxchg128() using Zacas
Date: Sun,  3 Nov 2024 15:51:47 +0100
Message-Id: <20241103145153.105097-8-alexghiti@rivosinc.com>
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

Now that Zacas is supported in the kernel, let's use the double word
atomic version of amocas to improve the SLUB allocator.

Note that we have to select fixed registers, otherwise gcc fails to pick
even registers and then produces a reserved encoding which fails to
assemble.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/Kconfig               |  1 +
 arch/riscv/include/asm/cmpxchg.h | 38 ++++++++++++++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 668be90a42e4..093ee6537331 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -115,6 +115,7 @@ config RISCV
 	select GENERIC_VDSO_TIME_NS if HAVE_GENERIC_VDSO
 	select HARDIRQS_SW_RESEND
 	select HAS_IOPORT if MMU
+	select HAVE_ALIGNED_STRUCT_PAGE
 	select HAVE_ARCH_AUDITSYSCALL
 	select HAVE_ARCH_HUGE_VMALLOC if HAVE_ARCH_HUGE_VMAP
 	select HAVE_ARCH_HUGE_VMAP if MMU && 64BIT
diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index 052418aba11a..f95929f538b2 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -296,6 +296,44 @@
 	arch_cmpxchg_release((ptr), (o), (n));				\
 })
 
+#if defined(CONFIG_64BIT) && defined(CONFIG_RISCV_ISA_ZACAS)
+
+#define system_has_cmpxchg128()        riscv_has_extension_unlikely(RISCV_ISA_EXT_ZACAS)
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
+	__typeof__(*(p)) __o = (o);                                             \
+	union __u128_halves __hn = { .full = (n) };				\
+	union __u128_halves __ho = { .full = (__o) };				\
+	register unsigned long t1 asm ("t1") = __hn.low;			\
+	register unsigned long t2 asm ("t2") = __hn.high;			\
+	register unsigned long t3 asm ("t3") = __ho.low;			\
+	register unsigned long t4 asm ("t4") = __ho.high;			\
+										\
+	__asm__ __volatile__ (							\
+		 "       amocas.q" cas_sfx " %0, %z3, %2"			\
+		 : "+&r" (t3), "+&r" (t4), "+A" (*(p))				\
+		 : "rJ" (t1), "rJ" (t2)						\
+		 : "memory");							\
+										\
+		 ((u128)t4 << 64) | t3;						\
+})
+
+#define arch_cmpxchg128(ptr, o, n)						\
+	__arch_cmpxchg128((ptr), (o), (n), ".aqrl")
+
+#define arch_cmpxchg128_local(ptr, o, n)					\
+	__arch_cmpxchg128((ptr), (o), (n), "")
+
+#endif /* CONFIG_64BIT && CONFIG_RISCV_ISA_ZACAS */
+
 #ifdef CONFIG_RISCV_ISA_ZAWRS
 /*
  * Despite wrs.nto being "WRS-with-no-timeout", in the absence of changes to
-- 
2.39.2


