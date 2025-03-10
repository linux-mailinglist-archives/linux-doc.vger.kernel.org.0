Return-Path: <linux-doc+bounces-40363-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F52A59850
	for <lists+linux-doc@lfdr.de>; Mon, 10 Mar 2025 15:53:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 05D221662A0
	for <lists+linux-doc@lfdr.de>; Mon, 10 Mar 2025 14:53:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3066622F140;
	Mon, 10 Mar 2025 14:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="EydyJ0Bp"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A4622DFB8
	for <linux-doc@vger.kernel.org>; Mon, 10 Mar 2025 14:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741618365; cv=none; b=ixQkPIjY6ItKxgnCxTT4Scj4H9/SR1DgLu1TMGfUFSgI1g1TymGXZ56VUmbV3pl+Ho4biLrDBA81R84/08UoDg46dFVfGADJWCA7DdYb9xJo4t/RaMXx9l10H1+r2xCEJpowAk6z34HQnDZex9S8lGqNDp4vN9oCgcwPlbZbvF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741618365; c=relaxed/simple;
	bh=f+s1qRILk5w2zoTzbSGEFuSk9CM1mNXrrF3BbhojAEc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KCkBRXOLwdbntGmH3Kf+t+g6ZJ/AI3IwK7PouxgaemERReSG0w2te2kZRnTjUvUdtlkgqLNwsxVEqx6uXvRSIRbuYVb3mt7v4F9E0IyldEhLUSmbnSJmv4Ns3q2nJPIARPljcsb+iUilvIHTnHaGLLERm71ggtBsXqqi/TmdDKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=EydyJ0Bp; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2255003f4c6so30424695ad.0
        for <linux-doc@vger.kernel.org>; Mon, 10 Mar 2025 07:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741618362; x=1742223162; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n3DM8zy+WllPP0TujEXFZ0Ycc0zGrpNRrMRWPkPmGZc=;
        b=EydyJ0BpriCvs2qPsub39795edQPTmKCu8O/B5RPJ2VjhMQbBwGyf6jq0uvq53HTCW
         WRaxFAFaGjW4k0qSvC2Yjp0AnrYP3DQmtvZo1gcp0sH43DC3wwlYj33e/XhfKTlrrSkj
         yRxeSqP5c98EfTLk9y7Or+5sq4xzgJebDPwitoM3VRx3tCUYbaxqrEjf85/2OAXR1rQp
         z+v4zwakubW62pee6309vt/IY07dxbb9dJ0h+ooMzyKB3NlVlHVcf61RTyOsSLkqB38c
         TbWLbveGzTPnj6b+3VOKwf0UwCG3+uHNrvdXnbzMuyr3B3Y+dn52A5RigiexhFCFhWRE
         GEWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741618362; x=1742223162;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n3DM8zy+WllPP0TujEXFZ0Ycc0zGrpNRrMRWPkPmGZc=;
        b=dFr1baTHTW40DUM3l+YJhrLfEEGLeF/TEg/9whCi3T7yrjxKaqAg03I11XbDitw3B+
         nU6Wskll+jJx0CzjvJTvqcWCOroTA4gkqDY1ToELJnQCe2q093w6I9mwKUxeHlOam4CZ
         DuyQTiawRfcu2cJ/WnZtiOcNNHfZJCwP1Xeux3EmGsXyqD2E7Og3vt+ktq0cB/Lx2tyG
         w0Uih8ptP69jnRoCDiqvdkBDGwPAPQPGxQhSMr15cf+abAY9DNDq/qC7o+lP+Q9wTN+S
         y2K18gJUR0IhgUJCl9VqrlvcqQxxeaS+ViHsX9YFBMmb1UfpcD6AvENl1bezQqdQ8Gz0
         vYDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUw6eyZbbdpJ67GuOsCr9vzcTV1R24KiKMyM6laHxRP9lg0oQ3nr/CqG8oWWbytGKsfNm1QZV7K9RM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgkMMWjVREtkhvSYkbEgLdZ6SfbCl5IO7zYXwX4fkUF12wWwcz
	G9oCkY8NqVSxNXJP0Hs8RJDP6EsgZmz4Javk1bAjDjEwW3h/aIa5GJNJW4mB+/M=
X-Gm-Gg: ASbGncuhnFoeTJici7aG19ZzM7RcBKJXYB1d3M5PoZXeLS34huddrJH3qP2Q3GdhmKf
	bRXOhAy/6cxu/vPLKaJRsHgbgQLSyhUi0jAlUbeU06+iNY4ima9zHsKg/zwF4L/2Q6h90eR4XFD
	0UfIFzyDMjAjxiHmTkjgoIzbVvKNkwJ0V/bdRvIW8SkAax1iLG5A8cPifvDxeQpUpAGtvUWz4v0
	sxRWUvjzMVCt5rI9jc4viTsXfQ4Nn7NnlywvHaj6Ylpm6y79Ow5D5XoxPAXG72M1HnMGGT+HnOf
	NbryhZLmvw+zPYtP6WOnfleyl1Le4hpl5nhsnezeWteymHiFpZ7qjWo=
X-Google-Smtp-Source: AGHT+IHEgbV38+kdB/KuKTC/ngiL6naw+4KBErVaQq0wSwONUo1ce4xmBDTiHE9RxDA/IFBRpdqZjA==
X-Received: by 2002:a05:6a21:1fc5:b0:1f5:6878:1a43 with SMTP id adf61e73a8af0-1f58cb239e0mr144294637.14.1741618362407;
        Mon, 10 Mar 2025 07:52:42 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-736d11d4600sm2890275b3a.116.2025.03.10.07.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 07:52:42 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 10 Mar 2025 07:52:26 -0700
Subject: [PATCH v11 04/27] riscv: zicfiss / zicfilp extension csr and bit
 definitions
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250310-v5_user_cfi_series-v11-4-86b36cbfb910@rivosinc.com>
References: <20250310-v5_user_cfi_series-v11-0-86b36cbfb910@rivosinc.com>
In-Reply-To: <20250310-v5_user_cfi_series-v11-0-86b36cbfb910@rivosinc.com>
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


