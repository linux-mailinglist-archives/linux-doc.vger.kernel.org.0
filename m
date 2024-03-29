Return-Path: <linux-doc+bounces-13077-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA952891274
	for <lists+linux-doc@lfdr.de>; Fri, 29 Mar 2024 05:45:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 70E2728A6E2
	for <lists+linux-doc@lfdr.de>; Fri, 29 Mar 2024 04:45:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5C543BB36;
	Fri, 29 Mar 2024 04:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="dTb5TpmU"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238F23B794
	for <linux-doc@vger.kernel.org>; Fri, 29 Mar 2024 04:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711687515; cv=none; b=ELCUB+2+h1nNAn1uo9S8QbPsLWTtTvqfwH9hezXNr5YlTxX6Sh9wL75olQd/LyEFK0iHb+VBkH9qy53ys6gbE5axl0YFmyh/qA/v8JLlkQUlGXjN4Ttc7iz+ur4vqInD1PM+poid2psObx2WGdNcSDgTy7NBVEaFKipfIgBcw1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711687515; c=relaxed/simple;
	bh=zG0tEeBP+zvlyz5cnQr5MClbjEm8rVN8C4s+1xfpDqQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=D1FpnD4eOrF/TR7kdShZbjtT33eXZWDGQRnhBUPNUULYARxXzyvA8Wo888wqx1BrdNrkEb0QmCXAx7QpVDkLaDq4cbHXmBjqp2a3nVxu5N3cXhijWaviL+OyUrYEIB+TAs/5bmnrBJ4T1fA8zUZG4yu9o3Tfp4xx4fsmwpSOHZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=dTb5TpmU; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3c3daebabe4so1045552b6e.2
        for <linux-doc@vger.kernel.org>; Thu, 28 Mar 2024 21:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1711687513; x=1712292313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=txT/LccY8POETQDQkXcfynUkPCv6cjOV6zf46WX/Pcw=;
        b=dTb5TpmUPw7ef/9qYzYpDdie7SYJme4gr3jRsPvSkzT4PmfBFG95GBons5rIe8N3Hq
         2caUTED1gHdCKxfrfGiT5xiE3WaIJCTSwzhjXFreo6E5blO+BQCxiMqyxh6FW1c5O2B6
         luw8GRlioxxTSLmA0KFWVJ/p997w9Nzafs7h4rmY9NNRr/cWE0IPWaFdk1Kadgu6RbZt
         L4yz2L7Ld0fceVtMB3hSUyISo1lXE+ZDN6pPmfcWEERqasct2J+x6scnLXaLKP+fDnnV
         v0SkR39pDdaZYoT+lJeGO4apudmmc9haVKmR5rNdJvHvb3+s/opzSWJnw3qYlartL/dH
         Pctw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711687513; x=1712292313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=txT/LccY8POETQDQkXcfynUkPCv6cjOV6zf46WX/Pcw=;
        b=ASNgm2A4GfRqub3dJDaTAcw1Y8DLW3kg5ZkAA3My72RHCfOe0JX9aY2GKGsXtKx4l6
         kbfMWTzVMBQhljzbAvkJZ7JaUthC2Rb4xq6OMpNM+jW1JS3Es1CQoJdonzzj/awquiku
         oMmSfgC+1K63Q2WVWwqsf68jI89yVpTo1UizHo6Y1mGFC1Tcz5WbfsHo13b8LbfS8xu5
         C9eMMnQ5OaU6czlikzDtulko+JjGTO57cxG4nV0LgDHnxaVWSiPci/KUKVsjwCYDtmvD
         XRISb6cgeFuOjYMF6i0294ZUvSeJJlQIAD1yY+DPum+FOS0Rc3UcwwLcE2aF5i8Dz87p
         C2jg==
X-Forwarded-Encrypted: i=1; AJvYcCX4/Fj0/3vNtI8ujtM7b7lGAF6pGLN+M57PMQQG0a1PMzIYALau7iltdVO84ANI/IaZ1RZAbqDMGIO4Fd+XM7Qt4Iub0zPQxeCA
X-Gm-Message-State: AOJu0YwYlEGdvx2lBpu+jsSAfPnX4YE/SMr6jvh3aucl3+BFRhVkQytI
	z4f1tqoZYUQp5vfVuQXFKFlkfIp1zG6R+RQ61pDp1IIaJDAOCwkDvUA3zA8W0hA=
X-Google-Smtp-Source: AGHT+IEg1KTq7jE0OLYYVBAFrVsprg4r4Srip8vRVS899kAu1nJanfI5DM3TwMhj/+BfX0hVCMH91w==
X-Received: by 2002:a05:6808:1584:b0:3c3:e05c:f499 with SMTP id t4-20020a056808158400b003c3e05cf499mr1508075oiw.39.1711687513312;
        Thu, 28 Mar 2024 21:45:13 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id i18-20020aa78b52000000b006ea7e972947sm2217120pfd.130.2024.03.28.21.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 21:45:12 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: paul.walmsley@sifive.com,
	rick.p.edgecombe@intel.com,
	broonie@kernel.org,
	Szabolcs.Nagy@arm.com,
	kito.cheng@sifive.com,
	keescook@chromium.org,
	ajones@ventanamicro.com,
	conor.dooley@microchip.com,
	cleger@rivosinc.com,
	atishp@atishpatra.org,
	alex@ghiti.fr,
	bjorn@rivosinc.com,
	alexghiti@rivosinc.com,
	samuel.holland@sifive.com,
	palmer@sifive.com,
	conor@kernel.org,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: corbet@lwn.net,
	tech-j-ext@lists.risc-v.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	oleg@redhat.com,
	akpm@linux-foundation.org,
	arnd@arndb.de,
	ebiederm@xmission.com,
	Liam.Howlett@oracle.com,
	vbabka@suse.cz,
	lstoakes@gmail.com,
	shuah@kernel.org,
	brauner@kernel.org,
	debug@rivosinc.com,
	andy.chiu@sifive.com,
	jerry.shih@sifive.com,
	hankuan.chen@sifive.com,
	greentime.hu@sifive.com,
	evan@rivosinc.com,
	xiao.w.wang@intel.com,
	charlie@rivosinc.com,
	apatel@ventanamicro.com,
	mchitale@ventanamicro.com,
	dbarboza@ventanamicro.com,
	sameo@rivosinc.com,
	shikemeng@huaweicloud.com,
	willy@infradead.org,
	vincent.chen@sifive.com,
	guoren@kernel.org,
	samitolvanen@google.com,
	songshuaishuai@tinylab.org,
	gerg@kernel.org,
	heiko@sntech.de,
	bhe@redhat.com,
	jeeheng.sia@starfivetech.com,
	cyy@cyyself.name,
	maskray@google.com,
	ancientmodern4@gmail.com,
	mathis.salmen@matsal.de,
	cuiyunhui@bytedance.com,
	bgray@linux.ibm.com,
	mpe@ellerman.id.au,
	baruch@tkos.co.il,
	alx@kernel.org,
	david@redhat.com,
	catalin.marinas@arm.com,
	revest@chromium.org,
	josh@joshtriplett.org,
	shr@devkernel.io,
	deller@gmx.de,
	omosnace@redhat.com,
	ojeda@kernel.org,
	jhubbard@nvidia.com
Subject: [PATCH v2 01/27] riscv: envcfg save and restore on task switching
Date: Thu, 28 Mar 2024 21:44:33 -0700
Message-Id: <20240329044459.3990638-2-debug@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240329044459.3990638-1-debug@rivosinc.com>
References: <20240329044459.3990638-1-debug@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

envcfg CSR defines enabling bits for cache management instructions and soon
will control enabling for control flow integrity and pointer masking features.

Control flow integrity enabling for forward cfi and backward cfi is controlled
via envcfg and thus need to be enabled on per thread basis.

This patch creates a place holder for envcfg CSR in `thread_info` and adds
logic to save and restore on task switching.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/switch_to.h   | 10 ++++++++++
 arch/riscv/include/asm/thread_info.h |  1 +
 2 files changed, 11 insertions(+)

diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
index 7efdb0584d47..2d9a00a30394 100644
--- a/arch/riscv/include/asm/switch_to.h
+++ b/arch/riscv/include/asm/switch_to.h
@@ -69,6 +69,15 @@ static __always_inline bool has_fpu(void) { return false; }
 #define __switch_to_fpu(__prev, __next) do { } while (0)
 #endif
 
+static inline void __switch_to_envcfg(struct task_struct *next)
+{
+	register unsigned long envcfg = next->thread_info.envcfg;
+
+	asm volatile (ALTERNATIVE("nop", "csrw " __stringify(CSR_ENVCFG) ", %0", 0,
+							  RISCV_ISA_EXT_XLINUXENVCFG, 1)
+							  :: "r" (envcfg) : "memory");
+}
+
 extern struct task_struct *__switch_to(struct task_struct *,
 				       struct task_struct *);
 
@@ -80,6 +89,7 @@ do {							\
 		__switch_to_fpu(__prev, __next);	\
 	if (has_vector())					\
 		__switch_to_vector(__prev, __next);	\
+	__switch_to_envcfg(__next);				\
 	((last) = __switch_to(__prev, __next));		\
 } while (0)
 
diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
index 5d473343634b..a503bdc2f6dd 100644
--- a/arch/riscv/include/asm/thread_info.h
+++ b/arch/riscv/include/asm/thread_info.h
@@ -56,6 +56,7 @@ struct thread_info {
 	long			user_sp;	/* User stack pointer */
 	int			cpu;
 	unsigned long		syscall_work;	/* SYSCALL_WORK_ flags */
+	unsigned long envcfg;
 #ifdef CONFIG_SHADOW_CALL_STACK
 	void			*scs_base;
 	void			*scs_sp;
-- 
2.43.2


