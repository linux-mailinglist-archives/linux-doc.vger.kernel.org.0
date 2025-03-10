Return-Path: <linux-doc+bounces-40379-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D19A598B6
	for <lists+linux-doc@lfdr.de>; Mon, 10 Mar 2025 15:59:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC8A0163F7B
	for <lists+linux-doc@lfdr.de>; Mon, 10 Mar 2025 14:58:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E50F323906A;
	Mon, 10 Mar 2025 14:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="001MDNVH"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9421238165
	for <linux-doc@vger.kernel.org>; Mon, 10 Mar 2025 14:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741618402; cv=none; b=EUiemCX0zPBA72V9TfaOuLIpLuhyAobwoFl4JclRUN/PA77V1wcUNmIW4NwpaXzdkXCFcs/98t8KRkircfilKtBbHecrQbT/J+pP1W3Qjdgsw1QQLPC0i5nH+z0w8D/u4T+HDLqX4nxbWvpiko2zfJSZA0ixhcJZ+ZDi6b6yXrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741618402; c=relaxed/simple;
	bh=NmVWKk7RCdoTm8/kxl5H6XmDwgptfJerdilzp6YHjbI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mcKWRoQrHvDxOG/nyaQjwEl9YKbp6iZ8ZsnKYBM/afCoxILsXCvsLHGpivDzLUszERd7bcmsqCnwcQWcFK5YYDa+ndDhbxnHShKxuXwd+5SJIc/wdxf6gBFdUk+/NBKii2ZI6gxPzlln76Ed5oZ/FdqfOkolzqaobuWB9DYifFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=001MDNVH; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-22185cddbffso95176335ad.1
        for <linux-doc@vger.kernel.org>; Mon, 10 Mar 2025 07:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741618399; x=1742223199; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BEoq6zqSeLFMaXOoiuM7yp6ZSaKHVlNR4X3PvApIHRU=;
        b=001MDNVHlC1le3S/p3HpJjvvRY1zWlgI7KtAcZRY/0MIZyG2mLNEY95y0IK+V2WarG
         MJJOCnOK10PlxOPHAIX08BPn2OjLCRoB9QlZZwXVNknopwgUgFClom06HTKqOKFF1g91
         yjNwR/9DnNTCex/suq/biq2N1c+CHhS7+kiY/cwHEaIdBNlPYnGde3oprqKifrr8f3qg
         zTyXQmFw1Odpv1AhL4vVA5Sl61WG3HSX/RAdSZUSqsGogS73lJ5fSIFwDWXgbenw9a7p
         JrTwrZqZhiyjHptDYnm0hz/vj/99iTc7WB/SLoV5zrvrHZJUXIbICtAYM/zsqWL7Qr3x
         3bfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741618399; x=1742223199;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BEoq6zqSeLFMaXOoiuM7yp6ZSaKHVlNR4X3PvApIHRU=;
        b=CBSeJhitCjRFVCC24Z5n4fha8RcYDKbrZMUz8SNEj+Fy8mR92ue4iUTdJMSIIVoEGu
         x9NAzhxHeVzRGtLJOKI9EpEKkedeEU7O51bwSITQ3WCgkjv7olg6tjWpTHymGJHnXI9I
         HVt6o0MG/z1Vf/ZCC4JPaA1fBTnRcsa3BmSxLaSL7tWac/orjfTR14F6fG82rFXmuZNG
         KhWWfJuarr5rCprlkju8TQeh4xVP76lFytOdoXyw/7jd0PGWEGMWEqWlU6Sa2hmNq4xk
         FnaVQ9YXysgw0JBdCZ5YrI1tOn7UxIjfwRLN/Wjnl+c9V8bL+lg7JFFJhUTpxtr5SsgL
         DLnQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8MbDXbEQW+RXU/pOsE5JbVVlBmSuTHWn0Aky4ErFSlPJeJYy1L7Eq0V9Fzu1JFxm5kagZATrTmj8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwerCh4/Y6V6+pQ+brALhBKkMgmm7ZX3p8wT0kV0AHwJpPWe8K2
	E6BFGg16OhhPamizBBiw5eSkK8RsN220JYXrR2Pkg0/qMEAY34gM9N+W8XhmajE=
X-Gm-Gg: ASbGncvWzVscDTCNRUg1WyAXuEgEe6VgGEbefDc1J0Ds433F7b8iScZkXQSBtKmH0fU
	xXiSDc3pgpzv8TREkYbB4F6Gl1opNqPBkZSFXDYZGPvog2ncX9l1Ws14MnYMf7E91eFLdsu3EYB
	Oyk8lW/sMlrDdT1B2ArAU6VXolb9g3RE1NeoeMceWcP78uTYciaj3yzlVl6WE8OdKPXAT/4Z35L
	apB4XcjToBRRh5pK3wb9tyjd1gsqltKu/+RWEGHXoBCQfr/h3GvrLIYct3ABmIdbGTb3o/7XE44
	dZUGmZgNaW7C5bV1885yp/FYq9ak8e/nMPlFTUnRObP4gL8G4BiV6JE=
X-Google-Smtp-Source: AGHT+IEx/P9VhGmpM9Qve+8fxlnJz5OWfBkRKBtIDANK/IPRQR8t6D11CbRKG5Xc1EPx3A5RF0LL1A==
X-Received: by 2002:a05:6a00:2b4f:b0:736:b923:5323 with SMTP id d2e1a72fcca58-736bc0fb12dmr15850983b3a.10.1741618399230;
        Mon, 10 Mar 2025 07:53:19 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-736d11d4600sm2890275b3a.116.2025.03.10.07.53.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 07:53:18 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 10 Mar 2025 07:52:41 -0700
Subject: [PATCH v11 19/27] riscv/hwprobe: zicfilp / zicfiss enumeration in
 hwprobe
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250310-v5_user_cfi_series-v11-19-86b36cbfb910@rivosinc.com>
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

Adding enumeration of zicfilp and zicfiss extensions in hwprobe syscall.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/uapi/asm/hwprobe.h | 2 ++
 arch/riscv/kernel/sys_hwprobe.c       | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index c3c1cc951cb9..c1b537b50158 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -73,6 +73,8 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZCMOP		(1ULL << 47)
 #define		RISCV_HWPROBE_EXT_ZAWRS		(1ULL << 48)
 #define		RISCV_HWPROBE_EXT_SUPM		(1ULL << 49)
+#define		RISCV_HWPROBE_EXT_ZICFILP	(1ULL << 50)
+#define		RISCV_HWPROBE_EXT_ZICFISS	(1ULL << 51)
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
 #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index bcd3b816306c..d802ff707913 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -108,6 +108,8 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 		EXT_KEY(ZCB);
 		EXT_KEY(ZCMOP);
 		EXT_KEY(ZICBOZ);
+		EXT_KEY(ZICFILP);
+		EXT_KEY(ZICFISS);
 		EXT_KEY(ZICOND);
 		EXT_KEY(ZIHINTNTL);
 		EXT_KEY(ZIHINTPAUSE);

-- 
2.34.1


