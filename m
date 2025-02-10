Return-Path: <linux-doc+bounces-37667-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2945DA2FA87
	for <lists+linux-doc@lfdr.de>; Mon, 10 Feb 2025 21:34:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 633FC1882FAC
	for <lists+linux-doc@lfdr.de>; Mon, 10 Feb 2025 20:35:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7487261366;
	Mon, 10 Feb 2025 20:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="JXjXcct/"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9785260A39
	for <linux-doc@vger.kernel.org>; Mon, 10 Feb 2025 20:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739219256; cv=none; b=LOZLoD1dD5ouHJ5BpfxSDNczmazmXLVIrsnts8emRXen/F7bSh5IxtYNbQuxKE3b+2iEGOfcFSv1i+N14dHs72KAc9AzGuZjceH/lCsOhgaL57ekRhFPlH/LYpy4uN0PkURiKiXxuXA12xdMPN/F1FwDEOae/Xts0PiftDbQzLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739219256; c=relaxed/simple;
	bh=eLCcCnwX3oMrnR0hoKevVmuVrExvCA/E4+w0/d6DmO4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ad4U+Oxlrcck8lLizVgM1FXV5SO0poKBGale1xXoJl0Iff68oRgBEnFwwE0BsE9JnNvjw6KUbTTqNfejpvbYS4qXMxMMfAKT160++Jcjht0bsCd9GflhC05L9ujBm09O2JPjluWQEaQElc5KyYTYUUwcfLE3Qbicz5Jhtggt0Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=JXjXcct/; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21f48ab13d5so77669105ad.0
        for <linux-doc@vger.kernel.org>; Mon, 10 Feb 2025 12:27:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739219254; x=1739824054; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YHkNmM6XuphgUqeYDdwRc1f9MaOV9mSfy6OUDBv2dEo=;
        b=JXjXcct/M7+3C5OAO5IyO4KuW7LNd3Ml72k2vFuFTDkSaq1gUBcHZrrdZPtwIpmydo
         JNCWkTwVsozE9g2eehhltPQZy2U2UTHogtmBnGtqsJFFntz+9Z8voRnGFPJdaywq4dkG
         lxTgJiJaUvEt7VByaYbVUzmh7xzl7QJ572JHWvjdVPa7vTfO5mEWU+ocALmUhjDI5LQJ
         Kp6DDFGXOTG+Wi62/EgArBxSwtnmOB4X6yF0tNAlRg7Eu8hz0a6Gla2DxRVvmLyqqGh5
         PB6uB3hDoiiegX9nuYhRa8X+1a4OVWPDgFqjoN0aKXWY2ILsokF96TJO4mnXN32RXrbn
         VzOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739219254; x=1739824054;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YHkNmM6XuphgUqeYDdwRc1f9MaOV9mSfy6OUDBv2dEo=;
        b=sa+vrGnv/6rs00k3EVKv99bfUOLdEpk/1snoF0Is56O9CuyMofix4RVYr+WpItxFWl
         feUKkaDCjlGugjSyFUnqmSWK/ielVKP18M5A0mLPBQHLzRjVzIpLLyUkz18nO252mf2o
         M6LKSPkO/17VeiH+wjs+mz+HCTSVcZXbVZWLoowvz0NOVbp9bAFtXyDFh5u3M5eMgybb
         x660szM/VgMpG8bvgjwoppMMYvHDveqVshtNpfSwRzwmIi7Z6U4/53lKaeV0KxjIBAbB
         g0fZSejqSVS9XBzkQvF0J4EVRGpKVpS+muJEqeS1W875/lYBB8t4u+JUiDzl29/s1nyk
         7pKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVh+/1JQ2RLM7rrE9z6q+Dx1TYJI6XQ78X9krLjV4KbVRHTEwoT6zN45VPF4k9q3AHUjHF6b0g0n8Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZVrYu2hY31I9h7Ex9VfpWBMPAp10O5KINPrvstAbn3hPOeXIK
	hvqjBSTvCqsuNI2O0bZMgrinVbAOUazhN6Mnemg1jQohD3BtAXT93ccDRC0xLKI=
X-Gm-Gg: ASbGncuDMo8HejtiqwFatErHPiZLBMdtU2ru8FbjhFno5b0+IInTufPdjZMGkMJSKWz
	K99xsGIMhDIgoiBKkMRNlZyFgcHE+Yf7kTkA1dLm+RQJ0wP9Lc0Hpf4KONEzEc8S40l71xpDT+6
	x52lbc5e82C256R7Vrcd1FnzmM1ZrF8Qh2NzkgB+aEJQMqpcdSxSDbWA1N28LIexWyDUtX+FP6v
	sn72tdEbYIgTLN5J2hQOpr2HpaLY4UEuZcO0rZ47sUl4ltUVBPRmuMKufccLqN34GyBjNA1k2bS
	BhM0udsaX6c6HGbdnoQF+mVz7w==
X-Google-Smtp-Source: AGHT+IFdaxFBkgdagf7y3zqU2s2u/Xx2zJIy3i8Z2j6IzHAvWKa52jNah2tWLGP7hmgNkKb4ANZukA==
X-Received: by 2002:a17:903:230e:b0:21f:7671:a45f with SMTP id d9443c01a7336-21f7671a6c6mr168719375ad.28.1739219254463;
        Mon, 10 Feb 2025 12:27:34 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3687c187sm83711555ad.168.2025.02.10.12.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 12:27:34 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 10 Feb 2025 12:26:54 -0800
Subject: [PATCH v10 21/27] riscv: enable kernel access to shadow stack
 memory via FWFT sbi call
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-v5_user_cfi_series-v10-21-163dcfa31c60@rivosinc.com>
References: <20250210-v5_user_cfi_series-v10-0-163dcfa31c60@rivosinc.com>
In-Reply-To: <20250210-v5_user_cfi_series-v10-0-163dcfa31c60@rivosinc.com>
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
 rick.p.edgecombe@intel.com, Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.14.0

Kernel will have to perform shadow stack operations on user shadow stack.
Like during signal delivery and sigreturn, shadow stack token must be
created and validated respectively. Thus shadow stack access for kernel
must be enabled.

In future when kernel shadow stacks are enabled for linux kernel, it must
be enabled as early as possible for better coverage and prevent imbalance
between regular stack and shadow stack. After `relocate_enable_mmu` has
been done, this is as early as possible it can enabled.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/kernel/asm-offsets.c |  4 ++++
 arch/riscv/kernel/head.S        | 12 ++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
index 0c188aaf3925..21f99d5757b6 100644
--- a/arch/riscv/kernel/asm-offsets.c
+++ b/arch/riscv/kernel/asm-offsets.c
@@ -515,4 +515,8 @@ void asm_offsets(void)
 	DEFINE(FREGS_A6,	    offsetof(struct __arch_ftrace_regs, a6));
 	DEFINE(FREGS_A7,	    offsetof(struct __arch_ftrace_regs, a7));
 #endif
+	DEFINE(SBI_EXT_FWFT, SBI_EXT_FWFT);
+	DEFINE(SBI_EXT_FWFT_SET, SBI_EXT_FWFT_SET);
+	DEFINE(SBI_FWFT_SHADOW_STACK, SBI_FWFT_SHADOW_STACK);
+	DEFINE(SBI_FWFT_SET_FLAG_LOCK, SBI_FWFT_SET_FLAG_LOCK);
 }
diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 356d5397b2a2..6244408ca917 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -164,6 +164,12 @@ secondary_start_sbi:
 	call relocate_enable_mmu
 #endif
 	call .Lsetup_trap_vector
+	li a7, SBI_EXT_FWFT
+	li a6, SBI_EXT_FWFT_SET
+	li a0, SBI_FWFT_SHADOW_STACK
+	li a1, 1 /* enable supervisor to access shadow stack access */
+	li a2, SBI_FWFT_SET_FLAG_LOCK
+	ecall
 	scs_load_current
 	call smp_callin
 #endif /* CONFIG_SMP */
@@ -320,6 +326,12 @@ SYM_CODE_START(_start_kernel)
 	la tp, init_task
 	la sp, init_thread_union + THREAD_SIZE
 	addi sp, sp, -PT_SIZE_ON_STACK
+	li a7, SBI_EXT_FWFT
+	li a6, SBI_EXT_FWFT_SET
+	li a0, SBI_FWFT_SHADOW_STACK
+	li a1, 1 /* enable supervisor to access shadow stack access */
+	li a2, SBI_FWFT_SET_FLAG_LOCK
+	ecall
 	scs_load_current
 
 #ifdef CONFIG_KASAN

-- 
2.34.1


