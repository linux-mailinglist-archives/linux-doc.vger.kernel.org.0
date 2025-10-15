Return-Path: <linux-doc+bounces-63440-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9910EBE0237
	for <lists+linux-doc@lfdr.de>; Wed, 15 Oct 2025 20:22:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 100C6508831
	for <lists+linux-doc@lfdr.de>; Wed, 15 Oct 2025 18:21:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12EEF36999B;
	Wed, 15 Oct 2025 18:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b="JqIG/3XF"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1909F369966
	for <linux-doc@vger.kernel.org>; Wed, 15 Oct 2025 18:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760552083; cv=none; b=YHk01KFfCzx6FuLutoSBE3oSFTcA31f9vl+YVRJm9QTx2dzeiqgtitjkoVO8h+WbLp5jyUw3hay0bxn6A4AM7lpuiyLPXOznqu6fQUaE7lig7fRUOWM0GoByZAm4N6mFSTBQsuYjQWTirQcx0OYm0TGXxPX89Xkcc+YnuXCb/o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760552083; c=relaxed/simple;
	bh=zp1GtZ2xtYk4tzcgCMIiTQFkQH3SwEi1+kZi/xCoKAQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c8Sy7zERt5h0G0G/KABbJZvp6Yi8/eeZvWuQLquAu0pWXNc0ihD2XUgPg+QfFwJZNEEah9Mz9tXd15UH/afPvy+d0tLuvWX7V3iN2nR/2a3DxK9CgiTBj2lsJN3KgWrECCIq7KDgQYcAm3SPZr+CgzyXMvncCXbgqRol/UgaVDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b=JqIG/3XF; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b62e7221351so5671981a12.1
        for <linux-doc@vger.kernel.org>; Wed, 15 Oct 2025 11:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1760552080; x=1761156880; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dbof0LYINd4D+dAMCbCh8LGflH6StFg2c2dYAuc2+YY=;
        b=JqIG/3XFXRZ2mzFU5uXGN758RTkfJ0QiC0qCd1562YsaFP3evnevukX69sq6ZVOktt
         3wx4c1h7Pnm8fMxWEojQtSh3N6jmNw/+BQNtMKoZj6/vAfW/41n4lxg1gh/ew1WMn1LZ
         zvaChlDH7M6Rck6O7EWLVzzqaSaEUGoTFgWF6T9P7JhX1EXqpo9zqI8NqaPLJ5nAHy/O
         z+5dr3dS2JJX6uKqGm+d/L6H60KFS8wCGfNuLMyRIgYUC5Ad/GTJD7lZmwxgCPNJl0Wk
         3UTvu7/yazxTPHX4ms3lWg8mCz7I0jSqsIMdka1CvrsEPFQfDOg89Odsf7MTCLvZZJyQ
         viQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760552080; x=1761156880;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dbof0LYINd4D+dAMCbCh8LGflH6StFg2c2dYAuc2+YY=;
        b=h9DRd5TqS07BKiphNthdGI7oJL3gSK3uCw5eJVpFlPDvkJ4W14LD1ExIytFMZQ7Edh
         Kb8YvWEesQ1Qnf3OW/ZTomXVKV/bzXycL2EJQ9qiYQEuAQZbr2C/BMnrV71mQ1TUdrcl
         643O6okIjI0e+F2gz5rtp71ju2SgaWgsegFUfN4DiH8v7HOmmNYKQnYHYmoIRy4jukGA
         Da+17WsMnBWjH/sELbfMmUSq0MZissf0yRVm04grcytvp7bPDVZgUDAvJf5EjbxcrK0c
         P4nkERnlEeAdw6mwIYt18izdHwKFoQEjOEovMYKcXKF3IUIRHTT8z5ZDBfIjYgbdHn5h
         Emcw==
X-Forwarded-Encrypted: i=1; AJvYcCVevC+K0Qckrjm/VhQsi3ZLfoRsCAcpmajix7Pk7GG/+M4ztjMXYx1AcT/0VMroJA4QuhnV3BM7K4A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoTJao3m1sHWuFhq8Dwup/ohrc8/rEPfZw095RWF+OixVc6drk
	ELB8N/6cLG8Z3RqfgKvlGjOwV4KkemN6JABryYBWom/aTfVaYKPWlKRqbz9Usc0wB68=
X-Gm-Gg: ASbGncuFrevxCmedoXRPr2yu6acA9qbyvdsktWW9q46gaSuG2zuMhW0MX/GMy9NOOnY
	yVOGfoJN4Jmj3HA3UZHlpPCVu474Ffln5Jxw2GIcJ/N8uKLYQtSvbZ3am3+u8q82g6GNqkUn/5W
	TxfaPV+LtcJ4OsV4hiiXhJpYrq+jXfOIs+kY88O5yNhcGtsoFQS4pwjUt/YkCq6H70sB3X/IzFX
	Hu25FGCwBPMjbT+9HLaxmwcCkgfKmic6OsAm/YYk/QYyhb//tTod+Ji/ei9NQVwIn6kmwloydaY
	/fJSMSwgWAx2aD1gTA3CvW7EKODoHalnjeU7y2/x0HSgW+NQYKJrgTyivUudu7LIi3tOEMceEzc
	yml4anqjoOlRh6p+y+ZLbwPlc2be8OWup7ZC3GFezgCNvS1ASvmFePs4f78p7/nHsI+8G8ZP8
X-Google-Smtp-Source: AGHT+IGAsBeXLYnUBeSk4VeBAeMiRCSfs4dgrhVgQ7j/hrfP/0NXVnhFuxrL4cfJn2DM39e7oP4gDw==
X-Received: by 2002:a17:903:1aef:b0:250:1c22:e7b with SMTP id d9443c01a7336-290272e3a78mr384355745ad.43.1760552080319;
        Wed, 15 Oct 2025 11:14:40 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2909930a72esm3126625ad.21.2025.10.15.11.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 11:14:39 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Wed, 15 Oct 2025 11:13:57 -0700
Subject: [PATCH v21 25/28] riscv: create a config for shadow stack and
 landing pad instr support
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251015-v5_user_cfi_series-v21-25-6a07856e90e7@rivosinc.com>
References: <20251015-v5_user_cfi_series-v21-0-6a07856e90e7@rivosinc.com>
In-Reply-To: <20251015-v5_user_cfi_series-v21-0-6a07856e90e7@rivosinc.com>
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
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Benno Lossin <lossin@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com, rust-for-linux@vger.kernel.org, 
 Zong Li <zong.li@sifive.com>, Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0

This patch creates a config for shadow stack support and landing pad instr
support. Shadow stack support and landing instr support can be enabled by
selecting `CONFIG_RISCV_USER_CFI`. Selecting `CONFIG_RISCV_USER_CFI` wires
up path to enumerate CPU support and if cpu support exists, kernel will
support cpu assisted user mode cfi.

If CONFIG_RISCV_USER_CFI is selected, select `ARCH_USES_HIGH_VMA_FLAGS`,
`ARCH_HAS_USER_SHADOW_STACK` and DYNAMIC_SIGFRAME for riscv.

Reviewed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/Kconfig                  | 21 +++++++++++++++++++++
 arch/riscv/configs/hardening.config |  4 ++++
 2 files changed, 25 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 0c6038dc5dfd..aed033e2b526 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -1146,6 +1146,27 @@ config RANDOMIZE_BASE
 
           If unsure, say N.
 
+config RISCV_USER_CFI
+	def_bool y
+	bool "riscv userspace control flow integrity"
+	depends on 64BIT && $(cc-option,-mabi=lp64 -march=rv64ima_zicfiss)
+	depends on RISCV_ALTERNATIVE
+	select RISCV_SBI
+	select ARCH_HAS_USER_SHADOW_STACK
+	select ARCH_USES_HIGH_VMA_FLAGS
+	select DYNAMIC_SIGFRAME
+	help
+	  Provides CPU assisted control flow integrity to userspace tasks.
+	  Control flow integrity is provided by implementing shadow stack for
+	  backward edge and indirect branch tracking for forward edge in program.
+	  Shadow stack protection is a hardware feature that detects function
+	  return address corruption. This helps mitigate ROP attacks.
+	  Indirect branch tracking enforces that all indirect branches must land
+	  on a landing pad instruction else CPU will fault. This mitigates against
+	  JOP / COP attacks. Applications must be enabled to use it, and old user-
+	  space does not get protection "for free".
+	  default n.
+
 endmenu # "Kernel features"
 
 menu "Boot options"
diff --git a/arch/riscv/configs/hardening.config b/arch/riscv/configs/hardening.config
new file mode 100644
index 000000000000..089f4cee82f4
--- /dev/null
+++ b/arch/riscv/configs/hardening.config
@@ -0,0 +1,4 @@
+# RISCV specific kernel hardening options
+
+# Enable control flow integrity support for usermode.
+CONFIG_RISCV_USER_CFI=y

-- 
2.43.0


