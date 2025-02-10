Return-Path: <linux-doc+bounces-37649-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 575E5A2FA19
	for <lists+linux-doc@lfdr.de>; Mon, 10 Feb 2025 21:28:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A4511886F44
	for <lists+linux-doc@lfdr.de>; Mon, 10 Feb 2025 20:28:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B79F253354;
	Mon, 10 Feb 2025 20:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="tyUxnTe5"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD92A253323
	for <linux-doc@vger.kernel.org>; Mon, 10 Feb 2025 20:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739219215; cv=none; b=cRW+8tyHGpCpynY/8Y3h+YSmBf0UmqK8/ueMIFngg8muY5luk9KnJfTSEhrdtO9SClD7LdLj0DmSaA5sS/sJuDdjM9tzlN9eRem2mkkhb7DXeVmaEGddpAq7rjm575/ZL3TNlm2arEVHVuK37jrqGR+126zCTZ422HDXCWBLyYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739219215; c=relaxed/simple;
	bh=f+s1qRILk5w2zoTzbSGEFuSk9CM1mNXrrF3BbhojAEc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d1Va7MefWrGmJM8TDQARMplJM2t+3RxANyOVdF6bMFpM+nnXsMBt5sKEW0/c8fchhrcNOcLwZB9kBTV/Ichsa2yjxqOUYURNziknqo4puulLYUiFzshGVTNTtD3FALyftjsHlWReL8FPbw6iuI1oBpZeRwAIq65+vUYqekXi6xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=tyUxnTe5; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-21f55fbb72bso56897065ad.2
        for <linux-doc@vger.kernel.org>; Mon, 10 Feb 2025 12:26:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739219212; x=1739824012; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n3DM8zy+WllPP0TujEXFZ0Ycc0zGrpNRrMRWPkPmGZc=;
        b=tyUxnTe5k/O8VxBHNAU9eC5D16+SjAX9+p8FPxv9pAeb7+/WWor1uYommRoZGmKDfe
         tMdqBz/OBw9zS8z6TUtqJ/Goy2ehY8fF9qLtGj5MiU6aIEieZ8edHXJL50diWdSmEdyW
         eJVA+ovlOxkM+dRQgY7zMNTpHycGSyFlHAw+2BSU8ykYV9W/q0RTgARsBP4hVQRMfSFG
         jHnCQyGN6SrN+Xp5qQGLDXW1Hc9rnbpE6odBrwNovwb5yEYa4Cqzh4dsXYZ617DllOma
         IPz5RirijB/vExSt6IjqF1hf7aQhkEAbQhPwhPKwMIwyIA7WcIb7Oz0GBCdD/H+pLj1c
         K+TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739219212; x=1739824012;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n3DM8zy+WllPP0TujEXFZ0Ycc0zGrpNRrMRWPkPmGZc=;
        b=q8OjYVj5Z+QiKuL+wjmgN6Bmp5kCayqLuZaGZQKnUg53Qzmx5M6fSjT1E9VxFkOTBS
         dr6whx44v9/CTUsWzEsU+3SNwOTTraEcta1wN8DM92wUmmWGgnyO1DvoH7Nka1eDMlYZ
         lZeFOcPf+QAzWw3AKBIxgeWg58JdRYcyo6VIR/RGK3Bke+WATJrDgzmoguMnb9I1t2cp
         t0OYRtcIFIP4a8Hlt8NX4Bkf8g58PWbk41bVCzvJKSLj/AIKUdAC1dB9x7+1p5JFz/c+
         kRo+azyoNkl133kiKdFR4hnZrE42BeFtnUbOWKfg05UF214kpEIRS82Ehspjw0YntcCp
         HJpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuM+oc5Ym11A0FYZOdTcsZVIwqlzZdYww61zDfoESyGuTEGscJcPAt3uVw9lyyF8Imh819YEbAFTA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwORTuvov9gMxP89AQHLlkRTCiktVZ/A/ESZwk5EPoNqDNcQot/
	WCXVvTqMgv/0QdoEoHvwgAWmjZv8hVosNv11KSEEXIfS2wFrZV7zmfMCIxVpV9M=
X-Gm-Gg: ASbGncvkb5CxRnd9IZqFYUgU96DhwDFQpXa3vCCNkkTbqa/oCiUiaceQewZNAQBuNyK
	yaBQQAqeKgVqaHCyFxzlr1KiVJIP8/FOEBMgsHW1VK2HmhrOaFYGmt1pN50CIh23aY9FmbZBYtG
	j8eLCPTaBtLE0czy8k2KD5kpcewx9G6PqAhssT27LcEqMekhHFHEb+xcXlbfSoeI+Eibam33LWa
	FvIaKb33E5U1JDRuxwgbNkeyxt1OIGBTYmQMgNhmQ1I3Fp7s8jUi4ZCg9E8giN/5BHN9tsKo6dN
	6Bb9mhD+WY7S3LHpjdGm6nAPzw==
X-Google-Smtp-Source: AGHT+IGtT2BfpGC+pxbWvm2Qtn55Phvbe3Ks/NAXxmbZaEXtXhWUE3SuxobC1K+zZICcAG0d87INng==
X-Received: by 2002:a17:903:32cb:b0:21f:dd1:8359 with SMTP id d9443c01a7336-21f4e6d2642mr247925115ad.29.1739219211966;
        Mon, 10 Feb 2025 12:26:51 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3687c187sm83711555ad.168.2025.02.10.12.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 12:26:51 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 10 Feb 2025 12:26:37 -0800
Subject: [PATCH v10 04/27] riscv: zicfiss / zicfilp extension csr and bit
 definitions
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-v5_user_cfi_series-v10-4-163dcfa31c60@rivosinc.com>
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
index 6fed42e37705..2f49b9663640 100644
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
@@ -212,6 +221,8 @@
 #define ENVCFG_PMM_PMLEN_16		(_AC(0x3, ULL) << 32)
 #define ENVCFG_CBZE			(_AC(1, UL) << 7)
 #define ENVCFG_CBCFE			(_AC(1, UL) << 6)
+#define ENVCFG_LPE			(_AC(1, UL) << 2)
+#define ENVCFG_SSE			(_AC(1, UL) << 3)
 #define ENVCFG_CBIE_SHIFT		4
 #define ENVCFG_CBIE			(_AC(0x3, UL) << ENVCFG_CBIE_SHIFT)
 #define ENVCFG_CBIE_ILL			_AC(0x0, UL)
@@ -230,6 +241,11 @@
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
2.34.1


