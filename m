Return-Path: <linux-doc+bounces-7468-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89CAF83B996
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jan 2024 07:28:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AEED61C22F5F
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jan 2024 06:28:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB3FE111A1;
	Thu, 25 Jan 2024 06:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="WGeuz059"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A46F111A2
	for <linux-doc@vger.kernel.org>; Thu, 25 Jan 2024 06:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706164103; cv=none; b=apSNKxpC0+GjNGo34xzUhecPY4abGWGA6iTDRSLUxIjlTA2n2fib1YQ9+uBy84aSIwi+qqsvOBJwJM7q/nvVKblQaByX4wbhVRdQRavBdWhzOvij3um8MNyzndMBYEaGWHfXwpLY0UjWUzvAY4pr8rX5k2t/n16+ALpnMP2Ksfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706164103; c=relaxed/simple;
	bh=9+H+30KMPyCh1YcAoThxCuB9d80x0zddDEJVZVZUZoo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k+fO6bg1eABJyCUvCoVNOYpbSBwYEGhf4W6jSItsTzokB1t3dafPaYBhfozc1DQUtckMtmML5uNsUl1RJlvFQlkBf+mdOYRtmxgO80HyaxxDFnQtz3o50zynuVENFwyq71cjdbYJ9PI9NDO8jjzNj219gO6lKgj9DogZrt1wmmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=WGeuz059; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3bdb42da0e0so3234029b6e.0
        for <linux-doc@vger.kernel.org>; Wed, 24 Jan 2024 22:28:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706164101; x=1706768901; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UpWYX6cXeb3EwmSmbUmLWJ8fZpndT9qVanP1zDkk0zs=;
        b=WGeuz059B9Z7CNUInY/nBtaR+3tAYT7gRCwrfKaJIOcr3lGpa/M2ZxrOj23Cg8vfSN
         vGPHxxHrHzvQIMrh/VL+qkVSP7shRow2asqcbFfz8lWSF7SXpRb038vAEuSG+68NocGG
         3QwFxC4K+qC7VsUdSForvULS9Ir6jtpqJIUaBmyGLe9ta4tbHeodNbZ6JtYxpCLaHWa5
         X1yWDq04KFmpqjMA5I5bGhmAK1BCljJsqkL8ZlN79hBYPDck6iR+UMmHYogY4pDpbgpq
         /uY+aIJP+EhcTZXx6TqtIeVEbqOOoNXuGqOidNk0NGFxGJvwPkIkG8RLuqOaH8xt80uw
         3F8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706164101; x=1706768901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UpWYX6cXeb3EwmSmbUmLWJ8fZpndT9qVanP1zDkk0zs=;
        b=nX49a5vcR6SExzbcetEkIRxU3l+4qw09O2XzDzEbewgRhobEjya4TJUqgZP4LmWsuW
         zC5TYkxlolGruMzbmDml2C+DCMWSoMUukVUDHZ1aesXugLa0X5zI1pQEWFRNOJp4ilZL
         RMLqwSj8w6Kf7h1abuww+aGFsUVYFQC/vBTOwP88JdJqmwcJ09a9jcvbyKcpV7/jIFmV
         rMl5mMs4HnHsEpoMZVWaemtzAqXSE9ohLpVOlUVFJFSkwm+KUYW3/P/8CNgP87IRwVNU
         drPo6b5pbkuBjitnNMbB2VbIHPrwfq8ebQxAvBJ2Jzz1hb9/M8o0Kdb1PENykOxyhIjj
         IqoA==
X-Gm-Message-State: AOJu0YxsFEb2X0LzAchGI0bQW+gB1tn7FN8SoeXW0LS3DEV3XgffXxrR
	37mfqUH+iPgROw3evqTZL887NwvIP9i4wsx8SUNnU2lQjgdtMY5o4m8awoLWA7Y=
X-Google-Smtp-Source: AGHT+IEsqvMNFQpFlOYcM36mb6P72n2g5IoYJQjyFjdvM0xADABaEzJAYSqo7gQsIel9ygICs1O66Q==
X-Received: by 2002:a05:6808:3197:b0:3bd:a590:8a00 with SMTP id cd23-20020a056808319700b003bda5908a00mr578367oib.85.1706164101404;
        Wed, 24 Jan 2024 22:28:21 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id t19-20020a056a00139300b006dd870b51b8sm3201139pfg.126.2024.01.24.22.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 22:28:21 -0800 (PST)
From: debug@rivosinc.com
To: rick.p.edgecombe@intel.com,
	broonie@kernel.org,
	Szabolcs.Nagy@arm.com,
	kito.cheng@sifive.com,
	keescook@chromium.org,
	ajones@ventanamicro.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	conor.dooley@microchip.com,
	cleger@rivosinc.com,
	atishp@atishpatra.org,
	alex@ghiti.fr,
	bjorn@rivosinc.com,
	alexghiti@rivosinc.com
Cc: corbet@lwn.net,
	aou@eecs.berkeley.edu,
	oleg@redhat.com,
	akpm@linux-foundation.org,
	arnd@arndb.de,
	ebiederm@xmission.com,
	shuah@kernel.org,
	brauner@kernel.org,
	debug@rivosinc.com,
	guoren@kernel.org,
	samitolvanen@google.com,
	evan@rivosinc.com,
	xiao.w.wang@intel.com,
	apatel@ventanamicro.com,
	mchitale@ventanamicro.com,
	waylingii@gmail.com,
	greentime.hu@sifive.com,
	heiko@sntech.de,
	jszhang@kernel.org,
	shikemeng@huaweicloud.com,
	david@redhat.com,
	charlie@rivosinc.com,
	panqinglin2020@iscas.ac.cn,
	willy@infradead.org,
	vincent.chen@sifive.com,
	andy.chiu@sifive.com,
	gerg@kernel.org,
	jeeheng.sia@starfivetech.com,
	mason.huo@starfivetech.com,
	ancientmodern4@gmail.com,
	mathis.salmen@matsal.de,
	cuiyunhui@bytedance.com,
	bhe@redhat.com,
	chenjiahao16@huawei.com,
	ruscur@russell.cc,
	bgray@linux.ibm.com,
	alx@kernel.org,
	baruch@tkos.co.il,
	zhangqing@loongson.cn,
	catalin.marinas@arm.com,
	revest@chromium.org,
	josh@joshtriplett.org,
	joey.gouly@arm.com,
	shr@devkernel.io,
	omosnace@redhat.com,
	ojeda@kernel.org,
	jhubbard@nvidia.com,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [RFC PATCH v1 02/28] riscv: envcfg save and restore on trap entry/exit
Date: Wed, 24 Jan 2024 22:21:27 -0800
Message-ID: <20240125062739.1339782-3-debug@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240125062739.1339782-1-debug@rivosinc.com>
References: <20240125062739.1339782-1-debug@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Deepak Gupta <debug@rivosinc.com>

envcfg CSR defines enabling bits for cache management instructions and soon
will control enabling for control flow integrity and pointer masking features.

Control flow integrity enabling for forward cfi and backward cfi is controlled
via envcfg and thus need to be enabled on per thread basis.

This patch creates a place holder for envcfg CSR in `thread_info` and adds
logic to save and restore on trap entry and exits.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/thread_info.h | 1 +
 arch/riscv/kernel/asm-offsets.c      | 1 +
 arch/riscv/kernel/entry.S            | 4 ++++
 3 files changed, 6 insertions(+)

diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
index 574779900bfb..320bc899a63b 100644
--- a/arch/riscv/include/asm/thread_info.h
+++ b/arch/riscv/include/asm/thread_info.h
@@ -57,6 +57,7 @@ struct thread_info {
 	long			user_sp;	/* User stack pointer */
 	int			cpu;
 	unsigned long		syscall_work;	/* SYSCALL_WORK_ flags */
+	unsigned long envcfg;
 #ifdef CONFIG_SHADOW_CALL_STACK
 	void			*scs_base;
 	void			*scs_sp;
diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
index a03129f40c46..cdd8f095c30c 100644
--- a/arch/riscv/kernel/asm-offsets.c
+++ b/arch/riscv/kernel/asm-offsets.c
@@ -39,6 +39,7 @@ void asm_offsets(void)
 	OFFSET(TASK_TI_PREEMPT_COUNT, task_struct, thread_info.preempt_count);
 	OFFSET(TASK_TI_KERNEL_SP, task_struct, thread_info.kernel_sp);
 	OFFSET(TASK_TI_USER_SP, task_struct, thread_info.user_sp);
+	OFFSET(TASK_TI_ENVCFG, task_struct, thread_info.envcfg);
 #ifdef CONFIG_SHADOW_CALL_STACK
 	OFFSET(TASK_TI_SCS_SP, task_struct, thread_info.scs_sp);
 #endif
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 54ca4564a926..63c3855ba80d 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -129,6 +129,10 @@ SYM_CODE_START_NOALIGN(ret_from_exception)
 	addi s0, sp, PT_SIZE_ON_STACK
 	REG_S s0, TASK_TI_KERNEL_SP(tp)
 
+	/* restore envcfg bits for current thread */
+	REG_L s0, TASK_TI_ENVCFG(tp)
+	csrw CSR_ENVCFG, s0
+
 	/* Save the kernel shadow call stack pointer */
 	scs_save_current
 
-- 
2.43.0


