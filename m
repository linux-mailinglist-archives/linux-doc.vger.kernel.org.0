Return-Path: <linux-doc+bounces-30488-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0CB9C4746
	for <lists+linux-doc@lfdr.de>; Mon, 11 Nov 2024 21:56:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E90A1F2171F
	for <lists+linux-doc@lfdr.de>; Mon, 11 Nov 2024 20:56:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5504B1C2DB7;
	Mon, 11 Nov 2024 20:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="taQANTMe"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6CC31C1F20
	for <linux-doc@vger.kernel.org>; Mon, 11 Nov 2024 20:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731358450; cv=none; b=Fz5WsusqHZ+pI55C2UAtr9dglmz75Pw9zgUQjd7cnxt5B3lVLA6u408KYXFwXNZ/R+3eQ/zJqeO26YIMwdKt7OXhASUL90CwzkPqTfk40S0mkgYQVNiPu+P8+2KtIaK2mXGPFcc+Komf0XoELpy04CUVZWXPxWJAnZz/tGFZ5YU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731358450; c=relaxed/simple;
	bh=cysw8VOzNKltNluwPY00RZGs7D1gPv13cc+jLW4p7o0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bf+JBkPCtD4tf36Zhpb7Pzur/5vwwkaiFzAH+NLQy1ge3xrlDeDQUfBR3+P7Ry0uO0d9EginDq9Aq8zw+y5PmtirPKnuR1E/g0mqGBvndkNmvR9uoXqCypUaWgGQylM3L4o3AvWv7nqvWG+2p3dQ2NRrWDEImiSqON4lIKBMTdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=taQANTMe; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-7f4325168c8so1590106a12.1
        for <linux-doc@vger.kernel.org>; Mon, 11 Nov 2024 12:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1731358448; x=1731963248; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i4teOkO5NS+a5tpc/KVRBm9B9NcWtrxKvqevEBspNrc=;
        b=taQANTMeg/oZeAQsfzQPd1lmjlCtIbYEpr2Z9cKoAtzNnHzql9vVHD85e6lTALpmyu
         4GLgQdvJkpFRwaj9hE/9ZgzTINZbgfgvF8RV0exFYcPHfaVzn8tDjhoomRtlqI/JCslv
         btGEh7U4rYU9nFysFJnB7+yDQje8mN7+wH+ouHpmhzY1koqlvl0SF74GZaxfQfL1vEzy
         U5LWCRGOvS89QvsjzAFRfp+jY73ywOUsY1GVFIrVRTmmOGu3UjhB5/wticjtxCQRPpmU
         04BkbEgPgG1oaKdvm4LmtHI9V8BWuWRck67VhK4P6fY1u2OS/xKhExUUpMkbMKDswGq1
         mU/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731358448; x=1731963248;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i4teOkO5NS+a5tpc/KVRBm9B9NcWtrxKvqevEBspNrc=;
        b=SY+I3YGkHmBIl5f/roR9pitzbN9Ai/UcC7ajRD2FmqvrQxtlD88RAILj9ZszwVY39h
         kOY7zZ+zdHlhL6E6bMQIxAydF371lZAy/hDtMWPl6EMkvBZ/hhTrkcL3dvueg5t/zL7S
         PXiMSZT0pcGpFCHnZksRrJbAESc3rnohAq+LufvXVNowGremkoRjeSFinNc2wpCzWrej
         dUlNkJaKuejebSysk+lIHqcoKS1TTQcfFCAaDdIrXiZc9A2o62MR+Rb57hcTSN0z/xom
         ME23RZ0sJPbGJ1XD7mo+KEC77VpAAoRmOQMDs9qdPiflEQqWxJITG6rryiF5Qeb01ADy
         2ZHg==
X-Forwarded-Encrypted: i=1; AJvYcCVDPMq8G1D40Ct3COj7vJ3ENKtMfAokJJfMskIftDxMebqBs+7m3HQj3SsYIeqpkAGca4FcBjbS/rk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3k/T2ewR/jHlSwGgDDF73Pe3rEN2QWit7ARm/EGriHKcHQDWK
	yWjuHjDoYCO7C5c5fJpHvZmmnJegnUj5vYc8MiLCW/8wnZU6snfFzDwrGawE0Ko=
X-Google-Smtp-Source: AGHT+IG8dw9+pHf+sZxzmda/NztuR0nyiy+ZmJTvX1U9rTy5Vh0+vbtPqkUx+XtKAlxwthAnEmC8gQ==
X-Received: by 2002:a17:90b:4f49:b0:2e2:9a48:dbb7 with SMTP id 98e67ed59e1d1-2e9b1740ea7mr18361077a91.29.1731358447878;
        Mon, 11 Nov 2024 12:54:07 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e9a5fd1534sm9059974a91.42.2024.11.11.12.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 12:54:07 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 11 Nov 2024 12:53:50 -0800
Subject: [PATCH v8 05/29] riscv: zicfiss / zicfilp extension csr and bit
 definitions
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241111-v5_user_cfi_series-v8-5-dce14aa30207@rivosinc.com>
References: <20241111-v5_user_cfi_series-v8-0-dce14aa30207@rivosinc.com>
In-Reply-To: <20241111-v5_user_cfi_series-v8-0-dce14aa30207@rivosinc.com>
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
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>
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

zicfiss and zicfilp extension gets enabled via b3 and b2 in *envcfg CSR.
menvcfg controls enabling for S/HS mode. henvcfg control enabling for VS
while senvcfg controls enabling for U/VU mode.

zicfilp extension extends *status CSR to hold `expected landing pad` bit.
A trap or interrupt can occur between an indirect jmp/call and target
instr. `expected landing pad` bit from CPU is recorded into xstatus CSR so
that when supervisor performs xret, `expected landing pad` state of CPU can
be restored.

zicfiss adds one new CSR
- CSR_SSP: CSR_SSP contains current shadow stack pointer.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/csr.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index fe5d4eb9adea..e07b55028cc0 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -18,6 +18,15 @@
 #define SR_MPP		_AC(0x00001800, UL) /* Previously Machine */
 #define SR_SUM		_AC(0x00040000, UL) /* Supervisor User Memory Access */
 
+/* zicfilp landing pad status bit */
+#define SR_SPELP	_AC(0x00800000, UL)
+#define SR_MPELP	_AC(0x020000000000, UL)
+#ifdef CONFIG_RISCV_M_MODE
+#define SR_ELP		SR_MPELP
+#else
+#define SR_ELP		SR_SPELP
+#endif
+
 #define SR_FS		_AC(0x00006000, UL) /* Floating-point Status */
 #define SR_FS_OFF	_AC(0x00000000, UL)
 #define SR_FS_INITIAL	_AC(0x00002000, UL)
@@ -205,6 +214,8 @@
 #define ENVCFG_PMM_PMLEN_16		(_AC(0x3, ULL) << 32)
 #define ENVCFG_CBZE			(_AC(1, UL) << 7)
 #define ENVCFG_CBCFE			(_AC(1, UL) << 6)
+#define ENVCFG_LPE			(_AC(1, UL) << 2)
+#define ENVCFG_SSE			(_AC(1, UL) << 3)
 #define ENVCFG_CBIE_SHIFT		4
 #define ENVCFG_CBIE			(_AC(0x3, UL) << ENVCFG_CBIE_SHIFT)
 #define ENVCFG_CBIE_ILL			_AC(0x0, UL)
@@ -223,6 +234,11 @@
 #define SMSTATEEN0_HSENVCFG		(_ULL(1) << SMSTATEEN0_HSENVCFG_SHIFT)
 #define SMSTATEEN0_SSTATEEN0_SHIFT	63
 #define SMSTATEEN0_SSTATEEN0		(_ULL(1) << SMSTATEEN0_SSTATEEN0_SHIFT)
+/*
+ * zicfiss user mode csr
+ * CSR_SSP holds current shadow stack pointer.
+ */
+#define CSR_SSP                 0x011
 
 /* mseccfg bits */
 #define MSECCFG_PMM			ENVCFG_PMM

-- 
2.45.0


