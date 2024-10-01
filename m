Return-Path: <linux-doc+bounces-26128-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A542E98C27F
	for <lists+linux-doc@lfdr.de>; Tue,  1 Oct 2024 18:10:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 352AB281A08
	for <lists+linux-doc@lfdr.de>; Tue,  1 Oct 2024 16:10:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86CFF1CDA25;
	Tue,  1 Oct 2024 16:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="swUzBBIN"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05701CDA0F
	for <linux-doc@vger.kernel.org>; Tue,  1 Oct 2024 16:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727798845; cv=none; b=WCExfACSzqKUG2ZHRqSZs3cihejg/fHwc1Ho0f4HyJg8nj2pcylH0tOGMBgNEjmqmvSmXhTriEr3x7NnNSkN6r06NEtIvZ+bLOvi4tU24NAgV5EeBBiLeFvuJzpQQptc2GniXy8iIvdgJ1SDtf+7RHXlNPqK5FghHcP68Kv91Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727798845; c=relaxed/simple;
	bh=DQZ+f8skAijkGaQUPxzGElVLvVkTCbU5tb3LJJ3G8+k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bPLnJTJUMV3gTj5mO2thFTUWSv9BGJOY+mwpI1L6bYRbBH5N4/iVWKn3ELiNTVFTBbbv4NE7FJmn+ZaN7uL90f0utarM9Tdl/0UIB4ifyS7RiH3RRxHEO3GyvpYPoSmL7837qYDMLMxOkmgEgUI6lWYkuthhbW5zxe4JNfS271I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=swUzBBIN; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-7e6afa8baeaso4883563a12.3
        for <linux-doc@vger.kernel.org>; Tue, 01 Oct 2024 09:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1727798843; x=1728403643; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YzRPf3gSm1oBJZUnyk2tQznTd/0pm5tuC+PNjTYOgOw=;
        b=swUzBBINQbmShGfxFr2JISxgRXZlkc7/9kiNKpfS49hnAedY7burpc5owwFYmfWYkt
         O02p1k+atEDGYC3nxDfnx3lXYQ1PXRtaI68s5a4PIXHpYArRB3VXWyo7L7KSRuCBu3Gs
         AJoGRF2uYGuz6F2hJXokr+jWX873qqwKuk2V1kbWcp4o6Fu4zFwlqFesKyuGZFm5IQX0
         TnOak5Vy0BBWxj0oWH6J7RC+dOWv1cUlvtqAahfTrWyYOvl93Egg0y4iFnBJn0Tskvb4
         cTZn4HpipdAQnukufhUxpeSG3TqihVBYUT6weIE+BR+x3nuHCLWNRzYZoFjY/cVTnRxE
         Qyfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727798843; x=1728403643;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YzRPf3gSm1oBJZUnyk2tQznTd/0pm5tuC+PNjTYOgOw=;
        b=Yotpn0U3xAUyryclITWUSSopBF3bcrWrmzCWv6F/92KLSuKeHxOIrT5tdU5koUVvfK
         MqJhEiGzFdJ/UI2F0bndraanzs9jYIqAg0BR5MoiB1OQkyGePLoMAjvJuojwKvxWvrrX
         NrAKj29vZdXaWhjsoRGNX0BR+Iih1fEt89yq+O8v9RCLmzqS2PV6jxMxMZSJd8GD3lyJ
         OEet99F3GTadXaDst5/VWtyacnnVGkH+y+HJ/L5tw8pwvO5FUd27JFdNb3CYCpGRNGnv
         3yMeq4UEGDzboS0K5u2a/YpL59YjVa/o8RYd5FXWEE7b+dZ2YExN6XXj1YyzWAf285ed
         MeFg==
X-Forwarded-Encrypted: i=1; AJvYcCXeX2f8q23bpxgKDXHXyHLjqTKvw2Yqv2rmA00Q7RMynY8KLARPPsHQkoqghj2PkA1q9XMddOCszu8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz750zQ0nfYS8ms9Qpklylqmickd5y0AMYAw/JwtI3TVEFEPOr8
	s+qs6FG8IFqBVhL+9EFFgJCbkZfvl/Vvea4nJk/mfuu9Vpeqzqh/k+Jd2hwmr0g=
X-Google-Smtp-Source: AGHT+IFUtHGSqw39cY/b30rSSzM+TWp/wCUKZ0BHqFADXvXCzXnqk0YyVIrTqxVHl/zzcyJlxVk2Ag==
X-Received: by 2002:a17:90a:7103:b0:2dd:6a40:dd86 with SMTP id 98e67ed59e1d1-2e18468601cmr227883a91.16.1727798843238;
        Tue, 01 Oct 2024 09:07:23 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e06e1d7d47sm13843973a91.28.2024.10.01.09.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 09:07:22 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 01 Oct 2024 09:06:14 -0700
Subject: [PATCH 09/33] riscv: zicfiss / zicfilp extension csr and bit
 definitions
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241001-v5_user_cfi_series-v1-9-3ba65b6e550f@rivosinc.com>
References: <20241001-v5_user_cfi_series-v1-0-3ba65b6e550f@rivosinc.com>
In-Reply-To: <20241001-v5_user_cfi_series-v1-0-3ba65b6e550f@rivosinc.com>
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
index 25966995da04..af7ed9bedaee 100644
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
@@ -197,6 +206,8 @@
 #define ENVCFG_PBMTE			(_AC(1, ULL) << 62)
 #define ENVCFG_CBZE			(_AC(1, UL) << 7)
 #define ENVCFG_CBCFE			(_AC(1, UL) << 6)
+#define ENVCFG_LPE			(_AC(1, UL) << 2)
+#define ENVCFG_SSE			(_AC(1, UL) << 3)
 #define ENVCFG_CBIE_SHIFT		4
 #define ENVCFG_CBIE			(_AC(0x3, UL) << ENVCFG_CBIE_SHIFT)
 #define ENVCFG_CBIE_ILL			_AC(0x0, UL)
@@ -215,6 +226,11 @@
 #define SMSTATEEN0_HSENVCFG		(_ULL(1) << SMSTATEEN0_HSENVCFG_SHIFT)
 #define SMSTATEEN0_SSTATEEN0_SHIFT	63
 #define SMSTATEEN0_SSTATEEN0		(_ULL(1) << SMSTATEEN0_SSTATEEN0_SHIFT)
+/*
+ * zicfiss user mode csr
+ * CSR_SSP holds current shadow stack pointer.
+ */
+#define CSR_SSP                 0x011
 
 /* symbolic CSR names: */
 #define CSR_CYCLE		0xc00

-- 
2.45.0


