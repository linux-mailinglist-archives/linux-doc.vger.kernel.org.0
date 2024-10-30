Return-Path: <linux-doc+bounces-29136-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B5E9B57E3
	for <lists+linux-doc@lfdr.de>; Wed, 30 Oct 2024 00:53:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E885F1C20975
	for <lists+linux-doc@lfdr.de>; Tue, 29 Oct 2024 23:53:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F2A32161FF;
	Tue, 29 Oct 2024 23:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="i/Jsk4EX"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF99215F78
	for <linux-doc@vger.kernel.org>; Tue, 29 Oct 2024 23:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730245533; cv=none; b=pjThiAmFnAyYcg3R3SOqOL2uYTBu8WMImTHJ8CNhBFEdi96XewLatP7fGwsnDWJgZ45R1lNw7NgICp/dYiB8pSh7T2uJF5POUOnCaK+wGtnY5T6z1hfvxqhPspr6ipoNsQlSWnQGQwuIFteWa1nJh5PKQfCMBkLOQURQTtvRdOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730245533; c=relaxed/simple;
	bh=QFCIa0+ds5blWBrVVV38UJRLoxk2ifalHQaaXLuF2k8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U1jHiGnvWHIcMqMkx9qA7dKidN6AdRES3MYzn+Z36g5ufrkATtwwTsRuKeW3VdyolGN1bU6+4+lcI4g3Bjj02k1eQMyBb4pPrO0kN7HCw2LxHp/L6y7spBVSqQTEPbtqTKuQFYDMjtKZavXcEAqTiijK5yC4FPIRcL/6S0G3tFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=i/Jsk4EX; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-71e5130832aso4291464b3a.0
        for <linux-doc@vger.kernel.org>; Tue, 29 Oct 2024 16:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1730245530; x=1730850330; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nRy4y69JgL5sB6geChrc5T0OHtDNFkvTlVG645IsDrc=;
        b=i/Jsk4EXs6ShwyZIcT5BV6f6uaCeb5OxGMMYxaGpIqYxKej6D2VJPvdDWnWTFxyJMr
         2RQy8C4WuMfPji3MA8h9xGOIGxnQjKmslc7w7m2ky12QoXnNKH01qxgbcch7ZEOGXYoK
         2mKV2HyUhgwX0o0gYxunPrm4PRdLAJygJOg6ug024Jq1BimpgF9yhuUGuq4T1VhairQE
         nZBLRjQluiJ6e+8rJTWH0W6f13FVlH3U3C+hKXvTX7LkBhuCnpyjoV8YrW8vH7vejTWI
         LKGA66hHPJSgrX0+1CRwV9ou6K0YamN7DUhW+iZZk6AIKa2O8Bi7VzhO5XppW+5/04Bg
         oXXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730245530; x=1730850330;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nRy4y69JgL5sB6geChrc5T0OHtDNFkvTlVG645IsDrc=;
        b=I7RIPysAhroI2MNy67uZC9oTyihWYDeJeFKVdJ6O86sqwrB/nrzF0wMIf6jTS6PwfK
         CEmJa7BZHzPViOZ36KG+xbowmT/pJFN8CWl4Xd+ECldEM72vbXkaiEYDnTCxsBgfEtyv
         wZSCpkT70a+4WnKIBnKyurRET6tKiGICaNJGQclJ8/nAo2g/zC0zI+gckvGSSdxu5ogn
         Xleci8Cqu2RPMWn5U/fYzsQptQ+nWwy//waAikggEa/653TaYUUNjzAW2Y22+y13iVK5
         wSF6Z61h73ljqA5Tg6PlkWFJLDj8F1qLSgD1qRtFB7j81w8chi5A+PhtT8Wp8DkFL5mj
         zbMA==
X-Forwarded-Encrypted: i=1; AJvYcCVP6XMEvvL9IToj+UVKpRL1fAumSOkr/Tphj2kQStOEyMCyIdxUgWcxXmBqPPtqftfOgEUPw4alup4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcNjfIB2jItM5pYR2ernWv2/I5Ovn27g8llED8NejTyKi17t0R
	EizFw2Gb6DZ0ZpNfTHKnnD7LioX4mBG27PuAGG4BK6y1zu82CZ25pfD89kBFQvY=
X-Google-Smtp-Source: AGHT+IEJnoB5pjGPkuu5fVIOqNL3hz9Y12W/UY6bmoQpgc9NgKdtyZXYcI4NaGAWLxyKkPpDfpG9Xg==
X-Received: by 2002:a05:6a20:e198:b0:1d6:fd8c:fa16 with SMTP id adf61e73a8af0-1d9a850541dmr17895816637.46.1730245530007;
        Tue, 29 Oct 2024 16:45:30 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057921863sm8157643b3a.33.2024.10.29.16.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 16:45:29 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 29 Oct 2024 16:44:28 -0700
Subject: [PATCH v7 28/32] riscv: kernel command line option to opt out of
 user cfi
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241029-v5_user_cfi_series-v7-28-2727ce9936cb@rivosinc.com>
References: <20241029-v5_user_cfi_series-v7-0-2727ce9936cb@rivosinc.com>
In-Reply-To: <20241029-v5_user_cfi_series-v7-0-2727ce9936cb@rivosinc.com>
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

This commit adds a kernel command line option using which user cfi can be
disabled.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/kernel/usercfi.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/riscv/kernel/usercfi.c b/arch/riscv/kernel/usercfi.c
index 04b0305943b1..223dfa482deb 100644
--- a/arch/riscv/kernel/usercfi.c
+++ b/arch/riscv/kernel/usercfi.c
@@ -17,6 +17,8 @@
 #include <asm/csr.h>
 #include <asm/usercfi.h>
 
+bool disable_riscv_usercfi;
+
 #define SHSTK_ENTRY_SIZE sizeof(void *)
 
 bool is_shstk_enabled(struct task_struct *task)
@@ -393,6 +395,9 @@ int arch_set_shadow_stack_status(struct task_struct *t, unsigned long status)
 	unsigned long size = 0, addr = 0;
 	bool enable_shstk = false;
 
+	if (disable_riscv_usercfi)
+		return 0;
+
 	if (!cpu_supports_shadow_stack())
 		return -EINVAL;
 
@@ -472,6 +477,9 @@ int arch_set_indir_br_lp_status(struct task_struct *t, unsigned long status)
 {
 	bool enable_indir_lp = false;
 
+	if (disable_riscv_usercfi)
+		return 0;
+
 	if (!cpu_supports_indirect_br_lp_instr())
 		return -EINVAL;
 
@@ -504,3 +512,15 @@ int arch_lock_indir_br_lp_status(struct task_struct *task,
 
 	return 0;
 }
+
+static int __init setup_global_riscv_enable(char *str)
+{
+	if (strcmp(str, "true") == 0)
+		disable_riscv_usercfi = true;
+
+	pr_info("Setting riscv usercfi to be %s\n", (disable_riscv_usercfi ? "disabled" : "enabled"));
+
+	return 1;
+}
+
+__setup("disable_riscv_usercfi=", setup_global_riscv_enable);

-- 
2.34.1


