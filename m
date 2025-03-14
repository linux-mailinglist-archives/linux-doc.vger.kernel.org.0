Return-Path: <linux-doc+bounces-40900-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD93A61EDD
	for <lists+linux-doc@lfdr.de>; Fri, 14 Mar 2025 22:44:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C2F5188CC43
	for <lists+linux-doc@lfdr.de>; Fri, 14 Mar 2025 21:44:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF247212B2E;
	Fri, 14 Mar 2025 21:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="o2uTWa61"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94364211A13
	for <linux-doc@vger.kernel.org>; Fri, 14 Mar 2025 21:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741988411; cv=none; b=iDbksYKvZIxhqUK8vrduy+N/R8s60dUhb47CctiLGKjtge9Mut7rohP6n4sb7Hg76zayAKsO6lyJLmmFuQ5UczHC3AXVjt9fS1NyDgA+WzgqDIleBsUy1WQwvaCJsVDESgIGENelaQT7oiOeTAyjTRC6qzAfncW7ippsgeIoeEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741988411; c=relaxed/simple;
	bh=NNu0KVfl+doCLPAFQT7Oz1ESYLTNqUHW5G9P/tWXfKw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GH4vIy9w20Upm5D5Gv/7PSHrLpjpDRoKWtuSnyex8tMvor9yGZqAGsTbAOyGQ2GWvw9DsyAMuLMNyEqbpHbmuRSvXwDRMDcDToyrJvwMEhnf1VmQH3KcHOFbGPNiQTD1yNayjyadWXZJqPoks2o6Ns4AViNy5t1Nwspv6ADUTRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=o2uTWa61; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-22401f4d35aso50705205ad.2
        for <linux-doc@vger.kernel.org>; Fri, 14 Mar 2025 14:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741988409; x=1742593209; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N78rd5bu5L3Nb7UCylb6NhXzPkib+ej1wIZfC16ALRg=;
        b=o2uTWa61rc/nZnDdGIARQxPHRZG7dmZtZsi5sbaCiMmgCpFfYA3tUDjtb8UJHOm/CM
         zv+Vh4KwB90jicglmcQIkdKJyPdqyxZddoJA99OsoPdEdaoEEW8YhbD+jQSBoWJa1XPO
         tdjD9muDn69ow/N4NX+w6/1b5M8fmbj+v1ZQ6onWTvGpCBcpIaLJtiOH9TGQ3Ax5pUDg
         rKnXOO5j4yIaJth8kAyf9gLAuQaGkTr1M4SQbi/VTtoeu70QMEshKIBKJKaPUH3dfbc6
         JqBc63Qg+Wn3pgVnw2ALF6ar4OSrzicuviFnn/z8dk5qs38c3T0wUXik+iWIwas9rXWq
         WjYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741988409; x=1742593209;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N78rd5bu5L3Nb7UCylb6NhXzPkib+ej1wIZfC16ALRg=;
        b=UkmMzTB2md1Jo3Ro7d/6AF8z91nwlBpvVY+RZbj24A/UcnW0OX5HzybGUrFmNq52rz
         E3JqtSp/ErptzOdwp4yZp4bVmW31oDr8vf8Q/upxSok3Rx93/zDGUhMiHtF08IGo8c3u
         jvQli6Kbi3euB7V7UpvJwxsyo3RxwUYewPhVotfDm88R2vv37L3RzRx54UoyMhEvJGhG
         89LmhdcSkkG92uRSPyc4wbUmCpWkLRiukpP33N0qUTfBbmkbRhnx5JtLpR65cpVrRbcU
         yvIZw4NLTpPwGEC1z3gkquM3Ls1AO8rHF51oOonjE2KYJgYaFooE49KMVxalDREYmACr
         rb5w==
X-Forwarded-Encrypted: i=1; AJvYcCXWH+l4ZefEwb7kQbgd7XweG0Zzb7CSLpxw6fCons3OO4cDT9r3QvSucVHRqnT3lZqksmXQNFQ6f2I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxW33TrxEFXcEC8ra0bCAkiTq4+YHmPvLKX4TVl9Ayf9XNiS0sc
	3JDkApxgYx8kyTzbIEI4W1b5LnAhmRyPGE0Obhl0C+nTdiWj2yz2B7jvuQ7ymwk=
X-Gm-Gg: ASbGncvBB5pP9BcKMR79aiRdSKQ2yzrLtR5oHqVth+i7PBNQPsrGOo8EGsGznQQC+RJ
	ZsJE8jRpi7/d/SihnhTilG3jPo9i+Doim09urT7Yeefl6dNIvyJfbfLCUWofsf0Zo3MuQPnI7DA
	XyLaL9OP3Fn9cBV5xaBVfW0UZ/17s/+TRNUHgYaw0MJo6GaWVP4uJP+np6SyO+fvkQP7hoKKRP9
	0W0s7jDcPz2NO9iw4d5kTcT2sA+R68IIKlobU7ayr2ph4fZI7b7u3ggWuzfPNZ0Y8lPyCnN8Acc
	ea+7oOBDBIdBA7bAG4b3PkHI5vFHCAF0onQ8A2KdHzffrOq8vWL1sLw=
X-Google-Smtp-Source: AGHT+IFSKd+2xICbPyI9jv8e0eee8m28O0Z2xE2zkf1BJxJdHUC0s7Oxq9dFc7HadAqrreCNrCxPSg==
X-Received: by 2002:a17:902:f712:b0:223:42ca:10ef with SMTP id d9443c01a7336-225e0b09816mr52846915ad.43.1741988408934;
        Fri, 14 Mar 2025 14:40:08 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c68a6e09sm33368855ad.55.2025.03.14.14.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 14:40:08 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Fri, 14 Mar 2025 14:39:35 -0700
Subject: [PATCH v12 16/28] riscv: signal: abstract header saving for
 setup_sigcontext
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250314-v5_user_cfi_series-v12-16-e51202b53138@rivosinc.com>
References: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
In-Reply-To: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Christian Brauner <brauner@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Oleg Nesterov <oleg@redhat.com>, 
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com
X-Mailer: b4 0.14.0

From: Andy Chiu <andybnac@gmail.com>

The function save_v_state() served two purposes. First, it saved
extension context into the signal stack. Then, it constructed the
extension header if there was no fault. The second part is independent
of the extension itself. As a result, we can pull that part out, so
future extensions may reuse it. This patch adds arch_ext_list and makes
setup_sigcontext() go through all possible extensions' save() callback.
The callback returns a positive value indicating the size of the
successfully saved extension. Then the kernel proceeds to construct the
header for that extension. The kernel skips an extension if it does
not exist, or if the saving fails for some reasons. The error code is
propagated out on the later case.

This patch does not introduce any functional changes.

Signed-off-by: Andy Chiu <andybnac@gmail.com>
---
 arch/riscv/include/asm/vector.h |  3 ++
 arch/riscv/kernel/signal.c      | 62 +++++++++++++++++++++++++++--------------
 2 files changed, 44 insertions(+), 21 deletions(-)

diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index e8a83f55be2b..05390538ea8a 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -407,6 +407,9 @@ static inline bool riscv_v_vstate_ctrl_user_allowed(void) { return false; }
 #define riscv_v_thread_free(tsk)		do {} while (0)
 #define  riscv_v_setup_ctx_cache()		do {} while (0)
 #define riscv_v_thread_alloc(tsk)		do {} while (0)
+#define get_cpu_vector_context()		do {} while (0)
+#define put_cpu_vector_context()		do {} while (0)
+#define riscv_v_vstate_set_restore(task, regs)	do {} while (0)
 
 #endif /* CONFIG_RISCV_ISA_V */
 
diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
index 94e905eea1de..80c70dccf09f 100644
--- a/arch/riscv/kernel/signal.c
+++ b/arch/riscv/kernel/signal.c
@@ -68,18 +68,19 @@ static long save_fp_state(struct pt_regs *regs,
 #define restore_fp_state(task, regs) (0)
 #endif
 
-#ifdef CONFIG_RISCV_ISA_V
-
-static long save_v_state(struct pt_regs *regs, void __user **sc_vec)
+static long save_v_state(struct pt_regs *regs, void __user *sc_vec)
 {
-	struct __riscv_ctx_hdr __user *hdr;
 	struct __sc_riscv_v_state __user *state;
 	void __user *datap;
 	long err;
 
-	hdr = *sc_vec;
-	/* Place state to the user's signal context space after the hdr */
-	state = (struct __sc_riscv_v_state __user *)(hdr + 1);
+	if (!IS_ENABLED(CONFIG_RISCV_ISA_V) ||
+	    !((has_vector() || has_xtheadvector()) &&
+	    riscv_v_vstate_query(regs)))
+		return 0;
+
+	/* Place state to the user's signal context spac */
+	state = (struct __sc_riscv_v_state __user *)sc_vec;
 	/* Point datap right after the end of __sc_riscv_v_state */
 	datap = state + 1;
 
@@ -97,15 +98,11 @@ static long save_v_state(struct pt_regs *regs, void __user **sc_vec)
 	err |= __put_user((__force void *)datap, &state->v_state.datap);
 	/* Copy the whole vector content to user space datap. */
 	err |= __copy_to_user(datap, current->thread.vstate.datap, riscv_v_vsize);
-	/* Copy magic to the user space after saving  all vector conetext */
-	err |= __put_user(RISCV_V_MAGIC, &hdr->magic);
-	err |= __put_user(riscv_v_sc_size, &hdr->size);
 	if (unlikely(err))
-		return err;
+		return -EFAULT;
 
-	/* Only progress the sv_vec if everything has done successfully  */
-	*sc_vec += riscv_v_sc_size;
-	return 0;
+	/* Only return the size if everything has done successfully  */
+	return riscv_v_sc_size;
 }
 
 /*
@@ -142,10 +139,20 @@ static long __restore_v_state(struct pt_regs *regs, void __user *sc_vec)
 	 */
 	return copy_from_user(current->thread.vstate.datap, datap, riscv_v_vsize);
 }
-#else
-#define save_v_state(task, regs) (0)
-#define __restore_v_state(task, regs) (0)
-#endif
+
+struct arch_ext_priv {
+	__u32 magic;
+	long (*save)(struct pt_regs *regs, void __user *sc_vec);
+};
+
+struct arch_ext_priv arch_ext_list[] = {
+	{
+		.magic = RISCV_V_MAGIC,
+		.save = &save_v_state,
+	},
+};
+
+const size_t nr_arch_exts = ARRAY_SIZE(arch_ext_list);
 
 static long restore_sigcontext(struct pt_regs *regs,
 	struct sigcontext __user *sc)
@@ -276,7 +283,8 @@ static long setup_sigcontext(struct rt_sigframe __user *frame,
 {
 	struct sigcontext __user *sc = &frame->uc.uc_mcontext;
 	struct __riscv_ctx_hdr __user *sc_ext_ptr = &sc->sc_extdesc.hdr;
-	long err;
+	struct arch_ext_priv *arch_ext;
+	long err, i, ext_size;
 
 	/* sc_regs is structured the same as the start of pt_regs */
 	err = __copy_to_user(&sc->sc_regs, regs, sizeof(sc->sc_regs));
@@ -284,8 +292,20 @@ static long setup_sigcontext(struct rt_sigframe __user *frame,
 	if (has_fpu())
 		err |= save_fp_state(regs, &sc->sc_fpregs);
 	/* Save the vector state. */
-	if ((has_vector() || has_xtheadvector()) && riscv_v_vstate_query(regs))
-		err |= save_v_state(regs, (void __user **)&sc_ext_ptr);
+	for (i = 0; i < nr_arch_exts; i++) {
+		arch_ext = &arch_ext_list[i];
+		if (!arch_ext->save)
+			continue;
+
+		ext_size = arch_ext->save(regs, sc_ext_ptr + 1);
+		if (ext_size <= 0) {
+			err |= ext_size;
+		} else {
+			err |= __put_user(arch_ext->magic, &sc_ext_ptr->magic);
+			err |= __put_user(ext_size, &sc_ext_ptr->size);
+			sc_ext_ptr = (void *)sc_ext_ptr + ext_size;
+		}
+	}
 	/* Write zero to fp-reserved space and check it on restore_sigcontext */
 	err |= __put_user(0, &sc->sc_extdesc.reserved);
 	/* And put END __riscv_ctx_hdr at the end. */

-- 
2.34.1


