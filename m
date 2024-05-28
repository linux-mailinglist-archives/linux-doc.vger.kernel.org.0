Return-Path: <linux-doc+bounces-17126-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9429F8D2008
	for <lists+linux-doc@lfdr.de>; Tue, 28 May 2024 17:15:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B6E8E1C23161
	for <lists+linux-doc@lfdr.de>; Tue, 28 May 2024 15:15:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84108171E49;
	Tue, 28 May 2024 15:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="1SbsL9C+"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72CE171E41
	for <linux-doc@vger.kernel.org>; Tue, 28 May 2024 15:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716909241; cv=none; b=ftJAYhfwEcDzR9xb3rWCVDgT45LJDbjN2st75PzHmlGpVt/YDJM4Mh+Hxk1YFQw01ftQfpdR8vIEqUW3XZGcJ881h/el72qMDMJvSIpD60KogCLFqRxSavGbuxZvC1muMSZH06tAucZ7Y62wqsRsHmvSSGuU2h2NaIy0rv8JjjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716909241; c=relaxed/simple;
	bh=EjieqW/8+JJzLLoBTQFYN8FJzpAcjOBh3yjPb46+kqU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KqBbjMqPuWz9MByohu0G2TZZYbY6ojG21/tu6f+HqzxIByVoSZq3HpxBlLVOic0/WC0Byl31w9ZE+P2N9zbggJj+G5iFm5hUgkUiGRx6A9AnUq7a3FJVwoHbSsDj+xgVPvl+Ms1PsC+NHkHV2aLH9E/I70cpxTNmqHr7q4yeCkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=1SbsL9C+; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-35b6467754cso436161f8f.3
        for <linux-doc@vger.kernel.org>; Tue, 28 May 2024 08:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1716909238; x=1717514038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8+QNuMhUn/mhPs/6E1/sFkjL9Li5Z0ATbah2dvUIKDM=;
        b=1SbsL9C+aAEmI7DUG6TF8zOSrpOD5d/TBkCYFXAThbsUY9Dl4H0aorxErXDwgaPXRl
         DfvU4jc//kaQ3fw2I2mS5n98wDQm3XOwcF9hIaHO6z9WCZYi93oVyTtIJxiXmVJPXiwX
         2YeVHhxiQlXSEFpx4IYaADDq+VIOpWCcDH7OTJkXWx3rTjKc5fOQoZSmsLy048bUKKgl
         +PvbB830GO8KKlDZZHFTFShoC3lREJIMS4919Fdvsn2nmd4eIvajLXNbCvC3ZLb8HTev
         jWX8vwa6E6vOGFYidlE/c9Xxo28Y6Dc1U3BilZmDsgX5X2xBRnCIWNM0ADhoSO6Nushi
         f1Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716909238; x=1717514038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8+QNuMhUn/mhPs/6E1/sFkjL9Li5Z0ATbah2dvUIKDM=;
        b=b5iAGJK3TYBmgjaD11oB7EXfHaHcPjJ1mguvI3ZAfcA1QN4NPcMFFpvt2k1Z2wk6mJ
         6bs2A2L2IepR+L4vwYb7sO7sPZGIX2YtbmGtTOaqfkz2ID9PMCrg0UACaKS8QShmQN1D
         dBB2FpVQOGLFvdoO5P9iA1WvYZCGSDGJP3zH4T7MWujfwLi80RKJ2GgsQbF5hTaHRK8A
         wCMTjWF0kd/PNqC0L9n2Q6pOVUdv7udUkSuQAuIrrOlT+DlJGxlwBEz5urTdAvn/433q
         JkC9Jgq8XBwdnJmSme/Hcl9nQxuKqhb8KHiIgZ91G2zoUutu1yTuzhHeGaUz3IN4VupQ
         PfnQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1a3lp59bexegbMQI2/NSkNcllLk4rU2hJoPQdLpUGRFD1hP3zVel14kcF2hNNlzq0i6AdE/2LSFGfSux0EsW/1UGEktLQDdhW
X-Gm-Message-State: AOJu0YxgU8TX5Ofw9wrx+KzftRyTuqQP0we4HnI3nVaNMcHr42g/+Gj6
	//rwO1fhPgo/+HZl82WbjUhTL4jhd7qEqnJx1HQcr7smHwEnqiTteHvVcZv+yTE=
X-Google-Smtp-Source: AGHT+IFax4v0kzQv5SDc3SAQTe47rQjW60kRd6Vmso4QAx01vZU4yzSYIPRZPjT4yaPXSVHdqYbyVw==
X-Received: by 2002:a5d:558d:0:b0:34d:74cb:c0be with SMTP id ffacd0b85a97d-35526c569cbmr8166449f8f.35.1716909238142;
        Tue, 28 May 2024 08:13:58 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3557a0908e4sm12094483f8f.63.2024.05.28.08.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 08:13:57 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
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
Subject: [PATCH 3/7] riscv: Implement arch_cmpxchg128() using Zacas
Date: Tue, 28 May 2024 17:10:48 +0200
Message-Id: <20240528151052.313031-4-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240528151052.313031-1-alexghiti@rivosinc.com>
References: <20240528151052.313031-1-alexghiti@rivosinc.com>
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
 arch/riscv/include/asm/cmpxchg.h | 41 ++++++++++++++++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 05597719bb1c..184a9edb04e0 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -101,6 +101,7 @@ config RISCV
 	select GENERIC_VDSO_TIME_NS if HAVE_GENERIC_VDSO
 	select HARDIRQS_SW_RESEND
 	select HAS_IOPORT if MMU
+	select HAVE_ALIGNED_STRUCT_PAGE
 	select HAVE_ARCH_AUDITSYSCALL
 	select HAVE_ARCH_HUGE_VMALLOC if HAVE_ARCH_HUGE_VMAP
 	select HAVE_ARCH_HUGE_VMAP if MMU && 64BIT && !XIP_KERNEL
diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index 65de9771078e..0789fbe38b23 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -242,4 +242,45 @@ end:									\
 	arch_cmpxchg_relaxed((ptr), (o), (n));				\
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
+#define __arch_cmpxchg128(p, o, n, prepend, append)			\
+({									\
+	__typeof__(*(p)) __o = (o);					\
+	union __u128_halves new = { .full = (n) };			\
+	union __u128_halves old = { .full = (__o) };			\
+	register unsigned long x6 asm ("x6") = new.low;			\
+	register unsigned long x7 asm ("x7") = new.high;		\
+	register unsigned long x28 asm ("x28") = old.low;		\
+	register unsigned long x29 asm ("x29") = old.high;		\
+									\
+	__asm__ __volatile__ (						\
+		prepend							\
+		"	amocas.q %0, %z2, %1\n"				\
+		append							\
+		: "+&r" (x28), "+A" (*(p))				\
+		: "rJ" (x6)						\
+		: "memory");						\
+									\
+	__o;								\
+})
+
+#define arch_cmpxchg128(ptr, o, n)					\
+	__arch_cmpxchg128((ptr), (o), (n), "", "     fence rw, rw\n")
+
+#define arch_cmpxchg128_local(ptr, o, n)				\
+	__arch_cmpxchg128((ptr), (o), (n), "", "")
+
+#endif /* CONFIG_RISCV_ISA_ZACAS */
+
 #endif /* _ASM_RISCV_CMPXCHG_H */
-- 
2.39.2


