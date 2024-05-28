Return-Path: <linux-doc+bounces-17127-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD568D2012
	for <lists+linux-doc@lfdr.de>; Tue, 28 May 2024 17:16:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CCBD4286B8C
	for <lists+linux-doc@lfdr.de>; Tue, 28 May 2024 15:16:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7151171083;
	Tue, 28 May 2024 15:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="yntQABQd"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1884916D4F5
	for <linux-doc@vger.kernel.org>; Tue, 28 May 2024 15:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716909302; cv=none; b=BGrhfa1MuyM+quTxjl/B9TKEsKRtwGPZxM8/zRTrqhpDVTZKCoq5nPeafih7r2S7fqxIKXPOwo/SiA9Qjx3ZDaBtuZpjTs8wqKpevqkTpYBRJDi+xjJlfR4F91VMnKIXN/IUaWyYF5HED673akusuGDUcd3P5/FB9PYivDdnpD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716909302; c=relaxed/simple;
	bh=byVCn7vyyoWVCExOcLktbP9jgpsI9hB8fTXW6dyI5l4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qbUfbkl9n6ls4n9qUtgEx0yrDC2sI0G6uM0tfC9nCrvPe1ypSXiMDE+lGhNyJ+WQJQeuuviL3tOQRDjNlcYhRL1ti2dcJhY+aVrdjYw8/qYrnD7CHAABW9HOK2e4LUpY5v82GmatxOELDYgNDUeY6V85HbG6C4NZaXnDpgUEe3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=yntQABQd; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2e724bc46c4so9777001fa.2
        for <linux-doc@vger.kernel.org>; Tue, 28 May 2024 08:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1716909299; x=1717514099; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QJ9jfwQtVSCqEew5FGQUfrRX44QJ3TNBiU9EdF5jARo=;
        b=yntQABQd2Un8Wr1ZeQtRfwEySXNs4PXXc/bgKeXzgUEt1lh/x8IbAJLtmuIRWveMrI
         dKQkyxJ3VIo2a0vAt5uDvuhz6zyhhA2RNlNP/eW+BWUVr5rT0Ww02jxkXbdFQR+Q8yx4
         raDEp09sVL4gbBA1DccmNWhyl7gTdZXJvbzruYtfURxWL+hMZc6CcpOf09ku3qW6Cwtu
         aZoJ1pnA3C1kztX0H8fCuHbLIBtxvZv8Bw/w5xr378I3F4yLwuNSPJzcxSSHH5EMM2Xx
         IZKSVfSsogKL7bB73qRmhm7xTNzRnMgfVIPLjDylZX4XTRfQ8OesccCwwMZKIXZXlWZ8
         93sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716909299; x=1717514099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QJ9jfwQtVSCqEew5FGQUfrRX44QJ3TNBiU9EdF5jARo=;
        b=pS/1oCOuC5PxDAOYmJIq0DpsITRaMIcNxosbhD/A6qgIv8tilRu3h3lSRE06unTuNo
         FLgLOpEKBuKa68AKa8rD7gO9onirPt+hv4lm+GqMz+0/YeZUrQKABWwmu8cvc4RxBjqP
         Ma0qCjI3L/JL5j/EAjoTg89MS3OpuMeo41P+5IDfJg/Sd9xC6KOadGb5iAtqpGNGj4JM
         2IDJNopNMMjfZXmC80kVs2Ao4g1X3PrYaDP9m/tW9y87GBWFgm7NJdaCrcsJUZgJSXFl
         VcwD6hhQNM7cDFCSHvc/lBubIBWRihWwVUS2nBZeULVpkvW3TfFa0gRXmJkyPvFpR4pd
         Rvgw==
X-Forwarded-Encrypted: i=1; AJvYcCUnuvJASr8O9KAKx5MbpgzC4Vx239kIttjAjFkIKJcG9KkAyYAazQ13cgzH9fAvapEfPpUhwoSTEUPlBey2VMoYEimmXR1Ez1NF
X-Gm-Message-State: AOJu0YzB7HjnlFzqOlwsEkqIrQtQhiBxPDFflCzMa0p3O8W2GBbDOHgr
	bHTfD0oZiHVTOjGuhEoBcXvX2gNkHhxpmms4IoPMdz+LeR+vzjX3KZx2RT93yoI=
X-Google-Smtp-Source: AGHT+IE9xnl9B6iLJUPGftImcREYfkzUqsxyaCtbYNOO7bdA0+3T64EEnX3IW7R8WIRTpy4sMb+IqA==
X-Received: by 2002:a2e:a7c3:0:b0:2e9:546c:544a with SMTP id 38308e7fff4ca-2e95b28ae5emr87639391fa.34.1716909299278;
        Tue, 28 May 2024 08:14:59 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-421089708f8sm143918715e9.20.2024.05.28.08.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 08:14:58 -0700 (PDT)
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
Subject: [PATCH 4/7] riscv: Implement xchg8/16() using Zabha
Date: Tue, 28 May 2024 17:10:49 +0200
Message-Id: <20240528151052.313031-5-alexghiti@rivosinc.com>
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

This adds runtime support for Zabha in xchg8/16() operations.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/cmpxchg.h | 24 ++++++++++++++++++++++--
 arch/riscv/include/asm/hwcap.h   |  1 +
 arch/riscv/kernel/cpufeature.c   |  1 +
 3 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index 0789fbe38b23..43696d9e13aa 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -11,8 +11,14 @@
 #include <asm/fence.h>
 #include <asm/alternative.h>
 
-#define __arch_xchg_masked(prepend, append, r, p, n)			\
+#define __arch_xchg_masked(swap_sfx, prepend, append, r, p, n)		\
 ({									\
+	__label__ zabha, end;						\
+									\
+	asm goto(ALTERNATIVE("nop", "j %[zabha]", 0,			\
+			     RISCV_ISA_EXT_ZABHA, 1)			\
+			: : : : zabha);					\
+									\
 	u32 *__ptr32b = (u32 *)((ulong)(p) & ~0x3);			\
 	ulong __s = ((ulong)(p) & (0x4 - sizeof(*p))) * BITS_PER_BYTE;	\
 	ulong __mask = GENMASK(((sizeof(*p)) * BITS_PER_BYTE) - 1, 0)	\
@@ -34,6 +40,17 @@
 	       : "memory");						\
 									\
 	r = (__typeof__(*(p)))((__retx & __mask) >> __s);		\
+	goto end;							\
+									\
+zabha:									\
+	__asm__ __volatile__ (						\
+		prepend							\
+		"	amoswap" swap_sfx " %0, %z2, %1\n"		\
+		append							\
+		: "=&r" (r), "+A" (*(p))				\
+		: "rJ" (n)						\
+		: "memory");						\
+end:									\
 })
 
 #define __arch_xchg(sfx, prepend, append, r, p, n)			\
@@ -55,8 +72,11 @@
 									\
 	switch (sizeof(*__ptr)) {					\
 	case 1:								\
+		__arch_xchg_masked(".b" sfx, prepend, append,		\
+				   __ret, __ptr, __new);		\
+		break;							\
 	case 2:								\
-		__arch_xchg_masked(prepend, append,			\
+		__arch_xchg_masked(".h" sfx, prepend, append,		\
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
index 3ed2359eae35..8d0f56dd2f53 100644
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


