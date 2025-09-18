Return-Path: <linux-doc+bounces-54831-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB5AB179F9
	for <lists+linux-doc@lfdr.de>; Fri,  1 Aug 2025 01:28:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86DA43A5A3B
	for <lists+linux-doc@lfdr.de>; Thu, 31 Jul 2025 23:27:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCEC728C2C5;
	Thu, 31 Jul 2025 23:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="VBYuHuDI"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F2F28C032
	for <linux-doc@vger.kernel.org>; Thu, 31 Jul 2025 23:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754004034; cv=none; b=rQFDXX3DojrnVlIz1CRmFiD9PyCQOPK+R6rxwFxAwoQkKdWkJvBMPFdzBFYIOBhX2yp/3PFS8tCgAJy1TC64An5cREouSQRqBl9+Vhg2lwjIQNYShg226b8gB0oglx769t5kBQA0bE1/QMmiTvPBt4d5qOKbOdx+TR4+TvMEA60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754004034; c=relaxed/simple;
	bh=2rH9NpqQOqhL1EJmZlhPfrwuNQdySdzYHbE8RFyVKvs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i/WvVs9QJWi+RtR2WAxN7gDoFRuwh1EMnmMA4lKiRITqi994qGc4pKNUGrM/NZzJsPCbk7F0xUuYaC8/DBhhlikxNxQPV4QCVb3LvmqGUKZg8+Jl/SgfpmbzjgCnzyNLKJCTOrAvAJElTlgVuf/By0z/yyjdu91Xibg4I82ETvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=VBYuHuDI; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b390136ed88so830979a12.2
        for <linux-doc@vger.kernel.org>; Thu, 31 Jul 2025 16:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1754004032; x=1754608832; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zGYKU8oEStLMY+WKb4utGxIDZo++9HKS8iEvkqWqbZk=;
        b=VBYuHuDI4PEXbbsN7yMUaRhI/0Gb8jKqWlWp1FSE2U8HT15oPI9Oms28hy7Wt1a2PN
         4y0U8RXOs/p9W66qT76cu0XjphBv0/aw+Cc5zuzAqC2Gz5v5ObQiI6lMy38porgM3+o6
         TnAUT6SyS6ns9sD0CQuM2QxP4h+myhd/36r9ZxIZCHaRQgYktC19Wen6/6clvB4/CkBt
         twP7Cxh8N904twc+t88vVR8kaSflsw+JyTeJRRee2I1NPd+r0ukiO/ihR61wP2EpnnNF
         wVX7fbB1fvBb98WwpOLGoc+oj4lQDx6xfta9ZOaT7vDg6x54LZUMuunNm9uXAvuCxFeV
         HK0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754004032; x=1754608832;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zGYKU8oEStLMY+WKb4utGxIDZo++9HKS8iEvkqWqbZk=;
        b=Q/4TlQTFP1CR1uNjCXsQqnTpKEsv2t3nG0K4RONZJRUJ13gcnnlxKuo52z2RHq4K/D
         ocGGbo6XYlhakvjiFWAnuKdC6ZTCE+QNgDNfe5h/i3wnmsS2eXZ/ofNa+x6SCSxXWzbj
         //Lp/2DF6VHpQr6GWfq1J3WRlEHySxtuswCFnxtQK8BS7/HxuS4KwW88l4NwIf/qIFIh
         84sZUhsrhEW4wFM2uyic+0RQRj5ovc0BS1IputQqyqnZSt/M9yXy+ElUxL5B67oEpX56
         VqywwYPIB1mF+QYUS6XL2yWANp/kpRL4/VLElVFCWv5fIg384hTD6DHiYUNLVvPBzmGn
         dA3g==
X-Forwarded-Encrypted: i=1; AJvYcCXX+yDSCYNCxxgQMu4UYcP02/DdB0CbWtupfOuAWb1dncQM1ik5OP7Ls8jpRcA+Y/9wQLZsINtHwiU=@vger.kernel.org
X-Gm-Message-State: AOJu0YztuftyfaQIX8y7SzsAvnMcVRL1bQOd7fODNK6u0h5R6nwAwTM8
	KZROnH3LGVqBpmwnHfTkMTEwrrTgGGq8E/mD5Yb5viDF8YvUEB+LdwtNIjPY3/ERWjk=
X-Gm-Gg: ASbGncv6aSlfPeq7vgm+2VP1Cz+qdAjz7Sq4e7vfsSqrOV0qYWiV7G/Fkgbh/P7bOJn
	yDOOrY9acrrp38T1vZq2dZRM1Jr4qi4KhrOrI32tw9uVVvbfOubopsAdhPcXwihnfGvj4W07EXM
	xOVjSj0mOMdSA8o3uBCuN6yFYtAM1COV8ddfcXw2So41F6q+kIVE5ZxBysKbW7zLOxfV09aecVr
	gXYiSA11zJ+i5EaekGBrk0VcoOiVPQFDJ+ni4rdWwvOSVQiFIqPyDK0Ips8w9y/u1X45uXuqgrA
	HF4+vSMiAG0VgLAMT2v2PLhL8JHC19vbKRrs7tY/oxXi/d9lMa5yXRoovcdHy3TiCWEEXLPywfI
	Hmkg9eXSq5hSs9SztohNnHiXeuyyeT8n9
X-Google-Smtp-Source: AGHT+IEBs7LutVwN0PKX0aA2mBtgJYhvV4n145Nel5M/EJeFypNMhPK9pJ6ovYsY7ICv3krp+mHrVw==
X-Received: by 2002:a17:90b:5826:b0:313:2206:adf1 with SMTP id 98e67ed59e1d1-31f5dd6c4bdmr13449189a91.4.1754004032001;
        Thu, 31 Jul 2025 16:20:32 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31f63da8fcfsm5773085a91.7.2025.07.31.16.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 16:20:31 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 31 Jul 2025 16:19:34 -0700
Subject: [PATCH v19 24/27] riscv: create a config for shadow stack and
 landing pad instr support
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250731-v5_user_cfi_series-v19-24-09b468d7beab@rivosinc.com>
References: <20250731-v5_user_cfi_series-v19-0-09b468d7beab@rivosinc.com>
In-Reply-To: <20250731-v5_user_cfi_series-v19-0-09b468d7beab@rivosinc.com>
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
index 36061f4732b7..385c3d93e378 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -1161,6 +1161,27 @@ config RANDOMIZE_BASE
 
           If unsure, say N.
 
+config RISCV_USER_CFI
+	def_bool n
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


