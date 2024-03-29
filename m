Return-Path: <linux-doc+bounces-13094-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A15C8912CE
	for <lists+linux-doc@lfdr.de>; Fri, 29 Mar 2024 05:50:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F0155B235A4
	for <lists+linux-doc@lfdr.de>; Fri, 29 Mar 2024 04:50:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D6FC53E37;
	Fri, 29 Mar 2024 04:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="CCcy0prC"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60354535C6
	for <linux-doc@vger.kernel.org>; Fri, 29 Mar 2024 04:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711687607; cv=none; b=h17Dt+XFP5v3PG28guGg/AIybDzVFxewxKVV/3ERbo1j66f8jMuS3/kkZ9/hGCFOSOvLWetVjlEGWQY+++GzHIZGS4C2UoG0aDCh89a6JniSPicaKgVTK72BbURkuZraAneebZWz/mYcbYm1m3Io0d8LNHO7E6FP0Xz0t570Mas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711687607; c=relaxed/simple;
	bh=qimup50j+V8JKHaNbh76WWb3QvcWQzAGL15MFJ6brrA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ON4Dpa9v0ZCMslbXr72SPpK1kb+pNhrNcYJ7njO0a7F/T2jo9WvLTKXGtSkhicz9Ad7ER7chDoojCeSEf0HBeF3/H4sB71trQ2LMCp3xIT7SIOPlhCpCH13O0WvF6imjXUu8ZFFlKwFGI1RSdzjuAFfAsXeMEJjNyhtKUvM3PHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=CCcy0prC; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3bd4e6a7cb0so964960b6e.3
        for <linux-doc@vger.kernel.org>; Thu, 28 Mar 2024 21:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1711687603; x=1712292403; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YmrHp67H+XCJtaWoTSn26HwuzF4qGVlhViFutzTbJ64=;
        b=CCcy0prCYhQje7gSwOzRsAo23gFG3n2N5YhtTnhusM2/95IfVwGUNbN0yaKmq4KLMU
         HM/ALTeFi6uX47PNZPKA0ISDrt/jew9+xy9iZ0Hfgyu1isVIb34QVXsqYGQau5f0L+U+
         j3DbvOXYqB3Dsxx4cww9QGuWgLCrsUalpGvZNayDlnlcQtPy0+F/8zzGDPngZKJ/yVeN
         g+Hd+RxDERMzTcsTS67tBYf8stuuAG8lojs/j9or38SFDfkYElMca4S9CiJpqfwwYkJA
         /VNppw3WxpL5RPcT2UeMEMVbWjt06CPYcw4clM1qoGv9Po++f8WJwfAyri5/hP5obwvu
         X+wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711687603; x=1712292403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YmrHp67H+XCJtaWoTSn26HwuzF4qGVlhViFutzTbJ64=;
        b=dWTgZlHBmflSnPWRuOMU6E2rIfmhMnhPuszItjAPzouFCGaQmpsJWRrcRm1U9dtNbt
         e7nHoKYEZqX0800iJHIPpKJ/LNci2+obStatO2yanioF30csQe9mpze8RY9DRCNHuK7d
         WdojVKivhbs5bQVvhGpmJ0AkIMBIlE+nhBXmmx1wwTdL/xn7xdEJi46WkRvdQjW8lrK5
         IB62C2PlzMKmxTqN+KZCpOhob7s2aiZz48RnnOY4BRzo7gz4XhypCBIQls41y1sE3PUp
         Z0mejebogky2Zmg8XWBe9Qoo/b4/duh9nI/x0nmwD0+lLptIjgI3+gvzp+AOh9cj1bdn
         CLvA==
X-Forwarded-Encrypted: i=1; AJvYcCWnrN+ICQLEyIWKZN1Z91IMsVFHpkpkYp1rhpQtc7yKKFiNghJ8iSD5E7ftAZQzCzVpsxxFtUrCoHrHOjguEOXnqS1HNMIz6cpz
X-Gm-Message-State: AOJu0YyGdCLR0LL1sJXis62GTVjV9xgIgKV1BaYX0gWO/pCHgPPqit+B
	BmJQwJAnlGN1hT7XI4Tf6P9+QpyryMzPg1YmA6IAZlX8qou546MWS3bY0uaO2jA=
X-Google-Smtp-Source: AGHT+IGNXVgsJhuruVdNoXrAX5QvhHzDZ/ypkAvKiPh6A+vsQQkyT8+weoD2+0apPvMAl8Da1TUaIg==
X-Received: by 2002:a05:6808:648f:b0:3c3:d72b:3851 with SMTP id fh15-20020a056808648f00b003c3d72b3851mr1338208oib.7.1711687603411;
        Thu, 28 Mar 2024 21:46:43 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id i18-20020aa78b52000000b006ea7e972947sm2217120pfd.130.2024.03.28.21.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 21:46:43 -0700 (PDT)
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
Subject: [PATCH v2 18/27] riscv: Implements arch argnostic indirect branch tracking prctls
Date: Thu, 28 Mar 2024 21:44:50 -0700
Message-Id: <20240329044459.3990638-19-debug@rivosinc.com>
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

prctls implemented are PR_SET_INDIR_BR_LP_STATUS / PR_GET_INDIR_BR_LP_STATUS
and PR_LOCK_INDIR_BR_LP_STATUS.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/usercfi.h | 22 ++++++++-
 arch/riscv/kernel/process.c      |  5 +++
 arch/riscv/kernel/usercfi.c      | 76 ++++++++++++++++++++++++++++++++
 3 files changed, 102 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/usercfi.h b/arch/riscv/include/asm/usercfi.h
index a168ae0fa5d8..8accdc8ec164 100644
--- a/arch/riscv/include/asm/usercfi.h
+++ b/arch/riscv/include/asm/usercfi.h
@@ -16,7 +16,9 @@ struct kernel_clone_args;
 struct cfi_status {
 	unsigned long ubcfi_en : 1; /* Enable for backward cfi. */
 	unsigned long ubcfi_locked : 1;
-	unsigned long rsvd : ((sizeof(unsigned long)*8) - 2);
+	unsigned long ufcfi_en : 1; /* Enable for forward cfi. Note that ELP goes in sstatus */
+	unsigned long ufcfi_locked : 1;
+	unsigned long rsvd : ((sizeof(unsigned long)*8) - 4);
 	unsigned long user_shdw_stk; /* Current user shadow stack pointer */
 	unsigned long shdw_stk_base; /* Base address of shadow stack */
 	unsigned long shdw_stk_size; /* size of shadow stack */
@@ -30,6 +32,9 @@ void set_active_shstk(struct task_struct *task, unsigned long shstk_addr);
 bool is_shstk_enabled(struct task_struct *task);
 bool is_shstk_locked(struct task_struct *task);
 void set_shstk_status(struct task_struct *task, bool enable);
+bool is_indir_lp_enabled(struct task_struct *task);
+bool is_indir_lp_locked(struct task_struct *task);
+void set_indir_lp_status(struct task_struct *task, bool enable);
 
 #define PR_SHADOW_STACK_SUPPORTED_STATUS_MASK (PR_SHADOW_STACK_ENABLE)
 
@@ -72,6 +77,21 @@ static inline void set_shstk_status(struct task_struct *task, bool enable)
 
 }
 
+static inline bool is_indir_lp_enabled(struct task_struct *task)
+{
+	return false;
+}
+
+static inline bool is_indir_lp_locked(struct task_struct *task)
+{
+	return false;
+}
+
+static inline void set_indir_lp_status(struct task_struct *task, bool enable)
+{
+
+}
+
 #endif /* CONFIG_RISCV_USER_CFI */
 
 #endif /* __ASSEMBLY__ */
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index d6dfef22c274..105ceb8880c1 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -152,6 +152,11 @@ void start_thread(struct pt_regs *regs, unsigned long pc,
 	set_shstk_status(current, false);
 	set_shstk_base(current, 0, 0);
 	set_active_shstk(current, 0);
+	/*
+	 * disable indirect branch tracking on exec.
+	 * libc will enable it later via prctl.
+	 */
+	set_indir_lp_status(current, false);
 
 #ifdef CONFIG_64BIT
 	regs->status &= ~SR_UXL;
diff --git a/arch/riscv/kernel/usercfi.c b/arch/riscv/kernel/usercfi.c
index cdedf1f78b3e..13920b9d86f3 100644
--- a/arch/riscv/kernel/usercfi.c
+++ b/arch/riscv/kernel/usercfi.c
@@ -69,6 +69,32 @@ void set_shstk_lock(struct task_struct *task)
 	task->thread_info.user_cfi_state.ubcfi_locked = 1;
 }
 
+bool is_indir_lp_enabled(struct task_struct *task)
+{
+	return task->thread_info.user_cfi_state.ufcfi_en ? true : false;
+}
+
+bool is_indir_lp_locked(struct task_struct *task)
+{
+	return task->thread_info.user_cfi_state.ufcfi_locked ? true : false;
+}
+
+void set_indir_lp_status(struct task_struct *task, bool enable)
+{
+	task->thread_info.user_cfi_state.ufcfi_en = enable ? 1 : 0;
+
+	if (enable)
+		task->thread_info.envcfg |= ENVCFG_LPE;
+	else
+		task->thread_info.envcfg &= ~ENVCFG_LPE;
+
+	csr_write(CSR_ENVCFG, task->thread_info.envcfg);
+}
+
+void set_indir_lp_lock(struct task_struct *task)
+{
+	task->thread_info.user_cfi_state.ufcfi_locked = 1;
+}
 /*
  * If size is 0, then to be compatible with regular stack we want it to be as big as
  * regular stack. Else PAGE_ALIGN it and return back
@@ -375,3 +401,53 @@ int arch_lock_shadow_stack_status(struct task_struct *task,
 
 	return 0;
 }
+
+int arch_get_indir_br_lp_status(struct task_struct *t, unsigned long __user *status)
+{
+	unsigned long fcfi_status = 0;
+
+	if (!cpu_supports_indirect_br_lp_instr())
+		return -EINVAL;
+
+	/* indirect branch tracking is enabled on the task or not */
+	fcfi_status |= (is_indir_lp_enabled(t) ? PR_INDIR_BR_LP_ENABLE : 0);
+
+	return copy_to_user(status, &fcfi_status, sizeof(fcfi_status)) ? -EFAULT : 0;
+}
+
+int arch_set_indir_br_lp_status(struct task_struct *t, unsigned long status)
+{
+	bool enable_indir_lp = false;
+
+	if (!cpu_supports_indirect_br_lp_instr())
+		return -EINVAL;
+
+	/* indirect branch tracking is locked and further can't be modified by user */
+	if (is_indir_lp_locked(t))
+		return -EINVAL;
+
+	/* Reject unknown flags */
+	if (status & ~PR_INDIR_BR_LP_ENABLE)
+		return -EINVAL;
+
+	enable_indir_lp = (status & PR_INDIR_BR_LP_ENABLE) ? true : false;
+	set_indir_lp_status(t, enable_indir_lp);
+
+	return 0;
+}
+
+int arch_lock_indir_br_lp_status(struct task_struct *task,
+				unsigned long arg)
+{
+	/*
+	 * If indirect branch tracking is not supported or not enabled on task,
+	 * nothing to lock here
+	 */
+	if (!cpu_supports_indirect_br_lp_instr() ||
+		!is_indir_lp_enabled(task))
+		return -EINVAL;
+
+	set_indir_lp_lock(task);
+
+	return 0;
+}
-- 
2.43.2


