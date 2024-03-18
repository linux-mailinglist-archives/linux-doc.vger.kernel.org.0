Return-Path: <linux-doc+bounces-12227-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D72A887E78A
	for <lists+linux-doc@lfdr.de>; Mon, 18 Mar 2024 11:41:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D4CC1F2207E
	for <lists+linux-doc@lfdr.de>; Mon, 18 Mar 2024 10:41:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61D183839E;
	Mon, 18 Mar 2024 10:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="DjPZoOe5"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F9D381AF
	for <linux-doc@vger.kernel.org>; Mon, 18 Mar 2024 10:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710758428; cv=none; b=UE3Y8BMT3b5y0TogRuLeG97R6hgZ2kvTgA8TBUlAGOAWQBCsiAx2u2yD5rLUhBg0Md3RM5QZuy1RcHWCiJ8pUyx9Cp2DFoesHdHz8x3rAGGywH6mB+J5RCBkqdVBu8N+J1LZ6zqLS/ThiXW1xZC2qT16eKNFqAy0xEaRpjwGdyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710758428; c=relaxed/simple;
	bh=c0mKHM6JhjT9gcrOrnCHWK0V1B8vZTuPeHJZH6zjeik=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LFX3SXGJtcI04pznrRBG1NFLVvlIX+9t4OAAfiM8Ox4kq88ev7eXelUHpdAzILelvd37w+ST0Npv6HGz6LQRxtesvUNrakHEDGIqNPMFE9ehf0JHTO8fancPnAdccBq/fYmyg3D9G7bTTqpW2cQa4uU7h+V5sZGpFzdo+NydaWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=DjPZoOe5; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6e6afb754fcso3905773b3a.3
        for <linux-doc@vger.kernel.org>; Mon, 18 Mar 2024 03:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1710758424; x=1711363224; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1NY2q2qjf+qX0Bl4qb7tvQNwRFiikeJNi2nqvqVSChw=;
        b=DjPZoOe5MryhYmH68vJdosMjP3JOaUe4LOG6pfw2moxTY4v7cUbfexu7F0ccV/Iyjr
         i/C7gw4uEPRn7K2ys/h76Nis++3Cm1wOBkHP7brlG7lEwN//VyzuWSF1DNOMInxvrHjz
         612jQSY9Qwaz67F2N7J09Va2l5RKMyNtJrDi58E9/AXqTsukhKWGrMPSyfy/9b5FXD6V
         JG4ju3vvOejeUxjF1vcTpV1XKU4Bnhs7DUC+bJCVz/o7yoLScSBnUYRv+BJbL0W7ATRk
         HADPZoNdAJobad4chtLnt/RAlOeSJXvFJoWVzJZrLALmUY60+8EdbO3hmrLj6Rzsv3Ok
         VOGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710758424; x=1711363224;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1NY2q2qjf+qX0Bl4qb7tvQNwRFiikeJNi2nqvqVSChw=;
        b=NFvugMU2QCgvsfMouQz8e6H1w2DgsvCuEEhg31zON6hq5y6nV5lcPe3uttPyI+kgEK
         ACQD+O6ZRKrTeq7ZBp1X182VOMrY3VXhgkIvhFKgLjUJdmC3lZjFJDxBYpdS8FScztfE
         aZj3wQbJXyGrBXWnrA4VrMBNxekDRC8rhGvdl1IhIi+7BxZ/hf9Jt4AUucx+1Ygug4Dn
         qn8qiXs79V1m7taHY2E8FKynNYIJcupB9Ho1vszz92euEmm0z5kKdHrl6W8Tb8wUGVpN
         FPdArrHTbBszsWoxUQpptA2cN77bkozIvF8ItHgRdVFf+KGnL2R4sjY86iHAQMpSShO8
         x9sw==
X-Forwarded-Encrypted: i=1; AJvYcCVfferJW31ppD2GnskI3B5zKPOFqLQ/+pt/kEVS/fDYMlLh+uUS3+wvIRee7KunnMbazNgofn4kq0YFKfSD6HFgHy5+y+7etWZa
X-Gm-Message-State: AOJu0Yzu82fxnBFzZggWKFH6lSGP97LToOksX8AM7h0jiKwL1na6+esp
	Oto72XByt0h7j06OLpwEY2GSRXGSrLQvyxxvUqGhw6tzJBQ0O0fWrlpapWXU+rA=
X-Google-Smtp-Source: AGHT+IG/ljXBt6etz+CajHKfI8kcBtP/QD3vvPTQt3h32zyOcUoA3Mz6tSLTZ+lgGc8VmbeeNLbphg==
X-Received: by 2002:a05:6a00:1813:b0:6e6:9c97:c712 with SMTP id y19-20020a056a00181300b006e69c97c712mr16122221pfa.22.1710758424279;
        Mon, 18 Mar 2024 03:40:24 -0700 (PDT)
Received: from [127.0.1.1] (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id c11-20020a056a00008b00b006e647716b6esm7838969pfj.149.2024.03.18.03.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 03:40:23 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
Date: Mon, 18 Mar 2024 18:40:00 +0800
Subject: [PATCH v3 7/7] riscv: vector: adjust minimum Vector requirement to
 ZVE32X
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240318-zve-detection-v3-7-e12d42107fa8@sifive.com>
References: <20240318-zve-detection-v3-0-e12d42107fa8@sifive.com>
In-Reply-To: <20240318-zve-detection-v3-0-e12d42107fa8@sifive.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Andy Chiu <andy.chiu@sifive.com>, Vincent Chen <vincent.chen@sifive.com>, 
 Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor.dooley@microchip.com>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Palmer Dabbelt <palmer@rivosinc.com>, 
 Greentime Hu <greentime.hu@sifive.com>, Guo Ren <guoren@kernel.org>, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
 Joel Granados <j.granados@samsung.com>
X-Mailer: b4 0.13-dev-a684c

Make has_vector take one argument. This argument represents the minimum
Vector subextension that the following Vector actions assume.

Also, change riscv_v_first_use_handler(), and boot code that calls
riscv_v_setup_vsize() to accept the minimum Vector sub-extension,
ZVE32X.

Most kernel/user interfaces requires minimum of ZVE32X. Thus, programs
compiled and run with ZVE32X should be supported by the kernel on most
aspects. This includes context-switch, signal, ptrace, prctl, and
hwprobe.

One exception is that ELF_HWCAP returns 'V' only if full V is supported
on the platform. This means that the system without a full V must not
rely on ELF_HWCAP to tell whether it is allowable to execute Vector
without first invoking a prctl() check.

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
Acked-by: Joel Granados <j.granados@samsung.com>
---
Changelog v2:
 - update the comment in hwprobe.
---
 arch/riscv/include/asm/switch_to.h     |  2 +-
 arch/riscv/include/asm/vector.h        | 21 ++++++++++++++-------
 arch/riscv/include/asm/xor.h           |  2 +-
 arch/riscv/kernel/cpufeature.c         |  5 ++++-
 arch/riscv/kernel/kernel_mode_vector.c |  4 ++--
 arch/riscv/kernel/process.c            |  4 ++--
 arch/riscv/kernel/signal.c             |  6 +++---
 arch/riscv/kernel/smpboot.c            |  2 +-
 arch/riscv/kernel/sys_hwprobe.c        |  8 ++++++--
 arch/riscv/kernel/vector.c             | 15 +++++++++------
 arch/riscv/lib/uaccess.S               |  2 +-
 11 files changed, 44 insertions(+), 27 deletions(-)

diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
index 7efdb0584d47..df1adf196c4f 100644
--- a/arch/riscv/include/asm/switch_to.h
+++ b/arch/riscv/include/asm/switch_to.h
@@ -78,7 +78,7 @@ do {							\
 	struct task_struct *__next = (next);		\
 	if (has_fpu())					\
 		__switch_to_fpu(__prev, __next);	\
-	if (has_vector())					\
+	if (has_vector(ZVE32X))			\
 		__switch_to_vector(__prev, __next);	\
 	((last) = __switch_to(__prev, __next));		\
 } while (0)
diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index 731dcd0ed4de..b96750493dfb 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -18,6 +18,7 @@
 #include <asm/cpufeature.h>
 #include <asm/csr.h>
 #include <asm/asm.h>
+#include <asm/bug.h>
 
 extern unsigned long riscv_v_vsize;
 int riscv_v_setup_vsize(void);
@@ -35,10 +36,16 @@ static inline u32 riscv_v_flags(void)
 	return READ_ONCE(current->thread.riscv_v_flags);
 }
 
-static __always_inline bool has_vector(void)
-{
-	return riscv_has_extension_unlikely(RISCV_ISA_EXT_v);
-}
+#define has_vector(VEXT)						\
+({									\
+	static_assert(RISCV_ISA_EXT_##VEXT == RISCV_ISA_EXT_ZVE32X ||	\
+		      RISCV_ISA_EXT_##VEXT == RISCV_ISA_EXT_ZVE32F ||	\
+		      RISCV_ISA_EXT_##VEXT == RISCV_ISA_EXT_ZVE64X ||	\
+		      RISCV_ISA_EXT_##VEXT == RISCV_ISA_EXT_ZVE64F ||	\
+		      RISCV_ISA_EXT_##VEXT == RISCV_ISA_EXT_ZVE64D ||	\
+		      RISCV_ISA_EXT_##VEXT == RISCV_ISA_EXT_v);		\
+	riscv_has_extension_unlikely(RISCV_ISA_EXT_##VEXT);		\
+})
 
 static inline void __riscv_v_vstate_clean(struct pt_regs *regs)
 {
@@ -131,7 +138,7 @@ static inline void __riscv_v_vstate_restore(struct __riscv_v_ext_state *restore_
 	riscv_v_enable();
 	asm volatile (
 		".option push\n\t"
-		".option arch, +v\n\t"
+		".option arch, +zve32x\n\t"
 		"vsetvli	%0, x0, e8, m8, ta, ma\n\t"
 		"vle8.v		v0, (%1)\n\t"
 		"add		%1, %1, %0\n\t"
@@ -153,7 +160,7 @@ static inline void __riscv_v_vstate_discard(void)
 	riscv_v_enable();
 	asm volatile (
 		".option push\n\t"
-		".option arch, +v\n\t"
+		".option arch, +zve32x\n\t"
 		"vsetvli	%0, x0, e8, m8, ta, ma\n\t"
 		"vmv.v.i	v0, -1\n\t"
 		"vmv.v.i	v8, -1\n\t"
@@ -267,7 +274,7 @@ bool riscv_v_vstate_ctrl_user_allowed(void);
 struct pt_regs;
 
 static inline int riscv_v_setup_vsize(void) { return -EOPNOTSUPP; }
-static __always_inline bool has_vector(void) { return false; }
+static __always_inline bool has_vector(unsigned long min_sub_ext) { return false; }
 static inline bool riscv_v_first_use_handler(struct pt_regs *regs) { return false; }
 static inline bool riscv_v_vstate_query(struct pt_regs *regs) { return false; }
 static inline bool riscv_v_vstate_ctrl_user_allowed(void) { return false; }
diff --git a/arch/riscv/include/asm/xor.h b/arch/riscv/include/asm/xor.h
index 96011861e46b..46042ef5a2f7 100644
--- a/arch/riscv/include/asm/xor.h
+++ b/arch/riscv/include/asm/xor.h
@@ -61,7 +61,7 @@ static struct xor_block_template xor_block_rvv = {
 	do {        \
 		xor_speed(&xor_block_8regs);    \
 		xor_speed(&xor_block_32regs);    \
-		if (has_vector()) { \
+		if (has_vector(ZVE32X)) { \
 			xor_speed(&xor_block_rvv);\
 		} \
 	} while (0)
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 6e294a35a4b0..3e2a62873f55 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -690,12 +690,15 @@ void __init riscv_fill_hwcap(void)
 		elf_hwcap &= ~COMPAT_HWCAP_ISA_F;
 	}
 
-	if (elf_hwcap & COMPAT_HWCAP_ISA_V) {
+	if (__riscv_isa_extension_available(NULL, RISCV_ISA_EXT_ZVE32X)) {
 		/*
 		 * This callsite can't fail here. It cannot fail when called on
 		 * the boot hart.
 		 */
 		riscv_v_setup_vsize();
+	}
+
+	if (elf_hwcap & COMPAT_HWCAP_ISA_V) {
 		/*
 		 * ISA string in device tree might have 'v' flag, but
 		 * CONFIG_RISCV_ISA_V is disabled in kernel.
diff --git a/arch/riscv/kernel/kernel_mode_vector.c b/arch/riscv/kernel/kernel_mode_vector.c
index 6afe80c7f03a..0d4d1a03d1c7 100644
--- a/arch/riscv/kernel/kernel_mode_vector.c
+++ b/arch/riscv/kernel/kernel_mode_vector.c
@@ -208,7 +208,7 @@ void kernel_vector_begin(void)
 {
 	bool nested = false;
 
-	if (WARN_ON(!has_vector()))
+	if (WARN_ON(!has_vector(ZVE32X)))
 		return;
 
 	BUG_ON(!may_use_simd());
@@ -236,7 +236,7 @@ EXPORT_SYMBOL_GPL(kernel_vector_begin);
  */
 void kernel_vector_end(void)
 {
-	if (WARN_ON(!has_vector()))
+	if (WARN_ON(!has_vector(ZVE32X)))
 		return;
 
 	riscv_v_disable();
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 92922dbd5b5c..919e72f9fff6 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -178,7 +178,7 @@ void flush_thread(void)
 void arch_release_task_struct(struct task_struct *tsk)
 {
 	/* Free the vector context of datap. */
-	if (has_vector())
+	if (has_vector(ZVE32X))
 		riscv_v_thread_free(tsk);
 }
 
@@ -225,7 +225,7 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 		p->thread.s[0] = 0;
 	}
 	p->thread.riscv_v_flags = 0;
-	if (has_vector())
+	if (has_vector(ZVE32X))
 		riscv_v_thread_alloc(p);
 	p->thread.ra = (unsigned long)ret_from_fork;
 	p->thread.sp = (unsigned long)childregs; /* kernel sp */
diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
index 501e66debf69..a96e6e969a3f 100644
--- a/arch/riscv/kernel/signal.c
+++ b/arch/riscv/kernel/signal.c
@@ -188,7 +188,7 @@ static long restore_sigcontext(struct pt_regs *regs,
 
 			return 0;
 		case RISCV_V_MAGIC:
-			if (!has_vector() || !riscv_v_vstate_query(regs) ||
+			if (!has_vector(ZVE32X) || !riscv_v_vstate_query(regs) ||
 			    size != riscv_v_sc_size)
 				return -EINVAL;
 
@@ -210,7 +210,7 @@ static size_t get_rt_frame_size(bool cal_all)
 
 	frame_size = sizeof(*frame);
 
-	if (has_vector()) {
+	if (has_vector(ZVE32X)) {
 		if (cal_all || riscv_v_vstate_query(task_pt_regs(current)))
 			total_context_size += riscv_v_sc_size;
 	}
@@ -283,7 +283,7 @@ static long setup_sigcontext(struct rt_sigframe __user *frame,
 	if (has_fpu())
 		err |= save_fp_state(regs, &sc->sc_fpregs);
 	/* Save the vector state. */
-	if (has_vector() && riscv_v_vstate_query(regs))
+	if (has_vector(ZVE32X) && riscv_v_vstate_query(regs))
 		err |= save_v_state(regs, (void __user **)&sc_ext_ptr);
 	/* Write zero to fp-reserved space and check it on restore_sigcontext */
 	err |= __put_user(0, &sc->sc_extdesc.reserved);
diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index 1f86ee10192f..4eb36d75f091 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -218,7 +218,7 @@ asmlinkage __visible void smp_callin(void)
 	struct mm_struct *mm = &init_mm;
 	unsigned int curr_cpuid = smp_processor_id();
 
-	if (has_vector()) {
+	if (has_vector(ZVE32X)) {
 		/*
 		 * Return as early as possible so the hart with a mismatching
 		 * vlen won't boot.
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index c8219b82fbfc..e7c3fcac62a1 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -69,7 +69,7 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 	if (riscv_isa_extension_available(NULL, c))
 		pair->value |= RISCV_HWPROBE_IMA_C;
 
-	if (has_vector())
+	if (has_vector(v))
 		pair->value |= RISCV_HWPROBE_IMA_V;
 
 	/*
@@ -112,7 +112,11 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 		EXT_KEY(ZACAS);
 		EXT_KEY(ZICOND);
 
-		if (has_vector()) {
+		/*
+		 *  Vector crypto and ZVE* extensions are supported only if
+		 *  kernel has minimum V support of ZVE32X.
+		 */
+		if (has_vector(ZVE32X)) {
 			EXT_KEY(ZVE32X);
 			EXT_KEY(ZVE32F);
 			EXT_KEY(ZVE64X);
diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
index 6727d1d3b8f2..e8a47fa72351 100644
--- a/arch/riscv/kernel/vector.c
+++ b/arch/riscv/kernel/vector.c
@@ -53,7 +53,7 @@ int riscv_v_setup_vsize(void)
 
 void __init riscv_v_setup_ctx_cache(void)
 {
-	if (!has_vector())
+	if (!has_vector(ZVE32X))
 		return;
 
 	riscv_v_user_cachep = kmem_cache_create_usercopy("riscv_vector_ctx",
@@ -173,8 +173,11 @@ bool riscv_v_first_use_handler(struct pt_regs *regs)
 	u32 __user *epc = (u32 __user *)regs->epc;
 	u32 insn = (u32)regs->badaddr;
 
+	if (!has_vector(ZVE32X))
+		return false;
+
 	/* Do not handle if V is not supported, or disabled */
-	if (!(ELF_HWCAP & COMPAT_HWCAP_ISA_V))
+	if (!riscv_v_vstate_ctrl_user_allowed())
 		return false;
 
 	/* If V has been enabled then it is not the first-use trap */
@@ -213,7 +216,7 @@ void riscv_v_vstate_ctrl_init(struct task_struct *tsk)
 	bool inherit;
 	int cur, next;
 
-	if (!has_vector())
+	if (!has_vector(ZVE32X))
 		return;
 
 	next = riscv_v_ctrl_get_next(tsk);
@@ -235,7 +238,7 @@ void riscv_v_vstate_ctrl_init(struct task_struct *tsk)
 
 long riscv_v_vstate_ctrl_get_current(void)
 {
-	if (!has_vector())
+	if (!has_vector(ZVE32X))
 		return -EINVAL;
 
 	return current->thread.vstate_ctrl & PR_RISCV_V_VSTATE_CTRL_MASK;
@@ -246,7 +249,7 @@ long riscv_v_vstate_ctrl_set_current(unsigned long arg)
 	bool inherit;
 	int cur, next;
 
-	if (!has_vector())
+	if (!has_vector(ZVE32X))
 		return -EINVAL;
 
 	if (arg & ~PR_RISCV_V_VSTATE_CTRL_MASK)
@@ -296,7 +299,7 @@ static struct ctl_table riscv_v_default_vstate_table[] = {
 
 static int __init riscv_v_sysctl_init(void)
 {
-	if (has_vector())
+	if (has_vector(ZVE32X))
 		if (!register_sysctl("abi", riscv_v_default_vstate_table))
 			return -EINVAL;
 	return 0;
diff --git a/arch/riscv/lib/uaccess.S b/arch/riscv/lib/uaccess.S
index bc22c078aba8..bbe143bb32a0 100644
--- a/arch/riscv/lib/uaccess.S
+++ b/arch/riscv/lib/uaccess.S
@@ -14,7 +14,7 @@
 
 SYM_FUNC_START(__asm_copy_to_user)
 #ifdef CONFIG_RISCV_ISA_V
-	ALTERNATIVE("j fallback_scalar_usercopy", "nop", 0, RISCV_ISA_EXT_v, CONFIG_RISCV_ISA_V)
+	ALTERNATIVE("j fallback_scalar_usercopy", "nop", 0, RISCV_ISA_EXT_ZVE32X, CONFIG_RISCV_ISA_V)
 	REG_L	t0, riscv_v_usercopy_threshold
 	bltu	a2, t0, fallback_scalar_usercopy
 	tail enter_vector_usercopy

-- 
2.44.0.rc2


