Return-Path: <linux-doc+bounces-19526-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C20C7918204
	for <lists+linux-doc@lfdr.de>; Wed, 26 Jun 2024 15:15:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E1B4286F17
	for <lists+linux-doc@lfdr.de>; Wed, 26 Jun 2024 13:15:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 828B8188CB8;
	Wed, 26 Jun 2024 13:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="FvBI4Q4Q"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FBB187572
	for <linux-doc@vger.kernel.org>; Wed, 26 Jun 2024 13:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719407403; cv=none; b=rqAmLH2RpYpSGda4TlxCrF09da2vimNcdjmLRNG7hCuhbMJ+Udk1gzFjhXQkwGHGpMXnhL7J3vuHcbQVMmLv7yVDd9+Y/2h3dOm1gXlChhfc+r5XmU6d1427Kcg4RePLOpHFmSh5yB41sX45mSCdmmOZwWHh29CVunl/LeEPW+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719407403; c=relaxed/simple;
	bh=1nsWpj/1AHADQ4wqup/AgTW4I3Ye+rUKhZdyv9agWxQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=q5jRA4m5t486hR0O0jp1+ysrCgQ5HLrQotp4PF2VG+Jp19qgDt+5wGimCAdXejIZn4Fr3OO7bWCyxlQ/rz9P9G8j72KmvFjhIfN3guVvobDGCvMe2IFc2vAHlfYQVugPZva9EZvDxZx/8wJnfi2NHxy9frvbiQvu465xRInWTos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=FvBI4Q4Q; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3621ac606e1so413351f8f.1
        for <linux-doc@vger.kernel.org>; Wed, 26 Jun 2024 06:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719407399; x=1720012199; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QWrbp7YnSuSg4cTyCRLd07oshRok5ClJY3Zre9Kj0ww=;
        b=FvBI4Q4Q3HQCTqPsoEoLRnI8gOmuBXhqSSPpUCRZPUo4xW5tKaSwy26l0QxSQ/rt+y
         1Q9yizARS8f/nYAdicq2qMYq9s1EemDfqztUruz3B/qIw4/63N+UccACntKQem4nxITR
         FddT4jnF3KxLVlHM8D1qHktQq2ZI4/0IYTr1fQwY1vS7sObxiz2KpDmoucXp1h40lHJI
         /CwSzjlLdq82mfX/KmqE461P6ax0l9rnYnxzZxTADxJ9LEHYQSy1xmdTdZaPwbqvBRai
         ey6rMGb5bRqod+H/R3GR39jkm9PGbLwFfuaOjlFA8UzPJBYeV5/xf3DTiltZtuUU9Nhv
         5fwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719407399; x=1720012199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QWrbp7YnSuSg4cTyCRLd07oshRok5ClJY3Zre9Kj0ww=;
        b=Rjp7UPZ0QFEanXg2EiFNfjMBk9XA/WXUgE8nXNE/OfoEtFyNQ0jJ4uBQxcYUCLhcfb
         Tlr3sW1hUU051Vj/pEDzcA3LkyDEkakQTX3JZYw/3OhAS33RaApHMKtPD3G3QFnbmK+N
         VtvvEyTI44oxZmXWkc0K1n0AV8fqVvZ+Z/KvkFA3EguZDAMuLuj2oc4Q3ghZ3gU9kavp
         7B8+igBksrf+F9ZZSOhwc7YOS4vuNO+OzSGqLW4m/BYeK/JkkQOETBCJmIO9q7SniINh
         bgEyS8UDuixv5Yr1ztkw/F0vRxLq+hkvPV435v4R93VvPiILng4R/T2zOF6cMu+5Xft5
         6L2w==
X-Forwarded-Encrypted: i=1; AJvYcCXoLb4TGdZvSb0UfynmcygT9uYG9A2YDjbZT8DgIriiW9f5iex+/5GBiY0PBj+mlzhCLV07A/nl1itDgd3kZIn7h+XiKz4bZm+R
X-Gm-Message-State: AOJu0Ywa9vHdYKRMLuevUUpdZS5TLKOiOdaWbeOMHQ0H/7soybRXaRnL
	vm+R1lgY4x6MOXk2EA1jmPeVH8/Jj0hDrKsonye1yROpK1U1pHYeD3/URktfFC8=
X-Google-Smtp-Source: AGHT+IF1O9RqB95BpuZCH8OUjPkY7BW4xVu+M+7CZDEbvz5gp1RkR9X5IwXEN5r4vgMt231tIFpnRA==
X-Received: by 2002:a05:6000:1c4:b0:367:3404:1c06 with SMTP id ffacd0b85a97d-36734041cecmr473355f8f.20.1719407398822;
        Wed, 26 Jun 2024 06:09:58 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3663ada0bdesm15712197f8f.113.2024.06.26.06.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 06:09:58 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
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
Subject: [PATCH v2 06/10] riscv: Implement xchg8/16() using Zabha
Date: Wed, 26 Jun 2024 15:03:43 +0200
Message-Id: <20240626130347.520750-7-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240626130347.520750-1-alexghiti@rivosinc.com>
References: <20240626130347.520750-1-alexghiti@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds runtime support for Zabha in xchg8/16() operations.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/cmpxchg.h | 33 +++++++++++++++++++++++++++++---
 arch/riscv/include/asm/hwcap.h   |  1 +
 arch/riscv/kernel/cpufeature.c   |  1 +
 3 files changed, 32 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index da42f32ea53d..eb35e2d30a97 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -11,8 +11,17 @@
 #include <asm/fence.h>
 #include <asm/alternative.h>
 
-#define __arch_xchg_masked(sc_sfx, prepend, append, r, p, n)		\
+#define __arch_xchg_masked(sc_sfx, swap_sfx, prepend, sc_append,	\
+			   swap_append, r, p, n)			\
 ({									\
+	__label__ zabha, end;						\
+									\
+	if (IS_ENABLED(CONFIG_RISCV_ISA_ZABHA)) {			\
+		asm goto(ALTERNATIVE("nop", "j %[zabha]", 0,		\
+				     RISCV_ISA_EXT_ZABHA, 1)		\
+			 : : : : zabha);				\
+	}								\
+									\
 	u32 *__ptr32b = (u32 *)((ulong)(p) & ~0x3);			\
 	ulong __s = ((ulong)(p) & (0x4 - sizeof(*p))) * BITS_PER_BYTE;	\
 	ulong __mask = GENMASK(((sizeof(*p)) * BITS_PER_BYTE) - 1, 0)	\
@@ -28,12 +37,25 @@
 	       "	or   %1, %1, %z3\n"				\
 	       "	sc.w" sc_sfx " %1, %1, %2\n"			\
 	       "	bnez %1, 0b\n"					\
-	       append							\
+	       sc_append							\
 	       : "=&r" (__retx), "=&r" (__rc), "+A" (*(__ptr32b))	\
 	       : "rJ" (__newx), "rJ" (~__mask)				\
 	       : "memory");						\
 									\
 	r = (__typeof__(*(p)))((__retx & __mask) >> __s);		\
+	goto end;							\
+									\
+zabha:									\
+	if (IS_ENABLED(CONFIG_RISCV_ISA_ZABHA)) {			\
+		__asm__ __volatile__ (					\
+			prepend						\
+			"	amoswap" swap_sfx " %0, %z2, %1\n"	\
+			swap_append						\
+			: "=&r" (r), "+A" (*(p))			\
+			: "rJ" (n)					\
+			: "memory");					\
+	}								\
+end:;									\
 })
 
 #define __arch_xchg(sfx, prepend, append, r, p, n)			\
@@ -56,8 +78,13 @@
 									\
 	switch (sizeof(*__ptr)) {					\
 	case 1:								\
+		__arch_xchg_masked(sc_sfx, ".b" swap_sfx,		\
+				   prepend, sc_append, swap_append,	\
+				   __ret, __ptr, __new);		\
+		break;							\
 	case 2:								\
-		__arch_xchg_masked(sc_sfx, prepend, sc_append,		\
+		__arch_xchg_masked(sc_sfx, ".h" swap_sfx,		\
+				   prepend, sc_append, swap_append,	\
 				   __ret, __ptr, __new);		\
 		break;							\
 	case 4:								\
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index e17d0078a651..f71ddd2ca163 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -81,6 +81,7 @@
 #define RISCV_ISA_EXT_ZTSO		72
 #define RISCV_ISA_EXT_ZACAS		73
 #define RISCV_ISA_EXT_XANDESPMU		74
+#define RISCV_ISA_EXT_ZABHA		75
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 5ef48cb20ee1..c125d82c894b 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -257,6 +257,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
 	__RISCV_ISA_EXT_DATA(zihpm, RISCV_ISA_EXT_ZIHPM),
 	__RISCV_ISA_EXT_DATA(zacas, RISCV_ISA_EXT_ZACAS),
+	__RISCV_ISA_EXT_DATA(zabha, RISCV_ISA_EXT_ZABHA),
 	__RISCV_ISA_EXT_DATA(zfa, RISCV_ISA_EXT_ZFA),
 	__RISCV_ISA_EXT_DATA(zfh, RISCV_ISA_EXT_ZFH),
 	__RISCV_ISA_EXT_DATA(zfhmin, RISCV_ISA_EXT_ZFHMIN),
-- 
2.39.2


