Return-Path: <linux-doc+bounces-37665-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5376BA2FA7E
	for <lists+linux-doc@lfdr.de>; Mon, 10 Feb 2025 21:34:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 88A321882575
	for <lists+linux-doc@lfdr.de>; Mon, 10 Feb 2025 20:34:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 736E0260A29;
	Mon, 10 Feb 2025 20:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="pEHSKQqI"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72C1250BF4
	for <linux-doc@vger.kernel.org>; Mon, 10 Feb 2025 20:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739219254; cv=none; b=OMbaeAf/X9UZFtLXeo2TjAQPJH+Uvf4y0cQn2XLDeA/j7/raZdM29WzmUQ8hWfDoP5WJvULKrIsQnf117KwWD3DMhii+GxRpgsTI3FkHFC+24mWQW8ggCa4DCjrnOXqcSiJ7WPH/E4dsJThYYEveEcynyeDMSr1m7DmvwNIyWok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739219254; c=relaxed/simple;
	bh=lD6rgHPb/ib2WH9dder9ZLKtBlS2SotatDP0DK7YItE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iQwSKaXvDBOfUMq9G9oRnbu0Y7R8X4Zy7tlYCZ2ZmL5a3RgSXlvJmbqNhCJziiGRvS6voUtf6AY64U5luClYt6e+5cwjDWT/BvfTYNXC41lsM8Bl9zmAHDlfQxCJE64ve7c38bBdfKcvRYi4aBS8McPPXrkevWFPdml9+mLnCBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=pEHSKQqI; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-21fa56e1583so18610365ad.3
        for <linux-doc@vger.kernel.org>; Mon, 10 Feb 2025 12:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739219252; x=1739824052; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a5uI84SXblQRDID2BHNWhhHsRc7xVUDdoiei4kS9c/0=;
        b=pEHSKQqIAf+6LNPMWppnKRBxWyONMxZqPDBESoy4Ea6Mw3sChnDCgqwo9bvPudmorl
         vaYEWaINHZfAsBP67CS+bCZsUv5gqzia0Dta6fdGggaGQ78yTPWxm5dyLVj7dkLWnsV3
         MsaXMZAvWnUbWBT85GS9W+Wwlz5/8lHMEGk5RlPd95uatHiiC9ggG/NyZuoCN81sOE2E
         /bM7t85VuIApTNqMlUQLvNmml03OTxjCi0SRDBV/SagmHH0BAIKM1Lp/5w9XqFoWGGdO
         jMr229mx+QFVkGmFRlQA8t07OB0KoLzsTbtKIUnZgU2C4hdz43gp9kj3yc+5ulwoiqlH
         Ts0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739219252; x=1739824052;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a5uI84SXblQRDID2BHNWhhHsRc7xVUDdoiei4kS9c/0=;
        b=arOO5vehttQgEjKrcltOWVZd5i3b8EMhXJrKKStU0sfqSn+K2ktUlqBc6ejNst/Jvn
         w44nT8Jb7E9aYQtUjBWNZy7R1lXbJQU+79yQGmd5WuF7aArkJFxOTFIdPa98OeRxSsb/
         IN8ddUEll5Secxs5x/L16y/2Lls0aO+FQOG4iZvcBqAhCLgJvsSnPY7E2B+ZZx0uJgxO
         KHPGjwMCDk1Hf467ezF/oAQLhIlmue3kZBkDNUizezdHs+bNM/wbltr3d0suTmprYBMT
         eEu8TZpd9hBtw8+xpr8FLWDJGM4yRhPCMyVkqgGUih/LBcfQfs42nsFZ4z2fspxME+op
         kA6A==
X-Forwarded-Encrypted: i=1; AJvYcCWuth3jkrizzQk5k5t1Vmc2v3nop52ryKZNQV/F/k0E892QzSuopOgU0RjFGj23oKKMI+rN/QSPjWQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/mM0ORB5YHyytML2Z+bD2DYGbXL/ZXiTo5x8pBHDsTmpgPoaU
	b+0SJIi01+7VNYTbQEOMjY5s5+hZT61k8iyDQGDltEpQfYF3OeBw02pPWybd2Vc=
X-Gm-Gg: ASbGncvefHB+xCcTYnQlEDDaKvNSPpG3cmJcpzbTdkCZNJaO1hu7urSD8LUub+jUOAs
	bbn153zldBBN1J0FGVGQ4Qaj5QHOWd7N55hcLlJuGodYth8wW1SQqjwQ1v+bDyO1N9UmRxQosA8
	owLXm9BXaNZojqtKwir02syCwyQ/4S4r9XUC7MTx3koWuPIL0A0XkpxTonzvCid6gWqD3VZvr8P
	qdzoEOux6CVhXGrH3MvvfCCs6P0UiawhEO0HLQgaSSODCBWgpaxAePiLz6AQvOZ8TtHbqHACN6I
	ll5Zh7ZCMbiu52c9bzhb3Y9aEg==
X-Google-Smtp-Source: AGHT+IGRSFFgWaceOiIiNm5tv+e7IogqAyyOZF4Jzr3uh0XSSHp0Pwy9ipwzTE00hP4VjDiSKq3vug==
X-Received: by 2002:a17:903:32c7:b0:216:39fa:5cb4 with SMTP id d9443c01a7336-21f4e6ce13bmr265561195ad.25.1739219251992;
        Mon, 10 Feb 2025 12:27:31 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3687c187sm83711555ad.168.2025.02.10.12.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 12:27:31 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 10 Feb 2025 12:26:53 -0800
Subject: [PATCH v10 20/27] riscv: Add Firmware Feature SBI extensions
 definitions
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250210-v5_user_cfi_series-v10-20-163dcfa31c60@rivosinc.com>
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
 rick.p.edgecombe@intel.com
X-Mailer: b4 0.14.0

From: Clément Léger <cleger@rivosinc.com>

Add necessary SBI definitions to use the FWFT extension.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
---
 arch/riscv/include/asm/sbi.h | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 3d250824178b..23bfb254e3f4 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -35,6 +35,7 @@ enum sbi_ext_id {
 	SBI_EXT_DBCN = 0x4442434E,
 	SBI_EXT_STA = 0x535441,
 	SBI_EXT_NACL = 0x4E41434C,
+	SBI_EXT_FWFT = 0x46574654,
 
 	/* Experimentals extensions must lie within this range */
 	SBI_EXT_EXPERIMENTAL_START = 0x08000000,
@@ -401,6 +402,31 @@ enum sbi_ext_nacl_feature {
 
 #define SBI_NACL_SHMEM_SRET_X(__i)		((__riscv_xlen / 8) * (__i))
 #define SBI_NACL_SHMEM_SRET_X_LAST		31
+/* SBI function IDs for FW feature extension */
+#define SBI_EXT_FWFT_SET		0x0
+#define SBI_EXT_FWFT_GET		0x1
+
+enum sbi_fwft_feature_t {
+	SBI_FWFT_MISALIGNED_EXC_DELEG		= 0x0,
+	SBI_FWFT_LANDING_PAD			= 0x1,
+	SBI_FWFT_SHADOW_STACK			= 0x2,
+	SBI_FWFT_DOUBLE_TRAP			= 0x3,
+	SBI_FWFT_PTE_AD_HW_UPDATING		= 0x4,
+	SBI_FWFT_LOCAL_RESERVED_START		= 0x5,
+	SBI_FWFT_LOCAL_RESERVED_END		= 0x3fffffff,
+	SBI_FWFT_LOCAL_PLATFORM_START		= 0x40000000,
+	SBI_FWFT_LOCAL_PLATFORM_END		= 0x7fffffff,
+
+	SBI_FWFT_GLOBAL_RESERVED_START		= 0x80000000,
+	SBI_FWFT_GLOBAL_RESERVED_END		= 0xbfffffff,
+	SBI_FWFT_GLOBAL_PLATFORM_START		= 0xc0000000,
+	SBI_FWFT_GLOBAL_PLATFORM_END		= 0xffffffff,
+};
+
+#define SBI_FWFT_GLOBAL_FEATURE_BIT		(1 << 31)
+#define SBI_FWFT_PLATFORM_FEATURE_BIT		(1 << 30)
+
+#define SBI_FWFT_SET_FLAG_LOCK			(1 << 0)
 
 /* SBI spec version fields */
 #define SBI_SPEC_VERSION_DEFAULT	0x1

-- 
2.34.1


